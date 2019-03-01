Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3i-0003mP-77
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:51:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3d-0003fa-71
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3V-0003K5-Vf
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:01 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41990)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq3L-0002R5-OA
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:50:57 -0500
Received: by mail-pg1-x529.google.com with SMTP id b2so12048286pgl.9
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=TDMldxVZDj+fcftOfPPcIF+HyBxU9TIJKclHCCLOjJ8=;
	b=b4mVSLszNPkPSx4hYK4BpHay3YZMMtuhoUsnzLxOp8IddnQo0Rn639ASJUe+huPQyc
	6Xv6Q6Uj4LcnSbiZ2MOE1o4wuxarUEH8Tr53iCbMjQGGMVIDb8+B8tZRUp/JdH5xvHLp
	/CQ+AgtRmvXreOjVFMMBZnCgqNejG790V8pI1CIEBtDLwvjLnPG7cJH80rz+XrqGD9rz
	VFZbgWuqr5a/fcZV1KogikSwQZleak1xTH6emxpRcBFR0d9Mw1mKChQM3WnviRv37TMG
	Oowf8ncNTk6v7I2eT7J3K4fG1sPgoNvobhXmC93C9jI/ROfwkiBxAhsDTl+hbcyEwVMJ
	Z4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=TDMldxVZDj+fcftOfPPcIF+HyBxU9TIJKclHCCLOjJ8=;
	b=VbGg0RS/loo6/ILdxck3tj5o7L7o0bJVuJSNDebDVrQK8uU7A1ijfXX4jjmTHN4KGG
	yXTf1GhZRhgcVs03BVFxW6h/svjXHaSrUqfmZGKdGK7ULWyWMV+oCr2zUaAuJnuzLzXr
	oTRiO9zZE9wBquP5z4ZA6KgW3EnpmH0Kwdrvl4mskNvSgsIb7wuG82vnu8oDC3z4MsTi
	NkN3tCIJgqeyXKwJKHev5PQnG36Wi/nm1sPTeOSDBk+WKgYEz0PL2wflhr89N+TPyHWN
	O/R/GHRFx1PMOpxEZFJdarZBXAGnDnl3M8+UUOATdinp5vyt9U+jKaqz0gnW/YOPiNtA
	JB7Q==
X-Gm-Message-State: APjAAAWfUSsFr6Bzs1r1VjekmcUandnnMcAz3WjpKQMjLaXY/dsGQJME
	xQFdpa5iWTW3cofR35oeRQEWQA==
X-Google-Smtp-Source: APXvYqyJwMFARTnxFr7Aoh7OfQHrDYD9a7cMFUZ2oiolfqznFQ4wgBBsMkoM9ZBcahbuJvI2wrZqUQ==
X-Received: by 2002:a63:6b03:: with SMTP id g3mr6986455pgc.239.1551477028756; 
	Fri, 01 Mar 2019 13:50:28 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	k74sm52243213pfb.172.2019.03.01.13.50.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:28 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:30 -0800
Message-Id: <20190301214945.4353-20-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190301214945.4353-1-palmer@sifive.com>
References: <20190301214945.4353-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::529
Subject: [Qemu-riscv] [PULL 19/34] target/riscv: Remove gen_jalr()
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
X-List-Received-Date: Fri, 01 Mar 2019 21:51:08 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

trans_jalr() is the only caller, so move the code into trans_jalr().

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn_trans/trans_rvi.inc.c | 28 +++++++++++++++++-
 target/riscv/translate.c                | 38 -------------------------
 2 files changed, 27 insertions(+), 39 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
index 4a23372cb823..631a88906bce 100644
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
+    if (!has_ext(ctx, RVC)) {
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
index 80afa2c1e62b..9dee2ec24287 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -531,44 +531,6 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
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


