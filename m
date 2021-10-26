Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfG1Z-0006hp-Pi
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfG1S-0006ef-Ji; Tue, 26 Oct 2021 02:33:23 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:35592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfG1M-0007Wi-Fs; Tue, 26 Oct 2021 02:33:21 -0400
Received: by mail-il1-x131.google.com with SMTP id j10so12477581ilu.2;
 Mon, 25 Oct 2021 23:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NE3hYZflzr3oanrUhzWR/9hLPkG35puw0jeFbJZt/+4=;
 b=k+F4ebhbdMsVxThcMfDu5VXrtRxo6wIK9J9BF5jh/8cyEqbD796n7GOyrWotiWBfwO
 vG42ZiIZCNvZNe9R2wKP8NSiv0Gye9VJB5JeSPR/q/8ES71N20DuHx0zaPojwJEmtSRl
 InfzNQm/JbmYagS4xcOGYuTfJBTKzqOJW5VgsYgkzKVWBvrpnHAhYm2BwvAoYeogvuPZ
 CfFvHHZ+CSi29fkHf1N5WLeg7SCDoImpsaHPCd1COh8mHGZ9C+zH+ERwaQLQJsPA7lAC
 gXYVfpE53dz8PSFrzdcuEZy/U3EkSdLwAhEVzT8jwx/ngFTtDiVxZCHtndF++sVicBf8
 ghZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NE3hYZflzr3oanrUhzWR/9hLPkG35puw0jeFbJZt/+4=;
 b=d7zZkWqCn0mym+b4UYKCcpHEreEPd3UKXV6xQUnhzP0UoBJKqK2/452a7Lf2yop7vv
 Kfj4QsHAk3+X6pzOdogbuHw8pP0l1d/zbw6m+RMbtua2PDabS5vJZyUni9z8kz0iZ+Kj
 fOqiwXOVf6cjMl7uBp1R+pOKhRj7jSXpu9A+jHMy3AYg8Pyv8RO4OwxhpTnjEnIim44+
 3MtIz2QfsMDfTcbG/vb3XxSsCZs1QOrt9hJ7RmWOcH8IMmzfhTVdbeSqmL2CzdC0XaM2
 WfoVsnPm7JAMy4Uvr626DZs0n0ZlGLESugDAnD15kGitydeS/CvqdvocxMEeeZTSqx58
 fsXA==
X-Gm-Message-State: AOAM530RNW8cu59/RJsFw7Vdi38qBfOcWdpYq8O1yeoIrh/Q3LE9mZnU
 nGrinyQFBDPtPSeAjgQVhXDwRPhu1RAm3NsKDGTvOacU2b/D0w==
X-Google-Smtp-Source: ABdhPJyccTk3Su7s4UEP++3ffBodSAoGzhoJi6JLV3zTpwRRfQ+ezj9Xajgk8nfrlOSyHFHNdLHrfb4XVdjZexJncaU=
X-Received: by 2002:a92:c26d:: with SMTP id h13mr7424316ild.221.1635229993003; 
 Mon, 25 Oct 2021 23:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-72-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-72-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Oct 2021 16:32:46 +1000
Message-ID: <CAKmqyKNMwRkU8ucvdXXioLbkR3z-OUQoaiKqv0neEugm9_02=Q@mail.gmail.com>
Subject: Re: [PATCH v8 64/78] target/riscv: rvv-1.0: narrowing
 floating-point/integer type-convert
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 26 Oct 2021 06:33:26 -0000

On Fri, Oct 15, 2021 at 6:41 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   | 22 ++++-----
>  target/riscv/insn32.decode              | 15 ++++---
>  target/riscv/insn_trans/trans_rvv.c.inc | 59 +++++++++++++++++++++----
>  target/riscv/vector_helper.c            | 45 ++++++++++---------
>  4 files changed, 97 insertions(+), 44 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 606bf72d5cb..1a0d817f0f5 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -938,16 +938,18 @@ DEF_HELPER_5(vfwcvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_f_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_f_v_w, void, ptr, ptr, ptr, env, i32)
>
> -DEF_HELPER_5(vfncvt_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_5(vfncvt_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_5(vfncvt_x_f_v_h, void, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_5(vfncvt_x_f_v_w, void, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_5(vfncvt_f_xu_v_h, void, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_5(vfncvt_f_xu_v_w, void, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_5(vfncvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_5(vfncvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_5(vfncvt_f_f_v_h, void, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_5(vfncvt_f_f_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_xu_f_w_b, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_xu_f_w_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_xu_f_w_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_x_f_w_b, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_x_f_w_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_x_f_w_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_f_xu_w_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_f_xu_w_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_f_x_w_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_f_x_w_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_f_f_w_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfncvt_f_f_w_w, void, ptr, ptr, ptr, env, i32)
>
>  DEF_HELPER_6(vredsum_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 664d0fb3716..c4fdc76a269 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -600,11 +600,16 @@ vfwcvt_f_x_v       010010 . ..... 01011 001 ..... 1010111 @r2_vm
>  vfwcvt_f_f_v       010010 . ..... 01100 001 ..... 1010111 @r2_vm
>  vfwcvt_rtz_xu_f_v  010010 . ..... 01110 001 ..... 1010111 @r2_vm
>  vfwcvt_rtz_x_f_v   010010 . ..... 01111 001 ..... 1010111 @r2_vm
> -vfncvt_xu_f_v   100010 . ..... 10000 001 ..... 1010111 @r2_vm
> -vfncvt_x_f_v    100010 . ..... 10001 001 ..... 1010111 @r2_vm
> -vfncvt_f_xu_v   100010 . ..... 10010 001 ..... 1010111 @r2_vm
> -vfncvt_f_x_v    100010 . ..... 10011 001 ..... 1010111 @r2_vm
> -vfncvt_f_f_v    100010 . ..... 10100 001 ..... 1010111 @r2_vm
> +
> +vfncvt_xu_f_w      010010 . ..... 10000 001 ..... 1010111 @r2_vm
> +vfncvt_x_f_w       010010 . ..... 10001 001 ..... 1010111 @r2_vm
> +vfncvt_f_xu_w      010010 . ..... 10010 001 ..... 1010111 @r2_vm
> +vfncvt_f_x_w       010010 . ..... 10011 001 ..... 1010111 @r2_vm
> +vfncvt_f_f_w       010010 . ..... 10100 001 ..... 1010111 @r2_vm
> +vfncvt_rod_f_f_w   010010 . ..... 10101 001 ..... 1010111 @r2_vm
> +vfncvt_rtz_xu_f_w  010010 . ..... 10110 001 ..... 1010111 @r2_vm
> +vfncvt_rtz_x_f_w   010010 . ..... 10111 001 ..... 1010111 @r2_vm
> +
>  vredsum_vs      000000 . ..... ..... 010 ..... 1010111 @r_vm
>  vredand_vs      000001 . ..... ..... 010 ..... 1010111 @r_vm
>  vredor_vs       000010 . ..... ..... 010 ..... 1010111 @r_vm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 63d33b22068..92a23b52e49 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2622,17 +2622,17 @@ static bool opfv_narrow_check(DisasContext *s, arg_rmr *a)
>             vext_check_sd(s, a->rd, a->rs2, a->vm);
>  }
>
> -#define GEN_OPFV_NARROW_TRANS(NAME)                                \
> +#define GEN_OPFV_NARROW_TRANS(NAME, HELPER, FRM)                   \
>  static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>  {                                                                  \
>      if (opfv_narrow_check(s, a)) {                                 \
>          uint32_t data = 0;                                         \
>          static gen_helper_gvec_3_ptr * const fns[2] = {            \
> -            gen_helper_##NAME##_h,                                 \
> -            gen_helper_##NAME##_w,                                 \
> +            gen_helper_##HELPER##_h,                               \
> +            gen_helper_##HELPER##_w,                               \
>          };                                                         \
>          TCGLabel *over = gen_new_label();                          \
> -        gen_set_rm(s, RISCV_FRM_DYN);                              \
> +        gen_set_rm(s, FRM);                                        \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>                                                                     \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
> @@ -2648,11 +2648,52 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>      return false;                                                  \
>  }
>
> -GEN_OPFV_NARROW_TRANS(vfncvt_xu_f_v)
> -GEN_OPFV_NARROW_TRANS(vfncvt_x_f_v)
> -GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_v)
> -GEN_OPFV_NARROW_TRANS(vfncvt_f_x_v)
> -GEN_OPFV_NARROW_TRANS(vfncvt_f_f_v)
> +GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_w, vfncvt_f_xu_w, RISCV_FRM_DYN)
> +GEN_OPFV_NARROW_TRANS(vfncvt_f_x_w, vfncvt_f_x_w, RISCV_FRM_DYN)
> +GEN_OPFV_NARROW_TRANS(vfncvt_f_f_w, vfncvt_f_f_w, RISCV_FRM_DYN)
> +/* Reuse the helper function from vfncvt.f.f.w */
> +GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w, vfncvt_f_f_w, RISCV_FRM_ROD)
> +
> +static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
> +{
> +    return require_rvv(s) &&
> +           require_scale_rvf(s) &&
> +           vext_check_isa_ill(s) &&
> +           /* OPFV narrowing instructions ignore vs1 check */
> +           vext_check_sd(s, a->rd, a->rs2, a->vm);
> +}
> +
> +#define GEN_OPXFV_NARROW_TRANS(NAME, HELPER, FRM)                  \
> +static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
> +{                                                                  \
> +    if (opxfv_narrow_check(s, a)) {                                \
> +        uint32_t data = 0;                                         \
> +        static gen_helper_gvec_3_ptr * const fns[3] = {            \
> +            gen_helper_##HELPER##_b,                               \
> +            gen_helper_##HELPER##_h,                               \
> +            gen_helper_##HELPER##_w,                               \
> +        };                                                         \
> +        TCGLabel *over = gen_new_label();                          \
> +        gen_set_rm(s, FRM);                                        \
> +        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +                                                                   \
> +        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
> +        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> +                           vreg_ofs(s, a->rs2), cpu_env,           \
> +                           s->vlen / 8, s->vlen / 8, data,         \
> +                           fns[s->sew]);                           \
> +        mark_vs_dirty(s);                                          \
> +        gen_set_label(over);                                       \
> +        return true;                                               \
> +    }                                                              \
> +    return false;                                                  \
> +}
> +
> +GEN_OPXFV_NARROW_TRANS(vfncvt_xu_f_w, vfncvt_xu_f_w, RISCV_FRM_DYN)
> +GEN_OPXFV_NARROW_TRANS(vfncvt_x_f_w, vfncvt_x_f_w, RISCV_FRM_DYN)
> +/* Reuse the helper functions from vfncvt.xu.f.w and vfncvt.x.f.w */
> +GEN_OPXFV_NARROW_TRANS(vfncvt_rtz_xu_f_w, vfncvt_xu_f_w, RISCV_FRM_RTZ)
> +GEN_OPXFV_NARROW_TRANS(vfncvt_rtz_x_f_w, vfncvt_x_f_w, RISCV_FRM_RTZ)
>
>  /*
>   *** Vector Reduction Operations
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index dda8e2ab5a2..37b2451bd05 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -3820,31 +3820,36 @@ GEN_VEXT_V_ENV(vfwcvt_f_f_v_w, 4, 8)
>
>  /* Narrowing Floating-Point/Integer Type-Convert Instructions */
>  /* (TD, T2, TX2) */
> +#define NOP_UU_B uint8_t,  uint16_t, uint32_t
>  #define NOP_UU_H uint16_t, uint32_t, uint32_t
>  #define NOP_UU_W uint32_t, uint64_t, uint64_t
>  /* vfncvt.xu.f.v vd, vs2, vm # Convert float to unsigned integer. */
> -RVVCALL(OPFVV1, vfncvt_xu_f_v_h, NOP_UU_H, H2, H4, float32_to_uint16)
> -RVVCALL(OPFVV1, vfncvt_xu_f_v_w, NOP_UU_W, H4, H8, float64_to_uint32)
> -GEN_VEXT_V_ENV(vfncvt_xu_f_v_h, 2, 2)
> -GEN_VEXT_V_ENV(vfncvt_xu_f_v_w, 4, 4)
> +RVVCALL(OPFVV1, vfncvt_xu_f_w_b, NOP_UU_B, H1, H2, float16_to_uint8)
> +RVVCALL(OPFVV1, vfncvt_xu_f_w_h, NOP_UU_H, H2, H4, float32_to_uint16)
> +RVVCALL(OPFVV1, vfncvt_xu_f_w_w, NOP_UU_W, H4, H8, float64_to_uint32)
> +GEN_VEXT_V_ENV(vfncvt_xu_f_w_b, 1, 1)
> +GEN_VEXT_V_ENV(vfncvt_xu_f_w_h, 2, 2)
> +GEN_VEXT_V_ENV(vfncvt_xu_f_w_w, 4, 4)
>
>  /* vfncvt.x.f.v vd, vs2, vm # Convert double-width float to signed integer. */
> -RVVCALL(OPFVV1, vfncvt_x_f_v_h, NOP_UU_H, H2, H4, float32_to_int16)
> -RVVCALL(OPFVV1, vfncvt_x_f_v_w, NOP_UU_W, H4, H8, float64_to_int32)
> -GEN_VEXT_V_ENV(vfncvt_x_f_v_h, 2, 2)
> -GEN_VEXT_V_ENV(vfncvt_x_f_v_w, 4, 4)
> +RVVCALL(OPFVV1, vfncvt_x_f_w_b, NOP_UU_B, H1, H2, float16_to_int8)
> +RVVCALL(OPFVV1, vfncvt_x_f_w_h, NOP_UU_H, H2, H4, float32_to_int16)
> +RVVCALL(OPFVV1, vfncvt_x_f_w_w, NOP_UU_W, H4, H8, float64_to_int32)
> +GEN_VEXT_V_ENV(vfncvt_x_f_w_b, 1, 1)
> +GEN_VEXT_V_ENV(vfncvt_x_f_w_h, 2, 2)
> +GEN_VEXT_V_ENV(vfncvt_x_f_w_w, 4, 4)
>
>  /* vfncvt.f.xu.v vd, vs2, vm # Convert double-width unsigned integer to float */
> -RVVCALL(OPFVV1, vfncvt_f_xu_v_h, NOP_UU_H, H2, H4, uint32_to_float16)
> -RVVCALL(OPFVV1, vfncvt_f_xu_v_w, NOP_UU_W, H4, H8, uint64_to_float32)
> -GEN_VEXT_V_ENV(vfncvt_f_xu_v_h, 2, 2)
> -GEN_VEXT_V_ENV(vfncvt_f_xu_v_w, 4, 4)
> +RVVCALL(OPFVV1, vfncvt_f_xu_w_h, NOP_UU_H, H2, H4, uint32_to_float16)
> +RVVCALL(OPFVV1, vfncvt_f_xu_w_w, NOP_UU_W, H4, H8, uint64_to_float32)
> +GEN_VEXT_V_ENV(vfncvt_f_xu_w_h, 2, 2)
> +GEN_VEXT_V_ENV(vfncvt_f_xu_w_w, 4, 4)
>
>  /* vfncvt.f.x.v vd, vs2, vm # Convert double-width integer to float. */
> -RVVCALL(OPFVV1, vfncvt_f_x_v_h, NOP_UU_H, H2, H4, int32_to_float16)
> -RVVCALL(OPFVV1, vfncvt_f_x_v_w, NOP_UU_W, H4, H8, int64_to_float32)
> -GEN_VEXT_V_ENV(vfncvt_f_x_v_h, 2, 2)
> -GEN_VEXT_V_ENV(vfncvt_f_x_v_w, 4, 4)
> +RVVCALL(OPFVV1, vfncvt_f_x_w_h, NOP_UU_H, H2, H4, int32_to_float16)
> +RVVCALL(OPFVV1, vfncvt_f_x_w_w, NOP_UU_W, H4, H8, int64_to_float32)
> +GEN_VEXT_V_ENV(vfncvt_f_x_w_h, 2, 2)
> +GEN_VEXT_V_ENV(vfncvt_f_x_w_w, 4, 4)
>
>  /* vfncvt.f.f.v vd, vs2, vm # Convert double float to single-width float. */
>  static uint16_t vfncvtffv16(uint32_t a, float_status *s)
> @@ -3852,10 +3857,10 @@ static uint16_t vfncvtffv16(uint32_t a, float_status *s)
>      return float32_to_float16(a, true, s);
>  }
>
> -RVVCALL(OPFVV1, vfncvt_f_f_v_h, NOP_UU_H, H2, H4, vfncvtffv16)
> -RVVCALL(OPFVV1, vfncvt_f_f_v_w, NOP_UU_W, H4, H8, float64_to_float32)
> -GEN_VEXT_V_ENV(vfncvt_f_f_v_h, 2, 2)
> -GEN_VEXT_V_ENV(vfncvt_f_f_v_w, 4, 4)
> +RVVCALL(OPFVV1, vfncvt_f_f_w_h, NOP_UU_H, H2, H4, vfncvtffv16)
> +RVVCALL(OPFVV1, vfncvt_f_f_w_w, NOP_UU_W, H4, H8, float64_to_float32)
> +GEN_VEXT_V_ENV(vfncvt_f_f_w_h, 2, 2)
> +GEN_VEXT_V_ENV(vfncvt_f_f_w_w, 4, 4)
>
>  /*
>   *** Vector Reduction Operations
> --
> 2.25.1
>
>

