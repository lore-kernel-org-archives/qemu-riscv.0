Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A136AEB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:09:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGGRb-00030u-Gv; Mon, 03 Jul 2023 06:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRW-0002ri-4q
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:06:03 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRG-0005sw-Nv
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:06:01 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-313e714342cso4951548f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 03:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378745; x=1690970745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+lOYUQGr/W2hN41A+MbMW4B7XkhWFliC6iC1qe2q7c8=;
 b=FKuTLHWnU9cGz6omANfyTbx8zbAbdvn63Os5v9VbhwZhASRSUR2tyIvnBhtIFLYHDm
 Thf89+6pNW5dlV6I7QNZb4gEpoFGx9eGjUakyzPg2xxzZK2hq7uXH810IO+tS1cs3Zvf
 Tn7S3sgB3mQgCVEEI9v1wLzVn1KboVaifNSpwOuHKSjQG2378fvcz5nwDk+YA+3JKS+d
 x0vw0vnhKVZyanEFyHexz+E4upOvJ3W7xpSDOnuJiqj8b9DudL2rwjrML1fuqLCIIJEb
 MZXziao5U0bSHyWmnUIwlrLbLWSDfXu0tPblAUL7oxnK/2w8jfmDEN4NVW9/XuoY8cK5
 Ajmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378745; x=1690970745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+lOYUQGr/W2hN41A+MbMW4B7XkhWFliC6iC1qe2q7c8=;
 b=C0YM4dRPkO4HBLU5rtWsjG0aMS8ftLHeRbHUr1XXb74Y2qPDObX3me5VoXN7Q9bpaE
 3yU/H5umSSHeYc0CJqyrvLiJ4UQQCuouBx93JFAX0ZuM0owDxofIrjQl1noRrcsZcHEo
 y6sBoKsz446iB44TDnzrjr1HVItweE4B5Qzu7S8WV0AE/G75/uOYzHTzYvwE1w9KINS0
 XSO4/1JESjW85ZqxllUrc6+YOtXgaHKjhhcljTYskp2iJhxsN3kAo6EuHU9k4kl9dxYO
 XjqVlYyEddIdK+1sP8G/6VoHX+32WV2/Y1iD2VWgevpN1K35T+gZSPFzftSsSm03WX81
 RN6Q==
X-Gm-Message-State: ABy/qLa09tZ6Yt4NPVbhbgZen3IVPRDMvhg6kRSkhekoHzfDeRSSoCDg
 yRyAkzYbECuGuNzsu7Z1AcLXUw==
X-Google-Smtp-Source: APBJJlG7MmNJ+XFAFY7OAEYCvWeKq/k/Oi3Gk1+mNc85Dt9XPLyocoRo4OIBoE9779WgLq/MNVphqQ==
X-Received: by 2002:adf:fdc9:0:b0:313:f399:6cea with SMTP id
 i9-20020adffdc9000000b00313f3996ceamr8276715wrs.4.1688378745288; 
 Mon, 03 Jul 2023 03:05:45 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 21/37] target/i386: Use aesdec_IMC
Date: Mon,  3 Jul 2023 12:05:04 +0200
Message-Id: <20230703100520.68224-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This implements the AESIMC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 0a37bde595..893913ebf8 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2215,15 +2215,10 @@ void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 #if SHIFT == 1
 void glue(helper_aesimc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    int i;
-    Reg tmp = *s;
+    AESState *ad = (AESState *)&d->ZMM_X(0);
+    AESState *st = (AESState *)&s->ZMM_X(0);
 
-    for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = bswap32(AES_imc[tmp.B(4 * i + 0)][0] ^
-                          AES_imc[tmp.B(4 * i + 1)][1] ^
-                          AES_imc[tmp.B(4 * i + 2)][2] ^
-                          AES_imc[tmp.B(4 * i + 3)][3]);
-    }
+    aesdec_IMC(ad, st, false);
 }
 
 void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
-- 
2.34.1


