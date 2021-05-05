Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leK2p-0005Qg-7e
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 12:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2n-0005O1-IR
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:06:37 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:40725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2l-0002G8-5A
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:06:37 -0400
Received: by mail-pl1-x62b.google.com with SMTP id n16so1345236plf.7
 for <qemu-riscv@nongnu.org>; Wed, 05 May 2021 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZiUkuEVjyKI84T6LtFcoAWSQ8ZUE22W8ji72zmpk5bQ=;
 b=jlnL4g33Evk3e3zYyyHTkKmkg5VQIowjiSZK23RmQ7WDRuauUQdPWzPS9UkEeTF/gs
 IifaHJjITubtLS+5LLcExLsGR29P3wfBLgULcFCu/PlRyc5en6YL8h5mHIwfrOFb5A6f
 CEl/xX+g7yMQzmV8sMi4v6flGYo2YCeJAWeg/0ZmEOFNX7/32es5EFdrKHxjFW5mhi3R
 jqhmE3ZbR3aMi9E9tb1TzXVnQMs1P0D+nuFr9LcyinwB87cEI0dhCYZ1vu80FxHnTYTq
 mXUFHJdfAW/DsO/1e6AAu0nu6PtHolu7wygV5l/ptSeU4zePOHOP3VBTaRE2OKCqg73t
 BU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZiUkuEVjyKI84T6LtFcoAWSQ8ZUE22W8ji72zmpk5bQ=;
 b=Qi5XNGSsrOB4a3cWO3BBgrYYcgxPuc/M9xueRhuasnkkNc2np/rnvqPqndU4fxqHil
 Jfa1HuV+xTnRo7El84q8eBLWutTghQOJ5qWSeMoVcqrAo0OaZc1Zu3Zc5n5Mygyv0GSk
 6acXLSVIJlgRJAAs7HXNC+U8t1sep3set+/IhL2l1aAbBdCdV58O/tMl+bqalgkrTZlx
 5GgPTv4NfWmhBddWhHjjrkT8t/+7A9y2I4Ge7Tx7U7bxviQD1iGsOUTsPObC+aFm92Kf
 MwXHvVTA45X1xVi4a8qRuwaAi+aHxW9sxde4CM6wcZtDTGwV3u+8aGu0ITeuAC8M/5xm
 WGuw==
X-Gm-Message-State: AOAM531sbRMBDJqVXekMybDrrebQRXmDVDNQIFDtrjh7lXi3oSVoIkV8
 zbK42EWpKaGQcLIgYu4uG/b1EA==
X-Google-Smtp-Source: ABdhPJyNeKoxuBk33r3+r7GyvHAGQuxrSyt2QlSTlyDjInu5nU89DPaZniLOGjWc0UUKprAtLGF4Jw==
X-Received: by 2002:a17:90b:8d5:: with SMTP id
 ds21mr11995974pjb.65.1620230793262; 
 Wed, 05 May 2021 09:06:33 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:06:32 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 02/17] target/riscv: rvb: count leading/trailing zeros
Date: Thu,  6 May 2021 00:06:03 +0800
Message-Id: <20210505160620.15723-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Wed, 05 May 2021 16:06:37 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h                      |  1 +
 target/riscv/insn32.decode              | 11 ++++++-
 target/riscv/insn_trans/trans_rvb.c.inc | 44 +++++++++++++++++++++++++
 target/riscv/translate.c                | 38 +++++++++++++++++++++
 4 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/insn_trans/trans_rvb.c.inc

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7e879fb9ca5..f95bcbd8e10 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -67,6 +67,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVB RV('B')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index f75642bb0d2..9a2ffab1504 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -41,6 +41,7 @@
 &i    imm rs1 rd
 &j    imm rd
 &r    rd rs1 rs2
+&r2   rd rs1
 &s    imm rs1 rs2
 &u    imm rd
 &shift     shamt rs1 rd
@@ -68,7 +69,7 @@
 @r4_rm   ..... ..  ..... ..... ... ..... ....... %rs3 %rs2 %rs1 %rm %rd
 @r_rm    .......   ..... ..... ... ..... ....... %rs2 %rs1 %rm %rd
 @r2_rm   .......   ..... ..... ... ..... ....... %rs1 %rm %rd
-@r2      .......   ..... ..... ... ..... ....... %rs1 %rd
+@r2      .......   ..... ..... ... ..... ....... &r2 %rs1 %rd
 @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %rd
 @r2_vm   ...... vm:1 ..... ..... ... ..... ....... &rmr %rs2 %rd
 @r1_vm   ...... vm:1 ..... ..... ... ..... ....... %rd
@@ -657,3 +658,11 @@ vamomind_v      10000 . . ..... ..... 111 ..... 0101111 @r_wdvm
 vamomaxd_v      10100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 vamominud_v     11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
 vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
+
+# *** RV32B Standard Extension ***
+clz        011000 000000 ..... 001 ..... 0010011 @r2
+ctz        011000 000001 ..... 001 ..... 0010011 @r2
+
+# *** RV64B Standard Extension (in addition to RV32B) ***
+clzw       0110000 00000 ..... 001 ..... 0011011 @r2
+ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
new file mode 100644
index 00000000000..157b4e3c41d
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -0,0 +1,44 @@
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
+static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_clzw);
+}
+
+static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_ctzw);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e945352bca3..60fac0fe27e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -548,6 +548,19 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static void gen_ctzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
+    tcg_gen_ctzi_tl(ret, ret, 64);
+}
+
+static void gen_clzw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_tl(ret, arg1);
+    tcg_gen_clzi_tl(ret, ret, 64);
+    tcg_gen_subi_tl(ret, ret, 32);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
@@ -593,6 +606,30 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
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
@@ -601,6 +638,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvd.c.inc"
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
+#include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
-- 
2.17.1


