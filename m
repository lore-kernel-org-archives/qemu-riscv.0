Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14E2CD4F5D
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 12:28:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qjfGi-0007kK-MN; Fri, 22 Sep 2023 08:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjfGh-0007jg-Go
 for qemu-riscv@nongnu.org; Fri, 22 Sep 2023 08:28:23 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qjfGf-000172-Ub
 for qemu-riscv@nongnu.org; Fri, 22 Sep 2023 08:28:23 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-405361bba99so16207095e9.2
 for <qemu-riscv@nongnu.org>; Fri, 22 Sep 2023 05:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695385700; x=1695990500; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vdD9edZJFR5hyQWtD9+o8rxg6ZfZM0/TVU9jp7Np4tc=;
 b=gPISMktZvCxVoUmNd5oU/NNW+kNkSgczkSq2byETU4EiSpmN0+DfnulbkhMF2+6MQ/
 p2KDFEZ3mmZzRbkG4ePY2Ibe9gC7G6ar01a0EF7R4m8ANQ9sHDtZEYc0KCuZZk3HzTyE
 wt8XmjJUlphUs6KNX9PxBS7dHzw2I9ma2LW1JLiOu0fVbPyQ2a8NB3BuwDtEHOGkJ7qW
 TaxefBPEgGhjgO6w/2Ga0NBxBCeWSEX7ZC3FEz385UI9wXIRFWb3eLkfD9gUU+c+iCSz
 MGDSE7SSrshrniEK15C2LMYIfurdpRo/JjEBDSVwHKRV3K5AJfWQs/147I3Uwp4kajPq
 ZiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695385700; x=1695990500;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vdD9edZJFR5hyQWtD9+o8rxg6ZfZM0/TVU9jp7Np4tc=;
 b=Z4OQ+ZpUrv0OOO6jXrAt+UeGpHucexoWWJN056Bc/xVPFa50jGNetErL+5sIneNL72
 dR56Ia/HkUxHgL7r0NKP+qtdJqfmrfJfKGEvLV1+im6zZIWKKC5ZAxzcuI5hDRbmp9wI
 qUwasM19ZRGute3rMMWR8KqVeC6fbhXRyYSkUn65KaV4cF4HWcGQEQmSFOn8pUv+1KUp
 +nPFHzYvCggTH9bRHvAuGzrOV2BXKo6BOZqHIDvfV4lc4LSKb2uec4n40QGIw2CxzAs8
 JDMh9DocDAI95ea2niLtI7+Cu4QvxcjrkTbauvUiclsSe4nSvbFXvezMZBDkNBDQyrEY
 mgqA==
X-Gm-Message-State: AOJu0YyE1v3LDz5Ib6j9q2OhKnld5dTv9SyKUxNvEAh00PyGnN2Zeezc
 K03Kt3+XsZ2Em7yFXOt/d6+8pE0zeKtD1tCpXJtS5g==
X-Google-Smtp-Source: AGHT+IGawSpgn5uSrrIkMmt18Q7HzgN50xeDKz4/76qLAR6ceNhCZrcw8O0p5jH9Iq47SZCeB2rDGw==
X-Received: by 2002:a05:600c:2901:b0:401:b76d:3b8b with SMTP id
 i1-20020a05600c290100b00401b76d3b8bmr7441089wmd.16.1695385700193; 
 Fri, 22 Sep 2023 05:28:20 -0700 (PDT)
Received: from [192.168.19.175] ([77.205.41.220])
 by smtp.gmail.com with ESMTPSA id
 23-20020a05600c025700b004047f3b73f9sm7387258wmj.21.2023.09.22.05.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 05:28:19 -0700 (PDT)
Message-ID: <624bf5a4-2b56-1ab4-e2f4-1608061ab4c7@linaro.org>
Date: Fri, 22 Sep 2023 12:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v3 19/19] target/riscv/cpu: move priv spec functions to
 tcg-cpu.c
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-20-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230920112020.651006-20-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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

On 20/9/23 13:20, Daniel Henrique Barboza wrote:
> Priv spec validation is TCG specific. Move it to the TCG accel class.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   target/riscv/cpu.c         | 38 --------------------------------------
>   target/riscv/cpu.h         |  2 --
>   target/riscv/tcg/tcg-cpu.c | 38 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 38 insertions(+), 40 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


