Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2135FC77B7A
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:35:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H6a-0000Z9-C7; Fri, 02 Jun 2023 22:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6G-0000KV-9J
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:41 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H68-0004hz-L3
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:39 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2565a9107d2so2322257a91.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759671; x=1688351671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XCCJzw+rwFcyJFSIAMn2E7LGE9pt/wVOH2bIPCZG1D0=;
 b=h87KHV6/FBRlIIQ2hK8YT35Hr7dATRYaOnko6G1wAO2rPl6yvv7pQY6hbxZbhAbZnL
 ySF/eZgUnve3QWjIO8VFnGVAKGoa4Jf7GGnwzgXY1P/HG4OavBkto9NlMEo8+NL579GY
 o1ESXSwwAJjaxFQtNw2KE+l4w6AZcwvdcQzfxpkMEEogA8dgYOdC4qVBiGJ0ITzLlhhL
 XQIOfpkwcaZwxkDjgfRbtx//0rNkp6ieFSH2GMM5oqq9iH5y8ST90j0iMCaGEpgSaOSG
 +kmJNFRvszYuokkegxXo6yCBW+QmlldY7/i4JOLFEUNWAi/82BxBEWg4ZzsawCNaEZIE
 40LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759671; x=1688351671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XCCJzw+rwFcyJFSIAMn2E7LGE9pt/wVOH2bIPCZG1D0=;
 b=Ovyh9RPEsafljHgL4H/A6ZXKtuXzgbKc4c56nFb1Dv//xJlnbgkOL0kBpdh2nM6YHN
 DEU94GnKozhOE9XUZoiZsNMZZsCiW4JCjzMI2DC5/M8UJOF/g1+wMrdEun3FLoOLh5Bl
 XUP8fD1SV5O5Q59BbRqVj2b5PqY6DAlHl75WHLQtL2T4q/EkKrNKOeH077BcrVcj4nvB
 GCJAlJchBHDib1+pwlg6uUUc9hlOcnz3eQ1hbAgX3zFbRpkAClQsIxKtuDTUmX87tg1N
 4+uSM/VpgzKp2y4epYA5o1Qq1JCjyl1GfV/5uc1hdouOPhQaUb55EVZInLHplvsWz8NK
 aHfQ==
X-Gm-Message-State: AC+VfDwP2kGaW/N4mJoZkOaH3eOnkp5MqVy7hMx30DbWvk+8uWHjXUVC
 nwcX9wM0f2x+4aVUtZeTUhZfTQ==
X-Google-Smtp-Source: ACHHUZ6LLlenU/GEs1wjeTpTLZUD+4OGWdOAKAwwziHp5T9vc/xm1oDx7Sh8li9qaLU8TcJeDpSU8w==
X-Received: by 2002:a17:90a:e006:b0:255:2dde:17cc with SMTP id
 u6-20020a17090ae00600b002552dde17ccmr1501795pjy.47.1685759671275; 
 Fri, 02 Jun 2023 19:34:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 04/35] crypto: Add aesenc_SB_SR
Date: Fri,  2 Jun 2023 19:33:55 -0700
Message-Id: <20230603023426.1064431-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Begin with a SubBytes + ShiftRows primitive.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/aes-round.h | 15 +++++++++
 include/crypto/aes-round.h            | 41 +++++++++++++++++++++++
 crypto/aes.c                          | 47 +++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 host/include/generic/host/aes-round.h
 create mode 100644 include/crypto/aes-round.h

diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
new file mode 100644
index 0000000000..598242c603
--- /dev/null
+++ b/host/include/generic/host/aes-round.h
@@ -0,0 +1,15 @@
+/*
+ * No host specific aes acceleration.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HOST_AES_ROUND_H
+#define HOST_AES_ROUND_H
+
+#define HAVE_AES_ACCEL  false
+#define ATTR_AES_ACCEL
+
+void aesenc_SB_SR_accel(AESState *, const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
+
+#endif
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
new file mode 100644
index 0000000000..784e1daee6
--- /dev/null
+++ b/include/crypto/aes-round.h
@@ -0,0 +1,41 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * AES round fragments, generic version
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
+#include "host/aes-round.h"
+
+/*
+ * Perform SubBytes + ShiftRows.
+ */
+
+void aesenc_SB_SR_gen(AESState *ret, const AESState *st);
+void aesenc_SB_SR_genrev(AESState *ret, const AESState *st);
+
+static inline void aesenc_SB_SR(AESState *r, const AESState *st, bool be)
+{
+    if (HAVE_AES_ACCEL) {
+        aesenc_SB_SR_accel(r, st, be);
+    } else if (HOST_BIG_ENDIAN == be) {
+        aesenc_SB_SR_gen(r, st);
+    } else {
+        aesenc_SB_SR_genrev(r, st);
+    }
+}
+
+#endif /* CRYPTO_AES_ROUND_H */
diff --git a/crypto/aes.c b/crypto/aes.c
index 1309a13e91..708838315a 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -29,6 +29,7 @@
  */
 #include "qemu/osdep.h"
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 
 typedef uint32_t u32;
 typedef uint8_t u8;
@@ -1251,6 +1252,52 @@ static const u32 rcon[] = {
         0x1B000000, 0x36000000, /* for 128-bit blocks, Rijndael never uses more than 10 rcon values */
 };
 
+/* Perform SubBytes + ShiftRows. */
+static inline void
+aesenc_SB_SR_swap(AESState *r, const AESState *st, bool swap)
+{
+    const int swap_b = swap ? 15 : 0;
+    uint8_t t;
+
+    /* These four indexes are not swizzled. */
+    r->b[swap_b ^ 0x0] = AES_sbox[st->b[swap_b ^ AES_SH_0]];
+    r->b[swap_b ^ 0x4] = AES_sbox[st->b[swap_b ^ AES_SH_4]];
+    r->b[swap_b ^ 0x8] = AES_sbox[st->b[swap_b ^ AES_SH_8]];
+    r->b[swap_b ^ 0xc] = AES_sbox[st->b[swap_b ^ AES_SH_C]];
+
+    /* Otherwise, break cycles. */
+
+    t = AES_sbox[st->b[swap_b ^ AES_SH_D]];
+    r->b[swap_b ^ 0x1] = AES_sbox[st->b[swap_b ^ AES_SH_1]];
+    r->b[swap_b ^ 0x5] = AES_sbox[st->b[swap_b ^ AES_SH_5]];
+    r->b[swap_b ^ 0x9] = AES_sbox[st->b[swap_b ^ AES_SH_9]];
+    r->b[swap_b ^ 0xd] = t;
+
+    t = AES_sbox[st->b[swap_b ^ AES_SH_A]];
+    r->b[swap_b ^ 0x2] = AES_sbox[st->b[swap_b ^ AES_SH_2]];
+    r->b[swap_b ^ 0xa] = t;
+
+    t = AES_sbox[st->b[swap_b ^ AES_SH_E]];
+    r->b[swap_b ^ 0x6] = AES_sbox[st->b[swap_b ^ AES_SH_6]];
+    r->b[swap_b ^ 0xe] = t;
+
+    t = AES_sbox[st->b[swap_b ^ AES_SH_7]];
+    r->b[swap_b ^ 0x3] = AES_sbox[st->b[swap_b ^ AES_SH_3]];
+    r->b[swap_b ^ 0xf] = AES_sbox[st->b[swap_b ^ AES_SH_F]];
+    r->b[swap_b ^ 0xb] = AES_sbox[st->b[swap_b ^ AES_SH_B]];
+    r->b[swap_b ^ 0x7] = t;
+}
+
+void aesenc_SB_SR_gen(AESState *r, const AESState *st)
+{
+    aesenc_SB_SR_swap(r, st, false);
+}
+
+void aesenc_SB_SR_genrev(AESState *r, const AESState *st)
+{
+    aesenc_SB_SR_swap(r, st, true);
+}
+
 /**
  * Expand the cipher key into the encryption key schedule.
  */
-- 
2.34.1


