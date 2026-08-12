Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6521DC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:38:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHXr-0001FS-Sy; Wed, 12 Aug 2026 18:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHXp-0001Da-HP
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:35:33 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHXk-0001rX-G5
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:35:33 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-3900e39d935so161394a91.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786574127; x=1787178927; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g4sAx4xWlbpz+Mg16SIgOdXMJml0cnc7XZM+DuBfZGU=;
 b=l5rGSvQRmlRKdTG6FZNIN8wWQEglWBbnguoPjNleT11U0gyx/hFuG4uWbRmMlzPhhX
 zJvhNR4B2dpN5QtCxcmTd6QJoNPkT8SMUM4lkkbI4ScY0vFGTiJY4aLZP7HoYzEdp86/
 IgADlJmwqdxRoVMMsq+4KiAHJso3UX1pvJFp7KM4ONdE7VeVET6UYKsCoc1hBgT9yaZ3
 qzFaI6TODeQ9KOaxQ892S4mvhEXaxYTvoSF4+XrhqcEG968g2qz2fUh7WHYxycg6+zEv
 LMu/CP0BaByXDShdJUrAkbDG1lCaxQszzQ4wiJwiGwaX6Rbi7yeslNdCTWjnJqmHAccz
 QaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786574127; x=1787178927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=g4sAx4xWlbpz+Mg16SIgOdXMJml0cnc7XZM+DuBfZGU=;
 b=X6GHw8It3pofRBkeFaOO6dl8aU1Xo/dS9UQql3xNuBoMJcX/mvtmJo+ekb0b+llQnI
 gnobJVUeubOIq1GXLtKmvqv8OXc4R9TBWMS3xw1++A38/yMMOcaAdQPIDXkXTCpamBiB
 Rb5cKaCv4qIivfGt4mNl/DXGE6XQu+hsJk4nRC84p6pDsSp+prlrHRQV/on41n+F04Eq
 V1EMXkNyZFuLn5NJjXsoHXiUHDePIlPuerflxAeqkORCReS2U6jyDSA3X8ZL3rDwHAqI
 /DV7u/NVlz+Ik4e5ktH/gWXec03owg+Bf6JA8p0nVdLdDZH9WelmjMCLAVN9az7fH+iB
 qVgA==
X-Gm-Message-State: AOJu0Yx4+Tl0zs71e0G4qseTIZXwTqM4X7Idy7IizP9tS7ENvfP8VYS/
 dpPFzHLsKU53d6lrG62Z1fKc8H10BlQPKRGoXcOxNGpwlsjvNyzgKazUHTsITRMPH+E=
X-Gm-Gg: AR+sD109KzhV7NFjNcIWnYbh8Raidho/FZ5Tea3JY40U4i3efhuXskkczQ+wVGpMUsx
 hFQXihMLvXmf5KSxCpFe0AGajAXOmErX5v3RRYCLTEfKwp+z9YEeb5szYNJoVOdfOzPdcXAYlVG
 2IBvgVej+6IVbpdY1lpvXQMBYW0AXUIV71J3sb3UqXENHQB/T8vvPwfuPlpbtS65YuAG0T+fiSt
 dFPAFqk2zbrt4AK0yxOchCM/nms11Poo3fCH49WmrwqfKyiDwkakZndiR/rIGrj4jBz319fZ8Gk
 2phnWHSA6h/4T8aB+QDewgwtSM02136Vlmq4z/I48z7BQBw5Xn8Jr8zfHNJg8Fim+AnaDa0zoPL
 w/HESMahaS6NKsGihukL28/5dVqaOIHfpbQNaKB9iKY76jFJ6GIWuEfqNu55Wy3di/hGlzwiu1i
 as6qA1ZC9SHEBrvPQWWIZJ4sRCzNIX8+34pupgmnqfmWaw0ysCQjAypmnPX3IshoNyI1f6pR2y6
 rpYMpIcVk7hBb1ubuEKFdIMNqYoOw==
X-Received: by 2002:a17:90b:4c0a:b0:38e:fea2:df53 with SMTP id
 98e67ed59e1d1-3931e0241c2mr1616332a91.4.1786574126212; 
 Wed, 12 Aug 2026 15:35:26 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3931f41cd2fsm464854a91.12.2026.08.12.15.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:35:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 46/52] disas/riscv: Merge all mop.r.n to one pattern
Date: Wed, 12 Aug 2026 15:31:36 -0700
Message-ID: <20260812223142.349142-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Avoid performing arithmetic on rv_op_mop_r_0.
Treat the 'n' as an immediate.
Create a codec and format to match.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.h        |  2 ++
 disas/riscv.c        | 15 ++++++++++++++-
 disas/riscv-op.c.inc | 33 +--------------------------------
 3 files changed, 17 insertions(+), 33 deletions(-)

diff --git a/disas/riscv.h b/disas/riscv.h
index 5ac8c41616..b47a7f0150 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -160,6 +160,7 @@ typedef enum {
     rv_codec_fli,
     rv_codec_lp,
     rv_codec_cmop_ss,
+    rv_codec_mop_r,
 } rv_codec;
 
 /* structures */
@@ -284,5 +285,6 @@ typedef struct {
 #define rv_fmt_rd_rs1_immh_imml_addr  "O\t0,(1),i,j"
 #define rv_fmt_rd2_imm                "O\t0,2,(1),i"
 #define rv_fmt_fli                    "O\t3,h"
+#define rv_fmt_mop_r                  "O.i\t0,1"
 
 #endif /* DISAS_RISCV_H */
diff --git a/disas/riscv.c b/disas/riscv.c
index 8aaad96bf4..0751f1a841 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -643,6 +643,13 @@ static uint32_t operand_lpl(rv_inst inst)
     return extract32(inst, 12, 20);
 }
 
+static uint32_t operand_mop_r_imm(rv_inst inst)
+{
+    return (extract32(inst, 30, 1) << 4) |
+           (extract32(inst, 26, 2) << 2) |
+           extract32(inst, 20, 2);
+}
+
 /* instruction metadata */
 
 static const rv_opcode_data rvi_opcode_data[] = {
@@ -2546,7 +2553,7 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
                                                        2, 2,
                                                        extract32(inst, 26, 2)),
                                              4, 1, extract32(inst, 30, 1));
-                        op = rv_op_mop_r_0 + imm_mop5;
+                        op = rv_op_mop_r;
                         /* if zicfiss enabled and mop5 is shadow stack */
                         if (dec->cfg->ext_zicfiss &&
                             ((imm_mop5 & 0b11100) == 0b11100)) {
@@ -3049,6 +3056,11 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa,
         dec->rs1 = dec->rs2 = operand_crs1(inst);
         dec->imm = 0;
         break;
+    case rv_codec_mop_r:
+        dec->rd = operand_rd(inst);
+        dec->rs1 = operand_rs1(inst);
+        dec->imm = operand_mop_r_imm(inst);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -3134,6 +3146,7 @@ static GString *format_inst(size_t tab, rv_decode *dec,
             g_string_append(buf, op->name);
             break;
         case '(':
+        case '.':
         case ',':
         case ')':
         case '-':
diff --git a/disas/riscv-op.c.inc b/disas/riscv-op.c.inc
index 3fe934688e..222d249a70 100644
--- a/disas/riscv-op.c.inc
+++ b/disas/riscv-op.c.inc
@@ -873,38 +873,7 @@ OP(vwsll_vi, "vwsll.vi", rv_codec_v_i_u, rv_fmt_vd_vs2_uimm_vm)
 OP(amocas_w, "amocas.w", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1)
 OP(amocas_d, "amocas.d", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1)
 OP(amocas_q, "amocas.q", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1)
-OP(mop_r_0, "mop.r.0", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_1, "mop.r.1", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_2, "mop.r.2", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_3, "mop.r.3", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_4, "mop.r.4", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_5, "mop.r.5", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_6, "mop.r.6", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_7, "mop.r.7", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_8, "mop.r.8", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_9, "mop.r.9", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_10, "mop.r.10", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_11, "mop.r.11", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_12, "mop.r.12", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_13, "mop.r.13", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_14, "mop.r.14", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_15, "mop.r.15", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_16, "mop.r.16", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_17, "mop.r.17", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_18, "mop.r.18", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_19, "mop.r.19", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_20, "mop.r.20", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_21, "mop.r.21", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_22, "mop.r.22", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_23, "mop.r.23", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_24, "mop.r.24", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_25, "mop.r.25", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_26, "mop.r.26", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_27, "mop.r.27", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_28, "mop.r.28", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_29, "mop.r.29", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_30, "mop.r.30", rv_codec_r, rv_fmt_rd_rs1)
-OP(mop_r_31, "mop.r.31", rv_codec_r, rv_fmt_rd_rs1)
+OP(mop_r, "mop.r", rv_codec_mop_r, rv_fmt_mop_r)
 OP(mop_rr_0, "mop.rr.0", rv_codec_r, rv_fmt_rd_rs1_rs2)
 OP(mop_rr_1, "mop.rr.1", rv_codec_r, rv_fmt_rd_rs1_rs2)
 OP(mop_rr_2, "mop.rr.2", rv_codec_r, rv_fmt_rd_rs1_rs2)
-- 
2.43.0


