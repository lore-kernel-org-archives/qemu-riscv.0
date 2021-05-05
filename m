Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leK3R-0006FO-QG
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 12:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3Q-0006C8-77
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:07:16 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3N-0002Zf-Ab
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:07:15 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 z6-20020a17090a1706b0290155e8a752d8so1097648pjd.4
 for <qemu-riscv@nongnu.org>; Wed, 05 May 2021 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Xvc5emIL1+DnSlxCqs7/DI52Kaz7I83aHaKhijDKBcg=;
 b=gejsZraRb685z3TEKx3ZOUFKW6SkayY6vtAe/0pXdKSLoQwk7lCKrMGXk0mANhxhCn
 IAFyz92aWSgz9DqtSBBQtG2SmeMzriBJGO3M68fQB+iE/ylYbANZGlx4ZBpNE//asWl9
 83HppGCYPo949mYZ82cOpeW/rcmCpl/rf4tso7C5hJdUDeLH/PtXQ0GMSzGPtat6eYUI
 ESmTXZgAWnI6sczNkDqMwc6kbMZ676PbQKxpXEOcmmKBHBix1/MWiK8AZBgd2Ql2TFGy
 WZMTvsXtxvwfBNr/AvUYCFQWvdaMpMXs/zxxlpvbSbGQ4mTHBHsZUXdJxSkAuUv00EP7
 jLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Xvc5emIL1+DnSlxCqs7/DI52Kaz7I83aHaKhijDKBcg=;
 b=PlVB9c5gFo+Blw4GJXkd031LUGZNDvsEbsUo8yFMnvSYjyi/07xoPTklAyyFFpZ+1N
 VouZz/GP1wRYMij+seG+aUggDoeWpXl0gT+pPS+MCMYVknfvinPHPcPJ/1ArkSptcfXa
 n/Jqg6AofFa67udp+GGV4gsNM0ksVwKEc1e07trI/6zgpr8mQJNGKNVz3s3qZ7KLHLe0
 63f8sV61Qav/1vSZuviiQLhFdaqk7nVzUE5VaIASz4PO7AbH3R+wMbQnO3yEoivXIGsB
 uUviMlgYmlRzOxXHff1a1VySxsRw7j6M5QfUM/BUw/pMVMTRZkATmZnSIWqJ+5sUl+IQ
 fF8w==
X-Gm-Message-State: AOAM530d1Xqou31RbjM6HJQEsZyjmV9mHgX6Zd1QFj3+huleA7AuBBCp
 KG93yVN7c+wAf+9XLp4ddDUqww==
X-Google-Smtp-Source: ABdhPJyDjgnvY1bdNqtSK+NG+NI7Ev1OpE8RxkQkqgxtbs9nk7aI88IlV6rlH+Z51mLF8tXnnR0zSw==
X-Received: by 2002:a17:902:109:b029:ec:9f64:c53d with SMTP id
 9-20020a1709020109b02900ec9f64c53dmr31763636plb.83.1620230831933; 
 Wed, 05 May 2021 09:07:11 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:07:11 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>
Subject: [PATCH v6 12/17] target/riscv: rvb: generalized reverse
Date: Thu,  6 May 2021 00:06:13 +0800
Message-Id: <20210505160620.15723-13-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Wed, 05 May 2021 16:07:16 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/bitmanip_helper.c          | 64 +++++++++++++++++++++++++
 target/riscv/helper.h                   |  4 ++
 target/riscv/insn32.decode              |  4 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 31 ++++++++++++
 target/riscv/meson.build                |  1 +
 target/riscv/translate.c                | 28 +++++++++++
 6 files changed, 132 insertions(+)
 create mode 100644 target/riscv/bitmanip_helper.c

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
new file mode 100644
index 00000000000..c625adaded5
--- /dev/null
+++ b/target/riscv/bitmanip_helper.c
@@ -0,0 +1,64 @@
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
+#include "tcg/tcg.h"
+
+static const uint64_t adjacent_masks[] = {
+    dup_const(MO_8, 0x55),
+    dup_const(MO_8, 0x33),
+    dup_const(MO_8, 0x0f),
+    dup_const(MO_16, 0xff),
+    dup_const(MO_32, 0xffff),
+    UINT32_MAX
+};
+
+static inline target_ulong do_swap(target_ulong x, uint64_t mask, int shift)
+{
+    return ((x & mask) << shift) | ((x & ~mask) >> shift);
+}
+
+static target_ulong do_grev(target_ulong rs1,
+                            target_ulong rs2,
+                            int bits)
+{
+    target_ulong x = rs1;
+    int i, shift;
+
+    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1) {
+        if (rs2 & shift) {
+            x = do_swap(x, adjacent_masks[i], shift);
+        }
+    }
+
+    return x;
+}
+
+target_ulong HELPER(grev)(target_ulong rs1, target_ulong rs2)
+{
+    return do_grev(rs1, rs2, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
+{
+    return do_grev(rs1, rs2, 32);
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c7267593c32..f81b8faf3bf 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -58,6 +58,10 @@ DEF_HELPER_FLAGS_2(fcvt_d_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 
+/* Bitmanip */
+DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+
 /* Special functions */
 DEF_HELPER_3(csrrw, tl, env, tl, tl)
 DEF_HELPER_4(csrrs, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 71a9a182c01..6b5e276a9f7 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -684,6 +684,7 @@ slo        0010000 .......... 001 ..... 0110011 @r
 sro        0010000 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
+grev       0110100 .......... 101 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -692,6 +693,7 @@ bexti      01001. ........... 101 ..... 0010011 @sh
 sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
+grevi      01101. ........... 101 ..... 0010011 @sh
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
@@ -708,6 +710,7 @@ slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
+grevw      0110100 .......... 101 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -715,3 +718,4 @@ binviw     0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
+greviw     0110100 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 429738db155..281e0ffae9a 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -197,6 +197,23 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a)
     return gen_shift(ctx, a, tcg_gen_rotl_tl);
 }
 
+static bool trans_grev(DisasContext *ctx, arg_grev *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_helper_grev);
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
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -329,3 +346,17 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_shiftw(ctx, a, gen_rolw);
 }
+
+static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_grevw);
+}
+
+static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_grevw);
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index af6c3416b78..d5e0bc93ea9 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -16,6 +16,7 @@ riscv_ss.add(files(
   'gdbstub.c',
   'op_helper.c',
   'vector_helper.c',
+  'bitmanip_helper.c',
   'translate.c',
 ))
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c09b93f1b8a..8deb05add42 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -627,6 +627,28 @@ static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_not_tl(ret, ret);
 }
 
+static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2;
+
+    gen_get_gpr(source1, a->rs1);
+
+    if (a->shamt == (TARGET_LONG_BITS - 8)) {
+        /* rev8, byte swaps */
+        tcg_gen_bswap_tl(source1, source1);
+    } else {
+        source2 = tcg_temp_new();
+        tcg_gen_movi_tl(source2, a->shamt);
+        gen_helper_grev(source1, source1, source2);
+        tcg_temp_free(source2);
+    }
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    return true;
+}
+
 static void gen_ctzw(TCGv ret, TCGv arg1)
 {
     tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
@@ -699,6 +721,12 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free_i32(t2);
 }
 
+static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    gen_helper_grev(ret, arg1, arg2);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.17.1


