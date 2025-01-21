Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A71C02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 15:47:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taGTP-0007FG-Lh; Tue, 21 Jan 2025 10:47:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1taGTF-0007ER-Sq
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 10:47:22 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1taGTD-0000Xk-VA
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 10:47:17 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21680814d42so95474135ad.2
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 07:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737474434; x=1738079234; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PsRphco2/yF7/RPpBLBla6FWBK7HFRFdg3GEMcsicCo=;
 b=pD0Kk7IzS00jpvYT1SiT8A35on3O76Et/oz4K9A5zIyJWDwko2+Y3JPMdQySl/gTSM
 c39gEiJxksz54PrFKa5iVGeq2hyKkL+OOrgK3IKI+gsHFTfhcvGZlQOaP1T8cQyf/Ibq
 pxWlFuxJw9hYeFkA3VZkBOGJ1AfHONUR7k7gO0qE4mVMgr6/GWiv8tBmLD8MsB71UJZL
 SM+BjrewBaud8nA3Hob7yZ6LRPlao0ivpqd6+E5VDQpN8RJKVEsYa3H7EZl9kfIl1G5X
 JmBC0sckRKYP3EMXZF+6ejaaUKLVUpPHIlfjI2gYT+CZc+BgeQ8UzqR8Eoj7uV8dLgVn
 X26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737474434; x=1738079234;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PsRphco2/yF7/RPpBLBla6FWBK7HFRFdg3GEMcsicCo=;
 b=Ru5LVf89Th0bkbqfyBMk1M/xDBND2Up2xOWyl8l2mdIRoBgmk9hF69OsDaHJP9+JQU
 lC6TTSM2HyrHsXzjrqO0OenVBfC7J0+GM43CGC+3SlCR/7rXENJJSAo1+jYul9TE/uC3
 FRNTAUM3t998Vqns6+qgx3gD/6Xf6wJsak88MydVSG/2BH1V9dPsYund0E+5DobFiQ/y
 JIpQWM4Zm9xqY+aFNtRqBnXcVr+75ChrMu8D/i50HZl/mydDbRtB0ADT1JWogAR1W0o4
 Xzf6oTV/+RaJQvVqeDkfREmVb7gi3I7zmV1Y6JBq4cZYR0snit9Zn9l6MvTFsNFV0l93
 Uwkg==
X-Gm-Message-State: AOJu0YyLAaLZ9ktBE+1zuZNR8dCvbepP4FDtz2+Khnjero3UfJWHNHO/
 BXfJXkyfR3/aI8dnt9jXvx8zjULumYX19QV84Drc5vz3iMU+EHA4BNMRteTIavY=
X-Gm-Gg: ASbGncsM8yTHqcXCyi/gIrLqfci2UAInn8L56a9W5r4+wkRY14LQSiGRXkKYU0ybXSX
 AqSWSE6eQlMNt89+7aLi2EAB9uq/YiV9eiYdWH8vTZVUD2kMfAa9RT9s69toMr71Wyc7Bg4tZRs
 XP5+Bi8NiG8ultRSxswhXLnK1VRBy8DMiTMwJrlLIkerpFuAqDjwig1Qy2EXmuGAzUYVmIhYl/W
 7kJZzzw4cr0jx1Zotf4jGH7sSBTfl03f6+bwirfDzYAYoBDHFLl60nIr4wmbJ7ZJ9gSrDh5nDVE
 OnjdyxqDHGqqZu4dF/ZuWcJAGNhEu51cHovc
X-Google-Smtp-Source: AGHT+IFYB4xOIxG3I05AMrzGjS7l3XFq8FXmeUPffboOphdJ/Kts2W/YWI6N2YF5vDpkCYQ7Selghg==
X-Received: by 2002:a05:6a20:9185:b0:1ea:e93d:7574 with SMTP id
 adf61e73a8af0-1eb214c97a5mr29779720637.18.1737474434127; 
 Tue, 21 Jan 2025 07:47:14 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-aab358fc6d8sm5788145a12.51.2025.01.21.07.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 07:47:13 -0800 (PST)
Message-ID: <a2154af7-906c-4fbc-acca-75cac0b5c951@linaro.org>
Date: Tue, 21 Jan 2025 07:47:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] target/riscv: throw debug exception before page
 fault
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20250120204910.1317013-1-dbarboza@ventanamicro.com>
 <20250120204910.1317013-3-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250120204910.1317013-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/20/25 12:49, Daniel Henrique Barboza wrote:
> In the RISC-V privileged ISA section 3.1.15 table 15, it is determined
> that a debug exception that is triggered from a load/store has a higher
> priority than a possible fault that this access might trigger.
> 
> This is not the case ATM as shown in [1]. Adding a breakpoint in an
> address that deliberately will fault is causing a load page fault
> instead of a debug exception. The reason is that we're throwing in the
> page fault as soon as the fault occurs (end of riscv_cpu_tlb_fill(),
> raise_mmu_exception()), not allowing the installed watchpoints to
> trigger.
> 
> Call cpu_check_watchpoint() in the page fault path to search and execute
> any watchpoints that might exist for the address, never returning back
> to the fault path. If no watchpoints are found cpu_check_watchpoint()
> will return and we'll fall-through the regular path to
> raise_mmu_exception().
> 
> [1] https://gitlab.com/qemu-project/qemu/-/issues/2627
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2627
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu_helper.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e1dfc4ecbf..ae0a659ec7 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -27,6 +27,7 @@
>   #include "exec/page-protection.h"
>   #include "instmap.h"
>   #include "tcg/tcg-op.h"
> +#include "hw/core/tcg-cpu-ops.h"
>   #include "trace.h"
>   #include "semihosting/common-semi.h"
>   #include "system/cpu-timers.h"
> @@ -1708,6 +1709,24 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       } else if (probe) {
>           return false;
>       } else {
> +        int wp_len = riscv_cpu_mxl(env) == MXL_RV64 ? 8 : 4;

Surely 'size' may be relevant?


r~

> +        int wp_access = 0;
> +
> +        if (access_type == MMU_DATA_LOAD) {
> +            wp_access |= BP_MEM_READ;
> +        } else if (access_type == MMU_DATA_STORE) {
> +            wp_access |= BP_MEM_WRITE;
> +        }
> +
> +        /*
> +         * If a watchpoint isn't found for 'addr' this will
> +         * be a no-op and we'll resume the mmu_exception path.
> +         * Otherwise we'll throw a debug exception and execution
> +         * will continue elsewhere.
> +         */
> +        cpu_check_watchpoint(cs, address, wp_len, MEMTXATTRS_UNSPECIFIED,
> +                             wp_access, retaddr);
> +
>           raise_mmu_exception(env, address, access_type, pmp_violation,
>                               first_stage_error, two_stage_lookup,
>                               two_stage_indirect_error);


