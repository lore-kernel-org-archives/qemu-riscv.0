Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE44EB64DD
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:11:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGGS5-0003ck-R2; Mon, 03 Jul 2023 06:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRe-00034u-FK
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:06:10 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRN-0005wk-7q
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:06:10 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-312824aa384so4702881f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378752; x=1690970752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8c22mTwcbWMs129JigZzKtfDDKQP2XGxgtoSuBUoiE=;
 b=KwPKwXtHiSwM+qNiiC3T1qjUtOewzs46RoKAckypIPKVGgw15pHZcBdZ2LGdyiAXNr
 bii5d1k+heY0WYib0YxJKw18eKcUF3VPf/reMz70l1ytQDiU/KfdEpG93rDFJhLfRsNb
 fNkPTDDalV2AsugccbUhG5VjdcbpNbJFU8hJC4yrX7jOvPHEK2GFFdXquNfegBRqy8is
 ICH9vhCsEVop31QBMq9ZplVWfdvR0bHvyDf0GLeG+084Hei3UzFcVTJ5ltQWhFd8XsVJ
 6LiXXBIPtfyfcBB7rI+/KFiuMEOoMz5oxc+nzJvRDiZugZFMNDVNX2/b82nv/grHmNd6
 XA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378752; x=1690970752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8c22mTwcbWMs129JigZzKtfDDKQP2XGxgtoSuBUoiE=;
 b=Nga2X/GeLQk9DZU809DESgfTxPzToQjSFVQoTnmX6pv/KscSdF3YGkLmFVsa4fKIVm
 iTdaHr6bAReKVLo0zF09LUUzLJgWYxuSLVJnz/y7pO4O1qmYJm6YqWHw1zBAeTzfTX0r
 n0Gl07Gu5T3Tpfw131cC2Q7s+D0FiYizA/HcUXfrOoWjSxBG1SFMSKiEjrDHG5ik8Vun
 v12OMIiwvzaPqDPpEvfhkz9nsnx2zm8wE1TF7977xOMLxosDQCBWKuS86sWiP+JoHzia
 SCTqZmGhdsJ6RE1UGj6lnuXxvni5mvgKkPHcRIUuDjhPsJ3MLyRV4K+HWBRNHWdx6Uwe
 Gxmg==
X-Gm-Message-State: ABy/qLaxfdvZGJt0N8rpOvi8paSUk5GpWJby6+cdFWhyLLwDaYhW+uTp
 mI9fWaMODw8+f+K84TWUZFOoMQ==
X-Google-Smtp-Source: APBJJlHE20l3UCxNvIHA4svgDJuCF6thqTuAEkxV/x7MWYyAou6RlNbmvC4wv1eTbHLdxObaERm/1A==
X-Received: by 2002:adf:fcc5:0:b0:314:1ba7:fb29 with SMTP id
 f5-20020adffcc5000000b003141ba7fb29mr7766310wrs.1.1688378751832; 
 Mon, 03 Jul 2023 03:05:51 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 28/37] target/arm: Use aesdec_IMC
Date: Mon,  3 Jul 2023 12:05:11 +0200
Message-Id: <20230703100520.68224-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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


