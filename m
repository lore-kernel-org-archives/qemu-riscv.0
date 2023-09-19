Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060CFCD54B5
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 11:39:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiZ48-0005G8-6M; Tue, 19 Sep 2023 07:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiZ43-00059s-07; Tue, 19 Sep 2023 07:38:47 -0400
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiZ40-0003bw-Bw; Tue, 19 Sep 2023 07:38:46 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R371e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VsRPfil_1695123512; 
Received: from 30.221.108.237(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VsRPfil_1695123512) by smtp.aliyun-inc.com;
 Tue, 19 Sep 2023 19:38:33 +0800
Message-ID: <6c25ba2c-faf4-a352-a5aa-8fa32cba2a28@linux.alibaba.com>
Date: Tue, 19 Sep 2023 19:37:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 12/19] target/riscv: move KVM only files to kvm subdir
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com, ajones@ventanamicro.com,
 philmd@linaro.org
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-13-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230906091647.1667171-13-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> Move the files to a 'kvm' dir to promote more code separation between
> accelerators and making our lives easier supporting build options such
> as --disable-tcg.
>
> Rename kvm.c to kvm-cpu.c to keep it in line with its TCG counterpart.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> ---
>   hw/intc/riscv_aplic.c                 | 2 +-
>   hw/riscv/virt.c                       | 2 +-
>   target/riscv/cpu.c                    | 2 +-
>   target/riscv/{kvm.c => kvm/kvm-cpu.c} | 0
>   target/riscv/{ => kvm}/kvm_riscv.h    | 0
>   target/riscv/kvm/meson.build          | 1 +
>   target/riscv/meson.build              | 2 +-
>   7 files changed, 5 insertions(+), 4 deletions(-)
>   rename target/riscv/{kvm.c => kvm/kvm-cpu.c} (100%)
>   rename target/riscv/{ => kvm}/kvm_riscv.h (100%)
>   create mode 100644 target/riscv/kvm/meson.build
>
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index 99aae8ccbe..c677b5cfbb 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -32,7 +32,7 @@
>   #include "target/riscv/cpu.h"
>   #include "sysemu/sysemu.h"
>   #include "sysemu/kvm.h"
> -#include "kvm_riscv.h"
> +#include "kvm/kvm_riscv.h"
>   #include "migration/vmstate.h"
>   
>   #define APLIC_MAX_IDC                  (1UL << 14)
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3b259b9305..6d9542f0a2 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -35,7 +35,7 @@
>   #include "hw/riscv/virt.h"
>   #include "hw/riscv/boot.h"
>   #include "hw/riscv/numa.h"
> -#include "kvm_riscv.h"
> +#include "kvm/kvm_riscv.h"
>   #include "hw/intc/riscv_aclint.h"
>   #include "hw/intc/riscv_aplic.h"
>   #include "hw/intc/riscv_imsic.h"
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c8a19be1af..51567c2f12 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -33,7 +33,7 @@
>   #include "fpu/softfloat-helpers.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/tcg.h"
> -#include "kvm_riscv.h"
> +#include "kvm/kvm_riscv.h"
>   #include "tcg/tcg.h"
>   
>   /* RISC-V CPU definitions */
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm/kvm-cpu.c
> similarity index 100%
> rename from target/riscv/kvm.c
> rename to target/riscv/kvm/kvm-cpu.c
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
> similarity index 100%
> rename from target/riscv/kvm_riscv.h
> rename to target/riscv/kvm/kvm_riscv.h
> diff --git a/target/riscv/kvm/meson.build b/target/riscv/kvm/meson.build
> new file mode 100644
> index 0000000000..7e92415091
> --- /dev/null
> +++ b/target/riscv/kvm/meson.build
> @@ -0,0 +1 @@
> +riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm-cpu.c'))
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 3323b78b84..c53962215f 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -24,7 +24,6 @@ riscv_ss.add(files(
>     'zce_helper.c',
>     'vcrypto_helper.c'
>   ))
> -riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
>   
>   riscv_system_ss = ss.source_set()
>   riscv_system_ss.add(files(
> @@ -39,6 +38,7 @@ riscv_system_ss.add(files(
>   ))
>   
>   subdir('tcg')
> +subdir('kvm')
>   
>   target_arch += {'riscv': riscv_ss}
>   target_softmmu_arch += {'riscv': riscv_system_ss}

