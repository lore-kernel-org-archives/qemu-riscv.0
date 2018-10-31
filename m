Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHqx2-0005t1-VS
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 09:54:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gHqRf-0004s6-O3
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 09:22:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gHqRX-00034I-Id
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 09:22:03 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:43834)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gHqRW-0002Fz-TZ; Wed, 31 Oct 2018 09:21:55 -0400
Received: from pova.uni-paderborn.de ([131.234.189.23]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 amazonia)
	id 1gHqQc-0005cP-6W; Wed, 31 Oct 2018 14:20:58 +0100
Received: from mail.uni-paderborn.de by pova with queue id 2964556-2;
	Wed, 31 Oct 2018 13:20:57 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
Received: from [131.234.87.238] (helo=mustique.hni.uni-paderborn.de)
	by mail.uni-paderborn.de with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89 nylar)
	id 1gHqQb-0005dh-PO; Wed, 31 Oct 2018 14:20:57 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: mjc@sifive.com, sagark@eecs.berkeley.edu, palmer@sifive.com,
	kbastian@mail.uni-paderborn.de, Alistair.Francis@wdc.com
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Date: Wed, 31 Oct 2018 14:20:21 +0100
Message-Id: <20181031132029.4887-28-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.5.2775670, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2018.10.31.131517, AntiVirus-Engine: 5.53.0,
	AntiVirus-Data: 2018.10.10.5530001
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
X-Mailman-Approved-At: Wed, 31 Oct 2018 09:54:25 -0400
Subject: [Qemu-riscv] [PATCH v3 27/35] target/riscv: Remove manual decoding
 of RV32/64M insn
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
X-List-Received-Date: Wed, 31 Oct 2018 13:22:07 -0000

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
v2 -> v3:
    - trans_mulw now uses gen_mulw which properly sign extends the result
    - gen_arith_w -> gen_arith_div_w
    - gen_arith_div_w properly sign extends the resul

 target/riscv/insn_trans/trans_rvm.inc.c |  55 +++--
 target/riscv/translate.c                | 281 +++++++++++-------------
 2 files changed, 162 insertions(+), 174 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvm.inc.c b/target/riscv/insn_trans/trans_rvm.inc.c
index ec3197ede8..949f59ddb2 100644
--- a/target/riscv/insn_trans/trans_rvm.inc.c
+++ b/target/riscv/insn_trans/trans_rvm.inc.c
@@ -21,80 +21,87 @@
 
 static bool trans_mul(DisasContext *ctx, arg_mul *a)
 {
-    gen_arith(ctx, OPC_RISC_MUL, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &tcg_gen_mul_tl);
 }
 
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
-    gen_arith(ctx, OPC_RISC_MULH, a->rd, a->rs1, a->rs2);
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    tcg_gen_muls2_tl(source2, source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
     return true;
 }
 
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
 {
-    gen_arith(ctx, OPC_RISC_MULHSU, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_mulhsu);
 }
 
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
-    gen_arith(ctx, OPC_RISC_MULHU, a->rd, a->rs1, a->rs2);
+    TCGv source1 = tcg_temp_new();
+    TCGv source2 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+
+    tcg_gen_mulu2_tl(source2, source1, source1, source2);
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
     return true;
 }
 
 static bool trans_div(DisasContext *ctx, arg_div *a)
 {
-    gen_arith(ctx, OPC_RISC_DIV, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_div);
 }
 
 static bool trans_divu(DisasContext *ctx, arg_divu *a)
 {
-    gen_arith(ctx, OPC_RISC_DIVU, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_divu);
 }
 
 static bool trans_rem(DisasContext *ctx, arg_rem *a)
 {
-    gen_arith(ctx, OPC_RISC_REM, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_rem);
 }
 
 static bool trans_remu(DisasContext *ctx, arg_remu *a)
 {
-    gen_arith(ctx, OPC_RISC_REMU, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_remu);
 }
 
 #ifdef TARGET_RISCV64
 static bool trans_mulw(DisasContext *ctx, arg_mulw *a)
 {
-    gen_arith(ctx, OPC_RISC_MULW, a->rd, a->rs1, a->rs2);
-    return true;
+    return trans_arith(ctx, a, &gen_mulw);
 }
 
 static bool trans_divw(DisasContext *ctx, arg_divw *a)
 {
-    gen_arith(ctx, OPC_RISC_DIVW, a->rd, a->rs1, a->rs2);
-    return true;
+    return gen_arith_div_w(ctx, a, &gen_div);
 }
 
 static bool trans_divuw(DisasContext *ctx, arg_divuw *a)
 {
-    gen_arith(ctx, OPC_RISC_DIVUW, a->rd, a->rs1, a->rs2);
-    return true;
+    return gen_arith_div_w(ctx, a, &gen_divu);
 }
 
 static bool trans_remw(DisasContext *ctx, arg_remw *a)
 {
-    gen_arith(ctx, OPC_RISC_REMW, a->rd, a->rs1, a->rs2);
-    return true;
+    return gen_arith_div_w(ctx, a, &gen_rem);
 }
 
 static bool trans_remuw(DisasContext *ctx, arg_remuw *a)
 {
-    gen_arith(ctx, OPC_RISC_REMUW, a->rd, a->rs1, a->rs2);
-    return true;
+    return gen_arith_div_w(ctx, a, &gen_remu);
 }
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5b4d091561..fd4b63b4c4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -182,156 +182,110 @@ static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(rh);
 }
 
-static void gen_arith(DisasContext *ctx, uint32_t opc, int rd, int rs1,
-        int rs2)
-{
-    TCGv source1, source2, cond1, cond2, zeroreg, resultopt1;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
-    gen_get_gpr(source1, rs1);
-    gen_get_gpr(source2, rs2);
-
-    switch (opc) {
-    CASE_OP_32_64(OPC_RISC_MUL):
-        tcg_gen_mul_tl(source1, source1, source2);
-        break;
-    case OPC_RISC_MULH:
-        tcg_gen_muls2_tl(source2, source1, source1, source2);
-        break;
-    case OPC_RISC_MULHSU:
-        gen_mulhsu(source1, source1, source2);
-        break;
-    case OPC_RISC_MULHU:
-        tcg_gen_mulu2_tl(source2, source1, source1, source2);
-        break;
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_DIVW:
-        tcg_gen_ext32s_tl(source1, source1);
-        tcg_gen_ext32s_tl(source2, source2);
-        /* fall through to DIV */
-#endif
-    case OPC_RISC_DIV:
-        /* Handle by altering args to tcg_gen_div to produce req'd results:
-         * For overflow: want source1 in source1 and 1 in source2
-         * For div by zero: want -1 in source1 and 1 in source2 -> -1 result */
-        cond1 = tcg_temp_new();
-        cond2 = tcg_temp_new();
-        zeroreg = tcg_const_tl(0);
-        resultopt1 = tcg_temp_new();
-
-        tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)(~0L));
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
-                            ((target_ulong)1) << (TARGET_LONG_BITS - 1));
-        tcg_gen_and_tl(cond1, cond1, cond2); /* cond1 = overflow */
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, 0); /* cond2 = div 0 */
-        /* if div by zero, set source1 to -1, otherwise don't change */
-        tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond2, zeroreg, source1,
-                resultopt1);
-        /* if overflow or div by zero, set source2 to 1, else don't change */
-        tcg_gen_or_tl(cond1, cond1, cond2);
-        tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-        tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-                resultopt1);
-        tcg_gen_div_tl(source1, source1, source2);
-
-        tcg_temp_free(cond1);
-        tcg_temp_free(cond2);
-        tcg_temp_free(zeroreg);
-        tcg_temp_free(resultopt1);
-        break;
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_DIVUW:
-        tcg_gen_ext32u_tl(source1, source1);
-        tcg_gen_ext32u_tl(source2, source2);
-        /* fall through to DIVU */
-#endif
-    case OPC_RISC_DIVU:
-        cond1 = tcg_temp_new();
-        zeroreg = tcg_const_tl(0);
-        resultopt1 = tcg_temp_new();
-
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
-        tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
-        tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond1, zeroreg, source1,
-                resultopt1);
-        tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-        tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-                resultopt1);
-        tcg_gen_divu_tl(source1, source1, source2);
-
-        tcg_temp_free(cond1);
-        tcg_temp_free(zeroreg);
-        tcg_temp_free(resultopt1);
-        break;
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_REMW:
-        tcg_gen_ext32s_tl(source1, source1);
-        tcg_gen_ext32s_tl(source2, source2);
-        /* fall through to REM */
-#endif
-    case OPC_RISC_REM:
-        cond1 = tcg_temp_new();
-        cond2 = tcg_temp_new();
-        zeroreg = tcg_const_tl(0);
-        resultopt1 = tcg_temp_new();
-
-        tcg_gen_movi_tl(resultopt1, 1L);
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)-1);
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
-                            (target_ulong)1 << (TARGET_LONG_BITS - 1));
-        tcg_gen_and_tl(cond2, cond1, cond2); /* cond1 = overflow */
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0); /* cond2 = div 0 */
-        /* if overflow or div by zero, set source2 to 1, else don't change */
-        tcg_gen_or_tl(cond2, cond1, cond2);
-        tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond2, zeroreg, source2,
-                resultopt1);
-        tcg_gen_rem_tl(resultopt1, source1, source2);
-        /* if div by zero, just return the original dividend */
-        tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond1, zeroreg, resultopt1,
-                source1);
-
-        tcg_temp_free(cond1);
-        tcg_temp_free(cond2);
-        tcg_temp_free(zeroreg);
-        tcg_temp_free(resultopt1);
-        break;
-#if defined(TARGET_RISCV64)
-    case OPC_RISC_REMUW:
-        tcg_gen_ext32u_tl(source1, source1);
-        tcg_gen_ext32u_tl(source2, source2);
-        /* fall through to REMU */
-#endif
-    case OPC_RISC_REMU:
-        cond1 = tcg_temp_new();
-        zeroreg = tcg_const_tl(0);
-        resultopt1 = tcg_temp_new();
-
-        tcg_gen_movi_tl(resultopt1, (target_ulong)1);
-        tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
-        tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
-                resultopt1);
-        tcg_gen_remu_tl(resultopt1, source1, source2);
-        /* if div by zero, just return the original dividend */
-        tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond1, zeroreg, resultopt1,
-                source1);
-
-        tcg_temp_free(cond1);
-        tcg_temp_free(zeroreg);
-        tcg_temp_free(resultopt1);
-        break;
-    default:
-        gen_exception_illegal(ctx);
-        return;
-    }
-
-    if (opc & 0x8) { /* sign extend for W instructions */
-        tcg_gen_ext32s_tl(source1, source1);
-    }
-
-    gen_set_gpr(rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+static void gen_div(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv cond1, cond2, zeroreg, resultopt1;
+    /* Handle by altering args to tcg_gen_div to produce req'd results:
+     * For overflow: want source1 in source1 and 1 in source2
+     * For div by zero: want -1 in source1 and 1 in source2 -> -1 result */
+    cond1 = tcg_temp_new();
+    cond2 = tcg_temp_new();
+    zeroreg = tcg_const_tl(0);
+    resultopt1 = tcg_temp_new();
+
+    tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)(~0L));
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
+                        ((target_ulong)1) << (TARGET_LONG_BITS - 1));
+    tcg_gen_and_tl(cond1, cond1, cond2); /* cond1 = overflow */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, 0); /* cond2 = div 0 */
+    /* if div by zero, set source1 to -1, otherwise don't change */
+    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond2, zeroreg, source1,
+            resultopt1);
+    /* if overflow or div by zero, set source2 to 1, else don't change */
+    tcg_gen_or_tl(cond1, cond1, cond2);
+    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
+            resultopt1);
+    tcg_gen_div_tl(ret, source1, source2);
+
+    tcg_temp_free(cond1);
+    tcg_temp_free(cond2);
+    tcg_temp_free(zeroreg);
+    tcg_temp_free(resultopt1);
+}
+
+static void gen_divu(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv cond1, zeroreg, resultopt1;
+    cond1 = tcg_temp_new();
+
+    zeroreg = tcg_const_tl(0);
+    resultopt1 = tcg_temp_new();
+
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
+    tcg_gen_movi_tl(resultopt1, (target_ulong)-1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, source1, cond1, zeroreg, source1,
+            resultopt1);
+    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
+    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
+            resultopt1);
+    tcg_gen_divu_tl(ret, source1, source2);
+
+    tcg_temp_free(cond1);
+    tcg_temp_free(zeroreg);
+    tcg_temp_free(resultopt1);
+}
+
+static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv cond1, cond2, zeroreg, resultopt1;
+
+    cond1 = tcg_temp_new();
+    cond2 = tcg_temp_new();
+    zeroreg = tcg_const_tl(0);
+    resultopt1 = tcg_temp_new();
+
+    tcg_gen_movi_tl(resultopt1, 1L);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)-1);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
+                        (target_ulong)1 << (TARGET_LONG_BITS - 1));
+    tcg_gen_and_tl(cond2, cond1, cond2); /* cond1 = overflow */
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0); /* cond2 = div 0 */
+    /* if overflow or div by zero, set source2 to 1, else don't change */
+    tcg_gen_or_tl(cond2, cond1, cond2);
+    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond2, zeroreg, source2,
+            resultopt1);
+    tcg_gen_rem_tl(resultopt1, source1, source2);
+    /* if div by zero, just return the original dividend */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
+            source1);
+
+    tcg_temp_free(cond1);
+    tcg_temp_free(cond2);
+    tcg_temp_free(zeroreg);
+    tcg_temp_free(resultopt1);
+}
+
+static void gen_remu(TCGv ret, TCGv source1, TCGv source2)
+{
+    TCGv cond1, zeroreg, resultopt1;
+    cond1 = tcg_temp_new();
+    zeroreg = tcg_const_tl(0);
+    resultopt1 = tcg_temp_new();
+
+    tcg_gen_movi_tl(resultopt1, (target_ulong)1);
+    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0);
+    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond1, zeroreg, source2,
+            resultopt1);
+    tcg_gen_remu_tl(resultopt1, source1, source2);
+    /* if div by zero, just return the original dividend */
+    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
+            source1);
+
+    tcg_temp_free(cond1);
+    tcg_temp_free(zeroreg);
+    tcg_temp_free(resultopt1);
 }
 
 static void gen_jal(CPURISCVState *env, DisasContext *ctx, int rd,
@@ -586,6 +540,33 @@ static void gen_addiw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_add_tl(ret, arg1, arg2);
     tcg_gen_ext32s_tl(ret, ret);
 }
+
+static void gen_mulw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_mul_tl(ret, arg1, arg2);
+    tcg_gen_ext32s_tl(ret, ret);
+}
+
+static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
+                            void(*func)(TCGv, TCGv, TCGv))
+{
+    TCGv source1, source2;
+    source1 = tcg_temp_new();
+    source2 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(source2, a->rs2);
+    tcg_gen_ext32s_tl(source1, source1);
+    tcg_gen_ext32s_tl(source2, source2);
+
+    (*func)(source1, source1, source2);
+
+    tcg_gen_ext32s_tl(source1, source1);
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    tcg_temp_free(source2);
+    return true;
+}
 #endif
 
 static bool trans_arith(DisasContext *ctx, arg_r *a,
-- 
2.19.1


