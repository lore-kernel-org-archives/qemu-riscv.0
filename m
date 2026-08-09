Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FF1C5AD4E
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:43:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC85-00016M-EA; Sun, 09 Aug 2026 18:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC84-00015I-9o
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:28 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC82-0007TK-P6
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:28 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-ca12086c06eso929442a12.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314985; x=1786919785; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EJLPAArjo+b4mZX0YUBGxbAKFsWVbs3HKJdLpQDgENw=;
 b=A8OnpKz8GCw+GxVBF1KFFAn7DkIrpqgCU9Hwk1r994LPvgFe2yge8jgS48Y/vVnNqj
 Hb69yRMeucfO+lATjrGYHLoRXHdfzV2mflbMyn3xEVD862KLyWxVOKfZ8Bwksuywu45l
 vNJqJrbeuhNcsRMM+UkmXmfgdLs/UPG1DhK+IgPMEyOJWlVvW9eMJxPtbStUo+qY1W1I
 dwepP/4rwiDS114l0GDYXHIKAop4Pk90otHRYus6snQPXEYvz1Mr7EWz753KsU9BSSXA
 YkkTn7rrzOZaKvjw7ZQjqbQ7+sbz/X0mO3K0rRwD/3CdDU5jxoalLYut1zfavPR/BKEy
 ZozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314985; x=1786919785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EJLPAArjo+b4mZX0YUBGxbAKFsWVbs3HKJdLpQDgENw=;
 b=QzpFWleyPKkGMsCn/gnbKLd+M6JOjByAi8/kvyfF2PR70D9YM9ePyA3UX62TybN7hT
 XOsB6AtD4xMsOp3nYMJzcKL0UJ2TxYSVYeTqtXYxGMmW3HUxLcpshoVmWPPf5HZKGJiP
 eOzaqtKsla7Q9i3BPtoKC2nS33m2dgkGgmXmGg46LB5uFlQm4YPRkdqUPMwL0+ZnZtxe
 w131NkSwqXpBtQ/36zey33GpMIM9pIKus5sugH/dboLDFGpm5KaKF2yeVhpmjrI8VqHK
 Y3L1uZfmYzIUterN4dsMwafqcOgCaQY/GPzE9ifi//kkrB3gvbFz4eh/67pLjozkdgK3
 +ZIg==
X-Gm-Message-State: AOJu0YyOGlNo7rLD19o27dM+s2QkFplH+UpEUMDCSH84bOkaecL62uus
 QH72GQf7pxwRtRIwSE/McmpIL1nIg70U4psEmeL7JzYBJ04uL/yY+N5cXrBPPDj9wgNdIBhS2kq
 BLO0h
X-Gm-Gg: AR+sD10m6sRFy4ZCEF9RZDq96RyFs7c+GUG304dKLlDO6ozJ4YRdGfJEI1Hcj/8hIav
 bYmWCFpUBE0eXsTw28aswBWs/76woc6oiKQcMMETAKoO8v9CrEGfTOJifCOVkB0s1oNNmvCaba+
 0psbNXvz8zYwesSws7AMLDeUuvQ+BzIVEbfV6focLwpHOCqowPYkbv/vMFWGwjUqm5EepCVat5N
 vZNXhywRWCqHhGQ1cGZTLFbQfPYYFncf4qdIFzJ0YifDwwZDw3Zvu9Ro2miyaDiMgARzDTBDE0R
 OfX069N3/i4Evz10DUBwsg+2NXgjUdy1r5yiSCbswBvbZlqwerI5REKhO7U7qgiatTWTkN64F/V
 A0FXAyQaQo6zgy46zy7oXck3M/na/PjzbtKai9YWEZyhTGeB/9UVJLiq8OvvzI8NIkGjlrXAIXA
 mt7as+vtRLbQ2qIaBmpIgJmnjkbjiOV1FNDTAmtR4iKvc0K0O4/nroHYfaftz01NEGEk6EiR/dh
 3lbLlc8vasIuxHvXfBY
X-Received: by 2002:a05:6a21:9104:b0:3c3:9a7f:7307 with SMTP id
 adf61e73a8af0-3cbce8e599amr16121758637.24.1786314985300; 
 Sun, 09 Aug 2026 15:36:25 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 31/56] disas/riscv: Allow decode_inst_lift_pseudo to loop
Date: Sun,  9 Aug 2026 15:35:20 -0700
Message-ID: <20260809223545.730664-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Allow pseudo expansion to proceed in multiple steps.
Assert that we don't have simple loops.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index fe503b6cae..b8e5b124a5 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -5259,9 +5259,9 @@ static const rv_opcode_data *decode_inst_lift_pseudo(rv_decode *dec,
     if (comp_data) {
         while (comp_data->constraints) {
             if (check_constraints(dec, comp_data->constraints)) {
-                dec->op = comp_data->op;
-                op = &dec->opcode_data[dec->op];
-                break;
+                const rv_opcode_data *new_op = &dec->opcode_data[comp_data->op];
+                assert(new_op != op);
+                return decode_inst_lift_pseudo(dec, new_op);
             }
             comp_data++;
         }
-- 
2.43.0


