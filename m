Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1my3nB-0001HX-Ol
	for mharc-qemu-riscv@gnu.org; Thu, 16 Dec 2021 22:20:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1my3n8-0001EO-CD; Thu, 16 Dec 2021 22:20:19 -0500
Received: from out28-53.mail.aliyun.com ([115.124.28.53]:36065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1my3n4-0001u5-NY; Thu, 16 Dec 2021 22:20:18 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436284|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00447079-8.70868e-05-0.995442;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.MGwx4CF_1639711203; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MGwx4CF_1639711203)
 by smtp.aliyun-inc.com(10.147.41.120);
 Fri, 17 Dec 2021 11:20:04 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v4 1/1] target/riscv: Fix PMP propagation for tlb
Date: Fri, 17 Dec 2021 11:20:00 +0800
Message-Id: <20211217032000.235214-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.53; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-53.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 17 Dec 2021 03:20:19 -0000

Only the pmp index that be checked by pmp_hart_has_privs can be used
by pmp_get_tlb_size to avoid an error pmp index.

Before modification, we may use an error pmp index. For example,
we check address 0x4fc, and the size 0x4 in pmp_hart_has_privs. If there
is an pmp rule, valid range is [0x4fc, 0x500), then pmp_hart_has_privs
will return true;

However, this checked pmp index is discarded as pmp_hart_has_privs
return bool value. In pmp_is_range_in_tlb, it will traverse all pmp
rules. The tlb_sa will be 0x0, and tlb_ea will be 0x4fff. If there is
a pmp rule [0x10, 0x14). It will be misused as it is legal in
pmp_get_tlb_size.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu_helper.c | 16 ++++++-----
 target/riscv/pmp.c        | 58 +++++++++++++++------------------------
 target/riscv/pmp.h        |  6 ++--
 3 files changed, 34 insertions(+), 46 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9eeed38c7e..4239bd2ca5 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -362,24 +362,26 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
                                     int mode)
 {
     pmp_priv_t pmp_priv;
-    target_ulong tlb_size_pmp = 0;
+    int pmp_index = -1;
 
     if (!riscv_feature(env, RISCV_FEATURE_PMP)) {
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
     }
 
-    if (!pmp_hart_has_privs(env, addr, size, 1 << access_type, &pmp_priv,
-                            mode)) {
+    pmp_index = pmp_hart_has_privs(env, addr, size, 1 << access_type,
+                                   &pmp_priv, mode);
+    if (pmp_index < 0) {
         *prot = 0;
         return TRANSLATE_PMP_FAIL;
     }
 
     *prot = pmp_priv_to_page_prot(pmp_priv);
-    if (tlb_size != NULL) {
-        if (pmp_is_range_in_tlb(env, addr & ~(*tlb_size - 1), &tlb_size_pmp)) {
-            *tlb_size = tlb_size_pmp;
-        }
+    if ((tlb_size != NULL) && pmp_index != MAX_RISCV_PMPS) {
+        target_ulong tlb_sa = addr & ~(*tlb_size - 1);
+        target_ulong tlb_ea = tlb_sa + *tlb_size - 1;
+
+        *tlb_size = pmp_get_tlb_size(env, pmp_index, tlb_sa, tlb_ea);
     }
 
     return TRANSLATE_SUCCESS;
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 54abf42583..d5b6d36259 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -297,8 +297,11 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
 
 /*
  * Check if the address has required RWX privs to complete desired operation
+ * Return PMP rule index if a pmp rule match
+ * Return MAX_RISCV_PMPS if default match
+ * Return negtive value if no match
  */
-bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
+int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
     target_ulong mode)
 {
@@ -310,8 +313,10 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
 
     /* Short cut if no rules */
     if (0 == pmp_get_num_rules(env)) {
-        return pmp_hart_has_privs_default(env, addr, size, privs,
-                                          allowed_privs, mode);
+        if (pmp_hart_has_privs_default(env, addr, size, privs,
+                                       allowed_privs, mode)) {
+            ret = MAX_RISCV_PMPS;
+        }
     }
 
     if (size == 0) {
@@ -338,7 +343,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
         if ((s + e) == 1) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "pmp violation - access is partially inside\n");
-            ret = 0;
+            ret = -1;
             break;
         }
 
@@ -441,18 +446,22 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
                 }
             }
 
-            ret = ((privs & *allowed_privs) == privs);
+            if ((privs & *allowed_privs) == privs) {
+                ret = i;
+            }
             break;
         }
     }
 
     /* No rule matched */
     if (ret == -1) {
-        return pmp_hart_has_privs_default(env, addr, size, privs,
-                                          allowed_privs, mode);
+        if (pmp_hart_has_privs_default(env, addr, size, privs,
+                                       allowed_privs, mode)) {
+            ret = MAX_RISCV_PMPS;
+        }
     }
 
-    return ret == 1 ? true : false;
+    return ret;
 }
 
 /*
@@ -595,8 +604,8 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
  * Calculate the TLB size if the start address or the end address of
  * PMP entry is presented in the TLB page.
  */
-static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
-                                     target_ulong tlb_sa, target_ulong tlb_ea)
+target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
+                              target_ulong tlb_sa, target_ulong tlb_ea)
 {
     target_ulong pmp_sa = env->pmp_state.addr[pmp_index].sa;
     target_ulong pmp_ea = env->pmp_state.addr[pmp_index].ea;
@@ -613,34 +622,11 @@ static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
         return pmp_ea - tlb_sa + 1;
     }
 
-    return 0;
-}
-
-/*
- * Check is there a PMP entry which range covers this page. If so,
- * try to find the minimum granularity for the TLB size.
- */
-bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
-                         target_ulong *tlb_size)
-{
-    int i;
-    target_ulong val;
-    target_ulong tlb_ea = (tlb_sa + TARGET_PAGE_SIZE - 1);
-
-    for (i = 0; i < MAX_RISCV_PMPS; i++) {
-        val = pmp_get_tlb_size(env, i, tlb_sa, tlb_ea);
-        if (val) {
-            if (*tlb_size == 0 || *tlb_size > val) {
-                *tlb_size = val;
-            }
-        }
-    }
-
-    if (*tlb_size != 0) {
-        return true;
+    if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
+        return tlb_ea - tlb_sa + 1;
     }
 
-    return false;
+    return 0;
 }
 
 /*
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index a9a0b363a7..94c0b960fb 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -68,11 +68,11 @@ target_ulong mseccfg_csr_read(CPURISCVState *env);
 void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
     target_ulong val);
 target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
-bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
+int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
     target_ulong mode);
-bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
-                         target_ulong *tlb_size);
+target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
+                              target_ulong tlb_sa, target_ulong tlb_ea);
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
 void pmp_update_rule_nums(CPURISCVState *env);
 uint32_t pmp_get_num_rules(CPURISCVState *env);
-- 
2.25.1


