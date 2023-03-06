Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZBP5-0007ym-6b
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 09:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBOj-0007Zb-4j
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 09:01:06 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBOg-0006Ua-5p
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 09:01:04 -0500
Received: by mail-wr1-x431.google.com with SMTP id bw19so8884846wrb.13
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 06:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678111259;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G5H00DqeZClDP4eneuHZ7EUSuWlAF3OuS9jWPVr2tG0=;
 b=upXsa5Drzs9gyoD+LWu0kYYLAmGEwXA4iqHXi1GveweyjqkmfSrN58tBjw10L9Rhur
 1ybbfyE6dQ1JSSID7nkS8a7suil2WzOOAZe33uXZ6LfG7KsUQ+xp8XDCxuYWJSBcYd+R
 MVLtN8wUJ7f6oe1yybtJgCUsvCdybOdnEh10n22XWrl/jXy9vzjw7JaNPovJi7sA6jm6
 YHKlNNoCUDpFEvxIo3YtrvHr2gN9OKfeRvPPIm+GU3E2jIY2/uRYyDpUn5CIIxnAU5Qw
 QERZRaaoYDjPorKFlIGvuhLM7cjB56tFf0IWfQzWsg/XeFApD/8yVKA1Q928vKCabZEe
 o35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678111259;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G5H00DqeZClDP4eneuHZ7EUSuWlAF3OuS9jWPVr2tG0=;
 b=7AEjHjTLj+oa4+JmFKaUxjYV7AYvJu2AYVWRvTGFpy0u6fi06MgUi6su2agS+LwkMw
 oWaYpfa9SEhrNPXLyGQVzRAb6ynkzPg6gXOW7q/jqfd/bZRKjRhZx6wQBG3iDdACvLck
 Xme+hI+3b5UQNFfmCSmWDwvI71Q8LcCGR0aWutlBTwtp2sllNxeTAtsQbeDt6OBud4Vt
 25amcXNhQoQZFox9+WMrnD4Rr3L35i3QWKEKrnXenxVcpWbM0X2XP8lYBi+WhDIq0V7a
 igv4nekXpX6LNn3szK8mH7auIc8wVQMIzYZOTIZC1p4uxt28Dj6zjlhLjfUNJZeSXEu6
 NU1Q==
X-Gm-Message-State: AO0yUKWAKXdLHWcgZIz/8gy9rDGQqNyNpzooUEtl/l0LgDSkNPnZiKpU
 kP30j2vXI5qc3CxTxg4zRWKY+A==
X-Google-Smtp-Source: AK7set+vXMInZL7AwuISLFHNF3hHOPPXlymXHxS03St2UXes3hdBgEFm6INFMy29A10DArCU+Sa4qQ==
X-Received: by 2002:adf:ef81:0:b0:2c5:46d1:69e1 with SMTP id
 d1-20020adfef81000000b002c546d169e1mr8295008wro.36.1678111259261; 
 Mon, 06 Mar 2023 06:00:59 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z7-20020a5d4407000000b002c5503a8d21sm10136820wrq.70.2023.03.06.06.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:00:58 -0800 (PST)
Message-ID: <7b1fa1fa-5e00-90eb-29dd-413448167456@linaro.org>
Date: Mon, 6 Mar 2023 15:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 03/70] target/arm: Improve arm_rmode_to_sf
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 14:01:08 -0000

On 27/2/23 06:41, Richard Henderson wrote:
> Use proper enumeration types for input and output.
> Use a const array to perform the mapping, with an
> assert that the input is valid.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h     | 12 +++++++++---
>   target/arm/translate-mve.c |  2 +-
>   target/arm/vfp_helper.c    | 33 ++++++++-------------------------
>   3 files changed, 18 insertions(+), 29 deletions(-)


> +extern const FloatRoundMode arm_rmode_to_sf_map[6];
> +
> +static inline FloatRoundMode arm_rmode_to_sf(ARMFPRounding rmode)
> +{
> +    assert((unsigned)rmode < ARRAY_SIZE(arm_rmode_to_sf_map));
> +    return arm_rmode_to_sf_map[rmode];
> +}

Is the inlining justified?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


