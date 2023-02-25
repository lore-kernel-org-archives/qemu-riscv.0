Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqjc-0007ca-Eh
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqil-0005UZ-Ku
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:19:59 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqih-00031L-2L
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:19:58 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so713431pjg.4
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BOxM+Tb1bwmnIEw8dgEhWm1s4rF8ejPxKOa7NUQZfU4=;
 b=sT7RtYuPLKxOiqyYPM8KS1XQRDVfNkxBwcsoj+UawZfLC8X+/pOkaOX/pfgyX1TJem
 Prv2SsfWjbXm5mcVdBa8nvdljWULfbr6IYw7SXsPimS+9o498Nt0O/WthFa9EIWSBBIu
 HiojcBzJpNc4KppcplOeHoZRhuyaNCk1jgt0qIyiQb13cQQhYEE64j1IHsAGL/MYnk0E
 DprHq+Z1EC7mWP7PzmAkCiG/KbhYhZiBM8BQ7rMDBugGnKp6Z0i7D047hIyP5lUhQhKw
 6uM9y87z8oHL60IPW5OLIj5uWEjt8XsS+ccoHC7Ylo4jj+wnFLPb15JeeCIApKN4+qZ+
 5Xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BOxM+Tb1bwmnIEw8dgEhWm1s4rF8ejPxKOa7NUQZfU4=;
 b=uvGy0WVPS8i6I+kIWOfP1XUQY9P5lTg402xFHN6JVUwnnM6i8YiWS4fqjbPG4E/OIE
 l+6akyLIcKXfA/Z19qqRWckHpMq/JWwe4Ytl9eDEzzTrbqxmRCV4KHhW64FNdW3yGMFW
 2Goy9nDjwzWzP3T02+m+zNNet6GH1+hXPxoQ8I5ZoCgn/xJWwmfeGTbCkcHoZFjpjdc5
 cxI8PIHLRdA1kKEVNLc5rSBspjiuzdyOqJsoJeDx5bC9rsHXhBf/MySJuOtaZkkmONRO
 fj6jOrIZMieRseGVqHJwCRr7JOEEukvnvUCZGaVglgRQ4d4SrCSuqnmtVdkyi07KNOoz
 Sztg==
X-Gm-Message-State: AO0yUKWPRzJLolKavtE4bGHwSTsjZ3+N8lE5VsexTw0PYuGYnlLdlGEZ
 C5094xqLc9TCfYGaHJCMHDUXyw==
X-Google-Smtp-Source: AK7set/SSsyArhDi2S8aTfTSwWUs4FZ9YEYfG4YE4VIyXrTFAznS30POs3rAsawmYk+WKmkLp5IylQ==
X-Received: by 2002:a05:6a20:9148:b0:cc:dca8:cfdc with SMTP id
 x8-20020a056a20914800b000ccdca8cfdcmr517085pzc.2.1677316785918; 
 Sat, 25 Feb 2023 01:19:45 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:19:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 51/76] target/riscv: Drop ftemp_new
Date: Fri, 24 Feb 2023 23:14:02 -1000
Message-Id: <20230225091427.1817156-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:20:00 -0000

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new_i64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f9d5d1097e..273e566d66 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -106,9 +106,6 @@ typedef struct DisasContext {
     TCGv zero;
     /* Space for 3 operands plus 1 extra for address computation. */
     TCGv temp[4];
-    /* Space for 4 operands(1 dest and <=3 src) for float point computation */
-    TCGv_i64 ftemp[4];
-    uint8_t nftemp;
     /* PointerMasking extension */
     bool pm_mask_enabled;
     bool pm_base_enabled;
@@ -431,12 +428,6 @@ static void gen_set_gpr128(DisasContext *ctx, int reg_num, TCGv rl, TCGv rh)
     }
 }
 
-static TCGv_i64 ftemp_new(DisasContext *ctx)
-{
-    assert(ctx->nftemp < ARRAY_SIZE(ctx->ftemp));
-    return ctx->ftemp[ctx->nftemp++] = tcg_temp_new_i64();
-}
-
 static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
 {
     if (!ctx->cfg_ptr->ext_zfinx) {
@@ -450,7 +441,7 @@ static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
     case MXL_RV32:
 #ifdef TARGET_RISCV32
     {
-        TCGv_i64 t = ftemp_new(ctx);
+        TCGv_i64 t = tcg_temp_new_i64();
         tcg_gen_ext_i32_i64(t, cpu_gpr[reg_num]);
         return t;
     }
@@ -476,7 +467,7 @@ static TCGv_i64 get_fpr_d(DisasContext *ctx, int reg_num)
     switch (get_xl(ctx)) {
     case MXL_RV32:
     {
-        TCGv_i64 t = ftemp_new(ctx);
+        TCGv_i64 t = tcg_temp_new_i64();
         tcg_gen_concat_tl_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1]);
         return t;
     }
@@ -496,12 +487,12 @@ static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
     }
 
     if (reg_num == 0) {
-        return ftemp_new(ctx);
+        return tcg_temp_new_i64();
     }
 
     switch (get_xl(ctx)) {
     case MXL_RV32:
-        return ftemp_new(ctx);
+        return tcg_temp_new_i64();
 #ifdef TARGET_RISCV64
     case MXL_RV64:
         return cpu_gpr[reg_num];
@@ -1207,8 +1198,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->cs = cs;
     ctx->ntemp = 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
-    ctx->nftemp = 0;
-    memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
     ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
@@ -1244,11 +1233,6 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
         ctx->temp[i] = NULL;
     }
     ctx->ntemp = 0;
-    for (i = ctx->nftemp - 1; i >= 0; --i) {
-        tcg_temp_free_i64(ctx->ftemp[i]);
-        ctx->ftemp[i] = NULL;
-    }
-    ctx->nftemp = 0;
 
     /* Only the first insn within a TB is allowed to cross a page boundary. */
     if (ctx->base.is_jmp == DISAS_NEXT) {
-- 
2.34.1


