Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcyvz-0001hk-Cw
	for mharc-qemu-riscv@gnu.org; Wed, 11 Nov 2020 17:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kcyvx-0001gt-Fi; Wed, 11 Nov 2020 17:49:45 -0500
Received: from home.keithp.com ([63.227.221.253]:50240 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>)
 id 1kcyvt-0005dG-DA; Wed, 11 Nov 2020 17:49:45 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 12B283F2E04D;
 Wed, 11 Nov 2020 14:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1605134976; bh=yEqx+6PkInNzdb/pkDc12hAhZkR1U6xtJIKlXFdfzLs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Q0xHkrW6B/7g8UCgwduT4AWhsBrzwnVn6qZS8sqPfWdpuUkoCmMZDog0c0PAmLKyL
 gvwd8R6uYPpE/sUZ47ufju6R0ylp1x9iFNzbJGDJRJQdZ4X7b1h+wqMidz2OwSn8wE
 ka3bJSkWapEpT50JEv+hahmgkxHCLSPAR9HfloEG6/y8yukkrNeVezH2kgqrExYeqm
 doNDvN+o/dU72aqe+t2g9X2oJd4a2XgXAGJLRlu0r/XMpssuztd39+NzCkI8Bn3AEo
 5yZeEUO683J7n/JHH9X1+kE3u3DkEtSM+ekg3H0WQyneB5o79tDbpmhyg8iwsztydP
 Mn635gRGrlqSA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id Z-j8PusPKWmP; Wed, 11 Nov 2020 14:49:35 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 50FAB3F2DFFB;
 Wed, 11 Nov 2020 14:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1605134975; bh=yEqx+6PkInNzdb/pkDc12hAhZkR1U6xtJIKlXFdfzLs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=I9DH/zA2LA+GsPG0psI5qf3R0kMuRiXT58596Bq0QCjTlo9DLKt1iOGoMeJH2hXmb
 /tEWQ1RhgCPlemCKy9gTUtOeSi4aty7eVCwiPGB5vTp9IUWjk0gqfCt0FYOSGxWb+P
 xjx+cVYXie3AD/s/Da9ZHBEmimKJG42SP18Kh+mVWcc+IGfS+GFMS+qYLN5ErBuxqP
 4UCMLgTfE4VCIqZftvwGGcUw1i0iSWF1HQlsdvNvms+55Q4W6L5hKaGBqGnLPUR340
 eXmp4znAvtYuJaNM39J1/F53YoyAQY15rQzi3z5FpV0lkpdm+SEZxtljHQb+6Mvf05
 l/Qu4o6mTfRkQ==
Received: by keithp.com (Postfix, from userid 1000)
 id 2B2501582210; Wed, 11 Nov 2020 14:49:35 -0800 (PST)
From: "Keith Packard" <keithp@keithp.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>, Peter
 Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 4/4] riscv: Add semihosting support [v11]
In-Reply-To: <CAKmqyKPGLzEdj_GyQstPD1qUz_zRtAeXCc=pj4CjmxDn3UcTyg@mail.gmail.com>
References: <20201028185722.2783532-1-keithp@keithp.com>
 <20201028185722.2783532-5-keithp@keithp.com>
 <CAKmqyKPGLzEdj_GyQstPD1qUz_zRtAeXCc=pj4CjmxDn3UcTyg@mail.gmail.com>
Date: Wed, 11 Nov 2020 14:49:34 -0800
Message-ID: <878sb7h5kx.fsf@keithp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="==-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 17:49:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
X-List-Received-Date: Wed, 11 Nov 2020 22:49:46 -0000

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain

Alistair Francis <alistair23@gmail.com> writes:

>> +    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 0);
>
> How would sizeof(target_ulong) == 0 ?

Oops. This is supposed to be 8, not 0. And those look very similar on
the screen. I caught this myself a couple of weeks ago but forgot to
send out a new version here. Sorry!


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline;
 filename=0004-riscv-Add-semihosting-support-v12.patch
Content-Transfer-Encoding: quoted-printable

From=20a6cb1a52a6c2404a9bdc22bb5e00bccb65ab0730 Mon Sep 17 00:00:00 2001
From: Keith Packard <keithp@keithp.com>
Date: Mon, 26 Oct 2020 12:20:01 -0700
Subject: [PATCH 4/4] riscv: Add semihosting support [v12]

Adapt the arm semihosting support code for RISCV. This implementation
is based on the standard for RISC-V semihosting version 0.2 as
documented in

   https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2

Signed-off-by: Keith Packard <keithp@keithp.com>

=2D--

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
=2D--
 default-configs/devices/riscv32-softmmu.mak   |  2 +
 default-configs/devices/riscv64-softmmu.mak   |  2 +
 .../targets/riscv32-linux-user.mak            |  1 +
 .../targets/riscv64-linux-user.mak            |  1 +
 hw/semihosting/common-semi.c                  | 51 ++++++++++++++++++-
 hw/semihosting/common-semi.h                  |  5 +-
 linux-user/qemu.h                             |  4 +-
 linux-user/semihost.c                         |  8 +--
 qemu-options.hx                               | 10 ++--
 target/riscv/cpu_bits.h                       |  1 +
 target/riscv/cpu_helper.c                     | 10 ++++
 .../riscv/insn_trans/trans_privileged.c.inc   | 37 +++++++++++++-
 target/riscv/translate.c                      | 11 ++++
 13 files changed, 131 insertions(+), 12 deletions(-)

diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/=
devices/riscv32-softmmu.mak
index 94a236c9c2..d847bd5692 100644
=2D-- a/default-configs/devices/riscv32-softmmu.mak
+++ b/default-configs/devices/riscv32-softmmu.mak
@@ -3,6 +3,8 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=3Dn
+CONFIG_SEMIHOSTING=3Dy
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
=20
 # Boards:
 #
diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/=
devices/riscv64-softmmu.mak
index 76b6195648..d5eec75f05 100644
=2D-- a/default-configs/devices/riscv64-softmmu.mak
+++ b/default-configs/devices/riscv64-softmmu.mak
@@ -3,6 +3,8 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=3Dn
+CONFIG_SEMIHOSTING=3Dy
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
=20
 # Boards:
 #
diff --git a/default-configs/targets/riscv32-linux-user.mak b/default-confi=
gs/targets/riscv32-linux-user.mak
index dfb259e8aa..6a9d1b1bc1 100644
=2D-- a/default-configs/targets/riscv32-linux-user.mak
+++ b/default-configs/targets/riscv32-linux-user.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=3Driscv32
 TARGET_BASE_ARCH=3Driscv
 TARGET_ABI_DIR=3Driscv
 TARGET_XML_FILES=3D gdb-xml/riscv-32bit-cpu.xml gdb-xml/riscv-32bit-fpu.xm=
l gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-32bit-csr.xml gdb-xml/riscv-32b=
it-virtual.xml
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
diff --git a/default-configs/targets/riscv64-linux-user.mak b/default-confi=
gs/targets/riscv64-linux-user.mak
index b13895f3b0..0a92849a1b 100644
=2D-- a/default-configs/targets/riscv64-linux-user.mak
+++ b/default-configs/targets/riscv64-linux-user.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=3Driscv64
 TARGET_BASE_ARCH=3Driscv
 TARGET_ABI_DIR=3Driscv
 TARGET_XML_FILES=3D gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xm=
l gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-csr.xml gdb-xml/riscv-64b=
it-virtual.xml
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index c77fb21bec..f8c5d04732 100644
=2D-- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -1,6 +1,6 @@
 /*
  *  Semihosting support for systems modeled on the Arm "Angel"
=2D *  semihosting syscalls design.
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
+ *     https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-sem=
ihosting-spec.adoc
  */
=20
 #include "qemu/osdep.h"
@@ -163,6 +167,30 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
 }
 #endif /* TARGET_ARM */
=20
+#ifdef TARGET_RISCV
+static inline target_ulong
+common_semi_arg(CPUState *cs, int argno)
+{
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+    CPURISCVState *env =3D &cpu->env;
+    return env->gpr[xA0 + argno];
+}
+
+static inline void
+common_semi_set_ret(CPUState *cs, target_ulong ret)
+{
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+    CPURISCVState *env =3D &cpu->env;
+    env->gpr[xA0] =3D ret;
+}
+
+static inline bool
+common_semi_sys_exit_extended(CPUState *cs, int nr)
+{
+    return (nr =3D=3D TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) =3D=
=3D 8);
+}
+#endif
+
 /*
  * Allocate a new guest file descriptor and return it; if we
  * couldn't allocate a new fd then return -1.
@@ -339,6 +367,12 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
         sp =3D env->regs[13];
     }
 #endif
+#ifdef TARGET_RISCV
+    RISCVCPU *cpu =3D RISCV_CPU(cs);
+    CPURISCVState *env =3D &cpu->env;
+
+    sp =3D env->gpr[xSP];
+#endif
=20
     return sp - 64;
 }
@@ -678,6 +712,18 @@ static const GuestFDFunctions guestfd_fns[] =3D {
      put_user_u32(val, args + (n) * 4))
 #endif
=20
+#ifdef TARGET_RISCV
+#define GET_ARG(n) do {                                                 \
+        if (get_user_ual(arg ## n, args + (n) * sizeof(target_ulong))) { \
+            errno =3D EFAULT;                                             \
+            return set_swi_errno(cs, -1);                              \
+        }                                                               \
+    } while (0)
+
+#define SET_ARG(n, val)                                 \
+    put_user_ual(val, args + (n) * sizeof(target_ulong))
+#endif
+
 /*
  * Do a semihosting call.
  *
@@ -1112,6 +1158,9 @@ target_ulong do_common_semihosting(CPUState *cs)
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
=2D-- a/hw/semihosting/common-semi.h
+++ b/hw/semihosting/common-semi.h
@@ -1,6 +1,6 @@
 /*
  *  Semihosting support for systems modeled on the Arm "Angel"
=2D *  semihosting syscalls design.
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
+ *     https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-sem=
ihosting-spec.adoc
  */
=20
 #ifndef COMMON_SEMI_H
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 534753ca12..17aa992165 100644
=2D-- a/linux-user/qemu.h
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
=2D#if defined(TARGET_ARM) || defined(TARGET_M68K)
+#if defined(TARGET_ARM) || defined(TARGET_M68K) || defined(TARGET_RISCV)
     /* Extra fields for semihosted binaries.  */
     abi_ulong heap_base;
     abi_ulong heap_limit;
diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index a1f0f6050e..c0015ee7f6 100644
=2D-- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -1,11 +1,11 @@
 /*
=2D * ARM Semihosting Console Support
+ * ARM Compatible Semihosting Console Support.
  *
  * Copyright (c) 2019 Linaro Ltd
  *
=2D * Currently ARM is unique in having support for semihosting support
=2D * in linux-user. So for now we implement the common console API but
=2D * just for arm linux-user.
+ * Currently ARM and RISC-V are unique in having support for
+ * semihosting support in linux-user. So for now we implement the
+ * common console API but just for arm and risc-v linux-user.
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
diff --git a/qemu-options.hx b/qemu-options.hx
index 2c83390504..9a606946c4 100644
=2D-- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4184,10 +4184,10 @@ ERST
 DEF("semihosting", 0, QEMU_OPTION_semihosting,
     "-semihosting    semihosting mode\n",
     QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
=2D    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
+    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting``
=2D    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
+    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V only=
).
=20
     Note that this allows guest direct access to the host filesystem, so
     should only be used with a trusted guest OS.
@@ -4199,10 +4199,10 @@ DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semi=
hosting_config,
     "-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,cha=
rdev=3Did][,arg=3Dstr[,...]]\n" \
     "                semihosting configuration\n",
 QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
=2DQEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
+QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting-config [enable=3Don|off][,target=3Dnative|gdb|auto][,charde=
v=3Did][,arg=3Dstr[,...]]``
=2D    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II
+    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RI=
SC-V
     only).
=20
     Note that this allows guest direct access to the host filesystem, so
@@ -4217,6 +4217,8 @@ SRST
     open/read/write/seek/select. Tensilica baremetal libc for ISS and
     linux platform "sim" use this interface.
=20
+    On RISC-V this implements the standard semihosting API, version 0.2.
+
     ``target=3Dnative|gdb|auto``
         Defines where the semihosting calls will be addressed, to QEMU
         (``native``) or to GDB (``gdb``). The default is ``auto``, which
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index daedad8691..6bd7bcb26d 100644
=2D-- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -545,6 +545,7 @@
 #define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10.0=
 */
 #define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10.0=
 */
 #define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10.0=
 */
+#define RISCV_EXCP_SEMIHOST                      0x10
 #define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
 #define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
 #define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 3eb3a034db..aa8e9ac9e4 100644
=2D-- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
+#include "hw/semihosting/common-semi.h"
=20
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -862,6 +863,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong htval =3D 0;
     target_ulong mtval2 =3D 0;
=20
+    if  (cause =3D=3D RISCV_EXCP_SEMIHOST) {
+        if (env->priv >=3D PRV_S) {
+            env->gpr[xA0] =3D do_common_semihosting(cs);
+            env->pc +=3D 4;
+            return;
+        }
+        cause =3D RISCV_EXCP_BREAKPOINT;
+    }
+
     if (!async) {
         /* set tval to badaddr for traps with address information */
         switch (cause) {
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/=
insn_trans/trans_privileged.c.inc
index 2a61a853bf..32312be202 100644
=2D-- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -29,7 +29,42 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
=20
 static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
 {
=2D    generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
+    target_ulong    ebreak_addr =3D ctx->base.pc_next;
+    target_ulong    pre_addr =3D ebreak_addr - 4;
+    target_ulong    post_addr =3D ebreak_addr + 4;
+    uint32_t pre    =3D 0;
+    uint32_t ebreak =3D 0;
+    uint32_t post   =3D 0;
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
+    if ((pre_addr & TARGET_PAGE_MASK) =3D=3D (post_addr & TARGET_PAGE_MASK=
)) {
+        pre    =3D opcode_at(&ctx->base, pre_addr);
+        ebreak =3D opcode_at(&ctx->base, ebreak_addr);
+        post   =3D opcode_at(&ctx->base, post_addr);
+    }
+
+    if  (pre =3D=3D 0x01f01013 && ebreak =3D=3D 0x00100073 && post =3D=3D =
0x40705013) {
+        generate_exception(ctx, RISCV_EXCP_SEMIHOST);
+    } else {
+        generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
+    }
     exit_tb(ctx); /* no chaining */
     ctx->base.is_jmp =3D DISAS_NORETURN;
     return true;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 79dca2291b..ecf594babc 100644
=2D-- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -63,6 +63,7 @@ typedef struct DisasContext {
     uint16_t vlen;
     uint16_t mlen;
     bool vl_eq_vlmax;
+    CPUState *cs;
 } DisasContext;
=20
 #ifdef TARGET_RISCV64
@@ -746,6 +747,15 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
     return true;
 }
=20
+static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
+{
+    DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
+    CPUState *cpu =3D ctx->cs;
+    CPURISCVState *env =3D cpu->env_ptr;
+
+    return cpu_ldl_code(env, pc);
+}
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.c.inc"
 #include "insn_trans/trans_rvm.c.inc"
@@ -812,6 +822,7 @@ static void riscv_tr_init_disas_context(DisasContextBas=
e *dcbase, CPUState *cs)
     ctx->lmul =3D FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen =3D 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->cs =3D cs;
 }
=20
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
=2D-=20
2.29.1


--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


=2D-=20
=2Dkeith

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAl+san4ACgkQ2yIaaQAA
ABFQwQ/+P3vLkZG54osJmuotjTj4E2kH2y2xyDP+GB40i27CZygDt5nQKgpveD+/
ZGnj9evY/JGGBZhlUoCRQWW8IvQH2osKfr01W+j//i60CHcJSQJYacezMbpmASuk
DkVndkcm8OaygewvqIFBVyJ4Rn8pX2XF/EbTyFptLTKZQP2zhUdQOJuOOXPg1Hne
JC5IiqmF0F7lyAEmk8IQRQjUO/m+xkwJjDdF3w98bqMPS49Gqp+zhpaR/ZngSKwQ
09Ua5MaBytG8e+6JTxQv+2N8l4BsZCqhDa8sNZCCubi7MHox8jbs5vf3ixG93MoG
VLQP0sWiU4TreXSVEQJpl8XoDpCV6P247p4JlHHUl0IMnTckRxaNM5jqrrF14f2F
7gGtH7uZslDKpuMAPSTYw4L/rAKHnTZyfZn9jtYD03fk8P7k/RMuBj+POOz85Mu+
ksl0JfMGq2xRklw+RiDdE73NZ7CAZ1zWGV+axi6dARne0dvrzPXyAEx3Q0p/yzHm
14rRfg9C2Fa2Li0GhSg1sA2FWs0uE7Jtxqh5K7LnuGn9Vi6IxrbJULSYYwKrtRuX
YdpwbvTh9GaTKt43nFLSowqL3ZNppFs9f0UD4TGthUwNIMGWwAaStxt2k+7tuPlv
v8KTiRuefYr0vFSdvwssoCFh2nJe045mpB79q3SfsxBf4uYYWVE=
=i5Wj
-----END PGP SIGNATURE-----
--==-=-=--

