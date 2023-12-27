Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2CCC46CD4
	for <qemu-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 13:22:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rITr3-00045U-0Z; Wed, 27 Dec 2023 08:21:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rITr0-00044Y-TS
 for qemu-riscv@nongnu.org; Wed, 27 Dec 2023 08:21:46 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rITqz-0003QZ-0q
 for qemu-riscv@nongnu.org; Wed, 27 Dec 2023 08:21:46 -0500
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-35fff16827fso9241405ab.0
 for <qemu-riscv@nongnu.org>; Wed, 27 Dec 2023 05:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703683303; x=1704288103; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FU+IuqxJj53Pv7sYGVSxT9lZHijVCKofzsQYgJRiSGs=;
 b=aVBwDCJaxtpwQ5lPZpf944alRGbp4nSXks8c0TytR5D69pcZ85WPNKcv7eQiiU1dW9
 gqcvySChDA2YhoLakSz91krRfDFF0Q4mGe9Ux1ge7km3uMSwgwZm0fSulVnZpAs688sc
 un2lls/UVR0mRo4t4rx2rF7yngvdWHOZab0S8UJHkXsQBXcQZWUUpRSrkKNpQ7U044Pk
 exmVhe3VE5GBt2vvApRmdTQJKapLILsI050gJhV7NzUgp4ub719gk5TBtlf7AEhG7rew
 gehOAkBRq1uPILT9+lBl82SOjSu4irRyHMs1fZmUbRCv6CuOhwStfVTuD987+5OByZHO
 qKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703683303; x=1704288103;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FU+IuqxJj53Pv7sYGVSxT9lZHijVCKofzsQYgJRiSGs=;
 b=j7R+ysbB9VmxY4pyy1K6a2QNXMZAvUjcNulcZEFTm1VqyKkSSk13iGIWVegZbc8Daw
 ctVG0YL3L4UtzZDyf4GBmmX48scOx96nGqdH2IjJlbdBMTK30PkH1Ys83CgajyHZaXP/
 oXSzF/oQBFIy/PFr4V44+KhtguGyzupqPpNskVtDFCf3RVCuNqsy1VhB3Dfe7UhIZRq2
 2W4QO3AIB3dmnVFRieNxOcKIHDZSUjAYwhLDlRDMJM8AY025JO6W9WcT7bb4swe/fape
 iraMfJ6GHSjfwqXaQqg7y11DY+DaITuiR3YMeXszkTSQDI6JTfUn/7Vo69w9HR9vK8BF
 11lw==
X-Gm-Message-State: AOJu0Yw4w6MWTV7sIC9gYUfp/HYg7jjNC4ONzZstB+b17ifnzDb5EW0R
 82ZUXIRJgl/KZrFRzRxkymcxHFlym9Vp3Q==
X-Google-Smtp-Source: AGHT+IFzteBN8jdMAYXWYVkp00fxorRsn2AG4rEm64hEJpevzgYdGYlcYFlQwtBk9+0WpAGrVsD+ZQ==
X-Received: by 2002:a05:6e02:1583:b0:35f:d8c6:c1d4 with SMTP id
 m3-20020a056e02158300b0035fd8c6c1d4mr9002051ilu.130.1703683302890; 
 Wed, 27 Dec 2023 05:21:42 -0800 (PST)
Received: from [192.168.68.110] ([189.79.21.107])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a63f818000000b005c67a388836sm10992136pgh.62.2023.12.27.05.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 05:21:42 -0800 (PST)
Message-ID: <aa0de31c-5726-4f93-a320-d0ddde581689@ventanamicro.com>
Date: Wed, 27 Dec 2023 10:21:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] target/riscv: rework 'vext_spec'
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
 <20231222122235.545235-8-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231222122235.545235-8-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 12/22/23 09:22, Daniel Henrique Barboza wrote:
> The same rework did in 'priv_spec' is done for 'vext_spec'. This time is
> simpler, since we only accept one value ("v1.0") and we'll always have
> env->vext_ver set to VEXT_VERSION_1_00_0, thus we don't need helpers to
> convert string to 'vext_ver' back and forth like we needed for
> 'priv_spec'.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c         | 42 ++++++++++++++++++++++++++++++++++----
>   target/riscv/cpu.h         |  1 +
>   target/riscv/cpu_cfg.h     |  1 -
>   target/riscv/tcg/tcg-cpu.c | 15 --------------
>   4 files changed, 39 insertions(+), 20 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1302d32de3..d6625399a7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1237,6 +1237,8 @@ static void riscv_cpu_post_init(Object *obj)
>   
>   static void riscv_cpu_init(Object *obj)
>   {
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
>   #ifndef CONFIG_USER_ONLY
>       qdev_init_gpio_in(DEVICE(obj), riscv_cpu_set_irq,
>                         IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
> @@ -1249,8 +1251,11 @@ static void riscv_cpu_init(Object *obj)
>        * for all CPUs. Each accelerator will decide what to do when
>        * users disable them.
>        */
> -    RISCV_CPU(obj)->cfg.ext_zicntr = true;
> -    RISCV_CPU(obj)->cfg.ext_zihpm = true;
> +    cpu->cfg.ext_zicntr = true;
> +    cpu->cfg.ext_zihpm = true;
> +
> +    /* vext_spec is always 1_00_0 */
> +    cpu->env.vext_ver = VEXT_VERSION_1_00_0;
>   }
>   
>   typedef struct misa_ext_info {
> @@ -1629,9 +1634,37 @@ static const PropertyInfo prop_priv_spec = {
>       .set = prop_priv_spec_set,
>   };
>   
> -Property riscv_cpu_options[] = {
> -    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> +static void prop_vext_spec_set(Object *obj, Visitor *v, const char *name,
> +                               void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    g_autofree char *value = NULL;
> +
> +    visit_type_str(v, name, &value, errp);
> +
> +    if (!g_strcmp0(value, VEXT_VER_1_00_0_STR)) {
> +        error_setg(errp, "Unsupported vector spec version '%s'", value);
> +        return;
> +    }

This bit is wrong. We'll error out if vext_spec == "v1.0" instead of vext_spec != "v1.0".

I fixed it for v3. I'll wait for more reviews to avoid flooding the ML during the holidays.


Thanks,

Daniel

> +
> +    cpu->env.vext_ver = VEXT_VERSION_1_00_0;
> +}
> +
> +static void prop_vext_spec_get(Object *obj, Visitor *v, const char *name,
> +                               void *opaque, Error **errp)
> +{
> +    const char *value = VEXT_VER_1_00_0_STR;
>   
> +    visit_type_str(v, name, (char **)&value, errp);
> +}
> +
> +static const PropertyInfo prop_vext_spec = {
> +    .name = "vext_spec",
> +    .get = prop_vext_spec_get,
> +    .set = prop_vext_spec_set,
> +};
> +
> +Property riscv_cpu_options[] = {
>       DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>       DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>   
> @@ -1652,6 +1685,7 @@ static Property riscv_cpu_properties[] = {
>       {.name = "pmp", .info = &prop_pmp},
>   
>       {.name = "priv_spec", .info = &prop_priv_spec},
> +    {.name = "vext_spec", .info = &prop_vext_spec},
>   
>   #ifndef CONFIG_USER_ONLY
>       DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e8a691ca63..53101b82c5 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -89,6 +89,7 @@ enum {
>   };
>   
>   #define VEXT_VERSION_1_00_0 0x00010000
> +#define VEXT_VER_1_00_0_STR "v1.0"
>   
>   enum {
>       TRANSLATE_SUCCESS,
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 2dba1f0007..7112af6c4c 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -135,7 +135,6 @@ struct RISCVCPUConfig {
>       bool ext_XVentanaCondOps;
>   
>       uint32_t pmu_mask;
> -    char *vext_spec;
>       uint16_t vlen;
>       uint16_t elen;
>       uint16_t cbom_blocksize;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 4d67b72d9e..6501c29d8e 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -201,21 +201,6 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>                      "in the range [8, 64]");
>           return;
>       }
> -
> -    if (cfg->vext_spec) {
> -        if (!g_strcmp0(cfg->vext_spec, "v1.0")) {
> -            env->vext_ver = VEXT_VERSION_1_00_0;
> -        } else {
> -            error_setg(errp, "Unsupported vector spec version '%s'",
> -                       cfg->vext_spec);
> -            return;
> -        }
> -    } else if (env->vext_ver == 0) {
> -        qemu_log("vector version is not specified, "
> -                 "use the default value v1.0\n");
> -
> -        env->vext_ver = VEXT_VERSION_1_00_0;
> -    }
>   }
>   
>   static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)

