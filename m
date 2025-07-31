Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58EAC87FD3
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 23:14:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uhcTM-0001J6-Mg; Thu, 31 Jul 2025 19:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhcTL-0001HI-KS
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 19:14:03 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhcTI-0006rp-OW
 for qemu-riscv@nongnu.org; Thu, 31 Jul 2025 19:14:03 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2401b855635so8014625ad.2
 for <qemu-riscv@nongnu.org>; Thu, 31 Jul 2025 16:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754003639; x=1754608439; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cYPTbDjzEaWCey+wtOHfHEESLmZnJDv+3cu464DH5HI=;
 b=rsxNZNb7TSWHIyfPauqQhyLejWWLoS1IVtKl5MxEJl001AiFvRcxPzbzBtzCdGvAYw
 auvekX1SozHzLAKDEqneF5eKTBkXSHtmUonO4ByjmCHCa1PNhQ/aGntswCM2hCzrQRT6
 6aQqLmeEmdMlgjboUCeO4X1+7Xl8VBfLDGGDM9xOXwQcfn+4y8/fPEHTZB7tECQwLAlr
 wwn2qCA0GtLECfvC261KIdCUvmD/otKBL/YeE08HWgQEhE3m0jueMYydN+fxGKfDe7HA
 HCSIHTZE/VHHPK50yvOADo6FCBnXPNqnqn2rNrN/QtSh2pcaitTdObHsJ/7gGk/tXoRC
 55DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754003639; x=1754608439;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cYPTbDjzEaWCey+wtOHfHEESLmZnJDv+3cu464DH5HI=;
 b=bJSD7kyLyTNCb5v5dy2HKVbi264121deWYr8Zc5TQSpbtUL+AEUVzsHWeKicJX71FQ
 VM/YY9k5vwVlBlkWjeY/YYLQkLsL+iOIHKcvOYEesppffPb35RXPtWTPPjGuXQqwiMP1
 Tm+B56nXdyTd+42NSh1eIWPtDPu8Rirn53Ig74PAzqmTobxvvtaExyQf4Zd4sxZ9ZdZz
 TOfy8Z6oF+OOuOrGP24brpoOyDzs+b3U0HPl9574yKSx7uv2djPo+oi6Jv2P68O9dJeK
 0J3NJ0vgUzqh7C/XNtD5yMWGHZvC/5YSCnLGXEY0HFuomgJVqP714VzpYVY4c2vpQLBA
 SQmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnB4OJIvlig/Raj7NSWo33u0o1Tts6iYHG8yfrk1U8/AtW/sOFy7+/pcwLPrkhgRBxxDU7llBWorLr@nongnu.org
X-Gm-Message-State: AOJu0YxEEzzTfSVgnfxxc+Hoz8+pVqdkiGGrrZHgR7hp/6aT2IjNXfF6
 QlTpkibQ8cxgC1kjLRtFi8/Si82eigEPLq2hLkKKT46cGAdo4/rp+79Pj9Nlym8kNRA=
X-Gm-Gg: ASbGnctLcJQJaSWXmpBYclNVf4VLzjnA9FBEZSeC18hQcbzxwA4FRfvkbU7zyL60tA5
 OMT0O3tKqAQ6CiQBXYRub9aNVucJ7E01Np3AYDNRYgVzusc8Pugz4Nqwm62dr62q/wZ9xkPoH9Q
 dJMZGu5Hg17+KZSo/Ha4lK92C+fLg57Q95RpV5juCk/ox2OPJ8vR2fyjiZvVUEtJacbKFQbE2Jw
 YFDIWYdC3TaeYnqCItvAiNwt2VxLCLxO/jwR7jd9X6+k33Gh6sV9sjjv4jC1IWqYns88/iiA2vY
 2ZHcYggftCmsI4nEBgZDGHn2hCa2k/iGRWaENK0kH0SO+6b5itsjTh82FEXURVuOSoYnXruNLHh
 SVwMZmhy0X4/kIjV7rrcDI8SzPCwT6OKbmYMYEuIo
X-Google-Smtp-Source: AGHT+IGsRN98CLR/SnSeHPdzeX2G5JVsxXGdzEJ1R4aa9XDZtz9oWR739MAwjppOBRU5wik98J5g1Q==
X-Received: by 2002:a17:903:291:b0:23f:f68b:fa1d with SMTP id
 d9443c01a7336-24096b41b12mr122088465ad.39.1754003638658; 
 Thu, 31 Jul 2025 16:13:58 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976c40sm27705755ad.84.2025.07.31.16.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 16:13:58 -0700 (PDT)
Message-ID: <eac843f3-e920-4c6d-9c45-45087b41fb78@linaro.org>
Date: Fri, 1 Aug 2025 09:13:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] semihosting/syscalls: compile once in system and
 per target for user mode
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
 <20250730220621.1142496-2-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250730220621.1142496-2-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/31/25 08:06, Pierrick Bouvier wrote:
> We replace target_ulong mechanically by uint64_t.
> We can't compile (easily) this code once for user, as it relies on
> various target/function types, so leave it in specific_ss for user mode.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/semihosting/syscalls.h | 29 ++++++-----
>   semihosting/arm-compat-semi.c  |  1 +
>   semihosting/syscalls.c         | 89 +++++++++++++++++-----------------
>   semihosting/meson.build        |  4 +-
>   4 files changed, 62 insertions(+), 61 deletions(-)

We can at least use vaddr for the pointers, like fname.

I see syscalls.c already uses uint64_t in many of those places, but that can be a separate 
cleanup -- we don't need to add more.


r~

