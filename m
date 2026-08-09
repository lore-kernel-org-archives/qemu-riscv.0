Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0065AC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:46:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC87-00018d-Qv; Sun, 09 Aug 2026 18:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC86-00016x-89
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:30 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC83-0007U6-W9
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:29 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2caed617615so14979475ad.3
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314987; x=1786919787; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ziC8yQf388bwq4yRGT8zQBUhZiqaR2gPMMBFv1dhIY0=;
 b=CoE+iRBAxdELDXgrCr1ql/9+5pC3oKySKjMXudaSkTEEJvuc0aqAy31A8ADQS3QJD2
 P8zbvrEp2P5+eTRmzMC4joAesquAbmVP17sungh2kAhjZh+g+Dh1w0E4YxyHCbPg+ogZ
 1FOjPYLOpo2aXX3OKEKyf5OSAhuihUI+Oa58sYR2WJyI04kADt4WWjQ2Ee6LoXV8xp9a
 PEokIBMhl///Ak1Y5q1tAxdAmjk0VmH2ht3plStZw1D1V4Cq/VSqCVfjKg4PjFJF/e2D
 w1jkKHzl8t19ZIjmbgXOmTOVBZ0CxYNirJjcnHwZIVoWvBy6vyPlvn4rB0uuum15CzVF
 QuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314987; x=1786919787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ziC8yQf388bwq4yRGT8zQBUhZiqaR2gPMMBFv1dhIY0=;
 b=rS6rQEjLhJ4i9OqP0xNq6K91AERzsJ12jkplB/sSsl13DKY58KKIe+GaLT57lJJ+eg
 fvLYp4L6QWSAOv//qTD35An6COel/npJ8BSyHNorKo9DtwbSj5LCyYLjQP+3s0J8fdJH
 zqKuEFLzwkYKxBFd5+Gy1+F1asSwYnOMnlkyNda44CDJDX0e42Ids1R92pgUtHgFqCp0
 fsrz1bW2aa7he780HTimoqVs4gpPiBL+DMf/4LmL+aYn/D226covXmm+NNwI5O9vdChI
 qPCvc5TC21FuAEgsTG+KwPmyjWTDu1MiHo9Vd3g7t89gh8Y43ECTQ2xRBwf46152RN+r
 L2Xg==
X-Gm-Message-State: AOJu0YxShNjmhjOvxdK+EMAuFBsr4TjcfPMsUCTJe1ZfvVkvBcWEmL/8
 0mfg8iZzKgBHW548p/65SJsUfpAD3ujBZmZ2UTJUeZOWynNAc7EWXdoa62QYx/uTgUW27BsBwzG
 mzrMv
X-Gm-Gg: AR+sD11QqasifVarDG2NTet5+k8sdmyzQ2D5tA7c+WeXGgh/E9/tZ5CADoOWA74uy+w
 eNYCzROcB6iNxyL5k47hFi6dOcDwiMACbT2qOVNP1dcV90hW2jwIwnHdYgPbKmKM130Pjfv8wj1
 aXKGpoYWqcxk8XPdd6bVmkDLhWsSMCI7ho7kCPI9qyPMyWbQAktGLTPXkhK/srJk2axcHfCFvct
 1AKU0MaKVKP+moublHvSzbZ45p9Hc+0e/L+jE+0qkN6h8lBrBUyjKzdJ3ZoZMHER2KPuKod1xEH
 3zNi/oGec0tZxR4Cmhe9eVaQnad0Wv4bPe5qHSOLAp/6ZFRtGZA9hM5AnunfyeuzIc7K+Oa/kZi
 DMyN8bDphRGDkrNViMkMA0+WK0rv6KCHLVlttPApdtVbeNz6wetXVtChZ9NAy9Mmc78czN3m/a+
 xVC87fJ1cHcvSPGy+cRDZBVDXWgvmAz0iV0mAF/P/oGWeQYMkOjbox8xEF9aUpg4j9Q8WGjIG8o
 w+D59AScc8PPIpgM4gU
X-Received: by 2002:a05:6a20:2447:b0:3bb:2883:a723 with SMTP id
 adf61e73a8af0-3cb86075abamr41923169637.35.1786314986530; 
 Sun, 09 Aug 2026 15:36:26 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 32/56] disas/riscv: Handle decompression via
 decode_inst_lift_pseudo
Date: Sun,  9 Aug 2026 15:35:21 -0700
Message-ID: <20260809223545.730664-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Introduce a DECOMP macro that expands an rv_comp_data
that always succeeds.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.h |   1 -
 disas/riscv.c | 113 +++++++++++++++++++++++---------------------------
 2 files changed, 51 insertions(+), 63 deletions(-)

diff --git a/disas/riscv.h b/disas/riscv.h
index 3bbcbf10fb..ea7141d3b5 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -174,7 +174,6 @@ typedef struct {
     rv_codec codec;
     const char *format;
     const rv_comp_data *pseudo;
-    rv_opcode decomp;
 } rv_opcode_data;
 
 typedef struct {
diff --git a/disas/riscv.c b/disas/riscv.c
index b8e5b124a5..129e545c6e 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1065,6 +1065,7 @@ static const rvc_constraint rvcc_ret[] = { rvc_rd_eq_x0, rvc_rs1_eq_ra,
                                            rvc_end };
 static const rvc_constraint rvcc_jr[] = { rvc_rd_eq_x0, rvc_imm_eq_zero,
                                           rvc_end };
+static const rvc_constraint rvcc_true[] = { rvc_end };
 
 /* pseudo-instruction metadata */
 
@@ -1190,6 +1191,9 @@ static const rv_comp_data rvcp_fsgnjx_q[] = {
     { rv_op_illegal, NULL }
 };
 
+/* Convert compressed insns into normal insns via pseudo expansion. */
+#define DECOMP(X) (static const rv_comp_data[1]){ { X, rvcc_true } }
+
 /* operand extractors */
 
 static uint32_t operand_rd(rv_inst inst)
@@ -1815,52 +1819,52 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { "fcvt.q.lu", rv_codec_r_m, rv_fmt_rm_frd_rs1 },
     { "fmv.x.q", rv_codec_r, rv_fmt_rd_frs1 },
     { "fmv.q.x", rv_codec_r, rv_fmt_frd_rs1 },
-    { "c.addi4spn", rv_codec_ciw_4spn, rv_fmt_rd_rs1_imm, NULL, rv_op_addi },
-    { "c.fld", rv_codec_cl_ld, rv_fmt_frd_offset_rs1, NULL, rv_op_fld },
-    { "c.lw", rv_codec_cl_lw, rv_fmt_rd_offset_rs1, NULL, rv_op_lw },
-    { "c.flw", rv_codec_cl_lw, rv_fmt_frd_offset_rs1, NULL, rv_op_flw },
-    { "c.fsd", rv_codec_cs_sd, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsd },
-    { "c.sw", rv_codec_cs_sw, rv_fmt_rs2_offset_rs1, NULL, rv_op_sw },
-    { "c.fsw", rv_codec_cs_sw, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsw },
+    { "c.addi4spn", rv_codec_ciw_4spn, rv_fmt_rd_rs1_imm, DECOMP(rv_op_addi) },
+    { "c.fld", rv_codec_cl_ld, rv_fmt_frd_offset_rs1, DECOMP(rv_op_fld) },
+    { "c.lw", rv_codec_cl_lw, rv_fmt_rd_offset_rs1, DECOMP(rv_op_lw) },
+    { "c.flw", rv_codec_cl_lw, rv_fmt_frd_offset_rs1, DECOMP(rv_op_flw) },
+    { "c.fsd", rv_codec_cs_sd, rv_fmt_frs2_offset_rs1, DECOMP(rv_op_fsd) },
+    { "c.sw", rv_codec_cs_sw, rv_fmt_rs2_offset_rs1, DECOMP(rv_op_sw) },
+    { "c.fsw", rv_codec_cs_sw, rv_fmt_frs2_offset_rs1, DECOMP(rv_op_fsw) },
     { },
-    { "c.addi", rv_codec_ci, rv_fmt_rd_rs1_imm, NULL, rv_op_addi },
-    { "c.jal", rv_codec_cj_jal, rv_fmt_rd_offset, NULL, rv_op_jal },
-    { "c.li", rv_codec_ci_li, rv_fmt_rd_rs1_imm, NULL, rv_op_addi },
-    { "c.addi16sp", rv_codec_ci_16sp, rv_fmt_rd_rs1_imm, NULL, rv_op_addi },
-    { "c.lui", rv_codec_ci_lui, rv_fmt_rd_uimm, NULL, rv_op_lui },
-    { "c.srli", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_srli },
-    { "c.srai", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_srai },
-    { "c.andi", rv_codec_cb_imm, rv_fmt_rd_rs1_imm, NULL, rv_op_andi },
-    { "c.sub", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_sub },
-    { "c.xor", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_xor },
-    { "c.or", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_or },
-    { "c.and", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_and },
-    { "c.subw", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_subw },
-    { "c.addw", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_addw },
-    { "c.j", rv_codec_cj, rv_fmt_rd_offset, NULL, rv_op_jal },
-    { "c.beqz", rv_codec_cb, rv_fmt_rs1_rs2_offset, NULL, rv_op_beq },
-    { "c.bnez", rv_codec_cb, rv_fmt_rs1_rs2_offset, NULL, rv_op_bne },
-    { "c.slli", rv_codec_ci_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_slli },
-    { "c.fldsp", rv_codec_ci_ldsp, rv_fmt_frd_offset_rs1, NULL, rv_op_fld },
-    { "c.lwsp", rv_codec_ci_lwsp, rv_fmt_rd_offset_rs1, NULL, rv_op_lw },
-    { "c.flwsp", rv_codec_ci_lwsp, rv_fmt_frd_offset_rs1, NULL, rv_op_flw },
-    { "c.jr", rv_codec_cr_jr, rv_fmt_rd_rs1_offset, NULL, rv_op_jalr },
-    { "c.mv", rv_codec_cr_mv, rv_fmt_rd_rs1_rs2, NULL, rv_op_addi },
-    { "c.ebreak", rv_codec_ci_none, rv_fmt_none, NULL, rv_op_ebreak },
-    { "c.jalr", rv_codec_cr_jalr, rv_fmt_rd_rs1_offset, NULL, rv_op_jalr },
-    { "c.add", rv_codec_cr, rv_fmt_rd_rs1_rs2, NULL, rv_op_add },
-    { "c.fsdsp", rv_codec_css_sdsp, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsd },
-    { "c.swsp", rv_codec_css_swsp, rv_fmt_rs2_offset_rs1, NULL, rv_op_sw },
-    { "c.fswsp", rv_codec_css_swsp, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsw },
-    { "c.ld", rv_codec_cl_ld, rv_fmt_rd_offset_rs1, NULL, rv_op_ld },
-    { "c.sd", rv_codec_cs_sd, rv_fmt_rs2_offset_rs1, NULL,  rv_op_sd },
-    { "c.addiw", rv_codec_ci, rv_fmt_rd_rs1_imm, NULL, rv_op_addiw },
-    { "c.ldsp", rv_codec_ci_ldsp, rv_fmt_rd_offset_rs1, NULL, rv_op_ld },
-    { "c.sdsp", rv_codec_css_sdsp, rv_fmt_rs2_offset_rs1, NULL, rv_op_sd },
-    { "c.lq", rv_codec_cl_lq, rv_fmt_rd_offset_rs1, NULL, rv_op_lq },
-    { "c.sq", rv_codec_cs_sq, rv_fmt_rs2_offset_rs1, NULL, rv_op_sq },
-    { "c.lqsp", rv_codec_ci_lqsp, rv_fmt_rd_offset_rs1, NULL, rv_op_lq },
-    { "c.sqsp", rv_codec_css_sqsp, rv_fmt_rs2_offset_rs1, NULL, rv_op_sq },
+    { "c.addi", rv_codec_ci, rv_fmt_rd_rs1_imm, DECOMP(rv_op_addi) },
+    { "c.jal", rv_codec_cj_jal, rv_fmt_rd_offset, DECOMP(rv_op_jal) },
+    { "c.li", rv_codec_ci_li, rv_fmt_rd_rs1_imm, DECOMP(rv_op_addi) },
+    { "c.addi16sp", rv_codec_ci_16sp, rv_fmt_rd_rs1_imm, DECOMP(rv_op_addi) },
+    { "c.lui", rv_codec_ci_lui, rv_fmt_rd_uimm, DECOMP(rv_op_lui) },
+    { "c.srli", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, DECOMP(rv_op_srli) },
+    { "c.srai", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, DECOMP(rv_op_srai) },
+    { "c.andi", rv_codec_cb_imm, rv_fmt_rd_rs1_imm, DECOMP(rv_op_andi) },
+    { "c.sub", rv_codec_cs, rv_fmt_rd_rs1_rs2, DECOMP(rv_op_sub) },
+    { "c.xor", rv_codec_cs, rv_fmt_rd_rs1_rs2, DECOMP(rv_op_xor) },
+    { "c.or", rv_codec_cs, rv_fmt_rd_rs1_rs2, DECOMP(rv_op_or) },
+    { "c.and", rv_codec_cs, rv_fmt_rd_rs1_rs2, DECOMP(rv_op_and) },
+    { "c.subw", rv_codec_cs, rv_fmt_rd_rs1_rs2, DECOMP(rv_op_subw) },
+    { "c.addw", rv_codec_cs, rv_fmt_rd_rs1_rs2, DECOMP(rv_op_addw) },
+    { "c.j", rv_codec_cj, rv_fmt_rd_offset, DECOMP(rv_op_jal) },
+    { "c.beqz", rv_codec_cb, rv_fmt_rs1_rs2_offset, DECOMP(rv_op_beq) },
+    { "c.bnez", rv_codec_cb, rv_fmt_rs1_rs2_offset, DECOMP(rv_op_bne) },
+    { "c.slli", rv_codec_ci_sh6, rv_fmt_rd_rs1_imm, DECOMP(rv_op_slli) },
+    { "c.fldsp", rv_codec_ci_ldsp, rv_fmt_frd_offset_rs1, DECOMP(rv_op_fld) },
+    { "c.lwsp", rv_codec_ci_lwsp, rv_fmt_rd_offset_rs1, DECOMP(rv_op_lw) },
+    { "c.flwsp", rv_codec_ci_lwsp, rv_fmt_frd_offset_rs1, DECOMP(rv_op_flw) },
+    { "c.jr", rv_codec_cr_jr, rv_fmt_rd_rs1_offset, DECOMP(rv_op_jalr) },
+    { "c.mv", rv_codec_cr_mv, rv_fmt_rd_rs1_rs2, DECOMP(rv_op_addi) },
+    { "c.ebreak", rv_codec_ci_none, rv_fmt_none, DECOMP(rv_op_ebreak) },
+    { "c.jalr", rv_codec_cr_jalr, rv_fmt_rd_rs1_offset, DECOMP(rv_op_jalr) },
+    { "c.add", rv_codec_cr, rv_fmt_rd_rs1_rs2, DECOMP(rv_op_add) },
+    { "c.fsdsp", rv_codec_css_sdsp, rv_fmt_frs2_offset_rs1, DECOMP(rv_op_fsd) },
+    { "c.swsp", rv_codec_css_swsp, rv_fmt_rs2_offset_rs1, DECOMP(rv_op_sw) },
+    { "c.fswsp", rv_codec_css_swsp, rv_fmt_frs2_offset_rs1, DECOMP(rv_op_fsw) },
+    { "c.ld", rv_codec_cl_ld, rv_fmt_rd_offset_rs1, DECOMP(rv_op_ld) },
+    { "c.sd", rv_codec_cs_sd, rv_fmt_rs2_offset_rs1, DECOMP(rv_op_sd) },
+    { "c.addiw", rv_codec_ci, rv_fmt_rd_rs1_imm, DECOMP(rv_op_addiw) },
+    { "c.ldsp", rv_codec_ci_ldsp, rv_fmt_rd_offset_rs1, DECOMP(rv_op_ld) },
+    { "c.sdsp", rv_codec_css_sdsp, rv_fmt_rs2_offset_rs1, DECOMP(rv_op_sd) },
+    { "c.lq", rv_codec_cl_lq, rv_fmt_rd_offset_rs1, DECOMP(rv_op_lq) },
+    { "c.sq", rv_codec_cs_sq, rv_fmt_rs2_offset_rs1, DECOMP(rv_op_sq) },
+    { "c.lqsp", rv_codec_ci_lqsp, rv_fmt_rd_offset_rs1, DECOMP(rv_op_lq) },
+    { "c.sqsp", rv_codec_css_sqsp, rv_fmt_rs2_offset_rs1, DECOMP(rv_op_sq) },
     { "nop", rv_codec_i, rv_fmt_none },
     { "mv", rv_codec_i, rv_fmt_rd_rs1 },
     { "not", rv_codec_i, rv_fmt_rd_rs1 },
@@ -2542,8 +2546,8 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { "ssrdp", rv_codec_r, rv_fmt_rd },
     { "ssamoswap.w", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1 },
     { "ssamoswap.d", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1 },
-    { "c.sspush", rv_codec_cmop_ss, rv_fmt_rs2, NULL, rv_op_sspush },
-    { "c.sspopchk", rv_codec_cmop_ss, rv_fmt_rs1, NULL, rv_op_sspopchk },
+    { "c.sspush", rv_codec_cmop_ss, rv_fmt_rs2, DECOMP(rv_op_sspush) },
+    { "c.sspopchk", rv_codec_cmop_ss, rv_fmt_rs1, DECOMP(rv_op_sspopchk) },
    { "cbo.inval", rv_codec_r, rv_fmt_rs1 },
    { "cbo.clean", rv_codec_r, rv_fmt_rs1 },
    { "cbo.flush", rv_codec_r, rv_fmt_rs1 },
@@ -5269,20 +5273,6 @@ static const rv_opcode_data *decode_inst_lift_pseudo(rv_decode *dec,
     return op;
 }
 
-/* decompress instruction */
-
-static const rv_opcode_data *decode_inst_decompress(rv_decode *dec,
-                                                    const rv_opcode_data *op)
-{
-    int decomp_op = op->decomp;
-
-    if (decomp_op != rv_op_illegal) {
-        dec->op = decomp_op;
-        op = &dec->opcode_data[decomp_op];
-    }
-    return op;
-}
-
 /* disassemble instruction */
 
 static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
@@ -5333,7 +5323,6 @@ static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
 
     op = &dec.opcode_data[dec.op];
     decode_inst_operands(&dec, isa, op);
-    op = decode_inst_decompress(&dec, op);
     op = decode_inst_lift_pseudo(&dec, op);
     return format_inst(24, &dec, op);
 }
-- 
2.43.0


