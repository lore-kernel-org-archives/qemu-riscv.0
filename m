Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B897C77B75
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 09:17:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzDGp-0005mE-KS; Wed, 17 May 2023 05:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pzDGl-00059I-Uk; Wed, 17 May 2023 05:16:28 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pzDGh-0007kr-PJ; Wed, 17 May 2023 05:16:27 -0400
Received: from localhost.localdomain (unknown [61.165.33.195])
 by APP-05 (Coremail) with SMTP id zQCowABnVxRam2Rks_XqJQ--.29147S3;
 Wed, 17 May 2023 17:16:12 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v6 01/12] target/riscv: Update pmp_get_tlb_size()
Date: Wed, 17 May 2023 17:15:08 +0800
Message-Id: <20230517091519.34439-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230517091519.34439-1-liweiwei@iscas.ac.cn>
References: <20230517091519.34439-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABnVxRam2Rks_XqJQ--.29147S3
X-Coremail-Antispam: 1UD129KBjvJXoW3WFyUXrWDtrW8ZF15Ar1DKFg_yoW7Zw1Dpr
 W7Cr17GrZ7G3srJw13tF4DXF15C3ySkF4UCayxGFZYkw45G3yrAr1qkr4akr18WaykurWj
 9FZrAF1qkr4UXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPG14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
 x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
 v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
 x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
 Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
 yTuYvjfUj189DUUUU
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

PMP entries before (including) the matched PMP entry may only cover partial
of the TLB page, and this may split the page into regions with different
permissions. Such as for PMP0 (0x80000008~0x8000000F, R) and PMP1 (0x80000000~
0x80000FFF, RWX), write access to 0x80000000 will match PMP1. However we cannot
cache the translation result in the TLB since this will make the write access
to 0x80000008 bypass the check of PMP0. So we should check all of them instead
of the matched PMP entry in pmp_get_tlb_size() and set the tlb_size to 1 in
this case.
Set tlb_size to TARGET_PAGE_SIZE if PMP is not support or there is no PMP rules.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c |  7 ++--
 target/riscv/pmp.c        | 69 ++++++++++++++++++++++++++++++---------
 target/riscv/pmp.h        |  3 +-
 3 files changed, 57 insertions(+), 22 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 57d04385f1..de585b14cc 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -714,11 +714,8 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
     }
 
     *prot = pmp_priv_to_page_prot(pmp_priv);
-    if ((tlb_size != NULL) && pmp_index != MAX_RISCV_PMPS) {
-        target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
-        target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
-
-        *tlb_size = pmp_get_tlb_size(env, pmp_index, tlb_sa, tlb_ea);
+    if (tlb_size != NULL) {
+        *tlb_size = pmp_get_tlb_size(env, addr);
     }
 
     return TRANSLATE_SUCCESS;
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 1f5aca42e8..406cff74f2 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -601,28 +601,67 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
 }
 
 /*
- * Calculate the TLB size if the start address or the end address of
- * PMP entry is presented in the TLB page.
+ * Calculate the TLB size.
+ * It's possible that PMP regions only cover partial of the TLB page, and
+ * this may split the page into regions with different permissions.
+ * For example if PMP0 is (0x80000008~0x8000000F, R) and PMP1 is (0x80000000
+ * ~0x80000FFF, RWX), then region 0x80000008~0x8000000F has R permission, and
+ * the other regions in this page have RWX permissions.
+ * A write access to 0x80000000 will match PMP1. However we cannot cache the
+ * translation result in the TLB since this will make the write access to
+ * 0x80000008 bypass the check of PMP0.
+ * To avoid this we return a size of 1 (which means no caching) if the PMP
+ * region only covers partial of the TLB page.
  */
-target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
-                              target_ulong tlb_sa, target_ulong tlb_ea)
+target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr)
 {
-    target_ulong pmp_sa = env->pmp_state.addr[pmp_index].sa;
-    target_ulong pmp_ea = env->pmp_state.addr[pmp_index].ea;
+    target_ulong pmp_sa;
+    target_ulong pmp_ea;
+    target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
+    target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
+    int i;
 
-    if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
+    /*
+     * If PMP is not supported or there are no PMP rules, the TLB page will not
+     * be split into regions with different permissions by PMP so we set the
+     * size to TARGET_PAGE_SIZE.
+     */
+    if (!riscv_cpu_cfg(env)->pmp || !pmp_get_num_rules(env)) {
         return TARGET_PAGE_SIZE;
-    } else {
+    }
+
+    for (i = 0; i < MAX_RISCV_PMPS; i++) {
+        if (pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg) == PMP_AMATCH_OFF) {
+            continue;
+        }
+
+        pmp_sa = env->pmp_state.addr[i].sa;
+        pmp_ea = env->pmp_state.addr[i].ea;
+
         /*
-         * At this point we have a tlb_size that is the smallest possible size
-         * That fits within a TARGET_PAGE_SIZE and the PMP region.
-         *
-         * If the size is less then TARGET_PAGE_SIZE we drop the size to 1.
-         * This means the result isn't cached in the TLB and is only used for
-         * a single translation.
+         * Only the first PMP entry that covers (whole or partial of) the TLB
+         * page really matters:
+         * If it covers the whole TLB page, set the size to TARGET_PAGE_SIZE,
+         * since the following PMP entries have lower priority and will not
+         * affect the permissions of the page.
+         * If it only covers partial of the TLB page, set the size to 1 since
+         * the allowed permissions of the region may be different from other
+         * region of the page.
          */
-        return 1;
+        if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
+            return TARGET_PAGE_SIZE;
+        } else if ((pmp_sa >= tlb_sa && pmp_sa <= tlb_ea) ||
+                   (pmp_ea >= tlb_sa && pmp_ea <= tlb_ea)) {
+            return 1;
+        }
     }
+
+    /*
+     * If no PMP entry matches the TLB page, the TLB page will also not be
+     * split into regions with different permissions by PMP so we set the size
+     * to TARGET_PAGE_SIZE.
+     */
+    return TARGET_PAGE_SIZE;
 }
 
 /*
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index b296ea1fc6..0a7e24750b 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -76,8 +76,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
                        target_ulong size, pmp_priv_t privs,
                        pmp_priv_t *allowed_privs,
                        target_ulong mode);
-target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
-                              target_ulong tlb_sa, target_ulong tlb_ea);
+target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr);
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
 void pmp_update_rule_nums(CPURISCVState *env);
 uint32_t pmp_get_num_rules(CPURISCVState *env);
-- 
2.25.1


