Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mG6Tn-0001y4-10
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 17:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6Tj-0001pX-EL
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:35 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6Tg-0001Gd-Cy
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:35 -0400
Received: by mail-pj1-x1036.google.com with SMTP id oa17so1281655pjb.1
 for <qemu-riscv@nongnu.org>; Tue, 17 Aug 2021 14:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O4Nyyfchw7ka6xBuv/frcGz+7bIxeXKGfnY6JSWCHr0=;
 b=V+AgwGmgbeKYdFQt8JcaPXe+kM1AV/ypmTrOdCGFd+szLLKct//CPbSywjIV1zwwot
 VtzUA7aJgQVS+wwMuK18hphUrPPLglYA1ND27IMW/HqRpUtxlc9PX+3qCleH7933e+F0
 n62I4NZtYiLeZYiq3hXQI1OJDtvA97VYd5dlQCf1PGUoIcK6/bRWxiDJPzrjJchiAfXX
 PxO6R5Q8qlN+HQINoBBIcKdBtnDnJoedzEXqPkiMpOwEh17hftSwT4ltSsFrn0rVGFwA
 aD0QoZWwBTt/QefB/TJdP+dROs9MjUBczpsPVkqT3dAPJRkOgST0qQRmzhJACuNGMZc/
 LnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O4Nyyfchw7ka6xBuv/frcGz+7bIxeXKGfnY6JSWCHr0=;
 b=WTMNQCGOPRsnJmCrPw3v3KYl3aM4hB9gpnauJzkiG801MBmaiHzkBPn/G/KayIrIKS
 D/O3B6NzqiS1lKYPnEmP+Chk6zMopS3V6l/3nlVqNnDKINQTpLuJBOpx3IOe0/IxsKbe
 eCPaMud2brUhgG5F/nHaq9ZGDFXryoy06TUb/Y2AdtTRrxqULXn7KbKBw8xQ8auQ8U6c
 T6rBwFPiwMB9RYC7eihgmPLJrIHotZrl4msOGHurcMfugHEb3STeWeGr6qKD/zMQNvmy
 OrjK0FHapTiGTx/+uBkDRGEN2Z341Q+d74Q8xL6DCmsZe/FpC6W32Lgo5WDvDyevMWEi
 YqqQ==
X-Gm-Message-State: AOAM530J3lCOBB/OgAPR5/MYiofNsFbU0syI7MyEhn4erbO+QBAX09Hp
 8I1/tKMwzIImOdNw4y4XJEMLd/oNp12KmA==
X-Google-Smtp-Source: ABdhPJy75zyKqoNwwE0vRxFipqBhu9R36DAZp8ErCJAzshpUGlC3PtmzObquq4Fxx+pZDqbXJEwa5A==
X-Received: by 2002:a17:902:a513:b029:11a:9be6:f1b9 with SMTP id
 s19-20020a170902a513b029011a9be6f1b9mr4318160plq.55.1629235111101; 
 Tue, 17 Aug 2021 14:18:31 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com
Subject: [PATCH v2 16/21] target/riscv: Use {get,dest}_gpr for RVA
Date: Tue, 17 Aug 2021 11:17:58 -1000
Message-Id: <20210817211803.283639-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817211803.283639-1-richard.henderson@linaro.org>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 17 Aug 2021 21:18:35 -0000

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


