Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14025C5DF65
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:38:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUm-0007at-Et; Wed, 12 Aug 2026 18:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUf-0007Rm-4i
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:17 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUa-00014I-PT
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:16 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-cbedf433a99so1408532a12.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573931; x=1787178731; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GiSj3EYUGz8BX5H50gqebStdrZIv+vXdalzd2rabGCo=;
 b=gPawujRT7/djxGhQdCNtbntIq82FbRtrk5MZ8xHjy5R5PXtmSyz8uNJmkEHcUev0w/
 z29uMLLh+pxf3oS5bJ+Y9BBaZEvF//4Xgv/kBgOWzYkYtC2qZICRzye0xHawzR/LZr+e
 hXCetwUa660BF6VwYe5fEnC7wjsNlxGH+zpZBSu53LkcNSjwGPo8XdsakpnntMultzoT
 WT1A8+tgKZositySM08noIJxtR3UUvYsLVjHdW5GVErFEJtBWxxgxKYb9q59c0TGfHOh
 FLl1IPWzQWw85HtmTMqS70kMyUxCQbhcxwwDYjnLRWHlj4vepZC545fSfkCJWFnRFMOm
 2KJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573931; x=1787178731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GiSj3EYUGz8BX5H50gqebStdrZIv+vXdalzd2rabGCo=;
 b=DBm3hQ8h+lkSZ/bjdvh7JQK1mGQ6fdkwN1Jqygp6haV4jd6Qs6jgAtILsQ9PIAX0UJ
 bDRP+Qir90IHgv6oSSwZUS4wfo7Tc6d12QjqEtjmuUM+DpW8CW0nG36XL/9N7nXhBlcp
 7OG9Ldlk7M/EVpktyps9xOff6ypBpJ2ZOy6ch1MbjgobY9kdF9v8LoivcrMVZYzxw6sI
 jGi/FMhhPPA/nyD6qUWJFROANGgb2oV/DuefIZ4rp9qkGVe9G5NWWF8de2/jLwKP+Nv3
 SUrZdOeamUgxhfQ34eITI35KUVjzESwzQHNt/qMRSLI86UbEkDP2ccKH6AoUnlbgY8G3
 IyNA==
X-Gm-Message-State: AOJu0YxcnjHoeeAI//MUO5cps7ZxtjGB1KSHZbr4vqa6sy8WBGaDlzOf
 3m7p+DH7SB+7kpe2xAsUYrf6fOfhtvR+zS0+0OQ+aIKuwWJUcu3NaomRrs6Rbw4oBZ4=
X-Gm-Gg: AR+sD13FFOUyDUAZTeF3Lww0ksQB0tWbqF4wMZqRpBDoVG6f9hVRd3xZU24C+krg6FA
 eGogdhO5mGIOgjgnRaSXWV81PjX/qqUJ5hBppGLsJsyx95SjrdWrqd63Qv20Y8bLF0RfxJOV/1M
 guME5glpyxW/S6N3kdNtHSzNoYGiW2W3k9dGd1lM1sJcZNeS04iyiMjs0z09GzKxIFwUi/Djevg
 ZBNUMW9NiI1lcK/lC0CspsdmPjZDtnTFd9auCWMtpSpxMWFrXRPT6qO4ZVhpNxvHUfG40gy7p3O
 DzJgXQvdGoERH4ZZo+Z0eRaJt/DvAIrEDi+7cvsURiBl93+RBDxUFJNP2Vx5ZGSTrq9NPIesYGY
 n8JNBHPOO1YOvHEiHuHVtJdlPqMjfCMSZky1mgVD4/0HCPgaUVJnb/LG3T0izqmbmiYH61todQH
 muKvb9SfMSR1zfrlkI8nn38lqcGhhiHPmFJhP0fM+zNnkksUN0FQ/WIWCb20OvnoHAdtEyq4VP/
 +zub6oTcEpJRbCZVnGF
X-Received: by 2002:a05:6a20:6a1a:b0:3cc:3d08:da39 with SMTP id
 adf61e73a8af0-3cc54bec046mr1978278637.0.1786573930964; 
 Wed, 12 Aug 2026 15:32:10 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 27/52] disas/riscv: Handle decompression via
 decode_inst_lift_pseudo
Date: Wed, 12 Aug 2026 15:31:17 -0700
Message-ID: <20260812223142.349142-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Adjust macro to satisfy clang
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
index b8e5b124a5..a359badab5 100644
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
+#define DECOMP(X)  &(const rv_comp_data){ X, rvcc_true }
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


