Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gprzF-00076a-DF
	for mharc-qemu-riscv@gnu.org; Sat, 02 Feb 2019 04:53:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gprzC-0006zR-JV
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:53:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gprqB-0005lT-W6
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:44:01 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:46164)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gprq9-0005Ox-OK
	for qemu-riscv@nongnu.org; Sat, 02 Feb 2019 04:43:59 -0500
Received: by mail-ed1-x541.google.com with SMTP id o10so7430893edt.13
	for <qemu-riscv@nongnu.org>; Sat, 02 Feb 2019 01:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=z6Oe5++7//00+8jf3KOesDxKK2wIxkTBsez1SGK1Kro=;
	b=X3l6yNuVoZXHJK+7TqH95EvGY2YZYrcVyI2b1E/ulY6ZzV0JK2tltEwyR+GYWu5L0g
	l94/Wkg/AovsssjRAbqXZV6mTqn93w2RP62KB+gbeK7uaMX70qKzUHQds7yrKn6HhXji
	zPQdDWyv3OsZEXRGeZLbXTKixRQ+Qh3FJ2gQUXvRBX/P/O3k2wMzDQy/rdywJanaEC3a
	DAukFNt8PZoT/ZEjkg48G4oXPn9tsGAbxeCJbsk3RZ2nJaMa6+hccS5PGP4Q66vNbI4g
	anZsoxrG1WZpsBCLWIuc6s5I9hLwEPrRsp4bAYmoHF+YgxoPhWy/eUFhorQtypE2s9Uu
	LydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=z6Oe5++7//00+8jf3KOesDxKK2wIxkTBsez1SGK1Kro=;
	b=iNjMmPWHZLLQQdQosKd1IrL+tydpC+x5cizW6zv1dbLzWTW5T26ury+hVsSuUuSy+J
	LKO29u0cyAwmQa5u5G7DFrXfoTTGPh4gveoHtjpgnLKJH5k6TGlrrAtZ4/d3pfULwx82
	3KV2amsvoPEi3RjbsFZyk+6KhyLKlFABhEUi/YOeC5dYC+M30VyGvlRcdZ9XNDaU8eN2
	X9YKijoft9/CAtJj3vDr/2dowM6pnrLwADhjE5UQl6N6YQgz05OWSOMj1WzVpDHYxfM+
	v8QYDJJUtD+CmEPN43NjjRbk0KQNh4xAhKyHnt54KMsLN+5wJe1WREiHRiSSPY9wCdK1
	la7g==
X-Gm-Message-State: AJcUuke9eW11weyz16F+7ArTvFYU66wIA4pvxztBFVp4WwL31UlezYEV
	SmirtosuNnSKl4CwlOQysnecQ+IcXmZcow==
X-Google-Smtp-Source: ALg8bN5rS3BeibTBGpwUvmy9yVTTRbC5GxnGyPpju+pdAyQFbHZF0jkgl8aJ4NLwylQZxKRZEowXMQ==
X-Received: by 2002:a50:8b26:: with SMTP id l35mr40908322edl.146.1549100619219;
	Sat, 02 Feb 2019 01:43:39 -0800 (PST)
Received: from localhost ([2001:67c:1810:f051:fd32:55e2:f60b:183b])
	by smtp.gmail.com with ESMTPSA id
	c30sm2665260edc.70.2019.02.02.01.43.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Feb 2019 01:43:38 -0800 (PST)
Date: Sat,  2 Feb 2019 01:43:20 -0800
Message-Id: <20190202094329.22874-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190202094329.22874-1-palmer@sifive.com>
References: <20190202094329.22874-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Michael Clark <mjc@sifive.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: [Qemu-riscv] [PULL 01/10] RISC-V: Split out mstatus_fs from tb_flags
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Feb 2019 09:53:19 -0000

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.h       |  6 +++---
 target/riscv/translate.c | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 743f02c8b95a..681341f5d5a4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -275,8 +275,8 @@ void QEMU_NORETURN do_raise_exception_err(CPURISCVState *env,
 target_ulong cpu_riscv_get_fflags(CPURISCVState *env);
 void cpu_riscv_set_fflags(CPURISCVState *env, target_ulong);
 
-#define TB_FLAGS_MMU_MASK  3
-#define TB_FLAGS_FP_ENABLE MSTATUS_FS
+#define TB_FLAGS_MMU_MASK   3
+#define TB_FLAGS_MSTATUS_FS MSTATUS_FS
 
 static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
@@ -284,7 +284,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     *pc = env->pc;
     *cs_base = 0;
 #ifdef CONFIG_USER_ONLY
-    *flags = TB_FLAGS_FP_ENABLE;
+    *flags = TB_FLAGS_MSTATUS_FS;
 #else
     *flags = cpu_mmu_index(env, 0) | (env->mstatus & MSTATUS_FS);
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 312bf298b3c2..3d07d651b60c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -44,7 +44,7 @@ typedef struct DisasContext {
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     uint32_t opcode;
-    uint32_t flags;
+    uint32_t mstatus_fs;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
@@ -656,7 +656,7 @@ static void gen_fp_load(DisasContext *ctx, uint32_t opc, int rd,
 {
     TCGv t0;
 
-    if (!(ctx->flags & TB_FLAGS_FP_ENABLE)) {
+    if (ctx->mstatus_fs == 0) {
         gen_exception_illegal(ctx);
         return;
     }
@@ -686,7 +686,7 @@ static void gen_fp_store(DisasContext *ctx, uint32_t opc, int rs1,
 {
     TCGv t0;
 
-    if (!(ctx->flags & TB_FLAGS_FP_ENABLE)) {
+    if (ctx->mstatus_fs == 0) {
         gen_exception_illegal(ctx);
         return;
     }
@@ -945,7 +945,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 {
     TCGv t0 = NULL;
 
-    if (!(ctx->flags & TB_FLAGS_FP_ENABLE)) {
+    if (ctx->mstatus_fs == 0) {
         goto do_illegal;
     }
 
@@ -1818,8 +1818,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     ctx->pc_succ_insn = ctx->base.pc_first;
-    ctx->flags = ctx->base.tb->flags;
     ctx->mem_idx = ctx->base.tb->flags & TB_FLAGS_MMU_MASK;
+    ctx->mstatus_fs = ctx->base.tb->flags & TB_FLAGS_MSTATUS_FS;
     ctx->frm = -1;  /* unknown rounding mode */
 }
 
-- 
2.18.1


