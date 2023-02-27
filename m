Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW1k-0007av-65
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1S-0007HK-J7
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:03 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1Q-0007Rq-PC
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:02 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso10967918pjv.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gk4H/gx5fzfdthfB0AF4cgfQbvoN/h/04Yaxfs06mIY=;
 b=dD0t6uI0pGApM5SWyG0MErMgEpv5CaKArSDb6d/nTo8GC0MZExohTA3tzFsf6PQQ/B
 nqeeY8lso8AUWVDB14Jk7/6b7dXZc0jhlI/T3JylJobHWkZE2lfqxYe8x7OnectdYM3T
 WmD6iI5J+S8s6uEvpZE+sPQO8Dq+jr6YbU8uw0Lg04mK8ZcxVKUka46M66YKxGGELM1u
 RAeIEB7GDjLiT/WWQ4RY2pcuxJn4yqBmUPGWYDDUq2oCRnuT4cQ5KOzxEdW7vgdSGzg3
 mZoZF+i8CcUritjaOdrYoaiC7pCRvDfgqLGlnQdF9BkIaLbAQ/ACvW6tL4qfy1hMIh7F
 imzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gk4H/gx5fzfdthfB0AF4cgfQbvoN/h/04Yaxfs06mIY=;
 b=ELdFBjclQ0cow3+5Z47vRAjajsI90L6B6LrTi4QPOLcHMZaXOjKYPRsz+bJilYbVVZ
 VqPL3W4Co2I4CRKqhLvq/wACHIeXtPp5p+VSbuxtw2dQKFDoWF+oNOrZx449vfnEgnGy
 aM8EzsWpDsS80gePITNLZ4CpQWXIHtcIyokrPzuUNOv6F7eToU8k74YFHS4qmhDIcTx0
 wD5C/PGEgusig00HiOAf8WeiRT9mfN4KgXU7Lc/+4jnhnOReC1YRXXBPLVWGyE3iLsA4
 eJMC29fkmWUf5K3T694m4Zx8buGycunxqsT8AZPqOZPtrGxIaGmscMt8PN8NsLLWp9en
 b71A==
X-Gm-Message-State: AO0yUKXYuSTJGu0CGZY4AvZShDFQOqhBPpYCHeAxhtxPF3ZW9u8qj3p1
 t9UEDpb+vYDpF6MhRJCYV4wBhA==
X-Google-Smtp-Source: AK7set9S2qWLaJTM3qzqHU47FR6GNIREaBLbElpYxQJTe0LnAMezy8tdPzj6J1wXxuN59HLKCd9R+g==
X-Received: by 2002:a17:902:e54a:b0:19d:ab83:ec70 with SMTP id
 n10-20020a170902e54a00b0019dab83ec70mr159826plf.45.1677475559952; 
 Sun, 26 Feb 2023 21:25:59 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:25:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 18/76] target/avr: Drop DisasContext.free_skip_var0
Date: Sun, 26 Feb 2023 19:24:07 -1000
Message-Id: <20230227052505.352889-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:26:06 -0000

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


