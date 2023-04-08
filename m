Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyY7-00073v-A6
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY4-00072E-4F
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:28 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXw-0005YD-EF
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:27 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 r7-20020a17090b050700b002404be7920aso42932527pjz.5
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E3hqrO6JYyROHM0s8wk6ulIEMRo0UNCl9y6pJbnLNsA=;
 b=iMhkKu+NYW65orGWYSrbl2CkP3yX6doZr+lhU7gcpH/fgkm5aqH4M/2265DzrpvHrt
 kIeUT/RFFY5bNv1IbJTSmgjOPQhxy9lQ6t0yTdWwWUU6YjCbl5BX/m3KKGkyOe35Otg6
 hGqkkk5tmaep4hcXIUxzfg4AYXbDWpvzPkcB7FNLTxWY5vAMjgA1DN3VqXnjn7Mdr50h
 Cs+qO7m+vSAm2bwg30Oh9UNmIhjArhKP9YWJDSskXDYkFZVLOu9TepfL0HnY/CvhHNNu
 pBxTIoAu1f79nyxA59iCtqxB+ArgZ8O2ZEIVUnTBsKW8JTXgPpt9GREPOZ8dFp0Sl15v
 bNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E3hqrO6JYyROHM0s8wk6ulIEMRo0UNCl9y6pJbnLNsA=;
 b=Bm2Dpa1sXXYE29N57fUbP5T3f82w4KrAVmiYfRJveN3zrhgAyHUeRfwUooy4n5OaUE
 Hi2kEc+28N9qx4Ym1hsyWtqmmOJTY2W4RuLIKz/CrwTpDcL/alO/MoiDW5QlaBadT8d6
 7kbH05/0Foqopt13YFNGX6hbBMgSzkFWB389zl2+OtT0GYjWvRMAm3Z1tG6YRCZr3Jg7
 oJBbw2PcRQianNqk6FvK45nktsJI4BOvN04mRL6YMUpe+YuKpMx64NskwnjEanbAJ3wV
 11tPgYsToJ6nA1RAvu22yleL/AdluJ3/1/ntDOAh3KK3zSIy1j+pPirkP/smnsF8hHhZ
 kCSQ==
X-Gm-Message-State: AAQBX9cSLMoe5tul45ftqhjekomsaTMBNK9v+QYVToEsw+C/hknza+OB
 M1rqoQUIukyXSrpuTHCHGYROZg==
X-Google-Smtp-Source: AKy350YHwbVXiizBnKAe+xuewXOJEk3jD4yPyYqFMx7njzgN+5RYZgjnCdirOocRq9FM2W0Rmgyg4Q==
X-Received: by 2002:a17:902:da86:b0:19e:6700:174 with SMTP id
 j6-20020a170902da8600b0019e67000174mr5626436plx.25.1680921798800; 
 Fri, 07 Apr 2023 19:43:18 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 03/42] tcg: Split out tcg_out_ext8s
Date: Fri,  7 Apr 2023 19:42:35 -0700
Message-Id: <20230408024314.3357414-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:28 -0000

We will need a backend interface for performing 8-bit sign-extend.
Use it in tcg_reg_alloc_op in the meantime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        | 21 ++++++++++++++++-----
 tcg/aarch64/tcg-target.c.inc     | 11 +++++++----
 tcg/arm/tcg-target.c.inc         | 10 ++++------
 tcg/i386/tcg-target.c.inc        | 10 +++++-----
 tcg/loongarch64/tcg-target.c.inc | 11 ++++-------
 tcg/mips/tcg-target.c.inc        | 12 ++++++++----
 tcg/ppc/tcg-target.c.inc         | 10 ++++------
 tcg/riscv/tcg-target.c.inc       |  9 +++------
 tcg/s390x/tcg-target.c.inc       | 10 +++-------
 tcg/sparc64/tcg-target.c.inc     |  7 +++++++
 tcg/tci/tcg-target.c.inc         | 21 ++++++++++++++++++++-
 11 files changed, 81 insertions(+), 51 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index c3a8578951..76ba3e28cd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -105,6 +105,7 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
+static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
@@ -4496,11 +4497,21 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     }
 
     /* emit instruction */
-    if (def->flags & TCG_OPF_VECTOR) {
-        tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
-                       new_args, const_args);
-    } else {
-        tcg_out_op(s, op->opc, new_args, const_args);
+    switch (op->opc) {
+    case INDEX_op_ext8s_i32:
+        tcg_out_ext8s(s, TCG_TYPE_I32, new_args[0], new_args[1]);
+        break;
+    case INDEX_op_ext8s_i64:
+        tcg_out_ext8s(s, TCG_TYPE_I64, new_args[0], new_args[1]);
+        break;
+    default:
+        if (def->flags & TCG_OPF_VECTOR) {
+            tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
+                           new_args, const_args);
+        } else {
+            tcg_out_op(s, op->opc, new_args, const_args);
+        }
+        break;
     }
 
     /* move the outputs in the correct register if needed */
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 1315cb92ab..4f4f814293 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1419,6 +1419,11 @@ static inline void tcg_out_sxt(TCGContext *s, TCGType ext, MemOp s_bits,
     tcg_out_sbfm(s, ext, rd, rn, 0, bits);
 }
 
+static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rn)
+{
+    tcg_out_sxt(s, type, MO_8, rd, rn);
+}
+
 static inline void tcg_out_uxt(TCGContext *s, MemOp s_bits,
                                TCGReg rd, TCGReg rn)
 {
@@ -2230,10 +2235,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_ext8s_i64:
-    case INDEX_op_ext8s_i32:
-        tcg_out_sxt(s, ext, MO_8, a0, a1);
-        break;
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16s_i32:
         tcg_out_sxt(s, ext, MO_16, a0, a1);
@@ -2310,6 +2311,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
+    case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
+    case INDEX_op_ext8s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index b4daa97e7a..04a860897f 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -958,10 +958,10 @@ static void tcg_out_udiv(TCGContext *s, ARMCond cond,
     tcg_out32(s, 0x0730f010 | (cond << 28) | (rd << 16) | rn | (rm << 8));
 }
 
-static void tcg_out_ext8s(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
+static void tcg_out_ext8s(TCGContext *s, TCGType t, TCGReg rd, TCGReg rn)
 {
     /* sxtb */
-    tcg_out32(s, 0x06af0070 | (cond << 28) | (rd << 12) | rn);
+    tcg_out32(s, 0x06af0070 | (COND_AL << 28) | (rd << 12) | rn);
 }
 
 static void __attribute__((unused))
@@ -1533,7 +1533,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     datahi = lb->datahi_reg;
     switch (opc & MO_SSIZE) {
     case MO_SB:
-        tcg_out_ext8s(s, COND_AL, datalo, TCG_REG_R0);
+        tcg_out_ext8s(s, TCG_TYPE_I32, datalo, TCG_REG_R0);
         break;
     case MO_SW:
         tcg_out_ext16s(s, COND_AL, datalo, TCG_REG_R0);
@@ -2244,9 +2244,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_bswap32(s, COND_AL, args[0], args[1]);
         break;
 
-    case INDEX_op_ext8s_i32:
-        tcg_out_ext8s(s, COND_AL, args[0], args[1]);
-        break;
     case INDEX_op_ext16s_i32:
         tcg_out_ext16s(s, COND_AL, args[0], args[1]);
         break;
@@ -2301,6 +2298,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
+    case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index f4baf6e6e9..532fc8e283 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1266,8 +1266,9 @@ static inline void tcg_out_ext8u(TCGContext *s, int dest, int src)
     tcg_out_modrm(s, OPC_MOVZBL + P_REXB_RM, dest, src);
 }
 
-static void tcg_out_ext8s(TCGContext *s, int dest, int src, int rexw)
+static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 {
+    int rexw = type == TCG_TYPE_I32 ? 0 : P_REXW;
     /* movsbl */
     tcg_debug_assert(src < 4 || TCG_TARGET_REG_BITS == 64);
     tcg_out_modrm(s, OPC_MOVSBL + P_REXB_RM + rexw, dest, src);
@@ -1929,7 +1930,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     data_reg = l->datalo_reg;
     switch (opc & MO_SSIZE) {
     case MO_SB:
-        tcg_out_ext8s(s, data_reg, TCG_REG_EAX, rexw);
+        tcg_out_ext8s(s, l->type, data_reg, TCG_REG_EAX);
         break;
     case MO_SW:
         tcg_out_ext16s(s, data_reg, TCG_REG_EAX, rexw);
@@ -2669,9 +2670,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_NOT, a0);
         break;
 
-    OP_32_64(ext8s):
-        tcg_out_ext8s(s, a0, a1, rexw);
-        break;
     OP_32_64(ext16s):
         tcg_out_ext16s(s, a0, a1, rexw);
         break;
@@ -2840,6 +2838,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
+    case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
+    case INDEX_op_ext8s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index c5f55afd68..a96f655c44 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -441,7 +441,7 @@ static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_opc_bstrpick_d(s, ret, arg, 0, 31);
 }
 
-static void tcg_out_ext8s(TCGContext *s, TCGReg ret, TCGReg arg)
+static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     tcg_out_opc_sext_b(s, ret, arg);
 }
@@ -893,7 +893,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     switch (opc & MO_SSIZE) {
     case MO_SB:
-        tcg_out_ext8s(s, l->datalo_reg, TCG_REG_A0);
+        tcg_out_ext8s(s, type, l->datalo_reg, TCG_REG_A0);
         break;
     case MO_SW:
         tcg_out_ext16s(s, l->datalo_reg, TCG_REG_A0);
@@ -1246,11 +1246,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
         break;
 
-    case INDEX_op_ext8s_i32:
-    case INDEX_op_ext8s_i64:
-        tcg_out_ext8s(s, a0, a1);
-        break;
-
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
         tcg_out_ext8u(s, a0, a1);
@@ -1627,6 +1622,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
+    case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
+    case INDEX_op_ext8s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 668bc73ee6..8fc9d02bd5 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -552,6 +552,12 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 }
 
+static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
+{
+    tcg_debug_assert(TCG_TARGET_HAS_ext8s_i32);
+    tcg_out_opc_reg(s, OPC_SEB, rd, TCG_REG_ZERO, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -2245,10 +2251,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_not_i64:
         i1 = OPC_NOR;
         goto do_unary;
-    case INDEX_op_ext8s_i32:
-    case INDEX_op_ext8s_i64:
-        i1 = OPC_SEB;
-        goto do_unary;
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
         i1 = OPC_SEH;
@@ -2419,6 +2421,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
+    case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
+    case INDEX_op_ext8s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index e696d153b8..26c3a72017 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -774,7 +774,7 @@ static inline void tcg_out_rlw(TCGContext *s, int op, TCGReg ra, TCGReg rs,
     tcg_out32(s, op | RA(ra) | RS(rs) | SH(sh) | MB(mb) | ME(me));
 }
 
-static inline void tcg_out_ext8s(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
 {
     tcg_out32(s, EXTSB | RA(dst) | RS(src));
 }
@@ -2625,7 +2625,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld8s_i64:
         tcg_out_mem_long(s, LBZ, LBZX, args[0], args[1], args[2]);
-        tcg_out_ext8s(s, args[0], args[0]);
+        tcg_out_ext8s(s, TCG_TYPE_REG, args[0], args[0]);
         break;
     case INDEX_op_ld16u_i32:
     case INDEX_op_ld16u_i64:
@@ -2973,10 +2973,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_ext8s_i32:
-    case INDEX_op_ext8s_i64:
-        tcg_out_ext8s(s, args[0], args[1]);
-        break;
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
         tcg_out_ext16s(s, args[0], args[1]);
@@ -3124,6 +3120,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_call:      /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:   /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:   /* Always emitted via tcg_out_goto_tb.  */
+    case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
+    case INDEX_op_ext8s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 558de127ef..04b27f6887 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -585,7 +585,7 @@ static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg)
     tcg_out_opc_imm(s, OPC_SRLI, ret, ret, 32);
 }
 
-static void tcg_out_ext8s(TCGContext *s, TCGReg ret, TCGReg arg)
+static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 24);
     tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 24);
@@ -1612,11 +1612,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ext32u(s, a0, a1);
         break;
 
-    case INDEX_op_ext8s_i32:
-    case INDEX_op_ext8s_i64:
-        tcg_out_ext8s(s, a0, a1);
-        break;
-
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
         tcg_out_ext16s(s, a0, a1);
@@ -1651,6 +1646,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
+    case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
+    case INDEX_op_ext8s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index d07d28bcfd..1232ccb122 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1092,7 +1092,7 @@ static inline void tcg_out_risbg(TCGContext *s, TCGReg dest, TCGReg src,
     tcg_out16(s, (ofs << 8) | (RIEf_RISBG & 0xff));
 }
 
-static void tgen_ext8s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
+static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 {
     tcg_out_insn(s, RRE, LGBR, dest, src);
 }
@@ -2233,9 +2233,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_ext8s_i32:
-        tgen_ext8s(s, TCG_TYPE_I32, args[0], args[1]);
-        break;
     case INDEX_op_ext16s_i32:
         tgen_ext16s(s, TCG_TYPE_I32, args[0], args[1]);
         break;
@@ -2537,9 +2534,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_ext8s_i64:
-        tgen_ext8s(s, TCG_TYPE_I64, args[0], args[1]);
-        break;
     case INDEX_op_ext16s_i64:
         tgen_ext16s(s, TCG_TYPE_I64, args[0], args[1]);
         break;
@@ -2644,6 +2638,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
+    case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
+    case INDEX_op_ext8s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 4ee5732b66..7952cfc4da 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -496,6 +496,11 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
 }
 
+static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -1700,6 +1705,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
+    case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
+    case INDEX_op_ext8s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 5309c3ffe1..029508e308 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -557,6 +557,24 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     }
 }
 
+static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_debug_assert(TCG_TARGET_HAS_ext8s_i32);
+        tcg_out_op_rr(s, INDEX_op_ext8s_i32, rd, rs);
+        break;
+#if TCG_TARGET_REG_BITS == 64
+    case TCG_TYPE_I64:
+        tcg_debug_assert(TCG_TARGET_HAS_ext8s_i64);
+        tcg_out_op_rr(s, INDEX_op_ext8s_i64, rd, rs);
+        break;
+#endif
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -715,7 +733,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
-    CASE_32_64(ext8s)    /* Optional (TCG_TARGET_HAS_ext8s_*). */
     CASE_32_64(ext8u)    /* Optional (TCG_TARGET_HAS_ext8u_*). */
     CASE_32_64(ext16s)   /* Optional (TCG_TARGET_HAS_ext16s_*). */
     CASE_32_64(ext16u)   /* Optional (TCG_TARGET_HAS_ext16u_*). */
@@ -795,6 +812,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
     case INDEX_op_exit_tb:  /* Always emitted via tcg_out_exit_tb.  */
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
+    case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
+    case INDEX_op_ext8s_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


