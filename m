Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUg-00040b-83
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:30:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUZ-00031K-9Z
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:30:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hGf-0008R0-Nh
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:32 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:40438)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hGd-0008M8-3L
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:28 -0400
Received: by mail-pg1-x532.google.com with SMTP id u9so1809995pgo.7
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=+mXClgU9n/dt2Bnj4DCd9ZQEZRJNY7sRCkHa+e6ce3o=;
	b=EQz8m9qXVDceGAK67pICmr/8/S+jCS+PWC9FERcqRQYO9qkrdE8skRGRyP0BBhJJLf
	lGmeyw9NPVkGuYcimPMHBW2X3dAnBVzNw0us0YhYXEEGwkVReOQMZS6WicFuBiUm6Mh3
	WOrTEYQVru5C+PiE78s/k8hdTfm74srcrYxX48X9YQzqOByH7YDDMGfJesFpiQwko0uu
	YiR3Vd33j9oniv1F+f9wGoVD7rxo84u0fRuCLUvwbHm2PnApjtrNM3tFsOruwbY1hBVA
	KFTmzG2cMXPH5vmDlJcXLsA0bWavoq/aEMGuGac9rDrgXR7ujIvEmNqc02w4Zkjv3mWG
	b21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=+mXClgU9n/dt2Bnj4DCd9ZQEZRJNY7sRCkHa+e6ce3o=;
	b=RX+3qjB61csNKqRkMU9zuy/T48fTbemJHnR3kw0KlEJAFLuub7JgSQDOhZpM3AIqvc
	QwpFZuPHRDtEV3wHmruvxZlaahKwBgI3gILYT1xF0oTtdQ4pVc2qHUUBK5nPZf6yIqeP
	GxgqbqStrMDitYzGmnZ44RW+cVHfedLrl9HfgaKv+s1ojTAafHaWRfV191uK4V/ELCE3
	bjqT5y71Msn7Ogvp7D6Oqg07lgKhl/Et4pMy+8D8ZEO5Sp+g/6F/6Se5dkJM3kSD9To/
	Unq7s47B/2ZNQ99xaf8GE5u4VV91viqYmpMXkus41gRMIzK98CtE7G0F75dQFtzP9lX+
	cMLQ==
X-Gm-Message-State: APjAAAWp9lOeeE70wZfAvdGN3MsDnlO3DNQJWsSMI3CyWCWWim3z5Xwc
	KHqx5pZrnFRdS6YWLoRDdWaZ7w==
X-Google-Smtp-Source: APXvYqyj/tZ5fUP1Gpq0lcuijYN9Fw7pY/wEz97FzANN6VJf9RKEWg3RWXyvR+b07aFr38yHEr8EjA==
X-Received: by 2002:a65:6098:: with SMTP id t24mr27090690pgu.57.1552396580776; 
	Tue, 12 Mar 2019 06:16:20 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	x23sm31444128pfe.0.2019.03.12.06.16.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:16:20 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:10 -0700
Message-Id: <20190312131526.14710-14-palmer@sifive.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190312131526.14710-1-palmer@sifive.com>
References: <20190312131526.14710-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peer Adelt <peer.adelt@hni.uni-paderborn.de>, 
	Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::532
Subject: [Qemu-riscv] [PULL 13/29] target/riscv: Convert RV32D insns to
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
X-List-Received-Date: Tue, 12 Mar 2019 13:30:53 -0000

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
2.19.2


