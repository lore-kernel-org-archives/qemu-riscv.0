Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBTdk-0002Zt-8M
	for mharc-qemu-riscv@gnu.org; Wed, 04 Aug 2021 23:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTdi-0002TV-4q; Wed, 04 Aug 2021 23:01:46 -0400
Received: from out28-53.mail.aliyun.com ([115.124.28.53]:37186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBTde-00028n-DG; Wed, 04 Aug 2021 23:01:45 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07748418|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0530431-0.000661099-0.946296;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KvYBEPC_1628132495; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvYBEPC_1628132495)
 by smtp.aliyun-inc.com(10.147.42.22); Thu, 05 Aug 2021 11:01:36 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 13/13] target/riscv: Changing the width of U-mode CSR
Date: Thu,  5 Aug 2021 10:53:12 +0800
Message-Id: <20210805025312.15720-14-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.28.53; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-53.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Aug 2021 03:01:46 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/csr.c | 42 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 5 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9a4ed18ac5..dc9807c0ff 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -297,7 +297,7 @@ static RISCVException read_vxrm(CPURISCVState *env, int csrno,
 static RISCVException write_vxrm(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
-    env->vxrm = val;
+    env->vxrm = riscv_cpu_is_uxl32(env) ? val & UINT32_MAX : val;
     return RISCV_EXCP_NONE;
 }
 
@@ -311,7 +311,7 @@ static RISCVException read_vxsat(CPURISCVState *env, int csrno,
 static RISCVException write_vxsat(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
-    env->vxsat = val;
+    env->vxsat = riscv_cpu_is_uxl32(env) ? val & UINT32_MAX : val;
     return RISCV_EXCP_NONE;
 }
 
@@ -325,7 +325,7 @@ static RISCVException read_vstart(CPURISCVState *env, int csrno,
 static RISCVException write_vstart(CPURISCVState *env, int csrno,
                                    target_ulong val)
 {
-    env->vstart = val;
+    env->vstart = riscv_cpu_is_uxl32(env) ? val & UINT32_MAX : val;
     return RISCV_EXCP_NONE;
 }
 
@@ -493,6 +493,36 @@ static int validate_vm(CPURISCVState *env, target_ulong vm)
     }
 }
 
+static void uxl32_switch(CPURISCVState *env, target_ulong val)
+{
+    uint32_t old = get_field(env->mstatus, MSTATUS64_UXL);
+    uint32_t new = get_field(val, MSTATUS64_UXL);
+
+    if (old == new) {
+        return;
+    }
+
+    /*
+     * For the read-only bits of the previous-width CSR, the bits at the
+     * same positions in the temporary register are set to zeros.
+     */
+    if (env->misa & RVV) {
+        env->vl = 0;
+        env->vtype = 0;
+    }
+
+    /*
+     * If the new width W is narrower than the previous width, the
+     * least-significant W bits of the temporary register are retained and
+     * the more-significant bits are discarded.
+     */
+    if ((old == 2) && (new == 1)) {
+        if (env->misa & RVV) {
+            env->vtype &= UINT32_MAX;
+        }
+    }
+}
+
 static RISCVException write_mstatus(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
@@ -502,13 +532,13 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     /* flush tlb on mstatus fields that affect VM */
     if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
-            MSTATUS_MPRV | MSTATUS_SUM)) {
+            MSTATUS_MPRV | MSTATUS_SUM | MSTATUS64_UXL)) {
         tlb_flush(env_cpu(env));
     }
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
         MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
-        MSTATUS_TW;
+        MSTATUS_TW | MSTATUS64_UXL;
 
     if (!riscv_cpu_is_32bit(env)) {
         /*
@@ -518,6 +548,8 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         mask |= MSTATUS_MPV | MSTATUS_GVA;
     }
 
+    uxl32_switch(env, val);
+
     mstatus = (mstatus & ~mask) | (val & mask);
 
     dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
-- 
2.17.1


