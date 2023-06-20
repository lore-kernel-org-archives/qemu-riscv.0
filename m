Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AF0EB64D7
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:13:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZDy-0006Rq-Lu; Tue, 20 Jun 2023 07:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDw-0006Pl-LN
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:36 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDt-0004Qw-Bc
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:08:36 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9883123260fso330016366b.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259312; x=1689851312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+os3nHQ/ZmARewYX8s5fRYkcgS0NtfZNFjYHPGkpaM4=;
 b=zfwlUnoT+9JYRJvMcXFhJoA7pLYnBP6H3iplCQEVsslkAUnW+LsRlFYN/x7yYDqRuc
 ruU/2SksY61jTarLwbbvFWlAkPuSSpBjsqq4937hH07bWqpahgahlUUFWAaatvk2KTBt
 EkSkShmKZqHVsn5j55bv0hG5UOirLvq1cwzIuN4enGmx7mCE1fwTXgmQ3kGCEfYlai9z
 vll1pdSqOZC55Y0rxJh5UJCt9PIP7Se6qWA9Pp4ztzSRn0eThRL4YZ0aYvLjbVgLR+pe
 9vtRkAQvrukhnUcAP7gkdju53yqLevZmMbbAloDcm2cIUI9ICTR+kH+CWtLHdur39Uz8
 dZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259312; x=1689851312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+os3nHQ/ZmARewYX8s5fRYkcgS0NtfZNFjYHPGkpaM4=;
 b=W0G10qw02CfspYMJ3B3Jv5YD/S3Sg9sWiVNr20sXI8yQlChXqeVkRRra6hv36POPR3
 NY7Sa+676IH18RvMuWxZ43+bCQ3WaBlq7tQw6E52NP46sHsUMaE0MZhgIZpGVlmxyUWm
 r0s3/BXHRfkoIfdXAHPqrO66Gba4cZFHZ8SAEpKP6H4OiqUMiHW9U3tjWkOalgw/h89h
 3dmujSDDAefp/tqAitf3e64aWcDZi5EfQEATzEHN2oDfeLbaoZ+MRMR96srLKCtsfmpL
 /qkuUP+dwJ3LrLQqPImoMYRKU+zhqP/9K3Byu+7ropJN6J3c0za2q2It0I9EtlOTHfJ5
 mOFg==
X-Gm-Message-State: AC+VfDzuqHNtA5F15SGQmJqFbA7vXZsUeMIeShz1bP+QK+Ix4L1RfnL+
 HfVRndat2hhuQ9An07MKnF+wQQ==
X-Google-Smtp-Source: ACHHUZ4sALdWkSlM03Xa03zvulAe+q2XIwYIwtn9N1x4ChMqOXm4qh7qQZcZ3oRx/myHi9Jjj3ONVQ==
X-Received: by 2002:a17:907:7b96:b0:982:3e2a:91a8 with SMTP id
 ne22-20020a1709077b9600b009823e2a91a8mr11045159ejc.72.1687259311971; 
 Tue, 20 Jun 2023 04:08:31 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 23/37] target/i386: Use aesenc_SB_SR_MC_AK
Date: Tue, 20 Jun 2023 13:07:44 +0200
Message-Id: <20230620110758.787479-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x636.google.com
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

This implements the AESENC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 893913ebf8..93a4e0cf16 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2188,16 +2188,12 @@ void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
 void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0 ; i < 2 << SHIFT ; i++) {
-        int j = i & 3;
-        d->L(i) = rk.L(i) ^ bswap32(AES_Te0[st.B(AES_shifts[4 * j + 0])] ^
-                                    AES_Te1[st.B(AES_shifts[4 * j + 1])] ^
-                                    AES_Te2[st.B(AES_shifts[4 * j + 2])] ^
-                                    AES_Te3[st.B(AES_shifts[4 * j + 3])]);
+        aesenc_SB_SR_MC_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1


