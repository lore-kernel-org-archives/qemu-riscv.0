Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C915CC5AD4E
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:43:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC83-00013u-7Z; Sun, 09 Aug 2026 18:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC81-00010o-6e
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:25 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7y-0007Rh-PG
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:24 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-cbe827e3cb4so1248077a12.3
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314981; x=1786919781; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4bPEmz7kH/3j+nOpoForQfn3ij2ZSMJYOoJ99jLXeIQ=;
 b=NSxVARykI649jSHmaeFglD0sooTXMm9SXnOw1CcLzuno4b27YlamgN9K2woIlCgt44
 OPZMEUilA9naM6gcKswR0OfTtnlAC2v2ERn6TPufKgbOAdYIC84varElIFrFxInGBrll
 FnZV7pNd5tNUtZ37an1JyTbrS6JbYRUKRFtppbEiFA34SnoW1z/qNsAgq4p06R3HAa5E
 b7x2P17/KDOPy8kJyJKu3iilV6vvmQLLXUJlZez9CIezrS9YvvB4QLw/Ej0bBG4p44G7
 bGoXuXVD7L3SnPa9Cy8+SOFdJy5Um2IcOa8pdCQyKQVXpSKf8GrNrnUmMpfnZtpXneLO
 SSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314981; x=1786919781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4bPEmz7kH/3j+nOpoForQfn3ij2ZSMJYOoJ99jLXeIQ=;
 b=S6N38+PpNLX2GbI195TESJ0vQ/QPME47VVoYyyZxovdsKatel/mImDIbPREx/KFVva
 lSBb1oNwkzdcfox/1e5s/DnvSSC1gaEot8ck9Opd9QBnJIFl7ASg5KKcZudZPUzYuAC+
 lBEhptd/EVw5rYLFYCmIIGelA0uF3FlPJyftARqYYLvhoVEGbtva8f5oJTp4lYFV5Tg/
 F/Q48havBLHaQrpmJ1rGza6dOdMcvuep4GbOKsp5LB/Gacqajw+AjAKXpU41U0GOvxk2
 4dFuP6j7UMpUlX7oLEkXUYON4VfYsq4rV8qdeZA9Qi4gabCVaxN10gPf648l9U0bf2M4
 Yi5Q==
X-Gm-Message-State: AOJu0YzTZuEXUWhymr/+imK8J673PDBINS4zNNpaQlTmNhIa4tRELaSE
 kb8xWdAq3cG/Zyup6ToRJO717eQp0HZJbqT4tcrpiDBbpQZXcFL7PynL7TPIUVP0ECU=
X-Gm-Gg: AR+sD12TA+lwZ9ZDqqy7rVnAgC5J8ABvBBrJdtHzs8G3+qufg3Z/j4OLAGi7iJ/HIST
 skvA+KHy3OmUPpDIYNWSTl/JkuzAp56l2G3Ww5yIX2gqu0N0kmHdaNb4BBPedzFdYXHu9LdKHsN
 R+2/xeiWtPg28/vviLYprhY8lxr2zqgOTBr8xWYQ1TYz0XFBuwzprYnab6qztE8PBy31R5LfCcx
 k4eKc0qxX13I78rHqb1yyxe4kgON3FwSBqfLL8Oaf71BaHmp2et/nbQ2MKNqlp7vnOLlo0h1RY4
 GhU2fS1CB+2SqDCJqnu09Mk7Yjgo7t5zDj1EIlFqDlOTVs9MdbbLI2y1HQqnhirSs7+0eOXojB9
 jMooMHad/47JvO4XznaGas5lhJTTlghzuh4Q2BfPdSdN2HApRbVA1Hzim6C5fm21Qko68RHRNmu
 G3O28J2ES+n4HgJcpww/9U64583CtJCs21VSsdP0IhaFAXQM0tK6f/H7zLjTdwBgH6INvDi7REL
 WO3lV109ibXd4FprXSX
X-Received: by 2002:a05:6a00:1daa:b0:846:8b21:6304 with SMTP id
 d2e1a72fcca58-84f2dfd2c03mr41735046b3a.14.1786314981279; 
 Sun, 09 Aug 2026 15:36:21 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 27/56] disas/riscv: Handle aliases of csrrw during decode
Date: Sun,  9 Aug 2026 15:35:16 -0700
Message-ID: <20260809223545.730664-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
 disas/riscv.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index bde1cc6e62..e464b8b075 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1081,9 +1081,6 @@ static const rvc_constraint rvcc_frrm[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x002,
                                             rvc_end };
 static const rvc_constraint rvcc_frflags[] = { rvc_rs1_eq_x0, rvc_csr_eq_0x001,
                                                rvc_end };
-static const rvc_constraint rvcc_fscsr[] = { rvc_csr_eq_0x003, rvc_end };
-static const rvc_constraint rvcc_fsrm[] = { rvc_csr_eq_0x002, rvc_end };
-static const rvc_constraint rvcc_fsflags[] = { rvc_csr_eq_0x001, rvc_end };
 static const rvc_constraint rvcc_fsrmi[] = { rvc_csr_eq_0x002, rvc_end };
 static const rvc_constraint rvcc_fsflagsi[] = { rvc_csr_eq_0x001, rvc_end };
 
@@ -1166,14 +1163,6 @@ static const rv_comp_data rvcp_subw[] = {
     { rv_op_illegal, NULL }
 };
 
-static const rv_comp_data rvcp_csrrw[] = {
-    { rv_op_fscsr, rvcc_fscsr },
-    { rv_op_fsrm, rvcc_fsrm },
-    { rv_op_fsflags, rvcc_fsflags },
-    { rv_op_illegal, NULL }
-};
-
-
 static const rv_comp_data rvcp_csrrs[] = {
     { rv_op_rdcycle, rvcc_rdcycle },
     { rv_op_rdtime, rvcc_rdtime },
@@ -1761,7 +1750,7 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { "sfence.vm", rv_codec_r, rv_fmt_rs1 },
     { "sfence.vma", rv_codec_r, rv_fmt_rs1_rs2 },
     { "wfi", rv_codec_none, rv_fmt_none },
-    { "csrrw", rv_codec_i_csr, rv_fmt_rd_csr_rs1, rvcp_csrrw },
+    { "csrrw", rv_codec_i_csr, rv_fmt_rd_csr_rs1 },
     { "csrrs", rv_codec_i_csr, rv_fmt_rd_csr_rs1, rvcp_csrrs },
     { "csrrc", rv_codec_i_csr, rv_fmt_rd_csr_rs1 },
     { "csrrwi", rv_codec_i_csr, rv_fmt_rd_csr_zimm, rvcp_csrrwi },
@@ -4443,7 +4432,14 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     break;
                 }
                 break;
-            case 1: op = rv_op_csrrw; break;
+            case 1:
+                switch (operand_csr12(inst)) {
+                case 1: op = rv_op_fsflags; break;
+                case 2: op = rv_op_fsrm; break;
+                case 3: op = rv_op_fscsr; break;
+                default: op = rv_op_csrrw; break;
+                }
+                break;
             case 2: op = rv_op_csrrs; break;
             case 3: op = rv_op_csrrc; break;
             case 4:
-- 
2.43.0


