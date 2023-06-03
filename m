Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E105C7EE29
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:40:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H7N-0001NY-PN; Fri, 02 Jun 2023 22:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6a-0000Yo-8F
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:35:00 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6O-0004qv-0G
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:59 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5555765c6d3so2132642eaf.1
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759687; x=1688351687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cUWhRH6bLO/8WDIHOPro6jgbCs/NIT/Ha8MzhIm17R0=;
 b=ybVZ1UbgBANik3IeRyPOgM0DFMDX83pd4yTUwLXnfBUiYNhHh97Bcl69uNp747T+lR
 EQ125jLTT1inn5vwgaWPfEvjUF7xJNCRPrBE5sUiy9aCfwq/vUmQ0bgQ3b8hAlWT4Amm
 L6xTqWLMaIRtaHpcm1hMOSxo1BgYpy2H6C9tKp5jgYtNYWDQSuGxVj64XPHvrIT02aEO
 0RcTuvIxplgTQ2k5Gl4N+rfp9pafShC18YhQIQ+U2LSKz2+lQFR3u1cAoeKG1PTeS8q8
 Hm8a/SmNQdk4SjxP2ka//7A3q6NF93mrJcSv0RX8L8ZQlB/mADuu8YggoOrkheXr2oRz
 nusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759687; x=1688351687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cUWhRH6bLO/8WDIHOPro6jgbCs/NIT/Ha8MzhIm17R0=;
 b=ZdVOlzQxpJLEbImg6g3Snfo8kNgWS+ArIe3YHssXEr2qNXv2SQqqgykr1yV+8NpomF
 wOAKQnm59d8dGCqFB98wjgI0sLASIEg5hiXdQ56cTB8VO45MH4VgfbmA2hlQ9pu2h4SE
 V/y+rxlgQkRfHVhTN/iip2QmeJjPdIG/2+kMcfeT5pSwQhHlayRocvBskoCwfMFUD29u
 vzYn78C9A8HHfTNJjJogO/yi1EPTfkEcRENTq2oP4m6EcI9ozpbeqGbp7QraY2mR0LsF
 6uED4zHMTBv4HcP9TVqerwuwbTn4Ou7/y2i3QdyMSAfCMfIu1qajRgn1b6Uor8viw0Kx
 Y28Q==
X-Gm-Message-State: AC+VfDxenxWqTWAgB/vXUzbq4hsvCLk5bhUhyQsz6AMixm+mIlS6LVSm
 vztc30Z+BP/xvtDFT2xa4y7Pj8XmHfLljTMDn5Q=
X-Google-Smtp-Source: ACHHUZ7ZmTblILgP2lF1Yfvdkux+hUiq6VTxiwy4MI9YOOGNDuSxloWJCdIGqVBPmxN52OTvKSXlOg==
X-Received: by 2002:a05:6358:7188:b0:123:390b:178f with SMTP id
 t8-20020a056358718800b00123390b178fmr13315118rwt.5.1685759686747; 
 Fri, 02 Jun 2023 19:34:46 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 21/35] crypto: Add aesenc_SB_SR_MC_AK
Date: Fri,  2 Jun 2023 19:34:12 -0700
Message-Id: <20230603023426.1064431-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc36.google.com
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

Add a primitive for SubBytes + ShiftRows + MixColumns + AddRoundKey.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/aes-round.h |  4 ++
 include/crypto/aes-round.h            | 21 ++++++++++
 crypto/aes.c                          | 56 +++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
index 1e9b97d274..dc2c751ac3 100644
--- a/host/include/generic/host/aes-round.h
+++ b/host/include/generic/host/aes-round.h
@@ -15,6 +15,10 @@ void aesenc_MC_accel(AESState *, const AESState *, bool)
 void aesenc_SB_SR_accel(AESState *, const AESState *, bool)
     QEMU_ERROR("unsupported accel");
 
+void aesenc_SB_SR_MC_AK_accel(AESState *, const AESState *,
+                              const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
+
 void aesdec_IMC_accel(AESState *, const AESState *, bool)
     QEMU_ERROR("unsupported accel");
 
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index 2d962ede0b..aefa17fcc3 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -56,6 +56,27 @@ static inline void aesenc_MC(AESState *r, const AESState *st, bool be)
     }
 }
 
+/*
+ * Perform SubBytes + ShiftRows + MixColumns + AddRoundKey.
+ */
+
+void aesenc_SB_SR_MC_AK_gen(AESState *ret, const AESState *st,
+                            const AESState *rk);
+void aesenc_SB_SR_MC_AK_genrev(AESState *ret, const AESState *st,
+                               const AESState *rk);
+
+static inline void aesenc_SB_SR_MC_AK(AESState *r, const AESState *st,
+                                      const AESState *rk, bool be)
+{
+    if (HAVE_AES_ACCEL) {
+        aesenc_SB_SR_MC_AK_accel(r, st, rk, be);
+    } else if (HOST_BIG_ENDIAN == be) {
+        aesenc_SB_SR_MC_AK_gen(r, st, rk);
+    } else {
+        aesenc_SB_SR_MC_AK_genrev(r, st, rk);
+    }
+}
+
 /*
  * Perform InvSubBytes + InvShiftRows.
  */
diff --git a/crypto/aes.c b/crypto/aes.c
index 4e654e5404..6172495b46 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1356,6 +1356,62 @@ void aesenc_MC_genrev(AESState *r, const AESState *st)
     aesenc_MC_swap(r, st, true);
 }
 
+/* Perform SubBytes + ShiftRows + MixColumns + AddRoundKey. */
+static inline void
+aesenc_SB_SR_MC_AK_swap(AESState *r, const AESState *st,
+                        const AESState *rk, bool swap)
+{
+    int swap_b = swap * 0xf;
+    int swap_w = swap * 0x3;
+    bool be = HOST_BIG_ENDIAN ^ swap;
+    uint32_t w0, w1, w2, w3;
+
+    w0 = (AES_Te0[st->b[swap_b ^ AES_SH_0]] ^
+          AES_Te1[st->b[swap_b ^ AES_SH_1]] ^
+          AES_Te2[st->b[swap_b ^ AES_SH_2]] ^
+          AES_Te3[st->b[swap_b ^ AES_SH_3]]);
+
+    w1 = (AES_Te0[st->b[swap_b ^ AES_SH_4]] ^
+          AES_Te1[st->b[swap_b ^ AES_SH_5]] ^
+          AES_Te2[st->b[swap_b ^ AES_SH_6]] ^
+          AES_Te3[st->b[swap_b ^ AES_SH_7]]);
+
+    w2 = (AES_Te0[st->b[swap_b ^ AES_SH_8]] ^
+          AES_Te1[st->b[swap_b ^ AES_SH_9]] ^
+          AES_Te2[st->b[swap_b ^ AES_SH_A]] ^
+          AES_Te3[st->b[swap_b ^ AES_SH_B]]);
+
+    w3 = (AES_Te0[st->b[swap_b ^ AES_SH_C]] ^
+          AES_Te1[st->b[swap_b ^ AES_SH_D]] ^
+          AES_Te2[st->b[swap_b ^ AES_SH_E]] ^
+          AES_Te3[st->b[swap_b ^ AES_SH_F]]);
+
+    /* Note that AES_TeX is encoded for big-endian. */
+    if (!be) {
+        w0 = bswap32(w0);
+        w1 = bswap32(w1);
+        w2 = bswap32(w2);
+        w3 = bswap32(w3);
+    }
+
+    r->w[swap_w ^ 0] = rk->w[swap_w ^ 0] ^ w0;
+    r->w[swap_w ^ 1] = rk->w[swap_w ^ 1] ^ w1;
+    r->w[swap_w ^ 2] = rk->w[swap_w ^ 2] ^ w2;
+    r->w[swap_w ^ 3] = rk->w[swap_w ^ 3] ^ w3;
+}
+
+void aesenc_SB_SR_MC_AK_gen(AESState *r, const AESState *st,
+                            const AESState *rk)
+{
+    aesenc_SB_SR_MC_AK_swap(r, st, rk, false);
+}
+
+void aesenc_SB_SR_MC_AK_genrev(AESState *r, const AESState *st,
+                               const AESState *rk)
+{
+    aesenc_SB_SR_MC_AK_swap(r, st, rk, true);
+}
+
 /* Perform InvSubBytes + InvShiftRows. */
 static inline void
 aesdec_ISB_ISR_swap(AESState *r, const AESState *st, bool swap)
-- 
2.34.1


