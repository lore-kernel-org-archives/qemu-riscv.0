Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIG37-0006xe-42
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 15:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG35-0006sC-OI
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:59 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2s-0003Cp-4i
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:58 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so228190pjw.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 12:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qlhkq1KnWytqWQYMYVE1HHAXhG14CZ9/5+/6OOdC+lU=;
 b=CDMwc9va8r7E361Wjo6ztVn78gQZ4hKp5l1C8rdBi8exNrsCbSS/pWGGVb+swAO/b5
 DNJYQm7wpJjC6su1QVePTZyrfuTDfXoFIh0bgWBIACfze7q0yNIxI8/QOSdm1y4yKbvY
 oCWXZZeFVrEJYerH/XMF3K2WqCQau2ViVZZAs0fQ5TouG2s9AOBOElZu1Cr7kXRWESJb
 DZ/Ebg5LViTWa/BHvcD2yyP7dl9CVfPiS9tdOivF/l7dWJ9BR8fFjtpe+wiL4R5/6HO3
 oX4Razsfj/DfKBrDuy7HCHfiCXvY6frzH/ZvitiFXpbSNFYqIzCroqtILphltoVoIN6T
 UrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qlhkq1KnWytqWQYMYVE1HHAXhG14CZ9/5+/6OOdC+lU=;
 b=YAxQPKOQwfqhtELbcbYggkdU5ULFDb4RWBYkowYiiIQyhoYCo66uLg1IvYg7aYDRQw
 XZkiOb8Qwy0XtREgVTMK3PO2IAPSdSEaLQGL4xYcLuhMZ8NFNk0g+dPoP5CmRbSK1ehH
 5QlxvAlSj1StCCabX2/19+WlIcYs6k0gzvmhY2uxrLDjFuhVf/QpmU4TVnyaBW06VAkX
 QPny5zavSEP6sStRwvUgd9gqC40fSJl2E2BwvLFA4N/C4oelCzCTfxkBSOoMUsHPW259
 jUMeRVF2TOP8ZkX8cQnjmRH5wDplugxMGt8TaWt8RxUCGuUOROF9ryL3kr7vEqgKww96
 kO+g==
X-Gm-Message-State: AOAM531EAgaP9jMP9kznNe59ni8WslgfwPS0ZVY3A+utvD0GHr7igkhn
 MGodL1hCp8xBlXeCoueWce1mxo+xkkNgnw==
X-Google-Smtp-Source: ABdhPJy7BaamQigaWCC/yZhZXXbD8Tb92fc19pifk8FLcSpCd4qrEO2W0FsBMrqlSDTkuwaMA7dIfA==
X-Received: by 2002:a17:90a:a389:: with SMTP id
 x9mr217450pjp.167.1629748544382; 
 Mon, 23 Aug 2021 12:55:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v5 19/24] target/riscv: Use {get,dest}_gpr for RVA
Date: Mon, 23 Aug 2021 12:55:24 -0700
Message-Id: <20210823195529.560295-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Aug 2021 19:56:00 -0000

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rva.c.inc | 47 ++++++++++---------------
 1 file changed, 19 insertions(+), 28 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index 3cc3c3b073..6ea07d89b0 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -18,11 +18,10 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
+static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
-    TCGv src1 = tcg_temp_new();
-    /* Put addr in load_res, data in load_val.  */
-    gen_get_gpr(ctx, src1, a->rs1);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
+
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
@@ -30,33 +29,33 @@ static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
     if (a->aq) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
     }
+
+    /* Put addr in load_res, data in load_val.  */
     tcg_gen_mov_tl(load_res, src1);
     gen_set_gpr(ctx, a->rd, load_val);
 
-    tcg_temp_free(src1);
     return true;
 }
 
-static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
+static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
-    TCGv src1 = tcg_temp_new();
-    TCGv src2 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
+    TCGv dest, src1, src2;
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
 
-    gen_get_gpr(ctx, src1, a->rs1);
+    src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
 
-    gen_get_gpr(ctx, src2, a->rs2);
     /*
      * Note that the TCG atomic primitives are SC,
      * so we can ignore AQ/RL along this path.
      */
-    tcg_gen_atomic_cmpxchg_tl(src1, load_res, load_val, src2,
+    dest = dest_gpr(ctx, a->rd);
+    src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+    tcg_gen_atomic_cmpxchg_tl(dest, load_res, load_val, src2,
                               ctx->mem_idx, mop);
-    tcg_gen_setcond_tl(TCG_COND_NE, dat, src1, load_val);
-    gen_set_gpr(ctx, a->rd, dat);
+    tcg_gen_setcond_tl(TCG_COND_NE, dest, dest, load_val);
+    gen_set_gpr(ctx, a->rd, dest);
     tcg_gen_br(l2);
 
     gen_set_label(l1);
@@ -65,8 +64,7 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
      * provide the memory barrier implied by AQ/RL.
      */
     tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + a->rl * TCG_BAR_STRL);
-    tcg_gen_movi_tl(dat, 1);
-    gen_set_gpr(ctx, a->rd, dat);
+    gen_set_gpr(ctx, a->rd, tcg_constant_tl(1));
 
     gen_set_label(l2);
     /*
@@ -75,9 +73,6 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
      */
     tcg_gen_movi_tl(load_res, -1);
 
-    tcg_temp_free(dat);
-    tcg_temp_free(src1);
-    tcg_temp_free(src2);
     return true;
 }
 
@@ -85,17 +80,13 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
                     void(*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
                     MemOp mop)
 {
-    TCGv src1 = tcg_temp_new();
-    TCGv src2 = tcg_temp_new();
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
 
-    gen_get_gpr(ctx, src1, a->rs1);
-    gen_get_gpr(ctx, src2, a->rs2);
+    func(dest, src1, src2, ctx->mem_idx, mop);
 
-    (*func)(src2, src1, src2, ctx->mem_idx, mop);
-
-    gen_set_gpr(ctx, a->rd, src2);
-    tcg_temp_free(src1);
-    tcg_temp_free(src2);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
-- 
2.25.1


