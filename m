Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3EKD-0007wO-PE
	for mharc-qemu-riscv@gnu.org; Thu, 08 Dec 2022 05:40:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3EK5-0007u5-MG
 for qemu-riscv@nongnu.org; Thu, 08 Dec 2022 05:40:15 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3EK3-0008Mv-JO
 for qemu-riscv@nongnu.org; Thu, 08 Dec 2022 05:40:12 -0500
Received: by mail-wr1-x431.google.com with SMTP id m14so1098763wrh.7
 for <qemu-riscv@nongnu.org>; Thu, 08 Dec 2022 02:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7brmFa4TPoN8NgdW3pxFpw8YbOgy6q2ICxw9s3y/QH8=;
 b=mfIqygBT9oLdXJbqOhuKgnN0qWK7Bk4uXNUdcwUCYNuJbHXDJnXN5HqOo/MTgZ90/n
 iA1+VFKhPeL1eR08Egu1qjWZfhNfxMtl/RAc+VLb2DAWVoXrFssYbmNidkfXz/Co4dZY
 l45HC2e1Feg+wqn7HHY+CBWyi5VEgeNQ/wi6wW3ZXOkYPVh/AAVGglOxhgCLTNafxgde
 aU26AqZZnVP/CVL2vh0NIEWKTwRe4aLYmQSIJHOkxEexVq5otxUtpQWTOkfaJ6iIY1mJ
 cqzOIJhOxiy53bgaWFiXcl5lUiuy/RbRs0nzaDEwqtISINPz8mlJfdpool2Pf21ASrdj
 ghTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7brmFa4TPoN8NgdW3pxFpw8YbOgy6q2ICxw9s3y/QH8=;
 b=1PVUiQwXnMaHANXY/Xm0YVJZ2gC6Qh/Mnl4BIbtn9azC+r1LApusMbpvuEpNs4TcBP
 zDiZ2SgowYXGDivWmWqHX/UdhEwAGhk94RdUYKz15Meq2LKuTlqwWF/CXJa81PCLYJMd
 J1Ud6tm0ib09nxQG8bT7yq16SC1KTYz/DeF8kAznsfScPKfwOSDxHpiryhbtZK64lrSU
 U67HzXNFp5Rzq2CHnEfq/abWtOEygFoIfbIdepyOOmk6fOrMae380bXl/5xXmQhvLlBS
 i+yqNHCAcQ0FTlgVAu5aA5ZQ744FvJ94/TkJG3zzOjmkcg/ZTDNceMqSpNPdXN0my2DF
 nObw==
X-Gm-Message-State: ANoB5pnNK8v+6FgFiamj0sNp4+ZskoBbGIbQIoEJsPzsHEEIiGlepbGC
 mqI5FRoYpkPYoYTwmbHhtQ5WIsYQhWToIFk5Jtg=
X-Google-Smtp-Source: AA0mqf79/9CnnL7dLKqPrXZ1Mx/SXIbBC6Py+M6P7a3pVMowyxTGOEI/scQ02vyauLcnK6Ur5OEwqg==
X-Received: by 2002:adf:df8b:0:b0:242:56ae:63b7 with SMTP id
 z11-20020adfdf8b000000b0024256ae63b7mr11886046wrl.90.1670496010174; 
 Thu, 08 Dec 2022 02:40:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z12-20020a5d44cc000000b002362f6fcaf5sm21818942wrr.48.2022.12.08.02.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 02:40:09 -0800 (PST)
Message-ID: <c1db9755-1c78-0a21-5869-6630f4829409@linaro.org>
Date: Thu, 8 Dec 2022 11:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 08/16] hw/intc: sifive_plic: Use error_setg() to
 propagate the error up via errp in sifive_plic_realize()
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20221207100335.290481-1-bmeng@tinylab.org>
 <20221207100335.290481-8-bmeng@tinylab.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221207100335.290481-8-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Thu, 08 Dec 2022 10:40:15 -0000

On 7/12/22 11:03, Bin Meng wrote:
> The realize() callback has an errp for us to propagate the error up.
> While we are here, corret the wrong multi-line comment format.

Typo "correct"

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> 
> ---
> 
> Changes in v2:
> - new patch: "hw/intc: sifive_plic: Use error_setg() to propagate the error up via errp in sifive_plic_realize()"
> 
>   hw/intc/sifive_plic.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)


