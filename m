Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7308CC7EE2A
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:36:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H6X-0000XM-C6; Fri, 02 Jun 2023 22:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6I-0000N1-Ff
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:43 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6C-0004ji-2j
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:41 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6af86627460so2592174a34.1
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759674; x=1688351674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bOy/7D0V1nmDJKV8o/vdRKDOk9tiJCT68kr08p43Sdw=;
 b=li2am/BJj+JZ0uuZCArtt3g71WyZK8tFfJvww2JvF0VlvmhwjFx2eE+9Mu2JuGVAKa
 4jOWht5+1j5Ggo1d7tlGjNe6c4YeCrspx2PktjCQwRhhqMjrRIG6ezgpww+HZTbxvbhM
 7cwAanA3EclRTUDwexpTZhSWGV6eCK6m6OyhUtKqOTQ3MQOUd2KxRe75TNzJrsf6KGV5
 hyRJ6PYL1++vPB+oA5qB2SMUPknxWG6ehxOuAJkW26etfu8BcplO4ah8HqRsmhURUVCh
 Atkqn1NZTuaoj5Khxn0G9P4qPA+222IIHvmTI3Kb7kPp+0Ful1LNxgEeIwXHUAW6oWzS
 n5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759674; x=1688351674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bOy/7D0V1nmDJKV8o/vdRKDOk9tiJCT68kr08p43Sdw=;
 b=PED3VLU4FjOh7Y6zCatKMnGl9I2FagykgnQzx24Q5hzwxEtjiZgus2H7BqUmB/TCuE
 goELtbYW3oME6rf0lP1TQcnj+3eJaPh5DTlM9/Ow/BGAw9xEgbEUQV7jpCv2PhDoOEgE
 /EoqtwQECLU6/Y1vybsa7HkRdoIEoE5RXhhgxU3Dyob+xs+xeim0Tmoh+V/X9CPCqoFu
 SyVQ3fivCT8GQcUZN3bWWJXMUqQWeiCuoqnqiDNZ19sSDU1GBnwkCd5mvKZ85fnmywrk
 cizVz6gWYgSQuPhpbYEZJToCydO+3RSXO8gUWvsRfPwSvTonwrP5gx0fak7RRNqWzxY2
 xEBA==
X-Gm-Message-State: AC+VfDzgzpchurriUar/1f0MRZiWQlW9eKxJV1B3S0LFeUglvDbkVQj0
 fTWyu7w75O6clgy61iJpDXjRPg==
X-Google-Smtp-Source: ACHHUZ5mzo2T35ovn97ow/mPL4AjKLb+HB0Z72c0JMxEPHpf30EkSk52l9svj+ubpWV8wiNIqEx3xg==
X-Received: by 2002:a05:6358:9103:b0:125:9f49:b1b9 with SMTP id
 q3-20020a056358910300b001259f49b1b9mr11044333rwq.12.1685759674092; 
 Fri, 02 Jun 2023 19:34:34 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 07/35] target/arm: Use aesenc_SB_SR
Date: Fri,  2 Jun 2023 19:33:58 -0700
Message-Id: <20230603023426.1064431-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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

This implements the AESE instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 75882d9ea3..5cebc88f5f 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -15,6 +15,7 @@
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 #include "crypto/sm4.h"
 #include "vec_internal.h"
 
@@ -70,7 +71,22 @@ void HELPER(crypto_aese)(void *vd, void *vn, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aese(vd + i, vn + i, vm + i, AES_sbox, AES_shifts);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vn + i);
+        AESState *rk = (AESState *)(vm + i);
+        AESState t;
+
+        /* Our uint64_t are in the wrong order for big-endian. */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1] ^ rk->d[1];
+            t.d[1] = st->d[0] ^ rk->d[0];
+            aesenc_SB_SR(&t, &t, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            t.v = st->v ^ rk->v;
+            aesenc_SB_SR(ad, &t, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1


