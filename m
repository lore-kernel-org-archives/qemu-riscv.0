Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kko1b-0004es-Pa
	for mharc-qemu-riscv@gnu.org; Thu, 03 Dec 2020 07:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kko1Z-0004aX-Vu; Thu, 03 Dec 2020 07:47:54 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kko1X-0006x8-Ey; Thu, 03 Dec 2020 07:47:53 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CmwbD30yNz777t;
 Thu,  3 Dec 2020 20:47:20 +0800 (CST)
Received: from huawei.com (10.174.186.236) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Dec 2020
 20:47:40 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <libvir-list@redhat.com>, <anup.patel@wdc.com>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <sagark@eecs.berkeley.edu>,
 <kbastian@mail.uni-paderborn.de>, <victor.zhangxiaofeng@huawei.com>,
 <wu.wubin@huawei.com>, <zhang.zhanghailiang@huawei.com>,
 <dengkai1@huawei.com>, <yinyipeng1@huawei.com>, Yifei Jiang
 <jiangyifei@huawei.com>
Subject: [PATCH RFC v4 14/15] target/riscv: Synchronize vcpu's frequency with
 KVM
Date: Thu, 3 Dec 2020 20:47:02 +0800
Message-ID: <20201203124703.168-15-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20201203124703.168-1-jiangyifei@huawei.com>
References: <20201203124703.168-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.236]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=jiangyifei@huawei.com;
 helo=szxga07-in.huawei.com
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
X-List-Received-Date: Thu, 03 Dec 2020 12:47:54 -0000

If vcpu's frequency is specified by cpu option 'frequency', it
will be set into KVM by KVM_SET_ONE_REG ioctl. Otherwise, vcpu's
frequency will follow KVM by KVM_GET_ONE_REG ioctl.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/kvm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 1e16d24544..3499efd4eb 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -409,6 +409,8 @@ int kvm_arch_get_registers(CPUState *cs)
 int kvm_arch_put_registers(CPUState *cs, int level)
 {
     int ret = 0;
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
 
     ret = kvm_riscv_put_regs_core(cs);
     if (ret) {
@@ -425,6 +427,10 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
+    if (env->frequency) {
+        ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(frequency), &env->frequency);
+    }
+
     return ret;
 }
 
@@ -481,6 +487,17 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
     env->misa = isa;
 
+    /*
+     * Synchronize vcpu's frequency with KVM. If vcpu's frequency is specified
+     * by cpu option 'frequency', this will be set to KVM. Otherwise, vcpu's
+     * frequency will follow KVM.
+     */
+    if (env->user_frequency) {
+        ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(frequency), &env->frequency);
+    } else {
+        ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(frequency), &env->frequency);
+    }
+
     return ret;
 }
 
-- 
2.19.1


