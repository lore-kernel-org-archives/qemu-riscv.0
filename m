Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EC5CD54AC
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 09:52:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiXP5-0002nw-Kc; Tue, 19 Sep 2023 05:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiXOy-0002mv-JB; Tue, 19 Sep 2023 05:52:18 -0400
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiXOv-0000z0-2X; Tue, 19 Sep 2023 05:52:16 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R401e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VsR2UB._1695117121; 
Received: from 30.221.108.237(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VsR2UB._1695117121) by smtp.aliyun-inc.com;
 Tue, 19 Sep 2023 17:52:02 +0800
Message-ID: <0ea60a14-4cef-d649-3ebd-8f0db5b282e1@linux.alibaba.com>
Date: Tue, 19 Sep 2023 17:51:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 01/19] target/riscv: introduce TCG AccelCPUClass
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com, ajones@ventanamicro.com,
 philmd@linaro.org
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-2-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230906091647.1667171-2-dbarboza@ventanamicro.com>
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
> target/riscv/cpu.c needs to handle all possible accelerators (TCG and
> KVM at this moment) during both init() and realize() time. This forces
> us to resort to a lot of "if tcg" and "if kvm" throughout the code,
> which isn't wrong, but can get cluttered over time. Splitting
> acceleration specific code from cpu.c to its own file will help to
> declutter the existing code and it will also make it easier to support
> KVM/TCG only builds in the future.
>
> We'll start by adding a new subdir called 'tcg' and a new file called
> 'tcg-cpu.c'. This file will be used to introduce a new accelerator class
> for TCG acceleration in RISC-V, allowing us to center all TCG exclusive
> code in its file instead of using 'cpu.c' for everything. This design is
> inpired by the work Claudio Fontana did in x86 a few years ago in commit
> f5cc5a5c1 ("i386: split cpu accelerators from cpu.c, using
> AccelCPUClass").
>
> To avoid moving too much code at once we'll start by adding the new file
> and TCG AccelCPUClass declaration. The 'class_init' from the accel class
> will init 'tcg_ops', relieving the common riscv_cpu_class_init() from
> doing it.
>
> 'riscv_tcg_ops' is being exported from 'cpu.c' for now to avoid having
> to deal with moving code and files around right now. We'll focus on
> decoupling the realize() logic first.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> ---
>   target/riscv/cpu.c           |  5 +---
>   target/riscv/cpu.h           |  4 +++
>   target/riscv/meson.build     |  2 ++
>   target/riscv/tcg/meson.build |  2 ++
>   target/riscv/tcg/tcg-cpu.c   | 58 ++++++++++++++++++++++++++++++++++++
>   5 files changed, 67 insertions(+), 4 deletions(-)
>   create mode 100644 target/riscv/tcg/meson.build
>   create mode 100644 target/riscv/tcg/tcg-cpu.c
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index be1c028095..2c6972fa0d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2290,9 +2290,7 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
>   };
>   #endif
>   
> -#include "hw/core/tcg-cpu-ops.h"
> -
> -static const struct TCGCPUOps riscv_tcg_ops = {
> +const struct TCGCPUOps riscv_tcg_ops = {
>       .initialize = riscv_translate_init,
>       .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
>       .restore_state_to_opc = riscv_restore_state_to_opc,
> @@ -2451,7 +2449,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>   #endif
>       cc->gdb_arch_name = riscv_gdb_arch_name;
>       cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
> -    cc->tcg_ops = &riscv_tcg_ops;
>   
>       object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
>                                 cpu_set_mvendorid, NULL, NULL);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 577abcd724..b84b62f84e 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -707,6 +707,10 @@ enum riscv_pmu_event_idx {
>       RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS = 0x10021,
>   };
>   
> +/* Export tcg_ops until we move everything to tcg/tcg-cpu.c */
> +#include "hw/core/tcg-cpu-ops.h"
> +extern const struct TCGCPUOps riscv_tcg_ops;
> +
>   /* CSR function table */
>   extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
>   
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 660078bda1..f0486183fa 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -38,5 +38,7 @@ riscv_system_ss.add(files(
>     'riscv-qmp-cmds.c',
>   ))
>   
> +subdir('tcg')
> +
>   target_arch += {'riscv': riscv_ss}
>   target_softmmu_arch += {'riscv': riscv_system_ss}
> diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
> new file mode 100644
> index 0000000000..061df3d74a
> --- /dev/null
> +++ b/target/riscv/tcg/meson.build
> @@ -0,0 +1,2 @@
> +riscv_ss.add(when: 'CONFIG_TCG', if_true: files(
> +  'tcg-cpu.c'))
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> new file mode 100644
> index 0000000000..0326cead0d
> --- /dev/null
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -0,0 +1,58 @@
> +/*
> + * riscv TCG cpu class initialization
> + *
> + * Copyright (c) 2023 Ventana Micro Systems Inc.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "qemu/accel.h"
> +#include "hw/core/accel-cpu.h"
> +
> +static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
> +{
> +    /*
> +     * All cpus use the same set of operations.
> +     * riscv_tcg_ops is being imported from cpu.c for now.
> +     */
> +    cc->tcg_ops = &riscv_tcg_ops;
> +}
> +
> +static void tcg_cpu_class_init(CPUClass *cc)
> +{
> +    cc->init_accel_cpu = tcg_cpu_init_ops;
> +}
> +
> +static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
> +{
> +    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
> +
> +    acc->cpu_class_init = tcg_cpu_class_init;
> +}
> +
> +static const TypeInfo tcg_cpu_accel_type_info = {
> +    .name = ACCEL_CPU_NAME("tcg"),
> +
> +    .parent = TYPE_ACCEL_CPU,
> +    .class_init = tcg_cpu_accel_class_init,
> +    .abstract = true,
> +};
> +
> +static void tcg_cpu_accel_register_types(void)
> +{
> +    type_register_static(&tcg_cpu_accel_type_info);
> +}
> +type_init(tcg_cpu_accel_register_types);

