Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6Ut-00070m-LH
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6UJ-00069E-9R
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:01:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6U6-0003B5-OJ
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:01:19 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so30873105e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097265; x=1685689265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aucysoTI00/6AHztRhanSz7uVuWer883go2thcLlz8w=;
 b=NYkYKdkS1zE3M+L667DEv6qjk64N9T6HmDkrK15XDempsocZ35m3njh8qHQ99Yvjmx
 yt5xiCbmS2gcUPwKPooWWaKOy2wGOJKNMK7+uBSLnjRn5It5iTqfPNiM9HxTQyuLjuJq
 Iv6Sp3kLGpR3DlwBDM4MjkWA5r91sxc9J5w8mc/OTnIaWlFvifyL+cxn5TswT1nCi4aC
 YIgA3qmfmC5lsHFTLVCllgpTKpZWkblEtJ424cbQl71ZzaFbu26y+Zl2UI/BWHndzzj5
 jf4rEiuhy3B+bhQTasTmNUvQWhhT6e4CP2bqVh3lhfQ2i28yN1scmEflmpY1obMnOLbQ
 2CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097265; x=1685689265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aucysoTI00/6AHztRhanSz7uVuWer883go2thcLlz8w=;
 b=ajs4od4mddIVvT4OUWqvuDbG1gjgSWGTIzIkdGL0yvk6f5BLVTHeTNlqBPm5dIdeaY
 g5OOkzuMnPC1mZ5jPKT9tZzTdkGVlrdwN4pIO0ZOgJeICd7iWcy9ktVZnD1tgp5FCQPa
 zC6bZxMRii+cjPFLAkTIP7SPjRKttIyQjEx2pIMCncklf6Ha8FH7xuXkRBOXvrsl0wxY
 wr4aPHpILfz/qAaWraxuOT5eqm3lgsaFR2D/UwkXMRe9nmOAZTeKGTbwd//bC5YllmwX
 ZEyOFX89xr6jYLYMQ0C4dBWNu7UfEsmG0LmQ9G0uX8Obi/6sUfxjQ/50h9BsdF5U1lbU
 oR7w==
X-Gm-Message-State: AC+VfDxvprod+FOP430NgId/LAoXd5norn5pjMb6S7HK3MhDPkF2XIua
 f0zdwhFrPHBDJBhgVHuRYa4QDg==
X-Google-Smtp-Source: ACHHUZ6qJczVGwKDRxrqLom4KV9OEBt3jMxJSSt4enaVvpsP5Ye3ds2MR9stF9bofVJXSf+YHdOsTg==
X-Received: by 2002:a05:600c:21cb:b0:3f2:73a:32fc with SMTP id
 x11-20020a05600c21cb00b003f2073a32fcmr13834098wmj.32.1683097265237; 
 Wed, 03 May 2023 00:01:05 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1ced02000000b003f19b3d89e9sm905035wmh.33.2023.05.03.00.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:01:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 45/54] tcg/mips: Remove MO_BSWAP handling
Date: Wed,  3 May 2023 07:57:20 +0100
Message-Id: <20230503065729.1745843-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:01:23 -0000

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
index 022960d79a..31d58e1977 100644
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
 
 /* We have four temps, we might as well expose three of them. */
@@ -1134,7 +1138,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     tcg_out_ld_helper_args(s, l, &ldst_helper_param);
 
-    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)], false);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SSIZE], false);
     /* delay slot */
     tcg_out_nop(s);
 
@@ -1164,7 +1168,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     tcg_out_st_helper_args(s, l, &ldst_helper_param);
 
-    tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)], false);
+    tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
     /* delay slot */
     tcg_out_nop(s);
 
@@ -1379,52 +1383,19 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
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
@@ -1434,35 +1405,6 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
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
@@ -1487,25 +1429,20 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
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
+                tcg_out_opc_reg(s, OPC_OR, lo, lo, TCG_TMP0);
+            }
+        } else if (use_mips32r2_instructions && lo != base) {
             tcg_out_opc_imm(s, OPC_LBU, lo, base, 0);
             tcg_out_opc_imm(s, sgn ? OPC_LB : OPC_LBU, TCG_TMP0, base, 1);
             tcg_out_opc_bf(s, OPC_INS, lo, TCG_TMP0, 31, 8);
@@ -1517,8 +1454,7 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
         }
         break;
 
-    case MO_SL:
-    case MO_UL:
+    case MO_32:
         tcg_out_opc_imm(s, lw1, lo, base, 0);
         tcg_out_opc_imm(s, lw2, lo, base, 3);
         if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn) {
@@ -1526,28 +1462,7 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
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
@@ -1559,42 +1474,6 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
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
@@ -1627,50 +1506,16 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
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
@@ -1679,7 +1524,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, OPC_SW, MIPS_BE ? lo : hi, base, 4);
         }
         break;
-
     default:
         g_assert_not_reached();
     }
@@ -1693,54 +1537,18 @@ static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
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


