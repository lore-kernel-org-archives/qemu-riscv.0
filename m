Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mp78g-0006Vp-NR
	for mharc-qemu-riscv@gnu.org; Mon, 22 Nov 2021 06:05:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mp78b-0006SI-Bq; Mon, 22 Nov 2021 06:05:29 -0500
Received: from out28-77.mail.aliyun.com ([115.124.28.77]:40192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mp78Y-0001w7-8E; Mon, 22 Nov 2021 06:05:29 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0798699|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00517054-0.000148883-0.994681;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LxAOnUR_1637579115; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LxAOnUR_1637579115)
 by smtp.aliyun-inc.com(10.147.42.135);
 Mon, 22 Nov 2021 19:05:15 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 5/5] target/riscv: Modify return and parameter type for
 pmp_adjust_tlb_size
Date: Mon, 22 Nov 2021 19:02:30 +0800
Message-Id: <20211122110230.38783-6-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122110230.38783-1-zhiwei_liu@c-sky.com>
References: <20211122110230.38783-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.77; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-77.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 22 Nov 2021 11:05:31 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu_helper.c |  3 ++-
 target/riscv/pmp.c        | 13 +++++++------
 target/riscv/pmp.h        |  4 ++--
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index cf8109197d..45e29e6c01 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -376,7 +376,8 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
 
     *prot = pmp_priv_to_page_prot(pmp_priv);
     if (tlb_size != NULL) {
-        pmp_adjust_tlb_size(env, addr & ~(*tlb_size - 1), tlb_size);
+        *tlb_size = pmp_adjust_tlb_size(env, addr & ~(*tlb_size - 1),
+                                        *tlb_size);
     }
 
     return TRANSLATE_SUCCESS;
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 19baf87384..726974c97c 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -620,25 +620,26 @@ static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
  * Check is there a PMP entry which range covers this page. If so,
  * try to find the minimum granularity for the TLB size.
  */
-void pmp_adjust_tlb_size(CPURISCVState *env, hwaddr tlb_sa,
-                         target_ulong *tlb_size)
+target_ulong pmp_adjust_tlb_size(CPURISCVState *env, hwaddr tlb_sa,
+                                 target_ulong tlb_size)
 {
     int i;
     target_ulong val;
-    target_ulong tlb_ea = (tlb_sa + *tlb_size - 1);
+    target_ulong tlb_ea = (tlb_sa + tlb_size - 1);
 
     if (pmp_get_num_rules(env) == 0) {
-        return;
+        return tlb_size;
     }
 
     for (i = 0; i < MAX_RISCV_PMPS; i++) {
         val = pmp_get_tlb_size(env, i, tlb_sa, tlb_ea);
         if (val) {
-            if (*tlb_size > val) {
-                *tlb_size = val;
+            if (tlb_size > val) {
+                tlb_size = val;
             }
         }
     }
+    return tlb_size;
 }
 
 /*
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index 600ac65d08..c110fb796b 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -71,8 +71,8 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
 bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
     target_ulong mode);
-void pmp_adjust_tlb_size(CPURISCVState *env, hwaddr tlb_sa,
-                         target_ulong *tlb_size);
+target_ulong pmp_adjust_tlb_size(CPURISCVState *env, hwaddr tlb_sa,
+                                 target_ulong tlb_size);
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
 void pmp_update_rule_nums(CPURISCVState *env);
 uint32_t pmp_get_num_rules(CPURISCVState *env);
-- 
2.25.1


