Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW23-0008UK-Bj
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:26:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW21-0008Sr-Pt
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:37 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW20-00079Z-0l
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:26:37 -0500
Received: by mail-pl1-x62f.google.com with SMTP id i5so3838424pla.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqHQnIXQuU7WvdYNKGsRU9JQ3hqtUaL0pq9Pxj9E05Q=;
 b=xuKMdqLyePGrT8T8X4T1rSMKzLfAJ8hjh2mMUUhGyFD/asKHRywZaxly+A0z+0UPht
 q7HhrqwACefN/KSfANTn87bNecKxkTUvFsy6nF+xQfOZnpbcIEuimU5DkgBgfqzFPdA9
 eEBpm/8KGThZuHJrnFfZbyKe7hJMh/4IwwEhKOkl1dSsIadRUAT9PonjQcAgiGePrREP
 k4blLPIybMqAdUhwiwQ3EBg44VFOXtOb/gaRGTqxowL6VRKR8aWSFW0tICuowSWq2Gj4
 +Qj/PLtONYs5i+sC4gKhfZSZbEykckOQ/b4LCrjRRGbwxivCiV98qMBxxBDepgRQpVlL
 iwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gqHQnIXQuU7WvdYNKGsRU9JQ3hqtUaL0pq9Pxj9E05Q=;
 b=WOaanU5YLqJJp/VyFtJtWurIDawC3Z+rSaErKAD1J46zFjXhsYSxtqec53MOe6+q40
 il8a0e7ZwvE2HSEBVFqU85Pbj+rRLf62Y30RGMbbQly2RXJis0gMwoOWOYkYC1TkrzhB
 akdJtu8TnK0K66FniWV+t6Pk0zDVC7REtaGyzCn1T15T4ghzQZznFyUS/WE6mfYFcQ7p
 3L060jHy+82kitj2VEBRgmNRaY6dPjYsaFMmHHVGMDbM9G2XXUuBr2Vg6d4YM54jF01q
 2nQEgFpOnGQaGyQHBdhCrRlibs6zXCSdzBKNwK7Qxn/TKOR4TOsWT84+SYwuuZH8gXDm
 19og==
X-Gm-Message-State: AO0yUKX9OZ1wY+uCzan75vamu7JKxrx02i7ptLxfjdLjpIRD1CA+u8rc
 q8tuFAklktxzL+2/BpcCqOU7yqSeQkz8SCEXmQs=
X-Google-Smtp-Source: AK7set9flOMYHu+5yY08p20lwRc05Y8JTvoYJPp3tSqOGeJWCCwF99EGghAD7X5C4P+YLs/uxtT2VQ==
X-Received: by 2002:a17:903:80c:b0:19c:dbce:dceb with SMTP id
 kr12-20020a170903080c00b0019cdbcedcebmr8450701plb.44.1677475595233; 
 Sun, 26 Feb 2023 21:26:35 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 31/76] target/loongarch: Drop temp_new
Date: Sun, 26 Feb 2023 19:24:20 -1000
Message-Id: <20230227052505.352889-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:26:38 -0000

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new.

Reviewed-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/translate.h                  |  3 ---
 target/loongarch/translate.c                  | 21 +++----------------
 .../insn_trans/trans_privileged.c.inc         |  2 +-
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
index 6d2e382e8b..67bc74c05b 100644
--- a/target/loongarch/translate.h
+++ b/target/loongarch/translate.h
@@ -32,9 +32,6 @@ typedef struct DisasContext {
     uint16_t mem_idx;
     uint16_t plv;
     TCGv zero;
-    /* Space for 3 operands plus 1 extra for address computation. */
-    TCGv temp[4];
-    uint8_t ntemp;
 } DisasContext;
 
 void generate_exception(DisasContext *ctx, int excp);
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 2a43ab0201..f443b5822f 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -85,9 +85,6 @@ static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
     bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
     ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
 
-    ctx->ntemp = 0;
-    memset(ctx->temp, 0, sizeof(ctx->temp));
-
     ctx->zero = tcg_constant_tl(0);
 }
 
@@ -110,12 +107,6 @@ static void loongarch_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
  *
  * Further, we may provide an extension for word operations.
  */
-static TCGv temp_new(DisasContext *ctx)
-{
-    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
-    return ctx->temp[ctx->ntemp++] = tcg_temp_new();
-}
-
 static TCGv gpr_src(DisasContext *ctx, int reg_num, DisasExtend src_ext)
 {
     TCGv t;
@@ -128,11 +119,11 @@ static TCGv gpr_src(DisasContext *ctx, int reg_num, DisasExtend src_ext)
     case EXT_NONE:
         return cpu_gpr[reg_num];
     case EXT_SIGN:
-        t = temp_new(ctx);
+        t = tcg_temp_new();
         tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
         return t;
     case EXT_ZERO:
-        t = temp_new(ctx);
+        t = tcg_temp_new();
         tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
         return t;
     }
@@ -142,7 +133,7 @@ static TCGv gpr_src(DisasContext *ctx, int reg_num, DisasExtend src_ext)
 static TCGv gpr_dst(DisasContext *ctx, int reg_num, DisasExtend dst_ext)
 {
     if (reg_num == 0 || dst_ext) {
-        return temp_new(ctx);
+        return tcg_temp_new();
     }
     return cpu_gpr[reg_num];
 }
@@ -195,12 +186,6 @@ static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         generate_exception(ctx, EXCCODE_INE);
     }
 
-    for (int i = ctx->ntemp - 1; i >= 0; --i) {
-        tcg_temp_free(ctx->temp[i]);
-        ctx->temp[i] = NULL;
-    }
-    ctx->ntemp = 0;
-
     ctx->base.pc_next += 4;
 }
 
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index 40f82becb0..56f4c45e09 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -243,7 +243,7 @@ static bool trans_csrwr(DisasContext *ctx, arg_csrwr *a)
         dest = gpr_dst(ctx, a->rd, EXT_NONE);
         csr->writefn(dest, cpu_env, src1);
     } else {
-        dest = temp_new(ctx);
+        dest = tcg_temp_new();
         tcg_gen_ld_tl(dest, cpu_env, csr->offset);
         tcg_gen_st_tl(src1, cpu_env, csr->offset);
     }
-- 
2.34.1


