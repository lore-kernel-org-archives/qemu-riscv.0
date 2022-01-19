Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA9IP-0001P6-96
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 06:38:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nA9IJ-0001Jp-OU; Wed, 19 Jan 2022 06:38:29 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:60320 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nA9IE-0002Ii-Df; Wed, 19 Jan 2022 06:38:26 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABnblof+Odh7EjABQ--.19898S8;
 Wed, 19 Jan 2022 19:38:15 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC PATCH v5 06/14] target/riscv: rvk: add support for zknd/zkne
 extension in RV32
Date: Wed, 19 Jan 2022 19:37:46 +0800
Message-Id: <20220119113754.20323-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
References: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowABnblof+Odh7EjABQ--.19898S8
X-Coremail-Antispam: 1UD129KBjvJXoW3Zr1xZrWxXFW5Ar1DWr47twb_yoWDZF4fpF
 4rGrWUKa1UJFWfCayS9F45Ar18Xws3Gr4UJa1fWr1rJa13taykXrnrK3yakFs5JF1kWrWj
 9FsxAFy2v3y0qF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOBTY
 UUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 11:38:29 -0000

 - add aes32esmi, aes32esi, aes32dsmi and aes32dsi instructions

Co-authored-by: Zewen Ye <lustrew@foxmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/crypto_helper.c            | 139 ++++++++++++++++++++++++
 target/riscv/helper.h                   |   6 +
 target/riscv/insn32.decode              |   9 ++
 target/riscv/insn_trans/trans_rvk.c.inc |  94 ++++++++++++++++
 target/riscv/meson.build                |   3 +-
 target/riscv/translate.c                |   1 +
 6 files changed, 251 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/crypto_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
new file mode 100644
index 0000000000..f5a5909538
--- /dev/null
+++ b/target/riscv/crypto_helper.c
@@ -0,0 +1,139 @@
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
+#define BY(X, I) ((X >> (8 * I)) & 0xFF)
+
+#define AES_SHIFROWS_LO(RS1, RS2) ( \
+    (((RS1 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
+    (((RS2 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
+    (((RS2 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
+    (((RS1 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
+
+#define AES_INVSHIFROWS_LO(RS1, RS2) ( \
+    (((RS2 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
+    (((RS1 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
+    (((RS1 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
+    (((RS2 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
+
+#define AES_MIXBYTE(COL, B0, B1, B2, B3) ( \
+    BY(COL, B3) ^ BY(COL, B2) ^ AES_GFMUL(BY(COL, B1), 3) ^ \
+    AES_GFMUL(BY(COL, B0), 2))
+
+#define AES_MIXCOLUMN(COL) ( \
+    AES_MIXBYTE(COL, 3, 0, 1, 2) << 24 | \
+    AES_MIXBYTE(COL, 2, 3, 0, 1) << 16 | \
+    AES_MIXBYTE(COL, 1, 2, 3, 0) << 8 | AES_MIXBYTE(COL, 0, 1, 2, 3) << 0)
+
+#define AES_INVMIXBYTE(COL, B0, B1, B2, B3) ( \
+    AES_GFMUL(BY(COL, B3), 0x9) ^ AES_GFMUL(BY(COL, B2), 0xd) ^ \
+    AES_GFMUL(BY(COL, B1), 0xb) ^ AES_GFMUL(BY(COL, B0), 0xe))
+
+#define AES_INVMIXCOLUMN(COL) ( \
+    AES_INVMIXBYTE(COL, 3, 0, 1, 2) << 24 | \
+    AES_INVMIXBYTE(COL, 2, 3, 0, 1) << 16 | \
+    AES_INVMIXBYTE(COL, 1, 2, 3, 0) << 8 | \
+    AES_INVMIXBYTE(COL, 0, 1, 2, 3) << 0)
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
+#define sext_xlen(x) (target_ulong)(int32_t)(x)
+
+static inline target_ulong aes32_operation(target_ulong bs, target_ulong rs1,
+                                           target_ulong rs2, bool enc,
+                                           bool mix)
+{
+    uint8_t shamt = bs << 3;
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
+    mixed = (mixed << shamt) | (mixed >> (32 - shamt));
+    res = rs1 ^ mixed;
+
+    return sext_xlen(res);
+}
+
+target_ulong HELPER(aes32esmi)(target_ulong rs1, target_ulong rs2,
+                               target_ulong bs)
+{
+    return aes32_operation(bs, rs1, rs2, true, true);
+}
+
+target_ulong HELPER(aes32esi)(target_ulong rs1, target_ulong rs2,
+                              target_ulong bs)
+{
+    return aes32_operation(bs, rs1, rs2, true, false);
+}
+
+target_ulong HELPER(aes32dsmi)(target_ulong rs1, target_ulong rs2,
+                               target_ulong bs)
+{
+    return aes32_operation(bs, rs1, rs2, false, true);
+}
+
+target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
+                              target_ulong bs)
+{
+    return aes32_operation(bs, rs1, rs2, false, false);
+}
+#undef sext_xlen
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 80f7ebc2c3..ab3cf407c1 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1115,3 +1115,9 @@ DEF_HELPER_5(divu_i128, tl, env, tl, tl, tl, tl)
 DEF_HELPER_5(divs_i128, tl, env, tl, tl, tl, tl)
 DEF_HELPER_5(remu_i128, tl, env, tl, tl, tl, tl)
 DEF_HELPER_5(rems_i128, tl, env, tl, tl, tl, tl)
+
+/* Crypto functions */
+DEF_HELPER_3(aes32esmi, tl, tl, tl, tl)
+DEF_HELPER_3(aes32esi, tl, tl, tl, tl)
+DEF_HELPER_3(aes32dsmi, tl, tl, tl, tl)
+DEF_HELPER_3(aes32dsi, tl, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7491b2d562..dcd4b4adbf 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -17,6 +17,7 @@
 # this program.  If not, see <http://www.gnu.org/licenses/>.
 
 # Fields:
+%bs        30:2
 %rs3       27:5
 %rs2       20:5
 %rs1       15:5
@@ -91,6 +92,7 @@
 
 # Formats 64:
 @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
+@k_aes       .. ..... ..... ..... ... ..... ....... %bs %rs2 %rs1 %rd
 
 # Formats 128:
 @sh6       ...... ...... ..... ... ..... ....... &shift shamt=%sh6 %rs1 %rd
@@ -827,3 +829,10 @@ fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
 fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
+
+# *** RV32 Zknd Standard Extension ***
+aes32dsmi   .. 10111 ..... ..... 000 ..... 0110011 @k_aes
+aes32dsi    .. 10101 ..... ..... 000 ..... 0110011 @k_aes
+# *** RV32 Zkne Standard Extension ***
+aes32esmi   .. 10011 ..... ..... 000 ..... 0110011 @k_aes
+aes32esi    .. 10001 ..... ..... 000 ..... 0110011 @k_aes
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
new file mode 100644
index 0000000000..9cb40dd0e5
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -0,0 +1,94 @@
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
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zknd) {    \
+        return false;                           \
+    }                                           \
+} while (0)
+
+#define REQUIRE_ZKNE(ctx) do {                  \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zkne) {    \
+        return false;                           \
+    }                                           \
+} while (0)
+
+static bool trans_aes32esmi(DisasContext *ctx, arg_aes32esmi *a)
+{
+    REQUIRE_ZKNE(ctx);
+
+    TCGv bs = tcg_const_tl(a->bs);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_aes32esmi(dest, src1, src2, bs);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    tcg_temp_free(bs);
+    return true;
+}
+
+static bool trans_aes32esi(DisasContext *ctx, arg_aes32esi *a)
+{
+    REQUIRE_ZKNE(ctx);
+
+    TCGv bs = tcg_const_tl(a->bs);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_aes32esi(dest, src1, src2, bs);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    tcg_temp_free(bs);
+    return true;
+}
+
+static bool trans_aes32dsmi(DisasContext *ctx, arg_aes32dsmi *a)
+{
+    REQUIRE_ZKND(ctx);
+
+    TCGv bs = tcg_const_tl(a->bs);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_aes32dsmi(dest, src1, src2, bs);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    tcg_temp_free(bs);
+    return true;
+}
+
+static bool trans_aes32dsi(DisasContext *ctx, arg_aes32dsi *a)
+{
+    REQUIRE_ZKND(ctx);
+
+    TCGv bs = tcg_const_tl(a->bs);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_aes32dsi(dest, src1, src2, bs);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    tcg_temp_free(bs);
+    return true;
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index a32158da93..11795a0a9a 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -18,7 +18,8 @@ riscv_ss.add(files(
   'vector_helper.c',
   'bitmanip_helper.c',
   'translate.c',
-  'm128_helper.c'
+  'm128_helper.c',
+  'crypto_helper.c'
 ))
 
 riscv_softmmu_ss = ss.source_set()
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f3e37ddcd2..0ecb7639ea 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -844,6 +844,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
+#include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
-- 
2.17.1


