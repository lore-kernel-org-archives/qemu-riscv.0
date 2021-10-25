Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1metIP-0000Xh-3F
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 02:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1metIM-0000TN-5q; Mon, 25 Oct 2021 02:17:18 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:39868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1metIK-0005jL-9o; Mon, 25 Oct 2021 02:17:17 -0400
Received: by mail-il1-x12b.google.com with SMTP id j3so11642259ilr.6;
 Sun, 24 Oct 2021 23:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V2skusRr9+EK8bme4ViOkVXYkqTrmJRNsZ4waQCivHc=;
 b=mMB5A4sEeBfrq5wfHLnodx3o6mfcN5mti1tH5fN8xewiObn5uDqnuLDujwnN1aM25Y
 xISQddaAxr204Fampf9kc/lPbB5Os5vEw4HHFq09/GcmPHYsGvmkAGZx/hvZEo6r+RXK
 qibAvU/VBwi35i+lcqAzstnD2TSelKiuIV3ils02YEo9xtu2/OZ6z2YAhOeJ95s/DTtA
 IgbYLTqlolCWccw/ciSdjc2h1EnP35f3iIQ7i01tG7bxfEvFXIkn4HvvRWFpxmdRDInO
 374Go+gj0XIK/5wWjBk2lVTnIF1J10aL3Nooonabb1CipRm5zTPJtXJeuvRhOQqY//kV
 SSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V2skusRr9+EK8bme4ViOkVXYkqTrmJRNsZ4waQCivHc=;
 b=wzoh2U95onxj568LTpVtjdQ5Z04tvpyDhxRoRZah3kBULPSzOSLoIOSRdAqekRzdBC
 Mz91GZ6H/tk7Ic+crMJMXd4k9jG0jEk95J5N4Julz/Ac24oWS1p2I6KQw6tzCcWHINpR
 hSr9AOW5dEPVItfNLtcObNtTFDQAIE3f8QjCIxYATdIzIzJVec04BVy6odARpCoJU4rw
 FvG21a6z4Msztq1CfrDrXT2ibltsL0VrWRnw/44p/R+KzDr1XS0aI+YaVsg75wo86xa2
 jdXc/xLzqO32Yjwab1HpgDP6La5ptDl6sIYZOzbQFrmAdDW7N0GLNzBPlS4y+DZTunuP
 f+Dg==
X-Gm-Message-State: AOAM530zm7wFl2h3D40u9KHAMNq5NBneoFz6ep+WKFsEt1xfSu729TlV
 mojmRD+4ycaN7fe50nGi4AR8HkmHbVJAZu6EsY4=
X-Google-Smtp-Source: ABdhPJwVaUnuzOL8hSSeYiwLHqJ2cLUXqnJg2IqQHkom3VBYTc6WMfbtpglOdY41BIDtZIDla31/MhBtfawOsfRDHZA=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr8796672ilo.208.1635142634960; 
 Sun, 24 Oct 2021 23:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-69-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-69-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Oct 2021 16:16:48 +1000
Message-ID: <CAKmqyKP1xkzuYkcNkENi3KUGS6-U71Ryfo0jNxVFN4paVYXb4w@mail.gmail.com>
Subject: Re: [PATCH v8 61/78] target/riscv: rvv-1.0: floating-point/integer
 type-convert instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 06:17:18 -0000

On Fri, Oct 15, 2021 at 6:43 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Add the following instructions:
>
> * vfcvt.rtz.xu.f.v
> * vfcvt.rtz.x.f.v
>
> Also adjust GEN_OPFV_TRANS() to accept multiple floating-point rounding
> modes.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              | 11 ++--
>  target/riscv/insn_trans/trans_rvv.c.inc | 84 +++++++++++++++----------
>  2 files changed, 59 insertions(+), 36 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 20b3095f56c..02064f8ec98 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -585,10 +585,13 @@ vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
>  vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
>  vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
>  vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
> -vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
> -vfcvt_x_f_v     100010 . ..... 00001 001 ..... 1010111 @r2_vm
> -vfcvt_f_xu_v    100010 . ..... 00010 001 ..... 1010111 @r2_vm
> -vfcvt_f_x_v     100010 . ..... 00011 001 ..... 1010111 @r2_vm
> +
> +vfcvt_xu_f_v       010010 . ..... 00000 001 ..... 1010111 @r2_vm
> +vfcvt_x_f_v        010010 . ..... 00001 001 ..... 1010111 @r2_vm
> +vfcvt_f_xu_v       010010 . ..... 00010 001 ..... 1010111 @r2_vm
> +vfcvt_f_x_v        010010 . ..... 00011 001 ..... 1010111 @r2_vm
> +vfcvt_rtz_xu_f_v   010010 . ..... 00110 001 ..... 1010111 @r2_vm
> +vfcvt_rtz_x_f_v    010010 . ..... 00111 001 ..... 1010111 @r2_vm
>  vfwcvt_xu_f_v   100010 . ..... 01000 001 ..... 1010111 @r2_vm
>  vfwcvt_x_f_v    100010 . ..... 01001 001 ..... 1010111 @r2_vm
>  vfwcvt_f_xu_v   100010 . ..... 01010 001 ..... 1010111 @r2_vm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 676336a5200..b1ea15517c0 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1,5 +1,4 @@
>  /*
> - * RISC-V translation routines for the RVV Standard Extension.
>   *
>   * Copyright (c) 2020 T-Head Semiconductor Co., Ltd. All rights reserved.
>   *
> @@ -2368,34 +2367,41 @@ static bool opfv_check(DisasContext *s, arg_rmr *a)
>             vext_check_ss(s, a->rd, a->rs2, a->vm);
>  }
>
> -#define GEN_OPFV_TRANS(NAME, CHECK)                                \
> -static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
> -{                                                                  \
> -    if (CHECK(s, a)) {                                             \
> -        uint32_t data = 0;                                         \
> -        static gen_helper_gvec_3_ptr * const fns[3] = {            \
> -            gen_helper_##NAME##_h,                                 \
> -            gen_helper_##NAME##_w,                                 \
> -            gen_helper_##NAME##_d,                                 \
> -        };                                                         \
> -        TCGLabel *over = gen_new_label();                          \
> -        gen_set_rm(s, RISCV_FRM_DYN);                              \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> -                                                                   \
> -        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
> -        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> -        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> -                           vreg_ofs(s, a->rs2), cpu_env,           \
> -                           s->vlen / 8, s->vlen / 8, data,         \
> -                           fns[s->sew - 1]);                       \
> -        mark_vs_dirty(s);                                          \
> -        gen_set_label(over);                                       \
> -        return true;                                               \
> -    }                                                              \
> -    return false;                                                  \
> +static bool do_opfv(DisasContext *s, arg_rmr *a,
> +                    gen_helper_gvec_3_ptr *fn,
> +                    bool (*checkfn)(DisasContext *, arg_rmr *),
> +                    int rm)
> +{
> +    if (checkfn(s, a)) {
> +        uint32_t data = 0;
> +        TCGLabel *over = gen_new_label();
> +        gen_set_rm(s, rm);
> +        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +
> +        data = FIELD_DP32(data, VDATA, VM, a->vm);
> +        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +        tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
> +                           vreg_ofs(s, a->rs2), cpu_env,
> +                           s->vlen / 8, s->vlen / 8, data, fn);
> +        mark_vs_dirty(s);
> +        gen_set_label(over);
> +        return true;
> +    }
> +    return false;
> +}
> +
> +#define GEN_OPFV_TRANS(NAME, CHECK, FRM)               \
> +static bool trans_##NAME(DisasContext *s, arg_rmr *a)  \
> +{                                                      \
> +    static gen_helper_gvec_3_ptr * const fns[3] = {    \
> +        gen_helper_##NAME##_h,                         \
> +        gen_helper_##NAME##_w,                         \
> +        gen_helper_##NAME##_d                          \
> +    };                                                 \
> +    return do_opfv(s, a, fns[s->sew - 1], CHECK, FRM); \
>  }
>
> -GEN_OPFV_TRANS(vfsqrt_v, opfv_check)
> +GEN_OPFV_TRANS(vfsqrt_v, opfv_check, RISCV_FRM_DYN)
>
>  /* Vector Floating-Point MIN/MAX Instructions */
>  GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
> @@ -2441,7 +2447,7 @@ GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
>  GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
>
>  /* Vector Floating-Point Classify Instruction */
> -GEN_OPFV_TRANS(vfclass_v, opfv_check)
> +GEN_OPFV_TRANS(vfclass_v, opfv_check, RISCV_FRM_DYN)
>
>  /* Vector Floating-Point Merge Instruction */
>  GEN_OPFVF_TRANS(vfmerge_vfm,  opfvf_check)
> @@ -2495,10 +2501,24 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>  }
>
>  /* Single-Width Floating-Point/Integer Type-Convert Instructions */
> -GEN_OPFV_TRANS(vfcvt_xu_f_v, opfv_check)
> -GEN_OPFV_TRANS(vfcvt_x_f_v, opfv_check)
> -GEN_OPFV_TRANS(vfcvt_f_xu_v, opfv_check)
> -GEN_OPFV_TRANS(vfcvt_f_x_v, opfv_check)
> +#define GEN_OPFV_CVT_TRANS(NAME, HELPER, FRM)               \
> +static bool trans_##NAME(DisasContext *s, arg_rmr *a)       \
> +{                                                           \
> +    static gen_helper_gvec_3_ptr * const fns[3] = {         \
> +        gen_helper_##HELPER##_h,                            \
> +        gen_helper_##HELPER##_w,                            \
> +        gen_helper_##HELPER##_d                             \
> +    };                                                      \
> +    return do_opfv(s, a, fns[s->sew - 1], opfv_check, FRM); \
> +}
> +
> +GEN_OPFV_CVT_TRANS(vfcvt_xu_f_v, vfcvt_xu_f_v, RISCV_FRM_DYN)
> +GEN_OPFV_CVT_TRANS(vfcvt_x_f_v, vfcvt_x_f_v, RISCV_FRM_DYN)
> +GEN_OPFV_CVT_TRANS(vfcvt_f_xu_v, vfcvt_f_xu_v, RISCV_FRM_DYN)
> +GEN_OPFV_CVT_TRANS(vfcvt_f_x_v, vfcvt_f_x_v, RISCV_FRM_DYN)
> +/* Reuse the helper functions from vfcvt.xu.f.v and vfcvt.x.f.v */
> +GEN_OPFV_CVT_TRANS(vfcvt_rtz_xu_f_v, vfcvt_xu_f_v, RISCV_FRM_RTZ)
> +GEN_OPFV_CVT_TRANS(vfcvt_rtz_x_f_v, vfcvt_x_f_v, RISCV_FRM_RTZ)
>
>  /* Widening Floating-Point/Integer Type-Convert Instructions */
>
> --
> 2.25.1
>
>

