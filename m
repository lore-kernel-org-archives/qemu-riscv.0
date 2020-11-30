Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kjXzb-00054K-0L
	for mharc-qemu-riscv@gnu.org; Sun, 29 Nov 2020 20:28:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kjXzZ-00053h-8X; Sun, 29 Nov 2020 20:28:37 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kjXzW-0006eW-JC; Sun, 29 Nov 2020 20:28:36 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CknfZ1m9rzkj76;
 Mon, 30 Nov 2020 09:27:50 +0800 (CST)
Received: from huawei.com (10.174.186.236) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Nov 2020
 09:28:13 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <palmer@dabbelt.com>, <Alistair.Francis@wdc.com>,
 <sagark@eecs.berkeley.edu>, <kbastian@mail.uni-paderborn.de>,
 <victor.zhangxiaofeng@huawei.com>, <wu.wubin@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, <dengkai1@huawei.com>,
 <yinyipeng1@huawei.com>, Yifei Jiang <jiangyifei@huawei.com>
Subject: [PATCH] target/riscv: Fix the bug of HLVX/HLV/HSV
Date: Mon, 30 Nov 2020 09:28:10 +0800
Message-ID: <20201130012810.899-1-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.236]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=jiangyifei@huawei.com; helo=szxga04-in.huawei.com
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
X-List-Received-Date: Mon, 30 Nov 2020 01:28:37 -0000

We found that the hypervisor virtual-machine load and store instructions, 
included HLVX/HLV/HSV, couldn't access guest userspace memory.

In the riscv-privileged spec, HLVX/HLV/HSV is defined as follow: 
"As usual when V=1, two-stage address translation is applied, and
the HS-level sstatus.SUM is ignored."

But get_physical_address() doesn't ignore sstatus.SUM, when HLVX/HLV/HSV
accesses guest userspace memory. So this patch fixes it.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/cpu_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a2787b1d48..7274f971a4 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -367,7 +367,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         vm = get_field(env->hgatp, HGATP_MODE);
         widened = 2;
     }
-    sum = get_field(env->mstatus, MSTATUS_SUM);
+    /* status.SUM will be ignored if execute on background */
+    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background;
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
-- 
2.19.1


