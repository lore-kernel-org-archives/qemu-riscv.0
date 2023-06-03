Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2CBC7EE29
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:39:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H7Q-0001VN-IO; Fri, 02 Jun 2023 22:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Q-0000T3-CG
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:50 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6G-0004m2-PE
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:48 -0400
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-39a523e8209so1801361b6e.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759678; x=1688351678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhUARdFwT69t+H+UUFeebMxz0PxbDKgvhvhPEqctC4I=;
 b=Uq8hu11wQLayBSb3c6ieisDPShW0TcpdGSI8lMUzeA3DRB7916sc2Tm9u0Wxw+N9Mg
 +PoRseCpiH0mbuthHqiqOq1UFmJX72kVzPdUWRDXU1uzArZu4l0TQhCGECa9BhXnQNTx
 QjRwL8yb6HI1uPnbygSsYYBHSxwbdzh8vRiAMIHXQWTkVkFXP2AfxbplZ9PtcdJYPiki
 99GIy1/XUhOcMPm64hZx6rNiTfyDUW4bIBMVPbpihPB/ssWmBuVqgqSMnvR3xy5btfdZ
 MbFQSEsqfrLB1r7LizeieBfFgQIY1REQA7qdFgj5iZepxLyXPg6HjK+do85QRsM1i9J8
 EeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759678; x=1688351678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yhUARdFwT69t+H+UUFeebMxz0PxbDKgvhvhPEqctC4I=;
 b=C6G7rtyJTn8OzQL4FODMW26PooOWhOHZtVtaUtLUlJVlZ0v2CAPYe7Z1bgLxV3aCH3
 blLYqK4/MKpO0AiM7OTvwN9dex6uIMLx7RGT+YJs1xv+ocl30TiCOkVaYn5G4iZGjhxB
 ClubBRBOrqFHYSis3uT9rvl8naKPDyjYjygofEHSytkdC3xtP7ZUloh82RSI8IFBdLMz
 9E2pplkw8643qBBwix3kGhZzajWvgk98bcg9fqCYWCMCFuDZFNeCIYxxD/wAagWT/uGI
 OjNFRLcIo0JClTw7V4Z90rY3rN7GAU/KBS5d+EUeBxyJfqATa8NkAJF+YxqfX7cxRNa1
 +H5A==
X-Gm-Message-State: AC+VfDxfcBmdAEqao8vpfAbHzgYNSEfierTpHRqxvkIGw6G+a/IX9OAV
 uopvkXT2xwaevztgbF6oK9TR5w==
X-Google-Smtp-Source: ACHHUZ7xIx+iOoGsYhqnUVh08AxXCQDVFxvffWU83GCKIYDFi9Te/Ay8Cn62uaSPwfLuKdboRCHLCg==
X-Received: by 2002:a05:6358:2486:b0:125:8739:c7b0 with SMTP id
 m6-20020a056358248600b001258739c7b0mr8098284rwc.3.1685759678321; 
 Fri, 02 Jun 2023 19:34:38 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 12/35] target/arm: Use aesdec_ISB_ISR
Date: Fri,  2 Jun 2023 19:34:03 -0700
Message-Id: <20230603023426.1064431-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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

This implements the AESD instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 37 +++++++++++++++-------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 5cebc88f5f..d7b644851f 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -46,26 +46,6 @@ static void clear_tail_16(void *vd, uint32_t desc)
     clear_tail(vd, opr_sz, max_sz);
 }
 
-static void do_crypto_aese(uint64_t *rd, uint64_t *rn, uint64_t *rm,
-                           const uint8_t *sbox, const uint8_t *shift)
-{
-    union CRYPTO_STATE rk = { .l = { rm[0], rm[1] } };
-    union CRYPTO_STATE st = { .l = { rn[0], rn[1] } };
-    int i;
-
-    /* xor state vector with round key */
-    rk.l[0] ^= st.l[0];
-    rk.l[1] ^= st.l[1];
-
-    /* combine ShiftRows operation and sbox substitution */
-    for (i = 0; i < 16; i++) {
-        CR_ST_BYTE(st, i) = sbox[CR_ST_BYTE(rk, shift[i])];
-    }
-
-    rd[0] = st.l[0];
-    rd[1] = st.l[1];
-}
-
 void HELPER(crypto_aese)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
@@ -96,7 +76,22 @@ void HELPER(crypto_aesd)(void *vd, void *vn, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aese(vd + i, vn + i, vm + i, AES_isbox, AES_ishifts);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vn + i);
+        AESState *rk = (AESState *)(vm + i);
+        AESState t;
+
+        /* Our uint64_t are in the wrong order for big-endian. */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1] ^ rk->d[1];
+            t.d[1] = st->d[0] ^ rk->d[0];
+            aesdec_ISB_ISR(&t, &t, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            t.v = st->v ^ rk->v;
+            aesdec_ISB_ISR(ad, &t, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1


