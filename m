Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B6BC624D3
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 14:41:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1Pfu-0003nC-KC; Tue, 01 Sep 2026 10:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Pfn-0003ew-Ry
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 10:41:16 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1Pfl-00061m-NK
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 10:41:15 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-855a66e5b5dso47456617b3.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 07:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273672; cv=none;
 d=google.com; s=arc-20260327;
 b=IoOsZpq9707b26rV7LZ/5D8iTShosmuUHQb6FSmE1S/XZ2OKrI52G9uiKuBPzqWAla
 p3tIrl5GwtDb1px7gi8gPIr1gfdg3n4RKe6POWzxe76hMC3KA98KpPH9aUMPhDKvcB/7
 Mn2SEDUY2z0csyeA+1euCFBfnLxvT5X56SRSKqrcCuc7WPvA0HY7i0qKkHef5zI4gp0k
 rVjJHGLpsyz1JHsm8YH4yHyo/+kOZzk176xl3d6AtwL85RjQWCnfAVk1L8MyVn8Nq0Mp
 wQUmo5jElGwUvK6ZooD3w5zKtBWsa546u9v4Cht5RP8NM3LuOU6GVTHsDWd6laFPbmht
 qu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Ss9lVa1WoFp5SLkXNTCKE7ZQJZkcyYo5+kKKXmMUTkM=;
 fh=He3gQ9y5pTjqCRSQNMi4w+9E5QJ6N+VUaHPUkA+Aqeo=;
 b=duM1N78Db7of38yM/p09mjIHlAY7J1gvsh7vkR4/itg3YY3fTWky9j6p+lDcKFYmjB
 fRKYGH8iDfB6pA3bbKto/fX4oDBX2b3LUPXTrkHJY97DKS8Sz+kKkwRG/j0feTMOz9z9
 lctOl/1SyF/bLRpKT71SZdh3l7JeWCTyqxr1RdVS20iycmfouGGtEbRSalYyrc749ZOx
 jN/axpcHftA876HLe2hm8sFv7wafp/h4eFj3ufxzxluAGlXS2G8y2ooY/WzKTHWim48c
 uzB6cene94w0h6A23BzrJgmtlHyeJBhD33GSnwG8MFrs6asCRU4cPfdT3eDlzL9g9Jk+
 974A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788273672; x=1788878472; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Ss9lVa1WoFp5SLkXNTCKE7ZQJZkcyYo5+kKKXmMUTkM=;
 b=X4b3SGutYgN0aym2fMqlH8C7I0v1dl37gL/CTfn9Ld5BdpB0SaD//D54jebpWf2XU0
 w6CsA7USB+I/iuz2iQO7lJsNyhM5h4CB42TdhG/zKgI+dptAHCK3gJM3udog9ScDhNg7
 sBmaRyFG0p/4ybEhBuVf/S8DYd3ejHnTFrX3P+jPLPQy/UDpJny6HeG5/K8QkPNsyv2r
 EvvE+clBFkBsYvIzPijevOB8kLryiAecZgntuI8IjhqTOuj0E35FGvAA8heCPiJUAY8n
 h1zIa8ugG4q0szJeHE4pPCZovmVaIDBosPPS2UXfYlfNVxAob//DNeiNSMlQNhwl0t8G
 31dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788273672; x=1788878472;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Ss9lVa1WoFp5SLkXNTCKE7ZQJZkcyYo5+kKKXmMUTkM=;
 b=V+PsCI5YoBYAJx0QTbYgfUsdldn1ZAqoxeXfxDMETqKfsIpbL+q0ALoF09tTY7tfNT
 65UrzT3zYZx9bje5FxxK7Fe8d0X2RUCCfWzDarlQRKTa92hA0zJ8t3slGqbIPnFUILRI
 cCLiwKzuTrRC6lgBEUgAmJ1t+ZFx+IdQ6C+ykrxIenCqKslxCv4rASEt8fYHq+G+VgtQ
 4KjVhwxdwpUUfBexWRrANGVugrYBeOEuTf6OPqphRPs+5fz/hraXX5uJzTz1P0ZZPi+8
 KbUxUcHktiLtbszhF4WsFJW2rS/aPReP9uc2gXu2Rz9A197MQyH9cVrLG28s/2prOI/T
 DxKQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBysSRFqZAz/FSREc2VfDX4Ni/lNo0mjpb+4lrcewmpSAiuuikagQPtkCGqHWqPAkqbHcmf+4Bhp7WXF@nongnu.org
X-Gm-Message-State: AFuF++m7s16VKNp/drVFx7ILzRBlNVpnG/VcpGuEXhePx3DDaCgRA9EQ
 OlX7rUWFTantziLNytQAsjX7HJ9yHPG+/m+zYmQ5vKUpfaRfx2eS2krYExUKS4CGl4GyEhtW2DZ
 mySLITo3uIvOuvocYqxZ+K1jC1q0amRXVH//PTng4Bw==
X-Gm-Gg: AYBFou2r1IH309bZJ4qlEcfXYXUCyKaC9YYNlN/+tH7x6WJU9bvP/9PYzZRw48RprJT
 p4nUHCU01pNW7p17jQyet0WgDwaFp1XGkpL8+AEJRKZiW2Rbm47/wBFt+jlf3UevTmqud2JHIxB
 EUGSun8VUhMgX50yBCEpzBtN0eXrgK7AW2k0cNj6/X8A9wyILv81x5YlFYEES2KGAZNmscetVFJ
 pOjEZiI6tTuX4op3i4QJeg/YL/yXzSKz+vX5KsyPvivrEnwqKX6krTk0YNDpsMtZ+iBL9+lEqHh
 cG7SwZbSimv0shjaIfwgs2RuJCZzlL/IzUqAiP+x6QhSXJvEbJL/bTjoU2dB21u0zfEMZ3+Q8j2
 8IUpWyiPbXKqDVsSulwRC+dGXirHh
X-Received: by 2002:a05:690c:4017:b0:859:9c98:b8b4 with SMTP id
 00721157ae682-86875b7b5a6mr39126547b3.31.1788273672159; Tue, 01 Sep 2026
 07:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-5-richard.henderson@linaro.org>
In-Reply-To: <20260815203730.1468365-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 15:41:00 +0100
X-Gm-Features: AcwNN1UJKfZbjKh2bd_FuMYds1GxfgSxuJBFRTy6fyi2zfdUtM1DbjjX0Ul-b4I
Message-ID: <CAFEAcA90XrBA4EzTY_jQd0MtyXSpFn7tGy-jvRDwAe=HHmgdjg@mail.gmail.com>
Subject: Re: [RFC PATCH 04/18] target/arm: Generalize probe argument to
 allocation_tag_mem_internal
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
> We had a confusing relationship between 'probe' and 'ra == 0'.
> Make this explicit via an enumeration.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/mte_helper.c | 130 ++++++++++++++++++++++--------------
>  1 file changed, 80 insertions(+), 50 deletions(-)
>
> diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
> index dd4c10ef4f..31bf58c937 100644
> --- a/target/arm/tcg/mte_helper.c
> +++ b/target/arm/tcg/mte_helper.c
> @@ -87,28 +87,48 @@ typedef struct AllocationTagMem {
>      MemTxAttrs attrs;
>  } AllocationTagMem;
>
> +typedef enum {
> +    /* Trap on missing pages, invalid tag access, or watchpoints. */
> +    ATM_NORMAL,
> +    /* Gracefully return no tag memory for invalid pages. */
> +    ATM_PROBE_PAGES,
> +    /*
> +     * Basic page access has already been checked,
> +     * so a missing tlb entry is some sort of bug.
> +     * Assert the tlb entry is present, but gracefully fail if tag
> +     * access is not permitted to the page.
> +     */
> +    ATM_ASSERT_PAGES,
> +} AllocationTagMemKind;
> +
>  static AllocationTagMem
>  allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
>                              vaddr ptr, MMUAccessType ptr_access,
>                              int ptr_size, MMUAccessType tag_access,
> -                            bool probe, uintptr_t ra)
> +                            uintptr_t ra, AllocationTagMemKind atm_kind)

I think we generally prefer to make 'uintptr_t ra' the final argument
to a function call (though we don't 100% follow that convention).

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

