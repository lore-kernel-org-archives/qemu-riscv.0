Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFEFC531DC
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 19:04:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1shZYE-0004nz-Hh; Fri, 23 Aug 2024 15:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1shZYC-0004fo-EH
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2024 15:02:21 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1shZY9-0004QY-6Y
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2024 15:02:20 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-201f2b7fe0dso22556295ad.1
 for <qemu-riscv@nongnu.org>; Fri, 23 Aug 2024 12:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724439727; x=1725044527;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ak9PVtm0xOUDnaFvLdvWza9j+CseOeqPaayHYoeyFwg=;
 b=e+gfKmD24fpKuieV/yEv+UcayMq3EFZwC3T5D/OIvLIgl7t0egZ1vJHcAh/kP5SGXU
 xSdkKWZ1Hvdfg6IN4SkHOpnEL8o/NY+t0Jc45YPB3UkhS/Kfe/FfDt3M2g6boBqGFaDm
 6MSQOPPTAOn0N5ryUFxsEUfZwHGa60gVfRtZBYrZWiOhthtDmmHvBk4B5cyxgaBhWFUl
 o7pwGvsotL7rGJuaJnrSKPAfUgJ8l/M2tG6F9pkwxpX1+9Xwdcr+4SojaC3lM86+jaIX
 rR0h6pRu5r8NDXGUn+MmKClfTjIeJOPipcTzfOrcpg/Kn4teFJvPyAQeL7F2RftBXoNY
 CGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724439727; x=1725044527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ak9PVtm0xOUDnaFvLdvWza9j+CseOeqPaayHYoeyFwg=;
 b=GG4W0CkRFxWbSoQRm0/aSBNRQmqbrMUKdCro050UQjUqYS2YKGpeLTwNoGcMMukCEs
 OBKOm4U2Qtph59AlwHS+mEJGdNMhdhiLcbu51r5mz610Qc3r5wqpxlPhjFELO7xQtii0
 gi2sX4StDNk5YCUt39GW5U1ZT7D+/mzUNxXRRl8clK+fwJD17E4SVvm+kGRd96Kl53Rf
 HlhtOCpNz2z7KbkQR5bLit+kmcbH9OfwinMT4S+4Ofbt0MfeeEm0/YeaCI6qY9Yghj1S
 GV93ktWHjZLXH1J2T/A40dKmTRiR1HNQTPz3fwimSUWOyGZGCOao9ijSrd+XFu5YJuQj
 o0Zg==
X-Gm-Message-State: AOJu0YxSpysMMaMj8m7G+m/9R1oDCKtHxzHteea83YOLMuGRrjlZFyec
 6e+5DFAPcG19LTFJV+J/V/9+aPqhRkppgf4daIpNCmk3Vx4BkoDjCfoQuZOO2lNMiQOySvh0g4G
 x
X-Google-Smtp-Source: AGHT+IGkjxIEGlwJse67a1A++PvHa+Oan/F7yaWbOiNL57NhO6/w0w2BrcH1Ip/NG7PdPty+GB4F+Q==
X-Received: by 2002:a17:903:2348:b0:200:869c:95e3 with SMTP id
 d9443c01a7336-2039e44c12dmr38242285ad.4.1724439726965; 
 Fri, 23 Aug 2024 12:02:06 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-203b0c37768sm1749885ad.230.2024.08.23.12.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 12:02:06 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 richard.henderson@linaro.org, kito.cheng@sifive.com,
 Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v8 17/17] disas/riscv: enable disassembly for compressed
 sspush/sspopchk
Date: Fri, 23 Aug 2024 12:01:39 -0700
Message-ID: <20240823190140.4156920-18-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240823190140.4156920-1-debug@rivosinc.com>
References: <20240823190140.4156920-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

sspush and sspopchk have equivalent compressed encoding taken from zcmop.
cmop.1 is sspush x1 while cmop.5 is sspopchk x5. Due to unusual encoding
for both rs1 and rs2 from space bitfield, this required a new codec.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 disas/riscv.c | 19 ++++++++++++++++++-
 disas/riscv.h |  1 +
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index f1f4ffc50a..8eeaa9f843 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -980,6 +980,8 @@ typedef enum {
     rv_op_ssrdp = 949,
     rv_op_ssamoswap_w = 950,
     rv_op_ssamoswap_d = 951,
+    rv_op_c_sspush = 952,
+    rv_op_c_sspopchk = 953,
 } rv_op;
 
 /* register names */
@@ -2244,6 +2246,10 @@ const rv_opcode_data rvi_opcode_data[] = {
     { "ssrdp", rv_codec_r, rv_fmt_rd, NULL, 0, 0, 0 },
     { "ssamoswap.w", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
     { "ssamoswap.d", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
+    { "c.sspush", rv_codec_cmop_ss, rv_fmt_rs2, NULL, rv_op_sspush,
+      rv_op_sspush, 0 },
+    { "c.sspopchk", rv_codec_cmop_ss, rv_fmt_rs1, NULL, rv_op_sspopchk,
+      rv_op_sspopchk, 0 },
 };
 
 /* CSR names */
@@ -2604,7 +2610,13 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             if (dec->cfg->ext_zcmop) {
                 if ((((inst >> 2) & 0b111111) == 0b100000) &&
                     (((inst >> 11) & 0b11) == 0b0)) {
-                    op = rv_c_mop_1 + ((inst >> 8) & 0b111);
+                    unsigned int cmop_code = 0;
+                    cmop_code = ((inst >> 8) & 0b111);
+                    op = rv_c_mop_1 + cmop_code;
+                    if (dec->cfg->ext_zicfiss) {
+                        op = (cmop_code == 0) ? rv_op_c_sspush : op;
+                        op = (cmop_code == 2) ? rv_op_c_sspopchk : op;
+                    }
                     break;
                 }
             }
@@ -4923,6 +4935,11 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
     case rv_codec_lp:
         dec->imm = operand_lpl(inst);
         break;
+    case rv_codec_cmop_ss:
+        dec->rd = rv_ireg_zero;
+        dec->rs1 = dec->rs2 = operand_crs1(inst);
+        dec->imm = 0;
+        break;
     };
 }
 
diff --git a/disas/riscv.h b/disas/riscv.h
index 4895c5a301..6a3b371cd3 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -167,6 +167,7 @@ typedef enum {
     rv_codec_r2_imm2_imm5,
     rv_codec_fli,
     rv_codec_lp,
+    rv_codec_cmop_ss,
 } rv_codec;
 
 /* structures */
-- 
2.44.0


