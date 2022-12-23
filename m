Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8mLl-0008Dg-Ca
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 13:00:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLb-00085S-Im
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:44 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLZ-0003FA-Kr
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:43 -0500
Received: by mail-ed1-x536.google.com with SMTP id m19so7989487edj.8
 for <qemu-riscv@nongnu.org>; Fri, 23 Dec 2022 10:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c2AT7lmGqf53Ff2n7N9yZqOwx3Ulmp0EnQc2SrxgImA=;
 b=oRtXYVqLQApt6769IhKa2F/OoDSeN8et/yX1HCJcVg/ZLjUmYhr/J0a+Si+KDV02L4
 P+B3NdF1ft1OKlJm64pJSGpqTtEcpizs20vIf/nPZM2X8Rysw4PCfmu6Ojb1K8oiTe+U
 /5bMdQHXgxHSKWZwsSytGs0izvBe/U/jLWsSNkSCoi5fVs76NfYQEyekFUiEez/sz2YL
 gWdzoTEbtXVwjxySuhgFoMx6JaSPswGA6Y2c5spUJjX2JZvt9qScwddHT5rQFUA+OPoW
 oWlOisLtqB+dSgpeRUfisvWvXNYCkiLK8Dsq3tejtmUUaoaXOle0tQhx4VJYskcSutpQ
 j8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2AT7lmGqf53Ff2n7N9yZqOwx3Ulmp0EnQc2SrxgImA=;
 b=mIXOPmV0kW2m2eZyMCtMSuRSZ7mCv4FxCotH127rTxt0k1UvYvCL/e8r1/oLG+Jwh/
 /TCXwrJdkQK7Xkjk3o/ksYwl4wSV+75EAr1vvuMDgl/QkvW+wQQ5sLb8Q8GJLCRw/Obe
 sCmN+YIFpi3TRQoHKCQxlhNQAlxWrFJ6tdR+ZlR8bZ7RksAsiIe5Kx4liOkRdyGNPD3d
 SWgki6IKpEIpzvTpgd5g3gfBc7PiExgg92V1u5sY2XAiHNF3vZ8zKCrZoQTkhLSaG9Ia
 pTIkDt2g7nCkRPQXOHVE2XDJc7V0j8lzuR8cgT3tr3JqlCP2EWTuwV1caHGCbDHz+0md
 Z17g==
X-Gm-Message-State: AFqh2kpXeM5K4Ct+/b7N8giTj4nAaK6Ur789zCrX0ordTc2X4MfTyqAX
 ilNLKVm92n3M5xchlzeRmqNRlK8KIDJMZ5D8
X-Google-Smtp-Source: AMrXdXvHF4F9MdNI1C0HBiRVC8jZcFK7GPps2Q0SmePJ0HygfbZTMdQbUeDH+NfKSqfGu+VGNShJ+w==
X-Received: by 2002:a05:6402:528f:b0:47e:eaae:9a69 with SMTP id
 en15-20020a056402528f00b0047eeaae9a69mr7011616edb.41.1671818439331; 
 Fri, 23 Dec 2022 10:00:39 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056402154e00b0047d4685878esm1734937edx.51.2022.12.23.10.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 10:00:38 -0800 (PST)
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
Subject: [PATCH v2 14/15] RISC-V: Adding XTheadFmv ISA extension
Date: Fri, 23 Dec 2022 19:00:14 +0100
Message-Id: <20221223180016.2068508-15-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x536.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 18:00:45 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the XTheadFmv ISA extension.
The patch uses the T-Head specific decoder and translation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |  2 +
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 45 ++++++++++++++++++++++
 target/riscv/translate.c                   |  6 +--
 target/riscv/xthead.decode                 |  4 ++
 5 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d3d8587710..d3f711cc41 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -114,6 +114,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
     ISA_EXT_DATA_ENTRY(xtheadfmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadfmemidx),
+    ISA_EXT_DATA_ENTRY(xtheadfmv, true, PRIV_VERSION_1_11_0, ext_xtheadfmv),
     ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadmac),
     ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadmemidx),
     ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xtheadmempair),
@@ -1107,6 +1108,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
     DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, false),
+    DEFINE_PROP_BOOL("xtheadfmv", RISCVCPU, cfg.ext_xtheadfmv, false),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
     DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, false),
     DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 28184bbe40..154c16208a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -473,6 +473,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
     bool ext_xtheadfmemidx;
+    bool ext_xtheadfmv;
     bool ext_xtheadmac;
     bool ext_xtheadmemidx;
     bool ext_xtheadmempair;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index dc1a11070e..12d5af4f75 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -52,6 +52,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_XTHEADFMV(ctx) do {              \
+    if (!ctx->cfg_ptr->ext_xtheadfmv) {          \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADMAC(ctx) do {              \
     if (!ctx->cfg_ptr->ext_xtheadmac) {          \
         return false;                            \
@@ -457,6 +463,45 @@ static bool trans_th_fsurw(DisasContext *ctx, arg_th_memidx *a)
     return gen_fstore_idx(ctx, a, MO_TEUL, true);
 }
 
+/* XTheadFmv */
+
+static bool trans_th_fmv_hw_x(DisasContext *ctx, arg_th_fmv_hw_x *a)
+{
+    REQUIRE_XTHEADFMV(ctx);
+    REQUIRE_32BIT(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
+    TCGv_i64 t1 = tcg_temp_new_i64();
+
+    tcg_gen_extu_tl_i64(t1, src1);
+    tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd], t1, 32, 32);
+    tcg_temp_free_i64(t1);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_th_fmv_x_hw(DisasContext *ctx, arg_th_fmv_x_hw *a)
+{
+    REQUIRE_XTHEADFMV(ctx);
+    REQUIRE_32BIT(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    TCGv dst;
+    TCGv_i64 t1;
+
+    dst = dest_gpr(ctx, a->rd);
+    t1 = tcg_temp_new_i64();
+
+    tcg_gen_extract_i64(t1, cpu_fpr[a->rs1], 32, 32);
+    tcg_gen_trunc_i64_tl(dst, t1);
+    gen_set_gpr(ctx, a->rd, dst);
+    tcg_temp_free_i64(t1);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
 /* XTheadMac */
 
 static bool gen_th_mac(DisasContext *ctx, arg_r *a,
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fb77df721e..1c54c3c67d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -130,9 +130,9 @@ static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
            ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
            ctx->cfg_ptr->ext_xtheadcondmov ||
-           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadmac ||
-           ctx->cfg_ptr->ext_xtheadmemidx || ctx->cfg_ptr->ext_xtheadmempair ||
-           ctx->cfg_ptr->ext_xtheadsync;
+           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadfmv ||
+           ctx->cfg_ptr->ext_xtheadmac || ctx->cfg_ptr->ext_xtheadmemidx ||
+           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsync;
 }
 
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 81daf1d694..d1d104bcf2 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -110,6 +110,10 @@ th_fsrw          01000 .. ..... ..... 111 ..... 0001011 @th_memidx
 th_fsurd         01110 .. ..... ..... 111 ..... 0001011 @th_memidx
 th_fsurw         01010 .. ..... ..... 111 ..... 0001011 @th_memidx
 
+# XTheadFmv
+th_fmv_hw_x      1010000  00000 ..... 001 ..... 0001011 @r2
+th_fmv_x_hw      1100000  00000 ..... 001 ..... 0001011 @r2
+
 # XTheadMac
 th_mula          00100 00 ..... ..... 001 ..... 0001011 @r
 th_mulah         00101 00 ..... ..... 001 ..... 0001011 @r
-- 
2.38.1


