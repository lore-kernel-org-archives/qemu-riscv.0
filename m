Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqCus-0007zT-AN
	for mharc-qemu-riscv@gnu.org; Sat, 22 Apr 2023 09:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pqCui-0007o0-Tq; Sat, 22 Apr 2023 09:04:28 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pqCud-0004Uw-Kw; Sat, 22 Apr 2023 09:04:28 -0400
Received: from localhost.localdomain (unknown [180.165.241.15])
 by APP-01 (Coremail) with SMTP id qwCowAAHTJxI20NkLKGxCA--.21573S6;
 Sat, 22 Apr 2023 21:04:11 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v4 4/7] target/riscv: Flush TLB only when pmpcfg/pmpaddr
 really changes
Date: Sat, 22 Apr 2023 21:03:26 +0800
Message-Id: <20230422130329.23555-5-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230422130329.23555-1-liweiwei@iscas.ac.cn>
References: <20230422130329.23555-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAHTJxI20NkLKGxCA--.21573S6
X-Coremail-Antispam: 1UD129KBjvJXoWxGFWUCF48uFy7trykuFWUXFb_yoW5Cr47pr
 WSkFyIgrW5tasFgayfJF1UXF15Cw1rKryxKrWDCF1F9F43ur48CF1qg3sFkr1DGayxZrWY
 vayUZr1UXF42vFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOBTY
 UUUUU
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Sat, 22 Apr 2023 13:04:29 -0000

TLB needn't be flushed when pmpcfg/pmpaddr don't changes.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/pmp.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 9ae3bfea22..0cef9e3e1d 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -26,7 +26,7 @@
 #include "trace.h"
 #include "exec/exec-all.h"
 
-static void pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
+static bool pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
                           uint8_t val);
 static uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t addr_index);
 static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index);
@@ -83,7 +83,7 @@ static inline uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t pmp_index)
  * Accessor to set the cfg reg for a specific PMP/HART
  * Bounds checks and relevant lock bit.
  */
-static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
+static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
 {
     if (pmp_index < MAX_RISCV_PMPS) {
         bool locked = true;
@@ -119,14 +119,17 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
 
         if (locked) {
             qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - locked\n");
-        } else {
+        } else if (env->pmp_state.pmp[pmp_index].cfg_reg != val) {
             env->pmp_state.pmp[pmp_index].cfg_reg = val;
             pmp_update_rule(env, pmp_index);
+            return true;
         }
     } else {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ignoring pmpcfg write - out of bounds\n");
     }
+
+    return false;
 }
 
 static void pmp_decode_napot(target_ulong a, target_ulong *sa,
@@ -477,16 +480,19 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
     int i;
     uint8_t cfg_val;
     int pmpcfg_nums = 2 << riscv_cpu_mxl(env);
+    bool modified = false;
 
     trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
 
     for (i = 0; i < pmpcfg_nums; i++) {
         cfg_val = (val >> 8 * i)  & 0xff;
-        pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
+        modified |= pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
     }
 
     /* If PMP permission of any addr has been changed, flush TLB pages. */
-    tlb_flush(env_cpu(env));
+    if (modified) {
+        tlb_flush(env_cpu(env));
+    }
 }
 
 
@@ -535,9 +541,11 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
         }
 
         if (!pmp_is_locked(env, addr_index)) {
-            env->pmp_state.pmp[addr_index].addr_reg = val;
-            pmp_update_rule(env, addr_index);
-            tlb_flush(env_cpu(env));
+            if (env->pmp_state.pmp[addr_index].addr_reg != val) {
+                env->pmp_state.pmp[addr_index].addr_reg = val;
+                pmp_update_rule(env, addr_index);
+                tlb_flush(env_cpu(env));
+            }
         } else {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "ignoring pmpaddr write - locked\n");
-- 
2.25.1


