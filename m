Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbXAi-0001Tc-IY
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 20:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbXAh-0001TG-0S
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 20:03:31 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbXAf-0000Mj-5I
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 20:03:30 -0400
Received: by mail-pl1-x633.google.com with SMTP id f21so7359457plb.3
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 17:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TywXgvkhx8QJZQ3wufUTkXNeX0b/R1SGSwCT8WI6MGo=;
 b=gE1dg1RksifSNpg/z++rCOc+P6ul82gaMuUKzWMRWanMri0ntpd/TDI0eSFiUYiW15
 ohgzsTaKovqrt1DVXeyWDwkwDC9Bnr3IY6Ex6eZ0HSf6aBostaFlflaIAsLa5sfZJMSN
 Tec0ix+UKqShb4eEPBSfv2Edol75rFDdCZaCcvoEwBWetjwuYzuXQl4umbHvtH1KKjl6
 7Qg12DSOL4TFIhjbMJGmyblfmbhaIoS2ySb8p8gw3UZHxYuEbuKMxBH0JiT9cQqPnoSj
 DVrMvqVLe9tevzq2orVapRLEJlUK6SNgcp7nGNxiQeTWCDhh3UAFnYwx1ZOJS1M2eXt7
 LqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TywXgvkhx8QJZQ3wufUTkXNeX0b/R1SGSwCT8WI6MGo=;
 b=jmbmZx1h7W4qUKgVwrUk0nMfZnnpCAxEvW+R7uIm6rW3z4/feveikUG2+qrLSMYC8z
 UDQESuGFNsnXpp0fx2axLoTvnsUwwV2RKdH7WKQdSeMfl42OHWMZCw1s7dE6t4bZ9lpJ
 VxdBXGy3MDzcqAVMi3NpV4VrqI6BcJqq2rauiMUHPkblyb1BF9oBZpfMO8rrpHwWS7Eb
 RTP0kp9qlHE1ZvB6GjCq0/trjMSe2RNhdR0kntZQsQELWk3nKsA6dXd23MG/LmLUatWp
 HerrReZlR9c33JUtWv4rL4rGOVDaOHo1rgv5SoTD7P7qLFJWmXUWTnMraS5yeKUpf08c
 Zfrw==
X-Gm-Message-State: AOAM533Cbqpj9VtPxEBbu28q/r8WSyqBZAxZvq5qwUlZmJX3VraMTm6i
 9N3mWpvdeRfkCiAjIHEW1b5TsQ==
X-Google-Smtp-Source: ABdhPJwJ3WsgkscEo9IQHj60Oz5Y68lUIow4nmHP05xxI05YTMPxtihbQ099Jt+vqLZzXG7hwpr6QQ==
X-Received: by 2002:a17:90b:20d2:: with SMTP id
 ju18mr29915104pjb.66.1634342607913; 
 Fri, 15 Oct 2021 17:03:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k13sm6061168pfc.197.2021.10.15.17.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 17:03:27 -0700 (PDT)
Subject: Re: [PATCH v13 3/7] [RISCV_PM] Support CSRs required for RISC-V PM
 extension except for the h-mode
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>
References: <20211015192931.227387-1-space.monkey.delivers@gmail.com>
 <20211015192931.227387-4-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <839af1bf-b7e0-e9a3-19eb-fbc3aaa380b4@linaro.org>
Date: Fri, 15 Oct 2021 17:03:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015192931.227387-4-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Oct 2021 00:03:31 -0000

On 10/15/21 12:29 PM, Alexey Baturo wrote:
> +
> +    /*
> +     * CSRs for PointerMasking extension
> +     */
> +    target_ulong mmte;
> +    target_ulong mpmmask;
> +    target_ulong mpmbase;
> +    target_ulong spmmask;
> +    target_ulong spmbase;
> +    target_ulong upmmask;
> +    target_ulong upmbase;

You need to update machine.c to migrate these.
C.f. vmstate_pmp.


r~

