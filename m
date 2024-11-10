Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F11D5E38D
	for <qemu-riscv@archiver.kernel.org>; Sun, 10 Nov 2024 14:00:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tA8TR-00018i-Ax; Sun, 10 Nov 2024 08:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tA8TO-000184-2u
 for qemu-riscv@nongnu.org; Sun, 10 Nov 2024 08:59:26 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tA8TM-0000oV-1w
 for qemu-riscv@nongnu.org; Sun, 10 Nov 2024 08:59:25 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-72097a5ca74so3137413b3a.3
 for <qemu-riscv@nongnu.org>; Sun, 10 Nov 2024 05:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1731247162; x=1731851962; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+J5LsajHXQ2psPzsyuUmBSCD6H31/hhn0bbRUkU6g2U=;
 b=ZzD1T5oLwnfigVqDXgrCnrP4FVhFOap36/0/xT7Jb5HnloPPekShbp1TEBZaI7VcwU
 8URDdSl7JFA4WFmGVpxIo8aDkH2o9k9L74A5UqGP8DMJw37L31JWrVkqRQk7uh3gOQyw
 VUnX2gM4CC1+n33+ODXvXMLp7XRe0KPftAKpYZEYCeYXwSGWbF4lNpoR4OaHw8FWFeSi
 ZuRqdeoSb8M2ceduedP997p4BF4LK6KwVIiBrDtfBLVLxCYufwSk+9iCYhTRAdSxd5gb
 /v47DQQag8bfbrB0uzEMbVhNgNwPmeIkj0B3zBvGfJiUd5cDmtDe5c8untX9GuO6XUoh
 B5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731247162; x=1731851962;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+J5LsajHXQ2psPzsyuUmBSCD6H31/hhn0bbRUkU6g2U=;
 b=TycTkVcV8barAm8m/+847bnaZFYDUjiUUHqMikua0uGPDQkT82bo5p3pOvh3LOeFoy
 BwWeCmnwODx6TMp2qwCRBE7xd6ua/kV4f0mlwbR4nppzpKby7GGPnFC9vPHSQch1OgZt
 JUBspdtgekDsjNthUsHJ4EwdtDal27qIIk4JKJ5qtY6nXhyKkmivTNZqj/y3XrudmVGo
 B2p/pJqfN8keXp8OsuNWXU9zyHmIAQbNcMd8Tesi7dogRkttj8TRGZfBXmGl8b6oCNEc
 c58AN0p3eEHevMdxvyEH7sO7E5MMNVIVaO+YBnbHlBozsgyJjmOihxfHTspp4gAbchR1
 GHag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa1EhD77f76K1FwBTolLsrY8FujHjbFXr+XM+mchW4DBI6NXD1ekq2KJO8AKKVRDTwqDBemQe0aiG6@nongnu.org
X-Gm-Message-State: AOJu0YykktNJAclDmuye+OorWVBkOEPbGGdAPTYLzIDOwnVu+movlzM2
 AG5TpiRc199V/veW8hCaFiEUP6Dut/Q1EIIH+CxRph529m57IUYNrYxAfjVi/SY=
X-Google-Smtp-Source: AGHT+IH/ZcFvVZNnJzBNan6DIBq2VoZXcWFe6jZewl11lBKFVIQKEsAFuMd7AH99kHeiBLzrUaFnnw==
X-Received: by 2002:a05:6a20:3d84:b0:1dc:43:f87a with SMTP id
 adf61e73a8af0-1dc22b8fc62mr13865274637.37.1731247162108; 
 Sun, 10 Nov 2024 05:59:22 -0800 (PST)
Received: from [192.168.68.110] ([189.79.22.174])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7f41f643be3sm6740174a12.62.2024.11.10.05.59.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Nov 2024 05:59:21 -0800 (PST)
Message-ID: <ad32c96c-61e8-4590-b20c-f32a821e01ed@ventanamicro.com>
Date: Sun, 10 Nov 2024 10:59:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Add Tenstorrent Ascalon CPU
To: Anton Blanchard <antonb@tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20241108230709.1466634-1-antonb@tenstorrent.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241108230709.1466634-1-antonb@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi,

On 11/8/24 8:07 PM, Anton Blanchard wrote:
> Add a CPU entry for the Tenstorrent Ascalon CPU, a series of 2 wide to
> 8 wide RV64 cores.
> 

As Phil mentioned, it would be nice to have a reference of the CPU you're
adding. The link you gave in the reply (https://tenstorrent.com/ip/tt-ascalon)
is enough.

> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>
> ---
>   target/riscv/cpu-qom.h |  1 +
>   target/riscv/cpu.c     | 67 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 68 insertions(+)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 62115375cd..6547642287 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -49,6 +49,7 @@
>   #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
>   #define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906")
>   #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
> +#define TYPE_RISCV_CPU_TT_ASCALON       RISCV_CPU_TYPE_NAME("tt-ascalon")
>   #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>   
>   OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f219f0c3b5..8447ad0dfb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -579,6 +579,72 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>   #endif
>   }
>   
> +/* Tenstorrent Ascalon */
> +static void rv64_tt_ascalon_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
> +    riscv_cpu_set_misa_ext(env, RVG | RVC | RVS | RVU | RVH | RVV);
> +    env->priv_ver = PRIV_VERSION_1_13_0;
> +
> +    /* Enable ISA extensions */
> +    cpu->cfg.mmu = true;
> +    cpu->cfg.vlenb = 256 >> 3;
> +    cpu->cfg.elen = 64;
> +    cpu->env.vext_ver = VEXT_VERSION_1_00_0;
> +    cpu->cfg.rvv_ma_all_1s = true;
> +    cpu->cfg.rvv_ta_all_1s = true;
> +    cpu->cfg.misa_w = true;
> +    cpu->cfg.pmp = true;
> +    cpu->cfg.cbom_blocksize = 64;
> +    cpu->cfg.cbop_blocksize = 64;
> +    cpu->cfg.cboz_blocksize = 64;
> +    cpu->cfg.ext_zic64b = true;
> +    cpu->cfg.ext_zicbom = true;
> +    cpu->cfg.ext_zicbop = true;
> +    cpu->cfg.ext_zicboz = true;
> +    cpu->cfg.ext_zicntr = true;
> +    cpu->cfg.ext_zicond = true;
> +    cpu->cfg.ext_zicsr = true;
> +    cpu->cfg.ext_zifencei = true;
> +    cpu->cfg.ext_zihintntl = true;
> +    cpu->cfg.ext_zihintpause = true;
> +    cpu->cfg.ext_zihpm = true;
> +    cpu->cfg.ext_zimop = true;
> +    cpu->cfg.ext_zawrs = true;
> +    cpu->cfg.ext_zfa = true;
> +    cpu->cfg.ext_zfbfmin = true;
> +    cpu->cfg.ext_zfh = true;
> +    cpu->cfg.ext_zfhmin = true;
> +    cpu->cfg.ext_zcb = true;
> +    cpu->cfg.ext_zcmop = true;
> +    cpu->cfg.ext_zba = true;
> +    cpu->cfg.ext_zbb = true;
> +    cpu->cfg.ext_zbs = true;
> +    cpu->cfg.ext_zkt = true;
> +    cpu->cfg.ext_zvbb = true;
> +    cpu->cfg.ext_zvbc = true;
> +    cpu->cfg.ext_zvfbfmin = true;
> +    cpu->cfg.ext_zvfbfwma = true;
> +    cpu->cfg.ext_zvfh = true;
> +    cpu->cfg.ext_zvfhmin = true;
> +    cpu->cfg.ext_zvkng = true;
> +    cpu->cfg.ext_smaia = true;
> +    cpu->cfg.ext_smstateen = true;
> +    cpu->cfg.ext_ssaia = true;
> +    cpu->cfg.ext_sscofpmf = true;
> +    cpu->cfg.ext_sstc = true;
> +    cpu->cfg.ext_svade = true;
> +    cpu->cfg.ext_svinval = true;
> +    cpu->cfg.ext_svnapot = true;
> +    cpu->cfg.ext_svpbmt = true;
> +
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
> +#endif

Patch looks good. One thing to consider is to set mvendorid/marchid/mimpid in case
the CPU defines specific IDs. These IDs can be read later by software to determine
if a certain vendor CPU is being used (and then vendor specific drivers can be
used, for example). See rv64_veryon_v1_cpu_init() for an example.

This is optional though. Feel free to leave it as is. Thanks,


Daniel



> +}
> +
>   #ifdef CONFIG_TCG
>   static void rv128_base_cpu_init(Object *obj)
>   {
> @@ -2982,6 +3048,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>       DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_U54, MXL_RV64,  rv64_sifive_u_cpu_init),
>       DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SHAKTI_C,   MXL_RV64,  rv64_sifive_u_cpu_init),
>       DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_THEAD_C906, MXL_RV64,  rv64_thead_c906_cpu_init),
> +    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_TT_ASCALON, MXL_RV64,  rv64_tt_ascalon_cpu_init),
>       DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,  MXL_RV64,  rv64_veyron_v1_cpu_init),
>   #ifdef CONFIG_TCG
>       DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,   MXL_RV128, rv128_base_cpu_init),

