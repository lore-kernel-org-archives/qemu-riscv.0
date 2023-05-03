Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6RG-0007wH-TR
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6RB-0007sC-CJ
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:06 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qs-0001mJ-0j
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:04 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f4000ec74aso13355e9.3
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097064; x=1685689064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFFoGgTSegPUQaI6pnaNFJ9C8ggJbjecIiSqmvyzOfY=;
 b=bAIr3u8gn1Xp+IU2iD1ZZywxjmUl7a/vuqZObdTGlXgRIF7HKWG9RSjO0grtaE2+dh
 R5auRvw3JtquAnhpBTnOH5GVqrxwp2A8fbcfKhL74Rh5jh4GlsYUh/jOL6G4iU1JTQU+
 YkAjxKGx7U3NCvIt4p3lShpVVdX/N9bYOsLvvNG5W++mnrV88ZkH13+oKyWM73Sz47Uu
 nhympB+T9/nBSIVhaEU8f84nSkgP8No2vFMMvOe4Q/QZnNO37MOuyLXIlwHx7Q6Pem8H
 hyp9gqg1dvRTD/MPDUjcsYlS/WMjfHK2iYzd3Rtg1Pvv5MUx94QhDShSfPmelVsghoOD
 HZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097064; x=1685689064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XFFoGgTSegPUQaI6pnaNFJ9C8ggJbjecIiSqmvyzOfY=;
 b=TUe8KG6a4W+Y10IihP2uQDdZrxNuyvb6pq6sF4KvWWWy0ipXWthdYhY4wF6Ou861s4
 aDh3hcQMYekEhk1q6lE3s8ZQktVDphsFhUc9vRWY+1Yriwh+gkSCh9Hejx67AVFhewMa
 06/1KZOIm/ZKHyyF+UbQXpZhN03y1k09d1kCUccoN4H6vCK6bM/Ph203NJgLuNbo8EQB
 SrqYso8J2uurJIyW1YseVnc8kNUIaEPf1UO2i2BVlesfscJThRg8dmyXBHHC9Na3ekR4
 3yBs9wL5iQrg7adWQCM8yjzGURT+hzkmAac5RsnexwsPXe+OGfBfiD1pebezz9l6NScZ
 Zlgg==
X-Gm-Message-State: AC+VfDyxk2OVDdsqiecfUHVQqGHzvxNKIX4pSiX0R2c4gmbQPZo6xCs5
 XJd+8cpfuCWm0qfK2dQa3nkxRQ==
X-Google-Smtp-Source: ACHHUZ5QMt8aku2gCBQttASDIXdLCcPA8idZB9Amk6NzAZ3fbuxRiJ40aSqFpLTbuUt9doAcLULwGw==
X-Received: by 2002:a05:600c:3645:b0:3f1:bb10:c865 with SMTP id
 y5-20020a05600c364500b003f1bb10c865mr14333454wmq.38.1683097064597; 
 Tue, 02 May 2023 23:57:44 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 18/54] tcg/mips: Introduce prepare_host_addr
Date: Wed,  3 May 2023 07:56:53 +0100
Message-Id: <20230503065729.1745843-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Wed, 03 May 2023 06:58:06 -0000

Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
and some code that lived in both tcg_out_qemu_ld and tcg_out_qemu_st
into one function that returns HostAddress and TCGLabelQemuLdst structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 404 ++++++++++++++++----------------------
 1 file changed, 172 insertions(+), 232 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index ef8350e9cd..94708e6ea7 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1181,120 +1181,6 @@ static int tcg_out_call_iarg_reg2(TCGContext *s, int i, TCGReg al, TCGReg ah)
     return i;
 }
 
-/* We expect to use a 16-bit negative offset from ENV.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
-
-/*
- * Perform the tlb comparison operation.
- * The complete host address is placed in BASE.
- * Clobbers TMP0, TMP1, TMP2, TMP3.
- */
-static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
-                             TCGReg addrh, MemOpIdx oi,
-                             tcg_insn_unit *label_ptr[2], bool is_load)
-{
-    MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_mask = (1 << a_bits) - 1;
-    unsigned s_mask = (1 << s_bits) - 1;
-    int mem_index = get_mmuidx(oi);
-    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
-    int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
-    int table_off = fast_off + offsetof(CPUTLBDescFast, table);
-    int add_off = offsetof(CPUTLBEntry, addend);
-    int cmp_off = (is_load ? offsetof(CPUTLBEntry, addr_read)
-                   : offsetof(CPUTLBEntry, addr_write));
-    target_ulong tlb_mask;
-
-    /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_AREG0, mask_off);
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP1, TCG_AREG0, table_off);
-
-    /* Extract the TLB index from the address into TMP3.  */
-    tcg_out_opc_sa(s, ALIAS_TSRL, TCG_TMP3, addrl,
-                   TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-    tcg_out_opc_reg(s, OPC_AND, TCG_TMP3, TCG_TMP3, TCG_TMP0);
-
-    /* Add the tlb_table pointer, creating the CPUTLBEntry address in TMP3.  */
-    tcg_out_opc_reg(s, ALIAS_PADD, TCG_TMP3, TCG_TMP3, TCG_TMP1);
-
-    /* Load the (low-half) tlb comparator.  */
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
-    } else {
-        tcg_out_ldst(s, (TARGET_LONG_BITS == 64 ? OPC_LD
-                         : TCG_TARGET_REG_BITS == 64 ? OPC_LWU : OPC_LW),
-                     TCG_TMP0, TCG_TMP3, cmp_off);
-    }
-
-    /* Zero extend a 32-bit guest address for a 64-bit host. */
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, base, addrl);
-        addrl = base;
-    }
-
-    /*
-     * Mask the page bits, keeping the alignment bits to compare against.
-     * For unaligned accesses, compare against the end of the access to
-     * verify that it does not cross a page boundary.
-     */
-    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, tlb_mask);
-    if (a_mask >= s_mask) {
-        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
-    } else {
-        tcg_out_opc_imm(s, ALIAS_PADDI, TCG_TMP2, addrl, s_mask - a_mask);
-        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, TCG_TMP2);
-    }
-
-    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-        /* Load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
-    }
-
-    label_ptr[0] = s->code_ptr;
-    tcg_out_opc_br(s, OPC_BNE, TCG_TMP1, TCG_TMP0);
-
-    /* Load and test the high half tlb comparator.  */
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        /* delay slot */
-        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
-
-        /* Load the tlb addend for the fast path.  */
-        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
-
-        label_ptr[1] = s->code_ptr;
-        tcg_out_opc_br(s, OPC_BNE, addrh, TCG_TMP0);
-    }
-
-    /* delay slot */
-    tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_TMP2, addrl);
-}
-
-static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
-                                TCGType ext,
-                                TCGReg datalo, TCGReg datahi,
-                                TCGReg addrlo, TCGReg addrhi,
-                                void *raddr, tcg_insn_unit *label_ptr[2])
-{
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->oi = oi;
-    label->type = ext;
-    label->datalo_reg = datalo;
-    label->datahi_reg = datahi;
-    label->addrlo_reg = addrlo;
-    label->addrhi_reg = addrhi;
-    label->raddr = tcg_splitwx_to_rx(raddr);
-    label->label_ptr[0] = label_ptr[0];
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        label->label_ptr[1] = label_ptr[1];
-    }
-}
-
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     const tcg_insn_unit *tgt_rx = tcg_splitwx_to_rx(s->code_ptr);
@@ -1403,32 +1289,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 }
 
 #else
-
-static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
-                                   TCGReg addrhi, unsigned a_bits)
-{
-    unsigned a_mask = (1 << a_bits) - 1;
-    TCGLabelQemuLdst *l = new_ldst_label(s);
-
-    l->is_ld = is_ld;
-    l->addrlo_reg = addrlo;
-    l->addrhi_reg = addrhi;
-
-    /* We are expecting a_bits to max out at 7, much lower than ANDI. */
-    tcg_debug_assert(a_bits < 16);
-    tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP0, addrlo, a_mask);
-
-    l->label_ptr[0] = s->code_ptr;
-    if (use_mips32r6_instructions) {
-        tcg_out_opc_br(s, OPC_BNEZALC_R6, TCG_REG_ZERO, TCG_TMP0);
-    } else {
-        tcg_out_opc_br(s, OPC_BNEL, TCG_TMP0, TCG_REG_ZERO);
-        tcg_out_nop(s);
-    }
-
-    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
-}
-
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     void *target;
@@ -1478,6 +1338,154 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 }
 #endif /* SOFTMMU */
 
+typedef struct {
+    TCGReg base;
+    MemOp align;
+} HostAddress;
+
+/*
+ * For softmmu, perform the TLB load and compare.
+ * For useronly, perform any required alignment tests.
+ * In both cases, return a TCGLabelQemuLdst structure if the slow path
+ * is required and fill in @h with the host address for the fast path.
+ */
+static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
+                                           TCGReg addrlo, TCGReg addrhi,
+                                           MemOpIdx oi, bool is_ld)
+{
+    TCGLabelQemuLdst *ldst = NULL;
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+    unsigned s_bits = opc & MO_SIZE;
+    unsigned a_mask = (1 << a_bits) - 1;
+    TCGReg base;
+
+#ifdef CONFIG_SOFTMMU
+    unsigned s_mask = (1 << s_bits) - 1;
+    int mem_index = get_mmuidx(oi);
+    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
+    int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
+    int table_off = fast_off + offsetof(CPUTLBDescFast, table);
+    int add_off = offsetof(CPUTLBEntry, addend);
+    int cmp_off = is_ld ? offsetof(CPUTLBEntry, addr_read)
+                        : offsetof(CPUTLBEntry, addr_write);
+    target_ulong tlb_mask;
+
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addrlo;
+    ldst->addrhi_reg = addrhi;
+    base = TCG_REG_A0;
+
+    /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_AREG0, mask_off);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP1, TCG_AREG0, table_off);
+
+    /* Extract the TLB index from the address into TMP3.  */
+    tcg_out_opc_sa(s, ALIAS_TSRL, TCG_TMP3, addrlo,
+                   TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+    tcg_out_opc_reg(s, OPC_AND, TCG_TMP3, TCG_TMP3, TCG_TMP0);
+
+    /* Add the tlb_table pointer, creating the CPUTLBEntry address in TMP3.  */
+    tcg_out_opc_reg(s, ALIAS_PADD, TCG_TMP3, TCG_TMP3, TCG_TMP1);
+
+    /* Load the (low-half) tlb comparator.  */
+    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
+    } else {
+        tcg_out_ldst(s, (TARGET_LONG_BITS == 64 ? OPC_LD
+                         : TCG_TARGET_REG_BITS == 64 ? OPC_LWU : OPC_LW),
+                     TCG_TMP0, TCG_TMP3, cmp_off);
+    }
+
+    /* Zero extend a 32-bit guest address for a 64-bit host. */
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, base, addrlo);
+        addrlo = base;
+    }
+
+    /*
+     * Mask the page bits, keeping the alignment bits to compare against.
+     * For unaligned accesses, compare against the end of the access to
+     * verify that it does not cross a page boundary.
+     */
+    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
+    tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, tlb_mask);
+    if (a_mask >= s_mask) {
+        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrlo);
+    } else {
+        tcg_out_opc_imm(s, ALIAS_PADDI, TCG_TMP2, addrlo, s_mask - a_mask);
+        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, TCG_TMP2);
+    }
+
+    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+        /* Load the tlb addend for the fast path.  */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+    }
+
+    ldst->label_ptr[0] = s->code_ptr;
+    tcg_out_opc_br(s, OPC_BNE, TCG_TMP1, TCG_TMP0);
+
+    /* Load and test the high half tlb comparator.  */
+    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+        /* delay slot */
+        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + HI_OFF);
+
+        /* Load the tlb addend for the fast path.  */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
+
+        ldst->label_ptr[1] = s->code_ptr;
+        tcg_out_opc_br(s, OPC_BNE, addrhi, TCG_TMP0);
+    }
+
+    /* delay slot */
+    tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_TMP2, addrlo);
+#else
+    if (a_mask && (use_mips32r6_instructions || a_bits != s_bits)) {
+        ldst = new_ldst_label(s);
+
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addrlo;
+        ldst->addrhi_reg = addrhi;
+
+        /* We are expecting a_bits to max out at 7, much lower than ANDI. */
+        tcg_debug_assert(a_bits < 16);
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP0, addrlo, a_mask);
+
+        ldst->label_ptr[0] = s->code_ptr;
+        if (use_mips32r6_instructions) {
+            tcg_out_opc_br(s, OPC_BNEZALC_R6, TCG_REG_ZERO, TCG_TMP0);
+        } else {
+            tcg_out_opc_br(s, OPC_BNEL, TCG_TMP0, TCG_REG_ZERO);
+            tcg_out_nop(s);
+        }
+    }
+
+    base = addrlo;
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_REG_A0, base);
+        base = TCG_REG_A0;
+    }
+    if (guest_base) {
+        if (guest_base == (int16_t)guest_base) {
+            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_A0, base, guest_base);
+        } else {
+            tcg_out_opc_reg(s, ALIAS_PADD, TCG_REG_A0, base,
+                            TCG_GUEST_BASE_REG);
+        }
+        base = TCG_REG_A0;
+    }
+#endif
+
+    h->base = base;
+    h->align = a_bits;
+    return ldst;
+}
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
                                    TCGReg base, MemOp opc, TCGType type)
 {
@@ -1707,57 +1715,23 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
-    TCGReg base;
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
 
-    /*
-     * R6 removes the left/right instructions but requires the
-     * system to support misaligned memory accesses.
-     */
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[2];
+    ldst = prepare_host_addr(s, &h, addrlo, addrhi, oi, true);
 
-    base = TCG_REG_A0;
-    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 1);
-    if (use_mips32r6_instructions || a_bits >= s_bits) {
-        tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
+    if (use_mips32r6_instructions || h.align >= (opc & MO_SIZE)) {
+        tcg_out_qemu_ld_direct(s, datalo, datahi, h.base, opc, data_type);
     } else {
-        tcg_out_qemu_ld_unalign(s, datalo, datahi, base, opc, data_type);
+        tcg_out_qemu_ld_unalign(s, datalo, datahi, h.base, opc, data_type);
     }
-    add_qemu_ldst_label(s, true, oi, data_type, datalo, datahi,
-                        addrlo, addrhi, s->code_ptr, label_ptr);
-#else
-    base = addrlo;
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, TCG_REG_A0, base);
-        base = TCG_REG_A0;
+
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    if (guest_base) {
-        if (guest_base == (int16_t)guest_base) {
-            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_A0, base, guest_base);
-        } else {
-            tcg_out_opc_reg(s, ALIAS_PADD, TCG_REG_A0, base,
-                            TCG_GUEST_BASE_REG);
-        }
-        base = TCG_REG_A0;
-    }
-    if (use_mips32r6_instructions) {
-        if (a_bits) {
-            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
-        }
-        tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
-    } else {
-        if (a_bits && a_bits != s_bits) {
-            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
-        }
-        if (a_bits >= s_bits) {
-            tcg_out_qemu_ld_direct(s, datalo, datahi, base, opc, data_type);
-        } else {
-            tcg_out_qemu_ld_unalign(s, datalo, datahi, base, opc, data_type);
-        }
-    }
-#endif
 }
 
 static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
@@ -1899,57 +1873,23 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
-    TCGReg base;
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
 
-    /*
-     * R6 removes the left/right instructions but requires the
-     * system to support misaligned memory accesses.
-     */
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[2];
+    ldst = prepare_host_addr(s, &h, addrlo, addrhi, oi, false);
 
-    base = TCG_REG_A0;
-    tcg_out_tlb_load(s, base, addrlo, addrhi, oi, label_ptr, 0);
-    if (use_mips32r6_instructions || a_bits >= s_bits) {
-        tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
+    if (use_mips32r6_instructions || h.align >= (opc & MO_SIZE)) {
+        tcg_out_qemu_st_direct(s, datalo, datahi, h.base, opc);
     } else {
-        tcg_out_qemu_st_unalign(s, datalo, datahi, base, opc);
+        tcg_out_qemu_st_unalign(s, datalo, datahi, h.base, opc);
     }
-    add_qemu_ldst_label(s, false, oi, data_type, datalo, datahi,
-                        addrlo, addrhi, s->code_ptr, label_ptr);
-#else
-    base = addrlo;
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, TCG_REG_A0, base);
-        base = TCG_REG_A0;
+
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    if (guest_base) {
-        if (guest_base == (int16_t)guest_base) {
-            tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_A0, base, guest_base);
-        } else {
-            tcg_out_opc_reg(s, ALIAS_PADD, TCG_REG_A0, base,
-                            TCG_GUEST_BASE_REG);
-        }
-        base = TCG_REG_A0;
-    }
-    if (use_mips32r6_instructions) {
-        if (a_bits) {
-            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
-        }
-        tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
-    } else {
-        if (a_bits && a_bits != s_bits) {
-            tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
-        }
-        if (a_bits >= s_bits) {
-            tcg_out_qemu_st_direct(s, datalo, datahi, base, opc);
-        } else {
-            tcg_out_qemu_st_unalign(s, datalo, datahi, base, opc);
-        }
-    }
-#endif
 }
 
 static void tcg_out_mb(TCGContext *s, TCGArg a0)
-- 
2.34.1


