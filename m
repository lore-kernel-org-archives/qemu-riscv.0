Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbQZa-0007Tj-My
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 13:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbQZU-0007PP-8o
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 13:00:41 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:56304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbQZO-00039L-TW
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 13:00:37 -0400
Received: by mail-pj1-x1033.google.com with SMTP id om14so7596350pjb.5
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 10:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mju07UW6nzATDFM+rqPSRkqtjEJbyQ87kQxDSDGnT1c=;
 b=eHeI30X8+bmucj5b+cqeX4SuJ/zD8ncGn580nKV/KotoSV+zpd12xkwiLdwjpWp3o2
 emwcz8exBoxIGn5ONqdLcctB47n9KxXG9hF8LL2XkRah0LI8whgKxHc6Uhs+KLfcXAr9
 UGUC9uoluLRvFqPgyXJuWt96T9e5+T0o63E458nX6djH59Z1GQ7zHZKEehCRflPXpr3p
 pHZlEMydKxctdqMGQRwaMuQpwSGML4m9dgMv1D240RhbV5GUODoAQfDp6mgdW9baxQMR
 35uAne7tJHePM8/hqWBZi3XxodFCnUUEcLUNFigfm7gWNjAagMVdXs+q754IhRDm5uFF
 4RAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mju07UW6nzATDFM+rqPSRkqtjEJbyQ87kQxDSDGnT1c=;
 b=P0RZUssc9qV4HSgUFI7ZEmyRVSogV3wDUJqPALKZu6FNIfjR78pCCxHGtz9SErqX3L
 xim62M/a4VIEi+FSSrtYUOoMsAGPelMkmvcsFndQDukXy550etltPWQ9+rqFsIHh/Kn5
 ar8Pwdc4bTAzGygC3bxv3v39UyN5EPbFf/vrRyOvqOEoTKZuBw3AHWy9xvog7C+vQq2P
 X6S2q3VBpP6hVeqfR45xOXGfJPxfwVus3KMhW4QX/gEEXKmtsoJiz11cU2eL61uDhXeM
 nZggdiREtmI9tVqbS4MSzoIh2m9auVETt2QZHZE+5BBdH04vWlJhQUPy/6mwP0mqzb3R
 Hf0A==
X-Gm-Message-State: AOAM532BriduKCt8+ach//4Pz09TFJMvg5U+dlMusgGYvXluvKFd73om
 masX5V/964a7KWiMFv9xVasmZw==
X-Google-Smtp-Source: ABdhPJwEm1bN8lKBILMTrkJTZuEeAwZJHT4dOjyG/PJTxvBZjIMRgEXtUgFp5DSPTk5EbsfTZFBHDA==
X-Received: by 2002:a17:90b:4b03:: with SMTP id
 lx3mr14575794pjb.162.1634317233319; 
 Fri, 15 Oct 2021 10:00:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id e6sm5443922pfm.212.2021.10.15.10.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 10:00:32 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] softfloat: add APIs to handle alternative sNaN
 propagation for fmax/fmin
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211015065500.3850513-1-frank.chang@sifive.com>
 <20211015065500.3850513-2-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5fdfaf38-da5b-ff32-9c9c-700ccaf3dadb@linaro.org>
Date: Fri, 15 Oct 2021 10:00:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015065500.3850513-2-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 17:00:42 -0000

On 10/14/21 11:54 PM, frank.chang@sifive.com wrote:
> +        /*
> +         * In IEEE 754-2019, minNum, maxNum, minNumMag and maxNumMag
> +         * are removed and replaced with minimum, minimumNumber, maximum
> +         * and maximumNumber.
> +         * minimumNumber/maximumNumber behavior for SNaN is changed to:
> +         *   If both operands are NaNs, a QNaN is returned.
> +         *   If either operand is a SNaN,
> +         *   an invalid operation exception is signaled,
> +         *   but unless both operands are NaNs,
> +         *   the SNaN is otherwise ignored and not converted to a QNaN.
> +         */
> +        if (!(~flags & (minmax_isnum | minmax_snan_noprop))
> +            && (ab_mask & float_cmask_snan)
> +            && (ab_mask & ~float_cmask_anynan)) {
> +            float_raise(float_flag_invalid, s);
> +            return is_nan(a->cls) ? b : a;
> +        }

This part looks ok.

> +    MINMAX_1(type, maxnum_noprop, minmax_isnum | minmax_snan_noprop) \
> +    MINMAX_1(type, minnum_noprop, minmax_ismin | minmax_isnum |      \
> +                                  minmax_snan_noprop)                \

But here, you have been given names by 754-2019: minimumNumber, maximumNumber, so I think 
you should use them.


r~

