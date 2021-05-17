Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liasZ-0000T8-V5
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liasX-0000K7-ER; Mon, 17 May 2021 06:53:41 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liasV-0007Le-8v; Mon, 17 May 2021 06:53:41 -0400
Received: by mail-wr1-x434.google.com with SMTP id z17so5874602wrq.7;
 Mon, 17 May 2021 03:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mhuox7xIp0GIglyCZDYTd85KgP4TwSkffnhZhs7gf3c=;
 b=R9NO8LQe30o58Mt3m6NdVuyTPZGbNV4LActhLkKq6JU5IfCDUqDiDcAXuGT902+/1F
 a19tnCxEi7h7L4KerntHqoxiJtqjbUJdWd3RkysZRr5GaQv65JznWUPOHgVJA1iQGMos
 70JlCIeWcJaxF7l52h/VT41U0qwViNYenhPtom3FA8hmqviwEhbuQ4cCm9z8JZHAusT6
 GvhvQie85q6n54Spdz2TXlpuTycb5Jzyr+BrbbMOzpdCWDo7zmMgg4aiPavxsrb6GfFk
 EbJpslzvPtRkrP12XZSh1Ak5KFcZHBHs+n18RDRWbqVBJOxRjQ28dsJlSRzqyFsj6Zcx
 i4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mhuox7xIp0GIglyCZDYTd85KgP4TwSkffnhZhs7gf3c=;
 b=ELIXHBqKguw7/kuPyOhIo8dUVcZLuAkAyhKlNyI2rk5iZu72YRArrDEOwcD2uOHKGN
 fznsOX6VpX6BgDQxwZkT/LvIUjw9H+6wwhtixzGmAMNHAKuotLuf4bxi6qXGbwzcgxmG
 Nn5eWCRaM83llYokzfUvxC3+fN1pi24VNSm9lrOfawcxPa2q8FLxVm85ROs5DQBS6Vl1
 6KhEoZF0VQA4LCd3vqj03NUgU3KSX2LPcSlGBYEK7B/nPfEQqK1vC/i8BBkWSHc16DU0
 fC2E+uC4BGZPdxs70aNqG8N0HrSxd9DxHA8m2k9OV20/WqqGP+G3rFv+SaG/LjWylK8S
 Apsw==
X-Gm-Message-State: AOAM533uaQEakK5ghx9aVWVEl+fOYsm0wXBfUZ0h7p9Scq8MH2H9FhYR
 7z7CNN1vjojZIRZ8mb+pzkTT6Wq8Fs6jMA==
X-Google-Smtp-Source: ABdhPJwyYLueB5+kdo+0wMM8EZ3E4acvl+/XSTDzZs2uX6CHe5UpjCppbFCCs6rzZYjJQItV/P8LJg==
X-Received: by 2002:a5d:5301:: with SMTP id e1mr31274420wrv.36.1621248814331; 
 Mon, 17 May 2021 03:53:34 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t13sm354487wmi.2.2021.05.17.03.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:53:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH v7 23/23] cpu: Restrict "hw/core/sysemu-cpu-ops.h" to
 target/cpu.c
Date: Mon, 17 May 2021 12:51:40 +0200
Message-Id: <20210517105140.1062037-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Mon, 17 May 2021 10:53:42 -0000

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
 target/m68k/cpu.h       | 3 +++
 target/microblaze/cpu.h | 1 +
 target/mips/cpu.h       | 3 +++
 target/nios2/cpu.h      | 1 +
 target/openrisc/cpu.h   | 3 +++
 target/ppc/cpu.h        | 3 +++
 target/riscv/cpu.h      | 3 +++
 target/rx/cpu.h         | 3 +++
 target/s390x/cpu.h      | 3 +++
 target/sh4/cpu.h        | 3 +++
 target/sparc/cpu.h      | 3 +++
 target/tricore/cpu.h    | 3 +++
 target/xtensa/cpu.h     | 3 +++
 cpu.c                   | 1 +
 22 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 45fb543c291..e4328de8d41 100644
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
index cb3021c1afa..d5c13c7411f 100644
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
index 1129b5ec0cc..8c63032d503 100644
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
index aac921e221a..e258305675e 100644
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
index 2855dd38816..7fb4bcb74f9 100644
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
index d125aeac1d3..c5541a5aea9 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -22,6 +22,9 @@
 
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
 /* PA-RISC 1.x processors have a strong memory model.  */
 /* ??? While we do not yet implement PA-RISC 2.0, those processors have
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 27a7214debe..38fff85b60f 100644
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
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 7b17f59d40f..102988799bc 100644
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
index 444dc487456..20a89746104 100644
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
 
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 75b0c9924bb..16461a17e88 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -27,6 +27,7 @@
 
 typedef struct CPUNios2State CPUNios2State;
 #if !defined(CONFIG_USER_ONLY)
+#include "hw/core/sysemu-cpu-ops.h"
 #include "mmu.h"
 #endif
 
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 33ab91719c2..062a6369d62 100644
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
index 69978fe0d9b..fa61ef0f8f1 100644
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
index 6713bf6fb44..78754ce7ae4 100644
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
index 2b7595ff372..0fe4bf586cb 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -25,6 +25,9 @@
 #include "cpu-qom.h"
 
 #include "exec/cpu-defs.h"
+#ifndef CONFIG_USER_ONLY
+#include "hw/core/sysemu-cpu-ops.h"
+#endif
 
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
index 64870023e31..c93b0461e5f 100644
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
index 79e28eb2182..de048fdf287 100644
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
index 0892ae647dc..9f4b55731f9 100644
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
 
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index d40d8b7d863..cef48f3a7e6 100644
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
index 76047fcd4d6..164fefeaa35 100644
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
-- 
2.26.3


