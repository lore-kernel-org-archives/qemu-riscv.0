Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B763C5321D
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 19:04:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1shZYE-0004n3-9b; Fri, 23 Aug 2024 15:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1shZXo-0003D4-Hq
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2024 15:01:57 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1shZXm-0004K9-MS
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2024 15:01:56 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-20208830de8so18978365ad.1
 for <qemu-riscv@nongnu.org>; Fri, 23 Aug 2024 12:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724439713; x=1725044513;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bOp3QknnppYKc6NqQXS9ioOC0GJa+R1wT3E/uYEWjyw=;
 b=0+QXx3tVSvcouIxR4kC73eQocC00KTq3z02JlOGaWE6McqP1VdxSwxvHBVQpHiBrcU
 ybk3SJcDoSCOkw4Q2MZLDR6dGBRixnEIeAxWIuGryQ5eg5PCrKzr6vV42bziBQnaE96d
 z1Xh2nj1FHfB/JJwHiAq5MK9aWXZEoaquPwRB9BbfLdW7BCBq46dGoPNDqz8tYypVJrp
 9wARHZ1f0iIOJctFcZ0jPIOEHVHEHf+WFPgrGyRpNH+LFauPziUbK/BIg5+OB9l4GVt5
 o3PImftWIUnk7DoDO7Ga0NuKDS6rAc/jpWpHvPXoLCysFYfnnwF7zvM3yvUic5UYeHh2
 r8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724439713; x=1725044513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bOp3QknnppYKc6NqQXS9ioOC0GJa+R1wT3E/uYEWjyw=;
 b=v5UTV8qV6hC+lRWvZzrkjmwGB4pGCk/To3QMgg9WyZ6aXX0rvJuGGtNyt5jLj8D5vT
 M7g9wHbIx9lkS9GBBCY7SZTVrDP6E7e/CnFsRt61LXimkj09UyTtNxnELoQbmRo6uQj+
 V8SIoAlPj490I0OVj/jHCOGsueO3HsmfsOLxdGJtC8oHl/OB9O7OnXQW7J4I4I7b/vd0
 i0MnzL3SiIs4+mb30bfn9I14HsRvCdeiR4EWyLhcQpgdDOKj0BalljBjBb4RU82/1LWv
 /CyOAgMBcZ1XPwQjiX8TaqJdf9ERnFAuNa2iEmNxXAsI+AtvqeIS06VZpEjNh59weAwm
 dTng==
X-Gm-Message-State: AOJu0YxhZHrmQTJlH18qfrimihTBWhkm4HfGTe8is/e6s6aPXfiQsBUy
 LPNdoiWOBaVcsiXaPGMHqorrjECr3x4ZDk1GbYgs8fFrAAvO0FncxSmMeoid4p4xQ1xXfzPLA6B
 c
X-Google-Smtp-Source: AGHT+IHtJ0k/HtwniBvt0Ol9pAMC2ZLeFz84Pp49YSJH28NvloEmdSDKqs23c3dRg5BbTtXU7M4OPw==
X-Received: by 2002:a17:902:f68e:b0:1fb:59e6:b0e5 with SMTP id
 d9443c01a7336-2039e478cdfmr41154935ad.19.1724439713038; 
 Fri, 23 Aug 2024 12:01:53 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-203b0c37768sm1749885ad.230.2024.08.23.12.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 12:01:52 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 richard.henderson@linaro.org, kito.cheng@sifive.com,
 Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v8 07/17] disas/riscv: enable `lpad` disassembly
Date: Fri, 23 Aug 2024 12:01:29 -0700
Message-ID: <20240823190140.4156920-8-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240823190140.4156920-1-debug@rivosinc.com>
References: <20240823190140.4156920-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=debug@rivosinc.com; helo=mail-pl1-x62d.google.com
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

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Co-developed-by: Jim Shu <jim.shu@sifive.com>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 18 +++++++++++++++++-
 disas/riscv.h |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index c8364c2b07..c7c92acef7 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -974,6 +974,7 @@ typedef enum {
     rv_op_amomaxu_h = 943,
     rv_op_amocas_b  = 944,
     rv_op_amocas_h  = 945,
+    rv_op_lpad = 946,
 } rv_op;
 
 /* register names */
@@ -2232,6 +2233,7 @@ const rv_opcode_data rvi_opcode_data[] = {
     { "amomaxu.h", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
     { "amocas.b", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
     { "amocas.h", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
+    { "lpad", rv_codec_lp, rv_fmt_imm, NULL, 0, 0, 0 },
 };
 
 /* CSR names */
@@ -2925,7 +2927,13 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
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
@@ -4482,6 +4490,11 @@ static uint32_t operand_tbl_index(rv_inst inst)
     return ((inst << 54) >> 56);
 }
 
+static uint32_t operand_lpl(rv_inst inst)
+{
+    return inst >> 12;
+}
+
 /* decode operands */
 
 static void decode_inst_operands(rv_decode *dec, rv_isa isa)
@@ -4869,6 +4882,9 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa)
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
2.44.0


