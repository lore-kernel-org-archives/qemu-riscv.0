Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDA9C77B7A
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:37:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H7e-0002YU-TF; Fri, 02 Jun 2023 22:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6U-0000WS-PY
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:55 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6I-0004o0-WA
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:54 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2566f66190dso2373391a91.1
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759681; x=1688351681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHMbOR1QTwjqbFmiHyO/57gsxTa7l7mfudPzWiBLsfE=;
 b=O2kQUFMAJssvVwjdVtP543asKyifbJiYycdkVPl+LZYcIhJF1fqerPkgNWxGM1XZuD
 6mVUtF1V9ahNEaLp0k8pqGKg31CdyO/ivX1u3LBpz+kknxm0njxuGI5DrPYOM0jehVjm
 wUZB05plRK+X1kC+r5uu4rEQUNVxbNYUiO5cFhxHYiSQiTlt5SjVHvjCpAl7iKf9jP5O
 G6M7sdgNUw0+J812mFTijS3ygJt9RGyCKKllwvilwyhnObYw70a1wMN7ycVkBML2iaxo
 gSp+GYhldBVRPfM/kaDwR/s1yansMNDpe5Eo3ooADUWVZR9GuwUAIBkbJPaJ6o/BkOyE
 zgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759681; x=1688351681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NHMbOR1QTwjqbFmiHyO/57gsxTa7l7mfudPzWiBLsfE=;
 b=AscxpI7e/jQFrKFKE4xttKI8OBZTDxO6BKpiLVbwpsYjxXeEQLc9XreKKqTNXRfIQh
 yVrJQ0CdLD6WSUgy9oqA2CEjuw3BnX8a30SMCwZtPAx4YOFuGbax7ZpPxWVHjnU+4kHo
 Wj3Eb4sffn7KEfXp6g86C3WjlvwQ2wO1XZCK6A3UNpab87NSqdN/pwXhrf6ByuGV2/O/
 KhEgASmkvm2JfKU+0MH3/CTx1HGgNpMs5AUEZA0y8YEoTLIf6vwwHq6yI6Y/6Dn45T9Y
 LQJkHLd/deoJw801dADi7wshHhw89TZUvZpflrXWTcjQ1wtM7yU2W56PLtvrKGM4gG97
 VXXg==
X-Gm-Message-State: AC+VfDxr3jQNsjTYvWvlQZ3UyNM6T2EiX3fxhMDDGMCUSazV0RJ1jEia
 U2Srbm4/Vv6fVxmXZ4KoAZ6Wj4W2EPEV8x/Vsyw=
X-Google-Smtp-Source: ACHHUZ5dFs35VUvuE694zuW0MPC2Zc3fUQY6PEC+/UQ/OYdlsdGEVzOhpD6AxsDSiChiHAuO0CLMOw==
X-Received: by 2002:a17:90a:de96:b0:258:b097:f692 with SMTP id
 n22-20020a17090ade9600b00258b097f692mr1512947pjv.43.1685759681615; 
 Fri, 02 Jun 2023 19:34:41 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 16/35] target/arm: Use aesenc_MC
Date: Fri,  2 Jun 2023 19:34:07 -0700
Message-Id: <20230603023426.1064431-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
index d7b644851f..a0fec08771 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -118,7 +118,20 @@ void HELPER(crypto_aesmc)(void *vd, void *vm, uint32_t desc)
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


