Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKPSn-00077I-7O
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 15:00:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSj-00075L-7L
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:09 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pKPSg-0002dj-TL
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 15:00:08 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r9so14993738wrw.4
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 12:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BOIMfR1iKfjeilVKVBY4Kcss34AGLODZYWBqwis70Pc=;
 b=Xvq6FqvyNU9m1fb0hEGZrf8rqWthfP7OyE12Bp0XR3cauJiUMz2yrD6mVjSDr7YpWE
 i4Jj5B2+kSbppYw6UKTzbd/kQNLH8H9kZWvUW23XF42zUPbut5l9XpfJigJMLcTDbTTw
 d+r8DRuGP5euYheK9YhnTK/F0U12W2ncdL2uAea4PcR6haiW5XWHZcofWSXxvJEHxplE
 BGYt7m//n9oFev1pBORGnRPAV5n8kMWeLLXaNGYJ6Q4cw4bCohkjlFl5ffzzBiYzb/Fn
 mwAdGtWoRtqd5NHsjN6gzrPtj1g4WN4A0QtkF70alq5k/A+3ore+h2NGkR2EICeZoigI
 mSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BOIMfR1iKfjeilVKVBY4Kcss34AGLODZYWBqwis70Pc=;
 b=z9rGeZ3RUvKiXf9kRTgY96PXt+x5bdSzmtfwTqQDE3DsMYIV6Oh0XqXUYcXzokz6R5
 0R+5ut/uTXkzIa8VW0UhmWWlDupaHwWhqg3+3g1WRX98r1zIUCsSTVQsi0SshI4LhOKG
 wZeroXIeWWyta15CZq8uu10tlGwg1BgSv8d11D6PVf7PUL3Cy6Gpc74JNiB7M1aciyS7
 3DX9V3kRoqoDVYetCI/9Z+hlB3jitFfNRF1TItUtUtTCg329j6ndXdvVm6ks+X4h8flp
 VdUar/A8HS1ENx9kR8yZorUyO0utgIwBm4/I23QJDxwpwNNcdnj552PS0FtFQFDnnZFe
 7Etg==
X-Gm-Message-State: AO0yUKW5rre4wNUHejsYmlXweqgBS7ADL0ckgOkTjZAOlvcAe5H71+3L
 8wYk2qYFCRLo8x4klCzy0/Z6mZ0Mf6eV5z9d
X-Google-Smtp-Source: AK7set+cJdBrMmNrsEclH0SL06BQM333S+/3nZZv51AyAVqit8tHliT8+nZF+XyketdyPDF/QNqygA==
X-Received: by 2002:adf:f3d1:0:b0:2bf:ad2a:dd9f with SMTP id
 g17-20020adff3d1000000b002bfad2add9fmr4332963wrp.24.1674590405046; 
 Tue, 24 Jan 2023 12:00:05 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm2607005wra.38.2023.01.24.12.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 12:00:04 -0800 (PST)
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
Subject: [PATCH v3 10/14] RISC-V: Adding T-Head FMemIdx extension
Date: Tue, 24 Jan 2023 20:59:41 +0100
Message-Id: <20230124195945.181842-11-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124195945.181842-1-christoph.muellner@vrull.eu>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wr1-x42c.google.com
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
X-List-Received-Date: Tue, 24 Jan 2023 20:00:10 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the T-Head FMemIdx instructions.
The patch uses the T-Head specific decoder and translation.

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Use single decoder for XThead extensions
- Use get_th_address_indexed for address calculations

 target/riscv/cpu.c                         |   2 +
 target/riscv/cpu.h                         |   1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 108 +++++++++++++++++++++
 target/riscv/translate.c                   |   3 +-
 target/riscv/xthead.decode                 |  10 ++
 5 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index eb8bbfa436..6121a5e4ba 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -114,6 +114,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
+    ISA_EXT_DATA_ENTRY(xtheadfmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadfmemidx),
     ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadmac),
     ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadmemidx),
     ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xtheadmempair),
@@ -1085,6 +1086,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
+    DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, false),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
     DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, false),
     DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4882b9a9cc..b0ec5fcf9e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -478,6 +478,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadbs;
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
+    bool ext_xtheadfmemidx;
     bool ext_xtheadmac;
     bool ext_xtheadmemidx;
     bool ext_xtheadmempair;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index e41f3be9a6..dc82a9fc03 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -46,6 +46,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_XTHEADFMEMIDX(ctx) do {          \
+    if (!ctx->cfg_ptr->ext_xtheadfmemidx) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_XTHEADMAC(ctx) do {              \
     if (!ctx->cfg_ptr->ext_xtheadmac) {          \
         return false;                            \
@@ -341,6 +347,108 @@ static bool trans_th_mvnez(DisasContext *ctx, arg_th_mveqz *a)
     return gen_th_condmove(ctx, a, TCG_COND_NE);
 }
 
+/* XTheadFMem */
+
+/*
+ * Load 64-bit float from indexed address.
+ * If !zext_offs, then address is rs1 + (rs2 << imm2).
+ * If  zext_offs, then address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static bool gen_fload_idx(DisasContext *ctx, arg_th_memidx *a, MemOp memop,
+                          bool zext_offs)
+{
+    TCGv_i64 rd = cpu_fpr[a->rd];
+    TCGv addr = get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, zext_offs);
+
+    tcg_gen_qemu_ld_i64(rd, addr, ctx->mem_idx, memop);
+    if ((memop & MO_SIZE) == MO_32) {
+        gen_nanbox_s(rd, rd);
+    }
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+/*
+ * Store 64-bit float to indexed address.
+ * If !zext_offs, then address is rs1 + (rs2 << imm2).
+ * If  zext_offs, then address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static bool gen_fstore_idx(DisasContext *ctx, arg_th_memidx *a, MemOp memop,
+                           bool zext_offs)
+{
+    TCGv_i64 rd = cpu_fpr[a->rd];
+    TCGv addr = get_th_address_indexed(ctx, a->rs1, a->rs2, a->imm2, zext_offs);
+
+    tcg_gen_qemu_st_i64(rd, addr, ctx->mem_idx, memop);
+
+    return true;
+}
+
+static bool trans_th_flrd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    return gen_fload_idx(ctx, a, MO_TEUQ, false);
+}
+
+static bool trans_th_flrw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    return gen_fload_idx(ctx, a, MO_TEUL, false);
+}
+
+static bool trans_th_flurd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    return gen_fload_idx(ctx, a, MO_TEUQ, true);
+}
+
+static bool trans_th_flurw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    return gen_fload_idx(ctx, a, MO_TEUL, true);
+}
+
+static bool trans_th_fsrd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    return gen_fstore_idx(ctx, a, MO_TEUQ, false);
+}
+
+static bool trans_th_fsrw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    return gen_fstore_idx(ctx, a, MO_TEUL, false);
+}
+
+static bool trans_th_fsurd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    return gen_fstore_idx(ctx, a, MO_TEUQ, true);
+}
+
+static bool trans_th_fsurw(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_XTHEADFMEMIDX(ctx);
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    return gen_fstore_idx(ctx, a, MO_TEUL, true);
+}
+
 /* XTheadMac */
 
 static bool gen_th_mac(DisasContext *ctx, arg_r *a,
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2461bcda0f..c52bc5e0af 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -132,7 +132,8 @@ static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
 {
     return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
            ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
-           ctx->cfg_ptr->ext_xtheadcondmov || ctx->cfg_ptr->ext_xtheadmac ||
+           ctx->cfg_ptr->ext_xtheadcondmov ||
+           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadmac ||
            ctx->cfg_ptr->ext_xtheadmemidx || ctx->cfg_ptr->ext_xtheadmempair ||
            ctx->cfg_ptr->ext_xtheadsync;
 }
diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
index 69e40f22dc..81daf1d694 100644
--- a/target/riscv/xthead.decode
+++ b/target/riscv/xthead.decode
@@ -100,6 +100,16 @@ th_l2cache_iall  0000000 10110 00000 000 00000 0001011
 th_mveqz         0100000 ..... .....  001 ..... 0001011 @r
 th_mvnez         0100001 ..... .....  001 ..... 0001011 @r
 
+# XTheadFMemIdx
+th_flrd          01100 .. ..... ..... 110 ..... 0001011 @th_memidx
+th_flrw          01000 .. ..... ..... 110 ..... 0001011 @th_memidx
+th_flurd         01110 .. ..... ..... 110 ..... 0001011 @th_memidx
+th_flurw         01010 .. ..... ..... 110 ..... 0001011 @th_memidx
+th_fsrd          01100 .. ..... ..... 111 ..... 0001011 @th_memidx
+th_fsrw          01000 .. ..... ..... 111 ..... 0001011 @th_memidx
+th_fsurd         01110 .. ..... ..... 111 ..... 0001011 @th_memidx
+th_fsurw         01010 .. ..... ..... 111 ..... 0001011 @th_memidx
+
 # XTheadMac
 th_mula          00100 00 ..... ..... 001 ..... 0001011 @r
 th_mulah         00101 00 ..... ..... 001 ..... 0001011 @r
-- 
2.39.0


