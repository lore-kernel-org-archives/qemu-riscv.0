Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D694C02199
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 07:34:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1th1pe-0000yU-7z; Sun, 09 Feb 2025 02:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1th1pc-0000yK-HQ
 for qemu-riscv@nongnu.org; Sun, 09 Feb 2025 02:34:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1th1pa-0006U9-AW
 for qemu-riscv@nongnu.org; Sun, 09 Feb 2025 02:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739086456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MqsIhBeBp5BZt2n+65xOr5jR3naN1YuTUIcPvj1WewY=;
 b=bGuLitKEXdp8anGHhGJB1eX+3Umh0CGvfRaQuLW65LFP6kpjH5y/Jznq7Hhq4cYA01dwBo
 tm/w65gPX6MhcXl1K3cV7BdsEpAdOQgETtZq/9v6so4A2/29SXyLbUF8Xcpt7DVtLjgR1D
 Nk9BUc8ufFYDt863J/l8+PEa+ocKA+4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-4ZJZEpG9Nby-jmgx9iUGzw-1; Sun, 09 Feb 2025 02:34:14 -0500
X-MC-Unique: 4ZJZEpG9Nby-jmgx9iUGzw-1
X-Mimecast-MFC-AGG-ID: 4ZJZEpG9Nby-jmgx9iUGzw
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ab39f65dc10so388406266b.1
 for <qemu-riscv@nongnu.org>; Sat, 08 Feb 2025 23:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739086453; x=1739691253;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MqsIhBeBp5BZt2n+65xOr5jR3naN1YuTUIcPvj1WewY=;
 b=w0xKXJOXrwC3oQOKxU3j+aUGNNcEuxmSZdOFCL3pa8+OuTLkj2NWgE3YrRNqMWxiQ/
 kKyvu9TH0jKfXaNoOH0MrEUcAULOBNZ3F5GzdzN5AkMPIRcx+vNrI6EwW+lva7yF7BHY
 u/J/LKQuby5eM8OU0j7FhevvVH6H+0565Oj/vAYNVW50eM4XxvSybRAU9Wwy8u1LO/J2
 YhVh87V+fKhzCa1pjOc00zEKWDCYjHJvWSzrxzHlTKPMIsVpQONbD//Oug97Z5ztGcVy
 YZ8W4W41fwsUzHvosDgr7sx4T+UScl73ETu0dbRMXsAqrFGzQQj5ndpD5zfZIy1KSguM
 yaXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzBSgfh8TrmfoYnygMAGp1nq2HsD2DLKg1nDpc+L7ldtOzUQP3mr4OBqHX4rTZmCLTFS7NDjzZgD4R@nongnu.org
X-Gm-Message-State: AOJu0YxI/fhrb6PUYjJRxcCtk83JsScazPQClCQSD1RjvyedHFANyGVx
 xH74pdGxIkMvtLD+g3ntaHTQzxc6YMtq0XVr+uxW0PeNEmxbn5PL3cnMBcs5BQwcHtEYoCQGsoe
 OKfNRbw4481s+N7RbyIgq0eap3Sz2/64qph500G8CuMmSTgMOPiBd
X-Gm-Gg: ASbGnctrlvaehAqw1QbKY2Ca/bMtXNfdOL3SOb9n9X9gHj2wCD1SVSTE8Mq2z3ZqsX8
 5q6mjUTzvPWodP/RrdToaGBYwJUeffK3Itbv/WlPVN+oY3NwDd3yQQm/FjMWuLaSJn3abBeFV6F
 idfQGwUSjP+VnxKiGSstmaJD+CNfzWPwBZkwHfE6QPRi1qNWusnQB3HEgp1OCIPIG40Dvq+6vTx
 If9L6V9Qk1gbAraeNi9LYnXzfK9WxQsTaHpwrcW+lWrotwSzEqi+5ZqN+DdAIdgHothW4h+auHM
 GvdtKA==
X-Received: by 2002:a17:906:9c8d:b0:ab7:c1f:2b63 with SMTP id
 a640c23a62f3a-ab789bca7e5mr1087899366b.27.1739086453204; 
 Sat, 08 Feb 2025 23:34:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLTlVUEsSMIVCGx59luJplpJX+XVxFJHZxvIo3ORVk8+zdaSlKP+5qrG3aUQfw/oijDdYnkw==
X-Received: by 2002:a17:906:9c8d:b0:ab7:c1f:2b63 with SMTP id
 a640c23a62f3a-ab789bca7e5mr1087898366b.27.1739086452861; 
 Sat, 08 Feb 2025 23:34:12 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-ab772f486d2sm621816466b.1.2025.02.08.23.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Feb 2025 23:34:12 -0800 (PST)
Message-ID: <1faf3550-909d-47ba-89e5-c8955a03784e@redhat.com>
Date: Sun, 9 Feb 2025 08:34:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] target/riscv: Move target-agnostic definitions to
 'cpu-qom.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250206181827.41557-1-philmd@linaro.org>
 <20250206181827.41557-3-philmd@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250206181827.41557-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bsC-5022giciwN3xhSB-n9jfFv-w_4eeJNGxTWO7cgo_1739086453
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/6/25 19:18, Philippe Mathieu-Daudé wrote:
> "cpu.h" is target-specific. Definitions which can be used
> by hw/ code when building QOM blocks can be in "cpu-qom.h",
> which is target-agnostic.
> 
> Move the MISA bits (removing the pointless target_ulong cast)
> and the IRQ index definitions.

This seems wrong.  Why not move from cpu.h to cpu_bits.h, and include that?

Paolo

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/riscv/cpu-qom.h  | 40 ++++++++++++++++++++++++++++++++++++++++
>   target/riscv/cpu.h      | 24 ------------------------
>   target/riscv/cpu_bits.h | 15 ---------------
>   3 files changed, 40 insertions(+), 39 deletions(-)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index d56b067bf24..6028aa38fb2 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -55,4 +55,44 @@
>   
>   OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
>   
> +/* Interrupt causes */
> +#define IRQ_U_SOFT                         0
> +#define IRQ_S_SOFT                         1
> +#define IRQ_VS_SOFT                        2
> +#define IRQ_M_SOFT                         3
> +#define IRQ_U_TIMER                        4
> +#define IRQ_S_TIMER                        5
> +#define IRQ_VS_TIMER                       6
> +#define IRQ_M_TIMER                        7
> +#define IRQ_U_EXT                          8
> +#define IRQ_S_EXT                          9
> +#define IRQ_VS_EXT                         10
> +#define IRQ_M_EXT                          11
> +#define IRQ_S_GEXT                         12
> +#define IRQ_PMU_OVF                        13
> +
> +#define RV(x) (1UL << (x - 'A'))
> +
> +/*
> + * Update misa_bits[], misa_ext_info_arr[] and misa_ext_cfgs[]
> + * when adding new MISA bits here.
> + */
> +#define RVI RV('I')
> +#define RVE RV('E') /* E and I are mutually exclusive */
> +#define RVM RV('M')
> +#define RVA RV('A')
> +#define RVF RV('F')
> +#define RVD RV('D')
> +#define RVV RV('V')
> +#define RVC RV('C')
> +#define RVS RV('S')
> +#define RVU RV('U')
> +#define RVH RV('H')
> +#define RVG RV('G')
> +#define RVB RV('B')
> +
> +extern const uint32_t misa_bits[];
> +const char *riscv_get_misa_ext_name(uint32_t bit);
> +const char *riscv_get_misa_ext_description(uint32_t bit);
> +
>   #endif /* RISCV_CPU_QOM_H */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 97713681cbe..4e681ad3917 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -54,30 +54,6 @@ typedef struct CPUArchState CPURISCVState;
>    */
>   #define RISCV_UW2_ALWAYS_STORE_AMO 1
>   
> -#define RV(x) ((target_ulong)1 << (x - 'A'))
> -
> -/*
> - * Update misa_bits[], misa_ext_info_arr[] and misa_ext_cfgs[]
> - * when adding new MISA bits here.
> - */
> -#define RVI RV('I')
> -#define RVE RV('E') /* E and I are mutually exclusive */
> -#define RVM RV('M')
> -#define RVA RV('A')
> -#define RVF RV('F')
> -#define RVD RV('D')
> -#define RVV RV('V')
> -#define RVC RV('C')
> -#define RVS RV('S')
> -#define RVU RV('U')
> -#define RVH RV('H')
> -#define RVG RV('G')
> -#define RVB RV('B')
> -
> -extern const uint32_t misa_bits[];
> -const char *riscv_get_misa_ext_name(uint32_t bit);
> -const char *riscv_get_misa_ext_description(uint32_t bit);
> -
>   #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
>   
>   typedef struct riscv_cpu_profile {
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index f97c48a3943..80701bc77fe 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -720,21 +720,6 @@ typedef enum RISCVException {
>   #define RISCV_EXCP_INT_FLAG                0x80000000
>   #define RISCV_EXCP_INT_MASK                0x7fffffff
>   
> -/* Interrupt causes */
> -#define IRQ_U_SOFT                         0
> -#define IRQ_S_SOFT                         1
> -#define IRQ_VS_SOFT                        2
> -#define IRQ_M_SOFT                         3
> -#define IRQ_U_TIMER                        4
> -#define IRQ_S_TIMER                        5
> -#define IRQ_VS_TIMER                       6
> -#define IRQ_M_TIMER                        7
> -#define IRQ_U_EXT                          8
> -#define IRQ_S_EXT                          9
> -#define IRQ_VS_EXT                         10
> -#define IRQ_M_EXT                          11
> -#define IRQ_S_GEXT                         12
> -#define IRQ_PMU_OVF                        13
>   #define IRQ_LOCAL_MAX                      64
>   /* -1 is due to bit zero of hgeip and hgeie being ROZ. */
>   #define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)


