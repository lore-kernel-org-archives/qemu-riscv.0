Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW7j-0001sI-Jy
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6Q-0005k4-G1
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:10 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW6O-0000eG-0u
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:31:10 -0500
Received: by mail-pl1-x629.google.com with SMTP id n6so4154177plf.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKpTWGCLSVG0YS1XFVPlvlmwyJALoBesP8PUrnrIExc=;
 b=swQC3ZUKL4jVbwqrUmz6o9ZK+VIasrDt9MBjdUfjc2qYrl8QcgRmYE1Be8/zc3GevO
 1R0AtOrpndgFJnJCAeMggZ5qM0nw5ynFSmeuebCu8yWNGjq3rq9qBrrfb2V9PSKBvPcZ
 1LFf3dm5LI9fCgzJg8eIr/UJe4KkHaxMv1R2NrAUEXsueMnT6JPKFQWHtj/MldTEQ36E
 sNPJMpOVB1fRSbc3ORW+M/YUqE9iu/q4cSXxi34ueSQxgN9025Lv8Rg/HT5bsDXWA5Qm
 T2esBBduAk/aOFECmoIoXKIyb97f3J00HH6/8NipCBrtP4CS1jvDIJtHX4A3LJvZUgvz
 OW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKpTWGCLSVG0YS1XFVPlvlmwyJALoBesP8PUrnrIExc=;
 b=tixBurol6eI0Gl0DIroDeXPxQrNCYQkP03ioyTDmlMSTZvRRbXg4OvosriB6S7eEnf
 UtsT7FVCkQRimDjAapv2CgXR2mQJo6EmCZo/BWph9e2rECIZSYg/z+o8JTJSXoOD7MJx
 2YJl7PVmY35h+xIiAPP8HeVtqB4tx6nsA8smTWM6/Lh++v2lgylKDTc8uGK0h45l2g0Y
 jRCrChCA7t0sd6Z+mXh4Xi0ZS8rH9HgleSoM7/2jyNXaeLWYbsgredurA+6cvfJLM5Tz
 X1s54yP8t7U5ppLTJacxz2llN2vyneUIuXtE6d/xguSa4LTM2aBM+PpH75Hpoiy5nhEs
 u5yQ==
X-Gm-Message-State: AO0yUKVWpz0C4ycuco9Q6EuxyelFLPjZw53d+K+ToHATjt/7NMy2uYAz
 BtHmr3I0j0eO1iTuCR5jAbILSw==
X-Google-Smtp-Source: AK7set+vp8jgqcV96FWVXX1VFdTM0RyW/P8NGxD4ao86Ds7D8G7+XwqlR5mluwnaOo10pAzzkfCuSQ==
X-Received: by 2002:a17:90b:1a88:b0:237:39b7:68ce with SMTP id
 ng8-20020a17090b1a8800b0023739b768cemr19721288pjb.45.1677475867150; 
 Sun, 26 Feb 2023 21:31:07 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:31:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 63/76] target/s390x: Remove g_out, g_out2, g_in1,
 g_in2 from DisasContext
Date: Sun, 26 Feb 2023 19:24:52 -1000
Message-Id: <20230227052505.352889-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:31:11 -0000

These fields are no longer read, so remove them and the writes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index c431903c67..9974162527 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1061,7 +1061,6 @@ static const DisasFormatInfo format_info[] = {
    them, and store them back.  See the "in1", "in2", "prep", "wout" sets
    of routines below for more details.  */
 typedef struct {
-    bool g_out, g_out2, g_in1, g_in2;
     TCGv_i64 out, out2, in1, in2;
     TCGv_i64 addr1;
     TCGv_i128 out_128, in1_128, in2_128;
@@ -3159,9 +3158,7 @@ static DisasJumpType op_mc(DisasContext *s, DisasOps *o)
 static DisasJumpType op_mov2(DisasContext *s, DisasOps *o)
 {
     o->out = o->in2;
-    o->g_out = o->g_in2;
     o->in2 = NULL;
-    o->g_in2 = false;
     return DISAS_NEXT;
 }
 
@@ -3171,9 +3168,7 @@ static DisasJumpType op_mov2e(DisasContext *s, DisasOps *o)
     TCGv ar1 = tcg_temp_new_i64();
 
     o->out = o->in2;
-    o->g_out = o->g_in2;
     o->in2 = NULL;
-    o->g_in2 = false;
 
     switch (s->base.tb->flags & FLAG_MASK_ASC) {
     case PSW_ASC_PRIMARY >> FLAG_MASK_PSW_SHIFT:
@@ -3202,11 +3197,8 @@ static DisasJumpType op_movx(DisasContext *s, DisasOps *o)
 {
     o->out = o->in1;
     o->out2 = o->in2;
-    o->g_out = o->g_in1;
-    o->g_out2 = o->g_in2;
     o->in1 = NULL;
     o->in2 = NULL;
-    o->g_in1 = o->g_in2 = false;
     return DISAS_NEXT;
 }
 
@@ -3708,7 +3700,6 @@ static DisasJumpType op_rosbg(DisasContext *s, DisasOps *o)
     /* If this is a test-only form, arrange to discard the result.  */
     if (i3 & 0x80) {
         o->out = tcg_temp_new_i64();
-        o->g_out = false;
     }
 
     i3 &= 63;
@@ -4874,7 +4865,6 @@ static DisasJumpType op_zero2(DisasContext *s, DisasOps *o)
 {
     o->out = tcg_const_i64(0);
     o->out2 = o->out;
-    o->g_out2 = true;
     return DISAS_NEXT;
 }
 
@@ -5142,7 +5132,6 @@ static void prep_new_x(DisasContext *s, DisasOps *o)
 static void prep_r1(DisasContext *s, DisasOps *o)
 {
     o->out = regs[get_field(s, r1)];
-    o->g_out = true;
 }
 #define SPEC_prep_r1 0
 
@@ -5151,7 +5140,6 @@ static void prep_r1_P(DisasContext *s, DisasOps *o)
     int r1 = get_field(s, r1);
     o->out = regs[r1];
     o->out2 = regs[r1 + 1];
-    o->g_out = o->g_out2 = true;
 }
 #define SPEC_prep_r1_P SPEC_r1_even
 
@@ -5375,7 +5363,6 @@ static void in1_r1(DisasContext *s, DisasOps *o)
 static void in1_r1_o(DisasContext *s, DisasOps *o)
 {
     o->in1 = regs[get_field(s, r1)];
-    o->g_in1 = true;
 }
 #define SPEC_in1_r1_o 0
 
@@ -5409,7 +5396,6 @@ static void in1_r1p1(DisasContext *s, DisasOps *o)
 static void in1_r1p1_o(DisasContext *s, DisasOps *o)
 {
     o->in1 = regs[get_field(s, r1) + 1];
-    o->g_in1 = true;
 }
 #define SPEC_in1_r1p1_o SPEC_r1_even
 
@@ -5464,7 +5450,6 @@ static void in1_r3(DisasContext *s, DisasOps *o)
 static void in1_r3_o(DisasContext *s, DisasOps *o)
 {
     o->in1 = regs[get_field(s, r3)];
-    o->g_in1 = true;
 }
 #define SPEC_in1_r3_o 0
 
@@ -5595,7 +5580,6 @@ static void in1_m1_64(DisasContext *s, DisasOps *o)
 static void in2_r1_o(DisasContext *s, DisasOps *o)
 {
     o->in2 = regs[get_field(s, r1)];
-    o->g_in2 = true;
 }
 #define SPEC_in2_r1_o 0
 
@@ -5630,7 +5614,6 @@ static void in2_r2(DisasContext *s, DisasOps *o)
 static void in2_r2_o(DisasContext *s, DisasOps *o)
 {
     o->in2 = regs[get_field(s, r2)];
-    o->g_in2 = true;
 }
 #define SPEC_in2_r2_o 0
 
-- 
2.34.1


