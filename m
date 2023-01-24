Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPSd-00072M-Ti
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 15:00:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSa-00070O-3M
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:00 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSY-0002QH-4M
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 14:59:59 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d14so11315467wrr.9
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 11:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XmuNgYZIEaoqrBhDoCdoZIdIAp2kAzXOo/V43xF+JUU=;
 b=NsC/NvE9cTgwZaupD+zL0nZTFRCby2q/ZYTcCDCGSXeukmqpA6gRNjwlM3l2kg/mDe
 B0v0sfU3RHcBGAGtoQqC9c6mDCY9dCrf5GhLkO4luy+0+a3jvRRuYHCi9DDSp26Iip0A
 WN8o+LBMDt0dJbgRKFSiLK/JxqFJqxYmJpkBnWXk/9oZ8OZJGwNeK2bMV0meTA9xoHnm
 nLzFSTLg1jSQKD4bV1D8mVoU4fklldeqniaXMvD15+VO4odzHvM5KYc6++eCTxG+7BJi
 prXQO8QABJWMbGCK+H8qPk5WOAhXiJzGZQpn09TcvRQfXq3eSgHkb6Iik4e6LwzTJmTV
 le7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XmuNgYZIEaoqrBhDoCdoZIdIAp2kAzXOo/V43xF+JUU=;
 b=Rgc1HBur3vCjPxzYmwifsfjuw02lNmErQlhUR7QU2GfJAUS4go3+mWTH8Te5n/Xp3l
 Rb7l4FnAAzqWcgUr/4ONXEJMoyo6WuB/sBGfgkk5HEj4G/SSKMiqzlSgRtEvqYLuXKuT
 Y7qAt/PjvnLN76fvXJ0lD4Pl96Ray8Il0KR3+AzNoVzxrF38JMLsubA3RiS835b8xhcZ
 jBdd4V42ri0m2Y4TkX6fAdd8zpjPvvSybPz6eQVuguq1iTMoLqRyKvij4ZJe5ZUYZN8K
 aSX4OC9C2FkASOXvWHpqgPnuYEOlPJu7tNRzLVpR6VHZuok7FxlARXTmhAoG8+l30Ja1
 vM8Q==
X-Gm-Message-State: AFqh2kqzBn7aCN0+svJwLxWCmmMk+OWP1SRxpAs586grCG89W5PQ6xQl
 6HpM7NUa8B/NAJu9hxkUMoJ8AKs71RXE/bc9
X-Google-Smtp-Source: AMrXdXs9nylRvTCaH6/kDNXthoGQZ3KmQooTYvmNuhisW/AQTtFYV307nN5x6Cp+YVCBwivw5mcz8w==
X-Received: by 2002:a5d:6d41:0:b0:2bb:328b:a66d with SMTP id
 k1-20020a5d6d41000000b002bb328ba66dmr25046975wri.60.1674590396079; 
 Tue, 24 Jan 2023 11:59:56 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm2607005wra.38.2023.01.24.11.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 11:59:55 -0800 (PST)
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
Subject: [PATCH v3 04/14] RISC-V: Adding XTheadBb ISA extension
Date: Tue, 24 Jan 2023 20:59:35 +0100
Message-Id: <20230124195945.181842-5-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124195945.181842-1-christoph.muellner@vrull.eu>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42c.google.com
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
X-List-Received-Date: Tue, 24 Jan 2023 20:00:00 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the XTheadBb ISA extension.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Split XtheadB* extension into individual commits
- Make implementation compatible with RV32.
- Use single decoder for XThead extensions

 target/riscv/cpu.c                         |   2 +
 target/riscv/cpu.h                         |   1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 124 +++++++++++++++++++++
 target/riscv/translate.c                   |   4 +-
 target/riscv/xthead.decode                 |  20 ++++
 5 files changed, 149 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4b46130c5b..b995470dd6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -110,6 +110,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
     ISA_EXT_DATA_ENTRY(xtheadba, true, PRIV_VERSION_1_11_0, ext_xtheadba),
+    ISA_EXT_DATA_ENTRY(xtheadbb, true, PRIV_VERSION_1_11_0, ext_xtheadbb),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
@@ -1075,6 +1076,7 @@ static Property riscv_cpu_extensions[] = {
 
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
+    DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d3191bf27b..ff92705010 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -474,6 +474,7 @@ struct RISCVCPUConfig {
 
     /* Vendor-specific custom extensions */
     bool ext_xtheadba;
+    bool ext_xtheadbb;
     bool ext_xtheadcmo;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index a7da156869..ea6cd6e305 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -22,6 +22,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_XTHEADBB(ctx) do {               \
+    if (!ctx->cfg_ptr->ext_xtheadbb) {           \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADCMO(ctx) do {              \
     if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
         return false;                            \
@@ -67,6 +73,124 @@ GEN_TRANS_TH_ADDSL(1)
 GEN_TRANS_TH_ADDSL(2)
 GEN_TRANS_TH_ADDSL(3)
 
+/* XTheadBb */
+
+/* th.srri is an alternate encoding for rori (from Zbb) */
+static bool trans_th_srri(DisasContext *ctx, arg_th_srri * a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    return gen_shift_imm_fn_per_ol(ctx, a, EXT_NONE,
+                                   tcg_gen_rotri_tl, gen_roriw, NULL);
+}
+
+/* th.srriw is an alternate encoding for roriw (from Zbb) */
+static bool trans_th_srriw(DisasContext *ctx, arg_th_srriw *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    REQUIRE_64BIT(ctx);
+    ctx->ol = MXL_RV32;
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_roriw, NULL);
+}
+
+/* th.ext and th.extu perform signed/unsigned bitfield extraction */
+static bool gen_th_bfextract(DisasContext *ctx, arg_th_bfext *a,
+                             void (*f)(TCGv, TCGv, unsigned int, unsigned int))
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv source = get_gpr(ctx, a->rs1, EXT_ZERO);
+
+    if (a->lsb <= a->msb) {
+        f(dest, source, a->lsb, a->msb - a->lsb + 1);
+        gen_set_gpr(ctx, a->rd, dest);
+    }
+    return true;
+}
+
+static bool trans_th_ext(DisasContext *ctx, arg_th_ext *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    return gen_th_bfextract(ctx, a, tcg_gen_sextract_tl);
+}
+
+static bool trans_th_extu(DisasContext *ctx, arg_th_extu *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    return gen_th_bfextract(ctx, a, tcg_gen_extract_tl);
+}
+
+/* th.ff0: find first zero (clz on an inverted input) */
+static bool gen_th_ff0(DisasContext *ctx, arg_th_ff0 *a, DisasExtend ext)
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, ext);
+
+    int olen = get_olen(ctx);
+    TCGv t = tcg_temp_new();
+
+    tcg_gen_not_tl(t, src1);
+    if (olen != TARGET_LONG_BITS) {
+        if (olen == 32) {
+            gen_clzw(dest, t);
+        } else {
+            g_assert_not_reached();
+        }
+    } else {
+        gen_clz(dest, t);
+    }
+
+    tcg_temp_free(t);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_th_ff0(DisasContext *ctx, arg_th_ff0 *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    return gen_th_ff0(ctx, a, EXT_NONE);
+}
+
+/* th.ff1 is an alternate encoding for clz (from Zbb) */
+static bool trans_th_ff1(DisasContext *ctx, arg_th_ff1 *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    return gen_unary_per_ol(ctx, a, EXT_NONE, gen_clz, gen_clzw);
+}
+
+static void gen_th_revw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_bswap32_tl(ret, arg1, TCG_BSWAP_OS);
+}
+
+/* th.rev is an alternate encoding for the RV64 rev8 (from Zbb) */
+static bool trans_th_rev(DisasContext *ctx, arg_th_rev *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+
+    return gen_unary_per_ol(ctx, a, EXT_NONE, tcg_gen_bswap_tl, gen_th_revw);
+}
+
+/* th.revw is a sign-extended byte-swap of the lower word */
+static bool trans_th_revw(DisasContext *ctx, arg_th_revw *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_unary(ctx, a, EXT_NONE, gen_th_revw);
+}
+
+/* th.tstnbz is equivalent to an orc.b (from Zbb) with inverted result */
+static void gen_th_tstnbz(TCGv ret, TCGv source1)
+{
+    gen_orc_b(ret, source1);
+    tcg_gen_not_tl(ret, ret);
+}
+
+static bool trans_th_tstnbz(DisasContext *ctx, arg_th_tstnbz *a)
+{
+    REQUIRE_XTHEADBB(ctx);
+    return gen_unary(ctx, a, EXT_ZERO, gen_th_tstnbz);
+}
+
 /* XTheadCmo */
 
 static inline int priv_level(DisasContext *ctx)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 68baf84807..3bae961be0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -130,8 +130,8 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
 
 static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
 {
-    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadcmo ||
-           ctx->cfg_ptr->ext_xtheadsync;
+    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
+           ctx->cfg_ptr->ext_xtheadcmo || ctx->cfg_ptr->ext_xtheadsync;
 }
 
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index b149f13018..8cd140891b 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -13,14 +13,23 @@
 %rd        7:5
 %rs1       15:5
 %rs2       20:5
+%sh5       20:5
+%sh6       20:6
 
 # Argument sets
 &r         rd rs1 rs2                               !extern
+&r2        rd rs1                                   !extern
+&shift     shamt rs1 rd                             !extern
+&th_bfext  msb lsb rs1 rd
 
 # Formats
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
 @rs2_s      ....... ..... ..... ... ..... .......   %rs2 %rs1
 @r          ....... ..... .....  ... ..... .......  &r %rs2 %rs1 %rd
+@r2         ....... ..... .....  ... ..... .......  &r2 %rs1 %rd
+@th_bfext   msb:6  lsb:6  .....  ... ..... .......  &th_bfext %rs1 %rd
+@sh5        ....... ..... .....  ... ..... .......  &shift  shamt=%sh5      %rs1 %rd
+@sh6        ...... ...... .....  ... ..... .......  &shift shamt=%sh6 %rs1 %rd
 
 # XTheadBa
 # Instead of defining a new encoding, we simply use the decoder to
@@ -38,6 +47,17 @@ th_addsl1        0000001 ..... ..... 001 ..... 0001011 @r
 th_addsl2        0000010 ..... ..... 001 ..... 0001011 @r
 th_addsl3        0000011 ..... ..... 001 ..... 0001011 @r
 
+# XTheadBb
+th_ext           ...... ...... ..... 010 ..... 0001011 @th_bfext
+th_extu          ...... ...... ..... 011 ..... 0001011 @th_bfext
+th_ff0           1000010 00000 ..... 001 ..... 0001011 @r2
+th_ff1           1000011 00000 ..... 001 ..... 0001011 @r2
+th_srri          000100 ...... ..... 001 ..... 0001011 @sh6
+th_srriw         0001010 ..... ..... 001 ..... 0001011 @sh5
+th_rev           1000001 00000 ..... 001 ..... 0001011 @r2
+th_revw          1001000 00000 ..... 001 ..... 0001011 @r2
+th_tstnbz        1000000 00000 ..... 001 ..... 0001011 @r2
+
 # XTheadCmo
 th_dcache_call   0000000 00001 00000 000 00000 0001011
 th_dcache_ciall  0000000 00011 00000 000 00000 0001011
-- 
2.39.0


