Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B69EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:07:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGGRQ-0002po-4j; Mon, 03 Jul 2023 06:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRI-0002e7-Gc
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:05:48 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRE-0005rQ-01
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:05:48 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3112f5ab0b1so4700637f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378741; x=1690970741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5yB3KjFB+U9E0IGbPxBILX7NHTWOiWyWbVzWyod1A2Y=;
 b=joR4m/ClJeRpoob+t5+QnStkdNFoxeTqfQX2yViVC46KO8kYWovTf89P8V7IYr+Oos
 EvFwMsu2XhPCpfSYyOyj197LvUN+uyCBja2AyU9fy3uoIrlrnS4KRBC0izuUzOzHYgbm
 smVoL85LinnLzkiXD+MISmbYxQWwCe6bjaY81jTj2uBWzQXqHnorTvcc7i4CS7qx5iQx
 OoQ2GqgjtBUrJwRByW8dE1iDFMOBnuZcNz4kaO2RiClgTvzKykzFAEnfgWrJbFR2mg5t
 12oVanW9YC6tUBLRtS4MOWkZOPJTlweeCB+/D7QSfC/GHQi/rciO8hVKTc0Nx5POIjV4
 JuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378741; x=1690970741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5yB3KjFB+U9E0IGbPxBILX7NHTWOiWyWbVzWyod1A2Y=;
 b=gmqOYwXzgIzr4dd0dOQSAAnpp9/6Ofuj61zU8Ni6v3os9Qk7ZB120IUTx5zFrfI3kQ
 kxD3augET6SOWOvUM4V1U1BBSa3gX6CPViiJJNX7squ3Ew6zCpVJLHPO8ln2rebA2CSc
 wEEEFMbUstY6rKCld/UCOPG7kvSCL/Vh191d6Gy2Z83tvawOSA2jcQRj6QqSEZMmta4O
 TmyuwrN4G64pE+6S77ABKTb4NN9sYgzVeg0aDiSsPOfvM41az3oAhhEkf90jHskhravY
 R7fBPfLjvDyJIibpyc6EbQqIOLBt/omAHfEQTiBQt0BrBLipyUSY/VMAry42+FEozuV8
 B67g==
X-Gm-Message-State: ABy/qLaAaa2/slWfUTWYk+OrnIgYIk3n46CjI8Ja0IudJdU+t/vvdsVj
 r8GH6RI5HsDVlqJ3P7DatAxAhg==
X-Google-Smtp-Source: APBJJlHffpZ/OpXAg7uvfnKlL79jVR66Kr1p0PZ5UUI3MDUX1zaZmuOHzdNIR1rkyMBOUNq+40mtcg==
X-Received: by 2002:adf:fd43:0:b0:313:f5f8:a331 with SMTP id
 h3-20020adffd43000000b00313f5f8a331mr8284810wrs.34.1688378740035; 
 Mon, 03 Jul 2023 03:05:40 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 17/37] target/ppc: Use aesenc_SB_SR_MC_AK
Date: Mon,  3 Jul 2023 12:05:00 +0200
Message-Id: <20230703100520.68224-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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

This implements the VCIPHER instruction.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 15f07fca2b..1e477924b7 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2933,17 +2933,11 @@ void helper_vsbox(ppc_avr_t *r, ppc_avr_t *a)
 
 void helper_vcipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    ppc_avr_t result;
-    int i;
+    AESState *ad = (AESState *)r;
+    AESState *st = (AESState *)a;
+    AESState *rk = (AESState *)b;
 
-    VECTOR_FOR_INORDER_I(i, u32) {
-        result.VsrW(i) = b->VsrW(i) ^
-            (AES_Te0[a->VsrB(AES_shifts[4 * i + 0])] ^
-             AES_Te1[a->VsrB(AES_shifts[4 * i + 1])] ^
-             AES_Te2[a->VsrB(AES_shifts[4 * i + 2])] ^
-             AES_Te3[a->VsrB(AES_shifts[4 * i + 3])]);
-    }
-    *r = result;
+    aesenc_SB_SR_MC_AK(ad, st, rk, true);
 }
 
 void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1


