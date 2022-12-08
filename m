Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3EIQ-0005tR-DY
	for mharc-qemu-riscv@gnu.org; Thu, 08 Dec 2022 05:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3EIM-0005sn-Ql
 for qemu-riscv@nongnu.org; Thu, 08 Dec 2022 05:38:28 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3EIL-0007Ak-4X
 for qemu-riscv@nongnu.org; Thu, 08 Dec 2022 05:38:26 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so692126wmi.3
 for <qemu-riscv@nongnu.org>; Thu, 08 Dec 2022 02:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ajxUG1uNemcbOAGNzD2GhzVxVvzgvXZWBkmyDijuG04=;
 b=IIoDgdGP7ltZWCUgrEt4BCumKbliNOENRz6/w9VEbTCdUoD+Ad8anXUtgHzQU46HCd
 auzQV41/eQNlzK0qnCShjZ/3+rTPzbGDdKeS4Nu17hq4cE1oetAbgYp04Gij45q1ChTx
 bL048Ib7kOv6O6364WsJ8rIuQQ6zqVGXxBaDzcJeigBq/Wt/DwzzVqQi9GUlb6+euKu9
 7vHbU2BE5lATtQf/Tsxi9JTtkjc6sgH974eJQmgjm51ViWZaKsSKD+dKTcsUHHbeb0/D
 /xKJguFh0E03WPunQmp7f1n9ooAlgmwi5iGPXLnZfkSanhs1cEPeT7y76LtE04aHMtmL
 WbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ajxUG1uNemcbOAGNzD2GhzVxVvzgvXZWBkmyDijuG04=;
 b=x3Crn7ma5LxSAPRtwQO1pGN19Kd9DGWrkofG2hgpXp3LEfXtE1Uqhk9xWhHEkyC7//
 kMYYOT3SwPE1dwGBSn3oclfUwWzc7X6izDouVEXgDZm7XIThKtPuuRgN39iiXJPqjxgA
 EVArNAM+uNNCBYlZQhIjnvv8NeDnaF4TL+U7XLyTt+4NV5TB/H/uOszbF5tkIeJhzcNE
 hke1DxxiczoG3VAQyGoGykOjELcYgrNScGBUUCr8jbpMpIz7eGttosS6qAcWwW+1WmJJ
 BfaiArZBV4Zwn3du+tPb8dwEOds5PS28k24m62YP9Yr5Kj8v1+NrnGUR812bhLmG+wnl
 zD9g==
X-Gm-Message-State: ANoB5pkmueHInu6pvvV6y1MMqfW5l1Xsrs+RFJ6j2neLFLvZWic5qTeM
 5iMWQGMGIt5XoCPKaUAnLKh54w==
X-Google-Smtp-Source: AA0mqf54aYG/JctxdKc4+7cBWhqzod77UghJ+4aJVG60dBg2b4yxpqzXkasd60/PjLM1/4BEKezZ+w==
X-Received: by 2002:a05:600c:298:b0:3d0:a768:a6f5 with SMTP id
 24-20020a05600c029800b003d0a768a6f5mr14159793wmk.117.1670495903231; 
 Thu, 08 Dec 2022 02:38:23 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 6-20020a1c0206000000b003d1e90717ccsm4426482wmc.30.2022.12.08.02.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 02:38:22 -0800 (PST)
Message-ID: <f68a41a9-b615-07c1-ef94-04f48018ba0e@linaro.org>
Date: Thu, 8 Dec 2022 11:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 01/16] hw/riscv: Select MSI_NONBROKEN in SIFIVE_PLIC
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20221207100335.290481-1-bmeng@tinylab.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221207100335.290481-1-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
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
X-List-Received-Date: Thu, 08 Dec 2022 10:38:29 -0000

On 7/12/22 11:03, Bin Meng wrote:
> hw/pci/Kconfig says MSI_NONBROKEN should be selected by interrupt
> controllers regardless of how MSI is implemented. msi_nonbroken is
> initialized to true in sifive_plic_realize().
> 
> Let SIFIVE_PLIC select MSI_NONBROKEN and drop the selection from
> RISC-V machines.

12 years with this inverted logic... *sigh*.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> 
> (no changes since v1)
> 
>   hw/intc/Kconfig  | 1 +
>   hw/riscv/Kconfig | 5 -----
>   2 files changed, 1 insertion(+), 5 deletions(-)



