Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUbVA-0007S3-W7
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 17:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbV4-0007Li-Eg
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:42 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUbUv-00045P-Sc
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 17:52:42 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 6so5622825wrb.11
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 14:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MistiCtejoNU+LSd57cfAp1b+kwSOMZYngprshjFsHA=;
 b=BeyrD0zGCXw610WHX9VmsVR4QZM4aBWLfsCodpfkxcyXDP2NxPmgTrTRrTfwNNI+yk
 xtppDv30zpAFxPPtjwa1yKxUwJpvqRFYsna9gw87LqFSkQzhJV0iC9p46EarE3rVkr3l
 E1J4EFu2B2lqySXpUaqFi9VLsbxP+QwhUcaGtdxZJKfP5zQPFkPueNjRO6MlXqRBWbJN
 vqZ1Wetbvl1Vrh56kvhQSWARYRbHRF3BsTHth8owsatqaQPM+bNbasbsxopInXlukgp0
 JKaxq1uunrTANJl2wz8oIBALM6GiPyPwGO7BgTb/IvXtRcC+xqtxkHnKUplZpc87iMki
 Dmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MistiCtejoNU+LSd57cfAp1b+kwSOMZYngprshjFsHA=;
 b=FWud+6Vl9v/8JMyjOpx89lPN7mn+e7ELtCxzKMsP37uaTb3+ppMihrNI40kd9NZAjb
 wA2p/Zd51a1u01SwJCD9bL3F2uX5kW+YVuzNaXR/0IocDMiMUz6dAiZQC9kSlVauBIyC
 JoqageSPJQ6XSmML2Plj5oiMB5qV+9icNvJRBkY1wgh3ubAJQpcS00B7l2yIKH54DaqX
 cLhDb+OcE8gsSTg2tebTOTZTzp8lrl+ES3Iw1446fIGvpRSinJEvLBJmC8LbfHwb3jNR
 T2njEJuB3xr+Dp/TMswc0OrQuB3OHGM/dxXPL7/INVeEhMP9avsrzRGoQysQbctzjjC1
 jfzA==
X-Gm-Message-State: AO0yUKURTTaiXIGij00Gb2jRR4tbBNSbcbB00IdM4WsW20ZO4JSglvxW
 4Fjw0NCF1pCks5N/oWqvuzQECA==
X-Google-Smtp-Source: AK7set8i7uo9aD9m8MdeaEEMJr49jeyE09TKUDuOasYTjnRNT3mlKwAhuwonmyElyUpIXMSrkH3HpQ==
X-Received: by 2002:a05:6000:189:b0:2c6:dbe7:1d8e with SMTP id
 p9-20020a056000018900b002c6dbe71d8emr3710470wrx.45.1677019951471; 
 Tue, 21 Feb 2023 14:52:31 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r1-20020adfdc81000000b002c5503a8d21sm3626497wrj.70.2023.02.21.14.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 14:52:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D3A51FFBE;
 Tue, 21 Feb 2023 22:52:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 nicolas.eder@lauterbach.com, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, mads@ynddal.dk,
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 06/24] includes: move tb_flush into its own header
Date: Tue, 21 Feb 2023 22:52:09 +0000
Message-Id: <20230221225227.3735319-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221225227.3735319-1-alex.bennee@linaro.org>
References: <20230221225227.3735319-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 21 Feb 2023 22:52:42 -0000

This aids subsystems (like gdbstub) that want to trigger a flush
without pulling target specific headers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - actually include the header and rename to tb-flush.h
  - better kerneldoc style comment for the function
---
 include/exec/exec-all.h     |  1 -
 include/exec/tb-flush.h     | 26 ++++++++++++++++++++++++++
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
 13 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 include/exec/tb-flush.h

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 0e36f4d063..539768dc50 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -687,7 +687,6 @@ void tb_invalidate_phys_addr(target_ulong addr);
 #else
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 #endif
-void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
 void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end);
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
diff --git a/include/exec/tb-flush.h b/include/exec/tb-flush.h
new file mode 100644
index 0000000000..d92d06565b
--- /dev/null
+++ b/include/exec/tb-flush.h
@@ -0,0 +1,26 @@
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
+/**
+ * tb_flush() - flush all translation blocks
+ * @cs: CPUState (must be valid, but treated as anonymous pointer)
+ *
+ * Used to flush all the translation blocks in the system. Sometimes
+ * it is simpler to flush everything than work out which individual
+ * translations are now invalid and ensure they are not called
+ * anymore.
+ *
+ * tb_flush() takes care of running the flush in an exclusive context
+ * if it is not already running in one. This means no guest code will
+ * run until this complete.
+ */
+void tb_flush(CPUState *cs);
+
+#endif /* _TB_FLUSH_H_ */
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 3576da413f..9333db4f51 100644
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
index b3d6529ae2..97e06c453e 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -22,6 +22,7 @@
 #include "exec/cputlb.h"
 #include "exec/log.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "exec/translate-all.h"
 #include "sysemu/tcg.h"
 #include "tcg/tcg.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 9e925c10f3..2e9d430098 100644
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
index 21cf809614..ef21a55a23 100644
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
index f419425cb0..d8bf90361e 100644
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
index e04ffa1ba4..04632886b9 100644
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
index fa17d7770c..750b683c55 100644
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
2.39.1


