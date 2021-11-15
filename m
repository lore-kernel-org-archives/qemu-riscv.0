Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmlob-0003Y6-Ph
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 18:55:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmloZ-0003XK-GW; Mon, 15 Nov 2021 18:55:07 -0500
Received: from [2607:f8b0:4864:20::12f] (port=38836
 helo=mail-il1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmloV-0003bh-GL; Mon, 15 Nov 2021 18:55:07 -0500
Received: by mail-il1-x12f.google.com with SMTP id m11so18494007ilh.5;
 Mon, 15 Nov 2021 15:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YrEgsDDESmIefbQ+txVa5RROfM2LbzYW78w3gdKX4nI=;
 b=IslJrQ+xDP0MOnZ9hu0yJU9/BFeeDb3RqdrfIGfrA/P3bMDdX9EmDt9LMN/pcIfcak
 QMqaCYJ2mGFfWLdKAK0Kqle/bEi1Iax1pXvz5fmnETCySB+5Xg/aUoSC7Er3WCzi2axx
 9f+N/2mLV5e/r8uReoRgW14CPjKpIzgCLnYavdBUJ6yL1h8muAUb/fAM4QOBK58vv6f5
 yIj3UGkwwc9g/IuEo15HeOfxJXfcPuJbfWQLR05c6ARtgM+QSFT2j0dXII02nh9qeH4E
 5WQiLPC4O/hmQp4u3Z5B6oonoQREpIRMDuOi7Y0YYUMD5SBZ9RFk1ED08heFoN3Hx7iK
 3V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YrEgsDDESmIefbQ+txVa5RROfM2LbzYW78w3gdKX4nI=;
 b=oXbIUqskg1Zu+BNGzTb66f7iuRV9btsFwujPt3eXMIa/yaeN0NG2yGDNd/uktUmqFL
 cJwMzq0tKGr0U6+xvNO192SzZ4XAGT0pvFaoIK0eFEZbbEPgUzHeFDxQ0bEfwSUaKwHW
 CocUalLxY7jtXLodlycXCEUNSMXbjJmsknwTZD5N8IHXfluTt/NGuXSVYnPo2aMLoGr+
 IpcMSqd8qhxJq4ThJom+GCIcwOIUYUKKcGNBNYLy63CbQ62iUG32Va2kmqK/F7TZadif
 eLXKIasLZU49iwM+LZ2+klMJcD+Ewm6zi9c7/hnAvbFFikleLoPDC21MzEc/apA6muD7
 W+lg==
X-Gm-Message-State: AOAM532Tm4fsHGpJc1yil9QfGFinGER3yjdOKghS5O0eh7zLDENcWBgt
 9iEr9v8lTDJzE6s/HQjLne+251BdEgNFHaLl5Kg=
X-Google-Smtp-Source: ABdhPJxh/FD90gRWaWzAlDY2pE0TP602d40tOckOGdC2bL8Pa6KucMapvIn2YxOidlIVINH8R7YTb4+xXSJaoJdmJao=
X-Received: by 2002:a05:6e02:1a07:: with SMTP id
 s7mr1803371ild.290.1637020500976; 
 Mon, 15 Nov 2021 15:55:00 -0800 (PST)
MIME-Version: 1.0
References: <20211029085922.255197-1-frank.chang@sifive.com>
 <20211029085922.255197-67-frank.chang@sifive.com>
In-Reply-To: <20211029085922.255197-67-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Nov 2021 09:54:33 +1000
Message-ID: <CAKmqyKP7LirYDSeMU_WfHv5o=CpujMLbUp1Z53L0Ad9N2wib8g@mail.gmail.com>
Subject: Re: [PATCH v9 66/76] target/riscv: rvv-1.0: implement vstart CSR
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 15 Nov 2021 23:55:08 -0000

Alistair

On Fri, Oct 29, 2021 at 7:55 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> * Update and check vstart value for vector instructions.
> * Add whole register move instruction helper functions as we have to
>   call helper function for case where vstart is not zero.
> * Remove probe_pages() calls in vector load/store instructions
>   (except fault-only-first loads) to raise the memory access exception
>   at the exact processed vector element.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c                      |   6 +-
>  target/riscv/helper.h                   |   5 +
>  target/riscv/insn_trans/trans_rvv.c.inc |  75 ++++++---
>  target/riscv/translate.c                |   6 +-
>  target/riscv/vector_helper.c            | 210 +++++++++++++++---------
>  5 files changed, 199 insertions(+), 103 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 3dfbc177381..146447eac5d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -343,7 +343,11 @@ static RISCVException write_vstart(CPURISCVState *env, int csrno,
>  #if !defined(CONFIG_USER_ONLY)
>      env->mstatus |= MSTATUS_VS;
>  #endif
> -    env->vstart = val;
> +    /*
> +     * The vstart CSR is defined to have only enough writable bits
> +     * to hold the largest element index, i.e. lg2(VLEN) bits.
> +     */
> +    env->vstart = val & ~(~0ULL << ctzl(env_archcpu(env)->cfg.vlen));
>      return RISCV_EXCP_NONE;
>  }
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 1a0d817f0f5..a717a87a0e0 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1073,6 +1073,11 @@ DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
>
> +DEF_HELPER_4(vmv1r_v, void, ptr, ptr, env, i32)
> +DEF_HELPER_4(vmv2r_v, void, ptr, ptr, env, i32)
> +DEF_HELPER_4(vmv4r_v, void, ptr, ptr, env, i32)
> +DEF_HELPER_4(vmv8r_v, void, ptr, ptr, env, i32)
> +
>  DEF_HELPER_5(vzext_vf2_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vzext_vf2_w, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vzext_vf2_d, void, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index be3f9f13275..7589c8ce32a 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -490,7 +490,7 @@ static bool vext_check_sds(DisasContext *s, int vd, int vs1, int vs2, int vm)
>   */
>  static bool vext_check_reduction(DisasContext *s, int vs2)
>  {
> -    return require_align(vs2, s->lmul);
> +    return require_align(vs2, s->lmul) && (s->vstart == 0);
>  }
>
>  /*
> @@ -2786,7 +2786,8 @@ GEN_MM_TRANS(vmxnor_mm)
>  static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
>  {
>      if (require_rvv(s) &&
> -        vext_check_isa_ill(s)) {
> +        vext_check_isa_ill(s) &&
> +        s->vstart == 0) {
>          TCGv_ptr src2, mask;
>          TCGv dst;
>          TCGv_i32 desc;
> @@ -2817,7 +2818,8 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
>  static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
>  {
>      if (require_rvv(s) &&
> -        vext_check_isa_ill(s)) {
> +        vext_check_isa_ill(s) &&
> +        s->vstart == 0) {
>          TCGv_ptr src2, mask;
>          TCGv dst;
>          TCGv_i32 desc;
> @@ -2852,7 +2854,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>      if (require_rvv(s) &&                                          \
>          vext_check_isa_ill(s) &&                                   \
>          require_vm(a->vm, a->rd) &&                                \
> -        (a->rd != a->rs2)) {                                       \
> +        (a->rd != a->rs2) &&                                       \
> +        (s->vstart == 0)) {                                        \
>          uint32_t data = 0;                                         \
>          gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
>          TCGLabel *over = gen_new_label();                          \
> @@ -2888,7 +2891,8 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
>          vext_check_isa_ill(s) &&
>          !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
>          require_vm(a->vm, a->rd) &&
> -        require_align(a->rd, s->lmul)) {
> +        require_align(a->rd, s->lmul) &&
> +        (s->vstart == 0)) {
>          uint32_t data = 0;
>          TCGLabel *over = gen_new_label();
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> @@ -3109,6 +3113,7 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
>          TCGLabel *over = gen_new_label();
>
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>          t1 = tcg_temp_new_i64();
>
> @@ -3161,8 +3166,9 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
>          TCGv_i64 t1;
>          TCGLabel *over = gen_new_label();
>
> -        /* if vl == 0, skip vector register write back */
> +        /* if vl == 0 or vstart >= vl, skip vector register write back */
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>          /* NaN-box f[rs1] */
>          t1 = tcg_temp_new_i64();
> @@ -3333,7 +3339,8 @@ static bool vcompress_vm_check(DisasContext *s, arg_r *a)
>             require_align(a->rd, s->lmul) &&
>             require_align(a->rs2, s->lmul) &&
>             (a->rd != a->rs2) &&
> -           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1);
> +           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1) &&
> +           (s->vstart == 0);
>  }
>
>  static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
> @@ -3363,26 +3370,40 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
>   * Whole Vector Register Move Instructions ignore vtype and vl setting.
>   * Thus, we don't need to check vill bit. (Section 16.6)
>   */
> -#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                          \
> -static bool trans_##NAME(DisasContext *s, arg_##NAME * a)       \
> -{                                                               \
> -    if (require_rvv(s) &&                                       \
> -        QEMU_IS_ALIGNED(a->rd, LEN) &&                          \
> -        QEMU_IS_ALIGNED(a->rs2, LEN)) {                         \
> -        /* EEW = 8 */                                           \
> -        tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),              \
> -                         vreg_ofs(s, a->rs2),                   \
> -                         s->vlen / 8 * LEN, s->vlen / 8 * LEN); \
> -        mark_vs_dirty(s);                                       \
> -        return true;                                            \
> -    }                                                           \
> -    return false;                                               \
> -}
> -
> -GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
> -GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
> -GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
> -GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
> +#define GEN_VMV_WHOLE_TRANS(NAME, LEN, SEQ)                             \
> +static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
> +{                                                                       \
> +    if (require_rvv(s) &&                                               \
> +        QEMU_IS_ALIGNED(a->rd, LEN) &&                                  \
> +        QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 \
> +        uint32_t maxsz = (s->vlen >> 3) * LEN;                          \
> +        if (s->vstart == 0) {                                           \
> +            /* EEW = 8 */                                               \
> +            tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),                  \
> +                             vreg_ofs(s, a->rs2), maxsz, maxsz);        \
> +            mark_vs_dirty(s);                                           \
> +        } else {                                                        \
> +            TCGLabel *over = gen_new_label();                           \
> +            tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, maxsz, over);  \
> +                                                                        \
> +            static gen_helper_gvec_2_ptr * const fns[4] = {             \
> +                gen_helper_vmv1r_v, gen_helper_vmv2r_v,                 \
> +                gen_helper_vmv4r_v, gen_helper_vmv8r_v,                 \
> +            };                                                          \
> +            tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2), \
> +                               cpu_env, maxsz, maxsz, 0, fns[SEQ]);     \
> +            mark_vs_dirty(s);                                           \
> +            gen_set_label(over);                                        \
> +        }                                                               \
> +        return true;                                                    \
> +    }                                                                   \
> +    return false;                                                       \
> +}
> +
> +GEN_VMV_WHOLE_TRANS(vmv1r_v, 1, 0)
> +GEN_VMV_WHOLE_TRANS(vmv2r_v, 2, 1)
> +GEN_VMV_WHOLE_TRANS(vmv4r_v, 4, 2)
> +GEN_VMV_WHOLE_TRANS(vmv8r_v, 8, 3)
>
>  static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
>  {
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index b4df21bda3c..68edaaf6ac7 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -33,7 +33,7 @@
>  #include "internals.h"
>
>  /* global register indices */
> -static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
> +static TCGv cpu_gpr[32], cpu_pc, cpu_vl, cpu_vstart;
>  static TCGv_i64 cpu_fpr[32]; /* assume F and D extensions */
>  static TCGv load_res;
>  static TCGv load_val;
> @@ -96,6 +96,7 @@ typedef struct DisasContext {
>      int8_t lmul;
>      uint8_t sew;
>      uint16_t vlen;
> +    target_ulong vstart;
>      bool vl_eq_vlmax;
>      uint8_t ntemp;
>      CPUState *cs;
> @@ -710,6 +711,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
>      ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
>      ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
> +    ctx->vstart = env->vstart;
>      ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>      ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
>      ctx->cs = cs;
> @@ -828,6 +830,8 @@ void riscv_translate_init(void)
>
>      cpu_pc = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, pc), "pc");
>      cpu_vl = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, vl), "vl");
> +    cpu_vstart = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, vstart),
> +                            "vstart");
>      load_res = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, load_res),
>                               "load_res");
>      load_val = tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, load_val),
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index e61c8731425..22848d6b683 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -226,25 +226,19 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>      uint32_t nf = vext_nf(desc);
>      uint32_t max_elems = vext_max_elems(desc, esz);
>
> -    /* probe every access*/
> -    for (i = 0; i < env->vl; i++) {
> +    for (i = env->vstart; i < env->vl; i++, env->vstart++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
> -        probe_pages(env, base + stride * i, nf << esz, ra, access_type);
> -    }
> -    /* do real access */
> -    for (i = 0; i < env->vl; i++) {
> +
>          k = 0;
> -        if (!vm && !vext_elem_mask(v0, i)) {
> -            continue;
> -        }
>          while (k < nf) {
>              target_ulong addr = base + stride * i + (k << esz);
>              ldst_elem(env, addr, i + k * max_elems, vd, ra);
>              k++;
>          }
>      }
> +    env->vstart = 0;
>  }
>
>  #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
> @@ -291,10 +285,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>      uint32_t nf = vext_nf(desc);
>      uint32_t max_elems = vext_max_elems(desc, esz);
>
> -    /* probe every access */
> -    probe_pages(env, base, env->vl * (nf << esz), ra, access_type);
>      /* load bytes from guest memory */
> -    for (i = 0; i < env->vl; i++) {
> +    for (i = env->vstart; i < env->vl; i++, env->vstart++) {
>          k = 0;
>          while (k < nf) {
>              target_ulong addr = base + ((i * nf + k) << esz);
> @@ -302,6 +294,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>              k++;
>          }
>      }
> +    env->vstart = 0;
>  }
>
>  /*
> @@ -381,26 +374,20 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>      uint32_t vm = vext_vm(desc);
>      uint32_t max_elems = vext_max_elems(desc, esz);
>
> -    /* probe every access*/
> -    for (i = 0; i < env->vl; i++) {
> -        if (!vm && !vext_elem_mask(v0, i)) {
> -            continue;
> -        }
> -        probe_pages(env, get_index_addr(base, i, vs2), nf << esz, ra,
> -                    access_type);
> -    }
>      /* load bytes from guest memory */
> -    for (i = 0; i < env->vl; i++) {
> -        k = 0;
> +    for (i = env->vstart; i < env->vl; i++, env->vstart++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
> +
> +        k = 0;
>          while (k < nf) {
>              abi_ptr addr = get_index_addr(base, i, vs2) + (k << esz);
>              ldst_elem(env, addr, i + k * max_elems, vd, ra);
>              k++;
>          }
>      }
> +    env->vstart = 0;
>  }
>
>  #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
> @@ -471,7 +458,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>      target_ulong addr, offset, remain;
>
>      /* probe every access*/
> -    for (i = 0; i < env->vl; i++) {
> +    for (i = env->vstart; i < env->vl; i++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
> @@ -511,7 +498,7 @@ ProbeSuccess:
>      if (vl != 0) {
>          env->vl = vl;
>      }
> -    for (i = 0; i < env->vl; i++) {
> +    for (i = env->vstart; i < env->vl; i++) {
>          k = 0;
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
> @@ -522,6 +509,7 @@ ProbeSuccess:
>              k++;
>          }
>      }
> +    env->vstart = 0;
>  }
>
>  #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \
> @@ -559,21 +547,32 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>                  vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra,
>                  MMUAccessType access_type)
>  {
> -    uint32_t i, k;
> +    uint32_t i, k, off, pos;
>      uint32_t nf = vext_nf(desc);
>      uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
>      uint32_t max_elems = vlenb >> esz;
>
> -    /* probe every access */
> -    probe_pages(env, base, vlenb * nf, ra, access_type);
> +    k = env->vstart / max_elems;
> +    off = env->vstart % max_elems;
>
> -    /* load bytes from guest memory */
> -    for (k = 0; k < nf; k++) {
> -        for (i = 0; i < max_elems; i++) {
> +    if (off) {
> +        /* load/store rest of elements of current segment pointed by vstart */
> +        for (pos = off; pos < max_elems; pos++, env->vstart++) {
> +            target_ulong addr = base + ((pos + k * max_elems) << esz);
> +            ldst_elem(env, addr, pos + k * max_elems, vd, ra);
> +        }
> +        k++;
> +    }
> +
> +    /* load/store elements for rest of segments */
> +    for (; k < nf; k++) {
> +        for (i = 0; i < max_elems; i++, env->vstart++) {
>              target_ulong addr = base + ((i + k * max_elems) << esz);
>              ldst_elem(env, addr, i + k * max_elems, vd, ra);
>          }
>      }
> +
> +    env->vstart = 0;
>  }
>
>  #define GEN_VEXT_LD_WHOLE(NAME, ETYPE, LOAD_FN)      \
> @@ -686,12 +685,13 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
>      uint32_t vl = env->vl;
>      uint32_t i;
>
> -    for (i = 0; i < vl; i++) {
> +    for (i = env->vstart; i < vl; i++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
>          fn(vd, vs1, vs2, i);
>      }
> +    env->vstart = 0;
>  }
>
>  /* generate the helpers for OPIVV */
> @@ -748,12 +748,13 @@ static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
>      uint32_t vl = env->vl;
>      uint32_t i;
>
> -    for (i = 0; i < vl; i++) {
> +    for (i = env->vstart; i < vl; i++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
>          fn(vd, s1, vs2, i);
>      }
> +    env->vstart = 0;
>  }
>
>  /* generate the helpers for OPIVX */
> @@ -941,13 +942,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>      uint32_t vl = env->vl;                                    \
>      uint32_t i;                                               \
>                                                                \
> -    for (i = 0; i < vl; i++) {                                \
> +    for (i = env->vstart; i < vl; i++) {                      \
>          ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
>          ETYPE carry = vext_elem_mask(v0, i);                  \
>                                                                \
>          *((ETYPE *)vd + H(i)) = DO_OP(s2, s1, carry);         \
>      }                                                         \
> +    env->vstart = 0;                                          \
>  }
>
>  GEN_VEXT_VADC_VVM(vadc_vvm_b, uint8_t,  H1, DO_VADC)
> @@ -967,12 +969,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
>      uint32_t vl = env->vl;                                               \
>      uint32_t i;                                                          \
>                                                                           \
> -    for (i = 0; i < vl; i++) {                                           \
> +    for (i = env->vstart; i < vl; i++) {                                 \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                               \
>          ETYPE carry = vext_elem_mask(v0, i);                             \
>                                                                           \
>          *((ETYPE *)vd + H(i)) = DO_OP(s2, (ETYPE)(target_long)s1, carry);\
>      }                                                                    \
> +    env->vstart = 0;                                          \
>  }
>
>  GEN_VEXT_VADC_VXM(vadc_vxm_b, uint8_t,  H1, DO_VADC)
> @@ -997,12 +1000,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>      uint32_t vm = vext_vm(desc);                              \
>      uint32_t i;                                               \
>                                                                \
> -    for (i = 0; i < vl; i++) {                                \
> +    for (i = env->vstart; i < vl; i++) {                      \
>          ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
>          ETYPE carry = !vm && vext_elem_mask(v0, i);           \
>          vext_set_elem_mask(vd, i, DO_OP(s2, s1, carry));      \
>      }                                                         \
> +    env->vstart = 0;                                          \
>  }
>
>  GEN_VEXT_VMADC_VVM(vmadc_vvm_b, uint8_t,  H1, DO_MADC)
> @@ -1023,12 +1027,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
>      uint32_t vm = vext_vm(desc);                                \
>      uint32_t i;                                                 \
>                                                                  \
> -    for (i = 0; i < vl; i++) {                                  \
> +    for (i = env->vstart; i < vl; i++) {                        \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                      \
>          ETYPE carry = !vm && vext_elem_mask(v0, i);             \
>          vext_set_elem_mask(vd, i,                               \
>                  DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
>      }                                                           \
> +    env->vstart = 0;                                            \
>  }
>
>  GEN_VEXT_VMADC_VXM(vmadc_vxm_b, uint8_t,  H1, DO_MADC)
> @@ -1105,7 +1110,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
>      uint32_t vl = env->vl;                                                \
>      uint32_t i;                                                           \
>                                                                            \
> -    for (i = 0; i < vl; i++) {                                            \
> +    for (i = env->vstart; i < vl; i++) {                                  \
>          if (!vm && !vext_elem_mask(v0, i)) {                              \
>              continue;                                                     \
>          }                                                                 \
> @@ -1113,6 +1118,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
>          TS2 s2 = *((TS2 *)vs2 + HS2(i));                                  \
>          *((TS1 *)vd + HS1(i)) = OP(s2, s1 & MASK);                        \
>      }                                                                     \
> +    env->vstart = 0;                                                      \
>  }
>
>  GEN_VEXT_SHIFT_VV(vsll_vv_b, uint8_t,  uint8_t, H1, H1, DO_SLL, 0x7)
> @@ -1139,13 +1145,14 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,      \
>      uint32_t vl = env->vl;                                  \
>      uint32_t i;                                             \
>                                                              \
> -    for (i = 0; i < vl; i++) {                              \
> +    for (i = env->vstart; i < vl; i++) {                    \
>          if (!vm && !vext_elem_mask(v0, i)) {                \
>              continue;                                       \
>          }                                                   \
>          TS2 s2 = *((TS2 *)vs2 + HS2(i));                    \
>          *((TD *)vd + HD(i)) = OP(s2, s1 & MASK);            \
>      }                                                       \
> +    env->vstart = 0;                                        \
>  }
>
>  GEN_VEXT_SHIFT_VX(vsll_vx_b, uint8_t, int8_t, H1, H1, DO_SLL, 0x7)
> @@ -1192,7 +1199,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>      uint32_t vl = env->vl;                                    \
>      uint32_t i;                                               \
>                                                                \
> -    for (i = 0; i < vl; i++) {                                \
> +    for (i = env->vstart; i < vl; i++) {                      \
>          ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
>          if (!vm && !vext_elem_mask(v0, i)) {                  \
> @@ -1200,6 +1207,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>          }                                                     \
>          vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
>      }                                                         \
> +    env->vstart = 0;                                          \
>  }
>
>  GEN_VEXT_CMP_VV(vmseq_vv_b, uint8_t,  H1, DO_MSEQ)
> @@ -1240,7 +1248,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
>      uint32_t vl = env->vl;                                          \
>      uint32_t i;                                                     \
>                                                                      \
> -    for (i = 0; i < vl; i++) {                                      \
> +    for (i = env->vstart; i < vl; i++) {                            \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
>          if (!vm && !vext_elem_mask(v0, i)) {                        \
>              continue;                                               \
> @@ -1248,6 +1256,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
>          vext_set_elem_mask(vd, i,                                   \
>                  DO_OP(s2, (ETYPE)(target_long)s1));                 \
>      }                                                               \
> +    env->vstart = 0;                                                \
>  }
>
>  GEN_VEXT_CMP_VX(vmseq_vx_b, uint8_t,  H1, DO_MSEQ)
> @@ -1770,10 +1779,11 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *env,           \
>      uint32_t vl = env->vl;                                           \
>      uint32_t i;                                                      \
>                                                                       \
> -    for (i = 0; i < vl; i++) {                                       \
> +    for (i = env->vstart; i < vl; i++) {                             \
>          ETYPE s1 = *((ETYPE *)vs1 + H(i));                           \
>          *((ETYPE *)vd + H(i)) = s1;                                  \
>      }                                                                \
> +    env->vstart = 0;                                                 \
>  }
>
>  GEN_VEXT_VMV_VV(vmv_v_v_b, int8_t,  H1)
> @@ -1788,9 +1798,10 @@ void HELPER(NAME)(void *vd, uint64_t s1, CPURISCVState *env,         \
>      uint32_t vl = env->vl;                                           \
>      uint32_t i;                                                      \
>                                                                       \
> -    for (i = 0; i < vl; i++) {                                       \
> +    for (i = env->vstart; i < vl; i++) {                             \
>          *((ETYPE *)vd + H(i)) = (ETYPE)s1;                           \
>      }                                                                \
> +    env->vstart = 0;                                                 \
>  }
>
>  GEN_VEXT_VMV_VX(vmv_v_x_b, int8_t,  H1)
> @@ -1805,10 +1816,11 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,          \
>      uint32_t vl = env->vl;                                           \
>      uint32_t i;                                                      \
>                                                                       \
> -    for (i = 0; i < vl; i++) {                                       \
> +    for (i = env->vstart; i < vl; i++) {                             \
>          ETYPE *vt = (!vext_elem_mask(v0, i) ? vs2 : vs1);            \
>          *((ETYPE *)vd + H(i)) = *(vt + H(i));                        \
>      }                                                                \
> +    env->vstart = 0;                                                 \
>  }
>
>  GEN_VEXT_VMERGE_VV(vmerge_vvm_b, int8_t,  H1)
> @@ -1823,12 +1835,13 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,               \
>      uint32_t vl = env->vl;                                           \
>      uint32_t i;                                                      \
>                                                                       \
> -    for (i = 0; i < vl; i++) {                                       \
> +    for (i = env->vstart; i < vl; i++) {                             \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                           \
>          ETYPE d = (!vext_elem_mask(v0, i) ? s2 :                     \
>                     (ETYPE)(target_long)s1);                          \
>          *((ETYPE *)vd + H(i)) = d;                                   \
>      }                                                                \
> +    env->vstart = 0;                                                 \
>  }
>
>  GEN_VEXT_VMERGE_VX(vmerge_vxm_b, int8_t,  H1)
> @@ -1865,12 +1878,13 @@ vext_vv_rm_1(void *vd, void *v0, void *vs1, void *vs2,
>               uint32_t vl, uint32_t vm, int vxrm,
>               opivv2_rm_fn *fn)
>  {
> -    for (uint32_t i = 0; i < vl; i++) {
> +    for (uint32_t i = env->vstart; i < vl; i++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
>          fn(vd, vs1, vs2, i, env, vxrm);
>      }
> +    env->vstart = 0;
>  }
>
>  static inline void
> @@ -1981,12 +1995,13 @@ vext_vx_rm_1(void *vd, void *v0, target_long s1, void *vs2,
>               uint32_t vl, uint32_t vm, int vxrm,
>               opivx2_rm_fn *fn)
>  {
> -    for (uint32_t i = 0; i < vl; i++) {
> +    for (uint32_t i = env->vstart; i < vl; i++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
>          fn(vd, s1, vs2, i, env, vxrm);
>      }
> +    env->vstart = 0;
>  }
>
>  static inline void
> @@ -2768,12 +2783,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>      uint32_t vl = env->vl;                                \
>      uint32_t i;                                           \
>                                                            \
> -    for (i = 0; i < vl; i++) {                            \
> +    for (i = env->vstart; i < vl; i++) {                  \
>          if (!vm && !vext_elem_mask(v0, i)) {              \
>              continue;                                     \
>          }                                                 \
>          do_##NAME(vd, vs1, vs2, i, env);                  \
>      }                                                     \
> +    env->vstart = 0;                                      \
>  }
>
>  RVVCALL(OPFVV2, vfadd_vv_h, OP_UUU_H, H2, H2, H2, float16_add)
> @@ -2800,12 +2816,13 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
>      uint32_t vl = env->vl;                                \
>      uint32_t i;                                           \
>                                                            \
> -    for (i = 0; i < vl; i++) {                            \
> +    for (i = env->vstart; i < vl; i++) {                  \
>          if (!vm && !vext_elem_mask(v0, i)) {              \
>              continue;                                     \
>          }                                                 \
>          do_##NAME(vd, s1, vs2, i, env);                   \
>      }                                                     \
> +    env->vstart = 0;                                      \
>  }
>
>  RVVCALL(OPFVF2, vfadd_vf_h, OP_UUU_H, H2, H2, float16_add)
> @@ -3371,12 +3388,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
>      if (vl == 0) {                                     \
>          return;                                        \
>      }                                                  \
> -    for (i = 0; i < vl; i++) {                         \
> +    for (i = env->vstart; i < vl; i++) {               \
>          if (!vm && !vext_elem_mask(v0, i)) {           \
>              continue;                                  \
>          }                                              \
>          do_##NAME(vd, vs2, i, env);                    \
>      }                                                  \
> +    env->vstart = 0;                                   \
>  }
>
>  RVVCALL(OPFVV1, vfsqrt_v_h, OP_UU_H, H2, H2, float16_sqrt)
> @@ -3507,7 +3525,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>      uint32_t vl = env->vl;                                    \
>      uint32_t i;                                               \
>                                                                \
> -    for (i = 0; i < vl; i++) {                                \
> +    for (i = env->vstart; i < vl; i++) {                      \
>          ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
>          if (!vm && !vext_elem_mask(v0, i)) {                  \
> @@ -3516,6 +3534,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>          vext_set_elem_mask(vd, i,                             \
>                             DO_OP(s2, s1, &env->fp_status));   \
>      }                                                         \
> +    env->vstart = 0;                                          \
>  }
>
>  GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
> @@ -3530,7 +3549,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
>      uint32_t vl = env->vl;                                          \
>      uint32_t i;                                                     \
>                                                                      \
> -    for (i = 0; i < vl; i++) {                                      \
> +    for (i = env->vstart; i < vl; i++) {                            \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
>          if (!vm && !vext_elem_mask(v0, i)) {                        \
>              continue;                                               \
> @@ -3538,6 +3557,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
>          vext_set_elem_mask(vd, i,                                   \
>                             DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
>      }                                                               \
> +    env->vstart = 0;                                                \
>  }
>
>  GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
> @@ -3646,12 +3666,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
>      uint32_t vl = env->vl;                             \
>      uint32_t i;                                        \
>                                                         \
> -    for (i = 0; i < vl; i++) {                         \
> +    for (i = env->vstart; i < vl; i++) {               \
>          if (!vm && !vext_elem_mask(v0, i)) {           \
>              continue;                                  \
>          }                                              \
>          do_##NAME(vd, vs2, i);                         \
>      }                                                  \
> +    env->vstart = 0;                                   \
>  }
>
>  target_ulong fclass_h(uint64_t frs1)
> @@ -3727,11 +3748,12 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2, \
>      uint32_t vl = env->vl;                                    \
>      uint32_t i;                                               \
>                                                                \
> -    for (i = 0; i < vl; i++) {                                \
> +    for (i = env->vstart; i < vl; i++) {                      \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
>          *((ETYPE *)vd + H(i))                                 \
>            = (!vm && !vext_elem_mask(v0, i) ? s2 : s1);        \
>      }                                                         \
> +    env->vstart = 0;                                          \
>  }
>
>  GEN_VFMERGE_VF(vfmerge_vfm_h, int16_t, H2)
> @@ -3875,7 +3897,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>      uint32_t i;                                           \
>      TD s1 =  *((TD *)vs1 + HD(0));                        \
>                                                            \
> -    for (i = 0; i < vl; i++) {                            \
> +    for (i = env->vstart; i < vl; i++) {                  \
>          TS2 s2 = *((TS2 *)vs2 + HS2(i));                  \
>          if (!vm && !vext_elem_mask(v0, i)) {              \
>              continue;                                     \
> @@ -3883,6 +3905,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>          s1 = OP(s1, (TD)s2);                              \
>      }                                                     \
>      *((TD *)vd + HD(0)) = s1;                             \
> +    env->vstart = 0;                                      \
>  }
>
>  /* vd[0] = sum(vs1[0], vs2[*]) */
> @@ -3955,7 +3978,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
>      uint32_t i;                                            \
>      TD s1 =  *((TD *)vs1 + HD(0));                         \
>                                                             \
> -    for (i = 0; i < vl; i++) {                             \
> +    for (i = env->vstart; i < vl; i++) {                   \
>          TS2 s2 = *((TS2 *)vs2 + HS2(i));                   \
>          if (!vm && !vext_elem_mask(v0, i)) {               \
>              continue;                                      \
> @@ -3963,6 +3986,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
>          s1 = OP(s1, (TD)s2, &env->fp_status);              \
>      }                                                      \
>      *((TD *)vd + HD(0)) = s1;                              \
> +    env->vstart = 0;                                       \
>  }
>
>  /* Unordered sum */
> @@ -3990,7 +4014,7 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
>      uint32_t i;
>      uint32_t s1 =  *((uint32_t *)vs1 + H4(0));
>
> -    for (i = 0; i < vl; i++) {
> +    for (i = env->vstart; i < vl; i++) {
>          uint16_t s2 = *((uint16_t *)vs2 + H2(i));
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
> @@ -3999,6 +4023,7 @@ void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
>                           &env->fp_status);
>      }
>      *((uint32_t *)vd + H4(0)) = s1;
> +    env->vstart = 0;
>  }
>
>  void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
> @@ -4009,7 +4034,7 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
>      uint32_t i;
>      uint64_t s1 =  *((uint64_t *)vs1);
>
> -    for (i = 0; i < vl; i++) {
> +    for (i = env->vstart; i < vl; i++) {
>          uint32_t s2 = *((uint32_t *)vs2 + H4(i));
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
> @@ -4018,6 +4043,7 @@ void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
>                           &env->fp_status);
>      }
>      *((uint64_t *)vd) = s1;
> +    env->vstart = 0;
>  }
>
>  /*
> @@ -4033,11 +4059,12 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>      uint32_t i;                                           \
>      int a, b;                                             \
>                                                            \
> -    for (i = 0; i < vl; i++) {                            \
> +    for (i = env->vstart; i < vl; i++) {                  \
>          a = vext_elem_mask(vs1, i);                       \
>          b = vext_elem_mask(vs2, i);                       \
>          vext_set_elem_mask(vd, i, OP(b, a));              \
>      }                                                     \
> +    env->vstart = 0;                                      \
>  }
>
>  #define DO_NAND(N, M)  (!(N & M))
> @@ -4064,13 +4091,14 @@ target_ulong HELPER(vcpop_m)(void *v0, void *vs2, CPURISCVState *env,
>      uint32_t vl = env->vl;
>      int i;
>
> -    for (i = 0; i < vl; i++) {
> +    for (i = env->vstart; i < vl; i++) {
>          if (vm || vext_elem_mask(v0, i)) {
>              if (vext_elem_mask(vs2, i)) {
>                  cnt++;
>              }
>          }
>      }
> +    env->vstart = 0;
>      return cnt;
>  }
>
> @@ -4082,13 +4110,14 @@ target_ulong HELPER(vfirst_m)(void *v0, void *vs2, CPURISCVState *env,
>      uint32_t vl = env->vl;
>      int i;
>
> -    for (i = 0; i < vl; i++) {
> +    for (i = env->vstart; i < vl; i++) {
>          if (vm || vext_elem_mask(v0, i)) {
>              if (vext_elem_mask(vs2, i)) {
>                  return i;
>              }
>          }
>      }
> +    env->vstart = 0;
>      return -1LL;
>  }
>
> @@ -4106,7 +4135,7 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
>      int i;
>      bool first_mask_bit = false;
>
> -    for (i = 0; i < vl; i++) {
> +    for (i = env->vstart; i < vl; i++) {
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
> @@ -4130,6 +4159,7 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
>              }
>          }
>      }
> +    env->vstart = 0;
>  }
>
>  void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
> @@ -4160,7 +4190,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURISCVState *env,      \
>      uint32_t sum = 0;                                                     \
>      int i;                                                                \
>                                                                            \
> -    for (i = 0; i < vl; i++) {                                            \
> +    for (i = env->vstart; i < vl; i++) {                                  \
>          if (!vm && !vext_elem_mask(v0, i)) {                              \
>              continue;                                                     \
>          }                                                                 \
> @@ -4169,6 +4199,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURISCVState *env,      \
>              sum++;                                                        \
>          }                                                                 \
>      }                                                                     \
> +    env->vstart = 0;                                                      \
>  }
>
>  GEN_VEXT_VIOTA_M(viota_m_b, uint8_t,  H1)
> @@ -4184,12 +4215,13 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState *env, uint32_t desc)  \
>      uint32_t vl = env->vl;                                                \
>      int i;                                                                \
>                                                                            \
> -    for (i = 0; i < vl; i++) {                                            \
> +    for (i = env->vstart; i < vl; i++) {                                  \
>          if (!vm && !vext_elem_mask(v0, i)) {                              \
>              continue;                                                     \
>          }                                                                 \
>          *((ETYPE *)vd + H(i)) = i;                                        \
>      }                                                                     \
> +    env->vstart = 0;                                                      \
>  }
>
>  GEN_VEXT_VID_V(vid_v_b, uint8_t,  H1)
> @@ -4208,9 +4240,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>  {                                                                         \
>      uint32_t vm = vext_vm(desc);                                          \
>      uint32_t vl = env->vl;                                                \
> -    target_ulong offset = s1, i;                                          \
> +    target_ulong offset = s1, i_min, i;                                   \
>                                                                            \
> -    for (i = offset; i < vl; i++) {                                       \
> +    i_min = MAX(env->vstart, offset);                                     \
> +    for (i = i_min; i < vl; i++) {                                        \
>          if (!vm && !vext_elem_mask(v0, i)) {                              \
>              continue;                                                     \
>          }                                                                 \
> @@ -4233,8 +4266,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>      uint32_t vl = env->vl;                                                \
>      target_ulong i_max, i;                                                \
>                                                                            \
> -    i_max = MIN(s1 < vlmax ? vlmax - s1 : 0, vl);                         \
> -    for (i = 0; i < i_max; ++i) {                                         \
> +    i_max = MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);       \
> +    for (i = env->vstart; i < i_max; ++i) {                               \
>          if (vm || vext_elem_mask(v0, i)) {                                \
>              *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));          \
>          }                                                                 \
> @@ -4245,6 +4278,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>              *((ETYPE *)vd + H(i)) = 0;                                    \
>          }                                                                 \
>      }                                                                     \
> +                                                                          \
> +    env->vstart = 0;                                                      \
>  }
>
>  /* vslidedown.vx vd, vs2, rs1, vm # vd[i] = vs2[i+rs1] */
> @@ -4262,7 +4297,7 @@ static void vslide1up_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
>      uint32_t vl = env->vl;                                                  \
>      uint32_t i;                                                             \
>                                                                              \
> -    for (i = 0; i < vl; i++) {                                              \
> +    for (i = env->vstart; i < vl; i++) {                                    \
>          if (!vm && !vext_elem_mask(v0, i)) {                                \
>              continue;                                                       \
>          }                                                                   \
> @@ -4272,6 +4307,7 @@ static void vslide1up_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
>              *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));             \
>          }                                                                   \
>      }                                                                       \
> +    env->vstart = 0;                                                        \
>  }
>
>  GEN_VEXT_VSLIE1UP(8,  H1)
> @@ -4301,7 +4337,7 @@ static void vslide1down_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
>      uint32_t vl = env->vl;                                                    \
>      uint32_t i;                                                               \
>                                                                                \
> -    for (i = 0; i < vl; i++) {                                                \
> +    for (i = env->vstart; i < vl; i++) {                                      \
>          if (!vm && !vext_elem_mask(v0, i)) {                                  \
>              continue;                                                         \
>          }                                                                     \
> @@ -4311,6 +4347,7 @@ static void vslide1down_##ESZ(void *vd, void *v0, target_ulong s1, void *vs2, \
>              *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + 1));               \
>          }                                                                     \
>      }                                                                         \
> +    env->vstart = 0;                                                          \
>  }
>
>  GEN_VEXT_VSLIDE1DOWN(8,  H1)
> @@ -4361,13 +4398,13 @@ GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_d, 64)
>  void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
>                    CPURISCVState *env, uint32_t desc)                      \
>  {                                                                         \
> -    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(TS1)));             \
> +    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(TS2)));             \
>      uint32_t vm = vext_vm(desc);                                          \
>      uint32_t vl = env->vl;                                                \
>      uint64_t index;                                                       \
>      uint32_t i;                                                           \
>                                                                            \
> -    for (i = 0; i < vl; i++) {                                            \
> +    for (i = env->vstart; i < vl; i++) {                                  \
>          if (!vm && !vext_elem_mask(v0, i)) {                              \
>              continue;                                                     \
>          }                                                                 \
> @@ -4378,6 +4415,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
>              *((TS2 *)vd + HS2(i)) = *((TS2 *)vs2 + HS2(index));           \
>          }                                                                 \
>      }                                                                     \
> +    env->vstart = 0;                                                      \
>  }
>
>  /* vd[i] = (vs1[i] >= VLMAX) ? 0 : vs2[vs1[i]]; */
> @@ -4401,7 +4439,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>      uint64_t index = s1;                                                  \
>      uint32_t i;                                                           \
>                                                                            \
> -    for (i = 0; i < vl; i++) {                                            \
> +    for (i = env->vstart; i < vl; i++) {                                  \
>          if (!vm && !vext_elem_mask(v0, i)) {                              \
>              continue;                                                     \
>          }                                                                 \
> @@ -4411,6 +4449,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>              *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(index));           \
>          }                                                                 \
>      }                                                                     \
> +    env->vstart = 0;                                                      \
>  }
>
>  /* vd[i] = (x[rs1] >= VLMAX) ? 0 : vs2[rs1] */
> @@ -4427,13 +4466,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
>      uint32_t vl = env->vl;                                                \
>      uint32_t num = 0, i;                                                  \
>                                                                            \
> -    for (i = 0; i < vl; i++) {                                            \
> +    for (i = env->vstart; i < vl; i++) {                                  \
>          if (!vext_elem_mask(vs1, i)) {                                    \
>              continue;                                                     \
>          }                                                                 \
>          *((ETYPE *)vd + H(num)) = *((ETYPE *)vs2 + H(i));                 \
>          num++;                                                            \
>      }                                                                     \
> +    env->vstart = 0;                                                      \
>  }
>
>  /* Compress into vd elements of vs2 where vs1 is enabled */
> @@ -4442,6 +4482,27 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_h, uint16_t, H2)
>  GEN_VEXT_VCOMPRESS_VM(vcompress_vm_w, uint32_t, H4)
>  GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H8)
>
> +/* Vector Whole Register Move */
> +#define GEN_VEXT_VMV_WHOLE(NAME, LEN)                      \
> +void HELPER(NAME)(void *vd, void *vs2, CPURISCVState *env, \
> +                  uint32_t desc)                           \
> +{                                                          \
> +    /* EEW = 8 */                                          \
> +    uint32_t maxsz = simd_maxsz(desc);                     \
> +    uint32_t i = env->vstart;                              \
> +                                                           \
> +    memcpy((uint8_t *)vd + H1(i),                          \
> +           (uint8_t *)vs2 + H1(i),                         \
> +           maxsz - env->vstart);                           \
> +                                                           \
> +    env->vstart = 0;                                       \
> +}
> +
> +GEN_VEXT_VMV_WHOLE(vmv1r_v, 1)
> +GEN_VEXT_VMV_WHOLE(vmv2r_v, 2)
> +GEN_VEXT_VMV_WHOLE(vmv4r_v, 4)
> +GEN_VEXT_VMV_WHOLE(vmv8r_v, 8)
> +
>  /* Vector Integer Extension */
>  #define GEN_VEXT_INT_EXT(NAME, ETYPE, DTYPE, HD, HS1)            \
>  void HELPER(NAME)(void *vd, void *v0, void *vs2,                 \
> @@ -4451,12 +4512,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,                 \
>      uint32_t vm = vext_vm(desc);                                 \
>      uint32_t i;                                                  \
>                                                                   \
> -    for (i = 0; i < vl; i++) {                                   \
> +    for (i = env->vstart; i < vl; i++) {                         \
>          if (!vm && !vext_elem_mask(v0, i)) {                     \
>              continue;                                            \
>          }                                                        \
>          *((ETYPE *)vd + HD(i)) = *((DTYPE *)vs2 + HS1(i));       \
>      }                                                            \
> +    env->vstart = 0;                                             \
>  }
>
>  GEN_VEXT_INT_EXT(vzext_vf2_h, uint16_t, uint8_t,  H2, H1)
> --
> 2.25.1
>
>

