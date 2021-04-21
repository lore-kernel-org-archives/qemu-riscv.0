Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZ4Fn-0006cS-Tr
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 00:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fm-0006Zp-56
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:14:18 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fi-0002tT-7U
 for qemu-riscv@nongnu.org; Wed, 21 Apr 2021 00:14:17 -0400
Received: by mail-pf1-x42e.google.com with SMTP id d124so27414457pfa.13
 for <qemu-riscv@nongnu.org>; Tue, 20 Apr 2021 21:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4OWjvreTqMfY90IEV8SGxOztilX1xHdEIAsVthlBeFU=;
 b=Hke2Fw4GyZmNkl4JtkLfcY8O3a9hK/jwdyJhy7igwo0KxCGwG1eLbDXn3rXa8BDM3m
 n3tdG0MU+81js0i2rEiguGG1up+HiyhbmPFXweoNMl+3mo5DcKlNqdW7XernbvJVJpzn
 ttM42Vfr/4R2wdPhrl3OkuFQxyGuqRzxiUkt0wpkLMIb3mNxfZgBjCTsv0JuaVCu+TYx
 ydEIWHhpW/hZ5f7MqaArwdjrgE948kLjn55R1nRc37q5glGswL0fiyafkpxSBTBzgswD
 RLc9gkFc+fXvMRwKA5G1aBfEWxHUWXw+wipvCdSRyZL7pd8NJnwLOlXso7PmM+1tLXI/
 Q9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4OWjvreTqMfY90IEV8SGxOztilX1xHdEIAsVthlBeFU=;
 b=aiupOaQ9NFn50Yc8L528RT2kgopiMidsPBeVv750IiwxysDakIpbFvyPoNlkLyGE9Z
 hOv7VBNlyot1DKhoj7qRadYb+NxCVwDwC6W3aZmPS7vk+NniiaZdIdX0hTASm0FkUjY8
 7+Khi8mFEG3AQ3rGqDfHxkBxYrv73xkYmEovByzHqzG6YqZwUgRJoDDY8M6Pu6A0Zy2B
 19V0O8dYFraM3KKX7dNlxHKy1u5dsOuBXQSJ0ST9U4xwEn0dtNOyogpC8b9eupiIn0yP
 75kio13dUi/2u/PyLEHQNEHRYjXhKV1Y+pT/54QzRvTrAJf6ly5RZlAP/NCyeOg/pYbO
 AYMQ==
X-Gm-Message-State: AOAM531hGb8otfwa/J7JMZ/HiOfs4Ip44svvSfOaNZZBlwMmraFMEnB7
 jeB5n2aAZ0bLPBca9rbrCG++8w==
X-Google-Smtp-Source: ABdhPJy88d2PZGe0DR6X/LNPUyjRlZgkL/IJ9hJc8eL232xFY68gJj44FF793dFZWHtw04M2leTDAw==
X-Received: by 2002:aa7:87cb:0:b029:259:ef82:f55f with SMTP id
 i11-20020aa787cb0000b0290259ef82f55fmr22552202pfo.14.1618978450945; 
 Tue, 20 Apr 2021 21:14:10 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:10 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 02/17] target/riscv: rvb: count leading/trailing zeros
Date: Wed, 21 Apr 2021 12:13:44 +0800
Message-Id: <20210421041400.22243-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
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
X-List-Received-Date: Wed, 21 Apr 2021 04:14:18 -0000

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
index 2f9f5ccc621..4648c422f42 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -536,6 +536,23 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
 
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
@@ -581,6 +598,30 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
     return cpu_ldl_code(env, pc);
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
@@ -589,6 +630,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvd.c.inc"
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
+#include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
-- 
2.17.1


