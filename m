Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CF3CE7A8B
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 01:58:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkarc-0003sn-Lp; Sun, 24 Sep 2023 21:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkara-0003rx-L7; Sun, 24 Sep 2023 21:58:18 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkarY-0000x2-Pc; Sun, 24 Sep 2023 21:58:18 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-49970221662so1772889e0c.0; 
 Sun, 24 Sep 2023 18:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695607095; x=1696211895; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kps035KQCyOaE8tifvFdbEM90xDiCrn6Op/ZQIs9uK8=;
 b=ITdIu/imgizc+d3sQhuGOht/q3Q9ATc5DtMQubMRaK5Qwu79qiF9w54uSf8RrwoeM5
 oDEfzNK8G8JkeiuHxgELHd8kKxYFBMTt65v0ZS+8KupBYciGIdvAbDDS+bggNepzwnCT
 lSgoOZ47FKl8izdxvSvKgCAZ1gFvl3if0h599xX94aaHNupaDdyvLJJxdtR7Mf9/xocW
 IeFEbSWf7zVOCVhw7SJkQbPXxMweFlLspio0hdTUnENDHpnC4vMya2cbWCIWyGJQ5Fcg
 ObrtAAVA6ho18OzemOkn6vgktHmHXvKi1HCGH6uLICRHwfi9G9mVvaM/cwBloav/3th+
 C1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695607095; x=1696211895;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kps035KQCyOaE8tifvFdbEM90xDiCrn6Op/ZQIs9uK8=;
 b=K8fdyayHCY0szC8vcPa/ig0TW8Hyn9sxaSBZBsjkvMBWtKnGpj7HU3HFiEMhsuvjZe
 H7CQ+esywBxqmcpyQEMg+Q+9OovuhGNTPLFbdjhdO6ZlwHk7agxbjyn5uPGL8NGS7Ul8
 XMhdOiqDE2bzqpL6BafXkCLUyTXu86J29Xu2HtscFhiMZ/a94V+JccqIPIgnJLesd1CA
 zi4K+pxnkodiNRX+2lfVU/WedWzsOynySVl5TCpCNicw41RPk4GY0jmvnRDpeZMxqxy9
 HeKHgtsDV3JfyDYAR+ib5z1g+2YL45Kj3yldDSwW5pQEZLm0rPUZjjO8S1CUIl9wPQGJ
 q56Q==
X-Gm-Message-State: AOJu0Yzp4HuW5hkpGxMhxQP2kjNAhHSySumcdiqVpI5edG/ILZazFgln
 k7SEtgQi2gYunQM9k1h7kMvRcBhpQC80Uh52OJw=
X-Google-Smtp-Source: AGHT+IHsIV1DxdYAqo93bUahSJrJtCyj4ncWuCdoHi3eECZwT2SbNiVlqam8rbOh+hRX9pWtGC3C8+3ZK3Fn8ITXIRE=
X-Received: by 2002:a1f:cb01:0:b0:48c:f9e9:51a7 with SMTP id
 b1-20020a1fcb01000000b0048cf9e951a7mr2285332vkg.2.1695607095191; Sun, 24 Sep
 2023 18:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-18-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-18-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Sep 2023 11:57:48 +1000
Message-ID: <CAKmqyKMwK=TEmYv_DEi0-FK-smd154FKZN3wPGyk_qLcfTwuGA@mail.gmail.com>
Subject: Re: [PATCH v3 17/19] target/riscv/tcg: move
 riscv_cpu_add_misa_properties() to tcg-cpu.c
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Sep 20, 2023 at 10:58=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> All code related to MISA TCG properties is also moved.
>
> At this point, all TCG properties handling is done in tcg-cpu.c, all KVM
> properties handling is done in kvm-cpu.c.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 90 --------------------------------------
>  target/riscv/cpu.h         |  1 -
>  target/riscv/tcg/tcg-cpu.c | 90 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 90 insertions(+), 91 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4875feded7..46263e55d5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1211,47 +1211,6 @@ static void riscv_cpu_init(Object *obj)
>  #endif /* CONFIG_USER_ONLY */
>  }
>
> -typedef struct RISCVCPUMisaExtConfig {
> -    target_ulong misa_bit;
> -    bool enabled;
> -} RISCVCPUMisaExtConfig;
> -
> -static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *na=
me,
> -                                 void *opaque, Error **errp)
> -{
> -    const RISCVCPUMisaExtConfig *misa_ext_cfg =3D opaque;
> -    target_ulong misa_bit =3D misa_ext_cfg->misa_bit;
> -    RISCVCPU *cpu =3D RISCV_CPU(obj);
> -    CPURISCVState *env =3D &cpu->env;
> -    bool value;
> -
> -    if (!visit_type_bool(v, name, &value, errp)) {
> -        return;
> -    }
> -
> -    if (value) {
> -        env->misa_ext |=3D misa_bit;
> -        env->misa_ext_mask |=3D misa_bit;
> -    } else {
> -        env->misa_ext &=3D ~misa_bit;
> -        env->misa_ext_mask &=3D ~misa_bit;
> -    }
> -}
> -
> -static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *na=
me,
> -                                 void *opaque, Error **errp)
> -{
> -    const RISCVCPUMisaExtConfig *misa_ext_cfg =3D opaque;
> -    target_ulong misa_bit =3D misa_ext_cfg->misa_bit;
> -    RISCVCPU *cpu =3D RISCV_CPU(obj);
> -    CPURISCVState *env =3D &cpu->env;
> -    bool value;
> -
> -    value =3D env->misa_ext & misa_bit;
> -
> -    visit_type_bool(v, name, &value, errp);
> -}
> -
>  typedef struct misa_ext_info {
>      const char *name;
>      const char *description;
> @@ -1312,55 +1271,6 @@ const char *riscv_get_misa_ext_description(uint32_=
t bit)
>      return val;
>  }
>
> -#define MISA_CFG(_bit, _enabled) \
> -    {.misa_bit =3D _bit, .enabled =3D _enabled}
> -
> -static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =3D {
> -    MISA_CFG(RVA, true),
> -    MISA_CFG(RVC, true),
> -    MISA_CFG(RVD, true),
> -    MISA_CFG(RVF, true),
> -    MISA_CFG(RVI, true),
> -    MISA_CFG(RVE, false),
> -    MISA_CFG(RVM, true),
> -    MISA_CFG(RVS, true),
> -    MISA_CFG(RVU, true),
> -    MISA_CFG(RVH, true),
> -    MISA_CFG(RVJ, false),
> -    MISA_CFG(RVV, false),
> -    MISA_CFG(RVG, false),
> -};
> -
> -/*
> - * We do not support user choice tracking for MISA
> - * extensions yet because, so far, we do not silently
> - * change MISA bits during realize() (RVG enables MISA
> - * bits but the user is warned about it).
> - */
> -void riscv_cpu_add_misa_properties(Object *cpu_obj)
> -{
> -    int i;
> -
> -    for (i =3D 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
> -        const RISCVCPUMisaExtConfig *misa_cfg =3D &misa_ext_cfgs[i];
> -        int bit =3D misa_cfg->misa_bit;
> -        const char *name =3D riscv_get_misa_ext_name(bit);
> -        const char *desc =3D riscv_get_misa_ext_description(bit);
> -
> -        /* Check if KVM already created the property */
> -        if (object_property_find(cpu_obj, name)) {
> -            continue;
> -        }
> -
> -        object_property_add(cpu_obj, name, "bool",
> -                            cpu_get_misa_ext_cfg,
> -                            cpu_set_misa_ext_cfg,
> -                            NULL, (void *)misa_cfg);
> -        object_property_set_description(cpu_obj, name, desc);
> -        object_property_set_bool(cpu_obj, name, misa_cfg->enabled, NULL)=
;
> -    }
> -}
> -
>  #define MULTI_EXT_CFG_BOOL(_name, _prop, _defval) \
>      {.name =3D _name, .offset =3D CPU_CFG_OFFSET(_prop), \
>       .enabled =3D _defval}
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 01cbcbe119..aba8192c74 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -726,7 +726,6 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_=
exts[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
>  extern Property riscv_cpu_options[];
>
> -void riscv_cpu_add_misa_properties(Object *cpu_obj);
>  void riscv_add_satp_mode_properties(Object *obj);
>
>  /* CSR function table */
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 5d71ff2cce..c326ab37a2 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -580,6 +580,96 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error **=
errp)
>      return true;
>  }
>
> +typedef struct RISCVCPUMisaExtConfig {
> +    target_ulong misa_bit;
> +    bool enabled;
> +} RISCVCPUMisaExtConfig;
> +
> +static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *na=
me,
> +                                 void *opaque, Error **errp)
> +{
> +    const RISCVCPUMisaExtConfig *misa_ext_cfg =3D opaque;
> +    target_ulong misa_bit =3D misa_ext_cfg->misa_bit;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
> +    bool value;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value) {
> +        env->misa_ext |=3D misa_bit;
> +        env->misa_ext_mask |=3D misa_bit;
> +    } else {
> +        env->misa_ext &=3D ~misa_bit;
> +        env->misa_ext_mask &=3D ~misa_bit;
> +    }
> +}
> +
> +static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *na=
me,
> +                                 void *opaque, Error **errp)
> +{
> +    const RISCVCPUMisaExtConfig *misa_ext_cfg =3D opaque;
> +    target_ulong misa_bit =3D misa_ext_cfg->misa_bit;
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    CPURISCVState *env =3D &cpu->env;
> +    bool value;
> +
> +    value =3D env->misa_ext & misa_bit;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +#define MISA_CFG(_bit, _enabled) \
> +    {.misa_bit =3D _bit, .enabled =3D _enabled}
> +
> +static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =3D {
> +    MISA_CFG(RVA, true),
> +    MISA_CFG(RVC, true),
> +    MISA_CFG(RVD, true),
> +    MISA_CFG(RVF, true),
> +    MISA_CFG(RVI, true),
> +    MISA_CFG(RVE, false),
> +    MISA_CFG(RVM, true),
> +    MISA_CFG(RVS, true),
> +    MISA_CFG(RVU, true),
> +    MISA_CFG(RVH, true),
> +    MISA_CFG(RVJ, false),
> +    MISA_CFG(RVV, false),
> +    MISA_CFG(RVG, false),
> +};
> +
> +/*
> + * We do not support user choice tracking for MISA
> + * extensions yet because, so far, we do not silently
> + * change MISA bits during realize() (RVG enables MISA
> + * bits but the user is warned about it).
> + */
> +static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
> +        const RISCVCPUMisaExtConfig *misa_cfg =3D &misa_ext_cfgs[i];
> +        int bit =3D misa_cfg->misa_bit;
> +        const char *name =3D riscv_get_misa_ext_name(bit);
> +        const char *desc =3D riscv_get_misa_ext_description(bit);
> +
> +        /* Check if KVM already created the property */
> +        if (object_property_find(cpu_obj, name)) {
> +            continue;
> +        }
> +
> +        object_property_add(cpu_obj, name, "bool",
> +                            cpu_get_misa_ext_cfg,
> +                            cpu_set_misa_ext_cfg,
> +                            NULL, (void *)misa_cfg);
> +        object_property_set_description(cpu_obj, name, desc);
> +        object_property_set_bool(cpu_obj, name, misa_cfg->enabled, NULL)=
;
> +    }
> +}
> +
>  static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *n=
ame,
>                                    void *opaque, Error **errp)
>  {
> --
> 2.41.0
>
>

