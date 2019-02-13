Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwsr-0001SU-QW
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 10:55:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwso-0001P9-GT
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gtwsa-0001pj-Jh
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:24 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38978)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gtwsU-0001Qq-0j
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 10:55:15 -0500
Received: by mail-pl1-x634.google.com with SMTP id 101so1346600pld.6
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 07:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=8EypunTKjsEtiRMX5hY7rGFR1bKZQLM2m6PHUljo33Q=;
	b=Qt+f9HDsLVqkoxj1wAD00kYbdevk/qI0PzZe9T5OM1ULf4Ai65mZV3yJXhsYnk3zcr
	1Kn6mHO/67mHYKH7Pe7b1UaexugHtI0AiDOi8Ty3DszC4yAj44aqiwFmsFw5priK7p10
	Dj3oUPwOrLs1NuFr2XVzmfQwjU7AodkfGCHb+ZgwSo84cr1WVt8bVkMDT2b+pH8g/V5a
	Lc9zlaG0hDYDhqNExei2hpDHiWzZIBoCNW+t6Uufx3XGSPQ7eIM7S9CL0RBhZoGsN2Bh
	5n3Mqrof9gu5TEFfarvsmntxDi2GoLKpUhAOMTuqPhDeP8wB/1+ilpf9S5MJZaD6SBiq
	3mGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=8EypunTKjsEtiRMX5hY7rGFR1bKZQLM2m6PHUljo33Q=;
	b=AeR0KzWDTip9rkkQIDsXbaOZCZGK6IoQ6UsEBqXqpAhdj9V5Q8mW83zfUcJA5j9DdJ
	cz7cmv9a7cHflUN5JED0XBh6OjTWNd4pJzyth8O/2Z9gPHnCDjS/ANYveuTAwTbzTuMI
	8i7txg7Nt5WLiOkjBAMkxOuoTwC6X3zQFvGlWmueQy5ds02MOQu7ks0vIBly75dw+ldc
	V/OYd5smT7nX92XGCmmpNHWtel34B/YHnr4FUIVX+3yIUyy+7S06TneMvP5N99vZGtbr
	sLrR06sbtpwe8VQL/bbw8Q/f2kYJrQsLa6ifsyKWyaefM0iia2xDzuc7X/fBp7gjM9Dj
	NdnA==
X-Gm-Message-State: AHQUAuag9HMSC0FCp4V9tECMaN5zudoKyUj4jzNT7mnuPy71WEewPPly
	LHvIr3Apvd0wUl3BCJede0oZfw==
X-Google-Smtp-Source: AHgI3IbVtde79pR+JYl1Rd5oV3USHIjfhHfP0FLCwienMmDt9RFnvXRxy2hUPPJVoI7d+agM3+4VYg==
X-Received: by 2002:a17:902:7148:: with SMTP id
	u8mr1202659plm.110.1550073309197; 
	Wed, 13 Feb 2019 07:55:09 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	j8sm7565293pfe.130.2019.02.13.07.55.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 07:55:08 -0800 (PST)
Date: Wed, 13 Feb 2019 07:53:59 -0800
Message-Id: <20190213155414.22285-21-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190213155414.22285-1-palmer@sifive.com>
References: <20190213155414.22285-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::634
Subject: [Qemu-riscv] [PATCH v7 20/35] target/riscv: Remove gen_jalr()
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
X-List-Received-Date: Wed, 13 Feb 2019 15:55:35 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

trans_jalr() is the only caller, so move the code into trans_jalr().

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 28 +++++++++++++++++-
 target/riscv/translate.c                | 38 -------------------------
 2 files changed, 27 insertions(+), 39 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 4a23372cb823..39af38081ede 100644
--- a/target/riscv/insn_trans/trans_rvi.inc.c
+++ b/target/riscv/insn_trans/trans_rvi.inc.c
@@ -42,7 +42,33 @@ static bool trans_jal(DisasContext *ctx, arg_jal *a)
 
 static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
 {
-    gen_jalr(ctx, OPC_RISC_JALR, a->rd, a->rs1, a->imm);
+    /* no chaining with JALR */
+    TCGLabel *misaligned = NULL;
+    TCGv t0 = tcg_temp_new();
+
+
+    gen_get_gpr(cpu_pc, a->rs1);
+    tcg_gen_addi_tl(cpu_pc, cpu_pc, a->imm);
+    tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
+
+    if (!riscv_has_ext(ctx->env, RVC)) {
+        misaligned = gen_new_label();
+        tcg_gen_andi_tl(t0, cpu_pc, 0x2);
+        tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
+    }
+
+    if (a->rd != 0) {
+        tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
+    }
+    tcg_gen_lookup_and_goto_ptr();
+
+    if (misaligned) {
+        gen_set_label(misaligned);
+        gen_exception_inst_addr_mis(ctx);
+    }
+    ctx->base.is_jmp = DISAS_NORETURN;
+
+    tcg_temp_free(t0);
     return true;
 }
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c9a8fdda8a85..abdcd0631af4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -532,44 +532,6 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_jalr(DisasContext *ctx, uint32_t opc, int rd, int rs1,
-                     target_long imm)
-{
-    /* no chaining with JALR */
-    TCGLabel *misaligned = NULL;
-    TCGv t0 = tcg_temp_new();
-
-    switch (opc) {
-    case OPC_RISC_JALR:
-        gen_get_gpr(cpu_pc, rs1);
-        tcg_gen_addi_tl(cpu_pc, cpu_pc, imm);
-        tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
-
-        if (!has_ext(ctx, RVC)) {
-            misaligned = gen_new_label();
-            tcg_gen_andi_tl(t0, cpu_pc, 0x2);
-            tcg_gen_brcondi_tl(TCG_COND_NE, t0, 0x0, misaligned);
-        }
-
-        if (rd != 0) {
-            tcg_gen_movi_tl(cpu_gpr[rd], ctx->pc_succ_insn);
-        }
-        tcg_gen_lookup_and_goto_ptr();
-
-        if (misaligned) {
-            gen_set_label(misaligned);
-            gen_exception_inst_addr_mis(ctx);
-        }
-        ctx->base.is_jmp = DISAS_NORETURN;
-        break;
-
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-    tcg_temp_free(t0);
-}
-
 static void gen_branch(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
                        target_long bimm)
 {
-- 
2.18.1


