Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383DBEB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:15:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD9R-0003SD-7y; Mon, 07 Aug 2023 23:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8s-0001bK-D2
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:20 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8c-0000JZ-Br
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:18 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-56c96982829so3629698eaf.0
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464321; x=1692069121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5bAv2VkeF2nF/Nch+eWToS5kdoZdnIAW3FmjUUhtDDU=;
 b=SUUPWgh+XIMAPs7bvA4YCksr0dMjMZVJDkI9hzC6Ku7umWLcpE/uAZT4Tnq97H48lD
 TTj/Fy9BFJPnjcGwBwaG6sdZg/cSqnSb61KEDIV6rTSioQ6woN049qJkFFaP79jEDh8I
 kKSKLM2FETsJfq/xAOvMDMboIKQXPXs/YUs9JIPI1emJaE2cAYiajzKEBqIUjsV/PzqM
 j1fV3dRwxR3KT/gW6lZZ1m6OTt/iXkaTAj1rTla/FZoeKkmCdm50AOrfjDFE8VvpsJeD
 nt0bDeaFRSdMeDfFDzD/lTJy1EeChsJI47M0GzOJxxHV1p71WSpgsWHQJmqmtpxPZobn
 EYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464321; x=1692069121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5bAv2VkeF2nF/Nch+eWToS5kdoZdnIAW3FmjUUhtDDU=;
 b=HdTaU2uUid9OOYEXkJHN4xYQZZZZOujWPx1ePuaMp4zbw/M8QsMvWvJD8cf+VIkx85
 eq985Sy1gN9qqYs+8mMWNvcGAiZzslHtj9sQdr0VAAYgTPD3UD3f1NPKlsR2iQvL4fYN
 BvGUAhJJIQx8WsHKfZJT9Plko3j6jELmYBoVa0tPrzZ8taelCAIhLaUnIUiWaHqx7l0R
 g54eEppkRVgrlEYf8tx43Axi0Wlmiqp2o/T07XlpuGXrgrAP7DiXsWgOR1205aitpKaz
 DDmi3CPPvbj9H9TpcRmCchBCxqdAb8gCqn0AX8PPPcqmvakZTXkJdIKAknpWeCzXZ9rk
 FmLg==
X-Gm-Message-State: AOJu0Yyw30BCBggF+zukYX3LkdnDyv7SWGnoLZuV95ZbFJf5d6/hhxrJ
 F8l21wMB9vpFSlW2VNgcme/Wyg==
X-Google-Smtp-Source: AGHT+IGCRUZv8SyCwzVdSnph8+vaIWmk7xHFufrzLKQeDcaUu+J5LR7Mb3E+jI1UWOHCokpmyjOxwA==
X-Received: by 2002:a05:6358:7250:b0:134:e777:c78b with SMTP id
 i16-20020a056358725000b00134e777c78bmr9986135rwa.5.1691464320876; 
 Mon, 07 Aug 2023 20:12:00 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:12:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 18/24] tcg/i386: Merge tcg_out_setcond{32,64}
Date: Mon,  7 Aug 2023 20:11:37 -0700
Message-Id: <20230808031143.50925-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc30.google.com
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

Pass a rexw parameter instead of duplicating the functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index b9673b55bd..ec3c7012d4 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1524,23 +1524,16 @@ static void tcg_out_brcond2(TCGContext *s, const TCGArg *args,
 }
 #endif
 
-static void tcg_out_setcond32(TCGContext *s, TCGCond cond, TCGArg dest,
-                              TCGArg arg1, TCGArg arg2, int const_arg2)
+static void tcg_out_setcond(TCGContext *s, int rexw, TCGCond cond,
+                            TCGArg dest, TCGArg arg1, TCGArg arg2,
+                            int const_arg2)
 {
-    tcg_out_cmp(s, arg1, arg2, const_arg2, 0);
+    tcg_out_cmp(s, arg1, arg2, const_arg2, rexw);
     tcg_out_modrm(s, OPC_SETCC | tcg_cond_to_jcc[cond], 0, dest);
     tcg_out_ext8u(s, dest, dest);
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static void tcg_out_setcond64(TCGContext *s, TCGCond cond, TCGArg dest,
-                              TCGArg arg1, TCGArg arg2, int const_arg2)
-{
-    tcg_out_cmp(s, arg1, arg2, const_arg2, P_REXW);
-    tcg_out_modrm(s, OPC_SETCC | tcg_cond_to_jcc[cond], 0, dest);
-    tcg_out_ext8u(s, dest, dest);
-}
-#else
+#if TCG_TARGET_REG_BITS == 32
 static void tcg_out_setcond2(TCGContext *s, const TCGArg *args,
                              const int *const_args)
 {
@@ -2565,8 +2558,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond(s, rexw, a2, a0, a1, const_args[1],
                        arg_label(args[3]), 0);
         break;
-    case INDEX_op_setcond_i32:
-        tcg_out_setcond32(s, args[3], a0, a1, a2, const_a2);
+    OP_32_64(setcond):
+        tcg_out_setcond(s, rexw, args[3], a0, a1, a2, const_a2);
         break;
     case INDEX_op_movcond_i32:
         tcg_out_movcond32(s, args[5], a0, a1, a2, const_a2, args[3]);
@@ -2718,9 +2711,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
-    case INDEX_op_setcond_i64:
-        tcg_out_setcond64(s, args[3], a0, a1, a2, const_a2);
-        break;
     case INDEX_op_movcond_i64:
         tcg_out_movcond64(s, args[5], a0, a1, a2, const_a2, args[3]);
         break;
-- 
2.34.1


