Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA3Xc-00029H-CG
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 00:29:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3Xa-00021y-9q; Wed, 19 Jan 2022 00:29:50 -0500
Received: from out28-125.mail.aliyun.com ([115.124.28.125]:36835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3XX-0002Sp-Tx; Wed, 19 Jan 2022 00:29:49 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1572608|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0168965-1.0396e-05-0.983093;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.MfCIIYH_1642570182; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfCIIYH_1642570182)
 by smtp.aliyun-inc.com(10.147.41.137);
 Wed, 19 Jan 2022 13:29:43 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, guoren@linux.alibaba.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 22/22] target/riscv: Relax UXL field for debugging
Date: Wed, 19 Jan 2022 13:18:24 +0800
Message-Id: <20220119051824.17494-23-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.125; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-125.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Wed, 19 Jan 2022 05:29:50 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 90f78eca65..c6b2407a06 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -584,7 +584,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
         MSTATUS_TW | MSTATUS_VS;
 
-    if (xl != MXL_RV32) {
+    if (xl != MXL_RV32 || env->debugger) {
         /*
          * RV32: MPV and GVA are not in mstatus. The current plan is to
          * add them to mstatush. For now, we just don't support it.
@@ -909,7 +909,7 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
     target_ulong mask = (sstatus_v1_10_mask);
-    if (env->xl != MXL_RV32) {
+    if (env->xl != MXL_RV32 || env->debugger) {
         mask |= SSTATUS64_UXL;
     }
     /* TODO: Use SXL not MXL. */
@@ -921,7 +921,8 @@ static RISCVException write_sstatus(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
     target_ulong mask = (sstatus_v1_10_mask);
-    if (env->xl != MXL_RV32) {
+
+    if (env->xl != MXL_RV32 || env->debugger) {
         mask |= SSTATUS64_UXL;
     }
     target_ulong newval = (env->mstatus & ~mask) | (val & mask);
-- 
2.25.1


