Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8mLg-00088S-4W
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 13:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLN-0007z9-63
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:29 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLK-0003Hd-V5
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:28 -0500
Received: by mail-ed1-x534.google.com with SMTP id c17so7969089edj.13
 for <qemu-riscv@nongnu.org>; Fri, 23 Dec 2022 10:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sEfRbnTsJjGISz2l2MPKbXoCEk8ENCLODXUSfe3I2HY=;
 b=Fph4O/q9Rrmhfr/tBRJM1mV0oYysVduzI7vC5j5+boiy6HEeGOYyrExEgEcqq2LTO2
 +a9wsW6vKz+zbpQ9ls+t/SEgdnsclg74EkhHZ2PuVBln3dQ7VmPmy/62Jl6NgGJS8Xcj
 cUypShPfFfaVP9So7RptZVTYcvTGtF6nMZ3gejKOaOHgO8Cc59+tCL1OI3Z8bd8zagqI
 py3DwGTre4W+o05RvTDhl8Stg8kD5+xSKZfd1I2LL5s3Mq8ozWE1eJdGwCI1K6a0LHxp
 eolwEpj7BQOjs7waMHgdLse2hD1ZSepylV1M/68nlo+VRAgNY4v1C+UMdNaqp7GrGyw/
 jzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sEfRbnTsJjGISz2l2MPKbXoCEk8ENCLODXUSfe3I2HY=;
 b=Bh/S6V+/hDkPvKQdRPqVk9n0b4g9+mkE6Q0ke8Q7nhDniRASTjzCROb+LJKFA11scS
 sM1Bw/20Oyjq/jz+XXlCN55BvAu2SvkBpuXBbvkU1DTfo/+rzlIpsWJ9Kgz9YS4+DDkQ
 dW/LuWCH3bdetpEHRQXd+YOXrDMiHvSvPjETFCUeJ2ngCxaBLueHjmWXfIa3LsNffD6U
 Mg2r7HbjWPponJZ5Y6KQRxazAilReybipgflc+MiiJzbqUfz50xi2HfSIOYYRejVTzsr
 Y4gt7v+win0ZQtjqkKrrwCVBcIaisseYSq4B9/U7P7Er0MlaT69jMl8LvFIxqQLbLSaW
 tyug==
X-Gm-Message-State: AFqh2krxefMj3Q/Ktu+vZQFLwWKDF/5cw5ZCEvU8xkc8xgc/Sbc48RKC
 bam0PssiEEeOFUfBWE8CMh5GB2H2CsUy2s6L
X-Google-Smtp-Source: AMrXdXswMvWz+FyfyCkFs2N97HOQtRDXL2VFAev96eb4NgNAJxLPdyIpOHAGKF2/zpWTi2xCtT+8wA==
X-Received: by 2002:a50:fd05:0:b0:473:6a8d:945d with SMTP id
 i5-20020a50fd05000000b004736a8d945dmr9065469eds.4.1671818424299; 
 Fri, 23 Dec 2022 10:00:24 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056402154e00b0047d4685878esm1734937edx.51.2022.12.23.10.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 10:00:23 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v2 03/15] RISC-V: Adding XTheadBa ISA extension
Date: Fri, 23 Dec 2022 19:00:03 +0100
Message-Id: <20221223180016.2068508-4-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 23 Dec 2022 18:00:30 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the XTheadBa ISA extension.
The patch uses the T-Head specific decoder and translation.

Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Split XtheadB* extension into individual commits
- Use single decoder for XThead extensions

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |  2 ++
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 39 ++++++++++++++++++++++
 target/riscv/translate.c                   |  3 +-
 target/riscv/xthead.decode                 | 22 ++++++++++++
 5 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a848836d2e..809b6eb4ed 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -108,6 +108,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(xtheadba, true, PRIV_VERSION_1_11_0, ext_xtheadba),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
@@ -1062,6 +1063,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
 
     /* Vendor-specific custom extensions */
+    DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4d3da2acfa..ec2588a0f0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -465,6 +465,7 @@ struct RISCVCPUConfig {
     uint64_t mimpid;
 
     /* Vendor-specific custom extensions */
+    bool ext_xtheadba;
     bool ext_xtheadcmo;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 6009d61c81..79e1f5bde9 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -16,6 +16,12 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#define REQUIRE_XTHEADBA(ctx) do {               \
+    if (!ctx->cfg_ptr->ext_xtheadba) {           \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADCMO(ctx) do {              \
     if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
         return false;                            \
@@ -28,6 +34,39 @@
     }                                            \
 } while (0)
 
+/* XTheadBa */
+
+/*
+ * th.addsl is similar to sh[123]add (from Zba), but not an
+ * alternative encoding: while sh[123] applies the shift to rs1,
+ * th.addsl shifts rs2.
+ */
+
+#define GEN_TH_ADDSL(SHAMT)                                     \
+static void gen_th_addsl##SHAMT(TCGv ret, TCGv arg1, TCGv arg2) \
+{                                                               \
+    TCGv t = tcg_temp_new();                                    \
+    tcg_gen_shli_tl(t, arg2, SHAMT);                            \
+    tcg_gen_add_tl(ret, t, arg1);                               \
+    tcg_temp_free(t);                                           \
+}
+
+GEN_TH_ADDSL(1)
+GEN_TH_ADDSL(2)
+GEN_TH_ADDSL(3)
+
+#define GEN_TRANS_TH_ADDSL(SHAMT)                                       \
+static bool trans_th_addsl##SHAMT(DisasContext *ctx,                    \
+                                  arg_th_addsl##SHAMT * a)              \
+{                                                                       \
+    REQUIRE_XTHEADBA(ctx);                                              \
+    return gen_arith(ctx, a, EXT_NONE, gen_th_addsl##SHAMT, NULL);      \
+}
+
+GEN_TRANS_TH_ADDSL(1)
+GEN_TRANS_TH_ADDSL(2)
+GEN_TRANS_TH_ADDSL(3)
+
 /* XTheadCmo */
 
 static inline int priv_level(DisasContext *ctx)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c40617662a..7b35f1d71b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -127,7 +127,8 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
 
 static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
 {
-    return ctx->cfg_ptr->ext_xtheadcmo || ctx->cfg_ptr->ext_xtheadsync;
+    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadcmo ||
+           ctx->cfg_ptr->ext_xtheadsync;
 }
 
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 1d86f3a012..b149f13018 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -2,6 +2,7 @@
 # Translation routines for the instructions of the XThead* ISA extensions
 #
 # Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.eu
+#                    Dr. Philipp Tomsich, philipp.tomsich@vrull.eu
 #
 # SPDX-License-Identifier: LGPL-2.1-or-later
 #
@@ -9,12 +10,33 @@
 #   https://github.com/T-head-Semi/thead-extension-spec/releases/latest
 
 # Fields:
+%rd        7:5
 %rs1       15:5
 %rs2       20:5
 
+# Argument sets
+&r         rd rs1 rs2                               !extern
+
 # Formats
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
 @rs2_s      ....... ..... ..... ... ..... .......   %rs2 %rs1
+@r          ....... ..... .....  ... ..... .......  &r %rs2 %rs1 %rd
+
+# XTheadBa
+# Instead of defining a new encoding, we simply use the decoder to
+# extract the imm[0:1] field and dispatch to separate translation
+# functions (mirroring the `sh[123]add` instructions from Zba and
+# the regular RVI `add` instruction.
+#
+# The only difference between sh[123]add and addsl is that the shift
+# is applied to rs1 (for addsl) instead of rs2 (for sh[123]add).
+#
+# Note that shift-by-0 is a valid operation according to the manual.
+# This will be equivalent to a regular add.
+add              0000000 ..... ..... 001 ..... 0001011 @r
+th_addsl1        0000001 ..... ..... 001 ..... 0001011 @r
+th_addsl2        0000010 ..... ..... 001 ..... 0001011 @r
+th_addsl3        0000011 ..... ..... 001 ..... 0001011 @r
 
 # XTheadCmo
 th_dcache_call   0000000 00001 00000 000 00000 0001011
-- 
2.38.1


