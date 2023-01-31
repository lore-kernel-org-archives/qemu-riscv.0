Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMx7e-00073W-Ud
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 15:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMx7T-0006vD-9L
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 15:20:43 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMx7Q-0002vK-4P
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 15:20:43 -0500
Received: by mail-wm1-x329.google.com with SMTP id bg26so5369872wmb.0
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 12:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=566M9qySxN23A71+uLC8/2FZUCFdWIxzeit6Cy0IHpE=;
 b=JmrILXtOD9SHgJ6R3EqpNLtq+ZJkzZ9HChifdx1XAaURYdVPHSmgHwfwcf7DG6v6XV
 7jmd7eXHZdAFUCAd6XCJ88fhUhVxg4mXRudbkVXsC5l7w3n30Wo7Jq4dxG/zs3qK30hU
 OvWbGGZ8LLBmIG4tyXstL/M59vFTypga8eQLWuLTdLylRkDwNp4QgOfARA1KHQ70gwcb
 XNcQm9s+KmRt7TOXkdO5/LoBUqL1GF3UIhoRaTmAgggAa0Sfu/wvJd5bASOkmdtD8yTR
 ez0LEsUSrs2XPVAPhaWDxSgtN7mU9AfOonIKEe5CVfDJIFQX5gtEtIzGc7/VRA2mIUC8
 EpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=566M9qySxN23A71+uLC8/2FZUCFdWIxzeit6Cy0IHpE=;
 b=kvIkL94SGdLPteCnmXGySv/rT5TaHFpCh/1eLhWqutR5ToQY6mgBYe3uP5/PehU3P5
 3YuHgKyk+2QtR44X62/QKoP5JRE6Y5Deeql15Nl3/xP0ljRa7M1fGsbwXaYq4N7kkvYW
 qbpcs1RWue3dOVp3IUcTC7D4hv1fwFlojlJtpintAIvwW1ABsoYyalLgdTSTBgOpFhg3
 OsxOY7JqDCuej3DP7PsCxJjB3XPza6JIqgZqq/EP0UbMa1rdLBybrkLDaRjOI9y5hLxx
 kX5tb08+JT+mA7mgP1qoGHbINPVj6mqhp+0aJirP1NphKChpOWO7zITIjc5Anle26U+O
 uYKQ==
X-Gm-Message-State: AFqh2kr7aXHsGuxgfUhq12r19P7zNhTsUgor8FJ4QM9NxeEPWQPIRGc4
 MaJKD1d7XP/zrU2gv4TK0Tx+q7F+XxXNVtW4
X-Google-Smtp-Source: AMrXdXvk4HQimGZ0PYNsLjHeA06UIiAXs6S98MNkgVYFNZ+h233NCyhKpJsHV54z30JaDQsZvPvDNw==
X-Received: by 2002:a05:600c:3495:b0:3db:a3a:4594 with SMTP id
 a21-20020a05600c349500b003db0a3a4594mr57673839wmq.28.1675196438062; 
 Tue, 31 Jan 2023 12:20:38 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 v2-20020adfe282000000b002bdec340a1csm15391977wri.110.2023.01.31.12.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 12:20:37 -0800 (PST)
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
Subject: [PATCH v5 13/14] RISC-V: Adding XTheadFmv ISA extension
Date: Tue, 31 Jan 2023 21:20:12 +0100
Message-Id: <20230131202013.2541053-14-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131202013.2541053-1-christoph.muellner@vrull.eu>
References: <20230131202013.2541053-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wm1-x329.google.com
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
X-List-Received-Date: Tue, 31 Jan 2023 20:20:43 -0000

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
index 8cbc5c9c1b..0dd2f0c753 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -116,6 +116,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
     ISA_EXT_DATA_ENTRY(xtheadfmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadfmemidx),
+    ISA_EXT_DATA_ENTRY(xtheadfmv, true, PRIV_VERSION_1_11_0, ext_xtheadfmv),
     ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadmac),
     ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadmemidx),
     ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xtheadmempair),
@@ -1134,6 +1135,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
     DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, false),
+    DEFINE_PROP_BOOL("xtheadfmv", RISCVCPU, cfg.ext_xtheadfmv, false),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
     DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, false),
     DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 60478f4a9c..7128438d8e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -480,6 +480,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
     bool ext_xtheadfmemidx;
+    bool ext_xtheadfmv;
     bool ext_xtheadmac;
     bool ext_xtheadmemidx;
     bool ext_xtheadmempair;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 37373732f6..be87c34f56 100644
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
index 216eaf9d12..182649dcb6 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -135,9 +135,9 @@ static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
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
2.39.1


