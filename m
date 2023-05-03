Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6RW-0008M6-4T
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6RU-0008Js-Sw
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:24 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qw-0001pO-OU
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:24 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f315712406so11010025e9.0
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097069; x=1685689069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d+N50zI9kxk+jryuSplIHYSHO9fxLXxjXcTToUTMT0A=;
 b=CyU6kKvSMjmam3NUZtoIiF7Bp57NoCIRhI7OFyZ2w/dgMImgHR2gjLTY3w8BOBxGC2
 inSN2mQfTaKr1XVOGHIRlff0n1rE5hUU877QOMpN/hH7bh/YTRZWaLj8sUmUjuqPnkvW
 vV2pX8Kzbv4wovMnxZJ2fYP/qiof/eoZRGhesSEll9W7oRcAKpf4QBRf7+fL7ZtLbwKp
 Zr1QiE+SG2vBEzvrFk1aux7id6te5lFMNO3V3g2g/MtOLAGK0wfHCOM/zlY8plMxJYs+
 ieceTxfpaPM6dRjorsvTzUn/xsJdGb6gL4xhNL8eubsSsCSamIx+Wj01EtUss6TLyI04
 wkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097069; x=1685689069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+N50zI9kxk+jryuSplIHYSHO9fxLXxjXcTToUTMT0A=;
 b=J8TLHikvpwo5VQ/6aToxW6Al1HwL7EJF8QzByLFYtuNTS6BtQ0QdoZGtX5N+pwzpoL
 Je9Yg7cyHJ5ObhhhyW2DH4VzmvETIyVbjN3mP3TLBCfvZj/j/Ex32tal7fHaR23cSnLP
 FSOxFxbKEz3GEiXXi13NuiuQK4zHQ5Gsbo4or12dyzkzc+DeVV/br3BnzfDy34QSYf8A
 9GTlF/nfIDrgtC4oTnF/WNenOkqIxWkWoXFNUmECsk3w6iEo7HqiKjrhTD3j419gp4n1
 044ycvOKx10A8TO5+lmOIbGYPMsKD2YLBxu6RXfP6DvGCRxNJIWIi/V5i1KsoV3PnsMI
 soMg==
X-Gm-Message-State: AC+VfDxiPB3BXpoMf5Bt5rIBQlimMRGK1aJupQU+9yW0JJEZMPKWLmxw
 DIVI0BIUXcFcrq6zb674eQLHwXr8PsFLAFfY2ViDIA==
X-Google-Smtp-Source: ACHHUZ7mxyuQrGDRXoUXT1Y8FH/d9VyLvkbkgI/CFgJTMlD7RCmrHRLGzx3+ueb56N1Pe4YGAuDTbw==
X-Received: by 2002:adf:e705:0:b0:306:2aea:466a with SMTP id
 c5-20020adfe705000000b003062aea466amr645329wrm.28.1683097069304; 
 Tue, 02 May 2023 23:57:49 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 24/54] tcg/riscv: Introduce prepare_host_addr
Date: Wed,  3 May 2023 07:56:59 +0100
Message-Id: <20230503065729.1745843-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 06:58:25 -0000

Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
and some code that lived in both tcg_out_qemu_ld and tcg_out_qemu_st
into one function that returns TCGReg and TCGLabelQemuLdst.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 253 +++++++++++++++++--------------------
 1 file changed, 114 insertions(+), 139 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index a4cf60ca75..2b2d313fe2 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -899,10 +899,6 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
 #endif
 };
 
-/* We expect to use a 12-bit negative offset from ENV.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
-
 static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
@@ -910,76 +906,6 @@ static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
     tcg_debug_assert(ok);
 }
 
-static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addr, MemOpIdx oi,
-                               tcg_insn_unit **label_ptr, bool is_load)
-{
-    MemOp opc = get_memop(oi);
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_bits = get_alignment_bits(opc);
-    tcg_target_long compare_mask;
-    int mem_index = get_mmuidx(oi);
-    int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
-    int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
-    int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
-    TCGReg mask_base = TCG_AREG0, table_base = TCG_AREG0;
-
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, mask_base, mask_ofs);
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, table_base, table_ofs);
-
-    tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP2, addr,
-                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-    tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
-    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
-
-    /* Load the tlb comparator and the addend.  */
-    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
-               is_load ? offsetof(CPUTLBEntry, addr_read)
-               : offsetof(CPUTLBEntry, addr_write));
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
-               offsetof(CPUTLBEntry, addend));
-
-    /* We don't support unaligned accesses. */
-    if (a_bits < s_bits) {
-        a_bits = s_bits;
-    }
-    /* Clear the non-page, non-alignment bits from the address.  */
-    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
-    if (compare_mask == sextreg(compare_mask, 0, 12)) {
-        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr, compare_mask);
-    } else {
-        tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
-        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addr);
-    }
-
-    /* Compare masked address with the TLB entry. */
-    label_ptr[0] = s->code_ptr;
-    tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
-
-    /* TLB Hit - translate address using addend.  */
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_TMP0, addr);
-        addr = TCG_REG_TMP0;
-    }
-    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addr);
-    return TCG_REG_TMP0;
-}
-
-static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
-                                TCGType data_type, TCGReg data_reg,
-                                TCGReg addr_reg, void *raddr,
-                                tcg_insn_unit **label_ptr)
-{
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->oi = oi;
-    label->type = data_type;
-    label->datalo_reg = data_reg;
-    label->addrlo_reg = addr_reg;
-    label->raddr = tcg_splitwx_to_rx(raddr);
-    label->label_ptr[0] = label_ptr[0];
-}
-
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     MemOpIdx oi = l->oi;
@@ -1037,26 +963,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return true;
 }
 #else
-
-static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
-                                   unsigned a_bits)
-{
-    unsigned a_mask = (1 << a_bits) - 1;
-    TCGLabelQemuLdst *l = new_ldst_label(s);
-
-    l->is_ld = is_ld;
-    l->addrlo_reg = addr_reg;
-
-    /* We are expecting a_bits to max out at 7, so we can always use andi. */
-    tcg_debug_assert(a_bits < 12);
-    tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_reg, a_mask);
-
-    l->label_ptr[0] = s->code_ptr;
-    tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP1, TCG_REG_ZERO, 0);
-
-    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
-}
-
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     /* resolve label address */
@@ -1083,9 +989,108 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     return tcg_out_fail_alignment(s, l);
 }
-
 #endif /* CONFIG_SOFTMMU */
 
+/*
+ * For softmmu, perform the TLB load and compare.
+ * For useronly, perform any required alignment tests.
+ * In both cases, return a TCGLabelQemuLdst structure if the slow path
+ * is required and fill in @h with the host address for the fast path.
+ */
+static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
+                                           TCGReg addr_reg, MemOpIdx oi,
+                                           bool is_ld)
+{
+    TCGLabelQemuLdst *ldst = NULL;
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned a_mask = (1u << a_bits) - 1;
+
+#ifdef CONFIG_SOFTMMU
+    unsigned s_bits = opc & MO_SIZE;
+    int mem_index = get_mmuidx(oi);
+    int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
+    int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
+    int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
+    TCGReg mask_base = TCG_AREG0, table_base = TCG_AREG0;
+    tcg_target_long compare_mask;
+
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addr_reg;
+
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, mask_base, mask_ofs);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, table_base, table_ofs);
+
+    tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP2, addr_reg,
+                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+    tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
+    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
+
+    /* Load the tlb comparator and the addend.  */
+    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
+               is_ld ? offsetof(CPUTLBEntry, addr_read)
+                     : offsetof(CPUTLBEntry, addr_write));
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
+               offsetof(CPUTLBEntry, addend));
+
+    /* We don't support unaligned accesses. */
+    if (a_bits < s_bits) {
+        a_bits = s_bits;
+    }
+    /* Clear the non-page, non-alignment bits from the address.  */
+    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | a_mask;
+    if (compare_mask == sextreg(compare_mask, 0, 12)) {
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_reg, compare_mask);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
+        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addr_reg);
+    }
+
+    /* Compare masked address with the TLB entry. */
+    ldst->label_ptr[0] = s->code_ptr;
+    tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
+
+    /* TLB Hit - translate address using addend.  */
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_ext32u(s, TCG_REG_TMP0, addr_reg);
+        addr_reg = TCG_REG_TMP0;
+    }
+    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addr_reg);
+    *pbase = TCG_REG_TMP0;
+#else
+    if (a_mask) {
+        ldst = new_ldst_label(s);
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addr_reg;
+
+        /* We are expecting a_bits max 7, so we can always use andi. */
+        tcg_debug_assert(a_bits < 12);
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_reg, a_mask);
+
+        ldst->label_ptr[0] = s->code_ptr;
+        tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP1, TCG_REG_ZERO, 0);
+    }
+
+    TCGReg base = addr_reg;
+    if (TARGET_LONG_BITS == 32) {
+        tcg_out_ext32u(s, TCG_REG_TMP0, base);
+        base = TCG_REG_TMP0;
+    }
+    if (guest_base != 0) {
+        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
+        base = TCG_REG_TMP0;
+    }
+    *pbase = base;
+#endif
+
+    return ldst;
+}
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
                                    TCGReg base, MemOp opc, TCGType type)
 {
@@ -1125,32 +1130,17 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     TCGReg base;
 
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[1];
+    ldst = prepare_host_addr(s, &base, addr_reg, oi, true);
+    tcg_out_qemu_ld_direct(s, data_reg, base, get_memop(oi), data_type);
 
-    base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
-    tcg_out_qemu_ld_direct(s, data_reg, base, opc, data_type);
-    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, true, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    base = addr_reg;
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_TMP0, base);
-        base = TCG_REG_TMP0;
-    }
-    if (guest_base != 0) {
-        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
-        base = TCG_REG_TMP0;
-    }
-    tcg_out_qemu_ld_direct(s, data_reg, base, opc, data_type);
-#endif
 }
 
 static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg val,
@@ -1180,32 +1170,17 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg val,
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     TCGReg base;
 
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[1];
+    ldst = prepare_host_addr(s, &base, addr_reg, oi, false);
+    tcg_out_qemu_st_direct(s, data_reg, base, get_memop(oi));
 
-    base = tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
-    tcg_out_qemu_st_direct(s, data_reg, base, opc);
-    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, false, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    base = addr_reg;
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_TMP0, base);
-        base = TCG_REG_TMP0;
-    }
-    if (guest_base != 0) {
-        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
-        base = TCG_REG_TMP0;
-    }
-    tcg_out_qemu_st_direct(s, data_reg, base, opc);
-#endif
 }
 
 static const tcg_insn_unit *tb_ret_addr;
-- 
2.34.1


