Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8mLk-0008CM-Gh
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 13:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLV-00083H-Np
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:39 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLT-0003MS-Ki
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 13:00:37 -0500
Received: by mail-ed1-x52a.google.com with SMTP id u28so3152366edd.10
 for <qemu-riscv@nongnu.org>; Fri, 23 Dec 2022 10:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DcLrSt0Jz6qTVgGJzqLGpFbg1+DOUpIeJUZBeCHJvC4=;
 b=LI6d6p2CtG8a+rz6ftbuES4gJwxoA7P7NBviHKdaKFsuZ3SWQOmOJV86DSeNQ1gEWk
 N7iNszaD0UuTAn6TZ2SM508DO5NPJUx92rXMplpdkE3rt16InnrjwmCHh3uBdaQU/zys
 QXO+K7ktD2Q7sVqW89Pl2VcfMSKeW7jkuWQ8VVigjBv16xQD/gIDNJOn6SZRwylwC4dq
 upnHornsjabeuE31IwLN7iYEjzFN7L1AsuwbteKz8JKVInwDkEWVLSEjOK6BoeHwUi9H
 pXAWTu6dwdO8eTbfLzzbN1gRtL4QbRL3ycd037zThE7mU12rNCuXZQ7ulIeHVKGyZlVz
 hGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DcLrSt0Jz6qTVgGJzqLGpFbg1+DOUpIeJUZBeCHJvC4=;
 b=qqjx44MjCpR1hVasuD9ccS/4YGfy8K5sw/+BV6AHFPJFqUHOOjXf8D32PuuVnClori
 eLYEDET80grWlKvEMexA4ROFUPP3ZdYRL1v6Eu81+cissRS33SaM2fflpEAQqAzphGcL
 Z/6oi2vnYZchrO9I7iPSrIQs2ZfNfH5z29JQDvxkl2PrOeqtSa8BHFMgtBkBHBhDNTVm
 ueG1PIa5bMS328gfwC335M1FcC3etVPIldNZGLsQGnpajIKTVvJUgjxToo2jz4tQ1l8l
 z3goz+rKCJJbvcitTvnhi+VTgQE8AcILS8YflvEW8NW1v0TJT/+VjtF8Z5ddm3EtbiH7
 w6nQ==
X-Gm-Message-State: AFqh2kpPGggJhlYmt1vYBG6YeXnrgktZz3cKw53LRwllpQxytqrMLEEi
 8amZjHFYQJFzVnXe0X2snaaUsnANQf4MLuch
X-Google-Smtp-Source: AMrXdXsrJJwmHcuSB1h8PQwIWQberVdq/vBNHS/cPK7amUjWL8tXyQ8JauTn0pUMy3YNTduSloPFeg==
X-Received: by 2002:aa7:c30b:0:b0:47b:a6e:6ba5 with SMTP id
 l11-20020aa7c30b000000b0047b0a6e6ba5mr8482884edq.12.1671818433819; 
 Fri, 23 Dec 2022 10:00:33 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056402154e00b0047d4685878esm1734937edx.51.2022.12.23.10.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 10:00:33 -0800 (PST)
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
Subject: [PATCH v2 10/15] RISC-V: Adding T-Head FMemIdx extension
Date: Fri, 23 Dec 2022 19:00:10 +0100
Message-Id: <20221223180016.2068508-11-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x52a.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 18:00:39 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the T-Head FMemIdx instructions.
The patch uses the T-Head specific decoder and translation.

Changes in v2:
- Add ISA_EXT_DATA_ENTRY()
- Use single decoder for XThead extensions
- Use get_th_address_indexed for address calculations

Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |   2 +
 target/riscv/cpu.h                         |   1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 108 +++++++++++++++++++++
 target/riscv/translate.c                   |   3 +-
 target/riscv/xthead.decode                 |  10 ++
 5 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1fbfb7ccc3..9c31a50e90 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -113,6 +113,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(xtheadbs, true, PRIV_VERSION_1_11_0, ext_xtheadbs),
     ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadcmo),
     ISA_EXT_DATA_ENTRY(xtheadcondmov, true, PRIV_VERSION_1_11_0, ext_xtheadcondmov),
+    ISA_EXT_DATA_ENTRY(xtheadfmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadfmemidx),
     ISA_EXT_DATA_ENTRY(xtheadmac, true, PRIV_VERSION_1_11_0, ext_xtheadmac),
     ISA_EXT_DATA_ENTRY(xtheadmemidx, true, PRIV_VERSION_1_11_0, ext_xtheadmemidx),
     ISA_EXT_DATA_ENTRY(xtheadmempair, true, PRIV_VERSION_1_11_0, ext_xtheadmempair),
@@ -1074,6 +1075,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
+    DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, false),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
     DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, false),
     DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 965dc46591..c97c1c0af0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -470,6 +470,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadbs;
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
+    bool ext_xtheadfmemidx;
     bool ext_xtheadmac;
     bool ext_xtheadmemidx;
     bool ext_xtheadmempair;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 02b82ac327..dc1a11070e 100644
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
@@ -349,6 +355,108 @@ static bool trans_th_mvnez(DisasContext *ctx, arg_th_mveqz *a)
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
index f5a870a2ac..fb77df721e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -129,7 +129,8 @@ static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
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
2.38.1


