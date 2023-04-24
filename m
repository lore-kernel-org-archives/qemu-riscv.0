Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqp3L-0003Zb-SB
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 01:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0V-0006EL-NJ
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:45:16 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0F-0005K8-Qv
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 01:44:59 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f182d745deso39603325e9.0
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 22:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315075; x=1684907075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aucysoTI00/6AHztRhanSz7uVuWer883go2thcLlz8w=;
 b=f3ep/6zd/1pwmG7tP+/zE4Ya3VpSttQCUxtm3oAypUb7D7452orcbRJYrKI9HSDvsY
 JuSxQ0vMpFg4qs6VCYrGODMhz2FV3ER4Ku8vz1BupKh56g3hSiAJwl83EXk2FGQtYSr5
 vMhSbhOKeZOLoVKaBSqpoBoWH678tpZuizzJBx0sDQq3RkTp5SSdGQZTLMe1Nu+PMgsV
 YiNhQytqIiFlLHyjfTgiPmx6GLjM/Q9EVzZqQXo3KGDKGrrpKcj1H6yndY9n2N5fLLa1
 5dnHsLIrMFCnwhFnkOK9UfYoqvrjfQxpHTR13qT3ZlsmKzuvYeNFgt12HgoUGKiA42ic
 Exug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315075; x=1684907075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aucysoTI00/6AHztRhanSz7uVuWer883go2thcLlz8w=;
 b=Ks1mY0Vq38GajILTBhTcwMK4SpUGqKgzkWNFAvJat0k1ReP/vvb65cCnMMGNEPFnbz
 qZA1bN36UV/4u1SnOGvdKo7koBQKIPkQoXHVTTlWIF+uPuDLkvt6fVGpUxpXH4F0qDbk
 4mhl94NlWFzuYnU7CQyEZwaSsY6XBycBOPOuOh+neayPPLdXtAWsQJTopwaWrWIPTzID
 9/bMDzuQp6xzxVb3D3vkgv0Mu2nsP3W3xLHRs9QXCcyeF8hoyeKsgZOmGsG3PX3UQAOC
 xJaOFUaIQQ7ppEDhV7kK1EneTZ4JZnhBmyD0NjQxD+mvD+0Crhm6GeilYj+NPaVZ62c2
 z3Ww==
X-Gm-Message-State: AAQBX9dIEFy7utfdGx9IwH/1BaDXcDJOMU5qHHGMBU/gkdUHoxiD7wZm
 gr9PE3N7IXqnTB2TLRV4PBmRqg==
X-Google-Smtp-Source: AKy350Z/gg08OfHL7L+Md4Cbp1vwuxU7urSI6higZwNcC53Dfn0ssCAUoiQMR4EJAiEkuxv8TU9d5w==
X-Received: by 2002:a7b:c3d5:0:b0:3ee:b3bf:5f7c with SMTP id
 t21-20020a7bc3d5000000b003eeb3bf5f7cmr6642571wmj.23.1682315075069; 
 Sun, 23 Apr 2023 22:44:35 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 49/57] tcg/mips: Remove MO_BSWAP handling
Date: Mon, 24 Apr 2023 06:40:57 +0100
Message-Id: <20230424054105.1579315-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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
X-List-Received-Date: Mon, 24 Apr 2023 05:45:21 -0000

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


