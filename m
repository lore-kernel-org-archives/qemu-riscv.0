Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8mLd-00086L-2t
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 13:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLQ-00080E-2B
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:35 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLO-0003Kx-6B
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:31 -0500
Received: by mail-ej1-x62a.google.com with SMTP id kw15so13485335ejc.10
 for <qemu-riscv@nongnu.org>; Fri, 23 Dec 2022 10:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2Q75Yng9i/DsNrudbJfEq6V66HXVn2yPVuBjaaqYtQ=;
 b=c7wf0MP3Rkn/qQNNfYwMb7a+NnWsDcMUQTiy8q0eWKiizGuIO6h9Ac098/KMkb6mDD
 Tr2cYqr7raL/UA3CJCcTibM7lKM14uFbXTh/xQIv8BIfruUJjgZUy8Em8Yat88zr1ygg
 MYPRYE4gsCSUIEJRRtQCiLqN8JCYGS/2wOdSpiQcrRPIuNM7u4/MTxGQvwG3nZzY2i/X
 ny5RJH4tZfiVwf6LcHGSTBz1GsNGFklYaytAgZX2xrHyCQW+zyAWB9fD2vSxoRQ4KXAv
 OBpHkTkbpnuTn66lIDjgDSwj7/F17N6uyE7Fd3s7xw6d6V9pIVR+I4CJSjQlgB5bwErL
 Cg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i2Q75Yng9i/DsNrudbJfEq6V66HXVn2yPVuBjaaqYtQ=;
 b=ui0QO3fzMl2Hx13WSC6VLX3qArzadxcD1wBvEwnmjPtBZ7uYurt+pq4sgJm2lcOUnW
 TH1sjVTCjKZobkOnFgZp4ZUG3yoDaQUF1dNnhHD2+ZKwnFeUH5PkPnygWBKY2jWXJSLW
 8M12q7hMyOyjftG16u+1CsizgtS//RQ+pCw3PfeeWzRGaGR4Am/NAzdkAULFyqTA4LkT
 1AU3uoVRPZPl+7AddgpLaJCPgPXzjGjYRozPOs3Z27Op1DmWTcEi/dor5d1baoHcpWQO
 EiIqmIVw+NpCrojt4Nn9qOHbaUrHy2IL/5WwMYVmbfGLJTg2vu/uP7TWGlmdHcoiXZmb
 iWfA==
X-Gm-Message-State: AFqh2kq0mnYFg3MqOWel0aswmG2yfCFs4Vt1HBSvUMfP0qqWJ1CmkNGR
 RSpHSU42violkwNlEBmnMJaKiun7LxdobD6b
X-Google-Smtp-Source: AMrXdXvHFrlyySfWqR/MclhsQQjd7pSRpo8V6Z1QTxZCg8bYDL3ajvEQK7KsovFoxn5AfiRlJJ8Vpw==
X-Received: by 2002:a17:906:a186:b0:803:4549:300b with SMTP id
 s6-20020a170906a18600b008034549300bmr10388579ejy.19.1671818428395; 
 Fri, 23 Dec 2022 10:00:28 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056402154e00b0047d4685878esm1734937edx.51.2022.12.23.10.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 10:00:27 -0800 (PST)
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
Subject: [PATCH v2 06/15] RISC-V: Adding XTheadCondMov ISA extension
Date: Fri, 23 Dec 2022 19:00:06 +0100
Message-Id: <20221223180016.2068508-7-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x62a.google.com
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

This patch adds support for the XTheadCondMov ISA extension.
The patch uses the T-Head specific decoder and translation.

Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Fix invalid use of register from dest_gpr()
- Use single decoder for XThead extensions

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |  2 ++
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 35 ++++++++++++++++++++++
 target/riscv/translate.c                   |  2 +-
 target/riscv/xthead.decode                 |  4 +++
 5 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 17273425a8..36a53784dd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -112,6 +112,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadbb, true, PRIV_VERSION_1_11_0, ext_xtheadbb),
     ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
+    ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
     ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
@@ -1069,6 +1070,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
     DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
+    DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5f68cb1e1e..01f035d8e9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -469,6 +469,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadbb;
     bool ext_xtheadbs;
     bool ext_xtheadcmo;
+    bool ext_xtheadcondmov;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
 
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index fb1f2c5731..bf549bbd74 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -40,6 +40,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_XTHEADCONDMOV(ctx) do {          \
+    if (!ctx->cfg_ptr->ext_xtheadcondmov) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADSYNC(ctx) do {             \
     if (!ctx->cfg_ptr->ext_xtheadsync) {         \
         return false;                            \
@@ -272,6 +278,35 @@ NOP_PRIVCHECK(th_l2cache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
 NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
 NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
 
+/* XTheadCondMov */
+
+static bool gen_th_condmove(DisasContext *ctx, arg_r *a, TCGCond cond)
+{
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv old = get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, old);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+/* th.mveqz: "if (rs2 == 0) rd = rs1;" */
+static bool trans_th_mveqz(DisasContext *ctx, arg_th_mveqz *a)
+{
+    REQUIRE_XTHEADCONDMOV(ctx);
+    return gen_th_condmove(ctx, a, TCG_COND_EQ);
+}
+
+/* th.mvnez: "if (rs2 != 0) rd = rs1;" */
+static bool trans_th_mvnez(DisasContext *ctx, arg_th_mveqz *a)
+{
+    REQUIRE_XTHEADCONDMOV(ctx);
+    return gen_th_condmove(ctx, a, TCG_COND_NE);
+}
+
 /* XTheadSync */
 
 static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas *a)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fc326e0a79..f15883b16b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -129,7 +129,7 @@ static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
 {
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
            ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
-           ctx->cfg_ptr->ext_xtheadsync;
+           ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadsync;
 }
 
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 8494805611..a8ebd8a18b 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -84,6 +84,10 @@ th_l2cache_call  0000000 10101 00000 000 00000 0001011
 th_l2cache_ciall 0000000 10111 00000 000 00000 0001011
 th_l2cache_iall  0000000 10110 00000 000 00000 0001011
 
+# XTheadCondMov
+th_mveqz         0100000 ..... .....  001 ..... 0001011 @r
+th_mvnez         0100001 ..... .....  001 ..... 0001011 @r
+
 # XTheadSync
 th_sfence_vmas   0000010 ..... ..... 000 00000 0001011 @rs2_s
 th_sync          0000000 11000 00000 000 00000 0001011
-- 
2.38.1


