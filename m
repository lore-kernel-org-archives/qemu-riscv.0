Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jN7Zg-0000S1-AL
	for mharc-qemu-riscv@gnu.org; Sat, 11 Apr 2020 00:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jiangyifei@huawei.com>) id 1jN7Zc-0000Kt-Gn
 for qemu-riscv@nongnu.org; Sat, 11 Apr 2020 00:16:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jiangyifei@huawei.com>) id 1jN7Zb-0006XZ-7r
 for qemu-riscv@nongnu.org; Sat, 11 Apr 2020 00:16:52 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:43836 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jiangyifei@huawei.com>)
 id 1jN7ZY-0006OX-B4; Sat, 11 Apr 2020 00:16:48 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 84503B4FB1451654E9CC;
 Sat, 11 Apr 2020 12:16:45 +0800 (CST)
Received: from huawei.com (10.173.222.107) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Sat, 11 Apr 2020
 12:16:35 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <kvm-riscv@lists.infradead.org>, <anup.patel@wdc.com>,
 <palmer@dabbelt.com>, <Alistair.Francis@wdc.com>, <sagark@eecs.berkeley.edu>, 
 <kbastian@mail.uni-paderborn.de>, <victor.zhangxiaofeng@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, <dengkai1@huawei.com>,
 <yinyipeng1@huawei.com>, Yifei Jiang <jiangyifei@huawei.com>
Subject: [PATCH RFC v2 4/9] target/riscv: Implement kvm_arch_get_registers
Date: Sat, 11 Apr 2020 12:14:22 +0800
Message-ID: <20200411041427.14828-5-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
In-Reply-To: <20200411041427.14828-1-jiangyifei@huawei.com>
References: <20200411041427.14828-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.222.107]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
X-List-Received-Date: Sat, 11 Apr 2020 04:16:53 -0000

Get GPR CSR and FP registers from kvm by KVM_GET_ONE_REG ioctl.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/kvm.c | 144 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 3e8f8e7185..8d5069b9e9 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -50,13 +50,155 @@ static __u64 kvm_riscv_reg_id(__u64 type, __u64 idx)
     return id;
 }
 
+#define RISCV_CORE_REG(name)  kvm_riscv_reg_id(KVM_REG_RISCV_CORE, \
+                 KVM_REG_RISCV_CORE_REG(name))
+
+#define RISCV_CSR_REG(name)  kvm_riscv_reg_id(KVM_REG_RISCV_CSR, \
+                 KVM_REG_RISCV_CSR_REG(name))
+
+#define RISCV_FP_F_REG(idx)  kvm_riscv_reg_id(KVM_REG_RISCV_FP_F, idx)
+
+#define RISCV_FP_D_REG(idx)  kvm_riscv_reg_id(KVM_REG_RISCV_FP_D, idx)
+
+static int kvm_riscv_get_regs_core(CPUState *cs)
+{
+    int ret = 0;
+    int i;
+    uint64_t reg;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    ret = kvm_get_one_reg(cs, RISCV_CORE_REG(regs.pc), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->pc = reg;
+
+    for (i = 1; i < 32; i++) {
+        __u64 id = kvm_riscv_reg_id(KVM_REG_RISCV_CORE, i);
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
+    uint64_t reg;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(sstatus), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->mstatus = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(sie), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->mie = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(stvec), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->stvec = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(sscratch), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->sscratch = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(sepc), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->sepc = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(scause), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->scause = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(sip), &reg);
+    if (ret) {
+        return ret;
+    }
+    env->mip = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_CSR_REG(sstatus), &reg);
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
+            ret = kvm_get_one_reg(cs, RISCV_FP_D_REG(i), &reg);
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
+            ret = kvm_get_one_reg(cs, RISCV_FP_F_REG(i), &reg);
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



