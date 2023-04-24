Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqozb-0002Cl-HV
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxl-0005wn-Jf
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:42:09 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox1-0004EI-NV
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:42:09 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f19c473b9eso30735125e9.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314882; x=1684906882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XnZogszO9zYOnszOSYBVC/f6LR39oy/cEChj2R17Qdo=;
 b=RSvZvJSivqKIYV4/VdPZkIUCZVabUNhvySvF0av3i4T3DojOYGq/wsFiU/papZNqoX
 7zH8v3y+J1vB5p1eb3yJJVEk6SXE224iAWh2MzelsY03hjGSpIvW2QwqGl/XcO3Imlou
 sCRUYmtL4GcUPkOxZz8VG+dDicTImW/kqiNEmezC6iv56yZzV0RTkbXrQuudBFXvAiU1
 dWjne/CdgXxPBQfrXQZRGD9eqP820gj40zBDjg0JGKl8QrQE5qweyayBvTEk9Owjb10i
 p45ZU4uOY4P88AmfQFTvmwSwEVAOpc4XKGIMQknb96pPFH2SM4cFkxIZQswH0iYKOtUo
 LIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314882; x=1684906882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XnZogszO9zYOnszOSYBVC/f6LR39oy/cEChj2R17Qdo=;
 b=gA9hTvLCf0R07mnI7IeTfryNTikQ7BQenYHFiiBUBTOHbEG6mjp2BRJ3okiRGmVcZC
 PK6j5zi5slkrIf7dTjYjRykQ5r5GscisT8Gq/QxJmbklCtaKpVs/hqYMjnhWGm7o/+cd
 w+6ZH2ZcGIGeMhnfQLfhPh0wBuCYe4U7jFJUIh35qKgYbehq+fHoEkkdJfnHD2ri4e5j
 LFyfbHBPT8DD2Zw897ZhfQUh57SZSG4D0HpJis+14BFycv76JNiRJLdztDy/sR24K8mR
 hX+MNL2hhnuajqKYh03pIJC6fgHZMRZ+apcQwQ1CcUeIYcXVLMYPjLjouCUjqo7gygdR
 m/eg==
X-Gm-Message-State: AAQBX9cstavTUTvtcpXpmgLFSCbUnqCG/kzyVrXLkk1+VKalRrxTR+kX
 a1bijTN1nwcsBtcx7DSHuaiEftJ6f4mre6WrhMoJ/g==
X-Google-Smtp-Source: AKy350bIvPV/TI1FIi9U9nDFeb6XFe+Li7bp2UCpOwsCxDa2ie2JUwHzBBKvcQo1T5qXWbUXaTQ0Lg==
X-Received: by 2002:a5d:414c:0:b0:2fa:d00d:cab8 with SMTP id
 c12-20020a5d414c000000b002fad00dcab8mr8707908wrq.18.1682314882474; 
 Sun, 23 Apr 2023 22:41:22 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 28/57] tcg/riscv: Introduce prepare_host_addr
Date: Mon, 24 Apr 2023 06:40:36 +0100
Message-Id: <20230424054105.1579315-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Mon, 24 Apr 2023 05:42:10 -0000

Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
and some code that lived in both tcg_out_qemu_ld and tcg_out_qemu_st
into one function that returns TCGReg and TCGLabelQemuLdst.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 253 +++++++++++++++++--------------------
 1 file changed, 114 insertions(+), 139 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 3b10ecb767..b0ed39beff 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -913,10 +913,6 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
 #endif
 };
 
-/* We expect to use a 12-bit negative offset from ENV.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
-
 static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
@@ -924,76 +920,6 @@ static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
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
@@ -1051,26 +977,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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
@@ -1097,9 +1003,108 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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
@@ -1139,32 +1144,17 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg val,
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
@@ -1194,32 +1184,17 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg val,
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


