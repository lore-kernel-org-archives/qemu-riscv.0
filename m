Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUOfQ-0000ka-Cm
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 04:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pUOfO-0000kD-0P; Tue, 21 Feb 2023 04:10:30 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pUOfK-00075K-8K; Tue, 21 Feb 2023 04:10:29 -0500
Received: from localhost.localdomain (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowAAHBUFyivRjvZKIBg--.64010S2;
 Tue, 21 Feb 2023 17:10:11 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH] target/riscv: Add support for Zicond extension
Date: Tue, 21 Feb 2023 17:10:09 +0800
Message-Id: <20230221091009.36545-1-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAHBUFyivRjvZKIBg--.64010S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtw18Ar13XF4fAr1UWFyDZFb_yoW7XFWfpr
 4rG347Ga1DAFyfAayftF4UXr1UCrs3G3yUK39avwn5Xa13WrWxJrsrK3yagrWUJFWkZr4j
 9F45Cry5uws5JaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
 xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
 MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
 0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOG
 QDUUUUU
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 21 Feb 2023 09:10:31 -0000

The spec can be found in https://github.com/riscv/riscv-zicond.
Two instructions are added:
 - czero.eqz: Moves zero to a register rd, if the condition rs2 is
   equal to zero, otherwise moves rs1 to rd.
 - czero.nez: Moves zero to a register rd, if the condition rs2 is
   nonzero, otherwise moves rs1 to rd.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c                           |  2 +
 target/riscv/cpu.h                           |  1 +
 target/riscv/insn32.decode                   |  4 ++
 target/riscv/insn_trans/trans_rvzicond.c.inc | 49 ++++++++++++++++++++
 target/riscv/translate.c                     |  1 +
 5 files changed, 57 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_rvzicond.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0dd2f0c753..80b92930ae 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -74,6 +74,7 @@ struct isa_ext_data {
 static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
     ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
+    ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
     ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
@@ -1143,6 +1144,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
     /* These are experimental so mark with 'x-' */
+    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7128438d8e..81b7c92e7a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -447,6 +447,7 @@ struct RISCVCPUConfig {
     bool ext_zkt;
     bool ext_ifencei;
     bool ext_icsr;
+    bool ext_zicond;
     bool ext_zihintpause;
     bool ext_smstateen;
     bool ext_sstc;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b7e7613ea2..fb537e922e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -890,3 +890,7 @@ sm3p1       00 01000 01001 ..... 001 ..... 0010011 @r2
 # *** RV32 Zksed Standard Extension ***
 sm4ed       .. 11000 ..... ..... 000 ..... 0110011 @k_aes
 sm4ks       .. 11010 ..... ..... 000 ..... 0110011 @k_aes
+
+# *** RV32 Zicond Standard Extension ***
+czero_eqz   0000111  ..... ..... 101 ..... 0110011 @r
+czero_nez   0000111  ..... ..... 111 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvzicond.c.inc b/target/riscv/insn_trans/trans_rvzicond.c.inc
new file mode 100644
index 0000000000..645260164e
--- /dev/null
+++ b/target/riscv/insn_trans/trans_rvzicond.c.inc
@@ -0,0 +1,49 @@
+/*
+ * RISC-V translation routines for the Zicond Standard Extension.
+ *
+ * Copyright (c) 2020-2023 PLCT Lab
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
+#define REQUIRE_ZICOND(ctx) do {          \
+    if (!ctx->cfg_ptr->ext_zicond) {      \
+        return false;                     \
+    }                                     \
+} while (0)
+
+static bool trans_czero_eqz(DisasContext *ctx, arg_czero_eqz *a)
+{
+    REQUIRE_ZICOND(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    tcg_gen_movcond_tl(TCG_COND_EQ, dest, src2, ctx->zero, ctx->zero, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_czero_nez(DisasContext *ctx, arg_czero_nez *a)
+{
+    REQUIRE_ZICOND(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    tcg_gen_movcond_tl(TCG_COND_NE, dest, src2, ctx->zero, ctx->zero, src1);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 772f9d7973..6e65c6afca 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1103,6 +1103,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvh.c.inc"
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
+#include "insn_trans/trans_rvzicond.c.inc"
 #include "insn_trans/trans_rvzawrs.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_rvk.c.inc"
-- 
2.25.1


