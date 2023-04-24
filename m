Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqoza-0001yR-EN
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxi-0005oS-JT
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:42:06 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox0-0004Oq-0g
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:42:06 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2f4214b430aso2317629f8f.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314880; x=1684906880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E8LkZay/KDgOZOAPr4+3iyW8Oh14XA3T4+Op1DdY80A=;
 b=vCbfJHefbl9qOIaIcEkEaNWWjwjlo8spGDd4UQyQgSsPGp168Zj/YMd/AjOC1Gq9RR
 KBaN330rcFfgQqK8fw+4KlLdWDodpimYDpyEIl+qf6r6SHs1W5MqtzjXm9ODTpeMn5EG
 FtFCbVmt1QSvvf2tROvPEI9JgGt/P8gFS/muDwERPYdC6myi6wGv32qlcF8g26QWGLe1
 r1IeI8eBP5cSyjmuX35JqRFa8+dl8TOy/g8morGo5Pmg65u0KChy4R8JQvvHhjIboBki
 8I0iUHYlxea6Q4xqayMUsRbyYXozcwjKIEyxp/IQ/YkYrJZQgKE1HQXjt9F+CZPTXBJR
 VQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314880; x=1684906880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E8LkZay/KDgOZOAPr4+3iyW8Oh14XA3T4+Op1DdY80A=;
 b=AhOkqIp83T1CchZWTOO1QBLfiaaT0GB0GtGKj6bUT6jy2iH55iBZeDnyY2AFeOUFI0
 0tfsPkp4Kb9DJIJgrZLBlLgN1eIs24pKUxMGvhtKbCgq2sof6jl1GCXkJNNpLnMtux2L
 5r756YSa1YdbocoR3wGBuHOlRsW4Ms1yo+Yt4kYeAdlCBcPRL99wBxnL7hqjU1ONIttd
 g73TlRD24VcVm7uHbTnXfahzHNBhiSVUNj0cwWE/F0KcXjDz0onKD0pzgIdqVJFck0UV
 QEg/vCPNakvfHu3TRncq50ET0JZQII2Vb8YGg7A4eCO9yLNhnpYnATpJBxhiaQmjktlq
 svqg==
X-Gm-Message-State: AAQBX9edyImvxTAPDq9jAip98AYe3oWjqvG0LoF7dphNQ1UzpzQjy7+9
 ddJqIXCKajNHJYqpFgAxT37u9w==
X-Google-Smtp-Source: AKy350YtlBj4vKtcQ8kH58KCHSpQwoymeojzWIQPQeLKeJMeNQAuqJcSFdo34+KhAxhU5VvmyDrDMQ==
X-Received: by 2002:adf:dd85:0:b0:2f9:a798:602c with SMTP id
 x5-20020adfdd85000000b002f9a798602cmr8813994wrl.12.1682314880594; 
 Sun, 23 Apr 2023 22:41:20 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 25/57] tcg/ppc: Introduce prepare_host_addr
Date: Mon, 24 Apr 2023 06:40:33 +0100
Message-Id: <20230424054105.1579315-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Mon, 24 Apr 2023 05:42:07 -0000

Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
and some code that lived in both tcg_out_qemu_ld and tcg_out_qemu_st
into one function that returns HostAddress and TCGLabelQemuLdst structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 377 +++++++++++++++++----------------------
 1 file changed, 168 insertions(+), 209 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index cd473deb36..7239335bdf 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2003,140 +2003,6 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_BEUQ] = helper_be_stq_mmu,
 };
 
-/* We expect to use a 16-bit negative offset from ENV.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
-
-/* Perform the TLB load and compare.  Places the result of the comparison
-   in CR7, loads the addend of the TLB into R3, and returns the register
-   containing the guest address (zero-extended into R4).  Clobbers R0 and R2. */
-
-static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
-                               TCGReg addrlo, TCGReg addrhi,
-                               int mem_index, bool is_read)
-{
-    int cmp_off
-        = (is_read
-           ? offsetof(CPUTLBEntry, addr_read)
-           : offsetof(CPUTLBEntry, addr_write));
-    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
-    int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
-    int table_off = fast_off + offsetof(CPUTLBDescFast, table);
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_bits = get_alignment_bits(opc);
-
-    /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R3, TCG_AREG0, mask_off);
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R4, TCG_AREG0, table_off);
-
-    /* Extract the page index, shifted into place for tlb index.  */
-    if (TCG_TARGET_REG_BITS == 32) {
-        tcg_out_shri32(s, TCG_REG_TMP1, addrlo,
-                       TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-    } else {
-        tcg_out_shri64(s, TCG_REG_TMP1, addrlo,
-                       TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-    }
-    tcg_out32(s, AND | SAB(TCG_REG_R3, TCG_REG_R3, TCG_REG_TMP1));
-
-    /* Load the TLB comparator.  */
-    if (cmp_off == 0 && TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
-        uint32_t lxu = (TCG_TARGET_REG_BITS == 32 || TARGET_LONG_BITS == 32
-                        ? LWZUX : LDUX);
-        tcg_out32(s, lxu | TAB(TCG_REG_TMP1, TCG_REG_R3, TCG_REG_R4));
-    } else {
-        tcg_out32(s, ADD | TAB(TCG_REG_R3, TCG_REG_R3, TCG_REG_R4));
-        if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP1, TCG_REG_R3, cmp_off + 4);
-            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_R4, TCG_REG_R3, cmp_off);
-        } else {
-            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP1, TCG_REG_R3, cmp_off);
-        }
-    }
-
-    /* Load the TLB addend for use on the fast path.  Do this asap
-       to minimize any load use delay.  */
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R3, TCG_REG_R3,
-               offsetof(CPUTLBEntry, addend));
-
-    /* Clear the non-page, non-alignment bits from the address */
-    if (TCG_TARGET_REG_BITS == 32) {
-        /* We don't support unaligned accesses on 32-bits.
-         * Preserve the bottom bits and thus trigger a comparison
-         * failure on unaligned accesses.
-         */
-        if (a_bits < s_bits) {
-            a_bits = s_bits;
-        }
-        tcg_out_rlw(s, RLWINM, TCG_REG_R0, addrlo, 0,
-                    (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
-    } else {
-        TCGReg t = addrlo;
-
-        /* If the access is unaligned, we need to make sure we fail if we
-         * cross a page boundary.  The trick is to add the access size-1
-         * to the address before masking the low bits.  That will make the
-         * address overflow to the next page if we cross a page boundary,
-         * which will then force a mismatch of the TLB compare.
-         */
-        if (a_bits < s_bits) {
-            unsigned a_mask = (1 << a_bits) - 1;
-            unsigned s_mask = (1 << s_bits) - 1;
-            tcg_out32(s, ADDI | TAI(TCG_REG_R0, t, s_mask - a_mask));
-            t = TCG_REG_R0;
-        }
-
-        /* Mask the address for the requested alignment.  */
-        if (TARGET_LONG_BITS == 32) {
-            tcg_out_rlw(s, RLWINM, TCG_REG_R0, t, 0,
-                        (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
-            /* Zero-extend the address for use in the final address.  */
-            tcg_out_ext32u(s, TCG_REG_R4, addrlo);
-            addrlo = TCG_REG_R4;
-        } else if (a_bits == 0) {
-            tcg_out_rld(s, RLDICR, TCG_REG_R0, t, 0, 63 - TARGET_PAGE_BITS);
-        } else {
-            tcg_out_rld(s, RLDICL, TCG_REG_R0, t,
-                        64 - TARGET_PAGE_BITS, TARGET_PAGE_BITS - a_bits);
-            tcg_out_rld(s, RLDICL, TCG_REG_R0, TCG_REG_R0, TARGET_PAGE_BITS, 0);
-        }
-    }
-
-    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
-        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
-                    0, 7, TCG_TYPE_I32);
-        tcg_out_cmp(s, TCG_COND_EQ, addrhi, TCG_REG_R4, 0, 6, TCG_TYPE_I32);
-        tcg_out32(s, CRAND | BT(7, CR_EQ) | BA(6, CR_EQ) | BB(7, CR_EQ));
-    } else {
-        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
-                    0, 7, TCG_TYPE_TL);
-    }
-
-    return addrlo;
-}
-
-/* Record the context of a call to the out of line helper code for the slow
-   path for a load or store, so that we can later generate the correct
-   helper code.  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
-                                TCGType type, MemOpIdx oi,
-                                TCGReg datalo_reg, TCGReg datahi_reg,
-                                TCGReg addrlo_reg, TCGReg addrhi_reg,
-                                tcg_insn_unit *raddr, tcg_insn_unit *lptr)
-{
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->type = type;
-    label->oi = oi;
-    label->datalo_reg = datalo_reg;
-    label->datahi_reg = datahi_reg;
-    label->addrlo_reg = addrlo_reg;
-    label->addrhi_reg = addrhi_reg;
-    label->raddr = tcg_splitwx_to_rx(raddr);
-    label->label_ptr[0] = lptr;
-}
-
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
     MemOpIdx oi = lb->oi;
@@ -2225,27 +2091,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
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
-    /* We are expecting a_bits to max out at 7, much lower than ANDI. */
-    tcg_debug_assert(a_bits < 16);
-    tcg_out32(s, ANDI | SAI(addrlo, TCG_REG_R0, a_mask));
-
-    label->label_ptr[0] = s->code_ptr;
-    tcg_out32(s, BC | BI(0, CR_EQ) | BO_COND_FALSE | LK);
-
-    label->raddr = tcg_splitwx_to_rx(s->code_ptr);
-}
-
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     if (!reloc_pc14(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
@@ -2294,37 +2139,167 @@ typedef struct {
     TCGReg index;
 } HostAddress;
 
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
+
+#ifdef CONFIG_SOFTMMU
+    int mem_index = get_mmuidx(oi);
+    int cmp_off = is_ld ? offsetof(CPUTLBEntry, addr_read)
+                        : offsetof(CPUTLBEntry, addr_write);
+    int fast_off = TLB_MASK_TABLE_OFS(mem_index);
+    int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
+    int table_off = fast_off + offsetof(CPUTLBDescFast, table);
+    unsigned s_bits = opc & MO_SIZE;
+
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addrlo;
+    ldst->addrhi_reg = addrhi;
+
+    /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R3, TCG_AREG0, mask_off);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R4, TCG_AREG0, table_off);
+
+    /* Extract the page index, shifted into place for tlb index.  */
+    if (TCG_TARGET_REG_BITS == 32) {
+        tcg_out_shri32(s, TCG_REG_TMP1, addrlo,
+                       TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+    } else {
+        tcg_out_shri64(s, TCG_REG_TMP1, addrlo,
+                       TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+    }
+    tcg_out32(s, AND | SAB(TCG_REG_R3, TCG_REG_R3, TCG_REG_TMP1));
+
+    /* Load the TLB comparator.  */
+    if (cmp_off == 0 && TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
+        uint32_t lxu = (TCG_TARGET_REG_BITS == 32 || TARGET_LONG_BITS == 32
+                        ? LWZUX : LDUX);
+        tcg_out32(s, lxu | TAB(TCG_REG_TMP1, TCG_REG_R3, TCG_REG_R4));
+    } else {
+        tcg_out32(s, ADD | TAB(TCG_REG_R3, TCG_REG_R3, TCG_REG_R4));
+        if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP1, TCG_REG_R3, cmp_off + 4);
+            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_R4, TCG_REG_R3, cmp_off);
+        } else {
+            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP1, TCG_REG_R3, cmp_off);
+        }
+    }
+
+    /* Load the TLB addend for use on the fast path.  Do this asap
+       to minimize any load use delay.  */
+    h->base = TCG_REG_R3;
+    tcg_out_ld(s, TCG_TYPE_PTR, h->base, TCG_REG_R3,
+               offsetof(CPUTLBEntry, addend));
+
+    /* Clear the non-page, non-alignment bits from the address */
+    if (TCG_TARGET_REG_BITS == 32) {
+        /* We don't support unaligned accesses on 32-bits.
+         * Preserve the bottom bits and thus trigger a comparison
+         * failure on unaligned accesses.
+         */
+        if (a_bits < s_bits) {
+            a_bits = s_bits;
+        }
+        tcg_out_rlw(s, RLWINM, TCG_REG_R0, addrlo, 0,
+                    (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
+    } else {
+        TCGReg t = addrlo;
+
+        /* If the access is unaligned, we need to make sure we fail if we
+         * cross a page boundary.  The trick is to add the access size-1
+         * to the address before masking the low bits.  That will make the
+         * address overflow to the next page if we cross a page boundary,
+         * which will then force a mismatch of the TLB compare.
+         */
+        if (a_bits < s_bits) {
+            unsigned a_mask = (1 << a_bits) - 1;
+            unsigned s_mask = (1 << s_bits) - 1;
+            tcg_out32(s, ADDI | TAI(TCG_REG_R0, t, s_mask - a_mask));
+            t = TCG_REG_R0;
+        }
+
+        /* Mask the address for the requested alignment.  */
+        if (TARGET_LONG_BITS == 32) {
+            tcg_out_rlw(s, RLWINM, TCG_REG_R0, t, 0,
+                        (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
+            /* Zero-extend the address for use in the final address.  */
+            tcg_out_ext32u(s, TCG_REG_R4, addrlo);
+            addrlo = TCG_REG_R4;
+        } else if (a_bits == 0) {
+            tcg_out_rld(s, RLDICR, TCG_REG_R0, t, 0, 63 - TARGET_PAGE_BITS);
+        } else {
+            tcg_out_rld(s, RLDICL, TCG_REG_R0, t,
+                        64 - TARGET_PAGE_BITS, TARGET_PAGE_BITS - a_bits);
+            tcg_out_rld(s, RLDICL, TCG_REG_R0, TCG_REG_R0, TARGET_PAGE_BITS, 0);
+        }
+    }
+    h->index = addrlo;
+
+    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
+                    0, 7, TCG_TYPE_I32);
+        tcg_out_cmp(s, TCG_COND_EQ, addrhi, TCG_REG_R4, 0, 6, TCG_TYPE_I32);
+        tcg_out32(s, CRAND | BT(7, CR_EQ) | BA(6, CR_EQ) | BB(7, CR_EQ));
+    } else {
+        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
+                    0, 7, TCG_TYPE_TL);
+    }
+
+    /* Load a pointer into the current opcode w/conditional branch-link. */
+    ldst->label_ptr[0] = s->code_ptr;
+    tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
+#else
+    if (a_bits) {
+        ldst = new_ldst_label(s);
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addrlo;
+        ldst->addrhi_reg = addrhi;
+
+        /* We are expecting a_bits to max out at 7, much lower than ANDI. */
+        tcg_debug_assert(a_bits < 16);
+        tcg_out32(s, ANDI | SAI(addrlo, TCG_REG_R0, (1 << a_bits) - 1));
+
+        ldst->label_ptr[0] = s->code_ptr;
+        tcg_out32(s, BC | BI(0, CR_EQ) | BO_COND_FALSE | LK);
+    }
+
+    h->base = guest_base ? TCG_GUEST_BASE_REG : 0;
+    h->index = addrlo;
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
+        h->index = TCG_REG_TMP1;
+    }
+#endif
+
+    return ldst;
+}
+
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             TCGReg addrlo, TCGReg addrhi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#ifdef CONFIG_SOFTMMU
-    tcg_insn_unit *label_ptr;
+    ldst = prepare_host_addr(s, &h, addrlo, addrhi, oi, true);
 
-    h.index = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), true);
-    h.base = TCG_REG_R3;
-
-    /* Load a pointer into the current opcode w/conditional branch-link. */
-    label_ptr = s->code_ptr;
-    tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
-#else  /* !CONFIG_SOFTMMU */
-    unsigned a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
-    }
-    h.base = guest_base ? TCG_GUEST_BASE_REG : 0;
-    h.index = addrlo;
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
-        h.index = TCG_REG_TMP1;
-    }
-#endif
-
-    if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
+    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
         if (opc & MO_BSWAP) {
             tcg_out32(s, ADDI | TAI(TCG_REG_R0, h.index, 4));
             tcg_out32(s, LWBRX | TAB(datalo, h.base, h.index));
@@ -2357,10 +2332,12 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
         }
     }
 
-#ifdef CONFIG_SOFTMMU
-    add_qemu_ldst_label(s, true, data_type, oi, datalo, datahi,
-                        addrlo, addrhi, s->code_ptr, label_ptr);
-#endif
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
+    }
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
@@ -2368,32 +2345,12 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
-    MemOp s_bits = opc & MO_SIZE;
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#ifdef CONFIG_SOFTMMU
-    tcg_insn_unit *label_ptr;
+    ldst = prepare_host_addr(s, &h, addrlo, addrhi, oi, false);
 
-    h.index = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), false);
-    h.base = TCG_REG_R3;
-
-    /* Load a pointer into the current opcode w/conditional branch-link. */
-    label_ptr = s->code_ptr;
-    tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
-#else  /* !CONFIG_SOFTMMU */
-    unsigned a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
-    }
-    h.base = guest_base ? TCG_GUEST_BASE_REG : 0;
-    h.index = addrlo;
-    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
-        tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
-        h.index = TCG_REG_TMP1;
-    }
-#endif
-
-    if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
+    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
         if (opc & MO_BSWAP) {
             tcg_out32(s, ADDI | TAI(TCG_REG_R0, h.index, 4));
             tcg_out32(s, STWBRX | SAB(datalo, h.base, h.index));
@@ -2418,10 +2375,12 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
         }
     }
 
-#ifdef CONFIG_SOFTMMU
-    add_qemu_ldst_label(s, false, data_type, oi, datalo, datahi,
-                        addrlo, addrhi, s->code_ptr, label_ptr);
-#endif
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
+    }
 }
 
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
-- 
2.34.1


