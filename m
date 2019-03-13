Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h455u-0000WW-Nf
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:42:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h455r-0000SZ-JN
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:42:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h451h-0004tB-QL
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:38 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45723)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h451h-0004sj-Kn
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:38:37 -0400
Received: by mail-pf1-x433.google.com with SMTP id v21so1504236pfm.12
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=8KdZ3srrVrHU5ZPSr0u3SyL8aGBbMo6iO8AwnIOHMzc=;
	b=KKN6aRXUlaWzIV649MfLvYnFEfi7e5p2CX/WPX2g3YQAomYDTub2hjocas0up+rHiR
	DqLSWHKxdvor7ftz6HLHAvYr6s95sOCrbsjbKdoj2dPqB2IyvXUPFJqJo2s82D1qn2my
	U0TdH17bPLMdkDKHvfbkcXc1lkWGTz8BvP+vAVNsPaXOIf9P6M+Ukf5liM0NfHyIGYMl
	YWKbYfcjenaMw4FQXQePo/s107UHISUbiIV/Jacpy48QhQx99Q4iaKPW9LlBAFEielmF
	pZDbcnQwlYxwnLwPgZzEiFa3BxvFM0YevD5QivcW4N8QtkolpIYWU8FgO1+nUwioyim5
	wdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=8KdZ3srrVrHU5ZPSr0u3SyL8aGBbMo6iO8AwnIOHMzc=;
	b=uAGSs8gdXQfuLxj6skiabLiKjt7TqYgkU7cMhk4w/FsCIJ8/XVrqnuUsdYhtfkWB2o
	SfX9J92JuNQkAUJcUGN4Mm80kKpG+Yve6JXfDg4ZUlwfY6Pm0HnHp/sc4JimfXMUkfm6
	mgFC2KPJLxeaoUtG61O2J74OztaPGKno8MQt2UaczNnhksC3agSPYmll7nnTPSpIWEaY
	Yo7fCW7yIU6E3QJZ9cMG0SXI0nB7M+JF+HAEfovJEeynfzE5Rw2GjDAIWvY1K+geCzzG
	Gh2mwCcAKVoKB4HBqJwZq+p3h+CXPkht/ACkPHf5VsCiHQagACJO681EFAE8ZyX78H5b
	VZHg==
X-Gm-Message-State: APjAAAW9rXZ54wmKpI7OJz8PlmZVR+XjmaRQty0nKCaC7TqOnJaIx7AC
	yhUGK/EYWuAu6/0K6zM7paFKzZUIuhwFvdfX
X-Google-Smtp-Source: APXvYqz3QtzlHmE1YsmgCaQL2YR+2FG7BCGNmVyjhLh77/dIvDsa0IEnMNasQc0vK8XHbn0QFoLMuA==
X-Received: by 2002:a65:64d5:: with SMTP id t21mr39790929pgv.266.1552487916487;
	Wed, 13 Mar 2019 07:38:36 -0700 (PDT)
Received: from localhost ([122.146.90.161])
	by smtp.gmail.com with ESMTPSA id o1sm9394786pgp.76.2019.03.13.07.38.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:38:35 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:37:04 -0700
Message-Id: <20190313143705.29129-29-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190313143705.29129-1-palmer@sifive.com>
References: <20190313143705.29129-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::433
Subject: [Qemu-riscv] [PULL 28/29] target/riscv: Remove gen_system()
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
X-List-Received-Date: Wed, 13 Mar 2019 14:42:56 -0000

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
index dedf4189d5b7..92be090bc7bb 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -473,33 +473,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
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
@@ -680,7 +653,6 @@ bool decode_insn16(DisasContext *ctx, uint16_t insn);
 
 static void decode_RV32_64G(DisasContext *ctx)
 {
-    int rs1, rd;
     uint32_t op;
 
     /* We do not do misaligned address check here: the address should never be
@@ -689,14 +661,8 @@ static void decode_RV32_64G(DisasContext *ctx)
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
2.19.2


