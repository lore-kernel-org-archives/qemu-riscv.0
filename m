Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHqx3-0005tr-EU
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 09:54:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gHqRl-0004yo-8A
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 09:22:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1gHqRj-0003H2-Bh
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 09:22:09 -0400
Received: from mail.uni-paderborn.de ([131.234.142.9]:60460)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1gHqRX-0002CU-1M; Wed, 31 Oct 2018 09:21:55 -0400
Received: from tweenies.uni-paderborn.de ([131.234.189.21]
	helo=localhost.localdomain)
	by mail.uni-paderborn.de with esmtp (Exim 4.89 spheron)
	id 1gHqQZ-0004q4-HX; Wed, 31 Oct 2018 14:20:55 +0100
Received: from mail.uni-paderborn.de by tweenies with queue id 2934693-4;
	Wed, 31 Oct 2018 13:20:55 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
Received: from [131.234.87.238] (helo=mustique.hni.uni-paderborn.de)
	by mail.uni-paderborn.de with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89 nylar)
	id 1gHqQZ-0005dh-N4; Wed, 31 Oct 2018 14:20:55 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: mjc@sifive.com, sagark@eecs.berkeley.edu, palmer@sifive.com,
	kbastian@mail.uni-paderborn.de, Alistair.Francis@wdc.com
Cc: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Date: Wed, 31 Oct 2018 14:20:08 +0100
Message-Id: <20181031132029.4887-15-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.5.2775670, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2018.10.31.131216, AntiVirus-Engine: 5.53.0,
	AntiVirus-Data: 2018.10.10.5530001
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
X-Mailman-Approved-At: Wed, 31 Oct 2018 09:54:26 -0400
Subject: [Qemu-riscv] [PATCH v3 14/35] target/riscv: Convert RV32D insns to
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
X-List-Received-Date: Wed, 31 Oct 2018 13:22:12 -0000

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
---
v2 -> v3:
    - dropped TARGET_RISCV64 requirement for fclass_d
    - dropped insn argument of trans_foo functions

 target/riscv/insn32.decode              |  28 +++
 target/riscv/insn_trans/trans_rvd.inc.c | 315 ++++++++++++++++++++++++
 target/riscv/translate.c                |   1 +
 3 files changed, 344 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvd.inc.c

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 57efe0dcff..b933c349a4 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -154,3 +154,31 @@ fclass_s   1110000  00000 ..... 001 ..... 1010011 @r2
 fcvt_s_w   1101000  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_s_wu  1101000  00001 ..... ... ..... 1010011 @r2_rm
 fmv_w_x    1111000  00000 ..... 000 ..... 1010011 @r2
+
+# *** RV32D Standard Extension ***
+fld        ............   ..... 011 ..... 0000111 @i
+fsd        ....... .....  ..... 011 ..... 0100111 @s
+fmadd_d    ..... 01 ..... ..... ... ..... 1000011 @r4_rm
+fmsub_d    ..... 01 ..... ..... ... ..... 1000111 @r4_rm
+fnmsub_d   ..... 01 ..... ..... ... ..... 1001011 @r4_rm
+fnmadd_d   ..... 01 ..... ..... ... ..... 1001111 @r4_rm
+fadd_d     0000001  ..... ..... ... ..... 1010011 @r_rm
+fsub_d     0000101  ..... ..... ... ..... 1010011 @r_rm
+fmul_d     0001001  ..... ..... ... ..... 1010011 @r_rm
+fdiv_d     0001101  ..... ..... ... ..... 1010011 @r_rm
+fsqrt_d    0101101  00000 ..... ... ..... 1010011 @r2_rm
+fsgnj_d    0010001  ..... ..... 000 ..... 1010011 @r
+fsgnjn_d   0010001  ..... ..... 001 ..... 1010011 @r
+fsgnjx_d   0010001  ..... ..... 010 ..... 1010011 @r
+fmin_d     0010101  ..... ..... 000 ..... 1010011 @r
+fmax_d     0010101  ..... ..... 001 ..... 1010011 @r
+fcvt_s_d   0100000  00001 ..... ... ..... 1010011 @r2_rm
+fcvt_d_s   0100001  00000 ..... ... ..... 1010011 @r2_rm
+feq_d      1010001  ..... ..... 010 ..... 1010011 @r
+flt_d      1010001  ..... ..... 001 ..... 1010011 @r
+fle_d      1010001  ..... ..... 000 ..... 1010011 @r
+fclass_d   1110001  00000 ..... 001 ..... 1010011 @r2
+fcvt_w_d   1100001  00000 ..... ... ..... 1010011 @r2_rm
+fcvt_wu_d  1100001  00001 ..... ... ..... 1010011 @r2_rm
+fcvt_d_w   1101001  00000 ..... ... ..... 1010011 @r2_rm
+fcvt_d_wu  1101001  00001 ..... ... ..... 1010011 @r2_rm
diff --git a/target/riscv/insn_trans/trans_rvd.inc.c b/target/riscv/insn_trans/trans_rvd.inc.c
new file mode 100644
index 0000000000..a7e2335ffa
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvd.inc.c
@@ -0,0 +1,315 @@
+/*
+ * RISC-V translation routines for the RV64D Standard Extension.
+ *
+ * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
+ * Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
+ *                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+static bool trans_fld(DisasContext *ctx, arg_fld *a)
+{
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+    REQUIRE_FPU;
+    tcg_gen_addi_tl(t0, t0, a->imm);
+
+    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
+
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
+{
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+    REQUIRE_FPU;
+    tcg_gen_addi_tl(t0, t0, a->imm);
+
+    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
+
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
+{
+    REQUIRE_FPU;
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmadd_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    return true;
+}
+
+static bool trans_fmsub_d(DisasContext *ctx, arg_fmsub_d *a)
+{
+    REQUIRE_FPU;
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmsub_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    return true;
+}
+
+static bool trans_fnmsub_d(DisasContext *ctx, arg_fnmsub_d *a)
+{
+    REQUIRE_FPU;
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fnmsub_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    return true;
+}
+
+static bool trans_fnmadd_d(DisasContext *ctx, arg_fnmadd_d *a)
+{
+    REQUIRE_FPU;
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fnmadd_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    return true;
+}
+
+static bool trans_fadd_d(DisasContext *ctx, arg_fadd_d *a)
+{
+    REQUIRE_FPU;
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fadd_d(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+
+    return true;
+}
+
+static bool trans_fsub_d(DisasContext *ctx, arg_fsub_d *a)
+{
+    REQUIRE_FPU;
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsub_d(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+
+    return true;
+}
+
+static bool trans_fmul_d(DisasContext *ctx, arg_fmul_d *a)
+{
+    REQUIRE_FPU;
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmul_d(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+
+    return true;
+}
+
+static bool trans_fdiv_d(DisasContext *ctx, arg_fdiv_d *a)
+{
+    REQUIRE_FPU;
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fdiv_d(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+
+    return true;
+}
+
+static bool trans_fsqrt_d(DisasContext *ctx, arg_fsqrt_d *a)
+{
+    REQUIRE_FPU;
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsqrt_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+
+    return true;
+}
+
+static bool trans_fsgnj_d(DisasContext *ctx, arg_fsgnj_d *a)
+{
+    if (a->rs1 == a->rs2) { /* FMOV */
+        tcg_gen_mov_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
+    } else {
+        tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rs2],
+                            cpu_fpr[a->rs1], 0, 63);
+    }
+    return true;
+}
+
+static bool trans_fsgnjn_d(DisasContext *ctx, arg_fsgnjn_d *a)
+{
+    REQUIRE_FPU;
+    if (a->rs1 == a->rs2) { /* FNEG */
+        tcg_gen_xori_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], INT64_MIN);
+    } else {
+        TCGv_i64 t0 = tcg_temp_new_i64();
+        tcg_gen_not_i64(t0, cpu_fpr[a->rs2]);
+        tcg_gen_deposit_i64(cpu_fpr[a->rd], t0, cpu_fpr[a->rs1], 0, 63);
+        tcg_temp_free_i64(t0);
+    }
+    return true;
+}
+
+static bool trans_fsgnjx_d(DisasContext *ctx, arg_fsgnjx_d *a)
+{
+    REQUIRE_FPU;
+    if (a->rs1 == a->rs2) { /* FABS */
+        tcg_gen_andi_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], ~INT64_MIN);
+    } else {
+        TCGv_i64 t0 = tcg_temp_new_i64();
+        tcg_gen_andi_i64(t0, cpu_fpr[a->rs2], INT64_MIN);
+        tcg_gen_xor_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], t0);
+        tcg_temp_free_i64(t0);
+    }
+    return true;
+}
+
+static bool trans_fmin_d(DisasContext *ctx, arg_fmin_d *a)
+{
+    REQUIRE_FPU;
+
+    gen_helper_fmin_d(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+
+    return true;
+}
+
+static bool trans_fmax_d(DisasContext *ctx, arg_fmax_d *a)
+{
+    REQUIRE_FPU;
+
+    gen_helper_fmax_d(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+
+    return true;
+}
+
+static bool trans_fcvt_s_d(DisasContext *ctx, arg_fcvt_s_d *a)
+{
+    REQUIRE_FPU;
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_s_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+
+    return true;
+}
+
+static bool trans_fcvt_d_s(DisasContext *ctx, arg_fcvt_d_s *a)
+{
+    REQUIRE_FPU;
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_d_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+
+    return true;
+}
+
+static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
+{
+    REQUIRE_FPU;
+
+    TCGv t0 = tcg_temp_new();
+    gen_helper_feq_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
+{
+    REQUIRE_FPU;
+
+    TCGv t0 = tcg_temp_new();
+    gen_helper_flt_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
+{
+    REQUIRE_FPU;
+
+    TCGv t0 = tcg_temp_new();
+    gen_helper_fle_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
+{
+    REQUIRE_FPU;
+
+    TCGv t0 = tcg_temp_new();
+    gen_helper_fclass_d(t0, cpu_fpr[a->rs1]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
+{
+    REQUIRE_FPU;
+
+    TCGv t0 = tcg_temp_new();
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_w_d(t0, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
+{
+    REQUIRE_FPU;
+
+    TCGv t0 = tcg_temp_new();
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_wu_d(t0, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
+{
+    REQUIRE_FPU;
+
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, t0);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
+{
+    REQUIRE_FPU;
+
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, t0);
+    tcg_temp_free(t0);
+
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 63c281b883..0f30ccbfbf 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1505,6 +1505,7 @@ bool decode_insn32(DisasContext *ctx, uint32_t insn);
 #include "insn_trans/trans_rvm.inc.c"
 #include "insn_trans/trans_rva.inc.c"
 #include "insn_trans/trans_rvf.inc.c"
+#include "insn_trans/trans_rvd.inc.c"
 
 static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
 {
-- 
2.19.1


