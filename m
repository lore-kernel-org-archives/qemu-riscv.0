Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AA4C61DD6
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 15:00:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1PyW-0002sF-0i; Tue, 01 Sep 2026 11:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1PyR-0002rF-9a
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 11:00:32 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1PyO-00029p-G2
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 11:00:31 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-836c8bdac50so149757b3.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 08:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788274827; cv=none;
 d=google.com; s=arc-20260327;
 b=ggWbXtL30NQWb1/IEUB5oN42BLgFK/IRN4ow8C1W4vDyBUsuHEaqJP+BNc/10xXYj1
 Z4+uQmfN8R/mmAwS1kWxnPjClvsl7T8tPFDhGM9HOyPuBBGgawDWvYEqXGAw5c7BgHwq
 /87pjtQnvWvl9zhcwrTP4SWjaL0E9iO3P7zoTiMU0YVN1iwaisdLxa6hmgPRFRAheUy/
 bZZ3Qwh86gkJcjX7xJMAVFB8KVCssjMM6zs8WLwCQ+uPcW5RG8C6S+v6Qpc81f3V3qsE
 t1Lf8a3CjqpkdMQjda1GrnGYFMjnKHHbKFRiVH89h1g+9RnR0qZz5MQ5KMBNnETYrjzi
 WVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=O8EOjDFm+wry6t9343Xh2LgYjmemUERgZx+dmAS7FfE=;
 fh=8wM4yqqQomfjKCzYTJyIXF1qV1OYHmgIzUj/KQWXSsU=;
 b=kCz++ENUIgafGSQ4XNpaWM/lz6P6/tNLoC0borOLcxNlgN7r0jFuMvvEP1n6iuFfPH
 woIb3Lm7hsGpurCeooYO0XCFIZ47cBYsyKCiQcg1c+LClwd5027fIRejs4fOJoVaoAHT
 DVyXyYPzBp8jD7X5R5t+ALRGZVvJq5HmoemoiszZfWWYY4ZDsmTQKKy9c05q+Uup3uZi
 0bHnNA/F92rvLkdXeYzuOA7Krj98saT2BRv+lfZBbcTvsX29p/QKqD6SDIBgJFYjqUEZ
 o+HnnXizANfBr7dLgWlSkawPW5GyPlwRXC21NVXrVGLqlyP3jcmJQSADfb+/GLW+Ja07
 CNUg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788274827; x=1788879627; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=O8EOjDFm+wry6t9343Xh2LgYjmemUERgZx+dmAS7FfE=;
 b=Ya0CAi9dRwN5CO4+KzPlI+klcLT2pRoQ1LIJwP3BI2hMdk35r42Tn+fzD80cXPoxE1
 xgV9x6HMTg5j4sI6Dulf/6XTPkjROPPAzcW1PwHdMk3c3bY61hQAmaZBXa0gpYXUzBsU
 4FZhHYV6Q3ysyAZTHUNnm9ovWnuGp8gya4HEAosur7nBXiArFvbqg3qEBUD0NWNZfvGR
 uruxzBeR55sDm5NMyy0gZTu+KQzj/xKLLAbJzretqI0r6tmqc/XNCTLc83B4NuPit+6K
 73QRDkDiHHIYb8nLqF3WboeI62TTggo8jSq3eNOA1WTg5AFYx20H0eotJi0Cf7CND3DZ
 Zx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788274827; x=1788879627;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=O8EOjDFm+wry6t9343Xh2LgYjmemUERgZx+dmAS7FfE=;
 b=r2QRnnUO1QRSWAJ+x1l9PSTCGctIZTgbG70cdyvLhMjw6R4fg5a3HV5tXWm1AvQTEJ
 cNgn2HHW8/Xwz27tL7Uh3d9uYkRjr+8h6bKGg/3z/9enfccYJELpfA9khbLsqah0Ld5u
 2E5obIuXfjvqKas0vwkVhYqLM9ozs+vqg8800ZznAC97GRPrGgheYpqIvaO4XXbqLTkg
 fLOPjRABWepJ/3CKO9dp2w+ljpePZUGwkC6gL53xAmF5RaxMGb/alY7fq4Ny60UPRL1m
 FOl0VFjOyEXtLRU2bhE0sF2RuEomfA+9pcyHh4LEjvZQDM2UnnkQlHj9lVnNpJ/YgXB5
 dUUw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxeZKIPwz5e+safRo2kvFuaHyqGSTjqELZRw+U25NWnP6+l9v6u5nX7YMLK1rdDVIpbYLEccjDvRoB6@nongnu.org
X-Gm-Message-State: AFuF++lwiArNnoEj6fwde7e2nvbmxR2iEluTc8XwdOIl64qUdtJRpU+l
 WLqJVID7fHvaVhd7HhsrgxXbhOdhnxOa8URNE1qdJqd7pKTP4y8AqcE++W1ief+OKDYUJ5jsIWW
 sRdgwIbXTY/CmCHs9kDjoQU+hwB+oSrxQyu9rQxeoTw==
X-Gm-Gg: AYBFou1kAnMTThQZLCyV61yI5VI2Eo5aqJ+Li281i+ZHAU5y2YDbKg4Igx9nHIcxKsz
 Ur3fFIDCNpMRW1tPecGwvxy9GNHuqSbdC4tn0ux3e+68ptOp5SUcnDCh8AxLEXpz+mTKuAsZkYc
 jktPqd2nZyKH1dYTGC8fLgmawI5DnkQeGjL1QsB2CAJK+TK6f0/xRuXt8mGm0pgzD92R/m8ye3o
 xLbDeq8ARHg4yhI83Rf1ajDIrKPD7pN6ma05kROhO2abvKRNe42xB9PkvntfH8wwPL654atiqZt
 QlYqAlCM5g93qyBiyERxnl0XIB+zxm78ldFOUyOUQh0Z1rODRN30RRRCRMKcC619O3J9j3ajW0f
 3uwZpRtZJJlY+3wBym6cl4BTgAN1AVBZdmLy0/A==
X-Received: by 2002:a05:690c:4017:b0:808:f9bb:3832 with SMTP id
 00721157ae682-86874ed6716mr36431947b3.22.1788274825957; Tue, 01 Sep 2026
 08:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-8-richard.henderson@linaro.org>
In-Reply-To: <20260815203730.1468365-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 16:00:14 +0100
X-Gm-Features: AcwNN1WPi7qGbg46Wh0xWYH9-0XQaT0gVeeR0vqvhzK0VAgdSmxHoNQPfEo-pc0
Message-ID: <CAFEAcA_C7KpgU2--eEKwifuTgh-oCJPKexy30RB=Bc8VCcXD3w@mail.gmail.com>
Subject: Re: [RFC PATCH 07/18] accel/tcg: Replace size with first/last in
 probe_access_full
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Sat, 15 Aug 2026 at 21:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/accel/tcg/probe.h     |  2 +-
>  accel/tcg/cputlb.c            | 17 +++++++++++------
>  target/arm/tcg/helper-a64.c   |  5 ++++-
>  target/arm/tcg/mte_helper.c   | 21 ++++++++++++---------
>  target/arm/tcg/sve_helper.c   |  5 ++++-
>  target/mips/tcg/ldst_helper.c |  4 ++--
>  6 files changed, 34 insertions(+), 20 deletions(-)

> @@ -1412,19 +1412,24 @@ static int probe_access_internal(CPUState *cpu, vaddr addr,
>      return flags;
>  }
>
> -int probe_access_full(CPUArchState *env, vaddr addr, int size,
> +int probe_access_full(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
>                        MMUAccessType access_type, int mmu_idx,
>                        bool nonfault, void **phost, CPUTLBEntryFull **pfull,
>                        uintptr_t retaddr)
>  {
> -    int flags = probe_access_internal(env_cpu(env), addr, size, access_type,
> -                                      mmu_idx, nonfault, phost, pfull, retaddr,
> -                                      true);
> +    int flags;
> +
> +    assert(first <= addr);
> +    assert(addr <= last);
> +    assert(((first ^ last) & TARGET_PAGE_MASK) == 0);
> +
> +    flags = probe_access_internal(env_cpu(env), addr, last - addr + 1,
> +                                  access_type, mmu_idx, nonfault,
> +                                  phost, pfull, retaddr, true);
>
>      /* Handle clean RAM pages.  */
>      if (unlikely(flags & TLB_NOTDIRTY)) {
> -        int dirtysize = size == 0 ? 1 : size;
> -        notdirty_write(env_cpu(env), addr, dirtysize, *pfull, retaddr);
> +        notdirty_write(env_cpu(env), first, last - first + 1, *pfull, retaddr);
>          flags &= ~TLB_NOTDIRTY;
>      }

> diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
> index 399bca30c9..f36286d596 100644
> --- a/target/arm/tcg/mte_helper.c
> +++ b/target/arm/tcg/mte_helper.c
> @@ -151,6 +151,7 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
>      ret.flags = 0;
>  #else
>      CPUTLBEntryFull *full;
> +    vaddr ptr_last, ptr_page_last;
>      hwaddr ptr_paddr, tag_paddr, xlat;
>      MemoryRegion *mr;
>      ARMASIdx tag_asi;
> @@ -162,7 +163,11 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
>       * exception for inaccessible pages, and resolves the virtual address
>       * into the softmmu tlb.
>       */
> -    ret.flags = probe_access_full(env, ptr, 0, ptr_access, ptr_mmu_idx,
> +    ptr_last = ptr + ptr_size - 1;
> +    ptr_page_last = ptr | ~TARGET_PAGE_MASK;

Are we definitely guaranteed not to get here such that ptr_last has wrapped
back around to 0 ?  I think 'ptr' can come directly from the guest
(e.g. trans_LDG can pass a guest register value to HELPER(ldg), which
calls us). In that case we'll fail the assert() inside probe_access_full()
because last will be < addr. The second probe below will also calculate
a ptr_page_last + 1 that wraps round to 0.

> diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
> index 1b25466b49..065570a8f1 100644
> --- a/target/mips/tcg/ldst_helper.c
> +++ b/target/mips/tcg/ldst_helper.c
> @@ -44,8 +44,8 @@ target_ulong helper_##name(CPUMIPSState *env, target_ulong arg,               \
>      int flags;                                                                \
>                                                                                \
>      env->llval = do_cast cpu_##insn##_mmu(env, arg, oi, ra);                  \
> -    flags = probe_access_full(env, arg, size, MMU_DATA_LOAD, mem_idx,         \
> -                              true, &host_unused, &full, ra);                 \
> +    flags = probe_access_full(env, arg, arg, arg + size - 1, MMU_DATA_LOAD,   \
> +                              mem_idx, true, &host_unused, &full, ra);        \
>      assert(!(flags & TLB_INVALID_MASK));                                      \
>      env->CP0_LLAddr = full->phys_addr;                                        \
>      env->lladdr = arg;                                                        \

The macro magic in the MIPS translator is confusing, but I think that
it's possible that "arg + size - 1" here also might wrap round to 0 ?

thanks
-- PMM

