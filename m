Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF222CF9C51
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 17:16:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vM8Gd-0004Mf-GK; Thu, 20 Nov 2025 12:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vM8GY-0004IQ-Ni
 for qemu-riscv@nongnu.org; Thu, 20 Nov 2025 12:16:19 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vM8GW-0005jX-HP
 for qemu-riscv@nongnu.org; Thu, 20 Nov 2025 12:16:17 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so7244175e9.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Nov 2025 09:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763658975; x=1764263775; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IhBSD6LO/ve6A4g/Muw/8ItZECnAEBxHA2OnsgRjHOU=;
 b=x6teF+EHW4qGFwKY24CudCITOEkdSYdqgfm2CORciC8ST0st64TtBhzoJKq4jIthCG
 UZIDdlRumGBBubsKy5ZZTdTLwWeewZQY6/XTFjgFELtwViGiceshdotek5SAT5bdXwXM
 tj/Eu5KwLLmRh1Hitmzr5a0YrlPcO4ke8rk30zVnnfArQxaHU+BXnXxqi9dFQJlsJMbp
 j5QNIteFE3G13IY93c4rLb2wcOaXpj3sFyzEdFfrX0e4tMn2/N0km9e9cghn5nbxAHeG
 BCVcZqE++tjY/1MfKLIpgT2dHBRF8dyeoMO1fqtfJSdDS7SrTgQDs5hlNYI9/0S+odJw
 SMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763658975; x=1764263775;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IhBSD6LO/ve6A4g/Muw/8ItZECnAEBxHA2OnsgRjHOU=;
 b=JK5npmuopbUG+pA66ZdGQ8wp4jQqeVKoVB5P13bNxQAQH0QL0rBMrDHx8yAWEyAwjf
 FqI77ykNqdstf+9/P7ClPKGRdXG1q/5+/i3GQkJr8i8ZW06Ahl2G/agLC5PiGAeyM8gs
 TVLLGMpgeXNDyqDS2Ut0my3kaicyRsF5qKMJ1sB4eZoWZXlKkGw0OZXuBkAK3MVvJcFm
 yKF6PF8Vil5ixNvi2JvOrV4ZCwa4SijCugBKIK5fWJEF4cICBT7nPs6MTCkUFCZz4TZk
 wKgaqW0s1D16IY1w15zOrVIuo6mKoAuDUNx35ZcApns/cslVrjm9A5ge1+ufxEf7AMMO
 YrjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmM1ReO7Z7Uw5L/C2hc7eP84tmNBjicZJo1+57I8ajSkAOPat6nvUKOLwMzh/v8rM24IDpJfz3vkvo@nongnu.org
X-Gm-Message-State: AOJu0YzKrZ6aEtK8qOho7dLmkRFJoW4CQ9mpHFjkZPJHWbyh9gzoIv4J
 a7ss4QyGH4K+9nzf2GPH4CVQpHn6Pr07S28jRb5EEsNlJ2RW0mfypLBBq7wUpvO7a80=
X-Gm-Gg: ASbGnctcjpEIGRwJz7rGvUmmCVbj4rCpytNsdFXDXbsBkQupYRWZNlNNmtttJ3KHlX/
 j/xaOE5TksF2KGg6mE31LFUqnl1BriGRUmwS841kCEzmpRDs3f5tJzNc/bQ8yqIbyIRUOgeI/fT
 Xt/+XPrO/A9B1nBDwANdgvQMBU9xVzPKcNwqlXiZJo4q3PVwTarvR70Tw27HY0E7c9XD7sFtWAp
 HRMA6V7MVfAQco7mhTr0PgFSs9Y2+xfmgtGhiX7kMkr89+weqehk0yiZP9QHUHr9eADgE7i05bb
 n5PM8AlND+QAA504198aqjx4xaLxQqDWIzN1Mdy+PHCkl5UT1wWiSjHFkRQ34P/dBjSQjosArlQ
 yRPvdsJddTvVAqYvaY/Qu838aFRI20/3mBFw8Xxj6mUkineGGhaZfzzGlTbJvITxX1z1SjtQ3AM
 B7k+M1HJnpkxCT12QlidvVWnY9WTsHCOIxykMbIC466WeXFIaUmYTThQ==
X-Google-Smtp-Source: AGHT+IEBKj4hUm7cKaMaSihFWxyofkIrtRTmeox1NNVvqpvpZjb+ZNGgzCo4brUk5BlmMK5z0hQpxA==
X-Received: by 2002:a05:600c:450f:b0:477:429b:3b93 with SMTP id
 5b1f17b1804b1-477b8a9f1acmr37102295e9.18.1763658974715; 
 Thu, 20 Nov 2025 09:16:14 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7ec454csm6093202f8f.0.2025.11.20.09.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 09:16:14 -0800 (PST)
Message-ID: <a5e9c465-5c4a-403e-8768-bf383256091f@linaro.org>
Date: Thu, 20 Nov 2025 18:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] RISC-V CPU time source interface
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
References: <20251107102340.471141-1-luc.michel@amd.com>
 <aRb1jmwXE18JB2_g@XFR-LUMICHEL-L2.amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <aRb1jmwXE18JB2_g@XFR-LUMICHEL-L2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 14/11/25 10:25, Luc Michel wrote:
> Hi,
> 
> Ping, patches missing review: 8 and 9.

Doh sorry, I don't remember why I stopped... I suppose I got interrupted
and forgot. Too bad this missed the soft-freeze, now we'll have to wait
after Xmas :/

