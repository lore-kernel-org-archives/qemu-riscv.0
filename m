Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhVau-0007Or-Dp
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 07:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhVas-0007MK-Px
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 07:35:14 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:39738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhVap-0006qw-Tx
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 07:35:14 -0400
Received: by mail-qt1-x82e.google.com with SMTP id t40so15453883qtc.6
 for <qemu-riscv@nongnu.org>; Mon, 01 Nov 2021 04:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rVh2VCjsyTw9/ZX1LsrhG/pPTtaUWvB5vvOgz0sgsg8=;
 b=xq8tUtJz1vho6uZVy23OThXP6KGf97+mrQiKvYg+naJCJwI5hfhgOsyfiMlLkRdl8I
 Q3d9YM0cADrv5W2rCCwW2/tobp7CzjSMU2E+m7on7MhYz34II+okGXJstp0HYL7auo4V
 1kJWCxxjneZwBrUXduyK6W53s6GStrCHbahEEZJ90KZvemXIw0thzXP0LKy5gd9wubX6
 7SFcyZvnfUQWxU72tHsBHbnsq6BnKcBvKMoVK9MKVeKFNvFjJjuRIb0DQZwsSI+m+FFe
 LqZD3ufFpMegJ58ylGgiYInfNiJMrU972NdELgRSBPdjWvypu2dAG3szIwPlVr4ZfNp5
 wo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rVh2VCjsyTw9/ZX1LsrhG/pPTtaUWvB5vvOgz0sgsg8=;
 b=lUKg4Xf1JGkzYxYSHENz2ocZqy1Of+pKDzDuB+IO2gVhhBnbUZX0xFADgtMcZXER/T
 cyA9n3kWjXOjbnNoRJEuQ5rgxeDaxCAdWu4qeZ4oVvp0QY26elF1PSeiNuJ9IpJaVr1m
 LbS6owDLq2u1emM5WE8FRDSDI4WeFwvGpBbxryVmz6hEMxAAgr1G0ef4W2wWDCVAuIvi
 fXg7z2JA5wi16aATmeuXD+f9VxRekgqB5x/FQUtnvIZ8EzIyVdRqhf+aVv6y81ppDYMJ
 lyxkT6vhgHZQoMEgR5b4rpK8UBcvcetJwJHT0OtT8ih1mRYpDl268cjzX57i90rA3pYl
 59Kg==
X-Gm-Message-State: AOAM533eQh9s7C2e+JZZNX/w1glL1vob3gzJQr7csFcaPvc4RIeWn/9p
 gK+uoIOlKtUluTjW/wN4Lgf4Mw==
X-Google-Smtp-Source: ABdhPJymRfTOujxbn29T/a4VJ8fxTC5obmeDKJz2SWeWuYKeyusN/3A5iy4ThlZOi5PbKbFrynXNIQ==
X-Received: by 2002:ac8:7f94:: with SMTP id z20mr29596256qtj.85.1635766510592; 
 Mon, 01 Nov 2021 04:35:10 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bs33sm10057422qkb.130.2021.11.01.04.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 04:35:10 -0700 (PDT)
Subject: Re: [PATCH 09/13] target/riscv: Adjust vector address with ol
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alexey Baturo <baturo.alexey@gmail.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-10-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <851481b9-e973-b3e1-1722-73db47edb772@linaro.org>
Date: Mon, 1 Nov 2021 07:35:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-10-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
X-List-Received-Date: Mon, 01 Nov 2021 11:35:15 -0000

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc |  8 ++++
>   target/riscv/internals.h                |  1 +
>   target/riscv/vector_helper.c            | 54 +++++++++++++++++--------
>   3 files changed, 46 insertions(+), 17 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index ed042f7bb9..5cd9b802df 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -233,6 +233,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s);
>   }
>   
> @@ -286,6 +287,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s);
>   }
>   
> @@ -365,6 +367,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>       return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>   }
>   
> @@ -404,6 +407,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>       fn =  fns[seq][s->sew];
>       if (fn == NULL) {
>           return false;
> @@ -490,6 +494,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>   }
>   
> @@ -542,6 +547,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>   }
>   
> @@ -617,6 +623,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>       return ldff_trans(a->rd, a->rs1, data, fn, s);
>   }
>   
> @@ -724,6 +731,7 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>       data = FIELD_DP32(data, VDATA, WD, a->wd);
> +    data = FIELD_DP32(data, VDATA, OL, s->ol);
>       return amo_trans(a->rd, a->rs1, a->rs2, data, fn, s);
>   }
>   /*
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index b15ad394bb..f74b8291e4 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -27,6 +27,7 @@ FIELD(VDATA, VM, 8, 1)
>   FIELD(VDATA, LMUL, 9, 2)
>   FIELD(VDATA, NF, 11, 4)
>   FIELD(VDATA, WD, 11, 1)
> +FIELD(VDATA, OL, 15, 2)
>   
>   /* float point classify helpers */
>   target_ulong fclass_h(uint64_t frs1);
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 535420ee66..451688c328 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -112,6 +112,11 @@ static uint32_t vext_wd(uint32_t desc)
>       return (simd_data(desc) >> 11) & 0x1;
>   }
>   
> +static inline uint32_t vext_ol(uint32_t desc)
> +{
> +    return FIELD_EX32(simd_data(desc), VDATA, OL);
> +}

XLEN not OLEN.

> @@ -123,6 +128,14 @@ static inline uint32_t vext_maxsz(uint32_t desc)
>       return simd_maxsz(desc) << vext_lmul(desc);
>   }
>   
> +static inline target_ulong adjust_addr(target_ulong addr, uint32_t olen)
> +{
> +    if (olen < TARGET_LONG_BITS) {
> +        addr &= UINT32_MAX;
> +    }
> +    return addr;
> +}

Here's where I'm unsure.  This looks a lot like the changes that are required to support 
pointer-masking in vectors, which Alexey said he was going to look at.

(1) Do we need to pass anything in VEXT at all?
     We do have CPURISCVState, so we could just use cpu_get_ml,
     which we would also need for env->mmte etc for pointer masking.

(2) Do we try to streamline the "normal" case with a simple bit in VEXT
     that indicates if the address needs modification at all?  I.e. the
     bit is set if UXLEN < TARGET_LONG_BITS or if PM_ENABLED?

(3) Do we try to streamline the computation by passing down composite
     mask and base parameters.  This way we don't need to do complex
     examination of ENV to determine execution mode, and instead always
     compute

        addr = (addr & mask) | base;

     where mask = -1, base = 0 for "normal" addressing, and when
     UXLEN == 32, mask <= UINT32_MAX.

(4) Do we in fact want to pre-compute these into known slots on ENV,
     so that we don't have to pass these around as separate parameters?
     We would adjust these values during PM CSR changes and when
     changing privilege levels.


r~

