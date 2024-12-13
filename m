Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04734E7717F
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 20:38:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tMCQV-0006MR-Rv; Fri, 13 Dec 2024 15:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tMCQU-0006L6-1q
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 15:38:18 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tMCQP-0004LB-6N
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 15:38:17 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-725d9f57d90so1605217b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 13 Dec 2024 12:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1734122291; x=1734727091; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gRFktgGm38qO8Csj2wJgb6kJF5Uf5GY6gnXJpd6YWtU=;
 b=UT3rngyWJjN+AJ3ttnklYdAGGyCWQlUswYCUw+kPLlpexPb6IP+XgBU1yIo8z8YxwC
 c/SzfaBkdJ1KVS3CtiqI6C7766s/OQy3tC68lDxyYvBAVOtbqUudVveWnN/5hH6GTknv
 5Rj4Eu744vRItMOwtiHCpOem7HAWY9Q7gE7JxF0S3OFZXX9cF/skPRjWArRMdwmM/ORM
 Q+AryZSF0pLakMKu0u9YS9ocpoBaTijRSPcUT0tyXFLMBeN59uuw4H7OrtHBR+xD6e/a
 zl4Z5TVB1yOl76p73Omra98DzKcXRxLyHeP4fmdioxncLyr4SpQBF2c3BsZGsjkcpxqt
 Wmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734122291; x=1734727091;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gRFktgGm38qO8Csj2wJgb6kJF5Uf5GY6gnXJpd6YWtU=;
 b=H08AAcr22+vulnPEZ66Bek65vsLO9K+ri/PqFxYnl11c1EQY3gcWqBp9ZAo6BeQb+m
 exSPRXubzCP7Gg4eTZgLTk+HpPiXcaSyyrJw41mPlMSwPu2I4pbx3C/V3ow9AnT6Q1Go
 Mo1ZuPtsqKAQ0tVOlnGvH7e9E1JzIJAtlZd5hgMkh2hE7T0UD3h+ilpkgvYBz/Egfrk2
 xbU8fJgUwBN8awX5ZYVmYpB6VgeuxAklZlMrqeN3mFNkdOUefdGkRnUlooh0uope0RUT
 PBrBKqH4aGgZMtBPVLUISJO5o6v6nouyIDI9+wtcNxK7pndP5NqwMoDG8Z1YAoE+53I5
 5CdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9H61P1Xiu68lYuRwLlAdhKYW3XSqXLf/Se7YvBVXISc2Mf3hguRRaI4oTorSUxr8jFDklqKoVx92j@nongnu.org
X-Gm-Message-State: AOJu0YwInzbCJHEGzAFs+QXJKjPxqTWd1JdU9MFbgKT0eFa35pBQGA8N
 hInOU0xxcgs+/XVw358y0Kl/KIEiToSOw9FX1O5eOqkcVJtgkr3lCFChn52nAR03MM1XdSnMKDb
 J
X-Gm-Gg: ASbGncu6+MDcz77On66X9YzOd3M8YTBPPhkyAXpLuXcSMmAn1fpj/WEksuE2N7QTkh2
 pBUFBJ/yluZy5rm8Xhva3ZdP6QTDd7iy8ehPOGjMNph7IKXdF4EqIi9GHRiceaNNJ6a/WogdLed
 Yg8U5lVUDMXH95hnMB+Cl0uasOZd9vpE+NgAGJClIZptKpV3N6LKXw94h9etJDtJp3m7fHMpi8Q
 rpg7dNVF7Zxy5eyaZmlKGhHIT8o7mI4NP2bpzT7Sk7LwCVHZIiO0YXh85qcU2mqMKLVfG52Zoo6
 cwBdOrxuvqKLqfLtoU+cDJeT8vO3tP+I
X-Google-Smtp-Source: AGHT+IFcygqTjOxhrLRJOtQQ8qtKDxaqty0Oaod7p17YJzPfNcW506We74P/lJ9NwtiLfggLh2a8AA==
X-Received: by 2002:a05:6a00:3e21:b0:728:eb32:356c with SMTP id
 d2e1a72fcca58-7290c181477mr5894595b3a.11.1734122291111; 
 Fri, 13 Dec 2024 12:38:11 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:51cf:9cf:d2f2:d49e:7bd9?
 ([2804:7f0:bcc0:51cf:9cf:d2f2:d49e:7bd9])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72918bb0323sm198387b3a.148.2024.12.13.12.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 12:38:10 -0800 (PST)
Message-ID: <1e71d8ad-862e-4889-9cd0-4ec2d7bd67bd@ventanamicro.com>
Date: Fri, 13 Dec 2024 17:38:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/71] target/riscv: Constify all Property
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
 <20241213190750.2513964-13-richard.henderson@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241213190750.2513964-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x433.google.com
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



On 12/13/24 4:06 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 80b09952e7..4329015076 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2661,7 +2661,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
>       NULL
>   };
>   
> -static Property riscv_cpu_properties[] = {
> +static const Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>   
>       {.name = "pmu-mask", .info = &prop_pmu_mask},


