Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48C8CEACEF
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 13:53:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vKzfq-00015l-7o; Mon, 17 Nov 2025 08:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vKzfo-00013l-8x
 for qemu-riscv@nongnu.org; Mon, 17 Nov 2025 08:53:40 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vKzfl-0006Ee-Dn
 for qemu-riscv@nongnu.org; Mon, 17 Nov 2025 08:53:39 -0500
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-4503ee5c160so2037904b6e.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Nov 2025 05:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1763387616; x=1763992416; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=THHknnhDbC0Q9nJKFENfLtsiXQLF+2FU2w8m9DDR6JA=;
 b=BCWGeOKhvfVG6PBsd06GRAEibaV8ygey40Mr9Lx0K0ALQc7I+T1Mtsj9OGwQYgVEEO
 fWlm+c13Z8jIxGM8jHLwEEWMFDwmxOLGuaYBXpU/M5PXHFRGo51/1HUNTd3XXgnD2YQQ
 C+noMD/AoF+O22SBmqtAcnZAujTBERA21zV4u4BBW+DJ4NmFdfEHRY24SVcLOsuN9i1c
 tftN8aVRhon7WHASrtNbezifkczu5yJKcXUtFABZt9+Ggyg4cZIimLBgI12pI6cc9m/q
 SluIO/ZZz4/iGQIOhNKvTzdCmCNLNy0x1M72j/GHeAh/gZ766/c5Yly4wOLkXNL3EmXy
 bzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763387616; x=1763992416;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=THHknnhDbC0Q9nJKFENfLtsiXQLF+2FU2w8m9DDR6JA=;
 b=iVla4hHyaEMaHPXYMo4uHrccaSe/56RjW9cFu3hlpzMhbm95HzyVVJmYiukFYnMBEQ
 Cs8hm9nltOoTCIvN9/Tytdwp+w2RfNs9Ct3xcmQjkVOBRb7DWvvCu0jeX0zsAKK7ZQK1
 C+xpivnFaaHbAayIJLjD7/4rJ8RoMOL/Jg1eq3B8b9nQ1ASmy0lvge2JFThvpVbmE030
 +iyKPmZnN5mcxFoKgHsc3vmtl/2V21aXHX/AUe+n8hGVu47bEe4eLT1Tep0HdcJy/yeh
 Tj2CNSOQ6JpJC2tcu4iWiaSD4SYglY2XgZumPlw8LYHwzgHbwGLS6kt3lXE1UfetMHzQ
 L+fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyU6TOKZqielSRVBc8gddqpGhcsRfqbbDkdhI1cKMqQcbwmx5M9xkGDgQGoORRmdZ34O5YWsrXLNbD@nongnu.org
X-Gm-Message-State: AOJu0YyrS3KFum6uhkFUhaWAy9Wrs1DA9VL5qD07PW6Y+yK2MRHqqhFv
 eaW991WdUy5blRek7uriXWrq9BOQDzvRwxN7p442uLuH5nP30aqNE/AQ6bQTg8lTkeM=
X-Gm-Gg: ASbGncuoJz8sgdJSR7WSmDAcCjJ9vCkNcC0xk3DEnzlMtnVM/iisAkZn5f7VvHsbpE4
 KAZrngu46AUCaZDX7Fo+IORxrqiPRQdF0Wt18dqN55Uyen6tyNdSlq9+Y/X6E3xu5Ej/+TSi+mQ
 nO9KV9vTHvqrXH8i10w7Y8EcJ81R3rHX0GnDE0aCkimBhTSABXQWB+om6Rkw2BUOBc3qt/uisX4
 5Ygf1k+QY+K+3Lcj/WpMeIw7Dg6nIoDTe71PeKI8MeOgXYiELnCCJLJCFdZ+M25JmmZ8OgYSvIc
 zjlhXGsSXf98OCPB3rLC6wOurPIXyTDuIrafMf/iCdKRzqMgGnwHrBW2ocCfGHVmy5TrGID+75F
 bWoePSTUeP3EVWfKQTn9ELdLDDwLpt+ihFUAZC8POlHZMB1bl+dhBTUKky+BOLYgDUE68MUM/HB
 rQLgOZ7B3d/O2K01timxokv1Zds09rlcN5+2Z5
X-Google-Smtp-Source: AGHT+IGrLUOs/s8X9JZxvMWUpWJ9ZTtcEDZPrtSKudUmH6/zXKBPsrtblrJ0fRagJI6pvs1VvKUOTw==
X-Received: by 2002:a05:6808:1785:b0:438:430b:3dce with SMTP id
 5614622812f47-4509734a487mr5825160b6e.10.1763387616166; 
 Mon, 17 Nov 2025 05:53:36 -0800 (PST)
Received: from [192.168.68.110] ([191.202.237.26])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4508a6c1510sm4285905b6e.18.2025.11.17.05.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 05:53:34 -0800 (PST)
Message-ID: <f7da44c5-e9dc-45db-9ccc-02d662ab9ad4@ventanamicro.com>
Date: Mon, 17 Nov 2025 10:53:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/riscv: Update MISA.X for non-standard
 extensions
To: frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Max Chou <max.chou@sifive.com>
References: <20251114090134.1125646-1-frank.chang@sifive.com>
 <20251114090134.1125646-3-frank.chang@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251114090134.1125646-3-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22e.google.com
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



On 11/14/25 6:01 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> MISA.X is set if there are any non-standard extensions.
> We should set MISA.X when any of the vendor extensions is enabled.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.h         |  1 +
>   target/riscv/tcg/tcg-cpu.c | 15 +++++++++++++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 8899bf7667a..2e0c92fe593 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -69,6 +69,7 @@ typedef struct CPUArchState CPURISCVState;
>   #define RVH RV('H')
>   #define RVG RV('G')
>   #define RVB RV('B')
> +#define RVX RV('X')
>   
>   extern const uint32_t misa_bits[];
>   const char *riscv_get_misa_ext_name(uint32_t bit);
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index da09a2417cc..0d730f4d774 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -1180,6 +1180,20 @@ static void riscv_cpu_update_misa_c(RISCVCPU *cpu)
>       }
>   }
>   
> +/* MISA.X is set when any of the non-standard extensions is enabled. */
> +static void riscv_cpu_update_misa_x(RISCVCPU *cpu)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    const RISCVCPUMultiExtConfig *arr = riscv_cpu_vendor_exts;
> +
> +    for (int i = 0; arr[i].name != NULL; i++) {
> +        if (isa_ext_is_enabled(cpu, arr[i].offset)) {
> +            riscv_cpu_set_misa_ext(env, env->misa_ext | RVX);
> +            break;
> +        }
> +    }
> +}
> +
>   void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
>   {
>       CPURISCVState *env = &cpu->env;
> @@ -1188,6 +1202,7 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
>       riscv_cpu_init_implied_exts_rules();
>       riscv_cpu_enable_implied_rules(cpu);
>       riscv_cpu_update_misa_c(cpu);
> +    riscv_cpu_update_misa_x(cpu);
>   
>       riscv_cpu_validate_misa_priv(env, &local_err);
>       if (local_err != NULL) {


