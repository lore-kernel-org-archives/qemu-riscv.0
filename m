Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kaLfn-0000qh-Tj
	for mharc-qemu-riscv@gnu.org; Wed, 04 Nov 2020 11:30:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kaLfm-0000ox-VI
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2020 11:30:11 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kaLfl-0000KK-40
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2020 11:30:10 -0500
Received: by mail-pg1-x543.google.com with SMTP id r186so17050974pgr.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2020 08:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z8+8lJBcaaxeDudhji8oxO1dQe3v2xf8xPUwrZzPgYw=;
 b=j2ap90iRMEVz6JgqBpQZ5vkG/oE8U096n16q6VZcOhM/S4tWAQFUbhxxn0VNa0zCVw
 80p/KFgWOI/VtbE9XUH7MOuveeFDcSHHA5WfVCvcv0sx/yXtmbQnsB6xC9qpA7z6ViJ5
 CFv9SYklqPbR9/UIXwGEcbGgcNLxEx2u2ztLeFyWScWnqK5OZluvxOjGFuBoQUyKSDV3
 HE1TaEuIlNDeysCTZIZ9wURlnSruSA5ihlbwZFhZM2MgXr1KfsVXloAH7HHc7mdxDTqv
 iUa+ZrUa4YMbEq/oq8aW68YMRHSkkwJ7QCrzIYl+KJ+sq+a5ZlVojTz4R+zZsWJwGugW
 2h5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z8+8lJBcaaxeDudhji8oxO1dQe3v2xf8xPUwrZzPgYw=;
 b=ZFojHasTiEz5SClz0skzunF9z9UKwj/tyinRJyk0GJ3dCXLax5bTXGqrPn7pOAfgZ9
 Y0QNi6SyOYMWDh8mlNvEOKvYSUwVW9UyOph73QcjIi/+MA1yDnbThtW/JQk/UIb8bdoB
 p+QYVCDfKN44SfW4xBruIOEOft7d9IbwA32hpyGXOtmao+xSVV7waQFjrQAtK2WR/aDA
 Jck7qAWkiI0uw2L6gIer878O2cHIo/bFjp6HSac/flvs4RcoQy/7kPSlGlQ3Xq7P37Kg
 98Bkx3ghdn2OTgTZxlr302znI4LUbI1+a/JcwKfS7WuqNOoZ/2w4uYLu4TdOvDGR/VUY
 LN8A==
X-Gm-Message-State: AOAM533SKZM9eXeft/a0ZUWgAJRmgTiaFUnDs+ktdQYT/ceHkAw4T5mz
 19+9anfEO2FZApdZ4wezvil6UQ==
X-Google-Smtp-Source: ABdhPJz9X20rwrAnRDp+vCxGSfiomoTfRf9eP/hvGyY0t+EQBy3pTTGvJZNj5FbZeQ9jysWcjxVPxA==
X-Received: by 2002:a62:fb09:0:b029:18a:df0f:cf2a with SMTP id
 x9-20020a62fb090000b029018adf0fcf2amr15971682pfm.57.1604507407404; 
 Wed, 04 Nov 2020 08:30:07 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id l3sm2689325pju.28.2020.11.04.08.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 08:30:06 -0800 (PST)
Subject: Re: [PATCH v4 4/5] target/riscv: Remove the hyp load and store
 functions
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1604464950.git.alistair.francis@wdc.com>
 <189ac3e53ef2854824d18aad7074c6649f17de2c.1604464950.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d4f57237-518e-4bf8-f31e-988251f1689d@linaro.org>
Date: Wed, 4 Nov 2020 08:30:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <189ac3e53ef2854824d18aad7074c6649f17de2c.1604464950.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 04 Nov 2020 16:30:11 -0000

On 11/3/20 8:43 PM, Alistair Francis wrote:
> +#ifndef CONFIG_USER_ONLY
> +static void check_access(DisasContext *ctx) {

Newline before {.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

