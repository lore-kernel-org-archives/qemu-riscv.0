Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvcop-00036c-9W
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 05:07:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mvcoh-00031z-M6; Fri, 10 Dec 2021 05:07:51 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mvcof-0006LJ-Ut; Fri, 10 Dec 2021 05:07:51 -0500
Received: from kwepemi500003.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4J9RN24p3Bz1DLfF;
 Fri, 10 Dec 2021 18:04:50 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500003.china.huawei.com (7.221.188.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 18:07:43 +0800
Received: from huawei.com (10.174.186.236) by kwepemm600017.china.huawei.com
 (7.193.23.234) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 10 Dec
 2021 18:07:42 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <libvir-list@redhat.com>, <anup.patel@wdc.com>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <bin.meng@windriver.com>, <fanliang@huawei.com>,
 <wu.wubin@huawei.com>, <wanghaibin.wang@huawei.com>, <wanbo13@huawei.com>,
 Yifei Jiang <jiangyifei@huawei.com>, Mingwang Li <limingwang@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 03/12] target/riscv: Implement function kvm_arch_init_vcpu
Date: Fri, 10 Dec 2021 18:07:23 +0800
Message-ID: <20211210100732.1080-4-jiangyifei@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangyifei@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 10 Dec 2021 10:07:57 -0000

Get isa info from kvm while kvm init.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 687dd4b621..ccf3753048 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -38,6 +38,23 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
 
+static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx)
+{
+    uint64_t id = KVM_REG_RISCV | type | idx;
+
+    switch (riscv_cpu_mxl(env)) {
+    case MXL_RV32:
+        id |= KVM_REG_SIZE_U32;
+        break;
+    case MXL_RV64:
+        id |= KVM_REG_SIZE_U64;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return id;
+}
+
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
 };
@@ -79,7 +96,20 @@ void kvm_arch_init_irq_routing(KVMState *s)
 
 int kvm_arch_init_vcpu(CPUState *cs)
 {
-    return 0;
+    int ret = 0;
+    target_ulong isa;
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    uint64_t id;
+
+    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG, KVM_REG_RISCV_CONFIG_REG(isa));
+    ret = kvm_get_one_reg(cs, id, &isa);
+    if (ret) {
+        return ret;
+    }
+    env->misa_ext = isa;
+
+    return ret;
 }
 
 int kvm_arch_msi_data_to_gsi(uint32_t data)
-- 
2.19.1


