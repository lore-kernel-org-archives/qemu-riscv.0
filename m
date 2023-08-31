Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ADDC83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 12:02:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbgN1-000567-JZ; Thu, 31 Aug 2023 08:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbgMo-0004Z4-6t
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:01:44 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbgMk-0005kW-89
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:01:41 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2bd0d19a304so13905211fa.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693483296; x=1694088096; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3OsV/bYfKoH8v1MQpGrrxy4DsUPxmKaRrOO7eWCYbqQ=;
 b=TeayJUYpDTafyBkvK77IN/XzfeWKV7wfcNHTOrsYr99TFlac+iHe5W8/14Byfixfdc
 DT+JlEAuxMAMFZiFXH8s09212wCZmpMsYCAEKOQXQYmIy6TjCu357MlE6MH1+jGQBzei
 OC/1AiaBG0N6qseASb+/g2+CtdK6dEZIPed7JO+T7+C7OD4GZA0GDu2l0ExLIfG6VM1O
 +XxQ/IQftJXZofKgCPpEYnzUj9Q4G2tsX8TegsHBoGvrBb+kziSeorHMFvDZEhcqbxka
 g9K/t0TjYJLYjlAABl63TLQwU5NpJVTSv0u029sL6fdbM5rnnQHd1uikKcNDpR3hwMvt
 VIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693483296; x=1694088096;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3OsV/bYfKoH8v1MQpGrrxy4DsUPxmKaRrOO7eWCYbqQ=;
 b=C9iMyRSJPkMUHFd8tXiVOFZ1p3zife50RosOfAq1I17bWdE0dol04m7miRorUKJo6/
 VZfVJY/IujEh97WwV3FHDruuB9DmWnX6yvN/6ecYItkzHvxtrcu0G05Rcl4pkKikmPwg
 bO/Y2O1gIdcaUi7NPorcJdSipJGNPRk9s2vMknXjqq4HbE+n2M+Won24Ohy7jFNOrK/x
 2qwpN5voyNQX2CYK53Wm+/3MMJbShsAxBdIJT6pXP1MVP1kA3EtmRVimReCLR3bXh/I4
 tC9zudLhTnV5a47b2J36eeslDLmjQYwXctkAJ9LbSdCj3pgkCHBS0Itsb/6t2iug/gmX
 H7Cw==
X-Gm-Message-State: AOJu0YyT4W/kGy3N+47xRy1groc9CNnw5ikbU+bTY3V6kO/7/UlUMZkO
 r738p3n09u7UAg4G73kp2g4Leg==
X-Google-Smtp-Source: AGHT+IELISqlbz+Vmp8tB3mS8UED0+zHEQYnyybZnvlIynsldHVJWch2imPMikr/6SCDPubCYKPJtA==
X-Received: by 2002:a2e:924e:0:b0:2bc:e882:f717 with SMTP id
 v14-20020a2e924e000000b002bce882f717mr3525421ljg.53.1693483287846; 
 Thu, 31 Aug 2023 05:01:27 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 f27-20020a170906391b00b0099cd1c0cb21sm668050eje.129.2023.08.31.05.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 05:01:27 -0700 (PDT)
Date: Thu, 31 Aug 2023 14:01:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 16/20] target/riscv/tcg: move
 riscv_cpu_add_misa_properties() to tcg-cpu.c
Message-ID: <20230831-9135d7f6e2059b82be3f9300@orel>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-17-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825130853.511782-17-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Aug 25, 2023 at 10:08:49AM -0300, Daniel Henrique Barboza wrote:
> All code related to MISA TCG properties is also moved.
> 
> At this point, all TCG properties handling is done in tcg-cpu.c, all KVM
> properties handling is done in kvm-cpu.c.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c         | 89 --------------------------------------
>  target/riscv/cpu.h         |  1 -
>  target/riscv/tcg/tcg-cpu.c | 84 +++++++++++++++++++++++++++++++++++
>  3 files changed, 84 insertions(+), 90 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 89b09a7e89..3c9db46837 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1201,49 +1201,6 @@ static void riscv_cpu_init(Object *obj)
>  #endif /* CONFIG_USER_ONLY */
>  }
>  
> -typedef struct RISCVCPUMisaExtConfig {
> -    const char *name;
> -    const char *description;
> -    target_ulong misa_bit;
> -    bool enabled;
> -} RISCVCPUMisaExtConfig;
> -
> -static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
> -                                 void *opaque, Error **errp)
> -{
> -    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
> -    target_ulong misa_bit = misa_ext_cfg->misa_bit;
> -    RISCVCPU *cpu = RISCV_CPU(obj);
> -    CPURISCVState *env = &cpu->env;
> -    bool value;
> -
> -    if (!visit_type_bool(v, name, &value, errp)) {
> -        return;
> -    }
> -
> -    if (value) {
> -        env->misa_ext |= misa_bit;
> -        env->misa_ext_mask |= misa_bit;
> -    } else {
> -        env->misa_ext &= ~misa_bit;
> -        env->misa_ext_mask &= ~misa_bit;
> -    }
> -}
> -
> -static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
> -                                 void *opaque, Error **errp)
> -{
> -    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
> -    target_ulong misa_bit = misa_ext_cfg->misa_bit;
> -    RISCVCPU *cpu = RISCV_CPU(obj);
> -    CPURISCVState *env = &cpu->env;
> -    bool value;
> -
> -    value = env->misa_ext & misa_bit;
> -
> -    visit_type_bool(v, name, &value, errp);
> -}
> -
>  typedef struct misa_ext_info {
>      const char *name;
>      const char *description;
> @@ -1304,52 +1261,6 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
>      return val;
>  }
>  
> -#define MISA_CFG(_bit, _enabled) \
> -    {.misa_bit = _bit, .enabled = _enabled}
> -
> -static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
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
> -void riscv_cpu_add_misa_properties(Object *cpu_obj)
> -{
> -    int i;
> -
> -    for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
> -        RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
> -        int bit = misa_cfg->misa_bit;
> -
> -        misa_cfg->name = riscv_get_misa_ext_name(bit);
> -        misa_cfg->description = riscv_get_misa_ext_description(bit);
> -
> -        /* Check if KVM already created the property */
> -        if (object_property_find(cpu_obj, misa_cfg->name)) {
> -            continue;
> -        }
> -
> -        object_property_add(cpu_obj, misa_cfg->name, "bool",
> -                            cpu_get_misa_ext_cfg,
> -                            cpu_set_misa_ext_cfg,
> -                            NULL, (void *)misa_cfg);
> -        object_property_set_description(cpu_obj, misa_cfg->name,
> -                                        misa_cfg->description);
> -        object_property_set_bool(cpu_obj, misa_cfg->name,
> -                                 misa_cfg->enabled, NULL);
> -    }
> -}
> -
>  #define MULTI_EXT_CFG_BOOL(_name, _prop, _defval) \
>      {.name = _name, .offset = CPU_CFG_OFFSET(_prop), \
>       .enabled = _defval}
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 74fbb33e09..4269523e24 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -726,7 +726,6 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
>  extern Property riscv_cpu_options[];
>  
> -void riscv_cpu_add_misa_properties(Object *cpu_obj);
>  void riscv_add_satp_mode_properties(Object *obj);
>  
>  /* CSR function table */
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 68ce3cbcb9..8e3f55d3a6 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -574,6 +574,90 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
>      return true;
>  }
>  
> +typedef struct RISCVCPUMisaExtConfig {
> +    const char *name;
> +    const char *description;
> +    target_ulong misa_bit;
> +    bool enabled;
> +} RISCVCPUMisaExtConfig;
> +
> +static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
> +                                 void *opaque, Error **errp)
> +{
> +    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
> +    target_ulong misa_bit = misa_ext_cfg->misa_bit;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    CPURISCVState *env = &cpu->env;
> +    bool value;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value) {
> +        env->misa_ext |= misa_bit;
> +        env->misa_ext_mask |= misa_bit;
> +    } else {
> +        env->misa_ext &= ~misa_bit;
> +        env->misa_ext_mask &= ~misa_bit;
> +    }
> +}
> +
> +static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
> +                                 void *opaque, Error **errp)
> +{
> +    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
> +    target_ulong misa_bit = misa_ext_cfg->misa_bit;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    CPURISCVState *env = &cpu->env;
> +    bool value;
> +
> +    value = env->misa_ext & misa_bit;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +#define MISA_CFG(_bit, _enabled) \
> +    {.misa_bit = _bit, .enabled = _enabled}
> +
> +static RISCVCPUMisaExtConfig misa_ext_cfgs[] = {

Can this be const?

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
> +static void riscv_cpu_add_misa_properties(Object *cpu_obj)
> +{
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
> +        RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
> +        int bit = misa_cfg->misa_bit;
> +
> +        misa_cfg->name = riscv_get_misa_ext_name(bit);
> +        misa_cfg->description = riscv_get_misa_ext_description(bit);
> +
> +        object_property_add(cpu_obj, misa_cfg->name, "bool",
> +                            cpu_get_misa_ext_cfg,
> +                            cpu_set_misa_ext_cfg,
> +                            NULL, (void *)misa_cfg);
> +        object_property_set_description(cpu_obj, misa_cfg->name,
> +                                        misa_cfg->description);
> +        object_property_set_bool(cpu_obj, misa_cfg->name,
> +                                 misa_cfg->enabled, NULL);
> +    }
> +}
> +
>  static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
>                                    void *opaque, Error **errp)
>  {
> -- 
> 2.41.0
> 
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

