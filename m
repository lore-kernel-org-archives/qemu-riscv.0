Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW7O-0001Fr-1m
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6G-0004V6-KS
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:00 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6E-0000k0-6a
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:00 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so8931492pjh.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JVVeIuhjPjLUHH6q7jjqGdCcXDfNuJxyB7TieFblvRI=;
 b=KZFtDgUF81u4xLAUoPrH1ubwKL151a4Cjw7Q68GOIRg29nFd4p9Rc6hlVdrdjpZrH7
 lWFU1TVcjzAwMUina+HfxZnr/SAoZuMe1PwQgQwFtmAQWZ/20lRQjzyc3IXy7As7Azym
 xB8EYVNZGnV767IYyeUCL+ElWfb0137Ex1xFfJZNR8xiA8EXWG8DX/qV88P+eQZ5UAZ7
 VsWfhxTLy1lVpsQ6BHxj0oeD7gzB8y44fAu99RdvyCcLzCiFmDYcv0LnOxVP+IDDzw2P
 Hfv1Kh0xK7lxOOaNd9Id42qlGb/hZ7BSyPA8SQbhAtuqADNTr9EDEMk9cNrv2BNGxIe0
 b0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JVVeIuhjPjLUHH6q7jjqGdCcXDfNuJxyB7TieFblvRI=;
 b=RYnSKDEkH27PenJfZmKxXt+MQ4PBtHAXrDug1UovFbcKHgVLg0Aifzw3rfBzUN5sVX
 C3AjVtm0OqQk4sID0sle0MM3fPVZmO+WDC5VipkptKXsQ5umXQHhO/ss9GqqShh1cdRK
 lNQBf/z4sbQ4E/EWmkDViK0wSV/7bLebd7osDqawlay2N1XyyhFrmYAYHtLbaBy/mWaA
 JKiDZkE8blGuHDZJ7LvX1Vqsdmked8623ftJg9m9bhajm4oPXL7QVehRUvStCtrJsPwq
 nSTOjnJFMWCiUf6mfpJ3/XMPU17E6gDpLXNsiG3RPiVT6Jlp/gM7p5MF5PmObhOpbMa2
 Q0ug==
X-Gm-Message-State: AO0yUKVzExawCJFTV73DeZv54UyJ5HIwqcX0F/cXjNJ9lb/ygv8a8qiJ
 m/GzaK65iYUd8J6QiRAucxF/bQ==
X-Google-Smtp-Source: AK7set+Q3hExMVAjt0RzO5a/Jjc2gewA6lNoFZXWks5KpYpSfvvsZ9jEwWKjSvtUgBu0Wle5vxPFVg==
X-Received: by 2002:a17:90b:3912:b0:234:41c:74cc with SMTP id
 ob18-20020a17090b391200b00234041c74ccmr27603196pjb.42.1677475856468; 
 Sun, 26 Feb 2023 21:30:56 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 59/76] target/s390x: Drop free_compare
Date: Sun, 26 Feb 2023 19:24:48 -1000
Message-Id: <20230227052505.352889-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:31:01 -0000

Translators are no longer required to free tcg temporaries.
Remove the g1 and g2 members of DisasCompare, as they were
used to track which temps needed to be freed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 46 +-----------------------------------
 1 file changed, 1 insertion(+), 45 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 811049ea28..76a1233946 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -156,8 +156,6 @@ struct DisasContext {
 typedef struct {
     TCGCond cond:8;
     bool is_64;
-    bool g1;
-    bool g2;
     union {
         struct { TCGv_i64 a, b; } s64;
         struct { TCGv_i32 a, b; } s32;
@@ -722,7 +720,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
         c->cond = (mask ? TCG_COND_ALWAYS : TCG_COND_NEVER);
         c->u.s32.a = cc_op;
         c->u.s32.b = cc_op;
-        c->g1 = c->g2 = true;
         c->is_64 = false;
         return;
     }
@@ -839,7 +836,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
 
     /* Load up the arguments of the comparison.  */
     c->is_64 = true;
-    c->g1 = c->g2 = false;
     switch (old_cc_op) {
     case CC_OP_LTGT0_32:
         c->is_64 = false;
@@ -861,13 +857,11 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     case CC_OP_FLOGR:
         c->u.s64.a = cc_dst;
         c->u.s64.b = tcg_constant_i64(0);
-        c->g1 = true;
         break;
     case CC_OP_LTGT_64:
     case CC_OP_LTUGTU_64:
         c->u.s64.a = cc_src;
         c->u.s64.b = cc_dst;
-        c->g1 = c->g2 = true;
         break;
 
     case CC_OP_TM_32:
@@ -882,7 +876,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     case CC_OP_SUBU:
         c->is_64 = true;
         c->u.s64.b = tcg_constant_i64(0);
-        c->g1 = true;
         switch (mask) {
         case 8 | 2:
         case 4 | 1: /* result */
@@ -900,7 +893,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     case CC_OP_STATIC:
         c->is_64 = false;
         c->u.s32.a = cc_op;
-        c->g1 = true;
         switch (mask) {
         case 0x8 | 0x4 | 0x2: /* cc != 3 */
             cond = TCG_COND_NE;
@@ -916,7 +908,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
             break;
         case 0x8 | 0x2: /* cc == 0 || cc == 2 => (cc & 1) == 0 */
             cond = TCG_COND_EQ;
-            c->g1 = false;
             c->u.s32.a = tcg_temp_new_i32();
             c->u.s32.b = tcg_constant_i32(0);
             tcg_gen_andi_i32(c->u.s32.a, cc_op, 1);
@@ -935,7 +926,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
             break;
         case 0x4 | 0x1: /* cc == 1 || cc == 3 => (cc & 1) != 0 */
             cond = TCG_COND_NE;
-            c->g1 = false;
             c->u.s32.a = tcg_temp_new_i32();
             c->u.s32.b = tcg_constant_i32(0);
             tcg_gen_andi_i32(c->u.s32.a, cc_op, 1);
@@ -959,7 +949,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
         default:
             /* CC is masked by something else: (8 >> cc) & mask.  */
             cond = TCG_COND_NE;
-            c->g1 = false;
             c->u.s32.a = tcg_temp_new_i32();
             c->u.s32.b = tcg_constant_i32(0);
             tcg_gen_shr_i32(c->u.s32.a, tcg_constant_i32(8), cc_op);
@@ -974,24 +963,6 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     c->cond = cond;
 }
 
-static void free_compare(DisasCompare *c)
-{
-    if (!c->g1) {
-        if (c->is_64) {
-            tcg_temp_free_i64(c->u.s64.a);
-        } else {
-            tcg_temp_free_i32(c->u.s32.a);
-        }
-    }
-    if (!c->g2) {
-        if (c->is_64) {
-            tcg_temp_free_i64(c->u.s64.b);
-        } else {
-            tcg_temp_free_i32(c->u.s32.b);
-        }
-    }
-}
-
 /* ====================================================================== */
 /* Define the insn format enumeration.  */
 #define F0(N)                         FMT_##N,
@@ -1302,7 +1273,6 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
     }
 
  egress:
-    free_compare(c);
     return ret;
 }
 
@@ -1612,8 +1582,6 @@ static DisasJumpType op_bct32(DisasContext *s, DisasOps *o)
 
     c.cond = TCG_COND_NE;
     c.is_64 = false;
-    c.g1 = false;
-    c.g2 = false;
 
     t = tcg_temp_new_i64();
     tcg_gen_subi_i64(t, regs[r1], 1);
@@ -1635,8 +1603,6 @@ static DisasJumpType op_bcth(DisasContext *s, DisasOps *o)
 
     c.cond = TCG_COND_NE;
     c.is_64 = false;
-    c.g1 = false;
-    c.g2 = false;
 
     t = tcg_temp_new_i64();
     tcg_gen_shri_i64(t, regs[r1], 32);
@@ -1659,8 +1625,6 @@ static DisasJumpType op_bct64(DisasContext *s, DisasOps *o)
 
     c.cond = TCG_COND_NE;
     c.is_64 = true;
-    c.g1 = true;
-    c.g2 = false;
 
     tcg_gen_subi_i64(regs[r1], regs[r1], 1);
     c.u.s64.a = regs[r1];
@@ -1680,8 +1644,6 @@ static DisasJumpType op_bx32(DisasContext *s, DisasOps *o)
 
     c.cond = (s->insn->data ? TCG_COND_LE : TCG_COND_GT);
     c.is_64 = false;
-    c.g1 = false;
-    c.g2 = false;
 
     t = tcg_temp_new_i64();
     tcg_gen_add_i64(t, regs[r1], regs[r3]);
@@ -1708,15 +1670,12 @@ static DisasJumpType op_bx64(DisasContext *s, DisasOps *o)
 
     if (r1 == (r3 | 1)) {
         c.u.s64.b = load_reg(r3 | 1);
-        c.g2 = false;
     } else {
         c.u.s64.b = regs[r3 | 1];
-        c.g2 = true;
     }
 
     tcg_gen_add_i64(regs[r1], regs[r1], regs[r3]);
     c.u.s64.a = regs[r1];
-    c.g1 = true;
 
     return help_branch(s, &c, is_imm, imm, o->in2);
 }
@@ -1731,7 +1690,7 @@ static DisasJumpType op_cj(DisasContext *s, DisasOps *o)
     if (s->insn->data) {
         c.cond = tcg_unsigned_cond(c.cond);
     }
-    c.is_64 = c.g1 = c.g2 = true;
+    c.is_64 = true;
     c.u.s64.a = o->in1;
     c.u.s64.b = o->in2;
 
@@ -2925,13 +2884,11 @@ static DisasJumpType op_loc(DisasContext *s, DisasOps *o)
     if (c.is_64) {
         tcg_gen_movcond_i64(c.cond, o->out, c.u.s64.a, c.u.s64.b,
                             o->in2, o->in1);
-        free_compare(&c);
     } else {
         TCGv_i32 t32 = tcg_temp_new_i32();
         TCGv_i64 t, z;
 
         tcg_gen_setcond_i32(c.cond, t32, c.u.s32.a, c.u.s32.b);
-        free_compare(&c);
 
         t = tcg_temp_new_i64();
         tcg_gen_extu_i32_i64(t, t32);
@@ -4022,7 +3979,6 @@ static DisasJumpType op_soc(DisasContext *s, DisasOps *o)
     } else {
         tcg_gen_brcond_i32(c.cond, c.u.s32.a, c.u.s32.b, lab);
     }
-    free_compare(&c);
 
     r1 = get_field(s, r1);
     a = get_address(s, 0, get_field(s, b2), get_field(s, d2));
-- 
2.34.1


