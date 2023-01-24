Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPSi-000757-Vv
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 15:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSg-00073q-51
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:06 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSc-0002RT-F9
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:05 -0500
Received: by mail-wr1-x436.google.com with SMTP id h12so11003867wrv.10
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 12:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=srQeGmVLX2/OUPWpbeQotKRtvqvZdgiJx/TKiWT3yoo=;
 b=gzHnorH2LvLUR1J7rXiLqmkEpkWYtMshRajM6DIMVRCvB+JnYDgre/d7TbL2BJfJce
 9rIiIDa3PdHYFeAWw/XIS9eBFnVfZmXSwjWQIFTBv3iamhJN+d2OOKng5sR7JtNrFiXU
 TAwqJsUNlqvLoD0TAmCM0CZW7o0CdYg8zD19EQQAl6bPwKdISY44j69j4k2/SNGomlMj
 2tb9khxAAHnSLpJbayhoqUxfDKV/ShanP7C9xIZzTa9KW5ug9TKqrlmfqMNRFU3WAZc+
 i6lvX1PJat8LoXJ+tMEjQdswGW6Z672M3iBziDouHAMc9sBIZR941DJcLGt/YdqFtO9W
 cHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=srQeGmVLX2/OUPWpbeQotKRtvqvZdgiJx/TKiWT3yoo=;
 b=borVFFCJe2JGjU7p0z1MNXlEVtoKIOZPxkzGaSeAa53jCtdQNCgnVgehTWwAe8snMs
 DlzjVG7oREkCjNXZVLtUOM/ldYfZi/TPS3DrVlU1VlkLJI2eeYl1/7cf8LcplArGZpF8
 +f9sZ72IjgpGhoc/22Ln9TxQ5rOEL/3tQ2fANx9dsTSGdZNFoVQKT4A1PXX21Yf0r+ML
 a3uWOuDgh7sTXmslej5qbs6NOmnoWkArMkM2HCKYvTRpcA8/twMDuwLa4kxtRzYrswD2
 aWUHjWbU4Sja2TZPnIbWcQYr1nMy/wuvwyG1AG9+prdsg80Yy4x2LcFieJkecFAetOPi
 GdPQ==
X-Gm-Message-State: AFqh2kr2F66v8n1YvzRpG2zMF/0h51QqTLCP1S3NiqPQ0qb35HSZXyCZ
 BtWhiKOHeGU5sEgpOlSeEp5tDgMnEQpUVEjo
X-Google-Smtp-Source: AMrXdXsxT+W+sYzk46QvoImg3DbJxGtMIsDo43sxmD4aZZDgrX/kacgpVoNRgubcK6X6dMy5+yMKVA==
X-Received: by 2002:a05:6000:98f:b0:2bd:e612:a2be with SMTP id
 by15-20020a056000098f00b002bde612a2bemr28473268wrb.17.1674590400559; 
 Tue, 24 Jan 2023 12:00:00 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm2607005wra.38.2023.01.24.11.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 12:00:00 -0800 (PST)
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
Subject: [PATCH v3 07/14] RISC-V: Adding T-Head multiply-accumulate
 instructions
Date: Tue, 24 Jan 2023 20:59:38 +0100
Message-Id: <20230124195945.181842-8-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124195945.181842-1-christoph.muellner@vrull.eu>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Tue, 24 Jan 2023 20:00:06 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the T-Head MAC instructions.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Use single decoder for XThead extensions

 target/riscv/cpu.c                         |  2 +
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 83 ++++++++++++++++++++++
 target/riscv/translate.c                   |  3 +-
 target/riscv/xthead.decode                 |  8 +++
 5 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b3ede7223a..2ce8eb6a6f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -114,6 +114,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
+    ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadmac),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
@@ -1082,6 +1083,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
+    DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5286bd487c..55aea777a0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -478,6 +478,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadbs;
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
+    bool ext_xtheadmac;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
 
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 894b95a741..1c583ea8ec 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -46,6 +46,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_XTHEADMAC(ctx) do {              \
+    if (!ctx->cfg_ptr->ext_xtheadmac) {          \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADSYNC(ctx) do {             \
     if (!ctx->cfg_ptr->ext_xtheadsync) {         \
         return false;                            \
@@ -299,6 +305,83 @@ static bool trans_th_mvnez(DisasContext *ctx, arg_th_mveqz *a)
     return gen_th_condmove(ctx, a, TCG_COND_NE);
 }
 
+/* XTheadMac */
+
+static bool gen_th_mac(DisasContext *ctx, arg_r *a,
+                       void (*accumulate_func)(TCGv, TCGv, TCGv),
+                       void (*extend_operand_func)(TCGv, TCGv))
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src0 = get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv tmp = tcg_temp_new();
+
+    if (extend_operand_func) {
+        TCGv tmp2 = tcg_temp_new();
+        extend_operand_func(tmp, src1);
+        extend_operand_func(tmp2, src2);
+        tcg_gen_mul_tl(tmp, tmp, tmp2);
+        tcg_temp_free(tmp2);
+    } else {
+        tcg_gen_mul_tl(tmp, src1, src2);
+    }
+
+    accumulate_func(dest, src0, tmp);
+    gen_set_gpr(ctx, a->rd, dest);
+    tcg_temp_free(tmp);
+
+    return true;
+}
+
+/* th.mula: "rd = rd + rs1 * rs2" */
+static bool trans_th_mula(DisasContext *ctx, arg_th_mula *a)
+{
+    REQUIRE_XTHEADMAC(ctx);
+    return gen_th_mac(ctx, a, tcg_gen_add_tl, NULL);
+}
+
+/* th.mulah: "rd = sext.w(rd + sext.w(rs1[15:0]) * sext.w(rs2[15:0]))" */
+static bool trans_th_mulah(DisasContext *ctx, arg_th_mulah *a)
+{
+    REQUIRE_XTHEADMAC(ctx);
+    ctx->ol = MXL_RV32;
+    return gen_th_mac(ctx, a, tcg_gen_add_tl, tcg_gen_ext16s_tl);
+}
+
+/* th.mulaw: "rd = sext.w(rd + rs1 * rs2)" */
+static bool trans_th_mulaw(DisasContext *ctx, arg_th_mulaw *a)
+{
+    REQUIRE_XTHEADMAC(ctx);
+    REQUIRE_64BIT(ctx);
+    ctx->ol = MXL_RV32;
+    return gen_th_mac(ctx, a, tcg_gen_add_tl, NULL);
+}
+
+/* th.muls: "rd = rd - rs1 * rs2" */
+static bool trans_th_muls(DisasContext *ctx, arg_th_muls *a)
+{
+    REQUIRE_XTHEADMAC(ctx);
+    return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
+}
+
+/* th.mulsh: "rd = sext.w(rd - sext.w(rs1[15:0]) * sext.w(rs2[15:0]))" */
+static bool trans_th_mulsh(DisasContext *ctx, arg_th_mulsh *a)
+{
+    REQUIRE_XTHEADMAC(ctx);
+    ctx->ol = MXL_RV32;
+    return gen_th_mac(ctx, a, tcg_gen_sub_tl, tcg_gen_ext16s_tl);
+}
+
+/* th.mulsw: "rd = sext.w(rd - rs1 * rs2)" */
+static bool trans_th_mulsw(DisasContext *ctx, arg_th_mulsw *a)
+{
+    REQUIRE_XTHEADMAC(ctx);
+    REQUIRE_64BIT(ctx);
+    ctx->ol = MXL_RV32;
+    return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
+}
+
 /* XTheadSync */
 
 static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d61705e775..5be1c9da69 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -132,7 +132,8 @@ static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
 {
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
            ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
-           ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadsync;
+           ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadmac ||
+           ctx->cfg_ptr->ext_xtheadsync;
 }
 
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index a8ebd8a18b..696de6cecf 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -88,6 +88,14 @@ th_l2cache_iall  0000000 10110 00000 000 00000 0001011
 th_mveqz         0100000 ..... .....  001 ..... 0001011 @r
 th_mvnez         0100001 ..... .....  001 ..... 0001011 @r
 
+# XTheadMac
+th_mula          00100 00 ..... ..... 001 ..... 0001011 @r
+th_mulah         00101 00 ..... ..... 001 ..... 0001011 @r
+th_mulaw         00100 10 ..... ..... 001 ..... 0001011 @r
+th_muls          00100 01 ..... ..... 001 ..... 0001011 @r
+th_mulsh         00101 01 ..... ..... 001 ..... 0001011 @r
+th_mulsw         00100 11 ..... ..... 001 ..... 0001011 @r
+
 # XTheadSync
 th_sfence_vmas   0000010 ..... ..... 000 00000 0001011 @rs2_s
 th_sync          0000000 11000 00000 000 00000 0001011
-- 
2.39.0


