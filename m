Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p68nB-00024m-Ei
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 06:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n9-00023I-5E
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 06:22:15 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n7-00068K-5E
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 06:22:14 -0500
Received: by mail-wm1-x332.google.com with SMTP id v7so1675780wmn.0
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 03:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2SnyGDlnuhSa055HYEbK0Sz9hf/vlp1eR2l+Jrskvn4=;
 b=toU0Z5Hy8gTq7fEgcVP5qKn9iNVH4hXTYVexolQQ5czTj17ajtOfYlf3PiuT6ZwzaF
 LmCE+siDDG+g9iU9kbgDu+WQlOt3Sk2VT6M4tv0Xs3FuKgxXtjDeBrBDL5fS+Hkus0Zo
 Hom19g7tRo/NOiIoN+R5pGmpRqH1mrDqY1/Pf2HfRY+ge82xyEjgAbvbGZ76EnA26rzB
 SvzA4JmZlbZ2gp8VQUUrgGUiF2xeVemhJypZCc+gSp6+koveBb/HnFqL5P4rz3NfJsOK
 AoTiRbSPk0MYpctkRlZTEA4u1If8EHemxw85Lde5PaJtn3qXDyEeShYvvbuja5AV3jk1
 40vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2SnyGDlnuhSa055HYEbK0Sz9hf/vlp1eR2l+Jrskvn4=;
 b=gpKzOiwFrPkO42tVGZnNw/4EXrPR2FOGp2Ma74W7Tag1CrQK6z7JleF9lKRGK9AubU
 47rTXCA5xUFZSGjzLti3L/X/rlEER6fZVwoFhMZVccsvbGK9sXEQ613s7Bh1an7EX22o
 uL/+YymSI2ofbflWTX66uDhH4u6RTI4dsp4+yzWR0A2jF7FEvaOAUoGrbTNDj4ZWJPxa
 QuxTXqzt8L+Q/VdBxsJclJm4m9kX++T+srTZjtKSfocMEhwJTrow3kXdU4tst7j2h125
 SzxwM+LiSl2a7LPtr88EunITqhMO0Vkwv183Xf/zw88ad8XbH/OPPG/CIVnstQLGkbVB
 ciOQ==
X-Gm-Message-State: AFqh2krz1XGTNmsklZDBEfDa+hkUPpKkWR4SOI1MkmBo+1O+aQniDuaV
 szLlUxDkA2skIQEMlmfvhYx7Xg==
X-Google-Smtp-Source: AMrXdXvAMmjDH59U59uabmcl3Ymbtz8IdY22Cgkp6ejaaF+apdNDrZqm04F2VBtMf4j5u4mGGFfpLQ==
X-Received: by 2002:a1c:f710:0:b0:3d3:3a9d:2fe with SMTP id
 v16-20020a1cf710000000b003d33a9d02femr4452727wmh.6.1671189731517; 
 Fri, 16 Dec 2022 03:22:11 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d4ad2000000b002365cd93d05sm2037892wrs.102.2022.12.16.03.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:22:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9609F1FFBE;
 Fri, 16 Dec 2022 11:22:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 qemu-ppc@nongnu.org (open list:sPAPR (pseries)),
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH  v1 06/10] includes: move tb_flush into its own header
Date: Fri, 16 Dec 2022 11:22:02 +0000
Message-Id: <20221216112206.3171578-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216112206.3171578-1-alex.bennee@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 16 Dec 2022 11:22:15 -0000

This aids subsystems (like gdbstub) that want to trigger a flush
without pulling target specific headers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - actually include the header and rename to tb-flush.h
---
 include/exec/exec-all.h     |  1 -
 include/exec/tb-flush.h     | 19 +++++++++++++++++++
 linux-user/user-internals.h |  1 +
 accel/stubs/tcg-stub.c      |  1 +
 accel/tcg/tb-maint.c        |  1 +
 accel/tcg/translate-all.c   |  1 +
 cpu.c                       |  1 +
 gdbstub/gdbstub.c           |  1 +
 hw/ppc/spapr_hcall.c        |  1 +
 plugins/core.c              |  1 +
 plugins/loader.c            |  2 +-
 target/alpha/sys_helper.c   |  1 +
 target/riscv/csr.c          |  1 +
 13 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 include/exec/tb-flush.h

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9b7bfbf09a..6be541a85f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -648,7 +648,6 @@ void tb_invalidate_phys_addr(target_ulong addr);
 #else
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 #endif
-void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
 void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end);
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
diff --git a/include/exec/tb-flush.h b/include/exec/tb-flush.h
new file mode 100644
index 0000000000..fb094a9502
--- /dev/null
+++ b/include/exec/tb-flush.h
@@ -0,0 +1,19 @@
+/*
+ * tb-flush prototype for use by the rest of the system.
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef _TB_FLUSH_H_
+#define _TB_FLUSH_H_
+
+/*
+ * The following tb helpers don't require the caller to have any
+ * target specific knowledge (CPUState can be treated as an anonymous
+ * pointer for most).
+ */
+
+void tb_flush(CPUState *cpu);
+
+#endif /* _TB_FLUSH_H_ */
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 0280e76add..ea11549c41 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -20,6 +20,7 @@
 
 #include "exec/user/thunk.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "qemu/log.h"
 
 extern char *exec_path;
diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index c1b05767c0..e0d371c3a7 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "exec/tb-flush.h"
 #include "exec/exec-all.h"
 
 void tb_flush(CPUState *cpu)
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 0cdb35548c..4610208fe8 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -21,6 +21,7 @@
 #include "exec/cputlb.h"
 #include "exec/log.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "exec/translate-all.h"
 #include "sysemu/tcg.h"
 #include "tcg/tcg.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ac3ee3740c..eb8853a50c 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -47,6 +47,7 @@
 #include "exec/cputlb.h"
 #include "exec/translate-all.h"
 #include "exec/translator.h"
+#include "exec/tb-flush.h"
 #include "qemu/bitmap.h"
 #include "qemu/qemu-print.h"
 #include "qemu/timer.h"
diff --git a/cpu.c b/cpu.c
index 4a7d865427..1a374ac4a8 100644
--- a/cpu.c
+++ b/cpu.c
@@ -36,6 +36,7 @@
 #include "sysemu/replay.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "exec/translate-all.h"
 #include "exec/log.h"
 #include "hw/core/accel-cpu.h"
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index bc43aaf825..28f97a55ea 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -46,6 +46,7 @@
 #include "sysemu/runstate.h"
 #include "semihosting/semihost.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "exec/hwaddr.h"
 #include "sysemu/replay.h"
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 925ff523cc..ec4def62f8 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -8,6 +8,7 @@
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "helper_regs.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/spapr.h"
diff --git a/plugins/core.c b/plugins/core.c
index ccb770a485..584b5f3c5e 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -24,6 +24,7 @@
 #include "exec/cpu-common.h"
 
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
diff --git a/plugins/loader.c b/plugins/loader.c
index 88c30bde2d..809f3f9b13 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -29,7 +29,7 @@
 #include "qemu/plugin.h"
 #include "qemu/memalign.h"
 #include "hw/core/cpu.h"
-#include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/boards.h"
 #endif
diff --git a/target/alpha/sys_helper.c b/target/alpha/sys_helper.c
index 25f6cb8894..c83c92dd4c 100644
--- a/target/alpha/sys_helper.c
+++ b/target/alpha/sys_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "exec/helper-proto.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 5c9a7ee287..b02a536bbc 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -25,6 +25,7 @@
 #include "time_helper.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "sysemu/cpu-timers.h"
 #include "qemu/guest-random.h"
 #include "qapi/error.h"
-- 
2.34.1


