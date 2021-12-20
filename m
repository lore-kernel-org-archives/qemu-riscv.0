Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzKhc-0002q2-TN
	for mharc-qemu-riscv@gnu.org; Mon, 20 Dec 2021 10:35:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mzKhb-0002lb-FJ; Mon, 20 Dec 2021 10:35:51 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1mzKhS-0005sX-Vu; Mon, 20 Dec 2021 10:35:51 -0500
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JHfy96BDBz8vrT;
 Mon, 20 Dec 2021 21:07:29 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 21:09:48 +0800
Received: from huawei.com (10.174.186.236) by kwepemm600017.china.huawei.com
 (7.193.23.234) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 20 Dec
 2021 21:09:47 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <libvir-list@redhat.com>, <anup.patel@wdc.com>, <palmer@dabbelt.com>,
 <Alistair.Francis@wdc.com>, <bin.meng@windriver.com>, <fanliang@huawei.com>,
 <wu.wubin@huawei.com>, <wanghaibin.wang@huawei.com>, <wanbo13@huawei.com>,
 Yifei Jiang <jiangyifei@huawei.com>, Mingwang Li <limingwang@huawei.com>
Subject: [PATCH v3 12/12] target/riscv: Support virtual time context
 synchronization
Date: Mon, 20 Dec 2021 21:09:19 +0800
Message-ID: <20211220130919.413-13-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20211220130919.413-1-jiangyifei@huawei.com>
References: <20211220130919.413-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.236]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=jiangyifei@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 20 Dec 2021 15:35:51 -0000

Add virtual time context description to vmstate_kvmtimer. After cpu being
loaded, virtual time context is updated to KVM.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/machine.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ad8248ebfd..95eb82792a 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -164,6 +164,35 @@ static const VMStateDescription vmstate_pointermasking = {
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
@@ -218,6 +247,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_hyper,
         &vmstate_vector,
         &vmstate_pointermasking,
+        &vmstate_kvmtimer,
         NULL
     }
 };
-- 
2.19.1


