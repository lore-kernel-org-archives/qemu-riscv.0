Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6RB-0007rm-64
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R7-0007nr-Kk
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:02 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qp-0001f7-KE
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:01 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso49002395e9.2
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097063; x=1685689063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N0k727NYZjnrZBTMhehFGEr2gxv6PrKgfLN9LqxUppY=;
 b=iNDi22kDBvxUQ46uOW4o7HpClZVKYNrPmXE1pZim4Ox3eJ9p1vRLuc2oHUch01xpIh
 64M6VoJw9QxYKDAzEpIr6qB07ZZED9glKgF5ENss7Inbef/xMYlDJAh1r8AeJz4fvsMG
 CzxZn3Mphr29xgZ6v9pIHM7qIAHVgtFUYwXgwEyF9PZBiac/q9fgtgoUcOKlqa9EE4yl
 Jd7fSdPzli17bnz5teYupZp29NbxE+jcPaYG1DG74YzKuh17tsZxx6lEAGF6MhoZdwXN
 29KicMuiiQMAkyUze3IwGDPqQztQ3VNNVvOY9Q1bivvcMY85GkY2EZwLR9X2fpEoAhpE
 9r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097063; x=1685689063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N0k727NYZjnrZBTMhehFGEr2gxv6PrKgfLN9LqxUppY=;
 b=N7pzYQTtgR8XelL8bUV1IJ1Eu8oZkr7WTlAVMnj7/Nqc6m1Npuyd1YUq11XaL/yFEf
 NDLjbS2fwf7XT96uwWOd4lWQ1icz8LjQKX87a8hLlRcMXR7WQwzKQXRAGe++35io0K9g
 a37M19EIYm1GB40SWW+jmH0c+0g5425TdCc1+v/YtDiSO3ae1bWV0pJHvkdcKs4nW3wb
 RJdfUKpjJd9Qf1nredhefnGQouWSiPPDhZUEVIHX2W5bCKN1VGT7WL5gAIobIVcjhmIz
 wwObjzgPnWPSSE8+pPSsKIP6ifUpKAQyNlUHVHH/wp3cy22AG73rcfP8W5dD84lI7Kat
 GcLQ==
X-Gm-Message-State: AC+VfDxtcGguYK3jIcYZavWbcVOjG6x9QModcCTKpv5X8p9lfXtFkoy5
 DL9QQ4twTsTmBAsK3V8fJJaj4lYFHw2CoUVeLrrvvg==
X-Google-Smtp-Source: ACHHUZ6k8Di5CcMwbSunJOfKFp4Zt5wrADBnfaNHE8LFDsUtWjoeBRE2xMyNHYGuHNVBy0dX9J1pFA==
X-Received: by 2002:a5d:51c9:0:b0:2f4:2ad5:15ef with SMTP id
 n9-20020a5d51c9000000b002f42ad515efmr12991851wrv.16.1683097062852; 
 Tue, 02 May 2023 23:57:42 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 16/54] tcg/loongarch64: Introduce prepare_host_addr
Date: Wed,  3 May 2023 07:56:51 +0100
Message-Id: <20230503065729.1745843-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Wed, 03 May 2023 06:58:02 -0000

Merge tcg_out_tlb_load, add_qemu_ldst_label, tcg_out_test_alignment,
tcg_out_zext_addr_if_32_bit, and some code that lived in both
tcg_out_qemu_ld and tcg_out_qemu_st into one function that returns
HostAddress and TCGLabelQemuLdst structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 255 +++++++++++++------------------
 1 file changed, 105 insertions(+), 150 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 6a87a5e5a3..2f2c34b930 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -818,81 +818,12 @@ static void * const qemu_st_helpers[4] = {
     [MO_64] = helper_le_stq_mmu,
 };
 
-/* We expect to use a 12-bit negative offset from ENV.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
-
 static bool tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_b(s, 0);
     return reloc_br_sd10k16(s->code_ptr - 1, target);
 }
 
-/*
- * Emits common code for TLB addend lookup, that eventually loads the
- * addend in TCG_REG_TMP2.
- */
-static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl, MemOpIdx oi,
-                             tcg_insn_unit **label_ptr, bool is_load)
-{
-    MemOp opc = get_memop(oi);
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_bits = get_alignment_bits(opc);
-    tcg_target_long compare_mask;
-    int mem_index = get_mmuidx(oi);
-    int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
-    int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
-    int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
-
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_AREG0, mask_ofs);
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, table_ofs);
-
-    tcg_out_opc_srli_d(s, TCG_REG_TMP2, addrl,
-                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-    tcg_out_opc_and(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
-    tcg_out_opc_add_d(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
-
-    /* Load the tlb comparator and the addend.  */
-    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
-               is_load ? offsetof(CPUTLBEntry, addr_read)
-               : offsetof(CPUTLBEntry, addr_write));
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
-               offsetof(CPUTLBEntry, addend));
-
-    /* We don't support unaligned accesses.  */
-    if (a_bits < s_bits) {
-        a_bits = s_bits;
-    }
-    /* Clear the non-page, non-alignment bits from the address.  */
-    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
-    tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
-    tcg_out_opc_and(s, TCG_REG_TMP1, TCG_REG_TMP1, addrl);
-
-    /* Compare masked address with the TLB entry.  */
-    label_ptr[0] = s->code_ptr;
-    tcg_out_opc_bne(s, TCG_REG_TMP0, TCG_REG_TMP1, 0);
-
-    /* TLB Hit - addend in TCG_REG_TMP2, ready for use.  */
-}
-
-static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
-                                TCGType type,
-                                TCGReg datalo, TCGReg addrlo,
-                                void *raddr, tcg_insn_unit **label_ptr)
-{
-    TCGLabelQemuLdst *label = new_ldst_label(s);
-
-    label->is_ld = is_ld;
-    label->oi = oi;
-    label->type = type;
-    label->datalo_reg = datalo;
-    label->datahi_reg = 0; /* unused */
-    label->addrlo_reg = addrlo;
-    label->addrhi_reg = 0; /* unused */
-    label->raddr = tcg_splitwx_to_rx(raddr);
-    label->label_ptr[0] = label_ptr[0];
-}
-
 static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 {
     MemOpIdx oi = l->oi;
@@ -941,33 +872,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return tcg_out_goto(s, l->raddr);
 }
 #else
-
-/*
- * Alignment helpers for user-mode emulation
- */
-
-static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
-                                   unsigned a_bits)
-{
-    TCGLabelQemuLdst *l = new_ldst_label(s);
-
-    l->is_ld = is_ld;
-    l->addrlo_reg = addr_reg;
-
-    /*
-     * Without micro-architecture details, we don't know which of bstrpick or
-     * andi is faster, so use bstrpick as it's not constrained by imm field
-     * width. (Not to say alignments >= 2^12 are going to happen any time
-     * soon, though)
-     */
-    tcg_out_opc_bstrpick_d(s, TCG_REG_TMP1, addr_reg, 0, a_bits - 1);
-
-    l->label_ptr[0] = s->code_ptr;
-    tcg_out_opc_bne(s, TCG_REG_TMP1, TCG_REG_ZERO, 0);
-
-    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
-}
-
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     /* resolve label address */
@@ -997,27 +901,102 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
 #endif /* CONFIG_SOFTMMU */
 
-/*
- * `ext32u` the address register into the temp register given,
- * if target is 32-bit, no-op otherwise.
- *
- * Returns the address register ready for use with TLB addend.
- */
-static TCGReg tcg_out_zext_addr_if_32_bit(TCGContext *s,
-                                          TCGReg addr, TCGReg tmp)
-{
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, tmp, addr);
-        return tmp;
-    }
-    return addr;
-}
-
 typedef struct {
     TCGReg base;
     TCGReg index;
 } HostAddress;
 
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
+    TCGLabelQemuLdst *ldst = NULL;
+    MemOp opc = get_memop(oi);
+    unsigned a_bits = get_alignment_bits(opc);
+
+#ifdef CONFIG_SOFTMMU
+    unsigned s_bits = opc & MO_SIZE;
+    int mem_index = get_mmuidx(oi);
+    int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
+    int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
+    int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
+    tcg_target_long compare_mask;
+
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addr_reg;
+
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_AREG0, mask_ofs);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, table_ofs);
+
+    tcg_out_opc_srli_d(s, TCG_REG_TMP2, addr_reg,
+                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+    tcg_out_opc_and(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
+    tcg_out_opc_add_d(s, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
+
+    /* Load the tlb comparator and the addend.  */
+    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
+               is_ld ? offsetof(CPUTLBEntry, addr_read)
+                     : offsetof(CPUTLBEntry, addr_write));
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
+               offsetof(CPUTLBEntry, addend));
+
+    /* We don't support unaligned accesses.  */
+    if (a_bits < s_bits) {
+        a_bits = s_bits;
+    }
+    /* Clear the non-page, non-alignment bits from the address.  */
+    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
+    tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
+    tcg_out_opc_and(s, TCG_REG_TMP1, TCG_REG_TMP1, addr_reg);
+
+    /* Compare masked address with the TLB entry.  */
+    ldst->label_ptr[0] = s->code_ptr;
+    tcg_out_opc_bne(s, TCG_REG_TMP0, TCG_REG_TMP1, 0);
+
+    h->index = TCG_REG_TMP2;
+#else
+    if (a_bits) {
+        ldst = new_ldst_label(s);
+
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addr_reg;
+
+        /*
+         * Without micro-architecture details, we don't know which of
+         * bstrpick or andi is faster, so use bstrpick as it's not
+         * constrained by imm field width. Not to say alignments >= 2^12
+         * are going to happen any time soon.
+         */
+        tcg_out_opc_bstrpick_d(s, TCG_REG_TMP1, addr_reg, 0, a_bits - 1);
+
+        ldst->label_ptr[0] = s->code_ptr;
+        tcg_out_opc_bne(s, TCG_REG_TMP1, TCG_REG_ZERO, 0);
+    }
+
+    h->index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
+#endif
+
+    if (TARGET_LONG_BITS == 32) {
+        h->base = TCG_REG_TMP0;
+        tcg_out_ext32u(s, h->base, addr_reg);
+    } else {
+        h->base = addr_reg;
+    }
+
+    return ldst;
+}
+
 static void tcg_out_qemu_ld_indexed(TCGContext *s, MemOp opc, TCGType type,
                                     TCGReg rd, HostAddress h)
 {
@@ -1057,29 +1036,17 @@ static void tcg_out_qemu_ld_indexed(TCGContext *s, MemOp opc, TCGType type,
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#ifdef CONFIG_SOFTMMU
-    tcg_insn_unit *label_ptr[1];
+    ldst = prepare_host_addr(s, &h, addr_reg, oi, true);
+    tcg_out_qemu_ld_indexed(s, get_memop(oi), data_type, data_reg, h);
 
-    tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 1);
-    h.index = TCG_REG_TMP2;
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, true, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    h.index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
-#endif
-
-    h.base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
-    tcg_out_qemu_ld_indexed(s, opc, data_type, data_reg, h);
-
-#ifdef CONFIG_SOFTMMU
-    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#endif
 }
 
 static void tcg_out_qemu_st_indexed(TCGContext *s, MemOp opc,
@@ -1109,29 +1076,17 @@ static void tcg_out_qemu_st_indexed(TCGContext *s, MemOp opc,
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#ifdef CONFIG_SOFTMMU
-    tcg_insn_unit *label_ptr[1];
+    ldst = prepare_host_addr(s, &h, addr_reg, oi, false);
+    tcg_out_qemu_st_indexed(s, get_memop(oi), data_reg, h);
 
-    tcg_out_tlb_load(s, addr_reg, oi, label_ptr, 0);
-    h.index = TCG_REG_TMP2;
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, false, addr_reg, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data_reg;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    h.index = USE_GUEST_BASE ? TCG_GUEST_BASE_REG : TCG_REG_ZERO;
-#endif
-
-    h.base = tcg_out_zext_addr_if_32_bit(s, addr_reg, TCG_REG_TMP0);
-    tcg_out_qemu_st_indexed(s, opc, data_reg, h);
-
-#ifdef CONFIG_SOFTMMU
-    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
-                        s->code_ptr, label_ptr);
-#endif
 }
 
 /*
-- 
2.34.1


