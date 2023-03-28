Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgzFJ-0001gF-9A
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 22:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgzFG-0001fu-GP; Mon, 27 Mar 2023 22:39:34 -0400
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgzFD-00026P-9s; Mon, 27 Mar 2023 22:39:33 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VerC7Ab_1679971163; 
Received: from 30.221.98.176(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VerC7Ab_1679971163) by smtp.aliyun-inc.com;
 Tue, 28 Mar 2023 10:39:24 +0800
Message-ID: <0e7256b8-03e6-c65b-d916-954d6dbc8754@linux.alibaba.com>
Date: Tue, 28 Mar 2023 10:39:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 06/25] target/riscv: Separate priv from mmu_idx
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 fei2.wu@intel.com
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-7-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230325105429.1142530-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.118;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-118.freemail.mail.aliyun.com
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
X-List-Received-Date: Tue, 28 Mar 2023 02:39:35 -0000


On 2023/3/25 18:54, Richard Henderson wrote:
> From: Fei Wu <fei2.wu@intel.com>
>
> Currently it's assumed the 2 low bits of mmu_idx map to privilege mode,
> this assumption won't last as we are about to add more mmu_idx. Here an
> individual priv field is added into TB_FLAGS.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> Message-Id: <20230324054154.414846-2-fei2.wu@intel.com>
> ---
>   target/riscv/cpu.h                             | 2 +-
>   target/riscv/cpu_helper.c                      | 4 +++-
>   target/riscv/translate.c                       | 2 ++
>   target/riscv/insn_trans/trans_privileged.c.inc | 2 +-
>   target/riscv/insn_trans/trans_xthead.c.inc     | 7 +------
>   5 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 86a82e25dc..3e59dbb3fd 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -631,7 +631,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
>   target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>   void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>   
> -#define TB_FLAGS_PRIV_MMU_MASK                3
>   #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>   
>   #include "exec/cpu-all.h"
> @@ -658,6 +657,7 @@ FIELD(TB_FLAGS, ITRIGGER, 22, 1)
>   /* Virtual mode enabled */
>   FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
>   FIELD(TB_FLAGS, VSTART_EQ_ZERO, 24, 1)
> +FIELD(TB_FLAGS, PRIV, 25, 2)
Though I am not prefer this.  It is acceptable as the other patches will 
explicitly encode the mem_index in tb flags.
After that, this is necessary.
>   
>   #ifdef TARGET_RISCV32
>   #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 4f0999d50b..5753126c7a 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -83,6 +83,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>       fs = EXT_STATUS_DIRTY;
>       vs = EXT_STATUS_DIRTY;
>   #else
> +    flags = FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
> +
>       flags |= cpu_mmu_index(env, 0);
>       fs = get_field(env->mstatus, MSTATUS_FS);
>       vs = get_field(env->mstatus, MSTATUS_VS);
> @@ -764,7 +766,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>        * (riscv_cpu_do_interrupt) is correct */
>       MemTxResult res;
>       MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
> -    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
> +    int mode = env->priv;
>       bool use_background = false;
>       hwaddr ppn;
>       RISCVCPU *cpu = env_archcpu(env);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f8c077525c..abfc152553 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -67,6 +67,7 @@ typedef struct DisasContext {
>       RISCVExtStatus mstatus_fs;
>       RISCVExtStatus mstatus_vs;
>       uint32_t mem_idx;
> +    uint32_t priv;
>       /* Remember the rounding mode encoded in the previous fp instruction,
>          which we have already installed into env->fp_status.  Or -1 for
>          no previous fp instruction.  Note that we exit the TB when writing
> @@ -1140,6 +1141,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       uint32_t tb_flags = ctx->base.tb->flags;
>   
>       ctx->pc_succ_insn = ctx->base.pc_first;
> +    ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
>       ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
>       ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
>       ctx->mstatus_vs = FIELD_EX32(tb_flags, TB_FLAGS, VS);
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 59501b2780..9305b18299 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -52,7 +52,7 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
>        * that no exception will be raised when fetching them.
>        */
>   
> -    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
> +    if (semihosting_enabled(ctx->priv < PRV_S) &&
>           (pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
>           pre    = opcode_at(&ctx->base, pre_addr);
>           ebreak = opcode_at(&ctx->base, ebreak_addr);
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
> index df504c3f2c..adfb53cb4c 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -265,12 +265,7 @@ static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
>   
>   static inline int priv_level(DisasContext *ctx)
>   {
> -#ifdef CONFIG_USER_ONLY
> -    return PRV_U;
> -#else
> -     /* Priv level is part of mem_idx. */
> -    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
> -#endif
> +    return ctx->priv;
>   }

Could you  remove the priv_level and use ctx->priv directly in this file

Otherwise,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   
>   /* Test if priv level is M, S, or U (cannot fail). */

