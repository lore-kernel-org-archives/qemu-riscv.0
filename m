Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4C2EEE271
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:55:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sotd6-0004uH-Nj; Thu, 12 Sep 2024 19:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sotd4-0004kl-DF
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 19:53:38 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sotd2-00089d-SA
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 19:53:38 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-718d6ad6050so341078b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2024 16:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726185215; x=1726790015;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NpvZYJph47UbMl7k6pfcf7IX44LlneT6ofd0Ip0BFwA=;
 b=Y5nzrjje6XFqK+xgCDRBR4MqJgm6+iTu47XBDPd0KGvwblh6He7dXMOzJOgHwYF4K7
 hRR7Sabm8VASJNrBxz2IpWruy5yFRpxdc7ONgCOZr7d0CdQnW2FB6xxd5Qj9rQe1/2ny
 xMFtke9kAFx8scgUMUDUXbwbIs3rlUiRpfMXJig/8zgBFmj4aFQVq8YW6W+6emEqJIMm
 EsnIqVVKaH2OPVIj/IQSRLMCnwNX9ym6hA8vvuLwTK5egba+tBSyklW7YS3OBvbX5rUf
 yiKT++d3fk2btkHcpMIxLQ4C1lGTFtezZLY/3Sez84ZaKOVA6Pp81hmLS81sHOQg2RVY
 p70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726185215; x=1726790015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NpvZYJph47UbMl7k6pfcf7IX44LlneT6ofd0Ip0BFwA=;
 b=p8erWZUPJlR7eWGI9Aon0ApXROapiHtZjsTIdrz8MtetgdoZgzF8RKvQ78OwQh9lnK
 NZx7J5AVJIVmUrqFd7+0tqYMssc3deg3Aculy58sU0af7B/hEOcGjqTX7H4r6rPdI2nE
 qxYzMMoP97gbieQKckjSTyRgb2RuLz2Dbwcd7ayZR1QTs5zGyImg9P58OziN+9umNtAA
 L7Ws/62OnIpymjd6FXB1/p6iDM5rx/cr492rhNnn0yNs3zWg/PBed4pXw/iWrfkwu7vJ
 a1lj3klgb6/3/uaxge0iIBUfBw5lU/yVY8I0AL+fYqqZcEtu1Sba5zj+P38IG//C0eOZ
 KVbQ==
X-Gm-Message-State: AOJu0Yxi+AGDu7ne/fNoX1J6+O41F5PYhQ7w/Ev0fT1f57jHxr9guLpX
 n31B+1nZKJa5ZrBIBesWK+snv4mscYRBkYIV6zXSCfCE9unjUMydnIZ085c5CONR/Qmd83UsFI7
 P
X-Google-Smtp-Source: AGHT+IHbskV/JqaouCz0QIKkOkmvBDdiySasVVS7ojHUSqW66Z5JA2JyUNgM6AM/4WPLeZENHjkVHg==
X-Received: by 2002:a05:6a00:2d89:b0:706:74be:686e with SMTP id
 d2e1a72fcca58-71936b1b38amr1305478b3a.26.1726185215270; 
 Thu, 12 Sep 2024 16:53:35 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71908fe22e6sm5102229b3a.66.2024.09.12.16.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 16:53:34 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com, Deepak Gupta <debug@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v14 08/20] disas/riscv: enable `lpad` disassembly
Date: Thu, 12 Sep 2024 16:53:08 -0700
Message-ID: <20240912235320.3768582-9-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912235320.3768582-1-debug@rivosinc.com>
References: <20240912235320.3768582-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=debug@rivosinc.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Co-developed-by: Jim Shu <jim.shu@sifive.com>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 disas/riscv.c | 18 +++++++++++++++++-
 disas/riscv.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 5965574d87..2942a5800f 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -976,6 +976,7 @@ typedef enum {
     rv_op_amocas_h  = 945,
     rv_op_wrs_sto = 946,
     rv_op_wrs_nto = 947,
+    rv_op_lpad = 948,
 } rv_op;
 
 /* register names */
@@ -2236,6 +2237,7 @@ const rv_opcode_data rvi_opcode_data[] = {
     { "amocas.h", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
     { "wrs.sto", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
     { "wrs.nto", rv_codec_none, rv_fmt_none, NULL, 0, 0, 0 },
+    { "lpad", rv_codec_lp, rv_fmt_imm, NULL, 0, 0, 0 },
 };
 
 /* CSR names */
@@ -2929,7 +2931,13 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 7: op = rv_op_andi; break;
             }
             break;
-        case 5: op = rv_op_auipc; break;
+        case 5:
+            op = rv_op_auipc;
+            if (dec->cfg->ext_zicfilp &&
+                (((inst >> 7) & 0b11111) == 0b00000)) {
+                op = rv_op_lpad;
+            }
+            break;
         case 6:
             switch ((inst >> 12) & 0b111) {
             case 0: op = rv_op_addiw; break;
@@ -4488,6 +4496,11 @@ static uint32_t operand_tbl_index(rv_inst inst)
     return ((inst << 54) >> 56);
 }
 
+static uint32_t operand_lpl(rv_inst inst)
+{
+    return inst >> 12;
+}
+
 /* decode operands */
 
 static void decode_inst_operands(rv_decode *dec, rv_isa isa)
@@ -4875,6 +4888,9 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
         dec->imm = sextract32(operand_rs2(inst), 0, 5);
         dec->imm1 = operand_imm2(inst);
         break;
+    case rv_codec_lp:
+        dec->imm = operand_lpl(inst);
+        break;
     };
 }
 
diff --git a/disas/riscv.h b/disas/riscv.h
index 16a08e4895..1182457aff 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -166,6 +166,7 @@ typedef enum {
     rv_codec_r2_immhl,
     rv_codec_r2_imm2_imm5,
     rv_codec_fli,
+    rv_codec_lp,
 } rv_codec;
 
 /* structures */
@@ -228,6 +229,7 @@ enum {
 #define rv_fmt_rs1_rs2                "O\t1,2"
 #define rv_fmt_rd_imm                 "O\t0,i"
 #define rv_fmt_rd_uimm                "O\t0,Ui"
+#define rv_fmt_imm                    "O\ti"
 #define rv_fmt_rd_offset              "O\t0,o"
 #define rv_fmt_rd_uoffset             "O\t0,Uo"
 #define rv_fmt_rd_rs1_rs2             "O\t0,1,2"
-- 
2.45.0


