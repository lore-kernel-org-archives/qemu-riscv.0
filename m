Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1561BEB64D8
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:11:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZDr-0006Jj-UC; Tue, 20 Jun 2023 07:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDo-0006EB-2m
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:28 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDm-0004N1-AR
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:27 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-988a2715b8cso399585066b.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259305; x=1689851305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N6iXZSXnCLQtjnIuP74mgzpVObleAywaFeG7GQpsIEc=;
 b=mMudJ280WURUhhZmKay2iYZ9h9vgrmttnAvWPMP/4jlcK60Upjlc49YAB+87E9KHWF
 Sqp0bOS76WYhZqFArpqWbrwhR8COmtBNTvd3jMn7qj+XSbl4ScaYtOU67wf3Ee9Z/IXf
 UerTlc1F1XhT8XrVFkTke9w/rGYAwksa/2/FXxCqBnXPe3qiqdajFslIAentfo/Y/XPt
 gSD+ygd1xwjNyVk3NXGslRjljuLNCaGXAIwEeK3i+orClKp3Yiu7dZ2U9+a87d1jIQev
 qWVaTTB0hvxlSsXqRLtQaYOGNJPYtqPuFw1rBor8wNi+uxsM+epTjAzs8hfIZI+otkOS
 fgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259305; x=1689851305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6iXZSXnCLQtjnIuP74mgzpVObleAywaFeG7GQpsIEc=;
 b=KKUUa6hfmvXLciYXxXh9DNZQ1Gbj1bjDaiMGbWBsQfegowBnwFzS0dZ2+QF60f8rOM
 67060Xg3FbHsdfd+cXJEmszEaoaDhUdXBRS3ya9JgyOchWbLpRe5dcmHi7P06r5DB1Nu
 w75Q5K+0ItAiaYa0Mt7rqsyTarvwhrCjKRuB+PiiX99Ft6RJdPdItarClOq5pHZFzGrw
 nGwskP6D6wb/X8zZj6wQSPf0/2yYgJyB/HmznuPMUTLh2XVKCnkHU/0oKCKt5tCinkjP
 /cmtfgyfyE0v7ui+yzt/rJ1qEFD488xFUXYl4d7GbC6i/h3fagX4XfvNK97enhgEpu0r
 YiPA==
X-Gm-Message-State: AC+VfDxaeFeird8qPvKKTdOAGF/DZ/gJpUKJnEyUD59ZMkyne/djY++Z
 GynvXm5PjmDsU+cD/s5NpkwZY6m+p9ds3WFyEAzlEey9
X-Google-Smtp-Source: ACHHUZ4YlBogoIjFRLHlMlKCC/2JaymzBZkSHRbPnyU/kMBJq8aTrZ/7h7zSrSE8zMaGKW0uXGcSXA==
X-Received: by 2002:a17:907:7ba0:b0:989:4b:e69e with SMTP id
 ne32-20020a1709077ba000b00989004be69emr2732973ejc.4.1687259305002; 
 Tue, 20 Jun 2023 04:08:25 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 17/37] target/arm: Use aesenc_MC
Date: Tue, 20 Jun 2023 13:07:38 +0200
Message-Id: <20230620110758.787479-18-richard.henderson@linaro.org>
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

This implements the AESMC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index d2cb74e7fc..1952aaac58 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -124,7 +124,20 @@ void HELPER(crypto_aesmc)(void *vd, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aesmc(vd + i, vm + i, AES_mc_rot);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vm + i);
+        AESState t;
+
+        /* Our uint64_t are in the wrong order for big-endian. */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1];
+            t.d[1] = st->d[0];
+            aesenc_MC(&t, &t, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            aesenc_MC(ad, st, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1


