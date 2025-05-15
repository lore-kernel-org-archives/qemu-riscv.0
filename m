Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E660CC3ABC9
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 May 2025 11:12:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uFWVg-0007As-MB; Thu, 15 May 2025 07:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uFWVU-00073g-2W
 for qemu-riscv@nongnu.org; Thu, 15 May 2025 07:12:09 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uFWVS-0005Uz-8r
 for qemu-riscv@nongnu.org; Thu, 15 May 2025 07:12:07 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-52c58804270so572551e0c.0
 for <qemu-riscv@nongnu.org>; Thu, 15 May 2025 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1747307525; x=1747912325; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T7apgF3B5elLfEeTOpMUwbUwu7aE/NwrgsqOEWNeupk=;
 b=OlFJ+qtKzU/ZwoibC9hrE+Ckgkt0pel51Jk3SfCC/vjZtHceRSTLznQwIatpV9xUnO
 CcvZhcCxpNtL/l+rWgLWsHAhwIZHf7sArlV73KreDFjoPGAelyghZbdY1jIONPXCyEiI
 2qgD8HgAfxQp68PSphrjtrT9/WqseaacpWsOut8hjWkIQ5el4/+McBMtWAbgzC0EqfbV
 ZfM1Qi0l0q5guuWFPyh4ZdNAQDGwVc77kZEgGJMwVvqIBcTYidJZwsSbJx3b18MRp12y
 8jM2kHi/mpCXkQ42j84YRHvyOCOkrUexDIbBU/2pWOqi4/d+lTusiJkW/5xPJLLOxO/a
 AGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747307525; x=1747912325;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T7apgF3B5elLfEeTOpMUwbUwu7aE/NwrgsqOEWNeupk=;
 b=doNI9C6Krhot7Sp+FO06jpf/c9ngRyPIawQEXLCupwwAaM9lHkGwSvGc/pHyv0gUW9
 nj7Th0ybevDGFigqEa+u+8Jx15GjkBY+dRKbgEi1dwo1v7AwtBYRT5ngNZpTAHu58Xdv
 5Cs5QXb1KA7E1XYg/xuQCH67m1T8bC5zz5uotbMq04uz8a0NbyX8aVHLh73lyYrHcsb1
 YcL78GRLCKct0nKMxV49OPUbvbLwmBe+0JJiwG4XoGEGLsxAzwAXg/oIpzmaTd52jFhY
 2kpwkSdBuUFEJOX9Bru0pTnrr7CZZPPCtxTu18E74mqb4uGsTqYDS48V5glb2QeDiX4y
 mtTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULtF21Ic6sTA1D2/SLLCLMLM7CiOAk9MH2FjWSu1xghQW7Mt8nzkxE5ULci3iXXIXH3yIRjeuB7W7y@nongnu.org
X-Gm-Message-State: AOJu0YymWtqv/r5t1e9mvtTpWcT30RrTyFbWQ1p0fIpYv72A5QT5U8GT
 eM5z9q0xg+ypTjxUbugLPfdMloH+kZDSQ6j81F2NHlIB0H5bLJJdv6mBL+HOLAU=
X-Gm-Gg: ASbGncuJi0qGxAi1GKw0BlE4JrBo9kIYFAisoUOzK41Noffo0QfeaP728B1/cA4IeNi
 slstnE4fbPrnzMfcq5Wgh7VU9jb4uD+ZOdMQy7nr69nXNYVAqCn2ngzckScyzH8srFWaYUzyiTZ
 SoOBOHitkE6aByplrGgbKTtdPhlv+hackCrUx2HGTaGifwh9Lx/aRuAzJIkr8jna4S1Bo8U+Zo6
 GDZZ3HAM4QJgC2rwQprQlgw/4sGaHstHo1eTgfBqG2Mghq0eCfD7wXmlij3xH5gbJMDxnFKks1W
 1ql8t319lnpsqDbkbDBQ33BnSqRqLpWhkGjNuDvDRVEhUWvNTb6eS+J1gvMdlBX0p7dn7vZHTBK
 93xUm5jQiVwkMkd4hOePS95TTSCAJsw==
X-Google-Smtp-Source: AGHT+IG2DgRU4X7VASV3ZE9/53KfSr++MpYsB+kcllScLhxRRmcaRofHzp+BUFmqa2viV/v+ePLzcg==
X-Received: by 2002:a05:6122:4594:b0:526:2210:5b68 with SMTP id
 71dfb90a1353d-52d9c5a5a4dmr6577514e0c.4.1747307525041; 
 Thu, 15 May 2025 04:12:05 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:906e:57d5:dca2:1ab3:20de?
 ([2804:7f0:bcc0:906e:57d5:dca2:1ab3:20de])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52db096d621sm508995e0c.20.2025.05.15.04.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 04:12:03 -0700 (PDT)
Message-ID: <fd781319-d0ab-43e5-bfd2-f256151f1982@ventanamicro.com>
Date: Thu, 15 May 2025 08:12:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/riscv: Add standard B extension implied rule
To: frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Jerry Zhang Jian <jerry.zhangjian@sifive.com>, Jim Shu <jim.shu@sifive.com>
References: <20250514041118.1614-1-frank.chang@sifive.com>
 <20250514041118.1614-2-frank.chang@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250514041118.1614-2-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vk1-xa2e.google.com
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



On 5/14/25 1:11 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Add the missing implied rule for standard B extension.
> Standard B extension implies Zba, Zbb, Zbs extensions.
> 
> RISC-V B spec: https://github.com/riscv/riscv-b
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 27edd5af62..f737b703da 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2532,6 +2532,17 @@ static RISCVCPUImpliedExtsRule RVG_IMPLIED = {
>       },
>   };
>   
> +static RISCVCPUImpliedExtsRule RVB_IMPLIED = {
> +    .is_misa = true,
> +    .ext = RVB,
> +    .implied_multi_exts = {
> +        CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
> +        CPU_CFG_OFFSET(ext_zbs),
> +
> +        RISCV_IMPLIED_EXTS_RULE_END
> +    },
> +};
> +
>   static RISCVCPUImpliedExtsRule ZCB_IMPLIED = {
>       .ext = CPU_CFG_OFFSET(ext_zcb),
>       .implied_multi_exts = {
> @@ -2910,7 +2921,8 @@ static RISCVCPUImpliedExtsRule SSCTR_IMPLIED = {
>   
>   RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
>       &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
> -    &RVM_IMPLIED, &RVV_IMPLIED, &RVG_IMPLIED, NULL
> +    &RVM_IMPLIED, &RVV_IMPLIED, &RVG_IMPLIED,
> +    &RVB_IMPLIED, NULL
>   };
>   
>   RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {


