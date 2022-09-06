Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVXcD-00060t-7l
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 08:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbi-0005gO-Nu
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:23:11 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbW-0003sO-VQ
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:23:03 -0400
Received: by mail-ej1-x62e.google.com with SMTP id gb36so22773771ejc.10
 for <qemu-riscv@nongnu.org>; Tue, 06 Sep 2022 05:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BkvWtveihlbHGzWrmOD3R7Q8EqBt46lT5/dQA1FAtlQ=;
 b=itrGn3CHAnOwnM0CrvxqPlJeWTHLwXPDrIfPgTXOImeSEFUH+BVVLAFktd8RtMIPpP
 Uawty9rJLz1YS5DaxBjka9aBpqtM47YW2w37aDuBQERr4+EOastPMj57V5oXjAOVgK9G
 mdE3gx9XPW1rzGXW9rnjP0LjZOt4Q8VnKQ344SXFBWgMKlwcSfBPDj2fTGzY3XWRa67V
 qn05eG18I4aPnMD2qBRhZOe+Ta/KQZt7WjmrWXwAC5kOnJrPnBGlPfySzQVtCc/1xXCU
 TeDRg6LNA0Fb+H7HB4LBDgPFExejcHw2aQMXwQng8Qq6pA3maG0qMRgcAcAeBPfC48eA
 ukNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BkvWtveihlbHGzWrmOD3R7Q8EqBt46lT5/dQA1FAtlQ=;
 b=VPbMJ1Aj8jhkgjvxeINpCZsZlqM7lEui/jvRxcPY1ophmot36U/PyYZ0uUOfqX1HbF
 bVwMdWazADWd7HRPmUm7pPi3XRHCm371A1Q8TFDAqj8Zftl+QPwUo+LICobnSaYL2p8u
 eO13ecIPLUdsB0a/U0BBtj0DIP/t/oExkrxh4RxcBwhcnBZxAC2AhpN1HXNAC4Lreiyv
 VUSVKP1H1tk9cTQD/3ZpQ52IUL4pSEJccXgfEEJdia15T8LQs/yu3XdNjLKWFAtstJq3
 sCFvK6/XTDxnIMjJUxoU/cL2TMVmKb+eowDGTQfqQLJXNZWNEmkAz10LhM1Z23BOEWNo
 m43Q==
X-Gm-Message-State: ACgBeo1/IBJvxt6lvt2GHpO3U+jkXFrdqxIrOaX7dlhQbTEvvFzh1g3r
 reht/LPBxuQI4LfUgeT/k+6nS8BPr4laXaIW
X-Google-Smtp-Source: AA6agR4aSNfrI5CsoMZsK3LfAJd8nnfTfw8NV/RzXMbrY6coaX4wK25UayHNUC/cHa0T+6HZTs6RRQ==
X-Received: by 2002:a17:906:eecb:b0:73c:5bcb:8eb3 with SMTP id
 wu11-20020a170906eecb00b0073c5bcb8eb3mr39295434ejb.284.1662466976299; 
 Tue, 06 Sep 2022 05:22:56 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b0073d6ab5bcaasm6479034ejd.212.2022.09.06.05.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:22:55 -0700 (PDT)
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
Subject: [PATCH 06/11] RISC-V: Adding T-Head multiply-accumulate instructions
Date: Tue,  6 Sep 2022 14:22:38 +0200
Message-Id: <20220906122243.1243354-7-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x62e.google.com
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
X-List-Received-Date: Tue, 06 Sep 2022 12:23:11 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the T-Head MAC instructions.
The patch uses the T-Head specific decoder and translation.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |  1 +
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 67 ++++++++++++++++++++++
 target/riscv/meson.build                   |  1 +
 target/riscv/translate.c                   |  3 +
 target/riscv/xtheadmac.decode              | 30 ++++++++++
 6 files changed, 103 insertions(+)
 create mode 100644 target/riscv/xtheadmac.decode

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b7d6dbd28e..e2d74fa701 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -925,6 +925,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
     DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
+    DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0b58b38335..d0dc4ab031 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -445,6 +445,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadbs;
     bool ext_xtheadcmo;
     bool ext_xtheadcondmov;
+    bool ext_xtheadmac;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
 
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index da3a538400..fc8307b113 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -217,3 +217,70 @@ static bool trans_th_mvnez(DisasContext *ctx, arg_th_mveqz *a)
 {
     return gen_th_condmove(ctx, a, TCG_COND_NE);
 }
+
+static bool gen_th_mac(DisasContext *ctx, arg_r *a,
+                       void (*accumulate_func)(TCGv, TCGv, TCGv),
+                       void (*extend_operand_func)(TCGv, TCGv))
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src0 = get_gpr(ctx, a->rd, EXT_NONE);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+    TCGv tmp = tcg_temp_new();
+
+    if (extend_operand_func) {
+        TCGv tmp2 = tcg_temp_new();
+        extend_operand_func(tmp, src1);
+        extend_operand_func(tmp2, src2);
+        tcg_gen_mul_tl(tmp, tmp, tmp2);
+        tcg_temp_free(tmp2);
+    } else {
+        tcg_gen_mul_tl(tmp, src1, src2);
+    }
+
+    accumulate_func(dest, src0, tmp);
+    gen_set_gpr(ctx, a->rd, dest);
+    tcg_temp_free(tmp);
+
+    return true;
+}
+
+/* th.mula: "rd = rd + rs1 * rs2" */
+static bool trans_th_mula(DisasContext *ctx, arg_th_mula *a)
+{
+    return gen_th_mac(ctx, a, tcg_gen_add_tl, NULL);
+}
+
+/* th.mulah: "rd = sext.w(rd + sext.w(rs1[15:0]) * sext.w(rs2[15:0]))" */
+static bool trans_th_mulah(DisasContext *ctx, arg_th_mulah *a)
+{
+    ctx->ol = MXL_RV32;
+    return gen_th_mac(ctx, a, tcg_gen_add_tl, tcg_gen_ext16s_tl);
+}
+
+/* th.mulaw: "rd = sext.w(rd + rs1 * rs2)" */
+static bool trans_th_mulaw(DisasContext *ctx, arg_th_mulaw *a)
+{
+    ctx->ol = MXL_RV32;
+    return gen_th_mac(ctx, a, tcg_gen_add_tl, NULL);
+}
+
+/* th.muls: "rd = rd - rs1 * rs2" */
+static bool trans_th_muls(DisasContext *ctx, arg_th_muls *a)
+{
+    return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
+}
+
+/* th.mulsh: "rd = sext.w(rd - sext.w(rs1[15:0]) * sext.w(rs2[15:0]))" */
+static bool trans_th_mulsh(DisasContext *ctx, arg_th_mulsh *a)
+{
+    ctx->ol = MXL_RV32;
+    return gen_th_mac(ctx, a, tcg_gen_sub_tl, tcg_gen_ext16s_tl);
+}
+
+/* th.mulsw: "rd = sext.w(rd - rs1 * rs2)" */
+static bool trans_th_mulsw(DisasContext *ctx, arg_th_mulsw *a)
+{
+    ctx->ol = MXL_RV32;
+    return gen_th_mac(ctx, a, tcg_gen_sub_tl, NULL);
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 496ae37f26..55c019e55b 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -7,6 +7,7 @@ gen = [
   decodetree.process('xtheadbs.decode', extra_args: '--static-decode=decode_xtheadbs'),
   decodetree.process('xtheadcmo.decode', extra_args: '--static-decode=decode_xtheadcmo'),
   decodetree.process('xtheadcondmov.decode', extra_args: '--static-decode=decode_xtheadcondmov'),
+  decodetree.process('xtheadmac.decode', extra_args: '--static-decode=decode_xtheadmac'),
   decodetree.process('xtheadsync.decode', extra_args: '--static-decode=decode_xtheadsync'),
   decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
 ]
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 986243df99..56cc89ce4a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -137,6 +137,7 @@ MATERIALISE_EXT_PREDICATE(xtheadbb)
 MATERIALISE_EXT_PREDICATE(xtheadbs)
 MATERIALISE_EXT_PREDICATE(xtheadcmo)
 MATERIALISE_EXT_PREDICATE(xtheadcondmov);
+MATERIALISE_EXT_PREDICATE(xtheadmac);
 MATERIALISE_EXT_PREDICATE(xtheadsync)
 MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
 
@@ -729,6 +730,7 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
 #include "decode-xtheadbs.c.inc"
 #include "decode-xtheadcmo.c.inc"
 #include "decode-xtheadcondmov.c.inc"
+#include "decode-xtheadmac.c.inc"
 #include "decode-xtheadsync.c.inc"
 #include "decode-XVentanaCondOps.c.inc"
 
@@ -1055,6 +1057,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         { has_xtheadbs_p, decode_xtheadbs },
         { has_xtheadcmo_p, decode_xtheadcmo },
         { has_xtheadcondmov_p, decode_xtheadcondmov },
+        { has_xtheadmac_p, decode_xtheadmac },
         { has_xtheadsync_p, decode_xtheadsync },
         { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
     };
diff --git a/target/riscv/xtheadmac.decode b/target/riscv/xtheadmac.decode
new file mode 100644
index 0000000000..dda1f82334
--- /dev/null
+++ b/target/riscv/xtheadmac.decode
@@ -0,0 +1,30 @@
+#
+# RISC-V instruction decode for the XTheadMac extension
+#
+# Copyright (c) 2022 Christoph Muellner, christoph.muellner@vrull.eu
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# The XTheadMac extension provides multiply-accumulate instructions.
+#
+# It is documented in
+# https://github.com/T-head-Semi/thead-extension-spec/releases/download/2.0.0/xthead-2022-09-05-2.0.0.pdf
+
+# Fields
+%rs2       20:5
+%rs1       15:5
+%rd        7:5
+
+# Argument sets
+&r         rd rs1 rs2		!extern
+
+# Formats:
+@r          ..... .. ..... ..... ... ..... ....... &r %rs2 %rs1 %rd
+
+# T-Head conditional move instructions
+th_mula     00100 00 ..... ..... 001 ..... 0001011 @r
+th_mulah    00101 00 ..... ..... 001 ..... 0001011 @r
+th_mulaw    00100 10 ..... ..... 001 ..... 0001011 @r
+th_muls     00100 01 ..... ..... 001 ..... 0001011 @r
+th_mulsh    00101 01 ..... ..... 001 ..... 0001011 @r
+th_mulsw    00100 11 ..... ..... 001 ..... 0001011 @r
-- 
2.37.2


