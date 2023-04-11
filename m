Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2S0-0004Ql-MU
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Rq-0004Ei-8o
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:05:29 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Rn-0000Wn-MR
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:05:25 -0400
Received: by mail-pj1-x102f.google.com with SMTP id w11so6872308pjh.5
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+hgCrNP0IdnEkU9MJx3UsjHmUujbJeM+FMeIW2ZuAD0=;
 b=g/J3TbvhyhJ0J/qJxAvQYY57BLYMzgxr3jnFXBEdTeqo1VVj68iIxdc5qEyNr9dMsi
 bACrgezg1DLaGaO1F97mtZT2FXLAe/r1sSWPQdpoBvJv3z2ew7CObTn8SmkXwrGPYGWJ
 h9j3JO1nfN4V0+gRhaiLdTloxHKnDGJdkPbY8J76fGGj1eX+VFYvtXEf6cCo9PZ7/biV
 FRrT7jvHWG/8kVq1IDcy/CuC2bm9h/F+YSkeCk6TjZw4w5Lpevd/hHZwgFb7aF0aPX7H
 5qRzhWezHrieAuf97NdmHxQUoHH24yV8JB4yF1pNERcj2TqT0XGIPBXBHGpZgy9f0atA
 dp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+hgCrNP0IdnEkU9MJx3UsjHmUujbJeM+FMeIW2ZuAD0=;
 b=8Q88oPiAmMCH3dMHyf5gZ0xDUTWlVB4vZhtRu4H1IENWiarPu7TuQmioYDB/Ejwkh/
 hMx/z1whBVuwLl/58FprmlJbnzkx2bnS8rWJF9qIhdlYqJ0GPrnes9ufPbtLO7NkxOnl
 Q5AhoCRkb7KXeyiIdkA/BJ+HxBNhpNZqJcGL3ibjugCh4LzythT12ZhoT7VBpkBEGHlb
 ONKS754FPjQidI1dnr5Ye3uVm6fzJxIS3clOPm/mo+MWN14VO+Up+Zmes0MPXBk1PrwC
 unY1P9tqb7BvgkY5K7AxPvxArdsaMmhoMF0T642wHd7/5jJ1Wk9jlsO4+3fu+XUdJVou
 iO/A==
X-Gm-Message-State: AAQBX9ejXRe2t34AUmgyyydnpiZ7fkrWVEFbivOHaEDDMh2aiLON/vEK
 dCZ//+ql6SX9hlvJfPbRumI28w==
X-Google-Smtp-Source: AKy350YpKRLjpEdIPUcPDmnYSV1MExXa7C0elTv0uskBK5X9B0r2oxkHfHJ9Te1PKNaNUAlBqCrQDQ==
X-Received: by 2002:a17:902:e192:b0:19f:36b1:c35 with SMTP id
 y18-20020a170902e19200b0019f36b10c35mr12469392pla.64.1681175121965; 
 Mon, 10 Apr 2023 18:05:21 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 03/54] tcg: Split out tcg_out_ext8s
Date: Mon, 10 Apr 2023 18:04:21 -0700
Message-Id: <20230411010512.5375-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:05:31 -0000

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
index b05193050d..14e8bdf56b 100644
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
index f4fa12667f..573067e535 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -775,7 +775,7 @@ static inline void tcg_out_rlw(TCGContext *s, int op, TCGReg ra, TCGReg rs,
     tcg_out32(s, op | RA(ra) | RS(rs) | SH(sh) | MB(mb) | ME(me));
 }
 
-static inline void tcg_out_ext8s(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg dst, TCGReg src)
 {
     tcg_out32(s, EXTSB | RA(dst) | RS(src));
 }
@@ -2626,7 +2626,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_ld8s_i32:
     case INDEX_op_ld8s_i64:
         tcg_out_mem_long(s, LBZ, LBZX, args[0], args[1], args[2]);
-        tcg_out_ext8s(s, args[0], args[0]);
+        tcg_out_ext8s(s, TCG_TYPE_REG, args[0], args[0]);
         break;
     case INDEX_op_ld16u_i32:
     case INDEX_op_ld16u_i64:
@@ -2974,10 +2974,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_qemu_st(s, args, true);
         break;
 
-    case INDEX_op_ext8s_i32:
-    case INDEX_op_ext8s_i64:
-        tcg_out_ext8s(s, args[0], args[1]);
-        break;
     case INDEX_op_ext16s_i32:
     case INDEX_op_ext16s_i64:
         tcg_out_ext16s(s, args[0], args[1]);
@@ -3125,6 +3121,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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


