Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D494EB64D7
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 01:08:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qC8o7-0003uD-Ka; Wed, 21 Jun 2023 21:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC8o6-0003u1-NQ; Wed, 21 Jun 2023 21:08:18 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC8o5-0004qR-30; Wed, 21 Jun 2023 21:08:18 -0400
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-7918b56b1e1so1628818241.2; 
 Wed, 21 Jun 2023 18:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687396092; x=1689988092;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v8exn++aQfc8xHfpkEXfS5SqskqQaiGKR/fd1K0pL7Y=;
 b=cWdWbtFqBBxw/R7ONIiu/o9nZ31zXOAaDPN/qXTJpi1rcBXzqpryXJf4xfiFYt8vcI
 +6U06Z4LbW80fzeIPRf6sK4Z4ZuA2HAKWBwVhvVx55dfsfGR7PD/VvRTktAJ6neImaoa
 jM6sNlpsbWmYeFZS0aOW7hbmvIVttfcFLRhWCYz/pKsF94b7P460a/sq/abE6qxod18d
 xByRvxAFYPz2nVmgiBjW1DoMzp2uOUfB0xoGUN7YjRDV65lUHUfxTu5aHxw7msTcuz9y
 NoiqNdddV4x7E6Pp11/tkUskxSAvP0RLDMSrc5rPvWZvFg7UySy6YH/7qWN2p4FHBdzz
 QLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687396092; x=1689988092;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v8exn++aQfc8xHfpkEXfS5SqskqQaiGKR/fd1K0pL7Y=;
 b=SBDnZXUFmf1WDg5QLhZhp1Q9yFVJy8Pz3ixOXaSlSJl1kUdOC02H8qk1DWYZxJ5kq+
 ugRzl3s2v+dQiYORQYl1vhxKUk462jm9pPLE8nl57suUJXCGWr9VnYEbXlwhRtcoc5yq
 Db2QBrOnxBiXzT07ZjNHzlOmgSCNJz/y01CZDhrgI7gSrxYZX2cxzYT1fF/ENh8M4INP
 7N7WkgXjBUqyeG3B37pWVeOFacAisBYkG+vCmBtkKQHtCMpxuv1pFohWfNWa4Q48XIpA
 nXG/tgnGmenOfX9Wtt2Z07qHYqQL8ZqZUZc7rowdQwwiBiEPXnQopzaZZNT6170Zi1FM
 XdXQ==
X-Gm-Message-State: AC+VfDwj353JkRE5vluUkiRiPrv1WyL1GERpG2guiidGzP5nh5SHMzAb
 +XrVgTK1j1eiIPfas2KjVpVGf5lfDiitxNcU8no=
X-Google-Smtp-Source: ACHHUZ7Rl4oSB7iJOl6Vkidb2ZrWcq9kjOnEEHjIp086D7J1iIqc6IzIg47J03AMvWgnesITiq4wq31Blda1U1Q3Jdk=
X-Received: by 2002:a67:ec19:0:b0:440:ac4e:50e0 with SMTP id
 d25-20020a67ec19000000b00440ac4e50e0mr6483746vso.12.1687396092208; Wed, 21
 Jun 2023 18:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
 <20230613205857.495165-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230613205857.495165-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 11:07:46 +1000
Message-ID: <CAKmqyKMHxnuKVB_o=5k7HDj4gQBZh6Kw62dnBuQh766pvGVCgQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] target/riscv/cpu.c: restrict 'mvendorid' value
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Jun 14, 2023 at 7:00=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> We're going to change the handling of mvendorid/marchid/mimpid by the
> KVM driver. Since these are always present in all CPUs let's put the
> same validation for everyone.
>
> It doesn't make sense to allow 'mvendorid' to be different than it
> is already set in named (vendor) CPUs. Generic (dynamic) CPUs can have
> any 'mvendorid' they want.
>
> Change 'mvendorid' to be a class property created via
> 'object_class_property_add', instead of using the DEFINE_PROP_UINT32()
> macro. This allow us to define a custom setter for it that will verify,
> for named CPUs, if mvendorid is different than it is already set by the
> CPU. This is the error thrown for the 'veyron-v1' CPU if 'mvendorid' is
> set to an invalid value:
>
> $ qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,mvendorid=3D2
> qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.mvendorid=3D2=
:
>     Unable to change veyron-v1-riscv-cpu mvendorid (0x61f)
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 38 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e904018644..6a9a6d34eb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1734,7 +1734,6 @@ static void riscv_cpu_add_user_properties(Object *o=
bj)
>  static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>
> -    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
>      DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCH=
ID),
>      DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID)=
,
>
> @@ -1821,6 +1820,40 @@ static const struct TCGCPUOps riscv_tcg_ops =3D {
>  #endif /* !CONFIG_USER_ONLY */
>  };
>
> +static bool riscv_cpu_is_dynamic(Object *cpu_obj)
> +{
> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D NUL=
L;
> +}
> +
> +static void cpu_set_mvendorid(Object *obj, Visitor *v, const char *name,
> +                              void *opaque, Error **errp)
> +{
> +    bool dynamic_cpu =3D riscv_cpu_is_dynamic(obj);
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint32_t prev_val =3D cpu->cfg.mvendorid;
> +    uint32_t value;
> +
> +    if (!visit_type_uint32(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (!dynamic_cpu && prev_val !=3D value) {
> +        error_setg(errp, "Unable to change %s mvendorid (0x%x)",
> +                   object_get_typename(obj), prev_val);
> +        return;
> +    }
> +
> +    cpu->cfg.mvendorid =3D value;
> +}
> +
> +static void cpu_get_mvendorid(Object *obj, Visitor *v, const char *name,
> +                              void *opaque, Error **errp)
> +{
> +    bool value =3D RISCV_CPU(obj)->cfg.mvendorid;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  {
>      RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);
> @@ -1852,6 +1885,9 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id *data)
>      cc->gdb_get_dynamic_xml =3D riscv_gdb_get_dynamic_xml;
>      cc->tcg_ops =3D &riscv_tcg_ops;
>
> +    object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendori=
d,
> +                              cpu_set_mvendorid, NULL, NULL);
> +
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> --
> 2.40.1
>
>

