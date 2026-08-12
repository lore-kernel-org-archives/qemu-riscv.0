Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBB7C5CFDB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:32:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUF-00077A-A0; Wed, 12 Aug 2026 18:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUD-00076K-Tc
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:31:49 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUB-0000sN-0Y
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:31:49 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-84862b0d5f8so1409568b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573906; x=1787178706; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HcpffeM6ypfeKmbZu2HhAuS/9RW34hpV97kz+hXXUkM=;
 b=XmiGUp7LzEEhK09MqTXA1I6IjXSLzsXJoFNAvH+VksXdIFTyuhunWk3uKfU2gk9ttc
 8oH3ldnFn+Oj4Qhl1mR1/+dg2GM6OPXmUcM6OSPLiHimrNMUqraAuB27NwV15uNLmeS0
 TEg4RQPavj5v39WFjXRIq2JEXStrGK8+BooeE/moemkO4GvmmmTQJmWa+KuKM18iPeEy
 stjBZTdN9IA3Z6fBfdUFvKk0YhPD7XLIQTbFKlcTMrNU+R5hWTHQV5vCGeYBvp4rtI2a
 kVSkqe6oUZl3AuldytRCD8Z0CmKjMg1HLu8J9OLDVNFwgHUy8J8JA2DO2bSS93qavwkb
 oCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573906; x=1787178706;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HcpffeM6ypfeKmbZu2HhAuS/9RW34hpV97kz+hXXUkM=;
 b=tJmv2o0ciAGBpqEHyYaEtK6i4fngkr3OgjHoobrfDQ/9UkEw0ocdcPpiG55srSi7w+
 UUJ6m2V9aJQPPfdUUIkXJlYomikg16XKLy8HNvLMOoSB/DEtykk4X96rZXthpRxdKCjY
 uOCCaW6JFDO5Rj2RQfklebmR4sxefIi/w4ALn9qlMN7tc504xzF3FEX0AfoGEX2PGtI5
 EgD073geKsLTTkbx2jJTeNCVpS1ZhSSbReiijDvV71dRqr2+IuHNS6a1ht/EVQXKZSeg
 ijHnBcbDL4K4BEuEkniKzduE/1wbQEs54iY67wd3kP0RTJ8Ks42H84j+R/LthgXG1tOg
 qTbw==
X-Gm-Message-State: AOJu0Ywdt5f0cOd01MOlY8p8203fuev8f9E0JgFQMaLwESPnVSJVipD7
 +aSNMvFpM0wjW7MHww45GDYMebWfuUllZIf7b7dH8/S1kMckuwu7kBcBa4SU9q/7+I0=
X-Gm-Gg: AR+sD12x7KyMDVQHO1DHuEZvkhCmbbnpo0l76GapRTNqurqrI0lIKMEy1vB9xGAnHnn
 +HvaIojMbXiN4ad/Nil5gjBZHwcrY942mL88qy7CYOk5Mcab+atGbN/VClLKNLtwWhdoYAAykk8
 s9jUj5mKnI6ys+yVPOt9bKwgRsdXTTOLgM0JxMVq1eaO05dvX1+ldHV8Uw8d+cmjO2sSRn6Las/
 02PKNaSqNAgvkpWhfgAsDqI0H8pM0jN64xZ+dsvslEmLQDHuea+NvMFtpyjiY4qXf85dtUa2apo
 Z6Nslji+wJaoqArA3BYEeo6pio7tt6ewrs1MPfF9+j8IExKaReV4KjK6JK+yfWj+8qwU21F5s9Y
 rEKwrPcVoQuJiDP3zlqV0qlN9FrdBNPYtEWJ/8DK0d9WrTXydf36MIJUvh5DbSpZU7nMrNvgd+z
 uuxWIMOlE+VfQc6wPta3cHr2tYcuP+9uiP+d3oxAUN/pPiT/7R/UwDYY+JTZisoswFr1dzLD5qa
 N8ve5XejR/s/VULbo7rvg==
X-Received: by 2002:a05:6a20:3c8d:b0:3cb:b3ea:858a with SMTP id
 adf61e73a8af0-3cc5539732fmr2263274637.20.1786573905378; 
 Wed, 12 Aug 2026 15:31:45 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:31:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 01/52] disas/riscv: Move operand extractors earlier in file
Date: Wed, 12 Aug 2026 15:30:51 -0700
Message-ID: <20260812223142.349142-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 790 +++++++++++++++++++++++++-------------------------
 1 file changed, 395 insertions(+), 395 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 2ba0a6a73a..e3fbc26626 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1259,6 +1259,401 @@ static const rv_comp_data rvcp_fsgnjx_q[] = {
     { rv_op_illegal, NULL }
 };
 
+/* operand extractors */
+
+static uint32_t operand_rd(rv_inst inst)
+{
+    return extract32(inst, 7, 5);
+}
+
+static uint32_t operand_rs1(rv_inst inst)
+{
+    return extract32(inst, 15, 5);
+}
+
+static uint32_t operand_rs2(rv_inst inst)
+{
+    return extract32(inst, 20, 5);
+}
+
+static uint32_t operand_rs3(rv_inst inst)
+{
+    return extract32(inst, 27, 5);
+}
+
+static uint32_t operand_aq(rv_inst inst)
+{
+    return extract32(inst, 26, 1);
+}
+
+static uint32_t operand_rl(rv_inst inst)
+{
+    return extract32(inst, 25, 1);
+}
+
+static uint32_t operand_pred(rv_inst inst)
+{
+    return extract32(inst, 24, 4);
+}
+
+static uint32_t operand_succ(rv_inst inst)
+{
+    return extract32(inst, 20, 4);
+}
+
+static uint32_t operand_rm(rv_inst inst)
+{
+    return extract32(inst, 12, 3);
+}
+
+static uint32_t operand_shamt5(rv_inst inst)
+{
+    return extract32(inst, 20, 5);
+}
+
+static uint32_t operand_shamt6(rv_inst inst)
+{
+    return extract32(inst, 20, 6);
+}
+
+static uint32_t operand_shamt7(rv_inst inst)
+{
+    return extract32(inst, 20, 7);
+}
+
+static uint32_t operand_crdq(rv_inst inst)
+{
+    return extract32(inst, 2, 3);
+}
+
+static uint32_t operand_crs1q(rv_inst inst)
+{
+    return extract32(inst, 7, 3);
+}
+
+static uint32_t operand_crs1rdq(rv_inst inst)
+{
+    return extract32(inst, 7, 3);
+}
+
+static uint32_t operand_crs2q(rv_inst inst)
+{
+    return extract32(inst, 2, 3);
+}
+
+static uint32_t calculate_xreg(uint32_t sreg)
+{
+    return sreg < 2 ? sreg + 8 : sreg + 16;
+}
+
+static uint32_t operand_sreg1(rv_inst inst)
+{
+    return calculate_xreg(extract32(inst, 7, 3));
+}
+
+static uint32_t operand_sreg2(rv_inst inst)
+{
+    return calculate_xreg(extract32(inst, 2, 3));
+}
+
+static uint32_t operand_crd(rv_inst inst)
+{
+    return extract32(inst, 7, 5);
+}
+
+static uint32_t operand_crs1(rv_inst inst)
+{
+    return extract32(inst, 7, 5);
+}
+
+static uint32_t operand_crs1rd(rv_inst inst)
+{
+    return extract32(inst, 7, 5);
+}
+
+static uint32_t operand_crs2(rv_inst inst)
+{
+    return extract32(inst, 2, 5);
+}
+
+static uint32_t operand_cimmsh5(rv_inst inst)
+{
+    return extract32(inst, 2, 5);
+}
+
+static uint32_t operand_csr12(rv_inst inst)
+{
+    return extract32(inst, 20, 12);
+}
+
+static int32_t operand_imm12(rv_inst inst)
+{
+    return sextract32(inst, 20, 12);
+}
+
+static int32_t operand_imm20(rv_inst inst)
+{
+    return sextract32(inst, 12, 20) << 12;
+}
+
+static int32_t operand_jimm20(rv_inst inst)
+{
+    return sextract32(inst, 31, 1) << 20 |
+        extract32(inst, 21, 10) << 1 |
+        extract32(inst, 20, 1) << 11 |
+        extract32(inst, 12, 8) << 12;
+}
+
+static int32_t operand_simm12(rv_inst inst)
+{
+    return sextract32(inst, 25, 7) << 5 |
+        extract32(inst, 7, 5);
+}
+
+static int32_t operand_sbimm12(rv_inst inst)
+{
+    return sextract32(inst, 31, 1) << 12 |
+        extract32(inst, 25, 6) << 5 |
+        extract32(inst, 8, 4) << 1 |
+        extract32(inst, 7, 1) << 11;
+}
+
+static uint32_t operand_cimmshl6(rv_inst inst, rv_isa isa)
+{
+    int imm = extract32(inst, 12, 1) << 5 |
+        extract32(inst, 2, 5);
+    if (isa == rv128) {
+        imm = imm ? imm : 64;
+    }
+    return imm;
+}
+
+static uint32_t operand_cimmshr6(rv_inst inst, rv_isa isa)
+{
+    int imm = extract32(inst, 12, 1) << 5 |
+        extract32(inst, 2, 5);
+    if (isa == rv128) {
+        imm = imm | (imm & 32) << 1;
+        imm = imm ? imm : 64;
+    }
+    return imm;
+}
+
+static int32_t operand_cimmi(rv_inst inst)
+{
+    return sextract32(inst, 12, 1) << 5 |
+        extract32(inst, 2, 5);
+}
+
+static int32_t operand_cimmui(rv_inst inst)
+{
+    return sextract32(inst, 12, 1) << 17 |
+        extract32(inst, 2, 5) << 12;
+}
+
+static uint32_t operand_cimmlwsp(rv_inst inst)
+{
+    return extract32(inst, 12, 1) << 5 |
+        extract32(inst, 4, 3) << 2 |
+        extract32(inst, 2, 2) << 6;
+}
+
+static uint32_t operand_cimmldsp(rv_inst inst)
+{
+    return extract32(inst, 12, 1) << 5 |
+        extract32(inst, 5, 2) << 3 |
+        extract32(inst, 2, 3) << 6;
+}
+
+static uint32_t operand_cimmlqsp(rv_inst inst)
+{
+    return extract32(inst, 12, 1) << 5 |
+        extract32(inst, 6, 1) << 4 |
+        extract32(inst, 2, 4) << 6;
+}
+
+static int32_t operand_cimm16sp(rv_inst inst)
+{
+    return sextract32(inst, 12, 1) << 9 |
+        extract32(inst, 6, 1) << 4 |
+        extract32(inst, 5, 1) << 6 |
+        extract32(inst, 3, 2) << 7 |
+        extract32(inst, 2, 1) << 5;
+}
+
+static int32_t operand_cimmj(rv_inst inst)
+{
+    return sextract32(inst, 12, 1) << 11 |
+        extract32(inst, 11, 1) << 4 |
+        extract32(inst, 9, 2) << 8 |
+        extract32(inst, 8, 1) << 10 |
+        extract32(inst, 7, 1) << 6 |
+        extract32(inst, 6, 1) << 7 |
+        extract32(inst, 3, 3) << 1 |
+        extract32(inst, 2, 1) << 5;
+}
+
+static int32_t operand_cimmb(rv_inst inst)
+{
+    return sextract32(inst, 12, 1) << 8 |
+        extract32(inst, 10, 2) << 3 |
+        extract32(inst, 5, 2) << 6 |
+        extract32(inst, 3, 2) << 1 |
+        extract32(inst, 2, 1) << 5;
+}
+
+static uint32_t operand_cimmswsp(rv_inst inst)
+{
+    return extract32(inst, 9, 4) << 2 |
+        extract32(inst, 7, 2) << 6;
+}
+
+static uint32_t operand_cimmsdsp(rv_inst inst)
+{
+    return extract32(inst, 10, 3) << 3 |
+        extract32(inst, 7, 3) << 6;
+}
+
+static uint32_t operand_cimmsqsp(rv_inst inst)
+{
+    return extract32(inst, 11, 2) << 4 |
+        extract32(inst, 7, 4) << 6;
+}
+
+static uint32_t operand_cimm4spn(rv_inst inst)
+{
+    return extract32(inst, 11, 2) << 4 |
+        extract32(inst, 7, 4) << 6 |
+        extract32(inst, 6, 1) << 2 |
+        extract32(inst, 5, 1) << 3;
+}
+
+static uint32_t operand_cimmw(rv_inst inst)
+{
+    return extract32(inst, 10, 3) << 3 |
+        extract32(inst, 6, 1) << 2 |
+        extract32(inst, 5, 1) << 6;
+}
+
+static uint32_t operand_cimmd(rv_inst inst)
+{
+    return extract32(inst, 10, 3) << 3 |
+        extract32(inst, 5, 2) << 6;
+}
+
+static uint32_t operand_cimmq(rv_inst inst)
+{
+    return extract32(inst, 11, 2) << 4 |
+        extract32(inst, 10, 1) << 8 |
+        extract32(inst, 5, 2) << 6;
+}
+
+static int32_t operand_vimm(rv_inst inst)
+{
+    return sextract32(inst, 15, 5);
+}
+
+static uint32_t operand_vuimm(rv_inst inst)
+{
+    return extract32(inst, 15, 5);
+}
+
+static uint32_t operand_vzimm11(rv_inst inst)
+{
+    return extract32(inst, 20, 11);
+}
+
+static uint32_t operand_vzimm10(rv_inst inst)
+{
+    return extract32(inst, 20, 10);
+}
+
+static uint32_t operand_vzimm6(rv_inst inst)
+{
+    return extract32(inst, 26, 1) << 5 |
+        extract32(inst, 15, 5);
+}
+
+static uint32_t operand_bs(rv_inst inst)
+{
+    return extract32(inst, 30, 2);
+}
+
+static uint32_t operand_rnum(rv_inst inst)
+{
+    return extract32(inst, 20, 4);
+}
+
+static uint32_t operand_vm(rv_inst inst)
+{
+    return extract32(inst, 25, 1);
+}
+
+static uint32_t operand_uimm_c_lb(rv_inst inst)
+{
+    return extract32(inst, 5, 1) << 1 |
+        extract32(inst, 6, 1);
+}
+
+static uint32_t operand_uimm_c_lh(rv_inst inst)
+{
+    return extract32(inst, 5, 1) << 1;
+}
+
+static uint32_t operand_zcmp_spimm(rv_inst inst)
+{
+    return extract32(inst, 2, 2) << 4;
+}
+
+static uint32_t operand_zcmp_rlist(rv_inst inst)
+{
+    return extract32(inst, 4, 4);
+}
+
+static uint32_t operand_imm6(rv_inst inst)
+{
+    return extract32(inst, 20, 6);
+}
+
+static uint32_t operand_imm2(rv_inst inst)
+{
+    return extract32(inst, 25, 2);
+}
+
+static uint32_t operand_immh(rv_inst inst)
+{
+    return extract32(inst, 26, 6);
+}
+
+static uint32_t operand_imml(rv_inst inst)
+{
+    return extract32(inst, 20, 6);
+}
+
+static uint32_t calculate_stack_adj(rv_isa isa, uint32_t rlist, uint32_t spimm)
+{
+    int xlen_bytes_log2 = isa == rv64 ? 3 : 2;
+    int regs = rlist == 15 ? 13 : rlist - 3;
+    uint32_t stack_adj_base = ROUND_UP(regs << xlen_bytes_log2, 16);
+    return stack_adj_base + spimm;
+}
+
+static uint32_t operand_zcmp_stack_adj(rv_inst inst, rv_isa isa)
+{
+    return calculate_stack_adj(isa, operand_zcmp_rlist(inst),
+                               operand_zcmp_spimm(inst));
+}
+
+static uint32_t operand_tbl_index(rv_inst inst)
+{
+    return extract32(inst, 2, 8);
+}
+
+static uint32_t operand_lpl(rv_inst inst)
+{
+    return extract32(inst, 12, 20);
+}
+
 /* instruction metadata */
 
 const rv_opcode_data rvi_opcode_data[] = {
@@ -4198,401 +4593,6 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
     dec->op = op;
 }
 
-/* operand extractors */
-
-static uint32_t operand_rd(rv_inst inst)
-{
-    return extract32(inst, 7, 5);
-}
-
-static uint32_t operand_rs1(rv_inst inst)
-{
-    return extract32(inst, 15, 5);
-}
-
-static uint32_t operand_rs2(rv_inst inst)
-{
-    return extract32(inst, 20, 5);
-}
-
-static uint32_t operand_rs3(rv_inst inst)
-{
-    return extract32(inst, 27, 5);
-}
-
-static uint32_t operand_aq(rv_inst inst)
-{
-    return extract32(inst, 26, 1);
-}
-
-static uint32_t operand_rl(rv_inst inst)
-{
-    return extract32(inst, 25, 1);
-}
-
-static uint32_t operand_pred(rv_inst inst)
-{
-    return extract32(inst, 24, 4);
-}
-
-static uint32_t operand_succ(rv_inst inst)
-{
-    return extract32(inst, 20, 4);
-}
-
-static uint32_t operand_rm(rv_inst inst)
-{
-    return extract32(inst, 12, 3);
-}
-
-static uint32_t operand_shamt5(rv_inst inst)
-{
-    return extract32(inst, 20, 5);
-}
-
-static uint32_t operand_shamt6(rv_inst inst)
-{
-    return extract32(inst, 20, 6);
-}
-
-static uint32_t operand_shamt7(rv_inst inst)
-{
-    return extract32(inst, 20, 7);
-}
-
-static uint32_t operand_crdq(rv_inst inst)
-{
-    return extract32(inst, 2, 3);
-}
-
-static uint32_t operand_crs1q(rv_inst inst)
-{
-    return extract32(inst, 7, 3);
-}
-
-static uint32_t operand_crs1rdq(rv_inst inst)
-{
-    return extract32(inst, 7, 3);
-}
-
-static uint32_t operand_crs2q(rv_inst inst)
-{
-    return extract32(inst, 2, 3);
-}
-
-static uint32_t calculate_xreg(uint32_t sreg)
-{
-    return sreg < 2 ? sreg + 8 : sreg + 16;
-}
-
-static uint32_t operand_sreg1(rv_inst inst)
-{
-    return calculate_xreg(extract32(inst, 7, 3));
-}
-
-static uint32_t operand_sreg2(rv_inst inst)
-{
-    return calculate_xreg(extract32(inst, 2, 3));
-}
-
-static uint32_t operand_crd(rv_inst inst)
-{
-    return extract32(inst, 7, 5);
-}
-
-static uint32_t operand_crs1(rv_inst inst)
-{
-    return extract32(inst, 7, 5);
-}
-
-static uint32_t operand_crs1rd(rv_inst inst)
-{
-    return extract32(inst, 7, 5);
-}
-
-static uint32_t operand_crs2(rv_inst inst)
-{
-    return extract32(inst, 2, 5);
-}
-
-static uint32_t operand_cimmsh5(rv_inst inst)
-{
-    return extract32(inst, 2, 5);
-}
-
-static uint32_t operand_csr12(rv_inst inst)
-{
-    return extract32(inst, 20, 12);
-}
-
-static int32_t operand_imm12(rv_inst inst)
-{
-    return sextract32(inst, 20, 12);
-}
-
-static int32_t operand_imm20(rv_inst inst)
-{
-    return sextract32(inst, 12, 20) << 12;
-}
-
-static int32_t operand_jimm20(rv_inst inst)
-{
-    return sextract32(inst, 31, 1) << 20 |
-        extract32(inst, 21, 10) << 1 |
-        extract32(inst, 20, 1) << 11 |
-        extract32(inst, 12, 8) << 12;
-}
-
-static int32_t operand_simm12(rv_inst inst)
-{
-    return sextract32(inst, 25, 7) << 5 |
-        extract32(inst, 7, 5);
-}
-
-static int32_t operand_sbimm12(rv_inst inst)
-{
-    return sextract32(inst, 31, 1) << 12 |
-        extract32(inst, 25, 6) << 5 |
-        extract32(inst, 8, 4) << 1 |
-        extract32(inst, 7, 1) << 11;
-}
-
-static uint32_t operand_cimmshl6(rv_inst inst, rv_isa isa)
-{
-    int imm = extract32(inst, 12, 1) << 5 |
-        extract32(inst, 2, 5);
-    if (isa == rv128) {
-        imm = imm ? imm : 64;
-    }
-    return imm;
-}
-
-static uint32_t operand_cimmshr6(rv_inst inst, rv_isa isa)
-{
-    int imm = extract32(inst, 12, 1) << 5 |
-        extract32(inst, 2, 5);
-    if (isa == rv128) {
-        imm = imm | (imm & 32) << 1;
-        imm = imm ? imm : 64;
-    }
-    return imm;
-}
-
-static int32_t operand_cimmi(rv_inst inst)
-{
-    return sextract32(inst, 12, 1) << 5 |
-        extract32(inst, 2, 5);
-}
-
-static int32_t operand_cimmui(rv_inst inst)
-{
-    return sextract32(inst, 12, 1) << 17 |
-        extract32(inst, 2, 5) << 12;
-}
-
-static uint32_t operand_cimmlwsp(rv_inst inst)
-{
-    return extract32(inst, 12, 1) << 5 |
-        extract32(inst, 4, 3) << 2 |
-        extract32(inst, 2, 2) << 6;
-}
-
-static uint32_t operand_cimmldsp(rv_inst inst)
-{
-    return extract32(inst, 12, 1) << 5 |
-        extract32(inst, 5, 2) << 3 |
-        extract32(inst, 2, 3) << 6;
-}
-
-static uint32_t operand_cimmlqsp(rv_inst inst)
-{
-    return extract32(inst, 12, 1) << 5 |
-        extract32(inst, 6, 1) << 4 |
-        extract32(inst, 2, 4) << 6;
-}
-
-static int32_t operand_cimm16sp(rv_inst inst)
-{
-    return sextract32(inst, 12, 1) << 9 |
-        extract32(inst, 6, 1) << 4 |
-        extract32(inst, 5, 1) << 6 |
-        extract32(inst, 3, 2) << 7 |
-        extract32(inst, 2, 1) << 5;
-}
-
-static int32_t operand_cimmj(rv_inst inst)
-{
-    return sextract32(inst, 12, 1) << 11 |
-        extract32(inst, 11, 1) << 4 |
-        extract32(inst, 9, 2) << 8 |
-        extract32(inst, 8, 1) << 10 |
-        extract32(inst, 7, 1) << 6 |
-        extract32(inst, 6, 1) << 7 |
-        extract32(inst, 3, 3) << 1 |
-        extract32(inst, 2, 1) << 5;
-}
-
-static int32_t operand_cimmb(rv_inst inst)
-{
-    return sextract32(inst, 12, 1) << 8 |
-        extract32(inst, 10, 2) << 3 |
-        extract32(inst, 5, 2) << 6 |
-        extract32(inst, 3, 2) << 1 |
-        extract32(inst, 2, 1) << 5;
-}
-
-static uint32_t operand_cimmswsp(rv_inst inst)
-{
-    return extract32(inst, 9, 4) << 2 |
-        extract32(inst, 7, 2) << 6;
-}
-
-static uint32_t operand_cimmsdsp(rv_inst inst)
-{
-    return extract32(inst, 10, 3) << 3 |
-        extract32(inst, 7, 3) << 6;
-}
-
-static uint32_t operand_cimmsqsp(rv_inst inst)
-{
-    return extract32(inst, 11, 2) << 4 |
-        extract32(inst, 7, 4) << 6;
-}
-
-static uint32_t operand_cimm4spn(rv_inst inst)
-{
-    return extract32(inst, 11, 2) << 4 |
-        extract32(inst, 7, 4) << 6 |
-        extract32(inst, 6, 1) << 2 |
-        extract32(inst, 5, 1) << 3;
-}
-
-static uint32_t operand_cimmw(rv_inst inst)
-{
-    return extract32(inst, 10, 3) << 3 |
-        extract32(inst, 6, 1) << 2 |
-        extract32(inst, 5, 1) << 6;
-}
-
-static uint32_t operand_cimmd(rv_inst inst)
-{
-    return extract32(inst, 10, 3) << 3 |
-        extract32(inst, 5, 2) << 6;
-}
-
-static uint32_t operand_cimmq(rv_inst inst)
-{
-    return extract32(inst, 11, 2) << 4 |
-        extract32(inst, 10, 1) << 8 |
-        extract32(inst, 5, 2) << 6;
-}
-
-static int32_t operand_vimm(rv_inst inst)
-{
-    return sextract32(inst, 15, 5);
-}
-
-static uint32_t operand_vuimm(rv_inst inst)
-{
-    return extract32(inst, 15, 5);
-}
-
-static uint32_t operand_vzimm11(rv_inst inst)
-{
-    return extract32(inst, 20, 11);
-}
-
-static uint32_t operand_vzimm10(rv_inst inst)
-{
-    return extract32(inst, 20, 10);
-}
-
-static uint32_t operand_vzimm6(rv_inst inst)
-{
-    return extract32(inst, 26, 1) << 5 |
-        extract32(inst, 15, 5);
-}
-
-static uint32_t operand_bs(rv_inst inst)
-{
-    return extract32(inst, 30, 2);
-}
-
-static uint32_t operand_rnum(rv_inst inst)
-{
-    return extract32(inst, 20, 4);
-}
-
-static uint32_t operand_vm(rv_inst inst)
-{
-    return extract32(inst, 25, 1);
-}
-
-static uint32_t operand_uimm_c_lb(rv_inst inst)
-{
-    return extract32(inst, 5, 1) << 1 |
-        extract32(inst, 6, 1);
-}
-
-static uint32_t operand_uimm_c_lh(rv_inst inst)
-{
-    return extract32(inst, 5, 1) << 1;
-}
-
-static uint32_t operand_zcmp_spimm(rv_inst inst)
-{
-    return extract32(inst, 2, 2) << 4;
-}
-
-static uint32_t operand_zcmp_rlist(rv_inst inst)
-{
-    return extract32(inst, 4, 4);
-}
-
-static uint32_t operand_imm6(rv_inst inst)
-{
-    return extract32(inst, 20, 6);
-}
-
-static uint32_t operand_imm2(rv_inst inst)
-{
-    return extract32(inst, 25, 2);
-}
-
-static uint32_t operand_immh(rv_inst inst)
-{
-    return extract32(inst, 26, 6);
-}
-
-static uint32_t operand_imml(rv_inst inst)
-{
-    return extract32(inst, 20, 6);
-}
-
-static uint32_t calculate_stack_adj(rv_isa isa, uint32_t rlist, uint32_t spimm)
-{
-    int xlen_bytes_log2 = isa == rv64 ? 3 : 2;
-    int regs = rlist == 15 ? 13 : rlist - 3;
-    uint32_t stack_adj_base = ROUND_UP(regs << xlen_bytes_log2, 16);
-    return stack_adj_base + spimm;
-}
-
-static uint32_t operand_zcmp_stack_adj(rv_inst inst, rv_isa isa)
-{
-    return calculate_stack_adj(isa, operand_zcmp_rlist(inst),
-                               operand_zcmp_spimm(inst));
-}
-
-static uint32_t operand_tbl_index(rv_inst inst)
-{
-    return extract32(inst, 2, 8);
-}
-
-static uint32_t operand_lpl(rv_inst inst)
-{
-    return extract32(inst, 12, 20);
-}
-
 /* decode operands */
 
 static void decode_inst_operands(rv_decode *dec, rv_isa isa)
-- 
2.43.0


