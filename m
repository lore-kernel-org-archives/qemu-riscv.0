Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D5AC5AD7B
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:37:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC8D-0001Kw-LA; Sun, 09 Aug 2026 18:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC8C-0001JS-55
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:36 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC8A-0007Wc-Ij
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:35 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-84e04df8c46so1174581b3a.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314993; x=1786919793; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kYsIul/61IhCa6F/lTcoHSFIX3vKxxDLD588ZuPF2o8=;
 b=G4IRHYD7Trjd9bS6SRgEuZ44L4figRrGNkcwpj9IQXMnATXDLzELnLhWKdQgsf4EK2
 4UXYoeW2UPPFA1PPomSDnr7pwsd/fFcZwK3uRoMZRP25Lx33uggh1OIVs3xu+GUmX0Dc
 DIA5Rl8ZxdmIQxelgbspvqJWLh/PfMjDR9zTry6/Cogz1z9WEkc8tBS6pU0wPSLUwj5D
 zNsKFUJ0sKPCHwY2y7eTY97z8wTZeBHoMssPPh4YG7bCz4DcmPR+cduwLkphlFuxQfRM
 VrKUvVyWaTDCPVeBWeJy1/Dl4HNX9gD6h224LOlTMx45At8f8vwQP9Ae68vhj0pkBYUW
 eQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314993; x=1786919793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kYsIul/61IhCa6F/lTcoHSFIX3vKxxDLD588ZuPF2o8=;
 b=f6JtCzyujh4X1URYRL/UIM9/g7LSy+YMDS+TZ7FrrwRUg9usZ4zOaspJHJE+9ZV3Lw
 gP3ZF5B5DRDhOEzhIh3EDxyZ807KULlKobKnNIBVACGAnLoTJ+P+acASiAqyQg8ZR/uy
 Bv7+oZyGjPh5ESnpcrOg20aAtWmrr7wB3o4xcMpGkrldOdJkV88wxPHJY5kWdJM9l3b8
 KP1TienYci8y3qUOr1d7WMZCmVKmlbAwXdXXDKENqK2GNJCnMbnyOcDDjYGUKqDbHo2E
 ZkHcHxQ4ZhwsnLf26aMkB6SDr6L7Wi7IsgMuMMDqP9EW57oq1p7CEy0Wjxd6sysf1PSQ
 jEnw==
X-Gm-Message-State: AOJu0YysDFICZf1DOjjTb86v3z8/98mr/XLI7D+qvTqLjCoAKqi4DJBk
 5FZ8d6OPw/naPaMTL2rL6vL4tZGLhqkhQL5C9Mz+LaRGWCEJYFqCTdHfAKzI2eyc3HfjyC29Lvz
 ct5yb
X-Gm-Gg: AR+sD11sXjRGf2V0K959/E0Q8TGT3RrCFB5+Pl0QiFexjDDlWTx+vmveMYdlxQUU0pi
 xc1goMTpMOvs3+KP7YppAEFuu/ugE8X2prz1dsuvk2KYQLS/MRwlRdECsSXy69e2DZ8YKFn6HgW
 6SWXe6rdT8uP1X24m79UfQDo5bhvEXOD/0YWKJ1+oTOpVenLfkiqrNTb6IKy8gkdDUaoew75huz
 n+hJ+2lfYPq6uhbRyZIH8aZwsJ7kSj/54Y0sEnr+I/iCTkX4sz6uvFgK1ut8LJx6qchWd6TjcXa
 /q2ZRU3j04umeByQR0hzkbm59/f9Fsu1huNRtt2o6DskDBSX6H6P723lUGmJoQrVLDo6jG/LSRV
 dWml1zUYW+8dfU8p6W5lkVwRa06jLBgHGbJXtp/t2uMb19tMvTHC+065a3un7rC/rO2jlJPhT9c
 U4XVO4eJjZvox0o3UW7gSMC3XrB4viG97VQxRBzEti9yJ+odL78q1S4+m71MXhjlqlvHwC4MZ9K
 I6/qJ8YspDAe0tiG6Kv
X-Received: by 2002:a05:6a00:2883:b0:847:902a:57b5 with SMTP id
 d2e1a72fcca58-84f5e1149admr22553043b3a.35.1786314993157; 
 Sun, 09 Aug 2026 15:36:33 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 38/56] disas/riscv: Simplify some insn decompressions
Date: Sun,  9 Aug 2026 15:35:27 -0700
Message-ID: <20260809223545.730664-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Route "c.j" to "j" instead of "jal", etc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index fc821355fe..9a528803e8 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1848,15 +1848,15 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { "c.and", rv_codec_cs, NULL, DECOMP(rv_op_and) },
     { "c.subw", rv_codec_cs, NULL, DECOMP(rv_op_subw) },
     { "c.addw", rv_codec_cs, NULL, DECOMP(rv_op_addw) },
-    { "c.j", rv_codec_cj, NULL, DECOMP(rv_op_jal) },
-    { "c.beqz", rv_codec_cb, NULL, DECOMP(rv_op_beq) },
-    { "c.bnez", rv_codec_cb, NULL, DECOMP(rv_op_bne) },
+    { "c.j", rv_codec_cj, NULL, DECOMP(rv_op_j) },
+    { "c.beqz", rv_codec_cb, NULL, DECOMP(rv_op_beqz) },
+    { "c.bnez", rv_codec_cb, NULL, DECOMP(rv_op_bnez) },
     { "c.slli", rv_codec_ci_sh6, NULL, DECOMP(rv_op_slli) },
     { "c.fldsp", rv_codec_ci_ldsp, NULL, DECOMP(rv_op_fld) },
     { "c.lwsp", rv_codec_ci_lwsp, NULL, DECOMP(rv_op_lw) },
     { "c.flwsp", rv_codec_ci_lwsp, NULL, DECOMP(rv_op_flw) },
-    { "c.jr", rv_codec_cr_jr, NULL, DECOMP(rv_op_jalr) },
-    { "c.mv", rv_codec_cr_mv, NULL, DECOMP(rv_op_addi) },
+    { "c.jr", rv_codec_cr_jr, NULL, DECOMP(rv_op_jr) },
+    { "c.mv", rv_codec_cr_mv, NULL, DECOMP(rv_op_mv) },
     { "c.ebreak", rv_codec_ci_none, NULL, DECOMP(rv_op_ebreak) },
     { "c.jalr", rv_codec_cr_jalr, NULL, DECOMP(rv_op_jalr) },
     { "c.add", rv_codec_cr, NULL, DECOMP(rv_op_add) },
-- 
2.43.0


