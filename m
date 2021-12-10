Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvcox-0003Zq-Gb
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 05:08:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mvcos-0003Ek-SV; Fri, 10 Dec 2021 05:08:03 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mvcoq-0006Ou-I3; Fri, 10 Dec 2021 05:08:02 -0500
Received: from kwepemi100006.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4J9RQr2cHnz937X;
 Fri, 10 Dec 2021 18:07:16 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100006.china.huawei.com (7.221.188.165) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 18:07:56 +0800
Received: from huawei.com (10.174.186.236) by kwepemm600017.china.huawei.com
 (7.193.23.234) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 10 Dec
 2021 18:07:55 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <libvir-list@redhat.com>, <anup.patel@wdc.com>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <bin.meng@windriver.com>, <fanliang@huawei.com>,
 <wu.wubin@huawei.com>, <wanghaibin.wang@huawei.com>, <wanbo13@huawei.com>,
 Yifei Jiang <jiangyifei@huawei.com>, Mingwang Li <limingwang@huawei.com>
Subject: [PATCH v2 10/12] target/riscv: Add kvm_riscv_get/put_regs_timer
Date: Fri, 10 Dec 2021 18:07:30 +0800
Message-ID: <20211210100732.1080-11-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20211210100732.1080-1-jiangyifei@huawei.com>
References: <20211210100732.1080-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.236]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangyifei@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 10 Dec 2021 10:08:03 -0000

Add kvm_riscv_get/put_regs_timer to synchronize virtual time context
from KVM.

To set register of RISCV_TIMER_REG(state) will occur a error from KVM
on kvm_timer_state == 0. It's better to adapt in KVM, but it doesn't matter
that adaping in QEMU.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
---
 target/riscv/cpu.h |  7 +++++
 target/riscv/kvm.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e7dba35acb..c892a2c8b7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -259,6 +259,13 @@ struct CPURISCVState {
 
     hwaddr kernel_addr;
     hwaddr fdt_addr;
+
+    /* kvm timer */
+    bool kvm_timer_dirty;
+    uint64_t kvm_timer_time;
+    uint64_t kvm_timer_compare;
+    uint64_t kvm_timer_state;
+    uint64_t kvm_timer_frequency;
 };
 
 OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 171a32adf9..802c076b22 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -64,6 +64,9 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
 #define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CSR, \
                  KVM_REG_RISCV_CSR_REG(name))
 
+#define RISCV_TIMER_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_TIMER, \
+                 KVM_REG_RISCV_TIMER_REG(name))
+
 #define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_F, idx)
 
 #define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_D, idx)
@@ -235,6 +238,75 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
     return ret;
 }
 
+static void kvm_riscv_get_regs_timer(CPUState *cs)
+{
+    int ret;
+    uint64_t reg;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    if (env->kvm_timer_dirty) {
+        return;
+    }
+
+    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, time), &reg);
+    if (ret) {
+        abort();
+    }
+    env->kvm_timer_time = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, compare), &reg);
+    if (ret) {
+        abort();
+    }
+    env->kvm_timer_compare = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, state), &reg);
+    if (ret) {
+        abort();
+    }
+    env->kvm_timer_state = reg;
+
+    env->kvm_timer_dirty = true;
+}
+
+static void kvm_riscv_put_regs_timer(CPUState *cs)
+{
+    int ret;
+    uint64_t reg;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    if (!env->kvm_timer_dirty) {
+        return;
+    }
+
+    reg = env->kvm_timer_time;
+    ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, time), &reg);
+    if (ret) {
+        abort();
+    }
+
+    reg = env->kvm_timer_compare;
+    ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, compare), &reg);
+    if (ret) {
+        abort();
+    }
+
+    /*
+     * To set register of RISCV_TIMER_REG(state) will occur a error from KVM
+     * on env->kvm_timer_state == 0, It's better to adapt in KVM, but it
+     * doesn't matter that adaping in QEMU now.
+     * TODO If KVM changes, adapt here.
+     */
+    if (env->kvm_timer_state) {
+        reg = env->kvm_timer_state;
+        ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, state), &reg);
+        if (ret) {
+            abort();
+        }
+    }
+
+    env->kvm_timer_dirty = false;
+}
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
-- 
2.19.1


