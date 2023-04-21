Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppyhM-0006Tu-Kw
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 17:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyhJ-0006Ql-TQ
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 17:53:41 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyhH-0006D1-Fw
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 17:53:41 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f199696149so301125e9.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 14:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682114018; x=1684706018;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RmbHQN5yrjMZfZaZ+mqZZy0mWnwUmWYK29MXvrZx2G0=;
 b=UyzbopYXcMrpVYO7KEYpo1v8OtTD9T3aUSe0CwzQ7Q/daCIxkzrWCv+mH3DFwa9R+x
 76hJiSL0ndOOy5N320nbfYtWCnK1VbtWdFo9y0JdrshpOW1wGVXSO6evckg83+TpP7nl
 HH5PA1OaYuQfSXWO4O9jx8jPD5urCpRoyDjodfK3d/OM4bSqjEo4uMVV0Ei8zg0v2Txc
 Hc6fe76JQsP78wd2FqPGLwEFbzADc7Wo02lSH7M/ay3bgYdExqPV0xwlojZwUnOKi5tO
 8J5bkyfQTSBir6xIeA9K/oZYnXNy9W0nusn4lyIP76eePO5cCM8lWVkpa7i0q2ZLDj69
 H1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682114018; x=1684706018;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RmbHQN5yrjMZfZaZ+mqZZy0mWnwUmWYK29MXvrZx2G0=;
 b=akQ6tFvW/bk9zYQyrU8fe/oOY7QHy5irnltxl0+O180E9i4Lz2tubpQaITTZzCUVu4
 LvzSfkQGDY46iQaIIax5T2IXRFYlDbzGV/bVkkY/CQSj1pVWzYJ1+WhMFOa1RzXqkHGF
 zCZrzLax0Vj/IclEqQHgKx07R/h7H046DLcs7LRtkZgEsm3oxkiv/Cki3T3cG6xqvr4z
 Omo2M74CERMvgPnS9Dq3qQxg04ZyLBHhfFDcW/TyN9D2pLB38o8ks6rQIuVOIWzIA16C
 X+TiLVzlkthk7hwMAHnp0zx74qCZjuFlHR7/RO/GWpLDjz7aPdx2tg6zoH4WcHNtA10r
 PEig==
X-Gm-Message-State: AAQBX9dJIaZ5cV9UwsrsEqN4IPDrHJqYBCeQMPo4TYEX/1G4z2ET+Q2a
 v6/uSb+ONpAYemQ4AOcaBhLUqw==
X-Google-Smtp-Source: AKy350YIfuPnati+ycfpkmJEikSoriGaxCVxRW+paze10Vj5YmGicppzbl7ZHbeVCznZEC8uVksN7g==
X-Received: by 2002:adf:f5cc:0:b0:2ff:89d6:3561 with SMTP id
 k12-20020adff5cc000000b002ff89d63561mr4706939wrp.64.1682114018116; 
 Fri, 21 Apr 2023 14:53:38 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 x2-20020a5d60c2000000b002de9a0b0a20sm5198394wrt.113.2023.04.21.14.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 14:53:37 -0700 (PDT)
Message-ID: <43fe915c-9c0f-2ac2-57fc-3206d0920ce5@linaro.org>
Date: Fri, 21 Apr 2023 23:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 05/42] tcg: Split out tcg_out_ext16s
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 21 Apr 2023 21:53:42 -0000

On 8/4/23 04:42, Richard Henderson wrote:
> We will need a backend interface for performing 16-bit sign-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  7 +++++++
>   tcg/aarch64/tcg-target.c.inc     | 13 ++++++++-----
>   tcg/arm/tcg-target.c.inc         | 10 ++++------
>   tcg/i386/tcg-target.c.inc        | 16 ++++++++--------
>   tcg/loongarch64/tcg-target.c.inc | 13 +++++--------
>   tcg/mips/tcg-target.c.inc        | 11 ++++++++---
>   tcg/ppc/tcg-target.c.inc         | 12 +++++-------
>   tcg/riscv/tcg-target.c.inc       |  9 +++------
>   tcg/s390x/tcg-target.c.inc       | 12 ++++--------
>   tcg/sparc64/tcg-target.c.inc     |  7 +++++++
>   tcg/tci/tcg-target.c.inc         | 21 ++++++++++++++++++++-
>   11 files changed, 79 insertions(+), 52 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


