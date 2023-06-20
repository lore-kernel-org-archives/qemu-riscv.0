Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D957EB64D7
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:10:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZE7-0006ho-JD; Tue, 20 Jun 2023 07:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDx-0006RD-QX
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:37 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDu-0004Rf-Ly
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:37 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9889952ed18so348512866b.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259313; x=1689851313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5yB3KjFB+U9E0IGbPxBILX7NHTWOiWyWbVzWyod1A2Y=;
 b=vIDZqQ+4qe8OfzkAge7xCSI/gHQxa6IjBuJ2+qDZVO1bE+E4n5NoZ0KruDEvQ/iu4H
 vqsE9jdY584U3DIW4vSlMxtm8XPltTRgLUdvLmLZ/sqsK9qvXVhhbwQEAig9P6m/NWp8
 uhzXLFSJ3deDlq/aanAN4OMHQyj/O5T2rOD+fU5eDi1qqE25XM+LGwERs8f85PXNDSPB
 aLAEwfL/p6/0/1tOAPrCz4z5NFo74oQWGj8iOrrniysdXeW0Hult1A8QBAjWsYaa9m/L
 Q8TKjkEX2PUtQRVUxQ6VBdkC6TGjtOj9nHGAuzw4aoVYev5Qe8gfUjYDgBa+Z3WngMEE
 WRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259313; x=1689851313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5yB3KjFB+U9E0IGbPxBILX7NHTWOiWyWbVzWyod1A2Y=;
 b=i3a112tjTanzA9OKFFcw7dvjTwKyi/m15MzzdISEqnzC9EHut1gppx/lp1BWXCChaX
 NEA3RTrCUqmu7OqjBjjW8h/qSBXISdtGMbTci7vPghaCIzxp2d2VvX/fvlQ4k8B4sHXf
 jgzqX3ISHLw/x9btUC7KetGVoIqYedXnPB5O3BzyLqWo88CYC2Qh9t3G7WrDwZxNaG3a
 qgJC439MMqquyzj3INL/jy888sQk1XRuF+XPS8knIGHNUAC6HZ6uyDw3mUBNwHzxZIOg
 g9Wy2Dv7m6ZIgo8zn1cVKIy4zh/glMMSZuxuYbq6n+92GwOcnzJPoQQ7dAcMwcz54LTj
 aB8A==
X-Gm-Message-State: AC+VfDxlt6RhFQNayYs6T58HYr8fJTSsHA2UYjJExhvcS07RsHeBro4b
 thyVZsuWP3tkRVxOOvh0OXtKKA==
X-Google-Smtp-Source: ACHHUZ7i5k36M/kTVM2zRCSGP7C3AxZz7lcgP7R3n/Uwu/qqfgPGYSPaQ5UnhxDLBZQOyoOmQs36Kw==
X-Received: by 2002:a17:907:7f14:b0:989:1f66:e44f with SMTP id
 qf20-20020a1709077f1400b009891f66e44fmr1620173ejc.11.1687259313240; 
 Tue, 20 Jun 2023 04:08:33 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 24/37] target/ppc: Use aesenc_SB_SR_MC_AK
Date: Tue, 20 Jun 2023 13:07:45 +0200
Message-Id: <20230620110758.787479-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This implements the VCIPHER instruction.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 15f07fca2b..1e477924b7 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2933,17 +2933,11 @@ void helper_vsbox(ppc_avr_t *r, ppc_avr_t *a)
 
 void helper_vcipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    ppc_avr_t result;
-    int i;
+    AESState *ad = (AESState *)r;
+    AESState *st = (AESState *)a;
+    AESState *rk = (AESState *)b;
 
-    VECTOR_FOR_INORDER_I(i, u32) {
-        result.VsrW(i) = b->VsrW(i) ^
-            (AES_Te0[a->VsrB(AES_shifts[4 * i + 0])] ^
-             AES_Te1[a->VsrB(AES_shifts[4 * i + 1])] ^
-             AES_Te2[a->VsrB(AES_shifts[4 * i + 2])] ^
-             AES_Te3[a->VsrB(AES_shifts[4 * i + 3])]);
-    }
-    *r = result;
+    aesenc_SB_SR_MC_AK(ad, st, rk, true);
 }
 
 void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1


