Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA83EB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:13:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD8c-0000Pe-O3; Mon, 07 Aug 2023 23:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8a-0000FD-7S
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:00 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8S-0000Aa-7H
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:11:59 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-56c4457c82eso3411308eaf.0
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464310; x=1692069110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h47eic5iqOAhfWM944hqigKUjin3wD6PihSMVViXfj4=;
 b=YX/AgPjYoKdPsJWZeDnQWP/3HpiHcPSPsqV0UpE4gi11KCPV2fV+EWNnqkbS4TaWq0
 V9uC7i9ATSDrLgg42Yd3IWllu1zq9zTV12zLSZpDjmWbUkioklZb4ESlfTOcbn4qC5N+
 AFXolAWevzAJtOAwvsBmzO/zXCpOPyIrAh0ETQ2oxzxNy87VnjRmdgYYo+W1lToamcsy
 lDCNdzaUWnpCUft1B0zmDcev0zF2uum3k4QipAJsS+y1EYuKVXtrg7DovHF1gL/6PUVL
 yJNXAclzNDUKrcQTytsEK0v+MOuhemjU3J52BB7YDA1d/QSA86NwG+M222b1ySepiDoj
 n+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464310; x=1692069110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h47eic5iqOAhfWM944hqigKUjin3wD6PihSMVViXfj4=;
 b=DpHTfwUhb47WXRbtEYBZYO1A0an3CF7CuS14WJMezE6seYGgLuTjA6GnNQU5ZcE3y2
 zFJSOC3QIGY/w4vnSyPjNSLVrfmjZoxM4mun+Fv0k6hPfw5VnAVvjllpx1YN6rNV+noz
 YCc7kbnD6iDRDHoDwm6X+WaTLdpvHplTZ8W6oBhpra+3efOQmLdzTTPq1uUYEmkGu0Hz
 Jwd1sr08PIytxpzPce7rze+Uqlw3ac18mixcQLVRm1sugrQsVdlkojHCTegpYN0jdv+p
 yvSgGsUdEnehjoioK/ngDmlOn/vjxUnmLpZxwGVFWHuG0x8QCjiOTD+47OagiKCDBEnV
 pFrg==
X-Gm-Message-State: AOJu0YxLbsywGA36J3Lkgzdr+3WPSHtDJ+fxlVYxxHLsrhNUxk5z/3Ib
 MXXQ4EGHnajZu76mKGvpRigw2A==
X-Google-Smtp-Source: AGHT+IHWgxPdPxHqenLkylTu3XkySprr/foIGfy+EAHpq5/mGiZgbbNeWKmIbPK1xgATDvTv/5u47Q==
X-Received: by 2002:a05:6808:23d2:b0:3a3:f7b8:576f with SMTP id
 bq18-20020a05680823d200b003a3f7b8576fmr14401720oib.19.1691464310780; 
 Mon, 07 Aug 2023 20:11:50 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 07/24] target/ppc: Use tcg_gen_negsetcond_*
Date: Mon,  7 Aug 2023 20:11:26 -0700
Message-Id: <20230808031143.50925-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2a.google.com
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
 target/ppc/translate/fixedpoint-impl.c.inc | 6 ++++--
 target/ppc/translate/vmx-impl.c.inc        | 8 +++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index f47f1a50e8..4ce02fd3a4 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -342,12 +342,14 @@ static bool do_set_bool_cond(DisasContext *ctx, arg_X_bi *a, bool neg, bool rev)
     uint32_t mask = 0x08 >> (a->bi & 0x03);
     TCGCond cond = rev ? TCG_COND_EQ : TCG_COND_NE;
     TCGv temp = tcg_temp_new();
+    TCGv zero = tcg_constant_tl(0);
 
     tcg_gen_extu_i32_tl(temp, cpu_crf[a->bi >> 2]);
     tcg_gen_andi_tl(temp, temp, mask);
-    tcg_gen_setcondi_tl(cond, cpu_gpr[a->rt], temp, 0);
     if (neg) {
-        tcg_gen_neg_tl(cpu_gpr[a->rt], cpu_gpr[a->rt]);
+        tcg_gen_negsetcond_tl(cond, cpu_gpr[a->rt], temp, zero);
+    } else {
+        tcg_gen_setcond_tl(cond, cpu_gpr[a->rt], temp, zero);
     }
     return true;
 }
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index c8712dd7d8..6d7669aabd 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1341,8 +1341,7 @@ static bool trans_VCMPEQUQ(DisasContext *ctx, arg_VC *a)
     tcg_gen_xor_i64(t1, t0, t1);
 
     tcg_gen_or_i64(t1, t1, t2);
-    tcg_gen_setcondi_i64(TCG_COND_EQ, t1, t1, 0);
-    tcg_gen_neg_i64(t1, t1);
+    tcg_gen_negsetcond_i64(TCG_COND_EQ, t1, t1, tcg_constant_i64(0));
 
     set_avr64(a->vrt, t1, true);
     set_avr64(a->vrt, t1, false);
@@ -1365,15 +1364,14 @@ static bool do_vcmpgtq(DisasContext *ctx, arg_VC *a, bool sign)
 
     get_avr64(t0, a->vra, false);
     get_avr64(t1, a->vrb, false);
-    tcg_gen_setcond_i64(TCG_COND_GTU, t2, t0, t1);
+    tcg_gen_negsetcond_i64(TCG_COND_GTU, t2, t0, t1);
 
     get_avr64(t0, a->vra, true);
     get_avr64(t1, a->vrb, true);
     tcg_gen_movcond_i64(TCG_COND_EQ, t2, t0, t1, t2, tcg_constant_i64(0));
-    tcg_gen_setcond_i64(sign ? TCG_COND_GT : TCG_COND_GTU, t1, t0, t1);
+    tcg_gen_negsetcond_i64(sign ? TCG_COND_GT : TCG_COND_GTU, t1, t0, t1);
 
     tcg_gen_or_i64(t1, t1, t2);
-    tcg_gen_neg_i64(t1, t1);
 
     set_avr64(a->vrt, t1, true);
     set_avr64(a->vrt, t1, false);
-- 
2.34.1


