Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noLaQ-0004ZE-FY
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 04:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noLaK-0004Ue-Gh; Tue, 10 May 2022 04:51:12 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:37663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noLaH-0003EN-PY; Tue, 10 May 2022 04:51:12 -0400
Received: by mail-il1-x12d.google.com with SMTP id y11so10924285ilp.4;
 Tue, 10 May 2022 01:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rECw/b+7MQXm2b/BjTyKpqtVpnp2MHK3xhSAShH+AcQ=;
 b=DqgmRPVREiW7gCQ2f/G2HDkRB17qwW/wX0WWs2lRVd0Vcm+yzOJ7vTEUeYFTe5U2Co
 nkfMZD9G7o2wK1gdNCFbOeqhLh0bHS/xWI/KA2FC4nJY+rBPnxlWCdUcBjsjpgEpPZL4
 JWgwb7aPPxl7XYo7iv8REkqis/tNIEk1OwpPNx5IPULHLXtFq7VhR0WbGcHwc60fGnRj
 /t5NhlV/2DMl90V3YPlKyExuNlx/ywTkXgIxi7qdBzJbodiInjqA7d+GJFjBY8fxUxn5
 Z8yh7d4T+N7uDslDTvyJDlYJFDHloqopCtpok1YVwpnrXdE8JczK7j94gvY4i0xBA+pv
 EkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rECw/b+7MQXm2b/BjTyKpqtVpnp2MHK3xhSAShH+AcQ=;
 b=ngKoI0cPKMfeZma/yOUeYuGUay4fRTdb+BUXsx1MUgRj6q3Wrmco/gqBxeRCjDPxKO
 xEf2tJOC51UbgGo1bjOhHaDwn8QU/skTOfZCmr71CKIGBwqjU+AMxKWc/ATt0xuO+IsM
 XbjsFrEU87tURKZwn8ynO7Q3KJwwmn4ZOcOfBVdjRy79lHVZcXxAbS808NRrY4R8lC6f
 KqqqgtF4Kw6x2pT99oGC2kfMXYnRuGnmKZ9OZCN3YDadezUtq1xxuiQYgrznn7Mj1hXf
 32wDxNGFo3F1SGx2w4QDqnbGcAFp0xWbQ0Ngy6l1bOZB2d//G2ViqK5KAopSFr8tvayT
 BCPw==
X-Gm-Message-State: AOAM532FHyT/F0s0OF29a+TKKx0tA1ZVGN/P55+ri4hvNCAB3OyLBWfr
 whVutgFB6/yJig62J66e0dRo9/eNhJY4lFoGznw=
X-Google-Smtp-Source: ABdhPJwb4b2DgZ0lwGj+UeEd4gPWRCHrXzAUGmFjmDx83JN4rMu9xqAER05mwL120ULovVUuB+3IzwYv75+4ulj00kI=
X-Received: by 2002:a05:6e02:18cf:b0:2cf:51d1:f694 with SMTP id
 s15-20020a056e0218cf00b002cf51d1f694mr8902233ilu.310.1652172668078; Tue, 10
 May 2022 01:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <165156202959.27941.9731161369415852149-0@git.sr.ht>
 <165156202959.27941.9731161369415852149-4@git.sr.ht>
In-Reply-To: <165156202959.27941.9731161369415852149-4@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 May 2022 10:50:41 +0200
Message-ID: <CAKmqyKNMZCkrwC0KgpM0n3taE3LzJEWhoEdv94RWwqLgiVDAXA@mail.gmail.com>
Subject: Re: [PATCH qemu v14 04/15] target/riscv: rvv: Add tail agnostic for
 vv instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Tue, 10 May 2022 08:51:13 -0000

On Tue, May 3, 2022 at 9:33 AM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> According to v-spec, tail agnostic behavior can be either kept as
> undisturbed or set elements' bits to all 1s. To distinguish the
> difference of tail policies, QEMU should be able to simulate the tail
> agnostic behavior as "set tail elements' bits to all 1s".
>
> There are multiple possibility for agnostic elements according to
> v-spec. The main intent of this patch-set tries to add option that
> can distinguish between tail policies. Setting agnostic elements to
> all 1s allows QEMU to express this.
>
> This is the first commit regarding the optional tail agnostic
> behavior. Follow-up commits will add this optional behavior
> for all rvv instructions.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h                      |   2 +
>  target/riscv/cpu_helper.c               |   2 +
>  target/riscv/insn_trans/trans_rvv.c.inc |  11 +
>  target/riscv/internals.h                |   5 +-
>  target/riscv/translate.c                |   2 +
>  target/riscv/vector_helper.c            | 295 +++++++++++++-----------
>  6 files changed, 186 insertions(+), 131 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c069fe85fa..8c4a79b5a0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -369,6 +369,7 @@ struct RISCVCPUConfig {
>      bool ext_zhinxmin;
>      bool ext_zve32f;
>      bool ext_zve64f;
> +    bool rvv_ta_all_1s;
>
>      /* Vendor-specific custom extensions */
>      bool ext_XVentanaCondOps;
> @@ -516,6 +517,7 @@ FIELD(TB_FLAGS, XL, 20, 2)
>  /* If PointerMasking should be applied */
>  FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
>  FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
> +FIELD(TB_FLAGS, VTA, 24, 1)
>
>  #ifdef TARGET_RISCV32
>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 1c60fb2e80..2941c88c31 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -65,6 +65,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>          flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
>                      FIELD_EX64(env->vtype, VTYPE, VLMUL));
>          flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
> +        flags = FIELD_DP32(flags, TB_FLAGS, VTA,
> +                    FIELD_EX64(env->vtype, VTYPE, VTA));
>      } else {
>          flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>      }
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 57953923d5..cc80bf00ff 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1223,6 +1223,16 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
>      tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
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
>          gvec_fn(s->sew, vreg_ofs(s, a->rd),
>                  vreg_ofs(s, a->rs2), vreg_ofs(s, a->rs1),
>                  MAXSZ(s), MAXSZ(s));
> @@ -1231,6 +1241,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
>
>          data = FIELD_DP32(data, VDATA, VM, a->vm);
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
>                             cpu_env, s->cfg_ptr->vlen / 8,
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index dbb322bfa7..512c6c30cf 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -24,8 +24,9 @@
>  /* share data between vector helpers and decode code */
>  FIELD(VDATA, VM, 0, 1)
>  FIELD(VDATA, LMUL, 1, 3)
> -FIELD(VDATA, NF, 4, 4)
> -FIELD(VDATA, WD, 4, 1)
> +FIELD(VDATA, VTA, 4, 1)
> +FIELD(VDATA, NF, 5, 4)
> +FIELD(VDATA, WD, 5, 1)
>
>  /* float point classify helpers */
>  target_ulong fclass_h(uint64_t frs1);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index fac998a6b5..7775dade26 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -94,6 +94,7 @@ typedef struct DisasContext {
>       */
>      int8_t lmul;
>      uint8_t sew;
> +    uint8_t vta;
>      target_ulong vstart;
>      bool vl_eq_vlmax;
>      uint8_t ntemp;
> @@ -1083,6 +1084,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
>      ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
>      ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
> +    ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
>      ctx->vstart = env->vstart;
>      ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>      ctx->misa_mxl_max = env->misa_mxl_max;
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index d0452a7756..79d4fca091 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -122,6 +122,11 @@ static inline int32_t vext_lmul(uint32_t desc)
>      return sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, 3);
>  }
>
> +static inline uint32_t vext_vta(uint32_t desc)
> +{
> +    return FIELD_EX32(simd_data(desc), VDATA, VTA);
> +}
> +
>  /*
>   * Get the maximum number of elements can be operated.
>   *
> @@ -140,6 +145,20 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
>      return scale < 0 ? vlenb >> -scale : vlenb << scale;
>  }
>
> +/*
> + * Get number of total elements, including prestart, body and tail elements.
> + * Note that when LMUL < 1, the tail includes the elements past VLMAX that
> + * are held in the same vector register.
> + */
> +static inline uint32_t vext_get_total_elems(CPURISCVState *env, uint32_t desc, uint32_t esz)
> +{
> +    uint32_t vlenb = simd_maxsz(desc);
> +    uint32_t sew = 1 << FIELD_EX64(env->vtype, VTYPE, VSEW);
> +    int8_t emul = ctzl(esz) - ctzl(sew) + vext_lmul(desc) < 0 ? 0 :
> +                  ctzl(esz) - ctzl(sew) + vext_lmul(desc);
> +    return (vlenb << emul) / esz;
> +}
> +
>  static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
>  {
>      return (addr & env->cur_pmmask) | env->cur_pmbase;
> @@ -172,6 +191,20 @@ static void probe_pages(CPURISCVState *env, target_ulong addr,
>      }
>  }
>
> +/* set agnostic elements to 1s */
> +static void vext_set_elems_1s(void *base, uint32_t is_agnostic, uint32_t cnt,
> +                              uint32_t tot)
> +{
> +    if (is_agnostic == 0) {
> +        /* policy undisturbed */
> +        return;
> +    }
> +    if (tot - cnt == 0) {
> +        return ;
> +    }
> +    memset(base + cnt, -1, tot - cnt);
> +}
> +
>  static inline void vext_set_elem_mask(void *v0, int index,
>                                        uint8_t value)
>  {
> @@ -710,10 +743,12 @@ RVVCALL(OPIVV2, vsub_vv_d, OP_SSS_D, H8, H8, H8, DO_SUB)
>
>  static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
>                         CPURISCVState *env, uint32_t desc,
> -                       opivv2_fn *fn)
> +                       opivv2_fn *fn, uint32_t esz)
>  {
>      uint32_t vm = vext_vm(desc);
>      uint32_t vl = env->vl;
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vta = vext_vta(desc);
>      uint32_t i;
>
>      for (i = env->vstart; i < vl; i++) {
> @@ -723,26 +758,28 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
>          fn(vd, vs1, vs2, i);
>      }
>      env->vstart = 0;
> +    /* set tail elements to 1s */
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);
>  }
>
>  /* generate the helpers for OPIVV */
> -#define GEN_VEXT_VV(NAME)                                 \
> +#define GEN_VEXT_VV(NAME, ESZ)                            \
>  void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>                    void *vs2, CPURISCVState *env,          \
>                    uint32_t desc)                          \
>  {                                                         \
>      do_vext_vv(vd, v0, vs1, vs2, env, desc,               \
> -               do_##NAME);                                \
> +               do_##NAME, ESZ);                           \
>  }
>
> -GEN_VEXT_VV(vadd_vv_b)
> -GEN_VEXT_VV(vadd_vv_h)
> -GEN_VEXT_VV(vadd_vv_w)
> -GEN_VEXT_VV(vadd_vv_d)
> -GEN_VEXT_VV(vsub_vv_b)
> -GEN_VEXT_VV(vsub_vv_h)
> -GEN_VEXT_VV(vsub_vv_w)
> -GEN_VEXT_VV(vsub_vv_d)
> +GEN_VEXT_VV(vadd_vv_b, 1)
> +GEN_VEXT_VV(vadd_vv_h, 2)
> +GEN_VEXT_VV(vadd_vv_w, 4)
> +GEN_VEXT_VV(vadd_vv_d, 8)
> +GEN_VEXT_VV(vsub_vv_b, 1)
> +GEN_VEXT_VV(vsub_vv_h, 2)
> +GEN_VEXT_VV(vsub_vv_w, 4)
> +GEN_VEXT_VV(vsub_vv_d, 8)
>
>  typedef void opivx2_fn(void *vd, target_long s1, void *vs2, int i);
>
> @@ -887,30 +924,30 @@ RVVCALL(OPIVV2, vwadd_wv_w, WOP_WSSS_W, H8, H4, H4, DO_ADD)
>  RVVCALL(OPIVV2, vwsub_wv_b, WOP_WSSS_B, H2, H1, H1, DO_SUB)
>  RVVCALL(OPIVV2, vwsub_wv_h, WOP_WSSS_H, H4, H2, H2, DO_SUB)
>  RVVCALL(OPIVV2, vwsub_wv_w, WOP_WSSS_W, H8, H4, H4, DO_SUB)
> -GEN_VEXT_VV(vwaddu_vv_b)
> -GEN_VEXT_VV(vwaddu_vv_h)
> -GEN_VEXT_VV(vwaddu_vv_w)
> -GEN_VEXT_VV(vwsubu_vv_b)
> -GEN_VEXT_VV(vwsubu_vv_h)
> -GEN_VEXT_VV(vwsubu_vv_w)
> -GEN_VEXT_VV(vwadd_vv_b)
> -GEN_VEXT_VV(vwadd_vv_h)
> -GEN_VEXT_VV(vwadd_vv_w)
> -GEN_VEXT_VV(vwsub_vv_b)
> -GEN_VEXT_VV(vwsub_vv_h)
> -GEN_VEXT_VV(vwsub_vv_w)
> -GEN_VEXT_VV(vwaddu_wv_b)
> -GEN_VEXT_VV(vwaddu_wv_h)
> -GEN_VEXT_VV(vwaddu_wv_w)
> -GEN_VEXT_VV(vwsubu_wv_b)
> -GEN_VEXT_VV(vwsubu_wv_h)
> -GEN_VEXT_VV(vwsubu_wv_w)
> -GEN_VEXT_VV(vwadd_wv_b)
> -GEN_VEXT_VV(vwadd_wv_h)
> -GEN_VEXT_VV(vwadd_wv_w)
> -GEN_VEXT_VV(vwsub_wv_b)
> -GEN_VEXT_VV(vwsub_wv_h)
> -GEN_VEXT_VV(vwsub_wv_w)
> +GEN_VEXT_VV(vwaddu_vv_b, 2)
> +GEN_VEXT_VV(vwaddu_vv_h, 4)
> +GEN_VEXT_VV(vwaddu_vv_w, 8)
> +GEN_VEXT_VV(vwsubu_vv_b, 2)
> +GEN_VEXT_VV(vwsubu_vv_h, 4)
> +GEN_VEXT_VV(vwsubu_vv_w, 8)
> +GEN_VEXT_VV(vwadd_vv_b, 2)
> +GEN_VEXT_VV(vwadd_vv_h, 4)
> +GEN_VEXT_VV(vwadd_vv_w, 8)
> +GEN_VEXT_VV(vwsub_vv_b, 2)
> +GEN_VEXT_VV(vwsub_vv_h, 4)
> +GEN_VEXT_VV(vwsub_vv_w, 8)
> +GEN_VEXT_VV(vwaddu_wv_b, 2)
> +GEN_VEXT_VV(vwaddu_wv_h, 4)
> +GEN_VEXT_VV(vwaddu_wv_w, 8)
> +GEN_VEXT_VV(vwsubu_wv_b, 2)
> +GEN_VEXT_VV(vwsubu_wv_h, 4)
> +GEN_VEXT_VV(vwsubu_wv_w, 8)
> +GEN_VEXT_VV(vwadd_wv_b, 2)
> +GEN_VEXT_VV(vwadd_wv_h, 4)
> +GEN_VEXT_VV(vwadd_wv_w, 8)
> +GEN_VEXT_VV(vwsub_wv_b, 2)
> +GEN_VEXT_VV(vwsub_wv_h, 4)
> +GEN_VEXT_VV(vwsub_wv_w, 8)
>
>  RVVCALL(OPIVX2, vwaddu_vx_b, WOP_UUU_B, H2, H1, DO_ADD)
>  RVVCALL(OPIVX2, vwaddu_vx_h, WOP_UUU_H, H4, H2, DO_ADD)
> @@ -1089,18 +1126,18 @@ RVVCALL(OPIVV2, vxor_vv_b, OP_SSS_B, H1, H1, H1, DO_XOR)
>  RVVCALL(OPIVV2, vxor_vv_h, OP_SSS_H, H2, H2, H2, DO_XOR)
>  RVVCALL(OPIVV2, vxor_vv_w, OP_SSS_W, H4, H4, H4, DO_XOR)
>  RVVCALL(OPIVV2, vxor_vv_d, OP_SSS_D, H8, H8, H8, DO_XOR)
> -GEN_VEXT_VV(vand_vv_b)
> -GEN_VEXT_VV(vand_vv_h)
> -GEN_VEXT_VV(vand_vv_w)
> -GEN_VEXT_VV(vand_vv_d)
> -GEN_VEXT_VV(vor_vv_b)
> -GEN_VEXT_VV(vor_vv_h)
> -GEN_VEXT_VV(vor_vv_w)
> -GEN_VEXT_VV(vor_vv_d)
> -GEN_VEXT_VV(vxor_vv_b)
> -GEN_VEXT_VV(vxor_vv_h)
> -GEN_VEXT_VV(vxor_vv_w)
> -GEN_VEXT_VV(vxor_vv_d)
> +GEN_VEXT_VV(vand_vv_b, 1)
> +GEN_VEXT_VV(vand_vv_h, 2)
> +GEN_VEXT_VV(vand_vv_w, 4)
> +GEN_VEXT_VV(vand_vv_d, 8)
> +GEN_VEXT_VV(vor_vv_b, 1)
> +GEN_VEXT_VV(vor_vv_h, 2)
> +GEN_VEXT_VV(vor_vv_w, 4)
> +GEN_VEXT_VV(vor_vv_d, 8)
> +GEN_VEXT_VV(vxor_vv_b, 1)
> +GEN_VEXT_VV(vxor_vv_h, 2)
> +GEN_VEXT_VV(vxor_vv_w, 4)
> +GEN_VEXT_VV(vxor_vv_d, 8)
>
>  RVVCALL(OPIVX2, vand_vx_b, OP_SSS_B, H1, H1, DO_AND)
>  RVVCALL(OPIVX2, vand_vx_h, OP_SSS_H, H2, H2, DO_AND)
> @@ -1346,22 +1383,22 @@ RVVCALL(OPIVV2, vmax_vv_b, OP_SSS_B, H1, H1, H1, DO_MAX)
>  RVVCALL(OPIVV2, vmax_vv_h, OP_SSS_H, H2, H2, H2, DO_MAX)
>  RVVCALL(OPIVV2, vmax_vv_w, OP_SSS_W, H4, H4, H4, DO_MAX)
>  RVVCALL(OPIVV2, vmax_vv_d, OP_SSS_D, H8, H8, H8, DO_MAX)
> -GEN_VEXT_VV(vminu_vv_b)
> -GEN_VEXT_VV(vminu_vv_h)
> -GEN_VEXT_VV(vminu_vv_w)
> -GEN_VEXT_VV(vminu_vv_d)
> -GEN_VEXT_VV(vmin_vv_b)
> -GEN_VEXT_VV(vmin_vv_h)
> -GEN_VEXT_VV(vmin_vv_w)
> -GEN_VEXT_VV(vmin_vv_d)
> -GEN_VEXT_VV(vmaxu_vv_b)
> -GEN_VEXT_VV(vmaxu_vv_h)
> -GEN_VEXT_VV(vmaxu_vv_w)
> -GEN_VEXT_VV(vmaxu_vv_d)
> -GEN_VEXT_VV(vmax_vv_b)
> -GEN_VEXT_VV(vmax_vv_h)
> -GEN_VEXT_VV(vmax_vv_w)
> -GEN_VEXT_VV(vmax_vv_d)
> +GEN_VEXT_VV(vminu_vv_b, 1)
> +GEN_VEXT_VV(vminu_vv_h, 2)
> +GEN_VEXT_VV(vminu_vv_w, 4)
> +GEN_VEXT_VV(vminu_vv_d, 8)
> +GEN_VEXT_VV(vmin_vv_b, 1)
> +GEN_VEXT_VV(vmin_vv_h, 2)
> +GEN_VEXT_VV(vmin_vv_w, 4)
> +GEN_VEXT_VV(vmin_vv_d, 8)
> +GEN_VEXT_VV(vmaxu_vv_b, 1)
> +GEN_VEXT_VV(vmaxu_vv_h, 2)
> +GEN_VEXT_VV(vmaxu_vv_w, 4)
> +GEN_VEXT_VV(vmaxu_vv_d, 8)
> +GEN_VEXT_VV(vmax_vv_b, 1)
> +GEN_VEXT_VV(vmax_vv_h, 2)
> +GEN_VEXT_VV(vmax_vv_w, 4)
> +GEN_VEXT_VV(vmax_vv_d, 8)
>
>  RVVCALL(OPIVX2, vminu_vx_b, OP_UUU_B, H1, H1, DO_MIN)
>  RVVCALL(OPIVX2, vminu_vx_h, OP_UUU_H, H2, H2, DO_MIN)
> @@ -1402,10 +1439,10 @@ RVVCALL(OPIVV2, vmul_vv_b, OP_SSS_B, H1, H1, H1, DO_MUL)
>  RVVCALL(OPIVV2, vmul_vv_h, OP_SSS_H, H2, H2, H2, DO_MUL)
>  RVVCALL(OPIVV2, vmul_vv_w, OP_SSS_W, H4, H4, H4, DO_MUL)
>  RVVCALL(OPIVV2, vmul_vv_d, OP_SSS_D, H8, H8, H8, DO_MUL)
> -GEN_VEXT_VV(vmul_vv_b)
> -GEN_VEXT_VV(vmul_vv_h)
> -GEN_VEXT_VV(vmul_vv_w)
> -GEN_VEXT_VV(vmul_vv_d)
> +GEN_VEXT_VV(vmul_vv_b, 1)
> +GEN_VEXT_VV(vmul_vv_h, 2)
> +GEN_VEXT_VV(vmul_vv_w, 4)
> +GEN_VEXT_VV(vmul_vv_d, 8)
>
>  static int8_t do_mulh_b(int8_t s2, int8_t s1)
>  {
> @@ -1509,18 +1546,18 @@ RVVCALL(OPIVV2, vmulhsu_vv_b, OP_SUS_B, H1, H1, H1, do_mulhsu_b)
>  RVVCALL(OPIVV2, vmulhsu_vv_h, OP_SUS_H, H2, H2, H2, do_mulhsu_h)
>  RVVCALL(OPIVV2, vmulhsu_vv_w, OP_SUS_W, H4, H4, H4, do_mulhsu_w)
>  RVVCALL(OPIVV2, vmulhsu_vv_d, OP_SUS_D, H8, H8, H8, do_mulhsu_d)
> -GEN_VEXT_VV(vmulh_vv_b)
> -GEN_VEXT_VV(vmulh_vv_h)
> -GEN_VEXT_VV(vmulh_vv_w)
> -GEN_VEXT_VV(vmulh_vv_d)
> -GEN_VEXT_VV(vmulhu_vv_b)
> -GEN_VEXT_VV(vmulhu_vv_h)
> -GEN_VEXT_VV(vmulhu_vv_w)
> -GEN_VEXT_VV(vmulhu_vv_d)
> -GEN_VEXT_VV(vmulhsu_vv_b)
> -GEN_VEXT_VV(vmulhsu_vv_h)
> -GEN_VEXT_VV(vmulhsu_vv_w)
> -GEN_VEXT_VV(vmulhsu_vv_d)
> +GEN_VEXT_VV(vmulh_vv_b, 1)
> +GEN_VEXT_VV(vmulh_vv_h, 2)
> +GEN_VEXT_VV(vmulh_vv_w, 4)
> +GEN_VEXT_VV(vmulh_vv_d, 8)
> +GEN_VEXT_VV(vmulhu_vv_b, 1)
> +GEN_VEXT_VV(vmulhu_vv_h, 2)
> +GEN_VEXT_VV(vmulhu_vv_w, 4)
> +GEN_VEXT_VV(vmulhu_vv_d, 8)
> +GEN_VEXT_VV(vmulhsu_vv_b, 1)
> +GEN_VEXT_VV(vmulhsu_vv_h, 2)
> +GEN_VEXT_VV(vmulhsu_vv_w, 4)
> +GEN_VEXT_VV(vmulhsu_vv_d, 8)
>
>  RVVCALL(OPIVX2, vmul_vx_b, OP_SSS_B, H1, H1, DO_MUL)
>  RVVCALL(OPIVX2, vmul_vx_h, OP_SSS_H, H2, H2, DO_MUL)
> @@ -1579,22 +1616,22 @@ RVVCALL(OPIVV2, vrem_vv_b, OP_SSS_B, H1, H1, H1, DO_REM)
>  RVVCALL(OPIVV2, vrem_vv_h, OP_SSS_H, H2, H2, H2, DO_REM)
>  RVVCALL(OPIVV2, vrem_vv_w, OP_SSS_W, H4, H4, H4, DO_REM)
>  RVVCALL(OPIVV2, vrem_vv_d, OP_SSS_D, H8, H8, H8, DO_REM)
> -GEN_VEXT_VV(vdivu_vv_b)
> -GEN_VEXT_VV(vdivu_vv_h)
> -GEN_VEXT_VV(vdivu_vv_w)
> -GEN_VEXT_VV(vdivu_vv_d)
> -GEN_VEXT_VV(vdiv_vv_b)
> -GEN_VEXT_VV(vdiv_vv_h)
> -GEN_VEXT_VV(vdiv_vv_w)
> -GEN_VEXT_VV(vdiv_vv_d)
> -GEN_VEXT_VV(vremu_vv_b)
> -GEN_VEXT_VV(vremu_vv_h)
> -GEN_VEXT_VV(vremu_vv_w)
> -GEN_VEXT_VV(vremu_vv_d)
> -GEN_VEXT_VV(vrem_vv_b)
> -GEN_VEXT_VV(vrem_vv_h)
> -GEN_VEXT_VV(vrem_vv_w)
> -GEN_VEXT_VV(vrem_vv_d)
> +GEN_VEXT_VV(vdivu_vv_b, 1)
> +GEN_VEXT_VV(vdivu_vv_h, 2)
> +GEN_VEXT_VV(vdivu_vv_w, 4)
> +GEN_VEXT_VV(vdivu_vv_d, 8)
> +GEN_VEXT_VV(vdiv_vv_b, 1)
> +GEN_VEXT_VV(vdiv_vv_h, 2)
> +GEN_VEXT_VV(vdiv_vv_w, 4)
> +GEN_VEXT_VV(vdiv_vv_d, 8)
> +GEN_VEXT_VV(vremu_vv_b, 1)
> +GEN_VEXT_VV(vremu_vv_h, 2)
> +GEN_VEXT_VV(vremu_vv_w, 4)
> +GEN_VEXT_VV(vremu_vv_d, 8)
> +GEN_VEXT_VV(vrem_vv_b, 1)
> +GEN_VEXT_VV(vrem_vv_h, 2)
> +GEN_VEXT_VV(vrem_vv_w, 4)
> +GEN_VEXT_VV(vrem_vv_d, 8)
>
>  RVVCALL(OPIVX2, vdivu_vx_b, OP_UUU_B, H1, H1, DO_DIVU)
>  RVVCALL(OPIVX2, vdivu_vx_h, OP_UUU_H, H2, H2, DO_DIVU)
> @@ -1639,15 +1676,15 @@ RVVCALL(OPIVV2, vwmulu_vv_w, WOP_UUU_W, H8, H4, H4, DO_MUL)
>  RVVCALL(OPIVV2, vwmulsu_vv_b, WOP_SUS_B, H2, H1, H1, DO_MUL)
>  RVVCALL(OPIVV2, vwmulsu_vv_h, WOP_SUS_H, H4, H2, H2, DO_MUL)
>  RVVCALL(OPIVV2, vwmulsu_vv_w, WOP_SUS_W, H8, H4, H4, DO_MUL)
> -GEN_VEXT_VV(vwmul_vv_b)
> -GEN_VEXT_VV(vwmul_vv_h)
> -GEN_VEXT_VV(vwmul_vv_w)
> -GEN_VEXT_VV(vwmulu_vv_b)
> -GEN_VEXT_VV(vwmulu_vv_h)
> -GEN_VEXT_VV(vwmulu_vv_w)
> -GEN_VEXT_VV(vwmulsu_vv_b)
> -GEN_VEXT_VV(vwmulsu_vv_h)
> -GEN_VEXT_VV(vwmulsu_vv_w)
> +GEN_VEXT_VV(vwmul_vv_b, 2)
> +GEN_VEXT_VV(vwmul_vv_h, 4)
> +GEN_VEXT_VV(vwmul_vv_w, 8)
> +GEN_VEXT_VV(vwmulu_vv_b, 2)
> +GEN_VEXT_VV(vwmulu_vv_h, 4)
> +GEN_VEXT_VV(vwmulu_vv_w, 8)
> +GEN_VEXT_VV(vwmulsu_vv_b, 2)
> +GEN_VEXT_VV(vwmulsu_vv_h, 4)
> +GEN_VEXT_VV(vwmulsu_vv_w, 8)
>
>  RVVCALL(OPIVX2, vwmul_vx_b, WOP_SSS_B, H2, H1, DO_MUL)
>  RVVCALL(OPIVX2, vwmul_vx_h, WOP_SSS_H, H4, H2, DO_MUL)
> @@ -1698,22 +1735,22 @@ RVVCALL(OPIVV3, vnmsub_vv_b, OP_SSS_B, H1, H1, H1, DO_NMSUB)
>  RVVCALL(OPIVV3, vnmsub_vv_h, OP_SSS_H, H2, H2, H2, DO_NMSUB)
>  RVVCALL(OPIVV3, vnmsub_vv_w, OP_SSS_W, H4, H4, H4, DO_NMSUB)
>  RVVCALL(OPIVV3, vnmsub_vv_d, OP_SSS_D, H8, H8, H8, DO_NMSUB)
> -GEN_VEXT_VV(vmacc_vv_b)
> -GEN_VEXT_VV(vmacc_vv_h)
> -GEN_VEXT_VV(vmacc_vv_w)
> -GEN_VEXT_VV(vmacc_vv_d)
> -GEN_VEXT_VV(vnmsac_vv_b)
> -GEN_VEXT_VV(vnmsac_vv_h)
> -GEN_VEXT_VV(vnmsac_vv_w)
> -GEN_VEXT_VV(vnmsac_vv_d)
> -GEN_VEXT_VV(vmadd_vv_b)
> -GEN_VEXT_VV(vmadd_vv_h)
> -GEN_VEXT_VV(vmadd_vv_w)
> -GEN_VEXT_VV(vmadd_vv_d)
> -GEN_VEXT_VV(vnmsub_vv_b)
> -GEN_VEXT_VV(vnmsub_vv_h)
> -GEN_VEXT_VV(vnmsub_vv_w)
> -GEN_VEXT_VV(vnmsub_vv_d)
> +GEN_VEXT_VV(vmacc_vv_b, 1)
> +GEN_VEXT_VV(vmacc_vv_h, 2)
> +GEN_VEXT_VV(vmacc_vv_w, 4)
> +GEN_VEXT_VV(vmacc_vv_d, 8)
> +GEN_VEXT_VV(vnmsac_vv_b, 1)
> +GEN_VEXT_VV(vnmsac_vv_h, 2)
> +GEN_VEXT_VV(vnmsac_vv_w, 4)
> +GEN_VEXT_VV(vnmsac_vv_d, 8)
> +GEN_VEXT_VV(vmadd_vv_b, 1)
> +GEN_VEXT_VV(vmadd_vv_h, 2)
> +GEN_VEXT_VV(vmadd_vv_w, 4)
> +GEN_VEXT_VV(vmadd_vv_d, 8)
> +GEN_VEXT_VV(vnmsub_vv_b, 1)
> +GEN_VEXT_VV(vnmsub_vv_h, 2)
> +GEN_VEXT_VV(vnmsub_vv_w, 4)
> +GEN_VEXT_VV(vnmsub_vv_d, 8)
>
>  #define OPIVX3(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)             \
>  static void do_##NAME(void *vd, target_long s1, void *vs2, int i)   \
> @@ -1766,15 +1803,15 @@ RVVCALL(OPIVV3, vwmacc_vv_w, WOP_SSS_W, H8, H4, H4, DO_MACC)
>  RVVCALL(OPIVV3, vwmaccsu_vv_b, WOP_SSU_B, H2, H1, H1, DO_MACC)
>  RVVCALL(OPIVV3, vwmaccsu_vv_h, WOP_SSU_H, H4, H2, H2, DO_MACC)
>  RVVCALL(OPIVV3, vwmaccsu_vv_w, WOP_SSU_W, H8, H4, H4, DO_MACC)
> -GEN_VEXT_VV(vwmaccu_vv_b)
> -GEN_VEXT_VV(vwmaccu_vv_h)
> -GEN_VEXT_VV(vwmaccu_vv_w)
> -GEN_VEXT_VV(vwmacc_vv_b)
> -GEN_VEXT_VV(vwmacc_vv_h)
> -GEN_VEXT_VV(vwmacc_vv_w)
> -GEN_VEXT_VV(vwmaccsu_vv_b)
> -GEN_VEXT_VV(vwmaccsu_vv_h)
> -GEN_VEXT_VV(vwmaccsu_vv_w)
> +GEN_VEXT_VV(vwmaccu_vv_b, 2)
> +GEN_VEXT_VV(vwmaccu_vv_h, 4)
> +GEN_VEXT_VV(vwmaccu_vv_w, 8)
> +GEN_VEXT_VV(vwmacc_vv_b, 2)
> +GEN_VEXT_VV(vwmacc_vv_h, 4)
> +GEN_VEXT_VV(vwmacc_vv_w, 8)
> +GEN_VEXT_VV(vwmaccsu_vv_b, 2)
> +GEN_VEXT_VV(vwmaccsu_vv_h, 4)
> +GEN_VEXT_VV(vwmaccsu_vv_w, 8)
>
>  RVVCALL(OPIVX3, vwmaccu_vx_b, WOP_UUU_B, H2, H1, DO_MACC)
>  RVVCALL(OPIVX3, vwmaccu_vx_h, WOP_UUU_H, H4, H2, DO_MACC)
> --
> 2.34.2
>
>

