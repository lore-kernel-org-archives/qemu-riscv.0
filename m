Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psPDM-00026G-AW
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 10:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psPDI-00022o-4k; Fri, 28 Apr 2023 10:36:44 -0400
Received: from [159.226.251.80] (helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psPDF-0008Ac-AJ; Fri, 28 Apr 2023 10:36:43 -0400
Received: from localhost.localdomain (unknown [61.165.33.195])
 by APP-01 (Coremail) with SMTP id qwCowACHj3vq2UtkrB5ZDA--.57839S6;
 Fri, 28 Apr 2023 22:36:30 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v5 04/13] target/riscv: Change the return type of
 pmp_hart_has_privs() to bool
Date: Fri, 28 Apr 2023 22:36:12 +0800
Message-Id: <20230428143621.142390-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
References: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHj3vq2UtkrB5ZDA--.57839S6
X-Coremail-Antispam: 1UD129KBjvJXoWxuF1UtFyDWr4DtFWDGF1kGrg_yoWrWF13pr
 WrCryxGrZ5trWDX3WfAa1jyFyUAas3Kryj9an7JrWI9a13C3yrCF1DKw42kF1DJas8urZ0
 kFWDCF15Ar4UZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCY02Avz4vE14v_Xryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
 Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
 CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
 I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
 C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
 nUUI43ZEXa7VUbfOz3UUUUU==
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
X-Host-Lookup-Failed: Reverse DNS lookup failed for 159.226.251.80 (deferred)
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 28 Apr 2023 14:36:44 -0000

We no longer need the pmp_index for matched PMP entry now.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu_helper.c |  8 ++++----
 target/riscv/pmp.c        | 32 +++++++++++++-------------------
 target/riscv/pmp.h        |  8 ++++----
 3 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 83c9699a6d..1868766082 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -685,16 +685,16 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot, hwaddr addr,
                                     int mode)
 {
     pmp_priv_t pmp_priv;
-    int pmp_index = -1;
+    bool pmp_has_privs;
 
     if (!riscv_cpu_cfg(env)->pmp) {
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
     }
 
-    pmp_index = pmp_hart_has_privs(env, addr, size, 1 << access_type,
-                                   &pmp_priv, mode);
-    if (pmp_index < 0) {
+    pmp_has_privs = pmp_hart_has_privs(env, addr, size, 1 << access_type,
+                                       &pmp_priv, mode);
+    if (!pmp_has_privs) {
         *prot = 0;
         return TRANSLATE_PMP_FAIL;
     }
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 86abe1e7cd..b5808538aa 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -296,27 +296,23 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
 
 /*
  * Check if the address has required RWX privs to complete desired operation
- * Return PMP rule index if a pmp rule match
- * Return MAX_RISCV_PMPS if default match
- * Return negtive value if no match
+ * Return true if a pmp rule match or default match
+ * Return false if no match
  */
-int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
-                       target_ulong size, pmp_priv_t privs,
-                       pmp_priv_t *allowed_privs, target_ulong mode)
+bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
+                        target_ulong size, pmp_priv_t privs,
+                        pmp_priv_t *allowed_privs, target_ulong mode)
 {
     int i = 0;
-    int ret = -1;
+    bool ret = false;
     int pmp_size = 0;
     target_ulong s = 0;
     target_ulong e = 0;
 
     /* Short cut if no rules */
     if (0 == pmp_get_num_rules(env)) {
-        if (pmp_hart_has_privs_default(env, addr, size, privs,
-                                       allowed_privs, mode)) {
-            ret = MAX_RISCV_PMPS;
-        }
-        return ret;
+        return pmp_hart_has_privs_default(env, addr, size, privs,
+                                          allowed_privs, mode);
     }
 
     if (size == 0) {
@@ -345,7 +341,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
         if ((s + e) == 1) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "pmp violation - access is partially inside\n");
-            ret = -1;
+            ret = false;
             break;
         }
 
@@ -453,17 +449,15 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
              * defined with PMP must be used. We shouldn't fallback on
              * finding default privileges.
              */
-            ret = i;
+            ret = true;
             break;
         }
     }
 
     /* No rule matched */
-    if (ret == -1) {
-        if (pmp_hart_has_privs_default(env, addr, size, privs,
-                                       allowed_privs, mode)) {
-            ret = MAX_RISCV_PMPS;
-        }
+    if (!ret) {
+        ret = pmp_hart_has_privs_default(env, addr, size, privs,
+                                         allowed_privs, mode);
     }
 
     return ret;
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index 0a7e24750b..cf5c99f8e6 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -72,10 +72,10 @@ target_ulong mseccfg_csr_read(CPURISCVState *env);
 void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
                        target_ulong val);
 target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
-int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
-                       target_ulong size, pmp_priv_t privs,
-                       pmp_priv_t *allowed_privs,
-                       target_ulong mode);
+bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
+                        target_ulong size, pmp_priv_t privs,
+                        pmp_priv_t *allowed_privs,
+                        target_ulong mode);
 target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr);
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
 void pmp_update_rule_nums(CPURISCVState *env);
-- 
2.25.1


