Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C58FC5AD4E
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:36:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7g-0000lk-To; Sun, 09 Aug 2026 18:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7f-0000kB-Ew
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:03 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7d-0007Jk-Kw
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:03 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-84847482584so771207b3a.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314960; x=1786919760; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uxmlZCK7DL17d4NutzDtlfNr/qFd5kbUmapKHvQVXXc=;
 b=WWcFLqra8Twumg/KnNZiKz6pECCd9VR1GpPG013uEf3uIvQL6/nBuKe8AxJWimjVpo
 YqeG0tTeKlwiDg3pHg+EuTKPDesTNcRxJyO3ckrjw/F3oY+rTq9h/ouhDIjeLnVIJ80q
 MLel3y/5U3dnVDjmz5QxfXrzq6AxPeXLPBrQkyi5CQhmjXNuQYzl+LYaOMKbGvAQGuh3
 5ec6UMyMumagTOYUu1H23WOrUOVfh4vH3zzKs54vcTl34L5iI13wqerWd82eQrZ58yX5
 sNmglxa+KraxbyQ6mgCuYP9aQ9DPSMoV0gvFA+FnXunxHA+KBxjvPOpoz2qqa8ACgWC7
 xvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314960; x=1786919760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uxmlZCK7DL17d4NutzDtlfNr/qFd5kbUmapKHvQVXXc=;
 b=XXRpev1BsZHSIW6IuIdJXCedRAINOSxmw6XG4gAGatbTTOIGGnKrM3Mm5tACtWhEVQ
 qDsNyToqTmiZznukRGrP8KThYdcaWP7L4qFY/Gis8spawMQ/fAPgLzOaLV/T9uTfOMbF
 85c6RJxt3rjLiLgdfmkwG4o6sNh4/c7tMU4REaMlulf0B4YwTZni32bO1X6o+GDFse0j
 6pPQY8Hg30AjfPpWYxW3FpFm6m6qLXYCHdzaJA6eAUzHruILIhtFaHnUlrbYdipzVQFA
 4Dph+wf+scBAKKXbwNjlqq6UfI+zvFFrjrthKifRpN5BQf0drsavHHBvls6QWL6j4yCl
 XmeA==
X-Gm-Message-State: AOJu0Yy+zXXDDU1XOVsDlKxnhyp2qNGGYeYxm/uGnKGrjqsiVHaIQP6d
 EEEhUAEJRVio7AFeY2lUf7TUlBYGcCq274n6IFUFYJEV3oZhAJ6xYQ5csNq2vMqkql7EsNf70Dx
 gkWDX
X-Gm-Gg: AR+sD10HcjkYXEugLD19ulopW1ZldwV3O2/MYtIykGSJBQGUvIv1Ec6IFECJq/yYXT2
 aFzM0y6BBNebE6FyWz6tETdE02Ai1xH47J+n6QSWVw4shSAcMPFiq3U4G/n8DAk62j9kdXQnlEf
 xL6WwGlz32r32MPDIJayC8Yy22MxHgiy+RjSmGYxdY69v8DhkH1L//o692YlwmrLjI7OzCGl847
 f1+APp5r5ug+t5NxW8ep22Op+Q0mkljGgw5dkYMhUnw0hV3JqF6+0ApujTlZy5reBgVSZXxZKfb
 eWrDNAk8sZnIPx4SSSpXoxpuXa+qQX/0OuZUjwccvVsiUGAfMo9IukXumvW90/IhIh+YsJTrknD
 rnSpuAfQKnP/ZSDf0+iTAmwh/0fxEwUjWD1dzkFEeC9LU2yNj6YTY2xSOqoXmrWNPHPUzzliazH
 Pn0KZ11vTWZkJKIA+SEeFvGqA7anI5SdRzBPVF5namFtofXJBwjU9ofLDO6UT1JdNSn6lGxunji
 v1Fn7Nj++Y8WpFMBjB9
X-Received: by 2002:a05:6a00:4106:b0:837:f111:b70 with SMTP id
 d2e1a72fcca58-84f6b649b12mr15308396b3a.4.1786314959792; 
 Sun, 09 Aug 2026 15:35:59 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:35:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 10/56] disas/riscv: Pass rv_opcode_data pointer to/from
 decode_inst_decompress
Date: Sun,  9 Aug 2026 15:34:59 -0700
Message-ID: <20260809223545.730664-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
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

Unify 4 functions, sharing code.

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


