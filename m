Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DABCDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 03:20:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqmFA-0002wo-9K; Wed, 11 Oct 2023 23:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqmF8-0002vx-3u; Wed, 11 Oct 2023 23:20:10 -0400
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqmF5-0002Fc-A7; Wed, 11 Oct 2023 23:20:09 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VtypPR2_1697080795; 
Received: from 30.221.101.97(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VtypPR2_1697080795) by smtp.aliyun-inc.com;
 Thu, 12 Oct 2023 11:19:56 +0800
Message-ID: <9a4858e4-f9da-40be-ba0a-4f3f94ce910d@linux.alibaba.com>
Date: Thu, 12 Oct 2023 11:18:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] target/riscv: Propagate error from PMU setup
Content-Language: en-US
To: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com
References: <20231011145032.81509-1-rbradford@rivosinc.com>
 <20231011145032.81509-2-rbradford@rivosinc.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231011145032.81509-2-rbradford@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.113;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-113.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


On 2023/10/11 22:45, Rob Bradford wrote:
> More closely follow the QEMU style by returning an Error and propagating
> it there is an error relating to the PMU setup.
>
> Further simplify the function by removing the num_counters parameter as
> this is available from the passed in cpu pointer.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.c |  8 +++++++-
>   target/riscv/pmu.c | 19 +++++++++----------
>   target/riscv/pmu.h |  3 ++-
>   3 files changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac2b94b6a6..c9d8fc12fe 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1488,7 +1488,13 @@ static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
>       }
>   
>       if (cpu->cfg.pmu_num) {
> -        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
> +        riscv_pmu_init(cpu, &local_err);
> +        if (local_err != NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +
> +        if (cpu->cfg.ext_sscofpmf) {
>               cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>                                             riscv_pmu_timer_cb, cpu);
>           }
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 36f6307d28..13801ccb78 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -434,22 +434,21 @@ int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t ctr_idx)
>   }
>   
>   
> -int riscv_pmu_init(RISCVCPU *cpu, int num_counters)
> +void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
>   {
> -    if (num_counters > (RV_MAX_MHPMCOUNTERS - 3)) {
> -        return -1;
> +    uint8_t pmu_num = cpu->cfg.pmu_num;
> +
> +    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
> +        error_setg(errp, "Number of counters exceeds maximum available");
> +        return;
>       }
>   
>       cpu->pmu_event_ctr_map = g_hash_table_new(g_direct_hash, g_direct_equal);
>       if (!cpu->pmu_event_ctr_map) {
> -        /* PMU support can not be enabled */
> -        qemu_log_mask(LOG_UNIMP, "PMU events can't be supported\n");
> -        cpu->cfg.pmu_num = 0;
> -        return -1;
> +        error_setg(errp, "Unable to allocate PMU event hash table");
> +        return;
>       }
>   
>       /* Create a bitmask of available programmable counters */
> -    cpu->pmu_avail_ctrs = MAKE_32BIT_MASK(3, num_counters);
> -
> -    return 0;
> +    cpu->pmu_avail_ctrs = MAKE_32BIT_MASK(3, pmu_num);
>   }
> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> index 2bfb71ba87..88e0713296 100644
> --- a/target/riscv/pmu.h
> +++ b/target/riscv/pmu.h
> @@ -17,13 +17,14 @@
>    */
>   
>   #include "cpu.h"
> +#include "qapi/error.h"
>   
>   bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
>                                           uint32_t target_ctr);
>   bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
>                                     uint32_t target_ctr);
>   void riscv_pmu_timer_cb(void *priv);
> -int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
> +void riscv_pmu_init(RISCVCPU *cpu, Error **errp);
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
>                                  uint32_t ctr_idx);
>   int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);

