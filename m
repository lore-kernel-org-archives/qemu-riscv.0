Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C41C7EE2A
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:41:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H7T-0001cv-QY; Fri, 02 Jun 2023 22:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Y-0000YU-7M
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:58 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6G-0004mD-Ow
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:56 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-399e9455e9fso2055648b6e.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759679; x=1688351679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u69UQkBy31b+t/zyg2gVlBb3lh+xndEyIjHtbKZIvTU=;
 b=pWvCC9uQQxp9QIFTEsfnyKcJ00EqthHlH/bPANtGH3qmEF+6+kVSTbiHumeWYbky7B
 h1btG8baW59HZuI7EznMBCFaPhx76Zjpe0WBBiUtvr7NRfQ0oTD55o3bdgeS7q9+z/lU
 WnqNqRkFfC+yoOBPmSANLLq4MjxiFA1F9oSCCz3X7pnjObtCZDsUJr4+7/SJQ2CviIqZ
 JCyMEGR9WoIo+xg7SDJlpp3iMQatpPjKd7PBgb1hdYgH0OKs2ZTmNTNiKikD5oJZwoxS
 dT5MJzvzameFTkJATJZVzr//h3V39a1ccvj/vyIKgvfSS7BDJONUMoLQFoCFWfpsKR4E
 LDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759679; x=1688351679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u69UQkBy31b+t/zyg2gVlBb3lh+xndEyIjHtbKZIvTU=;
 b=Gr7japrpeKADLa9qjlX+AISiD24wsimZuMRAW6jrbjZ8eJdVMw4B5YhtdmfXwXrI2V
 P0TUyNXZTaVTCMCugTqUQ0A2ZEticxRJwXp+SLtvYgzkdYoJOTWiFWxN6yN7QCOaWoOs
 CNP6zjugHwI0ZI8Bj3/6xf8vbspfEXIbmi/ixJCVUfBuQPe4/QuTi49E/Mw6/Hyx2FX7
 J8E3YVAUOKGb63RmWsvjvHvpT+RiBJ8KOPJslDLyGwahT6TZUn0XJ4uF8+ZYFiBgyU63
 MErA/S9PAT0ZfJw7r9EgjA1RpCM1PQYznEL43AC4TN7bCFzmvOVBzMUco5ZQL2Zp5wZE
 vZnw==
X-Gm-Message-State: AC+VfDwO8VjFQusvOSfDb9TILGDuBhtW0MAfpnlWLv9wPc7JR/R491H4
 sU6BFc+1oZvU9EV+WC8ygcux0A==
X-Google-Smtp-Source: ACHHUZ7r9IRsVMS9yA2yj0TeW8+gY2GeLrmqqaeWPJI92nKgHGOLBphGZm3sdAk7QfefIHztRJCEDA==
X-Received: by 2002:a05:6808:649:b0:396:63a:a715 with SMTP id
 z9-20020a056808064900b00396063aa715mr1698260oih.56.1685759679191; 
 Fri, 02 Jun 2023 19:34:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 13/35] target/ppc: Use aesdec_ISB_ISR
Date: Fri,  2 Jun 2023 19:34:04 -0700
Message-Id: <20230603023426.1064431-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This implements the VNCIPHERLAST instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index b49e17685b..444beb1779 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2979,13 +2979,13 @@ void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 
 void helper_vncipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    ppc_avr_t result;
-    int i;
+    AESState *ad = (AESState *)r;
+    AESState *st = (AESState *)a;
+    AESState *rk = (AESState *)b;
+    AESState t;
 
-    VECTOR_FOR_INORDER_I(i, u8) {
-        result.VsrB(i) = b->VsrB(i) ^ (AES_isbox[a->VsrB(AES_ishifts[i])]);
-    }
-    *r = result;
+    aesdec_ISB_ISR(&t, st, true);
+    ad->v = t.v ^ rk->v;
 }
 
 void helper_vshasigmaw(ppc_avr_t *r,  ppc_avr_t *a, uint32_t st_six)
-- 
2.34.1


