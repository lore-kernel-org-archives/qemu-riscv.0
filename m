Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzaME-0006u0-34
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 02:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaMA-0006op-SK
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:14:16 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaM6-0003oU-Nx
 for qemu-riscv@nongnu.org; Wed, 13 Jan 2021 02:14:14 -0500
Received: by mail-pg1-x52f.google.com with SMTP id c22so895111pgg.13
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 23:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=c/CcaBIobtZhsXA1lKF4+7wWbRa+XM/F56UYWiOAJSI=;
 b=I+1cj/NyreFMV6+jUyQ6qmyXNpq84V3zgRsFcE22HDsQyv0yIPaQ2/3b06Y6NWvy+l
 V7reuaEOjWkKvX3SMkliQefFXPll4MCdb2qWXfMOyKHqh83IzoZdm3pwy/FcfvyF8MrQ
 4LDGZkb654FxzBK0KRkDLHr+l0BC/h8Bb6ncarhh1HgXKHxnHJsZaBUkfwXNfv8g+7xy
 0WQmZWrnPJ7ACDiTNGjynMv+a5ltWFPPLPMq6LX2yUJcu18Nnhtz5GDDTPqRK+kPn0kw
 +/OEW2pLP11/atVaqZgPrTZEL3wYZP+wwnx8oqdFW3xyMM/cVaZDac1W70RL8IB4JQj5
 omKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=c/CcaBIobtZhsXA1lKF4+7wWbRa+XM/F56UYWiOAJSI=;
 b=LZ4WzlH/JvMx8M5+vn/bfTQ21Z6yjRpvFnkYGfP7PZDv1YNNAToEy9eD7lrhhfuBVx
 Tx7wiI+6JUHewLBfhYI1tEwU2+3c0/yM+DsAuea5yr0H7zrNLAK2xQJBSQVjfw9c/Jt8
 HQ5PkU/7td7ckJRHHUtKUh8ILW9tP+tvts/SJVTCNuqy7bT2QUyA2AJeAPjjpo/lEjiz
 lXcxEfFSVmqjJjvoomsfRXW+8CBlygz5X0MGwQc30FOEcigSE/4dHQZgA/HcB8rDyWk5
 Xw2A1vTxvnm4RZtkAxABMWToKjmfPfroyBY0Wn4VozaKBtA1pqalCKzg6UqbdYbavmMj
 6t8A==
X-Gm-Message-State: AOAM531hrSY3g9DKYPNPyyWK1ghpL9WJue0KDbXOrq47CzsUGIPiAYsF
 HjmbdCjVhhQKgsl7n3SmG4lOQA==
X-Google-Smtp-Source: ABdhPJxYXORAhlT1WuPYVKckoBAkFK0YSfLwBwF/KQQqVSUklHeXRKmh0VlGQgPlRFS0afDQXsGmcw==
X-Received: by 2002:aa7:854f:0:b029:1ae:7062:3a8b with SMTP id
 y15-20020aa7854f0000b02901ae70623a8bmr1092649pfn.64.1610522049419; 
 Tue, 12 Jan 2021 23:14:09 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l7sm1361888pjy.29.2021.01.12.23.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:14:08 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v4 02/16] target/riscv: rvb: count leading/trailing zeros
Date: Wed, 13 Jan 2021 15:13:34 +0800
Message-Id: <20210113071350.24852-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113071350.24852-1-frank.chang@sifive.com>
References: <20210113071350.24852-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jan 2021 07:14:16 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32-64.decode           |  4 +++
 target/riscv/insn32.decode              |  7 +++-
 target/riscv/insn_trans/trans_rvb.c.inc | 47 +++++++++++++++++++++++++
 target/riscv/translate.c                | 42 ++++++++++++++++++++++
 4 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 8157dee8b7c..f4c42720fc7 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -86,3 +86,7 @@ fmv_d_x    1111001  00000 ..... 000 ..... 1010011 @r2
 hlv_wu    0110100  00001   ..... 100 ..... 1110011 @r2
 hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
 hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
+
+# *** RV64B Standard Extension (in addition to RV32B) ***
+clzw       0110000 00000 ..... 001 ..... 0011011 @r2
+ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3823b3ea800..8fe838cf0d0 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -40,6 +40,7 @@
 &i    imm rs1 rd
 &j    imm rd
 &r    rd rs1 rs2
+&r2   rd rs1
 &s    imm rs1 rs2
 &u    imm rd
 &shift     shamt rs1 rd
@@ -67,7 +68,7 @@
 @r4_rm   ..... ..  ..... ..... ... ..... ....... %rs3 %rs2 %rs1 %rm %rd
 @r_rm    .......   ..... ..... ... ..... ....... %rs2 %rs1 %rm %rd
 @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
-@r2      .......   ..... ..... ... ..... ....... %rs1 %rd
+@r2      .......   ..... ..... ... ..... ....... &r2 %rs1 %rd
 @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %rd
 @r2_vm   ...... vm:1 ..... ..... ... ..... ....... &rmr %rs2 %rd
 @r1_vm   ...... vm:1 ..... ..... ... ..... ....... %rd
@@ -592,3 +593,7 @@ vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
+
+# *** RV32B Standard Extension ***
+clz        011000 000000 ..... 001 ..... 0010011 @r2
+ctz        011000 000001 ..... 001 ..... 0010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
new file mode 100644
index 00000000000..76788c2f353
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -0,0 +1,47 @@
+/*
+ * RISC-V translation routines for the RVB Standard Extension.
+ *
+ * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
+ * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+static bool trans_clz(DisasContext *ctx, arg_clz *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_clz);
+}
+
+static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_ctz);
+}
+
+/* RV64-only instructions */
+#ifdef TARGET_RISCV64
+
+static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_clzw);
+}
+
+static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_ctzw);
+}
+
+#endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 554d52a4be3..fac111d465c 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -711,6 +711,23 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
 
 #endif
 
+#ifdef TARGET_RISCV64
+
+static void gen_ctzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ori_i64(ret, arg1, MAKE_64BIT_MASK(32, 32));
+    tcg_gen_ctzi_i64(ret, ret, 64);
+}
+
+static void gen_clzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_i64(ret, arg1);
+    tcg_gen_clzi_i64(ret, ret, 64);
+    tcg_gen_subi_i64(ret, ret, 32);
+}
+
+#endif
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
@@ -747,6 +764,30 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static void gen_ctz(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ctzi_tl(ret, arg1, TARGET_LONG_BITS);
+}
+
+static void gen_clz(TCGv ret, TCGv arg1)
+{
+    tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
+}
+
+static bool gen_unary(DisasContext *ctx, arg_r2 *a,
+                      void(*func)(TCGv, TCGv))
+{
+    TCGv source = tcg_temp_new();
+
+    gen_get_gpr(source, a->rs1);
+
+    (*func)(source, source);
+
+    gen_set_gpr(a->rd, source);
+    tcg_temp_free(source);
+    return true;
+}
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.c.inc"
 #include "insn_trans/trans_rvm.c.inc"
@@ -755,6 +796,7 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
 #include "insn_trans/trans_rvd.c.inc"
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
+#include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
-- 
2.17.1


