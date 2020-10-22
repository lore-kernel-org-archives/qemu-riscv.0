Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVVG7-00015V-IF
	for mharc-qemu-riscv@gnu.org; Thu, 22 Oct 2020 03:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kVVFv-00012i-Ck; Thu, 22 Oct 2020 03:43:27 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:36932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kVVFp-0007dy-CL; Thu, 22 Oct 2020 03:43:26 -0400
Received: by mail-lj1-x244.google.com with SMTP id i2so894072ljg.4;
 Thu, 22 Oct 2020 00:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lc9QIvOC4BQ5aEV3wggBnbdGYDm7vcPEJjFI1O17k4M=;
 b=WLh8jfmZOcS0TFpmvT7cYT5DH32sUASC7+EO74hJoty5cetTIAhhRhx9HB9wUbsbdo
 C7LjqGoNfa3ZDp1nU/akQtDIeKiIc9MmtDJsr+7fgbGx+DSwva+7SyE9FL73B4ocSx5M
 yNUtUyuhMMyY1+NX/26xmAALaFJ6l0/0PTpzU7p1d70j9VTJlQnhviRAL3p15oNQ8LVM
 PEXsXM1I/3pFPNDrzexZV7MLr4a/0Blizu2XzslYwO2eHGy4dGwMGSBT8jIijKEVgXZY
 /tdnap8S4kaQqpN1u+RO8dwoZbqOaI3jlFuiWptrSPYeEvy/S/zGQGJxT8YB0yycWNRM
 xxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lc9QIvOC4BQ5aEV3wggBnbdGYDm7vcPEJjFI1O17k4M=;
 b=ZE9QZm+Pq9hopeDWuX9t3kc9QJdUU9Mk8PqpA2Zu5J9QmigLL16f3C53zZFUHqowNG
 Y5XlUT4BetVzihMBy55gPG3VkYDW6PQeCfSVNVKT+NGZBta3+LOrSJ01DHJP+qdPl8mp
 RsHhmvoywkeNI+MtQwdJzx9VKWGB8S6f2cuxiIrkIF1ZN9uvXvwy+GJeC6R1nJuFkLlg
 fBHXbCC4BEnIzkMQ5LJFNZ3Ln8CuPjdohk1X2RE7YQZOdEZXgfBcwHnBOJjAw2zCILyP
 wIPHBuRcMbD1AI0anahjFCBHHfQJluXv81oEgGSYjtc24WPeGKs0O5sTTLazY7sV+A3f
 gXkg==
X-Gm-Message-State: AOAM530T5+NeREpC/puTRSsVWQkFDF1N8H4k/bK/iMerxJ4HdgEXgGyD
 zXOmQd9BRsoM4VPzSg8/l0E=
X-Google-Smtp-Source: ABdhPJzTwqO6B1l8wvaB6SjeXtpKmOHKSXHj6IFfmlSQ5WgDm0P4NYDcyG8uxO96HVvTdta44MgL+g==
X-Received: by 2002:a2e:94d0:: with SMTP id r16mr471785ljh.292.1603352599347; 
 Thu, 22 Oct 2020 00:43:19 -0700 (PDT)
Received: from neptune.lab ([46.39.229.104])
 by smtp.googlemail.com with ESMTPSA id n19sm138887lfe.142.2020.10.22.00.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 00:43:18 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 4/6] [RISCV_PM] Support pointer masking for RISC-V for
 i/c/f/d/a types of instructions
Date: Thu, 22 Oct 2020 10:43:07 +0300
Message-Id: <20201022074309.3210-5-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022074309.3210-1-space.monkey.delivers@gmail.com>
References: <20201022074309.3210-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lj1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 GAPPY_SUBJECT=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Oct 2020 07:43:30 -0000

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/insn_trans/trans_rva.c.inc |  3 +++
 target/riscv/insn_trans/trans_rvd.c.inc |  2 ++
 target/riscv/insn_trans/trans_rvf.c.inc |  2 ++
 target/riscv/insn_trans/trans_rvi.c.inc |  2 ++
 target/riscv/translate.c                | 14 ++++++++++++++
 5 files changed, 23 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index be8a9f06dd..5559e347ba 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -26,6 +26,7 @@ static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
+    gen_pm_adjust_address(ctx, src1, src1);
     tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
     if (a->aq) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
@@ -46,6 +47,7 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
     TCGLabel *l2 = gen_new_label();
 
     gen_get_gpr(src1, a->rs1);
+    gen_pm_adjust_address(ctx, src1, src1);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
 
     gen_get_gpr(src2, a->rs2);
@@ -91,6 +93,7 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
     gen_get_gpr(src1, a->rs1);
     gen_get_gpr(src2, a->rs2);
 
+    gen_pm_adjust_address(ctx, src1, src1);
     (*func)(src2, src1, src2, ctx->mem_idx, mop);
 
     gen_set_gpr(a->rd, src2);
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 4f832637fa..935342f66d 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -25,6 +25,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
     TCGv t0 = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
+    gen_pm_adjust_address(ctx, t0, t0);
 
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
 
@@ -40,6 +41,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
     TCGv t0 = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
+    gen_pm_adjust_address(ctx, t0, t0);
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
 
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 3dfec8211d..04b3c3eb3d 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -30,6 +30,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
     TCGv t0 = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
+    gen_pm_adjust_address(ctx, t0, t0);
 
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
     gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
@@ -47,6 +48,7 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     gen_get_gpr(t0, a->rs1);
 
     tcg_gen_addi_tl(t0, t0, a->imm);
+    gen_pm_adjust_address(ctx, t0, t0);
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
 
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index d04ca0394c..bee7f6be46 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -141,6 +141,7 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
     TCGv t1 = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
+    gen_pm_adjust_address(ctx, t0, t0);
 
     tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
     gen_set_gpr(a->rd, t1);
@@ -180,6 +181,7 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
     TCGv dat = tcg_temp_new();
     gen_get_gpr(t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
+    gen_pm_adjust_address(ctx, t0, t0);
     gen_get_gpr(dat, a->rs2);
 
     tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 79dca2291b..a7cbf909f3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -101,6 +101,16 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
     tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
 }
 
+/*
+ * Temp stub: generates address adjustment for PointerMasking
+ */
+static void gen_pm_adjust_address(DisasContext *s,
+                                  TCGv_i64      dst,
+                                  TCGv_i64      src)
+{
+    tcg_gen_mov_i64(dst, src);
+}
+
 /*
  * A narrow n-bit operation, where n < FLEN, checks that input operands
  * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.
@@ -380,6 +390,7 @@ static void gen_load_c(DisasContext *ctx, uint32_t opc, int rd, int rs1,
     TCGv t1 = tcg_temp_new();
     gen_get_gpr(t0, rs1);
     tcg_gen_addi_tl(t0, t0, imm);
+    gen_pm_adjust_address(ctx, t0, t0);
     int memop = tcg_memop_lookup[(opc >> 12) & 0x7];
 
     if (memop < 0) {
@@ -400,6 +411,7 @@ static void gen_store_c(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
     TCGv dat = tcg_temp_new();
     gen_get_gpr(t0, rs1);
     tcg_gen_addi_tl(t0, t0, imm);
+    gen_pm_adjust_address(ctx, t0, t0);
     gen_get_gpr(dat, rs2);
     int memop = tcg_memop_lookup[(opc >> 12) & 0x7];
 
@@ -459,6 +471,7 @@ static void gen_fp_load(DisasContext *ctx, uint32_t opc, int rd,
     t0 = tcg_temp_new();
     gen_get_gpr(t0, rs1);
     tcg_gen_addi_tl(t0, t0, imm);
+    gen_pm_adjust_address(ctx, t0, t0);
 
     switch (opc) {
     case OPC_RISC_FLW:
@@ -498,6 +511,7 @@ static void gen_fp_store(DisasContext *ctx, uint32_t opc, int rs1,
     t0 = tcg_temp_new();
     gen_get_gpr(t0, rs1);
     tcg_gen_addi_tl(t0, t0, imm);
+    gen_pm_adjust_address(ctx, t0, t0);
 
     switch (opc) {
     case OPC_RISC_FSW:
-- 
2.20.1


