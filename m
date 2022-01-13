Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n86ao-0003xP-UN
	for mharc-qemu-riscv@gnu.org; Thu, 13 Jan 2022 15:21:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n86aj-0003r9-Rx
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 15:21:02 -0500
Received: from [2a00:1450:4864:20::12f] (port=40743
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n86af-0004JY-Pt
 for qemu-riscv@nongnu.org; Thu, 13 Jan 2022 15:21:01 -0500
Received: by mail-lf1-x12f.google.com with SMTP id s30so23564739lfo.7
 for <qemu-riscv@nongnu.org>; Thu, 13 Jan 2022 12:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oQR/XB8xlMCe6WSfiop7OtVpoj5mhOGrn883baEJoJk=;
 b=OCNQPhv30wP5f5OkOCh1Ff3rV897kgaJrHUpSZFwv0QYRPuFJaRFR/LtM95QPJqppd
 uI3JMnmCZKCwXdynKLiJwcPKY4+X1xH45040ZZFQFtwgkNdqnwYJVE6RPZOdaAlejtdX
 ZL04fnTNzohtwe5czvwP+q6rGaCcaFHkQNyASGCykOMCvYrVTFnoi00qMO5pBQErhRBW
 LCbMZVdmRj5LpPo09Sv0tTgjR+6nzj9kEzNcn0T3DEu3m8nLgfQeEZ+TJsxaktxIU0cQ
 Xq/oXCQaTPPoJXEPD1XAI+rWYcUe8XKveHPof14/s0XkOs5tBpfcV7UA72zBIC4J4nFc
 lv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oQR/XB8xlMCe6WSfiop7OtVpoj5mhOGrn883baEJoJk=;
 b=JoYebQH/15eOTL/zf1HQBnrSYXBNeKTknSX3IwxJvddzHU2elU7ntN34jN2W+96mTl
 SsQCa2xteKrkXeuE3ClzLqUjq6i8QxU/u0GI0Wrc1MhI9k5SGjqwFK4lns0usWjei0mP
 MY+aYgmb6lw4YWHXBRmrUHLti4pb/TI7lsu6seQ+OkfIvW52zm7TZT5UGQxJJrhfn2zd
 vMtyETPXBRTRkXm8qRnebzisTB3vPOsrhPqt/OAwfDPPAMAW5lE0s/RjCTygm2evMPsb
 3Z5qAVQKsTCjao+vJUYoyVGFL0C/fIOZ6eDOMe/LqDWVpca88yQL3GdfY2LhjteMzb15
 ITWg==
X-Gm-Message-State: AOAM530je/EPhTKxjbl86WqhWQ50fj+LSHaA+iAjEgDRdlBLgNk7AVLq
 Htv2Q1qWDFVOGRYfxjm2kJrnVw==
X-Google-Smtp-Source: ABdhPJyJf85A/0G+iOqaXXXRKdzLPwL9i3p17crDVo4oWg+mHcMJCFNcSMRkPWkbFoE/oREXazePBg==
X-Received: by 2002:a19:ae1a:: with SMTP id f26mr4461481lfc.270.1642105245514; 
 Thu, 13 Jan 2022 12:20:45 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id h23sm371872ljk.9.2022.01.13.12.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 12:20:44 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 2/2] target/riscv: Add XVentanaCondOps custom extension
Date: Thu, 13 Jan 2022 21:20:33 +0100
Message-Id: <20220113202033.3320854-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
References: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Jan 2022 20:21:03 -0000

This adds the decoder and translation for the XVentanaCondOps custom
extension (vendor-defined by Ventana Micro Systems), which is
documented at https://github.com/ventanamicro/ventana-custom-extensions/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf

This commit then also adds a guard-function (has_XVentanaCondOps_p)
and the decoder function to the table of decoders, enabling the
support for the XVentanaCondOps extension.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

---

Changes in v2:
- Split off decode table into XVentanaCondOps.decode
- Wire up XVentanaCondOps in the decoder-table

 target/riscv/XVentanaCondOps.decode           | 25 ++++++++++++
 target/riscv/cpu.c                            |  3 ++
 target/riscv/cpu.h                            |  3 ++
 .../insn_trans/trans_xventanacondops.inc      | 39 +++++++++++++++++++
 target/riscv/meson.build                      |  1 +
 target/riscv/translate.c                      | 13 +++++++
 6 files changed, 84 insertions(+)
 create mode 100644 target/riscv/XVentanaCondOps.decode
 create mode 100644 target/riscv/insn_trans/trans_xventanacondops.inc

diff --git a/target/riscv/XVentanaCondOps.decode b/target/riscv/XVentanaCondOps.decode
new file mode 100644
index 0000000000..5aef7c3d72
--- /dev/null
+++ b/target/riscv/XVentanaCondOps.decode
@@ -0,0 +1,25 @@
+#
+# RISC-V translation routines for the XVentanaCondOps extension
+#
+# Copyright (c) 2022 Dr. Philipp Tomsich, philipp.tomsich@vrull.eu
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Reference: VTx-family custom instructions
+#            Custom ISA extensions for Ventana Micro Systems RISC-V cores
+#            (https://github.com/ventanamicro/ventana-custom-extensions/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf)
+
+# Fields
+%rs2  20:5
+%rs1  15:5
+%rd    7:5
+
+# Argument sets
+&r    rd rs1 rs2  !extern
+
+# Formats
+@r         .......  ..... ..... ... ..... ....... &r                %rs2 %rs1 %rd
+
+# *** RV64 Custom-3 Extension ***
+vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r
+vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9bc25d3055..fc8ab1dc2b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -673,6 +673,9 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
 
+    /* Vendor-specific custom extensions */
+    DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
+
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4d63086765..ffde94fd1a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -330,6 +330,9 @@ struct RISCVCPU {
         bool ext_zfh;
         bool ext_zfhmin;
 
+        /* Vendor-specific custom extensions */
+        bool ext_XVentanaCondOps;
+
         char *priv_spec;
         char *user_spec;
         char *bext_spec;
diff --git a/target/riscv/insn_trans/trans_xventanacondops.inc b/target/riscv/insn_trans/trans_xventanacondops.inc
new file mode 100644
index 0000000000..b8a5d031b5
--- /dev/null
+++ b/target/riscv/insn_trans/trans_xventanacondops.inc
@@ -0,0 +1,39 @@
+/*
+ * RISC-V translation routines for the XVentanaCondOps extension.
+ *
+ * Copyright (c) 2021-2022 VRULL GmbH.
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
+static bool gen_condmask(DisasContext *ctx, arg_r *a, TCGCond cond)
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, ctx->zero);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_vt_maskc(DisasContext *ctx, arg_r *a)
+{
+    return gen_condmask(ctx, a, TCG_COND_NE);
+}
+
+static bool trans_vt_maskcn(DisasContext *ctx, arg_r *a)
+{
+    return gen_condmask(ctx, a, TCG_COND_EQ);
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index a32158da93..1f3a15398b 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -4,6 +4,7 @@ dir = meson.current_source_dir()
 gen = [
   decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
   decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
+  decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
 ]
 
 riscv_ss = ss.source_set()
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2cbf9cbb6f..efdf8a7bdb 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -122,6 +122,15 @@ static inline bool always_true_p(CPURISCVState *env  __attribute__((__unused__))
     return true;
 }
 
+#define MATERIALISE_EXT_PREDICATE(ext)  \
+    static inline bool has_ ## ext ## _p(CPURISCVState *env, \
+                                         DisasContext *ctx  __attribute__((__unused__)))  \
+    { \
+        return RISCV_CPU(ctx->cs)->cfg.ext_ ## ext ; \
+    }
+
+MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
+
 #ifdef TARGET_RISCV32
 #define get_xl(ctx)    MXL_RV32
 #elif defined(CONFIG_USER_ONLY)
@@ -844,9 +853,12 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
+#include "insn_trans/trans_xventanacondops.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
+/* Include decoders for factored-out extensions */
+#include "decode-XVentanaCondOps.c.inc"
 
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 {
@@ -862,6 +874,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         bool (*decode_func)(DisasContext *, uint32_t);
     } decoders[] = {
         { always_true_p,  decode_insn32 },
+        { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
     };
 
     /* Check for compressed insn */
-- 
2.33.1


