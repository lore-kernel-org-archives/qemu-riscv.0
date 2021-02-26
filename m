Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFcwe-0007pE-TM
	for mharc-qemu-riscv@gnu.org; Fri, 26 Feb 2021 08:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFcwd-0007ls-9I; Fri, 26 Feb 2021 08:14:11 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFcwb-0004m4-1k; Fri, 26 Feb 2021 08:14:11 -0500
Received: by mail-wr1-x434.google.com with SMTP id a18so333481wrc.13;
 Fri, 26 Feb 2021 05:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1zWD3Wo/Yf+bUkAp7vTRRSdEBTDmto7M4yP0bACNmCI=;
 b=W01T9UXN2rLc+XMn2cwYuOh392jG62SP6FzMcqfcszYYW+fQUDViTu6VO428SuU32g
 93/P0vWnnA/Je30/tTOddTdUq2leg9lb+DKuM8VsqVKCCZJhXgJ0lpt9muTAocUPX4CC
 0Uu8OvbWIoioVoDLYNEy4CmH4q6nFbpn9E5+6YlFCsA3o1h1/P2t0WvMTxWeQUtLKOBN
 pkcLduKV2MjMRIc8S0vmdMvS4kYA1K01rak5uxW2XGnKHFXQVa8+c3bn6+wWC79uIBXC
 ooXNAwdrbsMMzMttgNHkb5NOKqDuwNm+6TX8iaWyZMmuOQ/fEvyi7jd93M5LKq2Cve5E
 uKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1zWD3Wo/Yf+bUkAp7vTRRSdEBTDmto7M4yP0bACNmCI=;
 b=oU6E4x6U6CUZJHmZ7AplmRGI/mPf4BLEd8os/vp2sdjhqjnbwfUXLXDS2beRwtVJOS
 tZvSJsOtyViiwbMyOiMZk2sN/+pp85SU7TL8bR+wlfUCb2quqVnpbcNodTq/glh/ZSpl
 LOPOjBDnwOIOLrealJCkp6XnQTKWj//0ZO85o4fZaANNuO0fQ5ypVPvBj83AofhkApW8
 HwNaG9YQIxB04TjJ6caKRds60GCLD9T140N7CBowhbaEEbLk/pUTdlB8L/N1HzxfZQhw
 lTrdwP84evi6zMeLdZoQc95LRUfgBS4LGWo7r7DQOsbrFtRC28t/rlDWxJtQlchWcZm7
 echw==
X-Gm-Message-State: AOAM533qinml3FiknYpIgFchFNcMrz2AuUSEPJ3AmWAmm+j8Iyi8oEsk
 hyF5UO1x+0cJlxfuxB95VjcdLAYLAqU=
X-Google-Smtp-Source: ABdhPJxOiEXcaAFGCjRhOPsN48YXr8Z4oehFhRH0mFPv4Wq/1ohlpPvpSrwAwT8LFOtRa6KQXtCqcQ==
X-Received: by 2002:a5d:62ce:: with SMTP id o14mr3211790wrv.174.1614345246799; 
 Fri, 26 Feb 2021 05:14:06 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d7sm13343162wrm.62.2021.02.26.05.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:14:06 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Chris Wulff <crwulff@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/2] semihosting: Move include/hw/semihosting/ ->
 include/semihosting/
Date: Fri, 26 Feb 2021 14:13:55 +0100
Message-Id: <20210226131356.3964782-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226131356.3964782-1-f4bug@amsat.org>
References: <20210226131356.3964782-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
X-List-Received-Date: Fri, 26 Feb 2021 13:14:12 -0000

We want to move the semihosting code out of hw/ in the next patch.

This patch contains the mechanical steps, created using:

  $ git mv include/hw/semihosting/ include/
  $ sed -i s,hw/semihosting,semihosting, $(git grep -l hw/semihosting)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/{hw => }/semihosting/console.h  | 0
 include/{hw => }/semihosting/semihost.h | 0
 gdbstub.c                               | 2 +-
 hw/mips/malta.c                         | 2 +-
 hw/semihosting/arm-compat-semi.c        | 6 +++---
 hw/semihosting/config.c                 | 2 +-
 hw/semihosting/console.c                | 4 ++--
 linux-user/aarch64/cpu_loop.c           | 2 +-
 linux-user/arm/cpu_loop.c               | 2 +-
 linux-user/riscv/cpu_loop.c             | 2 +-
 linux-user/semihost.c                   | 2 +-
 softmmu/vl.c                            | 2 +-
 stubs/semihost.c                        | 2 +-
 target/arm/helper.c                     | 4 ++--
 target/arm/m_helper.c                   | 4 ++--
 target/arm/translate-a64.c              | 2 +-
 target/arm/translate.c                  | 2 +-
 target/lm32/helper.c                    | 2 +-
 target/m68k/op_helper.c                 | 2 +-
 target/mips/cpu.c                       | 2 +-
 target/mips/mips-semi.c                 | 4 ++--
 target/mips/translate.c                 | 2 +-
 target/nios2/helper.c                   | 2 +-
 target/riscv/cpu_helper.c               | 2 +-
 target/unicore32/helper.c               | 2 +-
 target/xtensa/translate.c               | 2 +-
 target/xtensa/xtensa-semi.c             | 2 +-
 MAINTAINERS                             | 2 +-
 28 files changed, 32 insertions(+), 32 deletions(-)
 rename include/{hw => }/semihosting/console.h (100%)
 rename include/{hw => }/semihosting/semihost.h (100%)

diff --git a/include/hw/semihosting/console.h b/include/semihosting/console.h
similarity index 100%
rename from include/hw/semihosting/console.h
rename to include/semihosting/console.h
diff --git a/include/hw/semihosting/semihost.h b/include/semihosting/semihost.h
similarity index 100%
rename from include/hw/semihosting/semihost.h
rename to include/semihosting/semihost.h
diff --git a/gdbstub.c b/gdbstub.c
index 759bb00bcf0..552b38a73b2 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -49,7 +49,7 @@
 #include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "exec/exec-all.h"
 #include "sysemu/replay.h"
 
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9afc0b427bf..26e7b1bd9f6 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -58,7 +58,7 @@
 #include "qemu/error-report.h"
 #include "hw/misc/empty_slot.h"
 #include "sysemu/kvm.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "hw/mips/cps.h"
 #include "hw/qdev-clock.h"
 
diff --git a/hw/semihosting/arm-compat-semi.c b/hw/semihosting/arm-compat-semi.c
index 23c6e3edcb6..94950b6c56d 100644
--- a/hw/semihosting/arm-compat-semi.c
+++ b/hw/semihosting/arm-compat-semi.c
@@ -34,9 +34,9 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "hw/semihosting/semihost.h"
-#include "hw/semihosting/console.h"
-#include "hw/semihosting/common-semi.h"
+#include "semihosting/semihost.h"
+#include "semihosting/console.h"
+#include "semihosting/common-semi.h"
 #include "qemu/log.h"
 #include "qemu/timer.h"
 #ifdef CONFIG_USER_ONLY
diff --git a/hw/semihosting/config.c b/hw/semihosting/config.c
index 9807f10cb00..3548e0f627f 100644
--- a/hw/semihosting/config.c
+++ b/hw/semihosting/config.c
@@ -22,7 +22,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "chardev/char.h"
 #include "sysemu/sysemu.h"
 
diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
index 9b4fee92602..c9ebd6fdd05 100644
--- a/hw/semihosting/console.c
+++ b/hw/semihosting/console.c
@@ -17,8 +17,8 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "hw/semihosting/semihost.h"
-#include "hw/semihosting/console.h"
+#include "semihosting/semihost.h"
+#include "semihosting/console.h"
 #include "exec/gdbstub.h"
 #include "exec/exec-all.h"
 #include "qemu/log.h"
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 7c42f657068..ee72a1c20f0 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -22,7 +22,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "qemu/guest-random.h"
-#include "hw/semihosting/common-semi.h"
+#include "semihosting/common-semi.h"
 #include "target/arm/syndrome.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index cadfb7fa439..989d03cd89d 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -22,7 +22,7 @@
 #include "qemu.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
-#include "hw/semihosting/common-semi.h"
+#include "semihosting/common-semi.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 9665dabb096..6767f941e8f 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -23,7 +23,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "elf.h"
-#include "hw/semihosting/common-semi.h"
+#include "semihosting/common-semi.h"
 
 void cpu_loop(CPURISCVState *env)
 {
diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index c0015ee7f6c..82013b8b48b 100644
--- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -12,7 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "hw/semihosting/console.h"
+#include "semihosting/console.h"
 #include "qemu.h"
 #include <termios.h>
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b219ce1f357..b2d3cf28995 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -108,7 +108,7 @@
 #include "qapi/opts-visitor.h"
 #include "qapi/clone-visitor.h"
 #include "qom/object_interfaces.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "crypto/init.h"
 #include "sysemu/replay.h"
 #include "qapi/qapi-events-run-state.h"
diff --git a/stubs/semihost.c b/stubs/semihost.c
index 1d8b37f7b2f..1b30f38b03d 100644
--- a/stubs/semihost.c
+++ b/stubs/semihost.c
@@ -11,7 +11,7 @@
 #include "qemu/osdep.h"
 #include "qemu/option.h"
 #include "qemu/error-report.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "sysemu/sysemu.h"
 
 /* Empty config */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0e1a3b94211..d763f376c6e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -22,7 +22,7 @@
 #include "exec/exec-all.h"
 #include <zlib.h> /* For crc32 */
 #include "hw/irq.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/kvm.h"
@@ -34,7 +34,7 @@
 #ifdef CONFIG_TCG
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
-#include "hw/semihosting/common-semi.h"
+#include "semihosting/common-semi.h"
 #endif
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 731c435c00b..d63ae465e1e 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -21,7 +21,7 @@
 #include "qemu/qemu-print.h"
 #include "exec/exec-all.h"
 #include <zlib.h> /* For crc32 */
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 #include "qemu/range.h"
@@ -31,7 +31,7 @@
 #ifdef CONFIG_TCG
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
-#include "hw/semihosting/common-semi.h"
+#include "semihosting/common-semi.h"
 #endif
 
 static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b23a8975d54..6d002e2c63f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -28,7 +28,7 @@
 #include "internals.h"
 #include "qemu/host-utils.h"
 
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "exec/gen-icount.h"
 
 #include "exec/helper-proto.h"
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1653cca1aaa..62b1c2081b6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -29,7 +29,7 @@
 #include "qemu/log.h"
 #include "qemu/bitops.h"
 #include "arm_ldst.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
diff --git a/target/lm32/helper.c b/target/lm32/helper.c
index 7c52ae76d6d..01cc3c53a50 100644
--- a/target/lm32/helper.c
+++ b/target/lm32/helper.c
@@ -21,7 +21,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "qemu/host-utils.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "exec/log.h"
 
 bool lm32_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 202498deb51..730cdf77444 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -21,7 +21,7 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 
 #if defined(CONFIG_USER_ONLY)
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index bf70c77295f..bd4dca571fc 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -31,7 +31,7 @@
 #include "exec/exec-all.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-clock.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "fpu_helper.h"
 
diff --git a/target/mips/mips-semi.c b/target/mips/mips-semi.c
index 898251aa023..6de60fa6dd7 100644
--- a/target/mips/mips-semi.c
+++ b/target/mips/mips-semi.c
@@ -22,8 +22,8 @@
 #include "qemu/log.h"
 #include "exec/helper-proto.h"
 #include "exec/softmmu-semi.h"
-#include "hw/semihosting/semihost.h"
-#include "hw/semihosting/console.h"
+#include "semihosting/semihost.h"
+#include "semihosting/console.h"
 
 typedef enum UHIOp {
     UHI_exit = 1,
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 70891c37cdd..0b6d82d228e 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -29,7 +29,7 @@
 #include "exec/translator.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 
 #include "target/mips/trace.h"
 #include "trace-tcg.h"
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 57c97bde3c6..53be8398e99 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -26,7 +26,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "exec/helper-proto.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 
 #if defined(CONFIG_USER_ONLY)
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 2f43939fb6d..83a6bcfad08 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -24,7 +24,7 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
-#include "hw/semihosting/common-semi.h"
+#include "semihosting/common-semi.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
diff --git a/target/unicore32/helper.c b/target/unicore32/helper.c
index 54c26871fea..704393c27f9 100644
--- a/target/unicore32/helper.c
+++ b/target/unicore32/helper.c
@@ -14,7 +14,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
-#include "hw/semihosting/console.h"
+#include "semihosting/console.h"
 
 #undef DEBUG_UC32
 
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 944a157747c..0ae4efc48a1 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -37,7 +37,7 @@
 #include "qemu/log.h"
 #include "qemu/qemu-print.h"
 #include "exec/cpu_ldst.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "exec/translator.h"
 
 #include "exec/helper-proto.h"
diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
index 25f57a6500c..79f2b043f23 100644
--- a/target/xtensa/xtensa-semi.c
+++ b/target/xtensa/xtensa-semi.c
@@ -29,7 +29,7 @@
 #include "cpu.h"
 #include "chardev/char-fe.h"
 #include "exec/helper-proto.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 9b2aa18e1fe..aacd4408125 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3225,7 +3225,7 @@ Semihosting
 M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: hw/semihosting/
-F: include/hw/semihosting/
+F: include/semihosting/
 
 Multi-process QEMU
 M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
-- 
2.26.2


