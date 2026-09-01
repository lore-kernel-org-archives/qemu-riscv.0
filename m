Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E742C624D5
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 15:33:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1QU4-0000Vg-Df; Tue, 01 Sep 2026 11:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1QU1-0000UQ-0H
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 11:33:09 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1QTx-0002hK-Ql
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 11:33:08 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-855de2d0d4dso17964587b3.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 08:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276784; cv=none;
 d=google.com; s=arc-20260327;
 b=dnm3fXSaI5Y4N4TqJeIqwSc0JUVco11f8b+dOHdFLouCW3mrbi+W0YgWVSG57f8C5r
 tHcAnsaCi4vs42WeDU6ovcbUncCemcP9c/QrlfCkrdtkNQobzCy3WAhohG/wX2BGtyIE
 SNsKHbAFaMQOuze8VyREilzWscZnKnfPrXKBDVgpLznIzzWGToIELLqlbB+SZ+SmY0SJ
 EXjDiqfljm6wAaJIyblU2Dk0wY+5n0ZrasXb94QzM1NpGoinq7H/tb+0E51+VeKTx9uN
 O2VinRO6iMr0I8MrL8VdZ+BzUyNBN5kCRgFUo3f/U+x29CYXG+fJYC5UqoX4DVXanT58
 NuLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TfsYZWGUp3JEz46SYJF6kaNN+w8kJcJepqqETpNYZOw=;
 fh=0Yg7SDVrAdiJ1Gwqzt7iHHW0Z6hsai3hTLpkRzCqvNw=;
 b=X+bwUhDnmzbv1pykOApW8nA99fgk2v4yPX3sLbxdORu6WFdodpu9HHuUF3VYx95xZz
 RJC7wNjs9I0a9JOPGgmJWXLf17zQ5tVV2YfVSJZS8MBXAPoA7Zno2eV8VbtcjxJj9msf
 +kF5D+VeI2OgMRZfkOACCT1qcDtW5tD55XrFQlgM11/cfQw97T1ey25hM9rAFYnsQeyB
 /TEqPoQRX4kZSxxkcKzBiSBpo6w9w1eLbvnVtwT6rYnlZnkglyFDlXedhTEZ4heOcSCi
 vuxInPVmlJ4Ow9Al/qhgC6wREg7ii5+kxmwqDIcpj0eLMafuaN6qmlFF8hi1GKEDHoqf
 N8Gw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788276784; x=1788881584; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TfsYZWGUp3JEz46SYJF6kaNN+w8kJcJepqqETpNYZOw=;
 b=GIgNi2qjpdKeeKU/zUTyG8MGQB+b/f/kF1xnUD7B19vRw3vw67eea1Nayb3gnAMM8c
 OT9RgnLuFHUz6Vkqe2hbnGTnSy6sB+KchPW7pkpRkjtfDiFI0ifDiBqnBGenyKGKVCgK
 opFss+hmEEJTSMxuDAllSqt766Hc0u5VjtG0cTf0n/qwTk3v4XhhU9m/KfzU4QujvlWL
 i4FD11eMiM8A/iUFTf4BiqWLGoSnvNl4vEGxaeB1tPnKjFZGztX+vUN28/LzAocYsib2
 LQC6tHtcqJJmK30H691PcxQHhIxkXwnKH7dOyIK/0QEu0p9FmukyiBrtxfhHvaoiAebl
 M/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788276784; x=1788881584;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TfsYZWGUp3JEz46SYJF6kaNN+w8kJcJepqqETpNYZOw=;
 b=MTrT/QyvRadbUHRys3NrNVWd6KNAf9PNTJpOlitz/Ul/tF25hF7ZkWe7pmRx0bywpB
 KHueFU7T5a6muUre/HN8zUQs4MiMxtyYsIze5tidtHrq/L/S+eE5OdtZ9wJ4fGI/cjgA
 Lju4mv6+PbM3ij+0nE92Eg/L6afZs22vX6ye/8M2qV/bvfPngil7YJDN0zG3FLVluT76
 w2MT3fudBvtYS6ETvMESx2zh7ZtnMUiGdfW7w4V+5GD51FG6fct17hf96cMXqBXOvPtl
 TAv0MAyMI2l/xAI4uDrpT7EN4124RCjjy6q0y+XSCLcVFwXO+Zu3ahCGxouedqkM9Fli
 EW4w==
X-Forwarded-Encrypted: i=1;
 AKwUvByUGTV5+TesOJvZYyDfxnvT7+Lt4BvSQiZCpu8eYlkCvULPoSUzkvmDJNt808T9hZpWrM1CaYoF/eFx@nongnu.org
X-Gm-Message-State: AFuF++ly3bubRR7WUxy5+Bme1z5ZVEyXO8iMa0NABm2wcigv1BTqyQ/N
 rT9CgS0clJb/46R7ASSSZAeZ7vDSv1X8WQPkRkdiUSXV9eN6rSDONW+MhtLXdo1I7vqJfzWg/MX
 KSWrKBoslWEtWuJ+sMjsQrXMANHl/1ai3hTk6Q3SN90KnYhymqO11zTA=
X-Gm-Gg: AYBFou3BpF2CUjj1QV9HT5bM4kj7o3Pb8E9sMRQbLrRq4I+HOAQ3MX+7FLmShB/rdBP
 OLhOdpIaTuBnSg5jX4PmZbqn9S/u5QO6wMl2yE9b4HPnHDQP9ofgHXTD/4qc6aDwIdK7kQU6hLV
 4xtMo6/BfPwhExXn1NQ07gaSGj1VdyKw8AcBTCoyPNbsX2Zz3cJ8mq/7aB03xjsbkgY3FjS4Z/p
 hUA8FJ2ukgqoBXJY1OZaBoDpqTMycuhkxSxWecL/QS4bizXahZURvJwe3VLpXvQhuIwe6Bu6uma
 JU3X5It5IEXE75OKPCJsLC2H/UA3sjprjohPnnqQm4T0iJRpFRL2fHAxTRmfBPt6N7Dlfene537
 slfRjBZQUyzUkeUx2dSqiLP5cKQP/0T4qwVV3EAs=
X-Received: by 2002:a05:690c:6612:b0:82d:8dc0:9cf with SMTP id
 00721157ae682-8694d8b47dfmr27793407b3.13.1788276784411; Tue, 01 Sep 2026
 08:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-12-richard.henderson@linaro.org>
In-Reply-To: <20260815203730.1468365-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 16:32:52 +0100
X-Gm-Features: AcwNN1VaWNaLBvJzUz4ncwiHukBE1sGNIdi--zfmzWUHZDkOOjWrXqjsU6ZrGdw
Message-ID: <CAFEAcA_SLOJ9HufYt5B88S5LwCKo1Cmj8EqcvRn1Ym0jCFc_WA@mail.gmail.com>
Subject: Re: [RFC PATCH 11/18] accel/tcg: Replace size with first/last in
 tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
> Propagate the API change down one step further within cputlb.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -1664,8 +1665,8 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data, MemOp memop,
>      if (!tlb_hit(tlb_addr, addr)) {
>          if (!victim_tlb_hit(cpu, mmu_idx, index, access_type,
>                              addr & TARGET_PAGE_MASK)) {
> -            tlb_fill_align(cpu, addr, access_type, mmu_idx,
> -                           memop, data->size, false, ra);
> +            tlb_fill_align(cpu, addr, addr, addr + data->size - 1,
> +                           access_type, mmu_idx, memop, false, ra);

Can the "addr + data->size - 1" in these mmu lookup functions overflow?

>              maybe_resized = true;
>              index = tlb_index(cpu, mmu_idx, addr);
>              entry = tlb_entry(cpu, mmu_idx, addr);
> @@ -1833,8 +1834,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
>      if (!tlb_hit(tlb_addr, addr)) {
>          if (!victim_tlb_hit(cpu, mmu_idx, index, MMU_DATA_STORE,
>                              addr & TARGET_PAGE_MASK)) {
> -            tlb_fill_align(cpu, addr, MMU_DATA_STORE, mmu_idx,
> -                           mop, size, false, retaddr);
> +            tlb_fill_align(cpu, addr, addr, addr + size - 1,
> +                           MMU_DATA_STORE, mmu_idx, mop, false, retaddr);
>              did_tlb_fill = true;
>              index = tlb_index(cpu, mmu_idx, addr);
>              tlbe = tlb_entry(cpu, mmu_idx, addr);
> @@ -1849,8 +1850,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
>       * but addr_read will only be -1 if PAGE_READ was unset.
>       */
>      if (unlikely(tlbe->addr_read == -1)) {
> -        tlb_fill_align(cpu, addr, MMU_DATA_LOAD, mmu_idx,
> -                       0, size, false, retaddr);
> +        tlb_fill_align(cpu, addr, addr, addr + size - 1,
> +                       MMU_DATA_LOAD, mmu_idx, 0, false, retaddr);

thanks
-- PMM

