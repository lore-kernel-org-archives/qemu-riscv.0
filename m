Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3106C7EE25
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:26:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Roy-0004O6-16; Thu, 08 Jun 2023 22:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnv-0002tI-Gy
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:44 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnZ-0005gW-3c
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:43 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6513e7e5d44so1057022b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277460; x=1688869460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N6iXZSXnCLQtjnIuP74mgzpVObleAywaFeG7GQpsIEc=;
 b=PvuSVdUsFfVgUkl74+RoDIvV8K+LDpzvs4YM1zaTYLNZ5B7I6oMGsgUxJHN1OKimbv
 Nu2wohnKhG51RoYO7q/g5zqwqIHATnG/RSjbD5+LZsmQlxrbFuh5VMZoGmURo8WyyRV5
 E693Cj3Auj/dmPjwdWJPFxAloxXHRGKKG9mLRTltvTv/a9WFhnQLy5zTwCTjDlwbK/aZ
 dielY5p8Oi+YA9kQi1gir/E3ssJ4iaQowgtGmvaBfKlrSbcGMu1zOKtNKjeMNdQ3KVwq
 AUjBUZqDuHlhAbJlsQdUVKSflIq/xt7rHHUjh/rcdUwqCIbtGGul9KwUSW7aKGvSCxCs
 rITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277460; x=1688869460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6iXZSXnCLQtjnIuP74mgzpVObleAywaFeG7GQpsIEc=;
 b=dlpHSqxVlwCOV3qB3J/xv4ppFfHdZNUHWtysUF3svofNitSNMlGDS/nERpTIwZgTAr
 hkRzlMcUJ2dmkcvqklNMO9skLHiYQMymY3rizZNE1fMOYz0X0ZGFR5/3xDVKZVnY11Na
 C9WvPArCzfmfwHQoTlquCZLglznxwc9q4slaP7gNjjUFnKPzyxE5+IA5d4ARKbxKPbdc
 LhZmJ6Qfh03UoOH4UUVzhn6kTOTtzl7ybR1I491RjDDylGwDZXoeI0y3GySKTzyfYLBj
 YDkR4f4Y97UxUiBHEDlIBPkdDKn1mVbrtlKzat1TdPD+KsDGDTvNvnA4jkzj9k0uKD3h
 Gsvw==
X-Gm-Message-State: AC+VfDzmiFbNIY/9qiNNlw1gdzj4ecKDh/eYW5glF+A8FzSkfbPyeCDo
 dmwxJv0PsKv1sGYbMIjN7jAdxw==
X-Google-Smtp-Source: ACHHUZ6DgAN5T4Orjnj/RA9jNnx3tknFIWk2rG++YOYrbE3mdNBcWoFmoANzpsn8tX/n9KW5na95KA==
X-Received: by 2002:a05:6a00:228e:b0:64d:41d5:d160 with SMTP id
 f14-20020a056a00228e00b0064d41d5d160mr3122pfe.20.1686277459775; 
 Thu, 08 Jun 2023 19:24:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 18/38] target/arm: Use aesenc_MC
Date: Thu,  8 Jun 2023 19:23:41 -0700
Message-Id: <20230609022401.684157-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

This implements the AESMC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index d2cb74e7fc..1952aaac58 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -124,7 +124,20 @@ void HELPER(crypto_aesmc)(void *vd, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aesmc(vd + i, vm + i, AES_mc_rot);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vm + i);
+        AESState t;
+
+        /* Our uint64_t are in the wrong order for big-endian. */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1];
+            t.d[1] = st->d[0];
+            aesenc_MC(&t, &t, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            aesenc_MC(ad, st, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1


