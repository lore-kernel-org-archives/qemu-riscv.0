Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6LH4-0001kI-3I
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 19:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LH2-0001jk-So
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:41:57 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LH0-0006Ma-BK
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:41:56 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 z8-20020a17090abd8800b00219ed30ce47so7692257pjr.3
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 16:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iHMfgcJ27mHobZfw2i+QqcqBFZLqxaTDvDgPVYSK/Gs=;
 b=IV90rSZeI+X+b71xJwvuSM4jeFsayik/aGUOLIayQt6UfMfvcsoysxZmaQLbu5jUtD
 2E6Fcd+znKtlr3oTw9pdGYzkolKp1AtZJkuTjP7lStRgQ1pkrL4fL7TkXnVLp/jOZ/jD
 eNSdcyuInLTCJ/EuS1aACiNtrKRYE8s5PjIL26QGunHH0+WqJEFl51jopMtjbuJzSqT9
 SK3K522C+0LYx7ycRlCRPcMlEfIx8qk+tooOZD/XhpFy0+0ATMlvoCUlTxGIKSuUlG+k
 hqqCrTU6SsMdHmwsg9eQO+v90BiM32iY0kHLQmIuvOKXjerOQD5eoPOAMUBQvOnT17AO
 XGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iHMfgcJ27mHobZfw2i+QqcqBFZLqxaTDvDgPVYSK/Gs=;
 b=3R0VlP3pJX1YiYm1ut3BkByyr1LSmM3W6bUvUpxOHSJcXsG2TFgKcJ0Q8c0kkl1gKz
 yNZzMqqIfHkiMs9V9b1CJIPB2B7Wo12Mo6RcpreJKu6ofMsnz8a7OKZqV8bU/uxwC57x
 cDMnE3khTg2FmpyQ7KvgPoPGDqpzfdjzTUrFxxfa8tvJFSgmqpvNsaRFctO6rLJY0b2T
 TtSpUsYwH3zGM/jEuYX8AfktguvCmVQvZHPpCDR8xUJRxUAURmV7ay9OaWuMX5wqojeA
 o1wP7bg2E7R6RA5qgzy7TT6ZFqxHErxaISDDKRxEfh7NDf17PfYurDJA/UbONNKXX1kl
 XmcQ==
X-Gm-Message-State: ANoB5pkunU5mRTTlzRub4cycZ/H/7kwm8Yp73c4f7KGDkTLwmKfsBMx3
 VAZIcpVkEx8G24M70N/GhlA75w==
X-Google-Smtp-Source: AA0mqf6uTH/UGr/SZu5nUREN9+9OrwnoFUCeKOMyOIfFnSgIcOtXAn2HBQzZASSdNxSVqSyXZEMXpQ==
X-Received: by 2002:a17:902:c3c6:b0:18c:cee:b265 with SMTP id
 j6-20020a170902c3c600b0018c0ceeb265mr22308290plj.53.1671237712825; 
 Fri, 16 Dec 2022 16:41:52 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b00188b5d25438sm2234152plh.35.2022.12.16.16.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:41:52 -0800 (PST)
Message-ID: <12a2f05c-16c6-d1b9-c151-e33739ed6397@linaro.org>
Date: Fri, 16 Dec 2022 16:41:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 10/10] target/xtensa/cpu: Include missing "memory.h" header
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
 <20221216220539.7065-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220539.7065-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Sat, 17 Dec 2022 00:41:57 -0000

On 12/16/22 14:05, Philippe Mathieu-Daudé wrote:
> Under system emulation, xtensa_cpu_initfn() calls
> memory_region_init_io(), itself declared in "exec/memory.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/xtensa/cpu.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


