Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqoym-0007fb-03
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxS-0005Zk-3L
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:50 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowx-0004Kb-3Q
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:49 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f7a7f9667bso2314032f8f.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314876; x=1684906876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SdzMRJhqVnkJZuasJRxOLnNhkaxRsl4XQRta0/ryyec=;
 b=Dopzkivf9NIz9W9f/ou3Buk/oV7i8eTFyFZnFdOQtsjgwPk3TApGTe3968yNCXS1uB
 kabwPu3oi+nnOufiyWw/zvaHYtpaU1Np2SyEw4aOGc2cPGuw48aN56ItgYZHax8a2LIT
 hsGAJkaGFI63JVgfJg7PHZSQZQlxHlPrNcpWtdAxb+q++MgyIj7s9MS0OjvwxqEgrC3y
 SJCDXjd5JVCC8IyilJX7OL1FcfXQZdJ2LOPdvEQoWVzIQLxcfwNy0NyqZByrATbNsCst
 hBsWJIi+/4vkQVXDSUzjglEOk+RNgES2wYofuaE+uIHfN7EBYlza3ef/5MkIhNJilnDw
 BUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314876; x=1684906876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SdzMRJhqVnkJZuasJRxOLnNhkaxRsl4XQRta0/ryyec=;
 b=cu4xEV0+B3r9YyjskVbaO1uPL+eeXja9GofMnoKD7XTe4IXHFcLL4p7miDh83Zodwx
 aC8xR1VXdeSUwT68Tv6OsQat40D9L07LiPo7Hs+3iPiIE2KzIAb53Y2r1lkaLDVCiTpN
 x1DgQ3dN5EPRZOhM7cB0hyxVxlNrcvLY29TqSY/O7Af0Jz/Ucpcr14NyYAodJyumAtVd
 rmpWKDpQNYEvmhcc3DH1S+2q3fKp55PBNihx6iedePBoyQ6rqYrFusC+J87eVkLBfpPG
 E/s/YhKwq9ibTx2/Cz2f/7k1w1T1d4GVUv66csYANIvma6/4jYmhdhFi64iPY33Lq5hu
 k5ag==
X-Gm-Message-State: AAQBX9fw4oHhT9iMTnjWAhOwGe7Bfr3zDqv/PAbJ8giBDbjkbDP2gYRY
 3Z7M3NX8iEvyY3o+2oDw6Ka3jw==
X-Google-Smtp-Source: AKy350ZFxdlssTy1irjUYJw/bXV1lCzN1DisWTYxkjrQ0uLk9AfZGBy02gmYInLdrxUvvYEWXof7EA==
X-Received: by 2002:a5d:5222:0:b0:2f4:cfb4:57f3 with SMTP id
 i2-20020a5d5222000000b002f4cfb457f3mr9564557wra.53.1682314876032; 
 Sun, 23 Apr 2023 22:41:16 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 17/57] tcg/arm: Introduce prepare_host_addr
Date: Mon, 24 Apr 2023 06:40:25 +0100
Message-Id: <20230424054105.1579315-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Mon, 24 Apr 2023 05:41:51 -0000

Merge tcg_out_tlb_load, add_qemu_ldst_label, and some code that lived
in both tcg_out_qemu_ld and tcg_out_qemu_st into one function that
returns HostAddress and TCGLabelQemuLdst structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 351 ++++++++++++++++++---------------------
 1 file changed, 159 insertions(+), 192 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index b6b4ffc546..c744512778 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1434,125 +1434,6 @@ static TCGReg tcg_out_arg_reg64(TCGContext *s, TCGReg argreg,
     }
 }
 
-#define TLB_SHIFT	(CPU_TLB_ENTRY_BITS + CPU_TLB_BITS)
-
-/* We expect to use an 9-bit sign-magnitude negative offset from ENV.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -256);
-
-/* These offsets are built into the LDRD below.  */
-QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, mask) != 0);
-QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, table) != 4);
-
-/* Load and compare a TLB entry, leaving the flags set.  Returns the register
-   containing the addend of the tlb entry.  Clobbers R0, R1, R2, TMP.  */
-
-static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
-                               MemOp opc, int mem_index, bool is_load)
-{
-    int cmp_off = (is_load ? offsetof(CPUTLBEntry, addr_read)
-                   : offsetof(CPUTLBEntry, addr_write));
-    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
-    unsigned s_mask = (1 << (opc & MO_SIZE)) - 1;
-    unsigned a_mask = (1 << get_alignment_bits(opc)) - 1;
-    TCGReg t_addr;
-
-    /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {r0,r1}.  */
-    tcg_out_ldrd_8(s, COND_AL, TCG_REG_R0, TCG_AREG0, fast_off);
-
-    /* Extract the tlb index from the address into R0.  */
-    tcg_out_dat_reg(s, COND_AL, ARITH_AND, TCG_REG_R0, TCG_REG_R0, addrlo,
-                    SHIFT_IMM_LSR(TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS));
-
-    /*
-     * Add the tlb_table pointer, creating the CPUTLBEntry address in R1.
-     * Load the tlb comparator into R2/R3 and the fast path addend into R1.
-     */
-    if (cmp_off == 0) {
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_ldrd_rwb(s, COND_AL, TCG_REG_R2, TCG_REG_R1, TCG_REG_R0);
-        } else {
-            tcg_out_ld32_rwb(s, COND_AL, TCG_REG_R2, TCG_REG_R1, TCG_REG_R0);
-        }
-    } else {
-        tcg_out_dat_reg(s, COND_AL, ARITH_ADD,
-                        TCG_REG_R1, TCG_REG_R1, TCG_REG_R0, 0);
-        if (TARGET_LONG_BITS == 64) {
-            tcg_out_ldrd_8(s, COND_AL, TCG_REG_R2, TCG_REG_R1, cmp_off);
-        } else {
-            tcg_out_ld32_12(s, COND_AL, TCG_REG_R2, TCG_REG_R1, cmp_off);
-        }
-    }
-
-    /* Load the tlb addend.  */
-    tcg_out_ld32_12(s, COND_AL, TCG_REG_R1, TCG_REG_R1,
-                    offsetof(CPUTLBEntry, addend));
-
-    /*
-     * Check alignment, check comparators.
-     * Do this in 2-4 insns.  Use MOVW for v7, if possible,
-     * to reduce the number of sequential conditional instructions.
-     * Almost all guests have at least 4k pages, which means that we need
-     * to clear at least 9 bits even for an 8-byte memory, which means it
-     * isn't worth checking for an immediate operand for BIC.
-     *
-     * For unaligned accesses, test the page of the last unit of alignment.
-     * This leaves the least significant alignment bits unchanged, and of
-     * course must be zero.
-     */
-    t_addr = addrlo;
-    if (a_mask < s_mask) {
-        t_addr = TCG_REG_R0;
-        tcg_out_dat_imm(s, COND_AL, ARITH_ADD, t_addr,
-                        addrlo, s_mask - a_mask);
-    }
-    if (use_armv7_instructions && TARGET_PAGE_BITS <= 16) {
-        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, ~(TARGET_PAGE_MASK | a_mask));
-        tcg_out_dat_reg(s, COND_AL, ARITH_BIC, TCG_REG_TMP,
-                        t_addr, TCG_REG_TMP, 0);
-        tcg_out_dat_reg(s, COND_AL, ARITH_CMP, 0, TCG_REG_R2, TCG_REG_TMP, 0);
-    } else {
-        if (a_mask) {
-            tcg_debug_assert(a_mask <= 0xff);
-            tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
-        }
-        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, TCG_REG_TMP, 0, t_addr,
-                        SHIFT_IMM_LSR(TARGET_PAGE_BITS));
-        tcg_out_dat_reg(s, (a_mask ? COND_EQ : COND_AL), ARITH_CMP,
-                        0, TCG_REG_R2, TCG_REG_TMP,
-                        SHIFT_IMM_LSL(TARGET_PAGE_BITS));
-    }
-
-    if (TARGET_LONG_BITS == 64) {
-        tcg_out_dat_reg(s, COND_EQ, ARITH_CMP, 0, TCG_REG_R3, addrhi, 0);
-    }
-
-    return TCG_REG_R1;
-}
-
-/* Record the context of a call to the out of line helper code for the slow
-   path for a load or store, so that we can later generate the correct
-   helper code.  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
-                                MemOpIdx oi, TCGType type,
-                                TCGReg datalo, TCGReg datahi,
-                                TCGReg addrlo, TCGReg addrhi,
-                                tcg_insn_unit *raddr,
-                                tcg_insn_unit *label_ptr)
-{
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->oi = oi;
-    label->type = type;
-    label->datalo_reg = datalo;
-    label->datahi_reg = datahi;
-    label->addrlo_reg = addrlo;
-    label->addrhi_reg = addrhi;
-    label->raddr = tcg_splitwx_to_rx(raddr);
-    label->label_ptr[0] = label_ptr;
-}
-
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     TCGReg argreg;
@@ -1636,29 +1517,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     return true;
 }
 #else
-
-static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
-                                   TCGReg addrhi, unsigned a_bits)
-{
-    unsigned a_mask = (1 << a_bits) - 1;
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->addrlo_reg = addrlo;
-    label->addrhi_reg = addrhi;
-
-    /* We are expecting a_bits to max out at 7, and can easily support 8. */
-    tcg_debug_assert(a_mask <= 0xff);
-    /* tst addr, #mask */
-    tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
-
-    /* blne slow_path */
-    label->label_ptr[0] = s->code_ptr;
-    tcg_out_bl_imm(s, COND_NE, 0);
-
-    label->raddr = tcg_splitwx_to_rx(s->code_ptr);
-}
-
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     if (!reloc_pc24(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
@@ -1703,6 +1561,134 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 }
 #endif /* SOFTMMU */
 
+static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
+                                           TCGReg addrlo, TCGReg addrhi,
+                                           MemOpIdx oi, bool is_ld)
+{
+    TCGLabelQemuLdst *ldst = NULL;
+    MemOp opc = get_memop(oi);
+    MemOp a_bits = get_alignment_bits(opc);
+    unsigned a_mask = (1 << a_bits) - 1;
+
+#ifdef CONFIG_SOFTMMU
+    int mem_index = get_mmuidx(oi);
+    int cmp_off = is_ld ? offsetof(CPUTLBEntry, addr_read)
+                        : offsetof(CPUTLBEntry, addr_write);
+    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
+    unsigned s_mask = (1 << (opc & MO_SIZE)) - 1;
+    TCGReg t_addr;
+
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addrlo;
+    ldst->addrhi_reg = addrhi;
+
+    /* Load env_tlb(env)->f[mmu_idx].{mask,table} into {r0,r1}.  */
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -256);
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, mask) != 0);
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBDescFast, table) != 4);
+    tcg_out_ldrd_8(s, COND_AL, TCG_REG_R0, TCG_AREG0, fast_off);
+
+    /* Extract the tlb index from the address into R0.  */
+    tcg_out_dat_reg(s, COND_AL, ARITH_AND, TCG_REG_R0, TCG_REG_R0, addrlo,
+                    SHIFT_IMM_LSR(TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS));
+
+    /*
+     * Add the tlb_table pointer, creating the CPUTLBEntry address in R1.
+     * Load the tlb comparator into R2/R3 and the fast path addend into R1.
+     */
+    if (cmp_off == 0) {
+        if (TARGET_LONG_BITS == 64) {
+            tcg_out_ldrd_rwb(s, COND_AL, TCG_REG_R2, TCG_REG_R1, TCG_REG_R0);
+        } else {
+            tcg_out_ld32_rwb(s, COND_AL, TCG_REG_R2, TCG_REG_R1, TCG_REG_R0);
+        }
+    } else {
+        tcg_out_dat_reg(s, COND_AL, ARITH_ADD,
+                        TCG_REG_R1, TCG_REG_R1, TCG_REG_R0, 0);
+        if (TARGET_LONG_BITS == 64) {
+            tcg_out_ldrd_8(s, COND_AL, TCG_REG_R2, TCG_REG_R1, cmp_off);
+        } else {
+            tcg_out_ld32_12(s, COND_AL, TCG_REG_R2, TCG_REG_R1, cmp_off);
+        }
+    }
+
+    /* Load the tlb addend.  */
+    tcg_out_ld32_12(s, COND_AL, TCG_REG_R1, TCG_REG_R1,
+                    offsetof(CPUTLBEntry, addend));
+
+    /*
+     * Check alignment, check comparators.
+     * Do this in 2-4 insns.  Use MOVW for v7, if possible,
+     * to reduce the number of sequential conditional instructions.
+     * Almost all guests have at least 4k pages, which means that we need
+     * to clear at least 9 bits even for an 8-byte memory, which means it
+     * isn't worth checking for an immediate operand for BIC.
+     *
+     * For unaligned accesses, test the page of the last unit of alignment.
+     * This leaves the least significant alignment bits unchanged, and of
+     * course must be zero.
+     */
+    t_addr = addrlo;
+    if (a_mask < s_mask) {
+        t_addr = TCG_REG_R0;
+        tcg_out_dat_imm(s, COND_AL, ARITH_ADD, t_addr,
+                        addrlo, s_mask - a_mask);
+    }
+    if (use_armv7_instructions && TARGET_PAGE_BITS <= 16) {
+        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, ~(TARGET_PAGE_MASK | a_mask));
+        tcg_out_dat_reg(s, COND_AL, ARITH_BIC, TCG_REG_TMP,
+                        t_addr, TCG_REG_TMP, 0);
+        tcg_out_dat_reg(s, COND_AL, ARITH_CMP, 0, TCG_REG_R2, TCG_REG_TMP, 0);
+    } else {
+        if (a_mask) {
+            tcg_debug_assert(a_mask <= 0xff);
+            tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
+        }
+        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, TCG_REG_TMP, 0, t_addr,
+                        SHIFT_IMM_LSR(TARGET_PAGE_BITS));
+        tcg_out_dat_reg(s, (a_mask ? COND_EQ : COND_AL), ARITH_CMP,
+                        0, TCG_REG_R2, TCG_REG_TMP,
+                        SHIFT_IMM_LSL(TARGET_PAGE_BITS));
+    }
+
+    if (TARGET_LONG_BITS == 64) {
+        tcg_out_dat_reg(s, COND_EQ, ARITH_CMP, 0, TCG_REG_R3, addrhi, 0);
+    }
+
+    *h = (HostAddress){
+        .cond = COND_AL,
+        .base = addrlo,
+        .index = TCG_REG_R1,
+        .index_scratch = true,
+    };
+#else
+    if (a_mask) {
+        ldst = new_ldst_label(s);
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addrlo;
+        ldst->addrhi_reg = addrhi;
+
+        /* We are expecting a_bits to max out at 7 */
+        tcg_debug_assert(a_mask <= 0xff);
+        /* tst addr, #mask */
+        tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, addrlo, a_mask);
+    }
+
+    *h = (HostAddress){
+        .cond = COND_AL,
+        .base = addrlo,
+        .index = guest_base ? TCG_REG_GUEST_BASE : -1,
+        .index_scratch = false,
+    };
+#endif
+
+    return ldst;
+}
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg datalo,
                                    TCGReg datahi, HostAddress h)
 {
@@ -1799,37 +1785,28 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#ifdef CONFIG_SOFTMMU
-    h.cond = COND_AL;
-    h.base = addrlo;
-    h.index_scratch = true;
-    h.index = tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 1);
+    ldst = prepare_host_addr(s, &h, addrlo, addrhi, oi, true);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
 
-    /*
-     * This a conditional BL only to load a pointer within this opcode into
-     * LR for the slow path.  We will not be using the value for a tail call.
-     */
-    tcg_insn_unit *label_ptr = s->code_ptr;
-    tcg_out_bl_imm(s, COND_NE, 0);
+        /*
+         * This a conditional BL only to load a pointer within this
+         * opcode into LR for the slow path.  We will not be using
+         * the value for a tail call.
+         */
+        ldst->label_ptr[0] = s->code_ptr;
+        tcg_out_bl_imm(s, COND_NE, 0);
 
-    tcg_out_qemu_ld_direct(s, opc, datalo, datahi, h);
-
-    add_qemu_ldst_label(s, true, oi, data_type, datalo, datahi,
-                        addrlo, addrhi, s->code_ptr, label_ptr);
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
+        tcg_out_qemu_ld_direct(s, opc, datalo, datahi, h);
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
+    } else {
+        tcg_out_qemu_ld_direct(s, opc, datalo, datahi, h);
     }
-
-    h.cond = COND_AL;
-    h.base = addrlo;
-    h.index = guest_base ? TCG_REG_GUEST_BASE : -1;
-    h.index_scratch = false;
-    tcg_out_qemu_ld_direct(s, opc, datalo, datahi, h);
-#endif
 }
 
 static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg datalo,
@@ -1891,35 +1868,25 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#ifdef CONFIG_SOFTMMU
-    h.cond = COND_EQ;
-    h.base = addrlo;
-    h.index_scratch = true;
-    h.index = tcg_out_tlb_read(s, addrlo, addrhi, opc, get_mmuidx(oi), 0);
-    tcg_out_qemu_st_direct(s, opc, datalo, datahi, h);
+    ldst = prepare_host_addr(s, &h, addrlo, addrhi, oi, false);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
 
-    /* The conditional call must come last, as we're going to return here.  */
-    tcg_insn_unit *label_ptr = s->code_ptr;
-    tcg_out_bl_imm(s, COND_NE, 0);
-
-    add_qemu_ldst_label(s, false, oi, data_type, datalo, datahi,
-                        addrlo, addrhi, s->code_ptr, label_ptr);
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-
-    h.cond = COND_AL;
-    if (a_bits) {
-        tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
         h.cond = COND_EQ;
-    }
+        tcg_out_qemu_st_direct(s, opc, datalo, datahi, h);
 
-    h.base = addrlo;
-    h.index = guest_base ? TCG_REG_GUEST_BASE : -1;
-    h.index_scratch = false;
-    tcg_out_qemu_st_direct(s, opc, datalo, datahi, h);
-#endif
+        /* The conditional call is last, as we're going to return here. */
+        ldst->label_ptr[0] = s->code_ptr;
+        tcg_out_bl_imm(s, COND_NE, 0);
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
+    } else {
+        tcg_out_qemu_st_direct(s, opc, datalo, datahi, h);
+    }
 }
 
 static void tcg_out_epilogue(TCGContext *s);
-- 
2.34.1


