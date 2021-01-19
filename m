Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1wAC-0006Yz-OE
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 13:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wA9-0006VZ-5a; Tue, 19 Jan 2021 13:55:33 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:46381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wA6-0004CS-8Z; Tue, 19 Jan 2021 13:55:32 -0500
Received: by mail-io1-xd2b.google.com with SMTP id q2so40139733iow.13;
 Tue, 19 Jan 2021 10:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yqbpPM71MdQ5rPSkjRoHE/udiNEEvBzE64N5yH3skrQ=;
 b=oJPMvgGTB2P+YcrmHJQy1OcAiUuysJaBLzIGJFo+e4A2nq5plHsWI8JvkNzCMi3WjC
 ef6zJOD6x+AgabrVKExioWNivlWYS2zyOFCVRYcJM2rfAr868GhPmt6JP1y0xUFDBBpf
 rhOgWf2pRvi9SAcVMJtlVxORZmYmM0Ha/ZN/RvSiupXxljSnheHr5STVXb2Z+u95dNbx
 8GQNhOlDp3oOzyT014Sr7W6Xy6JAq/7vDVJXMwoif5z0LrW7TnNEHYeoIf1qFU00eWdG
 fKQQcbfAmVWhpH95KhgkRSMxvVJPvf2cn/Wt/9bbDUl+IZh7VGX8HyRLyUQJy+2drIRj
 5qcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yqbpPM71MdQ5rPSkjRoHE/udiNEEvBzE64N5yH3skrQ=;
 b=bVSgLjhAMvNjmj086PBAvXAqok+ZrNu3CEbvAmOZjs8XUAr5rrZs/tcsSL+r/nYc+q
 EU/q45hImHZ+CKMi9prc2jbOHaitV59QRKbpxLZIjEYv9UUa9ZyNyVfb8Z7d+wvKVavk
 hgkP1bnx/5ngh+I+RcXyQYfCbPoCvEwlEdNmaJU+oX0eaxPVnatHQCRRynrTpVhKKayE
 eYCVMspf1GSUuOgwuxJaEQqVm+X/km9GMRaCfwu1axYfXOib31t7b3qtwIlxSHj+gZsc
 WCK3ueaT8OwmlURJmgHGu1JnFfU8Iwv3GuPgcyAwLkLtpTEjzMBWsfXKnH1uvQJTRpND
 u0HA==
X-Gm-Message-State: AOAM5330UvJRFItIDM+HktiCAoM/vrsRiPH863p9ihZ6HUrnUiJnYVgJ
 upfkMvDnShEeF9M9emgqUssrWaMtC8nkw1gcdTc=
X-Google-Smtp-Source: ABdhPJzIV9guhM1nnbZappqwzHa4QzzSW/DIbU5TC37kCnWeeHGflpMGUkBwE3X2vzJH6OB3e5GTAozSylKo3E77zeg=
X-Received: by 2002:a5d:8909:: with SMTP id b9mr4017207ion.175.1611082528731; 
 Tue, 19 Jan 2021 10:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-16-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-16-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 10:55:02 -0800
Message-ID: <CAKmqyKNjk-GPz_G8RJw3Gj+mjU+AFbDv5=Y7+MUJ5S=-7OVNKw@mail.gmail.com>
Subject: Re: [PATCH v6 15/72] target/riscv: introduce more imm value modes in
 translator functions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 18:55:33 -0000

On Tue, Jan 12, 2021 at 1:50 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Immediate value in translator function is extended not only
> zero-extended and sign-extended but with more modes to be applicable
> with multiple formats of vector instructions.
>
> * IMM_ZX:         Zero-extended
> * IMM_SX:         Sign-extended
> * IMM_TRUNC_SEW:  Truncate to log(SEW) bit
> * IMM_TRUNC_2SEW: Truncate to log(2*SEW) bit
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 115 ++++++++++++++----------
>  1 file changed, 66 insertions(+), 49 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 5967ba42b6d..18a1c409fcf 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1307,8 +1307,32 @@ static void tcg_gen_gvec_rsubs(unsigned vece, uint32_t dofs, uint32_t aofs,
>
>  GEN_OPIVX_GVEC_TRANS(vrsub_vx, rsubs)
>
> +typedef enum {
> +    IMM_ZX,         /* Zero-extended */
> +    IMM_SX,         /* Sign-extended */
> +    IMM_TRUNC_SEW,  /* Truncate to log(SEW) bits */
> +    IMM_TRUNC_2SEW, /* Truncate to log(2*SEW) bits */
> +} imm_mode_t;
> +
> +static int64_t extract_imm(DisasContext *s, uint32_t imm, imm_mode_t imm_mode)
> +{
> +    switch (imm_mode) {
> +    case IMM_ZX:
> +        return extract64(imm, 0, 5);
> +    case IMM_SX:
> +        return sextract64(imm, 0, 5);
> +    case IMM_TRUNC_SEW:
> +        return extract64(imm, 0, s->sew + 3);
> +    case IMM_TRUNC_2SEW:
> +        return extract64(imm, 0, s->sew + 4);
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
> -                        gen_helper_opivx *fn, DisasContext *s, int zx)
> +                        gen_helper_opivx *fn, DisasContext *s,
> +                        imm_mode_t imm_mode)
>  {
>      TCGv_ptr dest, src2, mask;
>      TCGv src1;
> @@ -1321,11 +1345,8 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
>      dest = tcg_temp_new_ptr();
>      mask = tcg_temp_new_ptr();
>      src2 = tcg_temp_new_ptr();
> -    if (zx) {
> -        src1 = tcg_const_tl(imm);
> -    } else {
> -        src1 = tcg_const_tl(sextract64(imm, 0, 5));
> -    }
> +    src1 = tcg_const_tl(extract_imm(s, imm, imm_mode));
> +
>      data = FIELD_DP32(data, VDATA, VM, vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> @@ -1351,28 +1372,23 @@ typedef void GVecGen2iFn(unsigned, uint32_t, uint32_t, int64_t,
>
>  static inline bool
>  do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecGen2iFn *gvec_fn,
> -              gen_helper_opivx *fn, int zx)
> +              gen_helper_opivx *fn, imm_mode_t imm_mode)
>  {
>      if (!opivx_check(s, a)) {
>          return false;
>      }
>
>      if (a->vm && s->vl_eq_vlmax) {
> -        if (zx) {
> -            gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
> -                    extract64(a->rs1, 0, 5), MAXSZ(s), MAXSZ(s));
> -        } else {
> -            gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
> -                    sextract64(a->rs1, 0, 5), MAXSZ(s), MAXSZ(s));
> -        }
> +        gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
> +                extract_imm(s, a->rs1, imm_mode), MAXSZ(s), MAXSZ(s));
>          mark_vs_dirty(s);
>          return true;
>      }
> -    return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, zx);
> +    return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, imm_mode);
>  }
>
>  /* OPIVI with GVEC IR */
> -#define GEN_OPIVI_GVEC_TRANS(NAME, ZX, OPIVX, SUF) \
> +#define GEN_OPIVI_GVEC_TRANS(NAME, IMM_MODE, OPIVX, SUF) \
>  static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>  {                                                                  \
>      static gen_helper_opivx * const fns[4] = {                     \
> @@ -1380,10 +1396,10 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>          gen_helper_##OPIVX##_w, gen_helper_##OPIVX##_d,            \
>      };                                                             \
>      return do_opivi_gvec(s, a, tcg_gen_gvec_##SUF,                 \
> -                         fns[s->sew], ZX);                         \
> +                         fns[s->sew], IMM_MODE);                   \
>  }
>
> -GEN_OPIVI_GVEC_TRANS(vadd_vi, 0, vadd_vx, addi)
> +GEN_OPIVI_GVEC_TRANS(vadd_vi, IMM_SX, vadd_vx, addi)
>
>  static void tcg_gen_gvec_rsubi(unsigned vece, uint32_t dofs, uint32_t aofs,
>                                 int64_t c, uint32_t oprsz, uint32_t maxsz)
> @@ -1393,7 +1409,7 @@ static void tcg_gen_gvec_rsubi(unsigned vece, uint32_t dofs, uint32_t aofs,
>      tcg_temp_free_i64(tmp);
>  }
>
> -GEN_OPIVI_GVEC_TRANS(vrsub_vi, 0, vrsub_vx, rsubi)
> +GEN_OPIVI_GVEC_TRANS(vrsub_vi, IMM_SX, vrsub_vx, rsubi)
>
>  /* Vector Widening Integer Add/Subtract */
>
> @@ -1648,7 +1664,7 @@ GEN_OPIVX_TRANS(vmadc_vxm, opivx_vmadc_check)
>  GEN_OPIVX_TRANS(vmsbc_vxm, opivx_vmadc_check)
>
>  /* OPIVI without GVEC IR */
> -#define GEN_OPIVI_TRANS(NAME, ZX, OPIVX, CHECK)                          \
> +#define GEN_OPIVI_TRANS(NAME, IMM_MODE, OPIVX, CHECK)                    \
>  static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
>  {                                                                        \
>      if (CHECK(s, a)) {                                                   \
> @@ -1657,13 +1673,13 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
>              gen_helper_##OPIVX##_w, gen_helper_##OPIVX##_d,              \
>          };                                                               \
>          return opivi_trans(a->rd, a->rs1, a->rs2, a->vm,                 \
> -                           fns[s->sew], s, ZX);                          \
> +                           fns[s->sew], s, IMM_MODE);                    \
>      }                                                                    \
>      return false;                                                        \
>  }
>
> -GEN_OPIVI_TRANS(vadc_vim, 0, vadc_vxm, opivx_vadc_check)
> -GEN_OPIVI_TRANS(vmadc_vim, 0, vmadc_vxm, opivx_vmadc_check)
> +GEN_OPIVI_TRANS(vadc_vim, IMM_SX, vadc_vxm, opivx_vadc_check)
> +GEN_OPIVI_TRANS(vmadc_vim, IMM_SX, vmadc_vxm, opivx_vmadc_check)
>
>  /* Vector Bitwise Logical Instructions */
>  GEN_OPIVV_GVEC_TRANS(vand_vv, and)
> @@ -1672,9 +1688,9 @@ GEN_OPIVV_GVEC_TRANS(vxor_vv, xor)
>  GEN_OPIVX_GVEC_TRANS(vand_vx, ands)
>  GEN_OPIVX_GVEC_TRANS(vor_vx,  ors)
>  GEN_OPIVX_GVEC_TRANS(vxor_vx, xors)
> -GEN_OPIVI_GVEC_TRANS(vand_vi, 0, vand_vx, andi)
> -GEN_OPIVI_GVEC_TRANS(vor_vi, 0, vor_vx,  ori)
> -GEN_OPIVI_GVEC_TRANS(vxor_vi, 0, vxor_vx, xori)
> +GEN_OPIVI_GVEC_TRANS(vand_vi, IMM_SX, vand_vx, andi)
> +GEN_OPIVI_GVEC_TRANS(vor_vi, IMM_SX, vor_vx,  ori)
> +GEN_OPIVI_GVEC_TRANS(vxor_vi, IMM_SX, vxor_vx, xori)
>
>  /* Vector Single-Width Bit Shift Instructions */
>  GEN_OPIVV_GVEC_TRANS(vsll_vv,  shlv)
> @@ -1725,9 +1741,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
>  GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
>  GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
>
> -GEN_OPIVI_GVEC_TRANS(vsll_vi, 1, vsll_vx,  shli)
> -GEN_OPIVI_GVEC_TRANS(vsrl_vi, 1, vsrl_vx,  shri)
> -GEN_OPIVI_GVEC_TRANS(vsra_vi, 1, vsra_vx,  sari)
> +GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_ZX, vsll_vx, shli)
> +GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_ZX, vsrl_vx, shri)
> +GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_ZX, vsra_vx, sari)
>
>  /* Vector Narrowing Integer Right Shift Instructions */
>  static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
> @@ -1792,7 +1808,7 @@ GEN_OPIVX_NARROW_TRANS(vnsra_vx)
>  GEN_OPIVX_NARROW_TRANS(vnsrl_vx)
>
>  /* OPIVI with NARROW */
> -#define GEN_OPIVI_NARROW_TRANS(NAME, ZX, OPIVX)                          \
> +#define GEN_OPIVI_NARROW_TRANS(NAME, IMM_MODE, OPIVX)                    \
>  static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
>  {                                                                        \
>      if (opivx_narrow_check(s, a)) {                                      \
> @@ -1802,13 +1818,13 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
>              gen_helper_##OPIVX##_w,                                      \
>          };                                                               \
>          return opivi_trans(a->rd, a->rs1, a->rs2, a->vm,                 \
> -                           fns[s->sew], s, ZX);                          \
> +                           fns[s->sew], s, IMM_MODE);                    \
>      }                                                                    \
>      return false;                                                        \
>  }
>
> -GEN_OPIVI_NARROW_TRANS(vnsra_vi, 1, vnsra_vx)
> -GEN_OPIVI_NARROW_TRANS(vnsrl_vi, 1, vnsrl_vx)
> +GEN_OPIVI_NARROW_TRANS(vnsra_vi, IMM_ZX, vnsra_vx)
> +GEN_OPIVI_NARROW_TRANS(vnsrl_vi, IMM_ZX, vnsrl_vx)
>
>  /* Vector Integer Comparison Instructions */
>  /*
> @@ -1846,12 +1862,12 @@ GEN_OPIVX_TRANS(vmsle_vx, opivx_cmp_check)
>  GEN_OPIVX_TRANS(vmsgtu_vx, opivx_cmp_check)
>  GEN_OPIVX_TRANS(vmsgt_vx, opivx_cmp_check)
>
> -GEN_OPIVI_TRANS(vmseq_vi, 0, vmseq_vx, opivx_cmp_check)
> -GEN_OPIVI_TRANS(vmsne_vi, 0, vmsne_vx, opivx_cmp_check)
> -GEN_OPIVI_TRANS(vmsleu_vi, 1, vmsleu_vx, opivx_cmp_check)
> -GEN_OPIVI_TRANS(vmsle_vi, 0, vmsle_vx, opivx_cmp_check)
> -GEN_OPIVI_TRANS(vmsgtu_vi, 1, vmsgtu_vx, opivx_cmp_check)
> -GEN_OPIVI_TRANS(vmsgt_vi, 0, vmsgt_vx, opivx_cmp_check)
> +GEN_OPIVI_TRANS(vmseq_vi, IMM_SX, vmseq_vx, opivx_cmp_check)
> +GEN_OPIVI_TRANS(vmsne_vi, IMM_SX, vmsne_vx, opivx_cmp_check)
> +GEN_OPIVI_TRANS(vmsleu_vi, IMM_ZX, vmsleu_vx, opivx_cmp_check)
> +GEN_OPIVI_TRANS(vmsle_vi, IMM_SX, vmsle_vx, opivx_cmp_check)
> +GEN_OPIVI_TRANS(vmsgtu_vi, IMM_ZX, vmsgtu_vx, opivx_cmp_check)
> +GEN_OPIVI_TRANS(vmsgt_vi, IMM_SX, vmsgt_vx, opivx_cmp_check)
>
>  /* Vector Integer Min/Max Instructions */
>  GEN_OPIVV_GVEC_TRANS(vminu_vv, umin)
> @@ -2027,7 +2043,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
>
>  GEN_OPIVV_TRANS(vmerge_vvm, opivv_vadc_check)
>  GEN_OPIVX_TRANS(vmerge_vxm, opivx_vadc_check)
> -GEN_OPIVI_TRANS(vmerge_vim, 0, vmerge_vxm, opivx_vadc_check)
> +GEN_OPIVI_TRANS(vmerge_vim, IMM_SX, vmerge_vxm, opivx_vadc_check)
>
>  /*
>   *** Vector Fixed-Point Arithmetic Instructions
> @@ -2042,8 +2058,8 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
>  GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
>  GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
>  GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
> -GEN_OPIVI_TRANS(vsaddu_vi, 1, vsaddu_vx, opivx_check)
> -GEN_OPIVI_TRANS(vsadd_vi, 0, vsadd_vx, opivx_check)
> +GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
> +GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
>
>  /* Vector Single-Width Averaging Add and Subtract */
>  GEN_OPIVV_TRANS(vaadd_vv, opivv_check)
> @@ -2070,16 +2086,16 @@ GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
>  GEN_OPIVV_TRANS(vssra_vv, opivv_check)
>  GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
>  GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
> -GEN_OPIVI_TRANS(vssrl_vi, 1, vssrl_vx, opivx_check)
> -GEN_OPIVI_TRANS(vssra_vi, 0, vssra_vx, opivx_check)
> +GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
> +GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
>
>  /* Vector Narrowing Fixed-Point Clip Instructions */
>  GEN_OPIVV_NARROW_TRANS(vnclipu_vv)
>  GEN_OPIVV_NARROW_TRANS(vnclip_vv)
>  GEN_OPIVX_NARROW_TRANS(vnclipu_vx)
>  GEN_OPIVX_NARROW_TRANS(vnclip_vx)
> -GEN_OPIVI_NARROW_TRANS(vnclipu_vi, 1, vnclipu_vx)
> -GEN_OPIVI_NARROW_TRANS(vnclip_vi, 1, vnclip_vx)
> +GEN_OPIVI_NARROW_TRANS(vnclipu_vi, IMM_ZX, vnclipu_vx)
> +GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
>
>  /*
>   *** Vector Float Point Arithmetic Instructions
> @@ -3053,7 +3069,7 @@ static bool slideup_check(DisasContext *s, arg_rmrr *a)
>
>  GEN_OPIVX_TRANS(vslideup_vx, slideup_check)
>  GEN_OPIVX_TRANS(vslide1up_vx, slideup_check)
> -GEN_OPIVI_TRANS(vslideup_vi, 1, vslideup_vx, slideup_check)
> +GEN_OPIVI_TRANS(vslideup_vi, IMM_ZX, vslideup_vx, slideup_check)
>
>  static bool slidedown_check(DisasContext *s, arg_rmrr *a)
>  {
> @@ -3064,7 +3080,7 @@ static bool slidedown_check(DisasContext *s, arg_rmrr *a)
>
>  GEN_OPIVX_TRANS(vslidedown_vx, slidedown_check)
>  GEN_OPIVX_TRANS(vslide1down_vx, slidedown_check)
> -GEN_OPIVI_TRANS(vslidedown_vi, 1, vslidedown_vx, slidedown_check)
> +GEN_OPIVI_TRANS(vslidedown_vi, IMM_ZX, vslidedown_vx, slidedown_check)
>
>  /* Vector Register Gather Instruction */
>  static bool vrgather_vv_check(DisasContext *s, arg_rmrr *a)
> @@ -3143,7 +3159,8 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
>              gen_helper_vrgather_vx_b, gen_helper_vrgather_vx_h,
>              gen_helper_vrgather_vx_w, gen_helper_vrgather_vx_d
>          };
> -        return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew], s, 1);
> +        return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew],
> +                           s, IMM_ZX);
>      }
>      return true;
>  }
> --
> 2.17.1
>
>

