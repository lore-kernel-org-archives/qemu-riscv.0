Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661FAC71153
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 08:04:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qd4ZK-0008Sv-8Y; Mon, 04 Sep 2023 04:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd4ZI-0008SP-Fi
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 04:04:20 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd4ZG-0005Sv-8L
 for qemu-riscv@nongnu.org; Mon, 04 Sep 2023 04:04:20 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9a5dff9d2d9so173136166b.3
 for <qemu-riscv@nongnu.org>; Mon, 04 Sep 2023 01:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693814656; x=1694419456; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HBHAsX5v/kg5jXEKrOZ528UDCH4yVEwRiuDz1d09WgI=;
 b=czBic2jCJ7bfisWaDQRs3i2FmKp4UMfE3ahcaTG/rOtXkdKbDKziNcVs4Lm3k2PxMi
 aThwDAAB/NFVZdC6Heu+4RFoo1jU1nCraMCF+Pd2g2ry3jes7uL6EnFHwOjRneCnIA9o
 Na7r2mlvzw+z8siRT6WfCgVXptPDKUTgcasHnwGG68YxhFnJ3l7qdFhlh8/ePVtHwY27
 Sx/lKBy4jA9ygz+DUJiN99juHJqrmfc0kJliOMX77K0LRk6AC5nH57MgSzwEc5Mya3sk
 eMI1v7+ArPqALzbaIE4IK//WBvkNmR1XEHAvaMGCz9dTnbWjuvnJTmkJ+wBErLwtQxjk
 G8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693814656; x=1694419456;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HBHAsX5v/kg5jXEKrOZ528UDCH4yVEwRiuDz1d09WgI=;
 b=WA74tlG0B9Nmzp8uE0hu2WpzQIAvpdFw/9aNl8g5vQGAT9Re/GJvKF8ZWBDjUcIykL
 cWqVgAxOXIV2aePepW6EdDtO+F4vB8FR2Ax14WRT4hiYOYHxnedhqpO/XVroMPNnTaUw
 EZIYBfZZ3Hdz1+XlrhtTYdxWSuYLeDOvPReOEEST3GxOW7mylXWD7K0jJ3TCqefIBugf
 bqdMfe98VspPVBCljibzP0VPiXvBxglCTMV0sv5v+rDK87UD/I+OuDrOWiQqch2O2Wol
 IUhiuuwOnkz0MEWQYtZnO78ajb6ehOuy0VHpRX290G+aa48+07z0xB+mJmslXuVn5lJq
 lCJQ==
X-Gm-Message-State: AOJu0Yy6NL7QKZkM3t2P8l7+xl36ecZdHleJ/mZC+pD+Ug65gsD+Fy19
 sX0GfvNCxAVexvXVEvdh1O11Lg==
X-Google-Smtp-Source: AGHT+IHpMtrbngf+icQZZ41Q51ZmGEmZR3KMHkNWtWqegRlvSP7S5mKlfI6+H58TsNgsV5KxRhKYBw==
X-Received: by 2002:a17:907:7717:b0:9a1:c2fe:41d9 with SMTP id
 kw23-20020a170907771700b009a1c2fe41d9mr5802970ejc.47.1693814656603; 
 Mon, 04 Sep 2023 01:04:16 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a170906714a00b0099364d9f0e9sm5788973ejj.102.2023.09.04.01.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 01:04:16 -0700 (PDT)
Message-ID: <1ce87cd5-d3d5-759c-b718-8ba02f71bc9d@linaro.org>
Date: Mon, 4 Sep 2023 10:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v9 14/20] target/riscv: make CPUCFG() macro public
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230901194627.1214811-1-dbarboza@ventanamicro.com>
 <20230901194627.1214811-15-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230901194627.1214811-15-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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

On 1/9/23 21:46, Daniel Henrique Barboza wrote:
> The RISC-V KVM driver uses a CPUCFG() macro that calculates the offset
> of a certain field in the struct RISCVCPUConfig. We're going to use this
> macro in target/riscv/cpu.c as well in the next patches. Make it public.
> 
> Rename it to CPU_CFG_OFFSET() for more clarity while we're at it.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 2 +-
>   target/riscv/cpu.h | 2 ++
>   target/riscv/kvm.c | 8 +++-----
>   3 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


