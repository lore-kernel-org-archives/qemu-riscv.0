Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADAAC001B0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:13:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD98-0002Ev-LF; Mon, 07 Aug 2023 23:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8n-0001XS-Qz
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:13 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8Z-0000HL-GO
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:13 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6bca6c06e56so4663567a34.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464318; x=1692069118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y3IZmf0/JLBly+6xTxYogTNg3uwMcup6esfMrWAxxv4=;
 b=ENrJwAtdVWSVn1Y24A09cYH26DzdnrIytsIsvkXp3LElgGFVG81rgJq/Js+SqFQ+Ib
 ulr85hqr2ky85EoxMH2QAyxsWL+qJGUACgHHyqpsF+tavD5JZenJPXDT1n8pUGpZJ95w
 AxZfovVLcnnL6a3DGD9UH4usqzzSsoUCdHblUQBnj0UhNh61H8/TyvK22EMdM3n8npDR
 ksH64CwDdKrZBDzp6tLX4RQa1gpRZDMMLP/afAfzmLECNV8vJRqZ2tJ/lvx3c73ZYevo
 +Uz4BS/xTno08xjbEpTogsvUVL/l8GD1i+kywf0OwLPm2OOgRYxyN+K2iRl/v7QVCvTB
 QKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464318; x=1692069118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y3IZmf0/JLBly+6xTxYogTNg3uwMcup6esfMrWAxxv4=;
 b=I4McLRie4w5NAvnr9+ZlibzAK7tewldxdpxHJop/B9gXveiQf2xMSUD1DOlM9lJagv
 Q8Gyslu7XQ/+SlvLvzK0/18x++hoOKiT9n8pVi5Tey2pbHq7JU2vz4tuPqOT34VQKNQt
 nybV8kXx5YTmBGUgmP6JhkTdxIWmvH5E+BSnvl0Yo4MxvJXWB+o2KaOQ29N8U6g9OHzV
 f6j6sak1FBunYHLadJbvq7Fi29iqdT72yps9yxHtUo0zGK8zmXsfqJoM+cdtAnxMpqXd
 qqnzeVnuFeQNcG8S7YZBLXAvO6ZGDkXJHYQ3KQOeaHkNL3ULce3R8RDLfjGKM+FIUS6z
 bBkQ==
X-Gm-Message-State: AOJu0Yy0SjWr/kIzpybFXO7hijfXOE+QrAjI7rtHMY5310LOoRSGIeQY
 AiTR0YOF6DlKbAOKzJZ6rYRULg==
X-Google-Smtp-Source: AGHT+IH06roLtkYT5dFcmHAdTy3ll3Qu3Mpr/RQd/GHoDw8FyO/th2UZE8++pOKjFeoXKFfHTQsnQQ==
X-Received: by 2002:a05:6358:919e:b0:133:b33:3b9a with SMTP id
 j30-20020a056358919e00b001330b333b9amr8840748rwa.3.1691464318174; 
 Mon, 07 Aug 2023 20:11:58 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 15/24] tcg/s390x: Implement negsetcond_*
Date: Mon,  7 Aug 2023 20:11:34 -0700
Message-Id: <20230808031143.50925-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  4 +-
 tcg/s390x/tcg-target.c.inc | 78 +++++++++++++++++++++++++-------------
 2 files changed, 54 insertions(+), 28 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 24e207c2d4..cd3d245be0 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -104,7 +104,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_mulsh_i32      0
 #define TCG_TARGET_HAS_extrl_i64_i32  0
 #define TCG_TARGET_HAS_extrh_i64_i32  0
-#define TCG_TARGET_HAS_negsetcond_i32 0
+#define TCG_TARGET_HAS_negsetcond_i32 1
 #define TCG_TARGET_HAS_qemu_st8_i32   0
 
 #define TCG_TARGET_HAS_div2_i64       1
@@ -139,7 +139,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_muls2_i64      HAVE_FACILITY(MISC_INSN_EXT2)
 #define TCG_TARGET_HAS_muluh_i64      0
 #define TCG_TARGET_HAS_mulsh_i64      0
-#define TCG_TARGET_HAS_negsetcond_i64 0
+#define TCG_TARGET_HAS_negsetcond_i64 1
 
 #define TCG_TARGET_HAS_qemu_ldst_i128 1
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index a94f7908d6..ecd8aaf2a1 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1266,7 +1266,8 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
 }
 
 static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
-                         TCGReg dest, TCGReg c1, TCGArg c2, int c2const)
+                         TCGReg dest, TCGReg c1, TCGArg c2,
+                         bool c2const, bool neg)
 {
     int cc;
 
@@ -1275,11 +1276,27 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
         /* Emit: d = 0, d = (cc ? 1 : d).  */
         cc = tgen_cmp(s, type, cond, c1, c2, c2const, false);
         tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
-        tcg_out_insn(s, RIEg, LOCGHI, dest, 1, cc);
+        tcg_out_insn(s, RIEg, LOCGHI, dest, neg ? -1 : 1, cc);
         return;
     }
 
- restart:
+    switch (cond) {
+    case TCG_COND_GEU:
+    case TCG_COND_LTU:
+    case TCG_COND_LT:
+    case TCG_COND_GE:
+        /* Swap operands so that we can use LEU/GTU/GT/LE.  */
+        if (!c2const) {
+            TCGReg t = c1;
+            c1 = c2;
+            c2 = t;
+            cond = tcg_swap_cond(cond);
+        }
+        break;
+    default:
+        break;
+    }
+
     switch (cond) {
     case TCG_COND_NE:
         /* X != 0 is X > 0.  */
@@ -1292,11 +1309,20 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
 
     case TCG_COND_GTU:
     case TCG_COND_GT:
-        /* The result of a compare has CC=2 for GT and CC=3 unused.
-           ADD LOGICAL WITH CARRY considers (CC & 2) the carry bit.  */
+        /*
+         * The result of a compare has CC=2 for GT and CC=3 unused.
+         * ADD LOGICAL WITH CARRY considers (CC & 2) the carry bit.
+         */
         tgen_cmp(s, type, cond, c1, c2, c2const, true);
         tcg_out_movi(s, type, dest, 0);
         tcg_out_insn(s, RRE, ALCGR, dest, dest);
+        if (neg) {
+            if (type == TCG_TYPE_I32) {
+                tcg_out_insn(s, RR, LCR, dest, dest);
+            } else {
+                tcg_out_insn(s, RRE, LCGR, dest, dest);
+            }
+        }
         return;
 
     case TCG_COND_EQ:
@@ -1310,27 +1336,17 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
 
     case TCG_COND_LEU:
     case TCG_COND_LE:
-        /* As above, but we're looking for borrow, or !carry.
-           The second insn computes d - d - borrow, or -1 for true
-           and 0 for false.  So we must mask to 1 bit afterward.  */
+        /*
+         * As above, but we're looking for borrow, or !carry.
+         * The second insn computes d - d - borrow, or -1 for true
+         * and 0 for false.  So we must mask to 1 bit afterward.
+         */
         tgen_cmp(s, type, cond, c1, c2, c2const, true);
         tcg_out_insn(s, RRE, SLBGR, dest, dest);
-        tgen_andi(s, type, dest, 1);
-        return;
-
-    case TCG_COND_GEU:
-    case TCG_COND_LTU:
-    case TCG_COND_LT:
-    case TCG_COND_GE:
-        /* Swap operands so that we can use LEU/GTU/GT/LE.  */
-        if (!c2const) {
-            TCGReg t = c1;
-            c1 = c2;
-            c2 = t;
-            cond = tcg_swap_cond(cond);
-            goto restart;
+        if (!neg) {
+            tgen_andi(s, type, dest, 1);
         }
-        break;
+        return;
 
     default:
         g_assert_not_reached();
@@ -1339,7 +1355,7 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
     cc = tgen_cmp(s, type, cond, c1, c2, c2const, false);
     /* Emit: d = 0, t = 1, d = (cc ? t : d).  */
     tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
-    tcg_out_movi(s, TCG_TYPE_I64, TCG_TMP0, 1);
+    tcg_out_movi(s, TCG_TYPE_I64, TCG_TMP0, neg ? -1 : 1);
     tcg_out_insn(s, RRFc, LOCGR, dest, TCG_TMP0, cc);
 }
 
@@ -2288,7 +2304,11 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_setcond_i32:
         tgen_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1],
-                     args[2], const_args[2]);
+                     args[2], const_args[2], false);
+        break;
+    case INDEX_op_negsetcond_i32:
+        tgen_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1],
+                     args[2], const_args[2], true);
         break;
     case INDEX_op_movcond_i32:
         tgen_movcond(s, TCG_TYPE_I32, args[5], args[0], args[1],
@@ -2566,7 +2586,11 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_setcond_i64:
         tgen_setcond(s, TCG_TYPE_I64, args[3], args[0], args[1],
-                     args[2], const_args[2]);
+                     args[2], const_args[2], false);
+        break;
+    case INDEX_op_negsetcond_i64:
+        tgen_setcond(s, TCG_TYPE_I64, args[3], args[0], args[1],
+                     args[2], const_args[2], true);
         break;
     case INDEX_op_movcond_i64:
         tgen_movcond(s, TCG_TYPE_I64, args[5], args[0], args[1],
@@ -3109,8 +3133,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rotr_i32:
     case INDEX_op_rotr_i64:
     case INDEX_op_setcond_i32:
+    case INDEX_op_negsetcond_i32:
         return C_O1_I2(r, r, ri);
     case INDEX_op_setcond_i64:
+    case INDEX_op_negsetcond_i64:
         return C_O1_I2(r, r, rA);
 
     case INDEX_op_clz_i64:
-- 
2.34.1


