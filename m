Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4703CEB64DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 12:15:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFD1t-0007n8-F9; Fri, 30 Jun 2023 08:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFD1s-0007me-8G
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 08:15:12 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFD1q-000271-By
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 08:15:11 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1b0156a1c4bso1343185fac.1
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 05:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688127309; x=1690719309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RPOxu5tbYzqG9w+IoRV2cSiWD+SezI9JB4zsAoVqy8w=;
 b=ZrR1cCM6P0ceGc+g6/DJmRA+E6ghenN2knkqcj41vJuoPHJB+S1HAy3Yqmsw9yVbxt
 F9nVPIH/wxpbFgsKo3yogxjxcdXEO+Px2532i8GwIx2whF0Ip43EKIfr0mHVWB4x0v+o
 +GqoAO+vURi5zfkzPUTJmbHnVtK1A/K9vXqrtciSW5Myy+qhCCrYrF9GbzswfKeN+KE0
 lqervdczibHxFzSkywO0l7W8J/mM5Y1rQSLhgwtYsl2GKhI9Yk98BhPK+w37uh95sRYL
 /O1G+slXEzh1q1RmDgSWt0x/c+sc4I3Yl/UvCJQVrf4CBBATG+0/EbH/LU/zHx6y5Sum
 D9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688127309; x=1690719309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RPOxu5tbYzqG9w+IoRV2cSiWD+SezI9JB4zsAoVqy8w=;
 b=iIFrIl2cBGC+q/P+fIjuaNVd1E8+GHJ/W9zLhUK/VlOgbI6p9lIjAj0o6dwpgtZ7VT
 no3KDu5NU7Si4yaIjFKZ4CiJaZxtLVzB5qHrZv/OUlGksiV68U7IxsqFrIAmM2lNL+4M
 MGCMEnoW7wg2S0Zx+vSGvT76y1JgmCgpWMev/3gzOGBE2T2XlXSWYeyDmRqCOTJJyJXv
 J8ix5Xg6wLWbLXYE1uqUPT+Y50XPbCWrfWO7tBwjXGuT1beaRE3nHM4Tg+ZEsIOKO4l8
 SskOElyaA4CVtnsZta39UkFGV4FACKeQf4aMgqpAAkbSZ3aQU8u0CCfi98t4MfWqxSal
 LVPQ==
X-Gm-Message-State: ABy/qLY6iv5C5P9aGDF134Zn7RiFM04uJQpKNzDBz3k4o9ODgCcpoA0R
 yNckYbgh9EefzatnicY0bz2FyA==
X-Google-Smtp-Source: ACHHUZ6SflSCc99VQuoQy1Ix9TKwImPTmhyZROGNx7OVhhxPx6zCf5+hvMqQ4R8YEywCqrxeY9VTQw==
X-Received: by 2002:a05:6871:8f85:b0:1b0:805:8670 with SMTP id
 aa5-20020a0568718f8500b001b008058670mr2321158oac.19.1688127309158; 
 Fri, 30 Jun 2023 05:15:09 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59?
 ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a9d6b08000000b006b74d8b219asm4877667otp.40.2023.06.30.05.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 05:15:08 -0700 (PDT)
Message-ID: <70361354-b581-dc46-729d-6a8d50a94ab9@ventanamicro.com>
Date: Fri, 30 Jun 2023 09:15:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/4] target/riscv: Restrict sysemu specific header to
 user emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20230628063234.32544-1-philmd@linaro.org>
 <20230628063234.32544-3-philmd@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230628063234.32544-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 6/28/23 03:32, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c        | 8 +++++---
>   target/riscv/cpu_helper.c | 2 ++
>   target/riscv/csr.c        | 2 ++
>   3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fb8458bf74..d9a3684b3e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -23,9 +23,13 @@
>   #include "qemu/log.h"
>   #include "cpu.h"
>   #include "cpu_vendorid.h"
> +#ifndef CONFIG_USER_ONLY
>   #include "pmu.h"
> -#include "internals.h"
>   #include "time_helper.h"
> +#include "sysemu/kvm.h"
> +#include "kvm_riscv.h"
> +#endif
> +#include "internals.h"
>   #include "exec/exec-all.h"
>   #include "qapi/error.h"
>   #include "qapi/visitor.h"
> @@ -33,8 +37,6 @@
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
>   #include "fpu/softfloat-helpers.h"
> -#include "sysemu/kvm.h"
> -#include "kvm_riscv.h"
>   #include "tcg/tcg.h"
>   
>   /* RISC-V CPU definitions */
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 55c36025d7..3c28396eaf 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -28,7 +28,9 @@
>   #include "tcg/tcg-op.h"
>   #include "trace.h"
>   #include "semihosting/common-semi.h"
> +#ifndef CONFIG_USER_ONLY
>   #include "sysemu/cpu-timers.h"
> +#endif
>   #include "cpu_bits.h"
>   #include "debug.h"
>   #include "tcg/oversized-guest.h"
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ea7585329e..e5737dcf58 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -21,8 +21,10 @@
>   #include "qemu/log.h"
>   #include "qemu/timer.h"
>   #include "cpu.h"
> +#ifndef CONFIG_USER_ONLY
>   #include "pmu.h"
>   #include "time_helper.h"
> +#endif
>   #include "qemu/main-loop.h"
>   #include "exec/exec-all.h"
>   #include "exec/tb-flush.h"

