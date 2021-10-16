Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mba0C-0000Py-Uz
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 23:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mba0B-0000PS-6o
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 23:04:51 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mba09-0003U8-HI
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 23:04:50 -0400
Received: by mail-pg1-x530.google.com with SMTP id m21so10231219pgu.13
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 20:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1zKBwDM6GwbrMs7n3L7cBslgvmSdJWWg63qfZJFX9Fk=;
 b=m5lDpmGhaqYshy5FDTjUzL3T5FRBHOpbJHBopLHF5oH1EcDLSDPZSQ5dLMQDmx7pbP
 dnOd5+PJH7/lh5skeyNRkNfpJlVXwiKPv+sIWGLLEVK8KtIIGmfd2w1SXiSJT2iH87gj
 sokGH0ZCy4PYzY6/Yv56QD+vnBRA0Lfk6Ot7NsKlHYpHmEg6zi4FAMPeAk3rDPBU+GJn
 0bg3KbjaAgQUTkdtcD3PZhSWEXQK5DPeOxF7SWo8hfNbwVaWyfJJxPtnRkBPQ1Zdnrmt
 l6Dhg8MEviV6C3K+E2pTOFO/rKfB+qn+r2RH9/MGk7RfkBzadHAi3XBXH9MqWFUBQxPl
 C9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1zKBwDM6GwbrMs7n3L7cBslgvmSdJWWg63qfZJFX9Fk=;
 b=Iavem56k9tSGvldBIxJuuSpamF/p2K7HnwpwtzRHtYl4sweGwm8WahjGTPrCtgPg1U
 CVKMGWmul59KOx7JFQrcITJa21VJJG72pLEW6lA9y1E7hwDIBpiQEtNF2oYOXaYyXnk4
 zzmp7A+BS4Jv4gInUAn7V+65f3+uHHvhDa0cdef6pHlFjQ/YqQtfies8fa2mVc8zXT8X
 Dd0rnUeznnL/UxQZuCwQSrrW8KfVmw4k5i2hcjHNRyrN6mDzCefIYj4yceov8vOmgjDO
 UVtze0Amz53J9X4ebZTQaAn2vUIQbnMW8RxjWeXEM1LDbNs5TUGFT0kRK52HRBjhGcUp
 cn0A==
X-Gm-Message-State: AOAM530mlYfN4bnLv35NfSbjdQPiAk8GHguoUZ+f0oB5/eRIYOSOEJqf
 2/0zKQVkJ848M7w02/HUXg/t6w==
X-Google-Smtp-Source: ABdhPJyv5A1SImCW2ETzjHBuBsdRQVUQ0yVYTP5wGABHZDStyn8mbW23OSOp3v/2ZaFgvoqs9u5g6g==
X-Received: by 2002:aa7:95af:0:b0:44c:b07f:4970 with SMTP id
 a15-20020aa795af000000b0044cb07f4970mr15269842pfk.23.1634353487884; 
 Fri, 15 Oct 2021 20:04:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s14sm6207185pfg.50.2021.10.15.20.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 20:04:47 -0700 (PDT)
Subject: Re: [PATCH v8 01/78] target/riscv: fix TB_FLAGS bits overlapping bug
 for rvv/rvh
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-2-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <18042bea-6ab6-5295-1694-d9851f8bf5f9@linaro.org>
Date: Fri, 15 Oct 2021 20:04:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015074627.3957162-2-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Sat, 16 Oct 2021 03:04:51 -0000

On 10/15/21 12:45 AM, frank.chang@sifive.com wrote:
> From: Frank Chang<frank.chang@sifive.com>
> 
> TB_FLAGS mem_idx bits was extended from 2 bits to 3 bits in
> commit: c445593, but other TB_FLAGS bits for rvv and rvh were
> not shift as well so these bits may overlap with each other when
> rvv is enabled.
> 
> Signed-off-by: Frank Chang<frank.chang@sifive.com>
> ---
>   target/riscv/cpu.h       | 14 +++++++-------
>   target/riscv/translate.c |  2 +-
>   2 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

