Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4F5C7EE2A
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:37:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H7L-0001ML-TR; Fri, 02 Jun 2023 22:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6O-0000Qi-2e
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:48 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6F-0004gf-6Q
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:46 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-25692ff86cdso2203788a91.2
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759676; x=1688351676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4c8qUMHO4QYaPr2JjtCuB1xQVEFevNFHiNcj1R21h14=;
 b=epLYAXEJFNFefIqeqmEw3HxEbhK1dc99u8W+rGxuBQ6TmM8IZhSIqttR6r5O6sOLSe
 BIpn+Ukq7DyWdlpH9B5CFkpNIrjJuKCrI/WCCz1uGrzwZj3SUXrmI8Yxv9R+jtxzdtYj
 eigE1XyYZEkEiWsSZN0V7LZt6LP/eQZW8gryvvRDnQxjpAxY7tI1oh1ZDzQ+I8lGA81V
 h131LlsERljKLXk+qW1WGkZ6Dmq9tqtdV/s/6pBT4b7/YD/WH4fFR1yRfBpIU9j7FJBP
 rt5gTZtCMXqzo/6CLpPqwwUTpHg4qWPdej/Mi6+/FDfV9sAHp3w54fLr7bZ/2joDk15L
 DPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759676; x=1688351676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4c8qUMHO4QYaPr2JjtCuB1xQVEFevNFHiNcj1R21h14=;
 b=D5rEVL7FphOFYki4Zfp24cXEo1c1K8g5zq+BbnDnLRYxzjRPF5dabnormje5vE8Cps
 qkKlBQ+p2gst3PyUf6TGXh04OVBd7k9+W8qmoAiZh9EUXs38xUroMsp2hz1ThYQu7fkN
 iXFS8mEFRUOlXiPS9YmYXJhx8QWdSk731M1I4y/wqteHnGxM1v8wYyoLTeTSHX2gHbKA
 lW85LC6Zu0Lp9uwy3jWat1NcKPgqGkDgco9mIN5r66geYDO7ppuBhJTYgPNEIRTLWVoJ
 8loogmWw2XQEXYWFOGcxtBvnPq3Iy1PbeyUIgDkUcSHKyrnad/GD0ztwNYQoQyRkTDIs
 jg+g==
X-Gm-Message-State: AC+VfDwnfghpUiN6SYmP3kHcNnUpFjdsUqrPzpKxeOK7ADfxcbQTy1cy
 g9qH8kKMN/ibj3UI7GhbHV3Lkg==
X-Google-Smtp-Source: ACHHUZ5p+HRleTk4zZTiwTxFEbAtxJGH8+EhASTHYLIQy02mOJdABA0MRj6qheBlEfYP/snwmC55Xw==
X-Received: by 2002:a17:90a:c58e:b0:258:cb10:5e8c with SMTP id
 l14-20020a17090ac58e00b00258cb105e8cmr1541115pjt.20.1685759676727; 
 Fri, 02 Jun 2023 19:34:36 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 10/35] crypto: Add aesdec_ISB_ISR
Date: Fri,  2 Jun 2023 19:34:01 -0700
Message-Id: <20230603023426.1064431-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Add a primitive for InvSubBytes + InvShiftRows.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/aes-round.h |  3 ++
 include/crypto/aes-round.h            | 18 +++++++++++
 crypto/aes.c                          | 46 +++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
index 598242c603..cb4fed61fe 100644
--- a/host/include/generic/host/aes-round.h
+++ b/host/include/generic/host/aes-round.h
@@ -12,4 +12,7 @@
 void aesenc_SB_SR_accel(AESState *, const AESState *, bool)
     QEMU_ERROR("unsupported accel");
 
+void aesdec_ISB_ISR_accel(AESState *, const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
+
 #endif
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index 784e1daee6..ff1914bd63 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -38,4 +38,22 @@ static inline void aesenc_SB_SR(AESState *r, const AESState *st, bool be)
     }
 }
 
+/*
+ * Perform InvSubBytes + InvShiftRows.
+ */
+
+void aesdec_ISB_ISR_gen(AESState *ret, const AESState *st);
+void aesdec_ISB_ISR_genrev(AESState *ret, const AESState *st);
+
+static inline void aesdec_ISB_ISR(AESState *r, const AESState *st, bool be)
+{
+    if (HAVE_AES_ACCEL) {
+        aesdec_ISB_ISR_accel(r, st, be);
+    } else if (HOST_BIG_ENDIAN == be) {
+        aesdec_ISB_ISR_gen(r, st);
+    } else {
+        aesdec_ISB_ISR_genrev(r, st);
+    }
+}
+
 #endif /* CRYPTO_AES_ROUND_H */
diff --git a/crypto/aes.c b/crypto/aes.c
index 708838315a..937377647f 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1298,6 +1298,52 @@ void aesenc_SB_SR_genrev(AESState *r, const AESState *st)
     aesenc_SB_SR_swap(r, st, true);
 }
 
+/* Perform InvSubBytes + InvShiftRows. */
+static inline void
+aesdec_ISB_ISR_swap(AESState *r, const AESState *st, bool swap)
+{
+    const int swap_b = swap ? 15 : 0;
+    uint8_t t;
+
+    /* These four indexes are not swizzled. */
+    r->b[swap_b ^ 0x0] = AES_isbox[st->b[swap_b ^ AES_ISH_0]];
+    r->b[swap_b ^ 0x4] = AES_isbox[st->b[swap_b ^ AES_ISH_4]];
+    r->b[swap_b ^ 0x8] = AES_isbox[st->b[swap_b ^ AES_ISH_8]];
+    r->b[swap_b ^ 0xc] = AES_isbox[st->b[swap_b ^ AES_ISH_C]];
+
+    /* Otherwise, break cycles. */
+
+    t = AES_isbox[st->b[swap_b ^ AES_ISH_5]];
+    r->b[swap_b ^ 0x1] = AES_isbox[st->b[swap_b ^ AES_ISH_1]];
+    r->b[swap_b ^ 0xd] = AES_isbox[st->b[swap_b ^ AES_ISH_D]];
+    r->b[swap_b ^ 0x9] = AES_isbox[st->b[swap_b ^ AES_ISH_9]];
+    r->b[swap_b ^ 0x5] = t;
+
+    t = AES_isbox[st->b[swap_b ^ AES_ISH_A]];
+    r->b[swap_b ^ 0x2] = AES_isbox[st->b[swap_b ^ AES_ISH_2]];
+    r->b[swap_b ^ 0xa] = t;
+
+    t = AES_isbox[st->b[swap_b ^ AES_ISH_E]];
+    r->b[swap_b ^ 0x6] = AES_isbox[st->b[swap_b ^ AES_ISH_6]];
+    r->b[swap_b ^ 0xe] = t;
+
+    t = AES_isbox[st->b[swap_b ^ AES_ISH_F]];
+    r->b[swap_b ^ 0x3] = AES_isbox[st->b[swap_b ^ AES_ISH_3]];
+    r->b[swap_b ^ 0x7] = AES_isbox[st->b[swap_b ^ AES_ISH_7]];
+    r->b[swap_b ^ 0xb] = AES_isbox[st->b[swap_b ^ AES_ISH_B]];
+    r->b[swap_b ^ 0xf] = t;
+}
+
+void aesdec_ISB_ISR_gen(AESState *r, const AESState *st)
+{
+    aesdec_ISB_ISR_swap(r, st, false);
+}
+
+void aesdec_ISB_ISR_genrev(AESState *r, const AESState *st)
+{
+    aesdec_ISB_ISR_swap(r, st, true);
+}
+
 /**
  * Expand the cipher key into the encryption key schedule.
  */
-- 
2.34.1


