Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84417EB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:14:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD8g-0000oX-Qy; Mon, 07 Aug 2023 23:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8d-0000Sn-Pg
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:03 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8U-0000Co-BD
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:03 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6bca3311b4fso4142414a34.0
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464313; x=1692069113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iebNd9NWSI/oGO+XQT1osPqubnSl7SPT7dJSjDKV1XY=;
 b=ZqW6SJLSkEAdiBvFrFcmzlg3z96e/GXhcNjv3WMtLnnw1cq3OPiNfEHVhoFzmhISYI
 iPXNcdi/ODyQ+OaetfQ+4xVrf0n9eymAlZ5bhojEEwLTyABkkIgQ7dFwQVZIgx1nZOTF
 H9LUC8uLnw3D1gTP9TN4EUw++ramt+EVyNVbkE9bVJLOm9hbUsWxEhipcrgMlZM7DpaN
 PNvNfvr/idVJFKq650FCR6gsTYtBG1XpRrBFE4OKHkWyuchjYVBn2Oli62jrNyt7hNoN
 oBHBCuvOSTb4AO1PI1iVlOE9Jh0t3r02KkLT9O1+758LIHQwy1kgNmGYkSNVTRlET5p9
 OP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464313; x=1692069113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iebNd9NWSI/oGO+XQT1osPqubnSl7SPT7dJSjDKV1XY=;
 b=gvUNtwnL7vvy4pjQ9omPwVytkH2Am5Adhs8+5LlhvZ8D/uzDpw9IOmqagg9SXYnItL
 peSTr5c41wmWqR5STzxTB88xPHrPSAxYrnlov+rIw1dll4+8nUIm9kR7/Q3F2PHXmzG0
 p9NdFo6LtvuqwkDbPQU2QEDP7GsgB4igLuX41MC+Oc1QFIb4XQHAC7sibDAumtDhUxra
 ctgUUZswtwsaISWkb+FBdxOofxw6GGphLc6mZyXpADTw5fGiYDcIQjEIEAnffK3vZlij
 9vnneiHVWq3T7dHvunBKV79gxpjD1nVqzrK9uJTgbMJITcApHzpK/QIkEKvKEyK9Kj+V
 Quwg==
X-Gm-Message-State: AOJu0YxmDzRafGQ7WGmTLZ+M0IupT8z98U4BH3VyCNTZzp3V+HvwH2PH
 RDD1b+5KNaX86aN+JFHgBZOJ5Q==
X-Google-Smtp-Source: AGHT+IEESRXVlrW6ypo4EX5o0xmO7w/FoZKTQ1Z1mxmv7s0sFlC/h0T3sYZsAFRVOXlJAazd83OxBg==
X-Received: by 2002:a05:6358:9322:b0:12f:22c1:66aa with SMTP id
 x34-20020a056358932200b0012f22c166aamr8858591rwa.3.1691464312730; 
 Mon, 07 Aug 2023 20:11:52 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 09/24] target/tricore: Replace gen_cond_w with
 tcg_gen_negsetcond_tl
Date: Mon,  7 Aug 2023 20:11:28 -0700
Message-Id: <20230808031143.50925-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 1947733870..6ae5ccbf72 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -2680,13 +2680,6 @@ gen_accumulating_condi(int cond, TCGv ret, TCGv r1, int32_t con,
     gen_accumulating_cond(cond, ret, r1, temp, op);
 }
 
-/* ret = (r1 cond r2) ? 0xFFFFFFFF ? 0x00000000;*/
-static inline void gen_cond_w(TCGCond cond, TCGv ret, TCGv r1, TCGv r2)
-{
-    tcg_gen_setcond_tl(cond, ret, r1, r2);
-    tcg_gen_neg_tl(ret, ret);
-}
-
 static inline void gen_eqany_bi(TCGv ret, TCGv r1, int32_t con)
 {
     TCGv b0 = tcg_temp_new();
@@ -5692,7 +5685,8 @@ static void decode_rr_accumulator(DisasContext *ctx)
         gen_helper_eq_h(cpu_gpr_d[r3], cpu_gpr_d[r1], cpu_gpr_d[r2]);
         break;
     case OPC2_32_RR_EQ_W:
-        gen_cond_w(TCG_COND_EQ, cpu_gpr_d[r3], cpu_gpr_d[r1], cpu_gpr_d[r2]);
+        tcg_gen_negsetcond_tl(TCG_COND_EQ, cpu_gpr_d[r3],
+                              cpu_gpr_d[r1], cpu_gpr_d[r2]);
         break;
     case OPC2_32_RR_EQANY_B:
         gen_helper_eqany_b(cpu_gpr_d[r3], cpu_gpr_d[r1], cpu_gpr_d[r2]);
@@ -5729,10 +5723,12 @@ static void decode_rr_accumulator(DisasContext *ctx)
         gen_helper_lt_hu(cpu_gpr_d[r3], cpu_gpr_d[r1], cpu_gpr_d[r2]);
         break;
     case OPC2_32_RR_LT_W:
-        gen_cond_w(TCG_COND_LT, cpu_gpr_d[r3], cpu_gpr_d[r1], cpu_gpr_d[r2]);
+        tcg_gen_negsetcond_tl(TCG_COND_LT, cpu_gpr_d[r3],
+                              cpu_gpr_d[r1], cpu_gpr_d[r2]);
         break;
     case OPC2_32_RR_LT_WU:
-        gen_cond_w(TCG_COND_LTU, cpu_gpr_d[r3], cpu_gpr_d[r1], cpu_gpr_d[r2]);
+        tcg_gen_negsetcond_tl(TCG_COND_LTU, cpu_gpr_d[r3],
+                              cpu_gpr_d[r1], cpu_gpr_d[r2]);
         break;
     case OPC2_32_RR_MAX:
         tcg_gen_movcond_tl(TCG_COND_GT, cpu_gpr_d[r3], cpu_gpr_d[r1],
-- 
2.34.1


