Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwtG-0001qP-CH
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:56:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtD-0001nT-FN
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:56:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwtB-0002eI-J3
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:59 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:41363)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwtB-0001xQ-88
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:57 -0500
Received: by mail-pg1-x543.google.com with SMTP id m1so1306737pgq.8
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=qvbhG1fuyqMObGoL3Dmxdycss8BFpRdMBBhuC3ibN6Q=;
	b=bM6C0x0MEZzw8+FBVqg8nKsyWpw+ZoZLzHOu+gwQYyGwoJ5ziVqKAMsub8LHrdB0j1
	uMmhbCPJPxzJZeNaa5TY5B8FrlSaJa+o6/F/+q8rg5I9n9lRVr8GGWg9gDHaBSy7a2FY
	ylFhLu0Rz01JA0A2ZfdmQzMawmcX4lVQ62+5srVpXLnKnCm5ET6jiM+x3Io1fMtGMd9g
	BGDXyD3nF5/pIZ3VCwYj9TnC3TD4+yrvTWPcQCKeZ7v50vuSlO2EZsXKXZhw2WZS/kzZ
	Tz1DiQCl+EZp6ym9fsNedAS7biUJVayFY6Ce/BAh0V211gkU3MzUWbCPJ5JtkZTq9qKB
	7Pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=qvbhG1fuyqMObGoL3Dmxdycss8BFpRdMBBhuC3ibN6Q=;
	b=aDTFRBgIcgTgpi9pAIuZdKIhX++n/fCulZRFYrdky/44+88EAHXimHlPEvpySwKQZ8
	nhowPKJvNGdflLNHsgHi/3o7U13eu//91piwmqMao+sp35B28ApAiZZX0uVA/Q+Lw1Y6
	4v58ocOSNqmUFwmKW22NaCq3ulOG+Gma7lmHHw3SjRlGb34EL5wPKrSC4boW/lMrcYnO
	f86xYJUPRjbG52IZh0zO98D3950q8ZbPsAWfHM6fruLdZn7ebyPrOkL+eY3SO988e0t9
	QuwfXHCZ6Fr1YbFyy9RoYGv5D75ZnyiXV4VhbL5Ra5Qk+miKpHK6Qb/sG3Ohv/7j5fHn
	65Mg==
X-Gm-Message-State: AHQUAuZUdgpnxOTvNyiClEzS7ZcSkoMBHgBXTlDqHvEMjnfFJHvXFPg5
	6ML+L6lzvgzEo1Bna8d9rquKRA==
X-Google-Smtp-Source: AHgI3IZmqRNkRjeymVLW+yqeBhRGWqx2GzOOBoM8ShkpN1W1cUBFJKckelwvE4aZbsx/MvSojeQLXA==
X-Received: by 2002:a63:5b1c:: with SMTP id p28mr1029853pgb.73.1550073323452; 
	Wed, 13 Feb 2019 07:55:23 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	d21sm19573917pgv.37.2019.02.13.07.55.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:55:22 -0800 (PST)
Date: Wed, 13 Feb 2019 07:54:08 -0800
Message-Id: <20190213155414.22285-30-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-riscv] [PATCH v7 29/35] target/riscv: Remove gen_system()
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
X-List-Received-Date: Wed, 13 Feb 2019 15:56:00 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

with all 16 bit insns moved to decodetree no path is falling back to
gen_system(), so we can remove it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/translate.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3d49c8ed4054..65bedc966497 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -474,33 +474,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
     tcg_temp_free_i32(t0);
 }
 
-static void gen_system(DisasContext *ctx, uint32_t opc, int rd, int rs1,
-                       int csr)
-{
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-
-    switch (opc) {
-    case OPC_RISC_ECALL:
-        switch (csr) {
-        case 0x0: /* ECALL */
-            /* always generates U-level ECALL, fixed in do_interrupt handler */
-            generate_exception(ctx, RISCV_EXCP_U_ECALL);
-            tcg_gen_exit_tb(NULL, 0); /* no chaining */
-            ctx->base.is_jmp = DISAS_NORETURN;
-            break;
-        case 0x1: /* EBREAK */
-            generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
-            tcg_gen_exit_tb(NULL, 0); /* no chaining */
-            ctx->base.is_jmp = DISAS_NORETURN;
-            break;
-        default:
-            gen_exception_illegal(ctx);
-            break;
-        }
-        break;
-    }
-}
-
 static void decode_RV32_64C0(DisasContext *ctx)
 {
     uint8_t funct3 = extract32(ctx->opcode, 13, 3);
@@ -675,7 +648,6 @@ bool decode_insn16(DisasContext *ctx, uint16_t insn);
 
 static void decode_RV32_64G(DisasContext *ctx)
 {
-    int rs1, rd;
     uint32_t op;
 
     /* We do not do misaligned address check here: the address should never be
@@ -684,14 +656,8 @@ static void decode_RV32_64G(DisasContext *ctx)
      * perform the misaligned instruction fetch */
 
     op = MASK_OP_MAJOR(ctx->opcode);
-    rs1 = GET_RS1(ctx->opcode);
-    rd = GET_RD(ctx->opcode);
 
     switch (op) {
-    case OPC_RISC_SYSTEM:
-        gen_system(ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
-                   (ctx->opcode & 0xFFF00000) >> 20);
-        break;
     default:
         gen_exception_illegal(ctx);
         break;
-- 
2.18.1


