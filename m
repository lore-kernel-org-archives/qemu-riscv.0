Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVqjy-0000k4-V5
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjL-0006U9-4b
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:38 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqj3-00039Z-Nk
 for qemu-riscv@nongnu.org; Sat, 25 Feb 2023 04:20:33 -0500
Received: by mail-pl1-x629.google.com with SMTP id z2so1852331plf.12
 for <qemu-riscv@nongnu.org>; Sat, 25 Feb 2023 01:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JVVeIuhjPjLUHH6q7jjqGdCcXDfNuJxyB7TieFblvRI=;
 b=LY2uiDmi7z7IMLZRRhroaSSQ5rik/sZgWw3+h6xoiPdIkpREbC0re6BrFoMldoL+oz
 w6aTyFIdpJogoxREX+a8+nbv8ChProZ0QVn6JQbfEIURC9N4OPhBp5AwO9nCj3LioK7+
 cJvFdM99laqdLsuWLJ24d3BF3oQp4Vsfqg4LSJXDjdKbNU0kVVhTlj6VmK7RmT5Cl+cu
 Mhds9czblelAM+atIIQmCnT7MChBalvsxolhC+gfTSOlG1Gp/qdh2c0d0XW47+vmtam5
 X9CY9uWF+eB+sHMG+ROnPHESbofC4B1Lv9Wu+VASH1a8SJBc4j7rsbkxuDg6EcOQVYhL
 1k4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JVVeIuhjPjLUHH6q7jjqGdCcXDfNuJxyB7TieFblvRI=;
 b=NtG2oDC6rx7gZ2P2TsD0XRwybs5SINVThjxhWRkReZsGZQF8Ulbh3TzlxWpD4tf/F+
 l+aXoSeKJU59OMpRHCUpK45U877oAGkCFJBD//pglDTkL5ZRP27MmQSLH7a6t5c5YuR4
 mr9AT+8V8dmjIysDABL5oaWQqt4K9Gue4cBdQyt31Wkk2GlW+kj+dA7FAWd5fBVikQLi
 DmjvaodKA/M35XPwwqHKKCs0pL3Y4wHBt9rx27U9hQIQE/abPWfWnGXqMv7/8xnOC548
 GIpkPtFVCc3pTTDvlV0Md5bwECweXdGXl2HvCRJuTZ0ztegNxQOjjuz5hhTza4ZWwGBW
 ozNg==
X-Gm-Message-State: AO0yUKUP+5QYPqd9dmDGUJylP1pZAuBJv56HF/FDo+SkVxEJWwc49HLE
 AWvjT6MjLLyLJLqqJQLfUQCw0Q==
X-Google-Smtp-Source: AK7set9z7IrRDcYpa0Sadc+79uJJPMki7/l+6VO8ZjssFtqsxb5W0/dMRytX7b7boSHoBXBNgd87EA==
X-Received: by 2002:a05:6a20:3951:b0:bc:59e9:f3d9 with SMTP id
 r17-20020a056a20395100b000bc59e9f3d9mr23804041pzg.0.1677316806844; 
 Sat, 25 Feb 2023 01:20:06 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 59/76] target/s390x: Drop free_compare
Date: Fri, 24 Feb 2023 23:14:10 -1000
Message-Id: <20230225091427.1817156-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 25 Feb 2023 09:20:40 -0000

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


