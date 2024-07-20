Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B14C3DA59
	for <qemu-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 09:24:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sV6KS-0005Ar-52; Sat, 20 Jul 2024 05:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sV6KQ-00058H-Am
 for qemu-riscv@nongnu.org; Sat, 20 Jul 2024 05:24:34 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sV6KO-0005Xe-Fd
 for qemu-riscv@nongnu.org; Sat, 20 Jul 2024 05:24:34 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-260dde65a68so1327893fac.2
 for <qemu-riscv@nongnu.org>; Sat, 20 Jul 2024 02:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1721467468; x=1722072268; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uaR3WFE4aH15HmNGfqp3B5QxxFoqyQ4yFH9ezeTfNIc=;
 b=eIj2I39u9+oX+J1xzS7Sv2GVXHvmwIhsF8paE0TnQeu1Bh0PSYbxEhTYK5Ej7Sm2TR
 /joHNy+nnpiOpfNCfPh66X/R/ozA6928a4/HKhkWwQSEI3raZDyCLQ93TTWX4R/KQoCF
 qn41mHePUpgQVyYhTX8S+uHVcHW/lnu/dSywj6OgDkN2XhFElu57KK8wOFoD5eNpxavH
 nU8+JL6XafZkMbB7GvZtc7OMbvD8h9BEOHc3CHU7YPFSdCx4X7rbjtu0NXEU4e6iKqyx
 k6qeqqpWOECcmZQ5Z6derAVx5UyzzF75kval+w9tg8mykYFr3ZUDzAj9T41COdHQUyMa
 ENnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721467468; x=1722072268;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uaR3WFE4aH15HmNGfqp3B5QxxFoqyQ4yFH9ezeTfNIc=;
 b=kwMIozBbEEde86Axj8hFGwltAxF2DRAZa6tLrQ2sNv8bRipl1VHrNiW5fIoUADZ/EY
 D01XMvcmeq7Ecv4fYJzpHp7WdWKHmWHKsXBw90e4JdaeCB7nax0VbhmYAriNbH7x6sJB
 oDRe2JXAoSsGB5E1KINVw7dT/tnP+suHIOd+KXqApSS+FQUcIFz1ggp5nVspp3NqNhTM
 YNV7pj9HKgvwfvJ+yAqgFGvwl9PGEOqrFVRwB/gV0+1PCEp7s83KNdZDLpWraAjgSE0L
 H9fW27EeDszUx/becn0DHaSNCxgT1jSqN1rntGdXUsyfp9EBF6Howul0zAWsJ7kiD4WD
 VPJA==
X-Gm-Message-State: AOJu0Yzr+wJj2et3cZ85YoKu0XX3MDAVWzk2tEWPwEpKpczV0xMLOngz
 AdKq2Ul/JtkQ3Od9g6AbubYFemys++RNbCfSTKVwBBO0nj8LA0Ygm3GOOSe5MJ4=
X-Google-Smtp-Source: AGHT+IGSyUTgHbbioDSkxYs/KQp/tiDrcOexJLCla3NNXNQ4mZoI06Qlzasp5ekJlGz6cwrwGuM14A==
X-Received: by 2002:a05:6870:718a:b0:25d:dea:456f with SMTP id
 586e51a60fabf-2612169c862mr1905607fac.42.1721467467846; 
 Sat, 20 Jul 2024 02:24:27 -0700 (PDT)
Received: from [192.168.68.110] ([179.193.8.144])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70cff4c2278sm2336001b3a.88.2024.07.20.02.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Jul 2024 02:24:27 -0700 (PDT)
Message-ID: <1b1d3386-0f0f-44df-8beb-a783ac58aea8@ventanamicro.com>
Date: Sat, 20 Jul 2024 06:24:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/8] target/riscv: Add any32 and max32 CPU for RV64 QEMU
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, bmeng.cn@gmail.com, philmd@linaro.org,
 alex.bennee@linaro.org
References: <20240719231149.1364-1-zhiwei_liu@linux.alibaba.com>
 <20240719231149.1364-8-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240719231149.1364-8-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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



On 7/19/24 8:11 PM, LIU Zhiwei wrote:
> We may need 32-bit max or 32-bit any CPU for RV64 QEMU. Thus we add
> these two CPUs for RV64 QEMU.
> 
> The reason we don't expose them to RV32 QEMU is that we already have
> max or any cpu with the same configuration. Another reason is that
> we want to follow the RISC-V custom where addw instruction doesn't
> exist in RV32 CPU.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Suggested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu-qom.h |  2 ++
>   target/riscv/cpu.c     | 13 ++++++++-----
>   2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 3670cfe6d9..9f91743b78 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -31,6 +31,8 @@
>   
>   #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
>   #define TYPE_RISCV_CPU_MAX              RISCV_CPU_TYPE_NAME("max")
> +#define TYPE_RISCV_CPU_ANY32            RISCV_CPU_TYPE_NAME("any32")
> +#define TYPE_RISCV_CPU_MAX32            RISCV_CPU_TYPE_NAME("max32")
>   #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>   #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
>   #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0df145d90f..ab2512bb19 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -464,11 +464,9 @@ static void riscv_max_cpu_init(Object *obj)
>   
>       env->priv_ver = PRIV_VERSION_LATEST;
>   #ifndef CONFIG_USER_ONLY
> -#ifdef TARGET_RISCV32
> -    set_satp_mode_max_supported(cpu, VM_1_10_SV32);
> -#else
> -    set_satp_mode_max_supported(cpu, VM_1_10_SV57);
> -#endif
> +    set_satp_mode_max_supported(RISCV_CPU(obj),
> +        riscv_cpu_mxl(&RISCV_CPU(obj)->env) == MXL_RV32 ?
> +        VM_1_10_SV32 : VM_1_10_SV57);
>   #endif
>   }
>   
> @@ -2962,6 +2960,11 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>       DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV32E,        MXL_RV32,  rv32e_bare_cpu_init),
>   #endif
>   
> +#if (defined(TARGET_RISCV64) && !defined(CONFIG_USER_ONLY))
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY32,     MXL_RV32,  riscv_any_cpu_init),
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX32,     MXL_RV32,  riscv_max_cpu_init),
> +#endif
> +
>   #if defined(TARGET_RISCV64)
>       DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE64,    MXL_RV64,  rv64_base_cpu_init),
>       DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E51, MXL_RV64,  rv64_sifive_e_cpu_init),

