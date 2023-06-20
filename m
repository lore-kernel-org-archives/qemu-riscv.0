Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A00EB64DB
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:10:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZDd-0005zA-WF; Tue, 20 Jun 2023 07:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDb-0005uV-MG
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:15 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDX-0004Cg-7Y
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:15 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-988b75d8b28so257715466b.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259290; x=1689851290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fCbxuyj6w2doHmBool/Ak6eLq+V5O+przb+5Ur/gE60=;
 b=YYtZzg0emy5SVG6ME1rhnRbp7rAQK/JhH2856Pq2KTOYfxIG0rrn1o9wL6breW5A7c
 zLTRSZjgfcXeitTTY4Ksk6dBpPnDKxwCOiZsVf9oiyn7M5XCSS7FgFyAn2iL9TZ2doNG
 FRxszCJ48A/TwgEyzbY2iB+Und4i/ZZGvJgOMSwEclW9KEoh1/SlsyIzeIvOp00pTk3C
 cbFfcmt36UFGr/7aowxAJhxa76qHZWcwb6NrkWRQRYS5WvWZAT7uFBludEAPPB7gnQQV
 lr8fNrbTiWNeke9i3DYWn/Wy4ZYYUExdloCJl25lA+V4xmnZ/TYJi8OgDZDFRHblQ+Ig
 FyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259290; x=1689851290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fCbxuyj6w2doHmBool/Ak6eLq+V5O+przb+5Ur/gE60=;
 b=X4iTYbTZXIBphEgmstk0K1y7PVfS57tL8bnCS+wZVeVsFdOy/H5dvZ64PCpE9jjYAr
 RRFV7r9GdxOtD1T8sg0rZdKrpAsiyjv8qJLt5hxEcIt66xgoIfykgPBuoIMN4CT/bAVC
 7OpdivyY/bgK5z5w3dX37NKG7exVljrIx8xL52Pf9S3qLHf3A8kUduW3pUI85JfmWWHr
 JkMvRr2K9mRj3cEdimyKLiM+dnbqQFMUt38BcAKiDIIrtgA9LpLBGFZirEzS5PXWZ7Es
 KWHSY3zJDH/SJBWf3aTjAYX3D29iUJBVnb931xiVYc6TnHOska5+ptOjQaHzFK9vFnk6
 o5AA==
X-Gm-Message-State: AC+VfDwmXrOpUdEgS4l6tYXV3+XOjTTKaHIgSRRxuKvwet4MUecFr5DW
 6RzTTltVDR9waiG2F4olzwIm59zH0tsPDINIAJZ9/Tow
X-Google-Smtp-Source: ACHHUZ6Vlr5E0QAyi/AqQJLQI3uTRLVgjJDGZLkDPd2Pm7t4ySStptU6FkPkoapDxbbTK0jtLlcigw==
X-Received: by 2002:a17:907:c0a:b0:96f:d345:d0f7 with SMTP id
 ga10-20020a1709070c0a00b0096fd345d0f7mr10714764ejc.62.1687259289828; 
 Tue, 20 Jun 2023 04:08:09 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 06/37] target/i386: Use aesenc_SB_SR_AK
Date: Tue, 20 Jun 2023 13:07:27 +0200
Message-Id: <20230620110758.787479-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62e.google.com
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

This implements the AESENCLAST instruction.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index fb63af7afa..63fdecbe03 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -19,6 +19,7 @@
  */
 
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 
 #if SHIFT == 0
 #define Reg MMXReg
@@ -2202,12 +2203,12 @@ void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
 void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0; i < 8 << SHIFT; i++) {
-        d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i & 15] + (i & ~15))]);
+        aesenc_SB_SR_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1


