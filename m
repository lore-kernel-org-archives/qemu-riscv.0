Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB1DC369A2
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 12:47:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u28Mh-00018d-BP; Tue, 08 Apr 2025 08:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u28ME-00011E-FR
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 08:47:15 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u28MC-0003zI-C2
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 08:47:14 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2ff784dc055so4715819a91.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Apr 2025 05:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1744116431; x=1744721231; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2jyEjUczCl288qDvZdNk4E8asZPYbS2X3MgLKF8uC6g=;
 b=EYKsSGILeCcYg/7iiXAzQ0er9tdjzNtaVVkn+Hh1rGEph0HpzmV5jCqLTbxLryIPt/
 0Y1vSN7FzMhZ5xJ6tWGIpHDnWxPUAt+9sE9c8j2/KIS/jBHuRuDOXnNTS2MEPq+3/9cg
 OCG4xDOinnO4L6Be5Cx9h5XnqOtirEO7X30ejAjJPgLI1Nz7R59Q0xv3eprGk880sf2n
 XMCS5Y3pFhMdPOg8PucHM/qLQFRy+9flWMu6+mPfKGGXDgdUpa4ej4GC1HCHPeXjCOav
 WMzn3u8xepGxdjo/rrB9WqnbmK0eOPfWf5HuSZ2CJFZd87bU56bKUNpZPmvnhtNY6U6M
 tyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744116431; x=1744721231;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2jyEjUczCl288qDvZdNk4E8asZPYbS2X3MgLKF8uC6g=;
 b=pRqUcL0GlkPGfuY5xTjSC7bMhsjGYhs4VIa0aWIutTKgtMYvm6pJaeZZ/uHwusESKQ
 7erpquzLDldnZtJLjV++doD74q7UlnBpo21BEOVe7r6juQ1nUJCn/ewuLSXvP7PEyMps
 5l8Dog8b+UmxVaas5ZgSZ6naMO7wONSg8nvawO0BGlgb8s2rn5B5S8/DvBJswrks9S0n
 qT1oCocyviJRxSnSSc3aOJ3B7WC4RpR3+J3ZN6k7sDNLrF9X8DnitkO7OAv5x993odgz
 LX8/esk0zwA72Uy5Nzozx4cWyCnkbItTI+I7qc5DRGkBNDip4HMFWFFa3JN2CUjTN4TA
 P6jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqjifRRT21ZZvgFS7lzNI0lEmhAoNhZDwbqGJo8gvQFevcRiUflwkPyxDq9I0RPb7Cfng8OBz4qhzj@nongnu.org
X-Gm-Message-State: AOJu0YxWhSUVbCkzkdEiApZCrM7S8Fk2zKgSmg6PUFUIEYbN/3Rf2Ec+
 XOXYeq+jIQIG5HYpBup9H/RbIx5pcbir+7TbmBLWfhHGzQrSKH2GVvntN6HaVnI=
X-Gm-Gg: ASbGncslEOCWcWAJtaEawuEf6Wk3g9BnFpxmfZG6PsHhzF8YGLyQeJwRhKm3dpwNahP
 Z2V2yZfW8YrlPogoZQPxQsr+PFXJcc4LBFHjP4Hz3lMYaOH3RTVOzic7Za7/pIyHhh+A9L+tpys
 IwK/s7q0UfcGPMlZkgE/FdmuBZxCYCEodDRccI4I6WNLWPYT9f2XkH3xqFqYkNHX7eq7K0Ht7dN
 82cbix9gSgULzJ8MBTmDKrLVvj6drf8CcPMBcKgIqFJskFa3blV0+KJ+W6BZ4JYmG3uxsiYRM7Z
 bM9p6zTGqc9ilW8lpon2tqUn8vK6QqvVy6ITaCSxVPZnfyIUAEfvkNXNYTI=
X-Google-Smtp-Source: AGHT+IFQI22sDuZVNrKTAbNkVVV0rf+JGNA7SuwKnj7MKJOqZUWB0cVtKBLuzOqMGKGj8PcjPI9/sg==
X-Received: by 2002:a17:90b:4d0b:b0:2ff:6bd0:ff26 with SMTP id
 98e67ed59e1d1-306af7b7889mr14157346a91.34.1744116430921; 
 Tue, 08 Apr 2025 05:47:10 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.125.33])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-305840b460asm10867240a91.11.2025.04.08.05.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 05:47:10 -0700 (PDT)
Message-ID: <d59649b9-596e-4d4d-9fb4-08e7a119a9b5@ventanamicro.com>
Date: Tue, 8 Apr 2025 09:47:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] target/riscv: Add BOSC's Xiangshan Kunminghu CPU
To: Huang Borong <huangborong@bosc.ac.cn>, qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, qemu-devel@nongnu.org, wangran@bosc.ac.cn
References: <20250408022121.173531-1-huangborong@bosc.ac.cn>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250408022121.173531-1-huangborong@bosc.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102d.google.com
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



On 4/7/25 11:21 PM, Huang Borong wrote:
> Add a CPU entry for the Xiangshan Kunminghu CPU, an open-source,
> high-performance RISC-V processor. More details can be found at:
> https://github.com/OpenXiangShan/XiangShan
> 
> Note: The ISA extensions supported by the Xiangshan Kunminghu CPU are
> categorized based on four RISC-V specifications: Volume I: Unprivileged
> Architecture, Volume II: Privileged Architecture, AIA, and RVA23. The
> extensions within each category are organized according to the chapter
> order in the specifications.
> 
> Signed-off-by: Yu Hu <huyu@bosc.ac.cn>
> Signed-off-by: Ran Wang <wangran@bosc.ac.cn>
> Signed-off-by: Borong Huang <huangborong@bosc.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/cpu-qom.h |  1 +
>   target/riscv/cpu.c     | 72 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 73 insertions(+)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 4cfdb74891..f2908939e7 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -53,6 +53,7 @@
>   #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
>   #define TYPE_RISCV_CPU_TT_ASCALON       RISCV_CPU_TYPE_NAME("tt-ascalon")
>   #define TYPE_RISCV_CPU_XIANGSHAN_NANHU  RISCV_CPU_TYPE_NAME("xiangshan-nanhu")
> +#define TYPE_RISCV_CPU_XIANGSHAN_KMH    RISCV_CPU_TYPE_NAME("xiangshan-kunminghu")
>   #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
>   
>   OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 09ded6829a..a076d9dc0c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -697,6 +697,76 @@ static void rv64_xiangshan_nanhu_cpu_init(Object *obj)
>   #endif
>   }
>   
> +static void rv64_xiangshan_kmh_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +
> +    riscv_cpu_set_misa_ext(env, RVG | RVC | RVB | RVS | RVU | RVH | RVV);
> +    env->priv_ver = PRIV_VERSION_1_13_0;
> +
> +    /* Enable ISA extensions */
> +    cpu->cfg.mmu = true;
> +    cpu->cfg.pmp = true;
> +
> +    /*
> +     * The RISC-V Instruction Set Manual: Volume I
> +     * Unprivileged Architecture
> +     */
> +    cpu->cfg.ext_zicntr = true;
> +    cpu->cfg.ext_zihpm = true;
> +    cpu->cfg.ext_zihintntl = true;
> +    cpu->cfg.ext_zihintpause = true;
> +    cpu->cfg.ext_zimop = true;
> +    cpu->cfg.ext_zcmop = true;
> +    cpu->cfg.ext_zicond = true;
> +    cpu->cfg.ext_zawrs = true;
> +    cpu->cfg.ext_zacas = true;
> +    cpu->cfg.ext_zfh = true;
> +    cpu->cfg.ext_zfa = true;
> +    cpu->cfg.ext_zcb = true;
> +    cpu->cfg.ext_zbc = true;
> +    cpu->cfg.ext_zvfh = true;
> +    cpu->cfg.ext_zkn = true;
> +    cpu->cfg.ext_zks = true;
> +    cpu->cfg.ext_zkt = true;
> +    cpu->cfg.ext_zvbb = true;
> +    cpu->cfg.ext_zvkt = true;
> +
> +    /*
> +     * The RISC-V Instruction Set Manual: Volume II
> +     * Privileged Architecture
> +     */
> +    cpu->cfg.ext_smstateen = true;
> +    cpu->cfg.ext_smcsrind = true;
> +    cpu->cfg.ext_sscsrind = true;
> +    cpu->cfg.ext_svnapot = true;
> +    cpu->cfg.ext_svpbmt = true;
> +    cpu->cfg.ext_svinval = true;
> +    cpu->cfg.ext_sstc = true;
> +    cpu->cfg.ext_sscofpmf = true;
> +    cpu->cfg.ext_ssdbltrp = true;
> +    cpu->cfg.ext_ssnpm = true;
> +    cpu->cfg.ext_smnpm = true;
> +    cpu->cfg.ext_smmpm = true;
> +    cpu->cfg.ext_sspm = true;
> +    cpu->cfg.ext_supm = true;
> +
> +    /* The RISC-V Advanced Interrupt Architecture */
> +    cpu->cfg.ext_smaia = true;
> +    cpu->cfg.ext_ssaia = true;
> +
> +    /* RVA23 Profiles */
> +    cpu->cfg.ext_zicbom = true;
> +    cpu->cfg.ext_zicbop = true;
> +    cpu->cfg.ext_zicboz = true;
> +    cpu->cfg.ext_svade = true;
> +
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(cpu, VM_1_10_SV48);
> +#endif
> +}
> +
>   #ifdef CONFIG_TCG
>   static void rv128_base_cpu_init(Object *obj)
>   {
> @@ -3261,6 +3331,8 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>       DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,  MXL_RV64,  rv64_veyron_v1_cpu_init),
>       DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_XIANGSHAN_NANHU,
>                                                    MXL_RV64, rv64_xiangshan_nanhu_cpu_init),
> +    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_XIANGSHAN_KMH,
> +                                                 MXL_RV64,  rv64_xiangshan_kmh_cpu_init),
>   #ifdef CONFIG_TCG
>       DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,   MXL_RV128, rv128_base_cpu_init),
>   #endif /* CONFIG_TCG */


