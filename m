Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdZnP-0001Ch-8a
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 11:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdZnL-00019V-UK; Thu, 21 Oct 2021 11:15:52 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:29488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdZnI-0000n5-FY; Thu, 21 Oct 2021 11:15:51 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 19LFFO0V089313;
 Thu, 21 Oct 2021 23:15:24 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 21 Oct 2021
 23:15:27 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <alistair23@gmail.com>, <wangjunqiang@iscas.ac.cn>, <bmeng.cn@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>, <ycliang@andestech.com>, 
 <alankao@andestech.com>, <dylan@andestech.com>, Ruinland Chuan-Tzu Tsai
 <ruinland@andestech.com>
Subject: [RFC PATCH v1 2/2] Enable custom instruction suport for Andes A25 and
 AX25 CPU model
Date: Thu, 21 Oct 2021 23:11:36 +0800
Message-ID: <20211021151136.721746-2-ruinland@andestech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021151136.721746-1-ruinland@andestech.com>
References: <20211021151136.721746-1-ruinland@andestech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.12.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 19LFFO0V089313
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 21 Oct 2021 15:15:52 -0000

In this patch, we demonstrate how Andes Performance Extension(c) insn :
bfos and bfoz could be used with Andes CoDense : exec.it.

By doing so, an Andes vendor designed CSR : uitb must be used.

Signed-off-by: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
---
 target/riscv/andes_codense.decode         |  23 +++++
 target/riscv/andes_custom_rv32.decode     |  27 +++++
 target/riscv/andes_custom_rv64.decode     |  27 +++++
 target/riscv/andes_helper.c               |  49 +++++++++
 target/riscv/andes_helper.h               |   1 +
 target/riscv/cpu.c                        |   8 ++
 target/riscv/helper.h                     |   2 +
 target/riscv/insn_trans/trans_andes.c.inc | 115 ++++++++++++++++++++++
 target/riscv/meson.build                  |  13 +++
 target/riscv/translate.c                  |  12 +++
 10 files changed, 277 insertions(+)
 create mode 100644 target/riscv/andes_codense.decode
 create mode 100644 target/riscv/andes_custom_rv32.decode
 create mode 100644 target/riscv/andes_custom_rv64.decode
 create mode 100644 target/riscv/andes_helper.c
 create mode 100644 target/riscv/andes_helper.h
 create mode 100644 target/riscv/insn_trans/trans_andes.c.inc

diff --git a/target/riscv/andes_codense.decode b/target/riscv/andes_codense.decode
new file mode 100644
index 0000000000..639d22ac67
--- /dev/null
+++ b/target/riscv/andes_codense.decode
@@ -0,0 +1,23 @@
+#
+# RISC-V translation routines for the RVXI Base Integer Instruction Set.
+#
+# Copyright (c) 2018 Peer Adelt, peer.adelt@hni.uni-paderborn.de
+#                    Bastian Koppelmann, kbastian@mail.uni-paderborn.de
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2 or later, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+# You should have received a copy of the GNU General Public License along with
+# this program.  If not, see <http://www.gnu.org/licenses/>.
+
+
+%imm_ex10 8:s1 12:1 3:1 9:1 5:2 2:1 10:2 4:1
+&codense imm_codense
+@ex10     ... .... . . ..... .. &codense imm_codense=%imm_ex10
+execit    100 .... . 0 ..... 00 @ex10
diff --git a/target/riscv/andes_custom_rv32.decode b/target/riscv/andes_custom_rv32.decode
new file mode 100644
index 0000000000..f69d75018d
--- /dev/null
+++ b/target/riscv/andes_custom_rv32.decode
@@ -0,0 +1,27 @@
+#
+# Andes Technology V5 Performance Extension
+#
+# Copyright (c) 2021 Andes Technology, ruinland@andestech.com
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2 or later, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+# You should have received a copy of the GNU General Public License along with
+# this program.  If not, see <http://www.gnu.org/licenses/>.
+
+# Fields:
+%rs1       15:5
+%rd        7:5
+## Similar to I-Type
+%mbfob    26:5
+%lbfob    20:5
+&i_b mbfob lbfob rs1 rd
+@i_bfo    . ..... . ..... ..... ... ..... .......  &i_b %mbfob %lbfob %rs1 %rd
+bfos      0 ..... 0 ..... ..... 011 .....  1011011 @i_bfo #0x03
+bfoz      0 ..... 0 ..... ..... 010 .....  1011011 @i_bfo #0x02
diff --git a/target/riscv/andes_custom_rv64.decode b/target/riscv/andes_custom_rv64.decode
new file mode 100644
index 0000000000..61f1fb208b
--- /dev/null
+++ b/target/riscv/andes_custom_rv64.decode
@@ -0,0 +1,27 @@
+#
+# Andes Technology V5 Performance Extension
+#
+# Copyright (c) 2021 Andes Technology, ruinland@andestech.com
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2 or later, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+# You should have received a copy of the GNU General Public License along with
+# this program.  If not, see <http://www.gnu.org/licenses/>.
+
+# Fields:
+%rs1       15:5
+%rd        7:5
+## Similar to I-Type
+%mbfob    26:6
+%lbfob    20:6
+&i_b mbfob lbfob rs1 rd
+@i_bfo    . ..... . ..... ..... ... ..... .......  &i_b %mbfob %lbfob %rs1 %rd
+bfos      . ..... . ..... ..... 011 .....  1011011 @i_bfo #0x03
+bfoz      . ..... . ..... ..... 010 .....  1011011 @i_bfo #0x02
diff --git a/target/riscv/andes_helper.c b/target/riscv/andes_helper.c
new file mode 100644
index 0000000000..5e1e52fccb
--- /dev/null
+++ b/target/riscv/andes_helper.c
@@ -0,0 +1,49 @@
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "qemu/host-utils.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "fpu/softfloat.h"
+#include "internals.h"
+typedef int (*test_function)(uint8_t a, uint8_t b);
+target_ulong helper_andes_v5_bfo_x(target_ulong rd, target_ulong rs1,
+                                   target_ulong insn)
+{
+    int msb, lsb, is_se;
+    int lsbp1, msbm1, lsbm1, lenm1;
+    uint64_t se;
+    uint64_t nxrd = rd; /* for safety sake */
+
+    msb = extract64(insn, 26, 6);
+    lsb = extract64(insn, 20, 6);
+    is_se = 0x3 == (0x7 & (insn >> 12)); /* BFOS */
+    lsbp1 = lsb + 1;
+    msbm1 = msb - 1;
+    lsbm1 = lsb - 1;
+
+    if (msb == 0) {
+        nxrd = deposit64(nxrd, lsb, 1, 1 & rs1);
+        if (lsb > 0) {
+            nxrd = deposit64(nxrd, 0, lsbm1 + 1, 0);
+        }
+        if (lsb < 63) {
+            se = (is_se && (1 & rs1)) ? -1LL : 0;
+            nxrd = deposit64(nxrd, lsbp1, 64 - lsbp1, se);
+        }
+    } else if (msb < lsb) {
+        lenm1 = lsb - msb;
+        nxrd = deposit64(nxrd, msb, lenm1 + 1, rs1 >> 0);
+        if (lsb < 63) {
+            se = (is_se && (1 & (rs1 >> lenm1))) ? -1LL : 0;
+            nxrd = deposit64(nxrd, lsbp1, 64 - lsbp1, se);
+        }
+        nxrd = deposit64(nxrd, 0, msbm1 + 1, 0);
+    } else { /* msb >= lsb */
+        lenm1 = msb - lsb;
+        nxrd = deposit64(nxrd, 0, lenm1 + 1, rs1 >> lsb);
+        se = (is_se && (1 & (rs1 >> msb))) ? -1LL : 0;
+        nxrd = deposit64(nxrd, lenm1 + 1, 63 - lenm1, se);
+    }
+
+    return (target_long)nxrd;
+}
diff --git a/target/riscv/andes_helper.h b/target/riscv/andes_helper.h
new file mode 100644
index 0000000000..dfe15d8841
--- /dev/null
+++ b/target/riscv/andes_helper.h
@@ -0,0 +1 @@
+DEF_HELPER_FLAGS_3(andes_v5_bfo_x, TCG_CALL_NO_RWG, tl, tl, tl, tl)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e8ab5734c2..fc20673c1a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -207,8 +207,12 @@ static void rv64_base_cpu_init(Object *obj)
 static void ax25_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
+    HartState = env;
     set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+    cpu_has_custom_insns = true;
+    custom_insn_handler    = decode_andes;
+    custom_c_insn_handler  = decode_codense;
     setup_custom_csr(env, andes_custom_csr_table);
     env->custom_csr_val = g_malloc(andes_custom_csr_size);
 }
@@ -271,8 +275,12 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
 static void a25_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
+    HartState = env;
     set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
+    cpu_has_custom_insns = true;
+    custom_insn_handler    = decode_andes;
+    custom_c_insn_handler  = decode_codense;
     setup_custom_csr(env, andes_custom_csr_table);
     env->custom_csr_val = g_malloc(andes_custom_csr_size);
 }
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 460eee9988..ca60825e80 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1149,3 +1149,5 @@ DEF_HELPER_6(vcompress_vm_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vcompress_vm_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+#include "andes_helper.h"
diff --git a/target/riscv/insn_trans/trans_andes.c.inc b/target/riscv/insn_trans/trans_andes.c.inc
new file mode 100644
index 0000000000..384745fceb
--- /dev/null
+++ b/target/riscv/insn_trans/trans_andes.c.inc
@@ -0,0 +1,115 @@
+#define GP 3
+#define ANDES_V5_CODE_DENSE_MASK (0xe083)
+#define ANDES_V5_CODE_DENSE_ID(x) ((x)&ANDES_V5_CODE_DENSE_MASK)
+#define ANDES_V5_CODE_DENSE_IMM11(x) (     \
+    (extract32(x, 4, 1) << 2) |   \
+    (extract32(x, 10, 2) << 3) |  \
+    (extract32(x, 2, 1) << 5) |   \
+    (extract32(x, 5, 2) << 6) |   \
+    (extract32(x, 9, 1) << 8) |   \
+    (extract32(x, 3, 1) << 9) |   \
+    (extract32(x, 12, 1) << 10) | \
+    (extract64(x, 8, 1) << 11) | \
+    0)
+
+#define ANDES_V5_GET_JAL_UIMM(inst) ((extract32(inst, 21, 10) << 1) \
+                           | (extract32(inst, 20, 1) << 11) \
+                           | (extract32(inst, 12, 8) << 12) \
+                           | (extract32(inst, 31, 1) << 20))
+
+
+enum andes_v5_inst_id
+{
+    /* Code Dense Extension */
+    EXEC_IT = (0x8000),
+    /* custom 2 */
+    BFOS = 0x03,
+    BFOZ = 0x02,
+};
+
+static bool trans_bfos(DisasContext *ctx, arg_bfos *a)
+{
+    TCGv v0, v1, v2;
+    v2 = tcg_const_tl(ctx->opcode);
+    v0 = get_gpr(ctx, a->rs1, EXT_NONE);
+    v1 = get_gpr(ctx, a->rd, EXT_NONE);
+    gen_helper_andes_v5_bfo_x(v1, v1, v0, v2);
+    gen_set_gpr(ctx, a->rd, v1);
+    tcg_temp_free(v2);
+    return true;
+}
+
+static bool trans_bfoz(DisasContext *ctx, arg_bfoz *a)
+{
+    TCGv v0, v1, v2;
+    v2 = tcg_const_tl(ctx->opcode);
+    v0 = get_gpr(ctx, a->rs1, EXT_NONE);
+    v1 = get_gpr(ctx, a->rd,  EXT_NONE);
+    gen_helper_andes_v5_bfo_x(v1, v1, v0, v2);
+    gen_set_gpr(ctx, a->rd, v1);
+    tcg_temp_free(v2);
+    return true;
+}
+
+static void decode_opc_andes(CPURISCVState *env, DisasContext *ctx, uint32_t opcode32)
+{
+    uint32_t old_opcode = ctx->opcode;
+    ctx->opcode = opcode32;
+    custom_insn_decoded = decode_andes(ctx, opcode32);
+    if(!custom_insn_decoded) {
+        if (!decode_insn32(ctx, opcode32)) {
+            gen_exception_illegal(ctx);
+        }
+    }
+    ctx->opcode = old_opcode;
+}
+
+static int andes_v5_gen_codense_exec_it(CPURISCVState *env, DisasContext *ctx, arg_execit *a)
+{
+    uint32_t insn;
+    uint32_t imm_ex10 = a->imm_codense;
+    target_ulong uitb_val = 0;
+    riscv_csrrw(env, 0x800, &uitb_val, 0, 0);
+
+    if (extract32(uitb_val, 0, 1)) { /* UTIB.HW == 1 */
+        qemu_log_mask(LOG_GUEST_ERROR, "exec.it: UITB.HW == 1 is not supported by now!\n");
+        gen_exception_illegal(ctx);
+
+        uint32_t instruction_table[0];
+        insn = instruction_table[imm_ex10 >> 2];
+
+        return false;
+    } else { /* UTIB.HW == 0 */
+        target_ulong vaddr = (uitb_val & ~0x3) + (imm_ex10<<2);
+        insn = cpu_ldl_code(env, vaddr);
+    }
+
+/*  Execute(insn) 
+ *  do as the replaced instruction, even exceptions,
+ *  except ctx->pc_succ_insn value (2).
+ */
+        uint32_t op = MASK_OP_MAJOR(insn);
+        if (op == OPC_RISC_JAL) {
+            /* implement this by hack imm */
+            int rd = GET_RD(ctx->opcode);
+            target_long imm = ANDES_V5_GET_JAL_UIMM(ctx->opcode);
+            target_ulong next_pc = (ctx->base.pc_next >> 21 << 21) | imm;
+            imm = next_pc - ctx->base.pc_next;
+            gen_jal(ctx, rd, imm);
+        } else {
+            /* JARL done as SPEC already */
+            /* presume ctx->pc_succ_insn not changed in any ISA extension */
+            decode_opc_andes(env, ctx, insn);
+        }
+
+    return true;
+}
+extern __thread CPURISCVState *HartState;
+
+static bool trans_execit(DisasContext *ctx, arg_execit *a)
+{
+    /* This is merely something to make things happen */
+    CPURISCVState *env = HartState;
+    andes_v5_gen_codense_exec_it(env ,ctx, a);
+    return true;
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 5c87672ff9..002aec2746 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -6,10 +6,23 @@ gen = [
   decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
 ]
 
+gen_custom_RV32 = [
+  decodetree.process('andes_codense.decode', extra_args: ['--decode=decode_codense', '--insnwidth=16']),
+  decodetree.process('andes_custom_rv32.decode', extra_args: '--decode=decode_andes'),
+]
+
+gen_custom_RV64 = [
+  decodetree.process('andes_codense.decode', extra_args: ['--decode=decode_codense', '--insnwidth=16']),
+  decodetree.process('andes_custom_rv64.decode', extra_args: '--decode=decode_andes'),
+]
+
 riscv_ss = ss.source_set()
 riscv_ss.add(gen)
+riscv_ss.add(when: 'TARGET_RISCV32', if_true: gen_custom_RV32)
+riscv_ss.add(when: 'TARGET_RISCV64', if_true: gen_custom_RV64)
 riscv_ss.add(files(
   'csr_andes.c',
+  'andes_helper.c',
   'cpu.c',
   'cpu_helper.c',
   'csr.c',
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f755749380..4c0085dde5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -498,6 +498,18 @@ __thread bool custom_insn_decoded;
 extern bool (*custom_c_insn_handler)(DisasContext *, uint16_t);
 extern bool (*custom_insn_handler)(DisasContext *, uint32_t);
 
+/* Include the auto-generated decoder for andes custom insn */
+bool decode_andes(DisasContext *, uint32_t);
+bool decode_codense(DisasContext *, uint16_t);
+#include "decode-andes_codense.c.inc"
+#ifdef TARGET_RISCV32
+#include "decode-andes_custom_rv32.c.inc"
+#endif
+#ifdef TARGET_RISCV64
+#include "decode-andes_custom_rv64.c.inc"
+#endif
+#include "insn_trans/trans_andes.c.inc"
+
 static void try_decode_custom_insn(CPURISCVState *env, DisasContext *ctx,
                                    uint16_t opcode)
 {
-- 
2.25.1


