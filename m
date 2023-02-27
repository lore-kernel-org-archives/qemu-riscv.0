Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW6Y-0006jT-S3
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6B-0003tj-4H
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:55 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW66-0000f9-6r
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:52 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so5060898pjz.1
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=45/fsZysA6znj3lsxas/Rtz/1l3A7Tl30S+1TTOT2Q4=;
 b=PFFLnpxbx8LbgoBOnaYmvfylDgfKEq8qJvFnc61Ac5vnuc+KFESW5yehPGAzS0SCb1
 1uNhcoP0PA/Yid2010p5BbVGL6pE2T4rRuAuBfToDjbkb3KLdmv7dUEF4G5NRCX7QbHY
 AIcfCjVDZhMnQYNtYsVeUkf/cLHar1qlVk/2l1n+2MrgqKnX/5/ywTBHePYMgmcHpNJm
 JLM1GSUOl4/pahTwhy7moFJ4ksNfdKNy74YPLnEC4xOTpukUggiBtRCoD6uHyWXIkuAa
 2TaoYG3Iq/leG0RGi7i74aMDlxxS/WlpZ89HrgoQm8TwG7zUxl8YZFGs4PRI13Ed+DDT
 gGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=45/fsZysA6znj3lsxas/Rtz/1l3A7Tl30S+1TTOT2Q4=;
 b=DvZZsxa9sp8ZR0yrUvmUzby7DpQkRHh/8MBl3/eRBQGaeLmWsGkNOyFugLsuTgPymd
 8sOrd+sWhRS9V3rvpiu8gWaCJduz4xr/Q7JfZGhBD7Ro7XFILZkWJsvlwfnVTyXBQga7
 5DET377LL22zrZa72dSbPogHut5POMPpp3ABl6l26+z7MBxzX86rL7Qq5XpXwAGPXaa1
 bv/uo/ywsuTpWL2+gCZfJ8+YQ9sluK3KaPTTYFccThwpkPN3G83vATAei4L6Mx/W6z8g
 1jxoJE3NDFjdDIZs0IykTWrEDd+p6sB/jaGDSwcErHprOyR9AEoD9k7Kw+L0wai0vgLi
 8xPg==
X-Gm-Message-State: AO0yUKUx1qDmX6K9HABedtM3L2z2fWkMvgSEyVqIwtvfon7JfPXoJVb+
 ARku/nrvkIpJ7jAqvuZtDQBR7w==
X-Google-Smtp-Source: AK7set+somlgUi3q0x6Qx0HwGYYk5/XSvRGD3dHGUFlD2hy5tqzBeDzLfsXd+86nLtl8xXVNFy9UDQ==
X-Received: by 2002:a17:90b:1e4d:b0:233:e1e6:33d4 with SMTP id
 pi13-20020a17090b1e4d00b00233e1e633d4mr24713361pjb.47.1677475848005; 
 Sun, 26 Feb 2023 21:30:48 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 56/76] target/s390x: Use tcg_constant_* for DisasCompare
Date: Sun, 26 Feb 2023 19:24:45 -1000
Message-Id: <20230227052505.352889-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:30:56 -0000

The a and b fields are not modified by the consumer,
and while we need not free a constant, tcg will quietly
ignore such frees, so free_compare need not be changed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 44 ++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 3e3f685451..f2f2ea06eb 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -845,7 +845,7 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
         c->is_64 = false;
         c->u.s32.a = tcg_temp_new_i32();
         tcg_gen_extrl_i64_i32(c->u.s32.a, cc_dst);
-        c->u.s32.b = tcg_const_i32(0);
+        c->u.s32.b = tcg_constant_i32(0);
         break;
     case CC_OP_LTGT_32:
     case CC_OP_LTUGTU_32:
@@ -860,7 +860,7 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     case CC_OP_NZ:
     case CC_OP_FLOGR:
         c->u.s64.a = cc_dst;
-        c->u.s64.b = tcg_const_i64(0);
+        c->u.s64.b = tcg_constant_i64(0);
         c->g1 = true;
         break;
     case CC_OP_LTGT_64:
@@ -874,14 +874,14 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
     case CC_OP_TM_64:
     case CC_OP_ICM:
         c->u.s64.a = tcg_temp_new_i64();
-        c->u.s64.b = tcg_const_i64(0);
+        c->u.s64.b = tcg_constant_i64(0);
         tcg_gen_and_i64(c->u.s64.a, cc_src, cc_dst);
         break;
 
     case CC_OP_ADDU:
     case CC_OP_SUBU:
         c->is_64 = true;
-        c->u.s64.b = tcg_const_i64(0);
+        c->u.s64.b = tcg_constant_i64(0);
         c->g1 = true;
         switch (mask) {
         case 8 | 2:
@@ -904,65 +904,65 @@ static void disas_jcc(DisasContext *s, DisasCompare *c, uint32_t mask)
         switch (mask) {
         case 0x8 | 0x4 | 0x2: /* cc != 3 */
             cond = TCG_COND_NE;
-            c->u.s32.b = tcg_const_i32(3);
+            c->u.s32.b = tcg_constant_i32(3);
             break;
         case 0x8 | 0x4 | 0x1: /* cc != 2 */
             cond = TCG_COND_NE;
-            c->u.s32.b = tcg_const_i32(2);
+            c->u.s32.b = tcg_constant_i32(2);
             break;
         case 0x8 | 0x2 | 0x1: /* cc != 1 */
             cond = TCG_COND_NE;
-            c->u.s32.b = tcg_const_i32(1);
+            c->u.s32.b = tcg_constant_i32(1);
             break;
         case 0x8 | 0x2: /* cc == 0 || cc == 2 => (cc & 1) == 0 */
             cond = TCG_COND_EQ;
             c->g1 = false;
             c->u.s32.a = tcg_temp_new_i32();
-            c->u.s32.b = tcg_const_i32(0);
+            c->u.s32.b = tcg_constant_i32(0);
             tcg_gen_andi_i32(c->u.s32.a, cc_op, 1);
             break;
         case 0x8 | 0x4: /* cc < 2 */
             cond = TCG_COND_LTU;
-            c->u.s32.b = tcg_const_i32(2);
+            c->u.s32.b = tcg_constant_i32(2);
             break;
         case 0x8: /* cc == 0 */
             cond = TCG_COND_EQ;
-            c->u.s32.b = tcg_const_i32(0);
+            c->u.s32.b = tcg_constant_i32(0);
             break;
         case 0x4 | 0x2 | 0x1: /* cc != 0 */
             cond = TCG_COND_NE;
-            c->u.s32.b = tcg_const_i32(0);
+            c->u.s32.b = tcg_constant_i32(0);
             break;
         case 0x4 | 0x1: /* cc == 1 || cc == 3 => (cc & 1) != 0 */
             cond = TCG_COND_NE;
             c->g1 = false;
             c->u.s32.a = tcg_temp_new_i32();
-            c->u.s32.b = tcg_const_i32(0);
+            c->u.s32.b = tcg_constant_i32(0);
             tcg_gen_andi_i32(c->u.s32.a, cc_op, 1);
             break;
         case 0x4: /* cc == 1 */
             cond = TCG_COND_EQ;
-            c->u.s32.b = tcg_const_i32(1);
+            c->u.s32.b = tcg_constant_i32(1);
             break;
         case 0x2 | 0x1: /* cc > 1 */
             cond = TCG_COND_GTU;
-            c->u.s32.b = tcg_const_i32(1);
+            c->u.s32.b = tcg_constant_i32(1);
             break;
         case 0x2: /* cc == 2 */
             cond = TCG_COND_EQ;
-            c->u.s32.b = tcg_const_i32(2);
+            c->u.s32.b = tcg_constant_i32(2);
             break;
         case 0x1: /* cc == 3 */
             cond = TCG_COND_EQ;
-            c->u.s32.b = tcg_const_i32(3);
+            c->u.s32.b = tcg_constant_i32(3);
             break;
         default:
             /* CC is masked by something else: (8 >> cc) & mask.  */
             cond = TCG_COND_NE;
             c->g1 = false;
-            c->u.s32.a = tcg_const_i32(8);
-            c->u.s32.b = tcg_const_i32(0);
-            tcg_gen_shr_i32(c->u.s32.a, c->u.s32.a, cc_op);
+            c->u.s32.a = tcg_temp_new_i32();
+            c->u.s32.b = tcg_constant_i32(0);
+            tcg_gen_shr_i32(c->u.s32.a, tcg_constant_i32(8), cc_op);
             tcg_gen_andi_i32(c->u.s32.a, c->u.s32.a, mask);
             break;
         }
@@ -1619,7 +1619,7 @@ static DisasJumpType op_bct32(DisasContext *s, DisasOps *o)
     tcg_gen_subi_i64(t, regs[r1], 1);
     store_reg32_i64(r1, t);
     c.u.s32.a = tcg_temp_new_i32();
-    c.u.s32.b = tcg_const_i32(0);
+    c.u.s32.b = tcg_constant_i32(0);
     tcg_gen_extrl_i64_i32(c.u.s32.a, t);
     tcg_temp_free_i64(t);
 
@@ -1643,7 +1643,7 @@ static DisasJumpType op_bcth(DisasContext *s, DisasOps *o)
     tcg_gen_subi_i64(t, t, 1);
     store_reg32h_i64(r1, t);
     c.u.s32.a = tcg_temp_new_i32();
-    c.u.s32.b = tcg_const_i32(0);
+    c.u.s32.b = tcg_constant_i32(0);
     tcg_gen_extrl_i64_i32(c.u.s32.a, t);
     tcg_temp_free_i64(t);
 
@@ -1664,7 +1664,7 @@ static DisasJumpType op_bct64(DisasContext *s, DisasOps *o)
 
     tcg_gen_subi_i64(regs[r1], regs[r1], 1);
     c.u.s64.a = regs[r1];
-    c.u.s64.b = tcg_const_i64(0);
+    c.u.s64.b = tcg_constant_i64(0);
 
     return help_branch(s, &c, is_imm, imm, o->in2);
 }
-- 
2.34.1


