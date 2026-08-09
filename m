Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB641C5AD7B
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:45:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtCBH-0005vu-U5; Sun, 09 Aug 2026 18:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCBG-0005ue-8f
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:46 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCBD-000844-Oc
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:45 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-38dc4553f62so1331865a91.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786315182; x=1786919982; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5s0IwffoMRvG3Wnu8+sauk7FlicdbDb2VjR30Cy60eg=;
 b=bx/58W/A0vkkGT/rmCMppQdeuIyBCnR8lGEk79iLtnA6kIR8JA9jkYH18Gje4Kbn/o
 950pxh/9JtglXYHVXnVZK8HkZidFmORWkO1k46UhQu4/V2VSGSHleRTXjOS9ATpq8D7T
 yrLxv+KGYWUrFZJnK0uq+BA63Ou1nJFIY2XDAnXtIMucYXnSyLooo1+ZUjAzeTnnusR1
 ROOos2fzYJKEJM+nnHw30D4hl/2SqMmE/TgmPa+WiEmUWAKgkFj05s2S7/9yGA4opOXY
 xBkruu27M+RKlq3BXvHjOoAzCucq3cpYynip85QBbPQ+ZpADIPpXAo37Ci1aLFqXA2UD
 56DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786315182; x=1786919982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5s0IwffoMRvG3Wnu8+sauk7FlicdbDb2VjR30Cy60eg=;
 b=cUFQtdDUGbKPyElddq1v3vwMDv/tNcMHSYslgTFK75MPOgIPep/Uu/Cocy1bxLSLhx
 dv6rHm4ghbnsm7m3fruxdZEUV+L5o9I3jQGl+KJ5Q4EweFBqptllfAjbO84KI0S09L/B
 vwkDlq+i14Ekj6fd+Ci7NyT6Suau6IDQmrLmI+7gseTePuVSgNnspvyVtn8QZN91tfyW
 em/NgCGoVdh10ItQ9x41T9s6lDslAB5WKNAuYZjdQpr4Pkt80mW8h3dYZmEX6Da0guk/
 OWiKtOWY/f2amEytFaUrgZlBYTwxLetPMZSR4sT6iaocHT7mMU9I7J7bJ6dr/6prv9ED
 iJaA==
X-Gm-Message-State: AOJu0Yy6Ti0GtFnX7fWXDnlZz126x7AhC1BuDzeOmTgJlJ52K9RLzgb7
 I1L+PP9YpQcs7VMX4xOkHckhqPc0HXlZKWUBB5xU3iFgi6QQoGADfLQQkQACNGFQ7gw=
X-Gm-Gg: AR+sD10m2w/quS4LpjRzUMbauKVuWaLZX1KJEJ2uJygWCyT8IAIKMHrLVO3Y2xbnz0c
 sFUwBI4GTIePBAhY5L0rhPFZNk3MgsydPAFCx9Gg9bn/0DQ8HZ/Y9hjpW7qZA1tR5uqgymsSlK2
 phieeInhX1I2PL5cHa3WjkMo4lbkWpJEHuYJnXXZ84NXnLmx7HbSue42VWk4ifURAANYCgSk82y
 i+lk3/4esvc0YH5KRB/BMf1bbHpQGuiHUJD4mb2J2rNE7d+LriJ3iACfcEAZApMMBaegc9H+by2
 /KFXnpSCO8NOo6B6zOOrEsmRNxC9Gb9vjjGr2Wc9FKuirVCtG8Gs1J7AkjOhi4MOsDo5JjVoi5q
 mDTY1a/xspdZC3qN84BqVNnc+MdgEz6jQL1Pf8yK2QkVSK8B+bJ/s+t+sDlLHRPqkWP3jifm+gL
 4ivnoo0AM5+y+ZF+LT1QB7KVKYJElJ9xcMie9UD3sww4dldK2Utrtg4VJIPFzDRl7NggIVAYkf9
 1IbpklFMTUlDoU528GD
X-Received: by 2002:a17:90b:3c06:b0:38d:e658:595a with SMTP id
 98e67ed59e1d1-3903c54f1fdmr37648474a91.2.1786315182209; 
 Sun, 09 Aug 2026 15:39:42 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-390b1573defsm4264430a91.1.2026.08.09.15.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:39:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 46/56] disas/riscv: Split xlrbr_opcode_data
Date: Sun,  9 Aug 2026 15:35:35 -0700
Message-ID: <20260809223545.730664-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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


