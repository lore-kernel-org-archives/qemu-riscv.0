Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7YlS-0004vC-3R
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 03:13:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1n7YlO-0004pR-KS; Wed, 12 Jan 2022 03:13:47 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1n7YlL-00089X-6N; Wed, 12 Jan 2022 03:13:46 -0500
Received: from kwepemi100010.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JYgKm11TmzccYp;
 Wed, 12 Jan 2022 16:13:00 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100010.china.huawei.com (7.221.188.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 12 Jan 2022 16:13:39 +0800
Received: from huawei.com (10.174.186.236) by kwepemm600017.china.huawei.com
 (7.193.23.234) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 12 Jan
 2022 16:13:37 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <libvir-list@redhat.com>, <anup@brainfault.org>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <bin.meng@windriver.com>, <fanliang@huawei.com>,
 <wu.wubin@huawei.com>, <wanghaibin.wang@huawei.com>, <wanbo13@huawei.com>,
 Yifei Jiang <jiangyifei@huawei.com>, Mingwang Li <limingwang@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 02/13] target/riscv: Add target/riscv/kvm.c to place the
 public kvm interface
Date: Wed, 12 Jan 2022 16:13:18 +0800
Message-ID: <20220112081329.1835-3-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20220112081329.1835-1-jiangyifei@huawei.com>
References: <20220112081329.1835-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.236]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangyifei@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 12 Jan 2022 08:13:47 -0000

Add target/riscv/kvm.c to place kvm_arch_* function needed by
kvm/kvm-all.c.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/kvm.c       | 133 +++++++++++++++++++++++++++++++++++++++
 target/riscv/meson.build |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 target/riscv/kvm.c

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
new file mode 100644
index 0000000000..687dd4b621
--- /dev/null
+++ b/target/riscv/kvm.c
@@ -0,0 +1,133 @@
+/*
+ * RISC-V implementation of KVM hooks
+ *
+ * Copyright (c) 2020 Huawei Technologies Co., Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include <sys/ioctl.h>
+
+#include <linux/kvm.h>
+
+#include "qemu-common.h"
+#include "qemu/timer.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
+#include "sysemu/kvm_int.h"
+#include "cpu.h"
+#include "trace.h"
+#include "hw/pci/pci.h"
+#include "exec/memattrs.h"
+#include "exec/address-spaces.h"
+#include "hw/boards.h"
+#include "hw/irq.h"
+#include "qemu/log.h"
+#include "hw/loader.h"
+
+const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
+    KVM_CAP_LAST_INFO
+};
+
+int kvm_arch_get_registers(CPUState *cs)
+{
+    return 0;
+}
+
+int kvm_arch_put_registers(CPUState *cs, int level)
+{
+    return 0;
+}
+
+int kvm_arch_release_virq_post(int virq)
+{
+    return 0;
+}
+
+int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
+                             uint64_t address, uint32_t data, PCIDevice *dev)
+{
+    return 0;
+}
+
+int kvm_arch_destroy_vcpu(CPUState *cs)
+{
+    return 0;
+}
+
+unsigned long kvm_arch_vcpu_id(CPUState *cpu)
+{
+    return cpu->cpu_index;
+}
+
+void kvm_arch_init_irq_routing(KVMState *s)
+{
+}
+
+int kvm_arch_init_vcpu(CPUState *cs)
+{
+    return 0;
+}
+
+int kvm_arch_msi_data_to_gsi(uint32_t data)
+{
+    abort();
+}
+
+int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
+                                int vector, PCIDevice *dev)
+{
+    return 0;
+}
+
+int kvm_arch_init(MachineState *ms, KVMState *s)
+{
+    return 0;
+}
+
+int kvm_arch_irqchip_create(KVMState *s)
+{
+    return 0;
+}
+
+int kvm_arch_process_async_events(CPUState *cs)
+{
+    return 0;
+}
+
+void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
+{
+}
+
+MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
+{
+    return MEMTXATTRS_UNSPECIFIED;
+}
+
+bool kvm_arch_stop_on_emulation_error(CPUState *cs)
+{
+    return true;
+}
+
+int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
+{
+    return 0;
+}
+
+bool kvm_arch_cpu_check_are_resettable(void)
+{
+    return true;
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index a32158da93..95340b44aa 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -20,6 +20,7 @@ riscv_ss.add(files(
   'translate.c',
   'm128_helper.c'
 ))
+riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
 riscv_softmmu_ss = ss.source_set()
 riscv_softmmu_ss.add(files(
-- 
2.19.1


