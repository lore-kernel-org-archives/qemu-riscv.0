Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F317AC4707B
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 01:24:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO6Hn-0003w7-Ck; Thu, 11 Jan 2024 20:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO6Hk-0003vL-NH; Thu, 11 Jan 2024 20:24:36 -0500
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO6Hj-0000O7-2H; Thu, 11 Jan 2024 20:24:36 -0500
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7ce603b9051so1524694241.2; 
 Thu, 11 Jan 2024 17:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705022673; x=1705627473; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7bc8xw3NFmRkoKJ/FSNm5LlJpyNgoeF5F00/LBRIzxo=;
 b=a8omvKlZG7Q75Ol1iiA5K+7cRgV1QnqRcNmDJlbESm4WUi4iUSjdpBVmBAtRKMRaaP
 TDyQOKBLj5h4Imrg5XX08qu3DRAYP+qJI5URuUgjr8CWZY6/ucf1Td4RE4NLTjnK4yEI
 h1soT81nTlPuXirZ1D7m7lbpv+Misllnuq5IikNNJAFGD+Y/KuTXU+oAy2XPrL1kmpGB
 kCeC5OHJU3RWaTWmx0f77b4S/xy94H1zbS0HZ02OHk028/Y6gMVPswVgF+LML9lLOdja
 zVhp1JIm5q8cG95Q0NC+irVuQz0XAHc0wNbrtqxob5nVARLL/BNg7sPNoAvjkHtRLSgK
 E7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705022673; x=1705627473;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7bc8xw3NFmRkoKJ/FSNm5LlJpyNgoeF5F00/LBRIzxo=;
 b=AJZ54Kt6Wnz180+fCpT/V0ZSb2fu0ZbrjPfocDKBRepow7t8JlapbyXPykEewqo6mU
 cFGqhoHisNcYy782r7XNrg8JzX9Rk59cWbN6ExzXW8nZXy0qM5qeKC3wehmaCxO3Ex+e
 Mz/E1A8JWH0lhRxRbc43BCsJ4SmrGi/wPqk1Cp2MDgYmcnieBudG9FU7lHxufBaX1Rx3
 E83RAYKAziVo51AMdIKLT3ikT9D3Fi0peQB9JjyQeQl5M81D8KEvytm/kxacUYiOCdJU
 no4MwNBOzRWdV2E8KUJ3NhkKQPFwJqiTY4Ku6MmJJrMSBfOGziIaQ9uZgtR5BvzG2zIh
 VJJw==
X-Gm-Message-State: AOJu0YxmjCQKpHWiDOWR0gcY8KCB2WEdvveez/QBaGvKRE6X2AT9n6gH
 rMN8/s8lKNxxBzipMhxzGi6gwKokmxq5C4gowqc=
X-Google-Smtp-Source: AGHT+IGpxkhFQZMm3gXz9a0/m3BvgD89dlHYqKaawTJ/0Q0dh2uELSMqAA/QGUjQ1lrWcsMo2oD53oojudixAlGq1LI=
X-Received: by 2002:a05:6122:1988:b0:4b6:e467:ec9a with SMTP id
 bv8-20020a056122198800b004b6e467ec9amr716685vkb.16.1705022673451; Thu, 11 Jan
 2024 17:24:33 -0800 (PST)
MIME-Version: 1.0
References: <20240105230546.265053-1-dbarboza@ventanamicro.com>
 <20240105230546.265053-16-dbarboza@ventanamicro.com>
In-Reply-To: <20240105230546.265053-16-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 11:24:07 +1000
Message-ID: <CAKmqyKNzLNS7rvw3_j37TCUFi6xXNESBC60DKg7x6OEcsSuBEQ@mail.gmail.com>
Subject: Re: [PATCH v4 15/17] target/riscv/cpu.c: move 'mvendorid' to
 riscv_cpu_properties[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
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

On Sat, Jan 6, 2024 at 9:09=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Keep all class properties in riscv_cpu_properties[].
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 69 +++++++++++++++++++++++++---------------------
>  1 file changed, 37 insertions(+), 32 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9d4243891c..c725a4839d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1974,6 +1974,41 @@ static const PropertyInfo prop_cboz_blksize =3D {
>      .set =3D prop_cboz_blksize_set,
>  };
>
> +static void prop_mvendorid_set(Object *obj, Visitor *v, const char *name=
,
> +                               void *opaque, Error **errp)
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
> +static void prop_mvendorid_get(Object *obj, Visitor *v, const char *name=
,
> +                               void *opaque, Error **errp)
> +{
> +    uint32_t value =3D RISCV_CPU(obj)->cfg.mvendorid;
> +
> +    visit_type_uint32(v, name, &value, errp);
> +}
> +
> +static const PropertyInfo prop_mvendorid =3D {
> +    .name =3D "mvendorid",
> +    .get =3D prop_mvendorid_get,
> +    .set =3D prop_mvendorid_set,
> +};
> +
>  /*
>   * RVA22U64 defines some 'named features' or 'synthetic extensions'
>   * that are cache related: Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa
> @@ -2060,6 +2095,8 @@ static Property riscv_cpu_properties[] =3D {
>      {.name =3D "cbop_blocksize", .info =3D &prop_cbop_blksize},
>      {.name =3D "cboz_blocksize", .info =3D &prop_cboz_blksize},
>
> +     {.name =3D "mvendorid", .info =3D &prop_mvendorid},
> +
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
>  #endif
> @@ -2140,35 +2177,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops =
=3D {
>  };
>  #endif
>
> -static void cpu_set_mvendorid(Object *obj, Visitor *v, const char *name,
> -                              void *opaque, Error **errp)
> -{
> -    bool dynamic_cpu =3D riscv_cpu_is_dynamic(obj);
> -    RISCVCPU *cpu =3D RISCV_CPU(obj);
> -    uint32_t prev_val =3D cpu->cfg.mvendorid;
> -    uint32_t value;
> -
> -    if (!visit_type_uint32(v, name, &value, errp)) {
> -        return;
> -    }
> -
> -    if (!dynamic_cpu && prev_val !=3D value) {
> -        error_setg(errp, "Unable to change %s mvendorid (0x%x)",
> -                   object_get_typename(obj), prev_val);
> -        return;
> -    }
> -
> -    cpu->cfg.mvendorid =3D value;
> -}
> -
> -static void cpu_get_mvendorid(Object *obj, Visitor *v, const char *name,
> -                              void *opaque, Error **errp)
> -{
> -    uint32_t value =3D RISCV_CPU(obj)->cfg.mvendorid;
> -
> -    visit_type_uint32(v, name, &value, errp);
> -}
> -
>  static void cpu_set_mimpid(Object *obj, Visitor *v, const char *name,
>                             void *opaque, Error **errp)
>  {
> @@ -2278,9 +2286,6 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id *data)
>      cc->gdb_arch_name =3D riscv_gdb_arch_name;
>      cc->gdb_get_dynamic_xml =3D riscv_gdb_get_dynamic_xml;
>
> -    object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendori=
d,
> -                              cpu_set_mvendorid, NULL, NULL);
> -
>      object_class_property_add(c, "mimpid", "uint64", cpu_get_mimpid,
>                                cpu_set_mimpid, NULL, NULL);
>
> --
> 2.43.0
>
>

