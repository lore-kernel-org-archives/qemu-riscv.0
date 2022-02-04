Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nFoK4-00056K-8h
	for mharc-qemu-riscv@gnu.org; Thu, 03 Feb 2022 21:27:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nFoK2-0004z7-0N; Thu, 03 Feb 2022 21:27:38 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:46038 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nFoJw-0002xJ-LW; Thu, 03 Feb 2022 21:27:37 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAAnYEIJj_xhcHpaAA--.48511S6;
 Fri, 04 Feb 2022 10:27:26 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: anup@brainfault.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ren_guo@c-sky.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v9 4/5] target/riscv: add support for svinval extension
Date: Fri,  4 Feb 2022 10:26:57 +0800
Message-Id: <20220204022658.18097-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220204022658.18097-1-liweiwei@iscas.ac.cn>
References: <20220204022658.18097-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowAAnYEIJj_xhcHpaAA--.48511S6
X-Coremail-Antispam: 1UD129KBjvJXoW3XrykAF4rJr15Gr4xCr1fXrb_yoW7Ary3pF
 45KFW7Cr4kJryfAa4ftr45JFyUGrs3CayUG3saywn5Xa15GrWDJr1DKrW7KrZ8JF4kWr1j
 9F4qyryYyrW0qaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
 6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
 8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQ
 SdkUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Fri, 04 Feb 2022 02:27:38 -0000

- sinval.vma, hinval.vvma and hinval.gvma do the same as sfence.vma, hfence.vvma and hfence.gvma except extension check
- do nothing other than extension check for sfence.w.inval and sfence.inval.ir

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c                          |  1 +
 target/riscv/cpu.h                          |  1 +
 target/riscv/insn32.decode                  |  7 ++
 target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
 target/riscv/translate.c                    |  1 +
 5 files changed, 85 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cfaccdfc72..4442c4b81d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -729,6 +729,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
+    DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
 
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8e7c33c9cb..5622478eb5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -324,6 +324,7 @@ struct RISCVCPUConfig {
     bool ext_counters;
     bool ext_ifencei;
     bool ext_icsr;
+    bool ext_svinval;
     bool ext_svnapot;
     bool ext_svpbmt;
     bool ext_zfh;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 5bbedc254c..1d3ff1efe1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -809,3 +809,10 @@ fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
 fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
+
+# *** Svinval Standard Extension ***
+sinval_vma        0001011 ..... ..... 000 00000 1110011 @sfence_vma
+sfence_w_inval    0001100 00000 00000 000 00000 1110011
+sfence_inval_ir   0001100 00001 00000 000 00000 1110011
+hinval_vvma       0010011 ..... ..... 000 00000 1110011 @hfence_vvma
+hinval_gvma       0110011 ..... ..... 000 00000 1110011 @hfence_gvma
diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/insn_trans/trans_svinval.c.inc
new file mode 100644
index 0000000000..2682bd969f
--- /dev/null
+++ b/target/riscv/insn_trans/trans_svinval.c.inc
@@ -0,0 +1,75 @@
+/*
+ * RISC-V translation routines for the Svinval Standard Instruction Set.
+ *
+ * Copyright (c) 2020-2022 PLCT lab
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
+#define REQUIRE_SVINVAL(ctx) do {          \
+    if (!ctx->cfg_ptr->ext_svinval) {      \
+        return false;                      \
+    }                                      \
+} while (0)
+
+static bool trans_sinval_vma(DisasContext *ctx, arg_sinval_vma *a)
+{
+    REQUIRE_SVINVAL(ctx);
+    /* Do the same as sfence.vma currently */
+    REQUIRE_EXT(ctx, RVS);
+#ifndef CONFIG_USER_ONLY
+    gen_helper_tlb_flush(cpu_env);
+    return true;
+#endif
+    return false;
+}
+
+static bool trans_sfence_w_inval(DisasContext *ctx, arg_sfence_w_inval *a)
+{
+    REQUIRE_SVINVAL(ctx);
+    REQUIRE_EXT(ctx, RVS);
+    /* Do nothing currently */
+    return true;
+}
+
+static bool trans_sfence_inval_ir(DisasContext *ctx, arg_sfence_inval_ir *a)
+{
+    REQUIRE_SVINVAL(ctx);
+    REQUIRE_EXT(ctx, RVS);
+    /* Do nothing currently */
+    return true;
+}
+
+static bool trans_hinval_vvma(DisasContext *ctx, arg_hinval_vvma *a)
+{
+    REQUIRE_SVINVAL(ctx);
+    /* Do the same as hfence.vvma currently */
+    REQUIRE_EXT(ctx, RVH);
+#ifndef CONFIG_USER_ONLY
+    gen_helper_hyp_tlb_flush(cpu_env);
+    return true;
+#endif
+    return false;
+}
+
+static bool trans_hinval_gvma(DisasContext *ctx, arg_hinval_gvma *a)
+{
+    REQUIRE_SVINVAL(ctx);
+    /* Do the same as hfence.gvma currently */
+    REQUIRE_EXT(ctx, RVH);
+#ifndef CONFIG_USER_ONLY
+    gen_helper_hyp_gvma_tlb_flush(cpu_env);
+    return true;
+#endif
+    return false;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index eaf5a72c81..84dbfa6340 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -862,6 +862,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_rvzfh.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
+#include "insn_trans/trans_svinval.c.inc"
 #include "insn_trans/trans_xventanacondops.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
-- 
2.17.1


