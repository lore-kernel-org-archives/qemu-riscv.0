Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZCLq-0003uz-3z
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 10:02:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCLc-0003kj-DP
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:01:59 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCLY-0003aq-1T
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:01:53 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so5379917wmq.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 07:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678114910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d9l8Wb9rD04unvlF7l2JU8eMediQ9LSHTCR1K+oiIDI=;
 b=V7gxM8Tu3KJRKKtl5O11MYxEpon81r/ymQGfbh/VMRQ84o0OK1xKIwJMZAOVxQdFqB
 jBkPTR3Z5vpj2REsJnXAHhVKOE/r/Muv8MfCdT+Mz/6zipigRPwFzZbvZwWRyAIiSRdy
 SzkaOe4W8J1uKph4hl2pLv+VvYy5F1AmR4aLhLfpGgCc2jU6jeRLFqzOJsLjIH4rxs5J
 kwEM2xkPPpD450kFMwKOuy6biHrSRpR1Z4zl2noSLgnxIO7kuyZ9e4fBe4vMEH1pUnlC
 Z5mVqgi/Roy8mQzQ6d6i99wl7eqrIsIDqgqxfcnsfTWBEcjIcWFQyZSf9kdW2irQrdGo
 PHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678114910;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d9l8Wb9rD04unvlF7l2JU8eMediQ9LSHTCR1K+oiIDI=;
 b=A2ioVJj8BFE/Llg4zDJs8euD82406MyZLMgOQl9kw4EFr1a/yrxtzTC2VOXNMvPoE6
 nC+DFxfWpJ3VcWBZVxRrT4QY9LHPRz524o7Ed9rHuVR0RBH3AcWCdWT41gyt4OFqitVp
 NR2quyXFirP0dJ8gv6UuiaeMmx0NADrkp3TwNTln55NCVlcAkVN4fgxsyCQTkxObIWiT
 AIR2iUh1PRGJzUeq+8l6+UZWP2I95Hzf/ATU2G9eb5i/JmxCehvaFvDjpFO1lobpBcY6
 jomDvOGL2Y/zXyEnjVF5/jFHUIIoSxjyrYx87bjx0areOt61yJtn4lwJOOOIufFtH46/
 JoKw==
X-Gm-Message-State: AO0yUKWtF44LeBNaWD6wiWvSJ1QHYfTwv7XBoPu2Tzm7hqu68TQU/NwG
 XLUZR94PiCoB2oTtJ/CbHlHbgQ==
X-Google-Smtp-Source: AK7set/thmR+KbR+jFy4gJzk1wPkKhpUwCXMt3rMf/LDSgKdp54NsUCO0+ZvIeeIxKg1XCKKN51TTw==
X-Received: by 2002:a05:600c:4ecc:b0:3e2:1d1e:78d0 with SMTP id
 g12-20020a05600c4ecc00b003e21d1e78d0mr10723030wmq.22.1678114910569; 
 Mon, 06 Mar 2023 07:01:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b5-20020a05600c150500b003e91b9a92c9sm10327581wmg.24.2023.03.06.07.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:01:50 -0800 (PST)
Message-ID: <bb13d4bd-7e8d-6238-5a63-1de572a1d58d@linaro.org>
Date: Mon, 6 Mar 2023 16:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 65/70] target/xtensa: Use tcg_gen_subfi_i32 in
 translate_sll
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-66-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-66-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 15:02:03 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



