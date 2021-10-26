Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfFyD-0005UH-PD
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfFyB-0005T0-5t; Tue, 26 Oct 2021 02:29:59 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:39861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfFy8-00074G-QX; Tue, 26 Oct 2021 02:29:58 -0400
Received: by mail-io1-xd2e.google.com with SMTP id o184so18772110iof.6;
 Mon, 25 Oct 2021 23:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5J80M5YLkdFOL4w90gPoeTYbWajYajq9yF7AHQ96fRM=;
 b=WXIwNsOaKFz3S5znN/yow3dCKhYkJEdehJPZUCswXbmJM5fRhS1Xfn0EVtx/A8Hjbz
 LlppygFHhGiYz62U/QW5bfUQl32cuROad49XMxmgpCyKXX05VSIvyLuaAd7WbAEcPaGP
 y2iwJdSK6NuWVbfZGXkthn8ku4KAR7S0UHtNa0BHpMTfPVdnMMiaFu6YFGMxl+M9LQ14
 kZWtfrUWL5HNSPzR1iBFgC6JrS427c3ul+SCP/AgFSYZi+LGsai5G1scmKHbf1xP5u6n
 6Wd/MqD9BpLShW+UIDwfka5KWTpxbp2XL/uHKrgn42Gr3z4YDCHZzmo35CuSW45aIu92
 2j8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5J80M5YLkdFOL4w90gPoeTYbWajYajq9yF7AHQ96fRM=;
 b=LLIRxKf2YamRFxFehCi0TWA/J4G26iHGCV1UmmSs/9Uc+XQ5wmJyTOZae9CAPIi/B0
 f2OBm39qvmN8Cax2c6iQU2QWumVe6H1BCkuhwprdthexWQ7XGz1EPBZSWPhrDjmv8C9e
 WmhuX3gff4xdvLcpPkBw1KVmWHECjAIYOpxFBytqaeIUjN0krfM0iOz5B83Shd/ddNr7
 oArDjTjWCCJ+0zaXhd7VZMkKsMpGQBqW+086arGO81p79aHEy/DE9M+1A2/7ns9cbxLF
 NEnzWUz71RtlwgQ8kYL9PM+s3uHn/njs/7lkcafNW/1g74NiCFIUp7D3wjQJDG7xVbIs
 KGUA==
X-Gm-Message-State: AOAM531BmpjVsBMwc9V7vx2/Q6qS4PR6XDOIqKzM/dKILDddhyJwfHYO
 aWtw2VY7FV0OLqUF8TZR89KAekDroFcmomTbhns=
X-Google-Smtp-Source: ABdhPJzWf+0VdJXD2NMp0ZCh15Sxdb7GSq4BBd0FModBsyMBwtPynaetVGmyGmvCo9T7ySMT3umXcK00vN4Gvs5oNL0=
X-Received: by 2002:a6b:6e0e:: with SMTP id d14mr11212600ioh.57.1635229791537; 
 Mon, 25 Oct 2021 23:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-70-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-70-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Oct 2021 16:29:25 +1000
Message-ID: <CAKmqyKOL=3L38zmJMvP5g5OF2W3dRm3dKoR+_wTdC2FXwyc3kw@mail.gmail.com>
Subject: Re: [PATCH v8 62/78] target/riscv: rvv-1.0: widening
 floating-point/integer type-convert
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 26 Oct 2021 06:30:00 -0000

On Fri, Oct 15, 2021 at 6:47 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Add the following instructions:
>
> * vfwcvt.rtz.xu.f.v
> * vfwcvt.rtz.x.f.v
>
> Also adjust GEN_OPFV_WIDEN_TRANS() to accept multiple floating-point
> rounding modes.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  2 +
>  target/riscv/insn32.decode              | 13 +++---
>  target/riscv/insn_trans/trans_rvv.c.inc | 55 +++++++++++++++++++++----
>  target/riscv/vector_helper.c            |  7 +++-
>  4 files changed, 63 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 1727075dce4..53cf88cd402 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -928,8 +928,10 @@ DEF_HELPER_5(vfwcvt_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_x_f_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_x_f_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfwcvt_f_xu_v_b, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_xu_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_xu_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfwcvt_f_x_v_b, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vfwcvt_f_f_v_h, void, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 02064f8ec98..664d0fb3716 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -592,11 +592,14 @@ vfcvt_f_xu_v       010010 . ..... 00010 001 ..... 1010111 @r2_vm
>  vfcvt_f_x_v        010010 . ..... 00011 001 ..... 1010111 @r2_vm
>  vfcvt_rtz_xu_f_v   010010 . ..... 00110 001 ..... 1010111 @r2_vm
>  vfcvt_rtz_x_f_v    010010 . ..... 00111 001 ..... 1010111 @r2_vm
> -vfwcvt_xu_f_v   100010 . ..... 01000 001 ..... 1010111 @r2_vm
> -vfwcvt_x_f_v    100010 . ..... 01001 001 ..... 1010111 @r2_vm
> -vfwcvt_f_xu_v   100010 . ..... 01010 001 ..... 1010111 @r2_vm
> -vfwcvt_f_x_v    100010 . ..... 01011 001 ..... 1010111 @r2_vm
> -vfwcvt_f_f_v    100010 . ..... 01100 001 ..... 1010111 @r2_vm
> +
> +vfwcvt_xu_f_v      010010 . ..... 01000 001 ..... 1010111 @r2_vm
> +vfwcvt_x_f_v       010010 . ..... 01001 001 ..... 1010111 @r2_vm
> +vfwcvt_f_xu_v      010010 . ..... 01010 001 ..... 1010111 @r2_vm
> +vfwcvt_f_x_v       010010 . ..... 01011 001 ..... 1010111 @r2_vm
> +vfwcvt_f_f_v       010010 . ..... 01100 001 ..... 1010111 @r2_vm
> +vfwcvt_rtz_xu_f_v  010010 . ..... 01110 001 ..... 1010111 @r2_vm
> +vfwcvt_rtz_x_f_v   010010 . ..... 01111 001 ..... 1010111 @r2_vm
>  vfncvt_xu_f_v   100010 . ..... 10000 001 ..... 1010111 @r2_vm
>  vfncvt_x_f_v    100010 . ..... 10001 001 ..... 1010111 @r2_vm
>  vfncvt_f_xu_v   100010 . ..... 10010 001 ..... 1010111 @r2_vm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index b1ea15517c0..63d33b22068 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2535,12 +2535,55 @@ static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
>             vext_check_ds(s, a->rd, a->rs2, a->vm);
>  }
>
> -#define GEN_OPFV_WIDEN_TRANS(NAME)                                 \
> +#define GEN_OPFV_WIDEN_TRANS(NAME, HELPER, FRM)                    \
>  static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>  {                                                                  \
>      if (opfv_widen_check(s, a)) {                                  \
>          uint32_t data = 0;                                         \
>          static gen_helper_gvec_3_ptr * const fns[2] = {            \
> +            gen_helper_##HELPER##_h,                               \
> +            gen_helper_##HELPER##_w,                               \
> +        };                                                         \
> +        TCGLabel *over = gen_new_label();                          \
> +        gen_set_rm(s, FRM);                                        \
> +        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +                                                                   \
> +        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
> +        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> +        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> +                           vreg_ofs(s, a->rs2), cpu_env,           \
> +                           s->vlen / 8, s->vlen / 8, data,         \
> +                           fns[s->sew - 1]);                       \
> +        mark_vs_dirty(s);                                          \
> +        gen_set_label(over);                                       \
> +        return true;                                               \
> +    }                                                              \
> +    return false;                                                  \
> +}
> +
> +GEN_OPFV_WIDEN_TRANS(vfwcvt_xu_f_v, vfwcvt_xu_f_v, RISCV_FRM_DYN)
> +GEN_OPFV_WIDEN_TRANS(vfwcvt_x_f_v, vfwcvt_x_f_v, RISCV_FRM_DYN)
> +GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v, vfwcvt_f_f_v, RISCV_FRM_DYN)
> +/* Reuse the helper functions from vfwcvt.xu.f.v and vfwcvt.x.f.v */
> +GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_xu_f_v, vfwcvt_xu_f_v, RISCV_FRM_RTZ)
> +GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_x_f_v, vfwcvt_x_f_v, RISCV_FRM_RTZ)
> +
> +static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
> +{
> +    return require_rvv(s) &&
> +           require_scale_rvf(s) &&
> +           vext_check_isa_ill(s) &&
> +           /* OPFV widening instructions ignore vs1 check */
> +           vext_check_ds(s, a->rd, a->rs2, a->vm);
> +}
> +
> +#define GEN_OPFXV_WIDEN_TRANS(NAME)                                \
> +static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
> +{                                                                  \
> +    if (opfxv_widen_check(s, a)) {                                 \
> +        uint32_t data = 0;                                         \
> +        static gen_helper_gvec_3_ptr * const fns[3] = {            \
> +            gen_helper_##NAME##_b,                                 \
>              gen_helper_##NAME##_h,                                 \
>              gen_helper_##NAME##_w,                                 \
>          };                                                         \
> @@ -2549,11 +2592,10 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
>                                                                     \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
> -        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
>                             s->vlen / 8, s->vlen / 8, data,         \
> -                           fns[s->sew - 1]);                       \
> +                           fns[s->sew]);                           \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
>          return true;                                               \
> @@ -2561,11 +2603,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>      return false;                                                  \
>  }
>
> -GEN_OPFV_WIDEN_TRANS(vfwcvt_xu_f_v)
> -GEN_OPFV_WIDEN_TRANS(vfwcvt_x_f_v)
> -GEN_OPFV_WIDEN_TRANS(vfwcvt_f_xu_v)
> -GEN_OPFV_WIDEN_TRANS(vfwcvt_f_x_v)
> -GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v)
> +GEN_OPFXV_WIDEN_TRANS(vfwcvt_f_xu_v)
> +GEN_OPFXV_WIDEN_TRANS(vfwcvt_f_x_v)
>
>  /* Narrowing Floating-Point/Integer Type-Convert Instructions */
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index c19cd937e1a..dda8e2ab5a2 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -3773,6 +3773,7 @@ GEN_VEXT_V_ENV(vfcvt_f_x_v_d, 8, 8)
>
>  /* Widening Floating-Point/Integer Type-Convert Instructions */
>  /* (TD, T2, TX2) */
> +#define WOP_UU_B uint16_t, uint8_t,  uint8_t
>  #define WOP_UU_H uint32_t, uint16_t, uint16_t
>  #define WOP_UU_W uint64_t, uint32_t, uint32_t
>  /* vfwcvt.xu.f.v vd, vs2, vm # Convert float to double-width unsigned integer.*/
> @@ -3788,19 +3789,23 @@ GEN_VEXT_V_ENV(vfwcvt_x_f_v_h, 2, 4)
>  GEN_VEXT_V_ENV(vfwcvt_x_f_v_w, 4, 8)
>
>  /* vfwcvt.f.xu.v vd, vs2, vm # Convert unsigned integer to double-width float */
> +RVVCALL(OPFVV1, vfwcvt_f_xu_v_b, WOP_UU_B, H2, H1, uint8_to_float16)
>  RVVCALL(OPFVV1, vfwcvt_f_xu_v_h, WOP_UU_H, H4, H2, uint16_to_float32)
>  RVVCALL(OPFVV1, vfwcvt_f_xu_v_w, WOP_UU_W, H8, H4, uint32_to_float64)
> +GEN_VEXT_V_ENV(vfwcvt_f_xu_v_b, 1, 2)
>  GEN_VEXT_V_ENV(vfwcvt_f_xu_v_h, 2, 4)
>  GEN_VEXT_V_ENV(vfwcvt_f_xu_v_w, 4, 8)
>
>  /* vfwcvt.f.x.v vd, vs2, vm # Convert integer to double-width float. */
> +RVVCALL(OPFVV1, vfwcvt_f_x_v_b, WOP_UU_B, H2, H1, int8_to_float16)
>  RVVCALL(OPFVV1, vfwcvt_f_x_v_h, WOP_UU_H, H4, H2, int16_to_float32)
>  RVVCALL(OPFVV1, vfwcvt_f_x_v_w, WOP_UU_W, H8, H4, int32_to_float64)
> +GEN_VEXT_V_ENV(vfwcvt_f_x_v_b, 1, 2)
>  GEN_VEXT_V_ENV(vfwcvt_f_x_v_h, 2, 4)
>  GEN_VEXT_V_ENV(vfwcvt_f_x_v_w, 4, 8)
>
>  /*
> - * vfwcvt.f.f.v vd, vs2, vm #
> + * vfwcvt.f.f.v vd, vs2, vm
>   * Convert single-width float to double-width float.
>   */
>  static uint32_t vfwcvtffv16(uint16_t a, float_status *s)
> --
> 2.25.1
>
>

