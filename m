Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWII-0003t8-I9
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIF-0003eg-VM
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:24 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIC-0004pa-4Q
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:23 -0500
Received: by mail-pg1-x533.google.com with SMTP id s17so2854289pgv.4
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IK5cdibGrlxCvWnzF9s1ITVzwrnk5CQSmad2m4SDXHo=;
 b=hL6eJN8QUq0KkvG1eM6hrYIoztabAEq8R30mW6QVaNAgX3AlMNZ88MK07ILpsmnXgU
 5rAk3Bz3n/4d4AWylAqEtqGYCutrrdyM8QfXanJpsdiHv/6YbgASRajmbRRvvCa7fX+J
 MgWZ4SyinnXLKdL61DZn7OxOr3jiUiUpcHs9j7kTMI44DDijClkadAgjpHuDiRC5Fjc2
 EfXHt+QqFJ+N8LkXaywzV7ULNXwuapmspaB8ZN6bbK6s/0htk1exyK9Met/Yum2EqqUJ
 ynnecKAqvyyFFQk6AIno74u6UIYNh5h7yBIOuAdyfg9QVgqdIk3pxGHUgPT2cm9eTye1
 AXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IK5cdibGrlxCvWnzF9s1ITVzwrnk5CQSmad2m4SDXHo=;
 b=uVuPUmnA2GtPm8Vszkb8jQOZxVH5xmDbG5ZaESwRhkGJxo0zq6fSyHgLUuVms4ODFE
 2czb97yKeexqxr4ZcDKsu6lzsMVfV8A4ZWRlhAZXf3CBdk6ic6NmEbUILowwKJVipELF
 AuWZfu64wBU+weTdXsZIAX5B1SloQzRrPKNaQR5YE2KEY+Oqm0i8WwMdEUZbGrlHuPSU
 92MKa2LlA0HqCcIekn6vhTpKL+kyVZYFBApOpyXmVVpv9HbOvgc502fKzgZpHoVyokqc
 Xrhf09Kbd6X/xQs3MUlZP0+WIUsa5YGIfGbvKhmVZ5Ays66GGH4UYvotlbWs9B1phfZT
 GKJw==
X-Gm-Message-State: AO0yUKXl3tIqj3KME7xr1DE5u0eItaD6oRnnGxm0Fa28fBjk0fAtP0H5
 4p9Wd8sZfd59hAlo6/tOQ05TcA==
X-Google-Smtp-Source: AK7set9+B2kbcZjjiAe6w/TVwmG/6QMbMAc9LYdAdk/SbBKU2T1OuDC9lYc6NF7/Gjl0LWiC3MFlzg==
X-Received: by 2002:a62:1b4a:0:b0:5a8:acd9:765b with SMTP id
 b71-20020a621b4a000000b005a8acd9765bmr20858357pfb.16.1677476598819; 
 Sun, 26 Feb 2023 21:43:18 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 13/70] target/avr: Avoid use of tcg_const_i32 throughout
Date: Sun, 26 Feb 2023 19:41:36 -1000
Message-Id: <20230227054233.390271-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:43:24 -0000

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 190d0c3f97..a6aeae6dfa 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -400,7 +400,7 @@ static bool trans_SUB(DisasContext *ctx, arg_SUB *a)
 static bool trans_SUBI(DisasContext *ctx, arg_SUBI *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv Rr = tcg_const_i32(a->imm);
+    TCGv Rr = tcg_constant_i32(a->imm);
     TCGv R = tcg_temp_new_i32();
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Imm */
@@ -425,7 +425,7 @@ static bool trans_SBC(DisasContext *ctx, arg_SBC *a)
     TCGv Rd = cpu_r[a->rd];
     TCGv Rr = cpu_r[a->rr];
     TCGv R = tcg_temp_new_i32();
-    TCGv zero = tcg_const_i32(0);
+    TCGv zero = tcg_constant_i32(0);
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
     tcg_gen_sub_tl(R, R, cpu_Cf);
@@ -453,9 +453,9 @@ static bool trans_SBC(DisasContext *ctx, arg_SBC *a)
 static bool trans_SBCI(DisasContext *ctx, arg_SBCI *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv Rr = tcg_const_i32(a->imm);
+    TCGv Rr = tcg_constant_i32(a->imm);
     TCGv R = tcg_temp_new_i32();
-    TCGv zero = tcg_const_i32(0);
+    TCGv zero = tcg_constant_i32(0);
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
     tcg_gen_sub_tl(R, R, cpu_Cf);
@@ -637,7 +637,7 @@ static bool trans_COM(DisasContext *ctx, arg_COM *a)
 static bool trans_NEG(DisasContext *ctx, arg_NEG *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv t0 = tcg_const_i32(0);
+    TCGv t0 = tcg_constant_i32(0);
     TCGv R = tcg_temp_new_i32();
 
     tcg_gen_sub_tl(R, t0, Rd); /* R = 0 - Rd */
@@ -930,19 +930,19 @@ static void gen_jmp_z(DisasContext *ctx)
 static void gen_push_ret(DisasContext *ctx, int ret)
 {
     if (avr_feature(ctx->env, AVR_FEATURE_1_BYTE_PC)) {
-        TCGv t0 = tcg_const_i32((ret & 0x0000ff));
+        TCGv t0 = tcg_constant_i32(ret & 0x0000ff);
 
         tcg_gen_qemu_st_tl(t0, cpu_sp, MMU_DATA_IDX, MO_UB);
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
     } else if (avr_feature(ctx->env, AVR_FEATURE_2_BYTE_PC)) {
-        TCGv t0 = tcg_const_i32((ret & 0x00ffff));
+        TCGv t0 = tcg_constant_i32(ret & 0x00ffff);
 
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
         tcg_gen_qemu_st_tl(t0, cpu_sp, MMU_DATA_IDX, MO_BEUW);
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 1);
     } else if (avr_feature(ctx->env, AVR_FEATURE_3_BYTE_PC)) {
-        TCGv lo = tcg_const_i32((ret & 0x0000ff));
-        TCGv hi = tcg_const_i32((ret & 0xffff00) >> 8);
+        TCGv lo = tcg_constant_i32(ret & 0x0000ff);
+        TCGv hi = tcg_constant_i32((ret & 0xffff00) >> 8);
 
         tcg_gen_qemu_st_tl(lo, cpu_sp, MMU_DATA_IDX, MO_UB);
         tcg_gen_subi_tl(cpu_sp, cpu_sp, 2);
@@ -1211,7 +1211,7 @@ static bool trans_CPC(DisasContext *ctx, arg_CPC *a)
     TCGv Rd = cpu_r[a->rd];
     TCGv Rr = cpu_r[a->rr];
     TCGv R = tcg_temp_new_i32();
-    TCGv zero = tcg_const_i32(0);
+    TCGv zero = tcg_constant_i32(0);
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr - Cf */
     tcg_gen_sub_tl(R, R, cpu_Cf);
@@ -1238,7 +1238,7 @@ static bool trans_CPI(DisasContext *ctx, arg_CPI *a)
 {
     TCGv Rd = cpu_r[a->rd];
     int Imm = a->imm;
-    TCGv Rr = tcg_const_i32(Imm);
+    TCGv Rr = tcg_constant_i32(Imm);
     TCGv R = tcg_temp_new_i32();
 
     tcg_gen_sub_tl(R, Rd, Rr); /* R = Rd - Rr */
@@ -2124,7 +2124,7 @@ static bool trans_SPMX(DisasContext *ctx, arg_SPMX *a)
 static bool trans_IN(DisasContext *ctx, arg_IN *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv port = tcg_const_i32(a->imm);
+    TCGv port = tcg_constant_i32(a->imm);
 
     gen_helper_inb(Rd, cpu_env, port);
     return true;
@@ -2137,7 +2137,7 @@ static bool trans_IN(DisasContext *ctx, arg_IN *a)
 static bool trans_OUT(DisasContext *ctx, arg_OUT *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv port = tcg_const_i32(a->imm);
+    TCGv port = tcg_constant_i32(a->imm);
 
     gen_helper_outb(cpu_env, port, Rd);
     return true;
@@ -2405,7 +2405,7 @@ static bool trans_SWAP(DisasContext *ctx, arg_SWAP *a)
 static bool trans_SBI(DisasContext *ctx, arg_SBI *a)
 {
     TCGv data = tcg_temp_new_i32();
-    TCGv port = tcg_const_i32(a->reg);
+    TCGv port = tcg_constant_i32(a->reg);
 
     gen_helper_inb(data, cpu_env, port);
     tcg_gen_ori_tl(data, data, 1 << a->bit);
@@ -2420,7 +2420,7 @@ static bool trans_SBI(DisasContext *ctx, arg_SBI *a)
 static bool trans_CBI(DisasContext *ctx, arg_CBI *a)
 {
     TCGv data = tcg_temp_new_i32();
-    TCGv port = tcg_const_i32(a->reg);
+    TCGv port = tcg_constant_i32(a->reg);
 
     gen_helper_inb(data, cpu_env, port);
     tcg_gen_andi_tl(data, data, ~(1 << a->bit));
-- 
2.34.1


