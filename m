Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E78AC7EE2E
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:36:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H7O-0001Ol-5B; Fri, 02 Jun 2023 22:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6O-0000Qh-1z
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:48 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6F-0004l9-69
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:46 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6af93a6166fso2578348a34.3
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759677; x=1688351677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XkRgnPsc0Ve6BufNeSHHC/2pZ6sOVWVoi1e0lmM14MQ=;
 b=nvfMKk7KtkK3U2aye2JQ5Hub0UYgYp2CJfccQEzqOJroixiktXEuswj6zJph3rS2kV
 Eye0wliBHUThuARCeXYu6xvPZ8ribE1DvuW6LfO8AR9lXqAz/XaGBT+RGaje3/ruO85p
 7VuXM/tF8uOOCsuvsq+jndA7GDgoNcO4x+gytr/Z5n05gSQcjdsYtE5AgorbR4GNZqRY
 9ITBjK2UdlLHEV+r23oaoIXP/BfGo1r+6ChLkPrPmTzN/4l1f2VgEDe8CPkRBz7c+cph
 weIzUgeT0VZwsOs3jep+w8wMolBidcWKqy8nWT3CGG4kHVkMykAMpE76f2jYSQHMmUMv
 8v3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759677; x=1688351677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XkRgnPsc0Ve6BufNeSHHC/2pZ6sOVWVoi1e0lmM14MQ=;
 b=BlQZhVf8msi8XDuU7L1H7bRPZIDoLo8uQGvOYww5eyEtB7gjiCYUFJTds0WpZIOMQ5
 GHdXpTdLHSWTd6en+dVMMARabM4EZlZXpXoaJiXhPRuORqAIf/C5I4a23AZWzjRl4qrM
 UV+zdz1qzuTwwSfb7WpMKlc3tslt9NDk9CAJMrBu7cEn9F8mcW2aKxft+betFEm2aMAp
 0Q4kea64rz/bJhgOxxCYjjoseG5SQcXuf3iteArKWELYaAcLKJF74n7o/o50jdbWjjWC
 OiFLs54/yRtfyEK/KFTiD384O2ky87OzMZL97sBjqPyIvO4mpGHy+am3dSN1D82F9pAH
 vkTQ==
X-Gm-Message-State: AC+VfDxjGEWI5N3n5y2HZane5LwBdHBzBaSIlx88bMKUhcS/IIz4xfHJ
 SxQHU7bWtIDP1DvK+9cwlW9T9w==
X-Google-Smtp-Source: ACHHUZ7VlM9IWW6bY0QF257SLhMWdCOgesJoeL5MRHNGhKqr71BDPgFpxVYI7aoQxd82qcVfxris4g==
X-Received: by 2002:a05:6358:3403:b0:125:908e:22c9 with SMTP id
 h3-20020a056358340300b00125908e22c9mr13305538rwd.10.1685759677532; 
 Fri, 02 Jun 2023 19:34:37 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 11/35] target/i386: Use aesdec_ISB_ISR
Date: Fri,  2 Jun 2023 19:34:02 -0700
Message-Id: <20230603023426.1064431-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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

This implements the AESDECLAST instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 31e1f6edc7..036eabdf95 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2177,12 +2177,14 @@ void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
 void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
+        AESState t;
 
-    for (i = 0; i < 8 << SHIFT; i++) {
-        d->B(i) = rk.B(i) ^ (AES_isbox[st.B(AES_ishifts[i & 15] + (i & ~15))]);
+        aesdec_ISB_ISR(&t, st, false);
+        ad->v = t.v ^ rk->v;
     }
 }
 
-- 
2.34.1


