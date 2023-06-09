Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D62C7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:27:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7RpF-00064M-Nv; Thu, 08 Jun 2023 22:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RoL-0003AY-Mh
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:25:13 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rni-0005lT-AE
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:25:08 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-55ab0f7778cso852126eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277469; x=1688869469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
 b=bQqje872dN77MdSkbXlgB7b5nBR/0+OTusCO7qmAaB4H6MqdcoWoZtNjlpl38qZMlE
 mucODEnqp4BjLqCz5LrnicHiGejOs2Nu84nItr0Cx1pIswZ2iwrFYToWW/5ci3iUdnrn
 fPoai5qI2amIJJvzpborpROiVmmXRXCIctP8i40bFtRn1NQ/p6SmWIlhuHW96nYh0VxM
 QfM0VNW4/Vuv5GcpEfJl5pHy2+50S7nMQ9CR8OsKxbyeTPJReND85D16l7LZyNfCgP4l
 ecXjcsGe2wXkb/vForSHQ/LqPQpaq8+AddOXozr56An/o4xiTiWhwhYXtyRk/kluUSZX
 v8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277469; x=1688869469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
 b=Cc00Bb7lPUA0Vd+0IkoJ/eB1X/wPj2vEtxV70/MLqS1+KlHeZUFRs5CIlM54YtFaZQ
 9n5xVJ8vK+JaESHzWnqyptEVIQ42xamN/VIW5G822KVw6hnsG9XvltR/9HxnI4EyCx2K
 yGDI5DwHR0p47TguALpU2EHPpVc+ssRLMxSDb02BRiUTvOmtilAPhBRdksQouQUnQdaq
 LvCE75RpGCr6jLXSwvR/0G5m+4mjayx3ZN1yaKyyP6Z2N0nwVFXSLdX0gu1VCHTVuoCx
 I8sp4dd/0itj1CTMZYTAMP6xzpznLLOfpr53qFfZLytmQzl479OxDlBKZ3GhL0LtLXXS
 gjUw==
X-Gm-Message-State: AC+VfDzGcbdw/CqsOhmjXnQj4/ACE83QiWTGZCV8UzaPvaGpP9a9KwgE
 wpiVSugnCiTjAj05oocxi9opSA==
X-Google-Smtp-Source: ACHHUZ7gBWEnfnw5xEKo1I0bOFERMgwBBUb9nT/kvqiJWRReoIQHk0ArMqOpi0TcY17D/oDqEJBziQ==
X-Received: by 2002:a05:6808:313:b0:398:2b78:3272 with SMTP id
 i19-20020a056808031300b003982b783272mr279283oie.26.1686277468825; 
 Thu, 08 Jun 2023 19:24:28 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 28/38] target/i386: Use aesdec_ISB_ISR_IMC_AK
Date: Thu,  8 Jun 2023 19:23:51 -0700
Message-Id: <20230609022401.684157-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

This implements the AESDEC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 93a4e0cf16..a0e425733f 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2162,16 +2162,12 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
 
 void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
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
-        d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4 * j + 0])] ^
-                                    AES_Td1[st.B(AES_ishifts[4 * j + 1])] ^
-                                    AES_Td2[st.B(AES_ishifts[4 * j + 2])] ^
-                                    AES_Td3[st.B(AES_ishifts[4 * j + 3])]);
+        aesdec_ISB_ISR_IMC_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1


