Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvCFj-0003xX-8a
	for mharc-qemu-riscv@gnu.org; Sat, 06 May 2023 03:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFg-0003vF-IO
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:22:44 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFc-0004Kd-3W
 for qemu-riscv@nongnu.org; Sat, 06 May 2023 03:22:44 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-306dbad5182so1691280f8f.1
 for <qemu-riscv@nongnu.org>; Sat, 06 May 2023 00:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357758; x=1685949758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m5M2+WQKcwjiryfXWgTk/gb4/3Ri6GYlZz6tIioIz4E=;
 b=H580eDyNZdQANxFU9u3F92q+qXt+UCTuhVQgUcJMgI/TN9yWEiFDtZz79JURnBL06i
 gWdm1EcNkaDlg75x4sgv9pd6yWw+pUbhMT/61RQUUn6/9RPWQv9Ao9+hQ3siBAgHxNNW
 UxCp2s05REe7PLSiArmJ1Fq5+laK2QZL0aZpplTKTwEUxi9/PpIp/u4lxyAIXWhjVlKA
 AJj6jwWZ+MB1css9v7Noz72Zb96O6Bg0fdipE/L4CqhoCQjgCIzTQq78/I26E6E/Z4UA
 aBdWE3oYkMCEGW6RTg6ckWjtYgfrfDEdHjQwWfB+9znd26b4HMMgoVRGOa43+zzWf70g
 l/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357758; x=1685949758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m5M2+WQKcwjiryfXWgTk/gb4/3Ri6GYlZz6tIioIz4E=;
 b=WcN+c5awTZYbBVYn4iF86RVTKfyM/LglnzUxBs3YwmvuEWoW2yk2PDQ5FKO7ZaYwgH
 YEFYMcxONLTpSUYX17AM7DjSDsV2dhJM6YmaigLmukuuW8ua6TmtTw1InbB8jWBc1r3c
 +cfdKB9bkZkouxIZmAEfW5z0jHjfXKkMD77re7i/gedkz7f1jda3ftC9BL5X7937aavV
 W5eugOCQzC4uKh8If5ij1ybDCBtRgym7h9C9lhydBQyU15inEGM+NLxM10bpCD0s4rWU
 6O45soHrkk1hXN+ESFKcHsxVIsp4/zxb7ychMO2kzvKDOh4j34u4KosV6GFbuXKBY3oU
 bIlg==
X-Gm-Message-State: AC+VfDwgiEwpPBnloVDVlBeIWniD0GfHJSDOHWon6XTKPb46EYohbiC1
 eVU7Feq8/YZEv7TcR+MWF9GPjA4+U+5cRJsYXuXRPQ==
X-Google-Smtp-Source: ACHHUZ5aUxmhgpWASvqdHV+ZNasHrWlIETtOMdP2W6RZVYgDd6Fx+IeobYWKB8x/Yy3TAJmPCZ77jA==
X-Received: by 2002:a5d:6081:0:b0:306:46ba:b2f1 with SMTP id
 w1-20020a5d6081000000b0030646bab2f1mr2958441wrt.50.1683357757852; 
 Sat, 06 May 2023 00:22:37 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 01/30] tcg/i386: Introduce prepare_host_addr
Date: Sat,  6 May 2023 08:22:06 +0100
Message-Id: <20230506072235.597467-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Sat, 06 May 2023 07:22:44 -0000

Merge tcg_out_tlb_load, add_qemu_ldst_label,
tcg_out_test_alignment, and some code that lived in both
tcg_out_qemu_ld and tcg_out_qemu_st into one function
that returns HostAddress and TCGLabelQemuLdst structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 344 ++++++++++++++++----------------------
 1 file changed, 143 insertions(+), 201 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index aae698121a..237b154194 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1802,135 +1802,6 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
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
@@ -2061,27 +1932,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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
@@ -2159,6 +2009,133 @@ static inline int setup_guest_base_seg(void)
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
@@ -2258,35 +2235,18 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
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
@@ -2345,36 +2305,18 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
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


