Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kko1O-00045q-BC
	for mharc-qemu-riscv@gnu.org; Thu, 03 Dec 2020 07:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kko1K-00041E-A5; Thu, 03 Dec 2020 07:47:38 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kko1I-0006rc-1S; Thu, 03 Dec 2020 07:47:37 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CmwZn1XqqzkksH;
 Thu,  3 Dec 2020 20:46:57 +0800 (CST)
Received: from huawei.com (10.174.186.236) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Dec 2020
 20:47:25 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <libvir-list@redhat.com>, <anup.patel@wdc.com>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <sagark@eecs.berkeley.edu>,
 <kbastian@mail.uni-paderborn.de>, <victor.zhangxiaofeng@huawei.com>,
 <wu.wubin@huawei.com>, <zhang.zhanghailiang@huawei.com>,
 <dengkai1@huawei.com>, <yinyipeng1@huawei.com>, Yifei Jiang
 <jiangyifei@huawei.com>
Subject: [PATCH RFC v4 07/15] hw/riscv: PLIC update external interrupt by KVM
 when kvm enabled
Date: Thu, 3 Dec 2020 20:46:55 +0800
Message-ID: <20201203124703.168-8-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20201203124703.168-1-jiangyifei@huawei.com>
References: <20201203124703.168-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.236]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=jiangyifei@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 03 Dec 2020 12:47:38 -0000

Only support supervisor external interrupt currently.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 hw/intc/sifive_plic.c    | 31 ++++++++++++++++++++++---------
 target/riscv/kvm.c       | 19 +++++++++++++++++++
 target/riscv/kvm_riscv.h |  1 +
 3 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 97a1a27a9a..a419ca3a3c 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -31,6 +31,8 @@
 #include "target/riscv/cpu.h"
 #include "sysemu/sysemu.h"
 #include "migration/vmstate.h"
+#include "sysemu/kvm.h"
+#include "kvm_riscv.h"
 
 #define RISCV_DEBUG_PLIC 0
 
@@ -147,15 +149,26 @@ static void sifive_plic_update(SiFivePLICState *plic)
             continue;
         }
         int level = sifive_plic_irqs_pending(plic, addrid);
-        switch (mode) {
-        case PLICMode_M:
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
-            break;
-        case PLICMode_S:
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
-            break;
-        default:
-            break;
+        if (kvm_enabled()) {
+            if (mode == PLICMode_M) {
+                continue;
+            }
+#ifdef CONFIG_KVM
+            kvm_riscv_set_irq(RISCV_CPU(cpu), IRQ_S_EXT, level);
+#endif
+        } else {
+            switch (mode) {
+            case PLICMode_M:
+                riscv_cpu_update_mip(RISCV_CPU(cpu),
+                                     MIP_MEIP, BOOL_TO_MASK(level));
+                break;
+            case PLICMode_S:
+                riscv_cpu_update_mip(RISCV_CPU(cpu),
+                                     MIP_SEIP, BOOL_TO_MASK(level));
+                break;
+            default:
+                break;
+            }
         }
     }
 
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 6250ca0c7d..b01ff0754c 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -454,3 +454,22 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
     env->satp = 0;
 }
 
+void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
+{
+    int ret;
+    unsigned virq = level ? KVM_INTERRUPT_SET : KVM_INTERRUPT_UNSET;
+
+    if (irq != IRQ_S_EXT) {
+        return;
+    }
+
+    if (!kvm_enabled()) {
+        return;
+    }
+
+    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_INTERRUPT, &virq);
+    if (ret < 0) {
+        perror("Set irq failed");
+        abort();
+    }
+}
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index f38c82bf59..ed281bdce0 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -20,5 +20,6 @@
 #define QEMU_KVM_RISCV_H
 
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
+void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
 
 #endif
-- 
2.19.1


