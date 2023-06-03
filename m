Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A941C7EE2C
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:36:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H7b-0002Bp-Pc; Fri, 02 Jun 2023 22:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6a-0000Yx-EW
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:35:02 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6O-0004hI-CX
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:35:00 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-55554c33bf3so2072372eaf.2
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759687; x=1688351687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xQJo2C3OKYrLdgG+Avv/itkRaFPUqHtuD2xcYh5Lh3Y=;
 b=OdXJUkKlmbPfOIMb4syHFC9vqCA+CKjZqxnq3kv6h4Z5znXuxTl126Ci6RAxADj7Ew
 vkAKmgkAx1asIQSc+sWpnSJyrguLuzoq2M2P8MjPCjz9mzUCQuE1MUs7ULJbf6eRNyBv
 lmfBmvYwzRUA2pcuWHXY0k0H28CqCA/HZJlt3r9C+ncfxRVgnmgu6igPSiaO+lbfnVJU
 QuN4Dlls9KZWNvu01cbpxJa+IG8xPXYQjTsJIMkn93y43HCNqLp0WjKAl1Y0tT0hOWvt
 vF74OPKA+qKn3L/9M8cp7BU+6H69Db6DO73cKKyLeA2yKjqtfLIV4Kwn9mPWht73ysu4
 ciog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759687; x=1688351687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQJo2C3OKYrLdgG+Avv/itkRaFPUqHtuD2xcYh5Lh3Y=;
 b=NPfJSmlW6by5XtHFXLTMlNp43j/5DCaOuN3pCf6PG1Zp52uZj4TMc59hnHazZHjHUi
 CZCjlymOQlvAHqwUxJznG28WiheNeUIghuJB76yDXBzyO+72qPqsE0Web6Oli3NzeH8z
 KRjW9S3ikHlBGJVjYG4QOVDq69v8vWiJHwNv/A7RCZSTlSwTyhEaExtEYMopZh4SiafT
 RRt6B8TYixmWtzqykbw7SX6eXV4oYvI3YdJ4gmIM2eEyT6HjXtHzT25Ze/xyNm5PJz5e
 SOCn51IUoyJzKFZaICG3f+ctJ/xvXUgB1dJOwXe+Oz6S4kw3mmYxavdUWKUoPD/HFH8d
 QLDQ==
X-Gm-Message-State: AC+VfDy0ubWz7nazOwDX2aToz/711Vm+ApqTXY55b9KGRE0c+6epJxXt
 nDRC7meXFHGzW7Wtt0dCfbvGGw==
X-Google-Smtp-Source: ACHHUZ6K+lWlDOTAeUEFtcOfA/A5VTgW5oUjvsptqbKaf2TQ6hiujjzcb/bRVyarCSiq3fRSb1wVzQ==
X-Received: by 2002:a05:6358:4315:b0:123:3ea3:2bd2 with SMTP id
 r21-20020a056358431500b001233ea32bd2mr11882291rwc.32.1685759687666; 
 Fri, 02 Jun 2023 19:34:47 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 22/35] target/i386: Use aesenc_SB_SR_MC_AK
Date: Fri,  2 Jun 2023 19:34:13 -0700
Message-Id: <20230603023426.1064431-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2f.google.com
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

This implements the AESENC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 0187651140..c7a2c586f4 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2190,16 +2190,12 @@ void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
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


