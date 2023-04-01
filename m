Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piaW5-0003Xa-1h
	for mharc-qemu-riscv@gnu.org; Sat, 01 Apr 2023 08:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1piaW3-0003WO-VJ; Sat, 01 Apr 2023 08:39:31 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1piaW0-0000CE-9o; Sat, 01 Apr 2023 08:39:31 -0400
Received: from localhost.localdomain (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowACHj8_3JShkBbjBGQ--.7361S8;
 Sat, 01 Apr 2023 20:39:24 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 6/6] target/riscv: Add pointer mask support for instruction
 fetch
Date: Sat,  1 Apr 2023 20:39:17 +0800
Message-Id: <20230401123917.20471-7-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230401123917.20471-1-liweiwei@iscas.ac.cn>
References: <20230401123917.20471-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHj8_3JShkBbjBGQ--.7361S8
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4DWryDKFy7JrW3Aw15CFg_yoW5uryfpr
 48C3yakr4DtFZrGa43tw4Dtrn8Ja98KF4UAws7GaySy3y5JayrArn8KwnrZF1DWFWrWr12
 93WDCr1UZF47ZrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
 1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
 6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
 C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
 6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
 8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
 WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
 OBTYUUUUU
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 01 Apr 2023 12:39:32 -0000

Transform the fetch address in cpu_get_tb_cpu_state() when pointer
mask for instruction is enabled.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        |  1 +
 target/riscv/cpu_helper.c | 20 +++++++++++++++++++-
 target/riscv/csr.c        |  2 --
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..57bd9c3279 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -368,6 +368,7 @@ struct CPUArchState {
 #endif
     target_ulong cur_pmmask;
     target_ulong cur_pmbase;
+    bool cur_pminsn;
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..b683a770fe 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -40,6 +40,19 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #endif
 }
 
+static target_ulong adjust_pc_address(CPURISCVState *env, target_ulong pc)
+{
+    target_ulong adjust_pc = pc;
+
+    if (env->cur_pminsn) {
+        adjust_pc = (adjust_pc & ~env->cur_pmmask) | env->cur_pmbase;
+    } else if (env->xl == MXL_RV32) {
+        adjust_pc &= UINT32_MAX;
+    }
+
+    return adjust_pc;
+}
+
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
@@ -48,7 +61,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 
     uint32_t flags = 0;
 
-    *pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
+    *pc = adjust_pc_address(env, env->pc);
     *cs_base = 0;
 
     if (cpu->cfg.ext_zve32f) {
@@ -124,6 +137,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 void riscv_cpu_update_mask(CPURISCVState *env)
 {
     target_ulong mask = -1, base = 0;
+    bool insn = false;
     /*
      * TODO: Current RVJ spec does not specify
      * how the extension interacts with XLEN.
@@ -135,18 +149,21 @@ void riscv_cpu_update_mask(CPURISCVState *env)
             if (env->mmte & M_PM_ENABLE) {
                 mask = env->mpmmask;
                 base = env->mpmbase;
+                insn = env->mmte & MMTE_M_PM_INSN;
             }
             break;
         case PRV_S:
             if (env->mmte & S_PM_ENABLE) {
                 mask = env->spmmask;
                 base = env->spmbase;
+                insn = env->mmte & MMTE_S_PM_INSN;
             }
             break;
         case PRV_U:
             if (env->mmte & U_PM_ENABLE) {
                 mask = env->upmmask;
                 base = env->upmbase;
+                insn = env->mmte & MMTE_U_PM_INSN;
             }
             break;
         default:
@@ -161,6 +178,7 @@ void riscv_cpu_update_mask(CPURISCVState *env)
         env->cur_pmmask = mask;
         env->cur_pmbase = base;
     }
+    env->cur_pminsn = insn;
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 43b9ad4500..0902b64129 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3518,8 +3518,6 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
     /* for machine mode pm.current is hardwired to 1 */
     wpri_val |= MMTE_M_PM_CURRENT;
 
-    /* hardwiring pm.instruction bit to 0, since it's not supported yet */
-    wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
     env->mmte = wpri_val | PM_EXT_DIRTY;
     riscv_cpu_update_mask(env);
 
-- 
2.25.1


