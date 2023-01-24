Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPSY-0006yv-H3
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 14:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSX-0006yL-1M
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 14:59:57 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSV-0002PN-4W
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 14:59:56 -0500
Received: by mail-wr1-x433.google.com with SMTP id e3so14976658wru.13
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 11:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fj56hxiujpOItyZlhW6MrQ4GGK8G/yx/wceOHNKGO5A=;
 b=s2IoOfom5XZO5FcEI9TqD++AtD772D3wppTUce0KPbaSbwaR+f9rgqgWC7yCoVBdI2
 bhSRoiIaDOL7O9KdhLVM0iDrPKByCTnaqc4U4X1G1Sffp7oLvQR21AWcrxEQSFJvMN+1
 CT8C9ZPY0EWMm6gYUG1NFTpbmuXq9b0J2ulnlNzF1Lr2psUQTJ9RQJvLklNMNRVSOEE8
 2LGK1n6fLuopIZR3vWZAvcGZFeVGN8X62ON/58TRxu33DcKEhPBPa+oYpBQp42VkfrU7
 VvN6HA7kV9vCNaeRq0s8PSseuwGBNXfx+PC4LgqHlw+lTVLswkKvzeiVy/932suUtP6q
 x/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fj56hxiujpOItyZlhW6MrQ4GGK8G/yx/wceOHNKGO5A=;
 b=H20Byhd8whKG1lVJVizrxjD3Gdqwpsxf0ztqhfVwfYR9gdOQoYHef7EBNLRQrKgWUe
 H/mAz8MoHVmTkRBHIseO0mawpvudvBhK5GXcjCjBIM2eFd0W5Q5LYXTet1FjHLXbL1qo
 8We/fY6jF/P26bz8/6ErcW3alA1zMOJps3FvR+cizAPlHzBL85dgzoLMm5VTqzmMuknr
 4QwnNcbXmFJ81vi9IGS6PXHXT0+EH7ZPNuMPQnf7tyuSQ2o/EuLCJ+C0Dmzwu1hi6EpJ
 2/r9WZro2fcs23VZbs9hB1GH8qfQ1TFbj/8Sm924dpsCv2IxGjPULZKugGxifWmSaVzo
 pXPA==
X-Gm-Message-State: AO0yUKW4T7W2TPk0/P0yWVdhgQkY8jlbZDTkC+j1Q+e1Xj+yIrXynCzw
 wFQ0kXeAJHVZZcAqeX0XNLkav9xEoauVYnhe
X-Google-Smtp-Source: AK7set8X1FYgS7LHMKHoCPiymjtnSGP0Z/5Bzbk286qQIi3DgDWPvDh8yOrWQ8tS5BfWKyF30aZLlg==
X-Received: by 2002:a5d:58e9:0:b0:2bf:b65f:d144 with SMTP id
 f9-20020a5d58e9000000b002bfb65fd144mr898174wrd.50.1674590393237; 
 Tue, 24 Jan 2023 11:59:53 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm2607005wra.38.2023.01.24.11.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 11:59:52 -0800 (PST)
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
Subject: [PATCH v3 02/14] RISC-V: Adding XTheadSync ISA extension
Date: Tue, 24 Jan 2023 20:59:33 +0100
Message-Id: <20230124195945.181842-3-christoph.muellner@vrull.eu>
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
X-List-Received-Date: Tue, 24 Jan 2023 19:59:57 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the XTheadSync ISA extension.
The patch uses the T-Head specific decoder and translation.

The implementation introduces a helper to execute synchronization tasks:
helper_tlb_flush_all() performs a synchronized TLB flush on all CPUs.

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Use helper to synchronize CPUs and perform TLB flushes
- Change implemenation to follow latest spec update
- Use single decoder for XThead extensions

Changes in v3:
- Adjust for renamed REQUIRE_PRIV_* test macros

 target/riscv/cpu.c                         |  2 +
 target/riscv/cpu.h                         |  1 +
 target/riscv/helper.h                      |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 86 ++++++++++++++++++++++
 target/riscv/op_helper.c                   |  6 ++
 target/riscv/translate.c                   |  2 +-
 target/riscv/xthead.decode                 |  9 +++
 7 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 43a3b9218f..ae2009e89c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -110,6 +110,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
+    ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
 
@@ -1073,6 +1074,7 @@ static Property riscv_cpu_extensions[] = {
 
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
+    DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
     /* These are experimental so mark with 'x-' */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 680dd3dfbd..d0ab5c7bb0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -474,6 +474,7 @@ struct RISCVCPUConfig {
 
     /* Vendor-specific custom extensions */
     bool ext_xtheadcmo;
+    bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
 
     uint8_t pmu_num;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 227c7122ef..d22656698a 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -109,6 +109,7 @@ DEF_HELPER_1(sret, tl, env)
 DEF_HELPER_1(mret, tl, env)
 DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
+DEF_HELPER_1(tlb_flush_all, void, env)
 /* Native Debug */
 DEF_HELPER_1(itrigger_match, void, env)
 #endif
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 24acaf188c..bf5b39c749 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -22,6 +22,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_XTHEADSYNC(ctx) do {             \
+    if (!ctx->cfg_ptr->ext_xtheadsync) {         \
+        return false;                            \
+    }                                            \
+} while (0)
+
 /* XTheadCmo */
 
 static inline int priv_level(DisasContext *ctx)
@@ -79,3 +85,83 @@ NOP_PRIVCHECK(th_icache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MSU)
 NOP_PRIVCHECK(th_l2cache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
 NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
 NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
+
+/* XTheadSync */
+
+static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas *a)
+{
+    (void) a;
+    REQUIRE_XTHEADSYNC(ctx);
+
+#ifndef CONFIG_USER_ONLY
+    REQUIRE_PRIV_MS(ctx);
+    decode_save_opc(ctx);
+    gen_helper_tlb_flush_all(cpu_env);
+    return true;
+#else
+    return false;
+#endif
+}
+
+#ifndef CONFIG_USER_ONLY
+static void gen_th_sync_local(DisasContext *ctx)
+{
+    /*
+     * Emulate out-of-order barriers with pipeline flush
+     * by exiting the translation block.
+     */
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    tcg_gen_exit_tb(NULL, 0);
+    ctx->base.is_jmp = DISAS_NORETURN;
+}
+#endif
+
+static bool trans_th_sync(DisasContext *ctx, arg_th_sync *a)
+{
+    (void) a;
+    REQUIRE_XTHEADSYNC(ctx);
+
+#ifndef CONFIG_USER_ONLY
+    REQUIRE_PRIV_MSU(ctx);
+
+    /*
+     * th.sync is an out-of-order barrier.
+     */
+    gen_th_sync_local(ctx);
+
+    return true;
+#else
+    return false;
+#endif
+}
+
+static bool trans_th_sync_i(DisasContext *ctx, arg_th_sync_i *a)
+{
+    (void) a;
+    REQUIRE_XTHEADSYNC(ctx);
+
+#ifndef CONFIG_USER_ONLY
+    REQUIRE_PRIV_MSU(ctx);
+
+    /*
+     * th.sync.i is th.sync plus pipeline flush.
+     */
+    gen_th_sync_local(ctx);
+
+    return true;
+#else
+    return false;
+#endif
+}
+
+static bool trans_th_sync_is(DisasContext *ctx, arg_th_sync_is *a)
+{
+    /* This instruction has the same behaviour like th.sync.i. */
+    return trans_th_sync_i(ctx, a);
+}
+
+static bool trans_th_sync_s(DisasContext *ctx, arg_th_sync_s *a)
+{
+    /* This instruction has the same behaviour like th.sync. */
+    return trans_th_sync(ctx, a);
+}
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 878bcb03b8..48f918b71b 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -258,6 +258,12 @@ void helper_tlb_flush(CPURISCVState *env)
     }
 }
 
+void helper_tlb_flush_all(CPURISCVState *env)
+{
+    CPUState *cs = env_cpu(env);
+    tlb_flush_all_cpus_synced(cs);
+}
+
 void helper_hyp_tlb_flush(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 37763e0502..dcda7cfd22 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -130,7 +130,7 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
 
 static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
 {
-    return ctx->cfg_ptr->ext_xtheadcmo;
+    return ctx->cfg_ptr->ext_xtheadcmo || ctx->cfg_ptr->ext_xtheadsync;
 }
 
 #define MATERIALISE_EXT_PREDICATE(ext)  \
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 30533a66f5..1d86f3a012 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -10,9 +10,11 @@
 
 # Fields:
 %rs1       15:5
+%rs2       20:5
 
 # Formats
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
+@rs2_s      ....... ..... ..... ... ..... .......   %rs2 %rs1
 
 # XTheadCmo
 th_dcache_call   0000000 00001 00000 000 00000 0001011
@@ -36,3 +38,10 @@ th_icache_iva    0000001 10000 ..... 000 00000 0001011 @sfence_vm
 th_l2cache_call  0000000 10101 00000 000 00000 0001011
 th_l2cache_ciall 0000000 10111 00000 000 00000 0001011
 th_l2cache_iall  0000000 10110 00000 000 00000 0001011
+
+# XTheadSync
+th_sfence_vmas   0000010 ..... ..... 000 00000 0001011 @rs2_s
+th_sync          0000000 11000 00000 000 00000 0001011
+th_sync_i        0000000 11010 00000 000 00000 0001011
+th_sync_is       0000000 11011 00000 000 00000 0001011
+th_sync_s        0000000 11001 00000 000 00000 0001011
-- 
2.39.0


