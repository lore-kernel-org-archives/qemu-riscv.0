Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYH-0007GD-R7
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYF-0007Dp-4x
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:39 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY2-0005bn-3B
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:38 -0400
Received: by mail-pl1-x62d.google.com with SMTP id m18so310242plx.5
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VdpQxEtfVL1X7UTRNCnlp2ECby0soTQGr8Da19bvaPM=;
 b=XKZUyc/oUM8ciX2OKi++pq/8ONrEOzcSpCDxat/1grBKLwC3jfdOP1O79iNg7UA36Y
 pn6kuL7I/7j6WkfIdLNeIDh6ZS9U5H772VdyhfSlqL2fBfeGIsg37M89d61DiAreAekx
 8ZRD5JG6sHrf81PXjTAgkvL+D931OTuCN4sBJzdJ11wwZSfPMWeszs0XlcU/OwkLCmlA
 iK0kuOjXAkbfS9m2xDCXXzt4I3MLTSI28KSfDE37iQyckxstxumowfztQCHjJoONcU+U
 oNIAqQk3ncB8PsQssJCIXO3D1pnj3avfS92qQ+YqjoT/vs4pQUSZ6pAC4B/Ji6bF+kGv
 +m0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VdpQxEtfVL1X7UTRNCnlp2ECby0soTQGr8Da19bvaPM=;
 b=gkvSD1wzwIYz42KXrA7AKAIjbKssDvHzwz/HGShRI9gnQTPkJEdGMZvp7wbPIIMCIV
 MFEV6wLsq+GZexie8du6imk4oV9O9zhF5BB7ddbyIJwOh5QpEmdLBxcmrsh4fRlmE2A7
 YTxL6wByXiIBuJ1IbAukLo1bn2QCiLcqC8Y8LvBOFCqRU4YP9kebEQPpLXOIBcawvY5V
 Yp7tgQEmHaFXvr/4JrAPW1INOgLNTp3QVgzw7D74RnzlLEuBgzFAbdkD9g25xTFn7bPx
 iQFkv+6lZ+KhZUxQil+JQtMztfNL/EJE3TMFJYQpmGTSoe353SKraBm1nf0a6LGcATmW
 ax4Q==
X-Gm-Message-State: AAQBX9eUGyIUiynkJ5MoKPM++iqc59cMGb9BWLhds5rcObJds0zA3NYJ
 RVfxk11161ub3hZDZIBODlZuNA==
X-Google-Smtp-Source: AKy350YhKGj4p8+11lCgpBS8Cv0MbNvVe+bFGDEn/BB5oltWg7rv5N/jRn7v72vrHnoS8GW8QIg2tQ==
X-Received: by 2002:a17:902:e802:b0:19c:be03:d0ba with SMTP id
 u2-20020a170902e80200b0019cbe03d0bamr5227595plg.18.1680921804394; 
 Fri, 07 Apr 2023 19:43:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 08/42] tcg: Split out tcg_out_ext32u
Date: Fri,  7 Apr 2023 19:42:40 -0700
Message-Id: <20230408024314.3357414-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:39 -0000

We will need a backend interface for performing 32-bit zero-extend.
Use it in tcg_reg_alloc_op in the meantime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  4 ++++
 tcg/aarch64/tcg-target.c.inc     |  9 +++++++--
 tcg/arm/tcg-target.c.inc         |  5 +++++
 tcg/i386/tcg-target.c.inc        |  4 ++--
 tcg/loongarch64/tcg-target.c.inc |  2 +-
 tcg/mips/tcg-target.c.inc        |  3 ++-
 tcg/ppc/tcg-target.c.inc         |  4 +++-
 tcg/riscv/tcg-target.c.inc       |  2 +-
 tcg/s390x/tcg-target.c.inc       | 20 ++++++++++----------
 tcg/sparc64/tcg-target.c.inc     | 17 +++++++++++------
 tcg/tci/tcg-target.c.inc         |  9 ++++++++-
 11 files changed, 54 insertions(+), 25 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 84aa8d639e..a182771c01 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -110,6 +110,7 @@ static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg);
+static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
@@ -4525,6 +4526,9 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     case INDEX_op_ext32s_i64:
         tcg_out_ext32s(s, new_args[0], new_args[1]);
         break;
+    case INDEX_op_ext32u_i64:
+        tcg_out_ext32u(s, new_args[0], new_args[1]);
+        break;
     default:
         if (def->flags & TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index d7964734c3..bca5f03dfb 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1452,6 +1452,11 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_uxt(s, MO_16, rd, rn);
 }
 
+static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_movr(s, TCG_TYPE_I32, rd, rn);
+}
+
 static void tcg_out_addsubi(TCGContext *s, int ext, TCGReg rd,
                             TCGReg rn, int64_t aimm)
 {
@@ -2259,8 +2264,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);
         break;
     case INDEX_op_extu_i32_i64:
-    case INDEX_op_ext32u_i64:
-        tcg_out_movr(s, TCG_TYPE_I32, a0, a1);
+        tcg_out_ext32u(s, a0, a1);
         break;
 
     case INDEX_op_deposit_i64:
@@ -2327,6 +2331,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext32s_i64:
+    case INDEX_op_ext32u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 401769bdd6..5c48b92f83 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -998,6 +998,11 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
     g_assert_not_reached();
 }
 
+static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_bswap16(TCGContext *s, ARMCond cond,
                             TCGReg rd, TCGReg rn, int flags)
 {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 8bb747b81d..1e9f61dbf3 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1287,7 +1287,7 @@ static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
     tcg_out_modrm(s, OPC_MOVSWL + rexw, dest, src);
 }
 
-static inline void tcg_out_ext32u(TCGContext *s, int dest, int src)
+static void tcg_out_ext32u(TCGContext *s, TCGReg dest, TCGReg src)
 {
     /* 32-bit mov zero extends.  */
     tcg_out_modrm(s, OPC_MOVL_GvEv, dest, src);
@@ -2754,7 +2754,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_bswap64(s, a0);
         break;
     case INDEX_op_extu_i32_i64:
-    case INDEX_op_ext32u_i64:
     case INDEX_op_extrl_i64_i32:
         tcg_out_ext32u(s, a0, a1);
         break;
@@ -2838,6 +2837,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
+    case INDEX_op_ext32u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 037474510c..d2511eda7a 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1246,7 +1246,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
         break;
 
-    case INDEX_op_ext32u_i64:
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, a0, a1);
         break;
@@ -1615,6 +1614,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
+    case INDEX_op_ext32u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index c57ccb6b3d..fe90547c43 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -663,6 +663,7 @@ static void tcg_out_bswap64(TCGContext *s, TCGReg ret, TCGReg arg)
 
 static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg)
 {
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
     if (use_mips32r2_instructions) {
         tcg_out_opc_bf(s, OPC_DEXT, ret, arg, 31, 0);
     } else {
@@ -2297,7 +2298,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_extrl_i64_i32:
         tcg_out_ext32s(s, a0, a1);
         break;
-    case INDEX_op_ext32u_i64:
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, a0, a1);
         break;
@@ -2446,6 +2446,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext32s_i64:
+    case INDEX_op_ext32u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 3084a711eb..5d25e30851 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -800,8 +800,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out32(s, EXTSW | RA(dst) | RS(src));
 }
 
-static inline void tcg_out_ext32u(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_ext32u(TCGContext *s, TCGReg dst, TCGReg src)
 {
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
     tcg_out_rld(s, RLDICL, dst, src, 0, 32);
 }
 
@@ -3130,6 +3131,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
+    case INDEX_op_ext32u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 9381e113aa..1d91fd19c6 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1597,7 +1597,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_ext32u_i64:
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, a0, a1);
         break;
@@ -1639,6 +1638,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
+    case INDEX_op_ext32u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 9aff45cbfd..825dbfc523 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1117,7 +1117,7 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_insn(s, RRE, LGFR, dest, src);
 }
 
-static inline void tgen_ext32u(TCGContext *s, TCGReg dest, TCGReg src)
+static void tcg_out_ext32u(TCGContext *s, TCGReg dest, TCGReg src)
 {
     tcg_out_insn(s, RRE, LLGFR, dest, src);
 }
@@ -1149,7 +1149,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 
     /* Look for the zero-extensions.  */
     if ((val & valid) == 0xffffffff) {
-        tgen_ext32u(s, dest, dest);
+        tcg_out_ext32u(s, dest, dest);
         return;
     }
     if ((val & valid) == 0xff) {
@@ -1440,7 +1440,7 @@ static void tgen_ctpop(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
     /* With MIE3, and bit 0 of m4 set, we get the complete result. */
     if (HAVE_FACILITY(MISC_INSN_EXT3)) {
         if (type == TCG_TYPE_I32) {
-            tgen_ext32u(s, dest, src);
+            tcg_out_ext32u(s, dest, src);
             src = dest;
         }
         tcg_out_insn(s, RRFc, POPCNT, dest, src, 8);
@@ -1618,7 +1618,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
     case MO_UL | MO_BSWAP:
         /* swapped unsigned int load with upper bits zeroed */
         tcg_out_insn(s, RXY, LRV, data, base, index, disp);
-        tgen_ext32u(s, data, data);
+        tcg_out_ext32u(s, data, data);
         break;
     case MO_UL:
         tcg_out_insn(s, RXY, LLGF, data, base, index, disp);
@@ -1743,7 +1743,7 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
                  offsetof(CPUTLBEntry, addend));
 
     if (TARGET_LONG_BITS == 32) {
-        tgen_ext32u(s, TCG_REG_R3, addr_reg);
+        tcg_out_ext32u(s, TCG_REG_R3, addr_reg);
         return TCG_REG_R3;
     }
     return addr_reg;
@@ -1812,7 +1812,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
         tcg_out_ext16u(s, TCG_REG_R4, data_reg);
         break;
     case MO_UL:
-        tgen_ext32u(s, TCG_REG_R4, data_reg);
+        tcg_out_ext32u(s, TCG_REG_R4, data_reg);
         break;
     case MO_UQ:
         tcg_out_mov(s, TCG_TYPE_I64, TCG_REG_R4, data_reg);
@@ -1879,7 +1879,7 @@ static void tcg_prepare_user_ldst(TCGContext *s, TCGReg *addr_reg,
                                   TCGReg *index_reg, tcg_target_long *disp)
 {
     if (TARGET_LONG_BITS == 32) {
-        tgen_ext32u(s, TCG_TMP0, *addr_reg);
+        tcg_out_ext32u(s, TCG_TMP0, *addr_reg);
         *addr_reg = TCG_TMP0;
     }
     if (guest_base < 0x80000) {
@@ -2261,7 +2261,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if (a2 & TCG_BSWAP_OS) {
             tcg_out_ext32s(s, a0, a0);
         } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
-            tgen_ext32u(s, a0, a0);
+            tcg_out_ext32u(s, a0, a0);
         }
         break;
 
@@ -2528,8 +2528,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ext32s(s, args[0], args[1]);
         break;
     case INDEX_op_extu_i32_i64:
-    case INDEX_op_ext32u_i64:
-        tgen_ext32u(s, args[0], args[1]);
+        tcg_out_ext32u(s, args[0], args[1]);
         break;
 
     case INDEX_op_add2_i64:
@@ -2627,6 +2626,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
+    case INDEX_op_ext32u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index fef19493d0..6464d1fb5e 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -522,6 +522,11 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_arithi(s, rd, rs, 0, SHIFT_SRA);
 }
 
+static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_arithi(s, rd, rs, 0, SHIFT_SRL);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -910,7 +915,7 @@ static void emit_extend(TCGContext *s, TCGReg r, int op)
         tcg_out_ext16u(s, r, r);
         break;
     case MO_32:
-        tcg_out_arith(s, r, r, 0, SHIFT_SRL);
+        tcg_out_ext32u(s, r, r);
         break;
     case MO_64:
         break;
@@ -1134,7 +1139,7 @@ static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addr, int mem_index,
 
     /* If the guest address must be zero-extended, do so now.  */
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_arithi(s, r0, addr, 0, SHIFT_SRL);
+        tcg_out_ext32u(s, r0, addr);
         return r0;
     }
     return addr;
@@ -1231,7 +1236,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
     unsigned t_bits;
 
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_arithi(s, TCG_REG_T1, addr, 0, SHIFT_SRL);
+        tcg_out_ext32u(s, TCG_REG_T1, addr);
         addr = TCG_REG_T1;
     }
 
@@ -1363,7 +1368,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
     unsigned t_bits;
 
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_arithi(s, TCG_REG_T1, addr, 0, SHIFT_SRL);
+        tcg_out_ext32u(s, TCG_REG_T1, addr);
         addr = TCG_REG_T1;
     }
 
@@ -1676,8 +1681,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ext32s(s, a0, a1);
         break;
     case INDEX_op_extu_i32_i64:
-    case INDEX_op_ext32u_i64:
-        tcg_out_arithi(s, a0, a1, 0, SHIFT_SRL);
+        tcg_out_ext32u(s, a0, a1);
         break;
     case INDEX_op_extrl_i64_i32:
         tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
@@ -1733,6 +1737,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
+    case INDEX_op_ext32u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 04e162a623..bc7b5a410c 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -622,6 +622,13 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_op_rr(s, INDEX_op_ext32s_i64, rd, rs);
 }
 
+static void tcg_out_ext32u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+    tcg_debug_assert(TCG_TARGET_HAS_ext32u_i64);
+    tcg_out_op_rr(s, INDEX_op_ext32u_i64, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -780,7 +787,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
-    CASE_64(ext32u)      /* Optional (TCG_TARGET_HAS_ext32u_i64). */
     CASE_64(ext_i32)
     CASE_64(extu_i32)
     CASE_32_64(ctpop)    /* Optional (TCG_TARGET_HAS_ctpop_*). */
@@ -864,6 +870,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext32s_i64:
+    case INDEX_op_ext32u_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


