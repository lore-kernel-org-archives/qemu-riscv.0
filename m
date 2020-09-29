Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kN50D-0004rm-TW
	for mharc-qemu-riscv@gnu.org; Mon, 28 Sep 2020 22:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kN50A-0004q9-CZ; Mon, 28 Sep 2020 22:04:22 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4769 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kN507-0002x9-0N; Mon, 28 Sep 2020 22:04:22 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D7E076833755CF1B6CF8;
 Tue, 29 Sep 2020 10:04:04 +0800 (CST)
Received: from huawei.com (10.174.187.31) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 29 Sep 2020
 10:03:58 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <palmer@dabbelt.com>, <Alistair.Francis@wdc.com>,
 <sagark@eecs.berkeley.edu>, <kbastian@mail.uni-paderborn.de>,
 <victor.zhangxiaofeng@huawei.com>, <wu.wubin@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, <dengkai1@huawei.com>,
 <yinyipeng1@huawei.com>, Yifei Jiang <jiangyifei@huawei.com>
Subject: [PATCH 4/5] target/riscv: Add V extention state description
Date: Tue, 29 Sep 2020 10:03:36 +0800
Message-ID: <20200929020337.1559-5-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200929020337.1559-1-jiangyifei@huawei.com>
References: <20200929020337.1559-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.31]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=jiangyifei@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 22:04:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 29 Sep 2020 02:04:23 -0000

In the case of supporting V extention, add V extention description
to vmstate_riscv_cpu.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/machine.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 6a528bc1a5..8912a77b71 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -57,6 +57,30 @@ static bool hyper_needed(void *opaque)
     return riscv_has_ext(env, RVH);
 }
 
+static bool vector_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    return riscv_has_ext(env, RVV);
+}
+
+static const VMStateDescription vmstate_vector = {
+    .name = "cpu/vector",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = vector_needed,
+    .fields = (VMStateField[]) {
+            VMSTATE_UINT64_ARRAY(env.vreg, RISCVCPU, 32 * RV_VLEN_MAX / 64),
+            VMSTATE_UINTTL(env.vxrm, RISCVCPU),
+            VMSTATE_UINTTL(env.vxsat, RISCVCPU),
+            VMSTATE_UINTTL(env.vl, RISCVCPU),
+            VMSTATE_UINTTL(env.vstart, RISCVCPU),
+            VMSTATE_UINTTL(env.vtype, RISCVCPU),
+            VMSTATE_END_OF_LIST()
+        }
+};
+
 static const VMStateDescription vmstate_hyper = {
     .name = "cpu/hyper",
     .version_id = 1,
@@ -154,6 +178,7 @@ const VMStateDescription vmstate_riscv_cpu = {
     .subsections = (const VMStateDescription * []) {
         &vmstate_pmp,
         &vmstate_hyper,
+        &vmstate_vector,
         NULL
     }
 };
-- 
2.19.1


