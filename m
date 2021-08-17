Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mFpj7-00005V-J7
	for mharc-qemu-riscv@gnu.org; Mon, 16 Aug 2021 23:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mFpj3-0008KT-Cc; Mon, 16 Aug 2021 23:25:17 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mFpj0-0005nR-ID; Mon, 16 Aug 2021 23:25:17 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gpbsf66kPzZr5t;
 Tue, 17 Aug 2021 11:21:26 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 11:25:10 +0800
Received: from huawei.com (10.174.186.236) by dggpemm000001.china.huawei.com
 (7.185.36.245) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 17 Aug
 2021 11:25:09 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <libvir-list@redhat.com>, <anup.patel@wdc.com>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <bin.meng@windriver.com>, <wu.wubin@huawei.com>,
 <fanliang@huawei.com>, <wanghaibin.wang@huawei.com>, <limingwang@huawei.com>, 
 Yifei Jiang <jiangyifei@huawei.com>
Subject: [PATCH RFC v6 08/12] target/riscv: Handle KVM_EXIT_RISCV_SBI exit
Date: Tue, 17 Aug 2021 11:24:43 +0800
Message-ID: <20210817032447.2055-9-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210817032447.2055-1-jiangyifei@huawei.com>
References: <20210817032447.2055-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.236]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangyifei@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 17 Aug 2021 03:25:18 -0000

Use char-fe to handle console sbi call, which implement early
console io while apply 'earlycon=sbi' into kernel parameters.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
---
 target/riscv/kvm.c                 | 42 ++++++++++++++++-
 target/riscv/sbi_ecall_interface.h | 72 ++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/sbi_ecall_interface.h

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index bc9cb5d8f9..a68f31c2f3 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -38,6 +38,8 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
 #include "kvm_riscv.h"
+#include "sbi_ecall_interface.h"
+#include "chardev/char-fe.h"
 
 static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx)
 {
@@ -435,9 +437,47 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cs)
     return true;
 }
 
+static int kvm_riscv_handle_sbi(struct kvm_run *run)
+{
+    int ret = 0;
+    unsigned char ch;
+    switch (run->riscv_sbi.extension_id) {
+    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
+        ch = run->riscv_sbi.args[0];
+        qemu_chr_fe_write(serial_hd(0)->be, &ch, sizeof(ch));
+        break;
+    case SBI_EXT_0_1_CONSOLE_GETCHAR:
+        ret = qemu_chr_fe_read_all(serial_hd(0)->be, &ch, sizeof(ch));
+        if (ret == sizeof(ch)) {
+            run->riscv_sbi.args[0] = ch;
+        } else {
+            run->riscv_sbi.args[0] = -1;
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: un-handled SBI EXIT, specific reasons is %lu\n",
+                      __func__, run->riscv_sbi.extension_id);
+        ret = -1;
+        break;
+    }
+    return ret;
+}
+
 int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
 {
-    return 0;
+    int ret = 0;
+    switch (run->exit_reason) {
+    case KVM_EXIT_RISCV_SBI:
+        ret = kvm_riscv_handle_sbi(run);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
+                      __func__, run->exit_reason);
+        ret = -1;
+        break;
+    }
+    return ret;
 }
 
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
diff --git a/target/riscv/sbi_ecall_interface.h b/target/riscv/sbi_ecall_interface.h
new file mode 100644
index 0000000000..fb1a3fa8f2
--- /dev/null
+++ b/target/riscv/sbi_ecall_interface.h
@@ -0,0 +1,72 @@
+/*
+ * SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2019 Western Digital Corporation or its affiliates.
+ *
+ * Authors:
+ *   Anup Patel <anup.patel@wdc.com>
+ */
+
+#ifndef __SBI_ECALL_INTERFACE_H__
+#define __SBI_ECALL_INTERFACE_H__
+
+/* clang-format off */
+
+/* SBI Extension IDs */
+#define SBI_EXT_0_1_SET_TIMER           0x0
+#define SBI_EXT_0_1_CONSOLE_PUTCHAR     0x1
+#define SBI_EXT_0_1_CONSOLE_GETCHAR     0x2
+#define SBI_EXT_0_1_CLEAR_IPI           0x3
+#define SBI_EXT_0_1_SEND_IPI            0x4
+#define SBI_EXT_0_1_REMOTE_FENCE_I      0x5
+#define SBI_EXT_0_1_REMOTE_SFENCE_VMA   0x6
+#define SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID 0x7
+#define SBI_EXT_0_1_SHUTDOWN            0x8
+#define SBI_EXT_BASE                    0x10
+#define SBI_EXT_TIME                    0x54494D45
+#define SBI_EXT_IPI                     0x735049
+#define SBI_EXT_RFENCE                  0x52464E43
+#define SBI_EXT_HSM                     0x48534D
+
+/* SBI function IDs for BASE extension*/
+#define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
+#define SBI_EXT_BASE_GET_IMP_ID         0x1
+#define SBI_EXT_BASE_GET_IMP_VERSION    0x2
+#define SBI_EXT_BASE_PROBE_EXT          0x3
+#define SBI_EXT_BASE_GET_MVENDORID      0x4
+#define SBI_EXT_BASE_GET_MARCHID        0x5
+#define SBI_EXT_BASE_GET_MIMPID         0x6
+
+/* SBI function IDs for TIME extension*/
+#define SBI_EXT_TIME_SET_TIMER          0x0
+
+/* SBI function IDs for IPI extension*/
+#define SBI_EXT_IPI_SEND_IPI            0x0
+
+/* SBI function IDs for RFENCE extension*/
+#define SBI_EXT_RFENCE_REMOTE_FENCE_I       0x0
+#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA    0x1
+#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID  0x2
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA   0x3
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID 0x4
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA   0x5
+#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID 0x6
+
+/* SBI function IDs for HSM extension */
+#define SBI_EXT_HSM_HART_START          0x0
+#define SBI_EXT_HSM_HART_STOP           0x1
+#define SBI_EXT_HSM_HART_GET_STATUS     0x2
+
+#define SBI_HSM_HART_STATUS_STARTED     0x0
+#define SBI_HSM_HART_STATUS_STOPPED     0x1
+#define SBI_HSM_HART_STATUS_START_PENDING   0x2
+#define SBI_HSM_HART_STATUS_STOP_PENDING    0x3
+
+#define SBI_SPEC_VERSION_MAJOR_OFFSET   24
+#define SBI_SPEC_VERSION_MAJOR_MASK     0x7f
+#define SBI_SPEC_VERSION_MINOR_MASK     0xffffff
+#define SBI_EXT_VENDOR_START            0x09000000
+#define SBI_EXT_VENDOR_END              0x09FFFFFF
+/* clang-format on */
+
+#endif
-- 
2.19.1


