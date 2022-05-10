Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noLks-00046M-SP
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 05:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noLko-0003yh-Ih; Tue, 10 May 2022 05:02:02 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:41807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noLkh-0004hi-UH; Tue, 10 May 2022 05:02:02 -0400
Received: by mail-il1-x12f.google.com with SMTP id z12so10926660ilp.8;
 Tue, 10 May 2022 02:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lGq1q/F8+HoJPEAOkZzKEko6pIdUGzu284cezKU23YI=;
 b=nKRF5kTvTZvQn6HJlfLyAnGKtyitlMzWQj7VwE0vGbTWVErSL0iq8v3B9SFEEg11Cq
 VBesgPFJAlTPk9wVsKyaQ96cPEhPgYJCUa2SVK4zw6OWBxCK51X/79EzTHVpMgGI+yvs
 4Ouo3JpM6sYCi2kkz0znpcBFvik8ymtcrdzT00bjJh3GKnOZXoK6T5okfJKolV8nJuOy
 dHD0BcCRWeDzz7KXLxFnMCdNHJryMKsehCyMtP2GGGC5Utkfi99CbFvPgXxdhweCRpFl
 drqBRweGaL3YHn7YnqnB4/Ghmatp7ZY/bS5m88cfR0UbxxeBG2pDRdIapN4vMSWB5FYM
 Rujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lGq1q/F8+HoJPEAOkZzKEko6pIdUGzu284cezKU23YI=;
 b=Wvd1UyeekK/zzSfXETSclCLO4uyNUskgyNo5wIR01Ct25x5GXtV3q2i2GfYyLbmHBX
 4wIq3m2SsOW1/IQ9mEeDi1oaYH0OVZl9ZimUrD8Rw+h5jXX7JiDfgQV0jlIremCVB1e8
 iX6ruV9QIaoyPkDzG5YuL0q7u43qkyPOC62PZR13oqJ0VPJdZvLkPE4dphLWE6Ro7cYX
 nisUjRly0nE9S6Xq+aTAN4BYpHXwuaRLianuN4/rUCRvcTRibjHMK3kQhVRfk4hhflpZ
 N6iHiIAD5FK6joCQak/3mHswdaL4py2noBtJ/RFLKj/XNhjDxpbgSLyw/SU9oEJBFqxP
 yx5g==
X-Gm-Message-State: AOAM531zMUhnXwaRAxY7yLG7RsNgTkTuv1jNyyCtW+KmxOie6ZvQK5tc
 5PfJ8COwXxm+GtkFA+Tgw2FDvRA6h6v3LoPNm96keoabJ02RhhJM
X-Google-Smtp-Source: ABdhPJxYvKsc7Qs6QB6lR6KvHGhvAABti2jsnfXndtcfsJbld5J11NjFiOZ4fUB24zlt4V+bWTLKTq3aew63LZcmqA8=
X-Received: by 2002:a05:6e02:10c1:b0:2cc:14ab:ceb7 with SMTP id
 s1-20020a056e0210c100b002cc14abceb7mr8475466ilj.55.1652173314265; Tue, 10 May
 2022 02:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <165156202959.27941.9731161369415852149-0@git.sr.ht>
 <165156202959.27941.9731161369415852149-6@git.sr.ht>
In-Reply-To: <165156202959.27941.9731161369415852149-6@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 May 2022 11:01:27 +0200
Message-ID: <CAKmqyKN7ierUz=0u0a8o1aKw2TDFHBs4tdnim+gObYG0Bq43qw@mail.gmail.com>
Subject: Re: [PATCH qemu v14 06/15] target/riscv: rvv: Add tail agnostic for
 vx, vvm, vxm instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 10 May 2022 09:02:03 -0000

On Tue, May 3, 2022 at 9:43 AM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> `vmadc` and `vmsbc` produces a mask value, they always operate with
> a tail agnostic policy.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc |  29 +++
>  target/riscv/internals.h                |   5 +-
>  target/riscv/vector_helper.c            | 314 +++++++++++++-----------
>  3 files changed, 208 insertions(+), 140 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 99691f1b9f..d15858fc6f 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1299,6 +1299,8 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
>
>      data = FIELD_DP32(data, VDATA, VM, vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
>      desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
>                                        s->cfg_ptr->vlen / 8, data));
>
> @@ -1335,6 +1337,16 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
>      }
>
>      if (a->vm && s->vl_eq_vlmax) {
> +        if (s->vta && s->lmul < 0) {
> +            /*
> +             * tail elements may pass vlmax when lmul < 0
> +             * set tail elements to 1s
> +             */
> +            uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                             vreg_ofs(s, a->rd), -1,
> +                             vlenb, vlenb);
> +        }
>          TCGv_i64 src1 = tcg_temp_new_i64();
>
>          tcg_gen_ext_tl_i64(src1, get_gpr(s, a->rs1, EXT_SIGN));
> @@ -1464,6 +1476,8 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
>
>      data = FIELD_DP32(data, VDATA, VM, vm);
>      data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
>      desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
>                                        s->cfg_ptr->vlen / 8, data));
>
> @@ -1493,6 +1507,16 @@ do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecGen2iFn *gvec_fn,
>      }
>
>      if (a->vm && s->vl_eq_vlmax) {
> +        if (s->vta && s->lmul < 0) {
> +            /*
> +             * tail elements may pass vlmax when lmul < 0
> +             * set tail elements to 1s
> +             */
> +            uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                             vreg_ofs(s, a->rd), -1,
> +                             vlenb, vlenb);
> +        }
>          gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
>                  extract_imm(s, a->rs1, imm_mode), MAXSZ(s), MAXSZ(s));
>          mark_vs_dirty(s);
> @@ -1546,6 +1570,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
>
>          data = FIELD_DP32(data, VDATA, VM, a->vm);
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1),
>                             vreg_ofs(s, a->rs2),
> @@ -1627,6 +1652,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
>
>          data = FIELD_DP32(data, VDATA, VM, a->vm);
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1),
>                             vreg_ofs(s, a->rs2),
> @@ -1705,6 +1731,9 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>                                                                     \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> +        data =                                                     \
> +            FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 512c6c30cf..193ce57a6d 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -25,8 +25,9 @@
>  FIELD(VDATA, VM, 0, 1)
>  FIELD(VDATA, LMUL, 1, 3)
>  FIELD(VDATA, VTA, 4, 1)
> -FIELD(VDATA, NF, 5, 4)
> -FIELD(VDATA, WD, 5, 1)
> +FIELD(VDATA, VTA_ALL_1S, 5, 1)
> +FIELD(VDATA, NF, 6, 4)
> +FIELD(VDATA, WD, 6, 1)
>
>  /* float point classify helpers */
>  target_ulong fclass_h(uint64_t frs1);
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index f1a0b4ced7..e00f9353b9 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -127,6 +127,11 @@ static inline uint32_t vext_vta(uint32_t desc)
>      return FIELD_EX32(simd_data(desc), VDATA, VTA);
>  }
>
> +static inline uint32_t vext_vta_all_1s(uint32_t desc)
> +{
> +    return FIELD_EX32(simd_data(desc), VDATA, VTA_ALL_1S);
> +}
> +
>  /*
>   * Get the maximum number of elements can be operated.
>   *
> @@ -869,10 +874,12 @@ RVVCALL(OPIVX2, vrsub_vx_d, OP_SSS_D, H8, H8, DO_RSUB)
>
>  static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
>                         CPURISCVState *env, uint32_t desc,
> -                       opivx2_fn fn)
> +                       opivx2_fn fn, uint32_t esz)
>  {
>      uint32_t vm = vext_vm(desc);
>      uint32_t vl = env->vl;
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vta = vext_vta(desc);
>      uint32_t i;
>
>      for (i = env->vstart; i < vl; i++) {
> @@ -882,30 +889,32 @@ static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
>          fn(vd, s1, vs2, i);
>      }
>      env->vstart = 0;
> +    /* set tail elements to 1s */
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);
>  }
>
>  /* generate the helpers for OPIVX */
> -#define GEN_VEXT_VX(NAME)                                 \
> +#define GEN_VEXT_VX(NAME, ESZ)                            \
>  void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
>                    void *vs2, CPURISCVState *env,          \
>                    uint32_t desc)                          \
>  {                                                         \
>      do_vext_vx(vd, v0, s1, vs2, env, desc,                \
> -               do_##NAME);                                \
> -}
> -
> -GEN_VEXT_VX(vadd_vx_b)
> -GEN_VEXT_VX(vadd_vx_h)
> -GEN_VEXT_VX(vadd_vx_w)
> -GEN_VEXT_VX(vadd_vx_d)
> -GEN_VEXT_VX(vsub_vx_b)
> -GEN_VEXT_VX(vsub_vx_h)
> -GEN_VEXT_VX(vsub_vx_w)
> -GEN_VEXT_VX(vsub_vx_d)
> -GEN_VEXT_VX(vrsub_vx_b)
> -GEN_VEXT_VX(vrsub_vx_h)
> -GEN_VEXT_VX(vrsub_vx_w)
> -GEN_VEXT_VX(vrsub_vx_d)
> +               do_##NAME, ESZ);                           \
> +}
> +
> +GEN_VEXT_VX(vadd_vx_b, 1)
> +GEN_VEXT_VX(vadd_vx_h, 2)
> +GEN_VEXT_VX(vadd_vx_w, 4)
> +GEN_VEXT_VX(vadd_vx_d, 8)
> +GEN_VEXT_VX(vsub_vx_b, 1)
> +GEN_VEXT_VX(vsub_vx_h, 2)
> +GEN_VEXT_VX(vsub_vx_w, 4)
> +GEN_VEXT_VX(vsub_vx_d, 8)
> +GEN_VEXT_VX(vrsub_vx_b, 1)
> +GEN_VEXT_VX(vrsub_vx_h, 2)
> +GEN_VEXT_VX(vrsub_vx_w, 4)
> +GEN_VEXT_VX(vrsub_vx_d, 8)
>
>  void HELPER(vec_rsubs8)(void *d, void *a, uint64_t b, uint32_t desc)
>  {
> @@ -1033,30 +1042,30 @@ RVVCALL(OPIVX2, vwadd_wx_w, WOP_WSSS_W, H8, H4, DO_ADD)
>  RVVCALL(OPIVX2, vwsub_wx_b, WOP_WSSS_B, H2, H1, DO_SUB)
>  RVVCALL(OPIVX2, vwsub_wx_h, WOP_WSSS_H, H4, H2, DO_SUB)
>  RVVCALL(OPIVX2, vwsub_wx_w, WOP_WSSS_W, H8, H4, DO_SUB)
> -GEN_VEXT_VX(vwaddu_vx_b)
> -GEN_VEXT_VX(vwaddu_vx_h)
> -GEN_VEXT_VX(vwaddu_vx_w)
> -GEN_VEXT_VX(vwsubu_vx_b)
> -GEN_VEXT_VX(vwsubu_vx_h)
> -GEN_VEXT_VX(vwsubu_vx_w)
> -GEN_VEXT_VX(vwadd_vx_b)
> -GEN_VEXT_VX(vwadd_vx_h)
> -GEN_VEXT_VX(vwadd_vx_w)
> -GEN_VEXT_VX(vwsub_vx_b)
> -GEN_VEXT_VX(vwsub_vx_h)
> -GEN_VEXT_VX(vwsub_vx_w)
> -GEN_VEXT_VX(vwaddu_wx_b)
> -GEN_VEXT_VX(vwaddu_wx_h)
> -GEN_VEXT_VX(vwaddu_wx_w)
> -GEN_VEXT_VX(vwsubu_wx_b)
> -GEN_VEXT_VX(vwsubu_wx_h)
> -GEN_VEXT_VX(vwsubu_wx_w)
> -GEN_VEXT_VX(vwadd_wx_b)
> -GEN_VEXT_VX(vwadd_wx_h)
> -GEN_VEXT_VX(vwadd_wx_w)
> -GEN_VEXT_VX(vwsub_wx_b)
> -GEN_VEXT_VX(vwsub_wx_h)
> -GEN_VEXT_VX(vwsub_wx_w)
> +GEN_VEXT_VX(vwaddu_vx_b, 2)
> +GEN_VEXT_VX(vwaddu_vx_h, 4)
> +GEN_VEXT_VX(vwaddu_vx_w, 8)
> +GEN_VEXT_VX(vwsubu_vx_b, 2)
> +GEN_VEXT_VX(vwsubu_vx_h, 4)
> +GEN_VEXT_VX(vwsubu_vx_w, 8)
> +GEN_VEXT_VX(vwadd_vx_b, 2)
> +GEN_VEXT_VX(vwadd_vx_h, 4)
> +GEN_VEXT_VX(vwadd_vx_w, 8)
> +GEN_VEXT_VX(vwsub_vx_b, 2)
> +GEN_VEXT_VX(vwsub_vx_h, 4)
> +GEN_VEXT_VX(vwsub_vx_w, 8)
> +GEN_VEXT_VX(vwaddu_wx_b, 2)
> +GEN_VEXT_VX(vwaddu_wx_h, 4)
> +GEN_VEXT_VX(vwaddu_wx_w, 8)
> +GEN_VEXT_VX(vwsubu_wx_b, 2)
> +GEN_VEXT_VX(vwsubu_wx_h, 4)
> +GEN_VEXT_VX(vwsubu_wx_w, 8)
> +GEN_VEXT_VX(vwadd_wx_b, 2)
> +GEN_VEXT_VX(vwadd_wx_h, 4)
> +GEN_VEXT_VX(vwadd_wx_w, 8)
> +GEN_VEXT_VX(vwsub_wx_b, 2)
> +GEN_VEXT_VX(vwsub_wx_h, 4)
> +GEN_VEXT_VX(vwsub_wx_w, 8)
>
>  /* Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions */
>  #define DO_VADC(N, M, C) (N + M + C)
> @@ -1067,6 +1076,10 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>                    CPURISCVState *env, uint32_t desc)          \
>  {                                                             \
>      uint32_t vl = env->vl;                                    \
> +    uint32_t esz = sizeof(ETYPE);                             \
> +    uint32_t total_elems =                                    \
> +        vext_get_total_elems(env, desc, esz);                 \
> +    uint32_t vta = vext_vta(desc);                            \
>      uint32_t i;                                               \
>                                                                \
>      for (i = env->vstart; i < vl; i++) {                      \
> @@ -1077,6 +1090,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>          *((ETYPE *)vd + H(i)) = DO_OP(s2, s1, carry);         \
>      }                                                         \
>      env->vstart = 0;                                          \
> +    /* set tail elements to 1s */                             \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);  \
>  }
>
>  GEN_VEXT_VADC_VVM(vadc_vvm_b, uint8_t,  H1, DO_VADC)
> @@ -1094,6 +1109,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
>                    CPURISCVState *env, uint32_t desc)                     \
>  {                                                                        \
>      uint32_t vl = env->vl;                                               \
> +    uint32_t esz = sizeof(ETYPE);                                        \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);         \
> +    uint32_t vta = vext_vta(desc);                                       \
>      uint32_t i;                                                          \
>                                                                           \
>      for (i = env->vstart; i < vl; i++) {                                 \
> @@ -1103,6 +1121,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
>          *((ETYPE *)vd + H(i)) = DO_OP(s2, (ETYPE)(target_long)s1, carry);\
>      }                                                                    \
>      env->vstart = 0;                                          \
> +    /* set tail elements to 1s */                                        \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);             \
>  }
>
>  GEN_VEXT_VADC_VXM(vadc_vxm_b, uint8_t,  H1, DO_VADC)
> @@ -1125,6 +1145,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>  {                                                             \
>      uint32_t vl = env->vl;                                    \
>      uint32_t vm = vext_vm(desc);                              \
> +    uint32_t total_elems = env_archcpu(env)->cfg.vlen;        \
> +    uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
>      uint32_t i;                                               \
>                                                                \
>      for (i = env->vstart; i < vl; i++) {                      \
> @@ -1134,6 +1156,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>          vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));      \
>      }                                                         \
>      env->vstart = 0;                                          \
> +    /* mask destination register are always tail-agnostic */  \
> +    /* set tail elements to 1s */                             \
> +    if (vta_all_1s) {                                         \
> +        for (; i < total_elems; i++) {                        \
> +            vext_set_elem_mask(vd, i, 1);                     \
> +        }                                                     \
> +    }                                                         \
>  }
>
>  GEN_VEXT_VMADC_VVM(vmadc_vvm_b, uint8_t,  H1, DO_MADC)
> @@ -1152,6 +1181,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
>  {                                                               \
>      uint32_t vl = env->vl;                                      \
>      uint32_t vm = vext_vm(desc);                                \
> +    uint32_t total_elems = env_archcpu(env)->cfg.vlen;          \
> +    uint32_t vta_all_1s = vext_vta_all_1s(desc);                \
>      uint32_t i;                                                 \
>                                                                  \
>      for (i = env->vstart; i < vl; i++) {                        \
> @@ -1161,6 +1192,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
>                  DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
>      }                                                           \
>      env->vstart = 0;                                            \
> +    /* mask destination register are always tail-agnostic */    \
> +    /* set tail elements to 1s */                               \
> +    if (vta_all_1s) {                                           \
> +        for (; i < total_elems; i++) {                          \
> +            vext_set_elem_mask(vd, i, 1);                       \
> +        }                                                       \
> +    }                                                           \
>  }
>
>  GEN_VEXT_VMADC_VXM(vmadc_vxm_b, uint8_t,  H1, DO_MADC)
> @@ -1211,18 +1249,18 @@ RVVCALL(OPIVX2, vxor_vx_b, OP_SSS_B, H1, H1, DO_XOR)
>  RVVCALL(OPIVX2, vxor_vx_h, OP_SSS_H, H2, H2, DO_XOR)
>  RVVCALL(OPIVX2, vxor_vx_w, OP_SSS_W, H4, H4, DO_XOR)
>  RVVCALL(OPIVX2, vxor_vx_d, OP_SSS_D, H8, H8, DO_XOR)
> -GEN_VEXT_VX(vand_vx_b)
> -GEN_VEXT_VX(vand_vx_h)
> -GEN_VEXT_VX(vand_vx_w)
> -GEN_VEXT_VX(vand_vx_d)
> -GEN_VEXT_VX(vor_vx_b)
> -GEN_VEXT_VX(vor_vx_h)
> -GEN_VEXT_VX(vor_vx_w)
> -GEN_VEXT_VX(vor_vx_d)
> -GEN_VEXT_VX(vxor_vx_b)
> -GEN_VEXT_VX(vxor_vx_h)
> -GEN_VEXT_VX(vxor_vx_w)
> -GEN_VEXT_VX(vxor_vx_d)
> +GEN_VEXT_VX(vand_vx_b, 1)
> +GEN_VEXT_VX(vand_vx_h, 2)
> +GEN_VEXT_VX(vand_vx_w, 4)
> +GEN_VEXT_VX(vand_vx_d, 8)
> +GEN_VEXT_VX(vor_vx_b, 1)
> +GEN_VEXT_VX(vor_vx_h, 2)
> +GEN_VEXT_VX(vor_vx_w, 4)
> +GEN_VEXT_VX(vor_vx_d, 8)
> +GEN_VEXT_VX(vxor_vx_b, 1)
> +GEN_VEXT_VX(vxor_vx_h, 2)
> +GEN_VEXT_VX(vxor_vx_w, 4)
> +GEN_VEXT_VX(vxor_vx_d, 8)
>
>  /* Vector Single-Width Bit Shift Instructions */
>  #define DO_SLL(N, M)  (N << (M))
> @@ -1476,22 +1514,22 @@ RVVCALL(OPIVX2, vmax_vx_b, OP_SSS_B, H1, H1, DO_MAX)
>  RVVCALL(OPIVX2, vmax_vx_h, OP_SSS_H, H2, H2, DO_MAX)
>  RVVCALL(OPIVX2, vmax_vx_w, OP_SSS_W, H4, H4, DO_MAX)
>  RVVCALL(OPIVX2, vmax_vx_d, OP_SSS_D, H8, H8, DO_MAX)
> -GEN_VEXT_VX(vminu_vx_b)
> -GEN_VEXT_VX(vminu_vx_h)
> -GEN_VEXT_VX(vminu_vx_w)
> -GEN_VEXT_VX(vminu_vx_d)
> -GEN_VEXT_VX(vmin_vx_b)
> -GEN_VEXT_VX(vmin_vx_h)
> -GEN_VEXT_VX(vmin_vx_w)
> -GEN_VEXT_VX(vmin_vx_d)
> -GEN_VEXT_VX(vmaxu_vx_b)
> -GEN_VEXT_VX(vmaxu_vx_h)
> -GEN_VEXT_VX(vmaxu_vx_w)
> -GEN_VEXT_VX(vmaxu_vx_d)
> -GEN_VEXT_VX(vmax_vx_b)
> -GEN_VEXT_VX(vmax_vx_h)
> -GEN_VEXT_VX(vmax_vx_w)
> -GEN_VEXT_VX(vmax_vx_d)
> +GEN_VEXT_VX(vminu_vx_b, 1)
> +GEN_VEXT_VX(vminu_vx_h, 2)
> +GEN_VEXT_VX(vminu_vx_w, 4)
> +GEN_VEXT_VX(vminu_vx_d, 8)
> +GEN_VEXT_VX(vmin_vx_b, 1)
> +GEN_VEXT_VX(vmin_vx_h, 2)
> +GEN_VEXT_VX(vmin_vx_w, 4)
> +GEN_VEXT_VX(vmin_vx_d, 8)
> +GEN_VEXT_VX(vmaxu_vx_b, 1)
> +GEN_VEXT_VX(vmaxu_vx_h, 2)
> +GEN_VEXT_VX(vmaxu_vx_w, 4)
> +GEN_VEXT_VX(vmaxu_vx_d, 8)
> +GEN_VEXT_VX(vmax_vx_b, 1)
> +GEN_VEXT_VX(vmax_vx_h, 2)
> +GEN_VEXT_VX(vmax_vx_w, 4)
> +GEN_VEXT_VX(vmax_vx_d, 8)
>
>  /* Vector Single-Width Integer Multiply Instructions */
>  #define DO_MUL(N, M) (N * M)
> @@ -1635,22 +1673,22 @@ RVVCALL(OPIVX2, vmulhsu_vx_b, OP_SUS_B, H1, H1, do_mulhsu_b)
>  RVVCALL(OPIVX2, vmulhsu_vx_h, OP_SUS_H, H2, H2, do_mulhsu_h)
>  RVVCALL(OPIVX2, vmulhsu_vx_w, OP_SUS_W, H4, H4, do_mulhsu_w)
>  RVVCALL(OPIVX2, vmulhsu_vx_d, OP_SUS_D, H8, H8, do_mulhsu_d)
> -GEN_VEXT_VX(vmul_vx_b)
> -GEN_VEXT_VX(vmul_vx_h)
> -GEN_VEXT_VX(vmul_vx_w)
> -GEN_VEXT_VX(vmul_vx_d)
> -GEN_VEXT_VX(vmulh_vx_b)
> -GEN_VEXT_VX(vmulh_vx_h)
> -GEN_VEXT_VX(vmulh_vx_w)
> -GEN_VEXT_VX(vmulh_vx_d)
> -GEN_VEXT_VX(vmulhu_vx_b)
> -GEN_VEXT_VX(vmulhu_vx_h)
> -GEN_VEXT_VX(vmulhu_vx_w)
> -GEN_VEXT_VX(vmulhu_vx_d)
> -GEN_VEXT_VX(vmulhsu_vx_b)
> -GEN_VEXT_VX(vmulhsu_vx_h)
> -GEN_VEXT_VX(vmulhsu_vx_w)
> -GEN_VEXT_VX(vmulhsu_vx_d)
> +GEN_VEXT_VX(vmul_vx_b, 1)
> +GEN_VEXT_VX(vmul_vx_h, 2)
> +GEN_VEXT_VX(vmul_vx_w, 4)
> +GEN_VEXT_VX(vmul_vx_d, 8)
> +GEN_VEXT_VX(vmulh_vx_b, 1)
> +GEN_VEXT_VX(vmulh_vx_h, 2)
> +GEN_VEXT_VX(vmulh_vx_w, 4)
> +GEN_VEXT_VX(vmulh_vx_d, 8)
> +GEN_VEXT_VX(vmulhu_vx_b, 1)
> +GEN_VEXT_VX(vmulhu_vx_h, 2)
> +GEN_VEXT_VX(vmulhu_vx_w, 4)
> +GEN_VEXT_VX(vmulhu_vx_d, 8)
> +GEN_VEXT_VX(vmulhsu_vx_b, 1)
> +GEN_VEXT_VX(vmulhsu_vx_h, 2)
> +GEN_VEXT_VX(vmulhsu_vx_w, 4)
> +GEN_VEXT_VX(vmulhsu_vx_d, 8)
>
>  /* Vector Integer Divide Instructions */
>  #define DO_DIVU(N, M) (unlikely(M == 0) ? (__typeof(N))(-1) : N / M)
> @@ -1709,22 +1747,22 @@ RVVCALL(OPIVX2, vrem_vx_b, OP_SSS_B, H1, H1, DO_REM)
>  RVVCALL(OPIVX2, vrem_vx_h, OP_SSS_H, H2, H2, DO_REM)
>  RVVCALL(OPIVX2, vrem_vx_w, OP_SSS_W, H4, H4, DO_REM)
>  RVVCALL(OPIVX2, vrem_vx_d, OP_SSS_D, H8, H8, DO_REM)
> -GEN_VEXT_VX(vdivu_vx_b)
> -GEN_VEXT_VX(vdivu_vx_h)
> -GEN_VEXT_VX(vdivu_vx_w)
> -GEN_VEXT_VX(vdivu_vx_d)
> -GEN_VEXT_VX(vdiv_vx_b)
> -GEN_VEXT_VX(vdiv_vx_h)
> -GEN_VEXT_VX(vdiv_vx_w)
> -GEN_VEXT_VX(vdiv_vx_d)
> -GEN_VEXT_VX(vremu_vx_b)
> -GEN_VEXT_VX(vremu_vx_h)
> -GEN_VEXT_VX(vremu_vx_w)
> -GEN_VEXT_VX(vremu_vx_d)
> -GEN_VEXT_VX(vrem_vx_b)
> -GEN_VEXT_VX(vrem_vx_h)
> -GEN_VEXT_VX(vrem_vx_w)
> -GEN_VEXT_VX(vrem_vx_d)
> +GEN_VEXT_VX(vdivu_vx_b, 1)
> +GEN_VEXT_VX(vdivu_vx_h, 2)
> +GEN_VEXT_VX(vdivu_vx_w, 4)
> +GEN_VEXT_VX(vdivu_vx_d, 8)
> +GEN_VEXT_VX(vdiv_vx_b, 1)
> +GEN_VEXT_VX(vdiv_vx_h, 2)
> +GEN_VEXT_VX(vdiv_vx_w, 4)
> +GEN_VEXT_VX(vdiv_vx_d, 8)
> +GEN_VEXT_VX(vremu_vx_b, 1)
> +GEN_VEXT_VX(vremu_vx_h, 2)
> +GEN_VEXT_VX(vremu_vx_w, 4)
> +GEN_VEXT_VX(vremu_vx_d, 8)
> +GEN_VEXT_VX(vrem_vx_b, 1)
> +GEN_VEXT_VX(vrem_vx_h, 2)
> +GEN_VEXT_VX(vrem_vx_w, 4)
> +GEN_VEXT_VX(vrem_vx_d, 8)
>
>  /* Vector Widening Integer Multiply Instructions */
>  RVVCALL(OPIVV2, vwmul_vv_b, WOP_SSS_B, H2, H1, H1, DO_MUL)
> @@ -1755,15 +1793,15 @@ RVVCALL(OPIVX2, vwmulu_vx_w, WOP_UUU_W, H8, H4, DO_MUL)
>  RVVCALL(OPIVX2, vwmulsu_vx_b, WOP_SUS_B, H2, H1, DO_MUL)
>  RVVCALL(OPIVX2, vwmulsu_vx_h, WOP_SUS_H, H4, H2, DO_MUL)
>  RVVCALL(OPIVX2, vwmulsu_vx_w, WOP_SUS_W, H8, H4, DO_MUL)
> -GEN_VEXT_VX(vwmul_vx_b)
> -GEN_VEXT_VX(vwmul_vx_h)
> -GEN_VEXT_VX(vwmul_vx_w)
> -GEN_VEXT_VX(vwmulu_vx_b)
> -GEN_VEXT_VX(vwmulu_vx_h)
> -GEN_VEXT_VX(vwmulu_vx_w)
> -GEN_VEXT_VX(vwmulsu_vx_b)
> -GEN_VEXT_VX(vwmulsu_vx_h)
> -GEN_VEXT_VX(vwmulsu_vx_w)
> +GEN_VEXT_VX(vwmul_vx_b, 2)
> +GEN_VEXT_VX(vwmul_vx_h, 4)
> +GEN_VEXT_VX(vwmul_vx_w, 8)
> +GEN_VEXT_VX(vwmulu_vx_b, 2)
> +GEN_VEXT_VX(vwmulu_vx_h, 4)
> +GEN_VEXT_VX(vwmulu_vx_w, 8)
> +GEN_VEXT_VX(vwmulsu_vx_b, 2)
> +GEN_VEXT_VX(vwmulsu_vx_h, 4)
> +GEN_VEXT_VX(vwmulsu_vx_w, 8)
>
>  /* Vector Single-Width Integer Multiply-Add Instructions */
>  #define OPIVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)   \
> @@ -1836,22 +1874,22 @@ RVVCALL(OPIVX3, vnmsub_vx_b, OP_SSS_B, H1, H1, DO_NMSUB)
>  RVVCALL(OPIVX3, vnmsub_vx_h, OP_SSS_H, H2, H2, DO_NMSUB)
>  RVVCALL(OPIVX3, vnmsub_vx_w, OP_SSS_W, H4, H4, DO_NMSUB)
>  RVVCALL(OPIVX3, vnmsub_vx_d, OP_SSS_D, H8, H8, DO_NMSUB)
> -GEN_VEXT_VX(vmacc_vx_b)
> -GEN_VEXT_VX(vmacc_vx_h)
> -GEN_VEXT_VX(vmacc_vx_w)
> -GEN_VEXT_VX(vmacc_vx_d)
> -GEN_VEXT_VX(vnmsac_vx_b)
> -GEN_VEXT_VX(vnmsac_vx_h)
> -GEN_VEXT_VX(vnmsac_vx_w)
> -GEN_VEXT_VX(vnmsac_vx_d)
> -GEN_VEXT_VX(vmadd_vx_b)
> -GEN_VEXT_VX(vmadd_vx_h)
> -GEN_VEXT_VX(vmadd_vx_w)
> -GEN_VEXT_VX(vmadd_vx_d)
> -GEN_VEXT_VX(vnmsub_vx_b)
> -GEN_VEXT_VX(vnmsub_vx_h)
> -GEN_VEXT_VX(vnmsub_vx_w)
> -GEN_VEXT_VX(vnmsub_vx_d)
> +GEN_VEXT_VX(vmacc_vx_b, 1)
> +GEN_VEXT_VX(vmacc_vx_h, 2)
> +GEN_VEXT_VX(vmacc_vx_w, 4)
> +GEN_VEXT_VX(vmacc_vx_d, 8)
> +GEN_VEXT_VX(vnmsac_vx_b, 1)
> +GEN_VEXT_VX(vnmsac_vx_h, 2)
> +GEN_VEXT_VX(vnmsac_vx_w, 4)
> +GEN_VEXT_VX(vnmsac_vx_d, 8)
> +GEN_VEXT_VX(vmadd_vx_b, 1)
> +GEN_VEXT_VX(vmadd_vx_h, 2)
> +GEN_VEXT_VX(vmadd_vx_w, 4)
> +GEN_VEXT_VX(vmadd_vx_d, 8)
> +GEN_VEXT_VX(vnmsub_vx_b, 1)
> +GEN_VEXT_VX(vnmsub_vx_h, 2)
> +GEN_VEXT_VX(vnmsub_vx_w, 4)
> +GEN_VEXT_VX(vnmsub_vx_d, 8)
>
>  /* Vector Widening Integer Multiply-Add Instructions */
>  RVVCALL(OPIVV3, vwmaccu_vv_b, WOP_UUU_B, H2, H1, H1, DO_MACC)
> @@ -1885,18 +1923,18 @@ RVVCALL(OPIVX3, vwmaccsu_vx_w, WOP_SSU_W, H8, H4, DO_MACC)
>  RVVCALL(OPIVX3, vwmaccus_vx_b, WOP_SUS_B, H2, H1, DO_MACC)
>  RVVCALL(OPIVX3, vwmaccus_vx_h, WOP_SUS_H, H4, H2, DO_MACC)
>  RVVCALL(OPIVX3, vwmaccus_vx_w, WOP_SUS_W, H8, H4, DO_MACC)
> -GEN_VEXT_VX(vwmaccu_vx_b)
> -GEN_VEXT_VX(vwmaccu_vx_h)
> -GEN_VEXT_VX(vwmaccu_vx_w)
> -GEN_VEXT_VX(vwmacc_vx_b)
> -GEN_VEXT_VX(vwmacc_vx_h)
> -GEN_VEXT_VX(vwmacc_vx_w)
> -GEN_VEXT_VX(vwmaccsu_vx_b)
> -GEN_VEXT_VX(vwmaccsu_vx_h)
> -GEN_VEXT_VX(vwmaccsu_vx_w)
> -GEN_VEXT_VX(vwmaccus_vx_b)
> -GEN_VEXT_VX(vwmaccus_vx_h)
> -GEN_VEXT_VX(vwmaccus_vx_w)
> +GEN_VEXT_VX(vwmaccu_vx_b, 2)
> +GEN_VEXT_VX(vwmaccu_vx_h, 4)
> +GEN_VEXT_VX(vwmaccu_vx_w, 8)
> +GEN_VEXT_VX(vwmacc_vx_b, 2)
> +GEN_VEXT_VX(vwmacc_vx_h, 4)
> +GEN_VEXT_VX(vwmacc_vx_w, 8)
> +GEN_VEXT_VX(vwmaccsu_vx_b, 2)
> +GEN_VEXT_VX(vwmaccsu_vx_h, 4)
> +GEN_VEXT_VX(vwmaccsu_vx_w, 8)
> +GEN_VEXT_VX(vwmaccus_vx_b, 2)
> +GEN_VEXT_VX(vwmaccus_vx_h, 4)
> +GEN_VEXT_VX(vwmaccus_vx_w, 8)
>
>  /* Vector Integer Merge and Move Instructions */
>  #define GEN_VEXT_VMV_VV(NAME, ETYPE, H)                              \
> --
> 2.34.2
>
>

