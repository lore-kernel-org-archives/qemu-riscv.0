Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbUWs-0006nS-Ap
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 17:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbUWr-0006jc-4N
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 17:14:13 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:33584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbUWp-0008CP-J2
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 17:14:12 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 q10-20020a17090a1b0a00b001a076a59640so7947432pjq.0
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 14:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PrjuEyyEPfpWVaFwGHX44llvyhoaYHbKfpwocG+itro=;
 b=KErQsNyJ83HmCfVRydsS/r95UEFRSL+dcmP5fO6igU71lvocHdy+Zt2N/AXKcLNXKb
 d2T+6K4Y6TiiUvQPYYR0h5mRo8yLnCYXFCrg0zHfXFq37aaKygScrfJmK5YPEHXpVRkm
 gV3j27ynI/R2uXqxNjkW0wNfwG4S4lfGheu2KGFNQDafKjnqYSXFwJPyD3AcX7CwEv3s
 NekvS9uW3GYLqOE29d+aTB9CcBpkSxWLpXn4VkytzxbfmcIBsn4ohO5Na0U8M+5Nmuf8
 T0Ha8EI6leLek6UQ7W6nd7y0BiCnPYIpd079rOz6nyDEceUZ6eKxS8qzvkuyNNqOtgwm
 q5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PrjuEyyEPfpWVaFwGHX44llvyhoaYHbKfpwocG+itro=;
 b=EIO1ntJJof+dwwn7GSGGu4Y/Pyf+2Y5j9CCLRmrL3WZ/MgI8TMetUJGDHQKRj3FZ2V
 Q3A/txV3Lfks5e8eP1WW9NAjhn2o8ZEWOUJmDCJfvFADHN+Kp89H/ViGMMOSWOMCqMyD
 YIyUnchDNxB6TJJf5Xm0sTmTvIktIOmHED/tKmi4hiCOcXW4sUwiod+n3IZ9E6neFs4X
 8n4fzJUQLNihSDoBoc8yTJSLtXIl+6lar7mTEDecvPQAOXQdewaBKCDcgAMpk1RWy5DL
 CLAkU+RICYnXwnS+HLVF9tdI26xiTCj2+8B80qevVFmBnqpAtLSf55y2FvHAIXsxw4zT
 wT1w==
X-Gm-Message-State: AOAM532RU3V6afKUqzu3vNgpaDu0TODinM9/qg6b7LGD9Mhynh9lQQLz
 5ivo+OgmdkM8nnINhC4zw0K+Xg==
X-Google-Smtp-Source: ABdhPJyyw7hPeg7vsJoeJlN4E/a9eDNfzOQVqhnM3wC5EbtuLdRQLhvLiwAHJ1ILBpGcJaw5kJDugw==
X-Received: by 2002:a17:90a:f68a:: with SMTP id
 cl10mr6887026pjb.39.1634332449673; 
 Fri, 15 Oct 2021 14:14:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w5sm5246981pgp.79.2021.10.15.14.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 14:14:09 -0700 (PDT)
Subject: Re: [PATCH v2 6/6] target/riscv: zfh: implement zfhmin extension
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Chih-Min Chao
 <chihmin.chao@sifive.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20211015070307.3860984-1-frank.chang@sifive.com>
 <20211015070307.3860984-7-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <465939bc-dd1b-5c00-fba9-7345c6c0a91e@linaro.org>
Date: Fri, 15 Oct 2021 14:14:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015070307.3860984-7-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 21:14:13 -0000

On 10/15/21 12:03 AM, frank.chang@sifive.com wrote:
> From: Frank Chang<frank.chang@sifive.com>
> 
> Zfhmin extension is a subset of Zfh extension, consisting only of data
> transfer and conversion instructions.
> 
> If enabled, only the following instructions from Zfh extension are
> included:
>    * flh, fsh, fmv.x.h, fmv.h.x, fcvt.s.h, fcvt.h.s
>    * If D extension is present: fcvt.d.h, fcvt.h.d
> 
> Signed-off-by: Frank Chang<frank.chang@sifive.com>
> ---
>   target/riscv/cpu.c                        |  1 +
>   target/riscv/cpu.h                        |  1 +
>   target/riscv/insn_trans/trans_rvzfh.c.inc | 21 +++++++++++++--------
>   target/riscv/translate.c                  |  2 ++
>   4 files changed, 17 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

