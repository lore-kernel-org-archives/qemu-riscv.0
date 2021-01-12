Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz9J2-0001Nx-Li
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 21:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9J0-0001J1-HU
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:21:10 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:45993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9Iy-0002Fn-9u
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 21:21:10 -0500
Received: by mail-pg1-x535.google.com with SMTP id v19so402069pgj.12
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 18:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=o6jBffw8LGw/Q75MpbwT6lKMgWQdCtDLpTWuA0bVkUY=;
 b=LgAFhvxnooxK/YqOghiunyzYhrrIqeEmH2teDNFSbxZxyVYkSyF3xgbN9C7Zlja2rL
 qNgoOnNiD5rhqE5xKoDBC9rx9eHFXIywN5+9uiDPmBck41SEf14EocJIUhDY4Z8en5/9
 XmDDK8sBC2n9+x0vCHP5LyhGlpMqUJfT+e54kNdc/aMD8wSoM7GoBAgaIbKU16NZhNYb
 OG9Taoyh1Uf67yoAyN8vYodhHdqX7vSOm2rsDsagU2lDsOCF6sfH5p0GTQFa7RgMHBN0
 HjVj6UtTLuhQIyPOT2UM0M5EqbReMKPS3zuGXBMyNAXie2TH3L8bwUOnA0Phim704IKq
 9+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=o6jBffw8LGw/Q75MpbwT6lKMgWQdCtDLpTWuA0bVkUY=;
 b=o4DjiutJWT3nG5qptfW3kwA9GkJy/TPv2Q5GqpE/q5nNsvrVNhWeyEPcIoTKRM8GxI
 s49lChydDVu7FWDXzzfTCPJ87lxwyY0ogDAlKojV94gLVGSQ1oMd7gFL40GPddKyznlf
 omEzWuGskVD1ZDxfYXD7GzMBjkFpWz2VN5Sof9RBYIcl3qI78jEuEpbFBlZsc1PXwzFp
 oLHhqrliu9c8GyUVbIKrcGq3N8ir6l8xFFMQ9MhqQqNdWEanMFsN6zEl27zSt7QIgY9s
 dMDcyZ33gK2sMQm2KzcuUjdJHe8SZ3Q8vSpqYynPFW391oz7ay1+IsX5zSYFtOZRG0zL
 U3gg==
X-Gm-Message-State: AOAM5328sdDi5p29ExP6PTDIQq6JETSWIKNHNLt9XqqZwtmpyH/0pESC
 iNeTCijPf/XpIxB7JXgZfM7N77ECDTcgey12
X-Google-Smtp-Source: ABdhPJwrqZiFA/R1KWOU+HEwf/kxI/TEQ8+WBsGKi0O53nRgjJE64nv65WeUpiQmlu/qGEIOhiy8Lg==
X-Received: by 2002:a63:5e01:: with SMTP id s1mr2367544pgb.201.1610418067023; 
 Mon, 11 Jan 2021 18:21:07 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:21:06 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v3 12/16] target/riscv: rvb: generalized reverse
Date: Tue, 12 Jan 2021 10:19:53 +0800
Message-Id: <20210112022001.20521-13-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 02:21:10 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/bitmanip_helper.c          | 71 +++++++++++++++++++++++++
 target/riscv/helper.h                   |  7 +++
 target/riscv/insn32-64.decode           |  2 +
 target/riscv/insn32.decode              |  2 +
 target/riscv/insn_trans/trans_rvb.c.inc | 29 ++++++++++
 target/riscv/meson.build                |  1 +
 target/riscv/translate.c                | 28 ++++++++++
 7 files changed, 140 insertions(+)
 create mode 100644 target/riscv/bitmanip_helper.c

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
new file mode 100644
index 00000000000..1d3235bc0d6
--- /dev/null
+++ b/target/riscv/bitmanip_helper.c
@@ -0,0 +1,71 @@
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
+#ifdef TARGET_RISCV64
+    UINT32_MAX
+#endif
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
+/* RV64-only instruction */
+#ifdef TARGET_RISCV64
+
+target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
+{
+    return do_grev(rs1, rs2, 32);
+}
+
+#endif
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index e3f3f41e891..db8b770f1aa 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -58,6 +58,13 @@ DEF_HELPER_FLAGS_2(fcvt_d_l, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, i64)
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
index 8f9ba21b352..38ceadd4553 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -102,6 +102,7 @@ slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
+grevw      0110100 .......... 101 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -109,3 +110,4 @@ binviw     0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
+greviw     0110100 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6d1b604c800..fa4bba4f0ee 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -619,6 +619,7 @@ slo        0010000 .......... 001 ..... 0110011 @r
 sro        0010000 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
+grev       0110100 .......... 101 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -627,3 +628,4 @@ bexti      01001. ........... 101 ..... 0010011 @sh
 sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
+grevi      01101. ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 8a46fde4767..286643cd183 100644
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
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -314,4 +331,16 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
     return gen_shiftw(ctx, a, gen_rolw);
 }
 
+static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_grevw);
+}
+
+static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_grevw);
+}
+
 #endif
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 14a5c62dace..de530298454 100644
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
index eee69e6bba9..cb040a15003 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -790,6 +790,28 @@ static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
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
 #ifdef TARGET_RISCV64
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
@@ -864,6 +886,12 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free_i32(t2);
 }
 
+static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    gen_helper_grev(ret, arg1, arg2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


