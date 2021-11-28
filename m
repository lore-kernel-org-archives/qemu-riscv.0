Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrKcp-00004z-Vv
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 08:53:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mrKcm-0008UH-RF; Sun, 28 Nov 2021 08:53:48 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:60552 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mrKcg-00046K-9r; Sun, 28 Nov 2021 08:53:45 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACXeBXaiaNhLKY9AA--.11553S4;
 Sun, 28 Nov 2021 21:53:33 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 liweiwei <liweiwei@iscas.ac.cn>
Subject: [RFC PATCH 2/3] target/riscv: add support for svinval extension
Date: Sun, 28 Nov 2021 21:52:54 +0800
Message-Id: <20211128135255.22089-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211128135255.22089-1-liweiwei@iscas.ac.cn>
References: <20211128135255.22089-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowACXeBXaiaNhLKY9AA--.11553S4
X-Coremail-Antispam: 1UD129KBjvJXoW3WryfKFykXF1rKw1fGFW7Arb_yoW7Gw4kpF
 48KFW7Gr4kJFyfAayftr45JFyUGrs3uayUG3s3Awn3Xa15GrWDJr1DKFW3KrZ8JFWDWr1j
 9F1jyr90yrW8XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
 0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjYiiDUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sun, 28 Nov 2021 13:53:49 -0000

Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu.c                          |  1 +
 target/riscv/cpu.h                          |  1 +
 target/riscv/insn32.decode                  |  7 ++
 target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
 target/riscv/translate.c                    |  1 +
 5 files changed, 85 insertions(+)
 create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f812998123..82529e1aa8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -641,6 +641,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
+    DEFINE_PROP_BOOL("x-svinval", RISCVCPU, cfg.ext_svinval, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0760c0af93..7596f3f323 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -312,6 +312,7 @@ struct RISCVCPU {
         bool ext_counters;
         bool ext_ifencei;
         bool ext_icsr;
+        bool ext_svinval;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2f251dac1b..1ed47425fb 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -726,3 +726,10 @@ binv       0110100 .......... 001 ..... 0110011 @r
 binvi      01101. ........... 001 ..... 0010011 @sh
 bset       0010100 .......... 001 ..... 0110011 @r
 bseti      00101. ........... 001 ..... 0010011 @sh
+
+# *** Svinval Standard Extension ***
+sinval_vma        0001011 ..... ..... 000 00000 1110011 @sfence_vma
+sfence_w_inval    0001100 00000 00000 000 00000 1110011
+sfence_inval_ir   0001100 00001 00000 000 00000 1110011
+hinval_vvma       0011011 ..... ..... 000 00000 1110011 @hfence_vvma
+hinval_gvma       0111011 ..... ..... 000 00000 1110011 @hfence_gvma
diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/insn_trans/trans_svinval.c.inc
new file mode 100644
index 0000000000..1dde665661
--- /dev/null
+++ b/target/riscv/insn_trans/trans_svinval.c.inc
@@ -0,0 +1,75 @@
+/*
+ * RISC-V translation routines for the Svinval Standard Instruction Set.
+ *
+ * Copyright (c) 2020-2021 PLCT lab
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
+#define REQUIRE_SVINVAL(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_svinval) {      \
+        return false;                                \
+    }                                                \
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
index 1d57bc97b5..1d45a5d103 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -575,6 +575,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 #include "insn_trans/trans_rvv.c.inc"
 #include "insn_trans/trans_rvb.c.inc"
 #include "insn_trans/trans_privileged.c.inc"
+#include "insn_trans/trans_svinval.c.inc"
 
 /* Include the auto-generated decoder for 16 bit insn */
 #include "decode-insn16.c.inc"
-- 
2.17.1


