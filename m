Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF584CF34C2
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 18:37:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1swQet-0007XN-Bz; Thu, 03 Oct 2024 14:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1swQeR-0007GG-9e
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2024 14:34:17 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1swQeO-00053n-3y
 for qemu-riscv@nongnu.org; Thu, 03 Oct 2024 14:34:10 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2e09fe0a878so1000775a91.1
 for <qemu-riscv@nongnu.org>; Thu, 03 Oct 2024 11:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727980443; x=1728585243;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qMl0wOVdpYR1ANnhlgzvb07hHsnxQN9qOy6OtOfW7ZU=;
 b=H3pbGgYUJwsbCjG0fPsrcFHLVp0Nom8Oh66MnBFb2hQkEJXmjJQw3BhWMurAiBg96+
 rZElq9nCN5ccb3wgnorTv6NwjVVPVwf3OXs3FHfFy5jATfy88TXvgbgUQO62S6N4N3Y4
 MKTSQAZQUIsMFxf0hkG+O/CgzDCUIWF76Gkwm7eHNzg15lWtf7Ml+NzRrHjp0QuOcR/F
 3tmzwc9TLUTFOLQP0BU01h4brKusAAJv+wusLQ9XP1sDcl+aDgZvo5FMO0cnRWVUTA+s
 T+PLDfD9r4K1D52AZPXNM94Kk29T/85+7splhUb6UY7EqggYVi4KquqqcNFrKd81D4yM
 2nCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727980443; x=1728585243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qMl0wOVdpYR1ANnhlgzvb07hHsnxQN9qOy6OtOfW7ZU=;
 b=jkaotGO80uk/7c+3YB8otp9Zqqp4Fma8LUUXe5nRX4g6xdMOxwTmK0bjF+l8ZkMRJm
 vrvDZOfTglv83weYfyCLMjuHqG+GjTluLlLh1sw2MJOiursv8TFk4ZNcCfnqeUVjr8CG
 1ux34VqCfnKaPzBQQVBFm7Ly/CrVgtgKiLX9rp4VTiWyPORH8j82k3inVa7GHoiEA6M0
 uti1BHxqAiTBO1NZP7wpeWQgLA+8bfDTlXLts6ySQOjdwNY8SYrzpmXOTEbORKS3t8ff
 YUU7Io0HSVhUTxPN1FLq+XPlIjunk8ny832/VEfJTfgSVBoAtnEyv8Uq3ZxkObQ8Flhx
 M4Ew==
X-Gm-Message-State: AOJu0YyFindXbSy8u/G/V1VKxoQocKyeNmKyBiQ7Jmh+JwQWX0Plqyzg
 Xb6sYL3GljGnHa6Fe4ZupQNCYPxXP3B+pQJrr1/Q1N6c7+geWKN8/u344QZTmxwfS1Zp+QWxC0Q
 o
X-Google-Smtp-Source: AGHT+IGLo4MreZoXQTJEzJCUIv40m4e+6rGR7rvkLa2eEP0wZO882OoaYvQSFqscWjJ+Y7q7+6LR9w==
X-Received: by 2002:a17:90b:1185:b0:2d3:d066:f58b with SMTP id
 98e67ed59e1d1-2e1e62259c0mr42633a91.12.1727980443344; 
 Thu, 03 Oct 2024 11:34:03 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20beefad16asm11796245ad.193.2024.10.03.11.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 11:34:03 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, kito.cheng@sifive.com,
 Deepak Gupta <debug@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v15 13/21] target/riscv: mmu changes for zicfiss shadow stack
 protection
Date: Thu,  3 Oct 2024 11:33:34 -0700
Message-ID: <20241003183342.679249-14-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241003183342.679249-1-debug@rivosinc.com>
References: <20241003183342.679249-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=debug@rivosinc.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

zicfiss protects shadow stack using new page table encodings PTE.W=1,
PTE.R=0 and PTE.X=0. This encoding is reserved if zicfiss is not
implemented or if shadow stack are not enabled.
Loads on shadow stack memory are allowed while stores to shadow stack
memory leads to access faults. Shadow stack accesses to RO memory
leads to store page fault.

To implement special nature of shadow stack memory where only selected
stores (shadow stack stores from sspush) have to be allowed while rest
of regular stores disallowed, new MMU TLB index is created for shadow
stack.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 46 +++++++++++++++++++++++++++++++++------
 target/riscv/internals.h  |  3 +++
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 93d199748e..5580f5f3f3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -898,6 +898,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     hwaddr ppn;
     int napot_bits = 0;
     target_ulong napot_mask;
+    bool is_sstack_idx = ((mmu_idx & MMU_IDX_SS_WRITE) == MMU_IDX_SS_WRITE);
+    bool sstack_page = false;
 
     /*
      * Check if we should use the background registers for the two
@@ -1106,21 +1108,40 @@ restart:
         return TRANSLATE_FAIL;
     }
 
+    target_ulong rwx = pte & (PTE_R | PTE_W | PTE_X);
     /* Check for reserved combinations of RWX flags. */
-    switch (pte & (PTE_R | PTE_W | PTE_X)) {
-    case PTE_W:
+    switch (rwx) {
     case PTE_W | PTE_X:
         return TRANSLATE_FAIL;
+    case PTE_W:
+        /* if bcfi enabled, PTE_W is not reserved and shadow stack page */
+        if (cpu_get_bcfien(env) && first_stage) {
+            sstack_page = true;
+            /* if ss index, read and write allowed. else only read allowed */
+            rwx = is_sstack_idx ? PTE_R | PTE_W : PTE_R;
+            break;
+        }
+        return TRANSLATE_FAIL;
+    case PTE_R:
+        /*
+         * no matter what's the `access_type`, shadow stack access to readonly
+         * memory are always store page faults. During unwind, loads will be
+         * promoted as store fault.
+         */
+        if (is_sstack_idx) {
+            return TRANSLATE_FAIL;
+        }
+        break;
     }
 
     int prot = 0;
-    if (pte & PTE_R) {
+    if (rwx & PTE_R) {
         prot |= PAGE_READ;
     }
-    if (pte & PTE_W) {
+    if (rwx & PTE_W) {
         prot |= PAGE_WRITE;
     }
-    if (pte & PTE_X) {
+    if (rwx & PTE_X) {
         bool mxr = false;
 
         /*
@@ -1164,8 +1185,11 @@ restart:
     }
 
     if (!((prot >> access_type) & 1)) {
-        /* Access check failed */
-        return TRANSLATE_FAIL;
+        /*
+         * Access check failed, access check failures for shadow stack are
+         * access faults.
+         */
+        return sstack_page ? TRANSLATE_PMP_FAIL : TRANSLATE_FAIL;
     }
 
     target_ulong updated_pte = pte;
@@ -1352,9 +1376,17 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
         break;
     case MMU_DATA_LOAD:
         cs->exception_index = RISCV_EXCP_LOAD_ADDR_MIS;
+        /* shadow stack mis aligned accesses are access faults */
+        if (mmu_idx & MMU_IDX_SS_WRITE) {
+            cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
+        }
         break;
     case MMU_DATA_STORE:
         cs->exception_index = RISCV_EXCP_STORE_AMO_ADDR_MIS;
+        /* shadow stack mis aligned accesses are access faults */
+        if (mmu_idx & MMU_IDX_SS_WRITE) {
+            cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
+        }
         break;
     default:
         g_assert_not_reached();
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 0ac17bc5ad..ddbdee885b 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -30,12 +30,15 @@
  *  - U+2STAGE          0b100
  *  - S+2STAGE          0b101
  *  - S+SUM+2STAGE      0b110
+ *  - Shadow stack+U   0b1000
+ *  - Shadow stack+S   0b1001
  */
 #define MMUIdx_U            0
 #define MMUIdx_S            1
 #define MMUIdx_S_SUM        2
 #define MMUIdx_M            3
 #define MMU_2STAGE_BIT      (1 << 2)
+#define MMU_IDX_SS_WRITE    (1 << 3)
 
 static inline int mmuidx_priv(int mmu_idx)
 {
-- 
2.45.0


