Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A2FCDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 17:48:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrMGf-0000VS-Tr; Fri, 13 Oct 2023 13:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qrMGb-0000TU-SV
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 13:48:05 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qrMGZ-000450-5K
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 13:48:05 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6b7f0170d7bso200733b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 10:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697219281; x=1697824081; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V4KofuHcQa354rXXOqC4YtS37wRpgnHP5xD+nX7tgBg=;
 b=l7lrJ629qRUNJY8IUVzSnCsJWN2Yd5/wv7mbwsj5Uhjik4TbFsPpN9zmbZv3UY1Zka
 L7mCxznw/Z4hzg40fFjrdenbYeriMisqLPmtD7G1omXHM4wqw/pBoZZ9eo0mh/L2INCB
 X6GrdreKvHQ8tBlTUaasvVO5X/J7XtBGMEVGeGjgGYKquc/7S1MJovV5an2FZpWHCpvC
 Z+81x1k7ZG2O2sGKslfUag0vlQV5Dw+cl9A5kTrivuXJGVbblPkf9lGZx6HbJBVRYFLe
 1tqmtW4A0TtWDg6NCvO3o/cwrJorf+2w7BN89aFKqIw69AAGs9AmyFwCempXQYrdR9m/
 gyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697219281; x=1697824081;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V4KofuHcQa354rXXOqC4YtS37wRpgnHP5xD+nX7tgBg=;
 b=EdISJFycxsrXJuK1KL2ZC4sximspjIw4ZIGGIZpQLoogo/vlHPlZ45aKJOPDqq6cVn
 AzAXkCTAh5AARu51C6vlwMpUZhma0Ok1GwYFB3BxGuzlyZo2dZJ6q53ayNPY9IGYM8Ha
 e9XeI1FBVs/LWlA+3X8jJoERYTL7J4FsDXF7FBVifZjiP2tddD3hUSir5KLjgTs5OJg9
 xDs8jhJ5/lnguKo2b/ErwYv0CB3LTfj04sX39EdMWpgtoRuIfUOMyvlWFqbpBeNeMXuN
 +rBV7aJFbeJaDCwMUpQaOnQ8+TeNiWRbdEgdcbZcCHJoVO9g6NyoSprMQErJk9hvTYlr
 TFMw==
X-Gm-Message-State: AOJu0YzMBamuIe5kXclf2pQ8JlfBSB7r5egFLINcSJcb0LpSUcbSsxat
 ffOa/fi/cTW7OzwIKmRlSeqLag==
X-Google-Smtp-Source: AGHT+IHD6/Mr2O4WO7Q0enTsRcASvFR6RWzpFxk0tH8CxiL40iR3luR8GjZRyhLtsnbCMj4+gzu0cA==
X-Received: by 2002:a05:6a00:1255:b0:68a:5449:7436 with SMTP id
 u21-20020a056a00125500b0068a54497436mr30418157pfi.32.1697219280936; 
 Fri, 13 Oct 2023 10:48:00 -0700 (PDT)
Received: from [192.168.68.107] ([177.94.42.196])
 by smtp.gmail.com with ESMTPSA id
 q27-20020aa7843b000000b00692cb1224casm1360301pfn.183.2023.10.13.10.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Oct 2023 10:48:00 -0700 (PDT)
Message-ID: <6959edb6-d054-4484-aa2c-35a4b29c2b8a@ventanamicro.com>
Date: Fri, 13 Oct 2023 14:47:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] target/riscv: Move misa_mxl_max to class
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
References: <20231012054223.37870-1-akihiko.odaki@daynix.com>
 <20231012054223.37870-3-akihiko.odaki@daynix.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231012054223.37870-3-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x436.google.com
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



On 10/12/23 02:42, Akihiko Odaki wrote:
> misa_mxl_max is common for all instances of a RISC-V CPU class so they
> are better put into class.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---

I see where you're coming from but I'm not sure about the end result. Most of the
code turned up to be the same thing but with an extra cast to fetch misa_mxl_max
from the CPUClass. And you ended up having to add extra data to the class init
because a TARGET_RISCV64 CPU can have MXL64 or MXL128.


IIUC you don't need this patch for what you want to accomplish (init gdb_core_xml_file
in init() time instead of realize() time). We have a case in x86_64 where gdb_core is set
by checking a TARGET ifdef in its class init:


(target/i386/cpu.c, x86_cpu_common_class_init())

#ifdef TARGET_X86_64
     cc->gdb_core_xml_file = "i386-64bit.xml";
     cc->gdb_num_core_regs = 66;
#else
     cc->gdb_core_xml_file = "i386-32bit.xml";
     cc->gdb_num_core_regs = 50;
#endif


You can just do the same with riscv_cpu_class_init() by just copy/pasting what's left
of riscv_cpu_validate_misa_mxl():

     switch (env->misa_mxl_max) {
#ifdef TARGET_RISCV64
     case MXL_RV64:
     case MXL_RV128:
         cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
         break;
#endif
     case MXL_RV32:
         cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
         break;
     default:
         g_assert_not_reached();
     }


Note that env->misa_mxl_max doesn't matter - the gdb core file only cares about the target
type, and we do not have any cases where we have env->misa_mxl_max = MXL_RV32 with TARGET_RISCV64
or env->misa_mxl_max = MXL_RV64 with TARGET_RISCV32, so this can be shortened to:

#ifdef TARGET_RISCV64
         cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
#else
         cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
#endif



You can then remove riscv_cpu_validate_misa_mxl().



Thanks,


Daniel



>   target/riscv/cpu-qom.h   |   1 +
>   target/riscv/cpu.h       |   1 -
>   hw/riscv/boot.c          |   2 +-
>   target/riscv/cpu.c       | 127 +++++++++++++++++++--------------------
>   target/riscv/gdbstub.c   |  12 ++--
>   target/riscv/machine.c   |   7 +--
>   target/riscv/translate.c |   3 +-
>   7 files changed, 76 insertions(+), 77 deletions(-)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 04af50983e..fac36fa15b 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -67,5 +67,6 @@ struct RISCVCPUClass {
>       /*< public >*/
>       DeviceRealize parent_realize;
>       ResettablePhases parent_phases;
> +    uint32_t misa_mxl_max;  /* max mxl for this cpu */
>   };
>   #endif /* RISCV_CPU_QOM_H */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ef9cf21c0c..83f48f9e7e 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -155,7 +155,6 @@ struct CPUArchState {
>   
>       /* RISCVMXL, but uint32_t for vmstate migration */
>       uint32_t misa_mxl;      /* current mxl */
> -    uint32_t misa_mxl_max;  /* max mxl for this cpu */
>       uint32_t misa_ext;      /* current extensions */
>       uint32_t misa_ext_mask; /* max ext for this cpu */
>       uint32_t xl;            /* current xlen */
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
> index 550b357fb7..48983e8467 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -271,9 +271,8 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>       }
>   }
>   
> -static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
> +static void set_misa_ext(CPURISCVState *env, uint32_t ext)
>   {
> -    env->misa_mxl_max = env->misa_mxl = mxl;
>       env->misa_ext_mask = env->misa_ext = ext;
>   }
>   
> @@ -375,11 +374,7 @@ static void riscv_any_cpu_init(Object *obj)
>   {
>       RISCVCPU *cpu = RISCV_CPU(obj);
>       CPURISCVState *env = &cpu->env;
> -#if defined(TARGET_RISCV32)
> -    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> -#elif defined(TARGET_RISCV64)
> -    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> -#endif
> +    set_misa_ext(env, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
>   
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj),
> @@ -400,8 +395,6 @@ static void riscv_any_cpu_init(Object *obj)
>   static void rv64_base_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
> -    /* We set this in the realise function */
> -    set_misa(env, MXL_RV64, 0);
>       riscv_cpu_add_user_properties(obj);
>       /* Set latest version of privileged specification */
>       env->priv_ver = PRIV_VERSION_LATEST;
> @@ -414,7 +407,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>   {
>       RISCVCPU *cpu = RISCV_CPU(obj);
>       CPURISCVState *env = &cpu->env;
> -    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    set_misa_ext(env, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
> @@ -432,7 +425,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
> +    set_misa_ext(env, RVI | RVM | RVA | RVC | RVU);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -449,7 +442,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
> +    set_misa_ext(env, RVG | RVC | RVS | RVU);
>       env->priv_ver = PRIV_VERSION_1_11_0;
>   
>       cpu->cfg.ext_zfa = true;
> @@ -480,7 +473,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU | RVH);
> +    set_misa_ext(env, RVG | RVC | RVS | RVU | RVH);
>       env->priv_ver = PRIV_VERSION_1_12_0;
>   
>       /* Enable ISA extensions */
> @@ -524,8 +517,6 @@ static void rv128_base_cpu_init(Object *obj)
>           exit(EXIT_FAILURE);
>       }
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
> -    /* We set this in the realise function */
> -    set_misa(env, MXL_RV128, 0);
>       riscv_cpu_add_user_properties(obj);
>       /* Set latest version of privileged specification */
>       env->priv_ver = PRIV_VERSION_LATEST;
> @@ -537,8 +528,6 @@ static void rv128_base_cpu_init(Object *obj)
>   static void rv32_base_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
> -    /* We set this in the realise function */
> -    set_misa(env, MXL_RV32, 0);
>       riscv_cpu_add_user_properties(obj);
>       /* Set latest version of privileged specification */
>       env->priv_ver = PRIV_VERSION_LATEST;
> @@ -551,7 +540,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>   {
>       RISCVCPU *cpu = RISCV_CPU(obj);
>       CPURISCVState *env = &cpu->env;
> -    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    set_misa_ext(env, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
> @@ -569,7 +558,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
> +    set_misa_ext(env, RVI | RVM | RVA | RVC | RVU);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -586,7 +575,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
> +    set_misa_ext(env, RVI | RVM | RVC | RVU);
>       env->priv_ver = PRIV_VERSION_1_11_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -604,7 +593,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       RISCVCPU *cpu = RISCV_CPU(obj);
>   
> -    set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
> +    set_misa_ext(env, RVI | RVM | RVA | RVF | RVC | RVU);
>       env->priv_ver = PRIV_VERSION_1_10_0;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> @@ -617,19 +606,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>   }
>   #endif
>   
> -#if defined(CONFIG_KVM)
> -static void riscv_host_cpu_init(Object *obj)
> -{
> -    CPURISCVState *env = &RISCV_CPU(obj)->env;
> -#if defined(TARGET_RISCV32)
> -    set_misa(env, MXL_RV32, 0);
> -#elif defined(TARGET_RISCV64)
> -    set_misa(env, MXL_RV64, 0);
> -#endif
> -    riscv_cpu_add_user_properties(obj);
> -}
> -#endif /* CONFIG_KVM */
> -
>   static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
>   {
>       ObjectClass *oc;
> @@ -868,8 +844,8 @@ static void riscv_cpu_reset_hold(Object *obj)
>       if (mcc->parent_phases.hold) {
>           mcc->parent_phases.hold(obj);
>       }
> +    env->misa_mxl = mcc->misa_mxl_max;
>   #ifndef CONFIG_USER_ONLY
> -    env->misa_mxl = env->misa_mxl_max;
>       env->priv = PRV_M;
>       env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>       if (env->misa_mxl > MXL_RV32) {
> @@ -1046,10 +1022,9 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
>   {
>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>       CPUClass *cc = CPU_CLASS(mcc);
> -    CPURISCVState *env = &cpu->env;
>   
>       /* Validate that MISA_MXL is set properly. */
> -    switch (env->misa_mxl_max) {
> +    switch (mcc->misa_mxl_max) {
>   #ifdef TARGET_RISCV64
>       case MXL_RV64:
>       case MXL_RV128:
> @@ -1070,6 +1045,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
>    */
>   void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>   {
> +    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>       CPURISCVState *env = &cpu->env;
>       Error *local_err = NULL;
>   
> @@ -1237,7 +1213,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           cpu->cfg.ext_zcb = true;
>           cpu->cfg.ext_zcmp = true;
>           cpu->cfg.ext_zcmt = true;
> -        if (riscv_has_ext(env, RVF) && env->misa_mxl_max == MXL_RV32) {
> +        if (riscv_has_ext(env, RVF) && mcc->misa_mxl_max == MXL_RV32) {
>               cpu->cfg.ext_zcf = true;
>           }
>       }
> @@ -1245,7 +1221,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>       /* zca, zcd and zcf has a PRIV 1.12.0 restriction */
>       if (riscv_has_ext(env, RVC) && env->priv_ver >= PRIV_VERSION_1_12_0) {
>           cpu->cfg.ext_zca = true;
> -        if (riscv_has_ext(env, RVF) && env->misa_mxl_max == MXL_RV32) {
> +        if (riscv_has_ext(env, RVF) && mcc->misa_mxl_max == MXL_RV32) {
>               cpu->cfg.ext_zcf = true;
>           }
>           if (riscv_has_ext(env, RVD)) {
> @@ -1253,7 +1229,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           }
>       }
>   
> -    if (env->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
> +    if (mcc->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
>           error_setg(errp, "Zcf extension is only relevant to RV32");
>           return;
>       }
> @@ -2174,7 +2150,7 @@ static void cpu_get_marchid(Object *obj, Visitor *v, const char *name,
>       visit_type_bool(v, name, &value, errp);
>   }
>   
> -static void riscv_cpu_class_init(ObjectClass *c, void *data)
> +static void riscv_cpu_common_class_init(ObjectClass *c, void *data)
>   {
>       RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
>       CPUClass *cc = CPU_CLASS(c);
> @@ -2217,6 +2193,13 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>       device_class_set_props(dc, riscv_cpu_properties);
>   }
>   
> +static void riscv_cpu_class_init(ObjectClass *c, void *data)
> +{
> +    RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> +
> +    mcc->misa_mxl_max = (uint32_t)(uintptr_t)data;
> +}
> +
>   static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
>                                    int max_str_len)
>   {
> @@ -2282,18 +2265,22 @@ void riscv_cpu_list(void)
>       g_slist_free(list);
>   }
>   
> -#define DEFINE_CPU(type_name, initfn)      \
> -    {                                      \
> -        .name = type_name,                 \
> -        .parent = TYPE_RISCV_CPU,          \
> -        .instance_init = initfn            \
> +#define DEFINE_CPU(type_name, misa_mxl_max, initfn)         \
> +    {                                                       \
> +        .name = (type_name),                                \
> +        .parent = TYPE_RISCV_CPU,                           \
> +        .instance_init = (initfn),                          \
> +        .class_init = riscv_cpu_class_init,                 \
> +        .class_data = (void *)(misa_mxl_max)                \
>       }
>   
> -#define DEFINE_DYNAMIC_CPU(type_name, initfn) \
> -    {                                         \
> -        .name = type_name,                    \
> -        .parent = TYPE_RISCV_DYNAMIC_CPU,     \
> -        .instance_init = initfn               \
> +#define DEFINE_DYNAMIC_CPU(type_name, misa_mxl_max, initfn) \
> +    {                                                       \
> +        .name = (type_name),                                \
> +        .parent = TYPE_RISCV_DYNAMIC_CPU,                   \
> +        .instance_init = (initfn),                          \
> +        .class_init = riscv_cpu_class_init,                 \
> +        .class_data = (void *)(misa_mxl_max)                \
>       }
>   
>   static const TypeInfo riscv_cpu_type_infos[] = {
> @@ -2305,31 +2292,39 @@ static const TypeInfo riscv_cpu_type_infos[] = {
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
> +#if defined(TARGET_RISCV32)
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,     MXL_RV32,  riscv_any_cpu_init),
> +#elif defined(TARGET_RISCV64)
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,     MXL_RV64,  riscv_any_cpu_init),
> +#endif
>   #if defined(CONFIG_KVM)
> -    DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
> +#if defined(TARGET_RISCV32)
> +    DEFINE_CPU(TYPE_RISCV_CPU_HOST,            MXL_RV32,  riscv_cpu_add_user_properties),
> +#elif defined(TARGET_RISCV64)
> +    DEFINE_CPU(TYPE_RISCV_CPU_HOST,            MXL_RV64,  riscv_cpu_add_user_properties),
> +#endif
>   #endif
>   #if defined(TARGET_RISCV32)
> -    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE32,   rv32_base_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE32,  MXL_RV32,  rv32_base_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_IBEX,            MXL_RV32,  rv32_ibex_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,      MXL_RV32,  rv32_sifive_e_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,      MXL_RV32,  rv32_imafcu_nommu_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,      MXL_RV32,  rv32_sifive_u_cpu_init),
>   #elif defined(TARGET_RISCV64)
> -    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE64,   rv64_base_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
> -    DEFINE_CPU(TYPE_RISCV_CPU_VEYRON_V1,        rv64_veyron_v1_cpu_init),
> -    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE64,  MXL_RV64,  rv64_base_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,      MXL_RV64,  rv64_sifive_e_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,      MXL_RV64,  rv64_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,        MXL_RV64,  rv64_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,      MXL_RV64,  rv64_thead_c906_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_VEYRON_V1,       MXL_RV64,  rv64_veyron_v1_cpu_init),
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128, MXL_RV128, rv128_base_cpu_init),
>   #endif
>   };
>   
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
> index c7c862cdd3..c7124a068c 100644
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
> @@ -369,7 +368,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>           VMSTATE_UINTTL(env.vext_ver, RISCVCPU),
>           VMSTATE_UINT32(env.misa_mxl, RISCVCPU),
>           VMSTATE_UINT32(env.misa_ext, RISCVCPU),
> -        VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
> +        VMSTATE_UNUSED(4),
>           VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
>           VMSTATE_UINTTL(env.priv, RISCVCPU),
>           VMSTATE_BOOL(env.virt_enabled, RISCVCPU),
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

