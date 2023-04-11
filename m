Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm3Rn-0003oJ-3W
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 22:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm3Ri-0003nf-GA; Mon, 10 Apr 2023 22:09:22 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm3Rg-0008AV-RV; Mon, 10 Apr 2023 22:09:22 -0400
Received: by mail-ua1-x931.google.com with SMTP id f32so4715886uad.0;
 Mon, 10 Apr 2023 19:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681178958; x=1683770958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YCcdCCKqnz3qDMKXAIXI9LGc9xYvmSzQHEwHBCnsENA=;
 b=Us0jmzc85pn770qCSrX08tzz1Kap/169oet27d6wzMMBS6nvCZkf+Vi1jVJL8LoOc/
 TGRGQZQCfqm6ZIbouV/APMG2pym4VK7+nTAnzLV33I5IeTvMZXKRB6lYYju7Zlo/9+hi
 NLQczmkV40EZT9SuBfFsagNVvH0TZQ9srF2dj/mW4iEaK3jmgYyM48Le3q6LEV/r9cZT
 b4mxbgzJshU6RcKXH1T9W3Gk+cUipUbrQUs5hnfL8nVTAE0tIvniQCyIyepWq+tjxZE9
 KQrbvyHwn2l+saPvJTiAE3Z6HoNuDjugttbw4hMTTfoHNoOaA0HBtVEpd5qbqz87w7k1
 maxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681178958; x=1683770958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCcdCCKqnz3qDMKXAIXI9LGc9xYvmSzQHEwHBCnsENA=;
 b=7+YM6y2Kb252FpiPo7H1y7fEPM0q3H25TO4BM7LZ1JQRJRM4HDdqc0o7fzbYS2/Vgk
 IM4mLzgqgf0CsPAKOQMqVlyHbCknoM5Co72fvYWyDda1MEX6drceprnmyK2yWnkYbA3a
 OeEdgovkUsqSdzvp3j39UawunrpBPgD6/3AY7nXt9kxzt6vGH9XWYgl0RP3blf/xDPez
 jkEb+cTkLQLEpSgqezvYesaCrLCROgCl7wKAV+xSWr7QLbrARUwWwQBJW0NGD5hsDqjY
 NqrHUXTfMbhQxULfpag4HpcsvOdo2g3oSZ0ypgGdEKKpEFa/ji2+J6XXZs6FqbYT83kg
 pmjg==
X-Gm-Message-State: AAQBX9fyaokpCgosfTa4qcAyC6vNa9SPyBSCabs3GZJoyM9glfztKerP
 zD4YyGU3KQ6ybrLg7AJnDwo/+CQqCUzCVaEQC1Y4yEhyV1g=
X-Google-Smtp-Source: AKy350Y98mHPmcYVB29o1Uh2Ovk6Z6cp1viEigmW1pUaH0KmKdz8zo/j8yITAlaJUfTj4XXvkfszB6ABXt2+lkhlqQY=
X-Received: by 2002:a1f:270e:0:b0:43b:e059:987f with SMTP id
 n14-20020a1f270e000000b0043be059987fmr6916895vkn.0.1681178958417; Mon, 10 Apr
 2023 19:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-7-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-7-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 12:08:52 +1000
Message-ID: <CAKmqyKPFgdMWFJt5rN=ujSptyV_vroxCQbS2BS-=YU7C5FWm-A@mail.gmail.com>
Subject: Re: [PATCH v6 06/25] target/riscv: Separate priv from mmu_idx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 02:09:23 -0000

On Sat, Mar 25, 2023 at 10:01=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Fei Wu <fei2.wu@intel.com>
>
> Currently it's assumed the 2 low bits of mmu_idx map to privilege mode,
> this assumption won't last as we are about to add more mmu_idx. Here an
> individual priv field is added into TB_FLAGS.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> Message-Id: <20230324054154.414846-2-fei2.wu@intel.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h                             | 2 +-
>  target/riscv/cpu_helper.c                      | 4 +++-
>  target/riscv/translate.c                       | 2 ++
>  target/riscv/insn_trans/trans_privileged.c.inc | 2 +-
>  target/riscv/insn_trans/trans_xthead.c.inc     | 7 +------
>  5 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 86a82e25dc..3e59dbb3fd 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -631,7 +631,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *=
env,
>  target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>  void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>
> -#define TB_FLAGS_PRIV_MMU_MASK                3
>  #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>
>  #include "exec/cpu-all.h"
> @@ -658,6 +657,7 @@ FIELD(TB_FLAGS, ITRIGGER, 22, 1)
>  /* Virtual mode enabled */
>  FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
>  FIELD(TB_FLAGS, VSTART_EQ_ZERO, 24, 1)
> +FIELD(TB_FLAGS, PRIV, 25, 2)
>
>  #ifdef TARGET_RISCV32
>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 4f0999d50b..5753126c7a 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -83,6 +83,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ul=
ong *pc,
>      fs =3D EXT_STATUS_DIRTY;
>      vs =3D EXT_STATUS_DIRTY;
>  #else
> +    flags =3D FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
> +
>      flags |=3D cpu_mmu_index(env, 0);
>      fs =3D get_field(env->mstatus, MSTATUS_FS);
>      vs =3D get_field(env->mstatus, MSTATUS_VS);
> @@ -764,7 +766,7 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
>       * (riscv_cpu_do_interrupt) is correct */
>      MemTxResult res;
>      MemTxAttrs attrs =3D MEMTXATTRS_UNSPECIFIED;
> -    int mode =3D mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
> +    int mode =3D env->priv;
>      bool use_background =3D false;
>      hwaddr ppn;
>      RISCVCPU *cpu =3D env_archcpu(env);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f8c077525c..abfc152553 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -67,6 +67,7 @@ typedef struct DisasContext {
>      RISCVExtStatus mstatus_fs;
>      RISCVExtStatus mstatus_vs;
>      uint32_t mem_idx;
> +    uint32_t priv;
>      /* Remember the rounding mode encoded in the previous fp instruction=
,
>         which we have already installed into env->fp_status.  Or -1 for
>         no previous fp instruction.  Note that we exit the TB when writin=
g
> @@ -1140,6 +1141,7 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>      uint32_t tb_flags =3D ctx->base.tb->flags;
>
>      ctx->pc_succ_insn =3D ctx->base.pc_first;
> +    ctx->priv =3D FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
>      ctx->mem_idx =3D FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
>      ctx->mstatus_fs =3D FIELD_EX32(tb_flags, TB_FLAGS, FS);
>      ctx->mstatus_vs =3D FIELD_EX32(tb_flags, TB_FLAGS, VS);
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/risc=
v/insn_trans/trans_privileged.c.inc
> index 59501b2780..9305b18299 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -52,7 +52,7 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak =
*a)
>       * that no exception will be raised when fetching them.
>       */
>
> -    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
> +    if (semihosting_enabled(ctx->priv < PRV_S) &&
>          (pre_addr & TARGET_PAGE_MASK) =3D=3D (post_addr & TARGET_PAGE_MA=
SK)) {
>          pre    =3D opcode_at(&ctx->base, pre_addr);
>          ebreak =3D opcode_at(&ctx->base, ebreak_addr);
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index df504c3f2c..adfb53cb4c 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -265,12 +265,7 @@ static bool trans_th_tst(DisasContext *ctx, arg_th_t=
st *a)
>
>  static inline int priv_level(DisasContext *ctx)
>  {
> -#ifdef CONFIG_USER_ONLY
> -    return PRV_U;
> -#else
> -     /* Priv level is part of mem_idx. */
> -    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
> -#endif
> +    return ctx->priv;
>  }
>
>  /* Test if priv level is M, S, or U (cannot fail). */
> --
> 2.34.1
>
>

