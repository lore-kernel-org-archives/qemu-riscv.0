Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOZc-0000up-Du
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOZb-0000id-3m
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:43:35 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOZK-0007fL-0R
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:43:34 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4eff50911bfso2633715e87.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451795; x=1685043795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52kj+hgoN8ybqKBx/aqOlA/DoCWot5p7JjaerE/ZwRE=;
 b=IAK13Nq6huL8F/i4Hg6sFxU/BkZrxrnejvFRx8+/c52EgE39gU3AHhNzzXZjrjdUlA
 jvuaWwwe1ghFxYlg2Jo2U96vT4Pz9C0F8jIkmdLQYVuKI9OaWkODWoerq3jK+jEBi+fK
 axzgpMp1BDehYgEJnUcBFiXunYl7Ms4LaDRoM/lq6DjnHBtrBgKXXPPSuR41o03+YBQt
 MOpqk/BtJQddGHNO7YJn+WhS9E83FU2+1RqzyZcT2cLIHQQwtQpyH12Ot7qGixXFPD2K
 YOBeY5GwAs3E2I8O2YpRAHsLWJLvqWOZiWPnRA4i74jZdAlkcPVnj1Wg2qUSgtMEKxAS
 FCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451795; x=1685043795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=52kj+hgoN8ybqKBx/aqOlA/DoCWot5p7JjaerE/ZwRE=;
 b=Dl//ncvf3T/TTn5DIVIPxxIRTQkLEYTB/95zleQbyJ6NTlBuosQ7vm8kx2IZ7zilH0
 ar2fHTHXq9Kr32wimh150M5UmT4gUhN4t0KiAI3C7eE/k5a8mrsNA4lNWEmEonDhDxSU
 g7pDuO1K7T5M6dV42TWXOBNy3YDt9Ug+RZGyxTJ1LRnEpBZsrcpdEbx/HaYrZM82XudI
 h9T5z4ZzPvtKKWeviITWR92DEXa5wVHjJBCak2QvA05ouYtU4sbirCEyt5joUfved4rq
 DtLV8U4DfZ6eIFNC32syp7LwPjgrfuyxmpZ8jdpIvG4oXIvqLEBy3H/6RTfS5EwYrlNt
 K2yw==
X-Gm-Message-State: AAQBX9dLrCYTVbTWq200REiat3Q+7OGkvF7tLIO0kxY07Gf8VT3CFedf
 GRnViTWowftvHyJCXOOgumTquw==
X-Google-Smtp-Source: AKy350YYSPO6zeXYfF3mXny8yv8l4S9vXCVe/n7SYXC22IW9WysfGC7MKuCPtNbpkUyJB9m32PAFvA==
X-Received: by 2002:ac2:44cb:0:b0:4ec:8d71:e997 with SMTP id
 d11-20020ac244cb000000b004ec8d71e997mr4481453lfm.19.1682451794760; 
 Tue, 25 Apr 2023 12:43:14 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac25448000000b004ec55ac6cd1sm2175662lfn.136.2023.04.25.12.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:43:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 56/57] tcg/ppc: Support 128-bit load/store
Date: Tue, 25 Apr 2023 20:31:45 +0100
Message-Id: <20230425193146.2106111-57-richard.henderson@linaro.org>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 25 Apr 2023 19:43:35 -0000

Use LQ/STQ with ISA v2.07, and 16-byte atomicity is required.
Note that these instructions do not require 16-byte alignment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-set.h |   2 +
 tcg/ppc/tcg-target-con-str.h |   1 +
 tcg/ppc/tcg-target.h         |   3 +-
 tcg/ppc/tcg-target.c.inc     | 173 +++++++++++++++++++++++++++++++----
 4 files changed, 158 insertions(+), 21 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-set.h b/tcg/ppc/tcg-target-con-set.h
index f206b29205..bbd7b21247 100644
--- a/tcg/ppc/tcg-target-con-set.h
+++ b/tcg/ppc/tcg-target-con-set.h
@@ -14,6 +14,7 @@ C_O0_I2(r, r)
 C_O0_I2(r, ri)
 C_O0_I2(v, r)
 C_O0_I3(r, r, r)
+C_O0_I3(o, m, r)
 C_O0_I4(r, r, ri, ri)
 C_O0_I4(r, r, r, r)
 C_O1_I1(r, r)
@@ -34,6 +35,7 @@ C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, rZ, rZ)
 C_O1_I4(r, r, r, ri, ri)
 C_O2_I1(r, r, r)
+C_O2_I1(o, m, r)
 C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, rI, rZM, r, r)
 C_O2_I4(r, r, r, r, rI, rZM)
diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index 9dcbc3df50..a01cfa6f84 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -9,6 +9,7 @@
  * REGS(letter, register_mask)
  */
 REGS('r', ALL_GENERAL_REGS)
+REGS('o', ALL_GENERAL_REGS & 0xAAAAAAAAu)  /* odd registers */
 REGS('v', ALL_VECTOR_REGS)
 
 /*
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 0914380bd7..204b70f86a 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -149,7 +149,8 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_mulsh_i64        1
 #endif
 
-#define TCG_TARGET_HAS_qemu_ldst_i128   0
+#define TCG_TARGET_HAS_qemu_ldst_i128   \
+    (TCG_TARGET_REG_BITS == 64 && have_isa_2_07)
 
 /*
  * While technically Altivec could support V64, it has no 64-bit store
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 743a452981..f61c036115 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -298,25 +298,27 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 
 #define B      OPCD( 18)
 #define BC     OPCD( 16)
+
 #define LBZ    OPCD( 34)
 #define LHZ    OPCD( 40)
 #define LHA    OPCD( 42)
 #define LWZ    OPCD( 32)
 #define LWZUX  XO31( 55)
-#define STB    OPCD( 38)
-#define STH    OPCD( 44)
-#define STW    OPCD( 36)
-
-#define STD    XO62(  0)
-#define STDU   XO62(  1)
-#define STDX   XO31(149)
-
 #define LD     XO58(  0)
 #define LDX    XO31( 21)
 #define LDU    XO58(  1)
 #define LDUX   XO31( 53)
 #define LWA    XO58(  2)
 #define LWAX   XO31(341)
+#define LQ     OPCD( 56)
+
+#define STB    OPCD( 38)
+#define STH    OPCD( 44)
+#define STW    OPCD( 36)
+#define STD    XO62(  0)
+#define STDU   XO62(  1)
+#define STDX   XO31(149)
+#define STQ    XO62(  2)
 
 #define ADDIC  OPCD( 12)
 #define ADDI   OPCD( 14)
@@ -2018,11 +2020,25 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 typedef struct {
     TCGReg base;
     TCGReg index;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
 {
-    return true;
+    MemOp atom_a, atom_u;
+
+    if ((memop & MO_SIZE) <= MO_64) {
+        return true;
+    }
+
+    /*
+     * Reject 16-byte memop with 16-byte atomicity,
+     * but do allow a pair of 64-bit operations.
+     */
+    (void)atom_and_align_for_opc(tcg_ctx, &atom_a, &atom_u, memop,
+                                 MO_ATOM_IFALIGN, true);
+    return atom_a <= MO_64;
 }
 
 /*
@@ -2037,7 +2053,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    MemOp a_bits, atom_a, atom_u;
+    MemOp a_bits, atom_u, s_bits;
 
     /*
      * Book II, Section 1.4, Single-Copy Atomicity, specifies:
@@ -2049,10 +2065,19 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * As of 3.0, "the non-atomic access is performed as described in
      * the corresponding list", which matches MO_ATOM_SUBALIGN.
      */
-    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
+    s_bits = opc & MO_SIZE;
+    a_bits = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
                                     have_isa_3_00 ? MO_ATOM_SUBALIGN
                                                   : MO_ATOM_IFALIGN,
-                                    false);
+                                    s_bits == MO_128);
+
+    if (TCG_TARGET_REG_BITS == 32) {
+        /* We don't support unaligned accesses on 32-bits. */
+        if (a_bits < s_bits) {
+            a_bits = s_bits;
+        }
+    }
+    h->align = a_bits;
 
 #ifdef CONFIG_SOFTMMU
     int mem_index = get_mmuidx(oi);
@@ -2061,7 +2086,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     int fast_off = TLB_MASK_TABLE_OFS(mem_index);
     int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
     int table_off = fast_off + offsetof(CPUTLBDescFast, table);
-    unsigned s_bits = opc & MO_SIZE;
 
     ldst = new_ldst_label(s);
     ldst->is_ld = is_ld;
@@ -2111,13 +2135,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 
     /* Clear the non-page, non-alignment bits from the address in R0. */
     if (TCG_TARGET_REG_BITS == 32) {
-        /* We don't support unaligned accesses on 32-bits.
-         * Preserve the bottom bits and thus trigger a comparison
-         * failure on unaligned accesses.
-         */
-        if (a_bits < s_bits) {
-            a_bits = s_bits;
-        }
         tcg_out_rlw(s, RLWINM, TCG_REG_R0, addrlo, 0,
                     (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
     } else {
@@ -2302,6 +2319,108 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
     }
 }
 
+static TCGLabelQemuLdst *
+prepare_host_addr_index_only(TCGContext *s, HostAddress *h, TCGReg addr_reg,
+                             MemOpIdx oi, bool is_ld)
+{
+    TCGLabelQemuLdst *ldst;
+
+    ldst = prepare_host_addr(s, h, addr_reg, -1, oi, true);
+
+    /* Compose the final address, as LQ/STQ have no indexing. */
+    if (h->base != 0) {
+        tcg_out32(s, ADD | TAB(TCG_REG_TMP1, h->base, h->index));
+        h->index = TCG_REG_TMP1;
+        h->base = 0;
+    }
+
+    return ldst;
+}
+
+static void tcg_out_qemu_ld128(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                               TCGReg addr_reg, MemOpIdx oi)
+{
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
+    bool need_bswap;
+
+    ldst = prepare_host_addr_index_only(s, &h, addr_reg, oi, true);
+    need_bswap = get_memop(oi) & MO_BSWAP;
+
+    if (h.atom == MO_128) {
+        tcg_debug_assert(!need_bswap);
+        tcg_debug_assert(datalo & 1);
+        tcg_debug_assert(datahi == datalo - 1);
+        tcg_out32(s, LQ | TAI(datahi, h.index, 0));
+    } else {
+        TCGReg d1, d2;
+
+        if (HOST_BIG_ENDIAN ^ need_bswap) {
+            d1 = datahi, d2 = datalo;
+        } else {
+            d1 = datalo, d2 = datahi;
+        }
+
+        if (need_bswap) {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, 8);
+            tcg_out32(s, LDBRX | TAB(d1, 0, h.index));
+            tcg_out32(s, LDBRX | TAB(d2, h.index, TCG_REG_R0));
+        } else {
+            tcg_out32(s, LD | TAI(d1, h.index, 0));
+            tcg_out32(s, LD | TAI(d2, h.index, 8));
+        }
+    }
+
+    if (ldst) {
+        ldst->type = TCG_TYPE_I128;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
+    }
+}
+
+static void tcg_out_qemu_st128(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                               TCGReg addr_reg, MemOpIdx oi)
+{
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
+    bool need_bswap;
+
+    ldst = prepare_host_addr_index_only(s, &h, addr_reg, oi, false);
+    need_bswap = get_memop(oi) & MO_BSWAP;
+
+    if (h.atom == MO_128) {
+        tcg_debug_assert(!need_bswap);
+        tcg_debug_assert(datalo & 1);
+        tcg_debug_assert(datahi == datalo - 1);
+        tcg_out32(s, STQ | TAI(datahi, h.index, 0));
+    } else {
+        TCGReg d1, d2;
+
+        if (HOST_BIG_ENDIAN ^ need_bswap) {
+            d1 = datahi, d2 = datalo;
+        } else {
+            d1 = datalo, d2 = datahi;
+        }
+
+        if (need_bswap) {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, 8);
+            tcg_out32(s, STDBRX | TAB(d1, 0, h.index));
+            tcg_out32(s, STDBRX | TAB(d2, h.index, TCG_REG_R0));
+        } else {
+            tcg_out32(s, STD | TAI(d1, h.index, 0));
+            tcg_out32(s, STD | TAI(d2, h.index, 8));
+        }
+    }
+
+    if (ldst) {
+        ldst->type = TCG_TYPE_I128;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
+    }
+}
+
 static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
 {
     int i;
@@ -2852,6 +2971,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                             args[4], TCG_TYPE_I64);
         }
         break;
+    case INDEX_op_qemu_ld_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        tcg_out_qemu_ld128(s, args[0], args[1], args[2], args[3]);
+        break;
+
     case INDEX_op_qemu_st_i32:
         if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
             tcg_out_qemu_st(s, args[0], -1, args[1], -1,
@@ -2873,6 +2997,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                             args[4], TCG_TYPE_I64);
         }
         break;
+    case INDEX_op_qemu_st_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        tcg_out_qemu_st128(s, args[0], args[1], args[2], args[3]);
+        break;
 
     case INDEX_op_setcond_i32:
         tcg_out_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1], args[2],
@@ -3708,6 +3836,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
                 : TARGET_LONG_BITS == 32 ? C_O0_I3(r, r, r)
                 : C_O0_I4(r, r, r, r));
 
+    case INDEX_op_qemu_ld_i128:
+        return C_O2_I1(o, m, r);
+    case INDEX_op_qemu_st_i128:
+        return C_O0_I3(o, m, r);
+
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
     case INDEX_op_mul_vec:
-- 
2.34.1


