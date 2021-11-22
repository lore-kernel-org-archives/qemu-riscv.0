Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mp78L-0006Av-C8
	for mharc-qemu-riscv@gnu.org; Mon, 22 Nov 2021 06:05:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mp78J-00064Y-7V; Mon, 22 Nov 2021 06:05:11 -0500
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:40939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mp78C-0001pl-N5; Mon, 22 Nov 2021 06:05:10 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08316097|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00660279-0.000138998-0.993258;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LxACFQY_1637579085; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LxACFQY_1637579085)
 by smtp.aliyun-inc.com(10.147.41.187);
 Mon, 22 Nov 2021 19:04:45 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 4/5] target/riscv: Rename pmp_is_range_in_tlb
Date: Mon, 22 Nov 2021 19:02:29 +0800
Message-Id: <20211122110230.38783-5-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122110230.38783-1-zhiwei_liu@c-sky.com>
References: <20211122110230.38783-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.195; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-195.mail.aliyun.com
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
X-List-Received-Date: Mon, 22 Nov 2021 11:05:11 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/pmp.c        | 2 +-
 target/riscv/pmp.h        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 3f53744897..cf8109197d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -376,7 +376,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
 
     *prot = pmp_priv_to_page_prot(pmp_priv);
     if (tlb_size != NULL) {
-        pmp_is_range_in_tlb(env, addr & ~(*tlb_size - 1), tlb_size);
+        pmp_adjust_tlb_size(env, addr & ~(*tlb_size - 1), tlb_size);
     }
 
     return TRANSLATE_SUCCESS;
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 4850a9cc5d..19baf87384 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -620,7 +620,7 @@ static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
  * Check is there a PMP entry which range covers this page. If so,
  * try to find the minimum granularity for the TLB size.
  */
-void pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
+void pmp_adjust_tlb_size(CPURISCVState *env, hwaddr tlb_sa,
                          target_ulong *tlb_size)
 {
     int i;
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index 69395472f9..600ac65d08 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -71,7 +71,7 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
 bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
     target_ulong mode);
-void pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
+void pmp_adjust_tlb_size(CPURISCVState *env, hwaddr tlb_sa,
                          target_ulong *tlb_size);
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
 void pmp_update_rule_nums(CPURISCVState *env);
-- 
2.25.1


