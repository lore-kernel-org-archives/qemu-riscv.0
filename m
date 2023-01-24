Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPSe-00072m-Pl
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 15:00:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSa-00070h-FG
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:00 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSY-0002P3-Nj
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:00 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r2so14985690wrv.7
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 11:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s6DN0iMZaJ0gbQXZruyQVIi+Qyne/7nSeQT3cMfuZyo=;
 b=byNxfjv6hyShC05lzbhI2yihkQDzeFT+a6rUuA3mRLiUkDRCH7AA9/3XwLVlIzWXQu
 LoddAI3IiyyWQBtifHVs1tPuzDSxAeqQJicesd3i7zjjs1zdjXv/6hhp6/05wsPZm+S5
 QustoNPW9/hV4IpUZxX+LHIjufWFc+MDZ41kqhj1te9qYHdn3R3EQuzaisiBXuvbgOan
 YRHKl8OUx7rayc4RMMNRm6uMfRAMVEIeRIfqp3F42pe/wOU9XnufOKmNnZjStIxDtyem
 hPMcOEJe1eCwuW0yXB+zEiy5sSTFMlfzU6ZCV/FjWOi+EzFMcb/MdPtSfG3JoxQrz8XB
 pU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s6DN0iMZaJ0gbQXZruyQVIi+Qyne/7nSeQT3cMfuZyo=;
 b=obcDN/gxPlh4QbjskeVkpYxyeeItfh9tGip6aezkzkX4d3NV30k4ZlkJt6BWx8TktZ
 OeAJAJ3st5F0ULESigTy9E6HJqX9XIzdxDBNof5KLiaDnXbEJMkjKpjw0PQcgbfCES1Y
 nGMH59+4j003eyZ7ihyGymUHfScp/vUTJs1J1ghFPYv0PMAXC/BMfUnm2d6rPq07AK7N
 b8/4M4WkDunfAgG202ilz38VnRTAJik5Q35+OQD3WerAC//ywZbfM9FCsynzjODuSC+x
 AQknvQjLc3QgCmpzH+bXPGpXaGoJ/a4xIeZ6z2CqTrQZYFI4I2iJM7e6qRo8aTN1HO14
 RHwA==
X-Gm-Message-State: AFqh2kqKRuHp/BzFbcQosqAr7VUCr3bazn7R4BD4YmwCVS9Q0AYh8FHF
 Cuhnv2Yh5AIpW9saNzLziAG3USvrypWgt4mI
X-Google-Smtp-Source: AMrXdXt5o3qkm7Qc8qMcp8BBG9I0kJgzr5WjdFq14B9mLPBNhnb/2133HPCbxzpN0uA0ZPgpXgKoVw==
X-Received: by 2002:a05:6000:a03:b0:2bd:e036:6b1a with SMTP id
 co3-20020a0560000a0300b002bde0366b1amr29170159wrb.64.1674590397587; 
 Tue, 24 Jan 2023 11:59:57 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm2607005wra.38.2023.01.24.11.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 11:59:57 -0800 (PST)
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
Subject: [PATCH v3 05/14] RISC-V: Adding XTheadBs ISA extension
Date: Tue, 24 Jan 2023 20:59:36 +0100
Message-Id: <20230124195945.181842-6-christoph.muellner@vrull.eu>
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
X-List-Received-Date: Tue, 24 Jan 2023 20:00:01 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the XTheadBs ISA extension.
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
 target/riscv/insn_trans/trans_xthead.c.inc | 15 +++++++++++++++
 target/riscv/translate.c                   |  3 ++-
 target/riscv/xthead.decode                 |  3 +++
 5 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b995470dd6..805fec4d76 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -111,6 +111,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
     ISA_EXT_DATA_ENTRY(xtheadba, true, PRIV_VERSION_1_11_0, ext_xtheadba),
     ISA_EXT_DATA_ENTRY(xtheadbb, true, PRIV_VERSION_1_11_0, ext_xtheadbb),
+    ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
@@ -1077,6 +1078,7 @@ static Property riscv_cpu_extensions[] = {
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
     DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
+    DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ff92705010..2f92211d9f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -475,6 +475,7 @@ struct RISCVCPUConfig {
     /* Vendor-specific custom extensions */
     bool ext_xtheadba;
     bool ext_xtheadbb;
+    bool ext_xtheadbs;
     bool ext_xtheadcmo;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index ea6cd6e305..339a54e3d6 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -28,6 +28,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_XTHEADBS(ctx) do {               \
+    if (!ctx->cfg_ptr->ext_xtheadbs) {           \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADCMO(ctx) do {              \
     if (!ctx->cfg_ptr->ext_xtheadcmo) {          \
         return false;                            \
@@ -191,6 +197,15 @@ static bool trans_th_tstnbz(DisasContext *ctx, arg_th_tstnbz *a)
     return gen_unary(ctx, a, EXT_ZERO, gen_th_tstnbz);
 }
 
+/* XTheadBs */
+
+/* th.tst is an alternate encoding for bexti (from Zbs) */
+static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
+{
+    REQUIRE_XTHEADBS(ctx);
+    return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
+}
+
 /* XTheadCmo */
 
 static inline int priv_level(DisasContext *ctx)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3bae961be0..96bdf5fb73 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -131,7 +131,8 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
 static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
 {
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
-           ctx->cfg_ptr->ext_xtheadcmo || ctx->cfg_ptr->ext_xtheadsync;
+           ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
+           ctx->cfg_ptr->ext_xtheadsync;
 }
 
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 8cd140891b..8494805611 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -58,6 +58,9 @@ th_rev           1000001 00000 ..... 001 ..... 0001011 @r2
 th_revw          1001000 00000 ..... 001 ..... 0001011 @r2
 th_tstnbz        1000000 00000 ..... 001 ..... 0001011 @r2
 
+# XTheadBs
+th_tst           100010 ...... ..... 001 ..... 0001011 @sh6
+
 # XTheadCmo
 th_dcache_call   0000000 00001 00000 000 00000 0001011
 th_dcache_ciall  0000000 00011 00000 000 00000 0001011
-- 
2.39.0


