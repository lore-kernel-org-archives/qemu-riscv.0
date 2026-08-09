Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8D5C5AD4E
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:38:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC8F-0001OK-AV; Sun, 09 Aug 2026 18:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC8D-0001Kz-It
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:37 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC8B-0007X6-NN
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:37 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-c9aea40d799so576131a12.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314994; x=1786919794; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TijNI4J699sNebS2fbtXyrPftVazdEGlsoRVYljRjzU=;
 b=a062gEOyjXUDNTCQrq/5HWPyz4IP8irFZY10IPZeGledQJXWt2yNg9gjyHwE61vWcR
 WgVlpJvgRT0Ib+/yNmtS69V+0/WKPlDXeB+WFkpTed0acsRjpfJz7dY4WBtXPfyJP6Jo
 5Nx9RvS7Ij3cuVUgrUN2cgGDNqLEs5cQfrW2erCxRmoSFi5QCyAallimW7Kz9ImLCKjj
 M9QN3wyT8/DUyrnOJB8t84eeywNtRcP7DDTGjAcY7UOB6izR71XFPtOg8fGWR+VLUqaM
 72nEu05KCFdB7Vit4Ug8YYiGcxhffYDsusYHHMNQ15+FaMGDo9uHaaRBXvw/qCzSzRg6
 AtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314994; x=1786919794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TijNI4J699sNebS2fbtXyrPftVazdEGlsoRVYljRjzU=;
 b=EvNdBZiBA02hmNQLBgIVC3B3mVUkGfaMDLLIUlCr/wE7I7cdWqD9igM2Bfz8DGqYOv
 jOM5jLxoP5xsAll+fv4zIyoeNHkK4oCD1/DfWt+rdIJ9o8x0T2fEW3kHuOSNYjwz18Cb
 eou3CBmG/mvHEhouEbOBmMF37jHHdOfzbYUYAOlLcRZ4PKTC0iaZr9zlOW7Rd4bKNMX9
 fbwysY0O2DY8htWBXiAGF1+nyus20vppoUAUWgSNtTrh5x2zV4LHvrj3R5Wimy3ZZac7
 rYmzwIWtWsBtougDj7uKh7mDpfqBODQPIX5q5opuhIFJ9/cAQXSb06021G3B0MbilMax
 PjGA==
X-Gm-Message-State: AOJu0Yy399IkWcpgIDFtQ5LNlKgSMu1AGfXSHJPjkMUIFgqQtuAVYQK+
 C8QE9C/8K0r3R4sF0h+iaaZ3jBMIA4ILtEQM6QQbtHcLyxd97v6oylDMOHCvWTuisRZLiwDUSwb
 hC2N3
X-Gm-Gg: AR+sD13AV+w4Rtea96LcRVv3Q2KJsosaiDGfotTzJnjrQoOPhxbDmV+lQ41fp52e9Jq
 HtCOST3MfrYT7EUWx52Eou+EIzqD+VsqziTGb+9msYoUOFFjotOgkLgjciVj7unMRa0m3uPouw4
 kG8sNpLoCsIAubbPaev18f0BP3jROPUFa5SIvn48KlAOgHNhgiysZiVPBAOVAkl55F15YUT3n1N
 wbO/dqgTn9GkitdsyQzQJURG+jCPvGiK9HXLilSCN34ixSwY+0ZDdYCE8cLLjYMfKJfzLzJSwb0
 OsUn482y3hLyYLCrEy0EaFepuxTak/y68bRjm0nvVSj6TDBslseJll9bV4rxvG4sMzv9kApXRKh
 d0Mas/VxY8m5H9ujGyGGaUy2cKgE9+Rr08e1kyGaOrErTyj0zHDwTPnprtfbMuaOS91RC7VlKz1
 4SKWkYG+KmJdv8LEDMIE0lE9/dW5+iCnBnxK/JXgbCtubrtdFR8qYIWl8ldQuoEdhZfL8Mt3ZpQ
 JGkjITN/iLJD7kPKe+k
X-Received: by 2002:a05:6a20:d0b0:b0:3bf:6d96:ac40 with SMTP id
 adf61e73a8af0-3cbce78f7dfmr19216328637.12.1786314994323; 
 Sun, 09 Aug 2026 15:36:34 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 39/56] disas/riscv: Store op pointer in rv_comp_data
Date: Sun,  9 Aug 2026 15:35:28 -0700
Message-ID: <20260809223545.730664-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Store a pointer instead of an array index.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.h |  8 +++---
 disas/riscv.c | 69 ++++++++++++++++++++++++++-------------------------
 2 files changed, 40 insertions(+), 37 deletions(-)

diff --git a/disas/riscv.h b/disas/riscv.h
index ea7141d3b5..ab62c0db94 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -164,17 +164,19 @@ typedef enum {
 
 /* structures */
 
+typedef struct rv_opcode_data rv_opcode_data;
+
 typedef struct {
-    int op;
+    const rv_opcode_data *op;
     const rvc_constraint *constraints;
 } rv_comp_data;
 
-typedef struct {
+struct rv_opcode_data {
     const char *name;
     rv_codec codec;
     const char *format;
     const rv_comp_data *pseudo;
-} rv_opcode_data;
+};
 
 typedef struct {
     const RISCVCPUConfig *cfg;
diff --git a/disas/riscv.c b/disas/riscv.c
index 9a528803e8..171c60238f 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1068,138 +1068,140 @@ static const rvc_constraint rvcc_true[] = { rvc_end };
 
 /* pseudo-instruction metadata */
 
+static const rv_opcode_data rvi_opcode_data[];
+
 static const rv_comp_data rvcp_jal[] = {
-    { rv_op_j, rvcc_j },
-    { rv_op_jal_ra, rvcc_jal_ra },
+    { &rvi_opcode_data[rv_op_j], rvcc_j },
+    { &rvi_opcode_data[rv_op_jal_ra], rvcc_jal_ra },
     { },
 };
 
 static const rv_comp_data rvcp_jalr[] = {
-    { rv_op_jr, rvcc_jr },
-    { rv_op_jalr_ra, rvcc_jalr_ra },
+    { &rvi_opcode_data[rv_op_jr], rvcc_jr },
+    { &rvi_opcode_data[rv_op_jalr_ra], rvcc_jalr_ra },
     { },
 };
 
 static const rv_comp_data rvcp_jr[] = {
-    { rv_op_ret, rvcc_ret },
+    { &rvi_opcode_data[rv_op_ret], rvcc_ret },
     { },
 };
 
 static const rv_comp_data rvcp_beq[] = {
-    { rv_op_beqz, rvcc_beqz },
+    { &rvi_opcode_data[rv_op_beqz], rvcc_beqz },
     { },
 };
 
 static const rv_comp_data rvcp_bne[] = {
-    { rv_op_bnez, rvcc_bnez },
+    { &rvi_opcode_data[rv_op_bnez], rvcc_bnez },
     { },
 };
 
 static const rv_comp_data rvcp_blt[] = {
-    { rv_op_bltz, rvcc_bltz },
-    { rv_op_bgtz, rvcc_bgtz },
+    { &rvi_opcode_data[rv_op_bltz], rvcc_bltz },
+    { &rvi_opcode_data[rv_op_bgtz], rvcc_bgtz },
     { },
 };
 
 static const rv_comp_data rvcp_bge[] = {
-    { rv_op_blez, rvcc_blez },
-    { rv_op_bgez, rvcc_bgez },
+    { &rvi_opcode_data[rv_op_blez], rvcc_blez },
+    { &rvi_opcode_data[rv_op_bgez], rvcc_bgez },
     { },
 };
 
 static const rv_comp_data rvcp_addi[] = {
-    { rv_op_mv, rvcc_mv },
+    { &rvi_opcode_data[rv_op_mv], rvcc_mv },
     { },
 };
 
 static const rv_comp_data rvcp_mv[] = {
-    { rv_op_nop, rvcc_nop },
+    { &rvi_opcode_data[rv_op_nop], rvcc_nop },
     { },
 };
 
 static const rv_comp_data rvcp_sltiu[] = {
-    { rv_op_seqz, rvcc_seqz },
+    { &rvi_opcode_data[rv_op_seqz], rvcc_seqz },
     { },
 };
 
 static const rv_comp_data rvcp_xori[] = {
-    { rv_op_not, rvcc_not },
+    { &rvi_opcode_data[rv_op_not], rvcc_not },
     { },
 };
 
 static const rv_comp_data rvcp_sub[] = {
-    { rv_op_neg, rvcc_neg },
+    { &rvi_opcode_data[rv_op_neg], rvcc_neg },
     { },
 };
 
 static const rv_comp_data rvcp_slt[] = {
-    { rv_op_sltz, rvcc_sltz },
-    { rv_op_sgtz, rvcc_sgtz },
+    { &rvi_opcode_data[rv_op_sltz], rvcc_sltz },
+    { &rvi_opcode_data[rv_op_sgtz], rvcc_sgtz },
     { },
 };
 
 static const rv_comp_data rvcp_sltu[] = {
-    { rv_op_snez, rvcc_snez },
+    { &rvi_opcode_data[rv_op_snez], rvcc_snez },
     { },
 };
 
 static const rv_comp_data rvcp_addiw[] = {
-    { rv_op_sext_w, rvcc_sext_w },
+    { &rvi_opcode_data[rv_op_sext_w], rvcc_sext_w },
     { },
 };
 
 static const rv_comp_data rvcp_subw[] = {
-    { rv_op_negw, rvcc_negw },
+    { &rvi_opcode_data[rv_op_negw], rvcc_negw },
     { },
 };
 
 static const rv_comp_data rvcp_fsgnj_s[] = {
-    { rv_op_fmv_s, rvcc_fmv_s },
+    { &rvi_opcode_data[rv_op_fmv_s], rvcc_fmv_s },
     { },
 };
 
 static const rv_comp_data rvcp_fsgnjn_s[] = {
-    { rv_op_fneg_s, rvcc_fneg_s },
+    { &rvi_opcode_data[rv_op_fneg_s], rvcc_fneg_s },
     { },
 };
 
 static const rv_comp_data rvcp_fsgnjx_s[] = {
-    { rv_op_fabs_s, rvcc_fabs_s },
+    { &rvi_opcode_data[rv_op_fabs_s], rvcc_fabs_s },
     { },
 };
 
 static const rv_comp_data rvcp_fsgnj_d[] = {
-    { rv_op_fmv_d, rvcc_fmv_d },
+    { &rvi_opcode_data[rv_op_fmv_d], rvcc_fmv_d },
     { },
 };
 
 static const rv_comp_data rvcp_fsgnjn_d[] = {
-    { rv_op_fneg_d, rvcc_fneg_d },
+    { &rvi_opcode_data[rv_op_fneg_d], rvcc_fneg_d },
     { },
 };
 
 static const rv_comp_data rvcp_fsgnjx_d[] = {
-    { rv_op_fabs_d, rvcc_fabs_d },
+    { &rvi_opcode_data[rv_op_fabs_d], rvcc_fabs_d },
     { },
 };
 
 static const rv_comp_data rvcp_fsgnj_q[] = {
-    { rv_op_fmv_q, rvcc_fmv_q },
+    { &rvi_opcode_data[rv_op_fmv_q], rvcc_fmv_q },
     { },
 };
 
 static const rv_comp_data rvcp_fsgnjn_q[] = {
-    { rv_op_fneg_q, rvcc_fneg_q },
+    { &rvi_opcode_data[rv_op_fneg_q], rvcc_fneg_q },
     { },
 };
 
 static const rv_comp_data rvcp_fsgnjx_q[] = {
-    { rv_op_fabs_q, rvcc_fabs_q },
+    { &rvi_opcode_data[rv_op_fabs_q], rvcc_fabs_q },
     { },
 };
 
 /* Convert compressed insns into normal insns via pseudo expansion. */
-#define DECOMP(X) (static const rv_comp_data[1]){ { X, rvcc_true } }
+#define DECOMP(X) (static const rv_comp_data[1]){ { &rvi_opcode_data[X], rvcc_true } }
 
 /* operand extractors */
 
@@ -5270,9 +5272,8 @@ static const rv_opcode_data *decode_inst_lift_pseudo(rv_decode *dec,
     if (comp_data) {
         while (comp_data->constraints) {
             if (check_constraints(dec, comp_data->constraints)) {
-                const rv_opcode_data *new_op = &dec->opcode_data[comp_data->op];
-                assert(new_op != op);
-                return decode_inst_lift_pseudo(dec, new_op);
+                assert(op != comp_data->op);
+                return decode_inst_lift_pseudo(dec, comp_data->op);
             }
             comp_data++;
         }
-- 
2.43.0


