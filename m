Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h456D-0000uT-JW
	for mharc-qemu-riscv@gnu.org; Wed, 13 Mar 2019 10:43:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4563-0000I0-F2
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:43:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h4513-0004TA-FE
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:59 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:34170)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h4513-0004ST-6E
	for qemu-riscv@nongnu.org; Wed, 13 Mar 2019 10:37:57 -0400
Received: by mail-pf1-x431.google.com with SMTP id v64so1536244pfb.1
	for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2019 07:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=vnSyOn1RCSRaWk1lphrZruQU8cLtIWT47bpMtNwez6c=;
	b=hyC9C0qHXeWiusNfc7qlcZRo9t9Zc5/j3yf6By93ae7NyR09pqRcCVgQ4W4dyVg11W
	SuTctn//yYxfEA9zBLD65IceDZZp8Ua95uep2b+MLYw4p2Z/bypBtuF67apUQ0mtwV0Z
	d54iJD1A1j/2Pnb75lm05QwzsipZ6wlFv9xVCranSEjd7WS2AoQ8lwnH8EMc2/10JZ0v
	Le4chOcxQczPeR4/WI5gj2ptSLsOlPmYAJ6+5n/1oZtcwYICYeeDhf/7Gu6sVDgtHraN
	y1tYbpa3C7kbaXQjgAjCDWZfqphj8cN6MNGtWxZAdS+3T6nGy35sHyNLqXzEokDQ4GmC
	ozwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=vnSyOn1RCSRaWk1lphrZruQU8cLtIWT47bpMtNwez6c=;
	b=PrrDrMQ4gJbmqvaaZIk7DFJOcWyJlKrYeVbPSt8ov6oO3JRjXmKsICLytBg79NV3Bj
	nSkzGYYsJA3wPgcZfcdSMw25IcBaqDf4RSm5kj/x4GKQCdlIZvBTTAtJVemqICE6wn60
	CbCz+RaP5Z8GwoGLX/WzJSs4CfNctQKUi/F8MLHAEgLPdp3jvjvd6Rk/XyTxY8+FbN4P
	x3CwDX+BFkC0tYZxLY8z+Coq62n0ZZ/85pC+o0RhA2fuLAd7JjUMvjlj6iHBU/me4zj5
	JfojxeegbfVc7wapsYL/MgKDmqIWWXtlFpoglABr4fEI1mqZ9aFor/lAtB0UUPvRUXoC
	LTQw==
X-Gm-Message-State: APjAAAXDjuUn00ISgVHv4dCNruIvBszMTqsjEYNLANwx7rWtCYUOWSK6
	ZMm2UeXoJIq7zj5dl+LwW7JVoeVdi5QQ5vEh
X-Google-Smtp-Source: APXvYqzHM+PZHs5Okl64VKsx8SRQ0DMKsUaQdQ2aU05qD8W2jh3a68ZLCbMPGXLeRE4ESnwsTxjy6A==
X-Received: by 2002:a17:902:848c:: with SMTP id
	c12mr9323317plo.207.1552487875746; 
	Wed, 13 Mar 2019 07:37:55 -0700 (PDT)
Received: from localhost (60-250-203-158.HINET-IP.hinet.net. [60.250.203.158])
	by smtp.gmail.com with ESMTPSA id
	k29sm8695866pfj.92.2019.03.13.07.37.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2019 07:37:55 -0700 (PDT)
Date: Wed, 13 Mar 2019 07:36:50 -0700
Message-Id: <20190313143705.29129-15-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::431
Subject: [Qemu-riscv] [PULL 14/29] target/riscv: Convert RV64D insns to
 decodetree
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
X-List-Received-Date: Wed, 13 Mar 2019 14:43:09 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
 target/riscv/insn32-64.decode           |   8 +
 target/riscv/insn_trans/trans_rvd.inc.c |  82 ++++
 target/riscv/translate.c                | 601 +-----------------------
 3 files changed, 91 insertions(+), 600 deletions(-)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 6319f872ac1d..380bf791bcdc 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -62,3 +62,11 @@ fcvt_l_s   1100000  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_lu_s  1100000  00011 ..... ... ..... 1010011 @r2_rm
 fcvt_s_l   1101000  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_s_lu  1101000  00011 ..... ... ..... 1010011 @r2_rm
+
+# *** RV64D Standard Extension (in addition to RV32D) ***
+fcvt_l_d   1100001  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_lu_d  1100001  00011 ..... ... ..... 1010011 @r2_rm
+fmv_x_d    1110001  00000 ..... 000 ..... 1010011 @r2
+fcvt_d_l   1101001  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_d_lu  1101001  00011 ..... ... ..... 1010011 @r2_rm
+fmv_d_x    1111001  00000 ..... 000 ..... 1010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvd.inc.c b/target/riscv/insn_trans/trans_rvd.inc.c
index 98fc1cdc5a20..393fa0248ce9 100644
--- a/target/riscv/insn_trans/trans_rvd.inc.c
+++ b/target/riscv/insn_trans/trans_rvd.inc.c
@@ -358,3 +358,85 @@ static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
     mark_fs_dirty(ctx);
     return true;
 }
+
+#ifdef TARGET_RISCV64
+
+static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv t0 = tcg_temp_new();
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_l_d(t0, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv t0 = tcg_temp_new();
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_lu_d(t0, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_fmv_x_d(DisasContext *ctx, arg_fmv_x_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    gen_set_gpr(a->rd, cpu_fpr[a->rs1]);
+    return true;
+}
+
+static bool trans_fcvt_d_l(DisasContext *ctx, arg_fcvt_d_l *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, t0);
+    tcg_temp_free(t0);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, t0);
+    tcg_temp_free(t0);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmv_d_x(DisasContext *ctx, arg_fmv_d_x *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+
+    tcg_gen_mov_tl(cpu_fpr[a->rd], t0);
+    tcg_temp_free(t0);
+    mark_fs_dirty(ctx);
+    return true;
+}
+#endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c201985ef37b..2e36deee82f4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -186,44 +186,6 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(rh);
 }
 
-static void gen_fsgnj(DisasContext *ctx, uint32_t rd, uint32_t rs1,
-    uint32_t rs2, int rm, uint64_t min)
-{
-    switch (rm) {
-    case 0: /* fsgnj */
-        if (rs1 == rs2) { /* FMOV */
-            tcg_gen_mov_i64(cpu_fpr[rd], cpu_fpr[rs1]);
-        } else {
-            tcg_gen_deposit_i64(cpu_fpr[rd], cpu_fpr[rs2], cpu_fpr[rs1],
-                                0, min == INT32_MIN ? 31 : 63);
-        }
-        break;
-    case 1: /* fsgnjn */
-        if (rs1 == rs2) { /* FNEG */
-            tcg_gen_xori_i64(cpu_fpr[rd], cpu_fpr[rs1], min);
-        } else {
-            TCGv_i64 t0 = tcg_temp_new_i64();
-            tcg_gen_not_i64(t0, cpu_fpr[rs2]);
-            tcg_gen_deposit_i64(cpu_fpr[rd], t0, cpu_fpr[rs1],
-                                0, min == INT32_MIN ? 31 : 63);
-            tcg_temp_free_i64(t0);
-        }
-        break;
-    case 2: /* fsgnjx */
-        if (rs1 == rs2) { /* FABS */
-            tcg_gen_andi_i64(cpu_fpr[rd], cpu_fpr[rs1], ~min);
-        } else {
-            TCGv_i64 t0 = tcg_temp_new_i64();
-            tcg_gen_andi_i64(t0, cpu_fpr[rs2], min);
-            tcg_gen_xor_i64(cpu_fpr[rd], cpu_fpr[rs1], t0);
-            tcg_temp_free_i64(t0);
-        }
-        break;
-    default:
-        gen_exception_illegal(ctx);
-    }
-}
-
 static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
         int rs2)
 {
@@ -807,535 +769,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
     tcg_temp_free_i32(t0);
 }
 
-static void gen_fp_fmadd(DisasContext *ctx, uint32_t opc, int rd,
-                         int rs1, int rs2, int rs3, int rm)
-{
-    switch (opc) {
-    case OPC_RISC_FMADD_S:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fmadd_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
-                           cpu_fpr[rs2], cpu_fpr[rs3]);
-        break;
-    case OPC_RISC_FMADD_D:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fmadd_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
-                           cpu_fpr[rs2], cpu_fpr[rs3]);
-        break;
-    do_illegal:
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-}
-
-static void gen_fp_fmsub(DisasContext *ctx, uint32_t opc, int rd,
-                         int rs1, int rs2, int rs3, int rm)
-{
-    switch (opc) {
-    case OPC_RISC_FMSUB_S:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fmsub_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
-                           cpu_fpr[rs2], cpu_fpr[rs3]);
-        break;
-    case OPC_RISC_FMSUB_D:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fmsub_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
-                           cpu_fpr[rs2], cpu_fpr[rs3]);
-        break;
-    do_illegal:
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-}
-
-static void gen_fp_fnmsub(DisasContext *ctx, uint32_t opc, int rd,
-                          int rs1, int rs2, int rs3, int rm)
-{
-    switch (opc) {
-    case OPC_RISC_FNMSUB_S:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fnmsub_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
-                            cpu_fpr[rs2], cpu_fpr[rs3]);
-        break;
-    case OPC_RISC_FNMSUB_D:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fnmsub_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
-                            cpu_fpr[rs2], cpu_fpr[rs3]);
-        break;
-    do_illegal:
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-}
-
-static void gen_fp_fnmadd(DisasContext *ctx, uint32_t opc, int rd,
-                          int rs1, int rs2, int rs3, int rm)
-{
-    switch (opc) {
-    case OPC_RISC_FNMADD_S:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fnmadd_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
-                            cpu_fpr[rs2], cpu_fpr[rs3]);
-        break;
-    case OPC_RISC_FNMADD_D:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fnmadd_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1],
-                            cpu_fpr[rs2], cpu_fpr[rs3]);
-        break;
-    do_illegal:
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-}
-
-static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
-                         int rs1, int rs2, int rm)
-{
-    TCGv t0 = NULL;
-    bool fp_output = true;
-
-    if (ctx->mstatus_fs == 0) {
-        goto do_illegal;
-    }
-
-    switch (opc) {
-    case OPC_RISC_FADD_S:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fadd_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-        break;
-    case OPC_RISC_FSUB_S:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fsub_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-        break;
-    case OPC_RISC_FMUL_S:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fmul_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-        break;
-    case OPC_RISC_FDIV_S:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fdiv_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-        break;
-    case OPC_RISC_FSQRT_S:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fsqrt_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1]);
-        break;
-    case OPC_RISC_FSGNJ_S:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        gen_fsgnj(ctx, rd, rs1, rs2, rm, INT32_MIN);
-        break;
-
-    case OPC_RISC_FMIN_S:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        /* also handles: OPC_RISC_FMAX_S */
-        switch (rm) {
-        case 0x0:
-            gen_helper_fmin_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-            break;
-        case 0x1:
-            gen_helper_fmax_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-            break;
-        default:
-            goto do_illegal;
-        }
-        break;
-
-    case OPC_RISC_FEQ_S:
-        /* also handles: OPC_RISC_FLT_S, OPC_RISC_FLE_S */
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        t0 = tcg_temp_new();
-        switch (rm) {
-        case 0x0:
-            gen_helper_fle_s(t0, cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-            break;
-        case 0x1:
-            gen_helper_flt_s(t0, cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-            break;
-        case 0x2:
-            gen_helper_feq_s(t0, cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-            break;
-        default:
-            goto do_illegal;
-        }
-        gen_set_gpr(rd, t0);
-        tcg_temp_free(t0);
-        fp_output = false;
-        break;
-
-    case OPC_RISC_FCVT_W_S:
-        /* also OPC_RISC_FCVT_WU_S, OPC_RISC_FCVT_L_S, OPC_RISC_FCVT_LU_S */
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        t0 = tcg_temp_new();
-        switch (rs2) {
-        case 0: /* FCVT_W_S */
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_w_s(t0, cpu_env, cpu_fpr[rs1]);
-            break;
-        case 1: /* FCVT_WU_S */
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_wu_s(t0, cpu_env, cpu_fpr[rs1]);
-            break;
-#if defined(TARGET_RISCV64)
-        case 2: /* FCVT_L_S */
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_l_s(t0, cpu_env, cpu_fpr[rs1]);
-            break;
-        case 3: /* FCVT_LU_S */
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_lu_s(t0, cpu_env, cpu_fpr[rs1]);
-            break;
-#endif
-        default:
-            goto do_illegal;
-        }
-        gen_set_gpr(rd, t0);
-        tcg_temp_free(t0);
-        fp_output = false;
-        break;
-
-    case OPC_RISC_FCVT_S_W:
-        /* also OPC_RISC_FCVT_S_WU, OPC_RISC_FCVT_S_L, OPC_RISC_FCVT_S_LU */
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        t0 = tcg_temp_new();
-        gen_get_gpr(t0, rs1);
-        switch (rs2) {
-        case 0: /* FCVT_S_W */
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_s_w(cpu_fpr[rd], cpu_env, t0);
-            break;
-        case 1: /* FCVT_S_WU */
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_s_wu(cpu_fpr[rd], cpu_env, t0);
-            break;
-#if defined(TARGET_RISCV64)
-        case 2: /* FCVT_S_L */
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_s_l(cpu_fpr[rd], cpu_env, t0);
-            break;
-        case 3: /* FCVT_S_LU */
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_s_lu(cpu_fpr[rd], cpu_env, t0);
-            break;
-#endif
-        default:
-            goto do_illegal;
-        }
-        tcg_temp_free(t0);
-        break;
-
-    case OPC_RISC_FMV_X_S:
-        /* also OPC_RISC_FCLASS_S */
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        t0 = tcg_temp_new();
-        switch (rm) {
-        case 0: /* FMV */
-#if defined(TARGET_RISCV64)
-            tcg_gen_ext32s_tl(t0, cpu_fpr[rs1]);
-#else
-            tcg_gen_extrl_i64_i32(t0, cpu_fpr[rs1]);
-#endif
-            break;
-        case 1:
-            gen_helper_fclass_s(t0, cpu_fpr[rs1]);
-            break;
-        default:
-            goto do_illegal;
-        }
-        gen_set_gpr(rd, t0);
-        tcg_temp_free(t0);
-        fp_output = false;
-        break;
-
-    case OPC_RISC_FMV_S_X:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        t0 = tcg_temp_new();
-        gen_get_gpr(t0, rs1);
-#if defined(TARGET_RISCV64)
-        tcg_gen_mov_i64(cpu_fpr[rd], t0);
-#else
-        tcg_gen_extu_i32_i64(cpu_fpr[rd], t0);
-#endif
-        tcg_temp_free(t0);
-        break;
-
-    /* double */
-    case OPC_RISC_FADD_D:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fadd_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-        break;
-    case OPC_RISC_FSUB_D:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fsub_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-        break;
-    case OPC_RISC_FMUL_D:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fmul_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-        break;
-    case OPC_RISC_FDIV_D:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fdiv_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-        break;
-    case OPC_RISC_FSQRT_D:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        gen_set_rm(ctx, rm);
-        gen_helper_fsqrt_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1]);
-        break;
-    case OPC_RISC_FSGNJ_D:
-        gen_fsgnj(ctx, rd, rs1, rs2, rm, INT64_MIN);
-        break;
-
-    case OPC_RISC_FMIN_D:
-        /* also OPC_RISC_FMAX_D */
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        switch (rm) {
-        case 0:
-            gen_helper_fmin_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-            break;
-        case 1:
-            gen_helper_fmax_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-            break;
-        default:
-            goto do_illegal;
-        }
-        break;
-
-    case OPC_RISC_FCVT_S_D:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        switch (rs2) {
-        case 1:
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_s_d(cpu_fpr[rd], cpu_env, cpu_fpr[rs1]);
-            break;
-        default:
-            goto do_illegal;
-        }
-        break;
-
-    case OPC_RISC_FCVT_D_S:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        switch (rs2) {
-        case 0:
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_d_s(cpu_fpr[rd], cpu_env, cpu_fpr[rs1]);
-            break;
-        default:
-            goto do_illegal;
-        }
-        break;
-
-    case OPC_RISC_FEQ_D:
-        /* also OPC_RISC_FLT_D, OPC_RISC_FLE_D */
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        t0 = tcg_temp_new();
-        switch (rm) {
-        case 0:
-            gen_helper_fle_d(t0, cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-            break;
-        case 1:
-            gen_helper_flt_d(t0, cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-            break;
-        case 2:
-            gen_helper_feq_d(t0, cpu_env, cpu_fpr[rs1], cpu_fpr[rs2]);
-            break;
-        default:
-            goto do_illegal;
-        }
-        gen_set_gpr(rd, t0);
-        tcg_temp_free(t0);
-        fp_output = false;
-        break;
-
-    case OPC_RISC_FCVT_W_D:
-        /* also OPC_RISC_FCVT_WU_D, OPC_RISC_FCVT_L_D, OPC_RISC_FCVT_LU_D */
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        t0 = tcg_temp_new();
-        switch (rs2) {
-        case 0:
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_w_d(t0, cpu_env, cpu_fpr[rs1]);
-            break;
-        case 1:
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_wu_d(t0, cpu_env, cpu_fpr[rs1]);
-            break;
-#if defined(TARGET_RISCV64)
-        case 2:
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_l_d(t0, cpu_env, cpu_fpr[rs1]);
-            break;
-        case 3:
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_lu_d(t0, cpu_env, cpu_fpr[rs1]);
-            break;
-#endif
-        default:
-            goto do_illegal;
-        }
-        gen_set_gpr(rd, t0);
-        tcg_temp_free(t0);
-        fp_output = false;
-        break;
-
-    case OPC_RISC_FCVT_D_W:
-        /* also OPC_RISC_FCVT_D_WU, OPC_RISC_FCVT_D_L, OPC_RISC_FCVT_D_LU */
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        t0 = tcg_temp_new();
-        gen_get_gpr(t0, rs1);
-        switch (rs2) {
-        case 0:
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_d_w(cpu_fpr[rd], cpu_env, t0);
-            break;
-        case 1:
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_d_wu(cpu_fpr[rd], cpu_env, t0);
-            break;
-#if defined(TARGET_RISCV64)
-        case 2:
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_d_l(cpu_fpr[rd], cpu_env, t0);
-            break;
-        case 3:
-            gen_set_rm(ctx, rm);
-            gen_helper_fcvt_d_lu(cpu_fpr[rd], cpu_env, t0);
-            break;
-#endif
-        default:
-            goto do_illegal;
-        }
-        tcg_temp_free(t0);
-        break;
-
-    case OPC_RISC_FMV_X_D:
-        /* also OPC_RISC_FCLASS_D */
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        switch (rm) {
-#if defined(TARGET_RISCV64)
-        case 0: /* FMV */
-            gen_set_gpr(rd, cpu_fpr[rs1]);
-            break;
-#endif
-        case 1:
-            t0 = tcg_temp_new();
-            gen_helper_fclass_d(t0, cpu_fpr[rs1]);
-            gen_set_gpr(rd, t0);
-            tcg_temp_free(t0);
-            break;
-        default:
-            goto do_illegal;
-        }
-        fp_output = false;
-        break;
-
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_FMV_D_X:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        t0 = tcg_temp_new();
-        gen_get_gpr(t0, rs1);
-        tcg_gen_mov_tl(cpu_fpr[rd], t0);
-        tcg_temp_free(t0);
-        break;
-#endif
-
-    default:
-    do_illegal:
-        if (t0) {
-            tcg_temp_free(t0);
-        }
-        gen_exception_illegal(ctx);
-        return;
-    }
-
-    if (fp_output) {
-        mark_fs_dirty(ctx);
-    }
-}
-
 static void gen_system(DisasContext *ctx, uint32_t opc, int rd, int rs1,
                        int csr)
 {
@@ -1722,11 +1155,8 @@ bool decode_insn32(DisasContext *ctx, uint32_t insn);
 
 static void decode_RV32_64G(DisasContext *ctx)
 {
-    int rs1;
-    int rs2;
-    int rd;
+    int rs1, rd;
     uint32_t op;
-    target_long imm;
 
     /* We do not do misaligned address check here: the address should never be
      * misaligned at this point. Instructions that set PC must do the check,
@@ -1735,38 +1165,9 @@ static void decode_RV32_64G(DisasContext *ctx)
 
     op = MASK_OP_MAJOR(ctx->opcode);
     rs1 = GET_RS1(ctx->opcode);
-    rs2 = GET_RS2(ctx->opcode);
     rd = GET_RD(ctx->opcode);
-    imm = GET_IMM(ctx->opcode);
 
     switch (op) {
-    case OPC_RISC_FP_LOAD:
-        gen_fp_load(ctx, MASK_OP_FP_LOAD(ctx->opcode), rd, rs1, imm);
-        break;
-    case OPC_RISC_FP_STORE:
-        gen_fp_store(ctx, MASK_OP_FP_STORE(ctx->opcode), rs1, rs2,
-                     GET_STORE_IMM(ctx->opcode));
-        break;
-    case OPC_RISC_FMADD:
-        gen_fp_fmadd(ctx, MASK_OP_FP_FMADD(ctx->opcode), rd, rs1, rs2,
-                     GET_RS3(ctx->opcode), GET_RM(ctx->opcode));
-        break;
-    case OPC_RISC_FMSUB:
-        gen_fp_fmsub(ctx, MASK_OP_FP_FMSUB(ctx->opcode), rd, rs1, rs2,
-                     GET_RS3(ctx->opcode), GET_RM(ctx->opcode));
-        break;
-    case OPC_RISC_FNMSUB:
-        gen_fp_fnmsub(ctx, MASK_OP_FP_FNMSUB(ctx->opcode), rd, rs1, rs2,
-                      GET_RS3(ctx->opcode), GET_RM(ctx->opcode));
-        break;
-    case OPC_RISC_FNMADD:
-        gen_fp_fnmadd(ctx, MASK_OP_FP_FNMADD(ctx->opcode), rd, rs1, rs2,
-                      GET_RS3(ctx->opcode), GET_RM(ctx->opcode));
-        break;
-    case OPC_RISC_FP_ARITH:
-        gen_fp_arith(ctx, MASK_OP_FP_ARITH(ctx->opcode), rd, rs1, rs2,
-                     GET_RM(ctx->opcode));
-        break;
     case OPC_RISC_SYSTEM:
         gen_system(ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
                    (ctx->opcode & 0xFFF00000) >> 20);
-- 
2.19.2


