Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046D8C5CFEB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:38:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHXl-00019m-Ud; Wed, 12 Aug 2026 18:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHXj-00013T-Dn
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:35:27 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHXg-0001pM-Jf
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:35:27 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso2510844a91.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786574123; x=1787178923; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2pFXc97irB+xqhuEeXsJuqz1K7COxcjkvhRgUnmVu88=;
 b=SsIn1xEew6olATWkW+9pZCJyM8WWwkEKOJcKtkfDanZngasrnUyL4y86UN8S5gGTU2
 3aFX+6kFFwm8HkOUJgIS2ifCaZ6dB6+eFdSj/yI3T/Kyyxiry3KMu/K/BIN+DVc7nby7
 OmakEsotFAQI9pON12G/a7RjulToN06QWlDOlHQahaq1WgTUjTneZRRztTpnaR7tk1R2
 0SMyL/R4m1WvafaPkE3x+AYhfQ6A11VLky+AeNLzkMN1IKCDOLDC2B4uat02YHuWF+oN
 Kns2CVARWVI1R1EuHH7fWvmgIZnTic7bL2wEt/Qcv9zkQy1gYRr3xNzuN0QRhkf0vQpy
 FcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786574123; x=1787178923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2pFXc97irB+xqhuEeXsJuqz1K7COxcjkvhRgUnmVu88=;
 b=g2hwmCJuf2FHFFrdwKJ12TIcVISfnNJza10lqe06K7YD9OiK88pv+sCZw+t7ZbM3HN
 /SHjMJ+Q+2tPMIq/LLxUtgvCpnfk5DtraF+VBe5h2skF4YLZtY/0u6WjKVnHmaC46UbX
 nut24JyACPMTfyHE8tERsIRfC/y4QHa1WDzri501VJY/Ce9ejXTzB2NujMHuT1xHK6Mt
 pZ0/sS+/0hJbwL02eGIDazZpZYMkAr99C50xqVKOPGW/YzC744TluJne3VNh3qPcNgDT
 eBUu6SrALbT/B3PuWerx93wJjwenrEN22h42YZUSm88DJnZ8vqy29cyV+zjUQ2FWYXHG
 XI1A==
X-Gm-Message-State: AOJu0Yxavw8bsUbZLHh0fMyvCFp2LJPRLHxy+G3EKwqM0SgHJH5jeDBr
 DrN7XhbxXGIJ+6TcexVAcJPjCINqbpRMKfOMOC/9OlXIbMdqwBUc3Bd9lMcq0lpUBfs=
X-Gm-Gg: AR+sD11krLm0xT4FH7vS/ZZHmYPRFAfnyG+UJ9KtmjBh47ksigsTqfPyitWJoWc3b/o
 A5qNT+uXMvaJJp5R1CNzqyKq+G7OmdgRALCbPGQk2Ps5+cBosHfn46+uBt9ME1NnhMCZIZ0jojf
 zQ73i4+Sm83Z5XVXaiJwafZNsTmL3sSfy9RlAC2ScQySdy4fw0+TV8PyerGQ4y7Sx9Qu6rWirxW
 AL+PYXRfZ4Xkscdb3hsHAd9gAt68AbaVuDRDne7TiyKiR6ExioHenYy9OSrAAn8tBcxddGqH+Vc
 I+krp5kYNJsfbvehDDgZrZBieswnWdwJH8y/QfpBh4JduQ4VX97+OO90ET3njHhZxqsSJYoDGaz
 BqTPXp++OBa3RFQ89jvlNCtuNgeWyYOs1Fdtw9wSNU0liRLbm2Z2faLx/WW4zrZEUCf56K7apjE
 qsGAjswIU2XXie06r61YK6+e8hs0zghb6/jVSlFNNCqlQQly2thQw4lYk1nCDMV5nN2VCk0qUs7
 xLGzf9PsBh8Qm8WtgUt
X-Received: by 2002:a17:90b:3c0c:b0:38e:64b0:8bce with SMTP id
 98e67ed59e1d1-3931e351897mr1986080a91.20.1786574123042; 
 Wed, 12 Aug 2026 15:35:23 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3931f41cd2fsm464854a91.12.2026.08.12.15.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:35:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 42/52] disas/riscv: Split xlrbr_opcode_data
Date: Wed, 12 Aug 2026 15:31:32 -0700
Message-ID: <20260812223142.349142-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Move the table to riscv-xlrbr-op.c.inc and massage
the lines into OP() form.  Drop illegal as unused.
Return pointers to objects directly.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv-xlrbr.c        | 54 +++++++++-----------------------------
 disas/riscv-xlrbr-op.c.inc |  8 ++++++
 2 files changed, 20 insertions(+), 42 deletions(-)
 create mode 100644 disas/riscv-xlrbr-op.c.inc

diff --git a/disas/riscv-xlrbr.c b/disas/riscv-xlrbr.c
index b12916c9da..b4229e5c83 100644
--- a/disas/riscv-xlrbr.c
+++ b/disas/riscv-xlrbr.c
@@ -8,38 +8,16 @@
  */
 
 #include "qemu/osdep.h"
-
 #include "disas/riscv.h"
 #include "disas/riscv-xlrbr.h"
 
-typedef enum {
-    /* 0 is reserved for rv_op_illegal. */
-    rv_op_crc32_b = 1,
-    rv_op_crc32_h = 2,
-    rv_op_crc32_w = 3,
-    rv_op_crc32_d = 4,
-    rv_op_crc32c_b = 5,
-    rv_op_crc32c_h = 6,
-    rv_op_crc32c_w = 7,
-    rv_op_crc32c_d = 8,
-} rv_xlrbr_op;
-
-static const rv_opcode_data xlrbr_opcode_data[] = {
-    { "illegal", rv_codec_illegal, rv_fmt_none },
-    { "crc32.b", rv_codec_r, rv_fmt_rd_rs1 },
-    { "crc32.h", rv_codec_r, rv_fmt_rd_rs1 },
-    { "crc32.w", rv_codec_r, rv_fmt_rd_rs1 },
-    { "crc32.d", rv_codec_r, rv_fmt_rd_rs1 },
-    { "crc32c.b", rv_codec_r, rv_fmt_rd_rs1 },
-    { "crc32c.h", rv_codec_r, rv_fmt_rd_rs1 },
-    { "crc32c.w", rv_codec_r, rv_fmt_rd_rs1 },
-    { "crc32c.d", rv_codec_r, rv_fmt_rd_rs1 },
-};
+#define OP(N, ...) static const rv_opcode_data op_##N = { __VA_ARGS__ };
+#include "riscv-xlrbr-op.c.inc"
+#undef OP
 
 const rv_opcode_data *decode_xlrbr(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
-    rv_opcode op = rv_op_illegal;
 
     switch ((inst >> 0) & 0b1111111) {
     case 0b0010011:
@@ -47,34 +25,26 @@ const rv_opcode_data *decode_xlrbr(rv_decode *dec, rv_isa isa)
         case 0b001:
             switch ((inst >> 20 & 0b111111111111)) {
             case 0b011000010000:
-                op = rv_op_crc32_b;
-                break;
+                return &op_crc32_b;
             case 0b011000010001:
-                op = rv_op_crc32_h;
-                break;
+                return &op_crc32_h;
             case 0b011000010010:
-                op = rv_op_crc32_w;
-                break;
+                return &op_crc32_w;
             case 0b011000010011:
-                op = rv_op_crc32_d;
-                break;
+                return &op_crc32_d;
             case 0b011000011000:
-                op = rv_op_crc32c_b;
-                break;
+                return &op_crc32c_b;
             case 0b011000011001:
-                op = rv_op_crc32c_h;
-                break;
+                return &op_crc32c_h;
             case 0b011000011010:
-                op = rv_op_crc32c_w;
-                break;
+                return &op_crc32c_w;
             case 0b011000011011:
-                op = rv_op_crc32c_d;
-                break;
+                return &op_crc32c_d;
             }
             break;
         }
         break;
     }
 
-    return op == rv_op_illegal ? NULL : &xlrbr_opcode_data[op];
+    return NULL;
 }
diff --git a/disas/riscv-xlrbr-op.c.inc b/disas/riscv-xlrbr-op.c.inc
new file mode 100644
index 0000000000..57add37c24
--- /dev/null
+++ b/disas/riscv-xlrbr-op.c.inc
@@ -0,0 +1,8 @@
+OP(crc32_b, "crc32.b", rv_codec_r, rv_fmt_rd_rs1)
+OP(crc32_h, "crc32.h", rv_codec_r, rv_fmt_rd_rs1)
+OP(crc32_w, "crc32.w", rv_codec_r, rv_fmt_rd_rs1)
+OP(crc32_d, "crc32.d", rv_codec_r, rv_fmt_rd_rs1)
+OP(crc32c_b, "crc32c.b", rv_codec_r, rv_fmt_rd_rs1)
+OP(crc32c_h, "crc32c.h", rv_codec_r, rv_fmt_rd_rs1)
+OP(crc32c_w, "crc32c.w", rv_codec_r, rv_fmt_rd_rs1)
+OP(crc32c_d, "crc32c.d", rv_codec_r, rv_fmt_rd_rs1)
-- 
2.43.0


