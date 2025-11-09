Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F030BCCFA1A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 13:57:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vI5uz-00069g-Ob; Sun, 09 Nov 2025 08:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI5uX-0005rB-DM
 for qemu-riscv@nongnu.org; Sun, 09 Nov 2025 08:56:54 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI5uU-0003Df-MI
 for qemu-riscv@nongnu.org; Sun, 09 Nov 2025 08:56:52 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-640a0812658so3368384a12.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Nov 2025 05:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762696609; x=1763301409; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FXyWkcRB4xLhqbx591avjGr1JsFf+qkK+7mD7HDG6z8=;
 b=MkGBna0VBYxGvpT74kNLqjvE1vBfesbVeFQoxNvqkmjC0GTFKKcncixv4ZjJsdRkEo
 og73CTTbfr/pTRf38zjwclZoZNji7PUlXu68XUwcu3Vv9bl52WCKyZP+9Cn1UuQTyvJU
 yZDNCxKsdkX5nfH0PhmNxKoCeAeC9defo+ehYoINSd4LVryglnynvRTwQAMsNNC4G168
 6t6VSolFbyyIZixIAll03swokwPl9t4wPuD2hsKrHENfOIAySLm4J/rzhphbSwIjCKXq
 RKQzOc+DGQlP68ZXhQpBWIGSV/pOhk3bJQATAPd+W4BRDJX1jVoQtcY9z4ho2vYJGg0l
 eQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762696609; x=1763301409;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FXyWkcRB4xLhqbx591avjGr1JsFf+qkK+7mD7HDG6z8=;
 b=hAkMKXcyFfSAH7YaunabWv6qsyjIXX6ZJLGOHDjviED5P0zFSW18ZXoOJfzJIsqw5R
 TwGjUUHPda1G5mhoeC5DJFLJ9E03Xo+Lm2KHruRYwXUHvMusgNXND8jW0VENlBVhJT8j
 4CIhOTCL+RY8NNp9uhlgaF4F6JrfkQLr2uoyWy0rJhby4C87bWXEt8tBSZi8aIpajr7S
 cGs47UED9XH+zUvkJktNEY7g6UvCqziKCxJmK6btFznST9e7CZf8/G0H21nlyhBHE37O
 H2R+byeh6ly2zAMzUDUJ6q8Twgt45mzdu1DF7H34z1mKWSyfM4ZYRQOKoNBhcYIQ8BMG
 0izw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH8wk5LJ3t8HsiyXXqWV9A8QSTtAsDzybH9hKEF3BOTgPC3QvEKTHPTasx70LLHgvicHLuf76ex2i8@nongnu.org
X-Gm-Message-State: AOJu0YyusfExMNUAVGsZGinNKRqb8KqpMKwlX9U/zxoLe1bFbxoeYi+9
 gF9BnSrb7tIfSPTgcbwVJOG7eY9bUqRVJvi9rfwLQc/RR3hdpXBBvyi4QvMhax7WMFY=
X-Gm-Gg: ASbGncumZqc97jOtT+zQ/ueRWE0Sm3UlD9kzrFDLVxAVawDj0gWbcxkiDPncyWsSlMC
 NqDhMoZ3az9L49B8ttrE43IxYYr1wXpzeV+bNJOTtbflJTY2GicZHO1OR88S3NBAHcW36AjHbo+
 ycq4flLHdWTFTGxBIjFT9CohgNjkCdqf7VVPeU/+lxwMT+R9rOdx6G5jOiaCof3ZPIBMBQnPHnR
 H6kdoQZI78asgYG62w4Re+EWfuyF0dRCtSmJ0aUf4fniFUCQTt+kyCbfHfn1bMnqpY7zl2Osp7u
 RXDh6rJsjykA5Hg+mI2XjmFJ4cQD5F6dUkTZ9TO32UIW1FrMbn6rMPl2HTjoqmpIaoaTnTBCeut
 CFZiMOaqhs3/LR6tv+9Y3vye3bsVf9iabdslk+ozNPvBdN91tHRKG9fWowGsR2HqY8EpBSSYe7A
 DcznmadWHs3hS0c89SaCzh0tYxC/RvO3HkYxyFwMlJl8nAgT0=
X-Google-Smtp-Source: AGHT+IFCC7BjoObcMWhLaPE3JgaWE4Jy+KhQMFCHAUSpLEz1LLknJItQ2/MgnZ7VuLtOSaEv3Julfg==
X-Received: by 2002:a05:6402:3546:b0:63c:1066:8bec with SMTP id
 4fb4d7f45d1cf-6415e81d8d1mr4106416a12.35.1762696609097; 
 Sun, 09 Nov 2025 05:56:49 -0800 (PST)
Received: from [192.168.2.7] (tmo-086-152.customers.d1-online.com.
 [80.187.86.152]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f862bd0sm9102037a12.26.2025.11.09.05.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Nov 2025 05:56:48 -0800 (PST)
Message-ID: <0a7bb9a8-c2c9-40b7-ade2-ea6c2da17251@linaro.org>
Date: Sun, 9 Nov 2025 14:56:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] hw/intc/riscv_aclint: rename cpu_riscv_read_rtc to
 riscv_aclint_mtimer_get_ticks
Content-Language: en-US
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>
References: <20251107102340.471141-1-luc.michel@amd.com>
 <20251107102340.471141-4-luc.michel@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251107102340.471141-4-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
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

On 7/11/25 11:23, Luc Michel wrote:
> For more clarity, rename the cpu_riscv_read_rtc function to
> riscv_aclint_mtimer_get_ticks:
>     - The ACLINT is the time source here, not the CPU,
>     - This function returns a number of ticks based on the timer
>       frequency.
> 
> Rename the _raw version of this function as well and the local variables
> storing the result of those function.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> ---
>   hw/intc/riscv_aclint.c | 31 ++++++++++++++++---------------
>   1 file changed, 16 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


