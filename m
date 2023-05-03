Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6R1-0007h5-2A
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qx-0007dQ-Fq
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:51 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Ql-0001io-Hf
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:57:51 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2fc3f1d6f8cso2874269f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097058; x=1685689058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E+QlOMba/aSBW632xLY397LQPEBGu7J2mpCgxpenFkM=;
 b=b4tZIPpJ13gTI2BJKAHvJFMh5hIYneamGkJyU1usnUIxoqFQb8zvYxFVEY3j1KfDLW
 BAAcc9pPFlh4trSjg53IeRCbGk5BRqBZwXU1KHFai2nfYh4vPtxSz+oJbmDFSRJs99GP
 bClQAhVna+O7YKu747oioq9H8x0adPX5cVKzHPUobYCRUMcuqbAb0qMMkoRzfAuxTSmM
 f351OkpEcvfauakjHT6iBht/aVBXTr/ZnKmYLEuFvTtazZP5uQknA+ZNp0pRU5oaTsU9
 6h0R8jIErwi1Lmp8T8E5yIWX8wedJnEVmO6yLNwXerg9BS/J/7xp1NhYZeqV3a307lt8
 sEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097058; x=1685689058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E+QlOMba/aSBW632xLY397LQPEBGu7J2mpCgxpenFkM=;
 b=GCGVijcfJLheU5wrZQrCY7bL6h9trybAZyt232o7yKf85WCSO5gACzl5CQL5ofQQhL
 /3uFdktE2BKrOy7GH5Ly6B2QP4gF+LYp7O5Wax6FpzBfBQAY/Pt0oOl+kfC0wU/5+Jb3
 D68qMow6Iy5dNtnmBIdI1rEfW9HAtZJv2XusI3WgIZ3z1bYzG9qt13ORaYm2YlFAVPeB
 P4o3fRtM/HNoiQTpr2kpzpchSTF7qAQSXikjbZaYb+NAaZN/hWt5t8+t3JhaUpkQySHr
 pfDow8tXRt676St+T0BzZ7ZJrvQP8ol+hQK2tSpGO1uxFX8UmLWxoNMSFvyp3Fp60pL3
 YdYA==
X-Gm-Message-State: AC+VfDxR6AbRfk80qnC4W+LWMM7Cdi96OgKHToJTGXO+GyUGS+xIbZtQ
 m6EtUQ5fohFqEpJwo3oTIls5q6lfgdnqpuP6Y4CRxw==
X-Google-Smtp-Source: ACHHUZ560KVoN0S941hx/5uQLP4Pi1xXxkV4WcndBLYMGVg5kFy3dHUgRgSZWxxPDmOj2ju4NkjHBg==
X-Received: by 2002:adf:e582:0:b0:306:3382:721d with SMTP id
 l2-20020adfe582000000b003063382721dmr4698556wrm.38.1683097057733; 
 Tue, 02 May 2023 23:57:37 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 10/54] tcg/aarch64: Introduce prepare_host_addr
Date: Wed,  3 May 2023 07:56:45 +0100
Message-Id: <20230503065729.1745843-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 03 May 2023 06:57:51 -0000

Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
and some code that lived in both tcg_out_qemu_ld and tcg_out_qemu_st
into one function that returns HostAddress and TCGLabelQemuLdst structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 313 +++++++++++++++--------------------
 1 file changed, 133 insertions(+), 180 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index d8d464e4a0..202b90c001 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1667,113 +1667,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_goto(s, lb->raddr);
     return true;
 }
-
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
-                                TCGType ext, TCGReg data_reg, TCGReg addr_reg,
-                                tcg_insn_unit *raddr, tcg_insn_unit *label_ptr)
-{
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->oi = oi;
-    label->type = ext;
-    label->datalo_reg = data_reg;
-    label->addrlo_reg = addr_reg;
-    label->raddr = tcg_splitwx_to_rx(raddr);
-    label->label_ptr[0] = label_ptr;
-}
-
-/* We expect to use a 7-bit scaled negative offset from ENV.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -512);
-
-/* These offsets are built into the LDP below.  */
-QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, mask) != 0);
-QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, table) != 8);
-
-/* Load and compare a TLB entry, emitting the conditional jump to the
-   slow path for the failure case, which will be patched later when finalizing
-   the slow path. Generated code returns the host addend in X1,
-   clobbers X0,X2,X3,TMP. */
-static void tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
-                             tcg_insn_unit **label_ptr, int mem_index,
-                             bool is_read)
-{
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_mask = (1u << a_bits) - 1;
-    unsigned s_mask = (1u << s_bits) - 1;
-    TCGReg x3;
-    TCGType mask_type;
-    uint64_t compare_mask;
-
-    mask_type = (TARGET_PAGE_BITS + CPU_TLB_DYN_MAX_BITS > 32
-                 ? TCG_TYPE_I64 : TCG_TYPE_I32);
-
-    /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {x0,x1}.  */
-    tcg_out_insn(s, 3314, LDP, TCG_REG_X0, TCG_REG_X1, TCG_AREG0,
-                 TLB_MASK_TABLE_OFS(mem_index), 1, 0);
-
-    /* Extract the TLB index from the address into X0.  */
-    tcg_out_insn(s, 3502S, AND_LSR, mask_type == TCG_TYPE_I64,
-                 TCG_REG_X0, TCG_REG_X0, addr_reg,
-                 TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-
-    /* Add the tlb_table pointer, creating the CPUTLBEntry address into X1.  */
-    tcg_out_insn(s, 3502, ADD, 1, TCG_REG_X1, TCG_REG_X1, TCG_REG_X0);
-
-    /* Load the tlb comparator into X0, and the fast path addend into X1.  */
-    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_X0, TCG_REG_X1, is_read
-               ? offsetof(CPUTLBEntry, addr_read)
-               : offsetof(CPUTLBEntry, addr_write));
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_X1, TCG_REG_X1,
-               offsetof(CPUTLBEntry, addend));
-
-    /* For aligned accesses, we check the first byte and include the alignment
-       bits within the address.  For unaligned access, we check that we don't
-       cross pages using the address of the last byte of the access.  */
-    if (a_bits >= s_bits) {
-        x3 = addr_reg;
-    } else {
-        tcg_out_insn(s, 3401, ADDI, TARGET_LONG_BITS == 64,
-                     TCG_REG_X3, addr_reg, s_mask - a_mask);
-        x3 = TCG_REG_X3;
-    }
-    compare_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
-
-    /* Store the page mask part of the address into X3.  */
-    tcg_out_logicali(s, I3404_ANDI, TARGET_LONG_BITS == 64,
-                     TCG_REG_X3, x3, compare_mask);
-
-    /* Perform the address comparison. */
-    tcg_out_cmp(s, TARGET_LONG_BITS == 64, TCG_REG_X0, TCG_REG_X3, 0);
-
-    /* If not equal, we jump to the slow path. */
-    *label_ptr = s->code_ptr;
-    tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
-}
-
 #else
-static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
-                                   unsigned a_bits)
-{
-    unsigned a_mask = (1 << a_bits) - 1;
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->addrlo_reg = addr_reg;
-
-    /* tst addr, #mask */
-    tcg_out_logicali(s, I3404_ANDSI, 0, TCG_REG_XZR, addr_reg, a_mask);
-
-    label->label_ptr[0] = s->code_ptr;
-
-    /* b.ne slow_path */
-    tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
-
-    label->raddr = tcg_splitwx_to_rx(s->code_ptr);
-}
-
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     if (!reloc_pc19(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
@@ -1801,6 +1695,125 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 }
 #endif /* CONFIG_SOFTMMU */
 
+/*
+ * For softmmu, perform the TLB load and compare.
+ * For useronly, perform any required alignment tests.
+ * In both cases, return a TCGLabelQemuLdst structure if the slow path
+ * is required and fill in @h with the host address for the fast path.
+ */
+static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
+                                           TCGReg addr_reg, MemOpIdx oi,
+                                           bool is_ld)
+{
+    TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    TCGLabelQemuLdst *ldst = NULL;
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned a_mask = (1u << a_bits) - 1;
+
+#ifdef CONFIG_SOFTMMU
+    unsigned s_bits = opc & MO_SIZE;
+    unsigned s_mask = (1u << s_bits) - 1;
+    unsigned mem_index = get_mmuidx(oi);
+    TCGReg x3;
+    TCGType mask_type;
+    uint64_t compare_mask;
+
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addr_reg;
+
+    mask_type = (TARGET_PAGE_BITS + CPU_TLB_DYN_MAX_BITS > 32
+                 ? TCG_TYPE_I64 : TCG_TYPE_I32);
+
+    /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {x0,x1}.  */
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -512);
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, mask) != 0);
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, table) != 8);
+    tcg_out_insn(s, 3314, LDP, TCG_REG_X0, TCG_REG_X1, TCG_AREG0,
+                 TLB_MASK_TABLE_OFS(mem_index), 1, 0);
+
+    /* Extract the TLB index from the address into X0.  */
+    tcg_out_insn(s, 3502S, AND_LSR, mask_type == TCG_TYPE_I64,
+                 TCG_REG_X0, TCG_REG_X0, addr_reg,
+                 TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+
+    /* Add the tlb_table pointer, creating the CPUTLBEntry address into X1.  */
+    tcg_out_insn(s, 3502, ADD, 1, TCG_REG_X1, TCG_REG_X1, TCG_REG_X0);
+
+    /* Load the tlb comparator into X0, and the fast path addend into X1.  */
+    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_X0, TCG_REG_X1,
+               is_ld ? offsetof(CPUTLBEntry, addr_read)
+                     : offsetof(CPUTLBEntry, addr_write));
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_X1, TCG_REG_X1,
+               offsetof(CPUTLBEntry, addend));
+
+    /*
+     * For aligned accesses, we check the first byte and include the alignment
+     * bits within the address.  For unaligned access, we check that we don't
+     * cross pages using the address of the last byte of the access.
+     */
+    if (a_bits >= s_bits) {
+        x3 = addr_reg;
+    } else {
+        tcg_out_insn(s, 3401, ADDI, TARGET_LONG_BITS == 64,
+                     TCG_REG_X3, addr_reg, s_mask - a_mask);
+        x3 = TCG_REG_X3;
+    }
+    compare_mask = (uint64_t)TARGET_PAGE_MASK | a_mask;
+
+    /* Store the page mask part of the address into X3.  */
+    tcg_out_logicali(s, I3404_ANDI, TARGET_LONG_BITS == 64,
+                     TCG_REG_X3, x3, compare_mask);
+
+    /* Perform the address comparison. */
+    tcg_out_cmp(s, TARGET_LONG_BITS == 64, TCG_REG_X0, TCG_REG_X3, 0);
+
+    /* If not equal, we jump to the slow path. */
+    ldst->label_ptr[0] = s->code_ptr;
+    tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
+
+    *h = (HostAddress){
+        .base = TCG_REG_X1,
+        .index = addr_reg,
+        .index_ext = addr_type
+    };
+#else
+    if (a_mask) {
+        ldst = new_ldst_label(s);
+
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addr_reg;
+
+        /* tst addr, #mask */
+        tcg_out_logicali(s, I3404_ANDSI, 0, TCG_REG_XZR, addr_reg, a_mask);
+
+        /* b.ne slow_path */
+        ldst->label_ptr[0] = s->code_ptr;
+        tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
+    }
+
+    if (USE_GUEST_BASE) {
+        *h = (HostAddress){
+            .base = TCG_REG_GUEST_BASE,
+            .index = addr_reg,
+            .index_ext = addr_type
+        };
+    } else {
+        *h = (HostAddress){
+            .base = addr_reg,
+            .index = TCG_REG_XZR,
+            .index_ext = TCG_TYPE_I64
+        };
+    }
+#endif
+
+    return ldst;
+}
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
                                    TCGReg data_r, HostAddress h)
 {
@@ -1857,93 +1870,33 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp memop = get_memop(oi);
-    TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-    /* Byte swapping is left to middle-end expansion. */
-    tcg_debug_assert((memop & MO_BSWAP) == 0);
+    ldst = prepare_host_addr(s, &h, addr_reg, oi, true);
+    tcg_out_qemu_ld_direct(s, get_memop(oi), data_type, data_reg, h);
 
-#ifdef CONFIG_SOFTMMU
-    tcg_insn_unit *label_ptr;
-
-    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 1);
-
-    h = (HostAddress){
-        .base = TCG_REG_X1,
-        .index = addr_reg,
-        .index_ext = addr_type
-    };
-    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg, h);
-
-    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#else /* !CONFIG_SOFTMMU */
-    unsigned a_bits = get_alignment_bits(memop);
-    if (a_bits) {
-        tcg_out_test_alignment(s, true, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    if (USE_GUEST_BASE) {
-        h = (HostAddress){
-            .base = TCG_REG_GUEST_BASE,
-            .index = addr_reg,
-            .index_ext = addr_type
-        };
-    } else {
-        h = (HostAddress){
-            .base = addr_reg,
-            .index = TCG_REG_XZR,
-            .index_ext = TCG_TYPE_I64
-        };
-    }
-    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg, h);
-#endif /* CONFIG_SOFTMMU */
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp memop = get_memop(oi);
-    TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-    /* Byte swapping is left to middle-end expansion. */
-    tcg_debug_assert((memop & MO_BSWAP) == 0);
+    ldst = prepare_host_addr(s, &h, addr_reg, oi, false);
+    tcg_out_qemu_st_direct(s, get_memop(oi), data_reg, h);
 
-#ifdef CONFIG_SOFTMMU
-    tcg_insn_unit *label_ptr;
-
-    tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 0);
-
-    h = (HostAddress){
-        .base = TCG_REG_X1,
-        .index = addr_reg,
-        .index_ext = addr_type
-    };
-    tcg_out_qemu_st_direct(s, memop, data_reg, h);
-
-    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#else /* !CONFIG_SOFTMMU */
-    unsigned a_bits = get_alignment_bits(memop);
-    if (a_bits) {
-        tcg_out_test_alignment(s, false, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    if (USE_GUEST_BASE) {
-        h = (HostAddress){
-            .base = TCG_REG_GUEST_BASE,
-            .index = addr_reg,
-            .index_ext = addr_type
-        };
-    } else {
-        h = (HostAddress){
-            .base = addr_reg,
-            .index = TCG_REG_XZR,
-            .index_ext = TCG_TYPE_I64
-        };
-    }
-    tcg_out_qemu_st_direct(s, memop, data_reg, h);
-#endif /* CONFIG_SOFTMMU */
 }
 
 static const tcg_insn_unit *tb_ret_addr;
-- 
2.34.1


