Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWJ8-00065P-0T
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIo-0005S2-MY
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:58 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIl-0005Iz-5I
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:58 -0500
Received: by mail-pg1-x52a.google.com with SMTP id d6so2859914pgu.2
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NAVl1NdCqRWIlN6uf74urduxnE/s5f/Fs3hV/YcJ1uk=;
 b=RQJ2hbpV4GjOQNJfrQacOq4JBUbi8db4HMc8Py3z0F0ISLheChkiibLG66G6H2vj70
 Kc8onJhCJ5dZ0rGE0SqGi4g2tY7+AdUsFUBRyyMKTWcLnBBtMHzCzFXHAlNwY5OmAgpe
 NivarQRkeMsxgQjT/ku0sqFaH7C7rlH4Q/UMiYl5db5MGdgiElpjGucDXlwjXy6kP4hC
 dmuDZtO1WI7ZCiywaZlN7kBw1NosU1NwQlp9HWeVk7V5V928hB6jK3MbaDQ5nL8zzieo
 wuBFvqcNmNFV98dXEw8opubduS9DC+2uyg8V/DdFgY5oswKe59ERCncZY4dk3Wlfcngr
 56sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NAVl1NdCqRWIlN6uf74urduxnE/s5f/Fs3hV/YcJ1uk=;
 b=tadfQuzcXnO2E3r2z3LDRy5g0GqlpHqI/Io1ALCOq4tKPr4Pv6vQ3DbJwo9weaqplG
 xs8KOctLPuuQ7DTGVQhziWjI6NzAx0uKxxxh7rtb1gM6LqU2le7URdzvPnzLaZ8gnOFb
 EATa0yJCRqoSH1H+BQzMjKSOZDpeO4aleWxglypg7BNcE9d7q1pizhAZUC7ZyeGmmeF1
 aZqo36gE5GR6ihlnZDpfllXX3rh/5JLUJ9Hu1Sx8bUTmC8XFcoS9WzouZVkwLfC1ruBU
 Cvf+MCLdSOAmm8J3CdNurFC+iocDBR/HlgZx7yVUKr67gPJrXk/7Pv1IXuwM+Z8jHutC
 N5hg==
X-Gm-Message-State: AO0yUKWfKG/dmSOJtD2VaykO7tznmCro4wRbnAVJAN410ey3S7ZL63na
 NsCxjMJe9SAA6p98yGfLQTNn9Q==
X-Google-Smtp-Source: AK7set/rLW+i/aeKz8lPNdTxSbupi27bwQGKGBQI/atK5/h3Ur/0O/S9DEn7YN+vaHPXo4QykNGs+Q==
X-Received: by 2002:aa7:955c:0:b0:5a8:b6f3:a2a7 with SMTP id
 w28-20020aa7955c000000b005a8b6f3a2a7mr19755521pfq.11.1677476633504; 
 Sun, 26 Feb 2023 21:43:53 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 26/70] target/m68k: Avoid tcg_const_i32 when modified
Date: Sun, 26 Feb 2023 19:41:49 -1000
Message-Id: <20230227054233.390271-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:43:59 -0000

In several instances, a temp is initialized with a
for use as a constant, and then subsequently used
as an unrelated temp.  Split them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 7435e51acc..6f4151232f 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1635,8 +1635,8 @@ static void bcd_add(TCGv dest, TCGv src)
      *    = result with some possible exceeding 0x6
      */
 
-    t0 = tcg_const_i32(0x066);
-    tcg_gen_add_i32(t0, t0, src);
+    t0 = tcg_temp_new();
+    tcg_gen_addi_i32(t0, src, 0x066);
 
     t1 = tcg_temp_new();
     tcg_gen_add_i32(t1, t0, dest);
@@ -1822,7 +1822,8 @@ DISAS_INSN(nbcd)
 
     SRC_EA(env, src, OS_BYTE, 0, &addr);
 
-    dest = tcg_const_i32(0);
+    dest = tcg_temp_new();
+    tcg_gen_movi_i32(dest, 0);
     bcd_sub(dest, src);
 
     DEST_EA(env, insn, OS_BYTE, dest, &addr);
@@ -1900,8 +1901,8 @@ DISAS_INSN(bitop_reg)
     else
         tcg_gen_andi_i32(src2, DREG(insn, 9), 31);
 
-    tmp = tcg_const_i32(1);
-    tcg_gen_shl_i32(tmp, tmp, src2);
+    tmp = tcg_temp_new();
+    tcg_gen_shl_i32(tmp, tcg_constant_i32(1), src2);
 
     tcg_gen_and_i32(QREG_CC_Z, src1, tmp);
 
@@ -3080,7 +3081,7 @@ DISAS_INSN(suba)
 
 static inline void gen_subx(DisasContext *s, TCGv src, TCGv dest, int opsize)
 {
-    TCGv tmp;
+    TCGv tmp, zero;
 
     gen_flush_flags(s); /* compute old Z */
 
@@ -3089,14 +3090,15 @@ static inline void gen_subx(DisasContext *s, TCGv src, TCGv dest, int opsize)
      * (X, N) = dest - (src + X);
      */
 
-    tmp = tcg_const_i32(0);
-    tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, src, tmp, QREG_CC_X, tmp);
-    tcg_gen_sub2_i32(QREG_CC_N, QREG_CC_X, dest, tmp, QREG_CC_N, QREG_CC_X);
+    zero = tcg_constant_i32(0);
+    tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, src, zero, QREG_CC_X, zero);
+    tcg_gen_sub2_i32(QREG_CC_N, QREG_CC_X, dest, zero, QREG_CC_N, QREG_CC_X);
     gen_ext(QREG_CC_N, QREG_CC_N, opsize, 1);
     tcg_gen_andi_i32(QREG_CC_X, QREG_CC_X, 1);
 
     /* Compute signed-overflow for subtract.  */
 
+    tmp = tcg_temp_new();
     tcg_gen_xor_i32(QREG_CC_V, QREG_CC_N, dest);
     tcg_gen_xor_i32(tmp, dest, src);
     tcg_gen_and_i32(QREG_CC_V, QREG_CC_V, tmp);
@@ -3283,7 +3285,7 @@ DISAS_INSN(adda)
 
 static inline void gen_addx(DisasContext *s, TCGv src, TCGv dest, int opsize)
 {
-    TCGv tmp;
+    TCGv tmp, zero;
 
     gen_flush_flags(s); /* compute old Z */
 
@@ -3292,13 +3294,14 @@ static inline void gen_addx(DisasContext *s, TCGv src, TCGv dest, int opsize)
      * (X, N) = src + dest + X;
      */
 
-    tmp = tcg_const_i32(0);
-    tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, QREG_CC_X, tmp, dest, tmp);
-    tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, QREG_CC_N, QREG_CC_X, src, tmp);
+    zero = tcg_constant_i32(0);
+    tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, QREG_CC_X, zero, dest, zero);
+    tcg_gen_add2_i32(QREG_CC_N, QREG_CC_X, QREG_CC_N, QREG_CC_X, src, zero);
     gen_ext(QREG_CC_N, QREG_CC_N, opsize, 1);
 
     /* Compute signed-overflow for addition.  */
 
+    tmp = tcg_temp_new();
     tcg_gen_xor_i32(QREG_CC_V, QREG_CC_N, src);
     tcg_gen_xor_i32(tmp, dest, src);
     tcg_gen_andc_i32(QREG_CC_V, QREG_CC_V, tmp);
-- 
2.34.1


