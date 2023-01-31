Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMx7C-0006lw-6Y
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 15:20:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMx7A-0006kb-5I
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 15:20:24 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMx78-0002kG-0l
 for qemu-riscv@nongnu.org; Tue, 31 Jan 2023 15:20:23 -0500
Received: by mail-wr1-x433.google.com with SMTP id q5so15398098wrv.0
 for <qemu-riscv@nongnu.org>; Tue, 31 Jan 2023 12:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZegSXhsxlv9N/vVZ4WumTWFg4tDXkbLvsFx6aF6o0o=;
 b=PdQ76napMucS6ZFXKtiVthT5n3g+Nk7UEI/iL3OV9tarSnW0eohkaUx0fhrKFZariY
 G/YAqZA6LcO5C29DlEWsY/5zAwbyLZFxvL9MvO8yLl1x1wTnQVmem1msfLhYexqkg3r9
 lgbFfgLTbSTWxDvTv35CXn24UjKML5ymhzDO2nvQ7kj+Wq615P7n6iJr4KbWfjNwzr7y
 wvVPbANIbfssKhpC2Es/fpVzFztdpUsRrxwuS4GhCa6/2HhoiUuz1K8dtK5UcA4+Pz01
 mv1k0d6klX/MRVmgCeXL4n0+U503KgGr6hMRk8dSpHVj+6niRWHYlU6uTeU+ovSGe6DM
 60Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZegSXhsxlv9N/vVZ4WumTWFg4tDXkbLvsFx6aF6o0o=;
 b=iON2aFtFxUQXgjZL6/0WSroiaa+QLb8yq/J6T5QSieYKAdUNjIhnvg8E4L3+FfmRoX
 upIxN/vja1Zt46Rm82qnr9Mutg+WbOdPsmU2wo8Ke3q5bcGEfY5iNC6mPE7l7LWsBrj/
 nulKXxTmsygi7iMKmpDNjmq2eII9lvgtvh59ucC8vfbLSX1jQTp+PGS6pqAa6PcmKy6Y
 mhUYOclIwBGf5ojFZJfTgXdwUkw6U0d9Bw0/ZSm3+d0Ai0qtMbxoCJXjhguOzowGG84w
 L1eRZcqvRd72UhBwmWJgyI/GX4aovLtCkH5dB7wRTT6jqyD3vXZz4s25LtDgwKFRLRJC
 Nffg==
X-Gm-Message-State: AO0yUKVY1s6njsrd6yTarc2+5JZ+p4MCTiu/58RdcUWcAAkUAl7JslQH
 ryxXe+uguzdwgqM7LNjpMustMpym2wWX3DWQ
X-Google-Smtp-Source: AK7set8xZkkJTRapDFZvayCPpWi241jYZ9/yRVak4kdiRprHY9fYPlGjqklO5R2JKXjZTRahGzut5A==
X-Received: by 2002:a5d:5602:0:b0:2bd:dd13:170f with SMTP id
 l2-20020a5d5602000000b002bddd13170fmr261996wrv.26.1675196420075; 
 Tue, 31 Jan 2023 12:20:20 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 v2-20020adfe282000000b002bdec340a1csm15391977wri.110.2023.01.31.12.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 12:20:19 -0800 (PST)
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
Subject: [PATCH v5 02/14] RISC-V: Adding XTheadSync ISA extension
Date: Tue, 31 Jan 2023 21:20:01 +0100
Message-Id: <20230131202013.2541053-3-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131202013.2541053-1-christoph.muellner@vrull.eu>
References: <20230131202013.2541053-1-christoph.muellner@vrull.eu>
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
X-List-Received-Date: Tue, 31 Jan 2023 20:20:24 -0000

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

Changes in v4:
- Drop decode_save_opc() in trans_th_sfence_vmas()

 target/riscv/cpu.c                         |  2 +
 target/riscv/cpu.h                         |  1 +
 target/riscv/helper.h                      |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 85 ++++++++++++++++++++++
 target/riscv/op_helper.c                   |  6 ++
 target/riscv/translate.c                   |  2 +-
 target/riscv/xthead.decode                 |  9 +++
 7 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6ea61e5b22..f76639845d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -110,6 +110,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
+    ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xtheadsync),
     ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
 };
 
@@ -1090,6 +1091,7 @@ static Property riscv_cpu_extensions[] = {
 
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
+    DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
     /* These are experimental so mark with 'x-' */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d3ebc6f112..ea00586436 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -474,6 +474,7 @@ struct RISCVCPUConfig {
 
     /* Vendor-specific custom extensions */
     bool ext_xtheadcmo;
+    bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
 
     uint8_t pmu_num;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 58a30f03d6..0497370afd 100644
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
index 24acaf188c..f35bf6ea89 100644
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
@@ -79,3 +85,82 @@ NOP_PRIVCHECK(th_icache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MSU)
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
index 1e29ac9886..0657a4bea2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -132,7 +132,7 @@ static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
 
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
2.39.1


