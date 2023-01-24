Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPSZ-00070E-SF
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 14:59:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSY-0006yn-EW
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 14:59:58 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSW-0002Pn-EZ
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 14:59:58 -0500
Received: by mail-wm1-x32f.google.com with SMTP id j17so12341897wms.0
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 11:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BAt3iRnDafg9OKpVXS+Dl8Rb2b0Zbz3UDA9D8TIplxU=;
 b=exy7abfLP3Oq6BZ9eypR0AXbCI5t09g1qhl9d3LH8C6gSnAcRTZsHjkYLbwwelAIG7
 dQjTEOUTynqbMB1Kgh2NCfFoU4u0mXcAijc8WJJ/XZEoUyVYLEoSM2ATv9H4MGy7nY+0
 X+xiTglI7S8SJphyfyNEfuXOtoGfcxib58h4gkS4jeyi3lEWqeptlSSvWdKLy6wKrT5J
 HH2lQGwL7xqCfbY4LGQCSa6QKoQT6vdUBr1/8Xi9wu1X0u3CLwOEFa/la6zWFmdYdMma
 ra09su7qFKs69ReHIEh64aWH/l+cl8Z1zj964bWq6gwuQGX1DO83eDRGg1ziWabl5QcH
 qu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BAt3iRnDafg9OKpVXS+Dl8Rb2b0Zbz3UDA9D8TIplxU=;
 b=LgB2gcUgE0UTHLM4r+HVz5kzLeMowwPaei2kD6wVH9NU5xRYn1UFLuHVNAzwwsVKQN
 Kv6xlK8QF68oSvKQ6c9ugdz5K4u/oiEc+qzJm+GgHWtds6OYYXQETOyhDtZ42ZfwVloq
 NKSBCgpdAVWTetTiKVG4qUpIBdA3xGWvXKu/alZn9BnLTF45ymOcDwywgyueVGItJawm
 VYBFIboUegeJ2/hNtOyob9ygQnoyKHJCxb3KoV3hUNfLl1fIm3x0hk1OvgXAN2mQh5XT
 de6OlNe6h/cTMXTdDbKGYSIcGi5zcdjaPei42AU+sDty76R2kqp+PqSzIDCoj7NHEgfJ
 uEng==
X-Gm-Message-State: AFqh2kpBF/QRjavDe6wcjbswS/OnBg76rE6dO/kPN0jGSHY6qXNu46mm
 gsBBaRhxEC0PPdHiYwPz6Ft2UC7nj/wYQ8nK
X-Google-Smtp-Source: AMrXdXsJ+hfzA2pU5UqpfN5ycsCGBb9hS0PtKaLA5T4QY1QR9OZesPkIwjP2N94LF7Zbsss/uoGV+g==
X-Received: by 2002:a05:600c:4f8d:b0:3d3:3d1b:6354 with SMTP id
 n13-20020a05600c4f8d00b003d33d1b6354mr26168049wmq.3.1674590394517; 
 Tue, 24 Jan 2023 11:59:54 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm2607005wra.38.2023.01.24.11.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 11:59:54 -0800 (PST)
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
Subject: [PATCH v3 03/14] RISC-V: Adding XTheadBa ISA extension
Date: Tue, 24 Jan 2023 20:59:34 +0100
Message-Id: <20230124195945.181842-4-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124195945.181842-1-christoph.muellner@vrull.eu>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Tue, 24 Jan 2023 19:59:58 -0000

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
index ae2009e89c..4b46130c5b 100644
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
@@ -1073,6 +1074,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
 
     /* Vendor-specific custom extensions */
+    DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d0ab5c7bb0..d3191bf27b 100644
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
index bf5b39c749..a7da156869 100644
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
index dcda7cfd22..68baf84807 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -130,7 +130,8 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
 
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
2.39.0


