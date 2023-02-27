Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWOA-0007H5-41
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNC-0004AT-RB
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:31 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWN9-0007J6-Bj
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:30 -0500
Received: by mail-pj1-x102c.google.com with SMTP id oj5so928570pjb.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DIMzL9acyGxa+iCDYHzCCw6qObXk60UJrAsgT++SeHo=;
 b=TtA3I7mb91RXzhat1pNeyE8EsklDmTa0hOBxwf2ibW88wSaDZ7UdDo3mQZIWTiX9Wg
 ynsDPLt0MOIzdPpGfPiC9h3HqGaUNQbh02OriVpWUz7uYv23OI2fDYTQ4nJOG5f8Odn5
 rVm82Zk2YjixhpUKzScaEbCD7osNy2L0hOLYCVlTa7PjLooINWZX0qBv+Ucsz/UHgBaX
 rZ3Q4X4TXUl0HnDaa5CXDQR+O8IguMgN0UfCLoqaqwAQgGC0EhcM4PdSHJSswn/9lmbV
 4guEKnT36l+Q71YeesZI+1SlnC1CbiLSkprcMTzLWp33vk9wH/9Ty6CQZOVh3pkYbxEr
 pUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DIMzL9acyGxa+iCDYHzCCw6qObXk60UJrAsgT++SeHo=;
 b=PxbCGHPIi+fzEKmRa4ibGLvJSk3o5W1ZUi6UWm48fmIOK+6og6NY7FymMTaR4vxKD0
 XZTMQ2wSUQ0HpTyRLod5wPUf/ZB3+KmCSvroEP9F3olV+ZYZircP0PPy/1nCom8WTrc7
 zlKyX78EFV0Uu9Zy+Zgx4yl9wPiyf2ck9mb+GcaI/AqucvRd9k0wVRM9LvHOms4WocDM
 I/foRnF5ILsubfoSxQWSr4MRl8Fktue54Hx+tF8azMr18/vp7qejwWEW/NIqFY8cl5+j
 GdSi33Fl/W0cRTRKjAibgNQ58WqZ/SglEFPkunSxj67auks3Kov8IdFhGWgmctzCzbDR
 Tg6w==
X-Gm-Message-State: AO0yUKUhhm5pJfNPImJFHMgl0+bYgCyAyWazuFUdC0MEYx7j5LHcl9JA
 wwS0HsszQHO8XHI+jf5iyzQuZQ==
X-Google-Smtp-Source: AK7set/BumGHWR5/bpQ75Md+W5os96BMpQYe5wpJh5/aBD9NyHGMqLsOhztz87vgg+yTEqikY9CAqw==
X-Received: by 2002:a17:902:d4c3:b0:19c:c9d0:5bf8 with SMTP id
 o3-20020a170902d4c300b0019cc9d05bf8mr14192714plg.35.1677476906360; 
 Sun, 26 Feb 2023 21:48:26 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 61/70] target/tricore: Avoid tcg_const_i32
Date: Sun, 26 Feb 2023 19:42:24 -1000
Message-Id: <20230227054233.390271-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Mon, 27 Feb 2023 05:48:33 -0000

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 127 +++++++++++++++++++------------------
 1 file changed, 64 insertions(+), 63 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 71c8f3d568..3dd9327f6c 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -124,7 +124,7 @@ void tricore_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 /* Makros for generating helpers */
 
 #define gen_helper_1arg(name, arg) do {                           \
-    TCGv_i32 helper_tmp = tcg_const_i32(arg);                     \
+    TCGv_i32 helper_tmp = tcg_constant_i32(arg);                  \
     gen_helper_##name(cpu_env, helper_tmp);                       \
     } while (0)
 
@@ -513,7 +513,7 @@ static inline void gen_madd32_d(TCGv ret, TCGv r1, TCGv r2, TCGv r3)
 
 static inline void gen_maddi32_d(TCGv ret, TCGv r1, TCGv r2, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_madd32_d(ret, r1, r2, temp);
 }
 
@@ -579,7 +579,7 @@ static inline void
 gen_maddi64_d(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
               int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_madd64_d(ret_low, ret_high, r1, r2_low, r2_high, temp);
 }
 
@@ -587,7 +587,7 @@ static inline void
 gen_maddui64_d(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
                int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_maddu64_d(ret_low, ret_high, r1, r2_low, r2_high, temp);
 }
 
@@ -1224,7 +1224,7 @@ static inline void gen_msub32_d(TCGv ret, TCGv r1, TCGv r2, TCGv r3)
 
 static inline void gen_msubi32_d(TCGv ret, TCGv r1, TCGv r2, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_msub32_d(ret, r1, r2, temp);
 }
 
@@ -1260,7 +1260,7 @@ static inline void
 gen_msubi64_d(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
               int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_msub64_d(ret_low, ret_high, r1, r2_low, r2_high, temp);
 }
 
@@ -1296,13 +1296,13 @@ static inline void
 gen_msubui64_d(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
                int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_msubu64_d(ret_low, ret_high, r1, r2_low, r2_high, temp);
 }
 
 static inline void gen_addi_d(TCGv ret, TCGv r1, target_ulong r2)
 {
-    TCGv temp = tcg_const_i32(r2);
+    TCGv temp = tcg_constant_i32(r2);
     gen_add_d(ret, r1, temp);
 }
 
@@ -1332,7 +1332,7 @@ static inline void gen_add_CC(TCGv ret, TCGv r1, TCGv r2)
 
 static inline void gen_addi_CC(TCGv ret, TCGv r1, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_add_CC(ret, r1, temp);
 }
 
@@ -1364,7 +1364,7 @@ static inline void gen_addc_CC(TCGv ret, TCGv r1, TCGv r2)
 
 static inline void gen_addci_CC(TCGv ret, TCGv r1, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_addc_CC(ret, r1, temp);
 }
 
@@ -1375,7 +1375,7 @@ static inline void gen_cond_add(TCGCond cond, TCGv r1, TCGv r2, TCGv r3,
     TCGv temp2 = tcg_temp_new();
     TCGv result = tcg_temp_new();
     TCGv mask = tcg_temp_new();
-    TCGv t0 = tcg_const_i32(0);
+    TCGv t0 = tcg_constant_i32(0);
 
     /* create mask for sticky bits */
     tcg_gen_setcond_tl(cond, mask, r4, t0);
@@ -1404,7 +1404,7 @@ static inline void gen_cond_add(TCGCond cond, TCGv r1, TCGv r2, TCGv r3,
 static inline void gen_condi_add(TCGCond cond, TCGv r1, int32_t r2,
                                  TCGv r3, TCGv r4)
 {
-    TCGv temp = tcg_const_i32(r2);
+    TCGv temp = tcg_constant_i32(r2);
     gen_cond_add(cond, r1, temp, r3, r4);
 }
 
@@ -1492,7 +1492,7 @@ static inline void gen_cond_sub(TCGCond cond, TCGv r1, TCGv r2, TCGv r3,
     TCGv temp2 = tcg_temp_new();
     TCGv result = tcg_temp_new();
     TCGv mask = tcg_temp_new();
-    TCGv t0 = tcg_const_i32(0);
+    TCGv t0 = tcg_constant_i32(0);
 
     /* create mask for sticky bits */
     tcg_gen_setcond_tl(cond, mask, r4, t0);
@@ -1705,14 +1705,14 @@ gen_msubr32s_h(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n, uint32_t mode)
 static inline void
 gen_msubr_q(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv temp = tcg_constant_i32(n);
     gen_helper_msubr_q(ret, cpu_env, r1, r2, r3, temp);
 }
 
 static inline void
 gen_msubrs_q(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n)
 {
-    TCGv temp = tcg_const_i32(n);
+    TCGv temp = tcg_constant_i32(n);
     gen_helper_msubr_q_ssov(ret, cpu_env, r1, r2, r3, temp);
 }
 
@@ -2149,13 +2149,13 @@ static inline void gen_absdif(TCGv ret, TCGv r1, TCGv r2)
 
 static inline void gen_absdifi(TCGv ret, TCGv r1, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_absdif(ret, r1, temp);
 }
 
 static inline void gen_absdifsi(TCGv ret, TCGv r1, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_helper_absdif_ssov(ret, cpu_env, r1, temp);
 }
 
@@ -2181,7 +2181,7 @@ static inline void gen_mul_i32s(TCGv ret, TCGv r1, TCGv r2)
 
 static inline void gen_muli_i32s(TCGv ret, TCGv r1, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_mul_i32s(ret, r1, temp);
 }
 
@@ -2202,7 +2202,7 @@ static inline void gen_mul_i64s(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2)
 static inline void gen_muli_i64s(TCGv ret_low, TCGv ret_high, TCGv r1,
                                 int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_mul_i64s(ret_low, ret_high, r1, temp);
 }
 
@@ -2223,31 +2223,32 @@ static inline void gen_mul_i64u(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2)
 static inline void gen_muli_i64u(TCGv ret_low, TCGv ret_high, TCGv r1,
                                 int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_mul_i64u(ret_low, ret_high, r1, temp);
 }
 
 static inline void gen_mulsi_i32(TCGv ret, TCGv r1, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_helper_mul_ssov(ret, cpu_env, r1, temp);
 }
 
 static inline void gen_mulsui_i32(TCGv ret, TCGv r1, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_helper_mul_suov(ret, cpu_env, r1, temp);
 }
+
 /* gen_maddsi_32(cpu_gpr_d[r4], cpu_gpr_d[r1], cpu_gpr_d[r3], const9); */
 static inline void gen_maddsi_32(TCGv ret, TCGv r1, TCGv r2, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_helper_madd32_ssov(ret, cpu_env, r1, r2, temp);
 }
 
 static inline void gen_maddsui_32(TCGv ret, TCGv r1, TCGv r2, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_helper_madd32_suov(ret, cpu_env, r1, r2, temp);
 }
 
@@ -2370,7 +2371,7 @@ static inline void
 gen_maddsi_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
               int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_madds_64(ret_low, ret_high, r1, r2_low, r2_high, temp);
 }
 
@@ -2388,19 +2389,19 @@ static inline void
 gen_maddsui_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
                int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_maddsu_64(ret_low, ret_high, r1, r2_low, r2_high, temp);
 }
 
 static inline void gen_msubsi_32(TCGv ret, TCGv r1, TCGv r2, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_helper_msub32_ssov(ret, cpu_env, r1, r2, temp);
 }
 
 static inline void gen_msubsui_32(TCGv ret, TCGv r1, TCGv r2, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_helper_msub32_suov(ret, cpu_env, r1, r2, temp);
 }
 
@@ -2418,7 +2419,7 @@ static inline void
 gen_msubsi_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
               int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_msubs_64(ret_low, ret_high, r1, r2_low, r2_high, temp);
 }
 
@@ -2436,7 +2437,7 @@ static inline void
 gen_msubsui_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
                int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_msubsu_64(ret_low, ret_high, r1, r2_low, r2_high, temp);
 }
 
@@ -2499,8 +2500,8 @@ static void gen_shaci(TCGv ret, TCGv r1, int32_t shift_count)
         /* clear PSW.V */
         tcg_gen_movi_tl(cpu_PSW_V, 0);
     } else if (shift_count > 0) {
-        TCGv t_max = tcg_const_i32(0x7FFFFFFF >> shift_count);
-        TCGv t_min = tcg_const_i32(((int32_t) -0x80000000) >> shift_count);
+        TCGv t_max = tcg_constant_i32(0x7FFFFFFF >> shift_count);
+        TCGv t_min = tcg_constant_i32(((int32_t) -0x80000000) >> shift_count);
 
         /* calc carry */
         msk_start = 32 - shift_count;
@@ -2538,7 +2539,7 @@ static void gen_shas(TCGv ret, TCGv r1, TCGv r2)
 
 static void gen_shasi(TCGv ret, TCGv r1, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_shas(ret, r1, temp);
 }
 
@@ -2580,7 +2581,7 @@ static void gen_sh_cond(int cond, TCGv ret, TCGv r1, TCGv r2)
 
 static void gen_sh_condi(int cond, TCGv ret, TCGv r1, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_sh_cond(cond, ret, r1, temp);
 }
 
@@ -2591,13 +2592,13 @@ static inline void gen_adds(TCGv ret, TCGv r1, TCGv r2)
 
 static inline void gen_addsi(TCGv ret, TCGv r1, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_helper_add_ssov(ret, cpu_env, r1, temp);
 }
 
 static inline void gen_addsui(TCGv ret, TCGv r1, int32_t con)
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_helper_add_suov(ret, cpu_env, r1, temp);
 }
 
@@ -2667,7 +2668,7 @@ static inline void
 gen_accumulating_condi(int cond, TCGv ret, TCGv r1, int32_t con,
                        void(*op)(TCGv, TCGv, TCGv))
 {
-    TCGv temp = tcg_const_i32(con);
+    TCGv temp = tcg_constant_i32(con);
     gen_accumulating_cond(cond, ret, r1, temp, op);
 }
 
@@ -2834,8 +2835,8 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 
 static void generate_trap(DisasContext *ctx, int class, int tin)
 {
-    TCGv_i32 classtemp = tcg_const_i32(class);
-    TCGv_i32 tintemp = tcg_const_i32(tin);
+    TCGv_i32 classtemp = tcg_constant_i32(class);
+    TCGv_i32 tintemp = tcg_constant_i32(tin);
 
     gen_save_pc(ctx->base.pc_next);
     gen_helper_raise_exception_sync(cpu_env, classtemp, tintemp);
@@ -2857,7 +2858,7 @@ static inline void gen_branch_cond(DisasContext *ctx, TCGCond cond, TCGv r1,
 static inline void gen_branch_condi(DisasContext *ctx, TCGCond cond, TCGv r1,
                                     int r2, int16_t address)
 {
-    TCGv temp = tcg_const_i32(r2);
+    TCGv temp = tcg_constant_i32(r2);
     gen_branch_cond(ctx, cond, r1, temp, address);
 }
 
@@ -3186,14 +3187,14 @@ static void decode_src_opc(DisasContext *ctx, int op1)
                       cpu_gpr_d[15]);
         break;
     case OPC1_16_SRC_CMOV:
-        temp = tcg_const_tl(0);
-        temp2 = tcg_const_tl(const4);
+        temp = tcg_constant_tl(0);
+        temp2 = tcg_constant_tl(const4);
         tcg_gen_movcond_tl(TCG_COND_NE, cpu_gpr_d[r1], cpu_gpr_d[15], temp,
                            temp2, cpu_gpr_d[r1]);
         break;
     case OPC1_16_SRC_CMOVN:
-        temp = tcg_const_tl(0);
-        temp2 = tcg_const_tl(const4);
+        temp = tcg_constant_tl(0);
+        temp2 = tcg_constant_tl(const4);
         tcg_gen_movcond_tl(TCG_COND_EQ, cpu_gpr_d[r1], cpu_gpr_d[15], temp,
                            temp2, cpu_gpr_d[r1]);
         break;
@@ -3259,12 +3260,12 @@ static void decode_srr_opc(DisasContext *ctx, int op1)
         tcg_gen_and_tl(cpu_gpr_d[r1], cpu_gpr_d[r1], cpu_gpr_d[r2]);
         break;
     case OPC1_16_SRR_CMOV:
-        temp = tcg_const_tl(0);
+        temp = tcg_constant_tl(0);
         tcg_gen_movcond_tl(TCG_COND_NE, cpu_gpr_d[r1], cpu_gpr_d[15], temp,
                            cpu_gpr_d[r2], cpu_gpr_d[r1]);
         break;
     case OPC1_16_SRR_CMOVN:
-        temp = tcg_const_tl(0);
+        temp = tcg_constant_tl(0);
         tcg_gen_movcond_tl(TCG_COND_EQ, cpu_gpr_d[r1], cpu_gpr_d[15], temp,
                            cpu_gpr_d[r2], cpu_gpr_d[r1]);
         break;
@@ -3789,7 +3790,7 @@ static void decode_abs_ldw(DisasContext *ctx)
     address = MASK_OP_ABS_OFF18(ctx->opcode);
     op2 = MASK_OP_ABS_OP2(ctx->opcode);
 
-    temp = tcg_const_i32(EA_ABS_FORMAT(address));
+    temp = tcg_constant_i32(EA_ABS_FORMAT(address));
 
     switch (op2) {
     case OPC2_32_ABS_LD_A:
@@ -3822,7 +3823,7 @@ static void decode_abs_ldb(DisasContext *ctx)
     address = MASK_OP_ABS_OFF18(ctx->opcode);
     op2 = MASK_OP_ABS_OP2(ctx->opcode);
 
-    temp = tcg_const_i32(EA_ABS_FORMAT(address));
+    temp = tcg_constant_i32(EA_ABS_FORMAT(address));
 
     switch (op2) {
     case OPC2_32_ABS_LD_B:
@@ -3853,7 +3854,7 @@ static void decode_abs_ldst_swap(DisasContext *ctx)
     address = MASK_OP_ABS_OFF18(ctx->opcode);
     op2 = MASK_OP_ABS_OP2(ctx->opcode);
 
-    temp = tcg_const_i32(EA_ABS_FORMAT(address));
+    temp = tcg_constant_i32(EA_ABS_FORMAT(address));
 
     switch (op2) {
     case OPC2_32_ABS_LDMST:
@@ -3904,7 +3905,7 @@ static void decode_abs_store(DisasContext *ctx)
     address = MASK_OP_ABS_OFF18(ctx->opcode);
     op2 = MASK_OP_ABS_OP2(ctx->opcode);
 
-    temp = tcg_const_i32(EA_ABS_FORMAT(address));
+    temp = tcg_constant_i32(EA_ABS_FORMAT(address));
 
     switch (op2) {
     case OPC2_32_ABS_ST_A:
@@ -3937,7 +3938,7 @@ static void decode_abs_storeb_h(DisasContext *ctx)
     address = MASK_OP_ABS_OFF18(ctx->opcode);
     op2 = MASK_OP_ABS_OP2(ctx->opcode);
 
-    temp = tcg_const_i32(EA_ABS_FORMAT(address));
+    temp = tcg_constant_i32(EA_ABS_FORMAT(address));
 
     switch (op2) {
     case OPC2_32_ABS_ST_B:
@@ -5295,7 +5296,7 @@ static void decode_rcpw_insert(DisasContext *ctx)
     case OPC2_32_RCPW_INSERT:
         /* if pos + width > 32 undefined result */
         if (pos + width <= 32) {
-            temp = tcg_const_i32(const4);
+            temp = tcg_constant_i32(const4);
             tcg_gen_deposit_tl(cpu_gpr_d[r2], cpu_gpr_d[r1], temp, pos, width);
         }
         break;
@@ -5371,14 +5372,14 @@ static void decode_rcr_cond_select(DisasContext *ctx)
                       cpu_gpr_d[r3]);
         break;
     case OPC2_32_RCR_SEL:
-        temp = tcg_const_i32(0);
-        temp2 = tcg_const_i32(const9);
+        temp = tcg_constant_i32(0);
+        temp2 = tcg_constant_i32(const9);
         tcg_gen_movcond_tl(TCG_COND_NE, cpu_gpr_d[r4], cpu_gpr_d[r3], temp,
                            cpu_gpr_d[r1], temp2);
         break;
     case OPC2_32_RCR_SELN:
-        temp = tcg_const_i32(0);
-        temp2 = tcg_const_i32(const9);
+        temp = tcg_constant_i32(0);
+        temp2 = tcg_constant_i32(const9);
         tcg_gen_movcond_tl(TCG_COND_EQ, cpu_gpr_d[r4], cpu_gpr_d[r3], temp,
                            cpu_gpr_d[r1], temp2);
         break;
@@ -6255,7 +6256,7 @@ static void decode_rr1_mul(DisasContext *ctx)
     r1 = MASK_OP_RR1_S1(ctx->opcode);
     r2 = MASK_OP_RR1_S2(ctx->opcode);
     r3 = MASK_OP_RR1_D(ctx->opcode);
-    n  = tcg_const_i32(MASK_OP_RR1_N(ctx->opcode));
+    n  = tcg_constant_i32(MASK_OP_RR1_N(ctx->opcode));
     op2 = MASK_OP_RR1_OP2(ctx->opcode);
 
     switch (op2) {
@@ -6549,12 +6550,12 @@ static void decode_rrr_cond_select(DisasContext *ctx)
                      cpu_gpr_d[r3]);
         break;
     case OPC2_32_RRR_SEL:
-        temp = tcg_const_i32(0);
+        temp = tcg_constant_i32(0);
         tcg_gen_movcond_tl(TCG_COND_NE, cpu_gpr_d[r4], cpu_gpr_d[r3], temp,
                            cpu_gpr_d[r1], cpu_gpr_d[r2]);
         break;
     case OPC2_32_RRR_SELN:
-        temp = tcg_const_i32(0);
+        temp = tcg_constant_i32(0);
         tcg_gen_movcond_tl(TCG_COND_EQ, cpu_gpr_d[r4], cpu_gpr_d[r3], temp,
                            cpu_gpr_d[r1], cpu_gpr_d[r2]);
         break;
@@ -7956,7 +7957,7 @@ static void decode_32Bit_opc(DisasContext *ctx)
     case OPC1_32_ABS_STOREQ:
         address = MASK_OP_ABS_OFF18(ctx->opcode);
         r1 = MASK_OP_ABS_S1D(ctx->opcode);
-        temp = tcg_const_i32(EA_ABS_FORMAT(address));
+        temp = tcg_constant_i32(EA_ABS_FORMAT(address));
         temp2 = tcg_temp_new();
 
         tcg_gen_shri_tl(temp2, cpu_gpr_d[r1], 16);
@@ -7965,7 +7966,7 @@ static void decode_32Bit_opc(DisasContext *ctx)
     case OPC1_32_ABS_LD_Q:
         address = MASK_OP_ABS_OFF18(ctx->opcode);
         r1 = MASK_OP_ABS_S1D(ctx->opcode);
-        temp = tcg_const_i32(EA_ABS_FORMAT(address));
+        temp = tcg_constant_i32(EA_ABS_FORMAT(address));
 
         tcg_gen_qemu_ld_tl(cpu_gpr_d[r1], temp, ctx->mem_idx, MO_LEUW);
         tcg_gen_shli_tl(cpu_gpr_d[r1], cpu_gpr_d[r1], 16);
@@ -7981,7 +7982,7 @@ static void decode_32Bit_opc(DisasContext *ctx)
         b = MASK_OP_ABSB_B(ctx->opcode);
         bpos = MASK_OP_ABSB_BPOS(ctx->opcode);
 
-        temp = tcg_const_i32(EA_ABS_FORMAT(address));
+        temp = tcg_constant_i32(EA_ABS_FORMAT(address));
         temp2 = tcg_temp_new();
 
         tcg_gen_qemu_ld_tl(temp2, temp, ctx->mem_idx, MO_UB);
@@ -8108,7 +8109,7 @@ static void decode_32Bit_opc(DisasContext *ctx)
         r2 = MASK_OP_RCRR_S3(ctx->opcode);
         r3 = MASK_OP_RCRR_D(ctx->opcode);
         const16 = MASK_OP_RCRR_CONST4(ctx->opcode);
-        temp = tcg_const_i32(const16);
+        temp = tcg_constant_i32(const16);
         temp2 = tcg_temp_new(); /* width*/
         temp3 = tcg_temp_new(); /* pos */
 
-- 
2.34.1


