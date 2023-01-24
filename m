Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPSu-00078b-51
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 15:00:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSi-00074l-8B
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:08 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSe-0002P1-TI
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:07 -0500
Received: by mail-wr1-x432.google.com with SMTP id m7so1342535wru.8
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 12:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iQwdlUDqGz6Rae0fSucBhDGoY7QlWfIR18eaOAERfHk=;
 b=knfPeolCJwIHNBnczwxiQk9j0YEzyFo3FPuw5Yaiz0dVAKkA2XHwBLwwW/cVW76qkm
 RtSmDT5MWVCd6PLFiOHDC26bdu/RWSrGDcSPKhokve4uO8skvxNbfzSxR5SJ271QZxOr
 XUvBrbRJeGF22Erna2jCgaYZs/Xw9wavcHMJIoxM1UeBBBt/0FC4kKJkUUUMg3YfsvL7
 v50nl9AXuCUIZrIdfSiViOeuzh797OHPlXAy3vfPQHmvo/KHn2dwFM0oCFKAUURM1GF3
 SrHiQZoV+HTTXe8r/yH0EEEUgQ0cwJqHJRvHEu4EEI6fiAr456mdGAIxLB3J/K6Syaiu
 0Tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iQwdlUDqGz6Rae0fSucBhDGoY7QlWfIR18eaOAERfHk=;
 b=QMY6yP1LiFKMmzNW63Bt9JipqucQ8b1M8KNVDR+fHVhMGgQcQEuhGWoQCscL0DG70Y
 /h53bavuN8gN6Hia88sGK4P6vEFr4gqCv+1lcRtgt82/1+Seo4sMk00VckqTduTgenmz
 e6DHvP5TAg/Kzitv+yeilH2bE6sPDucYtobIi3Jc+4SqiZxp0RM6EPbY2rzkycVB12OY
 HRWIXL7SP+Ie+zKXDjqX4kQg+bfNgL/wk6GEr3x4x65iHXVyoLQyr6PgWgNTNGsJ01pt
 HJdb6e2R76Jf5kUHNTcsuVjz5sKpa+Z4Qq3gsPGBH2Rqc0VF41fhoziA79/YSDAl0gNC
 Q6uQ==
X-Gm-Message-State: AFqh2ko4C1Hh/nsU8h8kOjkAwb/SHMlbwciFQ2kUHgj5nQL0Vr7FsyRd
 mfNo2ZZHRjJ5Q8PUosvCDEFjWhP0bS+NQux1
X-Google-Smtp-Source: AMrXdXvTpuRnCe1HcvDEzdHEJ72EpO2Eor39mHD/vmqaz4iD1HYzwHSY2JK3P+QFGFVLantBY8ttEQ==
X-Received: by 2002:a5d:6d46:0:b0:2bd:f367:40bc with SMTP id
 k6-20020a5d6d46000000b002bdf36740bcmr25027367wri.13.1674590403375; 
 Tue, 24 Jan 2023 12:00:03 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm2607005wra.38.2023.01.24.12.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 12:00:02 -0800 (PST)
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
Subject: [PATCH v3 09/14] RISC-V: Adding T-Head MemIdx extension
Date: Tue, 24 Jan 2023 20:59:40 +0100
Message-Id: <20230124195945.181842-10-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124195945.181842-1-christoph.muellner@vrull.eu>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x432.google.com
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
X-List-Received-Date: Tue, 24 Jan 2023 20:00:08 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the T-Head MemIdx instructions.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Use single decoder for XThead extensions
- Avoid signed-bitfield-extraction by using signed immediate field imm5
- Use get_address() to calculate addresses
- Introduce helper get_th_address_indexed for rs1+(rs2<<imm2) calculation
- Introduce get_address_indexed() for register offsets (like get_address())

 target/riscv/cpu.c                         |   2 +
 target/riscv/cpu.h                         |   1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 377 +++++++++++++++++++++
 target/riscv/translate.c                   |  21 +-
 target/riscv/xthead.decode                 |  54 +++
 5 files changed, 454 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e3a10f782c..eb8bbfa436 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -115,6 +115,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
     ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadmac),
+    ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadmemidx),
     ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xtheadmempair),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
@@ -1085,6 +1086,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
+    DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, false),
     DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4f5f3b2c20..4882b9a9cc 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -479,6 +479,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
     bool ext_xtheadmac;
+    bool ext_xtheadmemidx;
     bool ext_xtheadmempair;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 7ab2a7a48e..e41f3be9a6 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -52,6 +52,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_XTHEADMEMIDX(ctx) do {           \
+    if (!ctx->cfg_ptr->ext_xtheadmemidx) {       \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADMEMPAIR(ctx) do {          \
     if (!ctx->cfg_ptr->ext_xtheadmempair) {      \
         return false;                            \
@@ -64,6 +70,30 @@
     }                                            \
 } while (0)
 
+/*
+ * Calculate and return the address for indexed mem operations:
+ * If !zext_offs, then the address is rs1 + (rs2 << imm2).
+ * If  zext_offs, then the address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static TCGv get_th_address_indexed(DisasContext *ctx, int rs1, int rs2,
+                                   int imm2, bool zext_offs)
+{
+    TCGv src2 = get_gpr(ctx, rs2, EXT_NONE);
+    TCGv offs = tcg_temp_new();
+
+    if (zext_offs) {
+        tcg_gen_extract_tl(offs, src2, 0, 32);
+        tcg_gen_shli_tl(offs, offs, imm2);
+    } else {
+        tcg_gen_shli_tl(offs, src2, imm2);
+    }
+
+    TCGv addr = get_address_indexed(ctx, rs1, offs);
+
+    tcg_temp_free(offs);
+    return addr;
+}
+
 /* XTheadBa */
 
 /*
@@ -388,6 +418,353 @@ static bool trans_th_mulsw(DisasContext *ctx, arg_th_mulsw *a)
     return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
 }
 
+/* XTheadMemIdx */
+
+/*
+ * Load with memop from indexed address and add (imm5 << imm2) to rs1.
+ * If !preinc, then the load address is rs1.
+ * If  preinc, then the load address is rs1 + (imm5) << imm2).
+ */
+static bool gen_load_inc(DisasContext *ctx, arg_th_meminc *a, MemOp memop,
+                         bool preinc)
+{
+    TCGv rd = dest_gpr(ctx, a->rd);
+    TCGv addr = get_address(ctx, a->rs1, preinc ? a->imm5 << a->imm2 : 0);
+
+    tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
+    addr = get_address(ctx, a->rs1, !preinc ? a->imm5 << a->imm2 : 0);
+    gen_set_gpr(ctx, a->rd, rd);
+    gen_set_gpr(ctx, a->rs1, addr);
+
+    return true;
+}
+
+/*
+ * Store with memop to indexed address and add (imm5 << imm2) to rs1.
+ * If !preinc, then the store address is rs1.
+ * If  preinc, then the store address is rs1 + (imm5) << imm2).
+ */
+static bool gen_store_inc(DisasContext *ctx, arg_th_meminc *a, MemOp memop,
+                          bool preinc)
+{
+    TCGv data = get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv addr = get_address(ctx, a->rs1, preinc ? a->imm5 << a->imm2 : 0);
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
+    addr = get_address(ctx, a->rs1, !preinc ? a->imm5 << a->imm2 : 0);
+    gen_set_gpr(ctx, a->rs1, addr);
+
+    return true;
+}
+
+static bool trans_th_ldia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_ldib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_lwia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_lwib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_lwuia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TEUL, false);
+}
+
+static bool trans_th_lwuib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TEUL, true);
+}
+
+static bool trans_th_lhia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_lhib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_lhuia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TEUW, false);
+}
+
+static bool trans_th_lhuib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_TEUW, true);
+}
+
+static bool trans_th_lbia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_SB, false);
+}
+
+static bool trans_th_lbib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_SB, true);
+}
+
+static bool trans_th_lbuia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_UB, false);
+}
+
+static bool trans_th_lbuib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_inc(ctx, a, MO_UB, true);
+}
+
+static bool trans_th_sdia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_store_inc(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_sdib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_store_inc(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_swia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_swib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_shia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_shib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_sbia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_SB, false);
+}
+
+static bool trans_th_sbib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_inc(ctx, a, MO_SB, true);
+}
+
+/*
+ * Load with memop from indexed address.
+ * If !zext_offs, then address is rs1 + (rs2 << imm2).
+ * If  zext_offs, then address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static bool gen_load_idx(DisasContext *ctx, arg_th_memidx *a, MemOp memop,
+                         bool zext_offs)
+{
+    TCGv rd = dest_gpr(ctx, a->rd);
+    TCGv addr = get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, zext_offs);
+
+    tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
+    gen_set_gpr(ctx, a->rd, rd);
+
+    return true;
+}
+
+/*
+ * Store with memop to indexed address.
+ * If !zext_offs, then address is rs1 + (rs2 << imm2).
+ * If  zext_offs, then address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static bool gen_store_idx(DisasContext *ctx, arg_th_memidx *a, MemOp memop,
+                          bool zext_offs)
+{
+    TCGv data = get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv addr = get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, zext_offs);
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
+
+    return true;
+}
+
+static bool trans_th_lrd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_lrw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_lrwu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TEUL, false);
+}
+
+static bool trans_th_lrh(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_lrhu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TEUW, false);
+}
+
+static bool trans_th_lrb(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_SB, false);
+}
+
+static bool trans_th_lrbu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_UB, false);
+}
+
+static bool trans_th_srd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_store_idx(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_srw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_srh(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_srb(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_SB, false);
+}
+static bool trans_th_lurd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_lurw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_lurwu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TEUL, true);
+}
+
+static bool trans_th_lurh(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_lurhu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_TEUW, true);
+}
+
+static bool trans_th_lurb(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_SB, true);
+}
+
+static bool trans_th_lurbu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_load_idx(ctx, a, MO_UB, true);
+}
+
+static bool trans_th_surd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    REQUIRE_64BIT(ctx);
+    return gen_store_idx(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_surw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_surh(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_surb(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADMEMIDX(ctx);
+    return gen_store_idx(ctx, a, MO_SB, true);
+}
+
 /* XTheadMemPair */
 
 static bool gen_loadpair_tl(DisasContext *ctx, arg_th_pair *a, MemOp memop,
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 27bab07994..2461bcda0f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -133,7 +133,8 @@ static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
            ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
            ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadmac ||
-           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsync;
+           ctx->cfg_ptr->ext_xtheadmemidx || ctx->cfg_ptr->ext_xtheadmempair ||
+           ctx->cfg_ptr->ext_xtheadsync;
 }
 
 #define MATERIALISE_EXT_PREDICATE(ext)  \
@@ -595,6 +596,24 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
     return addr;
 }
 
+/* Compute a canonical address from a register plus reg offset. */
+static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
+{
+    TCGv addr = temp_new(ctx);
+    TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
+
+    tcg_gen_add_tl(addr, src1, offs);
+    if (ctx->pm_mask_enabled) {
+        tcg_gen_andc_tl(addr, addr, pm_mask);
+    } else if (get_xl(ctx) == MXL_RV32) {
+        tcg_gen_ext32u_tl(addr, addr);
+    }
+    if (ctx->pm_base_enabled) {
+        tcg_gen_or_tl(addr, addr, pm_base);
+    }
+    return addr;
+}
+
 #ifndef CONFIG_USER_ONLY
 /* The states of mstatus_fs are:
  * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index ff2a83b56d..69e40f22dc 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -17,8 +17,10 @@
 %rd2       20:5
 %rs2       20:5
 %sh5       20:5
+%imm5      20:s5
 %sh6       20:6
 %sh2       25:2
+%imm2      25:2
 
 # Argument sets
 &r         rd rs1 rs2                               !extern
@@ -26,6 +28,8 @@
 &shift     shamt rs1 rd                             !extern
 &th_bfext  msb lsb rs1 rd
 &th_pair   rd1 rs rd2 sh2
+&th_memidx rd rs1 rs2 imm2
+&th_meminc rd rs1 imm5 imm2
 
 # Formats
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
@@ -36,6 +40,8 @@
 @sh5        ....... ..... .....  ... ..... .......  &shift  shamt=%sh5      %rs1 %rd
 @sh6        ...... ...... .....  ... ..... .......  &shift shamt=%sh6 %rs1 %rd
 @th_pair    ..... .. ..... ..... ... ..... .......  &th_pair %rd1 %rs %rd2 %sh2
+@th_memidx  ..... .. ..... ..... ... ..... .......  &th_memidx %rd %rs1 %rs2 %imm2
+@th_meminc  ..... .. ..... ..... ... ..... .......  &th_meminc %rd %rs1 %imm5 %imm2
 
 # XTheadBa
 # Instead of defining a new encoding, we simply use the decoder to
@@ -102,6 +108,54 @@ th_muls          00100 01 ..... ..... 001 ..... 0001011 @r
 th_mulsh         00101 01 ..... ..... 001 ..... 0001011 @r
 th_mulsw         00100 11 ..... ..... 001 ..... 0001011 @r
 
+# XTheadMemIdx
+th_ldia          01111 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_ldib          01101 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwia          01011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwib          01001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwuia         11011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwuib         11001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhia          00111 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhib          00101 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhuia         10111 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhuib         10101 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbia          00011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbib          00001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbuia         10011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbuib         10001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_sdia          01111 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_sdib          01101 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_swia          01011 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_swib          01001 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_shia          00111 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_shib          00101 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_sbia          00011 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_sbib          00001 .. ..... ..... 101 ..... 0001011 @th_meminc
+
+th_lrd           01100 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrw           01000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrwu          11000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrh           00100 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrhu          10100 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrb           00000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrbu          10000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_srd           01100 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_srw           01000 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_srh           00100 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_srb           00000 .. ..... ..... 101 ..... 0001011 @th_memidx
+
+th_lurd          01110 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurw          01010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurwu         11010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurh          00110 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurhu         10110 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurb          00010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurbu         10010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_surd          01110 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_surw          01010 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_surh          00110 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_surb          00010 .. ..... ..... 101 ..... 0001011 @th_memidx
+
 # XTheadMemPair
 th_ldd           11111 .. ..... ..... 100 ..... 0001011 @th_pair
 th_lwd           11100 .. ..... ..... 100 ..... 0001011 @th_pair
-- 
2.39.0


