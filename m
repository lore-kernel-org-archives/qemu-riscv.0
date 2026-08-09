Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9419EC5AD4E
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:41:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7i-0000n0-B0; Sun, 09 Aug 2026 18:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7g-0000lG-H8
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:04 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7e-0007KF-TV
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:04 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-c96c92c0980so634199a12.3
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314961; x=1786919761; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ojI3MxJHHeWD8C2qQpIjN6QY5DC1pEE2atzUlRgmXLI=;
 b=Zkv/44tOV3UpU0SuWwDlympIFNabS1TK6ePYlR4igsy1Vyw/EI5nT7o5t4yHDewH8v
 6hzl7Ehp2j81ERhOLK24OoVAh6vdwV1iItsm131PnAdLxRn/8FK5+XKog97hnhc9Vlqz
 1n2JYXbxOg8In/CELaeBWE8/yA6Ouxlenkxla2jwpUyu+eAyHpm2sA5DR5xVxLnte6u6
 P57Ei9MtoNqvBA+t9Qn7OvqHO1ZuY/UkrMlmLshBccQAXCREiUSt7u5U2p561B7chyBE
 pLFZ3g5Wd7j0kQhBPeERUfg8gBIheH0heVaxNPE1H77lnoysja9P31N/MEi62ATZGz7z
 mz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314961; x=1786919761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ojI3MxJHHeWD8C2qQpIjN6QY5DC1pEE2atzUlRgmXLI=;
 b=IkmAxLvHbIHiJ9butbBDbM5I22nCuiy1PIeNPUHo0p/pPwzzSav1L+TEEwnObVjOAF
 r1JSrRN0WgqlUe8iUJ5Wq+3Ypqy/7NswziDkR5Q6rhS+38+hBrqJF+weQ+CnUD8AX0Fe
 IcSFPqVB5453s1It7J4GGKDs10mTtcyUiNKqLexu4dztFL0uirm3W4nqNp3G7kD+BCHZ
 zuACMEIynPcKM3uZaeMvCJnA4yA+xlDYqOTBZCQ8UJGvNRg+TLwU8QlVYjLxEob3mpjK
 5iWh4W2nLaqBFQpOrS1yBOhMyQvIhD+5i/hgHM0Qez9u0J51p//eOzzw/ITEVFVErqBR
 8uiA==
X-Gm-Message-State: AOJu0YyA5BGsqG9/dSi3YttGEdGwPmvaas1+nETPo0S3kTZl1A/4ScWN
 35b2yHh4Amh9McRrY4PoIHUZE3JDqmONZd7OcldsiwdQh4NIjNZ+78qRCXFReRScleg=
X-Gm-Gg: AR+sD13Q55hrdzjW85jSB/xFHKTX9STF/XpZ6lS/ZCVxV+ipaobdbqh7G6DNiNCHoxe
 cPCIzJ0wq6HxRqGqge1JH10UDWvb+fl7USq/4CdcwiTxEp1zCtgio8wuyD/K5tgc7xnBnHHZDfM
 7kR3pxrdPLqiWw6M1hIUcg19XqDnpfn/RDMT0vIlnAvxrcwdVCXzWJ79KbvfrVjUYNnev65WmXD
 L/NNvy/7QotjqsfBSeoI4uCfS9f9s9TWd3IJj/JKyo6ATA8vmeYpZO7kH9oHi5QYF0KaPEPOHS3
 ESGBEeKt9epKdjOx72rHYOwZP8dm3sU1O3n8gEkF+bJnAUHIWktIpLqDLdk64U1DrmWuHmHVLz7
 TdBvfLd224eAI2z7lYpRIUwtcgpYLX0NX3HkHl4Y74HHa6cwq9YAE0Ru3+pZQNe1gvKDUOYlukx
 jmKA5fuC3uwCga1BrqK5A8ce9ypVKLQ58yJ/85ZWYr+/maC+PQwFUkXou968214QcdzhZbdziYL
 7mrmDPoBQTbBjsg22ZL9fZOYXALegk=
X-Received: by 2002:a05:6a20:3ca5:b0:3c3:a31b:3949 with SMTP id
 adf61e73a8af0-3cbadaf4a67mr29455251637.11.1786314961269; 
 Sun, 09 Aug 2026 15:36:01 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 11/56] disas/riscv: Pass rv_opcode_data pointer to/from
 decode_inst_lift_pseudo
Date: Sun,  9 Aug 2026 15:35:00 -0700
Message-ID: <20260809223545.730664-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 47fae7316c..0be2f07612 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -5358,21 +5358,22 @@ static GString *format_inst(size_t tab, rv_decode *dec)
 
 /* lift instruction to pseudo-instruction */
 
-static void decode_inst_lift_pseudo(rv_decode *dec)
+static const rv_opcode_data *decode_inst_lift_pseudo(rv_decode *dec,
+                                                     const rv_opcode_data *op)
 {
-    const rv_opcode_data *opcode_data = dec->opcode_data;
-    const rv_comp_data *comp_data = opcode_data[dec->op].pseudo;
-    if (!comp_data) {
-        return;
-    }
-    while (comp_data->constraints) {
-        if (check_constraints(dec, comp_data->constraints)) {
-            dec->op = comp_data->op;
-            dec->codec = opcode_data[dec->op].codec;
-            return;
+    const rv_comp_data *comp_data = op->pseudo;
+    if (comp_data) {
+        while (comp_data->constraints) {
+            if (check_constraints(dec, comp_data->constraints)) {
+                dec->op = comp_data->op;
+                op = &dec->opcode_data[dec->op];
+                dec->codec = op->codec;
+                break;
+            }
+            comp_data++;
         }
-        comp_data++;
     }
+    return op;
 }
 
 /* decompress instruction */
@@ -5464,7 +5465,7 @@ static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
     op = &dec.opcode_data[dec.op];
     decode_inst_operands(&dec, isa, op);
     op = decode_inst_decompress(&dec, isa, op);
-    decode_inst_lift_pseudo(&dec);
+    op = decode_inst_lift_pseudo(&dec, op);
     return format_inst(24, &dec);
 }
 
-- 
2.43.0


