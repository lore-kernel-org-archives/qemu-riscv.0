Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBihG-0004wt-0a
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 15:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBihE-0004wF-Az
 for qemu-riscv@nongnu.org; Thu, 05 Aug 2021 15:06:24 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mBihB-0007BO-Nd
 for qemu-riscv@nongnu.org; Thu, 05 Aug 2021 15:06:24 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so17287104pjs.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Aug 2021 12:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4gvLYCXxB4MyLjLcp/e6UucQLw2KGFMLI/GrPHsJvWQ=;
 b=mTAhkEWnPvKypWL8TbtmxuXQLVnJXZ0Z7tP/fRx6i1aTyAjz3kQ+hTQ5JjkqMBR882
 v7diwYDRhlh35A6clDDR/LMr5Jj25a8DmrGZU++gk4fGX7oc4WK/gUPw1V4SzIeEdDOZ
 BWNEX55834SArtx9pexJ5I7rI+mygETxrYDvwaalvauoPOsAsiWvlfpczcY4vxnfEajW
 gVhlu2y9i1KqQ3IIq66QA7XXvp0Vuxv4f/x9oZAQO0CTnt5OvxzwnbopccrmKaj0P3bo
 iqTdesYNLS3fo7CqJyq+MSkkckAB2Mjy2ppCLJEpo8JGv2UXZ+43axtu9TMqNSvruu8t
 i6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4gvLYCXxB4MyLjLcp/e6UucQLw2KGFMLI/GrPHsJvWQ=;
 b=J0rF3jL8isBkeOQDMochisDHwYnXNHweKdLo8I8BaLTS7wxx80T2W3mva9MhOoPKaB
 E7imq5p5TE6ca8/I4lXOa1D+8NzA5QDQBQ4xtUYMmAVvg5iwKdUamhcNg0qh4RBLGjbv
 +dPiTb9gkhNAkTJYMuwJ6UfWmVZRprjaW74UBXFWTUh+kAzV6ErkejqvQQOFci30MiBt
 qoRup2U+LtctTdm1jbOYzBu8PAoBMUDImaXkpc5vjWDo+xRwz+fK/jfqxA8SOlwYzYG6
 k7jZbJU01iVRxxGWzNkPE8KAmCTMP83aQOceaDqSAnXFN6y5khDbdAY4NP2i5DG1D9RN
 fLKQ==
X-Gm-Message-State: AOAM531hz6wBkepYXg5QaesXEjMOsmG4iYiExDArNBFx2iqQCKqI0ZF9
 90vvitNGAV+1w21nBZNNSa7mew==
X-Google-Smtp-Source: ABdhPJxr9qOrPeDga7FWXHaJAcCoGDMC1NIE4/gNEZ6mGLxuwczdiK+g0kJk/culDhtb9IU5k6kVCw==
X-Received: by 2002:a17:90a:c706:: with SMTP id
 o6mr16250866pjt.113.1628190380266; 
 Thu, 05 Aug 2021 12:06:20 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c3sm6591754pjs.35.2021.08.05.12.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 12:06:19 -0700 (PDT)
Subject: Re: [RFC PATCH 02/13] target/riscv: Support UXL32 for branch
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-3-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <840d76cc-fd1c-6324-19cc-a6ec0075d032@linaro.org>
Date: Thu, 5 Aug 2021 09:06:16 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805025312.15720-3-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
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
X-List-Received-Date: Thu, 05 Aug 2021 19:06:24 -0000

On 8/4/21 4:53 PM, LIU Zhiwei wrote:
> +static TCGv gpr_src_u(DisasContext *ctx, int reg_num)
> +{
> +    if (reg_num == 0) {
> +        return ctx->zero;
> +    }
> +    if (ctx->uxl32) {
> +        tcg_gen_ext32u_tl(cpu_gpr[reg_num], cpu_gpr[reg_num]);
> +    }
> +    return cpu_gpr[reg_num];
> +}
> +
> +static TCGv gpr_src_s(DisasContext *ctx, int reg_num)
> +{
> +    if (reg_num == 0) {
> +        return ctx->zero;
> +    }
> +    if (ctx->uxl32) {
> +        tcg_gen_ext32s_tl(cpu_gpr[reg_num], cpu_gpr[reg_num]);
> +    }
> +    return cpu_gpr[reg_num];
> +}

This is bad: you cannot modify the source registers like this.

These incorrect modifications will be visible to the kernel on transition back to S-mode.

> 
> +static bool gen_branch_u(DisasContext *ctx, arg_b *a, TCGCond cond)
> +{
> +    TCGv src1 = gpr_src_u(ctx, a->rs1);
> +    TCGv src2 = gpr_src_u(ctx, a->rs2);
> +
> +    return gen_branch_internal(ctx, a, cond, src1, src2);
> +}

This is unnecessary.  Unsigned comparisons work just fine with sign-extended values.  It 
will be simpler to keep all values sign-extended.


r~

