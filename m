Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oe4lg-0001vA-C4
	for mharc-qemu-riscv@gnu.org; Thu, 29 Sep 2022 21:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oe4le-0001rN-K2; Thu, 29 Sep 2022 21:24:42 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:39496 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oe4lZ-00080q-Mm; Thu, 29 Sep 2022 21:24:42 -0400
Received: from localhost.localdomain (unknown [139.227.114.201])
 by APP-05 (Coremail) with SMTP id zQCowABHOHVJRTZjaraNAg--.3616S6;
 Fri, 30 Sep 2022 09:24:29 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [RFC 4/8] target/riscv: add support for Zcmp extension
Date: Fri, 30 Sep 2022 09:23:41 +0800
Message-Id: <20220930012345.5248-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930012345.5248-1-liweiwei@iscas.ac.cn>
References: <20220930012345.5248-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHOHVJRTZjaraNAg--.3616S6
X-Coremail-Antispam: 1UD129KBjvAXoW3tw1xWrW7XF15Xw47Wr4UArb_yoW8Jw4DWo
 WxWF4rAr4rtF1fC3Z3Cw42gr1DXw10krW8GFn8Zw4DKFs5Zw4fWryUtwn5Zw1xJr43KFy8
 Ja1SqF93JFs5Wry3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYG7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r126s0DM28Irc
 Ia0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l
 84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJV
 WxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8
 Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
 Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
 Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
 w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
 0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZX7UUUUU==
X-Originating-IP: [139.227.114.201]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 30 Sep 2022 01:24:42 -0000

Add encode, trans* functions and helper functions support for Zcmp
instructions

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/helper.h                     |   6 +
 target/riscv/insn16.decode                |  24 ++-
 target/riscv/insn_trans/trans_rvzce.c.inc | 123 +++++++++++++
 target/riscv/meson.build                  |   3 +-
 target/riscv/translate.c                  |   9 +-
 target/riscv/zce_helper.c                 | 210 ++++++++++++++++++++++
 6 files changed, 369 insertions(+), 6 deletions(-)
 create mode 100644 target/riscv/zce_helper.c

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a03014fe67..9250e01cb6 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1134,3 +1134,9 @@ DEF_HELPER_FLAGS_1(aes64im, TCG_CALL_NO_RWG_SE, tl, tl)
 
 DEF_HELPER_FLAGS_3(sm4ed, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
 DEF_HELPER_FLAGS_3(sm4ks, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+
+/* Zce helper */
+DEF_HELPER_4(cm_pop, tl, env, tl, tl, tl)
+DEF_HELPER_4(cm_push, void, env, tl, tl, tl)
+DEF_HELPER_4(cm_popret, tl, env, tl, tl, tl)
+DEF_HELPER_4(cm_popretz, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
index 7ad673692e..941146633d 100644
--- a/target/riscv/insn16.decode
+++ b/target/riscv/insn16.decode
@@ -21,6 +21,8 @@
 %rs1_3     7:3                !function=ex_rvc_register
 %rs2_3     2:3                !function=ex_rvc_register
 %rs2_5     2:5
+%sreg1     7:3                !function=ex_sreg_register
+%sreg2     2:3                !function=ex_sreg_register
 
 # Immediates:
 %imm_ci        12:s1 2:5
@@ -45,6 +47,8 @@
 
 %zcb_b_uimm  5:1 6:1
 %zcb_h_uimm  5:1                     !function=ex_shift_1
+%zcmp_spimm  2:2                     !function=ex_shift_4
+%zcmp_rlist  4:4
 
 # Argument sets imported from insn32.decode:
 &empty                  !extern
@@ -56,7 +60,9 @@
 &u         imm rd       !extern
 &shift     shamt rs1 rd !extern
 &r2        rd rs1       !extern
+&r2_s      rs1 rs2      !extern
 
+&zcmp      zcmp_rlist zcmp_spimm
 
 # Formats 16:
 @cr        ....  ..... .....  .. &r      rs2=%rs2_5       rs1=%rd     %rd
@@ -96,6 +102,8 @@
 @zcb_binary   ... ...  ... .. ... ..  &r  rs2=%rs2_3       rs1=%rs1_3 rd=%rs1_3
 @zcb_b        ... . .. ... .. ... ..  &i  imm=%zcb_b_uimm  rs1=%rs1_3 rd=%rs2_3
 @zcb_h        ... . .. ... .. ... ..  &i  imm=%zcb_h_uimm  rs1=%rs1_3 rd=%rs2_3
+@zcmp         ... ...  ........   ..  &zcmp  %zcmp_rlist   %zcmp_spimm
+@cm_mv        ... ...  ... .. ... ..  &r2_s  rs2=%sreg2    rs1=%sreg1
 
 # *** RV32/64C Standard Extension (Quadrant 0) ***
 {
@@ -105,12 +113,12 @@
 }
 {
   lq              001  ... ... .. ... 00 @cl_q
-  fld             001  ... ... .. ... 00 @cl_d
+  c_fld           001  ... ... .. ... 00 @cl_d
 }
 lw                010  ... ... .. ... 00 @cl_w
 {
   sq              101  ... ... .. ... 00 @cs_q
-  fsd             101  ... ... .. ... 00 @cs_d
+  c_fsd           101  ... ... .. ... 00 @cs_d
 }
 sw                110  ... ... .. ... 00 @cs_w
 
@@ -156,7 +164,7 @@ addw              100 1 11 ... 01 ... 01 @cs_2
 slli              000 .  .....  ..... 10 @c_shift2
 {
   lq              001  ... ... .. ... 10 @c_lqsp
-  fld             001 .  .....  ..... 10 @c_ldsp
+  c_fld           001 .  .....  ..... 10 @c_ldsp
 }
 {
   illegal         010 -  00000  ----- 10 # c.lwsp, RES rd=0
@@ -174,7 +182,15 @@ slli              000 .  .....  ..... 10 @c_shift2
 }
 {
   sq              101  ... ... .. ... 10 @c_sqsp
-  fsd             101   ......  ..... 10 @c_sdsp
+  c_fsd           101   ......  ..... 10 @c_sdsp
+
+  # *** RV64 and RV32 Zcmp Extension ***
+  cm_push         101  11000  .... .. 10 @zcmp
+  cm_pop          101  11010  .... .. 10 @zcmp
+  cm_popret       101  11110  .... .. 10 @zcmp
+  cm_popretz      101  11100  .... .. 10 @zcmp
+  cm_mva01s       101  011 ... 11 ... 10 @cm_mv
+  cm_mvsa01       101  011 ... 01 ... 10 @cm_mv
 }
 sw                110 .  .....  ..... 10 @c_swsp
 
diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/insn_trans/trans_rvzce.c.inc
index 0947190f2d..710e572cfe 100644
--- a/target/riscv/insn_trans/trans_rvzce.c.inc
+++ b/target/riscv/insn_trans/trans_rvzce.c.inc
@@ -21,6 +21,17 @@
         return false;           \
 } while (0)
 
+#define REQUIRE_C_OR_ZCD(ctx) do { \
+    if (!ctx->cfg_ptr->ext_zcd) {  \
+        REQUIRE_EXT(ctx, RVC);     \
+    } \
+} while (0)
+
+#define REQUIRE_ZCMP(ctx) do {   \
+    if (!ctx->cfg_ptr->ext_zcmp) \
+        return false;            \
+} while (0)
+
 static bool trans_c_zext_b(DisasContext *ctx, arg_c_zext_b *a)
 {
     REQUIRE_ZCB(ctx);
@@ -131,3 +142,115 @@ static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
     MemOp memop = MO_UW;
     return gen_zce_store(ctx, a, memop);
 }
+
+static bool trans_c_fld(DisasContext *ctx, arg_c_fld *a)
+{
+    REQUIRE_C_OR_ZCD(ctx);
+    return trans_fld(ctx, a);
+}
+
+static bool trans_c_fsd(DisasContext *ctx, arg_c_fsd *a)
+{
+    REQUIRE_C_OR_ZCD(ctx);
+    return trans_fsd(ctx, a);
+}
+
+static bool gen_zcmp_check(DisasContext *ctx, arg_zcmp *a)
+{
+    /* rlist 0 to 3 are reserved for a future EABI variant called cm.popret.e */
+    if (a->zcmp_rlist < 4) {
+        return false;
+    }
+
+    /* rlist <= 6 when RV32E/RV64E */
+    if (ctx->cfg_ptr->ext_e && a->zcmp_rlist > 6) {
+        return false;
+    }
+
+    return true;
+}
+
+static bool gen_pop(DisasContext *ctx, arg_zcmp *a, bool ret,
+                    void (*func)(TCGv, TCGv_env, TCGv, TCGv, TCGv))
+{
+    if (!gen_zcmp_check(ctx, a)) {
+        return false;
+    }
+
+    TCGv sp = get_gpr(ctx, xSP, EXT_NONE);
+    TCGv rlist = tcg_const_tl(a->zcmp_rlist);
+    TCGv spimm = tcg_const_tl(a->zcmp_spimm);
+
+    func(cpu_pc, cpu_env, sp, spimm, rlist);
+
+    if (ret) {
+        gen_set_pc(ctx, cpu_pc);
+        tcg_gen_lookup_and_goto_ptr();
+        ctx->base.is_jmp = DISAS_NORETURN;
+    }
+    tcg_temp_free(spimm);
+    tcg_temp_free(rlist);
+    return true;
+}
+
+static bool trans_cm_push(DisasContext *ctx, arg_cm_push *a)
+{
+    REQUIRE_ZCMP(ctx);
+
+    if (!gen_zcmp_check(ctx, a)) {
+        return false;
+    }
+
+    TCGv sp = get_gpr(ctx, xSP, EXT_NONE);
+    TCGv rlist = tcg_const_tl(a->zcmp_rlist);
+    TCGv spimm = tcg_const_tl(a->zcmp_spimm);
+    gen_helper_cm_push(cpu_env, sp, spimm, rlist);
+
+    tcg_temp_free(spimm);
+    tcg_temp_free(rlist);
+    return true;
+}
+
+static bool trans_cm_pop(DisasContext *ctx, arg_cm_pop *a)
+{
+    REQUIRE_ZCMP(ctx);
+    return gen_pop(ctx, a, false, gen_helper_cm_pop);
+}
+
+static bool trans_cm_popret(DisasContext *ctx, arg_cm_popret *a)
+{
+    REQUIRE_ZCMP(ctx);
+    return gen_pop(ctx, a, true, gen_helper_cm_popret);
+}
+
+static bool trans_cm_popretz(DisasContext *ctx, arg_cm_popret *a)
+{
+    REQUIRE_ZCMP(ctx);
+    return gen_pop(ctx, a, true, gen_helper_cm_popretz);
+}
+
+static bool trans_cm_mva01s(DisasContext *ctx, arg_cm_mva01s *a)
+{
+    REQUIRE_ZCMP(ctx);
+
+    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
+
+    gen_set_gpr(ctx, xA0, src1);
+    gen_set_gpr(ctx, xA1, src2);
+
+    return true;
+}
+
+static bool trans_cm_mvsa01(DisasContext *ctx, arg_cm_mvsa01 *a)
+{
+    REQUIRE_ZCMP(ctx);
+
+    TCGv a0 = get_gpr(ctx, xA0, EXT_NONE);
+    TCGv a1 = get_gpr(ctx, xA1, EXT_NONE);
+
+    gen_set_gpr(ctx, a->rs1, a0);
+    gen_set_gpr(ctx, a->rs2, a1);
+
+    return true;
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index ba25164d74..4bf9c9e632 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -18,7 +18,8 @@ riscv_ss.add(files(
   'bitmanip_helper.c',
   'translate.c',
   'm128_helper.c',
-  'crypto_helper.c'
+  'crypto_helper.c',
+  'zce_helper.c'
 ))
 riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c0b8aa340b..c4882db56b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -707,6 +707,11 @@ static int ex_rvc_register(DisasContext *ctx, int reg)
     return 8 + reg;
 }
 
+static int ex_sreg_register(DisasContext *ctx, int reg)
+{
+    return reg < 2 ? reg + 8 : reg + 16;
+}
+
 static int ex_rvc_shiftli(DisasContext *ctx, int imm)
 {
     /* For RV128 a shamt of 0 means a shift by 64. */
@@ -1071,6 +1076,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
          * compressed floating point loads and stores
          * Zcf(RV32 only) support c.flw, c.flwsp, c.fsw, c.fswsp
          * Zcd support c.fld, c.fldsp, c.fsd, c.fsdsp
+         * Zcm* reuse the encode of Zcd
          */
         if (!(has_ext(ctx, RVC) || ctx->cfg_ptr->ext_zca)) {
             gen_exception_illegal(ctx);
@@ -1081,7 +1087,8 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
              ((opcode & 0xe003) == 0xe000) ||
              ((opcode & 0xe003) == 0xe002))) {
             gen_exception_illegal(ctx);
-        } else if (!(has_ext(ctx, RVC) || ctx->cfg_ptr->ext_zcd) &&
+        } else if (!(has_ext(ctx, RVC) || ctx->cfg_ptr->ext_zcd ||
+                     ctx->cfg_ptr->ext_zcmp) &&
                    (((opcode & 0xe003) == 0x2000) ||
                     ((opcode & 0xe003) == 0x2002) ||
                     ((opcode & 0xe003) == 0xa000) ||
diff --git a/target/riscv/zce_helper.c b/target/riscv/zce_helper.c
new file mode 100644
index 0000000000..1346de1367
--- /dev/null
+++ b/target/riscv/zce_helper.c
@@ -0,0 +1,210 @@
+/*
+ * RISC-V Zc* extension Helpers for QEMU.
+ *
+ * Copyright (c) 2021-2022 PLCT Lab
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
+#include "exec/cpu_ldst.h"
+
+#define X_S0    8
+#define X_S1    9
+#define X_Sn    16
+#define X_RA    1
+#define X_A0    10
+#define X_S4_E  7
+#define X_S3_E  6
+#define X_S2_E  14
+
+static inline void update_push_pop_list(target_ulong rlist, bool *xreg_list)
+{
+    switch (rlist) {
+    case 15:
+        xreg_list[X_Sn + 11] = true;
+        xreg_list[X_Sn + 10] = true;
+        /* FALL THROUGH */
+    case 14:
+        xreg_list[X_Sn + 9] = true;
+        /* FALL THROUGH */
+    case 13:
+        xreg_list[X_Sn + 8] = true;
+        /* FALL THROUGH */
+    case 12:
+        xreg_list[X_Sn + 7] = true;
+        /* FALL THROUGH */
+    case 11:
+        xreg_list[X_Sn + 6] = true;
+        /* FALL THROUGH */
+    case 10:
+        xreg_list[X_Sn + 5] = true;
+        /* FALL THROUGH */
+    case 9:
+        xreg_list[X_Sn + 4] = true;
+        /* FALL THROUGH */
+    case 8:
+        xreg_list[X_Sn + 3] = true;
+        /* FALL THROUGH */
+    case 7:
+        xreg_list[X_Sn + 2] = true;
+        /* FALL THROUGH */
+    case 6:
+        xreg_list[X_S1] = true;
+        /* FALL THROUGH */
+    case 5:
+        xreg_list[X_S0] = true;
+        /* FALL THROUGH */
+    case 4:
+        xreg_list[X_RA] = true;
+        break;
+    }
+}
+
+static inline target_ulong caculate_stack_adj(int bytes, target_ulong rlist,
+                                              target_ulong spimm)
+{
+    target_ulong stack_adj_base = 0;
+    switch (rlist) {
+    case 15:
+        stack_adj_base = bytes == 4 ? 64 : 112;
+        break;
+    case 14:
+        stack_adj_base = bytes == 4 ? 48 : 96;
+        break;
+    case 13:
+    case 12:
+        stack_adj_base = bytes == 4 ? 48 : 80;
+        break;
+    case 11:
+    case 10:
+        stack_adj_base = bytes == 4 ? 32 : 64;
+        break;
+    case 9:
+    case 8:
+        stack_adj_base = bytes == 4 ? 32 : 48;
+        break;
+    case 7:
+    case 6:
+        stack_adj_base = bytes == 4 ? 16 : 32;
+        break;
+    case 5:
+    case 4:
+        stack_adj_base = 16;
+        break;
+    }
+
+    return stack_adj_base + spimm;
+}
+
+static inline target_ulong zcmp_pop(CPURISCVState *env, target_ulong sp,
+                                    target_ulong rlist, target_ulong spimm,
+                                    bool ret_val, bool ret)
+{
+    bool xreg_list[32] = {false};
+    target_ulong addr;
+    target_ulong stack_adj;
+    int bytes = riscv_cpu_xlen(env) == 32 ? 4 : 8;
+    int i;
+
+    update_push_pop_list(rlist, xreg_list);
+    stack_adj = caculate_stack_adj(bytes, rlist, spimm);
+    addr = sp + stack_adj - bytes;
+    for (i = 31; i >= 0; i--) {
+        if (xreg_list[i]) {
+            switch (bytes) {
+            case 4:
+                env->gpr[i] = cpu_ldl_le_data(env, addr);
+                break;
+            case 8:
+                env->gpr[i] = cpu_ldq_le_data(env, addr);
+                break;
+            default:
+                break;
+            }
+            addr -= bytes;
+        }
+    }
+
+    if (ret_val) {
+        env->gpr[xA0] = 0;
+    }
+
+    env->gpr[xSP] = sp + stack_adj;
+    if (ret) {
+        return env->gpr[xRA];
+    } else {
+        return env->pc;
+    }
+}
+
+static inline void zcmp_push(CPURISCVState *env, target_ulong sp,
+                             target_ulong rlist, target_ulong spimm)
+{
+    target_ulong addr = sp;
+    bool xreg_list[32] = {false};
+    target_ulong stack_adj;
+    int bytes = riscv_cpu_xlen(env) == 32 ? 4 : 8;
+    int i;
+
+    update_push_pop_list(rlist, xreg_list);
+    stack_adj = caculate_stack_adj(bytes, rlist, spimm);
+    addr -= bytes;
+    for (i = 31; i >= 0; i--) {
+        if (xreg_list[i]) {
+            switch (bytes) {
+            case 4:
+                cpu_stl_le_data(env, addr, env->gpr[i]);
+                break;
+            case 8:
+                cpu_stq_le_data(env, addr, env->gpr[i]);
+                break;
+            default:
+                break;
+            }
+            addr -= bytes;
+        }
+    }
+    env->gpr[xSP] = sp - stack_adj;
+}
+
+void HELPER(cm_push)(CPURISCVState *env, target_ulong sp, target_ulong spimm,
+                     target_ulong rlist)
+{
+    return zcmp_push(env, sp, rlist, spimm);
+}
+
+target_ulong HELPER(cm_pop)(CPURISCVState *env, target_ulong sp,
+                            target_ulong spimm, target_ulong rlist)
+{
+    return zcmp_pop(env, sp, rlist, spimm, false, false);
+}
+
+target_ulong HELPER(cm_popret)(CPURISCVState *env, target_ulong sp,
+                               target_ulong spimm, target_ulong rlist)
+{
+    return zcmp_pop(env, sp, rlist, spimm, false, true);
+}
+
+target_ulong HELPER(cm_popretz)(CPURISCVState *env, target_ulong sp,
+                                target_ulong spimm, target_ulong rlist)
+{
+    return zcmp_pop(env, sp, rlist, spimm, true, true);
+}
+#undef X_S0
+#undef X_Sn
+#undef ZCMP_POP
+#undef ZCMP_PUSH
-- 
2.25.1


