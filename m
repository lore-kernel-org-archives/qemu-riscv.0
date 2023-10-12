Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2197ECDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 08:52:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqrQy-0004K3-8A; Thu, 12 Oct 2023 04:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqrQw-0004Jo-Vz; Thu, 12 Oct 2023 04:52:43 -0400
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqrQu-000616-Ha; Thu, 12 Oct 2023 04:52:42 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R341e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Vu-2f2S_1697100749; 
Received: from 30.221.101.97(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vu-2f2S_1697100749) by smtp.aliyun-inc.com;
 Thu, 12 Oct 2023 16:52:30 +0800
Message-ID: <89b2bac3-56c1-47e3-92d7-0907d0bf0ecb@linux.alibaba.com>
Date: Thu, 12 Oct 2023 16:51:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] qemu/bitops.h: Add MAKE_32BIT_MASK macro
Content-Language: en-US
To: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, Richard Henderson <richard.henderson@linaro.org>
References: <20231011145032.81509-1-rbradford@rivosinc.com>
 <20231011145032.81509-5-rbradford@rivosinc.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231011145032.81509-5-rbradford@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
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
> Add 32-bit version of mask generating macro and use it in the RISC-V PMU
> code.
CC Richard
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> ---
>   include/qemu/bitops.h | 3 +++
>   target/riscv/pmu.c    | 2 --
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
> index cb3526d1f4..9b25b2d5e4 100644
> --- a/include/qemu/bitops.h
> +++ b/include/qemu/bitops.h
> @@ -25,6 +25,9 @@
>   #define BIT_WORD(nr)            ((nr) / BITS_PER_LONG)
>   #define BITS_TO_LONGS(nr)       DIV_ROUND_UP(nr, BITS_PER_BYTE * sizeof(long))
>   
> +#define MAKE_32BIT_MASK(shift, length) \
> +    (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
> +
>   #define MAKE_64BIT_MASK(shift, length) \
>       (((~0ULL) >> (64 - (length))) << (shift))
>   
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 7ddf4977b1..360c76f63e 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -24,8 +24,6 @@
>   #include "sysemu/device_tree.h"
>   
>   #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
> -#define MAKE_32BIT_MASK(shift, length) \
> -        (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
>   

We can always use the MAKE_64BIT_MASK instead of MAKE_32BIT_MASK.  And 
MAKE_32BIT_MASK only used in target/riscv. I am not sure  whether this 
patch will be accepted.

Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   /*
>    * To keep it simple, any event can be mapped to any programmable counters in

