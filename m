Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWOA-0007ME-RJ
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNA-0003qZ-6J
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:28 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWN6-00074k-Sh
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:27 -0500
Received: by mail-pj1-x102d.google.com with SMTP id l1so4915669pjt.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pbVY1YRte3qR5fLZYESRSG1NLBaIN6wrPtZwVv1o2+w=;
 b=Y2IPbJksQGxF2PSh23bEjGAI9C1Jhl6nAcH1ozPNe+Sv4mz35dJzDlRHRKmuRd/WSA
 ZktUPd20LwGAYEOa5MPpQtAcgYtM62xgdNlj9mbedPWgQEL4kfEJv2jIqqlNh6PRgRGg
 bOwJZqL+Q9qulBIOJJXXZn40wBlYc2Y3kCVDDuL4VavsfMMg2qh3Lw/fA81dynCqwgK/
 QsaCXSqNxzbBwVRcSwaA/OyenjIFOYQorXrnXl4oOS2zcw34BS3PptQ6/qvOK3EcWk28
 +zLDgn6MaLZMN3zp7JAq+8GMGm1jbASAUws3mzcFAHnCsOI8B523h6i393LjuDTdgLWs
 8F5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pbVY1YRte3qR5fLZYESRSG1NLBaIN6wrPtZwVv1o2+w=;
 b=vbAURA2h7fwwqfbsa2MCwP6L7aHZsOQJLX50u/E3AG7cS218FVxPsslyCHPedAsa85
 x1Y9Zw/GgsD2oFkaM+DFzQuGU6sXhFK4lOuvk4GIBo6cjotfSxQed1vEPqpxt3uqqBds
 qZ1BNuhKV8QjfTeKXOUXxlAwTVioyJX866tZmYc+zJEd68Po55i8xJGWTuQ10NmLVMgq
 TIreSMfB2ZXztjLx8uV7KMlObOtQHkt8TGZi0BSiftltnVbqAVGt153hSPl/9Rg8trEP
 VQMh7igKPkRQUGCHOV2/naMcErgxAUVbXboosfUhBnofDg08uSjJs3DPO2dXL6PjzEG7
 gKTg==
X-Gm-Message-State: AO0yUKWKEkwCu7tvV2662J7j+6zEgUnpjP0gb9/sQZH/7o8X6nV08JBx
 KKsMreaNkSNWzJ8x/dFLrFx2+w==
X-Google-Smtp-Source: AK7set/8rqhfQmNbYO60vvJk8pYINrcvsMrIz/hrG2j4g/bv5dMg0BnZ+tSUR0UO8/KmjuUKnwSTsw==
X-Received: by 2002:a17:903:189:b0:19c:df6e:6aec with SMTP id
 z9-20020a170903018900b0019cdf6e6aecmr8702614plg.7.1677476903767; 
 Sun, 26 Feb 2023 21:48:23 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 60/70] target/tricore: Drop some temp initialization
Date: Sun, 26 Feb 2023 19:42:23 -1000
Message-Id: <20230227054233.390271-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:48:29 -0000

The temp variables here are always set afterward;
the initialization with a constant was discarded.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 6b7b876808..71c8f3d568 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -6906,7 +6906,7 @@ static void decode_rrr1_maddq_h(DisasContext *ctx)
     r4 = MASK_OP_RRR1_D(ctx->opcode);
     n = MASK_OP_RRR1_N(ctx->opcode);
 
-    temp = tcg_const_i32(n);
+    temp = tcg_temp_new();
     temp2 = tcg_temp_new();
 
     switch (op2) {
@@ -7388,7 +7388,7 @@ static void decode_rrr1_msubq_h(DisasContext *ctx)
     r4 = MASK_OP_RRR1_D(ctx->opcode);
     n = MASK_OP_RRR1_N(ctx->opcode);
 
-    temp = tcg_const_i32(n);
+    temp = tcg_temp_new();
     temp2 = tcg_temp_new();
 
     switch (op2) {
-- 
2.34.1


