Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B1DCD54AF
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 11:38:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiZ3P-00054Q-7K; Tue, 19 Sep 2023 07:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiZ3N-000546-RN; Tue, 19 Sep 2023 07:38:05 -0400
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiZ3K-0003Pr-Vw; Tue, 19 Sep 2023 07:38:05 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VsRPfTu_1695123470; 
Received: from 30.221.108.237(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VsRPfTu_1695123470) by smtp.aliyun-inc.com;
 Tue, 19 Sep 2023 19:37:51 +0800
Message-ID: <7dd1a29e-5c32-1bd8-2eb0-57fefea47cae@linux.alibaba.com>
Date: Tue, 19 Sep 2023 19:37:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 11/19] target/riscv: introduce KVM AccelCPUClass
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com, ajones@ventanamicro.com,
 philmd@linaro.org
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-12-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230906091647.1667171-12-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> Add a KVM accelerator class like we did with TCG. The difference is
> that, at least for now, we won't be using a realize() implementation for
> this accelerator.
>
> We'll start by assiging kvm_riscv_cpu_add_kvm_properties(), renamed to
> kvm_cpu_instance_init(), as a 'cpu_instance_init' implementation. Change
> riscv_cpu_post_init() to invoke accel_cpu_instance_init(), which will go
> through the 'cpu_instance_init' impl of the current acceleration (if
> available) and execute it. The end result is that the KVM initial setup,
> i.e. starting registers and adding its specific properties, will be done
> via this hook.
>
> Add a 'tcg_enabled()' condition in riscv_cpu_post_init() to avoid
> calling riscv_cpu_add_user_properties() when running KVM. We'll remove
> this condition when the TCG accel class get its own 'cpu_instance_init'
> implementation.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> ---
>   target/riscv/cpu.c       |  8 +++-----
>   target/riscv/kvm.c       | 26 ++++++++++++++++++++++++--
>   target/riscv/kvm_riscv.h |  6 ------
>   3 files changed, 27 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 50be127f36..c8a19be1af 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1219,7 +1219,9 @@ static bool riscv_cpu_has_user_properties(Object *cpu_obj)
>   
>   static void riscv_cpu_post_init(Object *obj)
>   {
> -    if (riscv_cpu_has_user_properties(obj)) {
> +    accel_cpu_instance_init(CPU(obj));
> +
> +    if (tcg_enabled() && riscv_cpu_has_user_properties(obj)) {
>           riscv_cpu_add_user_properties(obj);
>       }
>   
> @@ -1589,10 +1591,6 @@ static void riscv_cpu_add_multiext_prop_array(Object *obj,
>   static void riscv_cpu_add_user_properties(Object *obj)
>   {
>   #ifndef CONFIG_USER_ONLY
> -    if (kvm_enabled()) {
> -        kvm_riscv_cpu_add_kvm_properties(obj);
> -        return;
> -    }
>       riscv_add_satp_mode_properties(obj);
>   #endif
>   
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index ef6b2cfffe..492b97d19b 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -31,6 +31,7 @@
>   #include "sysemu/kvm_int.h"
>   #include "cpu.h"
>   #include "trace.h"
> +#include "hw/core/accel-cpu.h"
>   #include "hw/pci/pci.h"
>   #include "exec/memattrs.h"
>   #include "exec/address-spaces.h"
> @@ -1274,8 +1275,9 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>       kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
>   }
>   
> -void kvm_riscv_cpu_add_kvm_properties(Object *obj)
> +static void kvm_cpu_instance_init(CPUState *cs)
>   {
> +    Object *obj = OBJECT(RISCV_CPU(cs));
>       DeviceState *dev = DEVICE(obj);
>   
>       riscv_init_user_properties(obj);
> @@ -1287,7 +1289,7 @@ void kvm_riscv_cpu_add_kvm_properties(Object *obj)
>       riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
>   
>       for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
> -        /* Check if KVM created the property already */
> +        /* Check if we have a specific KVM handler for the option */
>           if (object_property_find(obj, prop->name)) {
>               continue;
>           }
> @@ -1295,6 +1297,26 @@ void kvm_riscv_cpu_add_kvm_properties(Object *obj)
>       }
>   }
>   
> +static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
> +{
> +    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
> +
> +    acc->cpu_instance_init = kvm_cpu_instance_init;
> +}
> +
> +static const TypeInfo kvm_cpu_accel_type_info = {
> +    .name = ACCEL_CPU_NAME("kvm"),
> +
> +    .parent = TYPE_ACCEL_CPU,
> +    .class_init = kvm_cpu_accel_class_init,
> +    .abstract = true,
> +};
> +static void kvm_cpu_accel_register_types(void)
> +{
> +    type_register_static(&kvm_cpu_accel_type_info);
> +}
> +type_init(kvm_cpu_accel_register_types);
> +
>   static void riscv_host_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index c9ecd9a967..8fe6e3e6fb 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -20,7 +20,6 @@
>   #define QEMU_KVM_RISCV_H
>   
>   #ifdef CONFIG_KVM
> -void kvm_riscv_cpu_add_kvm_properties(Object *obj);
>   void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
>   void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
>   void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
> @@ -29,11 +28,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
>                             uint64_t guest_num);
>   void riscv_kvm_aplic_request(void *opaque, int irq, int level);
>   #else
> -static inline void kvm_riscv_cpu_add_kvm_properties(Object *obj)
> -{
> -    g_assert_not_reached();
> -}
> -
>   static inline void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
>   {
>       g_assert_not_reached();

