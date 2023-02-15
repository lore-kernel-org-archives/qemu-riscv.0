Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSDZq-0001cS-8K
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 03:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSDZo-0001bv-B9; Wed, 15 Feb 2023 03:55:44 -0500
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSDZl-0008RA-Gy; Wed, 15 Feb 2023 03:55:44 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VbjYntz_1676451331; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbjYntz_1676451331) by smtp.aliyun-inc.com;
 Wed, 15 Feb 2023 16:55:32 +0800
Message-ID: <adabbb03-aafe-5a3c-1ecb-6dddd6132be1@linux.alibaba.com>
Date: Wed, 15 Feb 2023 16:55:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 RFC Zisslpcfi 7/9] target/riscv: Tracking indirect
 branches (fcfi) using TCG
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com
Cc: Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-8-debug@rivosinc.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230209062404.3582018-8-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.97;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-97.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.35, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Wed, 15 Feb 2023 08:55:44 -0000


On 2023/2/9 14:24, Deepak Gupta wrote:
> zisslpcfi protects forward control flow (if enabled) by enforcing all
> indirect call and jmp must land on a landing pad instruction `lpcll`
> short for landing pad and check lower label value. If target of an
> indirect call or jmp is not `lpcll` then cpu/hart must raise an illegal
> instruction exception.
>
> This patch implements the mechanism using TCG. Target architecture branch
> instruction must define the end of a TB. Using this property, during
> translation of branch instruction, TB flag = FCFI_LP_EXPECTED can be set.
> Translation of target TB can check if FCFI_LP_EXPECTED flag is set and a
> flag (fcfi_lp_expected) can be set in DisasContext. If `lpcll` gets
> translated, fcfi_lp_expected flag in DisasContext can be cleared. Else
> it'll fault.
>
> This patch also also adds flag for forward and backward cfi in
> DisasContext.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Kip Walker  <kip@rivosinc.com>
> ---
>   target/riscv/cpu.h        |  3 +++
>   target/riscv/cpu_helper.c | 12 +++++++++
>   target/riscv/translate.c  | 52 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 67 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 8803ea6426..98b272bcad 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -644,6 +644,9 @@ FIELD(TB_FLAGS, VMA, 25, 1)
>   /* Native debug itrigger */
>   FIELD(TB_FLAGS, ITRIGGER, 26, 1)
>   
> +/* Zisslpcfi needs a TB flag to track indirect branches */
> +FIELD(TB_FLAGS, FCFI_LP_EXPECTED, 27, 1)
> +
>   #ifdef TARGET_RISCV32
>   #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
>   #else
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 63377abc2f..d15918f534 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -129,6 +129,18 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>           flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>       }
>   
> +    if (cpu->cfg.ext_cfi) {
> +        /*
> +         * For Forward CFI, only the expectation of a lpcll at
> +         * the start of the block is tracked (which can only happen
> +         * when FCFI is enabled for the current processor mode). A jump
> +         * or call at the end of the previous TB will have updated
> +         * env->elp to indicate the expectation.
> +         */
> +        flags = FIELD_DP32(flags, TB_FLAGS, FCFI_LP_EXPECTED,
> +                           env->elp != NO_LP_EXPECTED);
> +    }
> +
>   #ifdef CONFIG_USER_ONLY
>       flags |= TB_FLAGS_MSTATUS_FS;
>       flags |= TB_FLAGS_MSTATUS_VS;
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index df38db7553..7d43d20fc3 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -41,6 +41,7 @@ static TCGv load_val;
>   /* globals for PM CSRs */
>   static TCGv pm_mask;
>   static TCGv pm_base;
> +static TCGOp *cfi_lp_check;
>   
>   #include "exec/gen-icount.h"
>   
> @@ -116,6 +117,10 @@ typedef struct DisasContext {
>       bool itrigger;
>       /* TCG of the current insn_start */
>       TCGOp *insn_start;
> +    /* CFI extension */
> +    bool bcfi_enabled;
> +    bool fcfi_enabled;
> +    bool fcfi_lp_expected;
>   } DisasContext;
>   
>   static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> @@ -1166,11 +1171,44 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
>       ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
>       ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
> +    ctx->bcfi_enabled = cpu_get_bcfien(env);
> +    ctx->fcfi_enabled = cpu_get_fcfien(env);
This is wrong.  If you ctx->bcfi_enabled in the translation and don't 
put it in a tb flags field, the translated tb will
be misused.


Zhiwei

> +    ctx->fcfi_lp_expected = FIELD_EX32(tb_flags, TB_FLAGS, FCFI_LP_EXPECTED);
>       ctx->zero = tcg_constant_tl(0);
>   }
>   
>   static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
>   {
> +    DisasContext *ctx = container_of(db, DisasContext, base);
> +
> +    if (ctx->fcfi_lp_expected) {
> +        /*
> +         * Since we can't look ahead to confirm that the first
> +         * instruction is a legal landing pad instruction, emit
> +         * compare-and-branch sequence that will be fixed-up in
> +         * riscv_tr_tb_stop() to either statically hit or skip an
> +         * illegal instruction exception depending on whether the
> +         * flag was lowered by translation of a CJLP or JLP as
> +         * the first instruction in the block.
> +         */
> +        TCGv_i32 immediate;
> +        TCGLabel *l;
> +        l = gen_new_label();
> +        immediate = tcg_temp_local_new_i32();
> +        tcg_gen_movi_i32(immediate, 0);
> +        cfi_lp_check = tcg_last_op();
> +        tcg_gen_brcondi_i32(TCG_COND_EQ, immediate, 0, l);
> +        tcg_temp_free_i32(immediate);
> +        gen_exception_illegal(ctx);
> +        gen_set_label(l);
> +        /*
> +         * Despite the use of gen_exception_illegal(), the rest of
> +         * the TB needs to be generated. The TCG optimizer will
> +         * clean things up depending on which path ends up being
> +         * active.
> +         */
> +        ctx->base.is_jmp = DISAS_NEXT;
> +    }
>   }
>   
>   static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
> @@ -1225,6 +1263,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>   static void riscv_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>   {
>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
> +    CPURISCVState *env = cpu->env_ptr;
>   
>       switch (ctx->base.is_jmp) {
>       case DISAS_TOO_MANY:
> @@ -1235,6 +1274,19 @@ static void riscv_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>       default:
>           g_assert_not_reached();
>       }
> +
> +    if (ctx->fcfi_lp_expected) {
> +        /*
> +         * If the "lp expected" flag is still up, the block needs to take an
> +         * illegal instruction exception.
> +         */
> +        tcg_set_insn_param(cfi_lp_check, 1, tcgv_i32_arg(tcg_constant_i32(1)));
> +    } else {
> +        /*
> +        * LP instruction requirement was met, clear up LP expected
> +        */
> +        env->elp = NO_LP_EXPECTED;
> +    }
>   }
>   
>   static void riscv_tr_disas_log(const DisasContextBase *dcbase,

