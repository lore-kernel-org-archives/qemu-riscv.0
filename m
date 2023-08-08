Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A963C001B0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:15:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD8X-0000BH-EW; Mon, 07 Aug 2023 23:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8W-00009m-3c
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:11:56 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8P-000090-Hf
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:11:55 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-686f8614ce5so5179829b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464308; x=1692069108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HftGyFuliXonCmDTfSQ595T2noxt1RPBvVTS1fEpJE4=;
 b=qyZ4ShXL/IiCMFN/uaOF8PrML7SdB9xDL81Mx3A6DQq5Sx0QJhmTdhXDeoHZZKwh5+
 oKgpoH0rHWQytnAsV4cOFC0pGnSbhSTo4ArfifOsWDtQ1suzW91GdNvlS8VChGCEOZND
 yTd6jD6fORf70WR3Y0IwbVzYQiscOJnzO6JlzNqdTzcPjEbBBPFaKnyTfuFmp5PH1Rlt
 kBVS3Ld4ry1eno0TZoplPwsU01L7OwqMyWXluCS871Gfy898tKQ0aK8MVbi9FwSaVQMA
 3dFBekgfS9/GkgvxCvUWn4y/A9B7jRRxE43qNo/lnttA8ztmf2TX4jBP6/5ITweMdnS+
 +C7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464308; x=1692069108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HftGyFuliXonCmDTfSQ595T2noxt1RPBvVTS1fEpJE4=;
 b=DHN29NxenNWWDaXaZPYz6bvgNPddztv7Aaxxqu4+5MDlq1Om5Rrw2iLv0GUNfbO9TR
 a4ZQCTTB0jxJSWYQqZIz8/UPEPTU8iA1p89Ezb5NPsWdss3m4E2gp0Sm60qiDIbyB+jq
 n2Zda6nmCw276HjqMzzuZoin8ms8v1d4R6Pkl4+32yRQIfMg07HXR9LrBy7Fm1EzMtGq
 kZ8mZW2qD0fvOFfRd6d7S/F3kSslu+6jQgvaGRSzbI5BXz8p9lRleWqEQJ0bHuC6D7lN
 Fq1WPYExOi2jF3dZFESaY8w9RMhoi7ncEBQPkraviLanWcM1EuQDZ3IIQFPVtnIKv4yp
 78yA==
X-Gm-Message-State: AOJu0YwNRoiJGZHYXinZ7SPe95LitIgWhQ3hKcGthXkZn7JMgq8qzCW4
 chGsLWwtiQzJYxAMeWSBuzdxgfP/fY7a+paPWeE=
X-Google-Smtp-Source: AGHT+IEKbzJODXUEMb2uzXoHkkEAPf14nOgafX93aEajGig5ygR+eYL2485qmJGnxysq0a1q3UKCpg==
X-Received: by 2002:a05:6a20:9154:b0:13e:8ce5:bed4 with SMTP id
 x20-20020a056a20915400b0013e8ce5bed4mr14442332pzc.7.1691464308275; 
 Mon, 07 Aug 2023 20:11:48 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 04/24] target/arm: Use tcg_gen_negsetcond_*
Date: Mon,  7 Aug 2023 20:11:23 -0700
Message-Id: <20230808031143.50925-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
 target/arm/tcg/translate-a64.c | 22 +++++++++-------------
 target/arm/tcg/translate.c     | 12 ++++--------
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5fa1257d32..ac16593699 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4935,9 +4935,12 @@ static void disas_cond_select(DisasContext *s, uint32_t insn)
 
     if (rn == 31 && rm == 31 && (else_inc ^ else_inv)) {
         /* CSET & CSETM.  */
-        tcg_gen_setcond_i64(tcg_invert_cond(c.cond), tcg_rd, c.value, zero);
         if (else_inv) {
-            tcg_gen_neg_i64(tcg_rd, tcg_rd);
+            tcg_gen_negsetcond_i64(tcg_invert_cond(c.cond),
+                                   tcg_rd, c.value, zero);
+        } else {
+            tcg_gen_setcond_i64(tcg_invert_cond(c.cond),
+                                tcg_rd, c.value, zero);
         }
     } else {
         TCGv_i64 t_true = cpu_reg(s, rn);
@@ -8670,13 +8673,10 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
         }
         break;
     case 0x6: /* CMGT, CMHI */
-        /* 64 bit integer comparison, result = test ? (2^64 - 1) : 0.
-         * We implement this using setcond (test) and then negating.
-         */
         cond = u ? TCG_COND_GTU : TCG_COND_GT;
     do_cmop:
-        tcg_gen_setcond_i64(cond, tcg_rd, tcg_rn, tcg_rm);
-        tcg_gen_neg_i64(tcg_rd, tcg_rd);
+        /* 64 bit integer comparison, result = test ? -1 : 0. */
+        tcg_gen_negsetcond_i64(cond, tcg_rd, tcg_rn, tcg_rm);
         break;
     case 0x7: /* CMGE, CMHS */
         cond = u ? TCG_COND_GEU : TCG_COND_GE;
@@ -9265,14 +9265,10 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
         }
         break;
     case 0xa: /* CMLT */
-        /* 64 bit integer comparison against zero, result is
-         * test ? (2^64 - 1) : 0. We implement via setcond(!test) and
-         * subtracting 1.
-         */
+        /* 64 bit integer comparison against zero, result is test ? 1 : 0. */
         cond = TCG_COND_LT;
     do_cmop:
-        tcg_gen_setcondi_i64(cond, tcg_rd, tcg_rn, 0);
-        tcg_gen_neg_i64(tcg_rd, tcg_rd);
+        tcg_gen_negsetcond_i64(cond, tcg_rd, tcg_rn, tcg_constant_i64(0));
         break;
     case 0x8: /* CMGT, CMGE */
         cond = u ? TCG_COND_GE : TCG_COND_GT;
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index b71ac2d0d5..31d3130e4c 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -2946,13 +2946,11 @@ void gen_gvec_sqrdmlsh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 #define GEN_CMP0(NAME, COND)                                            \
     static void gen_##NAME##0_i32(TCGv_i32 d, TCGv_i32 a)               \
     {                                                                   \
-        tcg_gen_setcondi_i32(COND, d, a, 0);                            \
-        tcg_gen_neg_i32(d, d);                                          \
+        tcg_gen_negsetcond_i32(COND, d, a, tcg_constant_i32(0));        \
     }                                                                   \
     static void gen_##NAME##0_i64(TCGv_i64 d, TCGv_i64 a)               \
     {                                                                   \
-        tcg_gen_setcondi_i64(COND, d, a, 0);                            \
-        tcg_gen_neg_i64(d, d);                                          \
+        tcg_gen_negsetcond_i64(COND, d, a, tcg_constant_i64(0));        \
     }                                                                   \
     static void gen_##NAME##0_vec(unsigned vece, TCGv_vec d, TCGv_vec a) \
     {                                                                   \
@@ -3863,15 +3861,13 @@ void gen_gvec_mls(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 static void gen_cmtst_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
     tcg_gen_and_i32(d, a, b);
-    tcg_gen_setcondi_i32(TCG_COND_NE, d, d, 0);
-    tcg_gen_neg_i32(d, d);
+    tcg_gen_negsetcond_i32(TCG_COND_NE, d, d, tcg_constant_i32(0));
 }
 
 void gen_cmtst_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
     tcg_gen_and_i64(d, a, b);
-    tcg_gen_setcondi_i64(TCG_COND_NE, d, d, 0);
-    tcg_gen_neg_i64(d, d);
+    tcg_gen_negsetcond_i64(TCG_COND_NE, d, d, tcg_constant_i64(0));
 }
 
 static void gen_cmtst_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
-- 
2.34.1


