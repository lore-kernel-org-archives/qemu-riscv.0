Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED4ED69105
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 12:55:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGe36-0003Jt-53; Thu, 28 Nov 2024 07:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tGe2e-0002hA-77
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 07:54:45 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tGe2c-0006up-KT
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 07:54:43 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-212348d391cso6009505ad.2
 for <qemu-riscv@nongnu.org>; Thu, 28 Nov 2024 04:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1732798480; x=1733403280; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rFXjEP1OUXb9ntVEDEg8gZ/1gvKH4zffrfcOLRsIOXw=;
 b=H5G8vFVcRSFFDM+2qGuWBqdqMbuZU9R8T0oh/L4Gi/qpuMmV/2QN3srmjOqxeusC4X
 4rGTdBxYRSThZtePcDxxCHnLPXauHjWuvYicYZR85LBmlShAqQuwEO6nW6lSTehrgXKB
 hX6pwSDGkAxBI4fk2PyWgzyXXHOWQ4Ps1h+QxMNDOu6pC/DlqsaQEJP6rSVcz9oeM2Vc
 qXjKiUADj0wj8Bl8J3AoM2OPgKM9mfSUoDCfmIhNThcqBPWVlpsE8j6QiB33+vBqq3AZ
 G7j7yQ2RmlGnB56nqCZ5BGvOryzO8jNc+JTw77DtkpV3LsWkUIvwwe4dF66dcKAIA6uv
 boPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732798480; x=1733403280;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rFXjEP1OUXb9ntVEDEg8gZ/1gvKH4zffrfcOLRsIOXw=;
 b=PO1MhBxIrUREKGMiotp7+Ayd/B4beTe6LPyvOx/1gD0VnStCLOLO4vHjVHg/3pArF7
 vcAT3Y0czzeiDbAuuFsdMIudJNDRrY2ZlFzZ6jJl90EXPEI6eMpoIdNtfDZtc8p96PV2
 sUL88jLK06jL1s3UDPa5m+sp0mkQoiRAQpsFC0o1iHRry9Ly/66tWFxyNm1Q815gssPq
 VaXr9ObCzxONTtO9JFh0Hk+WrO1QWHMri15XeFgaI08dwOxnOfHGOdQZ0mWp+X/wScT5
 C4ftkox3U4uRSy7rZHGkUr8KoHFAlfYTytH4sSpoKF0Ux/fJnpUxRUAeRJrIc4Srz97d
 trsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuwld5mp2gls+PzN04loAf/xR4eYkERT0ZaB4whw45I0tZCgaa7upzwKf3Gu5/zH1cMETpsPZzFpe2@nongnu.org
X-Gm-Message-State: AOJu0YxifVeKCODCj1DPp65sNtoTJbKWNhvPATUC9KQQYVVj/VyCSRQQ
 Xv/Yhsr9QpO9uv6ektOLXUr95WrNxRbX9DAF6nnECdZIA/95Z4ejzZL/4BFBBH8=
X-Gm-Gg: ASbGncuIwBCLYmuQvJPzHg2lA6WoR8Wjfva4KLZV0vHxBjitIgWzTu66mgS2isnMWJR
 3/CuXLquxtR5a8txpn2iupzmiGtuvl10gn4oE4vI2EM79Gyz8HDwWUGBeEWuL+LjxwTd1/9HNYe
 WCFc4Vqa26ljagDCGfeQAhuIDCpJndvsWaxTACkwKRoRmIahRbqjHcDLenEPiIuqoeaxioQlTGA
 BMA/HWzhDXOmrHZ/dubSe/VAl2iNjKFjX5USbyRyghiS/chrQ7Wma179m1PXzw=
X-Google-Smtp-Source: AGHT+IFl3bowtCRbzapults2Mw9Pn8Eatdy+OHPvUrjxH48syfdj1dB6km9+F4EjOuVlRHitu/dz4A==
X-Received: by 2002:a17:902:e5cc:b0:20b:c287:202d with SMTP id
 d9443c01a7336-21501f6ee54mr70857455ad.55.1732798480173; 
 Thu, 28 Nov 2024 04:54:40 -0800 (PST)
Received: from [192.168.68.110] ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21521967278sm12753475ad.161.2024.11.28.04.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 04:54:39 -0800 (PST)
Message-ID: <b6bd46b0-3038-43bd-b551-8a5714521d7b@ventanamicro.com>
Date: Thu, 28 Nov 2024 09:54:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] target/riscv: Add implied rule for counter
 delegation extensions
To: Atish Patra <atishp@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: kaiwenxue1@gmail.com, palmer@dabbelt.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com,
 alistair.francis@wdc.com
References: <20241117-counter_delegation-v3-0-476d6f36e3c8@rivosinc.com>
 <20241117-counter_delegation-v3-10-476d6f36e3c8@rivosinc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241117-counter_delegation-v3-10-476d6f36e3c8@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
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



On 11/17/24 10:15 PM, Atish Patra wrote:
> The counter delegation/configuration extensions depend on the following
> extensions.
> 
> 1. Smcdeleg - To enable counter delegation from M to S
> 2. S[m|s]csrind - To enable indirect access CSRs
> 
> Add an implied rule so that these extensions are enabled by default
> if the sscfg extension is enabled.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/cpu.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 82edd28e2e1d..410ca2e3a666 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2642,6 +2642,16 @@ static RISCVCPUImpliedExtsRule ZVKSG_IMPLIED = {
>       },
>   };
>   
> +static RISCVCPUImpliedExtsRule SSCFG_IMPLIED = {
> +    .ext = CPU_CFG_OFFSET(ext_ssccfg),
> +    .implied_multi_exts = {
> +        CPU_CFG_OFFSET(ext_smcsrind), CPU_CFG_OFFSET(ext_sscsrind),
> +        CPU_CFG_OFFSET(ext_smcdeleg),
> +
> +        RISCV_IMPLIED_EXTS_RULE_END
> +    },
> +};
> +
>   RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
>       &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
>       &RVM_IMPLIED, &RVV_IMPLIED, NULL
> @@ -2659,7 +2669,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
>       &ZVE64X_IMPLIED, &ZVFBFMIN_IMPLIED, &ZVFBFWMA_IMPLIED,
>       &ZVFH_IMPLIED, &ZVFHMIN_IMPLIED, &ZVKN_IMPLIED,
>       &ZVKNC_IMPLIED, &ZVKNG_IMPLIED, &ZVKNHB_IMPLIED,
> -    &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED,
> +    &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED, &SSCFG_IMPLIED,
>       NULL
>   };
>   
> 


