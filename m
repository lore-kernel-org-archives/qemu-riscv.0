Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVXcC-0005yR-A2
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 08:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbt-0005le-8m
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:23:28 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:33668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbi-0003w1-Dz
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:23:19 -0400
Received: by mail-ed1-x536.google.com with SMTP id w2so14976365edc.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Sep 2022 05:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Yxbn8wlTHy7WglFSTrfT8DPtvWoSWM35aNvlLv9OrwI=;
 b=cMwc7DleCp1rKbjpPNfYfreGHZ6R1S65VSSYFEPzkBENf2QK2soXnOvc087rispmxa
 rfWuwyDEL+dXkujjIN0VhdM2YWaOd+xxLLKNrhgvCnUBo8obJOE6aWO+y+2AHCpV0Yy1
 CjdzA7T7iCthdRY9uU7KxpB0x1tp1iV2a2kX/jF/b0kud9ABKtLB6kRPjWLKEf0BZwP3
 IZ5mDo3fPT7SfogNkrEKLk3pxJOrapldF7p49R2aM+05o9Erkibdokti74sHaOui/yxd
 pA6zACMk+0UdXfvKe5j03KWcKPeq2MxStyPDc3oKsWO98yLPA/VrgMjIP+IY5uNmHu7b
 7ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Yxbn8wlTHy7WglFSTrfT8DPtvWoSWM35aNvlLv9OrwI=;
 b=GKB8iUgRopwDlBtAqEslmBgjSc9xTjK2m8pGPzGcs3raMRDkuBXcuSvoy/m9nEPwJi
 I/LPGFrJ3r7NbdCZnpWP75BvIAmbAZPmm8JERlrhYNZP4ZlzCswHBqytPmzxXmaboFdm
 3Vq7g/Ch/h/j/QlTbJIpfsq2Ym5xELOQwiyZz0T6Gli0Z//fBXwAOS0EAw2o+bC5rd6f
 Gw0NDAIa1auaL3wj/tKKHeEY6+QxySJeoKzNxBzpP14eJ6VN5H9L+IoRs75FIT/0yz1c
 DCqNLqk46slCrUV6BphQ/LVsKhhB+xTYnMS30yIXj/cVMJPxafbWqhWjcUoxABkMXnCd
 fd0Q==
X-Gm-Message-State: ACgBeo2buLU59nYjH2hSWKWw0GRhe0sNOd6EkYNWlFv9/ZmjERyLSCdq
 2zxtDVFjOHXYsGDGkJ2T8IdZHB+rv6PJj/d3
X-Google-Smtp-Source: AA6agR6Z0J1ZC6tGBDR0oClHYFURkIKD4ZWZB69yVcoxPbpycFEGmjJz1IcNz7B9X0JnupW+ogPX+Q==
X-Received: by 2002:a05:6402:493:b0:445:b5f0:7a0f with SMTP id
 k19-20020a056402049300b00445b5f07a0fmr46914092edv.120.1662466982099; 
 Tue, 06 Sep 2022 05:23:02 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b0073d6ab5bcaasm6479034ejd.212.2022.09.06.05.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:23:01 -0700 (PDT)
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
Subject: [PATCH 10/11] RISC-V: Adding T-Head FMemIdx extension
Date: Tue,  6 Sep 2022 14:22:42 +0200
Message-Id: <20220906122243.1243354-11-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This patch adds support for the T-Head FMemIdx instructions.
The patch uses the T-Head specific decoder and translation.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |   1 +
 target/riscv/cpu.h                         |   1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 121 +++++++++++++++++++++
 target/riscv/meson.build                   |   1 +
 target/riscv/translate.c                   |   3 +
 target/riscv/xtheadfmemidx.decode          |  34 ++++++
 6 files changed, 161 insertions(+)
 create mode 100644 target/riscv/xtheadfmemidx.decode

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0af9cc7bec..01d85f0f96 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -925,6 +925,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
+    DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, false),
     DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
     DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, false),
     DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 590a597f39..8b02f530a6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -445,6 +445,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadbs;
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
+    bool ext_xtheadfmemidx;
     bool ext_xtheadmac;
     bool ext_xtheadmemidx;
     bool ext_xtheadmempair;
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index 95c6b10d77..1a91371318 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -751,3 +751,124 @@ static bool trans_th_surb(DisasContext *ctx, arg_th_memidx *a)
     return gen_store_idx(ctx, a, MO_SB, true);
 }
 
+/*
+ * Load 64-bit float from indexed address.
+ * If !zero_extend_offset, then address is rs1 + (rs2 << imm2).
+ * If  zero_extend_offset, then address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static bool gen_fload_idx(DisasContext *ctx, arg_th_fmemidx *a, MemOp memop,
+                          bool zero_extend_offset)
+{
+    TCGv_i64 rd = cpu_fpr[a->rd];
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
+    tcg_gen_qemu_ld_i64(rd, addr, ctx->mem_idx, memop);
+    if ((memop & MO_SIZE) == MO_32) {
+        gen_nanbox_s(rd, rd);
+    }
+
+    mark_fs_dirty(ctx);
+    tcg_temp_free(addr);
+    return true;
+}
+
+/*
+ * Store 64-bit float to indexed address.
+ * If !zero_extend_offset, then address is rs1 + (rs2 << imm2).
+ * If  zero_extend_offset, then address is rs1 + (zext(rs2[31:0]) << imm2).
+ */
+static bool gen_fstore_idx(DisasContext *ctx, arg_th_fmemidx *a, MemOp memop,
+                           bool zero_extend_offset)
+{
+    TCGv_i64 rd = cpu_fpr[a->rd];
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
+    tcg_gen_qemu_st_i64(rd, addr, ctx->mem_idx, memop);
+
+    tcg_temp_free(addr);
+    return true;
+}
+
+static bool trans_th_flrd(DisasContext *ctx, arg_th_fmemidx *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    return gen_fload_idx(ctx, a, MO_TEUQ, false);
+}
+
+static bool trans_th_flrw(DisasContext *ctx, arg_th_fmemidx *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    return gen_fload_idx(ctx, a, MO_TEUL, false);
+}
+
+static bool trans_th_flurd(DisasContext *ctx, arg_th_fmemidx *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    return gen_fload_idx(ctx, a, MO_TEUQ, true);
+}
+
+static bool trans_th_flurw(DisasContext *ctx, arg_th_fmemidx *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    return gen_fload_idx(ctx, a, MO_TEUL, true);
+}
+
+static bool trans_th_fsrd(DisasContext *ctx, arg_th_fmemidx *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    return gen_fstore_idx(ctx, a, MO_TEUQ, false);
+}
+
+static bool trans_th_fsrw(DisasContext *ctx, arg_th_fmemidx *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    return gen_fstore_idx(ctx, a, MO_TEUL, false);
+}
+
+static bool trans_th_fsurd(DisasContext *ctx, arg_th_fmemidx *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVD);
+    return gen_fstore_idx(ctx, a, MO_TEUQ, true);
+}
+
+static bool trans_th_fsurw(DisasContext *ctx, arg_th_fmemidx *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_EXT(ctx, RVF);
+    return gen_fstore_idx(ctx, a, MO_TEUL, true);
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 30bb4c5bab..81175b67ce 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -7,6 +7,7 @@ gen = [
   decodetree.process('xtheadbs.decode', extra_args: '--static-decode=decode_xtheadbs'),
   decodetree.process('xtheadcmo.decode', extra_args: '--static-decode=decode_xtheadcmo'),
   decodetree.process('xtheadcondmov.decode', extra_args: '--static-decode=decode_xtheadcondmov'),
+  decodetree.process('xtheadfmemidx.decode', extra_args: '--static-decode=decode_xtheadfmemidx'),
   decodetree.process('xtheadmac.decode', extra_args: '--static-decode=decode_xtheadmac'),
   decodetree.process('xtheadmemidx.decode', extra_args: '--static-decode=decode_xtheadmemidx'),
   decodetree.process('xtheadmempair.decode', extra_args: '--static-decode=decode_xtheadmempair'),
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1cb0d885b8..915ac11d3b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -137,6 +137,7 @@ MATERIALISE_EXT_PREDICATE(xtheadbb)
 MATERIALISE_EXT_PREDICATE(xtheadbs)
 MATERIALISE_EXT_PREDICATE(xtheadcmo)
 MATERIALISE_EXT_PREDICATE(xtheadcondmov);
+MATERIALISE_EXT_PREDICATE(xtheadfmemidx);
 MATERIALISE_EXT_PREDICATE(xtheadmac);
 MATERIALISE_EXT_PREDICATE(xtheadmemidx);
 MATERIALISE_EXT_PREDICATE(xtheadmempair);
@@ -732,6 +733,7 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
 #include "decode-xtheadbs.c.inc"
 #include "decode-xtheadcmo.c.inc"
 #include "decode-xtheadcondmov.c.inc"
+#include "decode-xtheadfmemidx.c.inc"
 #include "decode-xtheadmac.c.inc"
 #include "decode-xtheadmemidx.c.inc"
 #include "decode-xtheadmempair.c.inc"
@@ -1061,6 +1063,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         { has_xtheadbs_p, decode_xtheadbs },
         { has_xtheadcmo_p, decode_xtheadcmo },
         { has_xtheadcondmov_p, decode_xtheadcondmov },
+        { has_xtheadfmemidx_p, decode_xtheadfmemidx },
         { has_xtheadmac_p, decode_xtheadmac },
         { has_xtheadmemidx_p, decode_xtheadmemidx },
         { has_xtheadmempair_p, decode_xtheadmempair },
diff --git a/target/riscv/xtheadfmemidx.decode b/target/riscv/xtheadfmemidx.decode
new file mode 100644
index 0000000000..43e0f80df8
--- /dev/null
+++ b/target/riscv/xtheadfmemidx.decode
@@ -0,0 +1,34 @@
+#
+# RISC-V instruction decode for the XTheadMemIdx extension
+#
+# Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.eu
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# The XTheadFMemIdx extension provides floating-point memory operations.
+#
+# It is documented in
+# https://github.com/T-head-Semi/thead-extension-spec/releases/download/2.0.0/xthead-2022-09-05-2.0.0.pdf
+
+# Fields
+%imm2       25:2
+%rs2        20:5
+%rs1        15:5
+%rd          7:5
+
+# Argument sets
+&th_fmemidx rd rs1 rs2 imm2
+
+# Formats
+@th_fmemidx ..... .. ..... ..... ... ..... ....... &th_fmemidx %rd %rs1 %rs2 %imm2
+
+# Instructions
+th_flrd     01100 .. ..... ..... 110 ..... 0001011 @th_fmemidx
+th_flrw     01000 .. ..... ..... 110 ..... 0001011 @th_fmemidx
+th_flurd    01110 .. ..... ..... 110 ..... 0001011 @th_fmemidx
+th_flurw    01010 .. ..... ..... 110 ..... 0001011 @th_fmemidx
+
+th_fsrd     01100 .. ..... ..... 111 ..... 0001011 @th_fmemidx
+th_fsrw     01000 .. ..... ..... 111 ..... 0001011 @th_fmemidx
+th_fsurd    01110 .. ..... ..... 111 ..... 0001011 @th_fmemidx
+th_fsurw    01010 .. ..... ..... 111 ..... 0001011 @th_fmemidx
-- 
2.37.2


