Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVXcB-0005uz-9B
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 08:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbt-0005lb-68
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:23:28 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbb-0003rC-Sx
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:23:17 -0400
Received: by mail-ej1-x62a.google.com with SMTP id bj12so22747893ejb.13
 for <qemu-riscv@nongnu.org>; Tue, 06 Sep 2022 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TdwaakR6p7hs8L+dX1B2H65CkrYYEFnR0eH2jeUCe3U=;
 b=DWxJDju0W8mFtTmmHH2skWFIS4BV+GtW09T8ueOEZalt7HA/TAiO+xx4hV2d6tfHR0
 /xi23p2McQKweUz5tXhNpxnImClkwOAWGFQ+01J+AvuMIWrOL/i7eGhezpaXgieW0xyR
 CFduqiTnStXfbsYeRqu9m4JsocpPo3LMRiluompBmLDJxjQJ//AjU3mKDmxo1pdPrZ0p
 1qsPkT1zBVKk12qsWolTDXDPs4hmAqUFKJr6YQnoB5zpspVK0Kq44avMb9LRDLuzHFo9
 73xxXYkPxVDLKjPEr3p21HHzwqpUzXZxXW4eC5o3WPG7uU1i718xEykBhKMXzMYQETS7
 HpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TdwaakR6p7hs8L+dX1B2H65CkrYYEFnR0eH2jeUCe3U=;
 b=L5U2WLJwM0f2xBRXdtmDxQPWWEKpBLzHkxUe3qMM2Ps2/BoAUc9FTNWtbmZSzl139J
 i1EuqpaC/zbtlurXxJY5kaDzVsEj3vf4KOeo6Z9dRb1BCRR/W1Ls8jXjR1pDPxW9hJGh
 9TlHRu2Jqvp8UxK0TgIPQKbeYsXjTgRL6LkQibnbzTXcXQHX6n/RgCrBJi9dbdYv8dUr
 SvTx3uzQWx+IyN3yjA3O9qdBHxEJaAuu4WIK/Dgscxn4fBL/FBAcbBvznEbuCbGgUNtO
 JAuYga4v2bU4dQjh8AGnbZx7aNHg0v4kk8kwnJQApxbTVqWaNdc15r0ZqY2vpJ43J6v5
 I+bg==
X-Gm-Message-State: ACgBeo3Rheg8gpoW2IdnI/ZI6+VjgjHWLPEK50t+QPXWuxfrjnA095mG
 T56BF/0RYLmfGGWP8VmAaNxMRHTjWbQg/7qb
X-Google-Smtp-Source: AA6agR4nLJfpE9ql16tHOKxWcEf5+vWxzBy9ngspSI0+RnbeWO1tBFukTQsLPoFLL5UDanZP0DH5gw==
X-Received: by 2002:a17:906:4fd2:b0:742:133b:3522 with SMTP id
 i18-20020a1709064fd200b00742133b3522mr26106485ejw.21.1662466980544; 
 Tue, 06 Sep 2022 05:23:00 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b0073d6ab5bcaasm6479034ejd.212.2022.09.06.05.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:23:00 -0700 (PDT)
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
Subject: [PATCH 09/11] RISC-V: Adding T-Head MemIdx extension
Date: Tue,  6 Sep 2022 14:22:41 +0200
Message-Id: <20220906122243.1243354-10-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 06 Sep 2022 12:23:30 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the T-Head MemIdx instructions.
The patch uses the T-Head specific decoder and translation.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |   1 +
 target/riscv/cpu.h                         |   1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 377 +++++++++++++++++++++
 target/riscv/meson.build                   |   1 +
 target/riscv/translate.c                   |   3 +
 target/riscv/xtheadmemidx.decode           |  73 ++++
 6 files changed, 456 insertions(+)
 create mode 100644 target/riscv/xtheadmemidx.decode

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9370722ffa..0af9cc7bec 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -926,6 +926,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
+    DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, false),
     DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xtheadxmae", RISCVCPU, cfg.ext_xtheadxmae, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6cc2d19075..590a597f39 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -446,6 +446,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
     bool ext_xtheadmac;
+    bool ext_xtheadmemidx;
     bool ext_xtheadmempair;
     bool ext_xtheadsync;
     bool ext_xtheadxmae;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index a2bae249fb..95c6b10d77 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -374,3 +374,380 @@ static bool trans_th_swd(DisasContext *ctx, arg_th_pair *a)
 {
     return gen_storepair_tl(ctx, a, MO_TESL, 3);
 }
+
+/*
+ * Load with memop from indexed address and add sext(imm5 << imm2) to rs1.
+ * If !preinc, then the address is rs1.
+ * If  preinc, then the address is rs1 + (sext(imm5) << imm2).
+ */
+static bool gen_load_inc(DisasContext *ctx, arg_th_meminc *a, MemOp memop,
+                         bool preinc)
+{
+    TCGv rd = dest_gpr(ctx, a->rd);
+    TCGv base = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+    TCGv offs = tcg_temp_new();
+
+    tcg_gen_movi_tl(offs, a->imm5);
+    tcg_gen_sextract_tl(offs, offs, 0, 5);
+    tcg_gen_shli_tl(offs, offs, a->imm2);
+
+    if (preinc) {
+        tcg_gen_add_tl(addr, base, offs);
+        if (get_xl(ctx) == MXL_RV32) {
+            tcg_gen_ext32u_tl(addr, addr);
+        }
+    } else {
+        tcg_gen_mov_tl(addr, base);
+    }
+
+    tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
+
+    if (!preinc) {
+        tcg_gen_add_tl(addr, base, offs);
+        if (get_xl(ctx) == MXL_RV32) {
+            tcg_gen_ext32u_tl(addr, addr);
+        }
+    }
+
+    gen_set_gpr(ctx, a->rd, rd);
+    gen_set_gpr(ctx, a->rs1, addr);
+
+    tcg_temp_free(addr);
+    tcg_temp_free(offs);
+    return true;
+}
+
+/*
+ * Store with memop to indexed address and add sext(imm5 << imm2) to rs1.
+ * If !preinc, then the address is rs1.
+ * If  preinc, then the address is rs1 + (sext(imm5) << imm2).
+ */
+static bool gen_store_inc(DisasContext *ctx, arg_th_meminc *a, MemOp memop,
+                          bool preinc)
+{
+    TCGv data = get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv base = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+    TCGv offs = tcg_temp_new();
+
+    tcg_gen_movi_tl(offs, a->imm5);
+    tcg_gen_sextract_tl(offs, offs, 0, 5);
+    tcg_gen_shli_tl(offs, offs, a->imm2);
+
+    if (preinc) {
+        tcg_gen_add_tl(addr, base, offs);
+        if (get_xl(ctx) == MXL_RV32) {
+            tcg_gen_ext32u_tl(addr, addr);
+        }
+    } else {
+        tcg_gen_mov_tl(addr, base);
+    }
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
+
+    if (!preinc) {
+        tcg_gen_add_tl(addr, base, offs);
+        if (get_xl(ctx) == MXL_RV32) {
+            tcg_gen_ext32u_tl(addr, addr);
+        }
+    }
+
+    gen_set_gpr(ctx, a->rs1, addr);
+
+    tcg_temp_free(addr);
+    tcg_temp_free(offs);
+    return true;
+}
+
+static bool trans_th_ldia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_ldib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_lwia(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_load_inc(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_lwib(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_load_inc(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_lwuia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TEUL, false);
+}
+
+static bool trans_th_lwuib(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_load_inc(ctx, a, MO_TEUL, true);
+}
+
+static bool trans_th_lhia(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_load_inc(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_lhib(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_load_inc(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_lhuia(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_load_inc(ctx, a, MO_TEUW, false);
+}
+
+static bool trans_th_lhuib(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_load_inc(ctx, a, MO_TEUW, true);
+}
+
+static bool trans_th_lbia(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_load_inc(ctx, a, MO_SB, false);
+}
+
+static bool trans_th_lbib(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_load_inc(ctx, a, MO_SB, true);
+}
+
+static bool trans_th_lbuia(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_load_inc(ctx, a, MO_UB, false);
+}
+
+static bool trans_th_lbuib(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_load_inc(ctx, a, MO_UB, true);
+}
+
+static bool trans_th_sdia(DisasContext *ctx, arg_th_meminc *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_store_inc(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_sdib(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_store_inc(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_swia(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_store_inc(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_swib(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_store_inc(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_shia(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_store_inc(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_shib(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_store_inc(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_sbia(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_store_inc(ctx, a, MO_SB, false);
+}
+
+static bool trans_th_sbib(DisasContext *ctx, arg_th_meminc *a)
+{
+    return gen_store_inc(ctx, a, MO_SB, true);
+}
+
+/*
+ * Load with memop from indexed address.
+ * If !zero_extend_offset, then address is rs1 + (rs2 << imm2).
+ * If  zero_extend_offset, then address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static bool gen_load_idx(DisasContext *ctx, arg_th_memidx *a, MemOp memop,
+                         bool zero_extend_offset)
+{
+    TCGv rd = dest_gpr(ctx, a->rd);
+    TCGv base = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv offs = get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    if (zero_extend_offset) {
+        tcg_gen_extract_tl(addr, offs, 0, 32);
+    } else {
+        tcg_gen_mov_tl(addr, offs);
+    }
+    tcg_gen_shli_tl(addr, addr, a->imm2);
+    tcg_gen_add_tl(addr, base, addr);
+
+    if (get_xl(ctx) == MXL_RV32) {
+        tcg_gen_ext32u_tl(addr, addr);
+    }
+
+    tcg_gen_qemu_ld_tl(rd, addr, ctx->mem_idx, memop);
+    gen_set_gpr(ctx, a->rd, rd);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+/*
+ * Store with memop to indexed address.
+ * If !zero_extend_offset, then address is rs1 + (rs2 << imm2).
+ * If  zero_extend_offset, then address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static bool gen_store_idx(DisasContext *ctx, arg_th_memidx *a, MemOp memop,
+                          bool zero_extend_offset)
+{
+    TCGv data = get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv base = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv offs = get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv addr = tcg_temp_new();
+
+    if (zero_extend_offset) {
+        tcg_gen_extract_tl(addr, offs, 0, 32);
+    } else {
+        tcg_gen_mov_tl(addr, offs);
+    }
+    tcg_gen_shli_tl(addr, addr, a->imm2);
+    tcg_gen_add_tl(addr, base, addr);
+
+    if (get_xl(ctx) == MXL_RV32) {
+        tcg_gen_ext32u_tl(addr, addr);
+    }
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool trans_th_lrd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_lrw(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_load_idx(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_lrwu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TEUL, false);
+}
+
+static bool trans_th_lrh(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_load_idx(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_lrhu(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_load_idx(ctx, a, MO_TEUW, false);
+}
+
+static bool trans_th_lrb(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_load_idx(ctx, a, MO_SB, false);
+}
+
+static bool trans_th_lrbu(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_load_idx(ctx, a, MO_UB, false);
+}
+
+static bool trans_th_srd(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_store_idx(ctx, a, MO_TESQ, false);
+}
+
+static bool trans_th_srw(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_store_idx(ctx, a, MO_TESL, false);
+}
+
+static bool trans_th_srh(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_store_idx(ctx, a, MO_TESW, false);
+}
+
+static bool trans_th_srb(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_store_idx(ctx, a, MO_SB, false);
+}
+static bool trans_th_lurd(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_lurw(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_load_idx(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_lurwu(DisasContext *ctx, arg_th_memidx *a)
+{
+    REQUIRE_64BIT(ctx);
+    return gen_load_idx(ctx, a, MO_TEUL, true);
+}
+
+static bool trans_th_lurh(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_load_idx(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_lurhu(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_load_idx(ctx, a, MO_TEUW, true);
+}
+
+static bool trans_th_lurb(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_load_idx(ctx, a, MO_SB, true);
+}
+
+static bool trans_th_lurbu(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_load_idx(ctx, a, MO_UB, true);
+}
+
+static bool trans_th_surd(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_store_idx(ctx, a, MO_TESQ, true);
+}
+
+static bool trans_th_surw(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_store_idx(ctx, a, MO_TESL, true);
+}
+
+static bool trans_th_surh(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_store_idx(ctx, a, MO_TESW, true);
+}
+
+static bool trans_th_surb(DisasContext *ctx, arg_th_memidx *a)
+{
+    return gen_store_idx(ctx, a, MO_SB, true);
+}
+
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 998f0ba336..30bb4c5bab 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -8,6 +8,7 @@ gen = [
   decodetree.process('xtheadcmo.decode', extra_args: '--static-decode=decode_xtheadcmo'),
   decodetree.process('xtheadcondmov.decode', extra_args: '--static-decode=decode_xtheadcondmov'),
   decodetree.process('xtheadmac.decode', extra_args: '--static-decode=decode_xtheadmac'),
+  decodetree.process('xtheadmemidx.decode', extra_args: '--static-decode=decode_xtheadmemidx'),
   decodetree.process('xtheadmempair.decode', extra_args: '--static-decode=decode_xtheadmempair'),
   decodetree.process('xtheadsync.decode', extra_args: '--static-decode=decode_xtheadsync'),
   decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 308de419cb..1cb0d885b8 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -138,6 +138,7 @@ MATERIALISE_EXT_PREDICATE(xtheadbs)
 MATERIALISE_EXT_PREDICATE(xtheadcmo)
 MATERIALISE_EXT_PREDICATE(xtheadcondmov);
 MATERIALISE_EXT_PREDICATE(xtheadmac);
+MATERIALISE_EXT_PREDICATE(xtheadmemidx);
 MATERIALISE_EXT_PREDICATE(xtheadmempair);
 MATERIALISE_EXT_PREDICATE(xtheadsync)
 MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
@@ -732,6 +733,7 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
 #include "decode-xtheadcmo.c.inc"
 #include "decode-xtheadcondmov.c.inc"
 #include "decode-xtheadmac.c.inc"
+#include "decode-xtheadmemidx.c.inc"
 #include "decode-xtheadmempair.c.inc"
 #include "decode-xtheadsync.c.inc"
 #include "decode-XVentanaCondOps.c.inc"
@@ -1060,6 +1062,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         { has_xtheadcmo_p, decode_xtheadcmo },
         { has_xtheadcondmov_p, decode_xtheadcondmov },
         { has_xtheadmac_p, decode_xtheadmac },
+        { has_xtheadmemidx_p, decode_xtheadmemidx },
         { has_xtheadmempair_p, decode_xtheadmempair },
         { has_xtheadsync_p, decode_xtheadsync },
         { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
diff --git a/target/riscv/xtheadmemidx.decode b/target/riscv/xtheadmemidx.decode
new file mode 100644
index 0000000000..d2e0f2af6f
--- /dev/null
+++ b/target/riscv/xtheadmemidx.decode
@@ -0,0 +1,73 @@
+#
+# RISC-V instruction decode for the XTheadMemIdx extension
+#
+# Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.eu
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# The XTheadMemIdx extension provides GPR memory operations.
+#
+# It is documented in
+# https://github.com/T-head-Semi/thead-extension-spec/releases/download/2.0.0/xthead-2022-09-05-2.0.0.pdf
+
+# Fields
+%imm2      25:2
+%imm5      20:5
+%rs2       20:5
+%rs1       15:5
+%rd         7:5
+
+# Argument sets
+&th_meminc      rd rs1 imm5 imm2
+&th_memidx      rd rs1 rs2 imm2
+
+# Formats:
+@th_meminc   ..... .. ..... ..... ... ..... ....... &th_meminc %rd %rs1 %imm5 %imm2
+@th_memidx   ..... .. ..... ..... ... ..... ....... &th_memidx %rd %rs1 %rs2 %imm2
+
+th_ldia      01111 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_ldib      01101 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwia      01011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwib      01001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwuia     11011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lwuib     11001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhia      00111 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhib      00101 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhuia     10111 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lhuib     10101 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbia      00011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbib      00001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbuia     10011 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_lbuib     10001 .. ..... ..... 100 ..... 0001011 @th_meminc
+th_sdia      01111 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_sdib      01101 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_swia      01011 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_swib      01001 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_shia      00111 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_shib      00101 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_sbia      00011 .. ..... ..... 101 ..... 0001011 @th_meminc
+th_sbib      00001 .. ..... ..... 101 ..... 0001011 @th_meminc
+
+th_lrd       01100 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrw       01000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrwu      11000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrh       00100 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrhu      10100 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrb       00000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lrbu      10000 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_srd       01100 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_srw       01000 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_srh       00100 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_srb       00000 .. ..... ..... 101 ..... 0001011 @th_memidx
+
+th_lurd      01110 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurw      01010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurwu     11010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurh      00110 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurhu     10110 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurb      00010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_lurbu     10010 .. ..... ..... 100 ..... 0001011 @th_memidx
+th_surd      01110 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_surw      01010 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_surh      00110 .. ..... ..... 101 ..... 0001011 @th_memidx
+th_surb      00010 .. ..... ..... 101 ..... 0001011 @th_memidx
-- 
2.37.2


