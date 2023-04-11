Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm3QB-00034v-EF
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 22:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm3Q5-00034G-Ql; Mon, 10 Apr 2023 22:07:45 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm3Q4-0007oc-4K; Mon, 10 Apr 2023 22:07:41 -0400
Received: by mail-vs1-xe29.google.com with SMTP id bl16so6631316vsb.4;
 Mon, 10 Apr 2023 19:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681178858; x=1683770858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qhP6PUSnuyAt21ZtC8+77k3eFEpp6HdMwOj6FNObl68=;
 b=FVxwMoSiRT03Y3ObqaXaw358aY132GLsQBzji1QcjZtnUyCl8AtD3aeuZ2RfBqmAGG
 9bqP8qrS80gomwVo3xgtfLaf+wWLkUXUY7+qlNSW4EPONwRshrLPpPADyhbFLZ5RGb9P
 C4tNcYQhonPcAYfLJEtY+VhQNaXzxfFEt9FOW9Byf7Y2BEkJZwKDsMpZPlme87D489AW
 UFd3AC6W35E+LZuHieUplTkSRRu6qfqkXZfyfAV2xc2gbvHAJ6bEBuBYcl+l+YETaVLi
 gTj9xmUziAEuSEaj6XLqAWSnqgqROMT5kY8CxQJf9JfMB9u30KO6ZQemBk3jdgvgKMTk
 Rjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681178858; x=1683770858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qhP6PUSnuyAt21ZtC8+77k3eFEpp6HdMwOj6FNObl68=;
 b=byN9DU04QJflTsbxfiUiW7b/h+7j6c/LExaqLdQ3G35V2bjQy29koqiDIo/chdFz70
 8W9ybG8noaukNQuKbIvtwXiZtXYNR9VIpsN4I+CJ9iN9MpnVi/JU48xYq5ljGpyj6vSE
 z+0UpCdb9COVlAH9SVV/onfbjPGHlejdS0JwhFzz1ShELaipdFdM7YEcB02NBBl698ZN
 J/nQqJuR9DUtsUBucGA4Yl4b4B/oKCTkaRn+tk7DovC7IQ/5sw2O276fUc8vPCmrKaRE
 JhP7PUgyHqHR27dPAU9fmvJiDFjIGL6oYIJRD3GmvGd8wqEYHFUtKnFeEHbM2Ys/DR3D
 Upfw==
X-Gm-Message-State: AAQBX9cpJcLnLhxuuTDAKV4c3qOFIWnLg3dH58FV9KWSzZl0k71OTUDQ
 QpXtnlWFTaQnQomWyxWMExKJjhXfxA+z4fBc3Ac=
X-Google-Smtp-Source: AKy350Yf2Aj8gYP3eEhZUszAaTTuxLmZj9VCJOplo0aiSQQ6fvYyETmPJqAfTSiYDB9+ShQ4dp6WFUhUCinSOmMYkgY=
X-Received: by 2002:a67:d38d:0:b0:425:8e57:7bfd with SMTP id
 b13-20020a67d38d000000b004258e577bfdmr7486878vsj.3.1681178858548; Mon, 10 Apr
 2023 19:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-6-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-6-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 12:07:12 +1000
Message-ID: <CAKmqyKMWnf_HHXuGSPp1Cov8Oa6rp0wuq2YrN2msPtsBvD7whQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/25] target/riscv: Add a tb flags field for vstart
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com, 
 Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 02:07:46 -0000

On Sat, Mar 25, 2023 at 9:52=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> Once we mistook the vstart directly from the env->vstart. As env->vstart =
is not
> a constant, we should record it in the tb flags if we want to use
> it in translation.
>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Message-Id: <20230324143031.1093-5-zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h                      |  1 +
>  target/riscv/cpu_helper.c               |  1 +
>  target/riscv/translate.c                |  4 ++--
>  target/riscv/insn_trans/trans_rvv.c.inc | 14 +++++++-------
>  4 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d9e0eaaf9b..86a82e25dc 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -657,6 +657,7 @@ FIELD(TB_FLAGS, VMA, 21, 1)
>  FIELD(TB_FLAGS, ITRIGGER, 22, 1)
>  /* Virtual mode enabled */
>  FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
> +FIELD(TB_FLAGS, VSTART_EQ_ZERO, 24, 1)
>
>  #ifdef TARGET_RISCV32
>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 4fdd6fe021..4f0999d50b 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -74,6 +74,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ul=
ong *pc,
>                      FIELD_EX64(env->vtype, VTYPE, VTA));
>          flags =3D FIELD_DP32(flags, TB_FLAGS, VMA,
>                      FIELD_EX64(env->vtype, VTYPE, VMA));
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstar=
t =3D=3D 0);
>      } else {
>          flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>      }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 74d0b9889d..f8c077525c 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -97,7 +97,7 @@ typedef struct DisasContext {
>      uint8_t vta;
>      uint8_t vma;
>      bool cfg_vta_all_1s;
> -    target_ulong vstart;
> +    bool vstart_eq_zero;
>      bool vl_eq_vlmax;
>      CPUState *cs;
>      TCGv zero;
> @@ -1155,7 +1155,7 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>      ctx->vta =3D FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_=
all_1s;
>      ctx->vma =3D FIELD_EX32(tb_flags, TB_FLAGS, VMA) && cpu->cfg.rvv_ma_=
all_1s;
>      ctx->cfg_vta_all_1s =3D cpu->cfg.rvv_ta_all_1s;
> -    ctx->vstart =3D env->vstart;
> +    ctx->vstart_eq_zero =3D FIELD_EX32(tb_flags, TB_FLAGS, VSTART_EQ_ZER=
O);
>      ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>      ctx->misa_mxl_max =3D env->misa_mxl_max;
>      ctx->xl =3D FIELD_EX32(tb_flags, TB_FLAGS, XL);
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index 6297c3b50d..32b3b9a8e5 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -547,7 +547,7 @@ static bool vext_check_sds(DisasContext *s, int vd, i=
nt vs1, int vs2, int vm)
>   */
>  static bool vext_check_reduction(DisasContext *s, int vs2)
>  {
> -    return require_align(vs2, s->lmul) && (s->vstart =3D=3D 0);
> +    return require_align(vs2, s->lmul) && s->vstart_eq_zero;
>  }
>
>  /*
> @@ -3083,7 +3083,7 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr =
*a)
>  {
>      if (require_rvv(s) &&
>          vext_check_isa_ill(s) &&
> -        s->vstart =3D=3D 0) {
> +        s->vstart_eq_zero) {
>          TCGv_ptr src2, mask;
>          TCGv dst;
>          TCGv_i32 desc;
> @@ -3112,7 +3112,7 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr=
 *a)
>  {
>      if (require_rvv(s) &&
>          vext_check_isa_ill(s) &&
> -        s->vstart =3D=3D 0) {
> +        s->vstart_eq_zero) {
>          TCGv_ptr src2, mask;
>          TCGv dst;
>          TCGv_i32 desc;
> @@ -3146,7 +3146,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
>          vext_check_isa_ill(s) &&                                   \
>          require_vm(a->vm, a->rd) &&                                \
>          (a->rd !=3D a->rs2) &&                                       \
> -        (s->vstart =3D=3D 0)) {                                        \
> +        s->vstart_eq_zero) {                                       \
>          uint32_t data =3D 0;                                         \
>          gen_helper_gvec_3_ptr *fn =3D gen_helper_##NAME;             \
>          TCGLabel *over =3D gen_new_label();                          \
> @@ -3187,7 +3187,7 @@ static bool trans_viota_m(DisasContext *s, arg_viot=
a_m *a)
>          !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
>          require_vm(a->vm, a->rd) &&
>          require_align(a->rd, s->lmul) &&
> -        (s->vstart =3D=3D 0)) {
> +        s->vstart_eq_zero) {
>          uint32_t data =3D 0;
>          TCGLabel *over =3D gen_new_label();
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> @@ -3636,7 +3636,7 @@ static bool vcompress_vm_check(DisasContext *s, arg=
_r *a)
>             require_align(a->rs2, s->lmul) &&
>             (a->rd !=3D a->rs2) &&
>             !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1) &&
> -           (s->vstart =3D=3D 0);
> +           s->vstart_eq_zero;
>  }
>
>  static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
> @@ -3675,7 +3675,7 @@ static bool trans_##NAME(DisasContext *s, arg_##NAM=
E * a)               \
>          QEMU_IS_ALIGNED(a->rd, LEN) &&                                  =
\
>          QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 =
\
>          uint32_t maxsz =3D (s->cfg_ptr->vlen >> 3) * LEN;               =
  \
> -        if (s->vstart =3D=3D 0) {                                       =
    \
> +        if (s->vstart_eq_zero) {                                        =
\
>              /* EEW =3D 8 */                                             =
  \
>              tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),                  =
\
>                               vreg_ofs(s, a->rs2), maxsz, maxsz);        =
\
> --
> 2.34.1
>
>

