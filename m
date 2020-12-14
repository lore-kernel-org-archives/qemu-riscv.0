Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kou89-0001V3-9l
	for mharc-qemu-riscv@gnu.org; Mon, 14 Dec 2020 15:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kou83-0001FI-Ib; Mon, 14 Dec 2020 15:07:31 -0500
Received: from home.keithp.com ([63.227.221.253]:51868 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kou7w-0004GZ-VS; Mon, 14 Dec 2020 15:07:31 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 66C173F2E378;
 Mon, 14 Dec 2020 12:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607976440; bh=0eZXdSlmEZzZ/qZ6vpzpqHEOFeMQka/AJEayELnsFOw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K9RUcJnu1kL7f5vGJVsBY0VmdS+V5c/qcEgP+TcGDpkFnOu3CuqLNsCehlcpAVEmh
 7GLbPHLEkyvbqdan68TTRKXv0myLbfEjxJK0MMAcgasw+dLSp5Al2W2e7jyaXPPe6n
 x/SbAHcxbyZknFvBQ9W2+eVHq5WoErUrU8rrWcO4xJIjlU1OQBmghoERsbkPUP7TJQ
 TgXmNhlyUm5n8E2npzf9XqtA9Mo75GPvCPpsCGVM5iGDurxm45nlNobMDUzNqVkYzl
 xlizQRYbt6OvsWu6q8ag3NrCZYE8PLQ7F+gOiWkUpMHaDoHdh1l+we+SAt2P1qEbpn
 q3ds4slxVlscg==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id uH6c-ckDlbg0; Mon, 14 Dec 2020 12:07:19 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id C693C3F2E37E;
 Mon, 14 Dec 2020 12:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1607976437; bh=0eZXdSlmEZzZ/qZ6vpzpqHEOFeMQka/AJEayELnsFOw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pWzMZHCshxWhc9iAJC+k6ZTWl8gONa6sPXy2amtPqayoA7Qoo6hzY7TQcVct1LLHf
 Lmaxbh7qty671dL/P/6K/LmWCKrCsfijSkqCjvFpPjJ/A1mg0GEg3HSYmcFw5ryPNP
 89C6WPHqcKzbjFvaPFJpJVZmXWEtV7sbh+GMS1bIq78pBqy635ieYwpzp5bzYfT7sZ
 losIMaTVm0JaPias7i2qPUpU+/u0XCumKBpEIhNAxNfQUvsW8LVkDaDRskEcT65Hqe
 O9JS13xtLqMxBBA4AChpxYeI1S1KsrgDDXH65U96DuEBeaEluNFIPBQp8A4+QAAOQe
 IKMHpTUttLObg==
Received: by keithp.com (Postfix, from userid 1000)
 id 4CAB3158222B; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH 5/9] riscv: Add semihosting support
Date: Mon, 14 Dec 2020 12:07:09 -0800
Message-Id: <20201214200713.3886611-6-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214200713.3886611-1-keithp@keithp.com>
References: <87wnxktost.fsf@linaro.org>
 <20201214200713.3886611-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 14 Dec 2020 20:07:32 -0000

Adapt the arm semihosting support code for RISCV. This implementation
is based on the standard for RISC-V semihosting version 0.2 as
documented in

   https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2

Signed-off-by: Keith Packard <keithp@keithp.com>

---

v2:
	Update PC after exception is handled to follow
	change in the ARM version for SYS_READC

v3:
	Disallow semihosting in user mode; report a regular
	breakpoint in that case.

v4:
	Fix errors reported by checkpatch

v5:
	Reference current RISC-V semihosting specification

v6:
	Add support for semihosting in riscv64-linux-user and
	riscv32-linux-user

v7:
	Add meson build support

v8:
	Fix errors reported by checkpatch that crept in.

v9:
	Changes suggested by Alistair Francis <alistair23@gmail.com>:
	Don't add me to the MAINTAINERS file.
	Remove duplicate #include in target/riscv/cpu.h
	Reference RISC-V semihosting spec in target/riscv/riscv-semi.c

v10:
	Use common semihosting implementation instead of a separate copy.

	Make sure addresses of the three breakpoint-signaling
	instructions all lie within the same page. Change suggested by
	Richard Henderson <richard.henderson@linaro.org>

v11:
	Use CONFIG_ARM_COMPATIBLE_SEMIHOSTING

v12:
	Fix bug in SYS_EXIT support on rv64

v13:
	Add common_semi_rambase implementation. This locates the
	memory region containing the stack and uses the base of that.

	Fix SET_ARG and GET_ARG on rv64 targets to operate on 64-bit
	values rather than 32-bit. Put_user_ual/get_user_ual are
	confusingly defined by softmmu-semi.h as being equivalent to
	put_user_u32/get_user_u32.
---
 default-configs/devices/riscv32-softmmu.mak   |  2 +
 default-configs/devices/riscv64-softmmu.mak   |  2 +
 .../targets/riscv32-linux-user.mak            |  1 +
 .../targets/riscv64-linux-user.mak            |  1 +
 hw/semihosting/common-semi.c                  | 82 ++++++++++++++++++-
 hw/semihosting/common-semi.h                  |  5 +-
 linux-user/qemu.h                             |  4 +-
 linux-user/semihost.c                         |  8 +-
 qemu-options.hx                               | 10 ++-
 target/riscv/cpu_bits.h                       |  1 +
 target/riscv/cpu_helper.c                     | 10 +++
 .../riscv/insn_trans/trans_privileged.c.inc   | 37 ++++++++-
 target/riscv/translate.c                      | 11 +++
 13 files changed, 162 insertions(+), 12 deletions(-)

diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
index 94a236c9c2..d847bd5692 100644
--- a/default-configs/devices/riscv32-softmmu.mak
+++ b/default-configs/devices/riscv32-softmmu.mak
@@ -3,6 +3,8 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
+CONFIG_SEMIHOSTING=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
 #
diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
index 76b6195648..d5eec75f05 100644
--- a/default-configs/devices/riscv64-softmmu.mak
+++ b/default-configs/devices/riscv64-softmmu.mak
@@ -3,6 +3,8 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
+CONFIG_SEMIHOSTING=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
 #
diff --git a/default-configs/targets/riscv32-linux-user.mak b/default-configs/targets/riscv32-linux-user.mak
index dfb259e8aa..6a9d1b1bc1 100644
--- a/default-configs/targets/riscv32-linux-user.mak
+++ b/default-configs/targets/riscv32-linux-user.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=riscv32
 TARGET_BASE_ARCH=riscv
 TARGET_ABI_DIR=riscv
 TARGET_XML_FILES= gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-csr.xml gdb-xml/riscv-32bit-virtual.xml
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/default-configs/targets/riscv64-linux-user.mak b/default-configs/targets/riscv64-linux-user.mak
index b13895f3b0..0a92849a1b 100644
--- a/default-configs/targets/riscv64-linux-user.mak
+++ b/default-configs/targets/riscv64-linux-user.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=riscv64
 TARGET_BASE_ARCH=riscv
 TARGET_ABI_DIR=riscv
 TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-csr.xml gdb-xml/riscv-64bit-virtual.xml
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index f09deff4d3..f0cf5f10f5 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -1,6 +1,6 @@
 /*
  *  Semihosting support for systems modeled on the Arm "Angel"
- *  semihosting syscalls design.
+ *  semihosting syscalls design. This includes Arm and RISC-V processors
  *
  *  Copyright (c) 2005, 2007 CodeSourcery.
  *  Copyright (c) 2019 Linaro
@@ -25,6 +25,10 @@
  *  ARM Semihosting is documented in:
  *     Semihosting for AArch32 and AArch64 Release 2.0
  *     https://static.docs.arm.com/100863/0200/semihosting.pdf
+ *
+ *  RISC-V Semihosting is documented in:
+ *     RISC-V Semihosting
+ *     https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc
  */
 
 #include "qemu/osdep.h"
@@ -222,6 +226,42 @@ common_semi_rambase(CPUState *cs)
 
 #endif /* TARGET_ARM */
 
+#ifdef TARGET_RISCV
+static inline target_ulong
+common_semi_arg(CPUState *cs, int argno)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    return env->gpr[xA0 + argno];
+}
+
+static inline void
+common_semi_set_ret(CPUState *cs, target_ulong ret)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    env->gpr[xA0] = ret;
+}
+
+static inline bool
+common_semi_sys_exit_extended(CPUState *cs, int nr)
+{
+    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
+}
+
+#ifndef CONFIG_USER_ONLY
+
+static inline target_ulong
+common_semi_rambase(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    return common_semi_find_region_base(env->gpr[xSP]);
+}
+#endif
+
+#endif
+
 /*
  * Allocate a new guest file descriptor and return it; if we
  * couldn't allocate a new fd then return -1.
@@ -398,6 +438,12 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
         sp = env->regs[13];
     }
 #endif
+#ifdef TARGET_RISCV
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
+    sp = env->gpr[xSP];
+#endif
 
     return sp - 64;
 }
@@ -741,6 +787,37 @@ static const GuestFDFunctions guestfd_fns[] = {
      put_user_u32(val, args + (n) * 4))
 #endif
 
+#ifdef TARGET_RISCV
+
+/*
+ * get_user_ual is defined as get_user_u32 in softmmu-semi.h,
+ * we need a macro that fetches a target_ulong
+ */
+#define get_user_utl(arg, p)                    \
+    ((sizeof(target_ulong) == 8) ?              \
+     get_user_u64(arg, p) :                     \
+     get_user_u32(arg, p))
+
+/*
+ * put_user_ual is defined as put_user_u32 in softmmu-semi.h,
+ * we need a macro that stores a target_ulong
+ */
+#define put_user_utl(arg, p)                    \
+    ((sizeof(target_ulong) == 8) ?              \
+     put_user_u64(arg, p) :                     \
+     put_user_u32(arg, p))
+
+#define GET_ARG(n) do {                                                 \
+        if (get_user_utl(arg ## n, args + (n) * sizeof(target_ulong))) { \
+            errno = EFAULT;                                             \
+            return set_swi_errno(cs, -1);                              \
+        }                                                               \
+    } while (0)
+
+#define SET_ARG(n, val)                                 \
+    put_user_utl(val, args + (n) * sizeof(target_ulong))
+#endif
+
 /*
  * Do a semihosting call.
  *
@@ -1179,6 +1256,9 @@ target_ulong do_common_semihosting(CPUState *cs)
         if (is_a64(cs->env_ptr)) {
             return 0;
         }
+#endif
+#ifdef TARGET_RISCV
+        return 0;
 #endif
         /* fall through -- invalid for A32/T32 */
     default:
diff --git a/hw/semihosting/common-semi.h b/hw/semihosting/common-semi.h
index bc53e92c79..0bfab1c669 100644
--- a/hw/semihosting/common-semi.h
+++ b/hw/semihosting/common-semi.h
@@ -1,6 +1,6 @@
 /*
  *  Semihosting support for systems modeled on the Arm "Angel"
- *  semihosting syscalls design.
+ *  semihosting syscalls design. This includes Arm and RISC-V processors
  *
  *  Copyright (c) 2005, 2007 CodeSourcery.
  *  Copyright (c) 2019 Linaro
@@ -26,6 +26,9 @@
  *     Semihosting for AArch32 and AArch64 Release 2.0
  *     https://static.docs.arm.com/100863/0200/semihosting.pdf
  *
+ *  RISC-V Semihosting is documented in:
+ *     RISC-V Semihosting
+ *     https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc
  */
 
 #ifndef COMMON_SEMI_H
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 534753ca12..17aa992165 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -109,6 +109,8 @@ typedef struct TaskState {
     /* FPA state */
     FPA11 fpa;
 # endif
+#endif
+#if defined(TARGET_ARM) || defined(TARGET_RISCV)
     int swi_errno;
 #endif
 #if defined(TARGET_I386) && !defined(TARGET_X86_64)
@@ -122,7 +124,7 @@ typedef struct TaskState {
 #ifdef TARGET_M68K
     abi_ulong tp_value;
 #endif
-#if defined(TARGET_ARM) || defined(TARGET_M68K)
+#if defined(TARGET_ARM) || defined(TARGET_M68K) || defined(TARGET_RISCV)
     /* Extra fields for semihosted binaries.  */
     abi_ulong heap_base;
     abi_ulong heap_limit;
diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index a1f0f6050e..c0015ee7f6 100644
--- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -1,11 +1,11 @@
 /*
- * ARM Semihosting Console Support
+ * ARM Compatible Semihosting Console Support.
  *
  * Copyright (c) 2019 Linaro Ltd
  *
- * Currently ARM is unique in having support for semihosting support
- * in linux-user. So for now we implement the common console API but
- * just for arm linux-user.
+ * Currently ARM and RISC-V are unique in having support for
+ * semihosting support in linux-user. So for now we implement the
+ * common console API but just for arm and risc-v linux-user.
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
diff --git a/qemu-options.hx b/qemu-options.hx
index e60ad42976..329e7597ed 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4186,10 +4186,10 @@ ERST
 DEF("semihosting", 0, QEMU_OPTION_semihosting,
     "-semihosting    semihosting mode\n",
     QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
-    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
+    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting``
-    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
+    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V only).
 
     Note that this allows guest direct access to the host filesystem, so
     should only be used with a trusted guest OS.
@@ -4201,10 +4201,10 @@ DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
     "-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]\n" \
     "                semihosting configuration\n",
 QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
-QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
+QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]``
-    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II
+    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V
     only).
 
     Note that this allows guest direct access to the host filesystem, so
@@ -4219,6 +4219,8 @@ SRST
     open/read/write/seek/select. Tensilica baremetal libc for ISS and
     linux platform "sim" use this interface.
 
+    On RISC-V this implements the standard semihosting API, version 0.2.
+
     ``target=native|gdb|auto``
         Defines where the semihosting calls will be addressed, to QEMU
         (``native``) or to GDB (``gdb``). The default is ``auto``, which
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 24b24c69c5..f0d3d1c07e 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -544,6 +544,7 @@
 #define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10.0 */
 #define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10.0 */
 #define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10.0 */
+#define RISCV_EXCP_SEMIHOST                      0x10
 #define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
 #define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
 #define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a2787b1d48..e730fd1fe9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
+#include "hw/semihosting/common-semi.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -844,6 +845,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong htval = 0;
     target_ulong mtval2 = 0;
 
+    if  (cause == RISCV_EXCP_SEMIHOST) {
+        if (env->priv >= PRV_S) {
+            env->gpr[xA0] = do_common_semihosting(cs);
+            env->pc += 4;
+            return;
+        }
+        cause = RISCV_EXCP_BREAKPOINT;
+    }
+
     if (!async) {
         /* set tval to badaddr for traps with address information */
         switch (cause) {
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 2a61a853bf..32312be202 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -29,7 +29,42 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
 
 static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
 {
-    generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
+    target_ulong    ebreak_addr = ctx->base.pc_next;
+    target_ulong    pre_addr = ebreak_addr - 4;
+    target_ulong    post_addr = ebreak_addr + 4;
+    uint32_t pre    = 0;
+    uint32_t ebreak = 0;
+    uint32_t post   = 0;
+
+    /*
+     * The RISC-V semihosting spec specifies the following
+     * three-instruction sequence to flag a semihosting call:
+     *
+     *      slli zero, zero, 0x1f       0x01f01013
+     *      ebreak                      0x00100073
+     *      srai zero, zero, 0x7        0x40705013
+     *
+     * The two shift operations on the zero register are no-ops, used
+     * here to signify a semihosting exception, rather than a breakpoint.
+     *
+     * Uncompressed instructions are required so that the sequence is easy
+     * to validate.
+     *
+     * The three instructions are required to lie in the same page so
+     * that no exception will be raised when fetching them.
+     */
+
+    if ((pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
+        pre    = opcode_at(&ctx->base, pre_addr);
+        ebreak = opcode_at(&ctx->base, ebreak_addr);
+        post   = opcode_at(&ctx->base, post_addr);
+    }
+
+    if  (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
+        generate_exception(ctx, RISCV_EXCP_SEMIHOST);
+    } else {
+        generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
+    }
     exit_tb(ctx); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 554d52a4be..0f28b5f41e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -64,6 +64,7 @@ typedef struct DisasContext {
     uint16_t vlen;
     uint16_t mlen;
     bool vl_eq_vlmax;
+    CPUState *cs;
 } DisasContext;
 
 #ifdef TARGET_RISCV64
@@ -747,6 +748,15 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    CPUState *cpu = ctx->cs;
+    CPURISCVState *env = cpu->env_ptr;
+
+    return cpu_ldl_code(env, pc);
+}
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.c.inc"
 #include "insn_trans/trans_rvm.c.inc"
@@ -814,6 +824,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->cs = cs;
 }
 
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
-- 
2.29.2


