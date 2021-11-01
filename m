Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhaFE-0003da-Ec
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 12:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhaFD-0003aK-H6
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 12:33:11 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:34430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhaFB-0006Ci-JL
 for qemu-riscv@nongnu.org; Mon, 01 Nov 2021 12:33:11 -0400
Received: by mail-qt1-x82d.google.com with SMTP id v17so16380794qtp.1
 for <qemu-riscv@nongnu.org>; Mon, 01 Nov 2021 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LFfgTWERa3rRZmED0KhO63xel6F2EXq2LKaDG3/fM8Q=;
 b=N9AMhn5E6URVkvgI73BVPs8oRel2PqqhpjxHkKciSGYAzWs7ZIag06d8VBTSIjjquq
 EbOzL8s71f4Bp6tIghekauYesXR826j5ST9s6gLo25TCWy08Rgmt+E56qPxemq5ycXjB
 Uvb5n98GGEXpB+a0TG9l+yPWo2fxrUYeyd+3ldahQ0wTVYLnefi6UIqB0v2egvWnGCUI
 Alfcwg24aIQZdqiVHNTOegfcwYYPX69210w1jwKYoPjQDFj2I1FdmtiylAmGNjeO9wf/
 X8+3ovWnl0CzMlZ0B/m07HsDk9g2jAVJWvheHQa0Pn2XJBZDNPfBkweDVPwc0WPgHBIQ
 xhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LFfgTWERa3rRZmED0KhO63xel6F2EXq2LKaDG3/fM8Q=;
 b=4sEPHF3G8MxrwOZrLvg+AjhZfA4mSYP+0NCEO0vKG9Hi65+Kb1dtyknQmQhpVXicsD
 7gzYSXf7nCmhcwWLgo9gT73kl+5r50tMRFouJOLOiYOjJ9KNHEb3gQgDWubN6jOLLnzS
 xmGhdGX4gYo2uCS6vFF7OKFPWKkyTM9doTVNKt1Dxn/y1lYeNmnRtDLFMbGbN3srjzTV
 xuNK8AC7kqPYfTd9+YMgmxFAGqYPbqzaKsEHBYiiq8/GzNUDZH9gBPRJHrES9eRIjL3S
 bF8aa9WXAK0wTuiOZnx7wP0P0AGA71st1t8T+n75KNVprKhRNCyZqJNiENspKbLPGo/a
 bdBA==
X-Gm-Message-State: AOAM531/z3llpBPAhBYDx8iqhOex8jUJhTsts2s6GgFirpnhWgk1O+ss
 T6+6k/OeyYw5uxonBdhhYChDoElAENzTnw==
X-Google-Smtp-Source: ABdhPJy3ZgPlA7Ww0lDfAPk/CziKCeU4XYgS9XC+x01jAliWcC//gAVgGapCYnZ6UAa4csnoftldMA==
X-Received: by 2002:ac8:4159:: with SMTP id e25mr30955498qtm.69.1635784388041; 
 Mon, 01 Nov 2021 09:33:08 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y25sm3189875qkj.11.2021.11.01.09.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 09:33:07 -0700 (PDT)
Subject: Re: [PATCH 10/13] target/riscv: Adjust scalar reg in vector with ol
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-11-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3c57a3d2-f47d-a0d8-c209-48f002b3c91e@linaro.org>
Date: Mon, 1 Nov 2021 12:33:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-11-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 01 Nov 2021 16:33:11 -0000

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> @@ -2677,6 +2677,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
>           /* This instruction ignores LMUL and vector register groups */
>           int maxsz = s->vlen >> 3;
>           TCGv_i64 t1;
> +        TCGv src1 = get_gpr(s, a->rs1, EXT_ZERO);
>           TCGLabel *over = gen_new_label();
>   
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> @@ -2686,7 +2687,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
>           }
>   
>           t1 = tcg_temp_new_i64();
> -        tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
> +        tcg_gen_extu_tl_i64(t1, src1);
>           vec_element_storei(s, a->rd, 0, t1);
>           tcg_temp_free_i64(t1);
>       done:

This isn't actually correct.  Or, may have been correct for the 0.7.1 revision, but the 
rvv 1.0 revision has a sign-extend here.

This probably shouldn't be touched until the rvv 1.0 patch set comes in.


> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 451688c328..5bdbbf7c71 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4763,6 +4763,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>       uint32_t mlen = vext_mlen(desc);                                      \
>       uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
>       uint32_t vm = vext_vm(desc);                                          \
> +    uint32_t olen = 16 << vext_ol(desc);                                  \
>       uint32_t vl = env->vl;                                                \
>       uint32_t i;                                                           \
>                                                                             \
> @@ -4771,7 +4772,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>               continue;                                                     \
>           }                                                                 \
>           if (i == 0) {                                                     \
> -            *((ETYPE *)vd + H(i)) = s1;                                   \
> +            *((ETYPE *)vd + H(i)) = adjust_addr(s1, olen);                \
>           } else {                                                          \
>               *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));           \
>           }                                                                 \
> @@ -4792,6 +4793,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>       uint32_t mlen = vext_mlen(desc);                                      \
>       uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
>       uint32_t vm = vext_vm(desc);                                          \
> +    uint32_t olen = 16 << vext_ol(desc);                                  \
>       uint32_t vl = env->vl;                                                \
>       uint32_t i;                                                           \
>                                                                             \
> @@ -4800,7 +4802,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>               continue;                                                     \
>           }                                                                 \
>           if (i == vl - 1) {                                                \
> -            *((ETYPE *)vd + H(i)) = s1;                                   \
> +            *((ETYPE *)vd + H(i)) = adjust_addr(s1, olen);                \
>           } else {                                                          \
>               *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 1));           \
>           }                                                                 \

What in the world is this?  S1 is not an address, it's just a value from X[RS1].


r~

