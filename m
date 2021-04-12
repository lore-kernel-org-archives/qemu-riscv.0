Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lVqSN-0008R3-9V
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 02:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1lVqSK-0008Kx-SS; Mon, 12 Apr 2021 02:53:56 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:4617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1lVqSI-0004gI-VR; Mon, 12 Apr 2021 02:53:56 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FJfXl6HNMz9ybc;
 Mon, 12 Apr 2021 14:51:35 +0800 (CST)
Received: from huawei.com (10.174.186.236) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Mon, 12 Apr 2021
 14:53:41 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <libvir-list@redhat.com>, <anup.patel@wdc.com>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <sagark@eecs.berkeley.edu>,
 <kbastian@mail.uni-paderborn.de>, <bin.meng@windriver.com>,
 <fanliang@huawei.com>, <wu.wubin@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, <yinyipeng1@huawei.com>, Yifei Jiang
 <jiangyifei@huawei.com>
Subject: [PATCH RFC v5 12/12] target/riscv: Support virtual time context
 synchronization
Date: Mon, 12 Apr 2021 14:52:46 +0800
Message-ID: <20210412065246.1853-13-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210412065246.1853-1-jiangyifei@huawei.com>
References: <20210412065246.1853-1-jiangyifei@huawei.com>
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
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 12 Apr 2021 06:53:57 -0000

Add virtual time context description to vmstate_riscv_cpu. After cpu being
loaded, virtual time context is updated to KVM.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/machine.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 44d4015bd6..ef2d5395a8 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -138,10 +138,20 @@ static const VMStateDescription vmstate_hyper = {
     }
 };
 
+static int cpu_post_load(void *opaque, int version_id)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    env->kvm_timer_dirty = true;
+    return 0;
+}
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 1,
     .minimum_version_id = 1,
+    .post_load = cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
@@ -185,6 +195,10 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT64(env.mtohost, RISCVCPU),
         VMSTATE_UINT64(env.timecmp, RISCVCPU),
 
+        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
+        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
+        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
+
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription * []) {
-- 
2.19.1


