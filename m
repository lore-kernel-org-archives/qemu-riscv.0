Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34018C7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:26:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7RoZ-0003Ww-9W; Thu, 08 Jun 2023 22:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Ro6-0002yB-3A
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:54 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnb-0005hY-Rg
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:53 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1a28de15c8aso290141fac.2
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277461; x=1688869461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+lOYUQGr/W2hN41A+MbMW4B7XkhWFliC6iC1qe2q7c8=;
 b=zbpS69gzh/dR28tCj8pisAa4WcDflkfTGy34MML4nwm224mHp68pxd8rw/fqix2T4f
 xkqOV/t6pfQl33O7MS8TK3EZSnkdYzMHFcva9He5YHwrDapHfK+7VRvDN49qvwUekK3c
 qN8UJZuwcq4Trr25e4gP0LTzGX2wjF2OnRfNpGd4N8EwG1+7xJOQ6RMXsG/o1TUvKPjR
 NJc1TaA4IpEi6+t9oGPLBL5qqf6Ol0IYXaTuhh15wUQ8OhKfKTNtEJiiKPi7F/akFqny
 OXmidwh/llLp3QxVnUZVeVoBkprE9qZ/gboVVqH5Q7JmdizhXPtEC4Rbw4+fwrRLMs7D
 8LKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277461; x=1688869461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+lOYUQGr/W2hN41A+MbMW4B7XkhWFliC6iC1qe2q7c8=;
 b=OufqO9NLzQHprxM87g6yP59rVHShMLMsnZoby6+lnBrc3n1rpMcJe7m4p7w7Met/hl
 GJaS9soAztpWKwuNzreCBgIFNqgDXkEP5VG5OeHYm1vyEkPQflnk1MLGWJR5xiOCoUWs
 GlvHBMcxShpN3M5ZBdK7VO4HrlvDlfjcLF4a+bmZ63thxTU4Hqxh806+eMJcbzD2TDKh
 06wYlkWTjSqD8PCR3RAlj/3rYIJ/fV4n1hfJd8VAIOAdf2ri9Wy4PV4M9gMilPLXzZBT
 RtwBdPT2z44TTc3OwHabJTJcfV+hzmJthf+sEwSyV1LaOswvumfEfeslHiLcakOGlytt
 Tgiw==
X-Gm-Message-State: AC+VfDxx1yJe3Ke8uGBvH9I89QRBIqj1CbTNhVMXHf8LPIXIgRg2MktR
 gvsjRxeE3ci7KIHfFej2X34Ukg==
X-Google-Smtp-Source: ACHHUZ5TXCBAyKR6oBOE7Z+TcE3kgttcfeHVraoM6/NwhUTIuND4PbvTuT+NTYI924H3o+xudSEONg==
X-Received: by 2002:aca:b01:0:b0:38c:5a32:325b with SMTP id
 1-20020aca0b01000000b0038c5a32325bmr262270oil.41.1686277461655; 
 Thu, 08 Jun 2023 19:24:21 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 20/38] target/i386: Use aesdec_IMC
Date: Thu,  8 Jun 2023 19:23:43 -0700
Message-Id: <20230609022401.684157-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
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

This implements the AESIMC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 0a37bde595..893913ebf8 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2215,15 +2215,10 @@ void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 #if SHIFT == 1
 void glue(helper_aesimc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    int i;
-    Reg tmp = *s;
+    AESState *ad = (AESState *)&d->ZMM_X(0);
+    AESState *st = (AESState *)&s->ZMM_X(0);
 
-    for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = bswap32(AES_imc[tmp.B(4 * i + 0)][0] ^
-                          AES_imc[tmp.B(4 * i + 1)][1] ^
-                          AES_imc[tmp.B(4 * i + 2)][2] ^
-                          AES_imc[tmp.B(4 * i + 3)][3]);
-    }
+    aesdec_IMC(ad, st, false);
 }
 
 void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
-- 
2.34.1


