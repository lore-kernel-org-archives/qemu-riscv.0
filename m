Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A4BCD54AB
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 09:18:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiWrx-0004OJ-FC; Tue, 19 Sep 2023 05:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiWrt-0004LX-1H; Tue, 19 Sep 2023 05:18:07 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiWro-0007xQ-TW; Tue, 19 Sep 2023 05:18:03 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VsR.LyQ_1695115065; 
Received: from 30.221.108.237(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VsR.LyQ_1695115065) by smtp.aliyun-inc.com;
 Tue, 19 Sep 2023 17:17:46 +0800
Message-ID: <65e9cd16-da47-05b4-d056-f8f17f109e6f@linux.alibaba.com>
Date: Tue, 19 Sep 2023 17:16:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 05/19] target/riscv/cpu.c: add .instance_post_init()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com, ajones@ventanamicro.com,
 philmd@linaro.org
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-6-dbarboza@ventanamicro.com>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230906091647.1667171-6-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
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
> All generic CPUs call riscv_cpu_add_user_properties(). The 'max' CPU
> calls riscv_init_max_cpu_extensions(). Both can be moved to a common
> instance_post_init() callback, implemented in riscv_cpu_post_init(),
> called by all CPUs. The call order then becomes:
>
> riscv_cpu_init() -> cpu_init() of each CPU -> .instance_post_init()
>
> In the near future riscv_cpu_post_init() will call the init() function
> of the current accelerator, providing a hook for KVM and TCG accel
> classes to change the init() process of the CPU.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 42 ++++++++++++++++++++++++++++++++----------
>   1 file changed, 32 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7569955c7e..4c6d595067 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -427,8 +427,6 @@ static void riscv_max_cpu_init(Object *obj)
>       mlx = MXL_RV32;
>   #endif
>       set_misa(env, mlx, 0);
> -    riscv_cpu_add_user_properties(obj);
> -    riscv_init_max_cpu_extensions(obj);
>       env->priv_ver = PRIV_VERSION_LATEST;
>   #ifndef CONFIG_USER_ONLY
>       set_satp_mode_max_supported(RISCV_CPU(obj), mlx == MXL_RV32 ?
> @@ -442,7 +440,6 @@ static void rv64_base_cpu_init(Object *obj)
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       /* We set this in the realise function */
>       set_misa(env, MXL_RV64, 0);
> -    riscv_cpu_add_user_properties(obj);
>       /* Set latest version of privileged specification */
>       env->priv_ver = PRIV_VERSION_LATEST;
>   #ifndef CONFIG_USER_ONLY
> @@ -566,7 +563,6 @@ static void rv128_base_cpu_init(Object *obj)
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       /* We set this in the realise function */
>       set_misa(env, MXL_RV128, 0);
> -    riscv_cpu_add_user_properties(obj);
>       /* Set latest version of privileged specification */
>       env->priv_ver = PRIV_VERSION_LATEST;
>   #ifndef CONFIG_USER_ONLY
> @@ -579,7 +575,6 @@ static void rv32_base_cpu_init(Object *obj)
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>       /* We set this in the realise function */
>       set_misa(env, MXL_RV32, 0);
> -    riscv_cpu_add_user_properties(obj);
>       /* Set latest version of privileged specification */
>       env->priv_ver = PRIV_VERSION_LATEST;
>   #ifndef CONFIG_USER_ONLY
I think we should also remove riscv_cpu_add_user_properties from host 
cpu init.
> @@ -1215,6 +1210,37 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>   }
>   #endif /* CONFIG_USER_ONLY */
>   
> +static bool riscv_cpu_is_dynamic(Object *cpu_obj)
> +{
> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
> +}
> +
> +static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
> +{
> +    return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) != NULL;
> +}
> +
> +static bool riscv_cpu_has_user_properties(Object *cpu_obj)
> +{
> +    if (kvm_enabled() &&
> +        object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_HOST) != NULL) {
> +        return true;
> +    }
> +
> +    return riscv_cpu_is_dynamic(cpu_obj);
> +}
> +
> +static void riscv_cpu_post_init(Object *obj)
> +{
> +    if (riscv_cpu_has_user_properties(obj)) {
> +        riscv_cpu_add_user_properties(obj);

Otherwise, we will enter here for host cpu.

Thanks,
Zhiwei

> +    }
> +
> +    if (riscv_cpu_has_max_extensions(obj)) {
> +        riscv_init_max_cpu_extensions(obj);
> +    }
> +}
> +
>   static void riscv_cpu_init(Object *obj)
>   {
>       RISCVCPU *cpu = RISCV_CPU(obj);
> @@ -1770,11 +1796,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
>   };
>   #endif
>   
> -static bool riscv_cpu_is_dynamic(Object *cpu_obj)
> -{
> -    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
> -}
> -
>   static void cpu_set_mvendorid(Object *obj, Visitor *v, const char *name,
>                                 void *opaque, Error **errp)
>   {
> @@ -2011,6 +2032,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>           .instance_size = sizeof(RISCVCPU),
>           .instance_align = __alignof__(RISCVCPU),
>           .instance_init = riscv_cpu_init,
> +        .instance_post_init = riscv_cpu_post_init,
>           .abstract = true,
>           .class_size = sizeof(RISCVCPUClass),
>           .class_init = riscv_cpu_class_init,

