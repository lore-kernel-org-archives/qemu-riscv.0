Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYC-00079p-5H
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYA-00078a-F2
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:34 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXz-0005XB-HV
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:34 -0400
Received: by mail-pl1-x635.google.com with SMTP id m18so310209plx.5
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VLoGO+fofhKFzHTKhPmy3saPTeLEd9sLATIHQOs8puY=;
 b=tWCVfZ3ibkv1FtkspQw0rhLfk50SA0LDWzGuYLqHUtQEkHl3dqvYFPi2k4wTD7hJfX
 mVbUNx8F2ujffKfNkO+eMrjUUenC4Rw6iJ94AGEqwYnZOKGsD9ZMf6RCH20J4cX2WwxQ
 GnBy9CEoDt8L5L5tG4e7eJLelVepg3WYXwG26UInBqI3uSEs0gsYDxNpWEM1V2Kjy0E/
 bLX6/RwiZ7vOi6F3nPRbZXUMYOCZCVqPvvENPbTHVlIUU9v2KbJ1uKjEAZxPWeTchjtN
 qN6eHemXn5N31rHR/FcBlK2YFlMNPe00yW90I072MbHS25syLN2o1Ji61UmF4+tf6WI1
 Za0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VLoGO+fofhKFzHTKhPmy3saPTeLEd9sLATIHQOs8puY=;
 b=bM3QRo5Xc6MaQThtsXTGN+ppsGU15AQzqVdYRvdcJ6fI9cPjzOUgfoMYNui7MSnbAs
 LISlQ4xa4dqAdq336WPeSSlXgCjM/1Jo/KRkvsrTEBnmjlOPa9/tDr/Py5wyGjiQ1M2i
 Ut4m+XgquFGJn8Np70RBsnIcY8o45bvULvrUnddepjUfX2jWZoggPvCcw06G+4zNX3qS
 q/0D7jJmTcmUnAiWdsWssOfnT3EGao4CuTKioLD+G5RG1qaNO9bbuZPY1jKL5GJDO4ec
 1X5nospeGjZrq6Q/+0jQnghMA5Zq98nJrNdml6h6g/sVQSCmgM19eJGtKgGSuL6sOPEZ
 woHA==
X-Gm-Message-State: AAQBX9fbzTxS9WGvQha4DCD9B/Lpu52Lr9GuiFvm8QdvmMVg1ys0HbIL
 lGIdvIooJVf9Pnua3qdsMo+/Jw==
X-Google-Smtp-Source: AKy350YcTdWwqM57rU+ENpTuS5YF2imiZ9kl7z7cyAPTC8TSuxIzMmrmkYa1jyFc5giROE8Ysisu0A==
X-Received: by 2002:a17:903:646:b0:1a5:27d5:179b with SMTP id
 kh6-20020a170903064600b001a527d5179bmr394811plb.17.1680921802458; 
 Fri, 07 Apr 2023 19:43:22 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 06/42] tcg: Split out tcg_out_ext16u
Date: Fri,  7 Apr 2023 19:42:38 -0700
Message-Id: <20230408024314.3357414-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:34 -0000

We will need a backend interface for performing 16-bit zero-extend.
Use it in tcg_reg_alloc_op in the meantime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  5 +++++
 tcg/aarch64/tcg-target.c.inc     | 13 ++++++++-----
 tcg/arm/tcg-target.c.inc         | 17 ++++++++++-------
 tcg/i386/tcg-target.c.inc        |  8 +++-----
 tcg/loongarch64/tcg-target.c.inc |  7 ++-----
 tcg/mips/tcg-target.c.inc        |  5 +++++
 tcg/ppc/tcg-target.c.inc         |  4 +++-
 tcg/riscv/tcg-target.c.inc       |  7 ++-----
 tcg/s390x/tcg-target.c.inc       | 17 ++++++-----------
 tcg/sparc64/tcg-target.c.inc     | 11 +++++++++--
 tcg/tci/tcg-target.c.inc         | 14 +++++++++++++-
 11 files changed, 66 insertions(+), 42 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 739f92c2ee..5b0db747e8 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -108,6 +108,7 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
 static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg);
+static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
@@ -4516,6 +4517,10 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     case INDEX_op_ext16s_i64:
         tcg_out_ext16s(s, TCG_TYPE_I64, new_args[0], new_args[1]);
         break;
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
+        tcg_out_ext16u(s, new_args[0], new_args[1]);
+        break;
     default:
         if (def->flags & TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 3527c14d04..f55829e9ce 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1442,6 +1442,11 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rn)
     tcg_out_uxt(s, MO_8, rd, rn);
 }
 
+static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_uxt(s, MO_16, rd, rn);
+}
+
 static void tcg_out_addsubi(TCGContext *s, int ext, TCGReg rd,
                             TCGReg rn, int64_t aimm)
 {
@@ -2241,7 +2246,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_ext16s(s, ext, a0, a0);
         } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
             /* Output must be zero-extended, but input isn't. */
-            tcg_out_uxt(s, MO_16, a0, a0);
+            tcg_out_ext16u(s, a0, a0);
         }
         break;
 
@@ -2249,10 +2254,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
         tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);
         break;
-    case INDEX_op_ext16u_i64:
-    case INDEX_op_ext16u_i32:
-        tcg_out_uxt(s, MO_16, a0, a1);
-        break;
     case INDEX_op_extu_i32_i64:
     case INDEX_op_ext32u_i64:
         tcg_out_movr(s, TCG_TYPE_I32, a0, a1);
@@ -2319,6 +2320,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i64:
     case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16u_i64:
+    case INDEX_op_ext16u_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index cddf977a58..8fa0c6cbc0 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -981,12 +981,18 @@ static void tcg_out_ext16s(TCGContext *s, TCGType t, TCGReg rd, TCGReg rn)
     tcg_out32(s, 0x06bf0070 | (COND_AL << 28) | (rd << 12) | rn);
 }
 
-static void tcg_out_ext16u(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
+static void tcg_out_ext16u_cond(TCGContext *s, ARMCond cond,
+                                TCGReg rd, TCGReg rn)
 {
     /* uxth */
     tcg_out32(s, 0x06ff0070 | (cond << 28) | (rd << 12) | rn);
 }
 
+static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rn)
+{
+    tcg_out_ext16u_cond(s, COND_AL, rd, rn);
+}
+
 static void tcg_out_bswap16(TCGContext *s, ARMCond cond,
                             TCGReg rd, TCGReg rn, int flags)
 {
@@ -1372,8 +1378,8 @@ DEFINE_TCG_OUT_ARG(tcg_out_arg_imm32, uint32_t, tcg_out_movi32,
     (tcg_out_movi32(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
 DEFINE_TCG_OUT_ARG(tcg_out_arg_reg8, TCGReg, tcg_out_ext8u_cond,
     (tcg_out_ext8u_cond(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
-DEFINE_TCG_OUT_ARG(tcg_out_arg_reg16, TCGReg, tcg_out_ext16u,
-    (tcg_out_ext16u(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
+DEFINE_TCG_OUT_ARG(tcg_out_arg_reg16, TCGReg, tcg_out_ext16u_cond,
+    (tcg_out_ext16u_cond(s, COND_AL, TCG_REG_TMP, arg), arg = TCG_REG_TMP))
 DEFINE_TCG_OUT_ARG(tcg_out_arg_reg32, TCGReg, tcg_out_mov_reg, )
 
 static TCGReg tcg_out_arg_reg64(TCGContext *s, TCGReg argreg,
@@ -2249,10 +2255,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_bswap32(s, COND_AL, args[0], args[1]);
         break;
 
-    case INDEX_op_ext16u_i32:
-        tcg_out_ext16u(s, COND_AL, args[0], args[1]);
-        break;
-
     case INDEX_op_deposit_i32:
         tcg_out_deposit(s, COND_AL, args[0], args[2],
                         args[3], args[4], const_args[2]);
@@ -2303,6 +2305,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16u_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 9cbf8a90f4..920524589d 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1274,7 +1274,7 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
     tcg_out_modrm(s, OPC_MOVSBL + P_REXB_RM + rexw, dest, src);
 }
 
-static inline void tcg_out_ext16u(TCGContext *s, int dest, int src)
+static void tcg_out_ext16u(TCGContext *s, TCGReg dest, TCGReg src)
 {
     /* movzwl */
     tcg_out_modrm(s, OPC_MOVZWL, dest, src);
@@ -2671,10 +2671,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_NOT, a0);
         break;
 
-    OP_32_64(ext16u):
-        tcg_out_ext16u(s, a0, a1);
-        break;
-
     case INDEX_op_qemu_ld_i32:
         tcg_out_qemu_ld(s, args, 0);
         break;
@@ -2839,6 +2835,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a365fbcf8f..08c2b65b19 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1246,11 +1246,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
         break;
 
-    case INDEX_op_ext16u_i32:
-    case INDEX_op_ext16u_i64:
-        tcg_out_ext16u(s, a0, a1);
-        break;
-
     case INDEX_op_ext32u_i64:
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, a0, a1);
@@ -1618,6 +1613,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 9d305b9cf4..220060c821 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -569,6 +569,11 @@ static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
     tcg_out_opc_reg(s, OPC_SEH, rd, TCG_REG_ZERO, rs);
 }
 
+static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_opc_imm(s, OPC_ANDI, rd, rs, 0xffff);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 526397c789..e203a01bac 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -789,7 +789,7 @@ static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
     tcg_out32(s, EXTSH | RA(dst) | RS(src));
 }
 
-static inline void tcg_out_ext16u(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_ext16u(TCGContext *s, TCGReg dst, TCGReg src)
 {
     tcg_out32(s, ANDI | SAI(src, dst, 0xffff));
 }
@@ -3127,6 +3127,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 12ee7b29af..c49decaae9 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1597,11 +1597,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_ext16u_i32:
-    case INDEX_op_ext16u_i64:
-        tcg_out_ext16u(s, a0, a1);
-        break;
-
     case INDEX_op_ext32u_i64:
     case INDEX_op_extu_i32_i64:
         tcg_out_ext32u(s, a0, a1);
@@ -1642,6 +1637,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 024867336a..0c489c2341 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1107,7 +1107,7 @@ static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
     tcg_out_insn(s, RRE, LGHR, dest, src);
 }
 
-static void tgen_ext16u(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
+static void tcg_out_ext16u(TCGContext *s, TCGReg dest, TCGReg src)
 {
     tcg_out_insn(s, RRE, LLGHR, dest, src);
 }
@@ -1157,7 +1157,7 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
         return;
     }
     if ((val & valid) == 0xffff) {
-        tgen_ext16u(s, TCG_TYPE_I64, dest, dest);
+        tcg_out_ext16u(s, dest, dest);
         return;
     }
 
@@ -1600,7 +1600,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
     case MO_UW | MO_BSWAP:
         /* swapped unsigned halfword load with upper bits zeroed */
         tcg_out_insn(s, RXY, LRVH, data, base, index, disp);
-        tgen_ext16u(s, TCG_TYPE_I64, data, data);
+        tcg_out_ext16u(s, data, data);
         break;
     case MO_UW:
         tcg_out_insn(s, RXY, LLGH, data, base, index, disp);
@@ -1809,7 +1809,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
         tcg_out_ext8u(s, TCG_REG_R4, data_reg);
         break;
     case MO_UW:
-        tgen_ext16u(s, TCG_TYPE_I64, TCG_REG_R4, data_reg);
+        tcg_out_ext16u(s, TCG_REG_R4, data_reg);
         break;
     case MO_UL:
         tgen_ext32u(s, TCG_REG_R4, data_reg);
@@ -2233,10 +2233,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_ext16u_i32:
-        tgen_ext16u(s, TCG_TYPE_I32, args[0], args[1]);
-        break;
-
     case INDEX_op_bswap16_i32:
         a0 = args[0], a1 = args[1], a2 = args[2];
         tcg_out_insn(s, RRE, LRVR, a0, a1);
@@ -2532,9 +2528,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext32s_i64:
         tgen_ext32s(s, args[0], args[1]);
         break;
-    case INDEX_op_ext16u_i64:
-        tgen_ext16u(s, TCG_TYPE_I64, args[0], args[1]);
-        break;
     case INDEX_op_extu_i32_i64:
     case INDEX_op_ext32u_i64:
         tgen_ext32u(s, args[0], args[1]);
@@ -2632,6 +2625,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index e4a8bd6e27..98784f6545 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -511,6 +511,12 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_arithi(s, rd, rs, 0xff, ARITH_AND);
 }
 
+static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    tcg_out_arithi(s, rd, rs, 16, SHIFT_SLL);
+    tcg_out_arithi(s, rd, rd, 16, SHIFT_SRL);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -896,8 +902,7 @@ static void emit_extend(TCGContext *s, TCGReg r, int op)
         tcg_out_ext8u(s, r, r);
         break;
     case MO_16:
-        tcg_out_arithi(s, r, r, 16, SHIFT_SLL);
-        tcg_out_arithi(s, r, r, 16, SHIFT_SRL);
+        tcg_out_ext16u(s, r, r);
         break;
     case MO_32:
         tcg_out_arith(s, r, r, 0, SHIFT_SRL);
@@ -1721,6 +1726,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 167f8123b1..49a83942fa 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -604,6 +604,17 @@ static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
     }
 }
 
+static void tcg_out_ext16u(TCGContext *s, TCGReg rd, TCGReg rs)
+{
+    if (TCG_TARGET_REG_BITS == 64) {
+        tcg_debug_assert(TCG_TARGET_HAS_ext16u_i64);
+        tcg_out_op_rr(s, INDEX_op_ext16u_i64, rd, rs);
+    } else {
+        tcg_debug_assert(TCG_TARGET_HAS_ext16u_i32);
+        tcg_out_op_rr(s, INDEX_op_ext16u_i32, rd, rs);
+    }
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -762,7 +773,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
-    CASE_32_64(ext16u)   /* Optional (TCG_TARGET_HAS_ext16u_*). */
     CASE_64(ext32s)      /* Optional (TCG_TARGET_HAS_ext32s_i64). */
     CASE_64(ext32u)      /* Optional (TCG_TARGET_HAS_ext32u_i64). */
     CASE_64(ext_i32)
@@ -845,6 +855,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8u_i64:
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16u_i32:
+    case INDEX_op_ext16u_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


