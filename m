Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2144DC36010
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 13:58:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u1myc-0003Cs-7h; Mon, 07 Apr 2025 09:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u1myZ-0003Bl-GJ
 for qemu-riscv@nongnu.org; Mon, 07 Apr 2025 09:57:23 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u1myX-00025V-9p
 for qemu-riscv@nongnu.org; Mon, 07 Apr 2025 09:57:23 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7369ce5d323so3379016b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Apr 2025 06:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1744034239; x=1744639039; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G67wC9qHxDdpxR9z8GHg5vvrlbf3CFkhfhpkUIL9s+w=;
 b=RTxH25OyocfyvDxybYoEBFXRSAitlpJB2xs0aa14lVxj8iCdFd2C3Ebn42hSAOvm4h
 Yc1vIzGN/xmPqb7S3TFt9q6uGXkMrrTzD16YfzVdNCxVUjLruyr3EWbJCoKxKlCQsqgv
 P5Mr2HK19izVzApIHTr4o9Qd9GOL3fmg3oNDXCw42Y6i1DoOO1z4MLeAHHC11S8ch5ui
 c1peiTuv8YzLzqzIHSvBiUlJqxi35IVziTBFiTZgFmIbc/2MbVEKA/LaAkdn24YkeFnH
 BQLBsXA5lQaPfTyPSC5lWlfM5IS0L5do2GvShsi6B89ZEL6a0fulYfr9rZDTy5XmezTU
 UHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744034239; x=1744639039;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G67wC9qHxDdpxR9z8GHg5vvrlbf3CFkhfhpkUIL9s+w=;
 b=oqXz8hCelUZ2bsz1ouIp65CRqzEfDvEKr6JayNJV9Tm1ADyjrGftTX3vyLrZcVEPoH
 9swpRIYwNuWiDWJ0paln65rjljyxYQqUhfOQpTt6XFSzVbjc8G1lyXukcSJknevVRR2c
 QrM04zaxQ/o1asqlZOj/EdfQfx6SihkeRfZbfm0+cupQbqqi4PqAMbA9tlEcqf1xaeuV
 WpDoy0PvYJYALYpMVmWRzchjDMEKw0uqszvThV4cDds/Rwk26luasNt26MDLDL/r6vsX
 FAdztNuoCJJ7RAmRUzfu1Pesb/vU4LM6Mrnzs1Jj/Y4sO3kk3n0y+kXs7qlCcrKydjir
 O/Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJE3dFRdvBVBNbJRdNybncRZM5C/EjhBm81/S1Y2iLpX1N0X7pEF7F4TvO7Gxexc2AMPg4ahrdqhTw@nongnu.org
X-Gm-Message-State: AOJu0YwVxjiLppRLxU4GhjtOJU7V0kTGpCZAhETXFrGiJzXp5o9GtQPT
 aHq4r2KfIDQvh/Jp3Yk5Ut6mLNv2r+ltgQkjunocavCEGmIw0KSYYc3t59E/ByvY5J+RM1nX4nJ
 s
X-Gm-Gg: ASbGncvc8evNaa3ME7IKZ/upETodK6JJxYmVReyd9A5sWZdWNjqMOsGdLJRZ1ZeqjbV
 fGAqNHzZvl7zbNcW0Yd6eFA8pxYcjBYseQsXab64lVZ92B9OPaBIX2I5WOYpltrjppZTIPbiU3e
 igvWMtf0cSk0aV5nmcTUDpUFul0syOg8wKpfZt4AWibmiQXKr63uR/4g36NE7SuLuLEkkwy1Jb7
 hDsyEgr4hkUoU01QB3DdZ3Tl7pZ/61kmBMb/VUZg9lOMNGJwjUkmTd48yH7QDnMPKJpBDKavSHL
 BAv4XpyFd8Egnc3OCrJT8DojRXNX+b8fCoboCFp8QtFcfTiUlpLOZllQuka+3NsFFnGAMQ==
X-Google-Smtp-Source: AGHT+IFaxtju1dYKAfEVCxAKlwU4WvbY08Bqa1diSxU8gwf9xlZzHY4y8BbdBUOPK/Vew3noWDlVHg==
X-Received: by 2002:a05:6a00:2187:b0:736:3fa8:cf7b with SMTP id
 d2e1a72fcca58-739e7058e6bmr13943735b3a.13.1744034239271; 
 Mon, 07 Apr 2025 06:57:19 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.117.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739da0b41f1sm8685303b3a.147.2025.04.07.06.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 06:57:18 -0700 (PDT)
Message-ID: <cd9167de-e769-4d3c-98ab-8536df887e85@ventanamicro.com>
Date: Mon, 7 Apr 2025 10:57:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] target/riscv: Add BOSC's Xiangshan Kunminghu CPU
To: Huang Borong <huangborong@bosc.ac.cn>, qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, qemu-devel@nongnu.org, wangran@bosc.ac.cn
References: <20250407091903.274038-1-huangborong@bosc.ac.cn>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250407091903.274038-1-huangborong@bosc.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42a.google.com
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



On 4/7/25 6:19 AM, Huang Borong wrote:
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


