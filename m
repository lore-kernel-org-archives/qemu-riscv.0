Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prORg-0005TX-1a
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORe-0005Qs-9x
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:35:22 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORN-0005An-TY
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:35:20 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4edc63c82d1so6339205e87.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451301; x=1685043301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8KAB/H13Cm0D6bHkoWgDoGCikvqnWURt7Ewb7NyDsZI=;
 b=Ne9UO96Rm2ak6T6Gm74G8opSOPHc2dH89usifEEJZUk7Yzg2NPpTT1digHd+qVPDu1
 +6WSIbfsLUgX1A6/fclLbd1gvSsaOT06x3ZvrV5q66WPQvpQPm5kAkanmtogA0fPjf+W
 1LjdhilzDZmzZeXRHaBGdUpUbANA7HeF9XQ5QJSzokV4JOkEcCTgRzU/CJ8MKw4PVbG5
 9bMwvu/IoqzOk5wVU6zh9nQiyWsJcVaighpMANQwAWMvdZbpmdw53mL2lWj8f2qvyJvW
 ndteh6z08sorxn/KYMICDwqvmWhYW7y58M1ECqoVI3sEthrY4Bfxnb9HD2+WRywpecT2
 VaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451301; x=1685043301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8KAB/H13Cm0D6bHkoWgDoGCikvqnWURt7Ewb7NyDsZI=;
 b=SW+zWyzrdn7U2nwtUPS3SNukyop+kc6WsPsj2z91dp2tPHGGnIv/E5A5AIYUxxcked
 CFJvrNnE5NUfDekXwLzLM5vVzwh5LJc+hMsZQaHlLf/R7yel8BKaFPqWIWmVslCWeltn
 iP0SibiFKIp/JVF2qzH+jzP8Dv1j1k+UlO+30K/mYlhmy1gMhKvv7Ch/rXXImKPslHqJ
 1c+Z5uiBAfVwWztXjpoBHRDg9X1ooW6Ah43vQGGPrdC5oHzdpt+CtEm3IbVeZzPpFEoG
 UlkV8krfzHRQvIRTDz9QD19avgceJnykXM37BkmNZhU9tFPrIyxyQIPdnIBkGNRX+lA8
 nGyg==
X-Gm-Message-State: AAQBX9fEbw8mpPS6PtY7ggmOi8xaJmGy9VrnzhOqVbRIWYg+guBNNQNU
 t3EPkotem+Dk6vTKhxyYhJHQEA==
X-Google-Smtp-Source: AKy350ZtIAz0j6OBSU1Hhj9WvXZKvYl1alFzKxJTbRUANg4Ip/wzo25QHa+f81Ze0Co8FlYqt5x3rA==
X-Received: by 2002:ac2:50c4:0:b0:4ed:cb37:7d8c with SMTP id
 h4-20020ac250c4000000b004edcb377d8cmr4690621lfm.67.1682451301105; 
 Tue, 25 Apr 2023 12:35:01 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:35:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 34/57] tcg/sparc64: Use standard slow path for softmmu
Date: Tue, 25 Apr 2023 20:31:23 +0100
Message-Id: <20230425193146.2106111-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x136.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:35:22 -0000

Drop the target-specific trampolines for the standard slow path.
This lets us use tcg_out_helper_{ld,st}_args, and handles the new
atomicity bits within MemOp.

At the same time, use the full load/store helpers for user-only mode.
Drop inline unaligned access support for user-only mode, as it does
not handle atomicity.

Use TCG_REG_T[1-3] in the tlb lookup, instead of TCG_REG_O[0-2].
This allows the constraints to be simplified.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target-con-set.h |   2 -
 tcg/sparc64/tcg-target-con-str.h |   1 -
 tcg/sparc64/tcg-target.h         |   1 +
 tcg/sparc64/tcg-target.c.inc     | 610 +++++++++----------------------
 4 files changed, 182 insertions(+), 432 deletions(-)

diff --git a/tcg/sparc64/tcg-target-con-set.h b/tcg/sparc64/tcg-target-con-set.h
index 31e6fea1fc..434bf25072 100644
--- a/tcg/sparc64/tcg-target-con-set.h
+++ b/tcg/sparc64/tcg-target-con-set.h
@@ -12,8 +12,6 @@
 C_O0_I1(r)
 C_O0_I2(rZ, r)
 C_O0_I2(rZ, rJ)
-C_O0_I2(sZ, s)
-C_O1_I1(r, s)
 C_O1_I1(r, r)
 C_O1_I2(r, r, r)
 C_O1_I2(r, rZ, rJ)
diff --git a/tcg/sparc64/tcg-target-con-str.h b/tcg/sparc64/tcg-target-con-str.h
index 8f5c7aef97..0577ec4942 100644
--- a/tcg/sparc64/tcg-target-con-str.h
+++ b/tcg/sparc64/tcg-target-con-str.h
@@ -9,7 +9,6 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
-REGS('s', ALL_QLDST_REGS)
 
 /*
  * Define constraint letters for constants:
diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index ffe22b1d21..7434cc99d4 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -155,6 +155,7 @@ extern bool use_vis3_instructions;
 
 #define TCG_TARGET_DEFAULT_MO (0)
 #define TCG_TARGET_HAS_MEMORY_BSWAP     1
+#define TCG_TARGET_NEED_LDST_LABELS
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #endif
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 4375a06377..0237188d65 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -27,6 +27,7 @@
 #error "unsupported code generation mode"
 #endif
 
+#include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 
 #ifdef CONFIG_DEBUG_TCG
@@ -70,18 +71,7 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 #define TCG_CT_CONST_S13  0x200
 #define TCG_CT_CONST_ZERO 0x400
 
-/*
- * For softmmu, we need to avoid conflicts with the first 3
- * argument registers to perform the tlb lookup, and to call
- * the helper function.
- */
-#ifdef CONFIG_SOFTMMU
-#define SOFTMMU_RESERVE_REGS MAKE_64BIT_MASK(TCG_REG_O0, 3)
-#else
-#define SOFTMMU_RESERVE_REGS 0
-#endif
-#define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
-#define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
+#define ALL_GENERAL_REGS  MAKE_64BIT_MASK(0, 32)
 
 /* Define some temporary registers.  T3 is used for constant generation.  */
 #define TCG_REG_T1  TCG_REG_G1
@@ -918,82 +908,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
     tcg_out32(s, MEMBAR | (a0 & TCG_MO_ALL));
 }
 
-#ifdef CONFIG_SOFTMMU
-static const tcg_insn_unit *qemu_ld_trampoline[MO_SSIZE + 1];
-static const tcg_insn_unit *qemu_st_trampoline[MO_SIZE + 1];
-
-static void build_trampolines(TCGContext *s)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(qemu_ld_helpers); ++i) {
-        if (qemu_ld_helpers[i] == NULL) {
-            continue;
-        }
-
-        /* May as well align the trampoline.  */
-        while ((uintptr_t)s->code_ptr & 15) {
-            tcg_out_nop(s);
-        }
-        qemu_ld_trampoline[i] = tcg_splitwx_to_rx(s->code_ptr);
-
-        /* Set the retaddr operand.  */
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O3, TCG_REG_O7);
-        /* Tail call.  */
-        tcg_out_jmpl_const(s, qemu_ld_helpers[i], true, true);
-        /* delay slot -- set the env argument */
-        tcg_out_mov_delay(s, TCG_REG_O0, TCG_AREG0);
-    }
-
-    for (i = 0; i < ARRAY_SIZE(qemu_st_helpers); ++i) {
-        if (qemu_st_helpers[i] == NULL) {
-            continue;
-        }
-
-        /* May as well align the trampoline.  */
-        while ((uintptr_t)s->code_ptr & 15) {
-            tcg_out_nop(s);
-        }
-        qemu_st_trampoline[i] = tcg_splitwx_to_rx(s->code_ptr);
-
-        /* Set the retaddr operand.  */
-        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O4, TCG_REG_O7);
-
-        /* Tail call.  */
-        tcg_out_jmpl_const(s, qemu_st_helpers[i], true, true);
-        /* delay slot -- set the env argument */
-        tcg_out_mov_delay(s, TCG_REG_O0, TCG_AREG0);
-    }
-}
-#else
-static const tcg_insn_unit *qemu_unalign_ld_trampoline;
-static const tcg_insn_unit *qemu_unalign_st_trampoline;
-
-static void build_trampolines(TCGContext *s)
-{
-    for (int ld = 0; ld < 2; ++ld) {
-        void *helper;
-
-        while ((uintptr_t)s->code_ptr & 15) {
-            tcg_out_nop(s);
-        }
-
-        if (ld) {
-            helper = helper_unaligned_ld;
-            qemu_unalign_ld_trampoline = tcg_splitwx_to_rx(s->code_ptr);
-        } else {
-            helper = helper_unaligned_st;
-            qemu_unalign_st_trampoline = tcg_splitwx_to_rx(s->code_ptr);
-        }
-
-        /* Tail call.  */
-        tcg_out_jmpl_const(s, helper, true, true);
-        /* delay slot -- set the env argument */
-        tcg_out_mov_delay(s, TCG_REG_O0, TCG_AREG0);
-    }
-}
-#endif
-
 /* Generate global QEMU prologue and epilogue code */
 static void tcg_target_qemu_prologue(TCGContext *s)
 {
@@ -1039,8 +953,6 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out_arithi(s, TCG_REG_G0, TCG_REG_I7, 8, RETURN);
     /* delay slot */
     tcg_out_movi_s13(s, TCG_REG_O0, 0);
-
-    build_trampolines(s);
 }
 
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
@@ -1051,381 +963,224 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
     }
 }
 
-#if defined(CONFIG_SOFTMMU)
+static const TCGLdstHelperParam ldst_helper_param = {
+    .ntmp = 1, .tmp = { TCG_REG_T1 }
+};
 
-/* We expect to use a 13-bit negative offset from ENV.  */
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
-QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 12));
-
-/* Perform the TLB load and compare.
-
-   Inputs:
-   ADDRLO and ADDRHI contain the possible two parts of the address.
-
-   MEM_INDEX and S_BITS are the memory context and log2 size of the load.
-
-   WHICH is the offset into the CPUTLBEntry structure of the slot to read.
-   This should be offsetof addr_read or addr_write.
-
-   The result of the TLB comparison is in %[ix]cc.  The sanitized address
-   is in the returned register, maybe %o0.  The TLB addend is in %o1.  */
-
-static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addr, int mem_index,
-                               MemOp opc, int which)
+static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 {
+    MemOp opc = get_memop(lb->oi);
+    MemOp sgn;
+
+    if (!patch_reloc(lb->label_ptr[0], R_SPARC_WDISP19,
+                     (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 0)) {
+        return false;
+    }
+
+    /* Use inline tcg_out_ext32s; otherwise let the helper sign-extend. */
+    sgn = (opc & MO_SIZE) < MO_32 ? MO_SIGN : 0;
+
+    tcg_out_ld_helper_args(s, lb, &ldst_helper_param);
+    tcg_out_call(s, qemu_ld_helpers[opc & (MO_SIZE | sgn)], NULL);
+    tcg_out_ld_helper_ret(s, lb, sgn, &ldst_helper_param);
+
+    tcg_out_bpcc0(s, COND_A, BPCC_A | BPCC_PT, 0);
+    return patch_reloc(s->code_ptr - 1, R_SPARC_WDISP19,
+                       (intptr_t)lb->raddr, 0);
+}
+
+static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
+{
+    MemOp opc = get_memop(lb->oi);
+
+    if (!patch_reloc(lb->label_ptr[0], R_SPARC_WDISP19,
+                     (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 0)) {
+        return false;
+    }
+
+    tcg_out_st_helper_args(s, lb, &ldst_helper_param);
+    tcg_out_call(s, qemu_st_helpers[opc & MO_SIZE], NULL);
+
+    tcg_out_bpcc0(s, COND_A, BPCC_A | BPCC_PT, 0);
+    return patch_reloc(s->code_ptr - 1, R_SPARC_WDISP19,
+                       (intptr_t)lb->raddr, 0);
+}
+
+typedef struct {
+    TCGReg base;
+    TCGReg index;
+} HostAddress;
+
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
+    unsigned s_bits = opc & MO_SIZE;
+    unsigned a_mask;
+
+    /* We don't support unaligned accesses. */
+    a_bits = MAX(a_bits, s_bits);
+    a_mask = (1u << a_bits) - 1;
+
+#ifdef CONFIG_SOFTMMU
+    int mem_index = get_mmuidx(oi);
     int fast_off = TLB_MASK_TABLE_OFS(mem_index);
     int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
     int table_off = fast_off + offsetof(CPUTLBDescFast, table);
-    const TCGReg r0 = TCG_REG_O0;
-    const TCGReg r1 = TCG_REG_O1;
-    const TCGReg r2 = TCG_REG_O2;
-    unsigned s_bits = opc & MO_SIZE;
-    unsigned a_bits = get_alignment_bits(opc);
-    tcg_target_long compare_mask;
+    int cmp_off = is_ld ? offsetof(CPUTLBEntry, addr_read)
+                        : offsetof(CPUTLBEntry, addr_write);
+    int add_off = offsetof(CPUTLBEntry, addend);
+    int compare_mask;
+    int cc;
 
     /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
-    tcg_out_ld(s, TCG_TYPE_PTR, r0, TCG_AREG0, mask_off);
-    tcg_out_ld(s, TCG_TYPE_PTR, r1, TCG_AREG0, table_off);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
+    QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 12));
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_T2, TCG_AREG0, mask_off);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_T3, TCG_AREG0, table_off);
 
     /* Extract the page index, shifted into place for tlb index.  */
-    tcg_out_arithi(s, r2, addr, TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS,
-                   SHIFT_SRL);
-    tcg_out_arith(s, r2, r2, r0, ARITH_AND);
+    tcg_out_arithi(s, TCG_REG_T1, addr_reg,
+                   TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS, SHIFT_SRL);
+    tcg_out_arith(s, TCG_REG_T1, TCG_REG_T1, TCG_REG_T2, ARITH_AND);
 
     /* Add the tlb_table pointer, creating the CPUTLBEntry address into R2.  */
-    tcg_out_arith(s, r2, r2, r1, ARITH_ADD);
+    tcg_out_arith(s, TCG_REG_T1, TCG_REG_T1, TCG_REG_T3, ARITH_ADD);
 
-    /* Load the tlb comparator and the addend.  */
-    tcg_out_ld(s, TCG_TYPE_TL, r0, r2, which);
-    tcg_out_ld(s, TCG_TYPE_PTR, r1, r2, offsetof(CPUTLBEntry, addend));
+    /* Load the tlb comparator and the addend. */
+    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_T2, TCG_REG_T1, cmp_off);
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_T1, TCG_REG_T1, add_off);
+    h->base = TCG_REG_T1;
 
-    /* Mask out the page offset, except for the required alignment.
-       We don't support unaligned accesses.  */
-    if (a_bits < s_bits) {
-        a_bits = s_bits;
-    }
-    compare_mask = (tcg_target_ulong)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
+    /* Mask out the page offset, except for the required alignment. */
+    compare_mask = TARGET_PAGE_MASK | a_mask;
     if (check_fit_tl(compare_mask, 13)) {
-        tcg_out_arithi(s, r2, addr, compare_mask, ARITH_AND);
+        tcg_out_arithi(s, TCG_REG_T3, addr_reg, compare_mask, ARITH_AND);
     } else {
-        tcg_out_movi(s, TCG_TYPE_TL, r2, compare_mask);
-        tcg_out_arith(s, r2, addr, r2, ARITH_AND);
+        tcg_out_movi_s32(s, TCG_REG_T3, compare_mask);
+        tcg_out_arith(s, TCG_REG_T3, addr_reg, TCG_REG_T3, ARITH_AND);
     }
-    tcg_out_cmp(s, r0, r2, 0);
+    tcg_out_cmp(s, TCG_REG_T2, TCG_REG_T3, 0);
 
-    /* If the guest address must be zero-extended, do so now.  */
+    ldst = new_ldst_label(s);
+    ldst->is_ld = is_ld;
+    ldst->oi = oi;
+    ldst->addrlo_reg = addr_reg;
+    ldst->label_ptr[0] = s->code_ptr;
+
+    /* bne,pn %[xi]cc, label0 */
+    cc = TARGET_LONG_BITS == 64 ? BPCC_XCC : BPCC_ICC;
+    tcg_out_bpcc0(s, COND_NE, BPCC_PN | cc, 0);
+#else
+    if (a_bits != s_bits) {
+        /*
+         * Test for at least natural alignment, and defer
+         * everything else to the helper functions.
+         */
+        tcg_debug_assert(check_fit_tl(a_mask, 13));
+        tcg_out_arithi(s, TCG_REG_G0, addr_reg, a_mask, ARITH_ANDCC);
+
+        ldst = new_ldst_label(s);
+        ldst->is_ld = is_ld;
+        ldst->oi = oi;
+        ldst->addrlo_reg = addr_reg;
+        ldst->label_ptr[0] = s->code_ptr;
+
+        /* bne,pn %icc, label0 */
+        tcg_out_bpcc0(s, COND_NE, BPCC_PN | BPCC_ICC, 0);
+    }
+    h->base = guest_base ? TCG_GUEST_BASE_REG : TCG_REG_G0;
+#endif
+
+    /* If the guest address must be zero-extended, do in the delay slot.  */
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, r0, addr);
-        return r0;
+        tcg_out_ext32u(s, TCG_REG_T2, addr_reg);
+        h->index = TCG_REG_T2;
+    } else {
+        if (ldst) {
+            tcg_out_nop(s);
+        }
+        h->index = addr_reg;
     }
-    return addr;
+    return ldst;
 }
-#endif /* CONFIG_SOFTMMU */
-
-static const int qemu_ld_opc[(MO_SSIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = LDUB,
-    [MO_SB]   = LDSB,
-    [MO_UB | MO_LE] = LDUB,
-    [MO_SB | MO_LE] = LDSB,
-
-    [MO_BEUW] = LDUH,
-    [MO_BESW] = LDSH,
-    [MO_BEUL] = LDUW,
-    [MO_BESL] = LDSW,
-    [MO_BEUQ] = LDX,
-    [MO_BESQ] = LDX,
-
-    [MO_LEUW] = LDUH_LE,
-    [MO_LESW] = LDSH_LE,
-    [MO_LEUL] = LDUW_LE,
-    [MO_LESL] = LDSW_LE,
-    [MO_LEUQ] = LDX_LE,
-    [MO_LESQ] = LDX_LE,
-};
-
-static const int qemu_st_opc[(MO_SIZE | MO_BSWAP) + 1] = {
-    [MO_UB]   = STB,
-
-    [MO_BEUW] = STH,
-    [MO_BEUL] = STW,
-    [MO_BEUQ] = STX,
-
-    [MO_LEUW] = STH_LE,
-    [MO_LEUL] = STW_LE,
-    [MO_LEUQ] = STX_LE,
-};
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp memop = get_memop(oi);
-    tcg_insn_unit *label_ptr;
+    static const int ld_opc[(MO_SSIZE | MO_BSWAP) + 1] = {
+        [MO_UB]   = LDUB,
+        [MO_SB]   = LDSB,
+        [MO_UB | MO_LE] = LDUB,
+        [MO_SB | MO_LE] = LDSB,
 
-#ifdef CONFIG_SOFTMMU
-    unsigned memi = get_mmuidx(oi);
-    TCGReg addrz;
-    const tcg_insn_unit *func;
+        [MO_BEUW] = LDUH,
+        [MO_BESW] = LDSH,
+        [MO_BEUL] = LDUW,
+        [MO_BESL] = LDSW,
+        [MO_BEUQ] = LDX,
+        [MO_BESQ] = LDX,
 
-    addrz = tcg_out_tlb_load(s, addr, memi, memop,
-                             offsetof(CPUTLBEntry, addr_read));
+        [MO_LEUW] = LDUH_LE,
+        [MO_LESW] = LDSH_LE,
+        [MO_LEUL] = LDUW_LE,
+        [MO_LESL] = LDSW_LE,
+        [MO_LEUQ] = LDX_LE,
+        [MO_LESQ] = LDX_LE,
+    };
 
-    /* The fast path is exactly one insn.  Thus we can perform the
-       entire TLB Hit in the (annulled) delay slot of the branch
-       over the TLB Miss case.  */
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
 
-    /* beq,a,pt %[xi]cc, label0 */
-    label_ptr = s->code_ptr;
-    tcg_out_bpcc0(s, COND_E, BPCC_A | BPCC_PT
-                  | (TARGET_LONG_BITS == 64 ? BPCC_XCC : BPCC_ICC), 0);
-    /* delay slot */
-    tcg_out_ldst_rr(s, data, addrz, TCG_REG_O1,
-                    qemu_ld_opc[memop & (MO_BSWAP | MO_SSIZE)]);
+    ldst = prepare_host_addr(s, &h, addr, oi, true);
 
-    /* TLB Miss.  */
+    tcg_out_ldst_rr(s, data, h.base, h.index,
+                    ld_opc[get_memop(oi) & (MO_BSWAP | MO_SSIZE)]);
 
-    tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O1, addrz);
-
-    /* We use the helpers to extend SB and SW data, leaving the case
-       of SL needing explicit extending below.  */
-    if ((memop & MO_SSIZE) == MO_SL) {
-        func = qemu_ld_trampoline[MO_UL];
-    } else {
-        func = qemu_ld_trampoline[memop & MO_SSIZE];
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-    tcg_debug_assert(func != NULL);
-    tcg_out_call_nodelay(s, func, false);
-    /* delay slot */
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_O2, oi);
-
-    /* We let the helper sign-extend SB and SW, but leave SL for here.  */
-    if ((memop & MO_SSIZE) == MO_SL) {
-        tcg_out_ext32s(s, data, TCG_REG_O0);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_REG, data, TCG_REG_O0);
-    }
-
-    *label_ptr |= INSN_OFF19(tcg_ptr_byte_diff(s->code_ptr, label_ptr));
-#else
-    TCGReg index = (guest_base ? TCG_GUEST_BASE_REG : TCG_REG_G0);
-    unsigned a_bits = get_alignment_bits(memop);
-    unsigned s_bits = memop & MO_SIZE;
-    unsigned t_bits;
-
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_T1, addr);
-        addr = TCG_REG_T1;
-    }
-
-    /*
-     * Normal case: alignment equal to access size.
-     */
-    if (a_bits == s_bits) {
-        tcg_out_ldst_rr(s, data, addr, index,
-                        qemu_ld_opc[memop & (MO_BSWAP | MO_SSIZE)]);
-        return;
-    }
-
-    /*
-     * Test for at least natural alignment, and assume most accesses
-     * will be aligned -- perform a straight load in the delay slot.
-     * This is required to preserve atomicity for aligned accesses.
-     */
-    t_bits = MAX(a_bits, s_bits);
-    tcg_debug_assert(t_bits < 13);
-    tcg_out_arithi(s, TCG_REG_G0, addr, (1u << t_bits) - 1, ARITH_ANDCC);
-
-    /* beq,a,pt %icc, label */
-    label_ptr = s->code_ptr;
-    tcg_out_bpcc0(s, COND_E, BPCC_A | BPCC_PT | BPCC_ICC, 0);
-    /* delay slot */
-    tcg_out_ldst_rr(s, data, addr, index,
-                    qemu_ld_opc[memop & (MO_BSWAP | MO_SSIZE)]);
-
-    if (a_bits >= s_bits) {
-        /*
-         * Overalignment: A successful alignment test will perform the memory
-         * operation in the delay slot, and failure need only invoke the
-         * handler for SIGBUS.
-         */
-        tcg_out_call_nodelay(s, qemu_unalign_ld_trampoline, false);
-        /* delay slot -- move to low part of argument reg */
-        tcg_out_mov_delay(s, TCG_REG_O1, addr);
-    } else {
-        /* Underalignment: load by pieces of minimum alignment. */
-        int ld_opc, a_size, s_size, i;
-
-        /*
-         * Force full address into T1 early; avoids problems with
-         * overlap between @addr and @data.
-         */
-        tcg_out_arith(s, TCG_REG_T1, addr, index, ARITH_ADD);
-
-        a_size = 1 << a_bits;
-        s_size = 1 << s_bits;
-        if ((memop & MO_BSWAP) == MO_BE) {
-            ld_opc = qemu_ld_opc[a_bits | MO_BE | (memop & MO_SIGN)];
-            tcg_out_ldst(s, data, TCG_REG_T1, 0, ld_opc);
-            ld_opc = qemu_ld_opc[a_bits | MO_BE];
-            for (i = a_size; i < s_size; i += a_size) {
-                tcg_out_ldst(s, TCG_REG_T2, TCG_REG_T1, i, ld_opc);
-                tcg_out_arithi(s, data, data, a_size, SHIFT_SLLX);
-                tcg_out_arith(s, data, data, TCG_REG_T2, ARITH_OR);
-            }
-        } else if (a_bits == 0) {
-            ld_opc = LDUB;
-            tcg_out_ldst(s, data, TCG_REG_T1, 0, ld_opc);
-            for (i = a_size; i < s_size; i += a_size) {
-                if ((memop & MO_SIGN) && i == s_size - a_size) {
-                    ld_opc = LDSB;
-                }
-                tcg_out_ldst(s, TCG_REG_T2, TCG_REG_T1, i, ld_opc);
-                tcg_out_arithi(s, TCG_REG_T2, TCG_REG_T2, i * 8, SHIFT_SLLX);
-                tcg_out_arith(s, data, data, TCG_REG_T2, ARITH_OR);
-            }
-        } else {
-            ld_opc = qemu_ld_opc[a_bits | MO_LE];
-            tcg_out_ldst_rr(s, data, TCG_REG_T1, TCG_REG_G0, ld_opc);
-            for (i = a_size; i < s_size; i += a_size) {
-                tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, a_size, ARITH_ADD);
-                if ((memop & MO_SIGN) && i == s_size - a_size) {
-                    ld_opc = qemu_ld_opc[a_bits | MO_LE | MO_SIGN];
-                }
-                tcg_out_ldst_rr(s, TCG_REG_T2, TCG_REG_T1, TCG_REG_G0, ld_opc);
-                tcg_out_arithi(s, TCG_REG_T2, TCG_REG_T2, i * 8, SHIFT_SLLX);
-                tcg_out_arith(s, data, data, TCG_REG_T2, ARITH_OR);
-            }
-        }
-    }
-
-    *label_ptr |= INSN_OFF19(tcg_ptr_byte_diff(s->code_ptr, label_ptr));
-#endif /* CONFIG_SOFTMMU */
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
                             MemOpIdx oi, TCGType data_type)
 {
-    MemOp memop = get_memop(oi);
-    tcg_insn_unit *label_ptr;
+    static const int st_opc[(MO_SIZE | MO_BSWAP) + 1] = {
+        [MO_UB]   = STB,
 
-#ifdef CONFIG_SOFTMMU
-    unsigned memi = get_mmuidx(oi);
-    TCGReg addrz;
-    const tcg_insn_unit *func;
+        [MO_BEUW] = STH,
+        [MO_BEUL] = STW,
+        [MO_BEUQ] = STX,
 
-    addrz = tcg_out_tlb_load(s, addr, memi, memop,
-                             offsetof(CPUTLBEntry, addr_write));
+        [MO_LEUW] = STH_LE,
+        [MO_LEUL] = STW_LE,
+        [MO_LEUQ] = STX_LE,
+    };
 
-    /* The fast path is exactly one insn.  Thus we can perform the entire
-       TLB Hit in the (annulled) delay slot of the branch over TLB Miss.  */
-    /* beq,a,pt %[xi]cc, label0 */
-    label_ptr = s->code_ptr;
-    tcg_out_bpcc0(s, COND_E, BPCC_A | BPCC_PT
-                  | (TARGET_LONG_BITS == 64 ? BPCC_XCC : BPCC_ICC), 0);
-    /* delay slot */
-    tcg_out_ldst_rr(s, data, addrz, TCG_REG_O1,
-                    qemu_st_opc[memop & (MO_BSWAP | MO_SIZE)]);
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
 
-    /* TLB Miss.  */
+    ldst = prepare_host_addr(s, &h, addr, oi, false);
 
-    tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O1, addrz);
-    tcg_out_movext(s, (memop & MO_SIZE) == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                   TCG_REG_O2, data_type, memop & MO_SIZE, data);
+    tcg_out_ldst_rr(s, data, h.base, h.index,
+                    st_opc[get_memop(oi) & (MO_BSWAP | MO_SIZE)]);
 
-    func = qemu_st_trampoline[memop & MO_SIZE];
-    tcg_debug_assert(func != NULL);
-    tcg_out_call_nodelay(s, func, false);
-    /* delay slot */
-    tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_O3, oi);
-
-    *label_ptr |= INSN_OFF19(tcg_ptr_byte_diff(s->code_ptr, label_ptr));
-#else
-    TCGReg index = (guest_base ? TCG_GUEST_BASE_REG : TCG_REG_G0);
-    unsigned a_bits = get_alignment_bits(memop);
-    unsigned s_bits = memop & MO_SIZE;
-    unsigned t_bits;
-
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_T1, addr);
-        addr = TCG_REG_T1;
+    if (ldst) {
+        ldst->type = data_type;
+        ldst->datalo_reg = data;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
     }
-
-    /*
-     * Normal case: alignment equal to access size.
-     */
-    if (a_bits == s_bits) {
-        tcg_out_ldst_rr(s, data, addr, index,
-                        qemu_st_opc[memop & (MO_BSWAP | MO_SIZE)]);
-        return;
-    }
-
-    /*
-     * Test for at least natural alignment, and assume most accesses
-     * will be aligned -- perform a straight store in the delay slot.
-     * This is required to preserve atomicity for aligned accesses.
-     */
-    t_bits = MAX(a_bits, s_bits);
-    tcg_debug_assert(t_bits < 13);
-    tcg_out_arithi(s, TCG_REG_G0, addr, (1u << t_bits) - 1, ARITH_ANDCC);
-
-    /* beq,a,pt %icc, label */
-    label_ptr = s->code_ptr;
-    tcg_out_bpcc0(s, COND_E, BPCC_A | BPCC_PT | BPCC_ICC, 0);
-    /* delay slot */
-    tcg_out_ldst_rr(s, data, addr, index,
-                    qemu_st_opc[memop & (MO_BSWAP | MO_SIZE)]);
-
-    if (a_bits >= s_bits) {
-        /*
-         * Overalignment: A successful alignment test will perform the memory
-         * operation in the delay slot, and failure need only invoke the
-         * handler for SIGBUS.
-         */
-        tcg_out_call_nodelay(s, qemu_unalign_st_trampoline, false);
-        /* delay slot -- move to low part of argument reg */
-        tcg_out_mov_delay(s, TCG_REG_O1, addr);
-    } else {
-        /* Underalignment: store by pieces of minimum alignment. */
-        int st_opc, a_size, s_size, i;
-
-        /*
-         * Force full address into T1 early; avoids problems with
-         * overlap between @addr and @data.
-         */
-        tcg_out_arith(s, TCG_REG_T1, addr, index, ARITH_ADD);
-
-        a_size = 1 << a_bits;
-        s_size = 1 << s_bits;
-        if ((memop & MO_BSWAP) == MO_BE) {
-            st_opc = qemu_st_opc[a_bits | MO_BE];
-            for (i = 0; i < s_size; i += a_size) {
-                TCGReg d = data;
-                int shift = (s_size - a_size - i) * 8;
-                if (shift) {
-                    d = TCG_REG_T2;
-                    tcg_out_arithi(s, d, data, shift, SHIFT_SRLX);
-                }
-                tcg_out_ldst(s, d, TCG_REG_T1, i, st_opc);
-            }
-        } else if (a_bits == 0) {
-            tcg_out_ldst(s, data, TCG_REG_T1, 0, STB);
-            for (i = 1; i < s_size; i++) {
-                tcg_out_arithi(s, TCG_REG_T2, data, i * 8, SHIFT_SRLX);
-                tcg_out_ldst(s, TCG_REG_T2, TCG_REG_T1, i, STB);
-            }
-        } else {
-            /* Note that ST*A with immediate asi must use indexed address. */
-            st_opc = qemu_st_opc[a_bits + MO_LE];
-            tcg_out_ldst_rr(s, data, TCG_REG_T1, TCG_REG_G0, st_opc);
-            for (i = a_size; i < s_size; i += a_size) {
-                tcg_out_arithi(s, TCG_REG_T2, data, i * 8, SHIFT_SRLX);
-                tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, a_size, ARITH_ADD);
-                tcg_out_ldst_rr(s, TCG_REG_T2, TCG_REG_T1, TCG_REG_G0, st_opc);
-            }
-        }
-    }
-
-    *label_ptr |= INSN_OFF19(tcg_ptr_byte_diff(s->code_ptr, label_ptr));
-#endif /* CONFIG_SOFTMMU */
 }
 
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
@@ -1744,6 +1499,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extu_i32_i64:
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_extrh_i64_i32:
+    case INDEX_op_qemu_ld_i32:
+    case INDEX_op_qemu_ld_i64:
         return C_O1_I1(r, r);
 
     case INDEX_op_st8_i32:
@@ -1753,6 +1510,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st_i32:
     case INDEX_op_st32_i64:
     case INDEX_op_st_i64:
+    case INDEX_op_qemu_st_i32:
+    case INDEX_op_qemu_st_i64:
         return C_O0_I2(rZ, r);
 
     case INDEX_op_add_i32:
@@ -1802,13 +1561,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_muluh_i64:
         return C_O1_I2(r, r, r);
 
-    case INDEX_op_qemu_ld_i32:
-    case INDEX_op_qemu_ld_i64:
-        return C_O1_I1(r, s);
-    case INDEX_op_qemu_st_i32:
-    case INDEX_op_qemu_st_i64:
-        return C_O0_I2(sZ, s);
-
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


