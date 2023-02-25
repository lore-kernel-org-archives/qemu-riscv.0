Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqfw-0000sP-Tv
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:17:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqex-0006x0-SR
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:16:03 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqev-0002IV-LT
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:16:03 -0500
Received: by mail-pl1-x641.google.com with SMTP id i10so1863997plr.9
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZO7UItfQReoklgOJZJKKMMXCbbFRvVQBOxOhYteWFwg=;
 b=Oab+izQkZfYOVEByMZorsz3BaUDIE1WoaUu169QB7gjMG2jPU66fjzGfQIvM6BtQE1
 7W7GoNnv40FNW5+2fUFGoaZG0b7Qh7YQOQ56W0S4kWMYh57GidQu5SPgIr0EkxxeaWr2
 ROjChKGjNdTf3vjMRonXOx9W7sudsrJhrAcL85eU7i3PhvL+wIlr3+ewVgxq5b1Aurcd
 vooM6lzyfLBUrdCJviwGWad9Q+UU5Y1cW8QhbH5frwMmjtc+GgKixciz4BcNemh7JyGY
 bV4cw8SB8Zunn2cpODhAgLQ53QDv+Tvr3XMMwEBj+dY8lP40y8eAaPZK4jEKiV+p+SNy
 YUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZO7UItfQReoklgOJZJKKMMXCbbFRvVQBOxOhYteWFwg=;
 b=irQvJgx3/+avvgG84ZI6t+RJ/GnNglQDlfImDesNMF8lClutvF+sF8XYDfspjct7g7
 jJw71sAgqVbSlQGJh0YTdRv0L7G6TYd69t2gn3FiaUqxh4ymx629/rdFPu4gVIPKkZCO
 erpbh2LvWuuL/yTitghiPLvbgR6hcj18gqH0+wyovKvzu4bqSiYQsV5RBu3JPflYO8S+
 EqaYjsIu5WTPIaaY2icPkM4IxUUWBoEG9ekpLQgAHMk00wMtZ49ecjOto7tnD+60yg3f
 gKYG1FTq4g59QWwQtN/AmQnQn6SWrMzG6oTZHvF4gZM26OrkVEIbfxeOhy1rw8V6iyrr
 HEqA==
X-Gm-Message-State: AO0yUKWi55RmZ443OelildLX7PaZ4OEwGaV4cXzfR1x7BBtRc5IstCte
 g1C5LopdRlw0f0dhG8XwOfNdTQ==
X-Google-Smtp-Source: AK7set/EmDCYe4pCLr8mO8VCufb6bFtaAmH9zGoqnE+3obK/tgtWWIptKzkcAGOtk2JUQUePa29pbQ==
X-Received: by 2002:a17:903:88f:b0:19a:fdfb:6e35 with SMTP id
 kt15-20020a170903088f00b0019afdfb6e35mr16397605plb.0.1677316560316; 
 Sat, 25 Feb 2023 01:16:00 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 34/76] target/m68k: Drop free_cond
Date: Fri, 24 Feb 2023 23:13:45 -1000
Message-Id: <20230225091427.1817156-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
X-List-Received-Date: Sat, 25 Feb 2023 09:16:04 -0000

Translators are no longer required to free tcg temporaries.
Remove the g1 and g2 members of DisasCompare, as they were
used to track which temps needed to be freed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 40 ----------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index b3cd3e87e1..d7237b6a99 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1249,8 +1249,6 @@ static int gen_ea_fp(CPUM68KState *env, DisasContext *s, uint16_t insn,
 
 typedef struct {
     TCGCond tcond;
-    bool g1;
-    bool g2;
     TCGv v1;
     TCGv v2;
 } DisasCompare;
@@ -1263,7 +1261,6 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
 
     /* The CC_OP_CMP form can handle most normal comparisons directly.  */
     if (op == CC_OP_CMPB || op == CC_OP_CMPW || op == CC_OP_CMPL) {
-        c->g1 = c->g2 = 1;
         c->v1 = QREG_CC_N;
         c->v2 = QREG_CC_V;
         switch (cond) {
@@ -1281,7 +1278,6 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
             goto done;
         case 10: /* PL */
         case 11: /* MI */
-            c->g1 = c->g2 = 0;
             c->v2 = tcg_const_i32(0);
             c->v1 = tmp = tcg_temp_new();
             tcg_gen_sub_i32(tmp, QREG_CC_N, QREG_CC_V);
@@ -1298,8 +1294,6 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
         }
     }
 
-    c->g1 = 1;
-    c->g2 = 0;
     c->v2 = tcg_const_i32(0);
 
     switch (cond) {
@@ -1383,7 +1377,6 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
     case 2: /* HI (!C && !Z) -> !(C || Z)*/
     case 3: /* LS (C || Z) */
         c->v1 = tmp = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_setcond_i32(TCG_COND_EQ, tmp, QREG_CC_Z, c->v2);
         tcg_gen_or_i32(tmp, tmp, QREG_CC_C);
         tcond = TCG_COND_NE;
@@ -1411,14 +1404,12 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
     case 12: /* GE (!(N ^ V)) */
     case 13: /* LT (N ^ V) */
         c->v1 = tmp = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_xor_i32(tmp, QREG_CC_N, QREG_CC_V);
         tcond = TCG_COND_LT;
         break;
     case 14: /* GT (!(Z || (N ^ V))) */
     case 15: /* LE (Z || (N ^ V)) */
         c->v1 = tmp = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_setcond_i32(TCG_COND_EQ, tmp, QREG_CC_Z, c->v2);
         tcg_gen_neg_i32(tmp, tmp);
         tmp2 = tcg_temp_new();
@@ -1436,16 +1427,6 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
     c->tcond = tcond;
 }
 
-static void free_cond(DisasCompare *c)
-{
-    if (!c->g1) {
-        tcg_temp_free(c->v1);
-    }
-    if (!c->g2) {
-        tcg_temp_free(c->v2);
-    }
-}
-
 static void gen_jmpcc(DisasContext *s, int cond, TCGLabel *l1)
 {
   DisasCompare c;
@@ -1453,7 +1434,6 @@ static void gen_jmpcc(DisasContext *s, int cond, TCGLabel *l1)
   gen_cc_cond(&c, s, cond);
   update_cc_op(s);
   tcg_gen_brcond_i32(c.tcond, c.v1, c.v2, l1);
-  free_cond(&c);
 }
 
 /* Force a TB lookup after an instruction that changes the CPU state.  */
@@ -1512,7 +1492,6 @@ DISAS_INSN(scc)
 
     tmp = tcg_temp_new();
     tcg_gen_setcond_i32(c.tcond, tmp, c.v1, c.v2);
-    free_cond(&c);
 
     tcg_gen_neg_i32(tmp, tmp);
     DEST_EA(env, insn, OS_BYTE, tmp, NULL);
@@ -4887,7 +4866,6 @@ static void do_trapcc(DisasContext *s, DisasCompare *c)
             s->base.is_jmp = DISAS_NEXT;
         }
     }
-    free_cond(c);
 }
 
 DISAS_INSN(trapcc)
@@ -5383,9 +5361,7 @@ static void gen_fcc_cond(DisasCompare *c, DisasContext *s, int cond)
 {
     TCGv fpsr;
 
-    c->g1 = 1;
     c->v2 = tcg_const_i32(0);
-    c->g2 = 0;
     /* TODO: Raise BSUN exception.  */
     fpsr = tcg_temp_new();
     gen_load_fcr(s, fpsr, M68K_FPSR);
@@ -5398,14 +5374,12 @@ static void gen_fcc_cond(DisasCompare *c, DisasContext *s, int cond)
     case 1:  /* EQual Z */
     case 17: /* Signaling EQual Z */
         c->v1 = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_andi_i32(c->v1, fpsr, FPSR_CC_Z);
         c->tcond = TCG_COND_NE;
         break;
     case 2:  /* Ordered Greater Than !(A || Z || N) */
     case 18: /* Greater Than !(A || Z || N) */
         c->v1 = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_andi_i32(c->v1, fpsr,
                          FPSR_CC_A | FPSR_CC_Z | FPSR_CC_N);
         c->tcond = TCG_COND_EQ;
@@ -5413,7 +5387,6 @@ static void gen_fcc_cond(DisasCompare *c, DisasContext *s, int cond)
     case 3:  /* Ordered Greater than or Equal Z || !(A || N) */
     case 19: /* Greater than or Equal Z || !(A || N) */
         c->v1 = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_andi_i32(c->v1, fpsr, FPSR_CC_A);
         tcg_gen_shli_i32(c->v1, c->v1, ctz32(FPSR_CC_N) - ctz32(FPSR_CC_A));
         tcg_gen_andi_i32(fpsr, fpsr, FPSR_CC_Z | FPSR_CC_N);
@@ -5424,7 +5397,6 @@ static void gen_fcc_cond(DisasCompare *c, DisasContext *s, int cond)
     case 4:  /* Ordered Less Than !(!N || A || Z); */
     case 20: /* Less Than !(!N || A || Z); */
         c->v1 = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_xori_i32(c->v1, fpsr, FPSR_CC_N);
         tcg_gen_andi_i32(c->v1, c->v1, FPSR_CC_N | FPSR_CC_A | FPSR_CC_Z);
         c->tcond = TCG_COND_EQ;
@@ -5432,7 +5404,6 @@ static void gen_fcc_cond(DisasCompare *c, DisasContext *s, int cond)
     case 5:  /* Ordered Less than or Equal Z || (N && !A) */
     case 21: /* Less than or Equal Z || (N && !A) */
         c->v1 = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_andi_i32(c->v1, fpsr, FPSR_CC_A);
         tcg_gen_shli_i32(c->v1, c->v1, ctz32(FPSR_CC_N) - ctz32(FPSR_CC_A));
         tcg_gen_andc_i32(c->v1, fpsr, c->v1);
@@ -5442,35 +5413,30 @@ static void gen_fcc_cond(DisasCompare *c, DisasContext *s, int cond)
     case 6:  /* Ordered Greater or Less than !(A || Z) */
     case 22: /* Greater or Less than !(A || Z) */
         c->v1 = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_andi_i32(c->v1, fpsr, FPSR_CC_A | FPSR_CC_Z);
         c->tcond = TCG_COND_EQ;
         break;
     case 7:  /* Ordered !A */
     case 23: /* Greater, Less or Equal !A */
         c->v1 = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_andi_i32(c->v1, fpsr, FPSR_CC_A);
         c->tcond = TCG_COND_EQ;
         break;
     case 8:  /* Unordered A */
     case 24: /* Not Greater, Less or Equal A */
         c->v1 = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_andi_i32(c->v1, fpsr, FPSR_CC_A);
         c->tcond = TCG_COND_NE;
         break;
     case 9:  /* Unordered or Equal A || Z */
     case 25: /* Not Greater or Less then A || Z */
         c->v1 = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_andi_i32(c->v1, fpsr, FPSR_CC_A | FPSR_CC_Z);
         c->tcond = TCG_COND_NE;
         break;
     case 10: /* Unordered or Greater Than A || !(N || Z)) */
     case 26: /* Not Less or Equal A || !(N || Z)) */
         c->v1 = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_andi_i32(c->v1, fpsr, FPSR_CC_Z);
         tcg_gen_shli_i32(c->v1, c->v1, ctz32(FPSR_CC_N) - ctz32(FPSR_CC_Z));
         tcg_gen_andi_i32(fpsr, fpsr, FPSR_CC_A | FPSR_CC_N);
@@ -5481,7 +5447,6 @@ static void gen_fcc_cond(DisasCompare *c, DisasContext *s, int cond)
     case 11: /* Unordered or Greater or Equal A || Z || !N */
     case 27: /* Not Less Than A || Z || !N */
         c->v1 = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_andi_i32(c->v1, fpsr, FPSR_CC_A | FPSR_CC_Z | FPSR_CC_N);
         tcg_gen_xori_i32(c->v1, c->v1, FPSR_CC_N);
         c->tcond = TCG_COND_NE;
@@ -5489,7 +5454,6 @@ static void gen_fcc_cond(DisasCompare *c, DisasContext *s, int cond)
     case 12: /* Unordered or Less Than A || (N && !Z) */
     case 28: /* Not Greater than or Equal A || (N && !Z) */
         c->v1 = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_andi_i32(c->v1, fpsr, FPSR_CC_Z);
         tcg_gen_shli_i32(c->v1, c->v1, ctz32(FPSR_CC_N) - ctz32(FPSR_CC_Z));
         tcg_gen_andc_i32(c->v1, fpsr, c->v1);
@@ -5499,14 +5463,12 @@ static void gen_fcc_cond(DisasCompare *c, DisasContext *s, int cond)
     case 13: /* Unordered or Less or Equal A || Z || N */
     case 29: /* Not Greater Than A || Z || N */
         c->v1 = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_andi_i32(c->v1, fpsr, FPSR_CC_A | FPSR_CC_Z | FPSR_CC_N);
         c->tcond = TCG_COND_NE;
         break;
     case 14: /* Not Equal !Z */
     case 30: /* Signaling Not Equal !Z */
         c->v1 = tcg_temp_new();
-        c->g1 = 0;
         tcg_gen_andi_i32(c->v1, fpsr, FPSR_CC_Z);
         c->tcond = TCG_COND_EQ;
         break;
@@ -5526,7 +5488,6 @@ static void gen_fjmpcc(DisasContext *s, int cond, TCGLabel *l1)
     gen_fcc_cond(&c, s, cond);
     update_cc_op(s);
     tcg_gen_brcond_i32(c.tcond, c.v1, c.v2, l1);
-    free_cond(&c);
 }
 
 DISAS_INSN(fbcc)
@@ -5562,7 +5523,6 @@ DISAS_INSN(fscc)
 
     tmp = tcg_temp_new();
     tcg_gen_setcond_i32(c.tcond, tmp, c.v1, c.v2);
-    free_cond(&c);
 
     tcg_gen_neg_i32(tmp, tmp);
     DEST_EA(env, insn, OS_BYTE, tmp, NULL);
-- 
2.34.1


