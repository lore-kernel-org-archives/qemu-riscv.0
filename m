Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaZs-0003Wo-QR
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:44:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZq-0003P7-Hs
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:44:22 -0500
Received: from [2607:f8b0:4864:20::42e] (port=33389
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZb-0007t1-C3
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:44:22 -0500
Received: by mail-pf1-x42e.google.com with SMTP id x5so7823059pfr.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BzOQQ3aXowz6eHNp8NQ6mjckjPtIAiBkkyWVr2PJPc0=;
 b=hC+J8eBi5wfjJVqThqauuIus8GARBZeP6u5u3Pns3yRv6OwmjU1OMtm1su76WRs1VO
 SRxiKmEUd7MKAcGSmmIlvo7Sq2vq3gOqZJSxaiMfcR7OGxUcjwkuGux7WQ7mJ4DvDVGv
 f1XzoGqj1Z6jERcvRGg9vqn45TL9mmGO2kmQ5tXZJYPt3bA/7nskMwzle69yG9gkBKjG
 B24behGAkeTnaiHBTH5hwhmwWl3YytrqxUBqkt9sns1bLpiHmyUMbuPo8rMFws7Lyh+7
 WGFP6nSHlRgstGKELj2etGWUHFQ5rPfHw39YZ15c5N8S+/rzts+ierDQyjG8CUt6Rfcg
 HuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BzOQQ3aXowz6eHNp8NQ6mjckjPtIAiBkkyWVr2PJPc0=;
 b=jmF90gB2LGksgAEytDTIlxt5Na/OMZHeXCorRZACu1VFztxzEcFBoJNL2YuRt1AiD2
 OxKc3GXWzTjv4HztEcxY8UKRMZGCM74Cwq3NRcXgwonffMHPsyLnm+QzSSRoydxMjF4W
 GCsoyRHLU2wzC7tpWNZ9UnjXl3fsYEb4sYfXjupFrFKMd+DvzZPzFTs1gpyPKLZN3Ec7
 Sg/xPgNYQnh12xsZRVdCDCvFmtSxJHMCsKqZC1afFPwisyj1nEF7A3DwW3QRPdgJ2oXz
 hV1gL4Jrvab1yXNvBrYEP4QnfRWnzelA5xsIXUrhsbh8Gp0K753Sme9WBra/fw8QPwBQ
 /o2A==
X-Gm-Message-State: AOAM531HS4dx1At0EuDvbfXhcCTXfTJ7zt5glO/oOhC/4MiPayJA8XA7
 zihLRNL5bvhrt2VYO+8MYoSeipj/bsCcoEOc
X-Google-Smtp-Source: ABdhPJwkIuT4sEdd0jE93H2ewxO2nRutMsyHEZZNx0Lx7lC3VJyuWeUMOQrj8irVVoIV3+IgjEU7XA==
X-Received: by 2002:a63:c142:: with SMTP id p2mr38606779pgi.576.1639122246149; 
 Thu, 09 Dec 2021 23:44:06 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id g17sm1737704pgh.46.2021.12.09.23.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:44:05 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>, Kito Cheng <kito.cheng@sifive.com>
Subject: [PATCH v6 7/8] target/riscv: zfh: implement zfhmin extension
Date: Fri, 10 Dec 2021 15:43:26 +0800
Message-Id: <20211210074329.5775-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210074329.5775-1-frank.chang@sifive.com>
References: <20211210074329.5775-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:44:22 -0000

From: Frank Chang <frank.chang@sifive.com>

Zfhmin extension is a subset of Zfh extension, consisting only of data
transfer and conversion instructions.

If enabled, only the following instructions from Zfh extension are
included:
  * flh, fsh, fmv.x.h, fmv.h.x, fcvt.s.h, fcvt.h.s
  * If D extension is present: fcvt.d.h, fcvt.h.d

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                        |  1 +
 target/riscv/insn_trans/trans_rvzfh.c.inc | 22 ++++++++++++++--------
 target/riscv/translate.c                  |  2 ++
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 570c49f365..ef677f9092 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -313,6 +313,7 @@ struct RISCVCPU {
         bool ext_ifencei;
         bool ext_icsr;
         bool ext_zfh;
+        bool ext_zfhmin;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 0549e25fb4..5a7cac8958 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -22,13 +22,19 @@
     }                         \
 } while (0)
 
+#define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
+    if (!(ctx->ext_zfh || ctx->ext_zfhmin)) { \
+        return false;                         \
+    }                                         \
+} while (0)
+
 static bool trans_flh(DisasContext *ctx, arg_flh *a)
 {
     TCGv_i64 dest;
     TCGv t0;
 
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
@@ -50,7 +56,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
     TCGv t0;
 
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
@@ -283,7 +289,7 @@ static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
 static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_s_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
@@ -296,7 +302,7 @@ static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
 static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
     REQUIRE_EXT(ctx, RVD);
 
     gen_set_rm(ctx, a->rm);
@@ -311,7 +317,7 @@ static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
 static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_h_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
@@ -324,7 +330,7 @@ static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
 static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
     REQUIRE_EXT(ctx, RVD);
 
     gen_set_rm(ctx, a->rm);
@@ -441,7 +447,7 @@ static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fcvt_h_wu *a)
 static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     TCGv dest = dest_gpr(ctx, a->rd);
 
@@ -461,7 +467,7 @@ static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 static bool trans_fmv_h_x(DisasContext *ctx, arg_fmv_h_x *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
 
     TCGv t0 = get_gpr(ctx, a->rs1, EXT_ZERO);
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 93f9ec0c8b..d445954dc7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -74,6 +74,7 @@ typedef struct DisasContext {
     bool virt_enabled;
     bool ext_ifencei;
     bool ext_zfh;
+    bool ext_zfhmin;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -644,6 +645,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->ext_zfh = cpu->cfg.ext_zfh;
+    ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
     ctx->vlen = cpu->cfg.vlen;
     ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
-- 
2.31.1


