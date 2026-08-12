Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32602C5DF66
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:36:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUK-0007B9-G3; Wed, 12 Aug 2026 18:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUI-00079l-7h
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:31:54 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUG-0000vW-Om
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:31:53 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2cace91f112so1632895ad.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573911; x=1787178711; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b/E6Fwaz35a68K1w+UujJny6WBEZEooLAdbD+72JhRU=;
 b=cChw5LAMMnPiwvddQDfIXnqgg/SXgpqbXfTM7tnU95C2ZF/zp/K9UVJ7lT7/QjVvyP
 je7EVgxWpxjqBMvRRxrAuoZpWRUHiwGDciI1s5ld/gqqXjyY5OWfAkQF6krQtGKaYtW6
 le91N0Hz3cnv4a1S6MmxDXmrnitUzmKcNsZSLtAaKa4r8XtTTHw8vFCwbeaSCLZL4dK7
 kyHFbJE18XJxA17q23JFDzT4KIQGckP8MJymPHRaiimmQCXH/drovCX4XHigWsA+7OLK
 x6KV3BxJrzWfnI8VIO1H2QyziK2hY/q3SU1sraEAPKK+Qi1jz8x1OGnCa9x7I8uJUFQl
 4PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573911; x=1787178711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=b/E6Fwaz35a68K1w+UujJny6WBEZEooLAdbD+72JhRU=;
 b=BCvIVDD3Piv0SF3bSNM6NhNpCXd5IdRNhnStfQiLRjxgV0+wnzuBn2gEJ9YUBWzpdk
 /aRrlXme38RTA6a5CJuSM7VWP4OBtC5lJBTrc7WhCDNv8bGiuFuL74oND6C3zNSdX/Cb
 L9xGjxcBg/Vqi8PLUCyHF5b7kzQhVufHBOZQkAEE6qUqIpvloktyN1N0gvgrf8/Wdj3T
 73BfWDqaI3ahSXGfuTsfBNbQlkKvf+m3UxZOb3I7gvLzSq0Rp6/2BPRAwAdyDDfqlorK
 47mz7q48csAvJ9lcuRWbiSW1KvtyCzQXiFJOiwdyo0xdyI2XeFuZJ/YW6+eSX5RryUSS
 2fQw==
X-Gm-Message-State: AOJu0YxwEEDkg6jR6aErldE/bGkOiig5PpW2aBJmf6DcfWloLjcnQzB7
 xxMzBw41SmzoFGqZxNIVGIbaa2zFjuL69WDnwbLOnZEiQupedJGEx85U52HTpJAxkfs=
X-Gm-Gg: AR+sD11zERguzFC9qvQTvhwNiOcTxz3Wq9SG9fLOgJPzdv3n50Sk+Xhj23ztPl6EdKx
 qIJKsK1jEwuyneqa8KpxBCA/ZkG2WdhMeg9Sj+DAXeYeJhEqj6nbsKjYeOoAqXTd9EEdcm8zlVS
 7Rg/uHfK/Gs8k8DPWh5drjXrqqM8qaEn3ur3a1m2Wu4jNaRLNzaF46BNaUBU49MMcym8Hha3BHp
 YRx+B+ZuO9QQbl80OOiGZwOIl6Kf4Sg6pD6NMBcA3mgiWmExC4lALzWVjP+q8tfvQVkWxv0vA7H
 BaMVz9Og1EC+YcHe7Nz0u0cvHT9KUSO6//EpxtuUgmeMAmNJszRdn0sPzYWNovbd3+VYHq1+ED2
 +5JbiGL3OaPa5G6e5I7f/pjsDJx2ZlyOo09279qMaKv3K3co+DPSVgBhe8uaJ1pdlzS7L3HX2Ec
 NBFotPsJRcPngUWSfrr7W7BpYClJVLnqZWZ/sCV40gUKeZiiLX7EfKtktiOq8aW4PEIP2OoJMMA
 rhL3nAHPXbEOJFbp1temw==
X-Received: by 2002:a05:6a20:e211:b0:3c3:8651:b302 with SMTP id
 adf61e73a8af0-3cc553a08d4mr1594036637.28.1786573911090; 
 Wed, 12 Aug 2026 15:31:51 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:31:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 06/52] disas/riscv: Pass rv_opcode_data pointer to/from
 decode_inst_lift_pseudo
Date: Wed, 12 Aug 2026 15:30:56 -0700
Message-ID: <20260812223142.349142-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


