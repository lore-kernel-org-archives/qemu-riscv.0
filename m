Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6L9W-0003z1-2c
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 19:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L9U-0003xt-LX
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:34:08 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L9S-0004PW-3D
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:34:08 -0500
Received: by mail-pg1-x535.google.com with SMTP id f3so2857985pgc.2
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 16:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zks5CY+W9Pho4LXKDAxl6+bG7Iz1efNDNfT4XHB1pXk=;
 b=CwZZBytAiRN9cUiS+lKT8jn4dh8eF8O7GLSdLnFWEsGdR/ayS4I7bOxASXvLIRrEda
 +NsXz1WKeXIp/oI51uqOsVEVzd+J42/0kypxMod7rRYfOjetAKQMgfFCkjbgoXuTpsL7
 MTVHB6536WeDT6GhY/clOwGJVqNukeE9CbSphsCZC3ODtSmXLDNvzNXRdF0CP05bBOy4
 8Ic2sG6eE4FAHteSR6ZMQsDePxE4gxIbvqEs9iMt1/U2rrfIMnU7MaQsWOvcleYoO5HY
 V3gfCnm8jRG5K0olGJwVMi3sZntJR+OWVrGfHlya2dlyYFiScKNAHZMmyyejCeNDPB2A
 ZZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zks5CY+W9Pho4LXKDAxl6+bG7Iz1efNDNfT4XHB1pXk=;
 b=1Jenp+je8U6VItS6scpTf4RuOZWUVNLr9z0GzGuifMY5Zkxfvt5QKNTWAFu6NQLlkA
 /BWxVXDrNKZHu2fz3GLS554V5pyMld4cUG1W5zB/86vcyMt4ZYlpDu6iSGeGshJ/mjww
 j/Iuv3qDLvgKjUZ3WLNVcBAAGNBD+69FcYsVgQDucwOx9a1LK/4N9rMQXiAFmn7dkkeb
 4EBfa55PGIyjzsWJXTyxxWbhk7ZgxcEsMANbRF1pkxqt7kWnSsSEeqw9Rsl84ekEiZyo
 f1JR8XFp/VoDH21cN87C5npmGxucgErFG5NhJOsVIj2hfNkdPfKxVSExGFvMevfYb7yw
 xKiA==
X-Gm-Message-State: AFqh2kqe3DQo4e0lCGKjuBV6WGnP6mKr1/g+0v+fHM3iVtHYkfWkpbx8
 6Bmk3aTp29xfCaEPUXdLf1Wj6w==
X-Google-Smtp-Source: AMrXdXt3wbHBozR/juTT5fozuutQ++NSiRDI85yiLJ/sA2jEK1oz5BKCbCJWkBHOew5lXU0DqNS9cQ==
X-Received: by 2002:aa7:9850:0:b0:566:94d0:8c96 with SMTP id
 n16-20020aa79850000000b0056694d08c96mr321268pfq.26.1671237244612; 
 Fri, 16 Dec 2022 16:34:04 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 v185-20020a6261c2000000b0056da63c8515sm2092151pfb.91.2022.12.16.16.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:34:04 -0800 (PST)
Message-ID: <28820b30-7a8b-6caf-2c4d-74a64a68beab@linaro.org>
Date: Fri, 16 Dec 2022 16:34:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 03/10] target/loongarch/cpu: Remove unused "sysbus.h"
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20221216220539.7065-1-philmd@linaro.org>
 <20221216220539.7065-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220539.7065-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 17 Dec 2022 00:34:08 -0000

On 12/16/22 14:05, Philippe Mathieu-Daudé wrote:
> Nothing requires SysBus declarations here.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/loongarch/cpu.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

