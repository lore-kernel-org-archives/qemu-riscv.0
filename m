Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1orrSr-0003NI-5g
	for mharc-qemu-riscv@gnu.org; Sun, 06 Nov 2022 21:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1orrSi-0003L1-6w; Sun, 06 Nov 2022 21:02:08 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1orrST-0006ch-UK; Sun, 06 Nov 2022 21:02:07 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0VU5.aRZ_1667786499; 
Received: from 30.221.97.86(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VU5.aRZ_1667786499) by smtp.aliyun-inc.com;
 Mon, 07 Nov 2022 10:01:41 +0800
Message-ID: <ebdbec47-9dbe-e1a2-5033-9421710debb6@linux.alibaba.com>
Date: Mon, 7 Nov 2022 10:01:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 1/4] target/riscv: Add itrigger support when icount is
 not enabled
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 palmer@dabbelt.com, bin.meng@windriver.com,
 sergey.matyukevich@syntacore.com, vladimir.isaev@syntacore.com,
 anatoly.parshintsev@syntacore.com, philipp.tomsich@vrull.eu,
 zhiwei_liu@c-sky.com
References: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
 <20221013062946.7530-2-zhiwei_liu@linux.alibaba.com>
 <CAKmqyKNTyCvjjYOrgAttW36ygGBibTHjA_f1b5AAWp+pF-xAiA@mail.gmail.com>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <CAKmqyKNTyCvjjYOrgAttW36ygGBibTHjA_f1b5AAWp+pF-xAiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.42;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-42.freemail.mail.aliyun.com
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
X-List-Received-Date: Mon, 07 Nov 2022 02:02:10 -0000


On 2022/11/7 9:37, Alistair Francis wrote:
> On Thu, Oct 13, 2022 at 4:32 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>> When icount is not enabled, there is no API in QEMU that can get the
>> guest instruction number.
>>
>> Translate the guest code in a way that each TB only has one instruction.
> I don't think this is a great idea.
>
> Why can't we just require icount be enabled if a user wants this? Or singlestep?

This feature will only be used by users who want to  run the native gdb 
on Linux. If we run QEMU as a service,  after booting the kernel, we 
can't predicate whether the users will use native gdb.

Besides, icount can't be enabled on MTTCG currently (I am working on 
this problem) and I don't want to constraint the use of MTTCG even  when 
it is possible the users use native gdb (which may only occupy just a 
little time).


Thus, I give this fallback way to implement the itrigger.  The icount 
parameter can be used as an accelerated way.

Thanks,
Zhiwei

>
> Alistair
>
>> After executing the instruction, decrease the count by 1 until it reaches 0
>> where the itrigger fires.
>>
>> Note that only when priviledge matches the itrigger configuration,
>> the count will decrease.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> ---
>>   target/riscv/cpu.h                            |  2 +
>>   target/riscv/cpu_helper.c                     |  6 ++
>>   target/riscv/debug.c                          | 71 +++++++++++++++++++
>>   target/riscv/debug.h                          | 12 ++++
>>   target/riscv/helper.h                         |  2 +
>>   .../riscv/insn_trans/trans_privileged.c.inc   |  4 +-
>>   target/riscv/insn_trans/trans_rvi.c.inc       |  8 +--
>>   target/riscv/insn_trans/trans_rvv.c.inc       |  4 +-
>>   target/riscv/translate.c                      | 33 ++++++++-
>>   9 files changed, 131 insertions(+), 11 deletions(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index b131fa8c8e..24bafda27d 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -621,6 +621,8 @@ FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
>>   FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
>>   FIELD(TB_FLAGS, VTA, 24, 1)
>>   FIELD(TB_FLAGS, VMA, 25, 1)
>> +/* Native debug itrigger */
>> +FIELD(TB_FLAGS, ITRIGGER, 26, 1)
>>
>>   #ifdef TARGET_RISCV32
>>   #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 278d163803..263282f230 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -27,7 +27,9 @@
>>   #include "tcg/tcg-op.h"
>>   #include "trace.h"
>>   #include "semihosting/common-semi.h"
>> +#include "sysemu/cpu-timers.h"
>>   #include "cpu_bits.h"
>> +#include "debug.h"
>>
>>   int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>>   {
>> @@ -103,6 +105,10 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>>           flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
>>                              get_field(env->mstatus_hs, MSTATUS_VS));
>>       }
>> +    if (riscv_feature(env, RISCV_FEATURE_DEBUG) && !icount_enabled()) {
>> +        flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER,
>> +                           riscv_itrigger_enabled(env));
>> +    }
>>   #endif
>>
>>       flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
>> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
>> index 26ea764407..45a3537d5c 100644
>> --- a/target/riscv/debug.c
>> +++ b/target/riscv/debug.c
>> @@ -29,6 +29,7 @@
>>   #include "cpu.h"
>>   #include "trace.h"
>>   #include "exec/exec-all.h"
>> +#include "exec/helper-proto.h"
>>
>>   /*
>>    * The following M-mode trigger CSRs are implemented:
>> @@ -498,6 +499,76 @@ static void type6_reg_write(CPURISCVState *env, target_ulong index,
>>       return;
>>   }
>>
>> +/* icount trigger type */
>> +static inline int
>> +itrigger_get_count(CPURISCVState *env, int index)
>> +{
>> +    return get_field(env->tdata1[index], ITRIGGER_COUNT);
>> +}
>> +
>> +static inline void
>> +itrigger_set_count(CPURISCVState *env, int index, int value)
>> +{
>> +    env->tdata1[index] = set_field(env->tdata1[index],
>> +                                   ITRIGGER_COUNT, value);
>> +}
>> +
>> +static bool check_itrigger_priv(CPURISCVState *env, int index)
>> +{
>> +    target_ulong tdata1 = env->tdata1[index];
>> +    if (riscv_cpu_virt_enabled(env)) {
>> +        /* check VU/VS bit against current privilege level */
>> +        return (get_field(tdata1, ITRIGGER_VS) == env->priv) ||
>> +               (get_field(tdata1, ITRIGGER_VU) == env->priv);
>> +    } else {
>> +        /* check U/S/M bit against current privilege level */
>> +        return (get_field(tdata1, ITRIGGER_M) == env->priv) ||
>> +               (get_field(tdata1, ITRIGGER_S) == env->priv) ||
>> +               (get_field(tdata1, ITRIGGER_U) == env->priv);
>> +    }
>> +}
>> +
>> +bool riscv_itrigger_enabled(CPURISCVState *env)
>> +{
>> +    int count;
>> +    for (int i = 0; i < RV_MAX_TRIGGERS; i++) {
>> +        if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
>> +            continue;
>> +        }
>> +        if (check_itrigger_priv(env, i)) {
>> +            continue;
>> +        }
>> +        count = itrigger_get_count(env, i);
>> +        if (!count) {
>> +            continue;
>> +        }
>> +        return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +void helper_itrigger_match(CPURISCVState *env)
>> +{
>> +    int count;
>> +    for (int i = 0; i < RV_MAX_TRIGGERS; i++) {
>> +        if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
>> +            continue;
>> +        }
>> +        if (check_itrigger_priv(env, i)) {
>> +            continue;
>> +        }
>> +        count = itrigger_get_count(env, i);
>> +        if (!count) {
>> +            continue;
>> +        }
>> +        itrigger_set_count(env, i, count--);
>> +        if (!count) {
>> +            do_trigger_action(env, i);
>> +        }
>> +    }
>> +}
>> +
>>   target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
>>   {
>>       switch (tdata_index) {
>> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
>> index a1226b4d29..cc3358e69b 100644
>> --- a/target/riscv/debug.h
>> +++ b/target/riscv/debug.h
>> @@ -118,6 +118,17 @@ enum {
>>       SIZE_NUM = 16
>>   };
>>
>> +/* itrigger filed masks */
>> +#define ITRIGGER_ACTION       0x3f
>> +#define ITRIGGER_U            BIT(6)
>> +#define ITRIGGER_S            BIT(7)
>> +#define ITRIGGER_PENDING      BIT(8)
>> +#define ITRIGGER_M            BIT(9)
>> +#define ITRIGGER_COUNT        (0x3fff << 10)
>> +#define ITRIGGER_HIT          BIT(24)
>> +#define ITRIGGER_VU           BIT(25)
>> +#define ITRIGGER_VS           BIT(26)
>> +
>>   bool tdata_available(CPURISCVState *env, int tdata_index);
>>
>>   target_ulong tselect_csr_read(CPURISCVState *env);
>> @@ -134,4 +145,5 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
>>
>>   void riscv_trigger_init(CPURISCVState *env);
>>
>> +bool riscv_itrigger_enabled(CPURISCVState *env);
>>   #endif /* RISCV_DEBUG_H */
>> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
>> index a03014fe67..227c7122ef 100644
>> --- a/target/riscv/helper.h
>> +++ b/target/riscv/helper.h
>> @@ -109,6 +109,8 @@ DEF_HELPER_1(sret, tl, env)
>>   DEF_HELPER_1(mret, tl, env)
>>   DEF_HELPER_1(wfi, void, env)
>>   DEF_HELPER_1(tlb_flush, void, env)
>> +/* Native Debug */
>> +DEF_HELPER_1(itrigger_match, void, env)
>>   #endif
>>
>>   /* Hypervisor functions */
>> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
>> index 3281408a87..59501b2780 100644
>> --- a/target/riscv/insn_trans/trans_privileged.c.inc
>> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
>> @@ -78,7 +78,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
>>       if (has_ext(ctx, RVS)) {
>>           decode_save_opc(ctx);
>>           gen_helper_sret(cpu_pc, cpu_env);
>> -        tcg_gen_exit_tb(NULL, 0); /* no chaining */
>> +        exit_tb(ctx); /* no chaining */
>>           ctx->base.is_jmp = DISAS_NORETURN;
>>       } else {
>>           return false;
>> @@ -94,7 +94,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
>>   #ifndef CONFIG_USER_ONLY
>>       decode_save_opc(ctx);
>>       gen_helper_mret(cpu_pc, cpu_env);
>> -    tcg_gen_exit_tb(NULL, 0); /* no chaining */
>> +    exit_tb(ctx); /* no chaining */
>>       ctx->base.is_jmp = DISAS_NORETURN;
>>       return true;
>>   #else
>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
>> index c49dbec0eb..5c69b88d1e 100644
>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>> @@ -66,7 +66,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>>       }
>>
>>       gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
>> -    tcg_gen_lookup_and_goto_ptr();
>> +    lookup_and_goto_ptr(ctx);
>>
>>       if (misaligned) {
>>           gen_set_label(misaligned);
>> @@ -803,7 +803,7 @@ static bool trans_pause(DisasContext *ctx, arg_pause *a)
>>        * end the TB and return to main loop
>>        */
>>       gen_set_pc_imm(ctx, ctx->pc_succ_insn);
>> -    tcg_gen_exit_tb(NULL, 0);
>> +    exit_tb(ctx);
>>       ctx->base.is_jmp = DISAS_NORETURN;
>>
>>       return true;
>> @@ -827,7 +827,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
>>        * however we need to end the translation block
>>        */
>>       gen_set_pc_imm(ctx, ctx->pc_succ_insn);
>> -    tcg_gen_exit_tb(NULL, 0);
>> +    exit_tb(ctx);
>>       ctx->base.is_jmp = DISAS_NORETURN;
>>       return true;
>>   }
>> @@ -838,7 +838,7 @@ static bool do_csr_post(DisasContext *ctx)
>>       decode_save_opc(ctx);
>>       /* We may have changed important cpu state -- exit to main loop. */
>>       gen_set_pc_imm(ctx, ctx->pc_succ_insn);
>> -    tcg_gen_exit_tb(NULL, 0);
>> +    exit_tb(ctx);
>>       ctx->base.is_jmp = DISAS_NORETURN;
>>       return true;
>>   }
>> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
>> index 4dea4413ae..d455acedbf 100644
>> --- a/target/riscv/insn_trans/trans_rvv.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
>> @@ -196,7 +196,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
>>       mark_vs_dirty(s);
>>
>>       gen_set_pc_imm(s, s->pc_succ_insn);
>> -    tcg_gen_lookup_and_goto_ptr();
>> +    lookup_and_goto_ptr(s);
>>       s->base.is_jmp = DISAS_NORETURN;
>>
>>       if (rd == 0 && rs1 == 0) {
>> @@ -222,7 +222,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
>>       gen_set_gpr(s, rd, dst);
>>       mark_vs_dirty(s);
>>       gen_set_pc_imm(s, s->pc_succ_insn);
>> -    tcg_gen_lookup_and_goto_ptr();
>> +    lookup_and_goto_ptr(s);
>>       s->base.is_jmp = DISAS_NORETURN;
>>
>>       return true;
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index db123da5ec..d704265a37 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -111,6 +111,8 @@ typedef struct DisasContext {
>>       /* PointerMasking extension */
>>       bool pm_mask_enabled;
>>       bool pm_base_enabled;
>> +    /* Use icount trigger for native debug */
>> +    bool itrigger;
>>       /* TCG of the current insn_start */
>>       TCGOp *insn_start;
>>   } DisasContext;
>> @@ -252,15 +254,39 @@ static void gen_exception_inst_addr_mis(DisasContext *ctx)
>>       generate_exception(ctx, RISCV_EXCP_INST_ADDR_MIS);
>>   }
>>
>> +static void lookup_and_goto_ptr(DisasContext *ctx)
>> +{
>> +#ifndef CONFIG_USER_ONLY
>> +    if (ctx->itrigger) {
>> +        gen_helper_itrigger_match(cpu_env);
>> +    }
>> +#endif
>> +    tcg_gen_lookup_and_goto_ptr();
>> +}
>> +
>> +static void exit_tb(DisasContext *ctx)
>> +{
>> +#ifndef CONFIG_USER_ONLY
>> +    if (ctx->itrigger) {
>> +        gen_helper_itrigger_match(cpu_env);
>> +    }
>> +#endif
>> +    tcg_gen_exit_tb(NULL, 0);
>> +}
>> +
>>   static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>>   {
>> -    if (translator_use_goto_tb(&ctx->base, dest)) {
>> +     /*
>> +      * Under itrigger, instruction executes one by one like singlestep,
>> +      * direct block chain benefits will be small.
>> +      */
>> +    if (translator_use_goto_tb(&ctx->base, dest) && !ctx->itrigger) {
>>           tcg_gen_goto_tb(n);
>>           gen_set_pc_imm(ctx, dest);
>>           tcg_gen_exit_tb(ctx->base.tb, n);
>>       } else {
>>           gen_set_pc_imm(ctx, dest);
>> -        tcg_gen_lookup_and_goto_ptr();
>> +        lookup_and_goto_ptr(ctx);
>>       }
>>   }
>>
>> @@ -1136,6 +1162,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>       memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
>>       ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
>>       ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
>> +    ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
>>       ctx->zero = tcg_constant_tl(0);
>>   }
>>
>> @@ -1175,7 +1202,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>>
>>       /* Only the first insn within a TB is allowed to cross a page boundary. */
>>       if (ctx->base.is_jmp == DISAS_NEXT) {
>> -        if (!is_same_page(&ctx->base, ctx->base.pc_next)) {
>> +        if (ctx->itrigger || !is_same_page(&ctx->base, ctx->base.pc_next)) {
>>               ctx->base.is_jmp = DISAS_TOO_MANY;
>>           } else {
>>               unsigned page_ofs = ctx->base.pc_next & ~TARGET_PAGE_MASK;
>> --
>> 2.17.1
>>
>>

