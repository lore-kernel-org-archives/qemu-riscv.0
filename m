Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmtVX-0007bR-Ax
	for mharc-qemu-riscv@gnu.org; Tue, 16 Nov 2021 03:07:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mmtUz-0007BP-Lr; Tue, 16 Nov 2021 03:07:32 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:54690 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mmtUu-0003CC-Jz; Tue, 16 Nov 2021 03:07:24 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAC3mO2hZpNhU9VmBw--.50016S6;
 Tue, 16 Nov 2021 16:07:12 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com, liweiwei <liweiwei@iscas.ac.cn>
Subject: [RFC PATCH v2 4/7] target/riscv: rvk: add implementation of
 instructions for Zk*
Date: Tue, 16 Nov 2021 16:06:18 +0800
Message-Id: <20211116080621.2521-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211116080621.2521-1-liweiwei@iscas.ac.cn>
References: <20211116080621.2521-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowAC3mO2hZpNhU9VmBw--.50016S6
X-Coremail-Antispam: 1UD129KBjvAXoWfXFy3Jw43XF4kJrWrJr48Xrb_yoW5AF1UAo
 WxWr45Jrn3Jr1fu3Z7Ca1kXFW8ZFy29a1UJrs5uwsruan7Wr1Fgr1UJrn5Za1xKr4aqrWr
 XFsaqFnxAa45C3srn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUOs7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r126s0DM28Irc
 Ia0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l
 84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r
 4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
 3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
 x0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
 JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
 ka0xkIwI1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
 z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
 AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
 IxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
 4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
 daVFxhVjvjDU0xZFpf9x0JULtxDUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 16 Nov 2021 08:07:34 -0000

Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/crypto_helper.c            | 446 ++++++++++++++++++++++
 target/riscv/helper.h                   |  43 +++
 target/riscv/insn32.decode              |  42 +++
 target/riscv/insn_trans/trans_rvk.c.inc | 467 ++++++++++++++++++++++++
 target/riscv/meson.build                |   1 +
 target/riscv/translate.c                |   1 +
 6 files changed, 1000 insertions(+)
 create mode 100644 target/riscv/crypto_helper.c
 create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
new file mode 100644
index 0000000000..344eea4287
--- /dev/null
+++ b/target/riscv/crypto_helper.c
@@ -0,0 +1,446 @@
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
+    (((b) & 0x1) ?                              (a)   : 0) ^ \
+    (((b) & 0x2) ?                     AES_XTIME(a)   : 0) ^ \
+    (((b) & 0x4) ?           AES_XTIME(AES_XTIME(a))  : 0) ^ \
+    (((b) & 0x8) ? AES_XTIME(AES_XTIME(AES_XTIME(a))) : 0)) & 0xFF)
+
+#define BY(X, I) ((X >> (8 * I)) & 0xFF)
+
+#define AES_SHIFROWS_LO(RS1, RS2) ( \
+    (((RS1 >> 24) & 0xFF) << 56) | \
+    (((RS2 >> 48) & 0xFF) << 48) | \
+    (((RS2 >>  8) & 0xFF) << 40) | \
+    (((RS1 >> 32) & 0xFF) << 32) | \
+    (((RS2 >> 56) & 0xFF) << 24) | \
+    (((RS2 >> 16) & 0xFF) << 16) | \
+    (((RS1 >> 40) & 0xFF) <<  8) | \
+    (((RS1 >>  0) & 0xFF) <<  0))
+
+#define AES_INVSHIFROWS_LO(RS1, RS2) ( \
+    (((RS2 >> 24) & 0xFF) << 56) | \
+    (((RS2 >> 48) & 0xFF) << 48) | \
+    (((RS1 >>  8) & 0xFF) << 40) | \
+    (((RS1 >> 32) & 0xFF) << 32) | \
+    (((RS1 >> 56) & 0xFF) << 24) | \
+    (((RS2 >> 16) & 0xFF) << 16) | \
+    (((RS2 >> 40) & 0xFF) <<  8) | \
+    (((RS1 >>  0) & 0xFF) <<  0))
+
+#define AES_MIXBYTE(COL, B0, B1, B2, B3) ( \
+              BY(COL, B3)     ^ \
+              BY(COL, B2)     ^ \
+    AES_GFMUL(BY(COL, B1), 3) ^ \
+    AES_GFMUL(BY(COL, B0), 2)   \
+)
+
+#define AES_MIXCOLUMN(COL) ( \
+    AES_MIXBYTE(COL, 3, 0, 1, 2) << 24 | \
+    AES_MIXBYTE(COL, 2, 3, 0, 1) << 16 | \
+    AES_MIXBYTE(COL, 1, 2, 3, 0) <<  8 | \
+    AES_MIXBYTE(COL, 0, 1, 2, 3) <<  0   \
+)
+
+#define AES_INVMIXBYTE(COL, B0, B1, B2, B3) ( \
+    AES_GFMUL(BY(COL, B3), 0x9) ^ \
+    AES_GFMUL(BY(COL, B2), 0xd) ^ \
+    AES_GFMUL(BY(COL, B1), 0xb) ^ \
+    AES_GFMUL(BY(COL, B0), 0xe)   \
+)
+
+#define AES_INVMIXCOLUMN(COL) ( \
+    AES_INVMIXBYTE(COL, 3, 0, 1, 2) << 24 | \
+    AES_INVMIXBYTE(COL, 2, 3, 0, 1) << 16 | \
+    AES_INVMIXBYTE(COL, 1, 2, 3, 0) <<  8 | \
+    AES_INVMIXBYTE(COL, 0, 1, 2, 3) <<  0   \
+)
+
+static inline uint32_t aes_mixcolumn_byte(uint8_t x, bool fwd)
+{
+    uint32_t u;
+    if (fwd) {
+        u = (AES_GFMUL(x, 3) << 24) |
+                          (x << 16) |
+                          (x <<  8) |
+            (AES_GFMUL(x, 2) <<  0);
+    } else {
+        u = (AES_GFMUL(x, 0xb) << 24) |
+            (AES_GFMUL(x, 0xd) << 16) |
+            (AES_GFMUL(x, 0x9) <<  8) |
+            (AES_GFMUL(x, 0xe) <<  0);
+    }
+    return u;
+}
+
+#define XLEN (8 * sizeof(target_ulong))
+#define zext32(x) ((uint64_t)(uint32_t)(x))
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
+    if (enc) {
+        so = AES_sbox[si];
+        if (mix) {
+            mixed = aes_mixcolumn_byte(so, true);
+        } else {
+            mixed = so;
+        }
+
+    } else {
+        so = AES_isbox[si];
+        if (mix) {
+            mixed = aes_mixcolumn_byte(so, false);
+        } else {
+            mixed = so;
+        }
+    }
+    mixed = (mixed << shamt) | (mixed >> (32 - shamt));
+    target_ulong res = rs1 ^ mixed;
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
+
+static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
+                                           bool enc, bool mix)
+{
+    uint64_t RS1 = rs1;
+    uint64_t RS2 = rs2;
+    uint64_t result;
+    uint64_t temp;
+    uint32_t col_0;
+    uint32_t col_1;
+    if (enc) {
+        temp = AES_SHIFROWS_LO(RS1, RS2);
+        temp = (
+            ((uint64_t)AES_sbox[(temp >>  0) & 0xFF] <<  0) |
+            ((uint64_t)AES_sbox[(temp >>  8) & 0xFF] <<  8) |
+            ((uint64_t)AES_sbox[(temp >> 16) & 0xFF] << 16) |
+            ((uint64_t)AES_sbox[(temp >> 24) & 0xFF] << 24) |
+            ((uint64_t)AES_sbox[(temp >> 32) & 0xFF] << 32) |
+            ((uint64_t)AES_sbox[(temp >> 40) & 0xFF] << 40) |
+            ((uint64_t)AES_sbox[(temp >> 48) & 0xFF] << 48) |
+            ((uint64_t)AES_sbox[(temp >> 56) & 0xFF] << 56)
+        );
+        if (mix) {
+            col_0 = temp & 0xFFFFFFFF;
+            col_1 = temp >> 32       ;
+
+            col_0 = AES_MIXCOLUMN(col_0);
+            col_1 = AES_MIXCOLUMN(col_1);
+
+            result = ((uint64_t)col_1 << 32) | col_0;
+        } else {
+            result = temp;
+        }
+    } else {
+        temp = AES_INVSHIFROWS_LO(RS1, RS2);
+        temp = (
+            ((uint64_t)AES_isbox[(temp >>  0) & 0xFF] <<  0) |
+            ((uint64_t)AES_isbox[(temp >>  8) & 0xFF] <<  8) |
+            ((uint64_t)AES_isbox[(temp >> 16) & 0xFF] << 16) |
+            ((uint64_t)AES_isbox[(temp >> 24) & 0xFF] << 24) |
+            ((uint64_t)AES_isbox[(temp >> 32) & 0xFF] << 32) |
+            ((uint64_t)AES_isbox[(temp >> 40) & 0xFF] << 40) |
+            ((uint64_t)AES_isbox[(temp >> 48) & 0xFF] << 48) |
+            ((uint64_t)AES_isbox[(temp >> 56) & 0xFF] << 56)
+        );
+        if (mix) {
+            col_0 = temp & 0xFFFFFFFF;
+            col_1 = temp >> 32       ;
+
+            col_0 = AES_INVMIXCOLUMN(col_0);
+            col_1 = AES_INVMIXCOLUMN(col_1);
+
+            result = ((uint64_t)col_1 << 32) | col_0;
+        } else {
+            result = temp;
+        }
+    }
+    return result;
+}
+
+target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
+{
+    return aes64_operation(rs1, rs2, true, true);
+}
+
+target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
+{
+    return aes64_operation(rs1, rs2, true, false);
+}
+
+target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
+{
+    return aes64_operation(rs1, rs2, false, false);
+}
+
+target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
+{
+    return aes64_operation(rs1, rs2, false, true);
+}
+
+target_ulong HELPER(aes64ks2)(target_ulong rs1, target_ulong rs2)
+{
+    uint64_t RS1 = rs1;
+    uint64_t RS2 = rs2;
+    uint32_t rs1_hi =  RS1 >> 32;
+    uint32_t rs2_lo =  RS2      ;
+    uint32_t rs2_hi =  RS2 >> 32;
+
+    uint32_t r_lo   = (rs1_hi ^ rs2_lo) ;
+    uint32_t r_hi   = (rs1_hi ^ rs2_lo ^ rs2_hi) ;
+    target_ulong result =  ((uint64_t)r_hi << 32) | r_lo ;
+    return result;
+}
+
+target_ulong HELPER(aes64ks1i)(target_ulong rs1, target_ulong rnum)
+{
+    uint64_t RS1 = rs1;
+    uint8_t round_consts[10] = {
+        0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36
+    };
+
+    uint8_t enc_rnum = rnum;
+    uint32_t temp = (RS1 >> 32) & 0xFFFFFFFF;
+    uint8_t rcon_ = 0;
+    target_ulong result;
+
+    if (enc_rnum != 0xA) {
+        temp = (temp >> 8) | (temp << 24); /* Rotate right by 8 */
+        rcon_ = round_consts[enc_rnum];
+    }
+
+    temp =
+        ((uint32_t)AES_sbox[(temp >> 24) & 0xFF] << 24) |
+        ((uint32_t)AES_sbox[(temp >> 16) & 0xFF] << 16) |
+        ((uint32_t)AES_sbox[(temp >>  8) & 0xFF] <<  8) |
+        ((uint32_t)AES_sbox[(temp >>  0) & 0xFF] <<  0) ;
+
+    temp ^= rcon_;
+
+    result = ((uint64_t)temp << 32) | temp;
+    return result;
+}
+
+target_ulong HELPER(aes64im)(target_ulong rs1)
+{
+    uint64_t RS1 = rs1;
+    uint32_t col_0 = RS1 & 0xFFFFFFFF;
+    uint32_t col_1 = RS1 >> 32       ;
+
+    col_0 = AES_INVMIXCOLUMN(col_0);
+    col_1 = AES_INVMIXCOLUMN(col_1);
+
+    target_ulong result = ((uint64_t)col_1 << 32) | col_0;
+    return result;
+}
+
+#define ROR32(a, amt) ((a << (-amt & 31)) | (a >> (amt & 31)))
+target_ulong HELPER(sha256sig0)(target_ulong rs1)
+{
+    uint32_t a = rs1;
+    return sext_xlen(ROR32(a, 7) ^ ROR32(a, 18) ^ (a >> 3));
+}
+
+target_ulong HELPER(sha256sig1)(target_ulong rs1)
+{
+    uint32_t a = rs1;
+    return sext_xlen(ROR32(a, 17) ^ ROR32(a, 19) ^ (a >> 10));
+}
+
+target_ulong HELPER(sha256sum0)(target_ulong rs1)
+{
+    uint32_t a = rs1;
+    return sext_xlen(ROR32(a, 2) ^ ROR32(a, 13) ^ ROR32(a, 22));
+}
+
+target_ulong HELPER(sha256sum1)(target_ulong rs1)
+{
+    uint32_t a = rs1;
+    return sext_xlen(ROR32(a, 6) ^ ROR32(a, 11) ^ ROR32(a, 25));
+}
+#undef ROR32
+
+target_ulong HELPER(sha512sum0r)(target_ulong RS1, target_ulong RS2)
+{
+    uint64_t result =
+        (zext32(RS1) << 25) ^ (zext32(RS1) << 30) ^ (zext32(RS1) >> 28) ^
+        (zext32(RS2) >>  7) ^ (zext32(RS2) >>  2) ^ (zext32(RS2) <<  4);
+    return sext_xlen(result);
+}
+
+target_ulong HELPER(sha512sum1r)(target_ulong RS1, target_ulong RS2)
+{
+    uint64_t result =
+        (zext32(RS1) << 23) ^ (zext32(RS1) >> 14) ^ (zext32(RS1) >> 18) ^
+        (zext32(RS2) >>  9) ^ (zext32(RS2) << 18) ^ (zext32(RS2) << 14);
+    return sext_xlen(result);
+}
+
+target_ulong HELPER(sha512sig0l)(target_ulong RS1, target_ulong RS2)
+{
+    uint64_t result =
+        (zext32(RS1) >>  1) ^ (zext32(RS1) >>  7) ^ (zext32(RS1) >>  8) ^
+        (zext32(RS2) << 31) ^ (zext32(RS2) << 25) ^ (zext32(RS2) << 24);
+    return sext_xlen(result);
+}
+
+target_ulong HELPER(sha512sig0h)(target_ulong RS1, target_ulong RS2)
+{
+    uint64_t result =
+        (zext32(RS1) >>  1) ^ (zext32(RS1) >>  7) ^ (zext32(RS1) >>  8) ^
+        (zext32(RS2) << 31) ^                       (zext32(RS2) << 24);
+    return sext_xlen(result);
+}
+
+target_ulong HELPER(sha512sig1l)(target_ulong RS1, target_ulong RS2)
+{
+    uint64_t result =
+        (zext32(RS1) <<  3) ^ (zext32(RS1) >>  6) ^ (zext32(RS1) >> 19) ^
+        (zext32(RS2) >> 29) ^ (zext32(RS2) << 26) ^ (zext32(RS2) << 13);
+    return sext_xlen(result);
+}
+
+target_ulong HELPER(sha512sig1h)(target_ulong RS1, target_ulong RS2)
+{
+    uint64_t result =
+        (zext32(RS1) <<  3) ^ (zext32(RS1) >>  6) ^ (zext32(RS1) >> 19) ^
+        (zext32(RS2) >> 29) ^                       (zext32(RS2) << 13);
+    return sext_xlen(result);
+}
+
+#define ROR64(a, amt) ((a << (-amt & 63)) | (a >> (amt & 63)))
+target_ulong HELPER(sha512sig0)(target_ulong rs1)
+{
+    uint64_t a = rs1;
+    return ROR64(a,  1) ^ ROR64(a, 8) ^ (a >>  7);
+}
+
+target_ulong HELPER(sha512sig1)(target_ulong rs1)
+{
+    uint64_t a = rs1;
+    return ROR64(a, 19) ^ ROR64(a, 61) ^ (a >>  6);
+}
+
+target_ulong HELPER(sha512sum0)(target_ulong rs1)
+{
+    uint64_t a = rs1;
+    return ROR64(a, 28) ^ ROR64(a, 34) ^ ROR64(a, 39);
+}
+
+target_ulong HELPER(sha512sum1)(target_ulong rs1)
+{
+    uint64_t a = rs1;
+    return ROR64(a, 14) ^ ROR64(a, 18) ^ ROR64(a, 41);
+}
+#undef ROR64
+
+#define ROL32(a, amt) ((a >> (-amt & 31)) | (a << (amt & 31)))
+target_ulong HELPER(sm3p0)(target_ulong rs1)
+{
+    uint32_t src    = rs1;
+    uint32_t result = src ^ ROL32(src, 9) ^ ROL32(src, 17);
+    return sext_xlen(result);
+}
+target_ulong HELPER(sm3p1)(target_ulong rs1)
+{
+    uint32_t src    = rs1;
+    uint32_t result = src ^ ROL32(src, 15) ^ ROL32(src, 23);
+    return sext_xlen(result);
+}
+#undef ROL32
+
+
+target_ulong HELPER(sm4ed)(target_ulong rs2, target_ulong rt, target_ulong bs)
+{
+    uint8_t  bs_t   = bs;
+
+    uint32_t sb_in  = (uint8_t)(rs2 >> (8 * bs_t));
+    uint32_t sb_out = (uint32_t)sm4_sbox[sb_in];
+
+    uint32_t linear = sb_out ^  (sb_out         <<  8) ^
+                                (sb_out         <<  2) ^
+                                (sb_out         << 18) ^
+                               ((sb_out & 0x3f) << 26) ^
+                               ((sb_out & 0xC0) << 10) ;
+
+    uint32_t rotl   = (linear << (8 * bs_t)) | (linear >> (32 - 8 * bs_t));
+
+    return sext_xlen(rotl ^ (uint32_t)rt);
+}
+
+target_ulong HELPER(sm4ks)(target_ulong rs2, target_ulong rs1, target_ulong bs)
+{
+    uint8_t  bs_t   = bs;
+
+    uint32_t sb_in  = (uint8_t)(rs2 >> (8 * bs_t));
+    uint32_t sb_out = sm4_sbox[sb_in];
+
+    uint32_t x      = sb_out ^
+                      ((sb_out & 0x07) << 29) ^ ((sb_out & 0xFE) <<  7) ^
+                      ((sb_out & 0x01) << 23) ^ ((sb_out & 0xF8) << 13) ;
+
+    uint32_t rotl   = (x << (8 * bs_t)) | (x >> (32 - 8 * bs_t));
+
+    return sext_xlen(rotl ^ (uint32_t)rs1);
+}
+#undef XLEN
+#undef zext32
+#undef sext_xlen
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 1cc626893f..cb4cddd38a 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1152,3 +1152,46 @@ DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+/* Crypto Extension - aes 32 */
+DEF_HELPER_3(aes32esmi, tl, tl, tl, tl)
+DEF_HELPER_3(aes32esi, tl, tl, tl, tl)
+DEF_HELPER_3(aes32dsmi, tl, tl, tl, tl)
+DEF_HELPER_3(aes32dsi, tl, tl, tl, tl)
+
+/* Crypto Extension - aes 64 */
+DEF_HELPER_2(aes64esm, tl, tl, tl)
+DEF_HELPER_2(aes64es, tl, tl, tl)
+DEF_HELPER_2(aes64ds, tl, tl, tl)
+DEF_HELPER_2(aes64dsm, tl, tl, tl)
+DEF_HELPER_2(aes64ks2, tl, tl, tl)
+DEF_HELPER_2(aes64ks1i, tl, tl, tl)
+DEF_HELPER_1(aes64im, tl, tl)
+
+/* Crypto Extension - sha256 */
+DEF_HELPER_1(sha256sig0, tl, tl)
+DEF_HELPER_1(sha256sig1, tl, tl)
+DEF_HELPER_1(sha256sum0, tl, tl)
+DEF_HELPER_1(sha256sum1, tl, tl)
+
+/* Crypto Extension - sha512 */
+DEF_HELPER_2(sha512sum0r, tl, tl, tl)
+DEF_HELPER_2(sha512sum1r, tl, tl, tl)
+DEF_HELPER_2(sha512sig0l, tl, tl, tl)
+DEF_HELPER_2(sha512sig0h, tl, tl, tl)
+DEF_HELPER_2(sha512sig1l, tl, tl, tl)
+DEF_HELPER_2(sha512sig1h, tl, tl, tl)
+
+/* Crypto Extension - sha512 */
+DEF_HELPER_1(sha512sig0, tl, tl)
+DEF_HELPER_1(sha512sig1, tl, tl)
+DEF_HELPER_1(sha512sum0, tl, tl)
+DEF_HELPER_1(sha512sum1, tl, tl)
+
+/* Crypto Extension - sm3 */
+DEF_HELPER_1(sm3p0, tl, tl)
+DEF_HELPER_1(sm3p1, tl, tl)
+
+/* Crypto Extension - sm4 */
+DEF_HELPER_3(sm4ed, tl, tl, tl, tl)
+DEF_HELPER_3(sm4ks, tl, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a5333c4533..9e8f01bc63 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -17,8 +17,10 @@
 # this program.  If not, see <http://www.gnu.org/licenses/>.
 
 # Fields:
+%bs        30:2
 %rs3       27:5
 %rs2       20:5
+%rnum      20:4
 %rs1       15:5
 %rd        7:5
 %sh5       20:5
@@ -91,6 +93,7 @@
 
 # Formats 64:
 @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=%sh5      %rs1 %rd
+@k_aes       .. ..... ..... ..... ... ..... ....... %bs %rs2 %rs1 %rd
 
 # *** Privileged Instructions ***
 ecall       000000000000     00000 000 00000 1110011
@@ -744,3 +747,42 @@ binv       0110100 .......... 001 ..... 0110011 @r
 binvi      01101. ........... 001 ..... 0010011 @sh
 bset       0010100 .......... 001 ..... 0110011 @r
 bseti      00101. ........... 001 ..... 0010011 @sh
+
+# *** RV32 Zknd Standard Extension ***
+aes32dsmi   .. 10111 ..... ..... 000 ..... 0110011 @k_aes
+aes32dsi    .. 10101 ..... ..... 000 ..... 0110011 @k_aes
+# *** RV64 Zknd Standard Extension ***
+aes64dsm    00 11111 ..... ..... 000 ..... 0110011 @r
+aes64ds     00 11101 ..... ..... 000 ..... 0110011 @r
+aes64im     00 11000 00000 ..... 001 ..... 0010011 @r2
+# *** RV32 Zkne Standard Extension ***
+aes32esmi   .. 10011 ..... ..... 000 ..... 0110011 @k_aes
+aes32esi    .. 10001 ..... ..... 000 ..... 0110011 @k_aes
+# *** RV64 Zkne Standard Extension ***
+aes64es     00 11001 ..... ..... 000 ..... 0110011 @r
+aes64esm    00 11011 ..... ..... 000 ..... 0110011 @r
+# *** RV64 Zkne/zknd Standard Extension ***
+aes64ks2    01 11111 ..... ..... 000 ..... 0110011 @r
+aes64ks1i   00 11000 1.... ..... 001 ..... 0010011 %rnum %rs1 %rd
+# *** RV32 Zknh Standard Extension ***
+sha256sig0  00 01000 00010 ..... 001 ..... 0010011 @r2
+sha256sig1  00 01000 00011 ..... 001 ..... 0010011 @r2
+sha256sum0  00 01000 00000 ..... 001 ..... 0010011 @r2
+sha256sum1  00 01000 00001 ..... 001 ..... 0010011 @r2
+sha512sum0r 01 01000 ..... ..... 000 ..... 0110011 @r
+sha512sum1r 01 01001 ..... ..... 000 ..... 0110011 @r
+sha512sig0l 01 01010 ..... ..... 000 ..... 0110011 @r
+sha512sig0h 01 01110 ..... ..... 000 ..... 0110011 @r
+sha512sig1l 01 01011 ..... ..... 000 ..... 0110011 @r
+sha512sig1h 01 01111 ..... ..... 000 ..... 0110011 @r
+# *** RV64 Zknh Standard Extension ***
+sha512sig0  00 01000 00110 ..... 001 ..... 0010011 @r2
+sha512sig1  00 01000 00111 ..... 001 ..... 0010011 @r2
+sha512sum0  00 01000 00100 ..... 001 ..... 0010011 @r2
+sha512sum1  00 01000 00101 ..... 001 ..... 0010011 @r2
+# *** RV32 Zksh Standard Extension ***
+sm3p0       00 01000 01000 ..... 001 ..... 0010011 @r2
+sm3p1       00 01000 01001 ..... 001 ..... 0010011 @r2
+# *** RV32 Zksed Standard Extension ***
+sm4ed       .. 11000 ..... ..... 000 ..... 0110011 @k_aes
+sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
diff --git a/target/riscv/insn_trans/trans_rvk.c.inc b/target/riscv/insn_trans/trans_rvk.c.inc
new file mode 100644
index 0000000000..da8dea69b8
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvk.c.inc
@@ -0,0 +1,467 @@
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
+#define REQUIRE_ZKNH(ctx) do {                  \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zknh) {    \
+        return false;                           \
+    }                                           \
+} while (0)
+
+#define REQUIRE_ZKSED(ctx) do {                 \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zksed) {   \
+        return false;                           \
+    }                                           \
+} while (0)
+
+#define REQUIRE_ZKSH(ctx) do {                  \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zksh) {    \
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
+static bool trans_aes64esm(DisasContext *ctx, arg_aes64esm *a)
+{
+    REQUIRE_ZKNE(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_aes64esm(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
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
+static bool trans_aes64es(DisasContext *ctx, arg_aes64es *a)
+{
+    REQUIRE_ZKNE(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_aes64es(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
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
+static bool trans_aes64dsm(DisasContext *ctx, arg_aes64dsm *a)
+{
+    REQUIRE_ZKND(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_aes64dsm(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_aes64ks2(DisasContext *ctx, arg_aes64ks2 *a)
+{
+    REQUIRE_EITHER_EXT(ctx, zknd, zkne);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_aes64ks2(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    tcg_temp_free(dest);
+    tcg_temp_free(src1);
+    tcg_temp_free(src2);
+
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
+
+static bool trans_aes64ds(DisasContext *ctx, arg_aes64ds *a)
+{
+    REQUIRE_ZKND(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_aes64ds(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_aes64ks1i(DisasContext *ctx, arg_aes64ks1i *a)
+{
+    REQUIRE_EITHER_EXT(ctx, zknd, zkne);
+
+    if (a->rnum > 0xA) {
+        return false;
+    }
+
+    TCGv rnum;
+    rnum = tcg_const_tl(a->rnum);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_aes64ks1i(dest, src1, rnum);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    tcg_temp_free(rnum);
+    return true;
+}
+
+static bool trans_aes64im(DisasContext *ctx, arg_aes64im *a)
+{
+    REQUIRE_ZKND(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_aes64im(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha256sig0(DisasContext *ctx, arg_sha256sig0 *a)
+{
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha256sig0(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha256sig1(DisasContext *ctx, arg_sha256sig1 *a)
+{
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha256sig1(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha256sum0(DisasContext *ctx, arg_sha256sum0 *a)
+{
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha256sum0(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha256sum1(DisasContext *ctx, arg_sha256sum1 *a)
+{
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha256sum1(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha512sum0r(DisasContext *ctx, arg_sha512sum0r *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_sha512sum0r(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha512sum1r(DisasContext *ctx, arg_sha512sum1r *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_sha512sum1r(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_sha512sig0l(DisasContext *ctx, arg_sha512sig0l *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_sha512sig0l(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha512sig0h(DisasContext *ctx, arg_sha512sig0h *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_sha512sig0h(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_sha512sig1l(DisasContext *ctx, arg_sha512sig1l *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_sha512sig1l(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_sha512sig1h(DisasContext *ctx, arg_sha512sig1h *a)
+{
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_sha512sig1h(dest, src1, src2);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_sha512sig0(DisasContext *ctx, arg_sha512sig0 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha512sig0(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_sha512sig1(DisasContext *ctx, arg_sha512sig1 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha512sig1(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_sha512sum0(DisasContext *ctx, arg_sha512sum0 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha512sum0(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_sha512sum1(DisasContext *ctx, arg_sha512sum1 *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZKNH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sha512sum1(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+/* SM3 */
+static bool trans_sm3p0(DisasContext *ctx, arg_sm3p0 *a)
+{
+    REQUIRE_ZKSH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sm3p0(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_sm3p1(DisasContext *ctx, arg_sm3p1 *a)
+{
+    REQUIRE_ZKSH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+
+    gen_helper_sm3p1(dest, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+/* SM4 */
+static bool trans_sm4ed(DisasContext *ctx, arg_sm4ed *a)
+{
+    REQUIRE_ZKSED(ctx);
+
+    TCGv bs = tcg_const_tl(a->bs);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_sm4ed(dest, src2, src1, bs);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    tcg_temp_free(bs);
+    return true;
+}
+
+static bool trans_sm4ks(DisasContext *ctx, arg_sm4ks *a)
+{
+    REQUIRE_ZKSED(ctx);
+
+    TCGv bs = tcg_const_tl(a->bs);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_helper_sm4ks(dest, src2, src1, bs);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    tcg_temp_free(bs);
+    return true;
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index d5e0bc93ea..4fc385c2fb 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -18,6 +18,7 @@ riscv_ss.add(files(
   'vector_helper.c',
   'bitmanip_helper.c',
   'translate.c',
+  'crypto_helper.c',
 ))
 
 riscv_softmmu_ss = ss.source_set()
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c319707a6f..64acd5f572 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -581,6 +581,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
+#include "insn_trans/trans_rvk.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
-- 
2.17.1


