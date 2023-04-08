Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkyYh-0007ru-IN
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 22:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYe-0007nk-Ie
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:04 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYE-0005Wk-I2
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 22:44:04 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 nh20-20020a17090b365400b0024496d637e1so5604777pjb.5
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 19:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EG50dlsEPDhYqawgpZPn5bXTmru++unKrqhVn+ReQmo=;
 b=VBMYjFyqXyIf6KSHgBW72C2hPgDtNZ5367OkF5vDgeACPKSGS/JfQjIRzny9VK5UL4
 e7SWJkpuAxX1wj6fk5V94ivME34BuOL70yhbTWZOVWXKKLaBl9WSSqTkbx7tgItq5na7
 2sQFMtD1f+LBHstgWsUchQR7WXV9wbnte+6UOWSo7e64JqAWvhLYtr1oSbYtfj9SvMao
 iN36H6FFE48Dih/0kS5XkosAoQMDzHYax8gY77Z62GBsUnlJn8u0rBS9mpotdBLW8f2R
 dYL5c8ODfWfQgpX6E7+l5j6+//aMi9bZrL79obiugjqPtICMMfYNpmZpJqqZo5YKNm81
 SS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921818;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EG50dlsEPDhYqawgpZPn5bXTmru++unKrqhVn+ReQmo=;
 b=UifvzcLaQvJ0lvDUBsTBtf79vbp8kOmkhTlOj6HYOiUOrf5eiTptsqvXtT5AtkYcHD
 Cqvt62O4t3CqBMeoPo45i309icwkjx/v0LoJxw5wVmQRlvujjIQhW4eTyNk9j91a104I
 lCRFrhae9V6UJaq8PI8kMVEbIYLZcfipsWHybSxDk4rkwIQHU7yRqs4LJr2NL9CahOQC
 MrzjR3fVJtiwpT+cggWC/GJchQKvvOZ++2RCVTTXr71S/+WPdwGKEwhmoivZoUmI8QzQ
 9wL4PgKUl2cSLi0PnhxLhozzT2TsplL3TMZWrYPS+E4eCZiL4NHU83Woa4gZD6cFKEnq
 zPHQ==
X-Gm-Message-State: AAQBX9dgjrqwjq2/ZgoIvfnIrdOZH4AaMLsoiAnIG9SdpRShyNcEiB2q
 6QXwyesgbvfxLn4E7lDH4nziZdpXTQRd5dNQdng=
X-Google-Smtp-Source: AKy350Zcsq+rhLmf+jhgr4A5cRXWqahI9UFx72Jl/hNXKEp1cWJo0S3yamPqUM2CfGUaPxgOCqsfbA==
X-Received: by 2002:a17:903:138b:b0:19a:9dab:3438 with SMTP id
 jx11-20020a170903138b00b0019a9dab3438mr2821155plb.2.1680921817606; 
 Fri, 07 Apr 2023 19:43:37 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 24/42] tcg/i386: Use TCGType not bool is_64 in
 tcg_out_qemu_{ld, st}
Date: Fri,  7 Apr 2023 19:42:56 -0700
Message-Id: <20230408024314.3357414-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 02:44:04 -0000

There are several places where we already convert back from
bool to type.  Clean things up by using type throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 56 +++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index a83ebe8729..568cfe7728 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1479,7 +1479,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 #endif /* SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
-                                   TCGReg base, MemOp opc, bool is_64)
+                                   TCGReg base, MemOp opc, TCGType type)
 {
     switch (opc & (MO_SSIZE | MO_BSWAP)) {
     case MO_UB:
@@ -1503,7 +1503,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         tcg_out_opc_imm(s, OPC_LH, lo, base, 0);
         break;
     case MO_UL | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64 && is_64) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
             if (use_mips32r2_instructions) {
                 tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
                 tcg_out_bswap32(s, lo, lo, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
@@ -1528,7 +1528,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
         }
         break;
     case MO_UL:
-        if (TCG_TARGET_REG_BITS == 64 && is_64) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
             tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
             break;
         }
@@ -1583,7 +1583,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
 }
 
 static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
-                                    TCGReg base, MemOp opc, bool is_64)
+                                    TCGReg base, MemOp opc, TCGType type)
 {
     const MIPSInsn lw1 = MIPS_BE ? OPC_LWL : OPC_LWR;
     const MIPSInsn lw2 = MIPS_BE ? OPC_LWR : OPC_LWL;
@@ -1623,7 +1623,7 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
     case MO_UL:
         tcg_out_opc_imm(s, lw1, lo, base, 0);
         tcg_out_opc_imm(s, lw2, lo, base, 3);
-        if (TCG_TARGET_REG_BITS == 64 && is_64 && !sgn) {
+        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn) {
             tcg_out_ext32u(s, lo, lo);
         }
         break;
@@ -1634,18 +1634,18 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, lw1, lo, base, 0);
             tcg_out_opc_imm(s, lw2, lo, base, 3);
             tcg_out_bswap32(s, lo, lo,
-                            TCG_TARGET_REG_BITS == 64 && is_64
+                            TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64
                             ? (sgn ? TCG_BSWAP_OS : TCG_BSWAP_OZ) : 0);
         } else {
             const tcg_insn_unit *subr =
-                (TCG_TARGET_REG_BITS == 64 && is_64 && !sgn
+                (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn
                  ? bswap32u_addr : bswap32_addr);
 
             tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0);
             tcg_out_bswap_subr(s, subr);
             /* delay slot */
             tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 3);
-            tcg_out_mov(s, is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32, lo, TCG_TMP3);
+            tcg_out_mov(s, type, lo, TCG_TMP3);
         }
         break;
 
@@ -1702,7 +1702,7 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
     }
 }
 
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType d_type)
 {
     TCGReg addr_regl, addr_regh __attribute__((unused));
     TCGReg data_regl, data_regh;
@@ -1716,7 +1716,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
     TCGReg base = TCG_REG_A0;
 
     data_regl = *args++;
-    data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
+    data_regh = (TCG_TARGET_REG_BITS == 64 || d_type == TCG_TYPE_I32
+                 ? 0 : *args++);
     addr_regl = *args++;
     addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
     oi = *args++;
@@ -1731,14 +1732,12 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 #if defined(CONFIG_SOFTMMU)
     tcg_out_tlb_load(s, base, addr_regl, addr_regh, oi, label_ptr, 1);
     if (use_mips32r6_instructions || a_bits >= s_bits) {
-        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, d_type);
     } else {
-        tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc, d_type);
     }
-    add_qemu_ldst_label(s, 1, oi,
-                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_regl, data_regh, addr_regl, addr_regh,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, oi, d_type, data_regl, data_regh,
+                        addr_regl, addr_regh, s->code_ptr, label_ptr);
 #else
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
         tcg_out_ext32u(s, base, addr_regl);
@@ -1755,15 +1754,15 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
         if (a_bits) {
             tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
         }
-        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, d_type);
     } else {
         if (a_bits && a_bits != s_bits) {
             tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
         }
         if (a_bits >= s_bits) {
-            tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+            tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, d_type);
         } else {
-            tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc, is_64);
+            tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc, d_type);
         }
     }
 #endif
@@ -1902,7 +1901,7 @@ static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
         g_assert_not_reached();
     }
 }
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
+static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType d_type)
 {
     TCGReg addr_regl, addr_regh __attribute__((unused));
     TCGReg data_regl, data_regh;
@@ -1915,7 +1914,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     TCGReg base = TCG_REG_A0;
 
     data_regl = *args++;
-    data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
+    data_regh = (TCG_TARGET_REG_BITS == 64 || d_type == TCG_TYPE_I32
+                 ? 0 : *args++);
     addr_regl = *args++;
     addr_regh = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
     oi = *args++;
@@ -1934,10 +1934,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     } else {
         tcg_out_qemu_st_unalign(s, data_regl, data_regh, base, opc);
     }
-    add_qemu_ldst_label(s, 0, oi,
-                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
-                        data_regl, data_regh, addr_regl, addr_regh,
-                        s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, d_type, data_regl, data_regh,
+                        addr_regl, addr_regh, s->code_ptr, label_ptr);
 #else
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
         tcg_out_ext32u(s, base, addr_regl);
@@ -2425,16 +2423,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, false);
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, true);
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, args, false);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, true);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I64);
         break;
 
     case INDEX_op_add2_i32:
-- 
2.34.1


