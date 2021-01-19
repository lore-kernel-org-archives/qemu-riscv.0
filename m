Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1w3P-0001z2-HV
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 13:48:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1w3E-0001w0-W7; Tue, 19 Jan 2021 13:48:28 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:34488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1w3B-0003Fv-0H; Tue, 19 Jan 2021 13:48:24 -0500
Received: by mail-io1-xd33.google.com with SMTP id u17so41776462iow.1;
 Tue, 19 Jan 2021 10:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nChJCEfc99RILZGcCJJk682o+bzLsOXbZhJfSCMTxmM=;
 b=FpgBUWOqKXok15G746o1Rjy20n6yl4EY1IiThWnNCv/66eZJtIIg2IR7NXeSgHTgub
 IlYkeTzEDM+LVikShUi1ehgkTu3XC72BHAafjbUY3Ex0uaANA5PqAYzlpFxDmnEdcWTR
 kNfOrpedK87K2hamGA8qZI8OGxRPgYfen4NQerlCDQw51QrhRgcSDuPoE2TkO4194XZg
 ILCtBEpAEMD5p9BCf15jMKBgr55kH7fp6pidb60Le0fB5i/VdLlVWrCLXKLTW0VhOrkG
 rHn/D7j9FLiDkbE+U+Uw8wXAKalI8M7jeEI+0Dug1mkpK/rV1apuoLTpcJyyj6vZ02LR
 g4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nChJCEfc99RILZGcCJJk682o+bzLsOXbZhJfSCMTxmM=;
 b=Ow2xPcIcjqJzb9WEVFux79QXFy4Lo8cMQpRw27XuCCD3HO+ilPEAECsGzzCzbcC7//
 pEuNtXabV7J7hO9i9xeFfEC22xVtYF5At/vTq8jUI8zHQimF3fBCiqYits18tGjSNZor
 3A/ZXH9TA/P2fZU55SCxMOYtEyEW0boTNY64ZNyXrOc3hdlDS5lH60ANge9xhVfwAMpo
 x3ksPPV7QiI67geJLUNfR2Z5DV63hLxzoyS0a7RdRAHxcd6bVQCciMjiEGJukjicHhTQ
 SzBjpAfWiE1nsbyZ8QPsRuHizs60bGH4ZNaIALinURfi9nE4xev7J7XUiQmt9L05YRQ3
 4E4A==
X-Gm-Message-State: AOAM531VehvwDgTuqc2tZ8VbrWacK/LSKZYkTvqxPpSPB2D5MsuVA7Ht
 jmSlnYJ+eeyHNqcnDHRxIlOjxbBRsFTth03bdiQ=
X-Google-Smtp-Source: ABdhPJxulRYlIINxr47ibs0l4w3kdh3qLG2LQXtmrp+7M8ruNtVpc7CzLtB4CP8jqRD/jj3Vx2hxAzmHbSEnWAQwQjU=
X-Received: by 2002:a05:6e02:963:: with SMTP id
 q3mr4479971ilt.227.1611082097730; 
 Tue, 19 Jan 2021 10:48:17 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-7-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-7-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 10:47:51 -0800
Message-ID: <CAKmqyKNY4h74CWKD6PFAqWhRkPiU+oKmMeZ-SAiXXM=r4NOvVw@mail.gmail.com>
Subject: Re: [PATCH v6 06/72] target/riscv: rvv-1.0: add translation-time
 vector context status
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 18:48:31 -0000

On Tue, Jan 12, 2021 at 1:57 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 69 ++++++++++++++++++++-----
>  target/riscv/translate.c                | 33 ++++++++++++
>  2 files changed, 90 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 887c6b88831..56ce39e769a 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -41,6 +41,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
>      gen_get_gpr(s2, a->rs2);
>      gen_helper_vsetvl(dst, cpu_env, s1, s2);
>      gen_set_gpr(a->rd, dst);
> +    mark_vs_dirty(ctx);
>      tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
>      lookup_and_goto_ptr(ctx);
>      ctx->base.is_jmp = DISAS_NORETURN;
> @@ -72,6 +73,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
>      }
>      gen_helper_vsetvl(dst, cpu_env, s1, s2);
>      gen_set_gpr(a->rd, dst);
> +    mark_vs_dirty(ctx);
>      gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
>      ctx->base.is_jmp = DISAS_NORETURN;
>
> @@ -163,7 +165,8 @@ typedef void gen_helper_ldst_us(TCGv_ptr, TCGv_ptr, TCGv,
>                                  TCGv_env, TCGv_i32);
>
>  static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
> -                          gen_helper_ldst_us *fn, DisasContext *s)
> +                          gen_helper_ldst_us *fn, DisasContext *s,
> +                          bool is_store)
>  {
>      TCGv_ptr dest, mask;
>      TCGv base;
> @@ -195,6 +198,9 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>      tcg_temp_free_ptr(mask);
>      tcg_temp_free(base);
>      tcg_temp_free_i32(desc);
> +    if (!is_store) {
> +        mark_vs_dirty(s);
> +    }
>      gen_set_label(over);
>      return true;
>  }
> @@ -245,7 +251,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> -    return ldst_us_trans(a->rd, a->rs1, data, fn, s);
> +    return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>  }
>
>  static bool ld_us_check(DisasContext *s, arg_r2nfvm* a)
> @@ -298,7 +304,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t seq)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> -    return ldst_us_trans(a->rd, a->rs1, data, fn, s);
> +    return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
>  }
>
>  static bool st_us_check(DisasContext *s, arg_r2nfvm* a)
> @@ -321,7 +327,7 @@ typedef void gen_helper_ldst_stride(TCGv_ptr, TCGv_ptr, TCGv,
>
>  static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
>                                uint32_t data, gen_helper_ldst_stride *fn,
> -                              DisasContext *s)
> +                              DisasContext *s, bool is_store)
>  {
>      TCGv_ptr dest, mask;
>      TCGv base, stride;
> @@ -348,6 +354,9 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
>      tcg_temp_free(base);
>      tcg_temp_free(stride);
>      tcg_temp_free_i32(desc);
> +    if (!is_store) {
> +        mark_vs_dirty(s);
> +    }
>      gen_set_label(over);
>      return true;
>  }
> @@ -382,7 +391,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> -    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>  }
>
>  static bool ld_stride_check(DisasContext *s, arg_rnfvm* a)
> @@ -426,7 +435,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
>          return false;
>      }
>
> -    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +    return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
>  }
>
>  static bool st_stride_check(DisasContext *s, arg_rnfvm* a)
> @@ -449,7 +458,7 @@ typedef void gen_helper_ldst_index(TCGv_ptr, TCGv_ptr, TCGv,
>
>  static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>                               uint32_t data, gen_helper_ldst_index *fn,
> -                             DisasContext *s)
> +                             DisasContext *s, bool is_store)
>  {
>      TCGv_ptr dest, mask, index;
>      TCGv base;
> @@ -476,6 +485,9 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>      tcg_temp_free_ptr(index);
>      tcg_temp_free(base);
>      tcg_temp_free_i32(desc);
> +    if (!is_store) {
> +        mark_vs_dirty(s);
> +    }
>      gen_set_label(over);
>      return true;
>  }
> @@ -510,7 +522,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> -    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>  }
>
>  /*
> @@ -562,7 +574,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> -    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s);
> +    return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
>  }
>
>  static bool st_index_check(DisasContext *s, arg_rnfvm* a)
> @@ -606,6 +618,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>      tcg_temp_free_ptr(mask);
>      tcg_temp_free(base);
>      tcg_temp_free_i32(desc);
> +    mark_vs_dirty(s);
>      gen_set_label(over);
>      return true;
>  }
> @@ -685,6 +698,7 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>      tcg_temp_free_ptr(index);
>      tcg_temp_free(base);
>      tcg_temp_free_i32(desc);
> +    mark_vs_dirty(s);
>      gen_set_label(over);
>      return true;
>  }
> @@ -832,6 +846,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
>                             vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
>                             cpu_env, 0, s->vlen / 8, data, fn);
>      }
> +    mark_vs_dirty(s);
>      gen_set_label(over);
>      return true;
>  }
> @@ -886,6 +901,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
>      tcg_temp_free_ptr(src2);
>      tcg_temp_free(src1);
>      tcg_temp_free_i32(desc);
> +    mark_vs_dirty(s);
>      gen_set_label(over);
>      return true;
>  }
> @@ -920,6 +936,7 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
>
>          tcg_temp_free_i64(src1);
>          tcg_temp_free(tmp);
> +        mark_vs_dirty(s);
>          return true;
>      }
>      return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
> @@ -1033,6 +1050,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
>      tcg_temp_free_ptr(src2);
>      tcg_temp_free(src1);
>      tcg_temp_free_i32(desc);
> +    mark_vs_dirty(s);
>      gen_set_label(over);
>      return true;
>  }
> @@ -1056,10 +1074,10 @@ do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecGen2iFn *gvec_fn,
>              gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
>                      sextract64(a->rs1, 0, 5), MAXSZ(s), MAXSZ(s));
>          }
> -    } else {
> -        return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, zx);
> +        mark_vs_dirty(s);
> +        return true;
>      }
> -    return true;
> +    return opivi_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s, zx);
>  }
>
>  /* OPIVI with GVEC IR */
> @@ -1120,6 +1138,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
>                             vreg_ofs(s, a->rs2),
>                             cpu_env, 0, s->vlen / 8,
>                             data, fn);
> +        mark_vs_dirty(s);
>          gen_set_label(over);
>          return true;
>      }
> @@ -1207,6 +1226,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
>                             vreg_ofs(s, a->rs1),
>                             vreg_ofs(s, a->rs2),
>                             cpu_env, 0, s->vlen / 8, data, fn);
> +        mark_vs_dirty(s);
>          gen_set_label(over);
>          return true;
>      }
> @@ -1285,6 +1305,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env, 0,        \
>                             s->vlen / 8, data, fns[s->sew]);        \
> +        mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -1416,6 +1437,7 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecGen2sFn32 *gvec_fn,
>
>          tcg_temp_free_i32(src1);
>          tcg_temp_free(tmp);
> +        mark_vs_dirty(s);
>          return true;
>      }
>      return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fn, s);
> @@ -1474,6 +1496,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env, 0,        \
>                             s->vlen / 8, data, fns[s->sew]);        \
> +        mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -1657,6 +1680,7 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
>                                 cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
>              gen_set_label(over);
>          }
> +        mark_vs_dirty(s);
>          return true;
>      }
>      return false;
> @@ -1699,6 +1723,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
>          }
>
>          tcg_temp_free(s1);
> +        mark_vs_dirty(s);
>          gen_set_label(over);
>          return true;
>      }
> @@ -1714,6 +1739,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
>          if (s->vl_eq_vlmax) {
>              tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
>                                   MAXSZ(s), MAXSZ(s), simm);
> +            mark_vs_dirty(s);
>          } else {
>              TCGv_i32 desc;
>              TCGv_i64 s1;
> @@ -1735,6 +1761,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
>              tcg_temp_free_ptr(dest);
>              tcg_temp_free_i32(desc);
>              tcg_temp_free_i64(s1);
> +            mark_vs_dirty(s);
>              gen_set_label(over);
>          }
>          return true;
> @@ -1839,6 +1866,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env, 0,        \
>                             s->vlen / 8, data, fns[s->sew - 1]);    \
> +        mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -1874,6 +1902,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
>      tcg_temp_free_ptr(mask);
>      tcg_temp_free_ptr(src2);
>      tcg_temp_free_i32(desc);
> +    mark_vs_dirty(s);
>      gen_set_label(over);
>      return true;
>  }
> @@ -1951,6 +1980,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
>                             vreg_ofs(s, a->rs1),                  \
>                             vreg_ofs(s, a->rs2), cpu_env, 0,      \
>                             s->vlen / 8, data, fns[s->sew - 1]);  \
> +        mark_vs_dirty(s);                                        \
>          gen_set_label(over);                                     \
>          return true;                                             \
>      }                                                            \
> @@ -2025,6 +2055,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env, 0,        \
>                             s->vlen / 8, data, fns[s->sew - 1]);    \
> +        mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -2139,6 +2170,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), cpu_env, 0,        \
>                             s->vlen / 8, data, fns[s->sew - 1]);    \
> +        mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -2211,6 +2243,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>          if (s->vl_eq_vlmax) {
>              tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
>                                   MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
> +            mark_vs_dirty(s);
>          } else {
>              TCGv_ptr dest;
>              TCGv_i32 desc;
> @@ -2230,6 +2263,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>
>              tcg_temp_free_ptr(dest);
>              tcg_temp_free_i32(desc);
> +            mark_vs_dirty(s);
>              gen_set_label(over);
>          }
>          return true;
> @@ -2279,6 +2313,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), cpu_env, 0,        \
>                             s->vlen / 8, data, fns[s->sew - 1]);    \
> +        mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -2327,6 +2362,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), cpu_env, 0,        \
>                             s->vlen / 8, data, fns[s->sew - 1]);    \
> +        mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -2389,6 +2425,7 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env, 0,        \
>                             s->vlen / 8, data, fn);                 \
> +        mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -2486,6 +2523,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
>                             vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
>                             cpu_env, 0, s->vlen / 8, data, fn);     \
> +        mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
>          return true;                                               \
>      }                                                              \
> @@ -2517,6 +2555,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs2), cpu_env, 0,
>                             s->vlen / 8, data, fns[s->sew]);
> +        mark_vs_dirty(s);
>          gen_set_label(over);
>          return true;
>      }
> @@ -2542,6 +2581,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
>          };
>          tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
> +        mark_vs_dirty(s);
>          gen_set_label(over);
>          return true;
>      }
> @@ -2717,6 +2757,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
>          tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
>          vec_element_storei(s, a->rd, 0, t1);
>          tcg_temp_free_i64(t1);
> +        mark_vs_dirty(s);
>      done:
>          gen_set_label(over);
>          return true;
> @@ -2767,6 +2808,7 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
>          }
>          vec_element_storei(s, a->rd, 0, t1);
>          tcg_temp_free_i64(t1);
> +        mark_vs_dirty(s);
>          gen_set_label(over);
>          return true;
>      }
> @@ -2833,6 +2875,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
>          tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
>                               MAXSZ(s), MAXSZ(s), dest);
>          tcg_temp_free_i64(dest);
> +        mark_vs_dirty(s);
>      } else {
>          static gen_helper_opivx * const fns[4] = {
>              gen_helper_vrgather_vx_b, gen_helper_vrgather_vx_h,
> @@ -2859,6 +2902,7 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
>                                   endian_ofs(s, a->rs2, a->rs1),
>                                   MAXSZ(s), MAXSZ(s));
>          }
> +        mark_vs_dirty(s);
>      } else {
>          static gen_helper_opivx * const fns[4] = {
>              gen_helper_vrgather_vx_b, gen_helper_vrgather_vx_h,
> @@ -2895,6 +2939,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
>                             cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
> +        mark_vs_dirty(s);
>          gen_set_label(over);
>          return true;
>      }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 554d52a4be3..ba61cc0401f 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -47,6 +47,7 @@ typedef struct DisasContext {
>      bool virt_enabled;
>      uint32_t opcode;
>      uint32_t mstatus_fs;
> +    uint32_t mstatus_vs;
>      uint32_t misa;
>      uint32_t mem_idx;
>      /* Remember the rounding mode encoded in the previous fp instruction,
> @@ -446,6 +447,37 @@ static void mark_fs_dirty(DisasContext *ctx)
>  static inline void mark_fs_dirty(DisasContext *ctx) { }
>  #endif
>
> +#ifndef CONFIG_USER_ONLY
> +/* The states of mstatus_vs are:
> + * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
> + * We will have already diagnosed disabled state,
> + * and need to turn initial/clean into dirty.
> + */
> +static void mark_vs_dirty(DisasContext *ctx)
> +{
> +    TCGv tmp;
> +    if (ctx->mstatus_vs == MSTATUS_VS) {
> +        return;
> +    }
> +    /* Remember the state change for the rest of the TB.  */
> +    ctx->mstatus_vs = MSTATUS_VS;
> +
> +    tmp = tcg_temp_new();
> +    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> +    tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS | MSTATUS_SD);
> +    tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> +
> +    if (ctx->virt_enabled) {
> +        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS | MSTATUS_SD);
> +        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +    }
> +    tcg_temp_free(tmp);
> +}
> +#else
> +static inline void mark_vs_dirty(DisasContext *ctx) { }
> +#endif
> +
>  #if !defined(TARGET_RISCV64)
>  static void gen_fp_load(DisasContext *ctx, uint32_t opc, int rd,
>          int rs1, target_long imm)
> @@ -794,6 +826,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->pc_succ_insn = ctx->base.pc_first;
>      ctx->mem_idx = tb_flags & TB_FLAGS_MMU_MASK;
>      ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
> +    ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
>      ctx->priv_ver = env->priv_ver;
>  #if !defined(CONFIG_USER_ONLY)
>      if (riscv_has_ext(env, RVH)) {
> --
> 2.17.1
>
>

