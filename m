Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F38EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 17:03:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJGkv-0004dm-Kd; Tue, 11 Jul 2023 13:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qJGjx-0003yq-4H
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 13:01:30 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qJGju-0001Mv-OU
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 13:01:28 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-55be1ce1669so3037079a12.1
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 10:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689094885; x=1691686885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1oZkJQHplNAwH2l91ru6TjT43Lp7+mYRxhkqeBvjMeE=;
 b=kEl1JFeMm7RGmr4ukiUPTXcW1KPBW+XprAjv4agfVO74rKbVlbUh3qKfgvT1FXvjoF
 4p3B+s4mPfhFHSe3m4yQeMR8sQjtul9yIAgpYfJuPqxk7lYhiwmivABRSLVoLPPrxQbc
 CmONXiKOGLsiAOOGE/5zuxApESMG4e+lilmPMg9QRH9wCnPfUhkJAXSv76rnPVD69Lxp
 ola4w3CRdWTQhQjWqIodupyraS904xE+F1gUuv5J15DX6UAfOQVUJHrmYjb5XQ2Vqrtr
 MHcKIvPDr5Uy6Umgipwzl6C9T0yA/SwmKOKpxCeK3oOd+PVUTp2MGLicG2iCVhLO6G2V
 4ePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689094885; x=1691686885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1oZkJQHplNAwH2l91ru6TjT43Lp7+mYRxhkqeBvjMeE=;
 b=I0iPL7lSbUVJhpvHq4vHIhSlssPWd2jyRZIvO8fh7Jbv66U7eYCPzYSjlP0rKBm0lH
 PdJhmvn+g2abDGyr5uHbf2AnCa6miijgYKe6snMizl9rIh4XUqz5mfdsX2TwZ9S2e5Jh
 4ha4MxNvudMx5yl56wrU7vnecvgZPlRGX3JJUhISWqDNB2tZcvXxk9qtqK7458ru4EQX
 v/SYh1n/770M6cLhnZ8/3PUGicwSIBso3SPJWQ6EkvAL69fRP1q/aGs7CqlL2OG51TlB
 CQtFK9rRZnPZnR8ejJaodZXUdO45Ax1re3svswh/TSp1Sz838rf3u+4Z/W+iS7ydoVX+
 Yq+w==
X-Gm-Message-State: ABy/qLbH2UeS2kgCBefGYejmKhmDY/SlPRGxQtiDG3d6x62S5/JfUAgX
 7g7R2o2dK8Q9R5CdrP3yqLteFA==
X-Google-Smtp-Source: APBJJlH3NZIwCPvnsXM8LS7iaLqkFETaYhdXjp97+Abxqjem+DB1cuNPqdt8R81uY8gwi8dz+l7okw==
X-Received: by 2002:a17:90a:6fe1:b0:265:8184:5903 with SMTP id
 e88-20020a17090a6fe100b0026581845903mr10043581pjk.40.1689094884969; 
 Tue, 11 Jul 2023 10:01:24 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 gw10-20020a17090b0a4a00b00262fc84b931sm8381793pjb.44.2023.07.11.10.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 10:01:24 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, alistair23@gmail.com,
 Max Chou <max.chou@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v8 13/15] crypto: Create sm4_subword
Date: Wed, 12 Jul 2023 00:59:12 +0800
Message-Id: <20230711165917.2629866-14-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711165917.2629866-1-max.chou@sifive.com>
References: <20230711165917.2629866-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x52c.google.com
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

Allows sharing of sm4_subword between different targets.

Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 include/crypto/sm4.h           |  8 ++++++++
 target/arm/tcg/crypto_helper.c | 10 ++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/crypto/sm4.h b/include/crypto/sm4.h
index 9bd3ebc62e8..de8245d8a71 100644
--- a/include/crypto/sm4.h
+++ b/include/crypto/sm4.h
@@ -3,4 +3,12 @@
 
 extern const uint8_t sm4_sbox[256];
 
+static inline uint32_t sm4_subword(uint32_t word)
+{
+    return sm4_sbox[word & 0xff] |
+           sm4_sbox[(word >> 8) & 0xff] << 8 |
+           sm4_sbox[(word >> 16) & 0xff] << 16 |
+           sm4_sbox[(word >> 24) & 0xff] << 24;
+}
+
 #endif
diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index fdd70abbfd6..7cadd61e124 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -614,10 +614,7 @@ static void do_crypto_sm4e(uint64_t *rd, uint64_t *rn, uint64_t *rm)
             CR_ST_WORD(d, (i + 3) % 4) ^
             CR_ST_WORD(n, i);
 
-        t = sm4_sbox[t & 0xff] |
-            sm4_sbox[(t >> 8) & 0xff] << 8 |
-            sm4_sbox[(t >> 16) & 0xff] << 16 |
-            sm4_sbox[(t >> 24) & 0xff] << 24;
+        t = sm4_subword(t);
 
         CR_ST_WORD(d, i) ^= t ^ rol32(t, 2) ^ rol32(t, 10) ^ rol32(t, 18) ^
                             rol32(t, 24);
@@ -651,10 +648,7 @@ static void do_crypto_sm4ekey(uint64_t *rd, uint64_t *rn, uint64_t *rm)
             CR_ST_WORD(d, (i + 3) % 4) ^
             CR_ST_WORD(m, i);
 
-        t = sm4_sbox[t & 0xff] |
-            sm4_sbox[(t >> 8) & 0xff] << 8 |
-            sm4_sbox[(t >> 16) & 0xff] << 16 |
-            sm4_sbox[(t >> 24) & 0xff] << 24;
+        t = sm4_subword(t);
 
         CR_ST_WORD(d, i) ^= t ^ rol32(t, 13) ^ rol32(t, 23);
     }
-- 
2.34.1


