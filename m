Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poyU2-0007QW-3M
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 23:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1poyTx-0007NG-7P; Tue, 18 Apr 2023 23:27:45 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1poyTt-00011D-7I; Tue, 18 Apr 2023 23:27:44 -0400
Received: from localhost.localdomain (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowACnrxegXz9kyEroFA--.60284S4;
 Wed, 19 Apr 2023 11:27:31 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 2/7] target/riscv: Move pmp_get_tlb_size apart from
 get_physical_address_pmp
Date: Wed, 19 Apr 2023 11:27:20 +0800
Message-Id: <20230419032725.29721-3-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
References: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnrxegXz9kyEroFA--.60284S4
X-Coremail-Antispam: 1UD129KBjvJXoWxAF48KFWkJw18uF1DGr1Dtrb_yoWrJrW7pr
 W5CrWIgw4kKa93Ka17Zr1UAF45AFnrKrWUua48GwsY9an0q3yrCF1qk34agFs3GFWkZws0
 kr4DCF1FkF45Xr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
 owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHbyAU
 UUUU=
X-Originating-IP: [180.165.241.15]
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
X-List-Received-Date: Wed, 19 Apr 2023 03:27:45 -0000

pmp_get_tlb_size can be separated from get_physical_address_pmp and is only
needed when ret == TRANSLATE_SUCCESS.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu_helper.c | 21 +++++++--------------
 target/riscv/pmp.c        |  4 ++++
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 075fc0538a..ea08ca9fbb 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -676,14 +676,11 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
  *
  * @env: CPURISCVState
  * @prot: The returned protection attributes
- * @tlb_size: TLB page size containing addr. It could be modified after PMP
- *            permission checking. NULL if not set TLB page for addr.
  * @addr: The physical address to be checked permission
  * @access_type: The type of MMU access
  * @mode: Indicates current privilege level.
  */
-static int get_physical_address_pmp(CPURISCVState *env, int *prot,
-                                    target_ulong *tlb_size, hwaddr addr,
+static int get_physical_address_pmp(CPURISCVState *env, int *prot, hwaddr addr,
                                     int size, MMUAccessType access_type,
                                     int mode)
 {
@@ -703,9 +700,6 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
     }
 
     *prot = pmp_priv_to_page_prot(pmp_priv);
-    if (tlb_size != NULL) {
-        *tlb_size = pmp_get_tlb_size(env, addr);
-    }
 
     return TRANSLATE_SUCCESS;
 }
@@ -905,7 +899,7 @@ restart:
         }
 
         int pmp_prot;
-        int pmp_ret = get_physical_address_pmp(env, &pmp_prot, NULL, pte_addr,
+        int pmp_ret = get_physical_address_pmp(env, &pmp_prot, pte_addr,
                                                sizeof(target_ulong),
                                                MMU_DATA_LOAD, PRV_S);
         if (pmp_ret != TRANSLATE_SUCCESS) {
@@ -1300,13 +1294,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             prot &= prot2;
 
             if (ret == TRANSLATE_SUCCESS) {
-                ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
+                ret = get_physical_address_pmp(env, &prot_pmp, pa,
                                                size, access_type, mode);
 
                 qemu_log_mask(CPU_LOG_MMU,
                               "%s PMP address=" HWADDR_FMT_plx " ret %d prot"
-                              " %d tlb_size " TARGET_FMT_lu "\n",
-                              __func__, pa, ret, prot_pmp, tlb_size);
+                              " %d\n", __func__, pa, ret, prot_pmp);
 
                 prot &= prot_pmp;
             }
@@ -1333,13 +1326,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       __func__, address, ret, pa, prot);
 
         if (ret == TRANSLATE_SUCCESS) {
-            ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
+            ret = get_physical_address_pmp(env, &prot_pmp, pa,
                                            size, access_type, mode);
 
             qemu_log_mask(CPU_LOG_MMU,
                           "%s PMP address=" HWADDR_FMT_plx " ret %d prot"
-                          " %d tlb_size " TARGET_FMT_lu "\n",
-                          __func__, pa, ret, prot_pmp, tlb_size);
+                          " %d\n", __func__, pa, ret, prot_pmp);
 
             prot &= prot_pmp;
         }
@@ -1350,6 +1342,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 
     if (ret == TRANSLATE_SUCCESS) {
+        tlb_size = pmp_get_tlb_size(env, pa);
         tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
                      prot, mmu_idx, tlb_size);
         return true;
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 22f3b3f217..d1ef9457ea 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -612,6 +612,10 @@ target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr)
     target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
     int i;
 
+    if (!riscv_cpu_cfg(env)->pmp || !pmp_get_num_rules(env)) {
+        return TARGET_PAGE_SIZE;
+    }
+
     for (i = 0; i < MAX_RISCV_PMPS; i++) {
         if (pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg) == PMP_AMATCH_OFF) {
             continue;
-- 
2.25.1


