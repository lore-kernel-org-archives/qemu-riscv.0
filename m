Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3tYT-0004pR-4K
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 01:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tYR-0004oX-A7; Thu, 15 Jul 2021 01:04:59 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:44565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m3tYP-000860-0y; Thu, 15 Jul 2021 01:04:58 -0400
Received: by mail-io1-xd31.google.com with SMTP id v26so4970285iom.11;
 Wed, 14 Jul 2021 22:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WjEwjy9/4bF0vf5xFNCOdMuujqZ94vxsKgGURNLNnKU=;
 b=eW7+L+3fshL0JETVQIlueWylmeJ86Bg48KeeBCeTw0UF5wJsMdjZfqKZRcfMkrDr2X
 wjQP0UMEWZw3XfbRwOt5U4rTYkMVcqPnS3c4kMxGuwFUhNg7ilkW43HyQeG4S69YXEGZ
 LDgOVMmAtqj1H4/97dM2jonxgo/VVLg/h7zf2q1/RdUVVAJy3jtpL5CHK5i/q1sVvRtu
 H5gu6tEuWrJspB3DqMaNM9k64NgmTpezjEB0gboj3U3Gwypi5nukpGXNMO3CFNduYrjI
 FdDOOI4ePExefL3ZdapM2q4XUEN2djmytr1DgQIcq4DXhZk04YV9VQ1iQM5rdj+7Ph/P
 GBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WjEwjy9/4bF0vf5xFNCOdMuujqZ94vxsKgGURNLNnKU=;
 b=Rd6/SwXzIJBFEtaFGab2rxsA7e95aTLrbu6HfXPLNlimLAdsmZ+8169S0gcsPVc9JX
 MhL7f2WmG7lwBWSv0lhsQicm37xpP5FJMvJ3fH6fIsQpdLsHflrlkrNjZWbYO/TGOk9I
 I7P0cjgjorvFAsIj2Ud7jLaItxnOYMqZWuYkoL9CfI6ILDfDRdgP3ws2WZFxvX5VN3Tx
 UuBs2aV0CqxSBNVJ+saNvsvpQcFqZBL1R1vPXzesXY5hp6q2/+0syrGZyek3CrfTrKd7
 k7uINK9mY4X0Blh7Q2MH+/NZvTlpyvPsF7egeYkP5ntLQS1369015n76E/U+dzvY5UBf
 ntyQ==
X-Gm-Message-State: AOAM532SZ6Cr4Gr3EHCjpuTTM+1tFeVwWk7pv4QMVhzDrUwuR4Ib/NlE
 nYHrkEkl9+A0T76IEh2OAmQuSCytU34Lbsg2Tss=
X-Google-Smtp-Source: ABdhPJwhTy6io/ChJdKMDw1+DpAbDNRIo4VbPKSSqu9rrqKZRbNiWMYUccAUALx1zkwA+fVBu9awHTp5lxP0Ayro3xU=
X-Received: by 2002:a6b:7905:: with SMTP id i5mr1675629iop.175.1626325495332; 
 Wed, 14 Jul 2021 22:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-17-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-17-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Jul 2021 15:04:28 +1000
Message-ID: <CAKmqyKP40vt2HeK_e8m1QqDsmiTpPzypyHjjGsGWRZ30OFBBCw@mail.gmail.com>
Subject: Re: [PATCH 16/17] target/riscv: Use gpr_{src,dst} for RVV
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Thu, 15 Jul 2021 05:04:59 -0000

On Fri, Jul 9, 2021 at 2:43 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 79 +++++++------------------
>  1 file changed, 20 insertions(+), 59 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index a8e7272487..84a45fac38 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -27,27 +27,21 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
>          return false;
>      }
>
> -    s2 = tcg_temp_new();
> -    dst = tcg_temp_new();
> +    s2 = gpr_src(ctx, a->rs2);
> +    dst = gpr_dst(ctx, a->rd);
>
>      /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
>      if (a->rs1 == 0) {
>          /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
>          s1 = tcg_constant_tl(RV_VLEN_MAX);
>      } else {
> -        s1 = tcg_temp_new();
> -        gen_get_gpr(s1, a->rs1);
> +        s1 = gpr_src(ctx, a->rs1);
>      }
> -    gen_get_gpr(s2, a->rs2);
>      gen_helper_vsetvl(dst, cpu_env, s1, s2);
> -    gen_set_gpr(a->rd, dst);
> +
>      tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
>      lookup_and_goto_ptr(ctx);
>      ctx->base.is_jmp = DISAS_NORETURN;
> -
> -    tcg_temp_free(s1);
> -    tcg_temp_free(s2);
> -    tcg_temp_free(dst);
>      return true;
>  }
>
> @@ -60,23 +54,19 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
>      }
>
>      s2 = tcg_constant_tl(a->zimm);
> -    dst = tcg_temp_new();
> +    dst = gpr_dst(ctx, a->rd);
>
>      /* Using x0 as the rs1 register specifier, encodes an infinite AVL */
>      if (a->rs1 == 0) {
>          /* As the mask is at least one bit, RV_VLEN_MAX is >= VLMAX */
>          s1 = tcg_constant_tl(RV_VLEN_MAX);
>      } else {
> -        s1 = tcg_temp_new();
> -        gen_get_gpr(s1, a->rs1);
> +        s1 = gpr_src(ctx, a->rs1);
>      }
>      gen_helper_vsetvl(dst, cpu_env, s1, s2);
> -    gen_set_gpr(a->rd, dst);
> +
>      gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
>      ctx->base.is_jmp = DISAS_NORETURN;
> -
> -    tcg_temp_free(s1);
> -    tcg_temp_free(dst);
>      return true;
>  }
>
> @@ -173,7 +163,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>
>      dest = tcg_temp_new_ptr();
>      mask = tcg_temp_new_ptr();
> -    base = tcg_temp_new();
> +    base = gpr_src(s, rs1);
>
>      /*
>       * As simd_desc supports at most 256 bytes, and in this implementation,
> @@ -184,7 +174,6 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>       */
>      desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
> -    gen_get_gpr(base, rs1);
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
>
> @@ -192,7 +181,6 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>
>      tcg_temp_free_ptr(dest);
>      tcg_temp_free_ptr(mask);
> -    tcg_temp_free(base);
>      gen_set_label(over);
>      return true;
>  }
> @@ -330,12 +318,10 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
>
>      dest = tcg_temp_new_ptr();
>      mask = tcg_temp_new_ptr();
> -    base = tcg_temp_new();
> -    stride = tcg_temp_new();
> +    base = gpr_src(s, rs1);
> +    stride = gpr_src(s, rs2);
>      desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
> -    gen_get_gpr(base, rs1);
> -    gen_get_gpr(stride, rs2);
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
>
> @@ -343,8 +329,6 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
>
>      tcg_temp_free_ptr(dest);
>      tcg_temp_free_ptr(mask);
> -    tcg_temp_free(base);
> -    tcg_temp_free(stride);
>      gen_set_label(over);
>      return true;
>  }
> @@ -458,10 +442,9 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>      dest = tcg_temp_new_ptr();
>      mask = tcg_temp_new_ptr();
>      index = tcg_temp_new_ptr();
> -    base = tcg_temp_new();
> +    base = gpr_src(s, rs1);
>      desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
> -    gen_get_gpr(base, rs1);
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
>      tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
> @@ -471,7 +454,6 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>      tcg_temp_free_ptr(dest);
>      tcg_temp_free_ptr(mask);
>      tcg_temp_free_ptr(index);
> -    tcg_temp_free(base);
>      gen_set_label(over);
>      return true;
>  }
> @@ -589,10 +571,9 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>
>      dest = tcg_temp_new_ptr();
>      mask = tcg_temp_new_ptr();
> -    base = tcg_temp_new();
> +    base = gpr_src(s, rs1);
>      desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
> -    gen_get_gpr(base, rs1);
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
>
> @@ -600,7 +581,6 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>
>      tcg_temp_free_ptr(dest);
>      tcg_temp_free_ptr(mask);
> -    tcg_temp_free(base);
>      gen_set_label(over);
>      return true;
>  }
> @@ -665,10 +645,9 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>      dest = tcg_temp_new_ptr();
>      mask = tcg_temp_new_ptr();
>      index = tcg_temp_new_ptr();
> -    base = tcg_temp_new();
> +    base = gpr_src(s, rs1);
>      desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
> -    gen_get_gpr(base, rs1);
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
>      tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
> @@ -678,7 +657,6 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>      tcg_temp_free_ptr(dest);
>      tcg_temp_free_ptr(mask);
>      tcg_temp_free_ptr(index);
> -    tcg_temp_free(base);
>      gen_set_label(over);
>      return true;
>  }
> @@ -862,8 +840,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
>      dest = tcg_temp_new_ptr();
>      mask = tcg_temp_new_ptr();
>      src2 = tcg_temp_new_ptr();
> -    src1 = tcg_temp_new();
> -    gen_get_gpr(src1, rs1);
> +    src1 = gpr_src(s, rs1);
>
>      data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
>      data = FIELD_DP32(data, VDATA, VM, vm);
> @@ -879,7 +856,6 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
>      tcg_temp_free_ptr(dest);
>      tcg_temp_free_ptr(mask);
>      tcg_temp_free_ptr(src2);
> -    tcg_temp_free(src1);
>      gen_set_label(over);
>      return true;
>  }
> @@ -905,15 +881,12 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
>
>      if (a->vm && s->vl_eq_vlmax) {
>          TCGv_i64 src1 = tcg_temp_new_i64();
> -        TCGv tmp = tcg_temp_new();
>
> -        gen_get_gpr(tmp, a->rs1);
> -        tcg_gen_ext_tl_i64(src1, tmp);
> +        tcg_gen_ext_tl_i64(src1, gpr_src(s, a->rs1));
>          gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
>                  src1, MAXSZ(s), MAXSZ(s));
>
>          tcg_temp_free_i64(src1);
> -        tcg_temp_free(tmp);
>          return true;
>      }
>      return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
> @@ -1398,16 +1371,13 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecGen2sFn32 *gvec_fn,
>
>      if (a->vm && s->vl_eq_vlmax) {
>          TCGv_i32 src1 = tcg_temp_new_i32();
> -        TCGv tmp = tcg_temp_new();
>
> -        gen_get_gpr(tmp, a->rs1);
> -        tcg_gen_trunc_tl_i32(src1, tmp);
> +        tcg_gen_trunc_tl_i32(src1, gpr_src(s, a->rs1));
>          tcg_gen_extract_i32(src1, src1, 0, s->sew + 3);
>          gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
>                  src1, MAXSZ(s), MAXSZ(s));
>
>          tcg_temp_free_i32(src1);
> -        tcg_temp_free(tmp);
>          return true;
>      }
>      return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
> @@ -1665,8 +1635,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
>          TCGLabel *over = gen_new_label();
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>
> -        s1 = tcg_temp_new();
> -        gen_get_gpr(s1, a->rs1);
> +        s1 = gpr_src(s, a->rs1);
>
>          if (s->vl_eq_vlmax) {
>              tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
> @@ -1690,7 +1659,6 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
>              tcg_temp_free_i64(s1_i64);
>          }
>
> -        tcg_temp_free(s1);
>          gen_set_label(over);
>          return true;
>      }
> @@ -2412,18 +2380,16 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
>
>          mask = tcg_temp_new_ptr();
>          src2 = tcg_temp_new_ptr();
> -        dst = tcg_temp_new();
> +        dst = gpr_dst(s, a->rd);
>          desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
>          tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
>          tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
>
>          gen_helper_vmpopc_m(dst, mask, src2, cpu_env, desc);
> -        gen_set_gpr(a->rd, dst);
>
>          tcg_temp_free_ptr(mask);
>          tcg_temp_free_ptr(src2);
> -        tcg_temp_free(dst);
>          return true;
>      }
>      return false;
> @@ -2443,18 +2409,16 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
>
>          mask = tcg_temp_new_ptr();
>          src2 = tcg_temp_new_ptr();
> -        dst = tcg_temp_new();
> +        dst = gpr_dst(s, a->rd);
>          desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
>
>          tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
>          tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
>
>          gen_helper_vmfirst_m(dst, mask, src2, cpu_env, desc);
> -        gen_set_gpr(a->rd, dst);
>
>          tcg_temp_free_ptr(mask);
>          tcg_temp_free_ptr(src2);
> -        tcg_temp_free(dst);
>          return true;
>      }
>      return false;
> @@ -2638,7 +2602,6 @@ static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
>  static bool trans_vext_x_v(DisasContext *s, arg_r *a)
>  {
>      TCGv_i64 tmp = tcg_temp_new_i64();
> -    TCGv dest = tcg_temp_new();
>
>      if (a->rs1 == 0) {
>          /* Special case vmv.x.s rd, vs2. */
> @@ -2648,10 +2611,8 @@ static bool trans_vext_x_v(DisasContext *s, arg_r *a)
>          int vlmax = s->vlen >> (3 + s->sew);
>          vec_element_loadx(s, tmp, a->rs2, cpu_gpr[a->rs1], vlmax);
>      }
> -    tcg_gen_trunc_i64_tl(dest, tmp);
> -    gen_set_gpr(a->rd, dest);
>
> -    tcg_temp_free(dest);
> +    tcg_gen_trunc_i64_tl(gpr_dst(s, a->rd), tmp);
>      tcg_temp_free_i64(tmp);
>      return true;
>  }
> --
> 2.25.1
>
>

