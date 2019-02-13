Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwiy-00027E-Kk
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:45:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwiw-000270-Mp
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwiq-0006iC-P1
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:20 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40961)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwio-0006UI-To
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:45:16 -0500
Received: by mail-pl1-x62a.google.com with SMTP id k15so1332385pls.8
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=z6Oe5++7//00+8jf3KOesDxKK2wIxkTBsez1SGK1Kro=;
	b=h+lk7J0Zuqo/fqzGjYXn2ti5u1ogn67XWLUZm/JuR4/6TX5ezpTHaj3rfsjff0Ieny
	K3JIUG7SQ1uB1EmZalef6C4nfndLBJEXc+vp9pEi2XUGf1au9W9ykOFpBUKJHLzNNEYx
	tiEpZAzKC0xI8xoyXiVi2nb95LNBxp6d9ElfmBmKHzL7muPw7h9b4/6F73M8Qy8Nfn1W
	y8qDwCiORj1ftgpJaYnETKNp2y5Tup3jQPQ5vvtEHuJSvic3qbZ+33HLENgmNPqDhdF2
	CBgU2tLn3kOkhGu5LvXbV2Rp3FbFCQSN0Mgqyt7T+vqvXaH4G4loMgXlM99oS/oOJEuh
	i2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=z6Oe5++7//00+8jf3KOesDxKK2wIxkTBsez1SGK1Kro=;
	b=Xmp3FlKKMuIW+Ldvw1FXICcIGCt8qP4SkJ6MH8a5aA6rlIZ5BP5SWJ5HRWaY7dZryC
	m4N/D/OkZDctPGvi9x1OmSm6N8eU11/TJGHlj43/P10J4/N64Jqm4T6ZCoZz6Zz/00p1
	K8Mgq56J7HqprBIhQwhgCPmjRvMtGBXXY5tCrZRTSZ5VYtPORhbx1Qj7g+6Ijrf7zlZ2
	InCOzoSHNs3Tw0hYTCneLozo16EQ/dFx28sIT+S3aD1X2n3z5rYqZWQ+dwWOCFKguAv/
	Qh7djIKIszH+d7ud3EtgM76JYAJu00LQb0o6Lwt+ZKBOCb9v33Y8bGrc7O86sgyeFQk/
	SJjg==
X-Gm-Message-State: AHQUAubQn50SKa6PkTBfqNr79Hb106eKhTSEBnpvsEIiRDcQ07ZeZ0na
	ljXqpnfn1Toz1fgCUMzmHHrPtx0jF74=
X-Google-Smtp-Source: AHgI3IYb7rcinBuPlrBBGge0gF/ByJpeV4P2m0cPEO900DBqb7Trzw5PIFucGv5S9zHp8ko5k24TAg==
X-Received: by 2002:a17:902:bc89:: with SMTP id
	bb9mr1160839plb.212.1550072703450; 
	Wed, 13 Feb 2019 07:45:03 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	d88sm29393174pfe.19.2019.02.13.07.45.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:45:02 -0800 (PST)
Date: Wed, 13 Feb 2019 07:44:40 -0800
Message-Id: <20190213154450.14749-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213154450.14749-1-palmer@sifive.com>
References: <20190213154450.14749-1-palmer@sifive.com>
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Michael Clark <mjc@sifive.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62a
Subject: [Qemu-riscv] [PULL 01/11] RISC-V: Split out mstatus_fs from tb_flags
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
X-List-Received-Date: Wed, 13 Feb 2019 15:45:24 -0000

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


