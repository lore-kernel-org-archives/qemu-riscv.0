Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1munnS-00075U-8W
	for mharc-qemu-riscv@gnu.org; Tue, 07 Dec 2021 22:39:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1munnO-00074w-Ol; Tue, 07 Dec 2021 22:39:07 -0500
Received: from [2607:f8b0:4864:20::d34] (port=41684
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1munnM-0007al-W8; Tue, 07 Dec 2021 22:39:06 -0500
Received: by mail-io1-xd34.google.com with SMTP id y16so1396130ioc.8;
 Tue, 07 Dec 2021 19:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ULagRiZQUcsCdfnWzxWqN+QKUPi4EZkn7bGfg2H/wyM=;
 b=AsBoco4ljOO209Q73EPlY90NtRYwxwjPhbWe3sKBHkMrpXNox5qrz17V9XYSyqgQU5
 Xan6LYOQU9QYdOLNr4zpqUy8k6wup9w8Xj0uyve1ideSRRwse8g4sx/ay0vlJe97cPLJ
 gz3qPih2SeKle5mfGj6I9MQW8Kkr0IBBGEiENOSpg7XPGUZnPH5WFMMbdR7qwzrHXh1t
 SNz/+5eztPG2NhaeRhGEQeP7o/z5CRAOa8DkKtwoROJdIlrA2oTfBqlYY6pxZAgozhL3
 DQqLhPY83NU2ryQJo4GWwmgxRR8ztxPGb7HuCVoWJFW5N9L+UaHjvABubluZVGBr8Riw
 s8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ULagRiZQUcsCdfnWzxWqN+QKUPi4EZkn7bGfg2H/wyM=;
 b=v1rZtrfkjLFTlOIa90EKm0/5/zfYaob7TZ3Q6r5bkB6DOE41rD1Sefy3rMNR1hg4Yb
 gWpjN4VFxsT1P+PSUGI9Q50n2GAsyU/hE3cD4UwbH/zb7LfAa5M19JLI397idGEWfWK3
 FO2xJ66etXTyXqNpQhnD+j7JTy9qdjkR7HYGKOv8rzrZLycZ0kaAcigdEi+d+KFowppj
 W3UtXgbwKuYxvW7hWI76LAlntmM6mPwz0HGU1ttgl60UbQu8BCl5n2gFrePLkVvtU18m
 +SHdUQQ2C9s7sYG1UW+LPnKLmrmErSI5uQY91pgidrdXdrdU+76M62bz5411l/PzcuPh
 eYPQ==
X-Gm-Message-State: AOAM533szxR0JZGetVHaZF9EpesF6YVN0JoelE1p7+FWnmHZIB0gkKuc
 3HAgvtaGlvQl9phetHlG47J0hwA70yIV9qHoCNw=
X-Google-Smtp-Source: ABdhPJyT+kxTJJpSygKj5zAtIf5ghNpTeTohg9crXG6I8JDDw/uAfgk4w+cq9zvG4NA5Iym7JUXCDZ+bbmbiccZIbhw=
X-Received: by 2002:a02:9f0c:: with SMTP id z12mr52807672jal.117.1638934743423; 
 Tue, 07 Dec 2021 19:39:03 -0800 (PST)
MIME-Version: 1.0
References: <20211129030340.429689-1-frank.chang@sifive.com>
 <20211129030340.429689-71-frank.chang@sifive.com>
In-Reply-To: <20211129030340.429689-71-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Dec 2021 13:38:37 +1000
Message-ID: <CAKmqyKNYisVEnYjavpWdKDXXoH4bazQ8dw9Y_KJviUdMcYm90A@mail.gmail.com>
Subject: Re: [PATCH v10 70/77] target/riscv: rvv-1.0: floating-point
 reciprocal estimate instruction
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 08 Dec 2021 03:39:07 -0000

On Mon, Nov 29, 2021 at 1:58 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Implement the floating-point reciprocal estimate to 7 bits instruction.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |   4 +
>  target/riscv/insn32.decode              |   1 +
>  target/riscv/insn_trans/trans_rvv.c.inc |   1 +
>  target/riscv/vector_helper.c            | 191 ++++++++++++++++++++++++
>  4 files changed, 197 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index bdf06dfb24d..ab283d12b79 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -845,6 +845,10 @@ DEF_HELPER_5(vfrsqrt7_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfrsqrt7_v_w, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfrsqrt7_v_d, void, ptr, ptr, ptr, env, i32)
>
> +DEF_HELPER_5(vfrec7_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfrec7_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfrec7_v_d, void, ptr, ptr, ptr, env, i32)
> +
>  DEF_HELPER_6(vfmin_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vfmin_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vfmin_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 6e5f288943a..952768f8ded 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -561,6 +561,7 @@ vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
>  vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
>  vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
>  vfrsqrt7_v      010011 . ..... 00100 001 ..... 1010111 @r2_vm
> +vfrec7_v        010011 . ..... 00101 001 ..... 1010111 @r2_vm
>  vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
>  vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
>  vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 8fe718610a9..ff8f6df8f7b 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2408,6 +2408,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  \
>
>  GEN_OPFV_TRANS(vfsqrt_v, opfv_check, RISCV_FRM_DYN)
>  GEN_OPFV_TRANS(vfrsqrt7_v, opfv_check, RISCV_FRM_DYN)
> +GEN_OPFV_TRANS(vfrec7_v, opfv_check, RISCV_FRM_DYN)
>
>  /* Vector Floating-Point MIN/MAX Instructions */
>  GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index d5f3229bcb4..946dca53ffd 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -3587,6 +3587,197 @@ GEN_VEXT_V_ENV(vfrsqrt7_v_h, 2, 2)
>  GEN_VEXT_V_ENV(vfrsqrt7_v_w, 4, 4)
>  GEN_VEXT_V_ENV(vfrsqrt7_v_d, 8, 8)
>
> +/*
> + * Vector Floating-Point Reciprocal Estimate Instruction
> + *
> + * Adapted from riscv-v-spec recip.c:
> + * https://github.com/riscv/riscv-v-spec/blob/master/recip.c
> + */
> +static uint64_t frec7(uint64_t f, int exp_size, int frac_size,
> +                      float_status *s)
> +{
> +    uint64_t sign = extract64(f, frac_size + exp_size, 1);
> +    uint64_t exp = extract64(f, frac_size, exp_size);
> +    uint64_t frac = extract64(f, 0, frac_size);
> +
> +    const uint8_t lookup_table[] = {
> +        127, 125, 123, 121, 119, 117, 116, 114,
> +        112, 110, 109, 107, 105, 104, 102, 100,
> +        99, 97, 96, 94, 93, 91, 90, 88,
> +        87, 85, 84, 83, 81, 80, 79, 77,
> +        76, 75, 74, 72, 71, 70, 69, 68,
> +        66, 65, 64, 63, 62, 61, 60, 59,
> +        58, 57, 56, 55, 54, 53, 52, 51,
> +        50, 49, 48, 47, 46, 45, 44, 43,
> +        42, 41, 40, 40, 39, 38, 37, 36,
> +        35, 35, 34, 33, 32, 31, 31, 30,
> +        29, 28, 28, 27, 26, 25, 25, 24,
> +        23, 23, 22, 21, 21, 20, 19, 19,
> +        18, 17, 17, 16, 15, 15, 14, 14,
> +        13, 12, 12, 11, 11, 10, 9, 9,
> +        8, 8, 7, 7, 6, 5, 5, 4,
> +        4, 3, 3, 2, 2, 1, 1, 0
> +    };
> +    const int precision = 7;
> +
> +    if (exp == 0 && frac != 0) { /* subnormal */
> +        /* Normalize the subnormal. */
> +        while (extract64(frac, frac_size - 1, 1) == 0) {
> +            exp--;
> +            frac <<= 1;
> +        }
> +
> +        frac = (frac << 1) & MAKE_64BIT_MASK(0, frac_size);
> +
> +        if (exp != 0 && exp != UINT64_MAX) {
> +            /*
> +             * Overflow to inf or max value of same sign,
> +             * depending on sign and rounding mode.
> +             */
> +            s->float_exception_flags |= (float_flag_inexact |
> +                                         float_flag_overflow);
> +
> +            if ((s->float_rounding_mode == float_round_to_zero) ||
> +                ((s->float_rounding_mode == float_round_down) && !sign) ||
> +                ((s->float_rounding_mode == float_round_up) && sign)) {
> +                /* Return greatest/negative finite value. */
> +                return (sign << (exp_size + frac_size)) |
> +                    (MAKE_64BIT_MASK(frac_size, exp_size) - 1);
> +            } else {
> +                /* Return +-inf. */
> +                return (sign << (exp_size + frac_size)) |
> +                    MAKE_64BIT_MASK(frac_size, exp_size);
> +            }
> +        }
> +    }
> +
> +    int idx = frac >> (frac_size - precision);
> +    uint64_t out_frac = (uint64_t)(lookup_table[idx]) <<
> +                            (frac_size - precision);
> +    uint64_t out_exp = 2 * MAKE_64BIT_MASK(0, exp_size - 1) + ~exp;
> +
> +    if (out_exp == 0 || out_exp == UINT64_MAX) {
> +        /*
> +         * The result is subnormal, but don't raise the underflow exception,
> +         * because there's no additional loss of precision.
> +         */
> +        out_frac = (out_frac >> 1) | MAKE_64BIT_MASK(frac_size - 1, 1);
> +        if (out_exp == UINT64_MAX) {
> +            out_frac >>= 1;
> +            out_exp = 0;
> +        }
> +    }
> +
> +    uint64_t val = 0;
> +    val = deposit64(val, 0, frac_size, out_frac);
> +    val = deposit64(val, frac_size, exp_size, out_exp);
> +    val = deposit64(val, frac_size + exp_size, 1, sign);
> +    return val;
> +}
> +
> +static float16 frec7_h(float16 f, float_status *s)
> +{
> +    int exp_size = 5, frac_size = 10;
> +    bool sign = float16_is_neg(f);
> +
> +    /* frec7(+-inf) = +-0 */
> +    if (float16_is_infinity(f)) {
> +        return float16_set_sign(float16_zero, sign);
> +    }
> +
> +    /* frec7(+-0) = +-inf */
> +    if (float16_is_zero(f)) {
> +        s->float_exception_flags |= float_flag_divbyzero;
> +        return float16_set_sign(float16_infinity, sign);
> +    }
> +
> +    /* frec7(sNaN) = canonical NaN */
> +    if (float16_is_signaling_nan(f, s)) {
> +        s->float_exception_flags |= float_flag_invalid;
> +        return float16_default_nan(s);
> +    }
> +
> +    /* frec7(qNaN) = canonical NaN */
> +    if (float16_is_quiet_nan(f, s)) {
> +        return float16_default_nan(s);
> +    }
> +
> +    /* +-normal, +-subnormal */
> +    uint64_t val = frec7(f, exp_size, frac_size, s);
> +    return make_float16(val);
> +}
> +
> +static float32 frec7_s(float32 f, float_status *s)
> +{
> +    int exp_size = 8, frac_size = 23;
> +    bool sign = float32_is_neg(f);
> +
> +    /* frec7(+-inf) = +-0 */
> +    if (float32_is_infinity(f)) {
> +        return float32_set_sign(float32_zero, sign);
> +    }
> +
> +    /* frec7(+-0) = +-inf */
> +    if (float32_is_zero(f)) {
> +        s->float_exception_flags |= float_flag_divbyzero;
> +        return float32_set_sign(float32_infinity, sign);
> +    }
> +
> +    /* frec7(sNaN) = canonical NaN */
> +    if (float32_is_signaling_nan(f, s)) {
> +        s->float_exception_flags |= float_flag_invalid;
> +        return float32_default_nan(s);
> +    }
> +
> +    /* frec7(qNaN) = canonical NaN */
> +    if (float32_is_quiet_nan(f, s)) {
> +        return float32_default_nan(s);
> +    }
> +
> +    /* +-normal, +-subnormal */
> +    uint64_t val = frec7(f, exp_size, frac_size, s);
> +    return make_float32(val);
> +}
> +
> +static float64 frec7_d(float64 f, float_status *s)
> +{
> +    int exp_size = 11, frac_size = 52;
> +    bool sign = float64_is_neg(f);
> +
> +    /* frec7(+-inf) = +-0 */
> +    if (float64_is_infinity(f)) {
> +        return float64_set_sign(float64_zero, sign);
> +    }
> +
> +    /* frec7(+-0) = +-inf */
> +    if (float64_is_zero(f)) {
> +        s->float_exception_flags |= float_flag_divbyzero;
> +        return float64_set_sign(float64_infinity, sign);
> +    }
> +
> +    /* frec7(sNaN) = canonical NaN */
> +    if (float64_is_signaling_nan(f, s)) {
> +        s->float_exception_flags |= float_flag_invalid;
> +        return float64_default_nan(s);
> +    }
> +
> +    /* frec7(qNaN) = canonical NaN */
> +    if (float64_is_quiet_nan(f, s)) {
> +        return float64_default_nan(s);
> +    }
> +
> +    /* +-normal, +-subnormal */
> +    uint64_t val = frec7(f, exp_size, frac_size, s);
> +    return make_float64(val);
> +}
> +
> +RVVCALL(OPFVV1, vfrec7_v_h, OP_UU_H, H2, H2, frec7_h)
> +RVVCALL(OPFVV1, vfrec7_v_w, OP_UU_W, H4, H4, frec7_s)
> +RVVCALL(OPFVV1, vfrec7_v_d, OP_UU_D, H8, H8, frec7_d)
> +GEN_VEXT_V_ENV(vfrec7_v_h, 2, 2)
> +GEN_VEXT_V_ENV(vfrec7_v_w, 4, 4)
> +GEN_VEXT_V_ENV(vfrec7_v_d, 8, 8)
> +
>  /* Vector Floating-Point MIN/MAX Instructions */
>  RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minimum_number)
>  RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minimum_number)
> --
> 2.25.1
>
>

