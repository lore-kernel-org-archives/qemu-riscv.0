Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0241C4707B
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 04:24:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLbkm-0003ct-N5; Thu, 04 Jan 2024 23:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLbkk-0003Us-MA; Thu, 04 Jan 2024 23:24:14 -0500
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLbkh-00062B-Or; Thu, 04 Jan 2024 23:24:14 -0500
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7cd861086a7so400760241.1; 
 Thu, 04 Jan 2024 20:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704428649; x=1705033449; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=suxo5LzBCVg3QZJV5WODgwBM3Wxmg+TPjCDU6UGjI8E=;
 b=HoQfsPJ657XSQu7eUD6373CvUCSWpo/r02AkDw2CJIKVsad6ydAvD6oZ3gYAI6NExw
 e/K3L0h47910Cp+xG+A3P+8WqGk3LJFgPWG/AAmgvTJ+Mj4HMWsYSQjTnDTukHEXnBHl
 ac8N4vt0Kac/zv9U0tYtSaWUqu6Do3Jb2npB0+gPnzbMX9t0iewCa2lFvjz0TSLI+kHF
 Bm4PpA7IwmXgnV1795LmYjwLqJM32TOm+Rv+g88KSfY8+Nlj3JxChby/EWMHCUbDqCs2
 tP02ACkEKM8lhmGjI/pY2la+vLQ1tZ/eWoB7w3slMX3mrNNX1yPcgzAYPp8lob5N1Bba
 FoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704428649; x=1705033449;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=suxo5LzBCVg3QZJV5WODgwBM3Wxmg+TPjCDU6UGjI8E=;
 b=Z5JqEw5hCNHG96xO8BbqgDruuQnBf7XQwYpzgPeW0kvGspqQ3LOh4NcKSUgsCwx/+y
 igI18gXXtq8NR+zjGOmULZVb2skk509Y4ml0rn9mVr3ivBaV2vblkYdrkz57ZRdVNxHE
 pCQXNh99cVevtSQMwGs5EEf6yTHxY7jGXkn1QQ/Ed7EVWTfzJ5HWUqL8PVtMUCV3UJlF
 79d+eq7jCzeraErp8csUze1mQowee5PQd9h6KKgkazBZSKTF8SG8CwMCEanHfzh8PghT
 mof9Aj0Fi0faUY1unRulARdxetcU8prR20tw3JHYHYTOncQRRpDzT7PKAEELgWeUXFiZ
 rTPQ==
X-Gm-Message-State: AOJu0YwqYdlr1KBaA1AJ1Jp3AzXLuKy4J+WZofkWOUHyNO7Dj5hZ0D1H
 B3xFAG7p8ixL11Tl8fwJ7SdoKKX5pamp9b314xc=
X-Google-Smtp-Source: AGHT+IEn98icBX5gcwmjYZi9gwHOFnwWsC2bkJU57LqWVDPv16+oNctHYu+N/VfUTj1JfqXGqV5O/drXKHpEZ4H8OG0=
X-Received: by 2002:a05:6122:1822:b0:4b6:e73d:71e5 with SMTP id
 ay34-20020a056122182200b004b6e73d71e5mr1469829vkb.15.1704428649436; Thu, 04
 Jan 2024 20:24:09 -0800 (PST)
MIME-Version: 1.0
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
 <20240103174013.147279-7-dbarboza@ventanamicro.com>
In-Reply-To: <20240103174013.147279-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 14:23:43 +1000
Message-ID: <CAKmqyKM9xP83HpACOtAGyMeBVPGDuuusV9q4OTj8RWy4e5N6Gw@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] target/riscv: rework 'priv_spec'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, vladimir.isaev@syntacore.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
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

On Thu, Jan 4, 2024 at 3:41=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> 'priv_spec' and 'vext_spec' are two string options used as a fancy way
> of setting integers in the CPU state (cpu->env.priv_ver and
> cpu->env.vext_ver). It requires us to deal with string parsing and to
> store them in cpu_cfg.
>
> We must support these string options, but we don't need to store them.
> We have a precedence for this kind of arrangement in target/ppc/compat.c,
> ppc_compat_prop_get|set, getters and setters used for the
> 'max-cpu-compat' class property of the pseries ppc64 machine. We'll do
> the same with both 'priv_spec' and 'vext_spec'.
>
> For 'priv_spec', the validation from riscv_cpu_validate_priv_spec() will
> be done by the prop_priv_spec_set() setter, while also preventing it to
> be changed for vendor CPUs. Add two helpers that converts env->priv_ver
> back and forth to its string representation. These helpers allow us to
> get a string and set 'env->priv_ver' and return a string giving the
> current env->priv_ver value. In other words, make the cpu->cfg.priv_spec
> string obsolete.
>
> Last but not the least, move the reworked 'priv_spec' option to
> riscv_cpu_properties[].
>
> After all said and done, we don't need to store the 'priv_spec' string in
> the CPU state, and we're now protecting vendor CPUs from priv_ver
> changes:
>
> $ ./build/qemu-system-riscv64 -M virt -cpu sifive-e51,priv_spec=3D"v1.12.=
0"
> qemu-system-riscv64: can't apply global sifive-e51-riscv-cpu.priv_spec=3D=
v1.12.0:
>     CPU 'sifive-e51' does not allow changing the value of 'priv_spec'
> Current 'priv_spec' val: v1.10.0
> $
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 73 +++++++++++++++++++++++++++++++++++++-
>  target/riscv/cpu.h         |  3 ++
>  target/riscv/cpu_cfg.h     |  1 -
>  target/riscv/tcg/tcg-cpu.c | 29 ---------------
>  4 files changed, 75 insertions(+), 31 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 01b3b57cee..657569d8a6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1631,8 +1631,77 @@ static const PropertyInfo prop_pmp =3D {
>      .set =3D prop_pmp_set,
>  };
>
> +static int priv_spec_from_str(const char *priv_spec_str)
> +{
> +    int priv_version =3D -1;
> +
> +    if (!g_strcmp0(priv_spec_str, PRIV_VER_1_12_0_STR)) {
> +        priv_version =3D PRIV_VERSION_1_12_0;
> +    } else if (!g_strcmp0(priv_spec_str, PRIV_VER_1_11_0_STR)) {
> +        priv_version =3D PRIV_VERSION_1_11_0;
> +    } else if (!g_strcmp0(priv_spec_str, PRIV_VER_1_10_0_STR)) {
> +        priv_version =3D PRIV_VERSION_1_10_0;
> +    }
> +
> +    return priv_version;
> +}
> +
> +static const char *priv_spec_to_str(int priv_version)
> +{
> +    switch (priv_version) {
> +    case PRIV_VERSION_1_10_0:
> +        return PRIV_VER_1_10_0_STR;
> +    case PRIV_VERSION_1_11_0:
> +        return PRIV_VER_1_11_0_STR;
> +    case PRIV_VERSION_1_12_0:
> +        return PRIV_VER_1_12_0_STR;
> +    default:
> +        return NULL;
> +    }
> +}
> +
> +static void prop_priv_spec_set(Object *obj, Visitor *v, const char *name=
,
> +                               void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    g_autofree char *value =3D NULL;
> +    int priv_version =3D -1;
> +
> +    visit_type_str(v, name, &value, errp);
> +
> +    priv_version =3D priv_spec_from_str(value);
> +    if (priv_version < 0) {
> +        error_setg(errp, "Unsupported privilege spec version '%s'", valu=
e);
> +        return;
> +    }
> +
> +    if (priv_version !=3D cpu->env.priv_ver && riscv_cpu_is_vendor(obj))=
 {
> +        cpu_set_prop_err(cpu, name, errp);
> +        error_append_hint(errp, "Current '%s' val: %s\n", name,
> +                          object_property_get_str(obj, name, NULL));
> +        return;
> +    }
> +
> +    cpu_option_add_user_setting(name, priv_version);
> +    cpu->env.priv_ver =3D priv_version;
> +}
> +
> +static void prop_priv_spec_get(Object *obj, Visitor *v, const char *name=
,
> +                               void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    const char *value =3D priv_spec_to_str(cpu->env.priv_ver);
> +
> +    visit_type_str(v, name, (char **)&value, errp);
> +}
> +
> +static const PropertyInfo prop_priv_spec =3D {
> +    .name =3D "priv_spec",
> +    .get =3D prop_priv_spec_get,
> +    .set =3D prop_priv_spec_set,
> +};
> +
>  Property riscv_cpu_options[] =3D {
> -    DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> @@ -1653,6 +1722,8 @@ static Property riscv_cpu_properties[] =3D {
>      {.name =3D "mmu", .info =3D &prop_mmu},
>      {.name =3D "pmp", .info =3D &prop_pmp},
>
> +    {.name =3D "priv_spec", .info =3D &prop_priv_spec},
> +
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bf69cb9a27..aa3d3372e3 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -77,6 +77,9 @@ const char *riscv_get_misa_ext_description(uint32_t bit=
);
>  #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
>
>  /* Privileged specification version */
> +#define PRIV_VER_1_10_0_STR "v1.10.0"
> +#define PRIV_VER_1_11_0_STR "v1.11.0"
> +#define PRIV_VER_1_12_0_STR "v1.12.0"
>  enum {
>      PRIV_VERSION_1_10_0 =3D 0,
>      PRIV_VERSION_1_11_0,
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index c67a8731d3..2dba1f0007 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -135,7 +135,6 @@ struct RISCVCPUConfig {
>      bool ext_XVentanaCondOps;
>
>      uint32_t pmu_mask;
> -    char *priv_spec;
>      char *vext_spec;
>      uint16_t vlen;
>      uint16_t elen;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index a09300e908..4d67b72d9e 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -175,29 +175,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cp=
u, Error **errp)
>      }
>  }
>
> -static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
> -{
> -    CPURISCVState *env =3D &cpu->env;
> -    int priv_version =3D -1;
> -
> -    if (cpu->cfg.priv_spec) {
> -        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
> -            priv_version =3D PRIV_VERSION_1_12_0;
> -        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
> -            priv_version =3D PRIV_VERSION_1_11_0;
> -        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
> -            priv_version =3D PRIV_VERSION_1_10_0;
> -        } else {
> -            error_setg(errp,
> -                       "Unsupported privilege spec version '%s'",
> -                       cpu->cfg.priv_spec);
> -            return;
> -        }
> -
> -        env->priv_ver =3D priv_version;
> -    }
> -}
> -
>  static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg=
,
>                                   Error **errp)
>  {
> @@ -625,12 +602,6 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, =
Error **errp)
>      CPURISCVState *env =3D &cpu->env;
>      Error *local_err =3D NULL;
>
> -    riscv_cpu_validate_priv_spec(cpu, &local_err);
> -    if (local_err !=3D NULL) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
>      riscv_cpu_validate_misa_priv(env, &local_err);
>      if (local_err !=3D NULL) {
>          error_propagate(errp, local_err);
> --
> 2.43.0
>
>

