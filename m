Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFBDC5AD4E
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:38:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7d-0000jE-Mb; Sun, 09 Aug 2026 18:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7c-0000iL-IU
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:00 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7a-0007In-VX
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:00 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-cb5b8572b70so1314561a12.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314958; x=1786919758; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VukrFpkUNm4nthzSgzNlJ3ujYBfx48VnCBP4yqJMbWs=;
 b=LHvLMeq4ueUnTrcT4yo8HwxC8HkLHUT9VHeAl0WjTQruUFfKEaG+alZHccCxUZqBrQ
 mM0nyF0cUC+cBouio7n8VLbZB+w2kPB4b8zl/BDYPobhfLRPdeJLotwycse257rPheg4
 Esp6cT/om37efUz+AZBJeNIHSeT3Vdz8xvAUDqC7hvHZd9ZGBJ0cEbsnvkT6mkXAA2wA
 bNsHdLkxtG/rEQZgbpxFrl4jt25XqKypQTuOtImDUHVWTjaoeyypmJnHL0TIH/2PuSCZ
 liqn3jpZQlTE9rwlKrlED8Ag1ECSVoq+joD86FkbDEGOvt52xkLv89/lU6tXaVgUBoZW
 cKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314958; x=1786919758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VukrFpkUNm4nthzSgzNlJ3ujYBfx48VnCBP4yqJMbWs=;
 b=GoMpofVVgZQAYS/4cM6eAokrb+cnlekLqf0sifvJjJ1lJ6MsMQmTRL4Jv9qFFN9gtT
 pjd22CcEuusvyiX/Ys4h5p3UAmvEJ/ug0/HmEMYRbubtzcm2FexRei6PcO9f9P6SlaTF
 VeTbPEix42iLGPk13ixEsW1/dKCTcG05eFEYIhAv67aJTsBDGZfZnIGeEYKtPZp9qaJU
 b05qzJXh0Q35wRHK0pCXaPkhxFcvAWORFrbqVqNMHCRX/2CS205G7lFs7bE7z8hCy66Y
 cmHv9IM4Soc9RjclZzQt2590ialNs4qZlfGKa1vI8kw3YgjOmhk9x+/sy1LxDh1yieOQ
 kh9g==
X-Gm-Message-State: AOJu0YzIuJ92Zjv9jFtCAk8untEuit0PohACpuS+6JC78P1rOFmAxP7f
 E8odAHBUwxL+Yh8FKMazyU5qVla8ueoLS3OpLv2jWzpCNQ4ZABeGnWCeppYiU0Sv5UPoMoBZJJv
 BcJ6F
X-Gm-Gg: AR+sD11gbRGoXZhVNa5mgo0XPuvmjVgi1jmWIFYCIAyRfCXrM7MiC6P+XLgFPyR06He
 r602rcPHhezQI4SaWcTPJZz41MNfzzn3O+stkpNcdQjnVlpeZkbtW7mX4tPH83splgwVTJF0kPV
 5qVfdvE1vuqZuVtf/64roMxn2OOUJ7+6s8Fe6nnBPQ5Y8hZDFQN4V+qaYvLawRpqh8dP+G5Xxco
 gL5EEeSiXu4YLLhRoh7Sa7WJNTccDKkbFaxl41g6ZJZp85QRORwG4GClVYKVwxoDnJVY5xeIjyX
 jcIZOHFb3PdTjYJ1v1ygm1Ef8iqBPwgX1zbbQ2T/KnXqHcW+3zFeiJlLum/cOTDDFpuRLnbCx0H
 /QybNdqGKeCDauLPbQp1PPgH6HYlkghsKk44oFQFNhbhN3ndR4BPxM+5MsHShm3lf6Sau/5nCXb
 XWeSgx1z18RXGCiCW0U73iR/NLXt8sJnQQYSAycUkS3tU1vQJyOp6rCj+gU5I1NONG+T/QBFgQ2
 I8bO/4eH6HGASVvTDAx
X-Received: by 2002:a05:6a00:4652:b0:848:51b3:f3c2 with SMTP id
 d2e1a72fcca58-84f2e0dd0a0mr39726423b3a.33.1786314957563; 
 Sun, 09 Aug 2026 15:35:57 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:35:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 08/56] disas/riscv: Tidy dec initialization in disasm_inst
Date: Sun,  9 Aug 2026 15:34:57 -0700
Message-ID: <20260809223545.730664-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
 disas/riscv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 012f90fce6..986dc6b752 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -5441,10 +5441,11 @@ static void decode_inst_decompress(rv_decode *dec, rv_isa isa)
 static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
                             const RISCVCPUConfig *cfg)
 {
-    rv_decode dec = { 0 };
-    dec.pc = pc;
-    dec.inst = inst;
-    dec.cfg = cfg;
+    rv_decode dec = {
+        .pc = pc,
+        .inst = inst,
+        .cfg = cfg,
+    };
 
     static const struct {
         bool (*guard_func)(const RISCVCPUConfig *);
-- 
2.43.0


