Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgzHV-0002mK-Of
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 22:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgzHP-0002lc-OW; Mon, 27 Mar 2023 22:41:47 -0400
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgzHN-0007NC-HJ; Mon, 27 Mar 2023 22:41:47 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R911e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VerEK-s_1679971299; 
Received: from 30.221.98.176(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VerEK-s_1679971299) by smtp.aliyun-inc.com;
 Tue, 28 Mar 2023 10:41:40 +0800
Message-ID: <bd61fc0f-b491-934d-7288-64326b047823@linux.alibaba.com>
Date: Tue, 28 Mar 2023 10:41:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 07/25] target/riscv: Reduce overhead of MSTATUS_SUM
 change
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 fei2.wu@intel.com
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-8-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230325105429.1142530-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.100;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-100.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Mar 2023 02:41:48 -0000


On 2023/3/25 18:54, Richard Henderson wrote:
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
> ---
>   target/riscv/cpu.h                      |  2 --
>   target/riscv/internals.h                | 14 ++++++++++++++
>   target/riscv/cpu_helper.c               | 17 +++++++++++++++--
>   target/riscv/csr.c                      |  3 +--
>   target/riscv/op_helper.c                |  5 +++--
>   target/riscv/insn_trans/trans_rvh.c.inc |  4 ++--
>   6 files changed, 35 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3e59dbb3fd..5e589db106 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -631,8 +631,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
>   target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>   void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>   
> -#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
> -
>   #include "exec/cpu-all.h"
>   
>   FIELD(TB_FLAGS, MEM_IDX, 0, 3)
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 5620fbffb6..b55152a7dc 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -21,6 +21,20 @@
>   
>   #include "hw/registerfields.h"
>   
> +/*
> + * The current MMU Modes are:
> + *  - U                 0b000
> + *  - S                 0b001
> + *  - S+SUM             0b010
> + *  - M                 0b011
> + *  - HLV/HLVX/HSV adds 0b100

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> + */
> +#define MMUIdx_U            0
> +#define MMUIdx_S            1
> +#define MMUIdx_S_SUM        2
> +#define MMUIdx_M            3
> +#define MMU_HYP_ACCESS_BIT  (1 << 2)
> +
>   /* share data between vector helpers and decode code */
>   FIELD(VDATA, VM, 0, 1)
>   FIELD(VDATA, LMUL, 1, 3)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 5753126c7a..052fdd2d9d 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -21,6 +21,7 @@
>   #include "qemu/log.h"
>   #include "qemu/main-loop.h"
>   #include "cpu.h"
> +#include "internals.h"
>   #include "pmu.h"
>   #include "exec/exec-all.h"
>   #include "instmap.h"
> @@ -36,7 +37,19 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>   #ifdef CONFIG_USER_ONLY
>       return 0;
>   #else
> -    return env->priv;
> +    if (ifetch) {
> +        return env->priv;
> +    }
> +
> +    /* All priv -> mmu_idx mapping are here */
> +    int mode = env->priv;
> +    if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
> +        mode = get_field(env->mstatus, MSTATUS_MPP);
> +    }
> +    if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
> +        return MMUIdx_S_SUM;
> +    }
> +    return mode;
>   #endif
>   }
>   
> @@ -600,7 +613,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
>   
>   bool riscv_cpu_two_stage_lookup(int mmu_idx)
>   {
> -    return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +    return mmu_idx & MMU_HYP_ACCESS_BIT;
>   }
>   
>   int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index abea7b749e..b79758a606 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1246,8 +1246,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>       RISCVMXL xl = riscv_cpu_mxl(env);
>   
>       /* flush tlb on mstatus fields that affect VM */
> -    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
> -            MSTATUS_MPRV | MSTATUS_SUM)) {
> +    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPV)) {
>           tlb_flush(env_cpu(env));
>       }
>       mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 84ee018f7d..962a061228 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -20,6 +20,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> +#include "internals.h"
>   #include "qemu/main-loop.h"
>   #include "exec/exec-all.h"
>   #include "exec/helper-proto.h"
> @@ -428,14 +429,14 @@ void helper_hyp_gvma_tlb_flush(CPURISCVState *env)
>   
>   target_ulong helper_hyp_hlvx_hu(CPURISCVState *env, target_ulong address)
>   {
> -    int mmu_idx = cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +    int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
>   
>       return cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
>   }
>   
>   target_ulong helper_hyp_hlvx_wu(CPURISCVState *env, target_ulong address)
>   {
> -    int mmu_idx = cpu_mmu_index(env, true) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +    int mmu_idx = cpu_mmu_index(env, true) | MMU_HYP_ACCESS_BIT;
>   
>       return cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
>   }
> diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
> index 9248b48c36..15842f4282 100644
> --- a/target/riscv/insn_trans/trans_rvh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvh.c.inc
> @@ -40,7 +40,7 @@ static bool do_hlv(DisasContext *ctx, arg_r2 *a, MemOp mop)
>       if (check_access(ctx)) {
>           TCGv dest = dest_gpr(ctx, a->rd);
>           TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
> -        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +        int mem_idx = ctx->mem_idx | MMU_HYP_ACCESS_BIT;
>           tcg_gen_qemu_ld_tl(dest, addr, mem_idx, mop);
>           gen_set_gpr(ctx, a->rd, dest);
>       }
> @@ -87,7 +87,7 @@ static bool do_hsv(DisasContext *ctx, arg_r2_s *a, MemOp mop)
>       if (check_access(ctx)) {
>           TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
>           TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
> -        int mem_idx = ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +        int mem_idx = ctx->mem_idx | MMU_HYP_ACCESS_BIT;
>           tcg_gen_qemu_st_tl(data, addr, mem_idx, mop);
>       }
>       return true;

