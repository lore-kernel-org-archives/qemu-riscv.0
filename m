Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEJl9-0005AA-AL
	for mharc-qemu-riscv@gnu.org; Wed, 20 Jul 2022 20:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJl8-00059u-BV; Wed, 20 Jul 2022 20:09:42 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJl6-0008Ev-EA; Wed, 20 Jul 2022 20:09:42 -0400
Received: by mail-pl1-x634.google.com with SMTP id y24so284057plh.7;
 Wed, 20 Jul 2022 17:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uZDqS92tsqp/Ex+z+wksUOSEUVDzaFm+3f02PmKOFSA=;
 b=XPq4vDGHbs3fhT2oahpOmLD0f0EcDGnbSpc3HcWL9FJaQlULZhKf2d0C2ifYI+PbmJ
 D5aLTeSs8YH70B8D90GA0Vz9lnJHGp1XN7hxua5GG3ig5dzIvH+NSXdHRACyRWHna4wf
 76ExkpjrissOrqrwk4sLgOzcDnaNU+1Ib+Myxo+9JCRAECHIn9Jmbwv/PZAsKiEPUHAF
 qoxwilkY/PzEGXEbaSNwavZNaagPNs67UCnr6xm2im+pEh4dNU1kkyfHrqCoNx7J9700
 JQ3MPyzxpCzm9SV+Eyq6TjiQ/BcLe3nE1cubSJ1LL6lYsRkfGBCjSeG7cBwdgq/xiFLK
 y11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uZDqS92tsqp/Ex+z+wksUOSEUVDzaFm+3f02PmKOFSA=;
 b=2lWI0E69/cc2QQCpFkVhSW/2F6g0HRsB0twC1E/qM0O6kbfkQj4eZa144VNYcXFlhl
 /pAJJqzUWDHTlFCeUjZVVTTukZ4qkbEeukTneEWq8VcFyWauZqb7auqbgPTyTWZAo/4n
 +c3i9cAot/i/7PeJf7WJ2y0n3ZPYnge+Z87MFfpQ8WDNnAJRPyOvX8VWVzWmJn3FFFHo
 4SWwG3udOKJjicZ+mk2oW8kWZneV1Zz6Kf4ALKSXJ8J/HSTtIRicZJTHlkdggL8mj4Qy
 L7eIS+0PuNUF7ne3etdDHV0sVIHESUojGFju0w4fKHpRRI0/rSHROgE3HG/Pnvi5MFk4
 XPng==
X-Gm-Message-State: AJIora9PYZ8c1b1dsHogSE6qFhznlp36ynJX3kV1q7J3t8Wk2K5yHjou
 bb0eM3tuBQsPJOUVTlsD/s7geuxonnET01T7YZ8=
X-Google-Smtp-Source: AGRyM1teIAmTadu51Rn0rdDPQqlEsVj4HoAGvspYMJ1dJIoPCSlo78fkxnybM6qZfPtn8l7lxTMMzf+y2S/KK+WCRoo=
X-Received: by 2002:a17:90b:3b4d:b0:1f0:4547:8a31 with SMTP id
 ot13-20020a17090b3b4d00b001f045478a31mr8365953pjb.129.1658362177392; Wed, 20
 Jul 2022 17:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <165570784143.17634.35095816584573691-0@git.sr.ht>
 <165570784143.17634.35095816584573691-1@git.sr.ht>
In-Reply-To: <165570784143.17634.35095816584573691-1@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jul 2022 10:09:11 +1000
Message-ID: <CAKmqyKPcr_E0izPv6Vh2bJYdEQWwc_PaJM3YEt6gG8iMSJE_Dg@mail.gmail.com>
Subject: Re: [PATCH qemu v6 01/10] target/riscv: rvv: Add mask agnostic for vv
 instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Thu, 21 Jul 2022 00:09:42 -0000

On Mon, Jun 20, 2022 at 4:59 PM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> According to v-spec, mask agnostic behavior can be either kept as
> undisturbed or set elements' bits to all 1s. To distinguish the
> difference of mask policies, QEMU should be able to simulate the mask
> agnostic behavior as "set mask elements' bits to all 1s".
>
> There are multiple possibility for agnostic elements according to
> v-spec. The main intent of this patch-set tries to add option that
> can distinguish between mask policies. Setting agnostic elements to
> all 1s allows QEMU to express this.
>
> This is the first commit regarding the optional mask agnostic
> behavior. Follow-up commits will add this optional behavior
> for all rvv instructions.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h                      | 2 ++
>  target/riscv/cpu_helper.c               | 2 ++
>  target/riscv/insn_trans/trans_rvv.c.inc | 3 +++
>  target/riscv/internals.h                | 5 +++--
>  target/riscv/translate.c                | 2 ++
>  target/riscv/vector_helper.c            | 8 ++++++++
>  6 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7d6397acdf..d53d1caa8b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -413,6 +413,7 @@ struct RISCVCPUConfig {
>      bool ext_zve64f;
>      bool ext_zmmul;
>      bool rvv_ta_all_1s;
> +    bool rvv_ma_all_1s;
>
>      uint32_t mvendorid;
>      uint64_t marchid;
> @@ -569,6 +570,7 @@ FIELD(TB_FLAGS, XL, 20, 2)
>  FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
>  FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
>  FIELD(TB_FLAGS, VTA, 24, 1)
> +FIELD(TB_FLAGS, VMA, 25, 1)
>
>  #ifdef TARGET_RISCV32
>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 4a6700c890..224653f609 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -67,6 +67,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>          flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
>          flags = FIELD_DP32(flags, TB_FLAGS, VTA,
>                      FIELD_EX64(env->vtype, VTYPE, VTA));
> +        flags = FIELD_DP32(flags, TB_FLAGS, VMA,
> +                    FIELD_EX64(env->vtype, VTYPE, VMA));
>      } else {
>          flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>      }
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 6c091824b6..5ec113f6fd 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1247,6 +1247,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
>          data = FIELD_DP32(data, VDATA, VM, a->vm);
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
>                             cpu_env, s->cfg_ptr->vlen / 8,
> @@ -1545,6 +1546,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
>          data = FIELD_DP32(data, VDATA, VM, a->vm);
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1),
>                             vreg_ofs(s, a->rs2),
> @@ -1627,6 +1629,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
>          data = FIELD_DP32(data, VDATA, VM, a->vm);
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1),
>                             vreg_ofs(s, a->rs2),
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 193ce57a6d..5620fbffb6 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -26,8 +26,9 @@ FIELD(VDATA, VM, 0, 1)
>  FIELD(VDATA, LMUL, 1, 3)
>  FIELD(VDATA, VTA, 4, 1)
>  FIELD(VDATA, VTA_ALL_1S, 5, 1)
> -FIELD(VDATA, NF, 6, 4)
> -FIELD(VDATA, WD, 6, 1)
> +FIELD(VDATA, VMA, 6, 1)
> +FIELD(VDATA, NF, 7, 4)
> +FIELD(VDATA, WD, 7, 1)
>
>  /* float point classify helpers */
>  target_ulong fclass_h(uint64_t frs1);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index b151c20674..b58f32ae93 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -95,6 +95,7 @@ typedef struct DisasContext {
>      int8_t lmul;
>      uint8_t sew;
>      uint8_t vta;
> +    uint8_t vma;
>      bool cfg_vta_all_1s;
>      target_ulong vstart;
>      bool vl_eq_vlmax;
> @@ -1102,6 +1103,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
>      ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
>      ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
> +    ctx->vma = FIELD_EX32(tb_flags, TB_FLAGS, VMA) && cpu->cfg.rvv_ma_all_1s;
>      ctx->cfg_vta_all_1s = cpu->cfg.rvv_ta_all_1s;
>      ctx->vstart = env->vstart;
>      ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index a96fc49c71..de895050e0 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -127,6 +127,11 @@ static inline uint32_t vext_vta(uint32_t desc)
>      return FIELD_EX32(simd_data(desc), VDATA, VTA);
>  }
>
> +static inline uint32_t vext_vma(uint32_t desc)
> +{
> +    return FIELD_EX32(simd_data(desc), VDATA, VMA);
> +}
> +
>  static inline uint32_t vext_vta_all_1s(uint32_t desc)
>  {
>      return FIELD_EX32(simd_data(desc), VDATA, VTA_ALL_1S);
> @@ -812,10 +817,13 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
>      uint32_t vl = env->vl;
>      uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>      uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>      uint32_t i;
>
>      for (i = env->vstart; i < vl; i++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
> +            /* set masked-off elements to 1s */
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
>              continue;
>          }
>          fn(vd, vs1, vs2, i);
> --
> 2.34.2
>
>

