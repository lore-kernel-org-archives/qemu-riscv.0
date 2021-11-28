Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrKcr-0000BI-MR
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 08:53:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mrKcn-0008Ut-VP; Sun, 28 Nov 2021 08:53:49 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:60542 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mrKci-00046G-8J; Sun, 28 Nov 2021 08:53:49 -0500
Received: from localhost.localdomain (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACXeBXaiaNhLKY9AA--.11553S3;
 Sun, 28 Nov 2021 21:53:32 +0800 (CST)
From: liweiwei <liweiwei@iscas.ac.cn>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 liweiwei <liweiwei@iscas.ac.cn>
Subject: [RFC PATCH 1/3] target/riscv: add support for svnapot extension
Date: Sun, 28 Nov 2021 21:52:53 +0800
Message-Id: <20211128135255.22089-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211128135255.22089-1-liweiwei@iscas.ac.cn>
References: <20211128135255.22089-1-liweiwei@iscas.ac.cn>
X-CM-TRANSID: zQCowACXeBXaiaNhLKY9AA--.11553S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAF48GF4fXry8tr1DCry5XFb_yoW5Wr17pr
 93CrsFkrWkJFWfXa1ftr18J3W5GrnIkrnY9a18Gr4akw45XrWfu3WDC3ySqF45JF48Xw1Y
 93WDZF1YyF4UXF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
 0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbec_DUUUUU==
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
X-List-Received-Date: Sun, 28 Nov 2021 13:53:50 -0000

Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 9913fa9f77..70391424b0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -473,6 +473,7 @@ typedef enum {
 #define PTE_A               0x040 /* Accessed */
 #define PTE_D               0x080 /* Dirty */
 #define PTE_SOFT            0x300 /* Reserved for Software */
+#define PTE_N               0x8000000000000000
 
 /* Page table PPN shift amount */
 #define PTE_PPN_SHIFT       10
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9eeed38c7e..e68db3e119 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -588,7 +588,7 @@ restart:
             return TRANSLATE_FAIL;
         }
 
-        hwaddr ppn = pte >> PTE_PPN_SHIFT;
+        hwaddr ppn = (pte & ~(target_ulong)PTE_N) >> PTE_PPN_SHIFT;
 
         if (!(pte & PTE_V)) {
             /* Invalid PTE */
@@ -668,8 +668,17 @@ restart:
             /* for superpage mappings, make a fake leaf PTE for the TLB's
                benefit. */
             target_ulong vpn = addr >> PGSHIFT;
-            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
-                        (addr & ~TARGET_PAGE_MASK);
+
+            int napot_bits = ((pte & PTE_N) ? (ctzl(ppn) + 1) : 0);
+            if (((pte & PTE_N) && ((ppn == 0) || (i != (levels - 1)))) ||
+                (napot_bits != 0 && napot_bits != 4)) {
+                return TRANSLATE_FAIL;
+            }
+
+            *physical = (((ppn & ~(((target_ulong)1 << napot_bits) - 1)) |
+                          (vpn & (((target_ulong)1 << napot_bits) - 1)) |
+                          (vpn & (((target_ulong)1 << ptshift) - 1))
+                        ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
 
             /* set permissions on the TLB entry */
             if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
@@ -856,7 +865,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         ret = get_physical_address(env, &pa, &prot, address,
                                    &env->guest_phys_fault_addr, access_type,
                                    mmu_idx, true, true, false);
-
         /*
          * A G-stage exception may be triggered during two state lookup.
          * And the env->guest_phys_fault_addr has already been set in
@@ -879,7 +887,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             ret = get_physical_address(env, &pa, &prot2, im_address, NULL,
                                        access_type, mmu_idx, false, true,
                                        false);
-
             qemu_log_mask(CPU_LOG_MMU,
                     "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
                     TARGET_FMT_plx " prot %d\n",
@@ -914,7 +921,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-
         qemu_log_mask(CPU_LOG_MMU,
                       "%s address=%" VADDR_PRIx " ret %d physical "
                       TARGET_FMT_plx " prot %d\n",
-- 
2.17.1


