Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poyTz-0007PL-JH
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 23:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1poyTv-0007Mt-TX; Tue, 18 Apr 2023 23:27:43 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1poyTt-000118-6P; Tue, 18 Apr 2023 23:27:43 -0400
Received: from localhost.localdomain (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowACnrxegXz9kyEroFA--.60284S3;
 Wed, 19 Apr 2023 11:27:30 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 1/7] target/riscv: Update pmp_get_tlb_size()
Date: Wed, 19 Apr 2023 11:27:19 +0800
Message-Id: <20230419032725.29721-2-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
References: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnrxegXz9kyEroFA--.60284S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGw1UJFy5JryxKr4fZFyxXwb_yoWrWw13pr
 W7CrWxCrWkK39xJ3WftFWDXF15Cw4SkF4UAa1xGFZY9a15G3yrAr1qkw43ur18Ga98WrWj
 kFZrAF1UCr4UXaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPY14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
 owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU2_M3U
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
X-List-Received-Date: Wed, 19 Apr 2023 03:27:44 -0000

PMP entries before the matched PMP entry(including the matched PMP entry)
may overlap partial of the tlb page, which may make different regions in
that page have different permission rights, such as for
PMP0(0x80000008~0x8000000F, R) and PMP1(0x80001000~0x80001FFF, RWX))
write access to 0x80000000 will match PMP1. However we cannot cache the tlb
for it since this will make the write access to 0x80000008 bypass the check
of PMP0. So we should check all of them and set the tlb size to 1 in this
case.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/cpu_helper.c |  7 ++-----
 target/riscv/pmp.c        | 39 ++++++++++++++++++++++++++-------------
 target/riscv/pmp.h        |  3 +--
 3 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 433ea529b0..075fc0538a 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -703,11 +703,8 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
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
index 1f5aca42e8..22f3b3f217 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -601,28 +601,41 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
 }
 
 /*
- * Calculate the TLB size if the start address or the end address of
+ * Calculate the TLB size if any start address or the end address of
  * PMP entry is presented in the TLB page.
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
+
+    for (i = 0; i < MAX_RISCV_PMPS; i++) {
+        if (pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg) == PMP_AMATCH_OFF) {
+            continue;
+        }
+
+        pmp_sa = env->pmp_state.addr[i].sa;
+        pmp_ea = env->pmp_state.addr[i].ea;
 
-    if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
-        return TARGET_PAGE_SIZE;
-    } else {
         /*
-         * At this point we have a tlb_size that is the smallest possible size
-         * That fits within a TARGET_PAGE_SIZE and the PMP region.
-         *
-         * If the size is less then TARGET_PAGE_SIZE we drop the size to 1.
+         * If any start address or the end address of PMP entry is presented
+         * in the TLB page and cannot override the whole TLB page we drop the
+         * size to 1.
          * This means the result isn't cached in the TLB and is only used for
          * a single translation.
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


