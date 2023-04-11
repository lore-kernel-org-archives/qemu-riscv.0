Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm3Ij-00066P-35
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 22:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm3Ig-00065t-6u; Mon, 10 Apr 2023 22:00:02 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm3Ie-0006CC-3n; Mon, 10 Apr 2023 22:00:01 -0400
Received: by mail-ua1-x932.google.com with SMTP id a38so3928798uax.12;
 Mon, 10 Apr 2023 18:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681178398; x=1683770398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=05dRGl4BizgDRUnFyney8tz8jjekFpRKG12+lCUbZXA=;
 b=BXaxvVPc21/muZ33MExsMNA6bVYyulCdBGVRoEQC48DMiiyovWKlpJiRuO6FrGohIf
 BqB9a1QuFi79QLJUo3fVbVz12I9ie4F93OHvnoewjvpkiRBeCvdHthDKGXObowC0r8hg
 sSF2/JnPhTvmgB1YlHaCSrQkV4oly51L6hsSTDLEjXsx57Us/P2qYknkILVAjX/gpg8b
 UmiL37rU0k32lfydLz7r5UlXklEs5ZsrDQDiJhR+E/RlYc33l9EuTgILPL7IlD0P580X
 0Ftj45npB2TRB/hPiMF02ATbJ2rCxIbqwbD1mP9nb1Ki5q4/mcIfgCYFJGyod7wZjt8A
 bUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681178398; x=1683770398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=05dRGl4BizgDRUnFyney8tz8jjekFpRKG12+lCUbZXA=;
 b=Ov1VFNv+qKP+KossPqG6ObJnJqDrpYb0/I4pA4aHYy+Ua7lQa022mwCzqezN14HOqH
 Rw9w2b513mbOqX/G9I0bn6wckIrp20UVVLo44T8y1A7Xc/r2I/IzX4mrnYC01HGOFJue
 qF/3cI+RhoaiaY/RkaqJpbWsvoxTXr0xO2mnrio4BJSUH3r6OozBSfP7d0umKQE5pOdk
 WSLZFjvDjDvlNzKu5DbTyUja88l2IN/PmwCccOeE0oOEIOi7qysZvZax4SUoe4vkpHT1
 X4UII6hUwtnwKPRGQ+Jgmg3R9zpBlYIUFZAssERZ5CKOzS7DczYeVeuQBhohn/1EQdC/
 h84Q==
X-Gm-Message-State: AAQBX9ezhJk/CXfu0nY6QFEw/YYJW1/wuk9qGQD2074CymC55xoUelzB
 7D5iIzwZ7DLliuFVhaNwnZvBDfX3IiEdFL7RKNM=
X-Google-Smtp-Source: AKy350bnIHeI4lCxJysqvzZXqTLM9FdecxcQ9BQQcsps+PFxWBap2Hg1YQJGN7EMa0AtGwisKoc0SwMqz2EkZJAxH9A=
X-Received: by 2002:ab0:1015:0:b0:68a:5c52:7f2b with SMTP id
 f21-20020ab01015000000b0068a5c527f2bmr8092312uab.1.1681178398483; Mon, 10 Apr
 2023 18:59:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-4-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-4-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 11:59:32 +1000
Message-ID: <CAKmqyKMGw_w52n7J9cnQqq8OEhrzYBmLnS7PXMMz40R6s5OeWQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/25] target/riscv: Encode the FS and VS on a normal
 way for tb flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com, 
 Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 02:00:02 -0000

On Sat, Mar 25, 2023 at 10:01=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> Reuse the MSTATUS_FS and MSTATUS_VS for the tb flags positions is not a
> normal way.
>
> It will make it hard to change the tb flags layout. And even worse, if we
> want to keep tb flags for a same extension togather without a hole.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Message-Id: <20230324143031.1093-4-zhiwei_liu@linux.alibaba.com>
> [rth: Adjust trans_rvf.c.inc as well; use the typedef]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h                      | 15 +++++------
>  target/riscv/cpu_helper.c               | 11 ++++----
>  target/riscv/translate.c                | 34 ++++++++++++-------------
>  target/riscv/insn_trans/trans_rvf.c.inc |  2 +-
>  target/riscv/insn_trans/trans_rvv.c.inc |  8 +++---
>  5 files changed, 34 insertions(+), 36 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 30d9828d59..f787145a21 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -633,18 +633,17 @@ void riscv_cpu_set_fflags(CPURISCVState *env, targe=
t_ulong);
>
>  #define TB_FLAGS_PRIV_MMU_MASK                3
>  #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
> -#define TB_FLAGS_MSTATUS_FS MSTATUS_FS
> -#define TB_FLAGS_MSTATUS_VS MSTATUS_VS
>
>  #include "exec/cpu-all.h"
>
>  FIELD(TB_FLAGS, MEM_IDX, 0, 3)
> -FIELD(TB_FLAGS, LMUL, 3, 3)
> -FIELD(TB_FLAGS, SEW, 6, 3)
> -/* Skip MSTATUS_VS (0x600) bits */
> -FIELD(TB_FLAGS, VL_EQ_VLMAX, 11, 1)
> -FIELD(TB_FLAGS, VILL, 12, 1)
> -/* Skip MSTATUS_FS (0x6000) bits */
> +FIELD(TB_FLAGS, FS, 3, 2)
> +/* Vector flags */
> +FIELD(TB_FLAGS, VS, 5, 2)
> +FIELD(TB_FLAGS, LMUL, 7, 3)
> +FIELD(TB_FLAGS, SEW, 10, 3)
> +FIELD(TB_FLAGS, VL_EQ_VLMAX, 13, 1)
> +FIELD(TB_FLAGS, VILL, 14, 1)
>  /* Is a Hypervisor instruction load/store allowed? */
>  FIELD(TB_FLAGS, HLSX, 15, 1)
>  FIELD(TB_FLAGS, MSTATUS_HS_FS, 16, 2)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9d50e7bbb6..1e7ee9aa30 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -79,16 +79,17 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_=
ulong *pc,
>      }
>
>  #ifdef CONFIG_USER_ONLY
> -    flags |=3D TB_FLAGS_MSTATUS_FS;
> -    flags |=3D TB_FLAGS_MSTATUS_VS;
> +    flags =3D FIELD_DP32(flags, TB_FLAGS, FS, EXT_STATUS_DIRTY);
> +    flags =3D FIELD_DP32(flags, TB_FLAGS, VS, EXT_STATUS_DIRTY);
>  #else
>      flags |=3D cpu_mmu_index(env, 0);
>      if (riscv_cpu_fp_enabled(env)) {
> -        flags |=3D env->mstatus & MSTATUS_FS;
> +        flags =3D  FIELD_DP32(flags, TB_FLAGS, FS,
> +                            get_field(env->mstatus,  MSTATUS_FS));
>      }
> -
>      if (riscv_cpu_vector_enabled(env)) {
> -        flags |=3D env->mstatus & MSTATUS_VS;
> +        flags =3D  FIELD_DP32(flags, TB_FLAGS, VS,
> +                            get_field(env->mstatus, MSTATUS_VS));
>      }
>
>      if (riscv_has_ext(env, RVH)) {
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 880f6318aa..b897bf6006 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -64,10 +64,10 @@ typedef struct DisasContext {
>      RISCVMXL xl;
>      uint32_t misa_ext;
>      uint32_t opcode;
> -    uint32_t mstatus_fs;
> -    uint32_t mstatus_vs;
> -    uint32_t mstatus_hs_fs;
> -    uint32_t mstatus_hs_vs;
> +    RISCVExtStatus mstatus_fs;
> +    RISCVExtStatus mstatus_vs;
> +    RISCVExtStatus mstatus_hs_fs;
> +    RISCVExtStatus mstatus_hs_vs;
>      uint32_t mem_idx;
>      /* Remember the rounding mode encoded in the previous fp instruction=
,
>         which we have already installed into env->fp_status.  Or -1 for
> @@ -598,8 +598,7 @@ static TCGv get_address_indexed(DisasContext *ctx, in=
t rs1, TCGv offs)
>  }
>
>  #ifndef CONFIG_USER_ONLY
> -/* The states of mstatus_fs are:
> - * 0 =3D disabled, 1 =3D initial, 2 =3D clean, 3 =3D dirty
> +/*
>   * We will have already diagnosed disabled state,
>   * and need to turn initial/clean into dirty.
>   */
> @@ -611,9 +610,9 @@ static void mark_fs_dirty(DisasContext *ctx)
>          return;
>      }
>
> -    if (ctx->mstatus_fs !=3D MSTATUS_FS) {
> +    if (ctx->mstatus_fs !=3D EXT_STATUS_DIRTY) {
>          /* Remember the state change for the rest of the TB. */
> -        ctx->mstatus_fs =3D MSTATUS_FS;
> +        ctx->mstatus_fs =3D EXT_STATUS_DIRTY;
>
>          tmp =3D tcg_temp_new();
>          tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> @@ -621,9 +620,9 @@ static void mark_fs_dirty(DisasContext *ctx)
>          tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>      }
>
> -    if (ctx->virt_enabled && ctx->mstatus_hs_fs !=3D MSTATUS_FS) {
> +    if (ctx->virt_enabled && ctx->mstatus_hs_fs !=3D EXT_STATUS_DIRTY) {
>          /* Remember the stage change for the rest of the TB. */
> -        ctx->mstatus_hs_fs =3D MSTATUS_FS;
> +        ctx->mstatus_hs_fs =3D EXT_STATUS_DIRTY;
>
>          tmp =3D tcg_temp_new();
>          tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs))=
;
> @@ -636,8 +635,7 @@ static inline void mark_fs_dirty(DisasContext *ctx) {=
 }
>  #endif
>
>  #ifndef CONFIG_USER_ONLY
> -/* The states of mstatus_vs are:
> - * 0 =3D disabled, 1 =3D initial, 2 =3D clean, 3 =3D dirty
> +/*
>   * We will have already diagnosed disabled state,
>   * and need to turn initial/clean into dirty.
>   */
> @@ -645,9 +643,9 @@ static void mark_vs_dirty(DisasContext *ctx)
>  {
>      TCGv tmp;
>
> -    if (ctx->mstatus_vs !=3D MSTATUS_VS) {
> +    if (ctx->mstatus_vs !=3D EXT_STATUS_DIRTY) {
>          /* Remember the state change for the rest of the TB.  */
> -        ctx->mstatus_vs =3D MSTATUS_VS;
> +        ctx->mstatus_vs =3D EXT_STATUS_DIRTY;
>
>          tmp =3D tcg_temp_new();
>          tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> @@ -655,9 +653,9 @@ static void mark_vs_dirty(DisasContext *ctx)
>          tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>      }
>
> -    if (ctx->virt_enabled && ctx->mstatus_hs_vs !=3D MSTATUS_VS) {
> +    if (ctx->virt_enabled && ctx->mstatus_hs_vs !=3D EXT_STATUS_DIRTY) {
>          /* Remember the stage change for the rest of the TB. */
> -        ctx->mstatus_hs_vs =3D MSTATUS_VS;
> +        ctx->mstatus_hs_vs =3D EXT_STATUS_DIRTY;
>
>          tmp =3D tcg_temp_new();
>          tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs))=
;
> @@ -1153,8 +1151,8 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>
>      ctx->pc_succ_insn =3D ctx->base.pc_first;
>      ctx->mem_idx =3D FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
> -    ctx->mstatus_fs =3D tb_flags & TB_FLAGS_MSTATUS_FS;
> -    ctx->mstatus_vs =3D tb_flags & TB_FLAGS_MSTATUS_VS;
> +    ctx->mstatus_fs =3D FIELD_EX32(tb_flags, TB_FLAGS, FS);
> +    ctx->mstatus_vs =3D FIELD_EX32(tb_flags, TB_FLAGS, VS);
>      ctx->priv_ver =3D env->priv_ver;
>      ctx->virt_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, VIRT_ENABLED);
>      ctx->misa_ext =3D env->misa_ext;
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_=
trans/trans_rvf.c.inc
> index 052408f45c..31cd3d0e05 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -19,7 +19,7 @@
>   */
>
>  #define REQUIRE_FPU do {\
> -    if (ctx->mstatus_fs =3D=3D 0) \
> +    if (ctx->mstatus_fs =3D=3D EXT_STATUS_DISABLED) \
>          if (!ctx->cfg_ptr->ext_zfinx) \
>              return false; \
>  } while (0)
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index f2e3d38515..6297c3b50d 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -29,12 +29,12 @@ static inline bool is_overlapped(const int8_t astart,=
 int8_t asize,
>
>  static bool require_rvv(DisasContext *s)
>  {
> -    return s->mstatus_vs !=3D 0;
> +    return s->mstatus_vs !=3D EXT_STATUS_DISABLED;
>  }
>
>  static bool require_rvf(DisasContext *s)
>  {
> -    if (s->mstatus_fs =3D=3D 0) {
> +    if (s->mstatus_fs =3D=3D EXT_STATUS_DISABLED) {
>          return false;
>      }
>
> @@ -52,7 +52,7 @@ static bool require_rvf(DisasContext *s)
>
>  static bool require_scale_rvf(DisasContext *s)
>  {
> -    if (s->mstatus_fs =3D=3D 0) {
> +    if (s->mstatus_fs =3D=3D EXT_STATUS_DISABLED) {
>          return false;
>      }
>
> @@ -70,7 +70,7 @@ static bool require_scale_rvf(DisasContext *s)
>
>  static bool require_scale_rvfmin(DisasContext *s)
>  {
> -    if (s->mstatus_fs =3D=3D 0) {
> +    if (s->mstatus_fs =3D=3D EXT_STATUS_DISABLED) {
>          return false;
>      }
>
> --
> 2.34.1
>
>

