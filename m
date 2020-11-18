Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfItn-0002PX-48
	for mharc-qemu-riscv@gnu.org; Wed, 18 Nov 2020 03:33:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItj-0002Kk-Hh
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:33:05 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:43344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItf-0004qk-Dd
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2020 03:33:03 -0500
Received: by mail-pf1-x42c.google.com with SMTP id i8so940148pfk.10
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2020 00:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WitnrWBbLYaavwmIo3fyIWVjh3/i25wi0/2lemgAt9M=;
 b=ktCAw4OUwVePo7tB9dGLvuM2BI4xOlwSE/7W+02zQGoHDVBVc3L8EkZkB4UmqtRBua
 +1zfk2mpV4NjNdBaAH7FuZxZeSjV8Ev9kSD+eynoVmm9OchYwSdFgDxF7P1LFIelteAe
 9SSHjiVdpEcnqb4r+HDad+KdITuQwE7GdOR/7tBWJKOSJwIpEAJPzHTvXMBWgTNy5KOu
 /zAx71P6LdyfT4lSa6Hoyk1M1h8TKYwIvMHScF7JY7CUxE9oQXr67IBZqKkG2iHhlaRU
 SmUP5LHPD+ucnWvRuNnF0jOIpMBIEdS89/Td2up8TSionvza4u8CYqMfEe2BD6A64mgQ
 h1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WitnrWBbLYaavwmIo3fyIWVjh3/i25wi0/2lemgAt9M=;
 b=am3+yHJF3eKXdzZ82nS4YJ2c95HCmr2n4LjXfbr5s1ihq15XQKfOhKSZfGGLq/GpH/
 tssbzb6vtXCJK5JsQ56cPmDt8o6PBt3T+Ri9fimOCEGBMPmt95SwNlusZMk+hDh5XNOc
 dq5ZNenAJ2UESKnRVGMmmnPHMVmg6vcWTZ+WukeJBtG48YiFEBtTI6c46w8gYEvrAEYS
 iuz8dutj5CJtBUfe2YCUggrh561tP1296MvKOx0gmJXw0kTf8QfDmbKWS5g7nwd02CJN
 YeEF6+8ensAggmKtvUN/j/5tAE8yA6pFseAqteXDji4Ge8qMO/iWvS9UcCo0KPYPy++4
 dh4Q==
X-Gm-Message-State: AOAM530CBAc4e2DIuf0ALa3EZFxKaSlox4+1sN8PT4ntXX7fIjlKuhix
 /F3ixQ88Je0zftYjiT4OAAtvNw==
X-Google-Smtp-Source: ABdhPJycSNZ5bFzZgnEAdB136tiWewKOkAq14NdsTe3kNVxYi4iwiXRHZAXuuln2r4Z1XNKfpNmE3Q==
X-Received: by 2002:a63:6406:: with SMTP id y6mr7382576pgb.59.1605688378028;
 Wed, 18 Nov 2020 00:32:58 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:32:57 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>
Subject: [RFC 11/15] target/riscv: rvb: generalized reverse
Date: Wed, 18 Nov 2020 16:29:49 +0800
Message-Id: <20201118083044.13992-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42c.google.com
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
X-List-Received-Date: Wed, 18 Nov 2020 08:33:05 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/bitmanip_helper.c          | 79 +++++++++++++++++++++++++
 target/riscv/helper.h                   |  7 +++
 target/riscv/insn32-64.decode           |  2 +
 target/riscv/insn32.decode              |  2 +
 target/riscv/insn_trans/trans_rvb.c.inc | 34 +++++++++++
 target/riscv/meson.build                |  1 +
 target/riscv/translate.c                | 53 +++++++++++++++++
 7 files changed, 178 insertions(+)
 create mode 100644 target/riscv/bitmanip_helper.c

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
new file mode 100644
index 00000000000..1d133db1552
--- /dev/null
+++ b/target/riscv/bitmanip_helper.c
@@ -0,0 +1,79 @@
+/*
+ * RISC-V Bitmanip Extension Helpers for QEMU.
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
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+
+static inline target_ulong do_swap(target_ulong x, target_ulong mask, int shift)
+{
+    return ((x & mask) << shift) | ((x & ~mask) >> shift);
+}
+
+static target_ulong do_grev(target_ulong rs1,
+                            target_ulong rs2,
+                            const target_ulong masks[])
+{
+    target_ulong x = rs1;
+    int shift = 1;
+    int i = 0;
+
+    while (shift < TARGET_LONG_BITS) {
+        if (rs2 & shift) {
+            x = do_swap(x, masks[i], shift);
+        }
+        shift <<= 1;
+        ++i;
+    }
+
+    return x;
+}
+
+target_ulong HELPER(grev)(target_ulong rs1, target_ulong rs2)
+{
+    static const target_ulong masks[] = {
+#ifdef TARGET_RISCV32
+        0x55555555, 0x33333333, 0x0f0f0f0f,
+        0x00ff00ff, 0x0000ffff,
+#else
+        0x5555555555555555, 0x3333333333333333,
+        0x0f0f0f0f0f0f0f0f, 0x00ff00ff00ff00ff,
+        0x0000ffff0000ffff, 0x00000000ffffffff,
+#endif
+    };
+
+    return do_grev(rs1, rs2, masks);
+}
+
+/* RV64-only instruction */
+#ifdef TARGET_RISCV64
+
+target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
+{
+    static const target_ulong masks[] = {
+        0x55555555, 0x33333333, 0x0f0f0f0f,
+        0x00ff00ff, 0x0000ffff,
+    };
+
+    return do_grev(rs1, rs2, masks);
+}
+
+#endif
+
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 4b690147fb2..15243a00761 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -66,6 +66,13 @@ DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, tl)
 #endif
 DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 
+/* Bitmanip */
+DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+
+#if defined(TARGET_RISCV64)
+DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+#endif
+
 /* Special functions */
 DEF_HELPER_3(csrrw, tl, env, tl, tl)
 DEF_HELPER_4(csrrs, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index a1a4b12f7ca..f2d3b6a5b5d 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -102,6 +102,7 @@ slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
+grevw      0110100 .......... 101 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
@@ -109,3 +110,4 @@ sbinviw    0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
+greviw     0110100 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 01b8ebc4bee..60821a16661 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -619,6 +619,7 @@ slo        0010000 .......... 001 ..... 0110011 @r
 sro        0010000 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
+grev       0110100 .......... 101 ..... 0110011 @r
 
 sbseti     001010 ........... 001 ..... 0010011 @sh
 sbclri     010010 ........... 001 ..... 0010011 @sh
@@ -627,3 +628,4 @@ sbexti     010010 ........... 101 ..... 0010011 @sh
 sloi       001000 ........... 001 ..... 0010011 @sh
 sroi       001000 ........... 101 ..... 0010011 @sh
 rori       011000 ........... 101 ..... 0010011 @sh
+grevi      011010 ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index ba8734203ac..9f1482d313a 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -212,6 +212,23 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a)
     return gen_arith(ctx, a, &tcg_gen_rotl_tl);
 }
 
+static bool trans_grev(DisasContext *ctx, arg_grev *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_grev);
+}
+
+static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    return gen_grevi(ctx, a);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -343,4 +360,21 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
     return gen_arith(ctx, a, &gen_rolw);
 }
 
+static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_grevw);
+}
+
+static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= 32) {
+        return false;
+    }
+
+    return gen_arith_shamt_tl(ctx, a, &gen_grevw);
+}
+
 #endif
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index abd647fea1c..df77cd24ada 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -21,6 +21,7 @@ riscv_ss.add(files(
   'gdbstub.c',
   'op_helper.c',
   'vector_helper.c',
+  'bitmanip_helper.c',
   'translate.c',
 ))
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 68870bd9202..80549154d6e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -919,6 +919,44 @@ static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_grev(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv shamt;
+    shamt = tcg_temp_new();
+
+    gen_sbop_shamt(shamt, arg2);
+    gen_helper_grev(ret, arg1, shamt);
+
+    tcg_temp_free(shamt);
+}
+
+static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
+{
+    TCGv source1, source2;
+    source1 = tcg_temp_new();
+
+    gen_get_gpr(source1, a->rs1);
+
+    if (a->shamt == (TARGET_LONG_BITS - 8)) {
+        /* rev8, byte swaps */
+#ifdef TARGET_RISCV32
+        tcg_gen_bswap32_tl(source1, source1);
+#else
+        tcg_gen_bswap64_tl(source1, source1);
+#endif
+    } else {
+        source2 = tcg_temp_new();
+        tcg_gen_movi_tl(source2, a->shamt);
+        gen_helper_grev(source1, source1, source2);
+        tcg_temp_free(source2);
+    }
+
+    gen_set_gpr(a->rd, source1);
+
+    tcg_temp_free(source1);
+    return true;
+}
+
 
 #ifdef TARGET_RISCV64
 
@@ -1140,6 +1178,21 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free_i32(t2);
 }
 
+static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv shamt;
+    shamt = tcg_temp_new();
+
+    tcg_gen_ext32u_tl(arg1, arg1);
+
+    gen_sbopw_shamt(shamt, arg2);
+    gen_helper_grev(ret, arg1, shamt);
+
+    tcg_gen_ext32s_tl(ret, ret);
+
+    tcg_temp_free(shamt);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


