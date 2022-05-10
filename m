Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noLjH-0003Lf-R5
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 05:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noLjF-0003HZ-EW; Tue, 10 May 2022 05:00:25 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:47074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noLjC-0004Hz-Sf; Tue, 10 May 2022 05:00:25 -0400
Received: by mail-io1-xd2e.google.com with SMTP id s23so6278254iog.13;
 Tue, 10 May 2022 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=byzuXSr6gTDC7xp7+03g9DX6xZRNrO8jlqAf5G02djs=;
 b=AVda4MeQGSCNfe3vIjzQ5Wj9LYtaFK01MZM4tCDP7wGQVkZI0nAaCIfarwe6TcAsCP
 dtZg3sYEhrc3JF600cTbiTIlVAvyw7wWBo0kXxyJGtGWe4Yfr0Ob2/gBb3zZqwxH0g77
 Dp0w21vsSsJUsLHTcldiYgeW/YJpKKBkKwC9tZ/jCedq8uUWZt+Ccb7Rh7Wshr9kgIYf
 pomk6+5+BMzAi3MZMKHaWy1MLeHG6prNoer7ikA/xY+4teWMTNynD2q+jdsXhoXntltq
 eWGoa74VnKI7in66APQH0uytK3bSgEYn3wfIBasVxsXnYqJY4G9d587VP72UCS8cMmLt
 d3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=byzuXSr6gTDC7xp7+03g9DX6xZRNrO8jlqAf5G02djs=;
 b=IKcee/JvDT78zTIPVRvXwisy9EcolE2VeI1tb8cvPyCVMHPDT3ROPdHW02t8PuTTFk
 qK5XFQeQ95jCpeoHYFsFDiO7xKqhR7p18fg4jITvVG5dyqkOfcI3V1KzWKgtET8hKTt1
 9ZGxWnoP1fglPgTAlqqQ/kRExW1op0qLRCiAqO+lTv47ui8JJ+NeO+8lAmSSzbmOHy6j
 8nFi39Clj1hE+bA6IGU0AqBeL59tAeqz/kQwQxEwUGUkW0BhaKF11txtRkx++VIgnTW/
 SVx7YpR1jIGh+QwQiZ5m/N0gRP7wwUiu94PicjZQKYeWoPwMun/Riga0kOVMBpYG55PS
 7jVg==
X-Gm-Message-State: AOAM533nJYzgbBth7M7UT2HvfosFpLMJ1FQOjuAMvEjD/Q+xhw1GqZPO
 QZds6js8eaz9e0bV5l1vdTF0l5KeYZ4gGbAS2v0=
X-Google-Smtp-Source: ABdhPJyQqHvETi//S+Dob2xMIJwlXp8hefOSH0eRQetBv62hchF6YhwU3/xM8JPK+RmHV1KNF8/B1uCAKN/HtZg3TAA=
X-Received: by 2002:a02:6f56:0:b0:32a:ff25:1fe3 with SMTP id
 b22-20020a026f56000000b0032aff251fe3mr9780881jae.21.1652173221078; Tue, 10
 May 2022 02:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <165156202959.27941.9731161369415852149-0@git.sr.ht>
 <165156202959.27941.9731161369415852149-5@git.sr.ht>
In-Reply-To: <165156202959.27941.9731161369415852149-5@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 May 2022 10:59:54 +0200
Message-ID: <CAKmqyKMCxJUWBBZDS7d95EcQsboS++7G_z9N8abfO6ro8B=Cdg@mail.gmail.com>
Subject: Re: [PATCH qemu v14 05/15] target/riscv: rvv: Add tail agnostic for
 vector load / store instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Tue, 10 May 2022 09:00:26 -0000

On Tue, May 3, 2022 at 9:24 AM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> Destination register of unit-stride mask load and store instructions are
> always written with a tail-agnostic policy.
>
> A vector segment load / store instruction may contain fractional lmul
> with nf * lmul > 1. The rest of the elements in the last register should
> be treated as tail elements.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 11 +++++
>  target/riscv/translate.c                |  2 +
>  target/riscv/vector_helper.c            | 60 +++++++++++++++++++++++++
>  3 files changed, 73 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index cc80bf00ff..99691f1b9f 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -711,6 +711,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>      return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>  }
>
> @@ -748,6 +749,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>      return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
>  }
>
> @@ -774,6 +776,8 @@ static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, uint8_t eew)
>      /* EMUL = 1, NFIELDS = 1 */
>      data = FIELD_DP32(data, VDATA, LMUL, 0);
>      data = FIELD_DP32(data, VDATA, NF, 1);
> +    /* Mask destination register are always tail-agnostic */
> +    data = FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
>      return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>  }
>
> @@ -791,6 +795,8 @@ static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, uint8_t eew)
>      /* EMUL = 1, NFIELDS = 1 */
>      data = FIELD_DP32(data, VDATA, LMUL, 0);
>      data = FIELD_DP32(data, VDATA, NF, 1);
> +    /* Mask destination register are always tail-agnostic */
> +    data = FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
>      return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
>  }
>
> @@ -862,6 +868,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>      return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>  }
>
> @@ -891,6 +898,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>      fn = fns[eew];
>      if (fn == NULL) {
>          return false;
> @@ -991,6 +999,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>      return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>  }
>
> @@ -1043,6 +1052,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>      return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
>  }
>
> @@ -1108,6 +1118,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
>      data = FIELD_DP32(data, VDATA, LMUL, emul);
>      data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>      return ldff_trans(a->rd, a->rs1, data, fn, s);
>  }
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 7775dade26..58cbb6ded3 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -95,6 +95,7 @@ typedef struct DisasContext {
>      int8_t lmul;
>      uint8_t sew;
>      uint8_t vta;
> +    bool cfg_vta_all_1s;
>      target_ulong vstart;
>      bool vl_eq_vlmax;
>      uint8_t ntemp;
> @@ -1085,6 +1086,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
>      ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
>      ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
> +    ctx->cfg_vta_all_1s = cpu->cfg.rvv_ta_all_1s;
>      ctx->vstart = env->vstart;
>      ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>      ctx->misa_mxl_max = env->misa_mxl_max;
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 79d4fca091..f1a0b4ced7 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -269,6 +269,9 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>      uint32_t i, k;
>      uint32_t nf = vext_nf(desc);
>      uint32_t max_elems = vext_max_elems(desc, log2_esz);
> +    uint32_t esz = 1 << log2_esz;
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vta = vext_vta(desc);
>
>      for (i = env->vstart; i < env->vl; i++, env->vstart++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
> @@ -283,6 +286,18 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>          }
>      }
>      env->vstart = 0;
> +    /* set tail elements to 1s */
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> +                          (k * max_elems + max_elems) * esz);
> +    }
> +    if (nf * max_elems % total_elems != 0) {
> +        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +        uint32_t registers_used =
> +            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> +        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> +                          registers_used * vlenb);
> +    }
>  }
>
>  #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
> @@ -328,6 +343,9 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>      uint32_t i, k;
>      uint32_t nf = vext_nf(desc);
>      uint32_t max_elems = vext_max_elems(desc, log2_esz);
> +    uint32_t esz = 1 << log2_esz;
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vta = vext_vta(desc);
>
>      /* load bytes from guest memory */
>      for (i = env->vstart; i < evl; i++, env->vstart++) {
> @@ -339,6 +357,18 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>          }
>      }
>      env->vstart = 0;
> +    /* set tail elements to 1s */
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s(vd, vta, (k * max_elems + evl) * esz,
> +                          (k * max_elems + max_elems) * esz);
> +    }
> +    if (nf * max_elems % total_elems != 0) {
> +        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +        uint32_t registers_used =
> +            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> +        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> +                          registers_used * vlenb);
> +    }
>  }
>
>  /*
> @@ -438,6 +468,9 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>      uint32_t nf = vext_nf(desc);
>      uint32_t vm = vext_vm(desc);
>      uint32_t max_elems = vext_max_elems(desc, log2_esz);
> +    uint32_t esz = 1 << log2_esz;
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vta = vext_vta(desc);
>
>      /* load bytes from guest memory */
>      for (i = env->vstart; i < env->vl; i++, env->vstart++) {
> @@ -453,6 +486,18 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>          }
>      }
>      env->vstart = 0;
> +    /* set tail elements to 1s */
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> +                          (k * max_elems + max_elems) * esz);
> +    }
> +    if (nf * max_elems % total_elems != 0) {
> +        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +        uint32_t registers_used =
> +            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> +        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> +                          registers_used * vlenb);
> +    }
>  }
>
>  #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
> @@ -520,6 +565,9 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>      uint32_t nf = vext_nf(desc);
>      uint32_t vm = vext_vm(desc);
>      uint32_t max_elems = vext_max_elems(desc, log2_esz);
> +    uint32_t esz = 1 << log2_esz;
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vta = vext_vta(desc);
>      target_ulong addr, offset, remain;
>
>      /* probe every access*/
> @@ -575,6 +623,18 @@ ProbeSuccess:
>          }
>      }
>      env->vstart = 0;
> +    /* set tail elements to 1s */
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> +                          (k * max_elems + max_elems) * esz);
> +    }
> +    if (nf * max_elems % total_elems != 0) {
> +        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +        uint32_t registers_used =
> +            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> +        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> +                          registers_used * vlenb);
> +    }
>  }
>
>  #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
> --
> 2.34.2
>
>

