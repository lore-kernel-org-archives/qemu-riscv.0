Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noMUM-00035H-Rl
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 05:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noMUK-0002zw-Ap; Tue, 10 May 2022 05:49:04 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:44570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noMUI-0004Uv-C9; Tue, 10 May 2022 05:49:04 -0400
Received: by mail-il1-x134.google.com with SMTP id o5so10974721ils.11;
 Tue, 10 May 2022 02:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RWuNUznst0CpulAIRjXImiKdGC17P981W3DSb61s2VQ=;
 b=UdnI9iSy2rXHZ1Soyp1qn5fSJa+pohJv751/cxg104uWHDp340uvqcL8nNNGSK5HTx
 womBdl5iRnTC59j5rfGl1UeVUblMixu0Io5Z3umVtVubkMIVwEsfN0QQVFZswxu3ZowS
 PIY6Ai7DO1R5ceA3mrqO3lk1m0JS29OsBX9AOEYoe5dv/+E7tS2s/BfVr3BLtwyXxBp+
 Wv074UQfTMkuy15ZG/4nl6PGhylySeWrNERV4v2JDiW60j7sAP3HO2pE9kMdqT0wgQ4l
 F8CUFvNUVcrvKjMWQcI3rnD8+xd9bNqBhFK5+d5TeECVSJysggpJn7pBKlU5PMr7H1ZU
 ixpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RWuNUznst0CpulAIRjXImiKdGC17P981W3DSb61s2VQ=;
 b=TjGi+tc3FOSKIFQIjQgZJ2BV/9VUkTYaDvLu86HbArzDU8mbTEN82R/ReLlQ6fyH+p
 iq/dtuUsMwQlxpW6pNWZ2SSgjAYH3Y58xsYHVfzxfW5SuAT2BYmfVw94Pp/Q8E7/7iK5
 f1yfVG++nGTtW0su+yuCzcIYLm2JPLfZtu/KWtgIywR/obDwFJPV4irPkPUMl9lMkEI3
 5kwcb2sgdDNktVNSF06VM8jyu7UnOH0FJ0JPhcp43Xn6WTBufw3GqGSZRJ5+YymD4Bx7
 O7wHgs8YHjygV8Plz53WHLxZQ4j5akR+5+vl/Rde2pJ5loGXHMbghK3vy2zq/fIn6Bg+
 yVtQ==
X-Gm-Message-State: AOAM530uvIhwcVOzK4VoJD24kUCtQmccBBhSjIva4ji4C5zOdAZZCdGF
 F9uel7Rpqo7An7gvkfNmiPNSoIUCrA+06CiY2zc=
X-Google-Smtp-Source: ABdhPJyg259oJ+Dk1fgfO8BDQxNPgaZOZHQHTJlabeW2FPY6K1yNx20OC0Nfo0sMRkf8q4nv+yIDIcnKCuA9keSVKKw=
X-Received: by 2002:a05:6e02:151:b0:2cf:8c5d:2ca0 with SMTP id
 j17-20020a056e02015100b002cf8c5d2ca0mr7125567ilr.86.1652176140791; Tue, 10
 May 2022 02:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <165156202959.27941.9731161369415852149-0@git.sr.ht>
 <165156202959.27941.9731161369415852149-9@git.sr.ht>
In-Reply-To: <165156202959.27941.9731161369415852149-9@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 May 2022 11:48:34 +0200
Message-ID: <CAKmqyKObF7Fpz5hxzWGSJ5biEoBkEQT1EtfezWk8p6Hm0-Oq1A@mail.gmail.com>
Subject: Re: [PATCH qemu v14 09/15] target/riscv: rvv: Add tail agnostic for
 vector integer merge and move instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Tue, 10 May 2022 09:49:05 -0000

On Tue, May 3, 2022 at 10:27 AM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 44 +++++++++++++++++++++++++
>  target/riscv/vector_helper.c            | 20 +++++++++++
>  2 files changed, 64 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 430847b0f9..46ee673040 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2123,11 +2123,22 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
>          /* vmv.v.v has rs2 = 0 and vm = 1 */
>          vext_check_sss(s, a->rd, a->rs1, 0, 1)) {
>          if (s->vl_eq_vlmax) {
> +            if (s->vta && s->lmul < 0) {
> +                /*
> +                 * tail elements may pass vlmax when lmul < 0
> +                 * set tail elements to 1s
> +                 */
> +                uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                                 vreg_ofs(s, a->rd), -1,
> +                                 vlenb, vlenb);
> +            }
>              tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),
>                               vreg_ofs(s, a->rs1),
>                               MAXSZ(s), MAXSZ(s));
>          } else {
>              uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
> +            data = FIELD_DP32(data, VDATA, VTA, s->vta);
>              static gen_helper_gvec_2_ptr * const fns[4] = {
>                  gen_helper_vmv_v_v_b, gen_helper_vmv_v_v_h,
>                  gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
> @@ -2163,6 +2174,16 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
>          s1 = get_gpr(s, a->rs1, EXT_SIGN);
>
>          if (s->vl_eq_vlmax) {
> +            if (s->vta && s->lmul < 0) {
> +                /*
> +                 * tail elements may pass vlmax when lmul < 0
> +                 * set tail elements to 1s
> +                 */
> +                uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                                 vreg_ofs(s, a->rd), -1,
> +                                 vlenb, vlenb);
> +            }
>              tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
>                                  MAXSZ(s), MAXSZ(s), s1);
>          } else {
> @@ -2170,6 +2191,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
>              TCGv_i64 s1_i64 = tcg_temp_new_i64();
>              TCGv_ptr dest = tcg_temp_new_ptr();
>              uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
> +            data = FIELD_DP32(data, VDATA, VTA, s->vta);
>              static gen_helper_vmv_vx * const fns[4] = {
>                  gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
>                  gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
> @@ -2200,6 +2222,16 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
>          vext_check_ss(s, a->rd, 0, 1)) {
>          int64_t simm = sextract64(a->rs1, 0, 5);
>          if (s->vl_eq_vlmax) {
> +            if (s->vta && s->lmul < 0) {
> +                /*
> +                 * tail elements may pass vlmax when lmul < 0
> +                 * set tail elements to 1s
> +                 */
> +                uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                                 vreg_ofs(s, a->rd), -1,
> +                                 vlenb, vlenb);
> +            }
>              tcg_gen_gvec_dup_imm(s->sew, vreg_ofs(s, a->rd),
>                                   MAXSZ(s), MAXSZ(s), simm);
>              mark_vs_dirty(s);
> @@ -2208,6 +2240,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
>              TCGv_i64 s1;
>              TCGv_ptr dest;
>              uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
> +            data = FIELD_DP32(data, VDATA, VTA, s->vta);
>              static gen_helper_vmv_vx * const fns[4] = {
>                  gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
>                  gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
> @@ -2780,6 +2813,16 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>          TCGv_i64 t1;
>
>          if (s->vl_eq_vlmax) {
> +            if (s->vta && s->lmul < 0) {
> +                /*
> +                 * tail elements may pass vlmax when lmul < 0
> +                 * set tail elements to 1s
> +                 */
> +                uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +                tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                                 vreg_ofs(s, a->rd), -1,
> +                                 vlenb, vlenb);
> +            }
>              t1 = tcg_temp_new_i64();
>              /* NaN-box f[rs1] */
>              do_nanbox(s, t1, cpu_fpr[a->rs1]);
> @@ -2791,6 +2834,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>              TCGv_ptr dest;
>              TCGv_i32 desc;
>              uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
> +            data = FIELD_DP32(data, VDATA, VTA, s->vta);
>              static gen_helper_vmv_vx * const fns[3] = {
>                  gen_helper_vmv_v_x_h,
>                  gen_helper_vmv_v_x_w,
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index ddaf364573..87faf1770b 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -1971,6 +1971,9 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *env,           \
>                    uint32_t desc)                                     \
>  {                                                                    \
>      uint32_t vl = env->vl;                                           \
> +    uint32_t esz = sizeof(ETYPE);                                    \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);     \
> +    uint32_t vta = vext_vta(desc);                                   \
>      uint32_t i;                                                      \
>                                                                       \
>      for (i = env->vstart; i < vl; i++) {                             \
> @@ -1978,6 +1981,8 @@ void HELPER(NAME)(void *vd, void *vs1, CPURISCVState *env,           \
>          *((ETYPE *)vd + H(i)) = s1;                                  \
>      }                                                                \
>      env->vstart = 0;                                                 \
> +    /* set tail elements to 1s */                                    \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);         \
>  }
>
>  GEN_VEXT_VMV_VV(vmv_v_v_b, int8_t,  H1)
> @@ -1990,12 +1995,17 @@ void HELPER(NAME)(void *vd, uint64_t s1, CPURISCVState *env,         \
>                    uint32_t desc)                                     \
>  {                                                                    \
>      uint32_t vl = env->vl;                                           \
> +    uint32_t esz = sizeof(ETYPE);                                    \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);     \
> +    uint32_t vta = vext_vta(desc);                                   \
>      uint32_t i;                                                      \
>                                                                       \
>      for (i = env->vstart; i < vl; i++) {                             \
>          *((ETYPE *)vd + H(i)) = (ETYPE)s1;                           \
>      }                                                                \
>      env->vstart = 0;                                                 \
> +    /* set tail elements to 1s */                                    \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);         \
>  }
>
>  GEN_VEXT_VMV_VX(vmv_v_x_b, int8_t,  H1)
> @@ -2008,6 +2018,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,          \
>                    CPURISCVState *env, uint32_t desc)                 \
>  {                                                                    \
>      uint32_t vl = env->vl;                                           \
> +    uint32_t esz = sizeof(ETYPE);                                    \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);     \
> +    uint32_t vta = vext_vta(desc);                                   \
>      uint32_t i;                                                      \
>                                                                       \
>      for (i = env->vstart; i < vl; i++) {                             \
> @@ -2015,6 +2028,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,          \
>          *((ETYPE *)vd + H(i)) = *(vt + H(i));                        \
>      }                                                                \
>      env->vstart = 0;                                                 \
> +    /* set tail elements to 1s */                                    \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);         \
>  }
>
>  GEN_VEXT_VMERGE_VV(vmerge_vvm_b, int8_t,  H1)
> @@ -2027,6 +2042,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,               \
>                    void *vs2, CPURISCVState *env, uint32_t desc)      \
>  {                                                                    \
>      uint32_t vl = env->vl;                                           \
> +    uint32_t esz = sizeof(ETYPE);                                    \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);     \
> +    uint32_t vta = vext_vta(desc);                                   \
>      uint32_t i;                                                      \
>                                                                       \
>      for (i = env->vstart; i < vl; i++) {                             \
> @@ -2036,6 +2054,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,               \
>          *((ETYPE *)vd + H(i)) = d;                                   \
>      }                                                                \
>      env->vstart = 0;                                                 \
> +    /* set tail elements to 1s */                                    \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);         \
>  }
>
>  GEN_VEXT_VMERGE_VX(vmerge_vxm_b, int8_t,  H1)
> --
> 2.34.2
>
>

