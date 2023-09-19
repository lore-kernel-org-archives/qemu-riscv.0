Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33560CD54B2
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 11:09:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiYbe-0007ln-Ai; Tue, 19 Sep 2023 07:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiYbb-0007lK-Qh; Tue, 19 Sep 2023 07:09:23 -0400
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiYbX-0003sg-W8; Tue, 19 Sep 2023 07:09:23 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VsRHlCG_1695121744; 
Received: from 30.221.108.237(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VsRHlCG_1695121744) by smtp.aliyun-inc.com;
 Tue, 19 Sep 2023 19:09:05 +0800
Message-ID: <699fc2a8-269f-3afc-8da9-e42c00ae8236@linux.alibaba.com>
Date: Tue, 19 Sep 2023 19:08:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 04/19] target/riscv: move riscv_tcg_ops to tcg-cpu.c
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com, ajones@ventanamicro.com,
 philmd@linaro.org
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-5-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230906091647.1667171-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.97;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-97.freemail.mail.aliyun.com
X-Spam_score_int: -113
X-Spam_score: -11.4
X-Spam_bar: -----------
X-Spam_report: (-11.4 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


On 2023/9/6 17:16, Daniel Henrique Barboza wrote:
> Move the remaining of riscv_tcg_ops now that we have a working realize()
> implementation.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> ---
>   target/riscv/cpu.c         | 58 ------------------------------------
>   target/riscv/cpu.h         |  4 ---
>   target/riscv/tcg/tcg-cpu.c | 60 +++++++++++++++++++++++++++++++++++++-
>   3 files changed, 59 insertions(+), 63 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e186c026c9..7569955c7e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -838,24 +838,6 @@ static vaddr riscv_cpu_get_pc(CPUState *cs)
>       return env->pc;
>   }
>   
> -static void riscv_cpu_synchronize_from_tb(CPUState *cs,
> -                                          const TranslationBlock *tb)
> -{
> -    if (!(tb_cflags(tb) & CF_PCREL)) {
> -        RISCVCPU *cpu = RISCV_CPU(cs);
> -        CPURISCVState *env = &cpu->env;
> -        RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
> -
> -        tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
> -
> -        if (xl == MXL_RV32) {
> -            env->pc = (int32_t) tb->pc;
> -        } else {
> -            env->pc = tb->pc;
> -        }
> -    }
> -}
> -
>   static bool riscv_cpu_has_work(CPUState *cs)
>   {
>   #ifndef CONFIG_USER_ONLY
> @@ -871,29 +853,6 @@ static bool riscv_cpu_has_work(CPUState *cs)
>   #endif
>   }
>   
> -static void riscv_restore_state_to_opc(CPUState *cs,
> -                                       const TranslationBlock *tb,
> -                                       const uint64_t *data)
> -{
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> -    CPURISCVState *env = &cpu->env;
> -    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
> -    target_ulong pc;
> -
> -    if (tb_cflags(tb) & CF_PCREL) {
> -        pc = (env->pc & TARGET_PAGE_MASK) | data[0];
> -    } else {
> -        pc = data[0];
> -    }
> -
> -    if (xl == MXL_RV32) {
> -        env->pc = (int32_t)pc;
> -    } else {
> -        env->pc = pc;
> -    }
> -    env->bins = data[1];
> -}
> -
>   static void riscv_cpu_reset_hold(Object *obj)
>   {
>   #ifndef CONFIG_USER_ONLY
> @@ -1811,23 +1770,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
>   };
>   #endif
>   
> -const struct TCGCPUOps riscv_tcg_ops = {
> -    .initialize = riscv_translate_init,
> -    .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
> -    .restore_state_to_opc = riscv_restore_state_to_opc,
> -
> -#ifndef CONFIG_USER_ONLY
> -    .tlb_fill = riscv_cpu_tlb_fill,
> -    .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
> -    .do_interrupt = riscv_cpu_do_interrupt,
> -    .do_transaction_failed = riscv_cpu_do_transaction_failed,
> -    .do_unaligned_access = riscv_cpu_do_unaligned_access,
> -    .debug_excp_handler = riscv_cpu_debug_excp_handler,
> -    .debug_check_breakpoint = riscv_cpu_debug_check_breakpoint,
> -    .debug_check_watchpoint = riscv_cpu_debug_check_watchpoint,
> -#endif /* !CONFIG_USER_ONLY */
> -};
> -
>   static bool riscv_cpu_is_dynamic(Object *cpu_obj)
>   {
>       return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 721bd0b119..2ac00a0304 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -706,10 +706,6 @@ enum riscv_pmu_event_idx {
>       RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS = 0x10021,
>   };
>   
> -/* Export tcg_ops until we move everything to tcg/tcg-cpu.c */
> -#include "hw/core/tcg-cpu-ops.h"
> -extern const struct TCGCPUOps riscv_tcg_ops;
> -
>   /* used by tcg/tcg-cpu.c*/
>   void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en);
>   bool cpu_cfg_ext_is_user_set(uint32_t ext_offset);
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index da18851ed4..8698ce4765 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -26,7 +26,66 @@
>   #include "qemu/accel.h"
>   #include "qemu/error-report.h"
>   #include "hw/core/accel-cpu.h"
> +#include "hw/core/tcg-cpu-ops.h"
> +#include "tcg/tcg.h"
>   
> +static void riscv_cpu_synchronize_from_tb(CPUState *cs,
> +                                          const TranslationBlock *tb)
> +{
> +    if (!(tb_cflags(tb) & CF_PCREL)) {
> +        RISCVCPU *cpu = RISCV_CPU(cs);
> +        CPURISCVState *env = &cpu->env;
> +        RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
> +
> +        tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
> +
> +        if (xl == MXL_RV32) {
> +            env->pc = (int32_t) tb->pc;
> +        } else {
> +            env->pc = tb->pc;
> +        }
> +    }
> +}
> +
> +static void riscv_restore_state_to_opc(CPUState *cs,
> +                                       const TranslationBlock *tb,
> +                                       const uint64_t *data)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
> +    target_ulong pc;
> +
> +    if (tb_cflags(tb) & CF_PCREL) {
> +        pc = (env->pc & TARGET_PAGE_MASK) | data[0];
> +    } else {
> +        pc = data[0];
> +    }
> +
> +    if (xl == MXL_RV32) {
> +        env->pc = (int32_t)pc;
> +    } else {
> +        env->pc = pc;
> +    }
> +    env->bins = data[1];
> +}
> +
> +static const struct TCGCPUOps riscv_tcg_ops = {
> +    .initialize = riscv_translate_init,
> +    .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
> +    .restore_state_to_opc = riscv_restore_state_to_opc,
> +
> +#ifndef CONFIG_USER_ONLY
> +    .tlb_fill = riscv_cpu_tlb_fill,
> +    .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
> +    .do_interrupt = riscv_cpu_do_interrupt,
> +    .do_transaction_failed = riscv_cpu_do_transaction_failed,
> +    .do_unaligned_access = riscv_cpu_do_unaligned_access,
> +    .debug_excp_handler = riscv_cpu_debug_excp_handler,
> +    .debug_check_breakpoint = riscv_cpu_debug_check_breakpoint,
> +    .debug_check_watchpoint = riscv_cpu_debug_check_watchpoint,
> +#endif /* !CONFIG_USER_ONLY */
> +};
>   
>   static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
>                                       bool value)
> @@ -513,7 +572,6 @@ static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
>   {
>       /*
>        * All cpus use the same set of operations.
> -     * riscv_tcg_ops is being imported from cpu.c for now.
>        */
>       cc->tcg_ops = &riscv_tcg_ops;
>   }

