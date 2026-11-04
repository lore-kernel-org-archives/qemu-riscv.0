Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E9C606B2C6
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=anCVVrW5
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgtQ-0003X8-FE; Wed, 04 Nov 2026 14:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtJ-00037o-C7
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:25 -0500
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgtH-0002X0-HW
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:43:25 -0500
Received: by mail-dy1-x132f.google.com with SMTP id
 5a478bee46e88-33fb4680717so1920848eec.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821402; x=1794426202; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6v5WM6O5/YrAgj4cOjJKp58vihmtziMsdsTSNKqL97Y=;
 b=anCVVrW52aXYvG3WpK8JOLmerVaDzAPpHuEZ69tK+qgcaVIfi8qyosxdqlJRKZnHGi
 DEqdJO2hGvh+aF9532cVv/SMwN/IsfUIEdkwBXN8qsWnJVsaNOdTmYfS7GiGIS0ueBiB
 1iZIZRmIZWIdllcFi9Ht2CfwHMJmjSzbV68jzqpPyApXI8o3RkBriCV5kFyPTtwoTuxe
 GrT3kS5e7dwedq+yQ/z+T26FPPQpC71WWWdJ7zwgjKOFbbqQDHH9gf2iKuFY1uMU2H2j
 l/naSsZLwkW01D93QuwuZObjKNU4NE8U6KGqprs0G85CGDclg6pHIePetLa+aOUVBzfx
 fLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821402; x=1794426202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6v5WM6O5/YrAgj4cOjJKp58vihmtziMsdsTSNKqL97Y=;
 b=YkYk+ZsbRuVVAbRRLHV5KaibLBDgQfr6/qPVmt2IQP+I90nUjSsbuXYHjhkPhFIbnw
 /wNQbO7O7IACydwEwacz3bbAVZkC9ycKMP3WtekOZd7WEF0YYsLHtcBkdz6F1w36pkbZ
 y+66+4MJbaGu+QkAa/VgHU+onCk/DRHzO+5UkUqack10Tbtw06u0NFeNhtwuNHpoId2n
 O7pAzeLv5WDw7P34rp21ModIqAajgCqGMF1u9u6nwy2WvJER81JRYHAi9YhE1WD+tMmH
 NsPOmkux4PKhBfpWhU5RkMka20+C3coBrUq9T2pGdc1373GuFvIEq0bczjrDqS6RIoJ4
 vTzw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxaFs0l9/t8b3dvKBbPdoWP0Y1nUb4YP1oxWPg2SL59KAc9f8Jp1e6rsNT9hcYvaUlnxVAO/RSYRELb@nongnu.org
X-Gm-Message-State: APuU4Z+7Vx6IgpxV+vhLjHdLs51IHW+/UD6ApUI+8bX775UbdUQUU/tf
 JES1eMdOrAF9qxDGND9QdL/K1BzVcfVDPSA6dq/+w4XIXe+JUefgIfYke8h62hmPvJKi9o3Trp0
 nHXCLv2A=
X-Gm-Gg: AYBFou10nOtS0nQ2DA7aNZhmDRQDAbuenJsgazJacEqqfI+ZsZvktFsI3OWTXTAIxRZ
 kOxvpxMvWBwVNbAO9gVlG8ya0UIjaeaDfLqVjyNwj4zMYcuU715KDc00mc2AfD0BU1VDr7Bw/uV
 xU83SVxFIK6XB7PKtLAFCPXjkq1y4ZGWp8osl/e3VwrY02Sti1v2bnLFuCKtYaFpMzTs/VKMljn
 x3bKdZ5yaW+7CwaiflCGdg/nRlSWyqNEB3q9ulxkSaSfOO4CKGE4Cj+Rk1OzHvQ0NZSLme0iN0R
 qj/LdMyHzmYOQU+VAYiyp0cIWAOuYUgBqce+GPI7INmsKDiQGoihGRg3/2FQ1c77+4dvTOgb6xP
 wofd02RfDOP+sFAJYKJMlLgVuO+AWcK2kFBZaZX9JfMIiFXwuOGRE5aG48ONYBqbXhziCG59WZr
 P2Z9GlZPA8+KW60+WUOAIWXdCzoPMdkS308w5Lm8uL1JuWzVcACp7mPyUMZFaIgZ62LXbx9pCSU
 Kwo/2jP43P2BWoyDN/Wdjmr4FchGl6uyVvrl0nUdnTm6CrybHq74Tzl+UY5dLCACG0NZ7UdmXTE
 62ZPsBcZ3xq8TJD4kILGpe2OLJeolpOi3uqeB9QPGViEBHEVohaTmaO4405qT2ro5hhNR7qgjZa
 o5wDvM92rx9WA0JTM7GPO67W7wbR/HSIRa6ty5nAQoG+xgngpmA==
X-Received: by 2002:a05:693c:8806:10b0:36c:b8b1:a44f with SMTP id
 5a478bee46e88-36cb8b1a618mr4659071eec.31.1793821401856; 
 Wed, 04 Nov 2026 11:43:21 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:43:21 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 22/38] disas/riscv: Support Zvqwbdota8i extension
Date: Thu,  5 Nov 2026 03:41:37 +0800
Message-ID: <20261104194155.679241-23-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132f;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x132f.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Adds support to disassemble Zvqwbdota8i instructions.
- vqwbdotau.vv
- vqwbdotas.vv

Zvbdota instructions encode the batch-column immediate (ci) in rs2[2:0]
and the vs2 base-register group in rs2[7:3].
Add rv_codec_v_r_ci that splits rs2 into dec->rs2 (base register) and
dec->imm (ci), and add rv_fmt_vd_vs2_vs1_ci_vm to print them separately.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 disas/riscv-op.c.inc | 2 ++
 disas/riscv.c        | 9 +++++++++
 disas/riscv.h        | 2 ++
 3 files changed, 13 insertions(+)

diff --git a/disas/riscv-op.c.inc b/disas/riscv-op.c.inc
index 5ba29f52976..bb01ebb8a6c 100644
--- a/disas/riscv-op.c.inc
+++ b/disas/riscv-op.c.inc
@@ -773,6 +773,8 @@ OP(vnsrl_wx, "vnsrl.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm)
 OP(vor_vi, "vor.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm)
 OP(vor_vv, "vor.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
 OP(vor_vx, "vor.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm)
+OP(vqwbdotas_vv, "vqwbdotas.vv", rv_codec_v_r_ci, rv_fmt_vd_vs2_vs1_ci_vm)
+OP(vqwbdotau_vv, "vqwbdotau.vv", rv_codec_v_r_ci, rv_fmt_vd_vs2_vs1_ci_vm)
 OP(vqwdotas_vv, "vqwdotas.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
 OP(vqwdotau_vv, "vqwdotau.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
 OP(vredand_vs, "vredand.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm)
diff --git a/disas/riscv.c b/disas/riscv.c
index 0f609cc06b4..0534b8f4d64 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2638,6 +2638,8 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 switch ((inst >> 26) & 0b111111) {
                 case 38: return &op_vqwdotau_vv;
                 case 39: return &op_vqwdotas_vv;
+                case 46: return &op_vqwbdotau_vv;
+                case 47: return &op_vqwbdotas_vv;
                 }
             }
             if (((inst >> 12) & 0b111) == 1) {
@@ -2999,6 +3001,13 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa,
         dec->rs2 = operand_rs2(inst);
         dec->vm = operand_vm(inst);
         break;
+    case rv_codec_v_r_ci:
+        dec->rd = operand_rd(inst);
+        dec->rs1 = operand_rs1(inst);
+        dec->rs2 = operand_rs2(inst) & ~0x7;
+        dec->imm = (operand_rs2(inst) & 0x7) << 3;
+        dec->vm = operand_vm(inst);
+        break;
     case rv_codec_v_ldst:
         dec->rd = operand_rd(inst);
         dec->rs1 = operand_rs1(inst);
diff --git a/disas/riscv.h b/disas/riscv.h
index 4f1ffc4ae02..34050583c96 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -138,6 +138,7 @@ typedef enum {
     rv_codec_k_bs,
     rv_codec_k_rnum,
     rv_codec_v_r,
+    rv_codec_v_r_ci,
     rv_codec_v_ldst,
     rv_codec_v_i,
     rv_codec_v_i_u,
@@ -254,6 +255,7 @@ typedef struct {
 #define rv_fmt_vd_vs2_vs1             "O\tD,F,E"
 #define rv_fmt_vd_vs2_vs1_vl          "O\tD,F,El"
 #define rv_fmt_vd_vs2_vs1_vm          "O\tD,F,Em"
+#define rv_fmt_vd_vs2_vs1_ci_vm       "O\tD,F,E,im"
 #define rv_fmt_vd_vs2_rs1_vl          "O\tD,F,1l"
 #define rv_fmt_vd_vs2_fs1_vl          "O\tD,F,4l"
 #define rv_fmt_vd_vs2_rs1_vm          "O\tD,F,1m"
-- 
2.56.0


