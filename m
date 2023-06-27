Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1ADEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 17:31:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qECVs-0000TN-4x; Tue, 27 Jun 2023 13:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECVp-0000Rl-2o
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:29:57 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECVn-0000dC-Ay
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 13:29:56 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-517bdc9e81dso1694623a12.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 10:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687886994; x=1690478994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2i4C//+f+GUGaLVpvFtKlZSxEtNqEo8pMI1bJM7rlM=;
 b=Dyteo4u3j8oPLV9emsNA2k2lAwFKTTEbtFbJJHf6sFKKOM3jo/pGnWTfx8yx6qHcAi
 /++5Xh33n8uEVLFgqgE3YjfaZdgo+kPrlQ6hNI3zsQUK1hy/oGBq/cYkg1Iwm38xPP2f
 SiBqZCSVHRsWSOh2jiVDsVzC3LUV2AryKUKjrukyg08beh/8xdM7v51KPhjx2OCItuQ9
 jW0dTO73hdvAcUy2P5fz3iA6w98vdGi0biD17wkOELVYM3Gz/4qWKbZPms0S41YEKSxz
 F5eFE0bZP3lRHtaVyX6RucN2c6xIMv2UwQ6BIarnGY3urJuxsAJ8/O0H3N0Jv2tQ/ITD
 kK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687886994; x=1690478994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2i4C//+f+GUGaLVpvFtKlZSxEtNqEo8pMI1bJM7rlM=;
 b=Me+jFbLZ631nEboqncf0LFvTl3sIZzbC2/axqHrUYj4cBqm2A0ReE05jpP4/Iyhjd5
 itzNNa7I1AjVEr8ibq29HUUBer+G56r09WW/2DmM7nWlUmR6X6ODl2vT7w7VnRYeWJF6
 xlgz5x1mPb8gdb6Kpaxyd5eO9NUECCU6TCNgNDkrAu3Fw43aQ46lOV9cCnMvpkmVqXKN
 d5FDm4mJ3WlYqKg29F8mpLSp63+fmJtNo3lTrpl+zV/qTLa8wSY20xOM3VbleXr+w2B0
 x4qs7+B2R07GPMzGmtkSjTrq6OS04Dx16tdAvvq3OXhN2+HeCokHRhnw7KdLlfZ3tpXs
 CUfg==
X-Gm-Message-State: AC+VfDyho8MLmWLFakZrb3hBvGj6j2YwaYKD3a2AiOxAHrcDT79/Gv3c
 hNGzMa3mBo5K8BTPuv4cj/JRIgFtTlhI6Z6T5XrwXi0c
X-Google-Smtp-Source: ACHHUZ4ajTKM9T2rqps2Y6oyOapaTKjM+tPBk7aNexMWwzzSW4SbdFljBmCSSZ+EkM4+6s1aBGDSwQ==
X-Received: by 2002:a17:90b:4d8b:b0:262:f449:4492 with SMTP id
 oj11-20020a17090b4d8b00b00262f4494492mr4851093pjb.30.1687886993819; 
 Tue, 27 Jun 2023 10:29:53 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 z19-20020a17090ad79300b002631f3d36a1sm1461443pju.36.2023.06.27.10.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 10:29:53 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Max Chou <max.chou@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v5 13/15] crypto: Create sm4_subword
Date: Wed, 28 Jun 2023 01:29:03 +0800
Message-Id: <20230627172921.65040-5-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230627172921.65040-1-max.chou@sifive.com>
References: <20230627172921.65040-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x531.google.com
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
index 9bd3ebc62e..de8245d8a7 100644
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
index fdd70abbfd..7cadd61e12 100644
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
2.31.1


