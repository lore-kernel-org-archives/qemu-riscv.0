Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCE0C5CFDB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:33:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUI-00079f-0e; Wed, 12 Aug 2026 18:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUG-00078m-Ob
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:31:52 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUF-0000uW-6p
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:31:52 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-c9cf07d2df6so1030537a12.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573910; x=1787178710; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qrXx1hCGdJZdsQrwHDhXmNRmEcuSInujvJFUdIgfRuM=;
 b=DquN5eR8pKhKajcKbWGn/MlvwPACSmqh2F0ydFOuEBDmuUEg4tdQ+8xwdUg7WdmAAx
 8uyr9XgLQ8Hu8i9GayYOKGEXM4x78Ba8D26sj0ApJExRwAumywXSk3yl5LNAJFh/bvsR
 DqjCTkwcojAH/hhX9atP7lxcab52SOti2IMDzU11Oe/3ZCkblj8luhB/rP9sPeJ0wmhY
 PQO/qDnCJzoOmBBSbfM+PTVmlD2foD6seMg8mBinYqXxiDk6Wdx2zm+Guo1DW20GhhFN
 Oj6F1c+i8QCAesFX2myiSlySHEtdbEEaQeu0ean30laTWNb4pmAEfxVSr9X4JEyHQ7s6
 4vhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573910; x=1787178710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qrXx1hCGdJZdsQrwHDhXmNRmEcuSInujvJFUdIgfRuM=;
 b=iwkn9/J6bXLr6oYDmMXRics7jedJ1j0oKL1sMj8y4WpAqm6CQ66wFSOW1vuJbbhc6E
 gbq/0exUG+WLVI2jStVLtHXsuhcNP30CjMO6sz6YVj87Lg6cDBCeETFfa2300moIp6ce
 KBvrQ6GFdPXwuOboyXxcNEhEBIltuaJeEVJ2YUoz4tsmQisB3YIBrn59dMSdFp7wigOM
 4avTyUvHj6v0PmPq34N1801ZjR84EGU8p6Ovv0t24KsES0A0qfnR1qMQ5CRHdIxojip6
 iEwOaYNCTbOtCoZyp/JlMtLHFs4mIa7eYqghr1P9ZJ7LVhFBPbeuzdPhQGeTtZQOLIId
 ZaKw==
X-Gm-Message-State: AOJu0YzYqnqJYuGhDtPGm5SZQ/Q6GYvbKw779i+QhzLr6C2heytWawzx
 cqPPDFRZt9YIsolbdgbXYd7CtFSd3buagLx02DkNKdCUIT202YmEjVAmnNgMJUFKYYI=
X-Gm-Gg: AR+sD102K7STrMMIzOVA2qovt/mOL4acAnIYFi4krDpgHOkxTLKeloeNdaxYzD4bHKF
 /oCcUymet/87+M/jxhsh7gMaBJn5pqoO8Nvqln8GkGJAU8WGaot6LnbMLfY7v22vH1/zhp3AQw8
 iy9SCxWd/fiUzaRMtibeDGIZkW0jY71ElxC1DuDLqc1iBnn8FbUdj7EhctSit/oPN9xyp8/vAaO
 aGrQF5DM9tElFu9jOFnsxlh4G51WiZqEsXlORdcpNnyXUzWJvqLb+xEtXcemA/Gd4y3mcZbWAKZ
 bgyA/0oQ6XDa30IRITeSFfr7sup4LuG4nGEK7v4NFyJZ7UNMi3t8jUfa+40MkaoVWEGOWEtT7cm
 8h04RtOmKQi0sk7kkyvRpBqkfSejKWCa6M441PTLyCYRiVEFjKjkHi2fJn9XbdtwpCkp8KJ1RbU
 0cD+Mlr2oUJVWcQTdTHYkHgqHpW3CrkZLa7cfyQ68ousX9FAk9lKgQj9PUst2kmY6ah/sijbbu+
 43NFATg8Ch5ODQYBGpE
X-Received: by 2002:a05:6a21:4c85:b0:3c3:9c4e:de3a with SMTP id
 adf61e73a8af0-3cc54f42b93mr2263988637.6.1786573909743; 
 Wed, 12 Aug 2026 15:31:49 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:31:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 05/52] disas/riscv: Pass rv_opcode_data pointer to/from
 decode_inst_decompress
Date: Wed, 12 Aug 2026 15:30:55 -0700
Message-ID: <20260812223142.349142-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Unify 4 functions, sharing code.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 70 ++++++++++++++++-----------------------------------
 1 file changed, 21 insertions(+), 49 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index af43940732..47fae7316c 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -5377,64 +5377,36 @@ static void decode_inst_lift_pseudo(rv_decode *dec)
 
 /* decompress instruction */
 
-static void decode_inst_decompress_rv32(rv_decode *dec)
+static const rv_opcode_data *decode_inst_decompress(rv_decode *dec, rv_isa isa,
+                                                    const rv_opcode_data *op)
 {
-    const rv_opcode_data *opcode_data = dec->opcode_data;
-    int decomp_op = opcode_data[dec->op].decomp_rv32;
-    if (decomp_op != rv_op_illegal) {
-        if ((opcode_data[dec->op].decomp_data & rvcd_imm_nz)
-            && dec->imm == 0) {
-            dec->op = rv_op_illegal;
-        } else {
-            dec->op = decomp_op;
-            dec->codec = opcode_data[decomp_op].codec;
-        }
-    }
-}
+    int decomp_op;
 
-static void decode_inst_decompress_rv64(rv_decode *dec)
-{
-    const rv_opcode_data *opcode_data = dec->opcode_data;
-    int decomp_op = opcode_data[dec->op].decomp_rv64;
-    if (decomp_op != rv_op_illegal) {
-        if ((opcode_data[dec->op].decomp_data & rvcd_imm_nz)
-            && dec->imm == 0) {
-            dec->op = rv_op_illegal;
-        } else {
-            dec->op = decomp_op;
-            dec->codec = opcode_data[decomp_op].codec;
-        }
-    }
-}
-
-static void decode_inst_decompress_rv128(rv_decode *dec)
-{
-    const rv_opcode_data *opcode_data = dec->opcode_data;
-    int decomp_op = opcode_data[dec->op].decomp_rv128;
-    if (decomp_op != rv_op_illegal) {
-        if ((opcode_data[dec->op].decomp_data & rvcd_imm_nz)
-            && dec->imm == 0) {
-            dec->op = rv_op_illegal;
-        } else {
-            dec->op = decomp_op;
-            dec->codec = opcode_data[decomp_op].codec;
-        }
-    }
-}
-
-static void decode_inst_decompress(rv_decode *dec, rv_isa isa)
-{
     switch (isa) {
     case rv32:
-        decode_inst_decompress_rv32(dec);
+        decomp_op = op->decomp_rv32;
         break;
     case rv64:
-        decode_inst_decompress_rv64(dec);
+        decomp_op = op->decomp_rv64;
         break;
     case rv128:
-        decode_inst_decompress_rv128(dec);
+        decomp_op = op->decomp_rv128;
         break;
+    default:
+        g_assert_not_reached();
     }
+
+    if (decomp_op != rv_op_illegal) {
+        if ((op->decomp_data & rvcd_imm_nz) && dec->imm == 0) {
+            dec->opcode_data = rvi_opcode_data;
+            dec->op = rv_op_illegal;
+        } else {
+            dec->op = decomp_op;
+        }
+        op = &dec->opcode_data[decomp_op];
+        dec->codec = op->codec;
+    }
+    return op;
 }
 
 /* disassemble instruction */
@@ -5491,7 +5463,7 @@ static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
 
     op = &dec.opcode_data[dec.op];
     decode_inst_operands(&dec, isa, op);
-    decode_inst_decompress(&dec, isa);
+    op = decode_inst_decompress(&dec, isa, op);
     decode_inst_lift_pseudo(&dec);
     return format_inst(24, &dec);
 }
-- 
2.43.0


