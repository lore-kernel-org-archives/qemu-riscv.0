Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZL4p-0008OU-3J
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 19:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZL4n-0008Kh-4h
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 19:21:09 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZL4k-0005jQ-GB
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 19:21:08 -0500
Received: by mail-wm1-x333.google.com with SMTP id p26so6777502wmc.4
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 16:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678148465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dtYEa9/CxvYqQU1XQr6rH8g9YtE9rvyEDB+5Y9LAaIE=;
 b=i2LABxSazVZwaBALKOrjb5qdIoLewC8EdTvUHh3k540pZ9ut4Ybc10bI0lLYEShkSN
 ofKDKSs8UHHhlRKk7SZr900+F7UDKoBakkAFrRxosb233c/YUr0dvrE3+rUiTSMtxPKO
 4elFN7hgN6AvRG1p/ekge75pnwQmmgRM+Vhi0eLMy5etNRzMJGPSfFYTisQ+xvsKjhz+
 l9qrEn8iB8laH2h3uIyC9/e5qwCbAb3YY1SMqXNX8yiwY++syilDfcUU4sxBYQ5YZpIT
 xvWOkPjLxDWmMkKlLjJLndhXbwGxNtY8QddyFBKXJft+J19Uj2Dc44yyFHRy3/1SQHF8
 LrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678148465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dtYEa9/CxvYqQU1XQr6rH8g9YtE9rvyEDB+5Y9LAaIE=;
 b=G+v6Zq7rwsPyUzFthZxrsM2b/c3H23kgegxX0nMhXmfRRskC96B/Q9wAv/g1kEdPhk
 s1VIFgiSFcV7d9IvXpm4bYiE+DLWJGEJ3bSlNjg955GOFuMkljVqOo9a4J1ebb02ykWE
 iuc9td9GedtoiYgILRB0hZk4trhsB/5ejeQo4y4yJxpgRCQXnKpcaKKbl6IaV9ZUfc0X
 MMRc18LYhVtRG/wU7XVOhwYTtdM5zdP1DtZaCnzYq6+cQ8E7Iiu0F8x3mIIKSfSfJZ9w
 KtVKEI0kle8InjlpRe08GJUy+MJKtnN5OU5ChHwZXifKV2uXsM+kOIAaZAuRfbstc7Qo
 fJ4w==
X-Gm-Message-State: AO0yUKXjeNgMVhbkmYT09hn1/oXPsSdzWJKOZDpoxcA+xQr1SrfC2u3c
 PnbUl6GZ8Bn3k4GWgG4P3wybHw==
X-Google-Smtp-Source: AK7set/hRAS/bZa3PENBhQpJkUTeV0b5FrfA15wVpBu9+s0cHPhhhwHkEI882vZMdwUVwRkijceeVg==
X-Received: by 2002:a7b:c5c9:0:b0:3eb:2de9:8aea with SMTP id
 n9-20020a7bc5c9000000b003eb2de98aeamr11839885wmk.35.1678148464937; 
 Mon, 06 Mar 2023 16:21:04 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b003e21dcccf9fsm14993444wmi.16.2023.03.06.16.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:21:04 -0800 (PST)
Message-ID: <dc010853-fa99-7aa0-4c1b-bf471ea84a9d@linaro.org>
Date: Tue, 7 Mar 2023 01:21:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 53/70] target/sh4: Avoid tcg_const_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-54-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-54-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Tue, 07 Mar 2023 00:21:09 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sh4/translate.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


