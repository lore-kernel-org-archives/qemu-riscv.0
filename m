Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfaUr-000747-VJ
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 02:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfaUq-00073m-4N; Fri, 24 Mar 2023 02:01:52 -0400
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfaUZ-0004hn-4v; Fri, 24 Mar 2023 02:01:51 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R461e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VeWagcL_1679637667; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeWagcL_1679637667) by smtp.aliyun-inc.com;
 Fri, 24 Mar 2023 14:01:08 +0800
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 qemu-riscv@nongnu.org, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 2/4] target/riscv: Add a general status enum for extensions
Date: Fri, 24 Mar 2023 13:59:52 +0800
Message-Id: <20230324055954.908-3-zhiwei_liu@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
References: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.119;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-119.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 24 Mar 2023 06:01:52 -0000

The pointer masking is the only extension that directly use status.
The vector or float extension uses the status in an indirect way.

Replace the pointer masking extension special status fields with
the general status.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c      |  2 +-
 target/riscv/cpu.h      |  9 +++++++++
 target/riscv/cpu_bits.h |  6 ------
 target/riscv/csr.c      | 14 +++++++-------
 4 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af2..1135106b3e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -764,7 +764,7 @@ static void riscv_cpu_reset_hold(Object *obj)
         i++;
     }
     /* mmte is supposed to have pm.current hardwired to 1 */
-    env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
+    env->mmte |= (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
 #endif
     env->xl = riscv_cpu_mxl(env);
     riscv_cpu_update_mask(env);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 12fe8d8546..5049e21518 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -99,6 +99,15 @@ enum {
     TRANSLATE_G_STAGE_FAIL
 };
 
+/* Extension Context Status */
+enum {
+    EXT_STATUS_DISABLED = 0,
+    EXT_STATUS_INITIAL,
+    EXT_STATUS_CLEAN,
+    EXT_STATUS_DIRTY,
+    EXT_STATUS_MASK,
+};
+
 #define MMU_USER_IDX 3
 
 #define MAX_RISCV_PMPS (16)
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index fca7ef0cef..5280bd41c2 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -736,12 +736,6 @@ typedef enum RISCVException {
 #define PM_INSN         0x00000004ULL
 #define PM_XS_MASK      0x00000003ULL
 
-/* PointerMasking XS bits values */
-#define PM_EXT_DISABLE  0x00000000ULL
-#define PM_EXT_INITIAL  0x00000001ULL
-#define PM_EXT_CLEAN    0x00000002ULL
-#define PM_EXT_DIRTY    0x00000003ULL
-
 /* Execution enviornment configuration bits */
 #define MENVCFG_FIOM                       BIT(0)
 #define MENVCFG_CBIE                       (3UL << 4)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d522efc0b6..abea7b749e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3513,7 +3513,7 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
 
     /* hardwiring pm.instruction bit to 0, since it's not supported yet */
     wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
-    env->mmte = wpri_val | PM_EXT_DIRTY;
+    env->mmte = wpri_val | EXT_STATUS_DIRTY;
     riscv_cpu_update_mask(env);
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -3593,7 +3593,7 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
         env->cur_pmmask = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3621,7 +3621,7 @@ static RISCVException write_spmmask(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
         env->cur_pmmask = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3649,7 +3649,7 @@ static RISCVException write_upmmask(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
         env->cur_pmmask = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3673,7 +3673,7 @@ static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
         env->cur_pmbase = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3701,7 +3701,7 @@ static RISCVException write_spmbase(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
         env->cur_pmbase = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3729,7 +3729,7 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
         env->cur_pmbase = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
-- 
2.17.1


