Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6LCX-00054R-Fc
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 19:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LCW-00054A-L1
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:37:16 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LCV-00055V-0w
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:37:16 -0500
Received: by mail-pf1-x42f.google.com with SMTP id x66so2851792pfx.3
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 16:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c/EO7Y8IHjprJ5UK+EbUnh+huTsWLG5h8Kl/G+9GYm0=;
 b=tjmPg8JJg2UvBDRLr3eB7v9aSJ1ixhmsCylrfAZpF05HGeIpYPvzi0h/gG/fKoziPI
 9kU65YqLYU4gkOLAAiYkRCvp9GselywmE1GgobVtVvOuZvuLQWzYhRUuYijp36jW1mjh
 RR2GEgvXn83Mpy7AnDBJhOswlQyJIbjYXFb9APIgmMroFb8b+iHH1WIuxz4jamW5802a
 1t7p1+OBgpiKbup1Idft/NeVsSFMqz87o8ZG2PYZp7VOPlYsARYe/nyEV/8/0dpNnUn4
 cGE4y6or1Wq2jFoL+XlLP/6uzOfq/aewJLWnMPYlPwHfFa8Xuub0IbSE8HA3OshPJJ1R
 RsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c/EO7Y8IHjprJ5UK+EbUnh+huTsWLG5h8Kl/G+9GYm0=;
 b=4npZ1x9JptBCd8H7LjkExga2p0mgb/9Y9MSF8aYoIq1H+QCnO4wqCx6ZcAYpP4eZVy
 AJHEns32/aaek6vOdecP1gM0kjsGqaY+bXKqWTgagQpI5lxSeygfRa10CWURQ90l5d36
 IAY/ehdtBJcFv03pSreBUiw4hzfVfME/0xoPuWcG1g5EP5nPIN22+8lH1hZb2/1vwAkB
 r+xK6IQHdDXp6c9Aaj4Yc1NAnAynjL1V5w2mJ7sXq0VBWIv66zQC/VGme5D8M/Fl3ChA
 BnDetiDExE9YkkE5wLa9uEhEGciNO2zL9ph8JbNGWwixShc4qaM7yvXznEj/mhl+HAtz
 35JA==
X-Gm-Message-State: ANoB5pnKv89xN3DTAngLUUTbmpYRQFto3bGY+ZRPhPXc/H0JrcCnd3Fk
 CVs4hrA90278p0vu9pC3z9NihQ==
X-Google-Smtp-Source: AA0mqf6n0unR4/iuC61M5wEsQxVXFyqdk99C5rYxWTybfDRi4GChMykNAD9eU0buW4nqpCiEM2ZiVw==
X-Received: by 2002:a62:3342:0:b0:575:ff07:cb1e with SMTP id
 z63-20020a623342000000b00575ff07cb1emr31753752pfz.31.1671237428081; 
 Fri, 16 Dec 2022 16:37:08 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 d62-20020a621d41000000b005625d5ae760sm2128994pfd.11.2022.12.16.16.37.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:37:07 -0800 (PST)
Message-ID: <b98c5217-9d36-0c16-92f6-2fc6ace2016c@linaro.org>
Date: Fri, 16 Dec 2022 16:37:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/10] target/loongarch/cpu: Restrict "memory.h" header to
 sysemu
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
 <20221216220539.7065-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220539.7065-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 17 Dec 2022 00:37:16 -0000

On 12/16/22 14:05, Philippe Mathieu-Daudé wrote:
> Missed in 0093b9a5ee ("target/loongarch: Adjust functions
> and structure to support user-mode") while cleaning commit
> f84a2aacf5 ("target/loongarch: Add LoongArch IOCSR instruction").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/loongarch/cpu.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index c8612f5466..2f17ac6b47 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -12,7 +12,9 @@
>   #include "fpu/softfloat-types.h"
>   #include "hw/registerfields.h"
>   #include "qemu/timer.h"
> +#ifndef CONFIG_USER_ONLY
>   #include "exec/memory.h"
> +#endif
>   #include "cpu-csr.h"
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

