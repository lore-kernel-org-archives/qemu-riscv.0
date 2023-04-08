Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyY9-00077u-QT
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyY8-00076l-QB
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:32 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXz-0005Zk-24
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:43:32 -0400
Received: by mail-pl1-x633.google.com with SMTP id bg9so507640plb.2
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gYwSzduz8Bue5pevbs9+ksI0Zfn7jotFrOGIqHRIGwg=;
 b=HCE4Xw4paLVa7YDIXgo/srr18xH8lDfmtV565neqYDLECSoVMxASz034Jte6G27Gld
 Y6oUYrYWxbxTyOH8fqxERgzd6v2Egc6QxK8IfrD0XEvAT6G4CbnaNJQzqEwMa3X5lOsH
 k1gZGMOoNzilv2vWkMNjsD49LWUkLSTN6/65nG+QSMwk6lvLN+//XcgkGAN0CKRN2cEX
 pA1oTp4Cu0DaO4BvYiUFNK9MkdbriAmMNHi75Nt1pWAFAUfdGIw8HV1aTtEslCz4vYoG
 zJuelrCfOvIpsvPCmukNgXIMIb7GtfXsi+/H6PkonoDV3SsXAgJQuScW6yQBHJA63BbA
 UbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gYwSzduz8Bue5pevbs9+ksI0Zfn7jotFrOGIqHRIGwg=;
 b=nLPUS1UhMMLDPTSJiqWJuhKnGA+OsESL5RkbXfYo491YrINU4w8GpHB8WD8WKf7r+J
 zLjNGkBXs1huPgtsNqAHfpgteamaPJ2LfQzV7wbh7nzNLEDR2nEt/1RoE2AF4mK2LDTV
 6U0hZESPhYftTmXjR+QizsF4RPoxoP04DSS4qRcWRoB2nVGeVnGFFa8DjNdE/yKdagmw
 U2yVOmIqg55L5hC4RFo8hEH8PZu/ACprq5IRSQd/ORFBHj36noNiJq5jsNdUiqcmkGNC
 QZwfkh/xLtnh6TLK2aOVtvZzdxpXKloPZVPi56V/jVuMVahCz+ztpmgKt9rhYHSVlrPD
 EHPw==
X-Gm-Message-State: AAQBX9fh7INMl+hXKLeN0lgypd11MGoaG0LkqzDwyJ9HHdPm9LWVwYav
 /Fo16YIVW3TFRxCnQ/2hijrO2w==
X-Google-Smtp-Source: AKy350bf5Ozi9g5WW2UF3LBC36SYBVv3KDOI+hgvmiGHK0npi+Se00ETVwqzS69faVE4UstmOgpb/w==
X-Received: by 2002:a17:90a:bc85:b0:246:634d:a89c with SMTP id
 x5-20020a17090abc8500b00246634da89cmr3147958pjr.41.1680921801382; 
 Fri, 07 Apr 2023 19:43:21 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 05/42] tcg: Split out tcg_out_ext16s
Date: Fri,  7 Apr 2023 19:42:37 -0700
Message-Id: <20230408024314.3357414-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:43:33 -0000

We will need a backend interface for performing 16-bit sign-extend.
Use it in tcg_reg_alloc_op in the meantime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                        |  7 +++++++
 tcg/aarch64/tcg-target.c.inc     | 13 ++++++++-----
 tcg/arm/tcg-target.c.inc         | 10 ++++------
 tcg/i386/tcg-target.c.inc        | 16 ++++++++--------
 tcg/loongarch64/tcg-target.c.inc | 13 +++++--------
 tcg/mips/tcg-target.c.inc        | 11 ++++++++---
 tcg/ppc/tcg-target.c.inc         | 12 +++++-------
 tcg/riscv/tcg-target.c.inc       |  9 +++------
 tcg/s390x/tcg-target.c.inc       | 12 ++++--------
 tcg/sparc64/tcg-target.c.inc     |  7 +++++++
 tcg/tci/tcg-target.c.inc         | 21 ++++++++++++++++++++-
 11 files changed, 79 insertions(+), 52 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index b02ffc5679..739f92c2ee 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -106,6 +106,7 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
 static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg);
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
@@ -4509,6 +4510,12 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     case INDEX_op_ext8u_i64:
         tcg_out_ext8u(s, new_args[0], new_args[1]);
         break;
+    case INDEX_op_ext16s_i32:
+        tcg_out_ext16s(s, TCG_TYPE_I32, new_args[0], new_args[1]);
+        break;
+    case INDEX_op_ext16s_i64:
+        tcg_out_ext16s(s, TCG_TYPE_I64, new_args[0], new_args[1]);
+        break;
     default:
         if (def->flags & TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index cca91363ce..3527c14d04 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1424,6 +1424,11 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rn)
     tcg_out_sxt(s, type, MO_8, rd, rn);
 }
 
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rn)
+{
+    tcg_out_sxt(s, type, MO_16, rd, rn);
+}
+
 static inline void tcg_out_uxt(TCGContext *s, MemOp s_bits,
                                TCGReg rd, TCGReg rn)
 {
@@ -2233,17 +2238,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_rev(s, TCG_TYPE_I32, MO_16, a0, a1);
         if (a2 & TCG_BSWAP_OS) {
             /* Output must be sign-extended. */
-            tcg_out_sxt(s, ext, MO_16, a0, a0);
+            tcg_out_ext16s(s, ext, a0, a0);
         } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
             /* Output must be zero-extended, but input isn't. */
             tcg_out_uxt(s, MO_16, a0, a0);
         }
         break;
 
-    case INDEX_op_ext16s_i64:
-    case INDEX_op_ext16s_i32:
-        tcg_out_sxt(s, ext, MO_16, a0, a1);
-        break;
     case INDEX_op_ext_i32_i64:
     case INDEX_op_ext32s_i64:
         tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);
@@ -2316,6 +2317,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i64:
+    case INDEX_op_ext16s_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index b99f08a54b..cddf977a58 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -975,10 +975,10 @@ tcg_out_ext8u_cond(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
     tcg_out_dat_imm(s, cond, ARITH_AND, rd, rn, 0xff);
 }
 
-static void tcg_out_ext16s(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
+static void tcg_out_ext16s(TCGContext *s, TCGType t, TCGReg rd, TCGReg rn)
 {
     /* sxth */
-    tcg_out32(s, 0x06bf0070 | (cond << 28) | (rd << 12) | rn);
+    tcg_out32(s, 0x06bf0070 | (COND_AL << 28) | (rd << 12) | rn);
 }
 
 static void tcg_out_ext16u(TCGContext *s, ARMCond cond, TCGReg rd, TCGReg rn)
@@ -1541,7 +1541,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
         tcg_out_ext8s(s, TCG_TYPE_I32, datalo, TCG_REG_R0);
         break;
     case MO_SW:
-        tcg_out_ext16s(s, COND_AL, datalo, TCG_REG_R0);
+        tcg_out_ext16s(s, TCG_TYPE_I32, datalo, TCG_REG_R0);
         break;
     default:
         tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
@@ -2249,9 +2249,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_bswap32(s, COND_AL, args[0], args[1]);
         break;
 
-    case INDEX_op_ext16s_i32:
-        tcg_out_ext16s(s, COND_AL, args[0], args[1]);
-        break;
     case INDEX_op_ext16u_i32:
         tcg_out_ext16u(s, COND_AL, args[0], args[1]);
         break;
@@ -2305,6 +2302,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_tb:  /* Always emitted via tcg_out_goto_tb.  */
     case INDEX_op_ext8s_i32:  /* Always emitted via tcg_reg_alloc_op.  */
     case INDEX_op_ext8u_i32:
+    case INDEX_op_ext16s_i32:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index cb4bbf2071..9cbf8a90f4 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1280,8 +1280,9 @@ static inline void tcg_out_ext16u(TCGContext *s, int dest, int src)
     tcg_out_modrm(s, OPC_MOVZWL, dest, src);
 }
 
-static inline void tcg_out_ext16s(TCGContext *s, int dest, int src, int rexw)
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 {
+    int rexw = type == TCG_TYPE_I32 ? 0 : P_REXW;
     /* movsw[lq] */
     tcg_out_modrm(s, OPC_MOVSWL + rexw, dest, src);
 }
@@ -1891,7 +1892,6 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     MemOp opc = get_memop(oi);
     TCGReg data_reg;
     tcg_insn_unit **label_ptr = &l->label_ptr[0];
-    int rexw = (l->type == TCG_TYPE_I64 ? P_REXW : 0);
 
     /* resolve label address */
     tcg_patch32(label_ptr[0], s->code_ptr - label_ptr[0] - 4);
@@ -1933,7 +1933,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_out_ext8s(s, l->type, data_reg, TCG_REG_EAX);
         break;
     case MO_SW:
-        tcg_out_ext16s(s, data_reg, TCG_REG_EAX, rexw);
+        tcg_out_ext16s(s, l->type, data_reg, TCG_REG_EAX);
         break;
 #if TCG_TARGET_REG_BITS == 64
     case MO_SL:
@@ -2153,6 +2153,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                    TCGReg base, int index, intptr_t ofs,
                                    int seg, bool is64, MemOp memop)
 {
+    TCGType type = is64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
     bool use_movbe = false;
     int rexw = is64 * P_REXW;
     int movop = OPC_MOVL_GvEv;
@@ -2195,7 +2196,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
         if (use_movbe) {
             tcg_out_modrm_sib_offset(s, OPC_MOVBE_GyMy + P_DATA16 + seg,
                                      datalo, base, index, 0, ofs);
-            tcg_out_ext16s(s, datalo, datalo, rexw);
+            tcg_out_ext16s(s, type, datalo, datalo);
         } else {
             tcg_out_modrm_sib_offset(s, OPC_MOVSWL + rexw + seg,
                                      datalo, base, index, 0, ofs);
@@ -2670,9 +2671,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_modrm(s, OPC_GRP3_Ev + rexw, EXT3_NOT, a0);
         break;
 
-    OP_32_64(ext16s):
-        tcg_out_ext16s(s, a0, a1, rexw);
-        break;
     OP_32_64(ext16u):
         tcg_out_ext16u(s, a0, a1);
         break;
@@ -2816,7 +2814,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if (a1 < 4 && a0 < 8) {
             tcg_out_modrm(s, OPC_MOVSBL, a0, a1 + 4);
         } else {
-            tcg_out_ext16s(s, a0, a1, 0);
+            tcg_out_ext16s(s, TCG_TYPE_I32, a0, a1);
             tcg_out_shifti(s, SHIFT_SAR, a0, 8);
         }
         break;
@@ -2839,6 +2837,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index a206b9cfc5..a365fbcf8f 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -446,7 +446,7 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
     tcg_out_opc_sext_b(s, ret, arg);
 }
 
-static void tcg_out_ext16s(TCGContext *s, TCGReg ret, TCGReg arg)
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     tcg_out_opc_sext_h(s, ret, arg);
 }
@@ -896,7 +896,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
         tcg_out_ext8s(s, type, l->datalo_reg, TCG_REG_A0);
         break;
     case MO_SW:
-        tcg_out_ext16s(s, l->datalo_reg, TCG_REG_A0);
+        tcg_out_ext16s(s, type, l->datalo_reg, TCG_REG_A0);
         break;
     case MO_SL:
         tcg_out_ext32s(s, l->datalo_reg, TCG_REG_A0);
@@ -1246,11 +1246,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
         break;
 
-    case INDEX_op_ext16s_i32:
-    case INDEX_op_ext16s_i64:
-        tcg_out_ext16s(s, a0, a1);
-        break;
-
     case INDEX_op_ext16u_i32:
     case INDEX_op_ext16u_i64:
         tcg_out_ext16u(s, a0, a1);
@@ -1351,7 +1346,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_bswap16_i64:
         tcg_out_opc_revb_2h(s, a0, a1);
         if (a2 & TCG_BSWAP_OS) {
-            tcg_out_ext16s(s, a0, a0);
+            tcg_out_ext16s(s, TCG_TYPE_REG, a0, a0);
         } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
             tcg_out_ext16u(s, a0, a0);
         }
@@ -1621,6 +1616,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 5a712e3da5..9d305b9cf4 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -563,6 +563,12 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
     tcg_out_opc_imm(s, OPC_ANDI, rd, rs, 0xff);
 }
 
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
+{
+    tcg_debug_assert(TCG_TARGET_HAS_ext16s_i32);
+    tcg_out_opc_reg(s, OPC_SEH, rd, TCG_REG_ZERO, rs);
+}
+
 static void tcg_out_addi_ptr(TCGContext *s, TCGReg rd, TCGReg rs,
                              tcg_target_long imm)
 {
@@ -2256,9 +2262,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_not_i64:
         i1 = OPC_NOR;
         goto do_unary;
-    case INDEX_op_ext16s_i32:
-    case INDEX_op_ext16s_i64:
-        i1 = OPC_SEH;
     do_unary:
         tcg_out_opc_reg(s, i1, a0, TCG_REG_ZERO, a1);
         break;
@@ -2430,6 +2433,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 61f489eae1..526397c789 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -784,7 +784,7 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg dst, TCGReg src)
     tcg_out32(s, ANDI | SAI(src, dst, 0xff));
 }
 
-static inline void tcg_out_ext16s(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
 {
     tcg_out32(s, EXTSH | RA(dst) | RS(src));
 }
@@ -842,7 +842,7 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src, int flags)
     if (have_isa_3_10) {
         tcg_out32(s, BRH | RA(dst) | RS(src));
         if (flags & TCG_BSWAP_OS) {
-            tcg_out_ext16s(s, dst, dst);
+            tcg_out_ext16s(s, TCG_TYPE_REG, dst, dst);
         } else if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
             tcg_out_ext16u(s, dst, dst);
         }
@@ -861,7 +861,7 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src, int flags)
     tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);
 
     if (flags & TCG_BSWAP_OS) {
-        tcg_out_ext16s(s, dst, tmp);
+        tcg_out_ext16s(s, TCG_TYPE_REG, dst, tmp);
     } else {
         tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
     }
@@ -2978,10 +2978,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_ext16s_i32:
-    case INDEX_op_ext16s_i64:
-        tcg_out_ext16s(s, args[0], args[1]);
-        break;
     case INDEX_op_ext_i32_i64:
     case INDEX_op_ext32s_i64:
         tcg_out_ext32s(s, args[0], args[1]);
@@ -3129,6 +3125,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index d9b08014ce..12ee7b29af 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -591,7 +591,7 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
     tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 24);
 }
 
-static void tcg_out_ext16s(TCGContext *s, TCGReg ret, TCGReg arg)
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
     tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 16);
     tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 16);
@@ -1607,11 +1607,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_ext32u(s, a0, a1);
         break;
 
-    case INDEX_op_ext16s_i32:
-    case INDEX_op_ext16s_i64:
-        tcg_out_ext16s(s, a0, a1);
-        break;
-
     case INDEX_op_ext32s_i64:
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_ext_i32_i64:
@@ -1645,6 +1640,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 338a91c591..024867336a 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1102,7 +1102,7 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg dest, TCGReg src)
     tcg_out_insn(s, RRE, LLGCR, dest, src);
 }
 
-static void tgen_ext16s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg dest, TCGReg src)
 {
     tcg_out_insn(s, RRE, LGHR, dest, src);
 }
@@ -1609,7 +1609,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
     case MO_SW | MO_BSWAP:
         /* swapped sign-extended halfword load */
         tcg_out_insn(s, RXY, LRVH, data, base, index, disp);
-        tgen_ext16s(s, TCG_TYPE_I64, data, data);
+        tcg_out_ext16s(s, TCG_TYPE_REG, data, data);
         break;
     case MO_SW:
         tcg_out_insn(s, RXY, LGH, data, base, index, disp);
@@ -2233,9 +2233,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_ext16s_i32:
-        tgen_ext16s(s, TCG_TYPE_I32, args[0], args[1]);
-        break;
     case INDEX_op_ext16u_i32:
         tgen_ext16u(s, TCG_TYPE_I32, args[0], args[1]);
         break;
@@ -2531,9 +2528,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_ext16s_i64:
-        tgen_ext16s(s, TCG_TYPE_I64, args[0], args[1]);
-        break;
     case INDEX_op_ext_i32_i64:
     case INDEX_op_ext32s_i64:
         tgen_ext32s(s, args[0], args[1]);
@@ -2636,6 +2630,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 4792b04b54..e4a8bd6e27 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -501,6 +501,11 @@ static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
     g_assert_not_reached();
 }
 
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
+{
+    g_assert_not_reached();
+}
+
 static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
 {
     tcg_out_arithi(s, rd, rs, 0xff, ARITH_AND);
@@ -1714,6 +1719,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index e946d9165e..167f8123b1 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -586,6 +586,24 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg rd, TCGReg rs)
     }
 }
 
+static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+        tcg_debug_assert(TCG_TARGET_HAS_ext16s_i32);
+        tcg_out_op_rr(s, INDEX_op_ext16s_i32, rd, rs);
+        break;
+#if TCG_TARGET_REG_BITS == 64
+    case TCG_TYPE_I64:
+        tcg_debug_assert(TCG_TARGET_HAS_ext16s_i64);
+        tcg_out_op_rr(s, INDEX_op_ext16s_i64, rd, rs);
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
@@ -744,7 +762,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
-    CASE_32_64(ext16s)   /* Optional (TCG_TARGET_HAS_ext16s_*). */
     CASE_32_64(ext16u)   /* Optional (TCG_TARGET_HAS_ext16u_*). */
     CASE_64(ext32s)      /* Optional (TCG_TARGET_HAS_ext32s_i64). */
     CASE_64(ext32u)      /* Optional (TCG_TARGET_HAS_ext32u_i64). */
@@ -826,6 +843,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
     case INDEX_op_ext8u_i64:
+    case INDEX_op_ext16s_i32:
+    case INDEX_op_ext16s_i64:
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


