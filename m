Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268E1EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:09:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZDc-0005wm-GW; Tue, 20 Jun 2023 07:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDa-0005sG-Qf
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:14 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDV-0004By-R5
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:14 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-987accb4349so525496066b.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259288; x=1689851288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vCazwpeLNv7EUcpMYF/LFadHN6FmWon+/yuhh5cv/iE=;
 b=mhSzZJnVW7NnuUtVrIOZY9AO+/qZ9n/8mc5pvRWxQDhZiexjFu6pQ40fZ+QjcwnTBB
 aLSannxOsIl8BoWIDq1nt/x81rGzOdxu9CdhRUpSLnnOYwprIaoqgAq7YW/fmjR2CPpS
 5ZchOS4CUKG7uSvLryetZXMAEcroQ3tteVYH9othZXXqeNb8UC+/RSzs05JR/uRDivlN
 ffWhmKX8z8aIvJbYYrlRJPUbkKFa/N4LASJQonBuEVfM2SZ+0iw7sh2QYJ4oGmUWvbp8
 +GtZzWweJbvggcKvC3BS6VWrD9Fkva20WXUx24L81TUKPUpGQVyENOUTIMEVgzvufvTD
 hRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259288; x=1689851288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vCazwpeLNv7EUcpMYF/LFadHN6FmWon+/yuhh5cv/iE=;
 b=Ymsodlpo1wCTiDMWdmzlnF2cHDFcVcwiB8Hlc4E8efqzXQoAofeI1KWtDBSyhd57kp
 EwbdnI3tAqf02Nw+dh48gld+7egOMr8hWALegYsbNXKECD03soKAoTWPLkqRuKKsBnoF
 mnbGERS+8Ersb3wKFRmfBNILAXQPRjxE71VW19aOHKQHjRoh7MfFHif32EvsSdTXQz8G
 peAAUfNAkjWZ1QFO20Kw0O71YiZIn7kvKuiHLhPeJUsXMabxPD7YWdJ98neI7Ft1OjtL
 NnNPBrFuD3QniyxryBp9XyFFRmHz9J65T0hnqKgRnFoxmmrItNTtHzxYlVdgMj69SNAz
 ZSbg==
X-Gm-Message-State: AC+VfDznKRogpUZx3Ph1YrguQ+4a9zQr+4O7DE7S4iJL/uVJ6bmW0MBb
 Bo/nCMcQsct6dnsva/m9XSzmXQ==
X-Google-Smtp-Source: ACHHUZ6AR598sNBNyP16mDR8Cp9TQVLG5cmJPugMDLsDY7YveSKE7tZVXV7vljDL8+t+ksgjs6fhTw==
X-Received: by 2002:a17:907:3188:b0:966:5a6c:752d with SMTP id
 xe8-20020a170907318800b009665a6c752dmr11035134ejb.20.1687259288171; 
 Tue, 20 Jun 2023 04:08:08 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 05/37] crypto: Add aesenc_SB_SR_AK
Date: Tue, 20 Jun 2023 13:07:26 +0200
Message-Id: <20230620110758.787479-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x632.google.com
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

Start adding infrastructure for accelerating guest AES.
Begin with a SubBytes + ShiftRows + AddRoundKey primitive.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                                  |  1 +
 host/include/generic/host/crypto/aes-round.h | 16 +++++++
 include/crypto/aes-round.h                   | 44 +++++++++++++++++++
 crypto/aes.c                                 | 46 ++++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 host/include/generic/host/crypto/aes-round.h
 create mode 100644 include/crypto/aes-round.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 88b5a7ee0a..0214558d05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3208,6 +3208,7 @@ M: Daniel P. Berrange <berrange@redhat.com>
 S: Maintained
 F: crypto/
 F: include/crypto/
+F: host/include/*/host/crypto/
 F: qapi/crypto.json
 F: tests/unit/test-crypto-*
 F: tests/bench/benchmark-crypto-*
diff --git a/host/include/generic/host/crypto/aes-round.h b/host/include/generic/host/crypto/aes-round.h
new file mode 100644
index 0000000000..c5d8066179
--- /dev/null
+++ b/host/include/generic/host/crypto/aes-round.h
@@ -0,0 +1,16 @@
+/*
+ * No host specific aes acceleration.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef GENERIC_HOST_CRYPTO_AES_ROUND_H
+#define GENERIC_HOST_CRYPTO_AES_ROUND_H
+
+#define HAVE_AES_ACCEL  false
+#define ATTR_AES_ACCEL
+
+void aesenc_SB_SR_AK_accel(AESState *, const AESState *,
+                           const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
+
+#endif /* GENERIC_HOST_CRYPTO_AES_ROUND_H */
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
new file mode 100644
index 0000000000..d675d2468f
--- /dev/null
+++ b/include/crypto/aes-round.h
@@ -0,0 +1,44 @@
+/*
+ * AES round fragments, generic version
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Copyright (C) 2023 Linaro, Ltd.
+ */
+
+#ifndef CRYPTO_AES_ROUND_H
+#define CRYPTO_AES_ROUND_H
+
+/* Hosts with acceleration will usually need a 16-byte vector type. */
+typedef uint8_t AESStateVec __attribute__((vector_size(16)));
+
+typedef union {
+    uint8_t b[16];
+    uint32_t w[4];
+    uint64_t d[4];
+    AESStateVec v;
+} AESState;
+
+#include "host/crypto/aes-round.h"
+
+/*
+ * Perform SubBytes + ShiftRows + AddRoundKey.
+ */
+
+void aesenc_SB_SR_AK_gen(AESState *ret, const AESState *st,
+                         const AESState *rk);
+void aesenc_SB_SR_AK_genrev(AESState *ret, const AESState *st,
+                            const AESState *rk);
+
+static inline void aesenc_SB_SR_AK(AESState *r, const AESState *st,
+                                   const AESState *rk, bool be)
+{
+    if (HAVE_AES_ACCEL) {
+        aesenc_SB_SR_AK_accel(r, st, rk, be);
+    } else if (HOST_BIG_ENDIAN == be) {
+        aesenc_SB_SR_AK_gen(r, st, rk);
+    } else {
+        aesenc_SB_SR_AK_genrev(r, st, rk);
+    }
+}
+
+#endif /* CRYPTO_AES_ROUND_H */
diff --git a/crypto/aes.c b/crypto/aes.c
index cdf937883d..c00f10bad1 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -29,6 +29,7 @@
  */
 #include "qemu/osdep.h"
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 
 typedef uint32_t u32;
 typedef uint8_t u8;
@@ -1249,6 +1250,51 @@ static const u32 rcon[] = {
         0x1B000000, 0x36000000, /* for 128-bit blocks, Rijndael never uses more than 10 rcon values */
 };
 
+/*
+ * Perform SubBytes + ShiftRows + AddRoundKey.
+ */
+static inline void
+aesenc_SB_SR_AK_swap(AESState *ret, const AESState *st,
+                     const AESState *rk, bool swap)
+{
+    const int swap_b = swap ? 15 : 0;
+    AESState t;
+
+    t.b[swap_b ^ 0x0] = AES_sbox[st->b[swap_b ^ AES_SH_0]];
+    t.b[swap_b ^ 0x1] = AES_sbox[st->b[swap_b ^ AES_SH_1]];
+    t.b[swap_b ^ 0x2] = AES_sbox[st->b[swap_b ^ AES_SH_2]];
+    t.b[swap_b ^ 0x3] = AES_sbox[st->b[swap_b ^ AES_SH_3]];
+    t.b[swap_b ^ 0x4] = AES_sbox[st->b[swap_b ^ AES_SH_4]];
+    t.b[swap_b ^ 0x5] = AES_sbox[st->b[swap_b ^ AES_SH_5]];
+    t.b[swap_b ^ 0x6] = AES_sbox[st->b[swap_b ^ AES_SH_6]];
+    t.b[swap_b ^ 0x7] = AES_sbox[st->b[swap_b ^ AES_SH_7]];
+    t.b[swap_b ^ 0x8] = AES_sbox[st->b[swap_b ^ AES_SH_8]];
+    t.b[swap_b ^ 0x9] = AES_sbox[st->b[swap_b ^ AES_SH_9]];
+    t.b[swap_b ^ 0xa] = AES_sbox[st->b[swap_b ^ AES_SH_A]];
+    t.b[swap_b ^ 0xb] = AES_sbox[st->b[swap_b ^ AES_SH_B]];
+    t.b[swap_b ^ 0xc] = AES_sbox[st->b[swap_b ^ AES_SH_C]];
+    t.b[swap_b ^ 0xd] = AES_sbox[st->b[swap_b ^ AES_SH_D]];
+    t.b[swap_b ^ 0xe] = AES_sbox[st->b[swap_b ^ AES_SH_E]];
+    t.b[swap_b ^ 0xf] = AES_sbox[st->b[swap_b ^ AES_SH_F]];
+
+    /*
+     * Perform the AddRoundKey with generic vectors.
+     * This may be expanded to either host integer or host vector code.
+     * The key and output endianness match, so no bswap required.
+     */
+    ret->v = t.v ^ rk->v;
+}
+
+void aesenc_SB_SR_AK_gen(AESState *r, const AESState *s, const AESState *k)
+{
+    aesenc_SB_SR_AK_swap(r, s, k, false);
+}
+
+void aesenc_SB_SR_AK_genrev(AESState *r, const AESState *s, const AESState *k)
+{
+    aesenc_SB_SR_AK_swap(r, s, k, true);
+}
+
 /**
  * Expand the cipher key into the encryption key schedule.
  */
-- 
2.34.1


