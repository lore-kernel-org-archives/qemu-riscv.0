Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gotnN-0004tR-FK
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jan 2019 12:37:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gotn9-0004jb-Po
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gotn4-00007c-Bm
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:51 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33247)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gotn3-0008U7-Ve
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 12:36:46 -0500
Received: by mail-pg1-x52e.google.com with SMTP id z11so137162pgu.0
	for <qemu-riscv@nongnu.org>; Wed, 30 Jan 2019 09:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=uh/cx2fO792mW+H9MP7dYEuTmQie0wSf91G942+fWKU=;
	b=MSi4hNE0urr6XSKZvQ+IpiGrhRZ4frZ9qbQyLUB85oFE6wrvqfwmv/Tb0ODsJDbKSp
	uGbnG0YNpZWNpI7ZQ7qdKrx1u6jBBUKSbH9m0qmpaLucQ7MMBZNlXxwNbfnUZTxDRpaR
	fXHrnbtQhH2o6xEmw6Bc+GWJa2TAiBbtukxrCrqCmICIvYOyjfMSUucfS5Lajo2SSO2B
	W4LpTiJpkC4Vja81EObi9d9NFy/TMNsqFu6Ftp83j9M8crpoPLBE/ZqCCY6ClCeZQNln
	l19yl3B4kRKEJW7tgyHEyfMEx0IQbAmobfUFAwcE6uB/R/2yf6e5nxRNTQxgw4pirPTC
	gQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=uh/cx2fO792mW+H9MP7dYEuTmQie0wSf91G942+fWKU=;
	b=Hk1/2Wu3Eoq98Qp8G1LO3jxgDeaBn4o5b7t1kkcVn//er7AMJTXAPWteONj0lADQSg
	AkIj5UZWuHsI9UVw3TNQxGu+fGMceH33KK6xlPFjnrnfJBlvlUzN9BMjGsV/0AQAXAw0
	VYCd1BbaOsxwSDJBlr9FfZKrpXBaDlr5mijkbSTBn3J7k6Sof5IB5DAIqS6x9WjBC9PM
	vv1mjzpL6GfsgBB5nW+CKFoGkGwU47Ia/8SKeSz8W/QeQl5P/6lkobMTV0Z0JLNtX+Kr
	auzfTj0BRK4M1DA2lO3Op9nuXtBdWY/ls9JS49LHeRYT7l7N2CtXChm8274pVtoBvVI5
	KG9Q==
X-Gm-Message-State: AHQUAubR+OquulLb2y5WP5FSvl40sonF9ajFSJQL3IRw2bx3yMvAUIUF
	81vYCUWy4ZvspqkkxVZ0bgY5A+ZJO14=
X-Google-Smtp-Source: AHgI3IYmVE6VFocTBudNAHkDU8K74L0b3ZpczNexRk29wpeSeDFEQb9CQiMuxYU9ctbix00PYjC9fw==
X-Received: by 2002:a63:da14:: with SMTP id c20mr7835437pgh.233.1548869788934; 
	Wed, 30 Jan 2019 09:36:28 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	g136sm3100611pfb.154.2019.01.30.09.36.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 09:36:28 -0800 (PST)
Date: Wed, 30 Jan 2019 09:35:58 -0800
Message-Id: <20190130173601.3268-8-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190130173601.3268-1-palmer@sifive.com>
References: <20190130173601.3268-1-palmer@sifive.com>
Cc: qemu-devel@nongnu.org, Michael Clark <mjc@sifive.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52e
Subject: [Qemu-riscv] [PULL 07/10] RISC-V: Add misa.MAFD checks to translate
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
X-List-Received-Date: Wed, 30 Jan 2019 17:36:55 -0000

From: Michael Clark <mjc@sifive.com>

Add misa checks for M, A, F and D extensions and if they are
not present generate illegal instructions. This improves
emulation accurary for harts with a limited set of extensions.

Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/translate.c | 158 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index bb80387088e2..b7176cbf98e1 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -291,24 +291,42 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
         tcg_gen_and_tl(source1, source1, source2);
         break;
     CASE_OP_32_64(OPC_RISC_MUL):
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         tcg_gen_mul_tl(source1, source1, source2);
         break;
     case OPC_RISC_MULH:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         tcg_gen_muls2_tl(source2, source1, source1, source2);
         break;
     case OPC_RISC_MULHSU:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         gen_mulhsu(source1, source1, source2);
         break;
     case OPC_RISC_MULHU:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         tcg_gen_mulu2_tl(source2, source1, source1, source2);
         break;
 #if defined(TARGET_RISCV64)
     case OPC_RISC_DIVW:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         tcg_gen_ext32s_tl(source1, source1);
         tcg_gen_ext32s_tl(source2, source2);
         /* fall through to DIV */
 #endif
     case OPC_RISC_DIV:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         /* Handle by altering args to tcg_gen_div to produce req'd results:
          * For overflow: want source1 in source1 and 1 in source2
          * For div by zero: want -1 in source1 and 1 in source2 -> -1 result */
@@ -340,11 +358,17 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
         break;
 #if defined(TARGET_RISCV64)
     case OPC_RISC_DIVUW:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         tcg_gen_ext32u_tl(source1, source1);
         tcg_gen_ext32u_tl(source2, source2);
         /* fall through to DIVU */
 #endif
     case OPC_RISC_DIVU:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         cond1 = tcg_temp_new();
         zeroreg = tcg_const_tl(0);
         resultopt1 = tcg_temp_new();
@@ -364,11 +388,17 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
         break;
 #if defined(TARGET_RISCV64)
     case OPC_RISC_REMW:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         tcg_gen_ext32s_tl(source1, source1);
         tcg_gen_ext32s_tl(source2, source2);
         /* fall through to REM */
 #endif
     case OPC_RISC_REM:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         cond1 = tcg_temp_new();
         cond2 = tcg_temp_new();
         zeroreg = tcg_const_tl(0);
@@ -396,11 +426,17 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
         break;
 #if defined(TARGET_RISCV64)
     case OPC_RISC_REMUW:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         tcg_gen_ext32u_tl(source1, source1);
         tcg_gen_ext32u_tl(source2, source2);
         /* fall through to REMU */
 #endif
     case OPC_RISC_REMU:
+        if (!has_ext(ctx, RVM)) {
+            goto do_illegal;
+        }
         cond1 = tcg_temp_new();
         zeroreg = tcg_const_tl(0);
         resultopt1 = tcg_temp_new();
@@ -418,6 +454,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
         tcg_temp_free(zeroreg);
         tcg_temp_free(resultopt1);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         return;
@@ -698,13 +735,20 @@ static void gen_fp_load(DisasContext *ctx, uint32_t opc, int rd,
 
     switch (opc) {
     case OPC_RISC_FLW:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         tcg_gen_qemu_ld_i64(cpu_fpr[rd], t0, ctx->mem_idx, MO_TEUL);
         /* RISC-V requires NaN-boxing of narrower width floating point values */
         tcg_gen_ori_i64(cpu_fpr[rd], cpu_fpr[rd], 0xffffffff00000000ULL);
         break;
     case OPC_RISC_FLD:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         tcg_gen_qemu_ld_i64(cpu_fpr[rd], t0, ctx->mem_idx, MO_TEQ);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
@@ -730,11 +774,18 @@ static void gen_fp_store(DisasContext *ctx, uint32_t opc, int rs1,
 
     switch (opc) {
     case OPC_RISC_FSW:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         tcg_gen_qemu_st_i64(cpu_fpr[rs2], t0, ctx->mem_idx, MO_TEUL);
         break;
     case OPC_RISC_FSD:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         tcg_gen_qemu_st_i64(cpu_fpr[rs2], t0, ctx->mem_idx, MO_TEQ);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
@@ -898,15 +949,22 @@ static void gen_fp_fmadd(DisasContext *ctx, uint32_t opc, int rd,
 {
     switch (opc) {
     case OPC_RISC_FMADD_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fmadd_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                            cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
     case OPC_RISC_FMADD_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fmadd_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                            cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
@@ -918,15 +976,22 @@ static void gen_fp_fmsub(DisasContext *ctx, uint32_t opc, int rd,
 {
     switch (opc) {
     case OPC_RISC_FMSUB_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fmsub_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                            cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
     case OPC_RISC_FMSUB_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fmsub_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                            cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
@@ -938,15 +1003,22 @@ static void gen_fp_fnmsub(DisasContext *ctx, uint32_t opc, int rd,
 {
     switch (opc) {
     case OPC_RISC_FNMSUB_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fnmsub_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                             cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
     case OPC_RISC_FNMSUB_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fnmsub_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                             cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
@@ -958,15 +1030,22 @@ static void gen_fp_fnmadd(DisasContext *ctx, uint32_t opc, int rd,
 {
     switch (opc) {
     case OPC_RISC_FNMADD_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fnmadd_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                             cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
     case OPC_RISC_FNMADD_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fnmadd_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
                             cpu_fpr[rs2], cpu_fpr[rs3]);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
@@ -985,30 +1064,51 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 
     switch (opc) {
     case OPC_RISC_FADD_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fadd_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
         break;
     case OPC_RISC_FSUB_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fsub_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
         break;
     case OPC_RISC_FMUL_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fmul_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
         break;
     case OPC_RISC_FDIV_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fdiv_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
         break;
     case OPC_RISC_FSQRT_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fsqrt_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1]);
         break;
     case OPC_RISC_FSGNJ_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         gen_fsgnj(ctx, rd, rs1, rs2, rm, INT32_MIN);
         break;
 
     case OPC_RISC_FMIN_S:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         /* also handles: OPC_RISC_FMAX_S */
         switch (rm) {
         case 0x0:
@@ -1024,6 +1124,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 
     case OPC_RISC_FEQ_S:
         /* also handles: OPC_RISC_FLT_S, OPC_RISC_FLE_S */
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         t0 = tcg_temp_new();
         switch (rm) {
         case 0x0:
@@ -1045,6 +1148,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 
     case OPC_RISC_FCVT_W_S:
         /* also OPC_RISC_FCVT_WU_S, OPC_RISC_FCVT_L_S, OPC_RISC_FCVT_LU_S */
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         t0 = tcg_temp_new();
         switch (rs2) {
         case 0: /* FCVT_W_S */
@@ -1075,6 +1181,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 
     case OPC_RISC_FCVT_S_W:
         /* also OPC_RISC_FCVT_S_WU, OPC_RISC_FCVT_S_L, OPC_RISC_FCVT_S_LU */
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         t0 = tcg_temp_new();
         gen_get_gpr(t0, rs1);
         switch (rs2) {
@@ -1104,6 +1213,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 
     case OPC_RISC_FMV_X_S:
         /* also OPC_RISC_FCLASS_S */
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         t0 = tcg_temp_new();
         switch (rm) {
         case 0: /* FMV */
@@ -1125,6 +1237,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         break;
 
     case OPC_RISC_FMV_S_X:
+        if (!has_ext(ctx, RVF)) {
+            goto do_illegal;
+        }
         t0 = tcg_temp_new();
         gen_get_gpr(t0, rs1);
 #if defined(TARGET_RISCV64)
@@ -1137,22 +1252,37 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 
     /* double */
     case OPC_RISC_FADD_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fadd_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
         break;
     case OPC_RISC_FSUB_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fsub_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
         break;
     case OPC_RISC_FMUL_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fmul_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
         break;
     case OPC_RISC_FDIV_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fdiv_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
         break;
     case OPC_RISC_FSQRT_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         gen_set_rm(ctx, rm);
         gen_helper_fsqrt_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1]);
         break;
@@ -1162,6 +1292,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 
     case OPC_RISC_FMIN_D:
         /* also OPC_RISC_FMAX_D */
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         switch (rm) {
         case 0:
             gen_helper_fmin_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
@@ -1175,6 +1308,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         break;
 
     case OPC_RISC_FCVT_S_D:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         switch (rs2) {
         case 1:
             gen_set_rm(ctx, rm);
@@ -1186,6 +1322,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
         break;
 
     case OPC_RISC_FCVT_D_S:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         switch (rs2) {
         case 0:
             gen_set_rm(ctx, rm);
@@ -1198,6 +1337,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 
     case OPC_RISC_FEQ_D:
         /* also OPC_RISC_FLT_D, OPC_RISC_FLE_D */
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         t0 = tcg_temp_new();
         switch (rm) {
         case 0:
@@ -1219,6 +1361,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 
     case OPC_RISC_FCVT_W_D:
         /* also OPC_RISC_FCVT_WU_D, OPC_RISC_FCVT_L_D, OPC_RISC_FCVT_LU_D */
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         t0 = tcg_temp_new();
         switch (rs2) {
         case 0:
@@ -1249,6 +1394,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 
     case OPC_RISC_FCVT_D_W:
         /* also OPC_RISC_FCVT_D_WU, OPC_RISC_FCVT_D_L, OPC_RISC_FCVT_D_LU */
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         t0 = tcg_temp_new();
         gen_get_gpr(t0, rs1);
         switch (rs2) {
@@ -1278,6 +1426,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 
     case OPC_RISC_FMV_X_D:
         /* also OPC_RISC_FCLASS_D */
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         switch (rm) {
 #if defined(TARGET_RISCV64)
         case 0: /* FMV */
@@ -1298,6 +1449,9 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
 
 #if defined(TARGET_RISCV64)
     case OPC_RISC_FMV_D_X:
+        if (!has_ext(ctx, RVD)) {
+            goto do_illegal;
+        }
         t0 = tcg_temp_new();
         gen_get_gpr(t0, rs1);
         tcg_gen_mov_tl(cpu_fpr[rd], t0);
@@ -1797,6 +1951,9 @@ static void decode_RV32_64G(DisasContext *ctx)
                      GET_STORE_IMM(ctx->opcode));
         break;
     case OPC_RISC_ATOMIC:
+        if (!has_ext(ctx, RVA)) {
+            goto do_illegal;
+        }
         gen_atomic(ctx, MASK_OP_ATOMIC(ctx->opcode), rd, rs1, rs2);
         break;
     case OPC_RISC_FMADD:
@@ -1835,6 +1992,7 @@ static void decode_RV32_64G(DisasContext *ctx)
         gen_system(ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
                    (ctx->opcode & 0xFFF00000) >> 20);
         break;
+    do_illegal:
     default:
         gen_exception_illegal(ctx);
         break;
-- 
2.18.1


