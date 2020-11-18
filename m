Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfIt7-0000kO-Ky
	for mharc-qemu-riscv@gnu.org; Wed, 18 Nov 2020 03:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfIt3-0000jF-OT
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:23 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfIt0-0004lr-0q
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:32:20 -0500
Received: by mail-pf1-x42b.google.com with SMTP id g7so968591pfc.2
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2020 00:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LETS+EEDVlyVtBMQelQTmdG5qIoA/WSP5Cw4naQKQBE=;
 b=LKAeuzty7NtmFA1uEifSIi4GOQNGFlN7y2gMpbl7df6S4E3iih1ysLbU4bZTvjmRkS
 VfZHihA67up0R72ARM49dpQpvY4wrmg/YOJfQQq/Fq/zwJ5ty5fi2AtYp6JDSJew/BlW
 wk8cj2N/rooOexpE/HgRCZAabMF3IprUM93uw8SPi+K+GsN8gKueTW2sbAUtlhXLBOop
 35aerFhk1p9d8Wylhkhle4CaEIoc8c/CFjZNy38HZ45q88zaMfavlFcVe5cKRyrKYOSF
 1SCShGMDs1+aBlgl+cWxzhFTfa56GGZtoOpnQx5iLIRC5YYZboBONb/6KE8e5/qas1hm
 a39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LETS+EEDVlyVtBMQelQTmdG5qIoA/WSP5Cw4naQKQBE=;
 b=gAzOqaqdd0HikXY9oK1x1wy6Bi2N0sV8GVBV2PKgD0jfTaA1stjLuo0X78NccwPIJr
 lnN2fXN3tNtf1+kYNSgT2vkm70zJ9QS8lxUKzCoD9r6n9WI+H3zRIHfmYo2mkiZ4DDaU
 2TDz9G2I3Za+trjjk+ZJoW+OQl1lVbAcSrd4ZMaBXjVKphzf4c1GblVOetsgPCmehhR0
 eIHQ9OQE3aHbV7n4ApY01yJhtKaOMK8zvhQLZ8kNWy17YJ4Uj+WGWXv7XdWgI+WKhdxx
 XJyiJqcAxFIhoJwoztEUDx99RtCYownHGlwDNaV64Xc9pjCRd/QPxTInHR2IBLj8NgdN
 DT5w==
X-Gm-Message-State: AOAM532DsylGq2EHJOiTWt4emaKHROokHhVg0UPifbL/maE1GqANGnxN
 HlIUVdp4W0C1PnJykmU8fwSLzw==
X-Google-Smtp-Source: ABdhPJzzLZrxd7KKQpDID/Rc7vfrPwQG4NSbpScZ6viA9vmkzNrV4hK0HHhALlKhwZnTGINxqAsXUQ==
X-Received: by 2002:a63:6386:: with SMTP id x128mr7071322pgb.148.1605688336733; 
 Wed, 18 Nov 2020 00:32:16 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:32:16 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC 02/15] target/riscv: rvb: count leading/trailing zeros
Date: Wed, 18 Nov 2020 16:29:40 +0800
Message-Id: <20201118083044.13992-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 18 Nov 2020 08:32:23 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32-64.decode           |  4 +++
 target/riscv/insn32.decode              |  7 +++-
 target/riscv/insn_trans/trans_rvb.c.inc | 47 ++++++++++++++++++++++++
 target/riscv/translate.c                | 48 +++++++++++++++++++++++++
 4 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 8157dee8b7c..250279e62ea 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -86,3 +86,7 @@ fmv_d_x    1111001  00000 ..... 000 ..... 1010011 @r2
 hlv_wu    0110100  00001   ..... 100 ..... 1110011 @r2
 hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
 hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
+
+# *** RV64B Standard Extension (in addition to RV32B) ***
+clzw       011000000000 ..... 001 ..... 0011011 @r2
+ctzw       011000000001 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 190ce469faf..884ed2a42fa 100644
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
+clz        011000000000 ..... 001 ..... 0010011 @r2
+ctz        011000000001 ..... 001 ..... 0010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
new file mode 100644
index 00000000000..1f02cb91a0a
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
+    return gen_cxz(ctx, a, &tcg_gen_clzi_tl);
+}
+
+static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_cxz(ctx, a, &tcg_gen_ctzi_tl);
+}
+
+/* RV64-only instructions */
+#ifdef TARGET_RISCV64
+
+static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_cxzw(ctx, a, &tcg_gen_clzi_i32);
+}
+
+static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_cxzw(ctx, a, &tcg_gen_ctzi_i32);
+}
+
+#endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 79dca2291bc..20b47f7a660 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -710,6 +710,34 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
 
 #endif
 
+#ifdef TARGET_RISCV64
+
+static bool gen_cxzw(DisasContext *ctx, arg_r2 *a,
+                     void(*func)(TCGv_i32, TCGv_i32, uint32_t))
+{
+    TCGv source;
+    TCGv_i32 tmp;
+
+    tmp = tcg_temp_new_i32();
+    source = tcg_temp_new();
+
+    gen_get_gpr(source, a->rs1);
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(tmp, source);
+
+    (*func)(tmp, tmp, 32);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(source, tmp);
+    gen_set_gpr(a->rd, source);
+
+    tcg_temp_free(source);
+    tcg_temp_free_i32(tmp);
+    return true;
+}
+
+#endif
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
@@ -746,6 +774,25 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static bool gen_cxz(DisasContext *ctx, arg_r2 *a,
+                    void(*func)(TCGv, TCGv, target_ulong))
+{
+    TCGv source;
+    source = tcg_temp_new();
+
+    gen_get_gpr(source, a->rs1);
+
+#ifdef TARGET_RISCV64
+    (*func)(source, source, 64);
+#else
+    (*func)(source, source, 32);
+#endif
+
+    gen_set_gpr(a->rd, source);
+    tcg_temp_free(source);
+    return true;
+}
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.c.inc"
 #include "insn_trans/trans_rvm.c.inc"
@@ -754,6 +801,7 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
 #include "insn_trans/trans_rvd.c.inc"
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
+#include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
-- 
2.17.1


