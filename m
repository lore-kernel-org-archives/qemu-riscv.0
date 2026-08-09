Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E92DC5AD7B
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:41:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7g-0000lE-HU; Sun, 09 Aug 2026 18:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7c-0000iN-KJ
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:00 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7Y-0007I5-NQ
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:00 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-c9e607d81fcso633646a12.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314955; x=1786919755; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fqB53fbpMvge/cZDT+9ONBIiuMNcRcnYnzh9EhoJ+Ks=;
 b=Ge3RhvRZZlhvcfiiqrY//7GO+Pu0YpyXL08MSffzI/XPrADEGCV5VGTkUlgeXF7VDb
 6OFJWgzDbn5u14p04fKHV/wzYCJbxv1X86mDoABkis+Kpbgsru3HOI1ZnrqobTleZVKL
 5ej0B8gO2rigq6OfDGqD9FriqJLevPw6dR+gwhoXvSBAqi3ljgWhA3t27HlahzG7D57p
 uQIrk1SbUmyFEY/tqRg9ptRucuztgQv9Pz+sg6TG6hyqTQZ7qsVQH/IRdLtcONHTw91u
 SpJD2OfhVr1XSOsIH0Koky5eKv80hv2WoGVNZ2+j5J1Mhovsk73cB/U1FLm0wXNM+y75
 gMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314955; x=1786919755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fqB53fbpMvge/cZDT+9ONBIiuMNcRcnYnzh9EhoJ+Ks=;
 b=nMNn16P9AIFSe6Y70Jx5/GHFi16EyINrjE/PU92D+fDudgq74esCX1hQnW/KKNHQeF
 WDE4zGyKTISoOgc/UZAbHoICIR4TBxT/LB35Tqnfbi1yvwXDcePv5FvEN5bgm02OV4rA
 RSd8DdA9pi8Zp2MHpUHl65Mk4JWZzRW6RCxzOZQ9hRDnRrRW7smmFV5zwJVA/WwnA54F
 Ogg0BHDuvFCjr0uyHpeuMoOysqFmzeUk6AsTOkCgSJxoAG06eZnc8ACM8soK3xrzdNMk
 z3+Qm+J0ghzaEFNL/kzIA8AouEXIRsPpeqkZBu7T1thmQo+an/BqLm8eOHeryFOn2aJb
 raig==
X-Gm-Message-State: AOJu0Yytr3EkUbKP608OR7bbo/Qaq9yHx5kPiOAkdJHB6J4JCIr9U9Qy
 WhcJcEWXyJBLw8apWQmbFMPbdONs5IyfrjB4tv0l1etNCrLgXhBoLPyCMWHL04F1k0EnCdLToZ/
 7MHpg
X-Gm-Gg: AR+sD11MX/Xmp/Et4dEDtdBDq4tUdeOHpw1ZQHUInLe8aV3yt6agRC47DSzZH4p2Lbq
 PqFtKfoRYCpQCuaVxnZ/LALJ0vYW2QRkAfkH5CjH0xuYM1SOZWpMWHaF/vt/QoV3K+gsAHzrfta
 ON2bdNWHov7xWn8dS1gI675c8nl5QW0bCMMFBlWmM1T/SBJhalc2yiOszdmGMvkFi450GcclmMV
 jmQ0jszqqxm6LOGdVIsYVBy9yqeULofiyy9GbdaPwwps8Rr6PDPxV4lsIzFjYUYRX4/VShLIxYg
 64v58LUgIVlFB2gHyaApGVn3f1K+uq+bItxgZKKMcO3KzhFwl2dNcLQnxGVyRUscklaUCznIjy2
 vW7GOHIsMUHeJWtfm9Ued/uA1I7PZGpIl396E6aIX7Iy2W4scG09BLUBDxbBNEKpdET0x6hfZFH
 s+j8MsUoQn+Fbhj9SZG6N54q78AF6qhnECF0g/g8j8G+HkUpS9vsMQz5rFoxQa+bmB0kTkYOH/C
 thbc8DyA27TlFic9neH
X-Received: by 2002:a05:6a21:9f17:b0:3bf:7994:ddca with SMTP id
 adf61e73a8af0-3cbadcb1d0fmr29497751637.29.1786314955163; 
 Sun, 09 Aug 2026 15:35:55 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:35:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 06/56] disas/riscv: Move operand extractors earlier in file
Date: Sun,  9 Aug 2026 15:34:55 -0700
Message-ID: <20260809223545.730664-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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


