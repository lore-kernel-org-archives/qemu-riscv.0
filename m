Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm3Ui-0006rB-Gl
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 22:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm3Ug-0006pW-RK; Mon, 10 Apr 2023 22:12:26 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm3Ue-0000MS-TT; Mon, 10 Apr 2023 22:12:26 -0400
Received: by mail-vs1-xe29.google.com with SMTP id z13so6256387vss.1;
 Mon, 10 Apr 2023 19:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681179143; x=1683771143;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dC3Fq3XYZFtXrP/AgkSO0HZj1U8Mswb21Kd+qYKBsmA=;
 b=XBGdJArwcITsfRWmfnom5cHLQXnTlZe5qsC9EscuK5QBl+9E6E8RWjXqamsIfgw4bd
 SutfhJlhZe83SbIHR01CBIW50UHPI5bc11NpBG0zTiGL9xKRSv9kyOOGZrvrjVf9HyVZ
 cpFzwNg0vTMyib6DpanjQGqAsP3b5kz9zyYMgaNk1FA6C8daeDyNmsY0AAjVGb2Ph70B
 i9PP97Swnwq5P6Q0+qFKjg1PXvWTzdwKDWxMbhScjj4JmpMCLuqUqIdcQManIyQP6AnY
 0XLanoSbxqFqCkEPOqkA2PiPEbhit9HSADdE11S4tn54y2+V0GdD4piq1UGna32PGNmm
 WwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681179143; x=1683771143;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dC3Fq3XYZFtXrP/AgkSO0HZj1U8Mswb21Kd+qYKBsmA=;
 b=GhtT1fZBXn1mMsC9wo+e0fbL+z+cBRq76XwBXrgWOwhq4bzuvOIWO4atU4ZjKNS7cM
 VxZOTBmCsylhrrgqbo+uALOYYiVI/CP6If4FxECQLK1xndC1O24jQtY6M+j4LNt8c7+e
 vtNXpr7DeD/PrmhPvZfLnMMh3xoeWGcgLrLw3uxVINV3EF9tZwDXOgK+WC1CtATO03pw
 WIhyiZoh1m675RvlC8qBZm8BXpiyF2ERAZmPRdtppnmGAX5lCEIbzGDJk2z9wj+j1qtY
 3h6UanYNZx/p5VpLkObOteSpSVN4nj0DfLd6V/j8YB/6klXV4okzEHm5OrwNg2SwU2+8
 5STA==
X-Gm-Message-State: AAQBX9fBYtVqBItChwhcb0W2or95+V0HKqLjo3fpDR3+DEF6p0QoBAlg
 TLEd/LSI6F+f/7t6q8wP5RLC3eN99KNd8nsx9M/BWZnsj0s=
X-Google-Smtp-Source: AKy350brWgiAwHyPYv2Gpuy3EgpBQnm/rana50u7XeZzM7hlcYJ+ybccYeE9/rAkBBLTU0mDzTLmZ2qATo/VMPbKTqQ=
X-Received: by 2002:a67:c81c:0:b0:42c:33ab:97fd with SMTP id
 u28-20020a67c81c000000b0042c33ab97fdmr6188152vsk.3.1681179143586; Mon, 10 Apr
 2023 19:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-8-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-8-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 12:11:57 +1000
Message-ID: <CAKmqyKMLR0uwWu4Xtht+oOVXp-dyznG4OeGrvONLa+9hLRSYow@mail.gmail.com>
Subject: Re: [PATCH v6 07/25] target/riscv: Reduce overhead of MSTATUS_SUM
 change
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
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
X-List-Received-Date: Tue, 11 Apr 2023 02:12:27 -0000

On Sat, Mar 25, 2023 at 9:57=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Fei Wu <fei2.wu@intel.com>
>
> Kernel needs to access user mode memory e.g. during syscalls, the window
> is usually opened up for a very limited time through MSTATUS.SUM, the
> overhead is too much if tlb_flush() gets called for every SUM change.
>
> This patch creates a separate MMU index for S+SUM, so that it's not
> necessary to flush tlb anymore when SUM changes. This is similar to how
> ARM handles Privileged Access Never (PAN).
>
> Result of 'pipe 10' from unixbench boosts from 223656 to 1705006. Many
> other syscalls benefit a lot from this too.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> Message-Id: <20230324054154.414846-3-fei2.wu@intel.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h                      |  2 --
>  target/riscv/internals.h                | 14 ++++++++++++++
>  target/riscv/cpu_helper.c               | 17 +++++++++++++++--
>  target/riscv/csr.c                      |  3 +--
>  target/riscv/op_helper.c                |  5 +++--
>  target/riscv/insn_trans/trans_rvh.c.inc |  4 ++--
>  6 files changed, 35 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3e59dbb3fd..5e589db106 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -631,8 +631,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *=
env,
>  target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>  void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>
> -#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
> -
>  #include "exec/cpu-all.h"
>
>  FIELD(TB_FLAGS, MEM_IDX, 0, 3)
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 5620fbffb6..b55152a7dc 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -21,6 +21,20 @@
>
>  #include "hw/registerfields.h"
>
> +/*
> + * The current MMU Modes are:
> + *  - U                 0b000
> + *  - S                 0b001
> + *  - S+SUM             0b010
> + *  - M                 0b011
> + *  - HLV/HLVX/HSV adds 0b100
> + */
> +#define MMUIdx_U            0
> +#define MMUIdx_S            1
> +#define MMUIdx_S_SUM        2
> +#define MMUIdx_M            3
> +#define MMU_HYP_ACCESS_BIT  (1 << 2)
> +
>  /* share data between vector helpers and decode code */
>  FIELD(VDATA, VM, 0, 1)
>  FIELD(VDATA, LMUL, 1, 3)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 5753126c7a..052fdd2d9d 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -21,6 +21,7 @@
>  #include "qemu/log.h"
>  #include "qemu/main-loop.h"
>  #include "cpu.h"
> +#include "internals.h"
>  #include "pmu.h"
>  #include "exec/exec-all.h"
>  #include "instmap.h"
> @@ -36,7 +37,19 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetc=
h)
>  #ifdef CONFIG_USER_ONLY
>      return 0;
>  #else
> -    return env->priv;
> +    if (ifetch) {
> +        return env->priv;
> +    }
> +
> +    /* All priv -> mmu_idx mapping are here */
> +    int mode =3D env->priv;
> +    if (mode =3D=3D PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
> +        mode =3D get_field(env->mstatus, MSTATUS_MPP);
> +    }
> +    if (mode =3D=3D PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
> +        return MMUIdx_S_SUM;
> +    }
> +    return mode;
>  #endif
>  }
>
> @@ -600,7 +613,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, b=
ool enable)
>
>  bool riscv_cpu_two_stage_lookup(int mmu_idx)
>  {
> -    return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +    return mmu_idx & MMU_HYP_ACCESS_BIT;
>  }
>
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index abea7b749e..b79758a606 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1246,8 +1246,7 @@ static RISCVException write_mstatus(CPURISCVState *=
env, int csrno,
>      RISCVMXL xl =3D riscv_cpu_mxl(env);
>
>      /* flush tlb on mstatus fields that affect VM */
> -    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
> -            MSTATUS_MPRV | MSTATUS_SUM)) {
> +    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPV)) {
>          tlb_flush(env_cpu(env));
>      }
>      mask =3D MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 84ee018f7d..962a061228 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -20,6 +20,7 @@
>
>  #include "qemu/osdep.h"
>  #include "cpu.h"
> +#include "internals.h"
>  #include "qemu/main-loop.h"
>  #include "exec/exec-all.h"
>  #include "exec/helper-proto.h"
> @@ -428,14 +429,14 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
>
>  target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address=
)
>  {
> -    int mmu_idx =3D cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_=
MASK;
> +    int mmu_idx =3D cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
>
>      return cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
>  }
>
>  target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address=
)
>  {
> -    int mmu_idx =3D cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_=
MASK;
> +    int mmu_idx =3D cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
>
>      return cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
>  }
> diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_=
trans/trans_rvh.c.inc
> index 9248b48c36..15842f4282 100644
> --- a/target/riscv/insn_trans/trans_rvh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvh.c.inc
> @@ -40,7 +40,7 @@ static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp =
mop)
>      if (check_access(ctx)) {
>          TCGv dest =3D dest_gpr(ctx, a->rd);
>          TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
> -        int mem_idx =3D ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +        int mem_idx =3D ctx->mem_idx | MMU_HYP_ACCESS_BIT;
>          tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
>          gen_set_gpr(ctx, a->rd, dest);
>      }
> @@ -87,7 +87,7 @@ static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemO=
p mop)
>      if (check_access(ctx)) {
>          TCGv addr =3D get_gpr(ctx, a->rs1, EXT_NONE);
>          TCGv data =3D get_gpr(ctx, a->rs2, EXT_NONE);
> -        int mem_idx =3D ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +        int mem_idx =3D ctx->mem_idx | MMU_HYP_ACCESS_BIT;
>          tcg_gen_qemu_st_tl(data, addr, mem_idx, mop);
>      }
>      return true;
> --
> 2.34.1
>
>

