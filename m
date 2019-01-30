Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gotmu-0004a1-3l
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jan 2019 12:36:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gotms-0004Yr-CH
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gotmm-0008Tz-Ug
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:32 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:38649)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gotmg-0008LT-VH
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:24 -0500
Received: by mail-pl1-x62d.google.com with SMTP id e5so136541plb.5
	for <qemu-riscv@nongnu.org>; Wed, 30 Jan 2019 09:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=z6Oe5++7//00+8jf3KOesDxKK2wIxkTBsez1SGK1Kro=;
	b=nRfzzAnkouDPf2j8nlOXvdxjBjsytYVjH1HZJbUb0ju2YicxBUsJwJiZX5saYhFdIi
	/9FGP0Q/WKWeOiiFoeNGIRcRXfgTF0vERsD4Zrwh2ODsy2KXv0kq9g71XJXYR4m/VoAD
	+6pEYLJ+gAcsSnpbokU0kxIbf7IIQBU1X3pwb8yY2s4ZsWpbOyV16ew4bp+r6vuGWtT7
	py91UD67VWu1nDHGvqKtnCePXv97ZS4nnDmIqerlU2Hm3nFsMQALI3tSln43jY+uug+V
	Wef/bUvp0tUV+QdQVHjw82LRBTVYflX4T4L5klG6ZUAmdmHRikuFfENsSsJgHRiqPcdh
	2t0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=z6Oe5++7//00+8jf3KOesDxKK2wIxkTBsez1SGK1Kro=;
	b=LemyPO3o1tApPcr4dTfTMcjHrfW9JcalC3KkHTkuTabD18RpSnqdXiNDPMd0fKqL70
	trmxcuTSNA4RMkLfj0XO9pjN61Pq5a3Lz5RlQMcg4bAg52nhqVoGJxKpxsEvCaLHhmKR
	NJCF2W+x2icVhlODlh22cprWr4c54ckiJc5MblyFhF0Vpd34F4QTOSs50z4/hx2bVVfR
	LcBxdyPmkcwFnijNZabYIzajF1cCxBcNbMPcIK7QVUpfg9KpDPHW7xYtLjUVdOS00zRU
	UERJSqdOCAj7368Gz9xks11tg6NLkGms2WBxJtB2en8jzbavlt47/8dJSI4ZSroT9i9c
	g2DA==
X-Gm-Message-State: AJcUukeXPCG7caq/R1xJCbDpllcqu1jOfmCzzn9cUI6vs5ImF3aLJPg7
	mS280ayhcEN0XQIezy+4vSPAdzPZyTQ=
X-Google-Smtp-Source: ALg8bN4J+WSLgtuxvl1dk12Eavs0MN5Nv5We4ZUw+8o41tNRGMWfJgpFFYBNvvL8S46Tck1u99dGPw==
X-Received: by 2002:a17:902:5a86:: with SMTP id
	r6mr30174442pli.301.1548869776430; 
	Wed, 30 Jan 2019 09:36:16 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	j21sm3409734pfn.175.2019.01.30.09.36.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 09:36:15 -0800 (PST)
Date: Wed, 30 Jan 2019 09:35:52 -0800
Message-Id: <20190130173601.3268-2-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190130173601.3268-1-palmer@sifive.com>
References: <20190130173601.3268-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	Michael Clark <mjc@sifive.com>,
	Alistair Francis <alistair.francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::62d
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
X-List-Received-Date: Wed, 30 Jan 2019 17:36:35 -0000

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


