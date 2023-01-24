Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPTA-0007FX-Fm
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 15:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSn-00077b-99
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:14 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSk-0002QZ-Hq
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:12 -0500
Received: by mail-wr1-x433.google.com with SMTP id q5so10337484wrv.0
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 12:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q9+zQh39mVWAlwYiAN7P95OGAalLBY1NLFgQJZ6tKY8=;
 b=Vd7iJoZBsECtYhQXNWFhEBzjiLD3KEx9JVd1oG+6JJV7vADd1ESAzcs8XVVWSeL5qh
 PVPW4mLhRyvIyYjp3N4Hr750rfOIrcORD+C2oLq35vy0kEs+uQfv2TF4tjLVvBXMQsi8
 RJxrwNOzC0t93kI97UGT3Z9WBottWWiB4Kywsfu9UZzE74Dd+YfrafPIIvIReFVPXq04
 cx0tPNaKi8zRIrMVVCwkSZ/TWSw4g5E9RSYgoi94W9Q/Av0SGnRPQ8I5qsyW/pOyDcY/
 vy/shLGUgpmrJGVWwIBrzVci4XJ28Mbfy0BrB6MXPk0npTbeasyfdfKENPkf4VYJ4uOC
 xCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q9+zQh39mVWAlwYiAN7P95OGAalLBY1NLFgQJZ6tKY8=;
 b=g9SrbpglzMBv9kd+j/WTYt4A8aS7Et7XGYAv/N6lHSu2oB0pA+AY9E1GESoRajUp5n
 0s/UTywAkj8LUL+Zmklum8vjhLD4McFV2anHDj85I/+5rL0Naik0coQA3/LhJJEyHYWr
 UXoMgED9AtzXeD8ALJcvhTwpeMfoZKMXFWU+MaH7dFHbw0gshWRIWxafMOeW4XBHYtyh
 N/BBX65WQLHWe5nnYxiF+qPJS6MNoEqCgVsBOHupgr0s/HuY1bwkfq9gS/nqsXhxK3Bf
 IG7bZenfAFgG15qR9nB1mZDskJk4bRePf4eS/R/zwriu9TVpEeT0UwpgRWFpq0nZutvE
 knZA==
X-Gm-Message-State: AFqh2kpgC6Xizijj6kq2+h45utmwHeHv6tnuhAF8rchdsYAI1QP6sc4B
 gYTEDNoB+JALBHKIGQyyY6T8NFFPCGhn0aBd
X-Google-Smtp-Source: AMrXdXvPd2L4W5qNftb4grN97Uotw9TV4WP9QH6EnfMnzilxmR2mJqGGdVc2zFiqUBgEVwgRbouBgg==
X-Received: by 2002:a5d:6b12:0:b0:242:7409:bbf with SMTP id
 v18-20020a5d6b12000000b0024274090bbfmr20888515wrw.54.1674590409442; 
 Tue, 24 Jan 2023 12:00:09 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm2607005wra.38.2023.01.24.12.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 12:00:08 -0800 (PST)
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
Subject: [PATCH v3 13/14] RISC-V: Adding XTheadFmv ISA extension
Date: Tue, 24 Jan 2023 20:59:44 +0100
Message-Id: <20230124195945.181842-14-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124195945.181842-1-christoph.muellner@vrull.eu>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Tue, 24 Jan 2023 20:00:16 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the XTheadFmv ISA extension.
The patch uses the T-Head specific decoder and translation.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |  2 +
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 45 ++++++++++++++++++++++
 target/riscv/translate.c                   |  6 +--
 target/riscv/xthead.decode                 |  4 ++
 5 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 627512a184..1878c17a59 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -115,6 +115,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
     ISA_EXT_DATA_ENTRY(xtheadfmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadfmemidx),
+    ISA_EXT_DATA_ENTRY(xtheadfmv, true, PRIV_VERSION_1_11_0, ext_xtheadfmv),
     ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadmac),
     ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadmemidx),
     ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xtheadmempair),
@@ -1116,6 +1117,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
     DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, false),
+    DEFINE_PROP_BOOL("xtheadfmv", RISCVCPU, cfg.ext_xtheadfmv, false),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
     DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, false),
     DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 134dc29c6e..04630f3b79 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -481,6 +481,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
     bool ext_xtheadfmemidx;
+    bool ext_xtheadfmv;
     bool ext_xtheadmac;
     bool ext_xtheadmemidx;
     bool ext_xtheadmempair;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index dc82a9fc03..0403e90d7a 100644
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
@@ -449,6 +455,45 @@ static bool trans_th_fsurw(DisasContext *ctx, arg_th_memidx *a)
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
index c52bc5e0af..d6163daeb2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -133,9 +133,9 @@ static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
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
2.39.0


