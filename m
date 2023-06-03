Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D49C7EE29
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:39:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H7h-00030m-RO; Fri, 02 Jun 2023 22:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Y-0000YZ-7h
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:59 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6L-0004pN-Ps
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:57 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6af6f4a0e11so2507714a34.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759684; x=1688351684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+YFVL2L2QA+ZkXwvHRHmXGuXkbx8P36rhNWAOgf26Pg=;
 b=oRS0PYnmD+5wCuExj+8PtfO0JQv9WU0admlkMcCX+7zB8RROvU/Hw+ffvD9xJH4X6r
 CKIS1n/Z5y609Molv4KVjOI+iwRqj4FdQwt/uPk7jZPeKEj+5rI5mfVeTEnCBTNJ//GC
 OqOhVgtVN2U0EWnNevMa0LCVDoP617lRZ+jkNXEsjkExvP985jMsOP9K0wxz9OoKihFu
 0Adn0fHKJ+gZoCNvqsOqm01Xzc9fgWqwibOg51GTcqEMIfA9OnUakPpwlD39LhFBw10n
 3YH5WYFAqIBsY+u1H4CTvoLYIBLE4/tl2CKtPA10SYkyjboqfbPyQMKK3bx6lUiL7a9R
 sY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759684; x=1688351684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+YFVL2L2QA+ZkXwvHRHmXGuXkbx8P36rhNWAOgf26Pg=;
 b=AXGEKOpkeqisZz07P6LuNCmwCXDt6vspWITmL15tgHTDKpl/fmG4emauineoMzU+JT
 yL1sbfbKfsmEUXUAPL1EoiNaveuq4PKodxCJmAnVzWqYAazmQk3DMNzgC+bQ3cr3Yh6R
 J73fUshccjSTLFLGyrPQPQAnNK9PAN/drjwayza01VzJD4umfnVe4EhZIPTPAgy63mqv
 jJq33OtR38FSTTAlZgtKp08NGalo0KLkFxMONtMHSaQKdPIi2GDDMgukMpSl18Bphmcw
 0ny8ugRFUViYHN1sSs5uME1gBnfioI9Ht2rtR2cD5Ah6IlV86qO5HsIJaxSnk/+Ju5PI
 NI1A==
X-Gm-Message-State: AC+VfDxI2ASPRxYCGXp3ZRReLCgNhI1pAKwFwyOW1AfBc6vIcLCQm8fY
 XVXeBXTn/6T8SqI7kLAdJ1aGYf7wMRk3PuO5oJM=
X-Google-Smtp-Source: ACHHUZ6CiJMVpcms9iO0uN/OpG3oZ2NYj3N0wx/NbwZ3enxB3LUq24AWz/jUM1DEjfFKqHiZq9gBXA==
X-Received: by 2002:a05:6358:1a87:b0:128:6cca:f306 with SMTP id
 gm7-20020a0563581a8700b001286ccaf306mr922957rwb.30.1685759684031; 
 Fri, 02 Jun 2023 19:34:44 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 19/35] target/arm: Use aesdec_IMC
Date: Fri,  2 Jun 2023 19:34:10 -0700
Message-Id: <20230603023426.1064431-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
index a0fec08771..d2da80f2ba 100644
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
@@ -96,23 +95,6 @@ void HELPER(crypto_aesd)(void *vd, void *vn, void *vm, uint32_t desc)
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
@@ -141,7 +123,20 @@ void HELPER(crypto_aesimc)(void *vd, void *vm, uint32_t desc)
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


