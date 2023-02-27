Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWN8-0003hc-MI
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMh-00010S-KH
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:47:59 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMe-0007ED-8t
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:47:59 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so8877680pjb.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWtGI1X+TfUcRu7oZUXYCqGhprhtQLCjzZHoWlnqNGs=;
 b=pQFTDT9YNTIb/oEUDJ7GZZQOGisqA75TWrfL/PutCQmthRWDqGlTEFh/R/d3yXxx45
 ++xR//XcRgE3ydPIBRx8xAuvUuGLtvUDS/WH0lcbq0zue87fw4rpcagCVpHaDwjtQOpF
 5giwQGFnNh6n+gbHuSP+SeK+F55Qu0CBNRN625ab1dpiBg5UmRP9Tc7Pf+aGrTiH6I11
 3eIw5r6w8yFPswtHGWGwL8Ux62In/Ohk12wBg/RI0lcI6BcbEINWBja7Nl0T1mhen2ES
 kBzIvrnDIl61ZI4ZZohygR8E4pBnOUFMFGAEEIjlupV8kApduj9xWKNxBoVZr+XIAJUn
 fYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bWtGI1X+TfUcRu7oZUXYCqGhprhtQLCjzZHoWlnqNGs=;
 b=ooJlZ7wDMoByUMi5skRRPbmZwjZFbRQB+V/8/skeUPRHogQLqggKNH0rMQVb23Rkax
 tpK2UwbuE9f69qJSy10ZE6b9d8aNUc3Hql3THnb7hO0c6EupatUjnp0U9pbaIUgB65tL
 rrdRHXQ2iUCDjt+wu/yU5GCfjyd4icV5ATMkyBTu8v4iCVrf2T1RuOwRsz2PFrwyJMpQ
 iR82AWth084/Fvumi3rjE8jewh4ucO8iNV6zA7Hc0FYJhA63Ba+buOSc6esCaIMm1oxV
 q+Hb47duHKOt8eRsCdO8Rn4nm60zei0qNkHIzmo1qrvpOAy6A7ZYZMoGTjvGBuEnYmQm
 0OqQ==
X-Gm-Message-State: AO0yUKVraQotGfBisyqrungyXMbM6mNUzoKiMIuAejQlIfE/QtIfw+eh
 WTPR6yf+Q4kOPb0LS/YxyUcCFA==
X-Google-Smtp-Source: AK7set+ARfDZAVx7lRFtH+CmFV7Nvk1fy40iWCHJJBKvz76PuLv0Pi84f9OL182n9IzJTQSF6TBxig==
X-Received: by 2002:a17:902:e851:b0:19b:c2d:1222 with SMTP id
 t17-20020a170902e85100b0019b0c2d1222mr29003516plg.52.1677476874538; 
 Sun, 26 Feb 2023 21:47:54 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 49/70] target/rx: Avoid tcg_const_i32
Date: Sun, 26 Feb 2023 19:42:12 -1000
Message-Id: <20230227054233.390271-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:48:00 -0000

All remaining uses are strictly read-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 6b218d5d5e..70fad98e93 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -456,7 +456,7 @@ static bool trans_MOV_ir(DisasContext *ctx, arg_MOV_ir *a)
 static bool trans_MOV_im(DisasContext *ctx, arg_MOV_im *a)
 {
     TCGv imm, mem;
-    imm = tcg_const_i32(a->imm);
+    imm = tcg_constant_i32(a->imm);
     mem = tcg_temp_new();
     tcg_gen_addi_i32(mem, cpu_regs[a->rd], a->dsp << a->sz);
     rx_gen_st(a->sz, imm, mem);
@@ -729,8 +729,8 @@ static inline void stcond(TCGCond cond, int rd, int imm)
 {
     TCGv z;
     TCGv _imm;
-    z = tcg_const_i32(0);
-    _imm = tcg_const_i32(imm);
+    z = tcg_constant_i32(0);
+    _imm = tcg_constant_i32(imm);
     tcg_gen_movcond_i32(cond, cpu_regs[rd], cpu_psw_z, z,
                         _imm, cpu_regs[rd]);
 }
@@ -815,7 +815,7 @@ static inline void rx_gen_op_rrr(op3fn opr, int dst, int src, int src2)
 
 static inline void rx_gen_op_irr(op3fn opr, int dst, int src, uint32_t src2)
 {
-    TCGv imm = tcg_const_i32(src2);
+    TCGv imm = tcg_constant_i32(src2);
     opr(cpu_regs[dst], cpu_regs[src], imm);
 }
 
@@ -1188,7 +1188,7 @@ static bool trans_MUL_rrr(DisasContext *ctx, arg_MUL_rrr *a)
 /* emul #imm, rd */
 static bool trans_EMUL_ir(DisasContext *ctx, arg_EMUL_ir *a)
 {
-    TCGv imm = tcg_const_i32(a->imm);
+    TCGv imm = tcg_constant_i32(a->imm);
     if (a->rd > 14) {
         qemu_log_mask(LOG_GUEST_ERROR, "rd too large %d", a->rd);
     }
@@ -1215,7 +1215,7 @@ static bool trans_EMUL_mr(DisasContext *ctx, arg_EMUL_mr *a)
 /* emulu #imm, rd */
 static bool trans_EMULU_ir(DisasContext *ctx, arg_EMULU_ir *a)
 {
-    TCGv imm = tcg_const_i32(a->imm);
+    TCGv imm = tcg_constant_i32(a->imm);
     if (a->rd > 14) {
         qemu_log_mask(LOG_GUEST_ERROR, "rd too large %d", a->rd);
     }
@@ -1585,7 +1585,7 @@ static bool trans_BRA_l(DisasContext *ctx, arg_BRA_l *a)
 
 static inline void rx_save_pc(DisasContext *ctx)
 {
-    TCGv pc = tcg_const_i32(ctx->base.pc_next);
+    TCGv pc = tcg_constant_i32(ctx->base.pc_next);
     push(pc);
 }
 
@@ -1668,7 +1668,7 @@ static bool trans_SMOVB(DisasContext *ctx, arg_SMOVB *a)
 
 #define STRING(op)                              \
     do {                                        \
-        TCGv size = tcg_const_i32(a->sz);       \
+        TCGv size = tcg_constant_i32(a->sz);    \
         gen_helper_##op(cpu_env, size);         \
     } while (0)
 
@@ -1799,7 +1799,7 @@ static bool trans_MVTACLO(DisasContext *ctx, arg_MVTACLO *a)
 /* racw #imm */
 static bool trans_RACW(DisasContext *ctx, arg_RACW *a)
 {
-    TCGv imm = tcg_const_i32(a->imm + 1);
+    TCGv imm = tcg_constant_i32(a->imm + 1);
     gen_helper_racw(cpu_env, imm);
     return true;
 }
@@ -1809,7 +1809,7 @@ static bool trans_SAT(DisasContext *ctx, arg_SAT *a)
 {
     TCGv tmp, z;
     tmp = tcg_temp_new();
-    z = tcg_const_i32(0);
+    z = tcg_constant_i32(0);
     /* S == 1 -> 0xffffffff / S == 0 -> 0x00000000 */
     tcg_gen_sari_i32(tmp, cpu_psw_s, 31);
     /* S == 1 -> 0x7fffffff / S == 0 -> 0x80000000 */
@@ -1831,7 +1831,7 @@ static bool trans_SATR(DisasContext *ctx, arg_SATR *a)
     static bool cat3(trans_, name, _ir)(DisasContext *ctx,              \
                                         cat3(arg_, name, _ir) * a)      \
     {                                                                   \
-        TCGv imm = tcg_const_i32(li(ctx, 0));                           \
+        TCGv imm = tcg_constant_i32(li(ctx, 0));                        \
         gen_helper_##op(cpu_regs[a->rd], cpu_env,                       \
                         cpu_regs[a->rd], imm);                          \
         return true;                                                    \
@@ -1865,7 +1865,7 @@ FOP(FDIV, fdiv)
 /* fcmp #imm, rd */
 static bool trans_FCMP_ir(DisasContext *ctx, arg_FCMP_ir * a)
 {
-    TCGv imm = tcg_const_i32(li(ctx, 0));
+    TCGv imm = tcg_constant_i32(li(ctx, 0));
     gen_helper_fcmp(cpu_env, cpu_regs[a->rd], imm);
     return true;
 }
@@ -1962,7 +1962,7 @@ static inline void rx_bnotr(TCGv reg, TCGv mask)
     {                                                                   \
         TCGv mask, mem, addr;                                           \
         mem = tcg_temp_new();                                           \
-        mask = tcg_const_i32(1 << a->imm);                              \
+        mask = tcg_constant_i32(1 << a->imm);                           \
         addr = rx_index_addr(ctx, mem, a->ld, MO_8, a->rs);             \
         cat3(rx_, op, m)(addr, mask);                                   \
         return true;                                                    \
@@ -1971,7 +1971,7 @@ static inline void rx_bnotr(TCGv reg, TCGv mask)
                                         cat3(arg_, name, _ir) * a)      \
     {                                                                   \
         TCGv mask;                                                      \
-        mask = tcg_const_i32(1 << a->imm);                              \
+        mask = tcg_constant_i32(1 << a->imm);                           \
         cat3(rx_, op, r)(cpu_regs[a->rd], mask);                        \
         return true;                                                    \
     }                                                                   \
@@ -2116,7 +2116,7 @@ static bool trans_MVTC_i(DisasContext *ctx, arg_MVTC_i *a)
 {
     TCGv imm;
 
-    imm = tcg_const_i32(a->imm);
+    imm = tcg_constant_i32(a->imm);
     move_to_cr(ctx, imm, a->cr);
     return true;
 }
@@ -2178,7 +2178,7 @@ static bool trans_INT(DisasContext *ctx, arg_INT *a)
     TCGv vec;
 
     tcg_debug_assert(a->imm < 0x100);
-    vec = tcg_const_i32(a->imm);
+    vec = tcg_constant_i32(a->imm);
     tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
     gen_helper_rxint(cpu_env, vec);
     ctx->base.is_jmp = DISAS_NORETURN;
-- 
2.34.1


