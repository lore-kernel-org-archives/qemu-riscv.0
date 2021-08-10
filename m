Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDIXx-0005lb-3G
	for mharc-qemu-riscv@gnu.org; Mon, 09 Aug 2021 23:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mDIXv-0005lG-2N; Mon, 09 Aug 2021 23:35:19 -0400
Received: from out28-49.mail.aliyun.com ([115.124.28.49]:37870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mDIXs-0006z2-2H; Mon, 09 Aug 2021 23:35:18 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07520134|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0738865-0.00113084-0.924983;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KxldK2P_1628566507; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KxldK2P_1628566507)
 by smtp.aliyun-inc.com(10.147.40.26); Tue, 10 Aug 2021 11:35:07 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH] target/riscv: Don't wrongly overide isa version
Date: Tue, 10 Aug 2021 11:33:10 +0800
Message-Id: <20210810033310.7252-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=115.124.28.49; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-49.mail.aliyun.com
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
X-List-Received-Date: Tue, 10 Aug 2021 03:35:19 -0000

For some cpu, the isa version has already been set in cpu init function.
Thus only overide the isa version when isa version is not set, or
users set different isa version explicitly by cpu parameters.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 991a6bb760..425efba0c8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -392,9 +392,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPU *cpu = RISCV_CPU(dev);
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
-    int priv_version = PRIV_VERSION_1_11_0;
-    int bext_version = BEXT_VERSION_0_93_0;
-    int vext_version = VEXT_VERSION_0_07_1;
+    int priv_version = env->priv_ver;
     target_ulong target_misa = env->misa;
     Error *local_err = NULL;
 
@@ -417,9 +415,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    set_priv_version(env, priv_version);
-    set_bext_version(env, bext_version);
-    set_vext_version(env, vext_version);
+    if (!env->priv_ver) {
+        set_priv_version(env, PRIV_VERSION_1_11_0);
+    } else if (env->priv_ver != priv_version) {
+        set_priv_version(env, priv_version);
+    }
 
     if (cpu->cfg.mmu) {
         set_feature(env, RISCV_FEATURE_MMU);
@@ -497,6 +497,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             target_misa |= RVH;
         }
         if (cpu->cfg.ext_b) {
+            int bext_version = BEXT_VERSION_0_93_0;
             target_misa |= RVB;
 
             if (cpu->cfg.bext_spec) {
@@ -515,6 +516,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             set_bext_version(env, bext_version);
         }
         if (cpu->cfg.ext_v) {
+            int vext_version = VEXT_VERSION_0_07_1;
             target_misa |= RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
                 error_setg(errp,
-- 
2.17.1


