Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZWt2-0007P9-HD
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 06:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWsy-0007Ex-O5; Thu, 22 Apr 2021 06:48:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWsw-0005bG-LF; Thu, 22 Apr 2021 06:48:40 -0400
Received: by mail-wr1-x435.google.com with SMTP id p6so37631730wrn.9;
 Thu, 22 Apr 2021 03:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DeCLhui4rg2rh6ax+66/y+81F2OHwJcABZRfsK+3aus=;
 b=S68PNGmveZoUqqbDeEsG0GzcSvYOD8opZKzRarns+HKmSOKnzEMFDz8wBNDdrg3AMP
 ofWcFL4UlkIXTnCxIQXM4HBtq4ZpDEvJd11Wnm2gjSsiOA2oriIuOeL3hfVTLoBlcjzG
 k0sJRd/HDir5G7tHr6ubFjCgN9LwHNtBsrhF3V4R5nHCGwQdo/Rr6G1uzVyjW3XlrUX6
 sTUTEUwPbUHTSI8tYRcggE63E1/XNxKiFTfUu01U6ptY9kRG1l63XHm2eAuTnTbdhyTS
 H9pvSOFeQZa8liWHccw5k0oKBimEoQDSfmgxI6bgEwodAybJb1kYezm5kaBuIiwt5xqU
 TiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DeCLhui4rg2rh6ax+66/y+81F2OHwJcABZRfsK+3aus=;
 b=TTNe8Apj4CVs2h+SHTVvVwee5XCmOY4fpBp/l1tGu5W7NW7fBpd9faZuoc3L89TZti
 /jEYLOoDT+4YIWT3zoYXw7qJ8ybDz1yWcvwcDewZDdcsR80Zhqwhv3mnTvFd4BoNECxo
 /tGNMKC2ijN5wEn9bRMZTZGOsAEuI9JktmHOxzL6ssaH3KK1JTkUTdislgv2cOOWU6Ey
 fQkoSesez14y5i1YIHVpF7D0+5dmf9D7An4jqKQFrgqja5ugurQ6+fZanVFoV1VkP34b
 PxIO8WbML96j8Dieg2XY7F8O6gaz+57u8NE/dh0zPkSvewtVdmBxdP567CeLmwqqE3I+
 3YyA==
X-Gm-Message-State: AOAM533Jnu1hfMfLMFByvusloknGBPEesh8zrD7CFauLxhIhPNXyBTib
 Z6rkL9QB8+4Ms4KqYgAbC+TKDnvcyZlisg==
X-Google-Smtp-Source: ABdhPJwJ8LvyBLx/E5uZKCaAgQSoppjg7uRXw7uTKZwU8E/0z7Pb23/DdKEk7MiJJp6GuCW1jl6o7g==
X-Received: by 2002:a5d:4d02:: with SMTP id z2mr3296880wrt.190.1619088513005; 
 Thu, 22 Apr 2021 03:48:33 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q5sm2911733wrv.17.2021.04.22.03.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 03:48:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Juan Quintela <quintela@redhat.com>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-riscv@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Walle <michael@walle.cc>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Anthony Green <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v5 15/15] cpu: Restrict "hw/core/sysemu-cpu-ops.h" to
 target/cpu.c
Date: Thu, 22 Apr 2021 12:47:04 +0200
Message-Id: <20210422104705.2454166-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422104705.2454166-1-f4bug@amsat.org>
References: <20210422104705.2454166-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 10:48:42 -0000

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
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h   | 3 ++-
 target/alpha/cpu.h      | 3 +++
 target/arm/cpu.h        | 3 +++
 target/avr/cpu.h        | 1 +
 target/cris/cpu.h       | 3 +++
 target/hexagon/cpu.h    | 3 +++
 target/hppa/cpu.h       | 3 +++
 target/i386/cpu.h       | 3 +++
 target/lm32/cpu.h       | 3 +++
 target/m68k/cpu.h       | 3 +++
 target/microblaze/cpu.h | 1 +
 target/mips/cpu.h       | 3 +++
 target/moxie/cpu.h      | 3 +++
 target/nios2/cpu.h      | 1 +
 target/openrisc/cpu.h   | 3 +++
 target/ppc/cpu.h        | 3 +++
 target/riscv/cpu.h      | 3 +++
 target/rx/cpu.h         | 1 +
 target/s390x/cpu.h      | 3 +++
 target/sh4/cpu.h        | 3 +++
 target/sparc/cpu.h      | 3 +++
 target/tricore/cpu.h    | 3 +++
 target/unicore32/cpu.h  | 3 +++
 target/xtensa/cpu.h     | 3 +++
 cpu.c                   | 1 +
 hw/core/cpu.c           | 1 +
 26 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index d0187798eea..3422d405b49 100644
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
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 82df108967b..f1218a27706 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -22,6 +22,9 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* Alpha processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 193a49ec7fa..d9228d1d990 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -25,6 +25,9 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "qapi/qapi-types-common.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* ARM processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index d148e8c75a4..e0419649fa7 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -23,6 +23,7 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 #ifdef CONFIG_USER_ONLY
 #error "AVR 8-bit does not support user mode"
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index d3b64929096..4450f2268ea 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -23,6 +23,9 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define EXCP_NMI        1
 #define EXCP_GURU       2
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index e04eac591c8..2a878e77f08 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -26,6 +26,9 @@ typedef struct CPUHexagonState CPUHexagonState;
 #include "qemu-common.h"
 #include "exec/cpu-defs.h"
 #include "hex_regs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define NUM_PREGS 4
 #define TOTAL_PER_THREAD_REGS 64
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 61178fa6a2a..94d2d4701c4 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -23,6 +23,9 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "exec/memory.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* PA-RISC 1.x processors have a strong memory model.  */
 /* ??? While we do not yet implement PA-RISC 2.0, those processors have
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 570f916878f..2f520cb6fc1 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -25,6 +25,9 @@
 #include "kvm/hyperv-proto.h"
 #include "exec/cpu-defs.h"
 #include "qapi/qapi-types-common.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* The x86 has a strong memory model with some store-after-load re-ordering */
 #define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
diff --git a/target/lm32/cpu.h b/target/lm32/cpu.h
index ea7c01ca8b0..034183dad30 100644
--- a/target/lm32/cpu.h
+++ b/target/lm32/cpu.h
@@ -22,6 +22,9 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 typedef struct CPULM32State CPULM32State;
 
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 402c86c8769..681dc0d1d13 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -23,6 +23,9 @@
 
 #include "exec/cpu-defs.h"
 #include "cpu-qom.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define OS_BYTE     0
 #define OS_WORD     1
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index e4bba8a7551..3f5c2e048e5 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -26,6 +26,7 @@
 
 typedef struct CPUMBState CPUMBState;
 #if !defined(CONFIG_USER_ONLY)
+#include "hw/core/sysemu-cpu-ops.h"
 #include "mmu.h"
 #endif
 
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 075c24abdad..923ab71f8d7 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -6,6 +6,9 @@
 #include "fpu/softfloat-types.h"
 #include "hw/clock.h"
 #include "mips-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
index bd6ab66084d..7a0a5e95d01 100644
--- a/target/moxie/cpu.h
+++ b/target/moxie/cpu.h
@@ -22,6 +22,9 @@
 
 #include "exec/cpu-defs.h"
 #include "qom/object.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define MOXIE_EX_DIV0        0
 #define MOXIE_EX_BAD         1
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 2ab82fdc713..1b88b027063 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -27,6 +27,7 @@
 
 typedef struct CPUNios2State CPUNios2State;
 #if !defined(CONFIG_USER_ONLY)
+#include "hw/core/sysemu-cpu-ops.h"
 #include "mmu.h"
 #endif
 
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 82cbaeb4f84..2a6f9f48547 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -23,6 +23,9 @@
 #include "exec/cpu-defs.h"
 #include "hw/core/cpu.h"
 #include "qom/object.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* cpu_openrisc_map_address_* in CPUOpenRISCTLBContext need this decl.  */
 struct OpenRISCCPU;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e73416da68d..f889c28e548 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -24,6 +24,9 @@
 #include "exec/cpu-defs.h"
 #include "cpu-qom.h"
 #include "qom/object.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define TCG_GUEST_DEFAULT_MO 0
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba8..90ac5097718 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -25,6 +25,9 @@
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
 #include "qom/object.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define TCG_GUEST_DEFAULT_MO 0
 
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 0b4b998c7be..d9b7b63716a 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -25,6 +25,7 @@
 #include "cpu-qom.h"
 
 #include "exec/cpu-defs.h"
+#include "hw/core/sysemu-cpu-ops.h"
 
 /* PSW define */
 REG32(PSW, 0)
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 2464d4076c0..8f7233d97c2 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -28,6 +28,9 @@
 #include "cpu-qom.h"
 #include "cpu_models.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #define ELF_MACHINE_UNAME "S390X"
 
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 01c43440822..6c3d3a29fc2 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -22,6 +22,9 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* CPU Subtypes */
 #define SH_CPU_SH7750  (1 << 0)
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 4b2290650be..237ffc4fe66 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -4,6 +4,9 @@
 #include "qemu/bswap.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 #if !defined(TARGET_SPARC64)
 #define TARGET_DPREGS 16
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index 4b61a2c03f8..a7636c0e870 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -23,6 +23,9 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "tricore-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 struct tricore_boot_info;
 
diff --git a/target/unicore32/cpu.h b/target/unicore32/cpu.h
index 7a32e086ed3..de475d0fc2e 100644
--- a/target/unicore32/cpu.h
+++ b/target/unicore32/cpu.h
@@ -14,6 +14,9 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 typedef struct CPUUniCore32State {
     /* Regs for current mode.  */
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 3bd4f691c1a..ea4ee5338f3 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -31,6 +31,9 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "xtensa-isa.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* Xtensa processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
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
-- 
2.26.3


