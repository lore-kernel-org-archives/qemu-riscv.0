Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544C7C5B561
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:43:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtCBD-0005ra-Hi; Sun, 09 Aug 2026 18:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCBC-0005qb-7d
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:42 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCB9-00082A-9l
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:41 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-382ef647e20so1263116a91.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786315178; x=1786919978; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5DQbRX5f/62CNinSFDzMgqzdrZpodmgnCW/Zss7oPVw=;
 b=EGV05ZvFGCAtGbwI7X10VXMPbXUnrFlz4n9oC9mE1kJ6Q0qib3wbXdTdx1D6QuHk33
 UAlmZwMF5idklplrZOFRMNKKY3toopHk6Qp5CRRK3AWqbZqu3zld2f0yOaLu6wNROcg3
 /+2itht6Z33znJllcxBqcU9HaQJrgudt4NSc7iOVLBR/xt1uN8u7JivFteKO8wma/PZp
 26zYg881tO+X2Y2mTDRpfBFxbx8zLhY6uvVH9kO+/811Zl6Yl6rpowUl5Yk0R58zGkpU
 whoT2QwJ1rSFyHvUB3WzMdFEgTDBWrFFklZE7pfc33RMYCD1Rlv0szcIGkNV3t6iQhLe
 XeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786315178; x=1786919978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5DQbRX5f/62CNinSFDzMgqzdrZpodmgnCW/Zss7oPVw=;
 b=mF9JavtKEXvVWzZad50u6VmqLd3xVzBSZGeX5eJfpjAa+ZPRZ5JMz7EmcF+JiMWm5P
 0AKc3vtJBHUOUz3JNX7IhJ7ldBqHTAcIvMc1I07rzlNbVdPmjOn8JXXsvmuQa1NW/ABS
 VMQRGVsQX3JzAivqkAibsn1zQwWCO2GO07ioTUArJWEN+sVwHCG35ObxrgzXH1Xpqm11
 sVVQLYne2ZK9KE8ua6AUviPIAsMGmUXqpiw7hqExNO8asyrHXj+jVD3c5ObdItUc52Ba
 Tp8UEIVwvNzUTqYeEAAJ18SDBIJ+cS7ZH2Vj8ZrxAxVy0qUHJoZQH9b2BToHoGWWXu2N
 l2EA==
X-Gm-Message-State: AOJu0Yz5yOGPc7KwaIhMDMQLCaoOMMxJhFRsH9Us7iC7XIfEihWnheG/
 txB/QuwiN/fOfECtujd1onnRVzQKfgXZIWExfrAmMdUFX3U2k5WnoFrFjBdbgUSml7Q=
X-Gm-Gg: AR+sD11rjDIw6Nc4jf1j39PcQZ0Tuit0U24aCyymvnFz2jntjHPp3icGL355jAZm4e8
 dg2/G6uYTY+QqyXisWgb7uT6gEU/O4F65zUHnNyIZTVQ8J2MB7KXr5QHBoPs6foSgmwHK0LuJNs
 WqykrQEv5W/axDzldHMJunSNPEgq8L7h1qFckcdTy7ii0L6cEwokYsRal5LDLMDLF/HHfABYs5c
 eOki4ZuvWMLdzczFbZHULfUpjeW+BnQ1NVfhtAdWPYQ+H/MpV/+RQ+BpX7GsxneXnOZkzExb6kZ
 C9Pmz6ZclUJ7SMILQc0XXjaFiuiPNip//DeV5/FPHJM0ea686z8xIKaxr/5qKYFO/0ftT1AHiUZ
 E33sxQlxNdyvZbQw/SjrvSkGnDDa4cOUvQYvPB1RoFLMo6zIBjS6GWy99QUgLFR5SGUhDpNBRVe
 PvCCUp+8SxaPvVEaUFHjfye3rBkwHyCZf13tyccf8l/fqWl/Hs/Q5+Bhx2WDZ2rRDsuHuM9Nn3F
 5E+q35isTydaMDHJ61/
X-Received: by 2002:a17:90b:1d8d:b0:38f:5869:387b with SMTP id
 98e67ed59e1d1-3903c56c2eamr35641523a91.9.1786315177588; 
 Sun, 09 Aug 2026 15:39:37 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-390b1573defsm4264430a91.1.2026.08.09.15.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:39:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH 42/56] disas/riscv: Fix rv32 encoding of zext.h
Date: Sun,  9 Aug 2026 15:35:31 -0700
Message-ID: <20260809223545.730664-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

For rv64, pack with rs2 = 0 does not encode zext.h.

Cc: qemu-stable@nongnu.org
Fixes: 02c1b569a15 ("disas/riscv: Add Zb[abcs] instructions")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index f51d45674e..9442a6c115 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -3506,9 +3506,10 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 14: op = rv_op_rem; break;
             case 15: op = rv_op_remu; break;
             case 36:
-                switch ((inst >> 20) & 0b11111) {
-                case 0: op = rv_op_zext_h; break;
-                default: op = rv_op_pack; break;
+                if (isa == rv32 && !((inst >> 20) & 0b11111)) {
+                    op = rv_op_zext_h;
+                } else {
+                    op = rv_op_pack;
                 }
                 break;
             case 39: op = rv_op_packh; break;
-- 
2.43.0


