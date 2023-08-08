Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040F1EB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:14:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD9I-00030i-Mr; Mon, 07 Aug 2023 23:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8p-0001Ze-G9
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:17 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8a-0000I3-FI
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:15 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-56d0d7300d9so3619171eaf.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464319; x=1692069119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LA0FQj2p5NOMPjxNHlx5J0GOa6DvzlceCBNs3CReXBc=;
 b=kU83p5nPzMvIgAEvaluvjKSB1imcE389RR1ZfD+7jq5JwWBUmDk9kaLFkIoa3dBd/G
 TCVnHLBiK+HAE63pvrmR3yXzIAFpXMB1p6bMFDKPYrDfho0LIxSVFdpSO+1snWYWY3g5
 xGKJ1wL3LVzMqAkbPAVhurH2LZ511gkROm8chGGPVTo5zLqeAaHWFBEJkhhCW2AEcXKa
 rJbDNSIr+ZknwrZVy2tU+uMvHEnEwDdWSyxMkP528q2Kl2xtl2zsF5+91o/aQZm298AJ
 jqw8bTcQr4WSjWzyS5GphVoq09FAJH6La2AWrRvg5wwPhu38Tjnxyd7+A1CHCoVPxSgF
 +fhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464319; x=1692069119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LA0FQj2p5NOMPjxNHlx5J0GOa6DvzlceCBNs3CReXBc=;
 b=DxnoLUkbOM+u4qfcEW5OV2Hpe9HB7SO/Tz71bclfwx7IkE6tToKfjid2O55mVy+aTk
 8dg0GMV0BXUUFNIY4p1pbVRdH2Tp+J2BvLl6rS0SMj9sbcCQu6mxku+Hda9ejqHakRKe
 aEkl6aC5gnFQgAeRsglDZsxjkthMN5fUe4J5oCK8Cb8JPhUJe2V2QeEUpBn1j0mt/5/q
 gLVO+hE5uTpWs+jwZ9h0U3AewYFAnQGW6U8WoQ1Vuzpxq85+l6e1Atkk5Um2YI/+XOp4
 FEo+IonssuNQLUeI6lyRrm/s71GhsVM99mGrVM55U9HrXtdeGxYlL2oq8JiMZUztvB9a
 T3GQ==
X-Gm-Message-State: AOJu0Ywo6ZpLmJgkXKEzx9H/bmgCzaZLrAz/3ewviWXCDXlqW3vgBhf+
 1XVXTYY44pWob1ZKZUqcEB3ZcQ==
X-Google-Smtp-Source: AGHT+IHpACCy8KITaIfGqkFiIx8zZ+qCSJ9IBr1fS/LlhI7/SGqN4/L0jXJhGuUIXimY7HCTvrCJeQ==
X-Received: by 2002:a05:6358:70d:b0:134:e8c6:a888 with SMTP id
 e13-20020a056358070d00b00134e8c6a888mr10032318rwj.8.1691464319089; 
 Mon, 07 Aug 2023 20:11:59 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 16/24] tcg/sparc64: Implement negsetcond_*
Date: Mon,  7 Aug 2023 20:11:35 -0700
Message-Id: <20230808031143.50925-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc31.google.com
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
 tcg/sparc64/tcg-target.h     |  4 ++--
 tcg/sparc64/tcg-target.c.inc | 36 ++++++++++++++++++++++++++----------
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index 1faadc704b..4bbd825bd8 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -112,7 +112,7 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
-#define TCG_TARGET_HAS_negsetcond_i32   0
+#define TCG_TARGET_HAS_negsetcond_i32   1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_extrl_i64_i32    1
@@ -150,7 +150,7 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        use_vis3_instructions
 #define TCG_TARGET_HAS_mulsh_i64        0
-#define TCG_TARGET_HAS_negsetcond_i64   0
+#define TCG_TARGET_HAS_negsetcond_i64   1
 
 #define TCG_TARGET_HAS_qemu_ldst_i128   0
 
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index ffcb879211..37839f9a21 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -720,7 +720,7 @@ static void tcg_out_movcond_i64(TCGContext *s, TCGCond cond, TCGReg ret,
 }
 
 static void tcg_out_setcond_i32(TCGContext *s, TCGCond cond, TCGReg ret,
-                                TCGReg c1, int32_t c2, int c2const)
+                                TCGReg c1, int32_t c2, int c2const, bool neg)
 {
     /* For 32-bit comparisons, we can play games with ADDC/SUBC.  */
     switch (cond) {
@@ -760,22 +760,30 @@ static void tcg_out_setcond_i32(TCGContext *s, TCGCond cond, TCGReg ret,
     default:
         tcg_out_cmp(s, c1, c2, c2const);
         tcg_out_movi_s13(s, ret, 0);
-        tcg_out_movcc(s, cond, MOVCC_ICC, ret, 1, 1);
+        tcg_out_movcc(s, cond, MOVCC_ICC, ret, neg ? -1 : 1, 1);
         return;
     }
 
     tcg_out_cmp(s, c1, c2, c2const);
     if (cond == TCG_COND_LTU) {
-        tcg_out_arithi(s, ret, TCG_REG_G0, 0, ARITH_ADDC);
+        if (neg) {
+            tcg_out_arithi(s, ret, TCG_REG_G0, 0, ARITH_SUBC);
+        } else {
+            tcg_out_arithi(s, ret, TCG_REG_G0, 0, ARITH_ADDC);
+        }
     } else {
-        tcg_out_arithi(s, ret, TCG_REG_G0, -1, ARITH_SUBC);
+        if (neg) {
+            tcg_out_arithi(s, ret, TCG_REG_G0, -1, ARITH_ADDC);
+        } else {
+            tcg_out_arithi(s, ret, TCG_REG_G0, -1, ARITH_SUBC);
+        }
     }
 }
 
 static void tcg_out_setcond_i64(TCGContext *s, TCGCond cond, TCGReg ret,
-                                TCGReg c1, int32_t c2, int c2const)
+                                TCGReg c1, int32_t c2, int c2const, bool neg)
 {
-    if (use_vis3_instructions) {
+    if (use_vis3_instructions && !neg) {
         switch (cond) {
         case TCG_COND_NE:
             if (c2 != 0) {
@@ -796,11 +804,11 @@ static void tcg_out_setcond_i64(TCGContext *s, TCGCond cond, TCGReg ret,
        if the input does not overlap the output.  */
     if (c2 == 0 && !is_unsigned_cond(cond) && c1 != ret) {
         tcg_out_movi_s13(s, ret, 0);
-        tcg_out_movr(s, cond, ret, c1, 1, 1);
+        tcg_out_movr(s, cond, ret, c1, neg ? -1 : 1, 1);
     } else {
         tcg_out_cmp(s, c1, c2, c2const);
         tcg_out_movi_s13(s, ret, 0);
-        tcg_out_movcc(s, cond, MOVCC_XCC, ret, 1, 1);
+        tcg_out_movcc(s, cond, MOVCC_XCC, ret, neg ? -1 : 1, 1);
     }
 }
 
@@ -1355,7 +1363,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond_i32(s, a2, a0, a1, const_args[1], arg_label(args[3]));
         break;
     case INDEX_op_setcond_i32:
-        tcg_out_setcond_i32(s, args[3], a0, a1, a2, c2);
+        tcg_out_setcond_i32(s, args[3], a0, a1, a2, c2, false);
+        break;
+    case INDEX_op_negsetcond_i32:
+        tcg_out_setcond_i32(s, args[3], a0, a1, a2, c2, true);
         break;
     case INDEX_op_movcond_i32:
         tcg_out_movcond_i32(s, args[5], a0, a1, a2, c2, args[3], const_args[3]);
@@ -1437,7 +1448,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond_i64(s, a2, a0, a1, const_args[1], arg_label(args[3]));
         break;
     case INDEX_op_setcond_i64:
-        tcg_out_setcond_i64(s, args[3], a0, a1, a2, c2);
+        tcg_out_setcond_i64(s, args[3], a0, a1, a2, c2, false);
+        break;
+    case INDEX_op_negsetcond_i64:
+        tcg_out_setcond_i64(s, args[3], a0, a1, a2, c2, true);
         break;
     case INDEX_op_movcond_i64:
         tcg_out_movcond_i64(s, args[5], a0, a1, a2, c2, args[3], const_args[3]);
@@ -1564,6 +1578,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sar_i64:
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
+    case INDEX_op_negsetcond_i32:
+    case INDEX_op_negsetcond_i64:
         return C_O1_I2(r, rZ, rJ);
 
     case INDEX_op_brcond_i32:
-- 
2.34.1


