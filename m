Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n7Ym1-0005eg-1K
	for mharc-qemu-riscv@gnu.org; Wed, 12 Jan 2022 03:14:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1n7Ylh-0005WD-4e; Wed, 12 Jan 2022 03:14:05 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:3269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1n7Ylf-0008Dz-GL; Wed, 12 Jan 2022 03:14:04 -0500
Received: from kwepemi100001.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JYgGk3pvvz1FCh9;
 Wed, 12 Jan 2022 16:10:22 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100001.china.huawei.com (7.221.188.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 12 Jan 2022 16:13:58 +0800
Received: from huawei.com (10.174.186.236) by kwepemm600017.china.huawei.com
 (7.193.23.234) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 12 Jan
 2022 16:13:57 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <libvir-list@redhat.com>, <anup@brainfault.org>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <bin.meng@windriver.com>, <fanliang@huawei.com>,
 <wu.wubin@huawei.com>, <wanghaibin.wang@huawei.com>, <wanbo13@huawei.com>,
 Yifei Jiang <jiangyifei@huawei.com>, Mingwang Li <limingwang@huawei.com>,
 Anup Patel <anup.patel@wdc.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 12/13] target/riscv: Support virtual time context
 synchronization
Date: Wed, 12 Jan 2022 16:13:28 +0800
Message-ID: <20220112081329.1835-13-jiangyifei@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangyifei@huawei.com; helo=szxga08-in.huawei.com
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
X-List-Received-Date: Wed, 12 Jan 2022 08:14:11 -0000

Add virtual time context description to vmstate_kvmtimer. After cpu being
loaded, virtual time context is updated to KVM.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/machine.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 13b9ab375b..098670e680 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -185,6 +185,35 @@ static const VMStateDescription vmstate_rv128 = {
     }
 };
 
+static bool kvmtimer_needed(void *opaque)
+{
+    return kvm_enabled();
+}
+
+static int cpu_post_load(void *opaque, int version_id)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    env->kvm_timer_dirty = true;
+    return 0;
+}
+
+static const VMStateDescription vmstate_kvmtimer = {
+    .name = "cpu/kvmtimer",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = kvmtimer_needed,
+    .post_load = cpu_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
+        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
+        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 3,
@@ -240,6 +269,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_vector,
         &vmstate_pointermasking,
         &vmstate_rv128,
+        &vmstate_kvmtimer,
         NULL
     }
 };
-- 
2.19.1


