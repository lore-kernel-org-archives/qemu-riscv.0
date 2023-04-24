Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqoxm-0005yP-0M
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxF-0005R4-9C
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:38 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowt-0004HU-DA
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:41:36 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so25778605e9.3
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314872; x=1684906872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pqi/q0sW6VchB17f5UgVVvECaq0I+8SltHFrwPsjgc4=;
 b=KGUaGmtOweTKlWry5QdKgbHJ0/0PdkXMssNOa8FO9yGsgU2FABhQrU+/ahAf8Zawah
 hVuus8HFIrc/z7Si+afc82/qniX+2ALms2aT/E1/RpiPb930DKL0znunVGqe+FAz+d83
 Ga70oYhe0wvwgU8J3iQtOeDGaNOxB1iG0ecNU4LxLnTLUaIqjHMYumNDpIIpkQlAyfFm
 76f5lFQK9TwcPi91wq8zEXD8in6c3uXmYnlnIlmy7u3B2UtJabGupw3mH1Zz0HlpuWcJ
 RqFl+l0D8YLx0Cq2lfQPYn6/8Kl4yCeSlvSf+6dHtzEF38Eaeqh41yKZkX9TPp0L5Niy
 qw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314872; x=1684906872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pqi/q0sW6VchB17f5UgVVvECaq0I+8SltHFrwPsjgc4=;
 b=jYw3TjtOL3XeobyHVTQpNsRVUQIHMtebdkqDBw9CyljLTgkwGd9dUbvfpSb8YbADqd
 LdhbZj2TZtePB5HsNo4uf7hTb9uuETUmDcSgFR/a6qzFlft23kWOHcJY54b32H/b7KQ1
 IdtlUgmsBYRb6jvLnsRtOF6tE9JJ2GAOvMmvtAajEwpTnwP8Xx3yWX7ngOJo9jVOe2ER
 gRPNAOqGd88DrMvh69ToZJxrjUR/Gy8s3l8Ch0+ML1IMIywIQTjuLZRCuneJV8odZanb
 y+XGUYE2N1XnzGyQTdEWAIa5Qc+99wXgmVOmi61W9PqFDdK5mXHkePI6XG8bBqW1Yhoq
 luuw==
X-Gm-Message-State: AAQBX9dEv0zavimUG/ac0lW0lp9il9V0GS3++UAPMLWsw5uEPGNuuXFj
 5QJcgAhNi+NLNUshwSpEdjJuKg==
X-Google-Smtp-Source: AKy350bQ+dMlfGTVscGEKGEPXEODQG1G7QyaheptcdRK2n734LmSIfiaOAyVElGPp32o2OKioYPanw==
X-Received: by 2002:a05:600c:214e:b0:3f1:72f8:6a9c with SMTP id
 v14-20020a05600c214e00b003f172f86a9cmr5966198wml.6.1682314872140; 
 Sun, 23 Apr 2023 22:41:12 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 10/57] tcg/i386: Introduce prepare_host_addr
Date: Mon, 24 Apr 2023 06:40:18 +0100
Message-Id: <20230424054105.1579315-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Mon, 24 Apr 2023 05:41:38 -0000

Merge tcg_out_tlb_load, add_qemu_ldst_label,
tcg_out_test_alignment, and some code that lived in both
tcg_out_qemu_ld and tcg_out_qemu_st into one function
that returns HostAddress and TCGLabelQemuLdst structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 344 ++++++++++++++++----------------------
 1 file changed, 143 insertions(+), 201 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 19625a7c75..2da6d87c7d 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1804,135 +1804,6 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
     [MO_BEUQ] = helper_be_stq_mmu,
 };
 
-/* Perform the TLB load and compare.
-
-   Inputs:
-   ADDRLO and ADDRHI contain the low and high part of the address.
-
-   MEM_INDEX and S_BITS are the memory context and log2 size of the load.
-
-   WHICH is the offset into the CPUTLBEntry structure of the slot to read.
-   This should be offsetof addr_read or addr_write.
-
-   Outputs:
-   LABEL_PTRS is filled with 1 (32-bit addresses) or 2 (64-bit addresses)
-   positions of the displacements of forward jumps to the TLB miss case.
-
-   Second argument register is loaded with the low part of the address.
-   In the TLB hit case, it has been adjusted as indicated by the TLB
-   and so is a host address.  In the TLB miss case, it continues to
-   hold a guest address.
-
-   First argument register is clobbered.  */
-
-static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
-                                    int mem_index, MemOp opc,
-                                    tcg_insn_unit **label_ptr, int which)
-{
-    TCGType ttype = TCG_TYPE_I32;
-    TCGType tlbtype = TCG_TYPE_I32;
-    int trexw = 0, hrexw = 0, tlbrexw = 0;
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_mask = (1 << a_bits) - 1;
-    unsigned s_mask = (1 << s_bits) - 1;
-    target_ulong tlb_mask;
-
-    if (TCG_TARGET_REG_BITS == 64) {
-        if (TARGET_LONG_BITS == 64) {
-            ttype = TCG_TYPE_I64;
-            trexw = P_REXW;
-        }
-        if (TCG_TYPE_PTR == TCG_TYPE_I64) {
-            hrexw = P_REXW;
-            if (TARGET_PAGE_BITS + CPU_TLB_DYN_MAX_BITS > 32) {
-                tlbtype = TCG_TYPE_I64;
-                tlbrexw = P_REXW;
-            }
-        }
-    }
-
-    tcg_out_mov(s, tlbtype, TCG_REG_L0, addrlo);
-    tcg_out_shifti(s, SHIFT_SHR + tlbrexw, TCG_REG_L0,
-                   TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
-
-    tcg_out_modrm_offset(s, OPC_AND_GvEv + trexw, TCG_REG_L0, TCG_AREG0,
-                         TLB_MASK_TABLE_OFS(mem_index) +
-                         offsetof(CPUTLBDescFast, mask));
-
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, TCG_REG_L0, TCG_AREG0,
-                         TLB_MASK_TABLE_OFS(mem_index) +
-                         offsetof(CPUTLBDescFast, table));
-
-    /* If the required alignment is at least as large as the access, simply
-       copy the address and mask.  For lesser alignments, check that we don't
-       cross pages for the complete access.  */
-    if (a_bits >= s_bits) {
-        tcg_out_mov(s, ttype, TCG_REG_L1, addrlo);
-    } else {
-        tcg_out_modrm_offset(s, OPC_LEA + trexw, TCG_REG_L1,
-                             addrlo, s_mask - a_mask);
-    }
-    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
-    tgen_arithi(s, ARITH_AND + trexw, TCG_REG_L1, tlb_mask, 0);
-
-    /* cmp 0(TCG_REG_L0), TCG_REG_L1 */
-    tcg_out_modrm_offset(s, OPC_CMP_GvEv + trexw,
-                         TCG_REG_L1, TCG_REG_L0, which);
-
-    /* Prepare for both the fast path add of the tlb addend, and the slow
-       path function argument setup.  */
-    tcg_out_mov(s, ttype, TCG_REG_L1, addrlo);
-
-    /* jne slow_path */
-    tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
-    label_ptr[0] = s->code_ptr;
-    s->code_ptr += 4;
-
-    if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-        /* cmp 4(TCG_REG_L0), addrhi */
-        tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, TCG_REG_L0, which + 4);
-
-        /* jne slow_path */
-        tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
-        label_ptr[1] = s->code_ptr;
-        s->code_ptr += 4;
-    }
-
-    /* TLB Hit.  */
-
-    /* add addend(TCG_REG_L0), TCG_REG_L1 */
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, TCG_REG_L1, TCG_REG_L0,
-                         offsetof(CPUTLBEntry, addend));
-}
-
-/*
- * Record the context of a call to the out of line helper code for the slow path
- * for a load or store, so that we can later generate the correct helper code
- */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
-                                TCGType type, MemOpIdx oi,
-                                TCGReg datalo, TCGReg datahi,
-                                TCGReg addrlo, TCGReg addrhi,
-                                tcg_insn_unit *raddr,
-                                tcg_insn_unit **label_ptr)
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
-    label->label_ptr[0] = label_ptr[0];
-    if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-        label->label_ptr[1] = label_ptr[1];
-    }
-}
-
 /*
  * Generate code for the slow path for a load at the end of block
  */
@@ -2063,27 +1934,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return true;
 }
 #else
-
-static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
-                                   TCGReg addrhi, unsigned a_bits)
-{
-    unsigned a_mask = (1 << a_bits) - 1;
-    TCGLabelQemuLdst *label;
-
-    tcg_out_testi(s, addrlo, a_mask);
-    /* jne slow_path */
-    tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
-
-    label = new_ldst_label(s);
-    label->is_ld = is_ld;
-    label->addrlo_reg = addrlo;
-    label->addrhi_reg = addrhi;
-    label->raddr = tcg_splitwx_to_rx(s->code_ptr + 4);
-    label->label_ptr[0] = s->code_ptr;
-
-    s->code_ptr += 4;
-}
-
 static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
 {
     /* resolve label address */
@@ -2161,6 +2011,133 @@ static inline int setup_guest_base_seg(void)
 #endif /* setup_guest_base_seg */
 #endif /* SOFTMMU */
 
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
+    unsigned a_mask = (1 << a_bits) - 1;
+
+#ifdef CONFIG_SOFTMMU
+    int cmp_ofs = is_ld ? offsetof(CPUTLBEntry, addr_read)
+                        : offsetof(CPUTLBEntry, addr_write);
+    TCGType ttype = TCG_TYPE_I32;
+    TCGType tlbtype = TCG_TYPE_I32;
+    int trexw = 0, hrexw = 0, tlbrexw = 0;
+    unsigned mem_index = get_mmuidx(oi);
+    unsigned s_bits = opc & MO_SIZE;
+    unsigned s_mask = (1 << s_bits) - 1;
+    target_ulong tlb_mask;
+
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addrlo;
+    ldst->addrhi_reg = addrhi;
+
+    if (TCG_TARGET_REG_BITS == 64) {
+        if (TARGET_LONG_BITS == 64) {
+            ttype = TCG_TYPE_I64;
+            trexw = P_REXW;
+        }
+        if (TCG_TYPE_PTR == TCG_TYPE_I64) {
+            hrexw = P_REXW;
+            if (TARGET_PAGE_BITS + CPU_TLB_DYN_MAX_BITS > 32) {
+                tlbtype = TCG_TYPE_I64;
+                tlbrexw = P_REXW;
+            }
+        }
+    }
+
+    tcg_out_mov(s, tlbtype, TCG_REG_L0, addrlo);
+    tcg_out_shifti(s, SHIFT_SHR + tlbrexw, TCG_REG_L0,
+                   TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+
+    tcg_out_modrm_offset(s, OPC_AND_GvEv + trexw, TCG_REG_L0, TCG_AREG0,
+                         TLB_MASK_TABLE_OFS(mem_index) +
+                         offsetof(CPUTLBDescFast, mask));
+
+    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, TCG_REG_L0, TCG_AREG0,
+                         TLB_MASK_TABLE_OFS(mem_index) +
+                         offsetof(CPUTLBDescFast, table));
+
+    /* If the required alignment is at least as large as the access, simply
+       copy the address and mask.  For lesser alignments, check that we don't
+       cross pages for the complete access.  */
+    if (a_bits >= s_bits) {
+        tcg_out_mov(s, ttype, TCG_REG_L1, addrlo);
+    } else {
+        tcg_out_modrm_offset(s, OPC_LEA + trexw, TCG_REG_L1,
+                             addrlo, s_mask - a_mask);
+    }
+    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
+    tgen_arithi(s, ARITH_AND + trexw, TCG_REG_L1, tlb_mask, 0);
+
+    /* cmp 0(TCG_REG_L0), TCG_REG_L1 */
+    tcg_out_modrm_offset(s, OPC_CMP_GvEv + trexw,
+                         TCG_REG_L1, TCG_REG_L0, cmp_ofs);
+
+    /*
+     * Prepare for both the fast path add of the tlb addend, and the slow
+     * path function argument setup.
+     */
+    *h = (HostAddress) {
+        .base = TCG_REG_L1,
+        .index = -1
+    };
+    tcg_out_mov(s, ttype, h->base, addrlo);
+
+    /* jne slow_path */
+    tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
+    ldst->label_ptr[0] = s->code_ptr;
+    s->code_ptr += 4;
+
+    if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
+        /* cmp 4(TCG_REG_L0), addrhi */
+        tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, TCG_REG_L0, cmp_ofs + 4);
+
+        /* jne slow_path */
+        tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
+        ldst->label_ptr[1] = s->code_ptr;
+        s->code_ptr += 4;
+    }
+
+    /* TLB Hit.  */
+
+    /* add addend(TCG_REG_L0), TCG_REG_L1 */
+    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, h->base, TCG_REG_L0,
+                         offsetof(CPUTLBEntry, addend));
+#else
+    if (a_bits) {
+        ldst = new_ldst_label(s);
+
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addrlo;
+        ldst->addrhi_reg = addrhi;
+
+        tcg_out_testi(s, addrlo, a_mask);
+        /* jne slow_path */
+        tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
+        ldst->label_ptr[0] = s->code_ptr;
+        s->code_ptr += 4;
+    }
+
+    *h = x86_guest_base;
+    h->base = addrlo;
+#endif
+
+    return ldst;
+}
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                    HostAddress h, TCGType type, MemOp memop)
 {
@@ -2260,35 +2237,18 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             TCGReg addrlo, TCGReg addrhi,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[2];
+    ldst = prepare_host_addr(s, &h, addrlo, addrhi, oi, true);
+    tcg_out_qemu_ld_direct(s, datalo, datahi, h, data_type, get_memop(oi));
 
-    tcg_out_tlb_load(s, addrlo, addrhi, get_mmuidx(oi), opc,
-                     label_ptr, offsetof(CPUTLBEntry, addr_read));
-
-    /* TLB Hit.  */
-    h.base = TCG_REG_L1;
-    h.index = -1;
-    h.ofs = 0;
-    h.seg = 0;
-    tcg_out_qemu_ld_direct(s, datalo, datahi, h, data_type, opc);
-
-    /* Record the current context of a load into ldst label */
-    add_qemu_ldst_label(s, true, data_type, oi, datalo, datahi,
-                        addrlo, addrhi, s->code_ptr, label_ptr);
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-
-    h = x86_guest_base;
-    h.base = addrlo;
-    tcg_out_qemu_ld_direct(s, datalo, datahi, h, data_type, opc);
-#endif
 }
 
 static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
@@ -2347,36 +2307,18 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
                             TCGReg addrlo, TCGReg addrhi,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp opc = get_memop(oi);
+    TCGLabelQemuLdst *ldst;
     HostAddress h;
 
-#if defined(CONFIG_SOFTMMU)
-    tcg_insn_unit *label_ptr[2];
+    ldst = prepare_host_addr(s, &h, addrlo, addrhi, oi, false);
+    tcg_out_qemu_st_direct(s, datalo, datahi, h, get_memop(oi));
 
-    tcg_out_tlb_load(s, addrlo, addrhi, get_mmuidx(oi), opc,
-                     label_ptr, offsetof(CPUTLBEntry, addr_write));
-
-    /* TLB Hit.  */
-    h.base = TCG_REG_L1;
-    h.index = -1;
-    h.ofs = 0;
-    h.seg = 0;
-    tcg_out_qemu_st_direct(s, datalo, datahi, h, opc);
-
-    /* Record the current context of a store into ldst label */
-    add_qemu_ldst_label(s, false, data_type, oi, datalo, datahi,
-                        addrlo, addrhi, s->code_ptr, label_ptr);
-#else
-    unsigned a_bits = get_alignment_bits(opc);
-    if (a_bits) {
-        tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-
-    h = x86_guest_base;
-    h.base = addrlo;
-
-    tcg_out_qemu_st_direct(s, datalo, datahi, h, opc);
-#endif
 }
 
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
-- 
2.34.1


