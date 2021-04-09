Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUltg-0002I6-3L
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 03:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUltd-0002Gp-83; Fri, 09 Apr 2021 03:49:41 -0400
Received: from mail142-32.mail.alibaba.com ([198.11.142.32]:13004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lUlta-0003iN-OR; Fri, 09 Apr 2021 03:49:41 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07535652|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.100308-0.000891546-0.8988;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047205; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.JxL3BOG_1617954563; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.JxL3BOG_1617954563) by smtp.aliyun-inc.com(10.147.40.7);
 Fri, 09 Apr 2021 15:49:25 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 04/11] target/riscv: Update CSR xie in CLIC mode
Date: Fri,  9 Apr 2021 15:48:50 +0800
Message-Id: <20210409074857.166082-5-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.32; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-32.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
X-List-Received-Date: Fri, 09 Apr 2021 07:49:41 -0000

The xie CSR appears hardwired to zero in CLIC mode, replaced by separate
memory-mapped interrupt enables (clicintie[i]). Writes to xie will be
ignored and will not trap (i.e., no access faults).

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/csr.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4c31364967..74bc7a08aa 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -23,6 +23,10 @@
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 
+#if !defined(CONFIG_USER_ONLY)
+#include "hw/intc/riscv_clic.h"
+#endif
+
 /* CSR function table public API */
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
 {
@@ -611,13 +615,17 @@ static int write_mideleg(CPURISCVState *env, int csrno, target_ulong val)
 
 static int read_mie(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    *val = env->mie;
+    /* The xie CSR appears hardwired to zero in CLIC mode, (Section 4.3) */
+    *val = riscv_clic_is_clic_mode(env) ? 0 : env->mie;
     return 0;
 }
 
 static int write_mie(CPURISCVState *env, int csrno, target_ulong val)
 {
-    env->mie = (env->mie & ~all_ints) | (val & all_ints);
+    /* Writes to xie will be ignored and will not trap. (Section 4.3) */
+    if (!riscv_clic_is_clic_mode(env)) {
+        env->mie = (env->mie & ~all_ints) | (val & all_ints);
+    }
     return 0;
 }
 
@@ -785,7 +793,8 @@ static int read_sie(CPURISCVState *env, int csrno, target_ulong *val)
     if (riscv_cpu_virt_enabled(env)) {
         read_vsie(env, CSR_VSIE, val);
     } else {
-        *val = env->mie & env->mideleg;
+        /* The xie CSR appears hardwired to zero in CLIC mode. (Section 4.3) */
+        *val = riscv_clic_is_clic_mode(env) ? 0 : env->mie & env->mideleg;
     }
     return 0;
 }
@@ -805,6 +814,10 @@ static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
     } else {
         target_ulong newval = (env->mie & ~S_MODE_INTERRUPTS) |
                               (val & S_MODE_INTERRUPTS);
+        /* Writes to xie will be ignored and will not trap. (Section 4.3) */
+        if (riscv_clic_is_clic_mode(env)) {
+            return 0;
+        }
         write_mie(env, CSR_MIE, newval);
     }
 
-- 
2.25.1


