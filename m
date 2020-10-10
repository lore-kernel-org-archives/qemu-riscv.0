Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kR9u3-0000KM-V3
	for mharc-qemu-riscv@gnu.org; Sat, 10 Oct 2020 04:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kR9u1-0000Dl-OZ; Sat, 10 Oct 2020 04:06:53 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5166 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kR9tz-0007oD-MW; Sat, 10 Oct 2020 04:06:53 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4EDA733DF43F27BC688D;
 Sat, 10 Oct 2020 16:06:47 +0800 (CST)
Received: from huawei.com (10.174.185.47) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Sat, 10 Oct 2020
 16:06:38 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <palmer@dabbelt.com>, <Alistair.Francis@wdc.com>,
 <sagark@eecs.berkeley.edu>, <kbastian@mail.uni-paderborn.de>,
 <richard.henderson@linaro.org>, <victor.zhangxiaofeng@huawei.com>,
 <wu.wubin@huawei.com>, <zhang.zhanghailiang@huawei.com>,
 <dengkai1@huawei.com>, <yinyipeng1@huawei.com>, Yifei Jiang
 <jiangyifei@huawei.com>
Subject: [PATCH V2 4/5] target/riscv: Add V extension state description
Date: Sat, 10 Oct 2020 16:06:22 +0800
Message-ID: <20201010080623.768-5-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20201010080623.768-1-jiangyifei@huawei.com>
References: <20201010080623.768-1-jiangyifei@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.47]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=jiangyifei@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/10 04:06:47
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
X-List-Received-Date: Sat, 10 Oct 2020 08:06:54 -0000

In the case of supporting V extension, add V extension description
to vmstate_riscv_cpu.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/machine.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index af599bf001..2bd3a7b5b0 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -76,6 +76,30 @@ static bool hyper_needed(void *opaque)
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
@@ -173,6 +197,7 @@ const VMStateDescription vmstate_riscv_cpu = {
     .subsections = (const VMStateDescription * []) {
         &vmstate_pmp,
         &vmstate_hyper,
+        &vmstate_vector,
         NULL
     }
 };
-- 
2.19.1


