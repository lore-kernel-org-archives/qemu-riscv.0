Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702BAC3DA4A
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 07:35:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sgJOw-0004Zw-VJ; Tue, 20 Aug 2024 03:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sgJOu-0004T4-BD
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2024 03:35:32 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sgJOr-0004GC-7e
 for qemu-riscv@nongnu.org; Tue, 20 Aug 2024 03:35:31 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2023dd9b86aso14750485ad.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Aug 2024 00:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724139327; x=1724744127;
 darn=nongnu.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oQmVDu+nVQ252neP3KfE2/E4Gu6nUcN44zKZEDskeRQ=;
 b=16dLyyC7i9MFIugkK+ezafvtizh/LFRk7bDKshbZDufsfBB7qONrqiqVcCUY3AV1z+
 ynI+xbFSIHzgx8LQ5Y0DNkB4tMi+tU/butuAhbjJkuAiD50oFCjdAwE3Kl8tDXB55b+l
 q5Jc9eBgKJE0o6EhOdbAIPAgc7+HHKHIhs8oAgvsapJll0hbKW6SY6UirFTvQxPDWyJu
 Pkehvvrpc92nsg6GNQJpNn2eH9LFqmqhJLWVin9YJqNS2O051kZE2KY94KvNyFvpFJJv
 8GErTrYQLR2qzBGQlHTardA4iUSH6Rj6r28OXBDmi+kEgcs5QusB8B0eomxDj85EJHts
 kkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724139327; x=1724744127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQmVDu+nVQ252neP3KfE2/E4Gu6nUcN44zKZEDskeRQ=;
 b=KSxiqVOliMDoi6cmp+BC2a5PBIpuehUErrwEZNkd3KFzHasYKjBPDnV6dIvkMeqlCu
 YPtk4RjfzvZtBBW1FUAFWblGASdDTa1DNeZQPr0/zoIaicxBtX3SqFlKtWowBxgjqj7Y
 28Yy0rR348UYed2Ww2jeiz6l5pJKrYPsCZuBuxyGEeWY9GIhCtgGWj5L5hLoAuDRRHPt
 hoFATAe9JOuomMOgpwnh6z2R50OmvejI2TwRHoYlrj8l7mEgKVB8DcPbMzjH5gnUx+mQ
 bz+zElKQBqDHGkIo7fkPg3rtJSeSYwx5dKfdeY+0I3Xmf1JhJQoIBUuccbtdDXcTiXnD
 hhIg==
X-Gm-Message-State: AOJu0Yx7CeHDrvrrs/tBVTqY2tsBAElJQbT06NuCOXRHsmHdKsI+20C2
 6ARUXAew/pSovb17w75DYNlvQq5/SSV6kps/tBgOvbDWpEjtPK1UawUENRZBJUEIm7jrFP5ze5A
 F
X-Google-Smtp-Source: AGHT+IGRWw29dsTMQKl3frYbGT87OXVDHY9hoHXkrutcFXSnSzO8sMuPRXXhKFwufPBXZopVY7KQBQ==
X-Received: by 2002:a17:902:da8a:b0:1fa:fc74:4c04 with SMTP id
 d9443c01a7336-20203ef325amr139754595ad.35.1724139326787; 
 Tue, 20 Aug 2024 00:35:26 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201f038b1e3sm72515555ad.199.2024.08.20.00.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 00:35:26 -0700 (PDT)
Date: Tue, 20 Aug 2024 00:35:24 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com,
 andy.chiu@sifive.com, kito.cheng@sifive.com,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 11/15] target/riscv: mmu changes for zicfiss shadow
 stack protection
Message-ID: <ZsRHPDG/GkyhdrQi@debug.ba.rivosinc.com>
References: <20240820000129.3522346-1-debug@rivosinc.com>
 <20240820000129.3522346-12-debug@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240820000129.3522346-12-debug@rivosinc.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Aug 19, 2024 at 05:01:25PM -0700, Deepak Gupta wrote:
>zicfiss protects shadow stack using new page table encodings PTE.W=0,
>PTE.R=0 and PTE.X=0. This encoding is reserved if zicfiss is not
>implemented or if shadow stack are not enabled.
>Loads on shadow stack memory are allowed while stores to shadow stack
>memory leads to access faults. Shadow stack accesses to RO memory
>leads to store page fault.
>
>To implement special nature of shadow stack memory where only selected
>stores (shadow stack stores from sspush) have to be allowed while rest
>of regular stores disallowed, new MMU TLB index is created for shadow
>stack.
>
>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>---
>@@ -1406,6 +1431,11 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
>                   __func__, address, access_type, mmu_idx);
>
>+    /* If shadow stack instruction initiated this access, treat it as store */
>+    if (mmu_idx & MMU_IDX_SS_WRITE) {
>+        access_type = MMU_DATA_STORE;
>+    }
>+

I think I forgot to address this. Do you still want me to fix this up like you
had suggested?

IIRC, you mentioned to use TARGET_INSN_START_EXTRA_WORDS=2. Honestly I don't know
what it means and how its used. Based on git grep and some readup, are you expecting something
along the below lines?


"""

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fee31b8037..dfd2efa941 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -47,7 +47,7 @@ typedef struct CPUArchState CPURISCVState;
   * RISC-V-specific extra insn start words:
   * 1: Original instruction opcode
   */
-#define TARGET_INSN_START_EXTRA_WORDS 1
+#define TARGET_INSN_START_EXTRA_WORDS 2
  
  #define RV(x) ((target_ulong)1 << (x - 'A'))
  
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f74a1216b1..b266177e46 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1271,6 +1271,11 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
  {
      CPUState *cs = env_cpu(env);
  
+     if (!pmp_violation &&
+         tcg_ctx->gen_insn_data[TARGET_INSN_START_EXTRA_WORDS-1] & 1) {
+         tcg_ctx->gen_insn_data[TARGET_INSN_START_EXTRA_WORDS-1] &= ~1;
+         access_type = MMU_DATA_STORE;
+     }
+
      switch (access_type) {
      case MMU_INST_FETCH:
          if (pmp_violation) {
@@ -1433,7 +1438,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
  
      /* If shadow stack instruction initiated this access, treat it as store */
      if (mmu_idx & MMU_IDX_SS_WRITE) {
-        access_type = MMU_DATA_STORE;
+        tcg_ctx->gen_insn_data[TARGET_INSN_START_EXTRA_WORDS-1] |= 1;
      }
  
      pmu_tlb_fill_incr_ctr(cpu, access_type);
@@ -1529,6 +1534,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
      if (ret == TRANSLATE_SUCCESS) {
          tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
                       prot, mmu_idx, tlb_size);
+        tcg_ctx->gen_insn_data[TARGET_INSN_START_EXTRA_WORDS-1] &= ~1;
          return true;
      } else if (probe) {


"""

>     pmu_tlb_fill_incr_ctr(cpu, access_type);
>     if (two_stage_lookup) {
>         /* Two stage lookup */
>diff --git a/target/riscv/internals.h b/target/riscv/internals.h
>index 0ac17bc5ad..ddbdee885b 100644
>--- a/target/riscv/internals.h
>+++ b/target/riscv/internals.h
>@@ -30,12 +30,15 @@
>  *  - U+2STAGE          0b100
>  *  - S+2STAGE          0b101
>  *  - S+SUM+2STAGE      0b110
>+ *  - Shadow stack+U   0b1000
>+ *  - Shadow stack+S   0b1001
>  */
> #define MMUIdx_U            0
> #define MMUIdx_S            1
> #define MMUIdx_S_SUM        2
> #define MMUIdx_M            3
> #define MMU_2STAGE_BIT      (1 << 2)
>+#define MMU_IDX_SS_WRITE    (1 << 3)
>
> static inline int mmuidx_priv(int mmu_idx)
> {
>-- 
>2.44.0
>

