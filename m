Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gxJQ7-0001jB-A8
	for mharc-qemu-riscv@gnu.org; Fri, 22 Feb 2019 17:35:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amagdy.afifi@gmail.com>) id 1gxDfi-0007vp-7M
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 11:27:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amagdy.afifi@gmail.com>) id 1gxDfO-00025s-3F
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 11:27:18 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38976)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <amagdy.afifi@gmail.com>)
	id 1gxDfH-00011X-U0; Fri, 22 Feb 2019 11:27:08 -0500
Received: by mail-wr1-x442.google.com with SMTP id l5so3013813wrw.6;
	Fri, 22 Feb 2019 08:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=basWPQ9k+5qJUFMdas4QPNBn8x2Qj01DbfWFMWWW5L8=;
	b=gIf4+0DySHN6HtDTfCTgmVm/WF+gS/SHZQJRrjNL1So1HWuCFTwBfnQMQF6X0CXGUZ
	uWivQej0gENAwh4V+NW8nGq/nHU8GN4E0OEYMqL5wpmXDOM1kNZaqRj3NWESRkYmnb07
	W989kjK8Oo/KWxTcPXzREJyeQVRLpoYA2YjAOk9X+Xw0wMHYA37Oq57ckbDR8yAYvJbE
	TzQs7lvKl57dDmc32EAC+qLuUsEBPUw+5ZvurZP2w/YY9Weu9PmpmiYsOFzbbzZ+KjYS
	JgzxfWo+Gu8Diccbl8dyr5crnJpSfvijni3iw0XMOTkg1ZJz0a+IWAe49TnyZBY7wNoy
	8Ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=basWPQ9k+5qJUFMdas4QPNBn8x2Qj01DbfWFMWWW5L8=;
	b=ulqDePsixTE85o80zYiaT9EkHlF3noDlr82bQcXGMtWzkngml0moRVHYP1DuCE1idd
	M3CrbXI1O2URgFZwQMk154K+3emAvMUoTnsCO8oQSrwWTF4BtrVGf4GrMRDai6Mr85uw
	CvbN0wiyrewKfhgoXrDnWY38OwmR0nYn7aBqvIFMsirZxUx9F2/FBXb4S+4JiZyNGA/B
	grUBxuwXW6xcHgRBRUfey90Tj8U4gNMKbwN61CioHqSXx1Tfb8d2cApUajZVc1TPhKiS
	vNsU13AdFsqcq2CYhVkcGq58ZnV1fyEXxZQOtqIbHuu3ltuH+FZkG8nYTARH9kmNfpjP
	RrBQ==
X-Gm-Message-State: AHQUAubKCX4DPhtGahvKnFuQoLedW+EgCqaQCma8SMVpeEbE0JonSXJW
	YrjQM5oVTqRUnP5yTVRAVrN8el2VlGI=
X-Google-Smtp-Source: AHgI3IapH7ndnvXHgNACprR0Y7yL0OYSa+KziOz2u0pnOhK6yjwZnv0+qHEbUnm8FFayXs4Q1xpMxA==
X-Received: by 2002:a5d:654a:: with SMTP id z10mr3434350wrv.280.1550852775965; 
	Fri, 22 Feb 2019 08:26:15 -0800 (PST)
Received: from egc-ahmeda-lt.mgc.mentorg.com ([41.235.100.117])
	by smtp.gmail.com with ESMTPSA id t9sm2058102wrx.73.2019.02.22.08.26.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 08:26:15 -0800 (PST)
From: amagdy.afifi@gmail.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, mjc@sifive.com, palmer@sifive.com,
	Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
	kbastian@mail.uni-paderborn.de, amagdy.afifi@gmail.com
Date: Fri, 22 Feb 2019 18:25:55 +0200
Message-Id: <20190222162555.13764-2-amagdy.afifi@gmail.com>
X-Mailer: git-send-email 2.16.2.windows.1
In-Reply-To: <20190222162555.13764-1-amagdy.afifi@gmail.com>
References: <20190222162555.13764-1-amagdy.afifi@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
X-Mailman-Approved-At: Fri, 22 Feb 2019 17:35:45 -0500
Subject: [Qemu-riscv] [PATCH] riscv: Add proper alignment check and pending
 'C' extension upon misa writes
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
X-List-Received-Date: Fri, 22 Feb 2019 16:27:35 -0000

From: ahmed_magdy <amagdy.afifi@gmail.com>

Signed-off-by: ahmed_magdy <amagdy.afifi@gmail.com>
---
 target/riscv/cpu.h       |  2 ++
 target/riscv/csr.c       |  5 +++--
 target/riscv/translate.c | 14 ++++++++++----
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a269c07..b49bdb3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -109,6 +109,8 @@ struct CPURISCVState {
     target_ulong gpr[32];
     uint64_t fpr[32]; /* assume both F and D extensions */
     target_ulong pc;
+    target_ulong pc_next; /* next target pc */
+    int pending_rvc;
     target_ulong load_res;
     target_ulong load_val;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 90f6866..b0886f0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -373,9 +373,10 @@ static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
     }
 
     /* Suppress 'C' if next instruction is not aligned
-       TODO: this should check next_pc */
-    if ((val & RVC) && (GETPC() & ~3) != 0) {
+       check next target pc */
+    if ((val & RVC) && (env->pc_next & 3) != 0) {
         val &= ~RVC;
+        env->pending_rvc = 1;
     }
 
     /* misa.MXL writes are not supported by QEMU */
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2321bba..c9d84ea 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1999,20 +1999,26 @@ static void decode_RV32_64G(DisasContext *ctx)
     }
 }
 
-static void decode_opc(DisasContext *ctx)
+static void decode_opc(DisasContext *ctx, CPUState *cpu)
 {
+    CPURISCVState *env = cpu->env_ptr;
     /* check for compressed insn */
     if (extract32(ctx->opcode, 0, 2) != 3) {
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
-            ctx->pc_succ_insn = ctx->base.pc_next + 2;
+            env->pc_next = ctx->pc_succ_insn = ctx->base.pc_next + 2;
             decode_RV32_64C(ctx);
         }
     } else {
-        ctx->pc_succ_insn = ctx->base.pc_next + 4;
+        env->pc_next = ctx->pc_succ_insn = ctx->base.pc_next + 4;
         decode_RV32_64G(ctx);
     }
+    /* check pending RVC */
+    if (env->pending_rvc && ((env->pc_next & 3) != 0)) {
+        env->misa |= RVC;
+        env->pending_rvc = 0;
+    }
 }
 
 static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
@@ -2061,7 +2067,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     CPURISCVState *env = cpu->env_ptr;
 
     ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
-    decode_opc(ctx);
+    decode_opc(ctx, cpu);
     ctx->base.pc_next = ctx->pc_succ_insn;
 
     if (ctx->base.is_jmp == DISAS_NEXT) {
-- 
1.9.1


