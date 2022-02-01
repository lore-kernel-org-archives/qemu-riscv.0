Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nEuhP-0004GD-E5
	for mharc-qemu-riscv@gnu.org; Tue, 01 Feb 2022 10:04:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nEuhN-0004Ad-0f; Tue, 01 Feb 2022 10:04:01 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:41272 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nEuhG-00060M-H9; Tue, 01 Feb 2022 10:04:00 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAC3v5uxQvlhjpc3AA--.47720S3;
 Tue, 01 Feb 2022 22:24:52 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: anup@brainfault.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ren_guo@c-sky.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v8 1/5] target/riscv: Ignore reserved bits in PTE for RV64
Date: Tue,  1 Feb 2022 22:24:11 +0800
Message-Id: <20220201142415.29980-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220201142415.29980-1-liweiwei@iscas.ac.cn>
References: <20220201142415.29980-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: rQCowAC3v5uxQvlhjpc3AA--.47720S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAF48uFWktw1rZF4Dtr1UZFb_yoW5AFykpr
 Z7Ga43ArWDXFZxAayfKF15Jwn8Gws29w4F9ws7Crnrta1rJrZ5W3Wqk3W0vFnrXF18WF1Y
 9F1qkF4UAFsrZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBmb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
 8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
 64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcV
 CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIE
 c7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
 02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
 4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
 8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcy8BUUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 01 Feb 2022 15:04:01 -0000

From: Guo Ren <ren_guo@c-sky.com>

Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
need to ignore them. They cannot be a part of ppn.

1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
   4.4 Sv39: Page-Based 39-bit Virtual-Memory System
   4.5 Sv48: Page-Based 48-bit Virtual-Memory System

2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
Cc: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 15 +++++++++++++++
 target/riscv/cpu_bits.h   |  3 +++
 target/riscv/cpu_helper.c | 13 ++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index aacc997d56..8e7c33c9cb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -324,6 +324,8 @@ struct RISCVCPUConfig {
     bool ext_counters;
     bool ext_ifencei;
     bool ext_icsr;
+    bool ext_svnapot;
+    bool ext_svpbmt;
     bool ext_zfh;
     bool ext_zfhmin;
     bool ext_zve32f;
@@ -502,6 +504,19 @@ static inline int riscv_cpu_xlen(CPURISCVState *env)
     return 16 << env->xl;
 }
 
+#ifdef TARGET_RISCV32
+#define riscv_cpu_sxl(env)  ((void)(env), MXL_RV32)
+#else
+static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
+{
+#ifdef CONFIG_USER_ONLY
+    return env->misa_mxl;
+#else
+    return get_field(env->mstatus, MSTATUS64_SXL);
+#endif
+}
+#endif
+
 /*
  * Encode LMUL to lmul as follows:
  *     LMUL    vlmul    lmul
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7c87433645..6ea3944423 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -493,6 +493,9 @@ typedef enum {
 /* Page table PPN shift amount */
 #define PTE_PPN_SHIFT       10
 
+/* Page table PPN mask */
+#define PTE_PPN_MASK        0x3FFFFFFFFFFC00ULL
+
 /* Leaf page shift amount */
 #define PGSHIFT             12
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 327a2c4f1d..de07aee301 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -454,6 +454,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
     bool use_background = false;
+    hwaddr ppn;
+    RISCVCPU *cpu = env_archcpu(env);
 
     /*
      * Check if we should use the background registers for the two
@@ -622,7 +624,16 @@ restart:
             return TRANSLATE_FAIL;
         }
 
-        hwaddr ppn = pte >> PTE_PPN_SHIFT;
+        if (riscv_cpu_sxl(env) == MXL_RV32) {
+            ppn = pte >> PTE_PPN_SHIFT;
+        } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
+            ppn = (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
+        } else {
+            ppn = pte >> PTE_PPN_SHIFT;
+            if ((pte & ~(target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT) {
+                return TRANSLATE_FAIL;
+            }
+        }
 
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
-- 
2.17.1


