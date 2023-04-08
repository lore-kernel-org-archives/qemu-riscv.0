Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYC-0007Au-Ux
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYB-00079g-MY
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:35 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY0-0005WX-CP
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:35 -0400
Received: by mail-pl1-x632.google.com with SMTP id ik20so250427plb.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cblZDmOFjna0XCaVbm/PEPY78XZH4SZ91Jo5RdjUH08=;
 b=dVJx/WUiwslD8RtiCSl7KXcZMbAgN3awP8XR6WLoWXsoNtTcUNdDdzzTBMAl6Nzd9t
 MDe9WsyJIRBFPK6rL6zmHEypNliXKeS3r4hGNjZHq7ISl6kgmKdmj1geaVMvoWi19eFX
 GuGydvbdN0PlfzeatnsFvrwU3etb22OX4P3KdTJUptBhyXsoXgoU9KQU1/HMX1H4vzVV
 MOZh61EZvP8hXkgn3EHoflrfaZ9IFKNvfHSNu0LNDL5VvO5APaDpq4s7FIrMu1eBbZoK
 cEwXKtBvIWgjmeoTVOfFBuA0AOsI5dtB+7r5XHr34hh3Si42699N4TonLELqh6uxS31x
 FAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cblZDmOFjna0XCaVbm/PEPY78XZH4SZ91Jo5RdjUH08=;
 b=V5bux1NCNDH4NWX9sy9T5y3gZG5WWQyZKZ6eMMQ4wzxHypcqHGFvVjjoxFcHdT4xwc
 3DvrkLgCv7bN2rEwqIWLRKU4WkALTfSBdc96Px4Q3p6puAw+q7hMQuYRcHVko/AaXLfw
 S6PufbWAMKYztBWHF/YK7s/Yu8v8iKerfvPGsI08wxuYMNyUA/3REUAe1slomrPZE30i
 7UQf5xDgU/THJ1NVdIgs0FtnRMq6LXIxb0+BVy8oYl7mvaFWpuWIiEEe01lkXeC/wiUD
 pbuDZG09NMoZ6C5Z9MmOnOJ4Pn9K4jX4ywDSuwSkfXDbtKwxkQDDFVqRNZ72VTobfsp2
 n9Uw==
X-Gm-Message-State: AAQBX9dWXQ5WoHXhB4Q/HQEq13wx1jWe1cGGtepMq9G4BwIkWDwzIe/j
 Ru/EgZXhDY2nWgCafikvMp8B2KHEN35sWtIzcls=
X-Google-Smtp-Source: AKy350Yie1Oi5Im0yfmJBPThUlmQM/Gfd1jXOw5Z5gKmP860iVNfW+VwU9Ol6iQMA1nKdQUdPKyqOw==
X-Received: by 2002:a17:903:244d:b0:1a1:aa68:7e61 with SMTP id
 l13-20020a170903244d00b001a1aa687e61mr5749611pls.33.1680921803504; 
 Fri, 07 Apr 2023 19:43:23 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 07/42] tcg: Split out tcg_out_ext32s
Date: Fri,  7 Apr 2023 19:42:39 -0700
Message-Id: <20230408024314.3357414-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:35 -0000

We will need a backend interface for performing 32-bit sign-extend.
Use it in tcg_reg_alloc_op in the meantime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  4 ++++
 tcg/aarch64/tcg-target.c.inc     |  9 +++++++--
 tcg/arm/tcg-target.c.inc         |  5 +++++
 tcg/i386/tcg-target.c.inc        |  5 +++--
 tcg/loongarch64/tcg-target.c.inc |  2 +-
 tcg/mips/tcg-target.c.inc        | 12 +++++++++---
 tcg/ppc/tcg-target.c.inc         |  5 +++--
 tcg/riscv/tcg-target.c.inc       |  2 +-
 tcg/s390x/tcg-target.c.inc       | 10 +++++-----
 tcg/sparc64/tcg-target.c.inc     | 11 ++++++++---
 tcg/tci/tcg-target.c.inc         |  9 ++++++++-
 11 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5b0db747e8..84aa8d639e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -109,6 +109,7 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg);
+static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
@@ -4521,6 +4522,9 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     case INDEX_op_ext16u_i64:
         tcg_out_ext16u(s, new_args[0], new_args[1]);
         break;
+    case INDEX_op_ext32s_i64:
+        tcg_out_ext32s(s, new_args[0], new_args[1]);
+        break;
     default:
         if (def->flags & TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index f55829e9ce..d7964734c3 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1429,6 +1429,11 @@ static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rn)
     tcg_out_sxt(s, type, MO_16, rd, rn);
 }
 
+static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_sxt(s, TCG_TYPE_I64, MO_32, rd, rn);
+}
+
 static inline void tcg_out_uxt(TCGContext *s, MemOp s_bits,
                                TCGReg rd, TCGReg rn)
 {
@@ -2232,7 +2237,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_bswap32_i64:
         tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
         if (a2 & TCG_BSWAP_OS) {
-            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a0);
+            tcg_out_ext32s(s, a0, a0);
         }
         break;
     case INDEX_op_bswap32_i32:
@@ -2251,7 +2256,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_ext_i32_i64:
-    case INDEX_op_ext32s_i64:
         tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);
         break;
     case INDEX_op_extu_i32_i64:
@@ -2322,6 +2326,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16u_i64:
     case INDEX_op_ext16u_i32:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 8fa0c6cbc0..401769bdd6 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -993,6 +993,11 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_ext16u_cond(s, COND_AL, rd, rn);
 }
 
+static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_bswap16(TCGContext *s, ARMCond cond,
                             TCGReg rd, TCGReg rn, int flags)
 {
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 920524589d..8bb747b81d 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1293,8 +1293,9 @@ static inline void tcg_out_ext32u(TCGContext *s, int dest, int src)
     tcg_out_modrm(s, OPC_MOVL_GvEv, dest, src);
 }
 
-static inline void tcg_out_ext32s(TCGContext *s, int dest, int src)
+static void tcg_out_ext32s(TCGContext *s, TCGReg dest, TCGReg src)
 {
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
     tcg_out_modrm(s, OPC_MOVSLQ, dest, src);
 }
 
@@ -2758,7 +2759,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ext32u(s, a0, a1);
         break;
     case INDEX_op_ext_i32_i64:
-    case INDEX_op_ext32s_i64:
         tcg_out_ext32s(s, a0, a1);
         break;
     case INDEX_op_extrh_i64_i32:
@@ -2837,6 +2837,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 08c2b65b19..037474510c 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1251,7 +1251,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ext32u(s, a0, a1);
         break;
 
-    case INDEX_op_ext32s_i64:
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_ext_i32_i64:
         tcg_out_ext32s(s, a0, a1);
@@ -1615,6 +1614,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 220060c821..c57ccb6b3d 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -574,6 +574,12 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_opc_imm(s, OPC_ANDI, rd, rs, 0xffff);
 }
 
+static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+    tcg_out_opc_sa(s, OPC_SLL, rd, rs, 0);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -1313,7 +1319,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     /* delay slot */
     if (TCG_TARGET_REG_BITS == 64 && l->type == TCG_TYPE_I32) {
         /* we always sign-extend 32-bit loads */
-        tcg_out_opc_sa(s, OPC_SLL, v0, TCG_REG_V0, 0);
+        tcg_out_ext32s(s, v0, TCG_REG_V0);
     } else {
         tcg_out_opc_reg(s, OPC_OR, v0, TCG_REG_V0, TCG_REG_ZERO);
     }
@@ -2287,10 +2293,9 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_extrh_i64_i32:
         tcg_out_dsra(s, a0, a1, 32);
         break;
-    case INDEX_op_ext32s_i64:
     case INDEX_op_ext_i32_i64:
     case INDEX_op_extrl_i64_i32:
-        tcg_out_opc_sa(s, OPC_SLL, a0, a1, 0);
+        tcg_out_ext32s(s, a0, a1);
         break;
     case INDEX_op_ext32u_i64:
     case INDEX_op_extu_i32_i64:
@@ -2440,6 +2445,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e203a01bac..3084a711eb 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -794,8 +794,9 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out32(s, ANDI | SAI(src, dst, 0xffff));
 }
 
-static inline void tcg_out_ext32s(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_ext32s(TCGContext *s, TCGReg dst, TCGReg src)
 {
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
     tcg_out32(s, EXTSW | RA(dst) | RS(src));
 }
 
@@ -2979,7 +2980,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_ext_i32_i64:
-    case INDEX_op_ext32s_i64:
         tcg_out_ext32s(s, args[0], args[1]);
         break;
     case INDEX_op_extu_i32_i64:
@@ -3129,6 +3129,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index c49decaae9..9381e113aa 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1602,7 +1602,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ext32u(s, a0, a1);
         break;
 
-    case INDEX_op_ext32s_i64:
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_ext_i32_i64:
         tcg_out_ext32s(s, a0, a1);
@@ -1639,6 +1638,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 0c489c2341..9aff45cbfd 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1112,7 +1112,7 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_insn(s, RRE, LLGHR, dest, src);
 }
 
-static inline void tgen_ext32s(TCGContext *s, TCGReg dest, TCGReg src)
+static void tcg_out_ext32s(TCGContext *s, TCGReg dest, TCGReg src)
 {
     tcg_out_insn(s, RRE, LGFR, dest, src);
 }
@@ -1627,7 +1627,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
     case MO_SL | MO_BSWAP:
         /* swapped sign-extended int load */
         tcg_out_insn(s, RXY, LRV, data, base, index, disp);
-        tgen_ext32s(s, data, data);
+        tcg_out_ext32s(s, data, data);
         break;
     case MO_SL:
         tcg_out_insn(s, RXY, LGF, data, base, index, disp);
@@ -2259,7 +2259,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         a0 = args[0], a1 = args[1], a2 = args[2];
         tcg_out_insn(s, RRE, LRVR, a0, a1);
         if (a2 & TCG_BSWAP_OS) {
-            tgen_ext32s(s, a0, a0);
+            tcg_out_ext32s(s, a0, a0);
         } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
             tgen_ext32u(s, a0, a0);
         }
@@ -2525,8 +2525,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_ext_i32_i64:
-    case INDEX_op_ext32s_i64:
-        tgen_ext32s(s, args[0], args[1]);
+        tcg_out_ext32s(s, args[0], args[1]);
         break;
     case INDEX_op_extu_i32_i64:
     case INDEX_op_ext32u_i64:
@@ -2627,6 +2626,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 98784f6545..fef19493d0 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -517,6 +517,11 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_arithi(s, rd, rd, 16, SHIFT_SRL);
 }
 
+static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_arithi(s, rd, rs, 0, SHIFT_SRA);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -1213,7 +1218,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 
     /* We let the helper sign-extend SB and SW, but leave SL for here.  */
     if (is_64 && (memop & MO_SSIZE) == MO_SL) {
-        tcg_out_arithi(s, data, TCG_REG_O0, 0, SHIFT_SRA);
+        tcg_out_ext32s(s, data, TCG_REG_O0);
     } else {
         tcg_out_mov(s, TCG_TYPE_REG, data, TCG_REG_O0);
     }
@@ -1668,8 +1673,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         c = ARITH_UDIVX;
         goto gen_arith;
     case INDEX_op_ext_i32_i64:
-    case INDEX_op_ext32s_i64:
-        tcg_out_arithi(s, a0, a1, 0, SHIFT_SRA);
+        tcg_out_ext32s(s, a0, a1);
         break;
     case INDEX_op_extu_i32_i64:
     case INDEX_op_ext32u_i64:
@@ -1728,6 +1732,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 49a83942fa..04e162a623 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -615,6 +615,13 @@ static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
     }
 }
 
+static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
+    tcg_debug_assert(TCG_TARGET_HAS_ext32s_i64);
+    tcg_out_op_rr(s, INDEX_op_ext32s_i64, rd, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -773,7 +780,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
-    CASE_64(ext32s)      /* Optional (TCG_TARGET_HAS_ext32s_i64). */
     CASE_64(ext32u)      /* Optional (TCG_TARGET_HAS_ext32u_i64). */
     CASE_64(ext_i32)
     CASE_64(extu_i32)
@@ -857,6 +863,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
+    case INDEX_op_ext32s_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


