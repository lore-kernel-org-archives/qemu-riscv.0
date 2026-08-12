Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBDFC5CFDB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:36:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHXj-00013Q-2G; Wed, 12 Aug 2026 18:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHXi-00012S-5e
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:35:26 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHXf-0001ou-SD
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:35:25 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2cc61541f8cso5366635ad.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786574122; x=1787178922; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oHmxQeSr/dTTNzFrqNQqSRdCV/mZHqBgLnLzZSztk8w=;
 b=KvQ36ox++yOEj9MEQGfD1WGphXjPXb0CgDpP/g3d5llPgdcHhZbTcvoIg2WFiEMtrn
 UXiEcmVnvOlsnG1cnMNtoVvV7JXrbYtl7PGvjLfwe9skzy6U4N8nBCl7bA8zjbcicL1g
 CU659Zx0KWRQZ2856mjXhKiugGFRwTbJmrbfYRcYMM9mRjUeQFP/bMQbS/XI3SfrFPLL
 +9bvR2jCjamBhyEbxZ+Yg7G+QtK3u7vumMmmj+weF/w2yl7Z7BVdg0KR6xoQS0YvqZ7g
 3zMucjAW+gySfO5jU9xrR7KJ9nH6j6EWJlCWZBDeH1xoXI0PmnYf01CYo42JN5grvxTr
 cB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786574122; x=1787178922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oHmxQeSr/dTTNzFrqNQqSRdCV/mZHqBgLnLzZSztk8w=;
 b=CkgVjz7EERfV4TA4fF1IW/Nawjs/hsd1giqOM4N1C0Kqkp31h6ckfVlRdKNOZqjH1t
 rUOUt2ykRLGwdL6ixGW7qutpcJfWc/9bY7mnIfmHLmAZiRxdETd0f1BBw3OPdN5GggW5
 qxe/XRMqj1kDcqb2QL8nS6BURouatIstATn51RcO4IIQJEuA4CrQcb0sLzEvhOmxAsXC
 kK9ju/qfU7+Zsnlzb5z8PFVerRuME6puu/D10qK2x3yH84ISJ5lN3X9+X6IEGOPRO34d
 gtWvF4A0ozkZDXi7a8h2/c1pIairM27sJaPhXU647wllqlvb31VXCy1NWQM4ZJVmDoEs
 jaog==
X-Gm-Message-State: AOJu0YznvykLGMIEMyw57LwKh2rvHr6zFLB2aZOXtvcGyjWNruQe1VUI
 jBCc6Wg9r35RWVI5VarHk4Ypg90t4wggTCU7BDVfT4kOT4IkqvXdXbBRPspn3eCE7x8=
X-Gm-Gg: AR+sD11wAJm1V2Ci4ZlwsLjGK01gFzsOrXj/dItI2ROqF/NR3CkB+XmMOe5lMWncMNL
 7ZinCZ9S0VbYx+y6GcfR+dvyzx6BbfhJMNnsLLps3qWCkU82GlLBIXlousI8+nvmI9JtvCn+8cx
 LsPuNO4lybPV8EobRG2CZQ+b0fOMyU7vMfAMyJRb9TGFFNpqbQTv5jUDIttiu1D760cJPpVUwuX
 pJaa/Nr+NTEyZ7BK0wHhdhF5r1r5KkltwjdXYq2Bk7jPv64xo+MY58gEZmyPQkdgZ2LwG3KxxaY
 VK5wCisHTeyQuvzVkCi43pL7zz8a8bImjkEePWexAZfaZPuGXMRqQ3fCJpnpqTb4AIiE/YKE7J7
 kIUfaaa0UeYE5/0m7gNsCm8x8zP+wo4GLXVmgaUkDjjdR/tszFr5XPw4mn0eMbOzQWEl7ozTBkL
 AB/92UDkFhEIE0X29ESh9cneqpe+/0+dQyl9kFJX1r63eJfSy+wncbw3QWWcoErIEimW0uF33RJ
 bcPVdoyzeN3MPpDliBNrRVFyEeXpRg=
X-Received: by 2002:a17:90b:53ce:b0:38e:4f42:d0d6 with SMTP id
 98e67ed59e1d1-3931f9126e8mr399390a91.12.1786574122300; 
 Wed, 12 Aug 2026 15:35:22 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3931f41cd2fsm464854a91.12.2026.08.12.15.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:35:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 41/52] disas/riscv: Split ventana_opcode_data
Date: Wed, 12 Aug 2026 15:31:31 -0700
Message-ID: <20260812223142.349142-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Move the table to riscv-xventana-op.c.inc and massage
the lines into OP() form.  Drop vt.illegal as unused.
Return pointers to objects directly.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv-xventana.c        | 21 ++++++---------------
 disas/riscv-xventana-op.c.inc |  2 ++
 2 files changed, 8 insertions(+), 15 deletions(-)
 create mode 100644 disas/riscv-xventana-op.c.inc

diff --git a/disas/riscv-xventana.c b/disas/riscv-xventana.c
index a4e59312d0..5d2e07865f 100644
--- a/disas/riscv-xventana.c
+++ b/disas/riscv-xventana.c
@@ -8,35 +8,26 @@
 #include "disas/riscv.h"
 #include "disas/riscv-xventana.h"
 
-typedef enum {
-    /* 0 is reserved for rv_op_illegal. */
-    ventana_op_vt_maskc = 1,
-    ventana_op_vt_maskcn = 2,
-} rv_ventana_op;
-
-static const rv_opcode_data ventana_opcode_data[] = {
-    { "vt.illegal", rv_codec_illegal, rv_fmt_none },
-    { "vt.maskc", rv_codec_r, rv_fmt_rd_rs1_rs2 },
-    { "vt.maskcn", rv_codec_r, rv_fmt_rd_rs1_rs2 },
-};
+#define OP(N, ...) static const rv_opcode_data op_##N = { __VA_ARGS__ };
+#include "riscv-xventana-op.c.inc"
+#undef OP
 
 const rv_opcode_data *decode_xventanacondops(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
-    rv_opcode op = rv_op_illegal;
 
     switch (((inst >> 0) & 0b11)) {
     case 3:
         switch (((inst >> 2) & 0b11111)) {
         case 30:
             switch (((inst >> 22) & 0b1111111000) | ((inst >> 12) & 0b0000000111)) {
-            case 6: op = ventana_op_vt_maskc; break;
-            case 7: op = ventana_op_vt_maskcn; break;
+            case 6: return &op_vt_maskc;
+            case 7: return &op_vt_maskcn;
             }
             break;
         }
         break;
     }
 
-    return op == rv_op_illegal ? NULL : &ventana_opcode_data[op];
+    return NULL;
 }
diff --git a/disas/riscv-xventana-op.c.inc b/disas/riscv-xventana-op.c.inc
new file mode 100644
index 0000000000..0fe4666aee
--- /dev/null
+++ b/disas/riscv-xventana-op.c.inc
@@ -0,0 +1,2 @@
+OP(vt_maskc, "vt.maskc", rv_codec_r, rv_fmt_rd_rs1_rs2)
+OP(vt_maskcn, "vt.maskcn", rv_codec_r, rv_fmt_rd_rs1_rs2)
-- 
2.43.0


