Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48050C7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:26:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7RpD-0005kd-Ko; Thu, 08 Jun 2023 22:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RoB-000330-G1
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:25:02 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnc-0005ia-T2
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:58 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6b291d55f52so256167a34.2
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277462; x=1688869462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8c22mTwcbWMs129JigZzKtfDDKQP2XGxgtoSuBUoiE=;
 b=o4dpDnPkLPLPDOMiRBxKaP/P9jKnyd0RWhw0MRtoNyGJjaTL1ksQsfpZT6fsOA3tPJ
 gv+J8/xpXj9OTt0Oj0JfmKdK77SzpdWkVA9slVi5fVFH2+VoF4KmefLV4KsEOrVzI6qD
 OA/grzJhbg6Ddx8vSL7C/dHJsjJWY5aSUDnxkR3d+T+Vzre/VERA7fVkfbxUP03ZuQ8n
 4/4GvOJTAJCIsMKX6ozxpvqj4rj6fAho1Z62G2k0RYIj+tsv88IvmMPDEY1Dtj7PjkJP
 pvDbzaszSsS/1dZqQEaPRiBRZ27wrB/IasDCSbL4pTIHLSL7PCH7OdohYg6EAXkbcY1o
 KYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277462; x=1688869462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8c22mTwcbWMs129JigZzKtfDDKQP2XGxgtoSuBUoiE=;
 b=a4YhDiSL4r8jmmbqAE3BS9pxgrG31PZaUyOY9XfSmNkyPGuU8Lvd5BYpEXuE2i5x1b
 9SY+VArXO24DZN5TGg2sT1wNuEvWtjXCg76XxuXvCurtTG96L4CFG91ZLgjGTGfyo7Ue
 MLuJzexnV9xjCjaPiv8p2JLWylqQkITueU4LhNt0bRyb0ItNTmZ9ZqD8ruYVwPvagCG1
 9nTIVgWLHXokMWCGlBX7z+UTb5vaIQ8iHfsEIMYT89FcXPKbxoubACtZ4VuLJxjWMqYn
 KsAlvH1Dhve8XY/MOPaKysfFvNFSgYTK/wNIEpx1b3pGA7tqkbw8pltQUpQpt3HNE0TQ
 6OmA==
X-Gm-Message-State: AC+VfDy5dmxaqTpRFKZfY2CLho4Pmjpp6TZwCjOvvz+GVDTjjXsOZVHW
 zLodFQNf7x1fYCBLyMei2yosGw==
X-Google-Smtp-Source: ACHHUZ47lupFVMoTsJ1c0deqdH16KC4bYhRZsZRBciJzX2UHn7r7/xveG8lc9OxjCk7TEQsZGbQrRA==
X-Received: by 2002:a05:6830:130c:b0:6b1:655c:376 with SMTP id
 p12-20020a056830130c00b006b1655c0376mr219015otq.7.1686277462532; 
 Thu, 08 Jun 2023 19:24:22 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 21/38] target/arm: Use aesdec_IMC
Date: Thu,  8 Jun 2023 19:23:44 -0700
Message-Id: <20230609022401.684157-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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

This implements the AESIMC instruction.  We have converted everything
to crypto/aes-round.h; crypto/aes.h is no longer needed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 1952aaac58..fdd70abbfd 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -14,7 +14,6 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
-#include "crypto/aes.h"
 #include "crypto/aes-round.h"
 #include "crypto/sm4.h"
 #include "vec_internal.h"
@@ -102,23 +101,6 @@ void HELPER(crypto_aesd)(void *vd, void *vn, void *vm, uint32_t desc)
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
 
-static void do_crypto_aesmc(uint64_t *rd, uint64_t *rm, const uint32_t *mc)
-{
-    union CRYPTO_STATE st = { .l = { rm[0], rm[1] } };
-    int i;
-
-    for (i = 0; i < 16; i += 4) {
-        CR_ST_WORD(st, i >> 2) =
-            mc[CR_ST_BYTE(st, i)] ^
-            rol32(mc[CR_ST_BYTE(st, i + 1)], 8) ^
-            rol32(mc[CR_ST_BYTE(st, i + 2)], 16) ^
-            rol32(mc[CR_ST_BYTE(st, i + 3)], 24);
-    }
-
-    rd[0] = st.l[0];
-    rd[1] = st.l[1];
-}
-
 void HELPER(crypto_aesmc)(void *vd, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
@@ -147,7 +129,20 @@ void HELPER(crypto_aesimc)(void *vd, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aesmc(vd + i, vm + i, AES_imc_rot);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vm + i);
+        AESState t;
+
+        /* Our uint64_t are in the wrong order for big-endian. */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1];
+            t.d[1] = st->d[0];
+            aesdec_IMC(&t, &t, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            aesdec_IMC(ad, st, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1


