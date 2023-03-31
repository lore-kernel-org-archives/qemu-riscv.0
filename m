Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piJOm-0006Hw-Ts
	for mharc-qemu-riscv@gnu.org; Fri, 31 Mar 2023 14:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1piJOj-0006HR-SE
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 14:22:50 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1piJOh-0005je-Cy
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 14:22:49 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l12so23328635wrm.10
 for <qemu-riscv@nongnu.org>; Fri, 31 Mar 2023 11:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1680286964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uyD2/xWLnlLkxKuHiLHf50Nu3UImM2VmDHp2HbwxrDw=;
 b=DlfgZnKEpKowjqXIrA8KS9x3sGTZsCz3/5g4dAjOY8EzQtdB4oDKm9uKnkWCzEKkLC
 n2N0p/mb60kgc4xuYMc7ACdWkps67yl0XRsjra6PGnH+yzG0eq44NS/7NndEopVDnwrq
 K+xzTHPsqPsz7p9fCVJHBgEV9gG3dx7iyuxH5hD53GxCHhDY07C7uCJ1xkEGnVOnrZyA
 ZEP+kYl2vRYL6IuisTZ6RIVpK+wGpF5LIfySMnF4hff2tmeHTII6OyLkBud7RptQbgTz
 g8co8TzxfyWV039STpSCrfRTBuyQsLhTG0XPPzHaGe/1UCZXoWHkPvv2Fkhfpk4Nf8HF
 lPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680286964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uyD2/xWLnlLkxKuHiLHf50Nu3UImM2VmDHp2HbwxrDw=;
 b=yURxS89+aZxyVPk/dTC9E24Cd6xCn3vDvLKkt47MddtuWMlFTrnspqIVV22J1981eg
 8Y/oLOMOQ/J0rDIb4aS/Ln4Tk0ty31kLhocR0LXxtJJv8Shn8M80XebDhkqbZAz45Fwz
 dPRdy3dqNg87ifjDE1tmS7I98M7qIrxQKbCx9t0IIeSD7WvxpDys/+z1VbAOkDBA+no0
 on0F3EwkZ1lgNyja3EWjeOC2n5cuHY6ii4ix7yRHVhm5AaO6Bh6cIkisOUPLdhmZOxf5
 QFsoOnBrgLqapA3Cp98MyxuHt3hD12kQBHe4NxTJTUL42dluO6T4ZQ8s22Iczp0WUu0f
 TVLg==
X-Gm-Message-State: AAQBX9di1FYxZC0wyjFsnB5OZn8FsdiTfdYQ1G6q6VIgnxExibgEYnz8
 j/ISR0v8fSMIhAw64VlBFSaQpoYl4OkRJePY3Baysg==
X-Google-Smtp-Source: AKy350YsGdcSJj7mk3kfjj43wrA3svIQ3b1sCxP1UbfASRQLXZAPDQEWiZsgS9eGebtCDOkvq2R4if1+5nek18NY3J0=
X-Received: by 2002:adf:e4d1:0:b0:2cf:e995:afef with SMTP id
 v17-20020adfe4d1000000b002cfe995afefmr5769037wrm.13.1680286964394; Fri, 31
 Mar 2023 11:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230327080026.3266574-1-christoph.muellner@vrull.eu>
 <b02cc37d-8a51-fed3-5a93-4d9f3873b5ae@linaro.org>
In-Reply-To: <b02cc37d-8a51-fed3-5a93-4d9f3873b5ae@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 31 Mar 2023 20:22:29 +0200
Message-ID: <CAEg0e7jvqcH42rR_TXZHzQjw_5+Cr-NyhuB_pUQUkLNDngxprA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add support for the Zfa extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jeff Law <jeffreyalaw@gmail.com>, Tsukasa OI <research_trasio@irq.a4lg.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 31 Mar 2023 18:22:51 -0000

On Mon, Mar 27, 2023 at 7:18=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/27/23 01:00, Christoph Muellner wrote:
> > +uint64_t helper_fminm_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
> > +{
> > +    float32 frs1 =3D check_nanbox_s(env, rs1);
> > +    float32 frs2 =3D check_nanbox_s(env, rs2);
> > +
> > +    if (float32_is_any_nan(frs1) || float32_is_any_nan(frs2)) {
> > +        return float32_default_nan(&env->fp_status);
> > +    }
> > +
> > +    return nanbox_s(env, float32_minimum_number(frs1, frs2, &env->fp_s=
tatus));
> > +}
>
> Better to set and clear fp_status->default_nan_mode around the operation.

I don't see how this can help:
* default_nan_mode defines if the default_nan is generated or if the
operand's NaN should be used
* RISC-V has default_nan_mode always set to true (operations should
return the a canonical NaN and not propagate NaN values)
* That also does not help to eliminate the is_any_nan() tests, because
float*_minimum_number() and float*_minnum() return the non-NaN number
if (only) one operand is NaN

Am I missing something?


>
> > +uint64_t helper_fround_s(CPURISCVState *env, uint64_t frs1)
> > +{
> > +    if (float32_is_zero(frs1) ||
> > +        float32_is_infinity(frs1)) {
> > +        return frs1;
> > +    }
> > +
> > +    if (float32_is_any_nan(frs1)) {
> > +        riscv_cpu_set_fflags(env, FPEXC_NV);
> > +        return frs1;
> > +    }
> > +
> > +    int32_t tmp =3D float32_to_int32(frs1, &env->fp_status);
> > +    return nanbox_s(env, int32_to_float32(tmp, &env->fp_status));
> > +}
>
> Very much incorrect, since int32_t does not have the range for the interm=
ediate result.
> In any case, the function you want is float32_round_to_int, which elimina=
tes the
> zero/inf/nan special cases.  It will raise inexact, so perfect for fround=
nx, but you'll
> need to save/restore float_flag_inexact around the function.

Understood the issue and changed to the proposed API.

>
> > +uint64_t helper_fli_s(CPURISCVState *env, uint32_t rs1)
> > +{
> > +    const uint32_t fli_s_table[] =3D {
>
> static const.  You don't need to use float32_default_nan, use the correct=
 architected
> constant.  This entire operation should be done at translation time.

Done.

>
> > +target_ulong helper_fcvtmod_w_d(CPURISCVState *env, uint64_t frs1)
> > +{
> > +    if (float64_is_any_nan(frs1) ||
> > +        float64_is_infinity(frs1)) {
> > +        return 0;
> > +    }
> > +
> > +    return float64_to_int32(frs1, &env->fp_status);
> > +}
>
> Incorrect, as float64_to_int32 will saturate the result, whereas you need=
 the modular result.
>
> There is code to do the conversion mod 2**64 in target/alpha/ (do_cvttq).=
  We should move
> this to generic code if it is to be used by more than one target.

Understood the issue.
ARM has something similar in HELPER(fjcvtzs).

Given the different flag behaviour of the ARM and the Alpha
instructions, I created a RISC-V specific routine.
For RISC-V the flags have to be identical to fcvt.w.d with the same value.

>
> > +bool trans_fmvp_d_x(DisasContext *ctx, arg_fmvp_d_x *a)
> > +{
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFA(ctx);
> > +    REQUIRE_EXT(ctx, RVD);
> > +    REQUIRE_32BIT(ctx);
> > +
> > +    TCGv src1 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
> > +    TCGv_i64 t1 =3D tcg_temp_new_i64();
> > +
> > +    tcg_gen_extu_tl_i64(t1, src1);
> > +    tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd], t1, 32, 32);
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
>
> This does not match the linked document, which says that this insn has tw=
o inputs and sets
> the complete fpr.

Fixed.

Thanks!

