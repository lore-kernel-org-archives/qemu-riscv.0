Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126B5C7EE25
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:31:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7RpH-0006GM-HA; Thu, 08 Jun 2023 22:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RoC-000340-Nv
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:25:04 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rne-0005iz-O6
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:25:00 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-64d57cd373fso926545b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277464; x=1688869464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ga+hWvCBDL4QxTP+wi9pxfKvtud2l/xV0t0m4HElUJM=;
 b=rKqAEY/q4ogFzpl+mtLLaEplOYiygWXJGWsbssdM6Jadw3Lm25NwsyiwPdRb7G51o1
 dBQbuys6GuruTXZlqsXHBDTDdpMOryCptNzETguaqnW1tXzpUylrmc7XFElZ3yw3SB+O
 EUKNfURAUUb1gP8QYXAFne0qlrLGCLUJboMvwJuANsRIrM4mNQvxFqZsJ/WdbJcxlaAv
 EFYpwhCmgdWjidcA3hS+kwdsSdbAkq79YauCMRSfvxU5ipOasxkhkQgZ5njHxKzhYCDM
 YUbWF34cSUns99e/Js8Zoq47kPKiGhQlsRYKNtqtSmmTi1m+2b1rDg3iwgXPEok81Ma3
 G5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277464; x=1688869464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ga+hWvCBDL4QxTP+wi9pxfKvtud2l/xV0t0m4HElUJM=;
 b=Eiv5Pl2Yh8j3u9a3FA4Zp4MhUA4Zk+gyp8EBhH67Kas9YqOIX1KhAGwxNker/UIDnI
 XnFsi4pXSMcazpZDqL3hf0NmXe2jBwDlCDQe6T75Sp/UT3MesiKKRy7ZEy+9kX0lXTgr
 0FDsj2BkhncR8DdeOcxXHn07Whws+1C9u6s0vIszxw3+TTGqy1rvf5MyUULeth/1TRWL
 JT5EvlIatT/wmtzkKZC78spGULjEhQL1wn3m8vChSybY8cf2Exq0fdVNGRyQzthQ1Ufx
 ewFgyLotXVOUiKraYNEBuv2rt93xHMW8dLUjQlNlTfKFaSi5k+bN1hYYvZj5Toid0ZM1
 8f8A==
X-Gm-Message-State: AC+VfDzmjZDLR0De0z3DclctesqsBL+YdPAGRxPaqgAL70IVuSGhO1T4
 /A1YKNGyTehw4FCXouaFFoJu7A==
X-Google-Smtp-Source: ACHHUZ5VkZjpHJDvqfbLR32qL7XIBP/qtTJhVtLJq09pYOtJOQ28LdJIuv4wLRAXhGmLotsNImS1rw==
X-Received: by 2002:a05:6a21:9983:b0:10a:eea0:6987 with SMTP id
 ve3-20020a056a21998300b0010aeea06987mr537918pzb.26.1686277464157; 
 Thu, 08 Jun 2023 19:24:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 23/38] crypto: Add aesenc_SB_SR_MC_AK
Date: Thu,  8 Jun 2023 19:23:46 -0700
Message-Id: <20230609022401.684157-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
 host/include/generic/host/aes-round.h |  3 ++
 include/crypto/aes-round.h            | 21 ++++++++++
 crypto/aes.c                          | 56 +++++++++++++++++++++++++++
 3 files changed, 80 insertions(+)

diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
index 34068afe40..ee64db32fa 100644
--- a/host/include/generic/host/aes-round.h
+++ b/host/include/generic/host/aes-round.h
@@ -14,6 +14,9 @@ void aesenc_MC_accel(AESState *, const AESState *, bool)
 void aesenc_SB_SR_AK_accel(AESState *, const AESState *,
                            const AESState *, bool)
     QEMU_ERROR("unsupported accel");
+void aesenc_SB_SR_MC_AK_accel(AESState *, const AESState *,
+                              const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
 
 void aesdec_IMC_accel(AESState *, const AESState *, bool)
     QEMU_ERROR("unsupported accel");
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index b80d4de664..9e10c3ee9e 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -77,6 +77,27 @@ static inline void aesdec_IMC(AESState *r, const AESState *st, bool be)
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
index bfd41e3fb9..0c281472aa 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1352,6 +1352,62 @@ void aesenc_MC_genrev(AESState *r, const AESState *st)
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
 aesdec_ISB_ISR_AK_swap(AESState *ret, const AESState *st,
-- 
2.34.1


