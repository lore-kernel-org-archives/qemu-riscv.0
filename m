Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzq3p-0003y6-NF
	for mharc-qemu-riscv@gnu.org; Fri, 01 Mar 2019 16:51:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3j-0003oC-OK
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gzq3a-0003R7-6I
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:09 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33773)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gzq3L-0002FD-NE
	for qemu-riscv@nongnu.org; Fri, 01 Mar 2019 16:51:00 -0500
Received: by mail-pl1-x631.google.com with SMTP id y10so12118001plp.0
	for <qemu-riscv@nongnu.org>; Fri, 01 Mar 2019 13:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:cc:from:to;
	bh=djaFw5O4JqP2RWnZNSXisC8Ij0PbBa2du4o49mErjV4=;
	b=iJBigiTMgcjzRLqfKaoVxTM45o0tuZWrqGtz47p5nxAjHqIYVdGzs22tr81mAJrDA4
	gQD713xwRuHV9E1NXOf8gqvsPeRC4JttGtqVE0SKAp0U66CtAj7Wpsx8vzG/w5y6M8ZX
	cqYJaBXxeWEh28RJyEuMMR4jkPH5hW2woXJQiXsVhnykGcLQv5ZRKgpLDisI/6r8DC+0
	g0tp2kK3lWCysLuYhIgwt5NUFU1m/Ppw1PXnGdrEvsqUm2HwNO5P2hEMGxBvhwCJbMz9
	fmid0v7sU+XDgOmAZS5jE0DthLUVZo8tPD9JCLzewcU1Wbw1TI02b1979Ul4PXoXT0WD
	TSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:cc:from:to;
	bh=djaFw5O4JqP2RWnZNSXisC8Ij0PbBa2du4o49mErjV4=;
	b=gdDAxt12rSRS5EYy4Rq4V1PE7b8uWUKUQHPBLETiZT02EcG7VEZTU5AwHGCtLyBbYj
	xbBjf/lKjanEIdpE+NTk0vERbCq1bMNP36F8/YWBJadXffwlcoa0dGJxVFmmrSKafxTL
	xHrmXQdgmMiwNNfZ9aboSU5GZEk/QmRHA76H/7XIG4B0kf79MUnzCeAuiHoxoq4e7Ut0
	nCui7aXvFOFry/quAGBthBZBWE1rD1npmwwLZ4BenFN+fefyfkFaDp+JRUwTcuCxrA2O
	s6fMoZbS7JG1mCUWUTUjTbQleVxEsNlvACsV13itZEJkyyI/wSvG3k4k1C5K1m1jqfd3
	fUHA==
X-Gm-Message-State: APjAAAVguDzX3fRVmI/xBPGUHCjNWHylkSC3igG8dXnvrj+6sgsA4/2c
	ntRqbEKXQWYA/BD6HCoDo0I4aQ==
X-Google-Smtp-Source: APXvYqzQNH8tUl2vrVNJGLRIN7ymeOsA/j1cll60/5oa4arM+4EfHRXSC9Ig2eAogFB/ZYtp4L5J2w==
X-Received: by 2002:a17:902:b591:: with SMTP id
	a17mr7943061pls.228.1551477018476; 
	Fri, 01 Mar 2019 13:50:18 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	h13sm30376512pfn.114.2019.03.01.13.50.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 13:50:17 -0800 (PST)
Date: Fri,  1 Mar 2019 13:49:24 -0800
Message-Id: <20190301214945.4353-14-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::631
Subject: [Qemu-riscv] [PULL 13/34] target/riscv: Convert RV32D insns to
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
X-List-Received-Date: Fri, 01 Mar 2019 21:51:15 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn32.decode              |  28 ++
 target/riscv/insn_trans/trans_rvd.inc.c | 360 ++++++++++++++++++++++++
 target/riscv/translate.c                |   1 +
 3 files changed, 389 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvd.inc.c

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e40836bf032f..e64b2b5e3458 100644
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
index 000000000000..98fc1cdc5a20
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvd.inc.c
@@ -0,0 +1,360 @@
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
+    REQUIRE_EXT(ctx, RVD);
+    tcg_gen_addi_tl(t0, t0, a->imm);
+
+    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
+
+    mark_fs_dirty(ctx);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
+{
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    tcg_gen_addi_tl(t0, t0, a->imm);
+
+    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
+
+    mark_fs_dirty(ctx);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_fmadd_d(DisasContext *ctx, arg_fmadd_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmadd_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmsub_d(DisasContext *ctx, arg_fmsub_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmsub_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fnmsub_d(DisasContext *ctx, arg_fnmsub_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fnmsub_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fnmadd_d(DisasContext *ctx, arg_fnmadd_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fnmadd_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fadd_d(DisasContext *ctx, arg_fadd_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fadd_d(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsub_d(DisasContext *ctx, arg_fsub_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsub_d(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmul_d(DisasContext *ctx, arg_fmul_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmul_d(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fdiv_d(DisasContext *ctx, arg_fdiv_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fdiv_d(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsqrt_d(DisasContext *ctx, arg_fsqrt_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsqrt_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+
+    mark_fs_dirty(ctx);
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
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsgnjn_d(DisasContext *ctx, arg_fsgnjn_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    if (a->rs1 == a->rs2) { /* FNEG */
+        tcg_gen_xori_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], INT64_MIN);
+    } else {
+        TCGv_i64 t0 = tcg_temp_new_i64();
+        tcg_gen_not_i64(t0, cpu_fpr[a->rs2]);
+        tcg_gen_deposit_i64(cpu_fpr[a->rd], t0, cpu_fpr[a->rs1], 0, 63);
+        tcg_temp_free_i64(t0);
+    }
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsgnjx_d(DisasContext *ctx, arg_fsgnjx_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    if (a->rs1 == a->rs2) { /* FABS */
+        tcg_gen_andi_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], ~INT64_MIN);
+    } else {
+        TCGv_i64 t0 = tcg_temp_new_i64();
+        tcg_gen_andi_i64(t0, cpu_fpr[a->rs2], INT64_MIN);
+        tcg_gen_xor_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], t0);
+        tcg_temp_free_i64(t0);
+    }
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmin_d(DisasContext *ctx, arg_fmin_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    gen_helper_fmin_d(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmax_d(DisasContext *ctx, arg_fmax_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    gen_helper_fmax_d(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fcvt_s_d(DisasContext *ctx, arg_fcvt_s_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_s_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fcvt_d_s(DisasContext *ctx, arg_fcvt_d_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_d_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
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
+    REQUIRE_EXT(ctx, RVD);
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
+    REQUIRE_EXT(ctx, RVD);
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
+    REQUIRE_EXT(ctx, RVD);
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
+    REQUIRE_EXT(ctx, RVD);
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
+    REQUIRE_EXT(ctx, RVD);
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
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, t0);
+    tcg_temp_free(t0);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, t0);
+    tcg_temp_free(t0);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b9f78f5a1f8f..c201985ef37b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1718,6 +1718,7 @@ bool decode_insn32(DisasContext *ctx, uint32_t insn);
 #include "insn_trans/trans_rvm.inc.c"
 #include "insn_trans/trans_rva.inc.c"
 #include "insn_trans/trans_rvf.inc.c"
+#include "insn_trans/trans_rvd.inc.c"
 
 static void decode_RV32_64G(DisasContext *ctx)
 {
-- 
2.18.1


