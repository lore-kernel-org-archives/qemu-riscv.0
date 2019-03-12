Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3hUg-00041T-Ra
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 09:30:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hUW-0002wr-4v
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:30:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h3hGj-0008UC-Mo
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:39 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38516)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h3hGj-0008Jl-8l
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 09:16:33 -0400
Received: by mail-pg1-x52a.google.com with SMTP id m2so1818511pgl.5
	for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2019 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding:cc:from:to;
	bh=jfzTbEEEPq9XMEY86TlWBrcs93nfXDb1/tByhI2gnv4=;
	b=GP3mnIuOHrkVYxFwDMbFA6DDvADAoq8OPzwFtIp3dASgMYF3wNXqiZJFs2M2UIZtEZ
	IazY8Nr4MH++PicDy9G28BIOdxrog2zCP46ul8/qz8haeSLe3Dk1KXXUgBeCbtpMq/G8
	7eGOR22CVOQH3KyzsStlAm1G2fFXIIT555CVbKoWuF5ZC173FxGMfxATNW9RKxofNGCl
	bO4dmZoSwRQOx9/ryGWpA9vuMRD1GDWmfTaLJZp5H8Iw/3JLyKbdd0HbwOZYjR/QN12E
	wSbsqa6E3uNDlVAx8SoVUKmNUtICsT9GKsNi1atqcCX2rteBqZ5HwpgzheKDmxHltm+7
	ROSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:cc:from:to;
	bh=jfzTbEEEPq9XMEY86TlWBrcs93nfXDb1/tByhI2gnv4=;
	b=Ao+fCRIgNK3y++w3lOSmaUNwDN/FNt51kHAVBJtjz9wfPPZlch3HiQrLjY6Z1WMd23
	YZ2Pj3m8med4fPL2s/AdYMbpZNExjlW+t2YHReY4Kwew6oLqyRUu2r2G+29hA3sal941
	YLh8eVicQohb98gTnUV6uZyVQqRHDBxLgPB+PwKEhkWEMzG+Xj93C/Upr7sdmuJvqFos
	Flb4ltWzIDICikvxj1R4Nf4lK4qviYMIBFkEbangGEXlQIZwUWOG2pqm7jHBdT/u50nG
	5hsOfs35xxWBPr5/auJHG4xkvS6eTM2suH8ZlTaFgMPiyHMNDqFF+lHTQmpxO+SE9wlF
	TmeQ==
X-Gm-Message-State: APjAAAVXyQgLoJNOuKPz1jSrF6XUNO/TtdaB7+yVWIrwT2wB6aFDmoGq
	iJYBol2mcbE/4cz+aFezpvYsFg==
X-Google-Smtp-Source: APXvYqxyu/5oiCat0r5weo0FsGDIsMXZd6yLkaJyd7Z7zNxfe2rP8RO4OzDztCgfpcUJ2mIHYH2oUA==
X-Received: by 2002:a62:449b:: with SMTP id m27mr39090053pfi.79.1552396575028; 
	Tue, 12 Mar 2019 06:16:15 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-120c-5816-f057-fc2f-b780.dynamic-ip6.hinet.net.
	[2001:b011:7001:120c:5816:f057:fc2f:b780])
	by smtp.gmail.com with ESMTPSA id
	195sm25733849pfc.50.2019.03.12.06.16.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 06:16:14 -0700 (PDT)
Date: Tue, 12 Mar 2019 06:15:08 -0700
Message-Id: <20190312131526.14710-12-palmer@sifive.com>
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
X-Received-From: 2607:f8b0:4864:20::52a
Subject: [Qemu-riscv] [PULL 11/29] target/riscv: Convert RV32F insns to
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
X-List-Received-Date: Tue, 12 Mar 2019 13:30:55 -0000

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/insn32.decode              |  35 +++
 target/riscv/insn_trans/trans_rvf.inc.c | 379 ++++++++++++++++++++++++
 target/riscv/translate.c                |   1 +
 3 files changed, 415 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvf.inc.c

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 00b9e2d9a508..e40836bf032f 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -17,12 +17,14 @@
 # this program.  If not, see <http://www.gnu.org/licenses/>.
 
 # Fields:
+%rs3       27:5
 %rs2       20:5
 %rs1       15:5
 %rd        7:5
 
 %sh10    20:10
 %csr    20:12
+%rm     12:3
 
 # immediates:
 %imm_i    20:s12
@@ -50,6 +52,11 @@
 @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
 @atom_st ..... aq:1 rl:1 ..... ........ ..... ....... &atomic %rs2      %rs1 %rd
 
+@r4_rm   ..... ..  ..... ..... ... ..... ....... %rs3 %rs2 %rs1 %rm %rd
+@r_rm    .......   ..... ..... ... ..... ....... %rs2 %rs1 %rm %rd
+@r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
+@r2      .......   ..... ..... ... ..... ....... %rs1 %rd
+
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
 auipc    ....................       ..... 0010111 @u
@@ -119,3 +126,31 @@ amomin_w   10000 . . ..... ..... 010 ..... 0101111 @atom_st
 amomax_w   10100 . . ..... ..... 010 ..... 0101111 @atom_st
 amominu_w  11000 . . ..... ..... 010 ..... 0101111 @atom_st
 amomaxu_w  11100 . . ..... ..... 010 ..... 0101111 @atom_st
+
+# *** RV32F Standard Extension ***
+flw        ............   ..... 010 ..... 0000111 @i
+fsw        .......  ..... ..... 010 ..... 0100111 @s
+fmadd_s    ..... 00 ..... ..... ... ..... 1000011 @r4_rm
+fmsub_s    ..... 00 ..... ..... ... ..... 1000111 @r4_rm
+fnmsub_s   ..... 00 ..... ..... ... ..... 1001011 @r4_rm
+fnmadd_s   ..... 00 ..... ..... ... ..... 1001111 @r4_rm
+fadd_s     0000000  ..... ..... ... ..... 1010011 @r_rm
+fsub_s     0000100  ..... ..... ... ..... 1010011 @r_rm
+fmul_s     0001000  ..... ..... ... ..... 1010011 @r_rm
+fdiv_s     0001100  ..... ..... ... ..... 1010011 @r_rm
+fsqrt_s    0101100  00000 ..... ... ..... 1010011 @r2_rm
+fsgnj_s    0010000  ..... ..... 000 ..... 1010011 @r
+fsgnjn_s   0010000  ..... ..... 001 ..... 1010011 @r
+fsgnjx_s   0010000  ..... ..... 010 ..... 1010011 @r
+fmin_s     0010100  ..... ..... 000 ..... 1010011 @r
+fmax_s     0010100  ..... ..... 001 ..... 1010011 @r
+fcvt_w_s   1100000  00000 ..... ... ..... 1010011 @r2_rm
+fcvt_wu_s  1100000  00001 ..... ... ..... 1010011 @r2_rm
+fmv_x_w    1110000  00000 ..... 000 ..... 1010011 @r2
+feq_s      1010000  ..... ..... 010 ..... 1010011 @r
+flt_s      1010000  ..... ..... 001 ..... 1010011 @r
+fle_s      1010000  ..... ..... 000 ..... 1010011 @r
+fclass_s   1110000  00000 ..... 001 ..... 1010011 @r2
+fcvt_s_w   1101000  00000 ..... ... ..... 1010011 @r2_rm
+fcvt_s_wu  1101000  00001 ..... ... ..... 1010011 @r2_rm
+fmv_w_x    1111000  00000 ..... 000 ..... 1010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvf.inc.c b/target/riscv/insn_trans/trans_rvf.inc.c
new file mode 100644
index 000000000000..0f837903491b
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvf.inc.c
@@ -0,0 +1,379 @@
+/*
+ * RISC-V translation routines for the RV64F Standard Extension.
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
+#define REQUIRE_FPU do {\
+    if (ctx->mstatus_fs == 0) \
+        return false;                       \
+} while (0)
+
+static bool trans_flw(DisasContext *ctx, arg_flw *a)
+{
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    tcg_gen_addi_tl(t0, t0, a->imm);
+
+    tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
+    /* RISC-V requires NaN-boxing of narrower width floating point values */
+    tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd], 0xffffffff00000000ULL);
+
+    tcg_temp_free(t0);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
+{
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    tcg_gen_addi_tl(t0, t0, a->imm);
+
+    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUL);
+
+    tcg_temp_free(t0);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmadd_s(DisasContext *ctx, arg_fmadd_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmadd_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmsub_s(DisasContext *ctx, arg_fmsub_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmsub_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fnmsub_s(DisasContext *ctx, arg_fnmsub_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fnmsub_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fnmadd_s(DisasContext *ctx, arg_fnmadd_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fnmadd_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fadd_s(DisasContext *ctx, arg_fadd_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fadd_s(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsub_s(DisasContext *ctx, arg_fsub_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsub_s(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmul_s(DisasContext *ctx, arg_fmul_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmul_s(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fdiv_s(DisasContext *ctx, arg_fdiv_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fdiv_s(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsqrt_s(DisasContext *ctx, arg_fsqrt_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsqrt_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsgnj_s(DisasContext *ctx, arg_fsgnj_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    if (a->rs1 == a->rs2) { /* FMOV */
+        tcg_gen_mov_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
+    } else { /* FSGNJ */
+        tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rs2], cpu_fpr[a->rs1],
+                            0, 31);
+    }
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsgnjn_s(DisasContext *ctx, arg_fsgnjn_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    if (a->rs1 == a->rs2) { /* FNEG */
+        tcg_gen_xori_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], INT32_MIN);
+    } else {
+        TCGv_i64 t0 = tcg_temp_new_i64();
+        tcg_gen_not_i64(t0, cpu_fpr[a->rs2]);
+        tcg_gen_deposit_i64(cpu_fpr[a->rd], t0, cpu_fpr[a->rs1], 0, 31);
+        tcg_temp_free_i64(t0);
+    }
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsgnjx_s(DisasContext *ctx, arg_fsgnjx_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    if (a->rs1 == a->rs2) { /* FABS */
+        tcg_gen_andi_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], ~INT32_MIN);
+    } else {
+        TCGv_i64 t0 = tcg_temp_new_i64();
+        tcg_gen_andi_i64(t0, cpu_fpr[a->rs2], INT32_MIN);
+        tcg_gen_xor_i64(cpu_fpr[a->rd], cpu_fpr[a->rs1], t0);
+        tcg_temp_free_i64(t0);
+    }
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmin_s(DisasContext *ctx, arg_fmin_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    gen_helper_fmin_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                      cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmax_s(DisasContext *ctx, arg_fmax_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    gen_helper_fmax_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                      cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fcvt_w_s(DisasContext *ctx, arg_fcvt_w_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    TCGv t0 = tcg_temp_new();
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_w_s(t0, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_fcvt_wu_s(DisasContext *ctx, arg_fcvt_wu_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    TCGv t0 = tcg_temp_new();
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_wu_s(t0, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
+{
+    /* NOTE: This was FMV.X.S in an earlier version of the ISA spec! */
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    TCGv t0 = tcg_temp_new();
+
+#if defined(TARGET_RISCV64)
+    tcg_gen_ext32s_tl(t0, cpu_fpr[a->rs1]);
+#else
+    tcg_gen_extrl_i64_i32(t0, cpu_fpr[a->rs1]);
+#endif
+
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_feq_s(DisasContext *ctx, arg_feq_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    TCGv t0 = tcg_temp_new();
+    gen_helper_feq_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_flt_s(DisasContext *ctx, arg_flt_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    TCGv t0 = tcg_temp_new();
+    gen_helper_flt_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_fle_s(DisasContext *ctx, arg_fle_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    TCGv t0 = tcg_temp_new();
+    gen_helper_fle_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool trans_fclass_s(DisasContext *ctx, arg_fclass_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    TCGv t0 = tcg_temp_new();
+
+    gen_helper_fclass_s(t0, cpu_fpr[a->rs1]);
+
+    gen_set_gpr(a->rd, t0);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_fcvt_s_w(DisasContext *ctx, arg_fcvt_s_w *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, t0);
+
+    mark_fs_dirty(ctx);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_fcvt_s_wu(DisasContext *ctx, arg_fcvt_s_wu *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, t0);
+
+    mark_fs_dirty(ctx);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
+{
+    /* NOTE: This was FMV.S.X in an earlier version of the ISA spec! */
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+
+    TCGv t0 = tcg_temp_new();
+    gen_get_gpr(t0, a->rs1);
+
+#if defined(TARGET_RISCV64)
+    tcg_gen_mov_i64(cpu_fpr[a->rd], t0);
+#else
+    tcg_gen_extu_i32_i64(cpu_fpr[a->rd], t0);
+#endif
+
+    mark_fs_dirty(ctx);
+    tcg_temp_free(t0);
+
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c2791459993e..b9f78f5a1f8f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1717,6 +1717,7 @@ bool decode_insn32(DisasContext *ctx, uint32_t insn);
 #include "insn_trans/trans_rvi.inc.c"
 #include "insn_trans/trans_rvm.inc.c"
 #include "insn_trans/trans_rva.inc.c"
+#include "insn_trans/trans_rvf.inc.c"
 
 static void decode_RV32_64G(DisasContext *ctx)
 {
-- 
2.19.2


