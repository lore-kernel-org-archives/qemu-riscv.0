Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD4FC7EE25
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:31:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Rnt-0002sB-Tr; Thu, 08 Jun 2023 22:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnp-0002oR-IO
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:37 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnU-0005cd-Oe
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:37 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-652d1d3e040so1008476b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277455; x=1688869455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wWEoR37K9gKQXXFZPMySJPPLhvqTL7g38psR7hdJt8=;
 b=woDFIUodVWeVCFUaXiri11M22BWOoEqik9IFVurNEiKu1T3EDLih7cQwPmf1Hve8JO
 kjLY05+lIZR4GuIL7oTsijbJbc1xf8xbVysV0M/2Ir4cWda8QWGHB8Pkocg8gvPezt09
 CeUZlMOEoRWx3emF+WlHy/bkxcq2Ecukq8EMvEJxCO70tdC8+u/kycYz7jsfuRcQ+6s2
 1bLBDrrQ5sW8ajXx1DvqIbjmBT17U6amTWFWJPIjD24vugaJ4RTBAUPkSPYrrSbkw7/K
 jUDrPnTFAWNjvR0rZ1cRDTrlHtsMWbXFbAkW1mHZ9wcJIR1tDWcFq+cZDhhmGZUHxwIj
 sYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277455; x=1688869455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wWEoR37K9gKQXXFZPMySJPPLhvqTL7g38psR7hdJt8=;
 b=CxA2+bKIWqvb8DUCiaGRNfMwNdK2ic6Vvghs4hC23vmRCZJfFzSW6TulpsKDA1Ni8t
 GFLv2re0QuvYBBhDDxQ+FWYes0V5V+px9WxusS/j7HBl7InZHJ8UrleHh+2ap3g37Yek
 V0CwabfVvpGvrTBrPGTXZqbGLzJJG1w+dWFKC45J/V3L5aY5jcMg+8WDatBDvz41Xn8+
 IyPk9feI0TPHfYKLMuYY33c5wFPpgYTV9rXIOm798Z/myYQxrbGTxb0Ip5ixdSklT0pW
 yRCqfNJFgBtH/rwS9zFQ5EvHZgIkowSbdsOsFjC4IQN5jtyi/mwMTIx0Mv/J4MwQNoes
 YaeQ==
X-Gm-Message-State: AC+VfDyl/L1YncN/q1YZ4JB6mOeOX/2gmYJeJol1p1uvat20V0un8J0r
 Bqos6j6OHu5MxV8YMvidWE4j3Q==
X-Google-Smtp-Source: ACHHUZ6crJcfcnBkZXz0LSaZ0P78PhalzZh1z4n4QhacxepKM1ZjaoQl7o1sGANDbYtSWIfFE/Wgvg==
X-Received: by 2002:a05:6a00:1acd:b0:662:24ac:c336 with SMTP id
 f13-20020a056a001acd00b0066224acc336mr28035pfv.8.1686277455296; 
 Thu, 08 Jun 2023 19:24:15 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 13/38] target/i386: Use aesdec_ISB_ISR_AK
Date: Thu,  8 Jun 2023 19:23:36 -0700
Message-Id: <20230609022401.684157-14-richard.henderson@linaro.org>
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

This implements the AESDECLAST instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 63fdecbe03..0a37bde595 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2177,12 +2177,12 @@ void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
 void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0; i < 8 << SHIFT; i++) {
-        d->B(i) = rk.B(i) ^ (AES_isbox[st.B(AES_ishifts[i & 15] + (i & ~15))]);
+        aesdec_ISB_ISR_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1


