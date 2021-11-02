Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mht8Z-0001IJ-HJ
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 08:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mht8Y-0001C2-Ai
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 08:43:34 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:36658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mht8W-0007hG-Cn
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 08:43:33 -0400
Received: by mail-qv1-xf33.google.com with SMTP id d6so13177959qvb.3
 for <qemu-riscv@nongnu.org>; Tue, 02 Nov 2021 05:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rYZs6HRHheEiaHF7ZRGFpf3zIEKM8DJFRh3zeff9C5Q=;
 b=GMpUGrF0RW7DtPIqY3D6ME3asGher11RLFKWlBsSIS2/Zr/Z0Nw3pR68IL5FSDkZ2c
 R1jvzfVRikOybZfugd2CskmUiPfV2+5rRusRruyRkH+/Wdse5EYjPRmwdpo0g/Ot00md
 OaNq1Jx+Fqozs0hv1k8G18IlvR8mGXZVRKZGHdQLN2iLRC/j6q7I1Z4bhTSmC4cHNOFD
 JNWOkrIspGdl4TNsnGiUT/oSEDUbvFY3yR/wId1CjTheoaLGInb4ojesR3pXrK4gjJMV
 SVROPGZhBOyNyYDJuS1SMSS8DsiVHC9vwAfZ2BmDqN17SiXqMk3foTCAAFclIIitvQYK
 dn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rYZs6HRHheEiaHF7ZRGFpf3zIEKM8DJFRh3zeff9C5Q=;
 b=HaKOQT6eSb1Z4DMhqrq5S4IvIQ+dVuWL1hABASPJViGD66k0l+rB3sRkMOKmPznhq0
 ODu+voV9wt74LxpTNbXhqFr0u1EN/v85A618wDlvFSzLEw/etOSWhlazWeZEcfCs4QCO
 ub65az+sdmMvHAOfMJVRtbtQd/W43XUPvkz6Ydg/99JwCfvKBQyvb30SnDFqJcTHVZFP
 UUoT0Y+nWGaGMrcyXhAq1qOqUM2M0jVkaVgLdMO6KXFKjotgu9gBeW+rOqzCHG6Ya5J8
 Nl1nnWzFbvVLbaWq1IbEQ6wfRZOFaot9AeS/+iqlsa1uKN3pGWdim67zerlQJFklpqDJ
 Xq6Q==
X-Gm-Message-State: AOAM532IFz3sj2TcdsZkb/cPrnvpsnV/8Vzr5qAn/lO3NefcdNCd/dUq
 6pdeRAAajcIvWkJIwJezZVnnJg==
X-Google-Smtp-Source: ABdhPJxZa2oxdo5W3/ryis63WhVqpbGtuRgIf5MWQywBVa+ahhzBUQ2+COFJRlTQ7MqtdtFBFftBPg==
X-Received: by 2002:ad4:5002:: with SMTP id s2mr13890971qvo.13.1635857010317; 
 Tue, 02 Nov 2021 05:43:30 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y8sm9685791qtx.0.2021.11.02.05.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 05:43:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 12/17] target/riscv: support for 128-bit arithmetic
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-13-frederic.petrot@univ-grenoble-alpes.fr>
Message-ID: <c010789f-de86-f71f-2f4d-34ba4a6aa1b7@linaro.org>
Date: Tue, 2 Nov 2021 08:43:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-13-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
X-List-Received-Date: Tue, 02 Nov 2021 12:43:34 -0000

On 10/25/21 5:28 AM, Frédéric Pétrot wrote:
> +    if (get_xl(ctx) < MXL_RV128 || get_ol(ctx) < MXL_RV128) {

Only the second test.  Two times.

> +static bool gen_setcond_i128(TCGv rl, TCGv rh,
> +                             TCGv al, TCGv ah,
> +                             TCGv bl, TCGv bh,
> +                             TCGCond cond)
> +{
> +    switch (cond) {
> +    case TCG_COND_EQ:
> +        tcg_gen_xor_tl(rl, al, bl);
> +        tcg_gen_xor_tl(rh, ah, bh);
> +        tcg_gen_or_tl(rh, rl, rh);
> +        tcg_gen_setcondi_tl(TCG_COND_EQ, rl, rh, 0);
> +    break;

Indentation.

> +
> +    case TCG_COND_NE:
> +        tcg_gen_xor_tl(rl, al, bl);
> +        tcg_gen_xor_tl(rh, ah, bh);
> +        tcg_gen_or_tl(rh, rl, rh);
> +        tcg_gen_setcondi_tl(TCG_COND_NE, rl, rh, 0);
> +        break;
> +
> +    case TCG_COND_LT:
> +    {
> +        TCGv tmp1 = tcg_temp_new();
> +        TCGv tmp2 = tcg_temp_new();
> +
> +        tcg_gen_sub2_tl(rl, rh, al, ah, bl, bh);
> +        tcg_gen_xor_tl(tmp1, rh, ah);
> +        tcg_gen_xor_tl(tmp2, ah, bh);
> +        tcg_gen_and_tl(tmp1, tmp1, tmp2);
> +        tcg_gen_xor_tl(tmp1, rh, tmp1);
> +        tcg_gen_shri_tl(rl, tmp1, 63);
> +
> +        tcg_temp_free(tmp1);
> +        tcg_temp_free(tmp2);
> +        break;
> +    }
> +
> +    case TCG_COND_GE:
> +        /* Invert result of TCG_COND_LT */
> +        gen_setcond_i128(rl, rh, al, ah, bl, bh, TCG_COND_LT);
> +        tcg_gen_xori_tl(rl, rl, 1);
> +        break;
> +
> +    case TCG_COND_LTU:
> +        gen_setcond_i128(rl, rh, al, ah, bl, bh, TCG_COND_GEU);
> +        tcg_gen_xori_tl(rl, rl, 1);
> +        break;
> +
> +    case TCG_COND_GEU:
> +    {
> +        TCGv tmp1 = tcg_temp_new();
> +        TCGv tmp2 = tcg_temp_new();
> +        TCGv zero = tcg_constant_tl(0);
> +        TCGv one = tcg_constant_tl(1);
> +        /* borrow in to second word */
> +        tcg_gen_setcond_tl(TCG_COND_LTU, tmp1, al, bl);
> +        /* seed third word with 1, which will be result */
> +        tcg_gen_sub2_tl(tmp1, tmp2, ah, one, tmp1, zero);
> +        tcg_gen_sub2_tl(tmp1, rl, tmp1, tmp2, bh, zero);
> +
> +        tcg_temp_free(tmp1);
> +        tcg_temp_free(tmp2);
> +        break;
> +    }
> +
> +    default:
> +        return false;

This should be g_assert_not_reached(), not return false.

> +    }
> +    tcg_gen_movi_tl(rh, 0);
> +    return true;
> +}

Which begs the question of what the return value is for when you don't even use it below.

I think we should treat this as more of a subroutine, and return the final TCGCond 
required to get the correct result, *without* actually computing the final setcond.

static TCGCond compare_128i(TCGv rl, int rs1, int rs2, TCGCond cond)
{
     TCGv al = get_gpr(ctx, rs1, EXT_SIGN);
     TCGv bl = get_gpr(ctx, rs2, EXT_SIGN);
     TCGv ah = get_gprh(ctx, a->rs1);
     TCGv bh = get_gprh(ctx, a->rs2);
     TCGv rh = tcg_temp_new();
     bool invert = false;

     switch (cond) {
     case TCG_COND_EQ:
     case TCG_COND_NE:
         if (rs2 == 0) {
             tcg_gen_or_tl(rl, al, ah);
         } else {
             tcg_gen_xor_tl(rl, al, bl);
             tcg_gen_xor_tl(rh, ah, bh);
             tcg_gen_or_tl(rl, rl, rh);
         }
         break;

     case TCG_COND_GE:
         invert = true;
         cond = TCG_COND_LT;
         /* fall through */
     case TCG_COND_LT:
         if (rs2 == 0) {
             tcg_gen_mov_tl(rl, ah);
         } else {
             TCGv tmp1 = tcg_temp_new();
             TCGv tmp2 = tcg_temp_new();
             tcg_gen_sub2_tl(rl, rh, al, ah, bl, bh);
             tcg_gen_xor_tl(tmp1, rh, ah);
             tcg_gen_xor_tl(tmp2, ah, bh);
             tcg_gen_and_tl(tmp1, tmp1, tmp2);
             tcg_gen_xor_tl(rl, rh, tmp1);
             tcg_temp_free(tmp1);
             tcg_temp_free(tmp2);
         }
         break;
     ...
     }
     tcg_temp_free(rh);

     if (invert) {
         cond = tcg_invert_cond(cond);
     }
     return cond;
}

static void setcond_128i(...)
{
     cond = compare_128i(rl, rh, al, ah, bl, bh, cond);
     tcg_gen_setcondi_tl(cond, rl, rl, 0);
     tcg_gen_movi_tl(rh, 0);
}

static void branch_128i(...)
{
     TCGv tmpl = tcg_temp_new();
     TCGv tmph = tcg_temp_new();

     cond = compare_128i(tmpl, tmph, al, ah, bl, bh, cond);
     tcg_gen_brcondi_tl(cond, tmpl, 0, label);

     tcg_temp_free(tmpl);
     tcg_temp_free(tmph);
}

> +
>   static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
>   {
>       TCGLabel *l = gen_new_label();
>       TCGv src1 = get_gpr(ctx, a->rs1, EXT_SIGN);
>       TCGv src2 = get_gpr(ctx, a->rs2, EXT_SIGN);
>   
> -    tcg_gen_brcond_tl(cond, src1, src2, l);
> +    if (get_xl(ctx) == MXL_RV128) {
> +        TCGv src1h = get_gprh(ctx, a->rs1);
> +        TCGv src2h = get_gprh(ctx, a->rs2);
> +        TCGv tmpl = tcg_temp_new();
> +        TCGv tmph = tcg_temp_new();
> +
> +        /*
> +         * Do not use gen_setcond_i128 for EQ and NE as these conditions are
> +         * often met and can be more efficiently implemented.
> +         * Some comparisons with zero are also simpler, let's do them.
> +         */
> +        if (cond == TCG_COND_EQ || cond == TCG_COND_NE) {
> +            /*
> +             * bnez and beqz being used quite often too, lets optimize them,
> +             * although QEMU's tcg optimizer handles these cases nicely
> +             */
> +            if (a->rs2 == 0) {
> +                tcg_gen_or_tl(tmpl, src1, src1h);
> +                tcg_gen_brcondi_tl(cond, tmpl, 0, l);
> +            } else {
> +                tcg_gen_xor_tl(tmpl, src1, src2);
> +                tcg_gen_xor_tl(tmph, src1h, src2h);
> +                tcg_gen_or_tl(tmpl, tmpl, tmph);
> +                tcg_gen_brcondi_tl(cond, tmpl, 0, l);
> +            }
> +        } else if (a->rs2 == 0
> +                   && (cond == TCG_COND_LT || cond == TCG_COND_GE)) {
> +            tcg_gen_shri_tl(tmpl, src1h, 63);
> +            /* hack: transform LT in EQ and GE in NE */
> +            tcg_gen_brcondi_tl((cond & 13) | 8, tmpl, 1, l);
> +        } else {
> +            if (cond == TCG_COND_GE || cond == TCG_COND_LTU) {
> +                gen_setcond_i128(tmpl, tmph, src1, src1h, src2, src2h,
> +                                 tcg_invert_cond(cond));
> +                tcg_gen_brcondi_tl(TCG_COND_EQ, tmpl, 0, l);
> +            } else {
> +                gen_setcond_i128(tmpl, tmph, src1, src1h, src2, src2h, cond);
> +                tcg_gen_brcondi_tl(TCG_COND_NE, tmpl, 0, l);
> +            }
> +        }

Which then takes care of all of this.

BTW, the hack was quite a hack, and quite unnecessary.  You could have dropped the shift 
and performed the LT/GE brcond directly on src1h.


r~

