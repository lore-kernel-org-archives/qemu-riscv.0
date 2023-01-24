Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPSj-00075B-5b
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 15:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSg-000741-6w
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:06 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSd-0002P3-9A
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:05 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r2so14985910wrv.7
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 12:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTCCsZ/+0xVdTCtHZLd65lxhRTDRlFWAdM0ZS5oihEI=;
 b=GuJXgJA2mtCCDrP1+lAY9wfES79i+UWoVqw/WYufzZuLvg7Ybzw+NT/zj3oGdYEbYO
 TmtWdDPIB9OfB+ajRwaaOmS5E/Ni+So3NT+M3Gcj3PbQPhHoSrqq3G29OqGjYqjpOUPO
 3oEhd8ZSyMBH6Wd/cPPyHr3Mr3MEXf7Z+kcyocNqQ6ZfRBdCWMpK/51fsbtFaD6W9zah
 ExK+u+Ei4bzQnbqR0EyEpIjSuV85b23fnS50exEcYb4Icw0Yq7uyhQXSGEjGYVZ5aHyz
 amlJ8EFyDDSftORR/WZkrILEyA9wN823OveSSCEOItVR3Jipp4WS1uo5UQ9n+yNV9kvb
 73mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VTCCsZ/+0xVdTCtHZLd65lxhRTDRlFWAdM0ZS5oihEI=;
 b=H8WnpvLozT20n2EtCppYGHH7nEXJQ288UQbkjl9lKQi3iXdAurPMhkoMpznRoEAn3e
 DEvCRBDD0Wnfd3Y4GPVzYTa8iZ4y/xgNZXJCNwrrxVF4gnIiMkSwZZ9+8hOWh3oDpi+j
 s5wVcgWuzrK4HM9iZTjL50TjsIKu/XWcxS1jxramBrBNMtdYpU5v1W3zPqOMO380SL8O
 yAfHznqir1jacFr33JrSw2xuVmNilb8PkQUzfDlhACf8OOEmseMSdYWh+AWLSeJlrcYs
 0mM9fplc7i1xsW4q/im9L0TBfjaSE2n73c6kS0pA3snVb+5n8wJqssKc1nt6sZAhdZbO
 Svtg==
X-Gm-Message-State: AFqh2kro13QUQ2pItEuYgo+ptoVtH+nZauiV9lqc+NkCIl8cjX/5oQDN
 5l4nMpUskK1BRaKnNhCYyfbr9PlgxVU4eDWI
X-Google-Smtp-Source: AMrXdXtIRXKzv485nheMzCF+bzBRP8qOYLQkLt7+6k/Hw0Ifx3Xoo7aafbA7bji7vqAeaS9Ef01Qtg==
X-Received: by 2002:adf:fbc1:0:b0:2bd:bed8:3b0f with SMTP id
 d1-20020adffbc1000000b002bdbed83b0fmr22948080wrs.35.1674590401891; 
 Tue, 24 Jan 2023 12:00:01 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm2607005wra.38.2023.01.24.12.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 12:00:01 -0800 (PST)
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
Subject: [PATCH v3 08/14] RISC-V: Adding T-Head MemPair extension
Date: Tue, 24 Jan 2023 20:59:39 +0100
Message-Id: <20230124195945.181842-9-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124195945.181842-1-christoph.muellner@vrull.eu>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 24 Jan 2023 20:00:06 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the T-Head MemPair instructions.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Use single decoder for XThead extensions
- Use get_address() to calculate addresses

 target/riscv/cpu.c                         |  2 +
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 88 ++++++++++++++++++++++
 target/riscv/translate.c                   |  2 +-
 target/riscv/xthead.decode                 | 13 ++++
 5 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2ce8eb6a6f..e3a10f782c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -115,6 +115,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
     ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadmac),
+    ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xtheadmempair),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
@@ -1084,6 +1085,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
+    DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 55aea777a0..4f5f3b2c20 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -479,6 +479,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
     bool ext_xtheadmac;
+    bool ext_xtheadmempair;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
 
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 1c583ea8ec..7ab2a7a48e 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -52,6 +52,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_XTHEADMEMPAIR(ctx) do {          \
+    if (!ctx->cfg_ptr->ext_xtheadmempair) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADSYNC(ctx) do {             \
     if (!ctx->cfg_ptr->ext_xtheadsync) {         \
         return false;                            \
@@ -382,6 +388,88 @@ static bool trans_th_mulsw(DisasContext *ctx, arg_th_mulsw *a)
     return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
 }
 
+/* XTheadMemPair */
+
+static bool gen_loadpair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
+                            int shamt)
+{
+    TCGv rd1 = dest_gpr(ctx, a->rd1);
+    TCGv rd2 = dest_gpr(ctx, a->rd2);
+    TCGv addr1 = tcg_temp_new();
+    TCGv addr2 = tcg_temp_new();
+
+    addr1 = get_address(ctx, a->rs, a->sh2 << shamt);
+    if ((memop & MO_SIZE) == MO_64) {
+        addr2 = get_address(ctx, a->rs, 8 + (a->sh2 << shamt));
+    } else {
+        addr2 = get_address(ctx, a->rs, 4 + (a->sh2 << shamt));
+    }
+
+    tcg_gen_qemu_ld_tl(rd1, addr1, ctx->mem_idx, memop);
+    tcg_gen_qemu_ld_tl(rd2, addr2, ctx->mem_idx, memop);
+    gen_set_gpr(ctx, a->rd1, rd1);
+    gen_set_gpr(ctx, a->rd2, rd2);
+
+    tcg_temp_free(addr1);
+    tcg_temp_free(addr2);
+    return true;
+}
+
+static bool trans_th_ldd(DisasContext *ctx, arg_th_pair *a)
+{
+    REQUIRE_XTHEADMEMPAIR(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_loadpair_tl(ctx, a, MO_TESQ, 4);
+}
+
+static bool trans_th_lwd(DisasContext *ctx, arg_th_pair *a)
+{
+    REQUIRE_XTHEADMEMPAIR(ctx);
+    return gen_loadpair_tl(ctx, a, MO_TESL, 3);
+}
+
+static bool trans_th_lwud(DisasContext *ctx, arg_th_pair *a)
+{
+    REQUIRE_XTHEADMEMPAIR(ctx);
+    return gen_loadpair_tl(ctx, a, MO_TEUL, 3);
+}
+
+static bool gen_storepair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
+                             int shamt)
+{
+    TCGv data1 = get_gpr(ctx, a->rd1, EXT_NONE);
+    TCGv data2 = get_gpr(ctx, a->rd2, EXT_NONE);
+    TCGv addr1 = tcg_temp_new();
+    TCGv addr2 = tcg_temp_new();
+
+    addr1 = get_address(ctx, a->rs, a->sh2 << shamt);
+    if ((memop & MO_SIZE) == MO_64) {
+        addr2 = get_address(ctx, a->rs, 8 + (a->sh2 << shamt));
+    } else {
+        addr2 = get_address(ctx, a->rs, 4 + (a->sh2 << shamt));
+    }
+
+    tcg_gen_qemu_st_tl(data1, addr1, ctx->mem_idx, memop);
+    tcg_gen_qemu_st_tl(data2, addr2, ctx->mem_idx, memop);
+
+    tcg_temp_free(addr1);
+    tcg_temp_free(addr2);
+    return true;
+}
+
+static bool trans_th_sdd(DisasContext *ctx, arg_th_pair *a)
+{
+    REQUIRE_XTHEADMEMPAIR(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_storepair_tl(ctx, a, MO_TESQ, 4);
+}
+
+static bool trans_th_swd(DisasContext *ctx, arg_th_pair *a)
+{
+    REQUIRE_XTHEADMEMPAIR(ctx);
+    return gen_storepair_tl(ctx, a, MO_TESL, 3);
+}
+
 /* XTheadSync */
 
 static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5be1c9da69..27bab07994 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -133,7 +133,7 @@ static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
            ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
            ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadmac ||
-           ctx->cfg_ptr->ext_xtheadsync;
+           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsync;
 }
 
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 696de6cecf..ff2a83b56d 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -11,16 +11,21 @@
 
 # Fields:
 %rd        7:5
+%rd1       7:5
+%rs        15:5
 %rs1       15:5
+%rd2       20:5
 %rs2       20:5
 %sh5       20:5
 %sh6       20:6
+%sh2       25:2
 
 # Argument sets
 &r         rd rs1 rs2                               !extern
 &r2        rd rs1                                   !extern
 &shift     shamt rs1 rd                             !extern
 &th_bfext  msb lsb rs1 rd
+&th_pair   rd1 rs rd2 sh2
 
 # Formats
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
@@ -30,6 +35,7 @@
 @th_bfext   msb:6  lsb:6  .....  ... ..... .......  &th_bfext %rs1 %rd
 @sh5        ....... ..... .....  ... ..... .......  &shift  shamt=%sh5      %rs1 %rd
 @sh6        ...... ...... .....  ... ..... .......  &shift shamt=%sh6 %rs1 %rd
+@th_pair    ..... .. ..... ..... ... ..... .......  &th_pair %rd1 %rs %rd2 %sh2
 
 # XTheadBa
 # Instead of defining a new encoding, we simply use the decoder to
@@ -96,6 +102,13 @@ th_muls          00100 01 ..... ..... 001 ..... 0001011 @r
 th_mulsh         00101 01 ..... ..... 001 ..... 0001011 @r
 th_mulsw         00100 11 ..... ..... 001 ..... 0001011 @r
 
+# XTheadMemPair
+th_ldd           11111 .. ..... ..... 100 ..... 0001011 @th_pair
+th_lwd           11100 .. ..... ..... 100 ..... 0001011 @th_pair
+th_lwud          11110 .. ..... ..... 100 ..... 0001011 @th_pair
+th_sdd           11111 .. ..... ..... 101 ..... 0001011 @th_pair
+th_swd           11100 .. ..... ..... 101 ..... 0001011 @th_pair
+
 # XTheadSync
 th_sfence_vmas   0000010 ..... ..... 000 00000 0001011 @rs2_s
 th_sync          0000000 11000 00000 000 00000 0001011
-- 
2.39.0


