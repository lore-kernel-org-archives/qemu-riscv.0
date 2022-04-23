Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ni5ct-0000WI-QR
	for mharc-qemu-riscv@gnu.org; Fri, 22 Apr 2022 22:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ni5cc-0008Oq-MO; Fri, 22 Apr 2022 22:35:42 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:39870 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ni5cX-00058W-MZ; Fri, 22 Apr 2022 22:35:42 -0400
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABX0+DqZWNiSogjAA--.1876S8;
 Sat, 23 Apr 2022 10:35:28 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v12 06/14] target/riscv: rvk: add support for zknd/zkne
 extension in RV32
Date: Sat, 23 Apr 2022 10:35:02 +0800
Message-Id: <20220423023510.30794-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
References: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABX0+DqZWNiSogjAA--.1876S8
X-Coremail-Antispam: 1UD129KBjvJXoWxuFWkXFW7XrW5KryDKw4xtFb_yoWfuw13pF
 4fGrWUGF48JrWfAaySkF45Jr17ZF4fuF4UJw4fXr1kJa15tFZ5Jr1DK3y3KFs8JFykur1j
 9a1DZFy2y3y0q3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
 Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
 IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
 Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
 xan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQ
 SdkUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sat, 23 Apr 2022 02:35:43 -0000

 - add aes32esmi, aes32esi, aes32dsmi and aes32dsi instructions

Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/crypto_helper.c            | 105 ++++++++++++++++++++++++
 target/riscv/helper.h                   |   6 ++
 target/riscv/insn32.decode              |  11 +++
 target/riscv/insn_trans/trans_rvk.c.inc |  71 ++++++++++++++++
 target/riscv/meson.build                |   3 +-
 target/riscv/translate.c                |   1 +
 6 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/crypto_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
new file mode 100644
index 0000000000..220d51c742
--- /dev/null
+++ b/target/riscv/crypto_helper.c
@@ -0,0 +1,105 @@
+/*
+ * RISC-V Crypto Emulation Helpers for QEMU.
+ *
+ * Copyright (c) 2021 Ruibo Lu, luruibo2000@163.com
+ * Copyright (c) 2021 Zewen Ye, lustrew@foxmail.com
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
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "crypto/aes.h"
+#include "crypto/sm4.h"
+
+#define AES_XTIME(a) \
+    ((a << 1) ^ ((a & 0x80) ? 0x1b : 0))
+
+#define AES_GFMUL(a, b) (( \
+    (((b) & 0x1) ? (a) : 0) ^ \
+    (((b) & 0x2) ? AES_XTIME(a) : 0) ^ \
+    (((b) & 0x4) ? AES_XTIME(AES_XTIME(a)) : 0) ^ \
+    (((b) & 0x8) ? AES_XTIME(AES_XTIME(AES_XTIME(a))) : 0)) & 0xFF)
+
+static inline uint32_t aes_mixcolumn_byte(uint8_t x, bool fwd)
+{
+    uint32_t u;
+
+    if (fwd) {
+        u = (AES_GFMUL(x, 3) << 24) | (x << 16) | (x << 8) |
+            (AES_GFMUL(x, 2) << 0);
+    } else {
+        u = (AES_GFMUL(x, 0xb) << 24) | (AES_GFMUL(x, 0xd) << 16) |
+            (AES_GFMUL(x, 0x9) << 8) | (AES_GFMUL(x, 0xe) << 0);
+    }
+    return u;
+}
+
+#define sext32_xlen(x) (target_ulong)(int32_t)(x)
+
+static inline target_ulong aes32_operation(target_ulong shamt,
+                                           target_ulong rs1, target_ulong rs2,
+                                           bool enc, bool mix)
+{
+    uint8_t si = rs2 >> shamt;
+    uint8_t so;
+    uint32_t mixed;
+    target_ulong res;
+
+    if (enc) {
+        so = AES_sbox[si];
+        if (mix) {
+            mixed = aes_mixcolumn_byte(so, true);
+        } else {
+            mixed = so;
+        }
+    } else {
+        so = AES_isbox[si];
+        if (mix) {
+            mixed = aes_mixcolumn_byte(so, false);
+        } else {
+            mixed = so;
+        }
+    }
+    mixed = rol32(mixed, shamt);
+    res = rs1 ^ mixed;
+
+    return sext32_xlen(res);
+}
+
+target_ulong HELPER(aes32esmi)(target_ulong rs1, target_ulong rs2,
+                               target_ulong shamt)
+{
+    return aes32_operation(shamt, rs1, rs2, true, true);
+}
+
+target_ulong HELPER(aes32esi)(target_ulong rs1, target_ulong rs2,
+                              target_ulong shamt)
+{
+    return aes32_operation(shamt, rs1, rs2, true, false);
+}
+
+target_ulong HELPER(aes32dsmi)(target_ulong rs1, target_ulong rs2,
+                               target_ulong shamt)
+{
+    return aes32_operation(shamt, rs1, rs2, false, true);
+}
+
+target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
+                              target_ulong shamt)
+{
+    return aes32_operation(shamt, rs1, rs2, false, false);
+}
+#undef sext32_xlen
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index cfead7abfc..3c4e7e6113 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1112,3 +1112,9 @@ DEF_HELPER_5(divu_i128, tl, env, tl, tl, tl, tl)
 DEF_HELPER_5(divs_i128, tl, env, tl, tl, tl, tl)
 DEF_HELPER_5(remu_i128, tl, env, tl, tl, tl, tl)
 DEF_HELPER_5(rems_i128, tl, env, tl, tl, tl, tl)
+
+/* Crypto functions */
+DEF_HELPER_FLAGS_3(aes32esmi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(aes32esi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(aes32dsmi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(aes32dsi, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 75ffac9c81..0f2e661583 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -35,6 +35,7 @@
 %imm_b    31:s1 7:1 25:6 8:4     !function=ex_shift_1
 %imm_j    31:s1 12:8 20:1 21:10  !function=ex_shift_1
 %imm_u    12:s20                 !function=ex_shift_12
+%imm_bs   30:2                   !function=ex_shift_3
 
 # Argument sets:
 &empty
@@ -52,6 +53,7 @@
 &rmr       vm rd rs2
 &r2nfvm    vm rd rs1 nf
 &rnfvm     vm rd rs1 rs2 nf
+&k_aes     shamt rs2 rs1 rd
 
 # Formats 32:
 @r       .......   ..... ..... ... ..... ....... &r                %rs2 %rs1 %rd
@@ -89,6 +91,8 @@
 @sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
 @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
 
+@k_aes   .. ..... ..... .....  ... ..... ....... &k_aes  shamt=%imm_bs   %rs2 %rs1 %rd
+
 # Formats 64:
 @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
 
@@ -834,3 +838,10 @@ sfence_w_inval    0001100 00000 00000 000 00000 1110011
 sfence_inval_ir   0001100 00001 00000 000 00000 1110011
 hinval_vvma       0010011 ..... ..... 000 00000 1110011 @hfence_vvma
 hinval_gvma       0110011 ..... ..... 000 00000 1110011 @hfence_gvma
+
+# *** RV32 Zknd Standard Extension ***
+aes32dsmi   .. 10111 ..... ..... 000 ..... 0110011 @k_aes
+aes32dsi    .. 10101 ..... ..... 000 ..... 0110011 @k_aes
+# *** RV32 Zkne Standard Extension ***
+aes32esmi   .. 10011 ..... ..... 000 ..... 0110011 @k_aes
+aes32esi    .. 10001 ..... ..... 000 ..... 0110011 @k_aes
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
new file mode 100644
index 0000000000..8d0b42106f
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -0,0 +1,71 @@
+/*
+ * RISC-V translation routines for the Zk[nd,ne,nh,sed,sh] Standard Extension.
+ *
+ * Copyright (c) 2021 Ruibo Lu, luruibo2000@163.com
+ * Copyright (c) 2021 Zewen Ye, lustrew@foxmail.com
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
+#define REQUIRE_ZKND(ctx) do {                  \
+    if (!ctx->cfg_ptr->ext_zknd) {              \
+        return false;                           \
+    }                                           \
+} while (0)
+
+#define REQUIRE_ZKNE(ctx) do {                  \
+    if (!ctx->cfg_ptr->ext_zkne) {              \
+        return false;                           \
+    }                                           \
+} while (0)
+
+static bool gen_aes32_sm4(DisasContext *ctx, arg_k_aes *a,
+                          void (*func)(TCGv, TCGv, TCGv, TCGv))
+{
+    TCGv shamt = tcg_constant_tl(a->shamt);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    func(dest, src1, src2, shamt);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_aes32esmi(DisasContext *ctx, arg_aes32esmi *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNE(ctx);
+    return gen_aes32_sm4(ctx, a, gen_helper_aes32esmi);
+}
+
+static bool trans_aes32esi(DisasContext *ctx, arg_aes32esi *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNE(ctx);
+    return gen_aes32_sm4(ctx, a, gen_helper_aes32esi);
+}
+
+static bool trans_aes32dsmi(DisasContext *ctx, arg_aes32dsmi *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKND(ctx);
+    return gen_aes32_sm4(ctx, a, gen_helper_aes32dsmi);
+}
+
+static bool trans_aes32dsi(DisasContext *ctx, arg_aes32dsi *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKND(ctx);
+    return gen_aes32_sm4(ctx, a, gen_helper_aes32dsi);
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 2c20f3dd8e..096249f3a3 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -19,7 +19,8 @@ riscv_ss.add(files(
   'vector_helper.c',
   'bitmanip_helper.c',
   'translate.c',
-  'm128_helper.c'
+  'm128_helper.c',
+  'crypto_helper.c'
 ))
 riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 121ead7cfe..0cd1d9ee94 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1007,6 +1007,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
+#include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 #include "insn_trans/trans_svinval.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
-- 
2.17.1


