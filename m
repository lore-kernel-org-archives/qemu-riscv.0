Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0819FCD54B2
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 11:12:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiYem-00017q-R6; Tue, 19 Sep 2023 07:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiYef-00016N-6g; Tue, 19 Sep 2023 07:12:34 -0400
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiYeZ-0004xz-17; Tue, 19 Sep 2023 07:12:30 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VsRHmHB_1695121939; 
Received: from 30.221.108.237(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VsRHmHB_1695121939) by smtp.aliyun-inc.com;
 Tue, 19 Sep 2023 19:12:20 +0800
Message-ID: <f534c733-d429-561e-1dc3-b2af6962db86@linux.alibaba.com>
Date: Tue, 19 Sep 2023 19:11:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 06/19] target/riscv: move 'host' CPU declaration to
 kvm.c
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com, ajones@ventanamicro.com,
 philmd@linaro.org
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-7-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230906091647.1667171-7-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.99;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-99.freemail.mail.aliyun.com
X-Spam_score_int: -113
X-Spam_score: -11.4
X-Spam_bar: -----------
X-Spam_report: (-11.4 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


On 2023/9/6 17:16, Daniel Henrique Barboza wrote:
> This CPU only exists if we're compiling with KVM so move it to the kvm
> specific file.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 16 ----------------
>   target/riscv/kvm.c | 21 +++++++++++++++++++++
>   2 files changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4c6d595067..c15bb572d4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -652,19 +652,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>   }
>   #endif
>   
> -#if defined(CONFIG_KVM)
> -static void riscv_host_cpu_init(Object *obj)
> -{
> -    CPURISCVState *env = &RISCV_CPU(obj)->env;
> -#if defined(TARGET_RISCV32)
> -    set_misa(env, MXL_RV32, 0);
> -#elif defined(TARGET_RISCV64)
> -    set_misa(env, MXL_RV64, 0);
> -#endif
> -    riscv_cpu_add_user_properties(obj);

Remove this statement in patch 5. Otherwise,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> -}
> -#endif /* CONFIG_KVM */
> -
>   static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
>   {
>       ObjectClass *oc;
> @@ -2044,9 +2031,6 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>       },
>       DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
>       DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX,      riscv_max_cpu_init),
> -#if defined(CONFIG_KVM)
> -    DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
> -#endif
>   #if defined(TARGET_RISCV32)
>       DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE32,   rv32_base_cpu_init),
>       DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 14763ec0cd..b4d8d7a46c 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -1227,3 +1227,24 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>   
>       kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
>   }
> +
> +static void riscv_host_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +
> +#if defined(TARGET_RISCV32)
> +    env->misa_mxl_max = env->misa_mxl = MXL_RV32;
> +#elif defined(TARGET_RISCV64)
> +    env->misa_mxl_max = env->misa_mxl = MXL_RV64;
> +#endif
> +}
> +
> +static const TypeInfo riscv_kvm_cpu_type_infos[] = {
> +    {
> +        .name = TYPE_RISCV_CPU_HOST,
> +        .parent = TYPE_RISCV_CPU,
> +        .instance_init = riscv_host_cpu_init,
> +    }
> +};
> +
> +DEFINE_TYPES(riscv_kvm_cpu_type_infos)

