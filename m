Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50466EB64D7
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 01:11:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qC8rF-0005wj-Jp; Wed, 21 Jun 2023 21:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC8rA-0005sy-Ri; Wed, 21 Jun 2023 21:11:29 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC8r4-0007da-Bp; Wed, 21 Jun 2023 21:11:27 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-791b8500a1dso743163241.1; 
 Wed, 21 Jun 2023 18:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687396277; x=1689988277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0OM0GtlxRQtp00r2UnSWeku/PJ0oGYVoxf1XofAJSso=;
 b=QhvK+OEoaukAbrf+Afg+S+BkDjY91+ubK0g7DvJEfw0+dVGp7LrEuinc14P8x67n+/
 2DFS2+NLHQM/NBHkNA3uSFkrTG43M0W/GxMDNlMWgnzIcj2sCivYrUOaP0C1lssnXBm/
 7/yViC89sYkZHRdFyH8vLk2S/OwWj/UAXway0duapqXSlLxGz5ngGpf+2SaGkmW5yBvI
 hl9gq7+gowZdABCjN/qUq7yazgVvLx0c55dF4aRb1BCETLtgv7t8hVhRDS9D8Y9ZXwMf
 z42dm2o+3lkvM37jw9lgLeptxo+d5lVVPo7Mj4Nh+SwirO/C5y7q0Q9gI5uN3GqkYXcq
 mD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687396277; x=1689988277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0OM0GtlxRQtp00r2UnSWeku/PJ0oGYVoxf1XofAJSso=;
 b=LiMChyUlaTwZgvWz7S8eSN2hduVigu2gsYPgbf9cnONnS3BflFyW3uZYZeRSlIn84g
 WR/9wQ/Fj/KfXnrGH66bRmsfVwn1U5yitSiH3oM+ebIvhIHWxHQhJbjac89+Qm40mi7r
 Ebraem39vg+u0z7+KeU3EUhgK9Qz1FQyu2UQpxmWnCkx0SScAUSdsfZwun/oqY12VF5g
 cCenTzHkLOpuLTCJW1S/B9WZoyUlkM6aBaqrLgsoQ98z8phgR/RpUciRg+8g+at5rUNl
 +iKB7LC28UVJNbYSvxgJMvDj5JnntW4KwpV2ViA9acpILghDXxZhqAnM0gsS4bmwLWM0
 siFQ==
X-Gm-Message-State: AC+VfDwTUMcLcxn4VabCSH8bUXZm1mRvVpgnAVhIx97vwuB/oft7XRqK
 DhG3BdScw2NUMUh/Owt7LA6F7FGCE6XlFYJS2ms=
X-Google-Smtp-Source: ACHHUZ6ylS59x0g99N/jCchROYGd4L9fOf45peyZrIGBTzYZL7nEElEuFx8RTQRKZ6KLaJMrhdqWYiA8tPdXwIngZTE=
X-Received: by 2002:a05:6102:4b1:b0:43f:60da:cee with SMTP id
 r17-20020a05610204b100b0043f60da0ceemr5315897vsa.11.1687396277683; Wed, 21
 Jun 2023 18:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
 <20230613205857.495165-6-dbarboza@ventanamicro.com>
In-Reply-To: <20230613205857.495165-6-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 11:10:51 +1000
Message-ID: <CAKmqyKN07sWPT6U4KhwJwGKDA2euBMMdqr8mx9HHqLFiTzGEjQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] target/riscv/cpu.c: restrict 'marchid' value
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
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

On Wed, Jun 14, 2023 at 7:03=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> 'marchid' shouldn't be set to a different value as previously set for
> named CPUs.
>
> For all other CPUs it shouldn't be freely set either - the spec requires
> that 'marchid' can't have the MSB (most significant bit) set and every
> other bit set to zero, i.e. 0x80000000 is an invalid 'marchid' value for
> 32 bit CPUs.
>
> As with 'mimpid', setting a default value based on the current QEMU
> version is not a good idea because it implies that the CPU
> implementation changes from one QEMU version to the other. Named CPUs
> should set 'marchid' to a meaningful value instead, and generic CPUs can
> set to any valid value.
>
> For the 'veyron-v1' CPU this is the error thrown if 'marchid' is set to
> a different val:
>
> $ ./build/qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,marchid=
=3D0x80000000
> qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.marchid=3D0x8=
0000000:
>     Unable to change veyron-v1-riscv-cpu marchid (0x8000000000010000)
>
> And, for generics CPUs, this is the error when trying to set to an
> invalid val:
>
> $ ./build/qemu-system-riscv64 -M virt -nographic -cpu rv64,marchid=3D0x80=
00000000000000
> qemu-system-riscv64: can't apply global rv64-riscv-cpu.marchid=3D0x800000=
0000000000:
>     Unable to set marchid with MSB (64) bit set and the remaining bits ze=
ro
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 53 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 39c550682a..2eb793188c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -38,11 +38,6 @@
>  #include "tcg/tcg.h"
>
>  /* RISC-V CPU definitions */
> -
> -#define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
> -                             (QEMU_VERSION_MINOR << 8)  | \
> -                             (QEMU_VERSION_MICRO))
> -
>  static const char riscv_single_letter_exts[] =3D "IEMAFDQCPVH";
>
>  struct isa_ext_data {
> @@ -1733,8 +1728,6 @@ static void riscv_cpu_add_user_properties(Object *o=
bj)
>  static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>
> -    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCH=
ID),
> -
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
>  #endif
> @@ -1881,6 +1874,56 @@ static void cpu_get_mimpid(Object *obj, Visitor *v=
, const char *name,
>      visit_type_bool(v, name, &value, errp);
>  }
>
> +static void cpu_set_marchid(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    bool dynamic_cpu =3D riscv_cpu_is_dynamic(obj);
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint64_t prev_val =3D cpu->cfg.marchid;
> +    uint64_t value, invalid_val;
> +    uint32_t mxlen =3D 0;
> +
> +    if (!visit_type_uint64(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (!dynamic_cpu && prev_val !=3D value) {
> +        error_setg(errp, "Unable to change %s marchid (0x%lx)",
> +                   object_get_typename(obj), prev_val);
> +        return;
> +    }
> +
> +    switch (riscv_cpu_mxl(&cpu->env)) {
> +    case MXL_RV32:
> +        mxlen =3D 32;
> +        break;
> +    case MXL_RV64:
> +    case MXL_RV128:
> +        mxlen =3D 64;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    invalid_val =3D 1LL << (mxlen - 1);
> +
> +    if (value =3D=3D invalid_val) {
> +        error_setg(errp, "Unable to set marchid with MSB (%u) bit set "
> +                         "and the remaining bits zero", mxlen);
> +        return;
> +    }
> +
> +    cpu->cfg.marchid =3D value;
> +}
> +
> +static void cpu_get_marchid(Object *obj, Visitor *v, const char *name,
> +                           void *opaque, Error **errp)
> +{
> +    bool value =3D RISCV_CPU(obj)->cfg.marchid;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  {
>      RISCVCPUClass *mcc =3D RISCV_CPU_CLASS(c);
> @@ -1918,6 +1961,9 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id *data)
>      object_class_property_add(c, "mimpid", "uint64", cpu_get_mimpid,
>                                cpu_set_mimpid, NULL, NULL);
>
> +    object_class_property_add(c, "marchid", "uint64", cpu_get_marchid,
> +                              cpu_set_marchid, NULL, NULL);
> +
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> --
> 2.40.1
>
>

