Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMx7E-0006nq-Ti
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 15:20:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMx7E-0006nH-0H
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 15:20:28 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMx7C-0002if-2v
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 15:20:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id h16so15326665wrz.12
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 12:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ieN/2+dlX6IBcad+vE1WfHWnV34lFlP6rY4YQzmk0Bw=;
 b=tKE+WA411KjhtT7sqZ8CqJEyjl2J78ypoCPw+HtygZxlmTc3LU24a+5kMLl2Og8vt9
 Yic0AvqW9wyLgXqio0FMB+KtHfquHx/wWxe32VxMNF/MgTE6NEaleN2dQhNd6rwyCIz0
 hIKJm+Mrs2j6gnTN1bfqUUKd27DPEE+ROPixrBDqv5LsGdT9jJmUDou8iuEZAD0dDupa
 pUY1b2y5q0ajpJVB6TgJLRNGw3LYakL0vpOMuVfwPM7VwTunpXW8QAZ5D/+jmU2J3PGU
 bj6th5/Y03DtUTIarMzYFkIAegX4z+648JcUk8czYDRcybOuZb4gTw9hQOrMbV/HwL5g
 Lrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ieN/2+dlX6IBcad+vE1WfHWnV34lFlP6rY4YQzmk0Bw=;
 b=SCtugMPRgM6QkaqDGZeIYH7yAKgp4hsBWT+E6va8zpYFxw3kOGDSWOGQqB+sU2sXYj
 gLodVfPRIlW+bOPKqVy6HGMjTgOn80jpJMpcAOjISYegNxIlTZkktNMS1p+Qo/Awxlf+
 XRGinxKqUNfpwGw/x9+MVJV2eCfm6XCDZt6R55kl58jF60xAD/N3uVcuhQYKRJ1kt5x4
 Xsh1SKu+ZJmbMufBAlEa5BlcUuJzjzsMWtmTsNBIzzZlsn+80CD+lzvMAilXsSXo2qTI
 MyRz2tyRe94nLjZI6aC3+1C1ob7ltiZGkaje1KgliYjZ/jDCiD5kjRhWFOewmhThJeLV
 hVqA==
X-Gm-Message-State: AO0yUKVVfu8LQmSrP97I3U4MYXe3uJ9PFDtikWHQzex5j6Ri2K+iP78P
 6f8/OeDUHJ2MNXPdohnuGgONyfGBYMjwJ/Pm
X-Google-Smtp-Source: AK7set/Jo9cCsvqpY0uO68OZSRIB7XQjaahVCkuHIiqRhDi9gGSeVVUXH1MdaP79b0QrKquXrxOwjQ==
X-Received: by 2002:a05:6000:2aa:b0:2bf:edc4:9cf4 with SMTP id
 l10-20020a05600002aa00b002bfedc49cf4mr5359525wry.58.1675196424733; 
 Tue, 31 Jan 2023 12:20:24 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 v2-20020adfe282000000b002bdec340a1csm15391977wri.110.2023.01.31.12.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 12:20:24 -0800 (PST)
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
Subject: [PATCH v5 05/14] RISC-V: Adding XTheadBs ISA extension
Date: Tue, 31 Jan 2023 21:20:04 +0100
Message-Id: <20230131202013.2541053-6-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131202013.2541053-1-christoph.muellner@vrull.eu>
References: <20230131202013.2541053-1-christoph.muellner@vrull.eu>
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
X-List-Received-Date: Tue, 31 Jan 2023 20:20:28 -0000

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
index def27a53f2..c541924214 100644
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
@@ -1094,6 +1095,7 @@ static Property riscv_cpu_extensions[] = {
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
     DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
+    DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index be86c2fb95..876eaebd0e 100644
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
index ebfab90dd9..bc1605445d 100644
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
index 387ef0ad8b..880324e617 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -133,7 +133,8 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
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
2.39.1


