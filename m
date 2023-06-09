Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D522BC7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:28:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7RoY-0003RY-Qt; Thu, 08 Jun 2023 22:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Ro3-0002xD-C8
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:54 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rna-0005h9-FP
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:50 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-654f8b56807so1293734b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277460; x=1688869460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xYxE0S+wgPkv66YYfd/jCMfWWCABG8XxYK8ruJluaP8=;
 b=giaTpN5T3y2SU0V4NKu9QJVob/S3L2ivzaOksdml6CeBC5CUQuPx9Zn6lTURbP9lem
 tYsZSBO3+iHBsPKVYbEuYEVhgsomUwFr8YO/3/wm1jsao7mH/ZwyyA8JdnVtUV8cG5Hn
 Txu+j6MAQJlCgtloMq0Mg7XxnNYt/Af7uIaqZzsLhPRCmwF4xO22DSJVqnDT3f3c1sZu
 f5DXLCxrN6fDDJUqy+9dANNqhgxVOdVBH/a5XUFo4MHjVHxRpptlNDmDCZA+wsJzNk7t
 y2snoUfXB3vj76lXuWmvihdwtE35a7shgtc9VfBa6BRGdr8RoXKuA2ctLFvnf+vdhBvA
 EbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277460; x=1688869460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xYxE0S+wgPkv66YYfd/jCMfWWCABG8XxYK8ruJluaP8=;
 b=aXePElVoDuGKuPml72BcTkl9Bv6FBPQNf1XHZI29gb39XmNb1vZJ5jrQDt39M6iSD5
 hk5S1bVZKCOBnJVHahev1K+5+SI/vqyvnq2VFkyBYFxPWJzwP6dc3wNwVfqBWDSUrBrl
 wJImk6IXN3r9+5jPUvGdYh6rBQIZsuwj3bCxc6j91AUgAAF24U5sd5h33sEf0C5Jl1e2
 yuLSGRJNfmftWKBus9RJfyYPgN5GjyS1b8HcQtUh1HKgPojR3OVKzDq/3saxq73+sSxD
 I0psnHsghkcvaLB/mfTO2tc6/AJ1vDrNN9pchgEJUox5UzK06rFvWYzqmpg1Wld9bITB
 f/OQ==
X-Gm-Message-State: AC+VfDx1+dtOeXgka26G7v1ZmPbY0YskV8VmIgaaENacjCKaGvHo1tQ6
 yhUtZ5AB7XRzMMXnDAFvUbJRyA==
X-Google-Smtp-Source: ACHHUZ663KDC608w6j9woBNSBOX+WQAxe7OwLZyCL3mzCIuHZkqLaq168gaZcESt+ht38+fALuvi6A==
X-Received: by 2002:a05:6a00:1a4e:b0:643:8496:e41c with SMTP id
 h14-20020a056a001a4e00b006438496e41cmr7565pfv.20.1686277460694; 
 Thu, 08 Jun 2023 19:24:20 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 19/38] crypto: Add aesdec_IMC
Date: Thu,  8 Jun 2023 19:23:42 -0700
Message-Id: <20230609022401.684157-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 host/include/generic/host/aes-round.h |  2 +
 include/crypto/aes-round.h            | 18 +++++++++
 crypto/aes.c                          | 57 +++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
index b00e9b50b1..34068afe40 100644
--- a/host/include/generic/host/aes-round.h
+++ b/host/include/generic/host/aes-round.h
@@ -15,6 +15,8 @@ void aesenc_SB_SR_AK_accel(AESState *, const AESState *,
                            const AESState *, bool)
     QEMU_ERROR("unsupported accel");
 
+void aesdec_IMC_accel(AESState *, const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
 void aesdec_ISB_ISR_AK_accel(AESState *, const AESState *,
                              const AESState *, bool)
     QEMU_ERROR("unsupported accel");
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index 9f263ca726..b80d4de664 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -59,6 +59,24 @@ static inline void aesenc_SB_SR_AK(AESState *r, const AESState *st,
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
 /*
  * Perform InvSubBytes + InvShiftRows.
  */
diff --git a/crypto/aes.c b/crypto/aes.c
index 89de8e8db4..bfd41e3fb9 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1395,6 +1395,63 @@ void aesdec_ISB_ISR_AK_genrev(AESState *r, const AESState *s, const AESState *k)
     aesdec_ISB_ISR_AK_swap(r, s, k, true);
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


