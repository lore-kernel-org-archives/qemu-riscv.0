Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EA8C5DF65
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:34:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHV1-0007xw-36; Wed, 12 Aug 2026 18:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUj-0007WH-Cm
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:21 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUf-00017L-0j
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:19 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-84830c774a0so1874874b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573936; x=1787178736; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1TCsZQDE6n/2GIe+FASuoj4mcq+yevgv7mAKXmjwUMc=;
 b=D6jD5PXS3eNe/Yh759d9wt3Q0Ovo/INwcZit8mus1KF3y6iixz6gfiuDpJwWddWnze
 5xXgYUbe3rEna7hkbBodK4wwV/eT+YU+i6PRq6QMc3gjlkRNd95kAUe9BMBS9x63dbTp
 jkA/iUPWVKXEI8tv5uG1vzxT1BwQJgULrpnzHcb0ZvMfqxSW4WA4k3iyZZiCHzRfK+3A
 sFu7iq1aKpzWAqcPL2aHqREze7JuPAEZeo7kfBRC7Mey0B3jlw0ydkxLmfrB9V3S5Dq4
 pJw+mITfvyaudvuDhr49tBIdPB7mIG4OYxn0bPHhk1YMR7e9bbzt5jsT/5QXa8j37PdQ
 sqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573936; x=1787178736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1TCsZQDE6n/2GIe+FASuoj4mcq+yevgv7mAKXmjwUMc=;
 b=JPZqKB8rlVTSQPztB3aICZbC30FTJehMWJjKszeD32yRPGuMjXJ/N31LUkwyA3+LY8
 iqcCaj7rMn7Jre5ByBoFtvVhjRAogebPeJWK+p3pFyBvo6qSaM/Oy5GFAKbLIRSgttuW
 UR5rP0FRWVBA4ms3tD52c5L5aFWSp/Kl20FMA2bBXOLVpveyri1cb9lN/7gxiniDDdYs
 VlBfmptZDVccfYiKfqVOvQIP8UfnSMxLF2Lg82zbBzF4h8yxs96Jkl96HFahNjSZlFej
 r/U3Szdp8V0ytLp/T8kS87qoxbgxz+JVQ/w2rftR/55BhZhjW42Xkx2s4UD+xtdRSDLQ
 Nb0w==
X-Gm-Message-State: AOJu0YyZGVZOuyD6J2nALb4uFFGaRVQx1JLpJ4B5MnkegWTJl1kkzNhw
 C+Pkq2aON8L0mFY8T4NljimlAMDdmRndQvjW4zdTWq/mXiFB8FVFNPwX5g+67zCimmo=
X-Gm-Gg: AR+sD13QLDGdFjIN+zd2StCV9Tma/0bPeiIXkyI4K8mxn7sYUXBE653qptV4ZkUKhh9
 uFSiaOugdkB96rORkcRTuqUDh1EMsWI068Id6cTblYZqxoGKjpzIEfds9oN4F9S77UxhPtte6aQ
 g8+U7s8xlNZQZmMtYkuxMH7mzkxX0Ec4n5L93hT9XLIDHTBoBdFFxjMN7uFHFt3K7OI2NqVRx/5
 9FpS0B+7STZpfNFDqRvCzgQOsrSVqBPJNAeaZmjYZO2Mz6BodEpkN6BWUQyJNW33ahgw08z5FPx
 xNSbVrYrXSANnbYaUO/Aja4lCMfchNInPqplZb0rL93Txdz7B6aWkhVsFK6rdb8lrZLr9uHzxQh
 SQZc3fbVXwBzC+X9dZYozsZo1IMzI1TsWYxMETc/SwnURTjRMCG8aA/qKz0R34Aprje36qKm7b7
 R+5wp5SzXkEpi7ik9soFynujJxDR6SwM+PztwRRqMheKn6HQ3V6eVr59eYKUgVyUutP8zmuC7wH
 BPKyneSwLw8R1kM5YkFmLydb+QBrTc=
X-Received: by 2002:a05:6a21:4cca:b0:3cc:45cc:c401 with SMTP id
 adf61e73a8af0-3cc5504460bmr2247713637.13.1786573935451; 
 Wed, 12 Aug 2026 15:32:15 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 32/52] disas/riscv: Use rv_codec_illegal for pseudos
Date: Wed, 12 Aug 2026 15:31:22 -0700
Message-ID: <20260812223142.349142-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

The codec is never used, since we arrive into pseudos
from a decoding of another opcode.
Assert that rv_codec_illegal is never decoded.
Use rv_codec_none for rv_op_illegal.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 68 +++++++++++++++++++++++++--------------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 7fa76b2d15..dedd925077 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1599,7 +1599,7 @@ static uint32_t operand_lpl(rv_inst inst)
 /* instruction metadata */
 
 static const rv_opcode_data rvi_opcode_data[] = {
-    { "illegal", rv_codec_illegal, rv_fmt_none },
+    { "illegal", rv_codec_none, rv_fmt_none },
     { "lui", rv_codec_u, rv_fmt_rd_uimm },
     { "auipc", rv_codec_u, rv_fmt_rd_uoffset },
     { "jal", rv_codec_uj, rv_fmt_rd_offset, rvcp_jal },
@@ -1872,38 +1872,38 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { "c.sq", rv_codec_cs_sq, NULL, DECOMP(rv_op_sq) },
     { "c.lqsp", rv_codec_ci_lqsp, NULL, DECOMP(rv_op_lq) },
     { "c.sqsp", rv_codec_css_sqsp, NULL, DECOMP(rv_op_sq) },
-    { "nop", rv_codec_i, rv_fmt_none },
-    { "mv", rv_codec_i, rv_fmt_rd_rs1, rvcp_mv },
-    { "not", rv_codec_i, rv_fmt_rd_rs1 },
-    { "neg", rv_codec_r, rv_fmt_rd_rs2 },
-    { "negw", rv_codec_r, rv_fmt_rd_rs2 },
-    { "sext.w", rv_codec_i, rv_fmt_rd_rs1 },
-    { "seqz", rv_codec_i, rv_fmt_rd_rs1 },
-    { "snez", rv_codec_r, rv_fmt_rd_rs2 },
-    { "sltz", rv_codec_r, rv_fmt_rd_rs1 },
-    { "sgtz", rv_codec_r, rv_fmt_rd_rs2 },
-    { "fmv.s", rv_codec_r, rv_fmt_frd_frs1 },
-    { "fabs.s", rv_codec_r, rv_fmt_frd_frs1 },
-    { "fneg.s", rv_codec_r, rv_fmt_frd_frs1 },
-    { "fmv.d", rv_codec_r, rv_fmt_frd_frs1 },
-    { "fabs.d", rv_codec_r, rv_fmt_frd_frs1 },
-    { "fneg.d", rv_codec_r, rv_fmt_frd_frs1 },
-    { "fmv.q", rv_codec_r, rv_fmt_frd_frs1 },
-    { "fabs.q", rv_codec_r, rv_fmt_frd_frs1 },
-    { "fneg.q", rv_codec_r, rv_fmt_frd_frs1 },
-    { "beqz", rv_codec_sb, rv_fmt_rs1_offset },
-    { "bnez", rv_codec_sb, rv_fmt_rs1_offset },
-    { "blez", rv_codec_sb, rv_fmt_rs2_offset },
-    { "bgez", rv_codec_sb, rv_fmt_rs1_offset },
-    { "bltz", rv_codec_sb, rv_fmt_rs1_offset },
-    { "bgtz", rv_codec_sb, rv_fmt_rs2_offset },
-    { "jal", rv_codec_none, rv_fmt_offset }, /* rv_op_jal_ra */
-    { "jalr", rv_codec_none, rv_fmt_rs1 }, /* rv_op_jalr_ra */
+    { "nop", rv_codec_illegal, rv_fmt_none },
+    { "mv", rv_codec_illegal, rv_fmt_rd_rs1, rvcp_mv },
+    { "not", rv_codec_illegal, rv_fmt_rd_rs1 },
+    { "neg", rv_codec_illegal, rv_fmt_rd_rs2 },
+    { "negw", rv_codec_illegal, rv_fmt_rd_rs2 },
+    { "sext.w", rv_codec_illegal, rv_fmt_rd_rs1 },
+    { "seqz", rv_codec_illegal, rv_fmt_rd_rs1 },
+    { "snez", rv_codec_illegal, rv_fmt_rd_rs2 },
+    { "sltz", rv_codec_illegal, rv_fmt_rd_rs1 },
+    { "sgtz", rv_codec_illegal, rv_fmt_rd_rs2 },
+    { "fmv.s", rv_codec_illegal, rv_fmt_frd_frs1 },
+    { "fabs.s", rv_codec_illegal, rv_fmt_frd_frs1 },
+    { "fneg.s", rv_codec_illegal, rv_fmt_frd_frs1 },
+    { "fmv.d", rv_codec_illegal, rv_fmt_frd_frs1 },
+    { "fabs.d", rv_codec_illegal, rv_fmt_frd_frs1 },
+    { "fneg.d", rv_codec_illegal, rv_fmt_frd_frs1 },
+    { "fmv.q", rv_codec_illegal, rv_fmt_frd_frs1 },
+    { "fabs.q", rv_codec_illegal, rv_fmt_frd_frs1 },
+    { "fneg.q", rv_codec_illegal, rv_fmt_frd_frs1 },
+    { "beqz", rv_codec_illegal, rv_fmt_rs1_offset },
+    { "bnez", rv_codec_illegal, rv_fmt_rs1_offset },
+    { "blez", rv_codec_illegal, rv_fmt_rs2_offset },
+    { "bgez", rv_codec_illegal, rv_fmt_rs1_offset },
+    { "bltz", rv_codec_illegal, rv_fmt_rs1_offset },
+    { "bgtz", rv_codec_illegal, rv_fmt_rs2_offset },
+    { "jal", rv_codec_illegal, rv_fmt_offset }, /* rv_op_jal_ra */
+    { "jalr", rv_codec_illegal, rv_fmt_rs1 }, /* rv_op_jalr_ra */
     { },
     { },
-    { "j", rv_codec_uj, rv_fmt_offset },
-    { "ret", rv_codec_i, rv_fmt_none },
-    { "jr", rv_codec_i, rv_fmt_rs1, rvcp_jr },
+    { "j", rv_codec_illegal, rv_fmt_offset },
+    { "ret", rv_codec_illegal, rv_fmt_none },
+    { "jr", rv_codec_illegal, rv_fmt_rs1, rvcp_jr },
     { "rdcycle", rv_codec_i_csr, rv_fmt_rd },
     { "rdtime", rv_codec_i_csr, rv_fmt_rd },
     { "rdinstret", rv_codec_i_csr, rv_fmt_rd },
@@ -4551,8 +4551,6 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa,
     rv_inst inst = dec->inst;
 
     switch (op->codec) {
-    case rv_codec_illegal:
-        break;
     case rv_codec_none:
         dec->rd = dec->rs1 = dec->rs2 = rv_ireg_zero;
         dec->imm = 0;
@@ -4946,7 +4944,9 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa,
         dec->rs1 = dec->rs2 = operand_crs1(inst);
         dec->imm = 0;
         break;
-    };
+    default:
+        g_assert_not_reached();
+    }
 }
 
 /* check constraint */
-- 
2.43.0


