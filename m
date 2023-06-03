Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15C8C7EE29
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:39:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H6s-0000kK-MA; Fri, 02 Jun 2023 22:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6W-0000Wz-04
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:57 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6J-0004jg-4Y
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:54 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6af6f49e41cso2582307a34.2
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759682; x=1688351682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0wKOO1FAtFF3YwGmhqnt2BeIDIxwiIxGWe3l6hDjdbg=;
 b=mjTK71ob7GjP/xwxSRkvrfZUzZqHy7PRFKcB/FaG5z5FLHKDDZG9E/zB8SMxmVwcnY
 ncISwBJ2F6ygndSjQ0VhNC/uP2OZTVGSAaTL2vUztKq/4tNMcdhhbGF7QoggekS0DjnM
 t4Oo87AgFMv5nWSunz60uP33XmHRTO/6WwsJRj309HbBq06JOLVvwYdiBfTW3XfQhz1g
 SkSUaOQg4EoeVmwtq8iUgoh38fUuTwVhrjb+DcXw94pspGCKOhfxF+IKHfJTYGhDuvhq
 xNqZy5ZJLX0SLVCpELybSvJH5hlTxXU/9jMAqLDPa4Frzm3Et5o2zmPnuxk4QXBtkMsv
 u2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759682; x=1688351682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0wKOO1FAtFF3YwGmhqnt2BeIDIxwiIxGWe3l6hDjdbg=;
 b=iXXt+LDCinpnU41D9lMyDfdOTkTpXlbyAFYwg7es6pl4fHLtvODdXQEo85JMHoP70d
 k0zbj7Z3ghcP0oYtInmA4XRgvjdaMcZzNSKSXmwnpo0JTUSntQ0QiVwlrp/SVzqQIhHU
 uIrET3WLqvefCJMBQzuyURNvltqXTIdjKHSSnV5AYVrY23EfTkqBIFbOImQi5cp7U9Dh
 1Mr+NEtR4Z4ifcZQYQC9tWGd1d4aJbp7cAXbHHe6lA4u6IZrEIFkmyuWYJGX3QxlDf4/
 W5tW613M43J4n1ASqpokju1iFhUyYXeG0UxytQZfgEDeue/bITOJwKCVusBWaDmPKsHm
 1z7g==
X-Gm-Message-State: AC+VfDxKO3YivUFDK2Xba9oaZRxM8yY5IjVKb9fcBQjH4R/ECBuJ5L22
 5aLOHFa3cvgXnHRe1OBz3nrPKQ==
X-Google-Smtp-Source: ACHHUZ5KBh2jT2L0QTSLE1+I7HLD/nGdtaV8989RYVMfIvRLB4HpkC0EgAlgU3kkgHTDZ2Iecu49ew==
X-Received: by 2002:a05:6358:7208:b0:125:83c8:72f6 with SMTP id
 h8-20020a056358720800b0012583c872f6mr15393663rwa.0.1685759682440; 
 Fri, 02 Jun 2023 19:34:42 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 17/35] crypto: Add aesdec_IMC
Date: Fri,  2 Jun 2023 19:34:08 -0700
Message-Id: <20230603023426.1064431-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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

Add a primitive for InvMixColumns.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/aes-round.h |  3 ++
 include/crypto/aes-round.h            | 18 +++++++++
 crypto/aes.c                          | 57 +++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
index 7c48db24b6..1e9b97d274 100644
--- a/host/include/generic/host/aes-round.h
+++ b/host/include/generic/host/aes-round.h
@@ -15,6 +15,9 @@ void aesenc_MC_accel(AESState *, const AESState *, bool)
 void aesenc_SB_SR_accel(AESState *, const AESState *, bool)
     QEMU_ERROR("unsupported accel");
 
+void aesdec_IMC_accel(AESState *, const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
+
 void aesdec_ISB_ISR_accel(AESState *, const AESState *, bool)
     QEMU_ERROR("unsupported accel");
 
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index f25e9572a3..2d962ede0b 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -74,4 +74,22 @@ static inline void aesdec_ISB_ISR(AESState *r, const AESState *st, bool be)
     }
 }
 
+/*
+ * Perform InvMixColumns.
+ */
+
+void aesdec_IMC_gen(AESState *ret, const AESState *st);
+void aesdec_IMC_genrev(AESState *ret, const AESState *st);
+
+static inline void aesdec_IMC(AESState *r, const AESState *st, bool be)
+{
+    if (HAVE_AES_ACCEL) {
+        aesdec_IMC_accel(r, st, be);
+    } else if (HOST_BIG_ENDIAN == be) {
+        aesdec_IMC_gen(r, st);
+    } else {
+        aesdec_IMC_genrev(r, st);
+    }
+}
+
 #endif /* CRYPTO_AES_ROUND_H */
diff --git a/crypto/aes.c b/crypto/aes.c
index c7123eddd5..4e654e5404 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1402,6 +1402,63 @@ void aesdec_ISB_ISR_genrev(AESState *r, const AESState *st)
     aesdec_ISB_ISR_swap(r, st, true);
 }
 
+/* Perform InvMixColumns. */
+static inline void
+aesdec_IMC_swap(AESState *r, const AESState *st, bool swap)
+{
+    int swap_b = swap * 0xf;
+    int swap_w = swap * 0x3;
+    bool be = HOST_BIG_ENDIAN ^ swap;
+    uint32_t t;
+
+    /* Note that AES_imc is encoded for big-endian. */
+    t = (AES_imc[st->b[swap_b ^ 0x0]][0] ^
+         AES_imc[st->b[swap_b ^ 0x1]][1] ^
+         AES_imc[st->b[swap_b ^ 0x2]][2] ^
+         AES_imc[st->b[swap_b ^ 0x3]][3]);
+    if (!be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 0] = t;
+
+    t = (AES_imc[st->b[swap_b ^ 0x4]][0] ^
+         AES_imc[st->b[swap_b ^ 0x5]][1] ^
+         AES_imc[st->b[swap_b ^ 0x6]][2] ^
+         AES_imc[st->b[swap_b ^ 0x7]][3]);
+    if (!be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 1] = t;
+
+    t = (AES_imc[st->b[swap_b ^ 0x8]][0] ^
+         AES_imc[st->b[swap_b ^ 0x9]][1] ^
+         AES_imc[st->b[swap_b ^ 0xA]][2] ^
+         AES_imc[st->b[swap_b ^ 0xB]][3]);
+    if (!be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 2] = t;
+
+    t = (AES_imc[st->b[swap_b ^ 0xC]][0] ^
+         AES_imc[st->b[swap_b ^ 0xD]][1] ^
+         AES_imc[st->b[swap_b ^ 0xE]][2] ^
+         AES_imc[st->b[swap_b ^ 0xF]][3]);
+    if (!be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 3] = t;
+}
+
+void aesdec_IMC_gen(AESState *r, const AESState *st)
+{
+    aesdec_IMC_swap(r, st, false);
+}
+
+void aesdec_IMC_genrev(AESState *r, const AESState *st)
+{
+    aesdec_IMC_swap(r, st, true);
+}
+
 /**
  * Expand the cipher key into the encryption key schedule.
  */
-- 
2.34.1


