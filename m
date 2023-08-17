Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B807FEB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 07:24:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWXMc-0000KP-3O; Thu, 17 Aug 2023 03:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qWXMa-0000JK-0z; Thu, 17 Aug 2023 03:24:12 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qWXMT-0000WT-Ah; Thu, 17 Aug 2023 03:24:11 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R821e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VpyyIxH_1692257027; 
Received: from 30.221.110.54(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VpyyIxH_1692257027) by smtp.aliyun-inc.com;
 Thu, 17 Aug 2023 15:23:48 +0800
Message-ID: <14664142-a675-75ff-54f2-6fa53f0372c8@linux.alibaba.com>
Date: Thu, 17 Aug 2023 15:23:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] target/riscv: Allocate itrigger timers only once
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20230816162717.44125-1-akihiko.odaki@daynix.com>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230816162717.44125-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.132;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-132.freemail.mail.aliyun.com
X-Spam_score_int: -130
X-Spam_score: -13.1
X-Spam_bar: -------------
X-Spam_report: (-13.1 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-3.165, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


On 2023/8/17 0:27, Akihiko Odaki wrote:
> riscv_trigger_init() had been called on reset events that can happen
> several times for a CPU and it allocated timers for itrigger. If old
> timers were present, they were simply overwritten by the new timers,
> resulting in a memory leak.
>
> Divide riscv_trigger_init() into two functions, namely
> riscv_trigger_realize() and riscv_trigger_reset() and call them in
> appropriate timing. The timer allocation will happen only once for a
> CPU in riscv_trigger_realize().
>
> Fixes: 5a4ae64cac ("target/riscv: Add itrigger support when icount is enabled")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   target/riscv/debug.h |  3 ++-
>   target/riscv/cpu.c   |  8 +++++++-
>   target/riscv/debug.c | 15 ++++++++++++---
>   3 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index c471748d5a..7edc31e7cc 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -143,7 +143,8 @@ void riscv_cpu_debug_excp_handler(CPUState *cs);
>   bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
>   bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
>   
> -void riscv_trigger_init(CPURISCVState *env);
> +void riscv_trigger_realize(CPURISCVState *env);
> +void riscv_trigger_reset(CPURISCVState *env);
>   
>   bool riscv_itrigger_enabled(CPURISCVState *env);
>   void riscv_itrigger_update_priv(CPURISCVState *env);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e12b6ef7f6..3bc3f96a58 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -904,7 +904,7 @@ static void riscv_cpu_reset_hold(Object *obj)
>   
>   #ifndef CONFIG_USER_ONLY
>       if (cpu->cfg.debug) {
> -        riscv_trigger_init(env);
> +        riscv_trigger_reset(env);
>       }
>   
>       if (kvm_enabled()) {
> @@ -1475,6 +1475,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>   
>       riscv_cpu_register_gdb_regs_for_features(cs);
>   
> +#ifndef CONFIG_USER_ONLY
> +    if (cpu->cfg.debug) {
> +        riscv_trigger_realize(&cpu->env);
> +    }
> +#endif
> +
>       qemu_init_vcpu(cs);
>       cpu_reset(cs);
>   
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 75ee1c4971..1c44403205 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -903,7 +903,17 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>       return false;
>   }
>   
> -void riscv_trigger_init(CPURISCVState *env)
> +void riscv_trigger_realize(CPURISCVState *env)
> +{
> +    int i;
> +
> +    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
> +        env->itrigger_timer[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                              riscv_itrigger_timer_cb, env);
> +    }
> +}
> +
> +void riscv_trigger_reset(CPURISCVState *env)
>   {
>       target_ulong tdata1 = build_tdata1(env, TRIGGER_TYPE_AD_MATCH, 0, 0);
>       int i;
> @@ -928,7 +938,6 @@ void riscv_trigger_init(CPURISCVState *env)
>           env->tdata3[i] = 0;
>           env->cpu_breakpoint[i] = NULL;
>           env->cpu_watchpoint[i] = NULL;
> -        env->itrigger_timer[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> -                                              riscv_itrigger_timer_cb, env);
> +        timer_del(env->itrigger_timer[i]);
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       }
>   }

