Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6Qsd-0001RI-G3
	for mharc-qemu-riscv@gnu.org; Thu, 13 Aug 2020 23:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1k6Qsb-0001R2-Aj; Thu, 13 Aug 2020 23:59:45 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:34262 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1k6QsZ-0001CY-7e; Thu, 13 Aug 2020 23:59:45 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 83E80C7706C26F28BB17;
 Fri, 14 Aug 2020 11:59:28 +0800 (CST)
Received: from huawei.com (10.174.187.31) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Fri, 14 Aug 2020
 11:59:20 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>
CC: <palmer@dabbelt.com>, <Alistair.Francis@wdc.com>,
 <sagark@eecs.berkeley.edu>, <kbastian@mail.uni-paderborn.de>,
 <victor.zhangxiaofeng@huawei.com>, <wu.wubin@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, <dengkai1@huawei.com>,
 <yinyipeng1@huawei.com>, Yifei Jiang <jiangyifei@huawei.com>
Subject: [PATCH] target/riscv: Fix bug in getting trap cause name for
 trace_riscv_trap
Date: Fri, 14 Aug 2020 11:58:19 +0800
Message-ID: <20200814035819.1214-1-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.31]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=jiangyifei@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 23:59:29
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
X-List-Received-Date: Fri, 14 Aug 2020 03:59:45 -0000

When the cause number is equal to or greater than 23, print "(unknown)" in
trace_riscv_trap. The max valid number of riscv_excp_names is 23, so the last
excpetion "guest_store_page_fault" can not be printed.

In addition, the current check of cause is invalid for riscv_intr_names. So
introduce riscv_cpu_get_trap_name to get the trap cause name.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/cpu.c        | 11 +++++++++++
 target/riscv/cpu.h        |  1 +
 target/riscv/cpu_helper.c |  4 ++--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 228b9bdb5d..bcdce85c5e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -96,6 +96,17 @@ const char * const riscv_intr_names[] = {
     "reserved"
 };
 
+const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
+{
+    if (async) {
+        return (cause < ARRAY_SIZE(riscv_intr_names)) ?
+               riscv_intr_names[cause] : "(unknown)";
+    } else {
+        return (cause < ARRAY_SIZE(riscv_excp_names)) ?
+               riscv_excp_names[cause] : "(unknown)";
+    }
+}
+
 static void set_misa(CPURISCVState *env, target_ulong misa)
 {
     env->misa_mask = env->misa = misa;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a804a5d0ba..7c72979f6a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -312,6 +312,7 @@ extern const char * const riscv_fpr_regnames[];
 extern const char * const riscv_excp_names[];
 extern const char * const riscv_intr_names[];
 
+const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
 void riscv_cpu_do_interrupt(CPUState *cpu);
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 75d2ae3434..2e047f0948 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -877,8 +877,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         }
     }
 
-    trace_riscv_trap(env->mhartid, async, cause, env->pc, tval, cause < 23 ?
-        (async ? riscv_intr_names : riscv_excp_names)[cause] : "(unknown)");
+    trace_riscv_trap(env->mhartid, async, cause, env->pc, tval,
+        riscv_cpu_get_trap_name(cause, async));
 
     if (env->priv <= PRV_S &&
             cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
-- 
2.19.1



