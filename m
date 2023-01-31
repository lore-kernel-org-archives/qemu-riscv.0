Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMuy4-0007hZ-1A
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 13:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxU-0007Gh-FN
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 13:02:22 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMuxS-0000o8-Cv
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 13:02:16 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bk16so15005682wrb.11
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 10:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mM0RV3PefqaiI7iAU8sksvWno5KVWr8UtNXABgTCGU=;
 b=rj4brqTqzZa7ZK8n8JlEcd7SIjCYUIR6Nj2FsgCOyrwB8FZz+J7TOatzcUTVrpgHtA
 TAt5V506E9PkzkYC83TcS7zOR9VbDX5kY7WsVqrJ7nIj1DuwChKe/Ldev46CFZHRtM5/
 IaeCB8hlfd6gtyxwlNDjW0WbQ1rMtHSXNeo9/EF2gXbqwaYsaYQwFNZbi+LL3jLDA45B
 sPpn21SCBl9ZId36lF/jS5fImbjp0pP6P8JKAf+kwQLz+VpLW5EkSQGVNDGj5/lKWmpy
 xIr2chBItqkNM4OPZz2QVN3bemUCRo1onZAC/fc8Ytr2Vs3HW/XNUlCNYC7LrmunaZ62
 HEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/mM0RV3PefqaiI7iAU8sksvWno5KVWr8UtNXABgTCGU=;
 b=OyBWZhAQ17WkHvBaILdPC6+40waVO4CLON2WByTllvqiTFEZ5uFEtIYct11yEPSZgG
 v2bds6OGNPrj/+cIRt+nL83oCREtJcC7vLWqWSDoisFr5+7nwsdAR7ODY2/BaETi0qKf
 o/RPNLqFjiuMCaUO2OvGw19lHDYpEae/N1LlOaHqC1zre9qQMXOJfxj/dwt/9CI30Cwl
 NRQ+tmYaaT8rtE/tT1FUCpgc/livj5lLS0lE6D3OOZmBrKh2+IPQKsQLgtWVdmWpUNEb
 8Qdc/5/d6LvISqFkR1lF0TNEdc1BjkvqgDv37FaLhABFCBP3Wz0R/5SRXtcuLfKaiguM
 oxRA==
X-Gm-Message-State: AO0yUKWEGSZgcNskAwFbN2gYiwuEkHrOGMnUVCEsn2zA6wodfLdO9i7q
 /CS1IM1HK15D2COjsVfmigU/TBbIgM6hMnhL
X-Google-Smtp-Source: AK7set/1ggxYNUG13B4iMmksMCayWeY9jXQK7InSzsdfzz2eW99w2V0XbcMiIxkpT/f8O0QVcWoKNQ==
X-Received: by 2002:a5d:45cd:0:b0:2bf:cbf0:e021 with SMTP id
 b13-20020a5d45cd000000b002bfcbf0e021mr17124887wrs.71.1675188131240; 
 Tue, 31 Jan 2023 10:02:11 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 c17-20020adffb11000000b002bc8130cca7sm15453146wrr.23.2023.01.31.10.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:02:10 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v4 03/14] RISC-V: Adding XTheadBa ISA extension
Date: Tue, 31 Jan 2023 19:01:47 +0100
Message-Id: <20230131180158.2471047-4-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
References: <20230131180158.2471047-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Tue, 31 Jan 2023 18:02:30 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the XTheadBa ISA extension.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Split XtheadB* extension into individual commits
- Use single decoder for XThead extensions

 target/riscv/cpu.c                         |  2 ++
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 39 ++++++++++++++++++++++
 target/riscv/translate.c                   |  3 +-
 target/riscv/xthead.decode                 | 22 ++++++++++++
 5 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f76639845d..dd5ff82f22 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -109,6 +109,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(xtheadba, true, PRIV_VERSION_1_11_0, ext_xtheadba),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
@@ -1090,6 +1091,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
 
     /* Vendor-specific custom extensions */
+    DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ea00586436..f1f7795bd5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -473,6 +473,7 @@ struct RISCVCPUConfig {
     uint64_t mimpid;
 
     /* Vendor-specific custom extensions */
+    bool ext_xtheadba;
     bool ext_xtheadcmo;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index f35bf6ea89..a6fb8132a8 100644
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
index 0657a4bea2..4683562ecf 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -132,7 +132,8 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
 
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
2.39.1


