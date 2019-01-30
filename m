Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gotnE-0004oe-Tk
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jan 2019 12:36:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gotn5-0004gS-3T
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gotn3-00006k-Rp
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:47 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38376)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gotn3-0008Rt-Km
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:45 -0500
Received: by mail-pg1-x52a.google.com with SMTP id g189so124608pgc.5
	for <qemu-riscv@nongnu.org>; Wed, 30 Jan 2019 09:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=VsEG5EqtY/F+uxugfJZjY5iDDB0h1Q1FwFLq+ViPw8A=;
	b=Ox39KvqwawXqwttSHEir8j8oTXIJeu4VCyeHYz8rIShNfmMZ2+W8MOr+5rv3dZSJ76
	+rm9AYpvq9gT2GvzY7Zb+WG8eEifI4NLPFuiybaSk6KZJhkjzTXcZcy3MH81YH3322NH
	upePV8B1dAEc5rl7k5+4dac72ODBibZE+Xxn5NhOWeEnRz8W4GSIRn0A+GxWkhATr5Y/
	KF6i4hm7K+TwgCMa/4FAoeJvvStnae32ZAFKKwmgKxuiZDZ3eVvLa2Q9YNDePTL/SfZ9
	a7B1A0IcZ18M4DlekXvgZr8RtpXjdzLg6QYH0N09EnJGKuZttLMt0q9X0OBeIDDR+FYr
	DHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=VsEG5EqtY/F+uxugfJZjY5iDDB0h1Q1FwFLq+ViPw8A=;
	b=R14dnTx+AP5NkMfM4tBp5fbJ9iJOijKi8SmSpWdJb7L0Sn1CRgu2WB11+RRDdSC8Oz
	s7JqS9ZFzlFRU+HiYHUIvhZEUJaYdDWsZ6xfoLjXeddzJvfJKF+xldFWsaah46i//nx9
	6fgiGF8kshkMHRgZSwway5cfidcPzFX7AoGd68BfhrHAevqMKIwClNSACY/o8cVdZTmr
	4HXG9iVGLFCgtH8k47SqTpNQjM4xYo/lUqBNiDNmSKr6M0zlswg8g1qDrraDiSkvCy63
	LES2DFkw91Wyom7yKbyAaQn5yG4/fVRz8iplOM5EhMXQb0Krhh32KLvbfqkK5Tc01LXW
	eukg==
X-Gm-Message-State: AJcUukfY0+o7LZhfYYBJRsxAhmo3s+haEO4QsrpFg68FJLoDXaJRy+7O
	PW/7LyOSNRapJI2BYkPnEZyxsA==
X-Google-Smtp-Source: ALg8bN7peMaf0GYFTdUNXfWD64dzFYrvAEw1GZF3X7+9w5xl4RLEInvO/RDi2QLpTaFbklt5U6P1cg==
X-Received: by 2002:a63:f1f:: with SMTP id e31mr28079825pgl.274.1548869785312; 
	Wed, 30 Jan 2019 09:36:25 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	m67sm7018486pfb.25.2019.01.30.09.36.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 09:36:24 -0800 (PST)
Date: Wed, 30 Jan 2019 09:35:56 -0800
Message-Id: <20190130173601.3268-6-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190130173601.3268-1-palmer@sifive.com>
References: <20190130173601.3268-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52a
Subject: [Qemu-riscv] [PULL 05/10] RISC-V: Add priv_ver to DisasContext
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
X-List-Received-Date: Wed, 30 Jan 2019 17:36:49 -0000

From: Alistair Francis <Alistair.Francis@wdc.com>

The gen methods should access state from DisasContext. Add priv_ver
field to the DisasContext struct.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/translate.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0581b3c1f7d7..35eb6bdfe099 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -43,6 +43,7 @@ typedef struct DisasContext {
     DisasContextBase base;
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
+    target_ulong priv_ver;
     uint32_t opcode;
     uint32_t mstatus_fs;
     uint32_t mem_idx;
@@ -1330,7 +1331,7 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
 #ifndef CONFIG_USER_ONLY
     /* Extract funct7 value and check whether it matches SFENCE.VMA */
     if ((opc == OPC_RISC_ECALL) && ((csr >> 5) == 9)) {
-        if (env->priv_ver == PRIV_VERSION_1_10_0) {
+        if (ctx->priv_ver == PRIV_VERSION_1_10_0) {
             /* sfence.vma */
             /* TODO: handle ASID specific fences */
             gen_helper_tlb_flush(cpu_env);
@@ -1384,7 +1385,7 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
             gen_helper_wfi(cpu_env);
             break;
         case 0x104: /* SFENCE.VM */
-            if (env->priv_ver <= PRIV_VERSION_1_09_1) {
+            if (ctx->priv_ver <= PRIV_VERSION_1_09_1) {
                 gen_helper_tlb_flush(cpu_env);
             } else {
                 gen_exception_illegal(ctx);
@@ -1854,10 +1855,12 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx)
 static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    CPURISCVState *env = cs->env_ptr;
 
     ctx->pc_succ_insn = ctx->base.pc_first;
     ctx->mem_idx = ctx->base.tb->flags & TB_FLAGS_MMU_MASK;
     ctx->mstatus_fs = ctx->base.tb->flags & TB_FLAGS_MSTATUS_FS;
+    ctx->priv_ver = env->priv_ver;
     ctx->frm = -1;  /* unknown rounding mode */
 }
 
-- 
2.18.1


