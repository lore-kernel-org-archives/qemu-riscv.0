Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC70C5DF65
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:34:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHV1-0007y8-6F; Wed, 12 Aug 2026 18:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUl-0007Yu-EB
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:23 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUh-00018S-7L
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:22 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c966b9ee9cbso118979a12.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573938; x=1787178738; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AU78pzgUZIKGgaoTZ2JQ8edxkpulCTDCc/iI5VzJhUE=;
 b=JqyVkzJxbziXvIcieQxfUyUGpnnBBMZLKUqgFa55wgZ7LR0i3V4sIQSHEHIEo0/r7Q
 2vL1FUqzbevZngurwGHmuowf/ysucPLsTjGZlvj4WPFI7Y4rVNF9SQ5lujlG30Hav4V+
 0+mho7YsJFZNdj6SqYe6DGA2dPI6ESjd8xz9IMXMo9+kpzluK5C8InVkpr/nCS2YyNgb
 udRXii3tAOQvgR5T9T0DouKHL0veJ83oyoBw8Yn0U7PvKK12w3ozIqSAYdUDS21eCd/x
 SmEcRreW983BKKmyJ7fQnaQ0gkoiGDvp6lCym6v5JHbMU6tnw6L8o6pwg0qhT8zVoSe4
 F+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573938; x=1787178738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AU78pzgUZIKGgaoTZ2JQ8edxkpulCTDCc/iI5VzJhUE=;
 b=mIjnYdv8iNDzrXYGVeHV0Wp+D4yUBeijoVS4y3CSIVuw7VLB+8PE9UuxtboYc+R1lV
 tW9CoBoidqCm1dLuzEJqCp5/G36gdTc60ShxbWmEoWf1lVlbQtV5QZx2Kg6C9DmfZJtP
 QcVrHVWLs8/Fd+uNfQ8KuPKhL9ns8sBPcfAqtJ2yLAisMpakAbKViujUgoOGxHhKf8f0
 RwM58RncZpSb5HBTPlePV/rHwJb3o7vM2kqKAOgGNAf+jSWK7DSGOxYG6XTcwrj0IALL
 ngFwHd7up58TTYpZEtiO7PVMEt9feomfnPvFZLHYmcJYkswc7Xq+wbyQ9tYH7zgrAawi
 obzA==
X-Gm-Message-State: AOJu0YwyJ6kxyjvHoG/QaW0E8RcaBvHRbXYEGv90/OaOQfgVk4rH1DpL
 AcJdq1GMK6kJj/5kVv33Q+6fESg2o4c5rkYw5EMyhj2AJ/nTEesQ29PS/V3x4pOK/+M=
X-Gm-Gg: AR+sD13G3eZ9K3qPbpoIwdfuXU64pnlVFWJxWYqPjtWCrTrDaqpQwcbLJGSR4z9jmal
 D5QSHQk7IzqFg6Bnwm7kKJLOf8xDEzxYNKBKsEF/DfVLfxcButDBhxroEGfFqVB1yga8S75Fm3X
 1iM5rt6Pj4OBKmCQHhDPCvKMBdYYAEcOKrImfgxj6H9YkRxVOl+XAUrk84q6uCiL36mUMK4BhIX
 K2NPtcV6O7DgSp/bZ/RyBpDSHfPCxwro719eYrqppCa2oQrMNEOC5I9U9UrWDlP0GwQC5YERzYN
 CImPPP2qTcYQCtIcwOdfINSbUmqoy0bw7AbkHzPWDx45kznzWC0QPpihMuWtxnDdy6eRKtosBuh
 h3sVp6NlX7UbM3cpHRomsf50/scZJIlnb/NMhYSU5X8wgNLQ7IKRHXy+HaB9gbw3S+LVaEqfB0d
 l6i/k1bkAdcqiEo1srp67pDZyzmaGd65EVQGq7zGtPEg0ukvckSqxnAgCure/c7zuOcpvjZbdxy
 wRbGWYr5HwHyRjwhf6O
X-Received: by 2002:a05:6a00:440c:b0:846:a26:8e0b with SMTP id
 d2e1a72fcca58-84fc6e286f5mr1204938b3a.18.1786573937511; 
 Wed, 12 Aug 2026 15:32:17 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 35/52] disas/riscv: Return rv_opcode_data pointer from
 decoders
Date: Wed, 12 Aug 2026 15:31:25 -0700
Message-ID: <20260812223142.349142-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Rather than putting array + index into rv_decode,
return the pointer to the object directly.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv-xlrbr.h    |  2 +-
 disas/riscv-xthead.h   | 22 ++++++++---------
 disas/riscv-xventana.h |  2 +-
 disas/riscv.h          |  2 --
 disas/riscv-xlrbr.c    |  5 ++--
 disas/riscv-xthead.c   | 55 +++++++++++++++++-------------------------
 disas/riscv-xventana.c |  5 ++--
 disas/riscv.c          | 23 +++++++-----------
 8 files changed, 48 insertions(+), 68 deletions(-)

diff --git a/disas/riscv-xlrbr.h b/disas/riscv-xlrbr.h
index ebf3d4c133..da14f1b340 100644
--- a/disas/riscv-xlrbr.h
+++ b/disas/riscv-xlrbr.h
@@ -12,6 +12,6 @@
 
 #include "disas/riscv.h"
 
-void decode_xlrbr(rv_decode *, rv_isa);
+const rv_opcode_data *decode_xlrbr(rv_decode *, rv_isa);
 
 #endif /* DISAS_RISCV_XLRBR_H */
diff --git a/disas/riscv-xthead.h b/disas/riscv-xthead.h
index 0c65c8e0af..f2160be8a4 100644
--- a/disas/riscv-xthead.h
+++ b/disas/riscv-xthead.h
@@ -11,16 +11,16 @@
 
 #include "disas/riscv.h"
 
-void decode_xtheadba(rv_decode *, rv_isa);
-void decode_xtheadbb(rv_decode *, rv_isa);
-void decode_xtheadbs(rv_decode *, rv_isa);
-void decode_xtheadcmo(rv_decode *, rv_isa);
-void decode_xtheadcondmov(rv_decode *, rv_isa);
-void decode_xtheadfmemidx(rv_decode *, rv_isa);
-void decode_xtheadfmv(rv_decode *, rv_isa);
-void decode_xtheadmac(rv_decode *, rv_isa);
-void decode_xtheadmemidx(rv_decode *, rv_isa);
-void decode_xtheadmempair(rv_decode *, rv_isa);
-void decode_xtheadsync(rv_decode *, rv_isa);
+const rv_opcode_data *decode_xtheadba(rv_decode *, rv_isa);
+const rv_opcode_data *decode_xtheadbb(rv_decode *, rv_isa);
+const rv_opcode_data *decode_xtheadbs(rv_decode *, rv_isa);
+const rv_opcode_data *decode_xtheadcmo(rv_decode *, rv_isa);
+const rv_opcode_data *decode_xtheadcondmov(rv_decode *, rv_isa);
+const rv_opcode_data *decode_xtheadfmemidx(rv_decode *, rv_isa);
+const rv_opcode_data *decode_xtheadfmv(rv_decode *, rv_isa);
+const rv_opcode_data *decode_xtheadmac(rv_decode *, rv_isa);
+const rv_opcode_data *decode_xtheadmemidx(rv_decode *, rv_isa);
+const rv_opcode_data *decode_xtheadmempair(rv_decode *, rv_isa);
+const rv_opcode_data *decode_xtheadsync(rv_decode *, rv_isa);
 
 #endif /* DISAS_RISCV_XTHEAD_H */
diff --git a/disas/riscv-xventana.h b/disas/riscv-xventana.h
index 1006c3be00..d28e84c7e4 100644
--- a/disas/riscv-xventana.h
+++ b/disas/riscv-xventana.h
@@ -11,6 +11,6 @@
 
 #include "disas/riscv.h"
 
-void decode_xventanacondops(rv_decode*, rv_isa);
+const rv_opcode_data *decode_xventanacondops(rv_decode*, rv_isa);
 
 #endif /* DISAS_RISCV_XVENTANA_H */
diff --git a/disas/riscv.h b/disas/riscv.h
index ab62c0db94..241dd47d7f 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -182,10 +182,8 @@ typedef struct {
     const RISCVCPUConfig *cfg;
     uint64_t  pc;
     uint64_t  inst;
-    const rv_opcode_data *opcode_data;
     int32_t   imm;
     int32_t   imm1;
-    uint16_t  op;
     uint8_t   rd;
     uint8_t   rs1;
     uint8_t   rs2;
diff --git a/disas/riscv-xlrbr.c b/disas/riscv-xlrbr.c
index d0092e9edd..b12916c9da 100644
--- a/disas/riscv-xlrbr.c
+++ b/disas/riscv-xlrbr.c
@@ -36,7 +36,7 @@ static const rv_opcode_data xlrbr_opcode_data[] = {
     { "crc32c.d", rv_codec_r, rv_fmt_rd_rs1 },
 };
 
-void decode_xlrbr(rv_decode *dec, rv_isa isa)
+const rv_opcode_data *decode_xlrbr(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
@@ -76,6 +76,5 @@ void decode_xlrbr(rv_decode *dec, rv_isa isa)
         break;
     }
 
-    dec->opcode_data = xlrbr_opcode_data;
-    dec->op = op;
+    return op == rv_op_illegal ? NULL : &xlrbr_opcode_data[op];
 }
diff --git a/disas/riscv-xthead.c b/disas/riscv-xthead.c
index 757d6ff39f..428a6380e9 100644
--- a/disas/riscv-xthead.c
+++ b/disas/riscv-xthead.c
@@ -246,7 +246,7 @@ static const rv_opcode_data xthead_opcode_data[] = {
     { "th.sync.s", rv_codec_none, rv_fmt_none },
 };
 
-void decode_xtheadba(rv_decode *dec, rv_isa isa)
+const rv_opcode_data *decode_xtheadba(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
@@ -272,11 +272,10 @@ void decode_xtheadba(rv_decode *dec, rv_isa isa)
         break;
     }
 
-    dec->opcode_data = xthead_opcode_data;
-    dec->op = op;
+    return op == rv_op_illegal ? NULL : &xthead_opcode_data[op];
 }
 
-void decode_xtheadbb(rv_decode *dec, rv_isa isa)
+const rv_opcode_data *decode_xtheadbb(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
@@ -331,11 +330,10 @@ void decode_xtheadbb(rv_decode *dec, rv_isa isa)
         break;
     }
 
-    dec->opcode_data = xthead_opcode_data;
-    dec->op = op;
+    return op == rv_op_illegal ? NULL : &xthead_opcode_data[op];
 }
 
-void decode_xtheadbs(rv_decode *dec, rv_isa isa)
+const rv_opcode_data *decode_xtheadbs(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
@@ -358,11 +356,10 @@ void decode_xtheadbs(rv_decode *dec, rv_isa isa)
         break;
     }
 
-    dec->opcode_data = xthead_opcode_data;
-    dec->op = op;
+    return op == rv_op_illegal ? NULL : &xthead_opcode_data[op];
 }
 
-void decode_xtheadcmo(rv_decode *dec, rv_isa isa)
+const rv_opcode_data *decode_xtheadcmo(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
@@ -437,11 +434,10 @@ void decode_xtheadcmo(rv_decode *dec, rv_isa isa)
         break;
     }
 
-    dec->opcode_data = xthead_opcode_data;
-    dec->op = op;
+    return op == rv_op_illegal ? NULL : &xthead_opcode_data[op];
 }
 
-void decode_xtheadcondmov(rv_decode *dec, rv_isa isa)
+const rv_opcode_data *decode_xtheadcondmov(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
@@ -465,11 +461,10 @@ void decode_xtheadcondmov(rv_decode *dec, rv_isa isa)
         break;
     }
 
-    dec->opcode_data = xthead_opcode_data;
-    dec->op = op;
+    return op == rv_op_illegal ? NULL : &xthead_opcode_data[op];
 }
 
-void decode_xtheadfmemidx(rv_decode *dec, rv_isa isa)
+const rv_opcode_data *decode_xtheadfmemidx(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
@@ -503,11 +498,10 @@ void decode_xtheadfmemidx(rv_decode *dec, rv_isa isa)
         break;
     }
 
-    dec->opcode_data = xthead_opcode_data;
-    dec->op = op;
+    return op == rv_op_illegal ? NULL : &xthead_opcode_data[op];
 }
 
-void decode_xtheadfmv(rv_decode *dec, rv_isa isa)
+const rv_opcode_data *decode_xtheadfmv(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
@@ -539,11 +533,10 @@ void decode_xtheadfmv(rv_decode *dec, rv_isa isa)
         break;
     }
 
-    dec->opcode_data = xthead_opcode_data;
-    dec->op = op;
+    return op == rv_op_illegal ? NULL : &xthead_opcode_data[op];
 }
 
-void decode_xtheadmac(rv_decode *dec, rv_isa isa)
+const rv_opcode_data *decode_xtheadmac(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
@@ -571,11 +564,10 @@ void decode_xtheadmac(rv_decode *dec, rv_isa isa)
         break;
     }
 
-    dec->opcode_data = xthead_opcode_data;
-    dec->op = op;
+    return op == rv_op_illegal ? NULL : &xthead_opcode_data[op];
 }
 
-void decode_xtheadmemidx(rv_decode *dec, rv_isa isa)
+const rv_opcode_data *decode_xtheadmemidx(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
@@ -646,11 +638,10 @@ void decode_xtheadmemidx(rv_decode *dec, rv_isa isa)
         break;
     }
 
-    dec->opcode_data = xthead_opcode_data;
-    dec->op = op;
+    return op == rv_op_illegal ? NULL : &xthead_opcode_data[op];
 }
 
-void decode_xtheadmempair(rv_decode *dec, rv_isa isa)
+const rv_opcode_data *decode_xtheadmempair(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
@@ -681,11 +672,10 @@ void decode_xtheadmempair(rv_decode *dec, rv_isa isa)
         break;
     }
 
-    dec->opcode_data = xthead_opcode_data;
-    dec->op = op;
+    return op == rv_op_illegal ? NULL : &xthead_opcode_data[op];
 }
 
-void decode_xtheadsync(rv_decode *dec, rv_isa isa)
+const rv_opcode_data *decode_xtheadsync(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
@@ -716,6 +706,5 @@ void decode_xtheadsync(rv_decode *dec, rv_isa isa)
         break;
     }
 
-    dec->opcode_data = xthead_opcode_data;
-    dec->op = op;
+    return op == rv_op_illegal ? NULL : &xthead_opcode_data[op];
 }
diff --git a/disas/riscv-xventana.c b/disas/riscv-xventana.c
index 4fb9a29d0b..a4e59312d0 100644
--- a/disas/riscv-xventana.c
+++ b/disas/riscv-xventana.c
@@ -20,7 +20,7 @@ static const rv_opcode_data ventana_opcode_data[] = {
     { "vt.maskcn", rv_codec_r, rv_fmt_rd_rs1_rs2 },
 };
 
-void decode_xventanacondops(rv_decode *dec, rv_isa isa)
+const rv_opcode_data *decode_xventanacondops(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
@@ -38,6 +38,5 @@ void decode_xventanacondops(rv_decode *dec, rv_isa isa)
         break;
     }
 
-    dec->opcode_data = ventana_opcode_data;
-    dec->op = op;
+    return op == rv_op_illegal ? NULL : &ventana_opcode_data[op];
 }
diff --git a/disas/riscv.c b/disas/riscv.c
index 9d05e86c09..bc86cb866a 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2846,7 +2846,7 @@ static const char *csr_name(int csrno)
 
 /* decode opcode */
 
-static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
+static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
 {
     rv_inst inst = dec->inst;
     rv_opcode op = rv_op_illegal;
@@ -4541,8 +4541,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
         break;
     }
 
-    dec->opcode_data = rvi_opcode_data;
-    dec->op = op;
+    return op == rv_op_illegal ? NULL : &rvi_opcode_data[op];
 }
 
 /* decode operands */
@@ -5291,14 +5290,12 @@ static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
         .inst = inst,
         .cfg = cfg,
     };
-    const rv_opcode_data *op;
+    const rv_opcode_data *op = decode_inst_opcode(&dec, isa);
 
-    decode_inst_opcode(&dec, isa);
-
-    if (dec.op == rv_op_illegal && cfg) {
+    if (!op && cfg) {
         static const struct {
             bool (*guard_func)(const RISCVCPUConfig *);
-            void (*decode_func)(rv_decode *, rv_isa);
+            const rv_opcode_data *(*decode_func)(rv_decode *, rv_isa);
         } decoders[] = {
             { has_xtheadba_p, decode_xtheadba },
             { has_xtheadbb_p, decode_xtheadbb },
@@ -5317,19 +5314,17 @@ static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
 
         for (size_t i = 0; i < ARRAY_SIZE(decoders); i++) {
             if (decoders[i].guard_func(cfg)) {
-                decoders[i].decode_func(&dec, isa);
-                if (dec.op != rv_op_illegal) {
+                op = decoders[i].decode_func(&dec, isa);
+                if (op) {
                     break;
                 }
             }
         }
     }
-
-    if (dec.op == rv_op_illegal) {
-        dec.opcode_data = rvi_opcode_data;
+    if (!op) {
+        op = &rvi_opcode_data[rv_op_illegal];
     }
 
-    op = &dec.opcode_data[dec.op];
     decode_inst_operands(&dec, isa, op);
     op = decode_inst_lift_pseudo(&dec, op);
     return format_inst(24, &dec, op);
-- 
2.43.0


