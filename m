Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lGqTo-0003kN-Ou
	for mharc-qemu-riscv@gnu.org; Mon, 01 Mar 2021 16:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqTi-0003eW-0E; Mon, 01 Mar 2021 16:53:23 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGqTf-0005bR-AU; Mon, 01 Mar 2021 16:53:21 -0500
Received: by mail-ej1-x62d.google.com with SMTP id mj10so11080832ejb.5;
 Mon, 01 Mar 2021 13:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pw9WC6vACp5fmsq1o7bIBFCUdYDUl5sYsIdhjFrN0KY=;
 b=MGxFe2L36N+hppLecyhnAZ0T+o7raU+kemtTVvU5lLqmMNBspsPxpTQK9orkEX4eWE
 O5Q3Mo2mJydcaKT4Nm084bDstKf3+GaHyRH50eMbF2n9VptnxqFLQq3vtIX0BUneKOQQ
 qwwfwCmOpqZqIFTKI1ExBXIXvpbp87c4J8a5rH9Ahjew+ilLKR+mpRoDRRbiKB64ECA/
 E5Nm8tsMEzB+b24jh7qs1yS9CwR6enC5BTUszF9MHuZXt1RWBIBjgBqCmu8jJP1oLKMC
 fm7FwW72VBb6tqLzFdbZglXvuO8Wp3m7rwRFjed7WQ4irGi78Vp4lrhD8BHDFbmb4opo
 mZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Pw9WC6vACp5fmsq1o7bIBFCUdYDUl5sYsIdhjFrN0KY=;
 b=F11UkDFrlEhD2JB8WZAiqgjp2dWqLmQp9M+iNvIoEhWoa0MG5zreb3lM3GElFIP9NP
 BJOQM4F8fLliYHK2JzWlZDp+4G0sjG48LObmRwmKvaJRb8OaXxTKNDymR1LDy3hzo92N
 s3Lq85hVYxF5TwAw1jgl/LZjitILxVIGITbHtb+mR9bjOKJSN1srOt3JQsA/r9oy+v4N
 XjiUDsQqsBVpS0kr8Wj1vw0cGz6g4eU5AFWbEHZC80jb4upBJHv0xS8lQMd4Sz53H624
 eSQn0ZOJl+0c1INLNPjwWCh7jTrWLFfwLWgyPMhrvLMoiPc77oW/1yZgZO3SumLd1uWm
 PXGA==
X-Gm-Message-State: AOAM531iscjmrzmSUzUiNmgCFSaCBCi8nj6AvG0r9hjUI7o0Rm69K3D8
 sVG+CI782gx9038N9qRqwuNkG5EOs6Q=
X-Google-Smtp-Source: ABdhPJzWwl3yvTIxpsoEa72kFgGUoyEOZXVTtimWN96EyKE+ic0eqAt5tXNvPRAoPeHxcPdcl3w2Cg==
X-Received: by 2002:a17:907:3e06:: with SMTP id
 hp6mr17900073ejc.254.1614635596186; 
 Mon, 01 Mar 2021 13:53:16 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d6sm15594748eje.20.2021.03.01.13.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 13:53:15 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>, Anthony Green <green@moxielogic.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Marek Vasut <marex@denx.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 Chris Wulff <crwulff@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Claudio Fontana <cfontana@suse.de>,
 Michael Walle <michael@walle.cc>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [RFC PATCH v2 17/17] cpu: Restrict "hw/core/sysemu-cpu-ops.h" to
 target/cpu.c
Date: Mon,  1 Mar 2021 22:51:10 +0100
Message-Id: <20210301215110.772346-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210301215110.772346-1-f4bug@amsat.org>
References: <20210301215110.772346-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 01 Mar 2021 21:53:27 -0000

Somehow similar to commit 78271684719 ("cpu: tcg_ops: move to
tcg-cpu-ops.h, keep a pointer in CPUClass"):

We cannot in principle make the SysEmu Operations field definitions
conditional on CONFIG_SOFTMMU in code that is included by both
common_ss and specific_ss modules.

Therefore, what we can do safely to restrict the SysEmu fields to
system emulation builds, is to move all sysemu operations into a
separate header file, which is only included by system-specific code.

This leaves just a NULL pointer in the cpu.h for the user-mode builds.

Inspired-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC: improve commit description?

 include/hw/core/cpu.h           | 3 ++-
 cpu.c                           | 1 +
 hw/core/cpu.c                   | 1 +
 target/alpha/cpu.c              | 1 +
 target/arm/cpu.c                | 1 +
 target/avr/cpu.c                | 1 +
 target/cris/cpu.c               | 1 +
 target/hppa/cpu.c               | 1 +
 target/i386/cpu.c               | 1 +
 target/m68k/cpu.c               | 1 +
 target/microblaze/cpu.c         | 1 +
 target/mips/cpu.c               | 1 +
 target/moxie/cpu.c              | 1 +
 target/nios2/cpu.c              | 1 +
 target/openrisc/cpu.c           | 1 +
 target/riscv/cpu.c              | 1 +
 target/rx/cpu.c                 | 1 +
 target/s390x/cpu.c              | 1 +
 target/sh4/cpu.c                | 1 +
 target/sparc/cpu.c              | 1 +
 target/tricore/cpu.c            | 1 +
 target/xtensa/cpu.c             | 1 +
 target/ppc/translate_init.c.inc | 1 +
 23 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index d99d3c830dc..398696f0f2d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -80,7 +80,8 @@ struct TCGCPUOps;
 /* see accel-cpu.h */
 struct AccelCPUClass;
 
-#include "hw/core/sysemu-cpu-ops.h"
+/* see sysemu-cpu-ops.h */
+struct SysemuCPUOps;
 
 /**
  * CPUClass:
diff --git a/cpu.c b/cpu.c
index 64e17537e21..29dafee581f 100644
--- a/cpu.c
+++ b/cpu.c
@@ -29,6 +29,7 @@
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 #else
+#include "hw/core/sysemu-cpu-ops.h"
 #include "exec/address-spaces.h"
 #endif
 #include "sysemu/tcg.h"
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 7a8487d468f..da7543be514 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -35,6 +35,7 @@
 #include "trace/trace-root.h"
 #include "qemu/plugin.h"
 #include "sysemu/hw_accel.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 CPUState *cpu_by_arch_id(int64_t id)
 {
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index d9a51d9f647..f6b4bb14cc5 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -24,6 +24,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 
 static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6cd546213de..7fa22a6beba 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -35,6 +35,7 @@
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
 #include "hw/boards.h"
+#include "hw/core/sysemu-cpu-ops.h"
 #endif
 #include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 040d3526995..89de301fc2b 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "cpu.h"
 #include "disas/dis-asm.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 static void avr_cpu_set_pc(CPUState *cs, vaddr value)
 {
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 77f821f4d9a..ed944094cf3 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -26,6 +26,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "mmu.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 
 static void cris_cpu_set_pc(CPUState *cs, vaddr value)
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 7de37aadd4d..304a975eddf 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -25,6 +25,7 @@
 #include "qemu/module.h"
 #include "exec/exec-all.h"
 #include "fpu/softfloat.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 
 static void hppa_cpu_set_pc(CPUState *cs, vaddr value)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3519cef8fba..1e8ee015bfc 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -60,6 +60,7 @@
 #include "exec/address-spaces.h"
 #include "hw/i386/apic_internal.h"
 #include "hw/boards.h"
+#include "hw/core/sysemu-cpu-ops.h"
 #endif
 
 #include "disas/capstone.h"
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index eaf5f34d22c..96fe37e84f1 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -23,6 +23,7 @@
 #include "cpu.h"
 #include "migration/vmstate.h"
 #include "fpu/softfloat.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 static void m68k_cpu_set_pc(CPUState *cs, vaddr value)
 {
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index a21f15192ae..ad3996cd90e 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -28,6 +28,7 @@
 #include "hw/qdev-properties.h"
 #include "exec/exec-all.h"
 #include "fpu/softfloat-helpers.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 static const struct {
     const char *name;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 285564b4d5b..ab3b6a76b1a 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -34,6 +34,7 @@
 #include "hw/semihosting/semihost.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "fpu_helper.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 #if !defined(CONFIG_USER_ONLY)
 
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 47b8735bb75..9c450fc9a61 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "migration/vmstate.h"
 #include "machine.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 static void moxie_cpu_set_pc(CPUState *cs, vaddr value)
 {
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index e5cbf43d6ee..6e89d3a7abd 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -26,6 +26,7 @@
 #include "exec/gdbstub.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
 {
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index c666e86e919..fceacf97203 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -21,6 +21,7 @@
 #include "qapi/error.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
 {
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index eaf7c13e5a6..f24b033426d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -29,6 +29,7 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "fpu/softfloat-helpers.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 /* RISC-V CPU definitions */
 
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index d1a7a5f6877..458553b8fba 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -25,6 +25,7 @@
 #include "exec/exec-all.h"
 #include "hw/loader.h"
 #include "fpu/softfloat.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 static void rx_cpu_set_pc(CPUState *cs, vaddr value)
 {
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 30117fc8cd7..511e9b2aa6f 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -42,6 +42,7 @@
 #include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
+#include "hw/core/sysemu-cpu-ops.h"
 #endif
 #include "fpu/softfloat-helpers.h"
 #include "disas/capstone.h"
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 843f39de41c..273bf3fbe8e 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -26,6 +26,7 @@
 #include "migration/vmstate.h"
 #include "exec/exec-all.h"
 #include "fpu/softfloat-helpers.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 static void superh_cpu_set_pc(CPUState *cs, vaddr value)
 {
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index c8a115c886a..ce9cc6469a9 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -25,6 +25,7 @@
 #include "exec/exec-all.h"
 #include "hw/qdev-properties.h"
 #include "qapi/visitor.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 //#define DEBUG_FEATURES
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 0c4b5021e79..4709854a0aa 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -23,6 +23,7 @@
 #include "exec/exec-all.h"
 #include "qemu/error-report.h"
 #include "migration/vmstate.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 static inline void set_feature(CPUTriCoreState *env, int feature)
 {
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 44a4524bc0a..7e24cb3269f 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -34,6 +34,7 @@
 #include "fpu/softfloat.h"
 #include "qemu/module.h"
 #include "migration/vmstate.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 
 static void xtensa_cpu_set_pc(CPUState *cs, vaddr value)
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index d38d194fe87..591fae52410 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -42,6 +42,7 @@
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 #include "qapi/qapi-commands-machine-target.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 /* #define PPC_DUMP_CPU */
 /* #define PPC_DEBUG_SPR */
-- 
2.26.2


