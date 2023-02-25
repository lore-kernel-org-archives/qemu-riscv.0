Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqeK-0005UC-PP
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:15:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeI-0005O4-Qq
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:22 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeG-0001QZ-NK
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:15:22 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so1594337pjp.2
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gk4H/gx5fzfdthfB0AF4cgfQbvoN/h/04Yaxfs06mIY=;
 b=suNpt0pDQTMGF2fMldFl0FlVEjPl5/R4AMUOdUWP/WBXW+X1gTEyBndsufG6P+hWNB
 j5blJpSYmU96kRlwOMApWzjVOAX2uuPr8Z79ZRJlxepdac/7C1q7UgMK7dx/Rfll+eZ4
 kI3X+aT6/e+ZmAsAVjfTGxiu2JeUD4o4SKjy4Ig91c3i8hsZNp53vReOi9u3pucT0VoP
 osrXciR1CmjYxOUObtxvaHFmeV4PKdSleSB6tviP5Dj6P/lWGZrh2lcNxHz4oCYwUFyR
 5DTFngbNNULSF2DQcG6hIBARPaLz39B3bqDhQjVGAkP8SBzMhFhIe/MdQeNQsHAKklL+
 WHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gk4H/gx5fzfdthfB0AF4cgfQbvoN/h/04Yaxfs06mIY=;
 b=5NnYveenpKtjkR7Rzn7wbbJQw+cUsyfDZRaVStLDcTdu3DVPPF+qtqOQVEbrM+7z3P
 xIPc/BfL0JcfD+0no1AWtA7qvjQyH4GiyCDSQYvzCfF+rQT7IxmHjb36OxA6J06LDSUZ
 6JNM15dQFaXh8GlZ6LwfuU4NVuDR2+51LIKlOzZQSB3SVvFMs4Fgzq/L0g8JNcCTPAXc
 dFUd/mOKHGS+U0PsQPYuU2o+XeDKGB1dzvYWrnZ63UxglVedSBnsUrnlJUhM8b0jfB9Y
 FwckBiFATqOkf5PMkkEp5cB+E2wjOBybwI/oC6q8dex6pv1+/oTl9fO7Bqkf/BTdyzU9
 xq1g==
X-Gm-Message-State: AO0yUKUA8sRdxyUKfJ4yF68b6eKnv9PytIB3vRLvDN1NQ1r65dJBVrLp
 H1jsz5yXPbuUWiLhnMzPkTwhk3YV0bhuId/qSro=
X-Google-Smtp-Source: AK7set/VGel5kiOsDXE77CuAm0lv+3CPD2pDVgzugc4RYUQbeW2ysPp7FXRItqsTNI/ZdA6Y1Adogg==
X-Received: by 2002:a17:903:187:b0:196:5d8d:2d6f with SMTP id
 z7-20020a170903018700b001965d8d2d6fmr22917111plg.13.1677316519706; 
 Sat, 25 Feb 2023 01:15:19 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 18/76] target/avr: Drop DisasContext.free_skip_var0
Date: Fri, 24 Feb 2023 23:13:29 -1000
Message-Id: <20230225091427.1817156-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 25 Feb 2023 09:15:23 -0000

Translators are no longer required to free tcg temporaries,
therefore there's no need to record for later freeing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index e40d8e9681..e7f0e2bbe3 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -107,11 +107,6 @@ struct DisasContext {
      *     tcg_gen_brcond_tl(skip_cond, skip_var0, skip_var1, skip_label);
      * }
      *
-     * if (free_skip_var0) {
-     *     tcg_temp_free(skip_var0);
-     *     free_skip_var0 = false;
-     * }
-     *
      * translate(ctx);
      *
      * if (skip_label) {
@@ -121,7 +116,6 @@ struct DisasContext {
     TCGv skip_var0;
     TCGv skip_var1;
     TCGCond skip_cond;
-    bool free_skip_var0;
 };
 
 void avr_cpu_tcg_init(void)
@@ -1375,7 +1369,6 @@ static bool trans_SBRC(DisasContext *ctx, arg_SBRC *a)
 
     ctx->skip_cond = TCG_COND_EQ;
     ctx->skip_var0 = tcg_temp_new();
-    ctx->free_skip_var0 = true;
 
     tcg_gen_andi_tl(ctx->skip_var0, Rr, 1 << a->bit);
     return true;
@@ -1391,7 +1384,6 @@ static bool trans_SBRS(DisasContext *ctx, arg_SBRS *a)
 
     ctx->skip_cond = TCG_COND_NE;
     ctx->skip_var0 = tcg_temp_new();
-    ctx->free_skip_var0 = true;
 
     tcg_gen_andi_tl(ctx->skip_var0, Rr, 1 << a->bit);
     return true;
@@ -1410,7 +1402,6 @@ static bool trans_SBIC(DisasContext *ctx, arg_SBIC *a)
     tcg_gen_andi_tl(temp, temp, 1 << a->bit);
     ctx->skip_cond = TCG_COND_EQ;
     ctx->skip_var0 = temp;
-    ctx->free_skip_var0 = true;
 
     return true;
 }
@@ -1428,7 +1419,6 @@ static bool trans_SBIS(DisasContext *ctx, arg_SBIS *a)
     tcg_gen_andi_tl(temp, temp, 1 << a->bit);
     ctx->skip_cond = TCG_COND_NE;
     ctx->skip_var0 = temp;
-    ctx->free_skip_var0 = true;
 
     return true;
 }
@@ -2886,10 +2876,6 @@ static bool canonicalize_skip(DisasContext *ctx)
         ctx->skip_cond = TCG_COND_NE;
         break;
     }
-    if (ctx->free_skip_var0) {
-        tcg_temp_free(ctx->skip_var0);
-        ctx->free_skip_var0 = false;
-    }
     ctx->skip_var0 = cpu_skip;
     return true;
 }
@@ -2944,7 +2930,6 @@ static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
              * This ensures that cpu_skip is non-zero after the label
              * if and only if the skipped insn itself sets a skip.
              */
-            ctx->free_skip_var0 = true;
             ctx->skip_var0 = tcg_temp_new();
             tcg_gen_mov_tl(ctx->skip_var0, cpu_skip);
             tcg_gen_movi_tl(cpu_skip, 0);
@@ -2956,10 +2941,6 @@ static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                               ctx->skip_var1, skip_label);
             ctx->skip_var1 = NULL;
         }
-        if (ctx->free_skip_var0) {
-            tcg_temp_free(ctx->skip_var0);
-            ctx->free_skip_var0 = false;
-        }
         ctx->skip_cond = TCG_COND_NEVER;
         ctx->skip_var0 = NULL;
     }
-- 
2.34.1


