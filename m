Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfr97-0000gz-Pt
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 16:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfr8v-0000eG-UF
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 16:07:02 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfr8t-0003XT-6f
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 16:07:01 -0500
Received: by mail-pf1-x433.google.com with SMTP id a18so5692709pfl.3
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 13:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UDnKv70mEcOhhHuHyK23iNhbXNJ/iC7P3ksp9aZBr4E=;
 b=EL4o3pt3KA8zPq7yrifcJEDFu/q8+BzWENVzdFyXp0KEo3QEBij4UvDNk8iUj+ZeZ8
 125QHu6wU1MTF8Rul/Jp8Kifttg4vcr6388ece0gO1BrIM97wCSPqTFwYE56culFiZzn
 P3THIF2fEpYxVkwSXjFyUhUZ3AoMkHZRrEV1Asy8ae0pVBy1rvXshn9rzkFHXHyJggE5
 SXtF2fRHS4jmdp9MpAXxV4tR1W0ehGzOMaVk5wsSTMm9wtS5R0WhIhO8gchB8DXvx/VQ
 CF8wUseGQWHUmzMR5J21zmjaW2ziMVZkFQHYLRW8eqfCqxI3KYmNOw48TbeY3iZDvRTJ
 I50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UDnKv70mEcOhhHuHyK23iNhbXNJ/iC7P3ksp9aZBr4E=;
 b=I00ycYWyRJI453ImFu3+lEFByXTzHxeVhVqbeawkiKdQY5svkC0Y8jeNIsRRtgOqlO
 bUhlnfpBJhJm3wPUH/XlxuHR2YXANBExb33WJkOAdixBmsOCL34sq8kWTefdLZc7Z+xw
 i0ZbztclANP2ocjwLq7aIpmFCyCiYX8Ai0FUj0WFRbMFxjN7V4Z26fyd5PT3s82Z7PGt
 nvY5RZxXbZSoWf/rNn2L8T5fJYj9ofnqIqkU9QHQ9ZSG/I92vF2GveEF4T7jDuuE2+sC
 wgEPaHy7ZeRV5ukeXSP5xF0xeLTSMOA55Lv9LD9QvJibHhvwfjio9ifWJuxFyVXOO2ci
 MfUA==
X-Gm-Message-State: AOAM53325k+dXGQiObFoUEsxX6uyQPcAFU43HQbAD86Tajfck9pHtFqa
 Y9XBG/rSd02JqDtPxR4a3+Aa/A==
X-Google-Smtp-Source: ABdhPJzkWQGWKjZHRJ6PbI+RrI8x1irkzJRnrv6hAgg7+2+hKBnobzWru8fKHdzllPq+PfFTh3unJg==
X-Received: by 2002:a63:389:: with SMTP id 131mr14415892pgd.128.1605820017845; 
 Thu, 19 Nov 2020 13:06:57 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 23sm802330pfx.210.2020.11.19.13.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 13:06:57 -0800 (PST)
Subject: Re: [RFC 10/15] target/riscv: rvb: rotate (left/right)
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-11-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52287c37-f10c-a64e-1265-1abfcc39d77e@linaro.org>
Date: Thu, 19 Nov 2020 13:06:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-11-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Thu, 19 Nov 2020 21:07:08 -0000

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +static bool trans_rori(DisasContext *ctx, arg_rori *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }
> +
> +    return gen_arith_shamt_tl(ctx, a, &tcg_gen_rotr_tl);
> +}

We most definitely want to use tcg_gen_rotri_tl here, as we have special
expansions of constant shifts for hosts without rotate (e.g. riscv64g ;-).

Otherwise, this patch should be included in the shift cleanup discussed upthread.


r~

