Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4E0C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:38:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUq-0007dA-EP; Wed, 12 Aug 2026 18:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUj-0007WI-CA
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:21 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUg-00017p-5G
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:20 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-848643382fcso1500583b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573936; x=1787178736; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ESOH/T2TcAfFYuXGLNTkhmv7CIu2QKJrGhscHmXo9TY=;
 b=BJrqleyypyMR7RpReEEWlDOSzE9KbUBJFZhmNpmdv19yqONko5ZHI1CCh6fTsoGuNW
 Y4VzF5zjQX5FpxUDCEIJDnjp8ku8XsMeZwrKAxAG+Y+17JJz41jwM5xHMUD99zgbSubk
 3kYgxk590U76r7XlxifH68i5IVXOQtX+Boj+hGUpl2oNn3OTDH8AaebFwMnucFIHM270
 A1iYqdpbrtoQDj8TMNwmlaovZxqPVKyprEuHUfeWScLszUSdDR6BZJ/0g0c+VCtEXzkA
 tWx8J9fFFkgwC66FuwDCu/rWz1oA450YerIqbhGcNBZNY0io4Fy75Mbn6fdCb7UUN9S9
 6nkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573936; x=1787178736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ESOH/T2TcAfFYuXGLNTkhmv7CIu2QKJrGhscHmXo9TY=;
 b=WvGRdbqpAtLFdGGpyQNoaMmyCXrjothqvC83v/PFCBqsi9h4mndNNwK1q9PSxUoPrM
 7D87RgBiq47xbI98j/giLtGDa9+HTTSmA+C7sOYBJLvFN3ZxnUpTJh3BkQ0noxvUNo3n
 DEJcx62A9WIFGPbVAl9QueTiX2M+grlShNThVcwTAf5yvoDm+6LokHLxhQ6aEc5+ORfL
 4dOzAoD8JLfP5PPkdrxQmGIDHTRj5dqFVMlk11qWDnb+ZcPgUdO48DdPT1XCeRdbkDfE
 u0NoTE7Chm/m9jIWHiNPVTSDHp4dhUUkWCqZWyZdBXEONNXjq6lCllWd7T8J7iIixHyi
 6HEQ==
X-Gm-Message-State: AOJu0YxTVL1fnb7+THYeE8HmNW6EG+rGibdlRiwf47s6FMiiODljKG2U
 sDTv5t+juANjoOsf8EK9pvLAY4OL3EmIaZMwOEfFQnQPdqcmQoyx3iBkpNdqjH+O7n62AWEUjP9
 H8JnN
X-Gm-Gg: AR+sD10jooKAV72B4k2y2pwXw5rzbc4AGS3BZabLzzscxYGLdJDCzfdwJTOxo4woIDa
 ayuosnNBroFhKTJ7Z5IFR3NbooacRK2S4NC6XbkSgORZoyGqVrzR9ibfRNGxsiC9NlshL3Bf0Kt
 9CJ3VbyCq1Yl3Z77lE1YGXkZ/Ehi2W0/1/ClYhWKlwDxof7zkbzBVagL/j0tGqI9AFrGRY+LNed
 OpU0oxnRoVPy9sI/zS6NezSjGbSytPELtslUq93KMlg5U5G1fq0yhlb1tSuGoMCTTSx3hZ3lp4v
 lTw/4c8g3c3XimvmOTVhFjoNp/8iS9gaKqKWcc/5wrYbGl8yZ0dSBRHftG1Tn5Icq52Lz4Q7cww
 ot3pErox3tkmULFb7r/XMutCPA8QkIgnfO2w5UqqZgrQK0084Q8cBYRWMUBh1dhDRTf5GfyLd7w
 AeMEafRJjfpxur3yGIWOSpqVyPaETiccq1L8I/kFQT+8ETcFXpys0BPQzAnPTE/7f+FVejh8YD/
 FjrpAyIUd6LzUBweUx4
X-Received: by 2002:a05:6a00:8009:b0:845:ebbf:e7be with SMTP id
 d2e1a72fcca58-84fc75d601emr1215864b3a.23.1786573936253; 
 Wed, 12 Aug 2026 15:32:16 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 33/52] disas/riscv: Simplify some insn decompressions
Date: Wed, 12 Aug 2026 15:31:23 -0700
Message-ID: <20260812223142.349142-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Route "c.j" to "j" instead of "jal", etc.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index dedd925077..342e2db3cc 100644
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


