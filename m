Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49350C7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:29:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Rnm-0002lE-AV; Thu, 08 Jun 2023 22:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnY-0002bN-S7
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:22 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnP-0005ZI-Jv
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:19 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-64d18d772bdso1318342b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277449; x=1688869449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtPI4aq2jyFLtOkSRUNw1Edg2O5XrlHB9lkxc+y7YR8=;
 b=k3oyLNnHSLFITjqaFD+WjQp4W2cV4L1DXSSMI1PxyPdw7hM4oJoVHBmUztnIo6HJhj
 Ed4jzMvWPInSdibF3AOC7m4M18C6jjGIws9Za0Y73CtsGPzDbo13jh1faChQCBk3f/K/
 plW8XYN8lOcgjEcaUptLiAhGOTjyaN3jO+kRoIIh1hHXxo61gHxebDh5JYW9MM48YFKl
 jvVfHG9KWL0QjNo6VYSlEjq0P+i5LOlcvDzczOwi27ZQgLRYSgOYt9pBXeGNbcOotHXk
 L6kOD7+xmM+M/JRaLR+AYQD/+1RhqCt7O6QoRp1iOLBcvraC+H2BV3m9Ano0p8rx1SrG
 LFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277449; x=1688869449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xtPI4aq2jyFLtOkSRUNw1Edg2O5XrlHB9lkxc+y7YR8=;
 b=CqfH4VZ3oZe2ePR7wM9COCqxxb/O0satiLowoU+b3F5vae77UEBOlBUyXeibeKBD1r
 ue0rqlUIiUApNeXVUuIGBvLe9tnh2IFNSl0ahO7FB2bdgPQc2rG45l/nWyZHcmibG6pI
 akM9mMhwwfnGQg5BKVax8PkiSFi36SJbebILoiT10vMAIzPlcahxetP4IWRMrsl19VE8
 xXVErDW5Aq4Pp2J3Qtw9AnDJiJyQhHMxFeUZaf/uN0vw//RBI9d5rSNK2wYWLtpYKrlI
 z/bGh0cMhC2ItA7D/JuIZFhkyFneGI9gkpgLmcs1KCWxG5sv1vsHHjs5eatEoZSTV6xs
 ttJQ==
X-Gm-Message-State: AC+VfDzNfrcu8PpZvMzfqK7BM5dl0yC9k4NyOOq2qbqmNXRdwbd7yAsD
 zzQbQZu+mg61RjuiO4KonmaD2g==
X-Google-Smtp-Source: ACHHUZ5wQo5olZ0X1JudgWUuQWlrLjQ5A7Q2aQR8WR7EV967Ken56AAUXQzaZrrDchKfDxcTyHSgaA==
X-Received: by 2002:a05:6a00:1a87:b0:65b:a187:d433 with SMTP id
 e7-20020a056a001a8700b0065ba187d433mr48792pfv.6.1686277449662; 
 Thu, 08 Jun 2023 19:24:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 07/38] target/i386: Use aesenc_SB_SR_AK
Date: Thu,  8 Jun 2023 19:23:30 -0700
Message-Id: <20230609022401.684157-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

This implements the AESENCLAST instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index fb63af7afa..63fdecbe03 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -19,6 +19,7 @@
  */
 
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 
 #if SHIFT == 0
 #define Reg MMXReg
@@ -2202,12 +2203,12 @@ void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
 void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0; i < 8 << SHIFT; i++) {
-        d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i & 15] + (i & ~15))]);
+        aesenc_SB_SR_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1


