Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1munhY-0003wY-Nq
	for mharc-qemu-riscv@gnu.org; Tue, 07 Dec 2021 22:33:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1munhV-0003ts-Sv; Tue, 07 Dec 2021 22:33:01 -0500
Received: from [2607:f8b0:4864:20::d29] (port=33542
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1munhT-0006lS-Sy; Tue, 07 Dec 2021 22:33:01 -0500
Received: by mail-io1-xd29.google.com with SMTP id m9so1476351iop.0;
 Tue, 07 Dec 2021 19:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RAv/LSrrCuHvVlAsX2hmCNdMJyuucx16pWQpiTLoPrE=;
 b=mYoH/x9YJPARtGaLx36dHGMWUFAK9JJe/PkFQHbmiONUJ2ZePtyaFwzN7LPi4Ou3sG
 F3fCtRcMHq1Xjm3deTpvNlGsKS9q6KU02a5aYMVz7ntFazzoQCaQdYn1KXdWudxLR6X+
 QRLzhadaIG4MTg51kfKoRzw9irhgiEWuP6igxXrA0Hvls5BtA+x5Tx0U6Yauhv9zBquP
 ZQ8prNTthJfq0A0r4mThyjFF0TM7CqQWPr7L6WTQDCqiNVeivwzC2tdD51NBxg41lGAx
 otEjPcZrYB+8lB3FjYY04TmXrWpayTGCaxh+la31Szz7Bcg/jk5sKusUF3ocqK8+oQx4
 OR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RAv/LSrrCuHvVlAsX2hmCNdMJyuucx16pWQpiTLoPrE=;
 b=hcQ3f4UDSUVL/d8NJEHjYzjev2PN/YItGKaVLHlo+RV7kqo47+RCvcJ0y3NeEKT5KB
 J/sDffT+CwKl0sknmTZNPFINcnDwsF2fh4+5QRSA1mEb0HI6lx9fhR8J9MIpdzuGEcN6
 /AFCFu0SKO6nP6LU9rgy0wURbiZwuGll4lQ/BVdYrkCfK3B4OkLs/rp88BcQYyAr1tuP
 pzk4JdsXQyLRBy/kQTyKGTI9NM4ktFKeZwpjuFJszCFTboeffFY5p3KC3+66sAa3xicU
 UUP/4GBk3wp9fMycc8e/ZIOER3Cm63MMNdRudbFo0Sycu5VFseOkbMRFQ7kVaDHFMPC5
 Zi/Q==
X-Gm-Message-State: AOAM533oxIowMbokJgIO7EG2Q9UgKa5MRFL/ro/QZw+5N4E79aSyp6If
 b/uXrc0LeVYIBJrkNUmlHhLpHaJhRxZSx+PV1k4=
X-Google-Smtp-Source: ABdhPJw2XpBwltYQinhfd+9DpNcHmyUcQP7xWbq+NQG/fhvPGoKA1jMAt+DTpdU6o+RxRk1+bMD42ndSQeeRGrJCrxA=
X-Received: by 2002:a05:6638:32a2:: with SMTP id
 f34mr53296744jav.63.1638934378489; 
 Tue, 07 Dec 2021 19:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20211129030340.429689-1-frank.chang@sifive.com>
 <20211129030340.429689-70-frank.chang@sifive.com>
In-Reply-To: <20211129030340.429689-70-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Dec 2021 13:32:32 +1000
Message-ID: <CAKmqyKPgFKwwDyzjfbWZw=z_+-GWgb5634FVYRqei8pLgJuv4w@mail.gmail.com>
Subject: Re: [PATCH v10 69/77] target/riscv: rvv-1.0: floating-point
 reciprocal square-root estimate instruction
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Wed, 08 Dec 2021 03:33:02 -0000

On Mon, Nov 29, 2021 at 1:57 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Implement the floating-point reciprocal square-root estimate to 7 bits
> instruction.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |   4 +
>  target/riscv/insn32.decode              |   1 +
>  target/riscv/insn_trans/trans_rvv.c.inc |   1 +
>  target/riscv/vector_helper.c            | 183 ++++++++++++++++++++++++
>  4 files changed, 189 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index a717a87a0e0..bdf06dfb24d 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -841,6 +841,10 @@ DEF_HELPER_5(vfsqrt_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfsqrt_v_w, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfsqrt_v_d, void, ptr, ptr, ptr, env, i32)
>
> +DEF_HELPER_5(vfrsqrt7_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfrsqrt7_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfrsqrt7_v_d, void, ptr, ptr, ptr, env, i32)
> +
>  DEF_HELPER_6(vfmin_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vfmin_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vfmin_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index c4fdc76a269..6e5f288943a 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -560,6 +560,7 @@ vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
>  vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
>  vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
>  vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
> +vfrsqrt7_v      010011 . ..... 00100 001 ..... 1010111 @r2_vm
>  vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
>  vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
>  vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 53c8573f117..8fe718610a9 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2407,6 +2407,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)  \
>  }
>
>  GEN_OPFV_TRANS(vfsqrt_v, opfv_check, RISCV_FRM_DYN)
> +GEN_OPFV_TRANS(vfrsqrt7_v, opfv_check, RISCV_FRM_DYN)
>
>  /* Vector Floating-Point MIN/MAX Instructions */
>  GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 22848d6b683..d5f3229bcb4 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -18,6 +18,7 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/host-utils.h"
> +#include "qemu/bitops.h"
>  #include "cpu.h"
>  #include "exec/memop.h"
>  #include "exec/exec-all.h"
> @@ -3404,6 +3405,188 @@ GEN_VEXT_V_ENV(vfsqrt_v_h, 2, 2)
>  GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4)
>  GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8)
>
> +/*
> + * Vector Floating-Point Reciprocal Square-Root Estimate Instruction
> + *
> + * Adapted from riscv-v-spec recip.c:
> + * https://github.com/riscv/riscv-v-spec/blob/master/recip.c
> + */
> +static uint64_t frsqrt7(uint64_t f, int exp_size, int frac_size)
> +{
> +    uint64_t sign = extract64(f, frac_size + exp_size, 1);
> +    uint64_t exp = extract64(f, frac_size, exp_size);
> +    uint64_t frac = extract64(f, 0, frac_size);
> +
> +    const uint8_t lookup_table[] = {
> +        52, 51, 50, 48, 47, 46, 44, 43,
> +        42, 41, 40, 39, 38, 36, 35, 34,
> +        33, 32, 31, 30, 30, 29, 28, 27,
> +        26, 25, 24, 23, 23, 22, 21, 20,
> +        19, 19, 18, 17, 16, 16, 15, 14,
> +        14, 13, 12, 12, 11, 10, 10, 9,
> +        9, 8, 7, 7, 6, 6, 5, 4,
> +        4, 3, 3, 2, 2, 1, 1, 0,
> +        127, 125, 123, 121, 119, 118, 116, 114,
> +        113, 111, 109, 108, 106, 105, 103, 102,
> +        100, 99, 97, 96, 95, 93, 92, 91,
> +        90, 88, 87, 86, 85, 84, 83, 82,
> +        80, 79, 78, 77, 76, 75, 74, 73,
> +        72, 71, 70, 70, 69, 68, 67, 66,
> +        65, 64, 63, 63, 62, 61, 60, 59,
> +        59, 58, 57, 56, 56, 55, 54, 53
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
> +    }
> +
> +    int idx = ((exp & 1) << (precision - 1)) |
> +                (frac >> (frac_size - precision + 1));
> +    uint64_t out_frac = (uint64_t)(lookup_table[idx]) <<
> +                            (frac_size - precision);
> +    uint64_t out_exp = (3 * MAKE_64BIT_MASK(0, exp_size - 1) + ~exp) / 2;
> +
> +    uint64_t val = 0;
> +    val = deposit64(val, 0, frac_size, out_frac);
> +    val = deposit64(val, frac_size, exp_size, out_exp);
> +    val = deposit64(val, frac_size + exp_size, 1, sign);
> +    return val;
> +}
> +
> +static float16 frsqrt7_h(float16 f, float_status *s)
> +{
> +    int exp_size = 5, frac_size = 10;
> +    bool sign = float16_is_neg(f);
> +
> +    /*
> +     * frsqrt7(sNaN) = canonical NaN
> +     * frsqrt7(-inf) = canonical NaN
> +     * frsqrt7(-normal) = canonical NaN
> +     * frsqrt7(-subnormal) = canonical NaN
> +     */
> +    if (float16_is_signaling_nan(f, s) ||
> +            (float16_is_infinity(f) && sign) ||
> +            (float16_is_normal(f) && sign) ||
> +            (float16_is_zero_or_denormal(f) && !float16_is_zero(f) && sign)) {
> +        s->float_exception_flags |= float_flag_invalid;
> +        return float16_default_nan(s);
> +    }
> +
> +    /* frsqrt7(qNaN) = canonical NaN */
> +    if (float16_is_quiet_nan(f, s)) {
> +        return float16_default_nan(s);
> +    }
> +
> +    /* frsqrt7(+-0) = +-inf */
> +    if (float16_is_zero(f)) {
> +        s->float_exception_flags |= float_flag_divbyzero;
> +        return float16_set_sign(float16_infinity, sign);
> +    }
> +
> +    /* frsqrt7(+inf) = +0 */
> +    if (float16_is_infinity(f) && !sign) {
> +        return float16_set_sign(float16_zero, sign);
> +    }
> +
> +    /* +normal, +subnormal */
> +    uint64_t val = frsqrt7(f, exp_size, frac_size);
> +    return make_float16(val);
> +}
> +
> +static float32 frsqrt7_s(float32 f, float_status *s)
> +{
> +    int exp_size = 8, frac_size = 23;
> +    bool sign = float32_is_neg(f);
> +
> +    /*
> +     * frsqrt7(sNaN) = canonical NaN
> +     * frsqrt7(-inf) = canonical NaN
> +     * frsqrt7(-normal) = canonical NaN
> +     * frsqrt7(-subnormal) = canonical NaN
> +     */
> +    if (float32_is_signaling_nan(f, s) ||
> +            (float32_is_infinity(f) && sign) ||
> +            (float32_is_normal(f) && sign) ||
> +            (float32_is_zero_or_denormal(f) && !float32_is_zero(f) && sign)) {
> +        s->float_exception_flags |= float_flag_invalid;
> +        return float32_default_nan(s);
> +    }
> +
> +    /* frsqrt7(qNaN) = canonical NaN */
> +    if (float32_is_quiet_nan(f, s)) {
> +        return float32_default_nan(s);
> +    }
> +
> +    /* frsqrt7(+-0) = +-inf */
> +    if (float32_is_zero(f)) {
> +        s->float_exception_flags |= float_flag_divbyzero;
> +        return float32_set_sign(float32_infinity, sign);
> +    }
> +
> +    /* frsqrt7(+inf) = +0 */
> +    if (float32_is_infinity(f) && !sign) {
> +        return float32_set_sign(float32_zero, sign);
> +    }
> +
> +    /* +normal, +subnormal */
> +    uint64_t val = frsqrt7(f, exp_size, frac_size);
> +    return make_float32(val);
> +}
> +
> +static float64 frsqrt7_d(float64 f, float_status *s)
> +{
> +    int exp_size = 11, frac_size = 52;
> +    bool sign = float64_is_neg(f);
> +
> +    /*
> +     * frsqrt7(sNaN) = canonical NaN
> +     * frsqrt7(-inf) = canonical NaN
> +     * frsqrt7(-normal) = canonical NaN
> +     * frsqrt7(-subnormal) = canonical NaN
> +     */
> +    if (float64_is_signaling_nan(f, s) ||
> +            (float64_is_infinity(f) && sign) ||
> +            (float64_is_normal(f) && sign) ||
> +            (float64_is_zero_or_denormal(f) && !float64_is_zero(f) && sign)) {
> +        s->float_exception_flags |= float_flag_invalid;
> +        return float64_default_nan(s);
> +    }
> +
> +    /* frsqrt7(qNaN) = canonical NaN */
> +    if (float64_is_quiet_nan(f, s)) {
> +        return float64_default_nan(s);
> +    }
> +
> +    /* frsqrt7(+-0) = +-inf */
> +    if (float64_is_zero(f)) {
> +        s->float_exception_flags |= float_flag_divbyzero;
> +        return float64_set_sign(float64_infinity, sign);
> +    }
> +
> +    /* frsqrt7(+inf) = +0 */
> +    if (float64_is_infinity(f) && !sign) {
> +        return float64_set_sign(float64_zero, sign);
> +    }
> +
> +    /* +normal, +subnormal */
> +    uint64_t val = frsqrt7(f, exp_size, frac_size);
> +    return make_float64(val);
> +}
> +
> +RVVCALL(OPFVV1, vfrsqrt7_v_h, OP_UU_H, H2, H2, frsqrt7_h)
> +RVVCALL(OPFVV1, vfrsqrt7_v_w, OP_UU_W, H4, H4, frsqrt7_s)
> +RVVCALL(OPFVV1, vfrsqrt7_v_d, OP_UU_D, H8, H8, frsqrt7_d)
> +GEN_VEXT_V_ENV(vfrsqrt7_v_h, 2, 2)
> +GEN_VEXT_V_ENV(vfrsqrt7_v_w, 4, 4)
> +GEN_VEXT_V_ENV(vfrsqrt7_v_d, 8, 8)
> +
>  /* Vector Floating-Point MIN/MAX Instructions */
>  RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minimum_number)
>  RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minimum_number)
> --
> 2.25.1
>
>

