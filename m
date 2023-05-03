Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6e5-00068t-Nd
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6db-00035Y-0R
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:55 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dN-00078H-MA
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:10:54 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f315712406so11372955e9.0
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097840; x=1685689840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=74fz9Ld9bLDPRfVJYs6idXiZ8ClJOkSqQyHSmdIG74U=;
 b=s8McavB8m4Z8NDBrozjfclv1FZhhQGo/Ht0eMdoztK3VgwNbPcJDrMPBW8XIIh4DrD
 3RsgseYf63sGqeZr2W4CzQgnGZ4PlrGgnQdZ1NdPWODdIedIacTxJBHjv6OmruCGP0MJ
 QmES1boa02cTK/YWwWUGIejz7FQTTCiABgVOPZJe/Hdp5j6O6QzTlLaGTQdrgudOp4Qd
 PffUM2/n4A/hDdx8n3Xubu4HlY9XgyNrZd9bzkCql7aeC2i6IQCjIeG/0SktIqPS8EX5
 0nRdE0xZoScn9CbQjZtRlQ0m+m6VUoxD9MTd+tZ/6VolVn8J1ewOsBXEXGuxn1tppQrM
 HzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097840; x=1685689840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=74fz9Ld9bLDPRfVJYs6idXiZ8ClJOkSqQyHSmdIG74U=;
 b=AmAXv/sARcIjN91sBeexfbmV5Oje1KKHeLguUxZO9Nhse80TgBlupseB/vDe1/RDxP
 UdVSCMoYatDGdF12mNnDJAe9T6z+R0+zqLK+FI8q0SKVr+wdQjB/5O+oryTeNSW+mFb5
 OBh/c7T8gZfMit6AhZZYFEaOFWTvhPqfgjBnLT1h44TnfRD+StaDUQzD23IYJX9+HThr
 g96D/KmSNHOi+DE4tZfgol+M4HfIKP9gUgPpojQx9js1GhmC2agFcDGIa6vR6njWZhPJ
 3CY/j/mFdazgdLn3Ky96/azB9HJBeJtUkYVsi4c6CjUCBx0TQa5xgplJGoTCa9A7MQdp
 Zibg==
X-Gm-Message-State: AC+VfDzpQgme+67n9Okog6IhOk7owLivzvqfRBPrBsIYxyFInFG8El56
 0is4nCaUy1wIumHXn3svg2BgPw==
X-Google-Smtp-Source: ACHHUZ4gX8Kz+wdl1QbKype+QsfQGKXgPwcC7DT8kT3M6UKwPJLj/08QTTaaEjZTXJn0EPeQ4yf6RA==
X-Received: by 2002:a05:600c:248:b0:3f1:7287:55ad with SMTP id
 8-20020a05600c024800b003f1728755admr726400wmj.10.1683097839949; 
 Wed, 03 May 2023 00:10:39 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 56/57] tcg/ppc: Support 128-bit load/store
Date: Wed,  3 May 2023 08:06:55 +0100
Message-Id: <20230503070656.1746170-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 03 May 2023 07:10:57 -0000

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
index 094613cbcb..20846901de 100644
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
index 60375804cd..682743a466 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -295,25 +295,27 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 
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
@@ -2015,11 +2017,25 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
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
@@ -2034,7 +2050,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    MemOp a_bits, atom_a, atom_u;
+    MemOp a_bits, atom_u, s_bits;
 
     /*
      * Book II, Section 1.4, Single-Copy Atomicity, specifies:
@@ -2046,10 +2062,19 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
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
@@ -2058,7 +2083,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     int fast_off = TLB_MASK_TABLE_OFS(mem_index);
     int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
     int table_off = fast_off + offsetof(CPUTLBDescFast, table);
-    unsigned s_bits = opc & MO_SIZE;
 
     ldst = new_ldst_label(s);
     ldst->is_ld = is_ld;
@@ -2108,13 +2132,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 
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
@@ -2299,6 +2316,108 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
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
@@ -2849,6 +2968,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -2870,6 +2994,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                             args[4], TCG_TYPE_I64);
         }
         break;
+    case INDEX_op_qemu_st_i128:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+        tcg_out_qemu_st128(s, args[0], args[1], args[2], args[3]);
+        break;
 
     case INDEX_op_setcond_i32:
         tcg_out_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1], args[2],
@@ -3705,6 +3833,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
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


