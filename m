Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA3XJ-0001Q9-4J
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 00:29:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3X5-0001Jf-Vy; Wed, 19 Jan 2022 00:29:20 -0500
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:49879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3X4-0002RU-9F; Wed, 19 Jan 2022 00:29:19 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1452341|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0548955-1.62908e-05-0.945088; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=9; RT=8; SR=0;
 TI=SMTPD_---.MfD.8f5_1642570152; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfD.8f5_1642570152)
 by smtp.aliyun-inc.com(10.147.41.138);
 Wed, 19 Jan 2022 13:29:12 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, guoren@linux.alibaba.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 21/22] target/riscv: Enable uxl field write
Date: Wed, 19 Jan 2022 13:18:23 +0800
Message-Id: <20220119051824.17494-22-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.221; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-221.mail.aliyun.com
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
X-List-Received-Date: Wed, 19 Jan 2022 05:29:20 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b11d92b51b..90f78eca65 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -572,6 +572,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 {
     uint64_t mstatus = env->mstatus;
     uint64_t mask = 0;
+    RISCVMXL xl = riscv_cpu_mxl(env);
 
     /* flush tlb on mstatus fields that affect VM */
     if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
@@ -583,21 +584,22 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
         MSTATUS_TW | MSTATUS_VS;
 
-    if (riscv_cpu_mxl(env) != MXL_RV32) {
+    if (xl != MXL_RV32) {
         /*
          * RV32: MPV and GVA are not in mstatus. The current plan is to
          * add them to mstatush. For now, we just don't support it.
          */
         mask |= MSTATUS_MPV | MSTATUS_GVA;
+        if ((val & MSTATUS64_UXL) != 0) {
+            mask |= MSTATUS64_UXL;
+        }
     }
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
-    RISCVMXL xl = riscv_cpu_mxl(env);
     if (xl > MXL_RV32) {
-        /* SXL and UXL fields are for now read only */
+        /* SXL field is for now read only */
         mstatus = set_field(mstatus, MSTATUS64_SXL, xl);
-        mstatus = set_field(mstatus, MSTATUS64_UXL, xl);
     }
     env->mstatus = mstatus;
     env->xl = cpu_recompute_xl(env);
@@ -907,7 +909,9 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
     target_ulong mask = (sstatus_v1_10_mask);
-
+    if (env->xl != MXL_RV32) {
+        mask |= SSTATUS64_UXL;
+    }
     /* TODO: Use SXL not MXL. */
     *val = add_status_sd(riscv_cpu_mxl(env), env->mstatus & mask);
     return RISCV_EXCP_NONE;
@@ -917,6 +921,9 @@ static RISCVException write_sstatus(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
     target_ulong mask = (sstatus_v1_10_mask);
+    if (env->xl != MXL_RV32) {
+        mask |= SSTATUS64_UXL;
+    }
     target_ulong newval = (env->mstatus & ~mask) | (val & mask);
     return write_mstatus(env, CSR_MSTATUS, newval);
 }
-- 
2.25.1


