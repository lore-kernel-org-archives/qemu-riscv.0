Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm2Wh-0005HV-2r
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WZ-0004JO-Jk
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:19 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2WS-0001xW-W0
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 21:10:19 -0400
Received: by mail-pl1-x630.google.com with SMTP id w11so6270601plp.13
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 18:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WYEgkTOsc96O4D7hGW1wN/Aj6gGnQ1iGDs8li+UkFME=;
 b=KvARFRfHC8dlOvivAHGr25otAOT7hL6nVG2Pc6E+dNPThkikOiPpZ1KuOfH9WJ2bYo
 uOcL/JfXdDb4AL6b6ZEOX14cVW5cE9DqauePgvJUJTbs3eO1145Y6IxHmhHT2fRsu6oU
 E0vor7/UM5Iaxs/sFYfn+474HIvaL0mafqBtS2G2wihFCVxWzsPkWgmMm1f+lSiFGkMK
 JIEg0NbaEMgqKrQm9YRej5YnA5Gup9jGcMIyqkiVMdcxvDP/WaDNE95rygH9z2Pv0y5d
 +O5EsEbpMectazjFOD+SmsQsD0kUdknVGktKiFnL1Y087JhsdeLeKWsWPGTU49YAr/YF
 +f3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WYEgkTOsc96O4D7hGW1wN/Aj6gGnQ1iGDs8li+UkFME=;
 b=OOMAFh8/MlQRZLjaUqeKYIGXQR/6h8CILFqedMmr0j6X7AuxxX8D2AdjXdTXVleKY3
 RWM35Biu+bLPbm3Kou9Yty+donQE7b2CkSYqQMvaDtpJRKer6jTAAQmMjSZCZ8QMm8NF
 cuQNhAt0ptkDRIn6AJ3DEG5B+glp6S2jMeAaWnKULquZKH7VR6lozKs6QyVdBNO/zNd9
 9v0BZpwQhM+h/7ZwvykNLOldk2hYTqZuC/3oq6BwuQASxi/LxqGVMrfkV2RJ4fO03T/s
 kbRakp/JMoCjILcbDNy6wmd7XcESx66Eyd/IBfWz2Jtdgmkuno8WHCjhOHmlE4N0fYCw
 AGMw==
X-Gm-Message-State: AAQBX9eQ1Q7lF4qySeb+DIeQ1gkcVQbLmzWqd4jj+6dGeZrDtd2RjCfR
 A52+drF+u1MZgIu7kDTanQ4PPA==
X-Google-Smtp-Source: AKy350aXm2kjhONVD4pDBoif/7wDTydY3eQaUCG9wAwSkSbNoedjpfn25qrBnMaD9A5wiaCO0aG6Pg==
X-Received: by 2002:a17:902:e848:b0:1a1:a4eb:54de with SMTP id
 t8-20020a170902e84800b001a1a4eb54demr16757771plg.26.1681175411154; 
 Mon, 10 Apr 2023 18:10:11 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 46/54] tcg/mips: Remove MO_BSWAP handling
Date: Mon, 10 Apr 2023 18:05:04 -0700
Message-Id: <20230411010512.5375-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:10:20 -0000

While performing the load in the delay slot of the call to the common
bswap helper function is cute, it is not worth the added complexity.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h     |   4 +-
 tcg/mips/tcg-target.c.inc | 284 ++++++--------------------------------
 2 files changed, 48 insertions(+), 240 deletions(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 2431fc5353..42bd7fff01 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -204,8 +204,8 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_ext16u_i64       0 /* andi rt, rs, 0xffff */
 #endif
 
-#define TCG_TARGET_DEFAULT_MO (0)
-#define TCG_TARGET_HAS_MEMORY_BSWAP     1
+#define TCG_TARGET_DEFAULT_MO           0
+#define TCG_TARGET_HAS_MEMORY_BSWAP     0
 
 #define TCG_TARGET_NEED_LDST_LABELS
 
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 9f7c9cd688..b6db8c6884 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1088,31 +1088,35 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg,
 }
 
 #if defined(CONFIG_SOFTMMU)
-static void * const qemu_ld_helpers[(MO_SSIZE | MO_BSWAP) + 1] = {
+static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
     [MO_UB]   = helper_ret_ldub_mmu,
     [MO_SB]   = helper_ret_ldsb_mmu,
-    [MO_LEUW] = helper_le_lduw_mmu,
-    [MO_LESW] = helper_le_ldsw_mmu,
-    [MO_LEUL] = helper_le_ldul_mmu,
-    [MO_LEUQ] = helper_le_ldq_mmu,
-    [MO_BEUW] = helper_be_lduw_mmu,
-    [MO_BESW] = helper_be_ldsw_mmu,
-    [MO_BEUL] = helper_be_ldul_mmu,
-    [MO_BEUQ] = helper_be_ldq_mmu,
-#if TCG_TARGET_REG_BITS == 64
-    [MO_LESL] = helper_le_ldsl_mmu,
-    [MO_BESL] = helper_be_ldsl_mmu,
+#if HOST_BIG_ENDIAN
+    [MO_UW] = helper_be_lduw_mmu,
+    [MO_SW] = helper_be_ldsw_mmu,
+    [MO_UL] = helper_be_ldul_mmu,
+    [MO_SL] = helper_be_ldsl_mmu,
+    [MO_UQ] = helper_be_ldq_mmu,
+#else
+    [MO_UW] = helper_le_lduw_mmu,
+    [MO_SW] = helper_le_ldsw_mmu,
+    [MO_UL] = helper_le_ldul_mmu,
+    [MO_UQ] = helper_le_ldq_mmu,
+    [MO_SL] = helper_le_ldsl_mmu,
 #endif
 };
 
-static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
+static void * const qemu_st_helpers[MO_SIZE + 1] = {
     [MO_UB]   = helper_ret_stb_mmu,
-    [MO_LEUW] = helper_le_stw_mmu,
-    [MO_LEUL] = helper_le_stl_mmu,
-    [MO_LEUQ] = helper_le_stq_mmu,
-    [MO_BEUW] = helper_be_stw_mmu,
-    [MO_BEUL] = helper_be_stl_mmu,
-    [MO_BEUQ] = helper_be_stq_mmu,
+#if HOST_BIG_ENDIAN
+    [MO_UW] = helper_be_stw_mmu,
+    [MO_UL] = helper_be_stl_mmu,
+    [MO_UQ] = helper_be_stq_mmu,
+#else
+    [MO_UW] = helper_le_stw_mmu,
+    [MO_UL] = helper_le_stl_mmu,
+    [MO_UQ] = helper_le_stq_mmu,
+#endif
 };
 
 /* We expect to use a 16-bit negative offset from ENV.  */
@@ -1248,7 +1252,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     tcg_out_ld_helper_args(s, l, &ldst_helper_param);
 
-    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)], false);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SSIZE], false);
     /* delay slot */
     tcg_out_nop(s);
 
@@ -1278,7 +1282,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     tcg_out_st_helper_args(s, l, &ldst_helper_param);
 
-    tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)], false);
+    tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
     /* delay slot */
     tcg_out_nop(s);
 
@@ -1371,52 +1375,19 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
                                    TCGReg base, MemOp opc, TCGType type)
 {
-    switch (opc & (MO_SSIZE | MO_BSWAP)) {
+    switch (opc & MO_SSIZE) {
     case MO_UB:
         tcg_out_opc_imm(s, OPC_LBU, lo, base, 0);
         break;
     case MO_SB:
         tcg_out_opc_imm(s, OPC_LB, lo, base, 0);
         break;
-    case MO_UW | MO_BSWAP:
-        tcg_out_opc_imm(s, OPC_LHU, TCG_TMP1, base, 0);
-        tcg_out_bswap16(s, lo, TCG_TMP1, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-        break;
     case MO_UW:
         tcg_out_opc_imm(s, OPC_LHU, lo, base, 0);
         break;
-    case MO_SW | MO_BSWAP:
-        tcg_out_opc_imm(s, OPC_LHU, TCG_TMP1, base, 0);
-        tcg_out_bswap16(s, lo, TCG_TMP1, TCG_BSWAP_IZ | TCG_BSWAP_OS);
-        break;
     case MO_SW:
         tcg_out_opc_imm(s, OPC_LH, lo, base, 0);
         break;
-    case MO_UL | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
-            if (use_mips32r2_instructions) {
-                tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
-                tcg_out_bswap32(s, lo, lo, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-            } else {
-                tcg_out_bswap_subr(s, bswap32u_addr);
-                /* delay slot */
-                tcg_out_opc_imm(s, OPC_LWU, TCG_TMP0, base, 0);
-                tcg_out_mov(s, TCG_TYPE_I64, lo, TCG_TMP3);
-            }
-            break;
-        }
-        /* FALLTHRU */
-    case MO_SL | MO_BSWAP:
-        if (use_mips32r2_instructions) {
-            tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
-            tcg_out_bswap32(s, lo, lo, 0);
-        } else {
-            tcg_out_bswap_subr(s, bswap32_addr);
-            /* delay slot */
-            tcg_out_opc_imm(s, OPC_LW, TCG_TMP0, base, 0);
-            tcg_out_mov(s, TCG_TYPE_I32, lo, TCG_TMP3);
-        }
-        break;
     case MO_UL:
         if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
             tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
@@ -1426,35 +1397,6 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
     case MO_SL:
         tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
         break;
-    case MO_UQ | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64) {
-            if (use_mips32r2_instructions) {
-                tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
-                tcg_out_bswap64(s, lo, lo);
-            } else {
-                tcg_out_bswap_subr(s, bswap64_addr);
-                /* delay slot */
-                tcg_out_opc_imm(s, OPC_LD, TCG_TMP0, base, 0);
-                tcg_out_mov(s, TCG_TYPE_I64, lo, TCG_TMP3);
-            }
-        } else if (use_mips32r2_instructions) {
-            tcg_out_opc_imm(s, OPC_LW, TCG_TMP0, base, 0);
-            tcg_out_opc_imm(s, OPC_LW, TCG_TMP1, base, 4);
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, TCG_TMP0);
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, TCG_TMP1);
-            tcg_out_opc_sa(s, OPC_ROTR, MIPS_BE ? lo : hi, TCG_TMP0, 16);
-            tcg_out_opc_sa(s, OPC_ROTR, MIPS_BE ? hi : lo, TCG_TMP1, 16);
-        } else {
-            tcg_out_bswap_subr(s, bswap32_addr);
-            /* delay slot */
-            tcg_out_opc_imm(s, OPC_LW, TCG_TMP0, base, 0);
-            tcg_out_opc_imm(s, OPC_LW, TCG_TMP0, base, 4);
-            tcg_out_bswap_subr(s, bswap32_addr);
-            /* delay slot */
-            tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? lo : hi, TCG_TMP3);
-            tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? hi : lo, TCG_TMP3);
-        }
-        break;
     case MO_UQ:
         /* Prefer to load from offset 0 first, but allow for overlap.  */
         if (TCG_TARGET_REG_BITS == 64) {
@@ -1479,25 +1421,20 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
     const MIPSInsn lw2 = MIPS_BE ? OPC_LWR : OPC_LWL;
     const MIPSInsn ld1 = MIPS_BE ? OPC_LDL : OPC_LDR;
     const MIPSInsn ld2 = MIPS_BE ? OPC_LDR : OPC_LDL;
+    bool sgn = opc & MO_SIGN;
 
-    bool sgn = (opc & MO_SIGN);
-
-    switch (opc & (MO_SSIZE | MO_BSWAP)) {
-    case MO_SW | MO_BE:
-    case MO_UW | MO_BE:
-        tcg_out_opc_imm(s, sgn ? OPC_LB : OPC_LBU, TCG_TMP0, base, 0);
-        tcg_out_opc_imm(s, OPC_LBU, lo, base, 1);
-        if (use_mips32r2_instructions) {
-            tcg_out_opc_bf(s, OPC_INS, lo, TCG_TMP0, 31, 8);
-        } else {
-            tcg_out_opc_sa(s, OPC_SLL, TCG_TMP0, TCG_TMP0, 8);
-            tcg_out_opc_reg(s, OPC_OR, lo, TCG_TMP0, TCG_TMP1);
-        }
-        break;
-
-    case MO_SW | MO_LE:
-    case MO_UW | MO_LE:
-        if (use_mips32r2_instructions && lo != base) {
+    switch (opc & MO_SIZE) {
+    case MO_16:
+        if (HOST_BIG_ENDIAN) {
+            tcg_out_opc_imm(s, sgn ? OPC_LB : OPC_LBU, TCG_TMP0, base, 0);
+            tcg_out_opc_imm(s, OPC_LBU, lo, base, 1);
+            if (use_mips32r2_instructions) {
+                tcg_out_opc_bf(s, OPC_INS, lo, TCG_TMP0, 31, 8);
+            } else {
+                tcg_out_opc_sa(s, OPC_SLL, TCG_TMP0, TCG_TMP0, 8);
+                tcg_out_opc_reg(s, OPC_OR, lo, TCG_TMP0, TCG_TMP1);
+            }
+        } else if (use_mips32r2_instructions && lo != base) {
             tcg_out_opc_imm(s, OPC_LBU, lo, base, 0);
             tcg_out_opc_imm(s, sgn ? OPC_LB : OPC_LBU, TCG_TMP0, base, 1);
             tcg_out_opc_bf(s, OPC_INS, lo, TCG_TMP0, 31, 8);
@@ -1509,8 +1446,7 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
         }
         break;
 
-    case MO_SL:
-    case MO_UL:
+    case MO_32:
         tcg_out_opc_imm(s, lw1, lo, base, 0);
         tcg_out_opc_imm(s, lw2, lo, base, 3);
         if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn) {
@@ -1518,28 +1454,7 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
         }
         break;
 
-    case MO_UL | MO_BSWAP:
-    case MO_SL | MO_BSWAP:
-        if (use_mips32r2_instructions) {
-            tcg_out_opc_imm(s, lw1, lo, base, 0);
-            tcg_out_opc_imm(s, lw2, lo, base, 3);
-            tcg_out_bswap32(s, lo, lo,
-                            TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64
-                            ? (sgn ? TCG_BSWAP_OS : TCG_BSWAP_OZ) : 0);
-        } else {
-            const tcg_insn_unit *subr =
-                (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn
-                 ? bswap32u_addr : bswap32_addr);
-
-            tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0);
-            tcg_out_bswap_subr(s, subr);
-            /* delay slot */
-            tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 3);
-            tcg_out_mov(s, type, lo, TCG_TMP3);
-        }
-        break;
-
-    case MO_UQ:
+    case MO_64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_opc_imm(s, ld1, lo, base, 0);
             tcg_out_opc_imm(s, ld2, lo, base, 7);
@@ -1551,42 +1466,6 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
         }
         break;
 
-    case MO_UQ | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64) {
-            if (use_mips32r2_instructions) {
-                tcg_out_opc_imm(s, ld1, lo, base, 0);
-                tcg_out_opc_imm(s, ld2, lo, base, 7);
-                tcg_out_bswap64(s, lo, lo);
-            } else {
-                tcg_out_opc_imm(s, ld1, TCG_TMP0, base, 0);
-                tcg_out_bswap_subr(s, bswap64_addr);
-                /* delay slot */
-                tcg_out_opc_imm(s, ld2, TCG_TMP0, base, 7);
-                tcg_out_mov(s, TCG_TYPE_I64, lo, TCG_TMP3);
-            }
-        } else if (use_mips32r2_instructions) {
-            tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0 + 0);
-            tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 0 + 3);
-            tcg_out_opc_imm(s, lw1, TCG_TMP1, base, 4 + 0);
-            tcg_out_opc_imm(s, lw2, TCG_TMP1, base, 4 + 3);
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, TCG_TMP0);
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, TCG_TMP1);
-            tcg_out_opc_sa(s, OPC_ROTR, MIPS_BE ? lo : hi, TCG_TMP0, 16);
-            tcg_out_opc_sa(s, OPC_ROTR, MIPS_BE ? hi : lo, TCG_TMP1, 16);
-        } else {
-            tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0 + 0);
-            tcg_out_bswap_subr(s, bswap32_addr);
-            /* delay slot */
-            tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 0 + 3);
-            tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 4 + 0);
-            tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? lo : hi, TCG_TMP3);
-            tcg_out_bswap_subr(s, bswap32_addr);
-            /* delay slot */
-            tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 4 + 3);
-            tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? hi : lo, TCG_TMP3);
-        }
-        break;
-
     default:
         g_assert_not_reached();
     }
@@ -1654,50 +1533,16 @@ static void tcg_out_qemu_ld(TCGContext *s,
 static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
                                    TCGReg base, MemOp opc)
 {
-    /* Don't clutter the code below with checks to avoid bswapping ZERO.  */
-    if ((lo | hi) == 0) {
-        opc &= ~MO_BSWAP;
-    }
-
-    switch (opc & (MO_SIZE | MO_BSWAP)) {
+    switch (opc & MO_SIZE) {
     case MO_8:
         tcg_out_opc_imm(s, OPC_SB, lo, base, 0);
         break;
-
-    case MO_16 | MO_BSWAP:
-        tcg_out_bswap16(s, TCG_TMP1, lo, 0);
-        lo = TCG_TMP1;
-        /* FALLTHRU */
     case MO_16:
         tcg_out_opc_imm(s, OPC_SH, lo, base, 0);
         break;
-
-    case MO_32 | MO_BSWAP:
-        tcg_out_bswap32(s, TCG_TMP3, lo, 0);
-        lo = TCG_TMP3;
-        /* FALLTHRU */
     case MO_32:
         tcg_out_opc_imm(s, OPC_SW, lo, base, 0);
         break;
-
-    case MO_64 | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64) {
-            tcg_out_bswap64(s, TCG_TMP3, lo);
-            tcg_out_opc_imm(s, OPC_SD, TCG_TMP3, base, 0);
-        } else if (use_mips32r2_instructions) {
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, MIPS_BE ? lo : hi);
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, MIPS_BE ? hi : lo);
-            tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP0, TCG_TMP0, 16);
-            tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP1, TCG_TMP1, 16);
-            tcg_out_opc_imm(s, OPC_SW, TCG_TMP0, base, 0);
-            tcg_out_opc_imm(s, OPC_SW, TCG_TMP1, base, 4);
-        } else {
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? lo : hi, 0);
-            tcg_out_opc_imm(s, OPC_SW, TCG_TMP3, base, 0);
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo, 0);
-            tcg_out_opc_imm(s, OPC_SW, TCG_TMP3, base, 4);
-        }
-        break;
     case MO_64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_opc_imm(s, OPC_SD, lo, base, 0);
@@ -1706,7 +1551,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, OPC_SW, MIPS_BE ? lo : hi, base, 4);
         }
         break;
-
     default:
         g_assert_not_reached();
     }
@@ -1720,54 +1564,18 @@ static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
     const MIPSInsn sd1 = MIPS_BE ? OPC_SDL : OPC_SDR;
     const MIPSInsn sd2 = MIPS_BE ? OPC_SDR : OPC_SDL;
 
-    /* Don't clutter the code below with checks to avoid bswapping ZERO.  */
-    if ((lo | hi) == 0) {
-        opc &= ~MO_BSWAP;
-    }
-
-    switch (opc & (MO_SIZE | MO_BSWAP)) {
-    case MO_16 | MO_BE:
+    switch (opc & MO_SIZE) {
+    case MO_16:
         tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, lo, 8);
-        tcg_out_opc_imm(s, OPC_SB, TCG_TMP0, base, 0);
-        tcg_out_opc_imm(s, OPC_SB, lo, base, 1);
+        tcg_out_opc_imm(s, OPC_SB, HOST_BIG_ENDIAN ? TCG_TMP0 : lo, base, 0);
+        tcg_out_opc_imm(s, OPC_SB, HOST_BIG_ENDIAN ? lo : TCG_TMP0, base, 1);
         break;
 
-    case MO_16 | MO_LE:
-        tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, lo, 8);
-        tcg_out_opc_imm(s, OPC_SB, lo, base, 0);
-        tcg_out_opc_imm(s, OPC_SB, TCG_TMP0, base, 1);
-        break;
-
-    case MO_32 | MO_BSWAP:
-        tcg_out_bswap32(s, TCG_TMP3, lo, 0);
-        lo = TCG_TMP3;
-        /* fall through */
     case MO_32:
         tcg_out_opc_imm(s, sw1, lo, base, 0);
         tcg_out_opc_imm(s, sw2, lo, base, 3);
         break;
 
-    case MO_64 | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64) {
-            tcg_out_bswap64(s, TCG_TMP3, lo);
-            lo = TCG_TMP3;
-        } else if (use_mips32r2_instructions) {
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, MIPS_BE ? hi : lo);
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, MIPS_BE ? lo : hi);
-            tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP0, TCG_TMP0, 16);
-            tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP1, TCG_TMP1, 16);
-            hi = MIPS_BE ? TCG_TMP0 : TCG_TMP1;
-            lo = MIPS_BE ? TCG_TMP1 : TCG_TMP0;
-        } else {
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? lo : hi, 0);
-            tcg_out_opc_imm(s, sw1, TCG_TMP3, base, 0 + 0);
-            tcg_out_opc_imm(s, sw2, TCG_TMP3, base, 0 + 3);
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo, 0);
-            tcg_out_opc_imm(s, sw1, TCG_TMP3, base, 4 + 0);
-            tcg_out_opc_imm(s, sw2, TCG_TMP3, base, 4 + 3);
-            break;
-        }
-        /* fall through */
     case MO_64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_opc_imm(s, sd1, lo, base, 0);
-- 
2.34.1


