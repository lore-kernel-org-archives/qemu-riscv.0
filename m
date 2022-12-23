Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8mLg-00088t-9L
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 13:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLO-000800-4O
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:34 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLL-0003IM-O3
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:29 -0500
Received: by mail-ed1-x535.google.com with SMTP id b88so731297edf.6
 for <qemu-riscv@nongnu.org>; Fri, 23 Dec 2022 10:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uT04uWiViekVEpzCTZPyMaJ5LbyKYJuWTn9XIKbzLG0=;
 b=HwQCs+azvz4x58O8PtVvmcrB+Drzc5OSMuuWwChhi0ziMT8boLsiWvHXk4gsJHruBZ
 o0a5g8sc5pIGGdYyZbbA7WIoGyzphuALCmPiaPlVelpUvEQUsVDlbdMoMj3sOK5F+3dl
 Rgb1NNJgGm3h/7DCbdpzXAKuFiprMEgWpnT9PfyVeizWVRnFcX1F891WteItXkR5Hk69
 ispvdTsmjA/J7DNiKWdveDuLU0wy7c+trBlUluEwwYne+VlR82SF0lGk/pAhGupMC/XG
 3YOwOjCCvO0G02n1Fyrn75XiDlDteKQVmE0zNCHr52UOE3MYUs6wIkEHCipy6jnPUqMx
 7otw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uT04uWiViekVEpzCTZPyMaJ5LbyKYJuWTn9XIKbzLG0=;
 b=S9SoEF73ibEVofI+TDvp0gf3m2tfhbfygnoAD5TS0CsnXLpZgtW4ot8k3eJtsaDt3v
 VG58zOgUSlCpUyT2Gr4egvDYdUNz8Jzy6S49bSgGuZQEZBO/1Xtv0AsZhmg9y6Ntxj7U
 r9nPsXD+To/iyrs5hmzwcUDYnPRO9dR8fFfp6Cqo4B1icWuMaoupmAtC3Ru6LrJVcd2i
 cWOJjHhRKWfmgILouNSO7iskjOMZHu0KHXbzt8HilN+JEnMQqo26NgdZOVW0QsfFD4H6
 cgsa/EU0MeIUuEVS7x0iP0EUYnrTjYaiYlJ+wbpXHlYSXeARSrRIWuAXHADhtyDJzF7G
 oo5A==
X-Gm-Message-State: AFqh2kpp74SvakS3Hn04IXQv6R/CwFOcPZZgVqtyjkASZW3MH7C3BFdH
 8sxA17ifGPCgoc87gPOTgPVUP83z9NRYDi9E
X-Google-Smtp-Source: AMrXdXufgamu0ZeM15GJoVaz6bj4zEg/r4kb728YoSR6GegpSGZn2MESraiVqc1BR6KCwuEV05bLVg==
X-Received: by 2002:a05:6402:4015:b0:46a:3bd0:4784 with SMTP id
 d21-20020a056402401500b0046a3bd04784mr10253851eda.7.1671818425720; 
 Fri, 23 Dec 2022 10:00:25 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056402154e00b0047d4685878esm1734937edx.51.2022.12.23.10.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 10:00:25 -0800 (PST)
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
Subject: [PATCH v2 04/15] RISC-V: Adding XTheadBb ISA extension
Date: Fri, 23 Dec 2022 19:00:04 +0100
Message-Id: <20221223180016.2068508-5-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x535.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 18:00:35 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the XTheadBb ISA extension.
The patch uses the T-Head specific decoder and translation.

Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Split XtheadB* extension into individual commits
- Make implementation compatible with RV32.
- Use single decoder for XThead extensions

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |   2 +
 target/riscv/cpu.h                         |   1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 124 +++++++++++++++++++++
 target/riscv/translate.c                   |   4 +-
 target/riscv/xthead.decode                 |  20 ++++
 5 files changed, 149 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 809b6eb4ed..b5285fb7a7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -109,6 +109,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
     ISA_EXT_DATA_ENTRY(xtheadba, true, PRIV_VERSION_1_11_0, ext_xtheadba),
+    ISA_EXT_DATA_ENTRY(xtheadbb, true, PRIV_VERSION_1_11_0, ext_xtheadbb),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
@@ -1064,6 +1065,7 @@ static Property riscv_cpu_extensions[] = {
 
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
+    DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ec2588a0f0..0ac1d3f5ef 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -466,6 +466,7 @@ struct RISCVCPUConfig {
 
     /* Vendor-specific custom extensions */
     bool ext_xtheadba;
+    bool ext_xtheadbb;
     bool ext_xtheadcmo;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 79e1f5bde9..a55d1491fa 100644
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
index 7b35f1d71b..8439ff0bf4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -127,8 +127,8 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
 
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
2.38.1


