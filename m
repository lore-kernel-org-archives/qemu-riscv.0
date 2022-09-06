Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVXc2-0005mq-Pp
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 08:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbZ-0005d2-BL
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:23:06 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oVXbV-0003rt-31
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 08:23:01 -0400
Received: by mail-ej1-x632.google.com with SMTP id u9so22823872ejy.5
 for <qemu-riscv@nongnu.org>; Tue, 06 Sep 2022 05:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aOh7zsauraP9R+VJcwE2IKulzqyQTi8hmp+P1Bbj1v8=;
 b=X8Bhk+zGm0SurfMSG/2whlaE+11OEG8+E39qPS4Wg4/F8nUgNaZInDb8uJzjwSEklR
 6/YeVn8KXXsLr1m3/Hzt7ijS7ZcCC3U69pWecCRtEPmAEh+YbbNgsnIYKDR0PliEpL5Y
 An5dlVbw5d+QbyW2hAllcDbw/YrRbsT5G2KyLGk8FlQNO/22MXSS+4h0bA6PCidqtAgd
 Lm6+Y0lJ7IwLcDPWavaBPwPqIR1pLLIjZ/57uXz226MKK6eO5CW01K+Te+MAfVqOZT8T
 rWxzrW03Nbn8cIv/b7EPumigrVFPcngh2okh0FuNPWWh67gZNYRxBRBprZN/bshE338r
 By3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aOh7zsauraP9R+VJcwE2IKulzqyQTi8hmp+P1Bbj1v8=;
 b=TAybJXiJmrDB4M47vbMZjRQ+RqzO/bGvGnNj4JiTQs5lQJgon/X0EeuqWtqN/xQ/0m
 0DERXQIXnO2zc/6gAHgplN5YWVNfvtseC/egcZGuhH/dRPUKJ8o5IRlSjPl3d7azJbJE
 bi57tMNFsQIGaM311CbzS/wfZjz64yM9v9qEzW+F2UQy452AQvw5I8cKrFUSSPy01otg
 dBvHWSr5G3Ma9qhWt4PccWUOl3SNTpZiXa/1JVmXcqObcUiHIH95katZQ5akQmmjY+YT
 aQkgJ1S4OrCc+R4814IszLDVy/WNROE0n4sVkBCQgH8r64ky2f8doz/20OkLDF4PNLcz
 NXqg==
X-Gm-Message-State: ACgBeo2s/ixt6KdtifvUt66+iax8WSF7YrTcgiv93SQhVKjIN+wsmYtB
 qxtsn7TkDy1dytKiJg5agivuRJaknWxiudxz
X-Google-Smtp-Source: AA6agR4x6aHQtS3I+QxXgWppTmliap7/p0eVHDqcGs694rgyLrAfOZkhvKly3SpsF79ZmOff4RQKaA==
X-Received: by 2002:a17:906:9c82:b0:6e1:1d6c:914c with SMTP id
 fj2-20020a1709069c8200b006e11d6c914cmr1616044ejc.769.1662466974878; 
 Tue, 06 Sep 2022 05:22:54 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b0073d6ab5bcaasm6479034ejd.212.2022.09.06.05.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:22:54 -0700 (PDT)
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
Subject: [PATCH 05/11] RISC-V: Adding T-Head CondMov instructions
Date: Tue,  6 Sep 2022 14:22:37 +0200
Message-Id: <20220906122243.1243354-6-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x632.google.com
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
X-List-Received-Date: Tue, 06 Sep 2022 12:23:08 -0000

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch adds support for the T-Head CondMov instructions.
The patch uses the T-Head specific decoder and translation.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c                         |  1 +
 target/riscv/cpu.h                         |  1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 23 +++++++++++++++
 target/riscv/meson.build                   |  1 +
 target/riscv/translate.c                   |  3 ++
 target/riscv/xtheadcondmov.decode          | 33 ++++++++++++++++++++++
 6 files changed, 62 insertions(+)
 create mode 100644 target/riscv/xtheadcondmov.decode

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d129a6112a..b7d6dbd28e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -924,6 +924,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
     DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
     DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
+    DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
     DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9e2b3d6f56..0b58b38335 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -444,6 +444,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadbb;
     bool ext_xtheadbs;
     bool ext_xtheadcmo;
+    bool ext_xtheadcondmov;
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
 
diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
index b2d523b905..da3a538400 100644
--- a/target/riscv/insn_trans/trans_xthead.c.inc
+++ b/target/riscv/insn_trans/trans_xthead.c.inc
@@ -194,3 +194,26 @@ static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
 }
 
+static bool gen_th_condmove(DisasContext *ctx, arg_r *a, TCGCond cond)
+{
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, dest);
+
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+/* th.mveqz: "if (rs2 == 0) rd = rs1;" */
+static bool trans_th_mveqz(DisasContext *ctx, arg_th_mveqz *a)
+{
+    return gen_th_condmove(ctx, a, TCG_COND_EQ);
+}
+
+/* th.mvnez: "if (rs2 != 0) rd = rs1;" */
+static bool trans_th_mvnez(DisasContext *ctx, arg_th_mveqz *a)
+{
+    return gen_th_condmove(ctx, a, TCG_COND_NE);
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 5ee37683cb..496ae37f26 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -6,6 +6,7 @@ gen = [
   decodetree.process('xtheadbb.decode', extra_args: '--static-decode=decode_xtheadbb'),
   decodetree.process('xtheadbs.decode', extra_args: '--static-decode=decode_xtheadbs'),
   decodetree.process('xtheadcmo.decode', extra_args: '--static-decode=decode_xtheadcmo'),
+  decodetree.process('xtheadcondmov.decode', extra_args: '--static-decode=decode_xtheadcondmov'),
   decodetree.process('xtheadsync.decode', extra_args: '--static-decode=decode_xtheadsync'),
   decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
 ]
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f662e403f8..986243df99 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -136,6 +136,7 @@ MATERIALISE_EXT_PREDICATE(xtheadba)
 MATERIALISE_EXT_PREDICATE(xtheadbb)
 MATERIALISE_EXT_PREDICATE(xtheadbs)
 MATERIALISE_EXT_PREDICATE(xtheadcmo)
+MATERIALISE_EXT_PREDICATE(xtheadcondmov);
 MATERIALISE_EXT_PREDICATE(xtheadsync)
 MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
 
@@ -727,6 +728,7 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
 #include "decode-xtheadbb.c.inc"
 #include "decode-xtheadbs.c.inc"
 #include "decode-xtheadcmo.c.inc"
+#include "decode-xtheadcondmov.c.inc"
 #include "decode-xtheadsync.c.inc"
 #include "decode-XVentanaCondOps.c.inc"
 
@@ -1052,6 +1054,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         { has_xtheadbb_p, decode_xtheadbb },
         { has_xtheadbs_p, decode_xtheadbs },
         { has_xtheadcmo_p, decode_xtheadcmo },
+        { has_xtheadcondmov_p, decode_xtheadcondmov },
         { has_xtheadsync_p, decode_xtheadsync },
         { has_XVentanaCondOps_p,  decode_XVentanaCodeOps },
     };
diff --git a/target/riscv/xtheadcondmov.decode b/target/riscv/xtheadcondmov.decode
new file mode 100644
index 0000000000..00f9ca96c6
--- /dev/null
+++ b/target/riscv/xtheadcondmov.decode
@@ -0,0 +1,33 @@
+#
+# RISC-V instruction decode for the XTheadCondMov extension
+#
+# Copyright (c) 2022 Dr. Philipp Tomsich, philipp.tomsich@vrull.eu
+#                    Christoph Muellner, christoph.muellner@vrull.eu
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# The XTheadCondMov extension provides conditional move instructions.
+#
+# It is documented in
+# https://github.com/T-head-Semi/thead-extension-spec/releases/download/2.0.0/xthead-2022-09-05-2.0.0.pdf
+#
+# The instructions contained in XTheadCondMov are:
+# - th.mveqz      move to register, if condition is zero
+# - th.mvnez      move to register, if condition is non-zero
+#
+# These instructions reuse existing instruction formats.
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
+@r          ....... ..... .....  ... ..... ....... &r %rs2 %rs1 %rd
+
+# T-Head conditional move instructions
+th_mveqz    0100000 ..... .....  001 ..... 0001011 @r
+th_mvnez    0100001 ..... .....  001 ..... 0001011 @r
-- 
2.37.2


