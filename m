Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E1FEB64D8
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:17:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZDx-0006R1-EN; Tue, 20 Jun 2023 07:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDv-0006Ni-Bh
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:35 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDs-0004QJ-2D
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:35 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-986d8332f50so538290766b.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259310; x=1689851310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=37v87OvAxenj0irSs1EemrWAhShq/0s61Y9O5yLeJgY=;
 b=D4+8i4Rjvpi/hZGd2oKlpqWVgN23cHT1Z25RuKe2Spd2KmU160fG8Noy3v8prkJuTI
 GkEZF1OVKHrq42kYkVpPinncfAV+ClHedzWAFbFoom7/A8+6kgsXSYVm7FjHrk9MwB0h
 SWOkrMFkDNNSr6LpT0oiEq27GW6mpkK2KoheJVP+Dyy4w5qvbRAPUqH6HqT707+Dl3F3
 WfXnaQy0NaXjAeovd1xvrKZIsbWgUGdt2kPDNlXHseRKPlfUNBFKumXySNGbEPSLaY6v
 25swpq4jd+PAnBEvpZQDHHI8S3I2tasOeJcFDkM/2TEiAof/a92Sh7alTdl49C/nvHge
 Mzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259310; x=1689851310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=37v87OvAxenj0irSs1EemrWAhShq/0s61Y9O5yLeJgY=;
 b=dmYyaQAnEf07oQkKjNzWNlU7Q5yDuG/7opg0pOmJbsMi5t0U1LafACZyr00b5W/RcW
 JbsSR2JeUTcdccf9E4kFeZNnvzLtQ74x9ACl+oDAL1H3dXHprNxaguT4/QMN3acibKKP
 BYxi2+uHU3OdzSzKRf64xYuhcHnpj+jyi23Y0XlWHAVElocxtDtw6EOydXTzcAf0WuLK
 x4mnykr4kVZvaOC040mMjvL8SPLaUo3D6u+Yr+1uX6zhX4rJenPNmAujAaLih+i70+xs
 8Puwt3SsRbO9NS5t0TNwRnjcmuad46P5YuLwwLkyc45p+cj2EffPd/exEyW/UOk4H9U8
 q3wA==
X-Gm-Message-State: AC+VfDzfmhXz2XSKO2WrLb3a3Fco1ou4v/8APOotV9XShehZe+nSpoHH
 x4dvukb565O8cvIiAxX+VoYoAQ==
X-Google-Smtp-Source: ACHHUZ4YPmZu2ZrDUqtVe4ZOICb+chXs+WMwUkcCDUfGoUgKKEE6gXDUs55vD7BPYNB35wQk6jfnkQ==
X-Received: by 2002:a17:907:8687:b0:973:91a5:bff1 with SMTP id
 qa7-20020a170907868700b0097391a5bff1mr10958173ejc.68.1687259310738; 
 Tue, 20 Jun 2023 04:08:30 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 22/37] crypto: Add aesenc_SB_SR_MC_AK
Date: Tue, 20 Jun 2023 13:07:43 +0200
Message-Id: <20230620110758.787479-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62f.google.com
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

Add a primitive for SubBytes + ShiftRows + MixColumns + AddRoundKey.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/crypto/aes-round.h |  3 +
 include/crypto/aes-round.h                   | 21 +++++++
 crypto/aes.c                                 | 58 ++++++++++++++++++++
 3 files changed, 82 insertions(+)

diff --git a/host/include/generic/host/crypto/aes-round.h b/host/include/generic/host/crypto/aes-round.h
index 335ec3f11e..9886e81e50 100644
--- a/host/include/generic/host/crypto/aes-round.h
+++ b/host/include/generic/host/crypto/aes-round.h
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
index e1a9c24cca..6c744b299d 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -59,6 +59,27 @@ static inline void aesenc_SB_SR_AK(AESState *r, const AESState *st,
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
  * Perform InvMixColumns.
  */
diff --git a/crypto/aes.c b/crypto/aes.c
index 31028609d6..c0350c0b76 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1356,6 +1356,64 @@ void aesenc_SB_SR_AK_genrev(AESState *r, const AESState *s, const AESState *k)
     aesenc_SB_SR_AK_swap(r, s, k, true);
 }
 
+/*
+ * Perform SubBytes + ShiftRows + MixColumns + AddRoundKey.
+ */
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
 /*
  * Perform InvMixColumns.
  */
-- 
2.34.1


