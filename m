Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poyU2-0007RZ-Ow
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 23:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1poyTx-0007Nj-Fn; Tue, 18 Apr 2023 23:27:45 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1poyTt-000123-IY; Tue, 18 Apr 2023 23:27:45 -0400
Received: from localhost.localdomain (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowACnrxegXz9kyEroFA--.60284S8;
 Wed, 19 Apr 2023 11:27:33 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v3 6/7] target/riscv: Make the short cut really work in
 pmp_hart_has_privs
Date: Wed, 19 Apr 2023 11:27:24 +0800
Message-Id: <20230419032725.29721-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
References: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnrxegXz9kyEroFA--.60284S8
X-Coremail-Antispam: 1UD129KBjvJXoW3WF4ktF4ktw13Cw15CryDJrb_yoWxJw1Upr
 WakFWxKr1kXrsrG3W3Ga1kCFyjkrnYk3y5tasI934xuw43uw1rurn5tr4a9Fy3Gryq93yr
 urW3urWDGF4qqF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4U
 JVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
 8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
 WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
 OBTYUUUUU
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

We needn't check the PMP entries if there is no PMP rules.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
---
 target/riscv/pmp.c | 251 ++++++++++++++++++++++-----------------------
 1 file changed, 123 insertions(+), 128 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 7feaddd7eb..755ed2b963 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -314,149 +314,144 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     target_ulong e = 0;
 
     /* Short cut if no rules */
-    if (0 == pmp_get_num_rules(env)) {
-        if (pmp_hart_has_privs_default(env, addr, size, privs,
-                                       allowed_privs, mode)) {
-            ret = MAX_RISCV_PMPS;
-        }
-    }
-
-    if (size == 0) {
-        if (riscv_cpu_cfg(env)->mmu) {
-            /*
-             * If size is unknown (0), assume that all bytes
-             * from addr to the end of the page will be accessed.
-             */
-            pmp_size = -(addr | TARGET_PAGE_MASK);
+    if (pmp_get_num_rules(env) != 0) {
+        if (size == 0) {
+            if (riscv_cpu_cfg(env)->mmu) {
+                /*
+                 * If size is unknown (0), assume that all bytes
+                 * from addr to the end of the page will be accessed.
+                 */
+                pmp_size = -(addr | TARGET_PAGE_MASK);
+            } else {
+                pmp_size = sizeof(target_ulong);
+            }
         } else {
-            pmp_size = sizeof(target_ulong);
-        }
-    } else {
-        pmp_size = size;
-    }
-
-    /*
-     * 1.10 draft priv spec states there is an implicit order
-     * from low to high
-     */
-    for (i = 0; i < MAX_RISCV_PMPS; i++) {
-        s = pmp_is_in_range(env, i, addr);
-        e = pmp_is_in_range(env, i, addr + pmp_size - 1);
-
-        /* partially inside */
-        if ((s + e) == 1) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "pmp violation - access is partially inside\n");
-            ret = -1;
-            break;
+            pmp_size = size;
         }
 
-        /* fully inside */
-        const uint8_t a_field =
-            pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
-
         /*
-         * Convert the PMP permissions to match the truth table in the
-         * ePMP spec.
+         * 1.10 draft priv spec states there is an implicit order
+         * from low to high
          */
-        const uint8_t epmp_operation =
-            ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
-            ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
-            (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
-            ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
+        for (i = 0; i < MAX_RISCV_PMPS; i++) {
+            s = pmp_is_in_range(env, i, addr);
+            e = pmp_is_in_range(env, i, addr + pmp_size - 1);
+
+            /* partially inside */
+            if ((s + e) == 1) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "pmp violation - access is partially inside\n");
+                ret = -1;
+                break;
+            }
+
+            /* fully inside */
+            const uint8_t a_field =
+                pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
 
-        if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
             /*
-             * If the PMP entry is not off and the address is in range,
-             * do the priv check
+             * Convert the PMP permissions to match the truth table in the
+             * ePMP spec.
              */
-            if (!MSECCFG_MML_ISSET(env)) {
-                /*
-                 * If mseccfg.MML Bit is not set, do pmp priv check
-                 * This will always apply to regular PMP.
-                 */
-                *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
-                if ((mode != PRV_M) || pmp_is_locked(env, i)) {
-                    *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
-                }
-            } else {
+            const uint8_t epmp_operation =
+                ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
+                ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
+                (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
+                ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
+
+            if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
                 /*
-                 * If mseccfg.MML Bit set, do the enhanced pmp priv check
+                 * If the PMP entry is not off and the address is in range,
+                 * do the priv check
                  */
-                if (mode == PRV_M) {
-                    switch (epmp_operation) {
-                    case 0:
-                    case 1:
-                    case 4:
-                    case 5:
-                    case 6:
-                    case 7:
-                    case 8:
-                        *allowed_privs = 0;
-                        break;
-                    case 2:
-                    case 3:
-                    case 14:
-                        *allowed_privs = PMP_READ | PMP_WRITE;
-                        break;
-                    case 9:
-                    case 10:
-                        *allowed_privs = PMP_EXEC;
-                        break;
-                    case 11:
-                    case 13:
-                        *allowed_privs = PMP_READ | PMP_EXEC;
-                        break;
-                    case 12:
-                    case 15:
-                        *allowed_privs = PMP_READ;
-                        break;
-                    default:
-                        g_assert_not_reached();
+                if (!MSECCFG_MML_ISSET(env)) {
+                    /*
+                     * If mseccfg.MML Bit is not set, do pmp priv check
+                     * This will always apply to regular PMP.
+                     */
+                    *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
+                    if ((mode != PRV_M) || pmp_is_locked(env, i)) {
+                        *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
                     }
                 } else {
-                    switch (epmp_operation) {
-                    case 0:
-                    case 8:
-                    case 9:
-                    case 12:
-                    case 13:
-                    case 14:
-                        *allowed_privs = 0;
-                        break;
-                    case 1:
-                    case 10:
-                    case 11:
-                        *allowed_privs = PMP_EXEC;
-                        break;
-                    case 2:
-                    case 4:
-                    case 15:
-                        *allowed_privs = PMP_READ;
-                        break;
-                    case 3:
-                    case 6:
-                        *allowed_privs = PMP_READ | PMP_WRITE;
-                        break;
-                    case 5:
-                        *allowed_privs = PMP_READ | PMP_EXEC;
-                        break;
-                    case 7:
-                        *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
-                        break;
-                    default:
-                        g_assert_not_reached();
+                    /*
+                     * If mseccfg.MML Bit set, do the enhanced pmp priv check
+                     */
+                    if (mode == PRV_M) {
+                        switch (epmp_operation) {
+                        case 0:
+                        case 1:
+                        case 4:
+                        case 5:
+                        case 6:
+                        case 7:
+                        case 8:
+                            *allowed_privs = 0;
+                            break;
+                        case 2:
+                        case 3:
+                        case 14:
+                            *allowed_privs = PMP_READ | PMP_WRITE;
+                            break;
+                        case 9:
+                        case 10:
+                            *allowed_privs = PMP_EXEC;
+                            break;
+                        case 11:
+                        case 13:
+                            *allowed_privs = PMP_READ | PMP_EXEC;
+                            break;
+                        case 12:
+                        case 15:
+                            *allowed_privs = PMP_READ;
+                            break;
+                        default:
+                            g_assert_not_reached();
+                        }
+                    } else {
+                        switch (epmp_operation) {
+                        case 0:
+                        case 8:
+                        case 9:
+                        case 12:
+                        case 13:
+                        case 14:
+                            *allowed_privs = 0;
+                            break;
+                        case 1:
+                        case 10:
+                        case 11:
+                            *allowed_privs = PMP_EXEC;
+                            break;
+                        case 2:
+                        case 4:
+                        case 15:
+                            *allowed_privs = PMP_READ;
+                            break;
+                        case 3:
+                        case 6:
+                            *allowed_privs = PMP_READ | PMP_WRITE;
+                            break;
+                        case 5:
+                            *allowed_privs = PMP_READ | PMP_EXEC;
+                            break;
+                        case 7:
+                            *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
+                            break;
+                        default:
+                            g_assert_not_reached();
+                        }
                     }
                 }
-            }
 
-            /*
-             * If matching address range was found, the protection bits
-             * defined with PMP must be used. We shouldn't fallback on
-             * finding default privileges.
-             */
-            ret = i;
-            break;
+                /*
+                 * If matching address range was found, the protection bits
+                 * defined with PMP must be used. We shouldn't fallback on
+                 * finding default privileges.
+                 */
+                ret = i;
+                break;
+            }
         }
     }
 
-- 
2.25.1


