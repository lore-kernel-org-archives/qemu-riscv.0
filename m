Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD52C7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:32:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7RpL-0006uO-AQ; Thu, 08 Jun 2023 22:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RoT-0003IH-Jy
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:25:18 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnm-0005nk-Kw
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:25:16 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-65292f79456so983422b3a.2
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277473; x=1688869473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GHeF3JWLCWlD48DcYvVGojmVS0x5PfQCVoIO1xTMCXo=;
 b=ezDLsu1vdM8a71QXEj0oFRJcSZ+yNmxoRzb2rgxmfuncQv3t0Aae5KM0OUuQXbYk0g
 5WOgvP3Ykw7zOdu/x3ywuZsCdWlhXhZQxx2jqHz9/7FTdVF2XjdfzkE3fE4c41B/zWfQ
 Z1ZE63+kroLKrxygolLrErXZaK1XKTmKABPVvtQ7mbRmZT7GqRNkMhiSF8k0Ca6y8LnF
 MkbnGMhde2rL3im3uBd0eYnwPP+NE008LcEntHkoYjhNGGiWNn6yOnfajJqydtQDlVlA
 oU8tNrIMzMYe5Itj42nJSTT/m4pYWr6eG1PsiQSwfhf+g1Om/Q+arvr6vHyjoUoG3fAY
 B0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277473; x=1688869473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHeF3JWLCWlD48DcYvVGojmVS0x5PfQCVoIO1xTMCXo=;
 b=AXMvpQRW/UJc+nF4qb/gLb6FaWBBqpeqOxaC02Y3QAZSzIax3mt1/+sgfboCDARos2
 uUxkEXLLGWy1vUilW2uDHzfr00gi6hTHtNK8Ge90DurAWmYnWhBQ5kVF5lPYXlykxI/T
 xMW8A5ZJM/93zfMSVjePblO2112UxH4Ez0oQ7mIcbYFbohIJB7Xs52qc/lUpPq3Z5sMG
 11MvbXMnsLf+jWsPeESx14F8fwcANe38rA07B12T5lh1gfWDQ8qV9ZQVqKj6A596WytJ
 ib0RPdTZ0ml1S2zgu6sefPQUCHQ8xE/JCTTwGFbTCgdoVuGhuc+P/m1bEsco9Oh5bApn
 i94g==
X-Gm-Message-State: AC+VfDw6VdbuxHKLh0X+mcYr34oEJZwHPNguFND2oNdq4HciSyy5wWYf
 91rKzBbGJWO5tKfzbW28ewrT+8tby9Pzhq9NFeA=
X-Google-Smtp-Source: ACHHUZ7Wqaz4T/VXKm+PGB8nwpMeC2En4THj14zoN4qQeoYthS7KyJwdI/DleQY4BF9XRYXrCyhWXw==
X-Received: by 2002:a05:6a00:22d1:b0:65b:351a:e70a with SMTP id
 f17-20020a056a0022d100b0065b351ae70amr7707542pfj.29.1686277473382; 
 Thu, 08 Jun 2023 19:24:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 33/38] crypto: Implement aesdec_IMC with AES_imc_rot
Date: Thu,  8 Jun 2023 19:23:56 -0700
Message-Id: <20230609022401.684157-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

This method uses one uint32_t * 256 table instead of 4,
which means its data cache overhead is less.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 crypto/aes.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/crypto/aes.c b/crypto/aes.c
index 7b8a22fe3e..4da2cd7077 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1446,39 +1446,39 @@ aesdec_IMC_swap(AESState *r, const AESState *st, bool swap)
     bool be = HOST_BIG_ENDIAN ^ swap;
     uint32_t t;
 
-    /* Note that AES_imc is encoded for big-endian. */
-    t = (AES_imc[st->b[swap_b ^ 0x0]][0] ^
-         AES_imc[st->b[swap_b ^ 0x1]][1] ^
-         AES_imc[st->b[swap_b ^ 0x2]][2] ^
-         AES_imc[st->b[swap_b ^ 0x3]][3]);
-    if (!be) {
+    /* Note that AES_imc_rot is encoded for little-endian. */
+    t = (      AES_imc_rot[st->b[swap_b ^ 0x0]] ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x1]], 8) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x2]], 16) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x3]], 24));
+    if (be) {
         t = bswap32(t);
     }
     r->w[swap_w ^ 0] = t;
 
-    t = (AES_imc[st->b[swap_b ^ 0x4]][0] ^
-         AES_imc[st->b[swap_b ^ 0x5]][1] ^
-         AES_imc[st->b[swap_b ^ 0x6]][2] ^
-         AES_imc[st->b[swap_b ^ 0x7]][3]);
-    if (!be) {
+    t = (      AES_imc_rot[st->b[swap_b ^ 0x4]] ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x5]], 8) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x6]], 16) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x7]], 24));
+    if (be) {
         t = bswap32(t);
     }
     r->w[swap_w ^ 1] = t;
 
-    t = (AES_imc[st->b[swap_b ^ 0x8]][0] ^
-         AES_imc[st->b[swap_b ^ 0x9]][1] ^
-         AES_imc[st->b[swap_b ^ 0xA]][2] ^
-         AES_imc[st->b[swap_b ^ 0xB]][3]);
-    if (!be) {
+    t = (      AES_imc_rot[st->b[swap_b ^ 0x8]] ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0x9]], 8) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xA]], 16) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xB]], 24));
+    if (be) {
         t = bswap32(t);
     }
     r->w[swap_w ^ 2] = t;
 
-    t = (AES_imc[st->b[swap_b ^ 0xC]][0] ^
-         AES_imc[st->b[swap_b ^ 0xD]][1] ^
-         AES_imc[st->b[swap_b ^ 0xE]][2] ^
-         AES_imc[st->b[swap_b ^ 0xF]][3]);
-    if (!be) {
+    t = (      AES_imc_rot[st->b[swap_b ^ 0xC]] ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xD]], 8) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xE]], 16) ^
+         rol32(AES_imc_rot[st->b[swap_b ^ 0xF]], 24));
+    if (be) {
         t = bswap32(t);
     }
     r->w[swap_w ^ 3] = t;
-- 
2.34.1


