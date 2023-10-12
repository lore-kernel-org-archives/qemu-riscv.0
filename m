Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9C9CDB47E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 19:10:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qr14f-0004DC-Kh; Thu, 12 Oct 2023 15:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qr14b-00047X-SG
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 15:10:18 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qr14X-0004XY-P5
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 15:10:17 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-27d1a03f540so1109409a91.1
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 12:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697137812; x=1697742612; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+swpM1Eo76ZKYMGYHaJWhMt58JAIeloIhYYL/RQJnEs=;
 b=BhrZU+qaAR36YQYMs1mm10MA/MvZZHv22y+1HLzsy+FSxdcoo5/RPb1K+xGXE31LMe
 5RhqdTom/ompz46IOv0lDmTNcAT7C0yf0ybtQCo2L0eg7Vvx0s37k53umDqgGMvc6Wim
 Bxj5pT/3/vNEnPGeE0Kqa59oxn3pIcSjvz125jHjapv5xrnqLMmF7n9gKErJwiMOVqZq
 /hr/1FMv4WUkQiQYBwXCzb/7MPW9+QDzP/dHXQy/ZHQGTcviu0nZ8clvKgm15OXKGiVU
 qVRNrGvUzwTc/UlP8rYSHYcWN8pALo0HtyqfRk26gPYccUhGxG0NYdgnJc+2tvYvuodl
 84mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697137812; x=1697742612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+swpM1Eo76ZKYMGYHaJWhMt58JAIeloIhYYL/RQJnEs=;
 b=qAgnowh82n6yKD7DKa4qO53JuDuZ2Puih1WdGJ1AbrrvfN0bGOkBU9uRBB+JLLX0SI
 EAxS188i8hmU3ZqFO/56xpTwshXIgZqzKSIB+lXw5FOEKHJjYLrdnF0410I5MqrqiXgb
 wEsJA9uEoZmKDSpgxa6H03cMs87O8tV4i71BQza2M23yL8fFrDGlRqvm9d0fDbWGoJsv
 zYAJ+9247EY/LDr9pDyRvCTyOT2Iu9IVenGy7U2QDG7BGKjFzw2F09LIMq+8b2d4zmCv
 J1sVHcJUyCsXo7/JVTQGuEG22MzZbEq47nz0AfRRhteKYyDzQkEU2uTDG5CRCL3ZGDmh
 j1gw==
X-Gm-Message-State: AOJu0YzKB2jCHThTzfDXmLfl2jUxuyRU3KLe12yv3R/wH0ETVGZHa+rG
 qTFsZO+N1wIFA+pRMa/4QZ+iWg==
X-Google-Smtp-Source: AGHT+IGip/i8MjuuR5O6s1C4U8Bi9T90edVS9JimnSsD+shNJ1zlxHIkotvoX6yQB02znqzflF0AuA==
X-Received: by 2002:a17:90a:d407:b0:27d:310a:b20e with SMTP id
 r7-20020a17090ad40700b0027d310ab20emr463881pju.0.1697137811529; 
 Thu, 12 Oct 2023 12:10:11 -0700 (PDT)
Received: from [192.168.68.107] ([177.94.42.196])
 by smtp.gmail.com with ESMTPSA id
 qc7-20020a17090b288700b0027ce34334f5sm2133923pjb.37.2023.10.12.12.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 12:10:11 -0700 (PDT)
Message-ID: <e71bbcc3-25cf-4772-bd52-832a34e366e9@ventanamicro.com>
Date: Thu, 12 Oct 2023 16:10:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/23] target/riscv: Move MISA limits to class
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20231011070335.14398-1-akihiko.odaki@daynix.com>
 <20231011070335.14398-2-akihiko.odaki@daynix.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231011070335.14398-2-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102f.google.com
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



On 10/11/23 04:02, Akihiko Odaki wrote:
> MISA limits are common for all instances of a RISC-V CPU class so they
> are better put into class.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---

This patch and patches 2 and 3 from this version (v9) got dropped from the later
versions of the series. Can I assume they're not relevant anymore?


Thanks,


Daniel


>   target/riscv/cpu-qom.h   |   2 +
>   target/riscv/cpu.h       |   2 -
>   hw/riscv/boot.c          |   2 +-
>   target/riscv/cpu.c       | 212 +++++++++++++++++++++++++++------------
>   target/riscv/csr.c       |   3 +-
>   target/riscv/gdbstub.c   |  12 ++-
>   target/riscv/machine.c   |  11 +-
>   target/riscv/translate.c |   3 +-
>   8 files changed, 167 insertions(+), 80 deletions(-)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 04af50983e..266a07f5be 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -67,5 +67,7 @@ struct RISCVCPUClass {
>       /*< public >*/
>       DeviceRealize parent_realize;
>       ResettablePhases parent_phases;
> +    uint32_t misa_mxl_max;  /* max mxl for this cpu */
> +    uint32_t misa_ext_mask; /* max ext for this cpu */
>   };
>   #endif /* RISCV_CPU_QOM_H */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ef9cf21c0c..9f9cb6cd2a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -155,9 +155,7 @@ struct CPUArchState {
>   
>       /* RISCVMXL, but uint32_t for vmstate migration */
>       uint32_t misa_mxl;      /* current mxl */
> -    uint32_t misa_mxl_max;  /* max mxl for this cpu */
>       uint32_t misa_ext;      /* current extensions */
> -    uint32_t misa_ext_mask; /* max ext for this cpu */
>       uint32_t xl;            /* current xlen */
>   
>       /* 128-bit helpers upper part return value */
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 52bf8e67de..b7cf08f479 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -36,7 +36,7 @@
>   
>   bool riscv_is_32bit(RISCVHartArrayState *harts)
>   {
> -    return harts->harts[0].env.misa_mxl_max == MXL_RV32;
> +    return RISCV_CPU_GET_CLASS(&harts->harts[0])->misa_mxl_max == MXL_RV32;
>   }
>   
>   /*
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f5572704de..3bb1ce90f9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -41,6 +41,11 @@
>   /* RISC-V CPU definitions */
>   static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
>   
> +typedef struct RISCVCPUClassData {
> +    RISCVMXL misa_mxl_max;
> +    uint32_t misa_ext_mask;
> +} RISCVCPUClassData;
> +
>   struct isa_ext_data {
>       const char *name;
>       int min_version;
> @@ -271,12 +276,6 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>       }
>   }
>   
> -static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
> -{
> -    env->misa_mxl_max = env->misa_mxl = mxl;
> -    env->misa_ext_mask = env->misa_ext = ext;
> -}
> -
>   #ifndef CONFIG_USER_ONLY
>   static uint8_t satp_mode_from_str(const char *satp_mode_str)
>   {
> @@ -371,15 +370,20 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
>   }
>   #endif
>   
> +static const RISCVCPUClassData riscv_any_cpu_class_data = {
> +#if defined(TARGET_RISCV32)
> +    .misa_mxl_max = MXL_RV32,
> +    .misa_ext_mask = RVI | RVM | RVA | RVF | RVD | RVC | RVU
> +#else
> +    .misa_mxl_max = MXL_RV64,
> +    .misa_ext_mask = RVI | RVM | RVA | RVF | RVD | RVC | RVU
> +#endif
> +};
> +
>   static void riscv_any_cpu_init(Object *obj)
>   {
>       RISCVCPU *cpu = RISCV_CPU(obj);
>       CPURISCVState *env = &cpu->env;
> -#if defined(TARGET_RISCV32)
> -    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> -#elif defined(TARGET_RISCV64)
> -    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> -#endif
>   
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj),
> @@ -397,11 +401,13 @@ static void riscv_any_cpu_init(Object *obj)
>   }
>   
>   #if defined(TARGET_RISCV64)
> +static const RISCVCPUClassData rv64_base_cpu_class_data = {
> +    .misa_mxl_max = MXL_RV64
> +};
> +
>   static void rv64_base_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
> -    /* We set this in the realise function */
> -    set_misa(env, MXL_RV64, 0);
>       riscv_cpu_add_user_properties(obj);
>       /* Set latest version of privileged specification */
>       env->priv_ver = PRIV_VERSION_LATEST;
> @@ -410,11 +416,15 @@ static void rv64_base_cpu_init(Object *obj)
>   #endif
>   }
>   
> +static const RISCVCPUClassData rv64_sifive_u_cpu_class_data = {
> +    .misa_mxl_max = MXL_RV64,
> +    .misa_ext_mask = RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU
> +};
> +
>   static void rv64_sifive_u_cpu_init(Object *obj)
>   {
>       RISCVCPU *cpu = RISCV_CPU(obj);
>       CPURISCVState *env = &cpu->env;
> -    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
> @@ -427,12 +437,16 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>       cpu->cfg.pmp = true;
>   }
>   
> +static const RISCVCPUClassData rv64_sifive_e_cpu_class_data = {
> +    .misa_mxl_max = MXL_RV64,
> +    .misa_ext_mask = RVI | RVM | RVA | RVC | RVU
> +};
> +
>   static void rv64_sifive_e_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -444,12 +458,16 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>       cpu->cfg.pmp = true;
>   }
>   
> +static const RISCVCPUClassData rv64_thead_c906_cpu_class_data = {
> +    .misa_mxl_max = MXL_RV64,
> +    .misa_ext_mask = RVG | RVC | RVS | RVU
> +};
> +
>   static void rv64_thead_c906_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
>       env->priv_ver = PRIV_VERSION_1_11_0;
>   
>       cpu->cfg.ext_zfa = true;
> @@ -475,12 +493,16 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>       cpu->cfg.pmp = true;
>   }
>   
> +static const RISCVCPUClassData rv64_veyron_v1_cpu_class_data = {
> +    .misa_mxl_max = MXL_RV64,
> +    .misa_ext_mask = RVG | RVC | RVS | RVU | RVH
> +};
> +
>   static void rv64_veyron_v1_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU | RVH);
>       env->priv_ver = PRIV_VERSION_1_12_0;
>   
>       /* Enable ISA extensions */
> @@ -515,6 +537,10 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>   #endif
>   }
>   
> +static const RISCVCPUClassData rv128_base_cpu_class_data = {
> +    .misa_mxl_max = MXL_RV128
> +};
> +
>   static void rv128_base_cpu_init(Object *obj)
>   {
>       if (qemu_tcg_mttcg_enabled()) {
> @@ -524,8 +550,6 @@ static void rv128_base_cpu_init(Object *obj)
>           exit(EXIT_FAILURE);
>       }
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
> -    /* We set this in the realise function */
> -    set_misa(env, MXL_RV128, 0);
>       riscv_cpu_add_user_properties(obj);
>       /* Set latest version of privileged specification */
>       env->priv_ver = PRIV_VERSION_LATEST;
> @@ -534,11 +558,13 @@ static void rv128_base_cpu_init(Object *obj)
>   #endif
>   }
>   #else
> +static const RISCVCPUClassData rv32_base_cpu_class_data = {
> +    .misa_mxl_max = MXL_RV32
> +};
> +
>   static void rv32_base_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
> -    /* We set this in the realise function */
> -    set_misa(env, MXL_RV32, 0);
>       riscv_cpu_add_user_properties(obj);
>       /* Set latest version of privileged specification */
>       env->priv_ver = PRIV_VERSION_LATEST;
> @@ -547,11 +573,15 @@ static void rv32_base_cpu_init(Object *obj)
>   #endif
>   }
>   
> +static const RISCVCPUClassData rv32_sifive_u_cpu_class_data = {
> +    .misa_mxl_max = MXL_RV32,
> +    .misa_ext_mask = RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU
> +};
> +
>   static void rv32_sifive_u_cpu_init(Object *obj)
>   {
>       RISCVCPU *cpu = RISCV_CPU(obj);
>       CPURISCVState *env = &cpu->env;
> -    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
> @@ -564,12 +594,16 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>       cpu->cfg.pmp = true;
>   }
>   
> +static const RISCVCPUClassData rv32_sifive_e_cpu_class_data = {
> +    .misa_mxl_max = MXL_RV32,
> +    .misa_ext_mask = RVI | RVM | RVA | RVC | RVU
> +};
> +
>   static void rv32_sifive_e_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -581,12 +615,16 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>       cpu->cfg.pmp = true;
>   }
>   
> +static const RISCVCPUClassData rv32_ibex_cpu_class_data = {
> +    .misa_mxl_max = MXL_RV32,
> +    .misa_ext_mask = RVI | RVM | RVC | RVU
> +};
> +
>   static void rv32_ibex_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
>       env->priv_ver = PRIV_VERSION_1_11_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -599,12 +637,16 @@ static void rv32_ibex_cpu_init(Object *obj)
>       cpu->cfg.pmp = true;
>   }
>   
> +static const RISCVCPUClassData rv32_imafcu_nommu_cpu_class_data = {
> +    .misa_mxl_max = MXL_RV32,
> +    .misa_ext_mask = RVI | RVM | RVA | RVF | RVC | RVU
> +};
> +
>   static void rv32_imafcu_nommu_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -618,14 +660,17 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>   #endif
>   
>   #if defined(CONFIG_KVM)
> -static void riscv_host_cpu_init(Object *obj)
> -{
> -    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +static const RISCVCPUClassData riscv_host_cpu_class_data = {
>   #if defined(TARGET_RISCV32)
> -    set_misa(env, MXL_RV32, 0);
> +    .misa_mxl_max = MXL_RV32
>   #elif defined(TARGET_RISCV64)
> -    set_misa(env, MXL_RV64, 0);
> +    .misa_mxl_max = MXL_RV64
>   #endif
> +};
> +
> +static void riscv_host_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
>       riscv_cpu_add_user_properties(obj);
>   }
>   #endif /* CONFIG_KVM */
> @@ -869,7 +914,7 @@ static void riscv_cpu_reset_hold(Object *obj)
>           mcc->parent_phases.hold(obj);
>       }
>   #ifndef CONFIG_USER_ONLY
> -    env->misa_mxl = env->misa_mxl_max;
> +    env->misa_mxl = mcc->misa_mxl_max;
>       env->priv = PRV_M;
>       env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>       if (env->misa_mxl > MXL_RV32) {
> @@ -1049,7 +1094,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>       CPURISCVState *env = &cpu->env;
>   
>       /* Validate that MISA_MXL is set properly. */
> -    switch (env->misa_mxl_max) {
> +    switch (mcc->misa_mxl_max) {
>   #ifdef TARGET_RISCV64
>       case MXL_RV64:
>       case MXL_RV128:
> @@ -1063,7 +1108,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>           g_assert_not_reached();
>       }
>   
> -    if (env->misa_mxl_max != env->misa_mxl) {
> +    if (mcc->misa_mxl_max != env->misa_mxl) {
>           error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
>           return;
>       }
> @@ -1075,6 +1120,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>    */
>   void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>   {
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>       CPURISCVState *env = &cpu->env;
>       Error *local_err = NULL;
>   
> @@ -1089,7 +1135,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           cpu->cfg.ext_ifencei = true;
>   
>           env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
> -        env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
> +        mcc->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
>       }
>   
>       if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
> @@ -1242,7 +1288,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           cpu->cfg.ext_zcb = true;
>           cpu->cfg.ext_zcmp = true;
>           cpu->cfg.ext_zcmt = true;
> -        if (riscv_has_ext(env, RVF) && env->misa_mxl_max == MXL_RV32) {
> +        if (riscv_has_ext(env, RVF) && mcc->misa_mxl_max == MXL_RV32) {
>               cpu->cfg.ext_zcf = true;
>           }
>       }
> @@ -1250,7 +1296,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>       /* zca, zcd and zcf has a PRIV 1.12.0 restriction */
>       if (riscv_has_ext(env, RVC) && env->priv_ver >= PRIV_VERSION_1_12_0) {
>           cpu->cfg.ext_zca = true;
> -        if (riscv_has_ext(env, RVF) && env->misa_mxl_max == MXL_RV32) {
> +        if (riscv_has_ext(env, RVF) && mcc->misa_mxl_max == MXL_RV32) {
>               cpu->cfg.ext_zcf = true;
>           }
>           if (riscv_has_ext(env, RVD)) {
> @@ -1258,7 +1304,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           }
>       }
>   
> -    if (env->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
> +    if (mcc->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
>           error_setg(errp, "Zcf extension is only relevant to RV32");
>           return;
>       }
> @@ -1649,10 +1695,17 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>   
>   static void riscv_cpu_init(Object *obj)
>   {
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(obj);
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    CPURISCVState *env = &cpu->env;
> +
>   #ifndef CONFIG_USER_ONLY
>       qdev_init_gpio_in(DEVICE(obj), riscv_cpu_set_irq,
>                         IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
>   #endif /* CONFIG_USER_ONLY */
> +
> +    env->misa_mxl = mcc->misa_mxl_max;
> +    env->misa_ext = mcc->misa_ext_mask;
>   }
>   
>   typedef struct RISCVCPUMisaExtConfig {
> @@ -1667,6 +1720,7 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>   {
>       const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
>       target_ulong misa_bit = misa_ext_cfg->misa_bit;
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(obj);
>       RISCVCPU *cpu = RISCV_CPU(obj);
>       CPURISCVState *env = &cpu->env;
>       bool value;
> @@ -1677,10 +1731,10 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>   
>       if (value) {
>           env->misa_ext |= misa_bit;
> -        env->misa_ext_mask |= misa_bit;
> +        mcc->misa_ext_mask |= misa_bit;
>       } else {
>           env->misa_ext &= ~misa_bit;
> -        env->misa_ext_mask &= ~misa_bit;
> +        mcc->misa_ext_mask &= ~misa_bit;
>       }
>   }
>   
> @@ -2183,7 +2237,7 @@ static void cpu_get_marchid(Object *obj, Visitor *v, const char *name,
>       visit_type_bool(v, name, &value, errp);
>   }
>   
> -static void riscv_cpu_class_init(ObjectClass *c, void *data)
> +static void riscv_cpu_common_class_init(ObjectClass *c, void *data)
>   {
>       RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
>       CPUClass *cc = CPU_CLASS(c);
> @@ -2226,6 +2280,15 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>       device_class_set_props(dc, riscv_cpu_properties);
>   }
>   
> +static void riscv_cpu_class_init(ObjectClass *c, void *opaque)
> +{
> +    RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> +    const RISCVCPUClassData *data = opaque;
> +
> +    mcc->misa_mxl_max = data->misa_mxl_max;
> +    mcc->misa_ext_mask = data->misa_ext_mask;
> +}
> +
>   static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
>                                    int max_str_len)
>   {
> @@ -2291,18 +2354,22 @@ void riscv_cpu_list(void)
>       g_slist_free(list);
>   }
>   
> -#define DEFINE_CPU(type_name, initfn)      \
> -    {                                      \
> -        .name = type_name,                 \
> -        .parent = TYPE_RISCV_CPU,          \
> -        .instance_init = initfn            \
> +#define DEFINE_CPU(type_name, class_data_value, initfn)         \
> +    {                                                           \
> +        .name = (type_name),                                    \
> +        .parent = TYPE_RISCV_CPU,                               \
> +        .instance_init = (initfn),                              \
> +        .class_init = riscv_cpu_class_init,                     \
> +        .class_data = (void *)&(class_data_value)               \
>       }
>   
> -#define DEFINE_DYNAMIC_CPU(type_name, initfn) \
> -    {                                         \
> -        .name = type_name,                    \
> -        .parent = TYPE_RISCV_DYNAMIC_CPU,     \
> -        .instance_init = initfn               \
> +#define DEFINE_DYNAMIC_CPU(type_name, class_data_value, initfn) \
> +    {                                                           \
> +        .name = (type_name),                                    \
> +        .parent = TYPE_RISCV_DYNAMIC_CPU,                       \
> +        .instance_init = (initfn),                              \
> +        .class_init = riscv_cpu_class_init,                     \
> +        .class_data = (void *)&(class_data_value)               \
>       }
>   
>   static const TypeInfo riscv_cpu_type_infos[] = {
> @@ -2314,31 +2381,46 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>           .instance_init = riscv_cpu_init,
>           .abstract = true,
>           .class_size = sizeof(RISCVCPUClass),
> -        .class_init = riscv_cpu_class_init,
> +        .class_init = riscv_cpu_common_class_init,
>       },
>       {
>           .name = TYPE_RISCV_DYNAMIC_CPU,
>           .parent = TYPE_RISCV_CPU,
>           .abstract = true,
>       },
> -    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,
> +                       riscv_any_cpu_class_data, riscv_any_cpu_init),
>   #if defined(CONFIG_KVM)
> -    DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_HOST,
> +               &riscv_host_cpu_class_data, riscv_host_cpu_init),
>   #endif
>   #if defined(TARGET_RISCV32)
> -    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE32,   rv32_base_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE32,
> +                       rv32_base_cpu_class_data,
> +                       rv32_base_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_IBEX,
> +               rv32_ibex_cpu_class_data, rv32_ibex_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,
> +               rv32_sifive_e_cpu_class_data, rv32_sifive_e_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,
> +               rv32_imafcu_nommu_cpu_class_data, rv32_imafcu_nommu_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,
> +               rv32_sifive_u_cpu_class_data, rv32_sifive_u_cpu_init),
>   #elif defined(TARGET_RISCV64)
> -    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE64,   rv64_base_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_VEYRON_V1,        rv64_veyron_v1_cpu_init),
> -    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE64,
> +                       rv64_base_cpu_class_data, rv64_base_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,
> +               rv64_sifive_e_cpu_class_data, rv64_sifive_e_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,
> +               rv64_sifive_u_cpu_class_data, rv64_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,
> +               rv64_sifive_u_cpu_class_data, rv64_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,
> +               rv64_thead_c906_cpu_class_data, rv64_thead_c906_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_VEYRON_V1,
> +               rv64_veyron_v1_cpu_class_data, rv64_veyron_v1_cpu_init),
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,
> +                       rv128_base_cpu_class_data, rv128_base_cpu_init),
>   #endif
>   };
>   
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 85a31dc420..56953fbafe 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1393,6 +1393,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>   {
>       RISCVCPU *cpu = env_archcpu(env);
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>       uint32_t orig_misa_ext = env->misa_ext;
>       Error *local_err = NULL;
>   
> @@ -1402,7 +1403,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>       }
>   
>       /* Mask extensions that are not supported by this hart */
> -    val &= env->misa_ext_mask;
> +    val &= mcc->misa_ext_mask;
>   
>       /*
>        * Suppress 'C' if next instruction is not aligned
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 524bede865..b9528cef5b 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -49,6 +49,7 @@ static const struct TypeSize vec_lanes[] = {
>   
>   int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>   {
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       CPURISCVState *env = &cpu->env;
>       target_ulong tmp;
> @@ -61,7 +62,7 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>           return 0;
>       }
>   
> -    switch (env->misa_mxl_max) {
> +    switch (mcc->misa_mxl_max) {
>       case MXL_RV32:
>           return gdb_get_reg32(mem_buf, tmp);
>       case MXL_RV64:
> @@ -75,12 +76,13 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>   
>   int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>   {
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       CPURISCVState *env = &cpu->env;
>       int length = 0;
>       target_ulong tmp;
>   
> -    switch (env->misa_mxl_max) {
> +    switch (mcc->misa_mxl_max) {
>       case MXL_RV32:
>           tmp = (int32_t)ldl_p(mem_buf);
>           length = 4;
> @@ -214,11 +216,12 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
>   
>   static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
>   {
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       CPURISCVState *env = &cpu->env;
>       GString *s = g_string_new(NULL);
>       riscv_csr_predicate_fn predicate;
> -    int bitsize = 16 << env->misa_mxl_max;
> +    int bitsize = 16 << mcc->misa_mxl_max;
>       int i;
>   
>   #if !defined(CONFIG_USER_ONLY)
> @@ -310,6 +313,7 @@ static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
>   
>   void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>   {
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       CPURISCVState *env = &cpu->env;
>       if (env->misa_ext & RVD) {
> @@ -326,7 +330,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>                                    ricsv_gen_dynamic_vector_xml(cs, base_reg),
>                                    "riscv-vector.xml", 0);
>       }
> -    switch (env->misa_mxl_max) {
> +    switch (mcc->misa_mxl_max) {
>       case MXL_RV32:
>           gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
>                                    riscv_gdb_set_virtual,
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index c7c862cdd3..744fca0999 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -175,10 +175,9 @@ static const VMStateDescription vmstate_pointermasking = {
>   
>   static bool rv128_needed(void *opaque)
>   {
> -    RISCVCPU *cpu = opaque;
> -    CPURISCVState *env = &cpu->env;
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(opaque);
>   
> -    return env->misa_mxl_max == MXL_RV128;
> +    return mcc->misa_mxl_max == MXL_RV128;
>   }
>   
>   static const VMStateDescription vmstate_rv128 = {
> @@ -351,7 +350,7 @@ static const VMStateDescription vmstate_jvt = {
>   
>   const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
> -    .version_id = 8,
> +    .version_id = 9,
>       .minimum_version_id = 8,
>       .post_load = riscv_cpu_post_load,
>       .fields = (VMStateField[]) {
> @@ -369,8 +368,8 @@ const VMStateDescription vmstate_riscv_cpu = {
>           VMSTATE_UINTTL(env.vext_ver, RISCVCPU),
>           VMSTATE_UINT32(env.misa_mxl, RISCVCPU),
>           VMSTATE_UINT32(env.misa_ext, RISCVCPU),
> -        VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
> -        VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
> +        VMSTATE_UNUSED(4),
> +        VMSTATE_UNUSED(4),
>           VMSTATE_UINTTL(env.priv, RISCVCPU),
>           VMSTATE_BOOL(env.virt_enabled, RISCVCPU),
>           VMSTATE_UINT64(env.resetvec, RISCVCPU),
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f0be79bb16..7e383c5eeb 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1167,6 +1167,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>   {
>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>       CPURISCVState *env = cpu_env(cs);
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       uint32_t tb_flags = ctx->base.tb->flags;
>   
> @@ -1188,7 +1189,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->cfg_vta_all_1s = cpu->cfg.rvv_ta_all_1s;
>       ctx->vstart_eq_zero = FIELD_EX32(tb_flags, TB_FLAGS, VSTART_EQ_ZERO);
>       ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
> -    ctx->misa_mxl_max = env->misa_mxl_max;
> +    ctx->misa_mxl_max = mcc->misa_mxl_max;
>       ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
>       ctx->address_xl = FIELD_EX32(tb_flags, TB_FLAGS, AXL);
>       ctx->cs = cs;

