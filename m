Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB55C7EE29
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 12:30:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2A6Q-0005tj-BJ; Thu, 25 May 2023 08:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q2A6O-0005ta-KI
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 08:29:56 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q2A6M-0004ko-JW
 for qemu-riscv@nongnu.org; Thu, 25 May 2023 08:29:56 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-19a08412723so1265748fac.0
 for <qemu-riscv@nongnu.org>; Thu, 25 May 2023 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685017792; x=1687609792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FZzTO1U3wqlOBGcVrtABYlO+nlrjTrEivEuMXo7EUc4=;
 b=PldSD8feqR64HuWsbepZdLg2tKBy1hjcvUUw/8LaMPed6fj8660EvxexWxShrFJSAz
 2z7WkJu3HlmEjA+xrakH163r9rmnGXvl95iydO3Q7GvwF05ElvJ1qWYqQJuIlg8iqqMs
 USvMPaFXfB5jPnUUzrO3HY7lmlbhsec6YgBGL8O+fIiAZ0hyXvdYoGHeZaLCbgqHFIIs
 G+KQSScYTyXs+jJPr+F4UcKV6nP6JBQPuv6ZaMxUBA87s6pjaGP+EIl6I4390DAw0BDo
 VfoPcfauvfxkvWYhROuvYibVUgawuGExo3VMsjA1/ToMNAEuXsXUgmkfiNby5o6cQs/r
 g+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685017792; x=1687609792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FZzTO1U3wqlOBGcVrtABYlO+nlrjTrEivEuMXo7EUc4=;
 b=Oe6npNEho7tLMzM9X/HVMGWUZ39qwEK8eeD1RDf3c4rS5pxVgYN6EhDTveVJQy3HgU
 wj7HNiKn/FwCRyAKCo3gFN4fmDKbKwaMOJwJD7ZifCbnLuCW9chRrRFChpsbuhdhkCof
 NcBbT3ISvzNoIoNzKb7ZXhTtglf16eL0ZbpAVrJDcVQyK0Zae6SBRU0tgTYR+5m3URvk
 KGG4urIzJdBrKQMaoiMM7/hLcFX+uJU3uTeR8WwsKRpd8S8+e+h0FjvcPDZFhDq5UWf3
 DMx911C2aNAok8RyZdZ4jYwSazuStFmjr6VbIxQcmAIDVYXSjeALlejqMLFphzwrrghR
 yB0w==
X-Gm-Message-State: AC+VfDxW5o/g+7zOLxDApPJMN22ED72Sk3epYVN+r4jVem5q1zsYg2Ld
 nZZixp8KfeIoREjOzCQmo12SnQ==
X-Google-Smtp-Source: ACHHUZ4EGoko/yK+kiQ60/qESdGa9t5OpdpxpKuwyPyLch/fvv2A67SfyjQRxzTk+Hc64qx6eGMvtQ==
X-Received: by 2002:a05:6870:b7af:b0:196:5925:24cc with SMTP id
 ed47-20020a056870b7af00b00196592524ccmr1629404oab.21.1685017792684; 
 Thu, 25 May 2023 05:29:52 -0700 (PDT)
Received: from [192.168.68.107] (200-162-225-121.static-corp.ajato.com.br.
 [200.162.225.121]) by smtp.gmail.com with ESMTPSA id
 m22-20020a056870a41600b0017703cd8ff6sm581464oal.7.2023.05.25.05.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 05:29:52 -0700 (PDT)
Message-ID: <ce8f000c-30d7-f4f8-76af-575388569d38@ventanamicro.com>
Date: Thu, 25 May 2023 09:29:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/4] target/riscv: Add Smrnmi cpu extension.
Content-Language: en-US
To: Tommy Wu <tommy.wu@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org
References: <20230522131123.3498539-1-tommy.wu@sifive.com>
 <20230522131123.3498539-2-tommy.wu@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230522131123.3498539-2-tommy.wu@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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



On 5/22/23 10:11, Tommy Wu wrote:
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> ---
>   hw/riscv/riscv_hart.c         | 21 +++++++++++++++++++++
>   include/hw/riscv/riscv_hart.h |  4 ++++
>   target/riscv/cpu.c            | 14 ++++++++++++++
>   target/riscv/cpu.h            |  7 +++++++
>   target/riscv/cpu_bits.h       | 12 ++++++++++++
>   target/riscv/cpu_helper.c     | 24 ++++++++++++++++++++++++
>   6 files changed, 82 insertions(+)
> 
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index 613ea2aaa0..eac18f8c29 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -33,6 +33,12 @@ static Property riscv_harts_props[] = {
>       DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
>       DEFINE_PROP_UINT64("resetvec", RISCVHartArrayState, resetvec,
>                          DEFAULT_RSTVEC),
> +    DEFINE_PROP_ARRAY("rnmi-interrupt-vector", RISCVHartArrayState,
> +                      num_rnmi_irqvec, rnmi_irqvec, qdev_prop_uint64,
> +                      uint64_t),
> +    DEFINE_PROP_ARRAY("rnmi-exception-vector", RISCVHartArrayState,
> +                      num_rnmi_excpvec, rnmi_excpvec, qdev_prop_uint64,
> +                      uint64_t),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> @@ -47,6 +53,21 @@ static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
>   {
>       object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cpu_type);
>       qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
> +
> +    if (s->harts[idx].cfg.ext_smrnmi) {
> +        if (s->rnmi_irqvec) {
> +            qdev_prop_set_uint64(DEVICE(&s->harts[idx]),
> +                                 "rnmi-interrupt-vector",
> +                                 s->rnmi_irqvec[idx]);
> +        }
> +
> +        if (s->rnmi_excpvec) {
> +            qdev_prop_set_uint64(DEVICE(&s->harts[idx]),
> +                                 "rnmi-exception-vector",
> +                                 s->rnmi_excpvec[idx]);
> +        }
> +    }
> +
>       s->harts[idx].env.mhartid = s->hartid_base + idx;
>       qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
>       return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
> diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
> index bbc21cdc9a..99c0ac5009 100644
> --- a/include/hw/riscv/riscv_hart.h
> +++ b/include/hw/riscv/riscv_hart.h
> @@ -38,6 +38,10 @@ struct RISCVHartArrayState {
>       uint32_t hartid_base;
>       char *cpu_type;
>       uint64_t resetvec;
> +    uint32_t num_rnmi_irqvec;
> +    uint64_t *rnmi_irqvec;
> +    uint32_t num_rnmi_excpvec;
> +    uint64_t *rnmi_excpvec;
>       RISCVCPU *harts;
>   };
>   
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db0875fb43..39b74569b1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -119,6 +119,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
>       ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
>       ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
> +    ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smrnmi),
>       ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
>       ISA_EXT_DATA_ENTRY(sscofpmf, PRIV_VERSION_1_12_0, ext_sscofpmf),
>       ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
> @@ -1404,6 +1405,12 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>           g_assert_not_reached();
>       }
>   }
> +
> +static void riscv_cpu_set_nmi(void *opaque, int irq, int level)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(opaque);
> +    riscv_cpu_set_rnmi(cpu, irq, level);

Minor commennt/nit: you can do:

> +    riscv_cpu_set_rnmi(RISCV_CPU(opaque), irq, level);

And avoid the extra 'cpu' pointer.


> +}
>   #endif /* CONFIG_USER_ONLY */
>   
>   static void riscv_cpu_init(Object *obj)
> @@ -1420,6 +1427,8 @@ static void riscv_cpu_init(Object *obj)
>   #ifndef CONFIG_USER_ONLY
>       qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
>                         IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
> +    qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_nmi,
> +                            "riscv.cpu.rnmi", RNMI_MAX);
>   #endif /* CONFIG_USER_ONLY */
>   }
>   
> @@ -1600,6 +1609,7 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>       DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
>       DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
> +    DEFINE_PROP_BOOL("x-smrnmi", RISCVCPU, cfg.ext_smrnmi, false),
>   
>       DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
>       DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
> @@ -1644,6 +1654,10 @@ static Property riscv_cpu_properties[] = {
>   
>       DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>       DEFINE_PROP_BOOL("rvv_ma_all_1s", RISCVCPU, cfg.rvv_ma_all_1s, false),
> +    DEFINE_PROP_UINT64("rnmi-interrupt-vector", RISCVCPU, env.rnmi_irqvec,
> +                       DEFAULT_RNMI_IRQVEC),
> +    DEFINE_PROP_UINT64("rnmi-exception-vector", RISCVCPU, env.rnmi_excpvec,
> +                       DEFAULT_RNMI_EXCPVEC),
>   
>       /*
>        * write_misa() is marked as experimental for now so mark
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index de7e43126a..6c14b93cb5 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -366,6 +366,11 @@ struct CPUArchState {
>       uint64_t kvm_timer_compare;
>       uint64_t kvm_timer_state;
>       uint64_t kvm_timer_frequency;
> +
> +    /* RNMI */
> +    target_ulong rnmip;
> +    uint64_t rnmi_irqvec;
> +    uint64_t rnmi_excpvec;
>   };
>   
>   /*
> @@ -436,6 +441,7 @@ struct RISCVCPUConfig {
>       bool ext_smaia;
>       bool ext_ssaia;
>       bool ext_sscofpmf;
> +    bool ext_smrnmi;
>       bool rvv_ta_all_1s;
>       bool rvv_ma_all_1s;
>   
> @@ -562,6 +568,7 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
>   int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
>   uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
>                                 uint64_t value);
> +void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level);
>   #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
>   void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
>                                void *arg);
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 59f0ffd9e1..7cb43b88f3 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -659,6 +659,12 @@ typedef enum {
>   /* Default Reset Vector adress */
>   #define DEFAULT_RSTVEC      0x1000
>   
> +/* Default RNMI Interrupt Vector address */
> +#define DEFAULT_RNMI_IRQVEC     0x0
> +
> +/* Default RNMI Exception Vector address */
> +#define DEFAULT_RNMI_EXCPVEC    0x0
> +
>   /* Exception causes */
>   typedef enum RISCVException {
>       RISCV_EXCP_NONE = -1, /* sentinel value */
> @@ -705,6 +711,9 @@ typedef enum RISCVException {
>   #define IRQ_LOCAL_MAX                      16
>   #define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
>   
> +/* RNMI causes */
> +#define RNMI_MAX                           16
> +
>   /* mip masks */
>   #define MIP_USIP                           (1 << IRQ_U_SOFT)
>   #define MIP_SSIP                           (1 << IRQ_S_SOFT)
> @@ -896,6 +905,9 @@ typedef enum RISCVException {
>   #define MHPMEVENT_IDX_MASK                 0xFFFFF
>   #define MHPMEVENT_SSCOF_RESVD              16
>   
> +/* RISC-V-specific interrupt pending bits. */
> +#define CPU_INTERRUPT_RNMI                 CPU_INTERRUPT_TGT_EXT_0
> +
>   /* JVT CSR bits */
>   #define JVT_MODE                           0x3F
>   #define JVT_BASE                           (~0x3F)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 57d04385f1..cc7898f103 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -635,6 +635,30 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
>       return old;
>   }
>   
> +void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    CPUState *cs = CPU(cpu);
> +    bool locked = false;
> +
> +    if (!qemu_mutex_iothread_locked()) {
> +        locked = true;
> +        qemu_mutex_lock_iothread();
> +    }
> +
> +    if (level) {
> +        env->rnmip |= 1 << irq;
> +        cpu_interrupt(cs, CPU_INTERRUPT_RNMI);
> +    } else {
> +        env->rnmip &= ~(1 << irq);
> +        cpu_reset_interrupt(cs, CPU_INTERRUPT_RNMI);
> +    }
> +
> +    if (locked) {
> +        qemu_mutex_unlock_iothread();
> +    }


'locked' is not a good named for this flag because you guaranteed that the iothread
will always be locked at this point. Questions is whether you locked it yourself,
and then you need to unlock it, or if it was locked beforehand.

I suggest renaming 'locked' to 'release_lock' for clarity. Asumming you agree:


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>





> +}
> +
>   void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
>                                void *arg)
>   {

