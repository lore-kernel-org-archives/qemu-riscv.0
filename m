Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8MWb-0008Bm-SC
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 09:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8MWa-0008BF-A0
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 09:26:20 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8MWW-0006Tt-GF
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 09:26:19 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so1397775wms.2
 for <qemu-riscv@nongnu.org>; Thu, 22 Dec 2022 06:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qVMYF1NQnqL+VnCPGLRRHJVNSuO3JkGGXJrXIJh3ZrI=;
 b=OA9goBy9EHnCtMFDXWZhTwafy3gFeWQNed4G2l9VF1gdCMTy7RYFbgtWfnFqoLznMB
 QLo70PFNpX8eIF/dXr5gtcnio4pcawsLGQxcPtq3HkrmyxEMbSEKBNyFcB6HgSSS79zE
 V+b8aTqki/rgYYaS41OImMuZdbEZoIpp7UvTv5ZPgrVHL6OsH6ozaxNvJb6dx4A5Y7A6
 KsUo6rq1V2bWMHVoKp6EaneLweUTvYt8V8dgrPy/mLUcAnCpVpKpEKQZeKz4VpT5djPr
 jiFlsUJxVDVzL80p7tnAsZZyoCs9e9yX9cP+9+wBz1kcS8yuqswOcOvzMcMieO7HgPn9
 g03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qVMYF1NQnqL+VnCPGLRRHJVNSuO3JkGGXJrXIJh3ZrI=;
 b=FKUWKXYErx+oQEWRosRLHpLztHnne4sfXSd8Kn/gREaZjHwuqtnWu5ncyBGrX8U3Eb
 TjXaPVxz8TSqtac/sMj465RqIrPfmc91nkveqVwXVXuCQCAQt69fykZCEZi985Vt0dC1
 lGrtA7JNCZk61q0z72rOKtAB0gBOcOLE4FwsPZzeQy00jNNndp82cVuTY2bE6lCUwcHw
 MP3WRd+E2qWSgQGk1oel3PkoMWFiv0/K84r/uPRMt/DfnqE8I0ssmKVvgs2to3eXY7Tr
 ZAeHSc1VK31Wzg7laxEXQa9Kyl/Mmp8sEdnI4nXgjqaJLYf/w+vbe2lREt3dFGbMNMZq
 lJew==
X-Gm-Message-State: AFqh2krVRoHJg02WS3rb5YzUKG63MqbBVNRx9wYWn8d25/QgwdQwaa2z
 +aoBY03F1sIvWXQk79Dg1uBtDA==
X-Google-Smtp-Source: AMrXdXtD+l+t6QRiZiyUjO0JYuskk6mw97x4tSE4LoXjf+qm71wppnt6CNAWZhyeYqBfzpF6funyug==
X-Received: by 2002:a05:600c:4854:b0:3d3:5a4a:90ff with SMTP id
 j20-20020a05600c485400b003d35a4a90ffmr4715133wmo.23.1671719175017; 
 Thu, 22 Dec 2022 06:26:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0a4400b003cf75213bb9sm7000711wmq.8.2022.12.22.06.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:26:14 -0800 (PST)
Message-ID: <d9c8f32e-0d6a-2c42-b5af-209fa0fd199e@linaro.org>
Date: Thu, 22 Dec 2022 15:26:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 04/15] hw/riscv/boot.c: make riscv_find_firmware() static
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-5-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221182300.307900-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Thu, 22 Dec 2022 14:26:20 -0000

On 21/12/22 19:22, Daniel Henrique Barboza wrote:
> The only caller is riscv_find_and_load_firmware(), which is in the same
> file.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/boot.c         | 44 ++++++++++++++++++++---------------------
>   include/hw/riscv/boot.h |  1 -
>   2 files changed, 22 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


