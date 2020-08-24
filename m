Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kA84K-0006Nm-HW
	for mharc-qemu-riscv@gnu.org; Mon, 24 Aug 2020 04:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kA84H-0006L5-6M; Mon, 24 Aug 2020 04:43:05 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4207 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1kA84E-0005BE-VO; Mon, 24 Aug 2020 04:43:04 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 90530E4BA5C2269DB681;
 Mon, 24 Aug 2020 16:42:51 +0800 (CST)
Received: from huawei.com (10.174.187.31) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Mon, 24 Aug 2020
 16:42:44 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <palmer@dabbelt.com>, <Alistair.Francis@wdc.com>,
 <sagark@eecs.berkeley.edu>, <kbastian@mail.uni-paderborn.de>,
 <victor.zhangxiaofeng@huawei.com>, <zhang.zhanghailiang@huawei.com>,
 <wu.wubin@huawei.com>, <dengkai1@huawei.com>, <yinyipeng1@huawei.com>,
 "Yifei Jiang" <jiangyifei@huawei.com>
Subject: [PATCH] target/riscv: raise exception to HS-mode at
 get_physical_address
Date: Mon, 24 Aug 2020 16:41:58 +0800
Message-ID: <20200824084158.1769-1-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.31]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=jiangyifei@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 04:42:52
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 24 Aug 2020 08:43:06 -0000

VS-stage translation at get_physical_address needs to translate pte
address by G-stage translation. But the G-stage translation error
can not be distinguished from VS-stage translation error in
riscv_cpu_tlb_fill. On migration, destination needs to rebuild pte,
and this G-stage translation error must be handled by HS-mode. So
introduce TRANSLATE_STAGE2_FAIL so that riscv_cpu_tlb_fill could
distinguish and raise it to HS-mode.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/cpu.h        |  1 +
 target/riscv/cpu_helper.c | 12 ++++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a804a5d0ba..8b3b368d6a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -85,6 +85,7 @@ enum {
 #define TRANSLATE_FAIL 1
 #define TRANSLATE_SUCCESS 0
 #define MMU_USER_IDX 3
+#define TRANSLATE_G_STAGE_FAIL 4
 
 #define MAX_RISCV_PMPS (16)
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index fd1d373b6f..1635b09c41 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -440,7 +440,10 @@ restart:
                                                  mmu_idx, false, true);
 
             if (vbase_ret != TRANSLATE_SUCCESS) {
-                return vbase_ret;
+                env->guest_phys_fault_addr = (base |
+                                              (addr &
+                                               (TARGET_PAGE_SIZE - 1))) >> 2;
+                return TRANSLATE_G_STAGE_FAIL;
             }
 
             pte_addr = vbase + idx * ptesize;
@@ -728,12 +731,17 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         ret = get_physical_address(env, &pa, &prot, address, access_type,
                                    mmu_idx, true, true);
 
+        if (ret == TRANSLATE_G_STAGE_FAIL) {
+            first_stage_error = false;
+            access_type = MMU_DATA_LOAD;
+        }
+
         qemu_log_mask(CPU_LOG_MMU,
                       "%s 1st-stage address=%" VADDR_PRIx " ret %d physical "
                       TARGET_FMT_plx " prot %d\n",
                       __func__, address, ret, pa, prot);
 
-        if (ret != TRANSLATE_FAIL) {
+        if (ret != TRANSLATE_FAIL && ret != TRANSLATE_G_STAGE_FAIL) {
             /* Second stage lookup */
             im_address = pa;
 
-- 
2.19.1



