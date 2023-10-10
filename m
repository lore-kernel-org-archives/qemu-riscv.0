Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568FFCD80AD
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 11:35:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqB04-0003aB-1d; Tue, 10 Oct 2023 07:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1qqAzv-0003Nf-99; Tue, 10 Oct 2023 07:34:00 -0400
Received: from mail.loongson.cn ([114.242.206.163])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>)
 id 1qqAzm-00026t-NV; Tue, 10 Oct 2023 07:33:58 -0400
Received: from loongson.cn (unknown [10.20.42.239])
 by gateway (Coremail) with SMTP id _____8CxruuSNiVlOaIwAA--.25064S3;
 Tue, 10 Oct 2023 19:33:38 +0800 (CST)
Received: from [10.20.42.239] (unknown [10.20.42.239])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxfS+PNiVlUWceAA--.63966S3; 
 Tue, 10 Oct 2023 19:33:37 +0800 (CST)
Subject: Re: [PATCH 06/18] target/loongarch: Declare QOM definitions in
 'cpu-qom.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Marek Vasut
 <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
References: <20231010092901.99189-1-philmd@linaro.org>
 <20231010092901.99189-7-philmd@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <c539862d-f211-00ad-153f-8eb78892ef04@loongson.cn>
Date: Tue, 10 Oct 2023 19:33:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20231010092901.99189-7-philmd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxfS+PNiVlUWceAA--.63966S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZr48Kr1UArWrGrWruFWDKFX_yoW5KrW3pr
 13ZF4YgrW8GrW2k3WSqas09rn5Xr4xCF4j9F4fCFW0yrWqv348WF1qgr9xuFy3J3yUWFy0
 vF1vyw1UZFs7X3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUA529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAaw2AFwI0_Jw0_GFyle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
 Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
 WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48J
 MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jTq2NUUU
 UU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=mail.loongson.cn
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.339,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

在 2023/10/10 下午5:28, Philippe Mathieu-Daudé 写道:
> "target/foo/cpu.h" contains the target specific declarations.
> 
> A heterogeneous setup need to access target agnostic declarations
> (at least the QOM ones, to instantiate the objects).
> 
> Our convention is to add such target agnostic QOM declarations in
> the "target/foo/cpu-qom.h" header.
> 
> Extract QOM definitions from "cpu.h" to "cpu-qom.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/loongarch/cpu-qom.h | 38 ++++++++++++++++++++++++++++++++++++++
>   target/loongarch/cpu.h     | 26 +-------------------------
>   2 files changed, 39 insertions(+), 25 deletions(-)
>   create mode 100644 target/loongarch/cpu-qom.h
> 
Reviewed-by: Song Gao <gaosong@loongson.cn>

Thanks.
Song Gao

> diff --git a/target/loongarch/cpu-qom.h b/target/loongarch/cpu-qom.h
> new file mode 100644
> index 0000000000..d577af9f6e
> --- /dev/null
> +++ b/target/loongarch/cpu-qom.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU LoongArch CPU QOM header (target agnostic)
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef LOONGARCH_CPU_QOM_H
> +#define LOONGARCH_CPU_QOM_H
> +
> +#include "hw/core/cpu.h"
> +#include "qom/object.h"
> +
> +#define TYPE_LOONGARCH_CPU "loongarch-cpu"
> +#define TYPE_LOONGARCH32_CPU "loongarch32-cpu"
> +#define TYPE_LOONGARCH64_CPU "loongarch64-cpu"
> +
> +OBJECT_DECLARE_CPU_TYPE(LoongArchCPU, LoongArchCPUClass,
> +                        LOONGARCH_CPU)
> +
> +#define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
> +#define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
> +
> +/**
> + * LoongArchCPUClass:
> + * @parent_realize: The parent class' realize handler.
> + * @parent_phases: The parent class' reset phase handlers.
> + *
> + * A LoongArch CPU model.
> + */
> +struct LoongArchCPUClass {
> +    CPUClass parent_class;
> +
> +    DeviceRealize parent_realize;
> +    ResettablePhases parent_phases;
> +};
> +
> +#endif
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index 40e70a8119..22cebc6280 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -17,6 +17,7 @@
>   #include "exec/memory.h"
>   #endif
>   #include "cpu-csr.h"
> +#include "cpu-qom.h"
>   
>   #define IOCSRF_TEMP             0
>   #define IOCSRF_NODECNT          1
> @@ -383,29 +384,6 @@ struct ArchCPU {
>       const char *dtb_compatible;
>   };
>   
> -#define TYPE_LOONGARCH_CPU "loongarch-cpu"
> -#define TYPE_LOONGARCH32_CPU "loongarch32-cpu"
> -#define TYPE_LOONGARCH64_CPU "loongarch64-cpu"
> -
> -OBJECT_DECLARE_CPU_TYPE(LoongArchCPU, LoongArchCPUClass,
> -                        LOONGARCH_CPU)
> -
> -/**
> - * LoongArchCPUClass:
> - * @parent_realize: The parent class' realize handler.
> - * @parent_phases: The parent class' reset phase handlers.
> - *
> - * A LoongArch CPU model.
> - */
> -struct LoongArchCPUClass {
> -    /*< private >*/
> -    CPUClass parent_class;
> -    /*< public >*/
> -
> -    DeviceRealize parent_realize;
> -    ResettablePhases parent_phases;
> -};
> -
>   /*
>    * LoongArch CPUs has 4 privilege levels.
>    * 0 for kernel mode, 3 for user mode.
> @@ -482,8 +460,6 @@ void loongarch_cpu_list(void);
>   
>   #include "exec/cpu-all.h"
>   
> -#define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
> -#define LOONGARCH_CPU_TYPE_NAME(model) model LOONGARCH_CPU_TYPE_SUFFIX
>   #define CPU_RESOLVING_TYPE TYPE_LOONGARCH_CPU
>   
>   #endif /* LOONGARCH_CPU_H */
> 


