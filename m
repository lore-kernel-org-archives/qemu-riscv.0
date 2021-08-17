Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mFpjA-0000Hu-QF
	for mharc-qemu-riscv@gnu.org; Mon, 16 Aug 2021 23:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mFpj2-0008GQ-4f; Mon, 16 Aug 2021 23:25:16 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mFpix-0005im-2L; Mon, 16 Aug 2021 23:25:15 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GpbsY2295zdZdc;
 Tue, 17 Aug 2021 11:21:21 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 11:25:04 +0800
Received: from huawei.com (10.174.186.236) by dggpemm000001.china.huawei.com
 (7.185.36.245) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 17 Aug
 2021 11:25:04 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <libvir-list@redhat.com>, <anup.patel@wdc.com>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <bin.meng@windriver.com>, <wu.wubin@huawei.com>,
 <fanliang@huawei.com>, <wanghaibin.wang@huawei.com>, <limingwang@huawei.com>, 
 Yifei Jiang <jiangyifei@huawei.com>, Alistair Francis
 <alistair.francis@wdc.com>
Subject: [PATCH RFC v6 04/12] target/riscv: Implement kvm_arch_get_registers
Date: Tue, 17 Aug 2021 11:24:39 +0800
Message-ID: <20210817032447.2055-5-jiangyifei@huawei.com>
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
X-List-Received-Date: Tue, 17 Aug 2021 03:25:16 -0000

Get GPR CSR and FP registers from kvm by KVM_GET_ONE_REG ioctl.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm.c | 150 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 149 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index dd3bbd7ceb..128a9922e8 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -50,13 +50,161 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
     return id;
 }
 
+#define RISCV_CORE_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, \
+                 KVM_REG_RISCV_CORE_REG(name))
+
+#define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CSR, \
+                 KVM_REG_RISCV_CSR_REG(name))
+
+#define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_F, idx)
+
+#define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_D, idx)
+
+static int kvm_riscv_get_regs_core(CPUState *cs)
+{
+    int ret = 0;
+    int i;
+    target_ulong reg;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    ret = kvm_get_one_reg(cs, RISCV_CORE_REG(env, regs.pc), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->pc = reg;
+
+    for (i = 1; i < 32; i++) {
+        uint64_t id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, i);
+        ret = kvm_get_one_reg(cs, id, &reg);
+        if (ret) {
+            return ret;
+        }
+        env->gpr[i] = reg;
+    }
+
+    return ret;
+}
+
+static int kvm_riscv_get_regs_csr(CPUState *cs)
+{
+    int ret = 0;
+    target_ulong reg;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, sstatus), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->mstatus = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, sie), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->mie = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, stvec), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->stvec = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, sscratch), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->sscratch = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, sepc), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->sepc = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, scause), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->scause = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, stval), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->stval = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, sip), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->mip = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(env, satp), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->satp = reg;
+
+    return ret;
+}
+
+static int kvm_riscv_get_regs_fp(CPUState *cs)
+{
+    int ret = 0;
+    int i;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    if (riscv_has_ext(env, RVD)) {
+        uint64_t reg;
+        for (i = 0; i < 32; i++) {
+            ret = kvm_get_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
+            if (ret) {
+                return ret;
+            }
+            env->fpr[i] = reg;
+        }
+        return ret;
+    }
+
+    if (riscv_has_ext(env, RVF)) {
+        uint32_t reg;
+        for (i = 0; i < 32; i++) {
+            ret = kvm_get_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
+            if (ret) {
+                return ret;
+            }
+            env->fpr[i] = reg;
+        }
+        return ret;
+    }
+
+    return ret;
+}
+
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
 };
 
 int kvm_arch_get_registers(CPUState *cs)
 {
-    return 0;
+    int ret = 0;
+
+    ret = kvm_riscv_get_regs_core(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret = kvm_riscv_get_regs_csr(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret = kvm_riscv_get_regs_fp(cs);
+    if (ret) {
+        return ret;
+    }
+
+    return ret;
 }
 
 int kvm_arch_put_registers(CPUState *cs, int level)
-- 
2.19.1


