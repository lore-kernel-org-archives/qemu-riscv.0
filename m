Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kxYrQ-0000uM-IC
	for mharc-qemu-riscv@gnu.org; Thu, 07 Jan 2021 12:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@vr.keithp.com>)
 id 1kxYrD-0000pH-K7; Thu, 07 Jan 2021 12:13:56 -0500
Received: from home.keithp.com ([63.227.221.253]:55576 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@vr.keithp.com>)
 id 1kxYrB-0001cd-4k; Thu, 07 Jan 2021 12:13:55 -0500
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id CD0D83F2E3BD;
 Thu,  7 Jan 2021 09:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1610039245; bh=YnhUQZaG9di3JTUB6ONQsQkxSeXtwlkHPePjWsx+onM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KyOwmarEUyaMuxwJVRUOqjGHC5o0n42ZE6ZQk7wgZv5VnR2uf0zkDsgRnyaHxMfXH
 G1LqhuQ9MiOEDN/di17YKrXphm7EhSH/ihkQdSUEw1DBYT7FGUPvE2zhjvZoZx9Gze
 QNhVhJKaAsTwAjRx8jzNp/pyi6RRGUadfd7ZfDOgy/IuznQBX39c5vuF0ocE2AcOqJ
 ThnwTBlzVXkdURZ/xxUpDHeG7uRXVQ4jkgsHeUp9nQfDN5JIIFdHJIMtZHlbERk411
 UJqwEtBjG2PFJSe4I57e0AeAkwitDgMnq5SgocuHzDQECdN/ZkmYRooXo531V1XkTC
 2k3LFfx1QGP+g==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id VcT8lqcTjnrJ; Thu,  7 Jan 2021 09:07:24 -0800 (PST)
Received: from vr.keithp.com (vr.keithp.com [10.0.0.39])
 by elaine.keithp.com (Postfix) with ESMTP id E0E2D3F2E315;
 Thu,  7 Jan 2021 09:07:23 -0800 (PST)
Received: by vr.keithp.com (Postfix, from userid 1000)
 id 8C44F742C69; Thu,  7 Jan 2021 09:07:23 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Keith Packard <keithp@keithp.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/9] semihosting: Move ARM semihosting code to shared
 directories
Date: Thu,  7 Jan 2021 09:07:09 -0800
Message-Id: <20210107170717.2098982-2-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107170717.2098982-1-keithp@keithp.com>
References: <20210107170717.2098982-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=63.227.221.253; envelope-from=keithp@vr.keithp.com;
 helo=elaine.keithp.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 07 Jan 2021 17:14:03 -0000

This commit renames two files which provide ARM semihosting support so
that they can be shared by other architectures:

 1. target/arm/arm-semi.c     -> hw/semihosting/common-semi.c
 2. linux-user/arm/semihost.c -> linux-user/semihost.c

The build system was modified use a new config variable,
CONFIG_ARM_COMPATIBLE_SEMIHOSTING, which has been added to the ARM
softmmu and linux-user default configs. The contents of the source
files has not been changed in this patch.

Signed-off-by: Keith Packard <keithp@keithp.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

----

v2
	Place common-semi.c name in arm_ss, just as arm-semi.c was

v3
	Create CONFIG_ARM_COMPATIBLE_SEMIHOSTING and assign in
	arm config files

v4
	Also update aarch64_be default config

v5
	Also update armeb default config
---
 default-configs/devices/arm-softmmu.mak               | 1 +
 default-configs/targets/aarch64-linux-user.mak        | 1 +
 default-configs/targets/aarch64_be-linux-user.mak     | 1 +
 default-configs/targets/arm-linux-user.mak            | 1 +
 default-configs/targets/armeb-linux-user.mak          | 1 +
 hw/semihosting/Kconfig                                | 3 +++
 target/arm/arm-semi.c => hw/semihosting/common-semi.c | 0
 hw/semihosting/meson.build                            | 3 +++
 linux-user/arm/meson.build                            | 3 ---
 linux-user/meson.build                                | 1 +
 linux-user/{arm => }/semihost.c                       | 0
 target/arm/meson.build                                | 2 --
 12 files changed, 12 insertions(+), 5 deletions(-)
 rename target/arm/arm-semi.c => hw/semihosting/common-semi.c (100%)
 rename linux-user/{arm => }/semihost.c (100%)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 08a32123b4..0500156a0c 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -42,4 +42,5 @@ CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
 CONFIG_SEMIHOSTING=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
diff --git a/default-configs/targets/aarch64-linux-user.mak b/default-configs/targets/aarch64-linux-user.mak
index 163c9209f4..4713253709 100644
--- a/default-configs/targets/aarch64-linux-user.mak
+++ b/default-configs/targets/aarch64-linux-user.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_HAS_BFLT=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/default-configs/targets/aarch64_be-linux-user.mak b/default-configs/targets/aarch64_be-linux-user.mak
index 4c953cf8c5..fae831558d 100644
--- a/default-configs/targets/aarch64_be-linux-user.mak
+++ b/default-configs/targets/aarch64_be-linux-user.mak
@@ -3,3 +3,4 @@ TARGET_BASE_ARCH=arm
 TARGET_WORDS_BIGENDIAN=y
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_HAS_BFLT=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/default-configs/targets/arm-linux-user.mak b/default-configs/targets/arm-linux-user.mak
index c7cd872e86..e741ffd4d3 100644
--- a/default-configs/targets/arm-linux-user.mak
+++ b/default-configs/targets/arm-linux-user.mak
@@ -3,3 +3,4 @@ TARGET_SYSTBL_ABI=common,oabi
 TARGET_SYSTBL=syscall.tbl
 TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_HAS_BFLT=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/default-configs/targets/armeb-linux-user.mak b/default-configs/targets/armeb-linux-user.mak
index 79bf10e99b..255e44e8b0 100644
--- a/default-configs/targets/armeb-linux-user.mak
+++ b/default-configs/targets/armeb-linux-user.mak
@@ -4,3 +4,4 @@ TARGET_SYSTBL=syscall.tbl
 TARGET_WORDS_BIGENDIAN=y
 TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_HAS_BFLT=y
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/hw/semihosting/Kconfig b/hw/semihosting/Kconfig
index efe0a30734..4c30dc6b16 100644
--- a/hw/semihosting/Kconfig
+++ b/hw/semihosting/Kconfig
@@ -1,3 +1,6 @@
 
 config SEMIHOSTING
        bool
+
+config ARM_COMPATIBLE_SEMIHOSTING
+       bool
diff --git a/target/arm/arm-semi.c b/hw/semihosting/common-semi.c
similarity index 100%
rename from target/arm/arm-semi.c
rename to hw/semihosting/common-semi.c
diff --git a/hw/semihosting/meson.build b/hw/semihosting/meson.build
index f40ac574c4..5b4a170270 100644
--- a/hw/semihosting/meson.build
+++ b/hw/semihosting/meson.build
@@ -2,3 +2,6 @@ specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
   'config.c',
   'console.c',
 ))
+
+specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING'],
+		if_true: files('common-semi.c'))
diff --git a/linux-user/arm/meson.build b/linux-user/arm/meson.build
index 432984b58e..5a93c925cf 100644
--- a/linux-user/arm/meson.build
+++ b/linux-user/arm/meson.build
@@ -1,6 +1,3 @@
-linux_user_ss.add(when: 'TARGET_AARCH64', if_true: files('semihost.c'))
-linux_user_ss.add(when: 'TARGET_ARM', if_true: files('semihost.c'))
-
 subdir('nwfpe')
 
 syscall_nr_generators += {
diff --git a/linux-user/meson.build b/linux-user/meson.build
index 2b94e4ba24..7fe28d659e 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -16,6 +16,7 @@ linux_user_ss.add(rt)
 
 linux_user_ss.add(when: 'TARGET_HAS_BFLT', if_true: files('flatload.c'))
 linux_user_ss.add(when: 'TARGET_I386', if_true: files('vm86.c'))
+linux_user_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING', if_true: files('semihost.c'))
 
 
 syscall_nr_generators = {}
diff --git a/linux-user/arm/semihost.c b/linux-user/semihost.c
similarity index 100%
rename from linux-user/arm/semihost.c
rename to linux-user/semihost.c
diff --git a/target/arm/meson.build b/target/arm/meson.build
index f5de2a77b8..15b936c101 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -32,8 +32,6 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_TCG', if_true: files('arm-semi.c'))
-
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
-- 
2.29.2


