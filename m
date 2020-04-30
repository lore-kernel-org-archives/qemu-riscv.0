Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jU3YF-0005fh-Fq
	for mharc-qemu-riscv@gnu.org; Thu, 30 Apr 2020 03:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3Y5-0005Dx-9D
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 03:24:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3Xy-0001fT-3B
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 03:23:57 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:42105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jU3W6-0006WV-Tx; Thu, 30 Apr 2020 03:21:55 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436398|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0951211-0.00075412-0.904125;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03295; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.HQfovas_1588231302; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HQfovas_1588231302) by smtp.aliyun-inc.com(10.147.40.7);
 Thu, 30 Apr 2020 15:21:45 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, alistair23@gmail.com, palmer@dabbelt.com,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH 4/8] riscv: Implement payload load interfaces
Date: Thu, 30 Apr 2020 15:21:35 +0800
Message-Id: <20200430072139.4602-5-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 03:21:44
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Thu, 30 Apr 2020 07:24:04 -0000

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 risu_reginfo_riscv64.c | 134 +++++++++++++++++++++++++++++++++++++++++
 risu_riscv64.c         |  47 +++++++++++++++
 2 files changed, 181 insertions(+)
 create mode 100644 risu_reginfo_riscv64.c
 create mode 100644 risu_riscv64.c

diff --git a/risu_reginfo_riscv64.c b/risu_reginfo_riscv64.c
new file mode 100644
index 0000000..cfa9889
--- /dev/null
+++ b/risu_reginfo_riscv64.c
@@ -0,0 +1,134 @@
+/******************************************************************************
+ * Copyright (c) 2020 PingTouGe Semiconductor
+ * All rights reserved. This program and the accompanying materials
+ * are made available under the terms of the Eclipse Public License v1.0
+ * which accompanies this distribution, and is available at
+ * http://www.eclipse.org/legal/epl-v10.html
+ *
+ * Contributors:
+ *     LIU Zhiwei (PingTouGe) - initial implementation
+ *     based on Peter Maydell's risu_arm.c
+ *****************************************************************************/
+
+#include <stdio.h>
+#include <ucontext.h>
+#include <string.h>
+#include <signal.h> /* for FPSIMD_MAGIC */
+#include <stdlib.h>
+#include <stddef.h>
+#include <stdbool.h>
+#include <inttypes.h>
+#include <assert.h>
+#include <sys/prctl.h>
+
+#include "risu.h"
+#include "risu_reginfo_riscv64.h"
+
+const struct option * const arch_long_opts;
+const char * const arch_extra_help;
+
+void process_arch_opt(int opt, const char *arg)
+{
+    abort();
+}
+
+const int reginfo_size(void)
+{
+    return sizeof(struct reginfo);
+}
+
+/* reginfo_init: initialize with a ucontext */
+void reginfo_init(struct reginfo *ri, ucontext_t *uc)
+{
+    int i;
+    union __riscv_mc_fp_state *fp;
+    /* necessary to be able to compare with memcmp later */
+    memset(ri, 0, sizeof(*ri));
+
+    for (i = 0; i < 32; i++) {
+        ri->regs[i] = uc->uc_mcontext.__gregs[i];
+    }
+
+    ri->sp = 0xdeadbeefdeadbeef;
+    ri->regs[2] = 0xdeadbeefdeadbeef;
+    ri->regs[3] = 0xdeadbeefdeadbeef;
+    ri->regs[4] = 0xdeadbeefdeadbeef;
+    ri->pc = uc->uc_mcontext.__gregs[0] - image_start_address;
+    ri->faulting_insn = *((uint32_t *) uc->uc_mcontext.__gregs[0]);
+    fp = &uc->uc_mcontext.__fpregs;
+    ri->fcsr = fp->__d.__fcsr;
+
+    for (i = 0; i < 32; i++) {
+        ri->fregs[i] = fp->__d.__f[i];
+    }
+}
+
+/* reginfo_is_eq: compare the reginfo structs, returns nonzero if equal */
+int reginfo_is_eq(struct reginfo *r1, struct reginfo *r2)
+{
+    return memcmp(r1, r2, reginfo_size()) == 0;
+}
+
+/* reginfo_dump: print state to a stream, returns nonzero on success */
+int reginfo_dump(struct reginfo *ri, FILE * f)
+{
+    int i;
+    fprintf(f, "  faulting insn %08x\n", ri->faulting_insn);
+
+    for (i = 1; i < 32; i++) {
+        fprintf(f, "  X%-2d    : %016" PRIx64 "\n", i, ri->regs[i]);
+    }
+
+    fprintf(f, "  sp     : %016" PRIx64 "\n", ri->sp);
+    fprintf(f, "  pc     : %016" PRIx64 "\n", ri->pc);
+    fprintf(f, "  fcsr   : %08x\n", ri->fcsr);
+
+    for (i = 0; i < 32; i++) {
+        fprintf(f, "  F%-2d    : %016" PRIx64 "\n", i, ri->fregs[i]);
+    }
+
+    return !ferror(f);
+}
+
+/* reginfo_dump_mismatch: print mismatch details to a stream, ret nonzero=ok */
+int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
+{
+    int i;
+    fprintf(f, "mismatch detail (master : apprentice):\n");
+    if (m->faulting_insn != a->faulting_insn) {
+        fprintf(f, "  faulting insn mismatch %08x vs %08x\n",
+                m->faulting_insn, a->faulting_insn);
+    }
+    for (i = 1; i < 32; i++) {
+        if (m->regs[i] != a->regs[i]) {
+            fprintf(f, "  X%-2d    : %016" PRIx64 " vs %016" PRIx64 "\n",
+                    i, m->regs[i], a->regs[i]);
+        }
+    }
+
+    if (m->sp != a->sp) {
+        fprintf(f, "  sp     : %016" PRIx64 " vs %016" PRIx64 "\n",
+                m->sp, a->sp);
+    }
+
+    if (m->pc != a->pc) {
+        fprintf(f, "  pc     : %016" PRIx64 " vs %016" PRIx64 "\n",
+                m->pc, a->pc);
+    }
+
+    if (m->fcsr != a->fcsr) {
+        fprintf(f, "  fcsr   : %08x vs %08x\n", m->fcsr, a->fcsr);
+    }
+
+    for (i = 0; i < 32; i++) {
+        if (m->fregs[i] != a->fregs[i]) {
+            fprintf(f, "  F%-2d    : "
+                    "%016" PRIx64 " vs "
+                    "%016" PRIx64 "\n", i,
+                    (uint64_t) m->fregs[i],
+                    (uint64_t) a->fregs[i]);
+        }
+    }
+
+    return !ferror(f);
+}
diff --git a/risu_riscv64.c b/risu_riscv64.c
new file mode 100644
index 0000000..f742a40
--- /dev/null
+++ b/risu_riscv64.c
@@ -0,0 +1,47 @@
+/******************************************************************************
+ * Copyright (c) 2020 PingTouGe Semiconductor
+ * All rights reserved. This program and the accompanying materials
+ * are made available under the terms of the Eclipse Public License v1.0
+ * which accompanies this distribution, and is available at
+ * http://www.eclipse.org/legal/epl-v10.html
+ *
+ * Contributors:
+ *     LIU Zhiwei(Linaro) - initial implementation
+ *     based on Peter Maydell's risu_arm.c
+ *****************************************************************************/
+
+#include "risu.h"
+
+void advance_pc(void *vuc)
+{
+    ucontext_t *uc = vuc;
+    uc->uc_mcontext.__gregs[0] += 4;
+}
+
+void set_ucontext_paramreg(void *vuc, uint64_t value)
+{
+    ucontext_t *uc = vuc;
+    uc->uc_mcontext.__gregs[10] = value;
+}
+
+uint64_t get_reginfo_paramreg(struct reginfo *ri)
+{
+    return ri->regs[10];
+}
+
+int get_risuop(struct reginfo *ri)
+{
+    /* Return the risuop we have been asked to do
+     * (or -1 if this was a SIGILL for a non-risuop insn)
+     */
+    uint32_t insn = ri->faulting_insn;
+    uint32_t op = (insn & 0xf00) >> 8;
+    uint32_t key = insn & ~0xf00;
+    uint32_t risukey = 0x0000006b;
+    return (key != risukey) ? -1 : op;
+}
+
+uintptr_t get_pc(struct reginfo *ri)
+{
+   return ri->pc;
+}
-- 
2.23.0


