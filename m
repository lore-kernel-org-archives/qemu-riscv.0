Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135B8C98328
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 05:22:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xB3oB-0003ZU-F6; Mon, 28 Sep 2026 01:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3o9-0003Yd-UK
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 01:21:45 -0400
Received: from mail-dl2-x0f.google.com ([2607:f8b0:4864:38::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3o8-0007os-0Z
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 01:21:45 -0400
Received: by mail-dl2-x0f.google.com with SMTP id
 a92af1059eb24-142dd04edb5so4395498c88.2
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 22:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790572903; x=1791177703; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DgWmlss43hYhAX+MCcVQvB7s8zaZj6PJ12LbT80sSKA=;
 b=iFmxfMH+jupD1tVnQQTH+iM+7t+KiK4MCxqB9ja2jIgvIZFgyf+BxTytlPu8UT+D/E
 avl2yw3bJc0rExzoy1R9gABc+T+de1Hye2pWBYLYvjFvhIDTXPqiBjRMyrsbZnwmjuBq
 WFRG6Z1MobdAwMMMhd7sFA1g25fcZxWpUPayoi99Iqxqu8R2HzAeRFR0AtRW/zdYEbi+
 mdvvhFb/2+MSTCtBT70GsTb2Oq9MwaoJIaCCYpz+4wabeYl8HDuKn5MAtJf7lhrofQiz
 T69oG04WfQ8Djlh8j+T6yiJZAetlrZSu8AlPGVyC6qZxjdfXuR7KZx49xdptJi/ouFLO
 S3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790572903; x=1791177703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=DgWmlss43hYhAX+MCcVQvB7s8zaZj6PJ12LbT80sSKA=;
 b=CYK5m8qElINVeRq8gHi6Oz3by/JimkEWt1X0IA/B45IGS20fi7RI0n4+8QrgTFBqnC
 SZ5FFQtnGqx4cZo16d4CmbxCNJaw7SP8l32nL5ZvpxgEaXZAO12vLIlVlH5YfNRlpX0n
 BD4AdZTnA6a6yX3zhLpbKE6qmWhryp8JSI+vEwBKJgbPOS9GwLy6bPGv1q0vXuEXLM/k
 EnNqYHMVk2Lh1SSE2UY93N79tn5hT2u51MUc/dQX9PUsxgbnKFWqYJrPZp7tkWkOXLfz
 RiLiXrXw1wXY9eJb/MfLCltHaSMttCqlKWRM4w9Bp0jUsZS/21kCxNELPkzCAydLNfXy
 M+Eg==
X-Forwarded-Encrypted: i=1;
 AKwUvByTi9nn2Hn+oAFYAKVXMEnwlt1AUhB2jLjMWI9Atvrm5bQadUwFyGqaecgDE3ZnJNqpOwjdRrYhbHbW@nongnu.org
X-Gm-Message-State: AFuF++n9jrShF6DMg9/B262hptjh394S7I653AUBMYQ3cp5nOMBwwwZ1
 3slgtAPlt/I2pqQnnfYCeWABZCm5Q3Yb2HBklqnhSIdGK4ya55k537SM
X-Gm-Gg: AYBFou1cbEV3hLe+YtAfNAYt7AigBQbdfKAIr/7fVJuOgRRtX77n2qJ1ubr+WAUMR8h
 Dc1vE561ug6MWShzlLSSbGleNvwRLNgoMFwfvOqVrtdOofxrm1Hn/1Uhs/IOtuUTvFx+xv+LuXo
 yfrFX+jP3tXenpBmgkvRiniwYyHmy3lGVoGGEQjAQoDMScI+6txMJNfV/XBMNtibYzgAoixQGo8
 pXqAwR0+Ah8feA3MflXqfUjxuG4J3bPf/4jau1yzH8O2jg7DvlCFCgKtku8GKHs02CtASIxEg8P
 YFkexMnw991hDxOAO81P/VIF+1Otl+V4WcFEjrRqdQqhPUgiibFHIkaZep9cJ5GBucyKFQCixZp
 5KQDkNIhSf5yzzEKkNBs8be9QfW9aLUp9Al5usb3f5lWFzmmrRB+snB4G+NA2rt34psbRjOUUEp
 SiO6CcGKm1Y0BMpXg+2haeVF2d69btZSWcYEW7BpGIyAgI9oi+vgyQtp568HmoK12hJHwvRqYac
 UXtRT6tBm7RkNpY5I6ytU4S8rYgcdM=
X-Received: by 2002:a05:701b:21c5:b0:144:e0cd:76ad with SMTP id
 a92af1059eb24-146d06820d9mr8413866c88.36.1790572902572; 
 Sun, 27 Sep 2026 22:21:42 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-146bb6551d9sm14726248c88.9.2026.09.27.22.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 22:21:41 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v2 05/24] target/rx: convert raises to raise_excp
Date: Mon, 28 Sep 2026 13:20:31 +0800
Message-ID: <20260928052051.251-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260928052051.251-1-luoyonggang@gmail.com>
References: <20260928052051.251-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Translate privilege and illegal through raise_excp_restore, and BRK
and INT through raise_excp. Drop unused raise_access_fault and the
one-line raise_exception wrapper. FPSW still exits with
RX_EXCP_ACCESS.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/rx/helper.c    | 16 ++++++++--------
 target/rx/helper.h    |  5 -----
 target/rx/op_helper.c | 44 ++-----------------------------------------
 target/rx/translate.c | 13 ++++++-------
 4 files changed, 16 insertions(+), 62 deletions(-)

diff --git a/target/rx/helper.c b/target/rx/helper.c
index 0f99279bbaa..2ebda733489 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -86,13 +86,13 @@ void rx_cpu_do_interrupt(CPUState *cs)
         env->isp -= 4;
         cpu_stl_le_data(env, env->isp, env->pc);
 
-        if (vec < 0x100) {
+        if (vec < RX_EXCP_INT) {
             env->pc = cpu_ldl_le_data(env, 0xffffff80 + vec * 4);
         } else {
             env->pc = cpu_ldl_le_data(env, env->intb + (vec & 0xff) * 4);
         }
 
-        if (vec == 30) {
+        if (vec == RX_EXCP_NMI) {
             /* Non-maskable interrupt */
             qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
         } else {
@@ -100,22 +100,22 @@ void rx_cpu_do_interrupt(CPUState *cs)
         }
 
         switch (vec) {
-        case 20:
+        case RX_EXCP_PRIVILEGE_VIOLATION:
             expname = "privilege violation";
             break;
-        case 21:
+        case RX_EXCP_ACCESS:
             expname = "access exception";
             break;
-        case 23:
+        case RX_EXCP_ILLEGAL_INSTRUCTION:
             expname = "illegal instruction";
             break;
-        case 25:
+        case RX_EXCP_FPU:
             expname = "fpu exception";
             break;
-        case 30:
+        case RX_EXCP_NMI:
             expname = "non-maskable interrupt";
             break;
-        case 0x100 ... 0x1ff:
+        case RX_EXCP_INT ... RX_EXCP_INT + 0xff:
             expname = "unconditional trap";
         }
         qemu_log_mask(CPU_LOG_INT, "exception 0x%02x [%s] raised\n",
diff --git a/target/rx/helper.h b/target/rx/helper.h
index 8cc38b0cb71..c6a85e968d9 100644
--- a/target/rx/helper.h
+++ b/target/rx/helper.h
@@ -1,9 +1,4 @@
-DEF_HELPER_1(raise_illegal_instruction, noreturn, env)
-DEF_HELPER_1(raise_access_fault, noreturn, env)
-DEF_HELPER_1(raise_privilege_violation, noreturn, env)
 DEF_HELPER_1(wait, noreturn, env)
-DEF_HELPER_2(rxint, noreturn, env, i32)
-DEF_HELPER_1(rxbrk, noreturn, env)
 DEF_HELPER_3(fadd, f32, env, f32, f32)
 DEF_HELPER_3(fsub, f32, env, f32, f32)
 DEF_HELPER_3(fmul, f32, env, f32, f32)
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 36df7d377e5..f73aeae6326 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -25,10 +25,6 @@
 #include "fpu/softfloat.h"
 #include "tcg/debug-assert.h"
 
-static inline G_NORETURN
-void raise_exception(CPURXState *env, int index,
-                     uintptr_t retaddr);
-
 static void _set_psw(CPURXState *env, uint32_t psw, uint32_t rte)
 {
     uint32_t prev_u;
@@ -115,7 +111,7 @@ static void update_fpsw(CPURXState *env, float32 ret, uintptr_t retaddr)
         enable = FIELD_EX32(env->fpsw, FPSW, ENABLE);
         enable |= 1 << 5; /* CE always enabled */
         if (cause & enable) {
-            raise_exception(env, 21, retaddr);
+            cpu_loop_exit_excp(env_cpu(env), RX_EXCP_ACCESS, retaddr);
         }
     }
 }
@@ -419,32 +415,6 @@ uint32_t helper_divu(CPURXState *env, uint32_t num, uint32_t den)
     return ret;
 }
 
-/* exception */
-static inline G_NORETURN
-void raise_exception(CPURXState *env, int index,
-                     uintptr_t retaddr)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = index;
-    cpu_loop_exit_restore(cs, retaddr);
-}
-
-G_NORETURN void helper_raise_privilege_violation(CPURXState *env)
-{
-    raise_exception(env, 20, GETPC());
-}
-
-G_NORETURN void helper_raise_access_fault(CPURXState *env)
-{
-    raise_exception(env, 21, GETPC());
-}
-
-G_NORETURN void helper_raise_illegal_instruction(CPURXState *env)
-{
-    raise_exception(env, 23, GETPC());
-}
-
 G_NORETURN void helper_wait(CPURXState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -452,15 +422,5 @@ G_NORETURN void helper_wait(CPURXState *env)
     cs->halted = 1;
     env->in_sleep = 1;
     env->psw_i = 1;
-    raise_exception(env, EXCP_HLT, 0);
-}
-
-G_NORETURN void helper_rxint(CPURXState *env, uint32_t vec)
-{
-    raise_exception(env, 0x100 + vec, 0);
-}
-
-G_NORETURN void helper_rxbrk(CPURXState *env)
-{
-    raise_exception(env, 0x100, 0);
+    cpu_loop_exit_excp(cs, EXCP_HLT, 0);
 }
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 132d495710c..43efdb6af0e 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -245,7 +245,8 @@ static int is_privileged(DisasContext *ctx, int is_exception)
 {
     if (FIELD_EX32(ctx->tb_flags, PSW, PM)) {
         if (is_exception) {
-            gen_helper_raise_privilege_violation(tcg_env);
+            gen_helper_raise_excp_restore(
+                tcg_env, tcg_constant_i32(RX_EXCP_PRIVILEGE_VIOLATION));
         }
         return 0;
     } else {
@@ -2174,7 +2175,7 @@ static bool trans_RTE(DisasContext *ctx, arg_RTE *a)
 static bool trans_BRK(DisasContext *ctx, arg_BRK *a)
 {
     tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
-    gen_helper_rxbrk(tcg_env);
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(RX_EXCP_INT));
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
@@ -2182,12 +2183,9 @@ static bool trans_BRK(DisasContext *ctx, arg_BRK *a)
 /* int #imm */
 static bool trans_INT(DisasContext *ctx, arg_INT *a)
 {
-    TCGv_i32 vec;
-
     tcg_debug_assert(a->imm < 0x100);
-    vec = tcg_constant_i32(a->imm);
     tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
-    gen_helper_rxint(tcg_env, vec);
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(RX_EXCP_INT + a->imm));
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
@@ -2228,7 +2226,8 @@ static void rx_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     ctx->pc = ctx->base.pc_next;
     insn = decode_load(ctx);
     if (!decode(ctx, insn)) {
-        gen_helper_raise_illegal_instruction(tcg_env);
+        gen_helper_raise_excp_restore(
+            tcg_env, tcg_constant_i32(RX_EXCP_ILLEGAL_INSTRUCTION));
     }
 }
 
-- 
2.52.0.windows.1


