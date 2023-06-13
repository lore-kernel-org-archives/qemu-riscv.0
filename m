Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0253EB64DB
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 13:37:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q94CV-00036m-JR; Tue, 13 Jun 2023 09:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94CR-0002dn-78
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 09:36:43 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94CI-0002nY-4s
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 09:36:42 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so809125566b.2
 for <qemu-riscv@nongnu.org>; Tue, 13 Jun 2023 06:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686663391; x=1689255391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qriCbC+zPISNYNmF1P2K89QLF065+t8u5aEWc7KcuHg=;
 b=kHJ4bt8uzF+Wsmu2Xi+upGNkTFTN3bC7nbBAfwdUFkt3AC/py9aDQYD6DvYNeRaJ4Q
 OvwClCjocLKIJ3ZkG1ujHSjCOf9z/w6X8xPWITOHf8/RthofWFXYqVdi1WqwmejVHsMD
 VN80uPy4oOcWQMNDldEN43+mTPwaen3GEFgvnmQHbfPr96cOVme5N16csE/wHBgAPk2N
 MQv1/d51F0pnzMgAlwI5+PXzZtPelq0nooRbePvGGI3JBkFPuoHTmr6W9+C12nYP5oQE
 C7j2RyAoAAVXK+U0qumj4uglZLbBJJF6BooCQ6Wy1VWbv2HCGJKr2ax7fnHnTQcb2NLc
 l9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686663391; x=1689255391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qriCbC+zPISNYNmF1P2K89QLF065+t8u5aEWc7KcuHg=;
 b=gW2oGwKUslKD0KSrkJ+Jh2OsWw+1j3f2uLikpsN/Bi573h4wNL9ONqsqTpxfEouZ8T
 LIby1Xgc2+83opJumw57iC/tGMy8KIjAhXTjVVL1GYmYSfavF1PNLasiQEnI4/glHZU7
 t2S3/7fztSq9Yirg8ntEfl5z0bSPcOStUTwqHBgah06iO+vhRvCmtro+3Lkwz02t0txU
 nC9X+Vq9zgbZSlfqqdHdxVZLHIGr4N/IVPbzj6RNdGIL4FHlPWxLtlbuBON96baRUCU8
 rZRcCGwieZ6OXE9F3oN6gfUqS4bVmMDBGNqW9+8eHgIKJXtGixIyHvE1VNFoiRa4Juuv
 7Y4A==
X-Gm-Message-State: AC+VfDwM8Y+avuQ7woPB02swpaHU0QXLJ/uyQgXjz8W8ykjckj9cvk0w
 5hXhcW9vMOw3OcBNrfpCqwpUPg==
X-Google-Smtp-Source: ACHHUZ6h3s7dRbYZVbKMAHAIrDGS90StduLe0lQNu7b/27SmhLQa0gwCkej51C4RYii/80jL7g3qyQ==
X-Received: by 2002:a17:907:3688:b0:978:8d1b:3a24 with SMTP id
 bi8-20020a170907368800b009788d1b3a24mr12751544ejc.27.1686663390890; 
 Tue, 13 Jun 2023 06:36:30 -0700 (PDT)
Received: from localhost.localdomain ([213.235.133.109])
 by smtp.gmail.com with ESMTPSA id
 qw5-20020a170906fca500b0096f6e836fa0sm6641891ejb.27.2023.06.13.06.36.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Jun 2023 06:36:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 9/9] meson: Replace softmmu_ss -> system_ss
Date: Tue, 13 Jun 2023 15:33:47 +0200
Message-Id: <20230613133347.82210-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230613133347.82210-1-philmd@linaro.org>
References: <20230613133347.82210-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

We use the user_ss[] array to hold the user emulation sources,
and the softmmu_ss[] array to hold the system emulation ones.
Hold the latter in the 'system_ss[]' array for parity with user
emulation.

Mechanical change doing:

  $ sed -i -e s/softmmu_ss/system_ss/g $(git grep -l softmmu_ss)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/devel/build-system.rst        |  14 +--
 meson.build                        |  12 +--
 accel/meson.build                  |   4 +-
 audio/meson.build                  |   8 +-
 backends/meson.build               |  20 ++--
 backends/tpm/meson.build           |   8 +-
 block/meson.build                  |   6 +-
 block/monitor/meson.build          |   2 +-
 chardev/meson.build                |   2 +-
 disas/meson.build                  |   2 +-
 dump/meson.build                   |   2 +-
 ebpf/meson.build                   |   2 +-
 fsdev/meson.build                  |   4 +-
 gdbstub/meson.build                |  10 +-
 hw/9pfs/meson.build                |   2 +-
 hw/acpi/meson.build                |  10 +-
 hw/adc/meson.build                 |  10 +-
 hw/arm/meson.build                 |   8 +-
 hw/audio/meson.build               |  28 +++---
 hw/block/meson.build               |  28 +++---
 hw/char/meson.build                |  70 +++++++-------
 hw/core/meson.build                |  22 ++---
 hw/cpu/meson.build                 |   6 +-
 hw/cxl/meson.build                 |   4 +-
 hw/display/meson.build             |  76 +++++++--------
 hw/dma/meson.build                 |  32 +++----
 hw/gpio/meson.build                |  26 ++---
 hw/i2c/meson.build                 |   2 +-
 hw/ide/meson.build                 |  28 +++---
 hw/input/meson.build               |  32 +++----
 hw/intc/meson.build                |  44 ++++-----
 hw/ipack/meson.build               |   2 +-
 hw/ipmi/meson.build                |   2 +-
 hw/isa/meson.build                 |  18 ++--
 hw/mem/meson.build                 |   8 +-
 hw/misc/macio/meson.build          |   2 +-
 hw/misc/meson.build                | 148 ++++++++++++++---------------
 hw/net/can/meson.build             |  16 ++--
 hw/net/meson.build                 |  96 +++++++++----------
 hw/nubus/meson.build               |   2 +-
 hw/nvme/meson.build                |   2 +-
 hw/nvram/meson.build               |  26 ++---
 hw/pci-bridge/meson.build          |   4 +-
 hw/pci-host/meson.build            |   2 +-
 hw/pci/meson.build                 |   8 +-
 hw/pcmcia/meson.build              |   4 +-
 hw/rdma/meson.build                |   2 +-
 hw/remote/meson.build              |   2 +-
 hw/rtc/meson.build                 |  28 +++---
 hw/scsi/meson.build                |   2 +-
 hw/sd/meson.build                  |  24 ++---
 hw/sensor/meson.build              |  18 ++--
 hw/smbios/meson.build              |   6 +-
 hw/ssi/meson.build                 |  26 ++---
 hw/timer/meson.build               |  74 +++++++--------
 hw/tpm/meson.build                 |  14 +--
 hw/usb/meson.build                 |  74 +++++++--------
 hw/virtio/meson.build              |  12 +--
 hw/watchdog/meson.build            |  18 ++--
 hw/xen/meson.build                 |   4 +-
 migration/meson.build              |  10 +-
 monitor/meson.build                |   4 +-
 net/can/meson.build                |   2 +-
 net/meson.build                    |  38 ++++----
 qom/meson.build                    |   2 +-
 replay/meson.build                 |   2 +-
 softmmu/meson.build                |   8 +-
 stats/meson.build                  |   2 +-
 target/alpha/meson.build           |   6 +-
 target/arm/hvf/meson.build         |   2 +-
 target/arm/meson.build             |   6 +-
 target/arm/tcg/meson.build         |   2 +-
 target/avr/meson.build             |   6 +-
 target/cris/meson.build            |   6 +-
 target/hppa/meson.build            |   6 +-
 target/i386/hax/meson.build        |   6 +-
 target/i386/hvf/meson.build        |   2 +-
 target/i386/kvm/meson.build        |   4 +-
 target/i386/meson.build            |   8 +-
 target/i386/nvmm/meson.build       |   4 +-
 target/i386/tcg/sysemu/meson.build |   2 +-
 target/i386/whpx/meson.build       |   2 +-
 target/loongarch/meson.build       |   6 +-
 target/m68k/meson.build            |   6 +-
 target/microblaze/meson.build      |   6 +-
 target/mips/meson.build            |   4 +-
 target/mips/sysemu/meson.build     |   2 +-
 target/mips/tcg/sysemu/meson.build |   2 +-
 target/nios2/meson.build           |   6 +-
 target/openrisc/meson.build        |   6 +-
 target/ppc/meson.build             |  10 +-
 target/riscv/meson.build           |   6 +-
 target/s390x/kvm/meson.build       |   2 +-
 target/s390x/meson.build           |   6 +-
 target/sh4/meson.build             |   6 +-
 target/sparc/meson.build           |   6 +-
 target/tricore/meson.build         |   4 +-
 target/xtensa/meson.build          |   6 +-
 tcg/meson.build                    |   2 +-
 trace/meson.build                  |   2 +-
 ui/meson.build                     |  26 ++---
 101 files changed, 706 insertions(+), 706 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 551c5a5ac0..64efa26b90 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -183,9 +183,9 @@ Target-independent emulator sourcesets:
   This includes error handling infrastructure, standard data structures,
   platform portability wrapper functions, etc.
 
-  Target-independent code lives in the ``common_ss``, ``softmmu_ss`` and
+  Target-independent code lives in the ``common_ss``, ``system_ss`` and
   ``user_ss`` sourcesets.  ``common_ss`` is linked into all emulators,
-  ``softmmu_ss`` only in system emulators, ``user_ss`` only in user-mode
+  ``system_ss`` only in system emulators, ``user_ss`` only in user-mode
   emulators.
 
   Target-independent sourcesets must exercise particular care when using
@@ -197,11 +197,11 @@ Target-independent emulator sourcesets:
   symbol::
 
     # Some targets have CONFIG_ACPI, some don't, so this is not enough
-    softmmu_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi.c'),
+    system_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi.c'),
                                         if_false: files('acpi-stub.c'))
 
     # This is required as well:
-    softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c'))
+    system_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c'))
 
 Target-dependent emulator sourcesets:
   In the target-dependent set lives CPU emulation, some device emulation and
@@ -229,16 +229,16 @@ Target-dependent emulator sourcesets:
   for all emulators and for system emulators only.  For example::
 
     arm_ss = ss.source_set()
-    arm_softmmu_ss = ss.source_set()
+    arm_system_ss = ss.source_set()
     ...
     target_arch += {'arm': arm_ss}
-    target_softmmu_arch += {'arm': arm_softmmu_ss}
+    target_softmmu_arch += {'arm': arm_system_ss}
 
 Module sourcesets:
   There are two dictionaries for modules: ``modules`` is used for
   target-independent modules and ``target_modules`` is used for
   target-dependent modules.  When modules are disabled the ``module``
-  source sets are added to ``softmmu_ss`` and the ``target_modules``
+  source sets are added to ``system_ss`` and the ``target_modules``
   source sets are added to ``specific_ss``.
 
   Both dictionaries are nested.  One dictionary is created per
diff --git a/meson.build b/meson.build
index c8e443c67c..9795367930 100644
--- a/meson.build
+++ b/meson.build
@@ -3169,7 +3169,7 @@ hwcore_ss = ss.source_set()
 io_ss = ss.source_set()
 qmp_ss = ss.source_set()
 qom_ss = ss.source_set()
-softmmu_ss = ss.source_set()
+system_ss = ss.source_set()
 specific_fuzz_ss = ss.source_set()
 specific_ss = ss.source_set()
 stub_ss = ss.source_set()
@@ -3394,7 +3394,7 @@ if have_block
   # os-posix.c contains POSIX-specific functions used by qemu-storage-daemon,
   # os-win32.c does not
   blockdev_ss.add(when: 'CONFIG_POSIX', if_true: files('os-posix.c'))
-  softmmu_ss.add(when: 'CONFIG_WIN32', if_true: [files('os-win32.c')])
+  system_ss.add(when: 'CONFIG_WIN32', if_true: [files('os-win32.c')])
 endif
 
 common_ss.add(files('cpus-common.c'))
@@ -3494,7 +3494,7 @@ foreach d, list : modules
       if d == 'block'
         block_ss.add_all(module_ss)
       else
-        softmmu_ss.add_all(module_ss)
+        system_ss.add_all(module_ss)
       endif
     endif
   endforeach
@@ -3599,7 +3599,7 @@ libmigration = static_library('migration', sources: migration_files + genh,
                               build_by_default: false)
 migration = declare_dependency(link_with: libmigration,
                                dependencies: [zlib, qom, io])
-softmmu_ss.add(migration)
+system_ss.add(migration)
 
 block_ss = block_ss.apply(config_host, strict: false)
 libblock = static_library('block', block_ss.sources() + genh,
@@ -3660,10 +3660,10 @@ if emulator_modules.length() > 0
   alias_target('modules', emulator_modules)
 endif
 
-softmmu_ss.add(authz, blockdev, chardev, crypto, io, qmp)
+system_ss.add(authz, blockdev, chardev, crypto, io, qmp)
 common_ss.add(qom, qemuutil)
 
-common_ss.add_all(when: 'CONFIG_SYSTEM_ONLY', if_true: [softmmu_ss])
+common_ss.add_all(when: 'CONFIG_SYSTEM_ONLY', if_true: [system_ss])
 common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
 
 common_all = common_ss.apply(config_all, strict: false)
diff --git a/accel/meson.build b/accel/meson.build
index 49558dd232..638a9a03ba 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -1,5 +1,5 @@
 specific_ss.add(files('accel-common.c', 'accel-blocker.c'))
-softmmu_ss.add(files('accel-softmmu.c'))
+system_ss.add(files('accel-softmmu.c'))
 user_ss.add(files('accel-user.c'))
 
 subdir('tcg')
@@ -12,4 +12,4 @@ if have_system
 endif
 
 # qtest
-softmmu_ss.add(files('dummy-cpus.c'))
+system_ss.add(files('dummy-cpus.c'))
diff --git a/audio/meson.build b/audio/meson.build
index 65a49c1a10..e7e95cf751 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -1,5 +1,5 @@
-softmmu_ss.add([spice_headers, files('audio.c')])
-softmmu_ss.add(files(
+system_ss.add([spice_headers, files('audio.c')])
+system_ss.add(files(
   'audio-hmp-cmds.c',
   'audio_legacy.c',
   'mixeng.c',
@@ -8,8 +8,8 @@ softmmu_ss.add(files(
   'wavcapture.c',
 ))
 
-softmmu_ss.add(when: coreaudio, if_true: files('coreaudio.m'))
-softmmu_ss.add(when: dsound, if_true: files('dsoundaudio.c', 'audio_win_int.c'))
+system_ss.add(when: coreaudio, if_true: files('coreaudio.m'))
+system_ss.add(when: dsound, if_true: files('dsoundaudio.c', 'audio_win_int.c'))
 
 audio_modules = {}
 foreach m : [
diff --git a/backends/meson.build b/backends/meson.build
index b369e0a9d0..914c7c4afb 100644
--- a/backends/meson.build
+++ b/backends/meson.build
@@ -1,4 +1,4 @@
-softmmu_ss.add([files(
+system_ss.add([files(
   'cryptodev-builtin.c',
   'cryptodev-hmp-cmds.c',
   'cryptodev.c',
@@ -10,20 +10,20 @@ softmmu_ss.add([files(
   'confidential-guest-support.c',
 ), numa])
 
-softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files('rng-random.c'))
-softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files('hostmem-file.c'))
-softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('hostmem-memfd.c'))
+system_ss.add(when: 'CONFIG_POSIX', if_true: files('rng-random.c'))
+system_ss.add(when: 'CONFIG_POSIX', if_true: files('hostmem-file.c'))
+system_ss.add(when: 'CONFIG_LINUX', if_true: files('hostmem-memfd.c'))
 if keyutils.found()
-    softmmu_ss.add(keyutils, files('cryptodev-lkcf.c'))
+    system_ss.add(keyutils, files('cryptodev-lkcf.c'))
 endif
 if have_vhost_user
-  softmmu_ss.add(when: 'CONFIG_VIRTIO', if_true: files('vhost-user.c'))
+  system_ss.add(when: 'CONFIG_VIRTIO', if_true: files('vhost-user.c'))
 endif
-softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('cryptodev-vhost.c'))
+system_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('cryptodev-vhost.c'))
 if have_vhost_user_crypto
-  softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('cryptodev-vhost-user.c'))
+  system_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('cryptodev-vhost-user.c'))
 endif
-softmmu_ss.add(when: gio, if_true: files('dbus-vmstate.c'))
-softmmu_ss.add(when: 'CONFIG_SGX', if_true: files('hostmem-epc.c'))
+system_ss.add(when: gio, if_true: files('dbus-vmstate.c'))
+system_ss.add(when: 'CONFIG_SGX', if_true: files('hostmem-epc.c'))
 
 subdir('tpm')
diff --git a/backends/tpm/meson.build b/backends/tpm/meson.build
index 7f2503f84e..0bfa6c422b 100644
--- a/backends/tpm/meson.build
+++ b/backends/tpm/meson.build
@@ -1,6 +1,6 @@
 if have_tpm
-  softmmu_ss.add(files('tpm_backend.c'))
-  softmmu_ss.add(files('tpm_util.c'))
-  softmmu_ss.add(when: 'CONFIG_TPM_PASSTHROUGH', if_true: files('tpm_passthrough.c'))
-  softmmu_ss.add(when: 'CONFIG_TPM_EMULATOR', if_true: files('tpm_emulator.c'))
+  system_ss.add(files('tpm_backend.c'))
+  system_ss.add(files('tpm_util.c'))
+  system_ss.add(when: 'CONFIG_TPM_PASSTHROUGH', if_true: files('tpm_passthrough.c'))
+  system_ss.add(when: 'CONFIG_TPM_EMULATOR', if_true: files('tpm_emulator.c'))
 endif
diff --git a/block/meson.build b/block/meson.build
index fb4332bd66..529fc172c6 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -42,8 +42,8 @@ block_ss.add(files(
   'write-threshold.c',
 ), zstd, zlib, gnutls)
 
-softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('blkreplay.c'))
-softmmu_ss.add(files('block-ram-registrar.c'))
+system_ss.add(when: 'CONFIG_TCG', if_true: files('blkreplay.c'))
+system_ss.add(files('block-ram-registrar.c'))
 
 if get_option('qcow1').allowed()
   block_ss.add(files('qcow.c'))
@@ -159,7 +159,7 @@ block_ss.add(block_gen_c)
 
 block_ss.add(files('stream.c'))
 
-softmmu_ss.add(files('qapi-sysemu.c'))
+system_ss.add(files('qapi-sysemu.c'))
 
 subdir('export')
 subdir('monitor')
diff --git a/block/monitor/meson.build b/block/monitor/meson.build
index 374aac1140..1022516e93 100644
--- a/block/monitor/meson.build
+++ b/block/monitor/meson.build
@@ -1,2 +1,2 @@
-softmmu_ss.add(files('block-hmp-cmds.c'))
+system_ss.add(files('block-hmp-cmds.c'))
 block_ss.add(files('bitmap-qmp-cmds.c'))
diff --git a/chardev/meson.build b/chardev/meson.build
index 7a3ba777ab..fb630b429e 100644
--- a/chardev/meson.build
+++ b/chardev/meson.build
@@ -28,7 +28,7 @@ chardev_ss.add(when: 'CONFIG_WIN32', if_true: files(
 
 chardev_ss = chardev_ss.apply(config_host, strict: false)
 
-softmmu_ss.add(files(
+system_ss.add(files(
     'char-hmp-cmds.c',
     'msmouse.c',
     'wctablet.c',
diff --git a/disas/meson.build b/disas/meson.build
index 832727e4b3..3a480eb9f8 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -13,5 +13,5 @@ common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
 common_ss.add(when: capstone, if_true: [files('capstone.c'), capstone])
 common_ss.add(files('disas.c'))
 
-softmmu_ss.add(files('disas-mon.c'))
+system_ss.add(files('disas-mon.c'))
 specific_ss.add(capstone)
diff --git a/dump/meson.build b/dump/meson.build
index 3ef1f7ce00..4277ce9328 100644
--- a/dump/meson.build
+++ b/dump/meson.build
@@ -1,2 +1,2 @@
-softmmu_ss.add([files('dump.c', 'dump-hmp-cmds.c'), snappy, lzo])
+system_ss.add([files('dump.c', 'dump-hmp-cmds.c'), snappy, lzo])
 specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: files('win_dump.c'))
diff --git a/ebpf/meson.build b/ebpf/meson.build
index 2dd0fd8948..2f627d6c7d 100644
--- a/ebpf/meson.build
+++ b/ebpf/meson.build
@@ -1 +1 @@
-softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
+system_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
diff --git a/fsdev/meson.build b/fsdev/meson.build
index b632b66348..1bec065924 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -6,8 +6,8 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
   '9p-marshal.c',
   'qemu-fsdev.c',
 ), if_false: files('qemu-fsdev-dummy.c'))
-softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
-softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
+system_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
+system_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
 
 if have_virtfs_proxy_helper
   executable('virtfs-proxy-helper',
diff --git a/gdbstub/meson.build b/gdbstub/meson.build
index cdb4d28691..77762e0b3e 100644
--- a/gdbstub/meson.build
+++ b/gdbstub/meson.build
@@ -8,14 +8,14 @@
 # cflags so:
 
 gdb_user_ss = ss.source_set()
-gdb_softmmu_ss = ss.source_set()
+gdb_system_ss = ss.source_set()
 
 # We build two versions of gdbstub, one for each mode
 gdb_user_ss.add(files('gdbstub.c', 'user.c'))
-gdb_softmmu_ss.add(files('gdbstub.c', 'softmmu.c'))
+gdb_system_ss.add(files('gdbstub.c', 'softmmu.c'))
 
 gdb_user_ss = gdb_user_ss.apply(config_host, strict: false)
-gdb_softmmu_ss = gdb_softmmu_ss.apply(config_host, strict: false)
+gdb_system_ss = gdb_system_ss.apply(config_host, strict: false)
 
 libgdb_user = static_library('gdb_user',
                              gdb_user_ss.sources() + genh,
@@ -24,14 +24,14 @@ libgdb_user = static_library('gdb_user',
                              build_by_default: have_user)
 
 libgdb_softmmu = static_library('gdb_softmmu',
-                                gdb_softmmu_ss.sources() + genh,
+                                gdb_system_ss.sources() + genh,
                                 name_suffix: 'fa',
                                 build_by_default: have_system)
 
 gdb_user = declare_dependency(link_whole: libgdb_user)
 user_ss.add(gdb_user)
 gdb_softmmu = declare_dependency(link_whole: libgdb_softmmu)
-softmmu_ss.add(gdb_softmmu)
+system_ss.add(gdb_softmmu)
 
 common_ss.add(files('syscalls.c'))
 
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index fd37b7a02d..2944ea63c3 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -16,6 +16,6 @@ fs_ss.add(files(
 fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
 fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-util-darwin.c'))
 fs_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-9p-backend.c'))
-softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
+system_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
 specific_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-9p-device.c'))
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index e0bf39bf4c..fc1b952379 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -30,12 +30,12 @@ acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
 if have_tpm
   acpi_ss.add(files('tpm.c'))
 endif
-softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c', 'acpi_interface.c'))
-softmmu_ss.add(when: 'CONFIG_ACPI_PCI_BRIDGE', if_false: files('pci-bridge-stub.c'))
-softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
+system_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c', 'acpi_interface.c'))
+system_ss.add(when: 'CONFIG_ACPI_PCI_BRIDGE', if_false: files('pci-bridge-stub.c'))
+system_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
+system_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
                                                   'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c',
                                                   'acpi-mem-hotplug-stub.c', 'acpi-cpu-hotplug-stub.c',
                                                   'acpi-pci-hotplug-stub.c', 'acpi-nvdimm-stub.c',
                                                   'cxl-stub.c', 'pci-bridge-stub.c'))
-softmmu_ss.add(files('acpi-qmp-cmds.c'))
+system_ss.add(files('acpi-qmp-cmds.c'))
diff --git a/hw/adc/meson.build b/hw/adc/meson.build
index b29ac7ccdf..a4f85b7d46 100644
--- a/hw/adc/meson.build
+++ b/hw/adc/meson.build
@@ -1,5 +1,5 @@
-softmmu_ss.add(when: 'CONFIG_STM32F2XX_ADC', if_true: files('stm32f2xx_adc.c'))
-softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_adc.c'))
-softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_adc.c'))
-softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq-xadc.c'))
-softmmu_ss.add(when: 'CONFIG_MAX111X', if_true: files('max111x.c'))
+system_ss.add(when: 'CONFIG_STM32F2XX_ADC', if_true: files('stm32f2xx_adc.c'))
+system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_adc.c'))
+system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_adc.c'))
+system_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq-xadc.c'))
+system_ss.add(when: 'CONFIG_MAX111X', if_true: files('max111x.c'))
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 870ec67376..648d3505f5 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -64,9 +64,9 @@ arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 
-softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
-softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
-softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
-softmmu_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
+system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
+system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
+system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
+system_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
 
 hw_arch += {'arm': arm_ss}
diff --git a/hw/audio/meson.build b/hw/audio/meson.build
index e48a9fc73d..d0fda1009e 100644
--- a/hw/audio/meson.build
+++ b/hw/audio/meson.build
@@ -1,14 +1,14 @@
-softmmu_ss.add(files('soundhw.c'))
-softmmu_ss.add(when: 'CONFIG_AC97', if_true: files('ac97.c'))
-softmmu_ss.add(when: 'CONFIG_ADLIB', if_true: files('fmopl.c', 'adlib.c'))
-softmmu_ss.add(when: 'CONFIG_CS4231', if_true: files('cs4231.c'))
-softmmu_ss.add(when: 'CONFIG_CS4231A', if_true: files('cs4231a.c'))
-softmmu_ss.add(when: 'CONFIG_ES1370', if_true: files('es1370.c'))
-softmmu_ss.add(when: 'CONFIG_GUS', if_true: files('gus.c', 'gusemu_hal.c', 'gusemu_mixer.c'))
-softmmu_ss.add(when: 'CONFIG_HDA', if_true: files('intel-hda.c', 'hda-codec.c'))
-softmmu_ss.add(when: 'CONFIG_MARVELL_88W8618', if_true: files('marvell_88w8618.c'))
-softmmu_ss.add(when: 'CONFIG_PCSPK', if_true: files('pcspk.c'))
-softmmu_ss.add(when: 'CONFIG_PL041', if_true: files('pl041.c', 'lm4549.c'))
-softmmu_ss.add(when: 'CONFIG_SB16', if_true: files('sb16.c'))
-softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('via-ac97.c'))
-softmmu_ss.add(when: 'CONFIG_WM8750', if_true: files('wm8750.c'))
+system_ss.add(files('soundhw.c'))
+system_ss.add(when: 'CONFIG_AC97', if_true: files('ac97.c'))
+system_ss.add(when: 'CONFIG_ADLIB', if_true: files('fmopl.c', 'adlib.c'))
+system_ss.add(when: 'CONFIG_CS4231', if_true: files('cs4231.c'))
+system_ss.add(when: 'CONFIG_CS4231A', if_true: files('cs4231a.c'))
+system_ss.add(when: 'CONFIG_ES1370', if_true: files('es1370.c'))
+system_ss.add(when: 'CONFIG_GUS', if_true: files('gus.c', 'gusemu_hal.c', 'gusemu_mixer.c'))
+system_ss.add(when: 'CONFIG_HDA', if_true: files('intel-hda.c', 'hda-codec.c'))
+system_ss.add(when: 'CONFIG_MARVELL_88W8618', if_true: files('marvell_88w8618.c'))
+system_ss.add(when: 'CONFIG_PCSPK', if_true: files('pcspk.c'))
+system_ss.add(when: 'CONFIG_PL041', if_true: files('pl041.c', 'lm4549.c'))
+system_ss.add(when: 'CONFIG_SB16', if_true: files('sb16.c'))
+system_ss.add(when: 'CONFIG_VT82C686', if_true: files('via-ac97.c'))
+system_ss.add(when: 'CONFIG_WM8750', if_true: files('wm8750.c'))
diff --git a/hw/block/meson.build b/hw/block/meson.build
index cc2a75cc50..8aa4dc3893 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -1,21 +1,21 @@
-softmmu_ss.add(files(
+system_ss.add(files(
   'block.c',
   'cdrom.c',
   'hd-geometry.c'
 ))
-softmmu_ss.add(when: 'CONFIG_ECC', if_true: files('ecc.c'))
-softmmu_ss.add(when: 'CONFIG_FDC', if_true: files('fdc.c'))
-softmmu_ss.add(when: 'CONFIG_FDC_ISA', if_true: files('fdc-isa.c'))
-softmmu_ss.add(when: 'CONFIG_FDC_SYSBUS', if_true: files('fdc-sysbus.c'))
-softmmu_ss.add(when: 'CONFIG_NAND', if_true: files('nand.c'))
-softmmu_ss.add(when: 'CONFIG_ONENAND', if_true: files('onenand.c'))
-softmmu_ss.add(when: 'CONFIG_PFLASH_CFI01', if_true: files('pflash_cfi01.c'))
-softmmu_ss.add(when: 'CONFIG_PFLASH_CFI02', if_true: files('pflash_cfi02.c'))
-softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
-softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80_sfdp.c'))
-softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
-softmmu_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
-softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
+system_ss.add(when: 'CONFIG_ECC', if_true: files('ecc.c'))
+system_ss.add(when: 'CONFIG_FDC', if_true: files('fdc.c'))
+system_ss.add(when: 'CONFIG_FDC_ISA', if_true: files('fdc-isa.c'))
+system_ss.add(when: 'CONFIG_FDC_SYSBUS', if_true: files('fdc-sysbus.c'))
+system_ss.add(when: 'CONFIG_NAND', if_true: files('nand.c'))
+system_ss.add(when: 'CONFIG_ONENAND', if_true: files('onenand.c'))
+system_ss.add(when: 'CONFIG_PFLASH_CFI01', if_true: files('pflash_cfi01.c'))
+system_ss.add(when: 'CONFIG_PFLASH_CFI02', if_true: files('pflash_cfi02.c'))
+system_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
+system_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80_sfdp.c'))
+system_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
+system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
+system_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
 
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c', 'virtio-blk-common.c'))
 specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c', 'virtio-blk-common.c'))
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 0807e00ae4..006d20f1e2 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -1,39 +1,39 @@
-softmmu_ss.add(when: 'CONFIG_CADENCE', if_true: files('cadence_uart.c'))
-softmmu_ss.add(when: 'CONFIG_CMSDK_APB_UART', if_true: files('cmsdk-apb-uart.c'))
-softmmu_ss.add(when: 'CONFIG_ESCC', if_true: files('escc.c'))
-softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_ser.c'))
-softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_apbuart.c'))
-softmmu_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_uart.c'))
-softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_serial.c'))
-softmmu_ss.add(when: 'CONFIG_IPACK', if_true: files('ipoctal232.c'))
-softmmu_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('parallel-isa.c'))
-softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugcon.c'))
-softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_uart.c'))
-softmmu_ss.add(when: 'CONFIG_PARALLEL', if_true: files('parallel.c'))
-softmmu_ss.add(when: 'CONFIG_PL011', if_true: files('pl011.c'))
-softmmu_ss.add(when: 'CONFIG_SCLPCONSOLE', if_true: files('sclpconsole.c', 'sclpconsole-lm.c'))
-softmmu_ss.add(when: 'CONFIG_SERIAL', if_true: files('serial.c'))
-softmmu_ss.add(when: 'CONFIG_SERIAL_ISA', if_true: files('serial-isa.c'))
-softmmu_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c'))
-softmmu_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-pci-multi.c'))
-softmmu_ss.add(when: 'CONFIG_SHAKTI_UART', if_true: files('shakti_uart.c'))
-softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-console.c'))
-softmmu_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen_console.c'))
-softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'))
+system_ss.add(when: 'CONFIG_CADENCE', if_true: files('cadence_uart.c'))
+system_ss.add(when: 'CONFIG_CMSDK_APB_UART', if_true: files('cmsdk-apb-uart.c'))
+system_ss.add(when: 'CONFIG_ESCC', if_true: files('escc.c'))
+system_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_ser.c'))
+system_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_apbuart.c'))
+system_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_uart.c'))
+system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_serial.c'))
+system_ss.add(when: 'CONFIG_IPACK', if_true: files('ipoctal232.c'))
+system_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('parallel-isa.c'))
+system_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugcon.c'))
+system_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_uart.c'))
+system_ss.add(when: 'CONFIG_PARALLEL', if_true: files('parallel.c'))
+system_ss.add(when: 'CONFIG_PL011', if_true: files('pl011.c'))
+system_ss.add(when: 'CONFIG_SCLPCONSOLE', if_true: files('sclpconsole.c', 'sclpconsole-lm.c'))
+system_ss.add(when: 'CONFIG_SERIAL', if_true: files('serial.c'))
+system_ss.add(when: 'CONFIG_SERIAL_ISA', if_true: files('serial-isa.c'))
+system_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c'))
+system_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-pci-multi.c'))
+system_ss.add(when: 'CONFIG_SHAKTI_UART', if_true: files('shakti_uart.c'))
+system_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-console.c'))
+system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen_console.c'))
+system_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'))
 
-softmmu_ss.add(when: 'CONFIG_AVR_USART', if_true: files('avr_usart.c'))
-softmmu_ss.add(when: 'CONFIG_COLDFIRE', if_true: files('mcf_uart.c'))
-softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic-uart.c'))
-softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_uart.c'))
-softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_uart.c'))
-softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_aux.c'))
-softmmu_ss.add(when: 'CONFIG_RENESAS_SCI', if_true: files('renesas_sci.c'))
-softmmu_ss.add(when: 'CONFIG_SIFIVE_UART', if_true: files('sifive_uart.c'))
-softmmu_ss.add(when: 'CONFIG_SH_SCI', if_true: files('sh_serial.c'))
-softmmu_ss.add(when: 'CONFIG_STM32F2XX_USART', if_true: files('stm32f2xx_usart.c'))
-softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
-softmmu_ss.add(when: 'CONFIG_HTIF', if_true: files('riscv_htif.c'))
-softmmu_ss.add(when: 'CONFIG_GOLDFISH_TTY', if_true: files('goldfish_tty.c'))
+system_ss.add(when: 'CONFIG_AVR_USART', if_true: files('avr_usart.c'))
+system_ss.add(when: 'CONFIG_COLDFIRE', if_true: files('mcf_uart.c'))
+system_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic-uart.c'))
+system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_uart.c'))
+system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_uart.c'))
+system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_aux.c'))
+system_ss.add(when: 'CONFIG_RENESAS_SCI', if_true: files('renesas_sci.c'))
+system_ss.add(when: 'CONFIG_SIFIVE_UART', if_true: files('sifive_uart.c'))
+system_ss.add(when: 'CONFIG_SH_SCI', if_true: files('sh_serial.c'))
+system_ss.add(when: 'CONFIG_STM32F2XX_USART', if_true: files('stm32f2xx_usart.c'))
+system_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
+system_ss.add(when: 'CONFIG_HTIF', if_true: files('riscv_htif.c'))
+system_ss.add(when: 'CONFIG_GOLDFISH_TTY', if_true: files('goldfish_tty.c'))
 
 specific_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('terminal3270.c'))
 specific_ss.add(when: 'CONFIG_VIRTIO', if_true: files('virtio-serial-bus.c'))
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 959bc924d4..67dad04de5 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -24,18 +24,18 @@ endif
 
 common_ss.add(files('cpu-common.c'))
 common_ss.add(files('machine-smp.c'))
-softmmu_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
-softmmu_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
-softmmu_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
-softmmu_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
-softmmu_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
-softmmu_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
-softmmu_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
-softmmu_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
-softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
-softmmu_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c'))
+system_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
+system_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
+system_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
+system_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
+system_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
+system_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
+system_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
+system_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
+system_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
+system_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c'))
 
-softmmu_ss.add(files(
+system_ss.add(files(
   'cpu-sysemu.c',
   'fw-path-provider.c',
   'gpio.c',
diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
index e37490074f..6d319947ca 100644
--- a/hw/cpu/meson.build
+++ b/hw/cpu/meson.build
@@ -1,6 +1,6 @@
-softmmu_ss.add(files('core.c', 'cluster.c'))
+system_ss.add(files('core.c', 'cluster.c'))
 
-softmmu_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
-softmmu_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
+system_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
+system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
 specific_ss.add(when: 'CONFIG_A9MPCORE', if_true: files('a9mpcore.c'))
 specific_ss.add(when: 'CONFIG_A15MPCORE', if_true: files('a15mpcore.c'))
diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
index cfa95ffd40..1f9aa2ea1f 100644
--- a/hw/cxl/meson.build
+++ b/hw/cxl/meson.build
@@ -1,4 +1,4 @@
-softmmu_ss.add(when: 'CONFIG_CXL',
+system_ss.add(when: 'CONFIG_CXL',
                if_true: files(
                    'cxl-component-utils.c',
                    'cxl-device-utils.c',
@@ -10,4 +10,4 @@ softmmu_ss.add(when: 'CONFIG_CXL',
                    'cxl-host-stubs.c',
                ))
 
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('cxl-host-stubs.c'))
+system_ss.add(when: 'CONFIG_ALL', if_true: files('cxl-host-stubs.c'))
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 17165bd536..413ba4ab24 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -1,49 +1,49 @@
 hw_display_modules = {}
 
-softmmu_ss.add(when: 'CONFIG_DDC', if_true: files('i2c-ddc.c'))
-softmmu_ss.add(when: 'CONFIG_EDID', if_true: files('edid-generate.c', 'edid-region.c'))
+system_ss.add(when: 'CONFIG_DDC', if_true: files('i2c-ddc.c'))
+system_ss.add(when: 'CONFIG_EDID', if_true: files('edid-generate.c', 'edid-region.c'))
 
-softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('ramfb.c'))
-softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('ramfb-standalone.c'))
+system_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('ramfb.c'))
+system_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('ramfb-standalone.c'))
 
-softmmu_ss.add(when: 'CONFIG_VGA_CIRRUS', if_true: files('cirrus_vga.c'))
-softmmu_ss.add(when: ['CONFIG_VGA_CIRRUS', 'CONFIG_VGA_ISA'], if_true: files('cirrus_vga_isa.c'))
-softmmu_ss.add(when: 'CONFIG_G364FB', if_true: files('g364fb.c'))
-softmmu_ss.add(when: 'CONFIG_JAZZ_LED', if_true: files('jazz_led.c'))
-softmmu_ss.add(when: 'CONFIG_PL110', if_true: files('pl110.c'))
-softmmu_ss.add(when: 'CONFIG_SII9022', if_true: files('sii9022.c'))
-softmmu_ss.add(when: 'CONFIG_SSD0303', if_true: files('ssd0303.c'))
-softmmu_ss.add(when: 'CONFIG_SSD0323', if_true: files('ssd0323.c'))
-softmmu_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xenfb.c'))
+system_ss.add(when: 'CONFIG_VGA_CIRRUS', if_true: files('cirrus_vga.c'))
+system_ss.add(when: ['CONFIG_VGA_CIRRUS', 'CONFIG_VGA_ISA'], if_true: files('cirrus_vga_isa.c'))
+system_ss.add(when: 'CONFIG_G364FB', if_true: files('g364fb.c'))
+system_ss.add(when: 'CONFIG_JAZZ_LED', if_true: files('jazz_led.c'))
+system_ss.add(when: 'CONFIG_PL110', if_true: files('pl110.c'))
+system_ss.add(when: 'CONFIG_SII9022', if_true: files('sii9022.c'))
+system_ss.add(when: 'CONFIG_SSD0303', if_true: files('ssd0303.c'))
+system_ss.add(when: 'CONFIG_SSD0323', if_true: files('ssd0323.c'))
+system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xenfb.c'))
 
-softmmu_ss.add(when: 'CONFIG_VGA_PCI', if_true: files('vga-pci.c'))
-softmmu_ss.add(when: 'CONFIG_VGA_ISA', if_true: files('vga-isa.c'))
-softmmu_ss.add(when: 'CONFIG_VGA_MMIO', if_true: files('vga-mmio.c'))
-softmmu_ss.add(when: 'CONFIG_VMWARE_VGA', if_true: files('vmware_vga.c'))
-softmmu_ss.add(when: 'CONFIG_BOCHS_DISPLAY', if_true: files('bochs-display.c'))
+system_ss.add(when: 'CONFIG_VGA_PCI', if_true: files('vga-pci.c'))
+system_ss.add(when: 'CONFIG_VGA_ISA', if_true: files('vga-isa.c'))
+system_ss.add(when: 'CONFIG_VGA_MMIO', if_true: files('vga-mmio.c'))
+system_ss.add(when: 'CONFIG_VMWARE_VGA', if_true: files('vmware_vga.c'))
+system_ss.add(when: 'CONFIG_BOCHS_DISPLAY', if_true: files('bochs-display.c'))
 
-softmmu_ss.add(when: 'CONFIG_BLIZZARD', if_true: files('blizzard.c'))
-softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_fimd.c'))
-softmmu_ss.add(when: 'CONFIG_FRAMEBUFFER', if_true: files('framebuffer.c'))
-softmmu_ss.add(when: 'CONFIG_ZAURUS', if_true: files('tc6393xb.c'))
+system_ss.add(when: 'CONFIG_BLIZZARD', if_true: files('blizzard.c'))
+system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_fimd.c'))
+system_ss.add(when: 'CONFIG_FRAMEBUFFER', if_true: files('framebuffer.c'))
+system_ss.add(when: 'CONFIG_ZAURUS', if_true: files('tc6393xb.c'))
 
-softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_dss.c'))
-softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_lcd.c'))
-softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_fb.c'))
-softmmu_ss.add(when: 'CONFIG_SM501', if_true: files('sm501.c'))
-softmmu_ss.add(when: 'CONFIG_TCX', if_true: files('tcx.c'))
-softmmu_ss.add(when: 'CONFIG_CG3', if_true: files('cg3.c'))
-softmmu_ss.add(when: 'CONFIG_MACFB', if_true: files('macfb.c'))
-softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
+system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_dss.c'))
+system_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_lcd.c'))
+system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_fb.c'))
+system_ss.add(when: 'CONFIG_SM501', if_true: files('sm501.c'))
+system_ss.add(when: 'CONFIG_TCX', if_true: files('tcx.c'))
+system_ss.add(when: 'CONFIG_CG3', if_true: files('cg3.c'))
+system_ss.add(when: 'CONFIG_MACFB', if_true: files('macfb.c'))
+system_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
 
-softmmu_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
+system_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
 
 if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
     config_all_devices.has_key('CONFIG_VGA_PCI') or
     config_all_devices.has_key('CONFIG_VMWARE_VGA') or
     config_all_devices.has_key('CONFIG_ATI_VGA')
    )
-  softmmu_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
+  system_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
                                       if_false: files('acpi-vga-stub.c'))
 endif
 
@@ -56,12 +56,12 @@ if config_all_devices.has_key('CONFIG_QXL')
   hw_display_modules += {'qxl': qxl_ss}
 endif
 
-softmmu_ss.add(when: 'CONFIG_DPCD', if_true: files('dpcd.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dp.c'))
+system_ss.add(when: 'CONFIG_DPCD', if_true: files('dpcd.c'))
+system_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dp.c'))
 
-softmmu_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
+system_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
 
-softmmu_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
+system_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
 
 
 if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
@@ -115,7 +115,7 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
   hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
 endif
 
-softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_lcdc.c'))
+system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_lcdc.c'))
 
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-vga-stub.c'))
+system_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-vga-stub.c'))
 modules += { 'hw-display': hw_display_modules }
diff --git a/hw/dma/meson.build b/hw/dma/meson.build
index f3f0661bc3..a96c1be2c8 100644
--- a/hw/dma/meson.build
+++ b/hw/dma/meson.build
@@ -1,16 +1,16 @@
-softmmu_ss.add(when: 'CONFIG_RC4030', if_true: files('rc4030.c'))
-softmmu_ss.add(when: 'CONFIG_PL080', if_true: files('pl080.c'))
-softmmu_ss.add(when: 'CONFIG_PL330', if_true: files('pl330.c'))
-softmmu_ss.add(when: 'CONFIG_I82374', if_true: files('i82374.c'))
-softmmu_ss.add(when: 'CONFIG_I8257', if_true: files('i8257.c'))
-softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('xilinx_axidma.c'))
-softmmu_ss.add(when: 'CONFIG_ZYNQ_DEVCFG', if_true: files('xlnx-zynq-devcfg.c'))
-softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_dma.c'))
-softmmu_ss.add(when: 'CONFIG_STP2000', if_true: files('sparc32_dma.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dpdma.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_ZDMA', if_true: files('xlnx-zdma.c'))
-softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_dma.c', 'soc_dma.c'))
-softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
-softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
-softmmu_ss.add(when: 'CONFIG_SIFIVE_PDMA', if_true: files('sifive_pdma.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_CSU_DMA', if_true: files('xlnx_csu_dma.c'))
+system_ss.add(when: 'CONFIG_RC4030', if_true: files('rc4030.c'))
+system_ss.add(when: 'CONFIG_PL080', if_true: files('pl080.c'))
+system_ss.add(when: 'CONFIG_PL330', if_true: files('pl330.c'))
+system_ss.add(when: 'CONFIG_I82374', if_true: files('i82374.c'))
+system_ss.add(when: 'CONFIG_I8257', if_true: files('i8257.c'))
+system_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('xilinx_axidma.c'))
+system_ss.add(when: 'CONFIG_ZYNQ_DEVCFG', if_true: files('xlnx-zynq-devcfg.c'))
+system_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_dma.c'))
+system_ss.add(when: 'CONFIG_STP2000', if_true: files('sparc32_dma.c'))
+system_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dpdma.c'))
+system_ss.add(when: 'CONFIG_XLNX_ZDMA', if_true: files('xlnx-zdma.c'))
+system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_dma.c', 'soc_dma.c'))
+system_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
+system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
+system_ss.add(when: 'CONFIG_SIFIVE_PDMA', if_true: files('sifive_pdma.c'))
+system_ss.add(when: 'CONFIG_XLNX_CSU_DMA', if_true: files('xlnx_csu_dma.c'))
diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
index b726e6d27a..066ea96480 100644
--- a/hw/gpio/meson.build
+++ b/hw/gpio/meson.build
@@ -1,14 +1,14 @@
-softmmu_ss.add(when: 'CONFIG_GPIO_KEY', if_true: files('gpio_key.c'))
-softmmu_ss.add(when: 'CONFIG_GPIO_MPC8XXX', if_true: files('mpc8xxx.c'))
-softmmu_ss.add(when: 'CONFIG_GPIO_PWR', if_true: files('gpio_pwr.c'))
-softmmu_ss.add(when: 'CONFIG_MAX7310', if_true: files('max7310.c'))
-softmmu_ss.add(when: 'CONFIG_PL061', if_true: files('pl061.c'))
-softmmu_ss.add(when: 'CONFIG_ZAURUS', if_true: files('zaurus.c'))
+system_ss.add(when: 'CONFIG_GPIO_KEY', if_true: files('gpio_key.c'))
+system_ss.add(when: 'CONFIG_GPIO_MPC8XXX', if_true: files('mpc8xxx.c'))
+system_ss.add(when: 'CONFIG_GPIO_PWR', if_true: files('gpio_pwr.c'))
+system_ss.add(when: 'CONFIG_MAX7310', if_true: files('max7310.c'))
+system_ss.add(when: 'CONFIG_PL061', if_true: files('pl061.c'))
+system_ss.add(when: 'CONFIG_ZAURUS', if_true: files('zaurus.c'))
 
-softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpio.c'))
-softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_gpio.c'))
-softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_gpio.c'))
-softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gpio.c'))
-softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
-softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
-softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c'))
+system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpio.c'))
+system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_gpio.c'))
+system_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_gpio.c'))
+system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gpio.c'))
+system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
+system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
+system_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c'))
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
index 3996564c25..b58bc167db 100644
--- a/hw/i2c/meson.build
+++ b/hw/i2c/meson.build
@@ -17,4 +17,4 @@ i2c_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_i2c.c'))
 i2c_ss.add(when: 'CONFIG_PPC4XX', if_true: files('ppc4xx_i2c.c'))
 i2c_ss.add(when: 'CONFIG_PCA954X', if_true: files('i2c_mux_pca954x.c'))
 i2c_ss.add(when: 'CONFIG_PMBUS', if_true: files('pmbus_device.c'))
-softmmu_ss.add_all(when: 'CONFIG_I2C', if_true: i2c_ss)
+system_ss.add_all(when: 'CONFIG_I2C', if_true: i2c_ss)
diff --git a/hw/ide/meson.build b/hw/ide/meson.build
index ddcb3b28d2..e050eef942 100644
--- a/hw/ide/meson.build
+++ b/hw/ide/meson.build
@@ -1,14 +1,14 @@
-softmmu_ss.add(when: 'CONFIG_AHCI', if_true: files('ahci.c'))
-softmmu_ss.add(when: 'CONFIG_AHCI_ICH9', if_true: files('ich.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('ahci-allwinner.c'))
-softmmu_ss.add(when: 'CONFIG_IDE_CMD646', if_true: files('cmd646.c'))
-softmmu_ss.add(when: 'CONFIG_IDE_CORE', if_true: files('core.c', 'atapi.c'))
-softmmu_ss.add(when: 'CONFIG_IDE_ISA', if_true: files('isa.c', 'ioport.c'))
-softmmu_ss.add(when: 'CONFIG_IDE_MACIO', if_true: files('macio.c'))
-softmmu_ss.add(when: 'CONFIG_IDE_MMIO', if_true: files('mmio.c'))
-softmmu_ss.add(when: 'CONFIG_IDE_PCI', if_true: files('pci.c'))
-softmmu_ss.add(when: 'CONFIG_IDE_PIIX', if_true: files('piix.c', 'ioport.c'))
-softmmu_ss.add(when: 'CONFIG_IDE_QDEV', if_true: files('qdev.c'))
-softmmu_ss.add(when: 'CONFIG_IDE_SII3112', if_true: files('sii3112.c'))
-softmmu_ss.add(when: 'CONFIG_IDE_VIA', if_true: files('via.c'))
-softmmu_ss.add(when: 'CONFIG_MICRODRIVE', if_true: files('microdrive.c'))
+system_ss.add(when: 'CONFIG_AHCI', if_true: files('ahci.c'))
+system_ss.add(when: 'CONFIG_AHCI_ICH9', if_true: files('ich.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('ahci-allwinner.c'))
+system_ss.add(when: 'CONFIG_IDE_CMD646', if_true: files('cmd646.c'))
+system_ss.add(when: 'CONFIG_IDE_CORE', if_true: files('core.c', 'atapi.c'))
+system_ss.add(when: 'CONFIG_IDE_ISA', if_true: files('isa.c', 'ioport.c'))
+system_ss.add(when: 'CONFIG_IDE_MACIO', if_true: files('macio.c'))
+system_ss.add(when: 'CONFIG_IDE_MMIO', if_true: files('mmio.c'))
+system_ss.add(when: 'CONFIG_IDE_PCI', if_true: files('pci.c'))
+system_ss.add(when: 'CONFIG_IDE_PIIX', if_true: files('piix.c', 'ioport.c'))
+system_ss.add(when: 'CONFIG_IDE_QDEV', if_true: files('qdev.c'))
+system_ss.add(when: 'CONFIG_IDE_SII3112', if_true: files('sii3112.c'))
+system_ss.add(when: 'CONFIG_IDE_VIA', if_true: files('via.c'))
+system_ss.add(when: 'CONFIG_MICRODRIVE', if_true: files('microdrive.c'))
diff --git a/hw/input/meson.build b/hw/input/meson.build
index 8deb011d4a..c0d4482180 100644
--- a/hw/input/meson.build
+++ b/hw/input/meson.build
@@ -1,18 +1,18 @@
-softmmu_ss.add(files('hid.c'))
-softmmu_ss.add(when: 'CONFIG_ADB', if_true: files('adb.c', 'adb-mouse.c', 'adb-kbd.c'))
-softmmu_ss.add(when: 'CONFIG_ADS7846', if_true: files('ads7846.c'))
-softmmu_ss.add(when: 'CONFIG_LM832X', if_true: files('lm832x.c'))
-softmmu_ss.add(when: 'CONFIG_PCKBD', if_true: files('pckbd.c'))
-softmmu_ss.add(when: 'CONFIG_PL050', if_true: files('pl050.c'))
-softmmu_ss.add(when: 'CONFIG_PS2', if_true: files('ps2.c'))
-softmmu_ss.add(when: 'CONFIG_STELLARIS_INPUT', if_true: files('stellaris_input.c'))
-softmmu_ss.add(when: 'CONFIG_TSC2005', if_true: files('tsc2005.c'))
+system_ss.add(files('hid.c'))
+system_ss.add(when: 'CONFIG_ADB', if_true: files('adb.c', 'adb-mouse.c', 'adb-kbd.c'))
+system_ss.add(when: 'CONFIG_ADS7846', if_true: files('ads7846.c'))
+system_ss.add(when: 'CONFIG_LM832X', if_true: files('lm832x.c'))
+system_ss.add(when: 'CONFIG_PCKBD', if_true: files('pckbd.c'))
+system_ss.add(when: 'CONFIG_PL050', if_true: files('pl050.c'))
+system_ss.add(when: 'CONFIG_PS2', if_true: files('ps2.c'))
+system_ss.add(when: 'CONFIG_STELLARIS_INPUT', if_true: files('stellaris_input.c'))
+system_ss.add(when: 'CONFIG_TSC2005', if_true: files('tsc2005.c'))
 
-softmmu_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-input.c'))
-softmmu_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-input-hid.c'))
-softmmu_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true: files('virtio-input-host.c'))
-softmmu_ss.add(when: 'CONFIG_VHOST_USER_INPUT', if_true: files('vhost-user-input.c'))
+system_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-input.c'))
+system_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-input-hid.c'))
+system_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true: files('virtio-input-host.c'))
+system_ss.add(when: 'CONFIG_VHOST_USER_INPUT', if_true: files('vhost-user-input.c'))
 
-softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_keypad.c'))
-softmmu_ss.add(when: 'CONFIG_TSC210X', if_true: files('tsc210x.c'))
-softmmu_ss.add(when: 'CONFIG_LASIPS2', if_true: files('lasips2.c'))
+system_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_keypad.c'))
+system_ss.add(when: 'CONFIG_TSC210X', if_true: files('tsc210x.c'))
+system_ss.add(when: 'CONFIG_LASIPS2', if_true: files('lasips2.c'))
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 8be459b41c..ed355941d1 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -1,40 +1,40 @@
-softmmu_ss.add(files('intc.c'))
-softmmu_ss.add(when: 'CONFIG_ARM_GIC', if_true: files(
+system_ss.add(files('intc.c'))
+system_ss.add(when: 'CONFIG_ARM_GIC', if_true: files(
   'arm_gic.c',
   'arm_gic_common.c',
   'arm_gicv2m.c',
   'arm_gicv3_common.c',
   'arm_gicv3_its_common.c',
 ))
-softmmu_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files(
+system_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files(
   'arm_gicv3.c',
   'arm_gicv3_dist.c',
   'arm_gicv3_its.c',
   'arm_gicv3_redist.c',
 ))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
-softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_vic.c'))
-softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
-softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c', 'exynos4210_combiner.c'))
-softmmu_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
-softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
-softmmu_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
-softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
-softmmu_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'))
-softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
-softmmu_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
-softmmu_ss.add(when: 'CONFIG_PL190', if_true: files('pl190.c'))
-softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c', 'bcm2836_control.c'))
-softmmu_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_gic.c'))
-softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_intctl.c'))
-softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_intc.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-ipi.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-pmu-iomod-intc.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
+system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_vic.c'))
+system_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
+system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c', 'exynos4210_combiner.c'))
+system_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
+system_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
+system_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
+system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
+system_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'))
+system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
+system_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
+system_ss.add(when: 'CONFIG_PL190', if_true: files('pl190.c'))
+system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c', 'bcm2836_control.c'))
+system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_gic.c'))
+system_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_intctl.c'))
+system_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_intc.c'))
+system_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-ipi.c'))
+system_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-pmu-iomod-intc.c'))
 
 if config_all_devices.has_key('CONFIG_APIC') or \
    config_all_devices.has_key('CONFIG_I8259') or \
    config_all_devices.has_key('CONFIG_MC146818RTC')
-    softmmu_ss.add(files('kvm_irqcount.c'))
+    system_ss.add(files('kvm_irqcount.c'))
 endif
 
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
diff --git a/hw/ipack/meson.build b/hw/ipack/meson.build
index 3f8138b6f2..26567f1068 100644
--- a/hw/ipack/meson.build
+++ b/hw/ipack/meson.build
@@ -1 +1 @@
-softmmu_ss.add(when: 'CONFIG_IPACK', if_true: files('ipack.c', 'tpci200.c'))
+system_ss.add(when: 'CONFIG_IPACK', if_true: files('ipack.c', 'tpci200.c'))
diff --git a/hw/ipmi/meson.build b/hw/ipmi/meson.build
index 9622ea2a2c..07f109d365 100644
--- a/hw/ipmi/meson.build
+++ b/hw/ipmi/meson.build
@@ -8,4 +8,4 @@ ipmi_ss.add(when: 'CONFIG_ISA_IPMI_BT', if_true: files('isa_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_PCI_IPMI_BT', if_true: files('pci_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_IPMI_SSIF', if_true: files('smbus_ipmi.c'))
 
-softmmu_ss.add_all(when: 'CONFIG_IPMI', if_true: ipmi_ss)
+system_ss.add_all(when: 'CONFIG_IPMI', if_true: ipmi_ss)
diff --git a/hw/isa/meson.build b/hw/isa/meson.build
index 8bf678ca0a..b855e81276 100644
--- a/hw/isa/meson.build
+++ b/hw/isa/meson.build
@@ -1,11 +1,11 @@
-softmmu_ss.add(when: 'CONFIG_APM', if_true: files('apm.c'))
-softmmu_ss.add(when: 'CONFIG_I82378', if_true: files('i82378.c'))
-softmmu_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('isa-bus.c'))
-softmmu_ss.add(when: 'CONFIG_ISA_SUPERIO', if_true: files('isa-superio.c'))
-softmmu_ss.add(when: 'CONFIG_PC87312', if_true: files('pc87312.c'))
-softmmu_ss.add(when: 'CONFIG_PIIX3', if_true: files('piix3.c'))
-softmmu_ss.add(when: 'CONFIG_PIIX4', if_true: files('piix4.c'))
-softmmu_ss.add(when: 'CONFIG_SMC37C669', if_true: files('smc37c669-superio.c'))
-softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('vt82c686.c'))
+system_ss.add(when: 'CONFIG_APM', if_true: files('apm.c'))
+system_ss.add(when: 'CONFIG_I82378', if_true: files('i82378.c'))
+system_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('isa-bus.c'))
+system_ss.add(when: 'CONFIG_ISA_SUPERIO', if_true: files('isa-superio.c'))
+system_ss.add(when: 'CONFIG_PC87312', if_true: files('pc87312.c'))
+system_ss.add(when: 'CONFIG_PIIX3', if_true: files('piix3.c'))
+system_ss.add(when: 'CONFIG_PIIX4', if_true: files('piix4.c'))
+system_ss.add(when: 'CONFIG_SMC37C669', if_true: files('smc37c669-superio.c'))
+system_ss.add(when: 'CONFIG_VT82C686', if_true: files('vt82c686.c'))
 
 specific_ss.add(when: 'CONFIG_LPC_ICH9', if_true: files('lpc_ich9.c'))
diff --git a/hw/mem/meson.build b/hw/mem/meson.build
index 56c2618b84..ec26ef5544 100644
--- a/hw/mem/meson.build
+++ b/hw/mem/meson.build
@@ -4,9 +4,9 @@ mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
 mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
 mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
 mem_ss.add(when: 'CONFIG_CXL_MEM_DEVICE', if_true: files('cxl_type3.c'))
-softmmu_ss.add(when: 'CONFIG_CXL_MEM_DEVICE', if_false: files('cxl_type3_stubs.c'))
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('cxl_type3_stubs.c'))
+system_ss.add(when: 'CONFIG_CXL_MEM_DEVICE', if_false: files('cxl_type3_stubs.c'))
+system_ss.add(when: 'CONFIG_ALL', if_true: files('cxl_type3_stubs.c'))
 
-softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
+system_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
 
-softmmu_ss.add(when: 'CONFIG_SPARSE_MEM', if_true: files('sparse-mem.c'))
+system_ss.add(when: 'CONFIG_SPARSE_MEM', if_true: files('sparse-mem.c'))
diff --git a/hw/misc/macio/meson.build b/hw/misc/macio/meson.build
index 17282da20a..8984b818b0 100644
--- a/hw/misc/macio/meson.build
+++ b/hw/misc/macio/meson.build
@@ -5,4 +5,4 @@ macio_ss.add(when: 'CONFIG_MACIO_GPIO', if_true: files('gpio.c'))
 macio_ss.add(when: 'CONFIG_MAC_DBDMA', if_true: files('mac_dbdma.c'))
 macio_ss.add(when: 'CONFIG_MAC_PMU', if_true: files('pmu.c'))
 
-softmmu_ss.add_all(when: 'CONFIG_MACIO', if_true: macio_ss)
+system_ss.add_all(when: 'CONFIG_MACIO', if_true: macio_ss)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 78ca857c9d..05877f61cc 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -1,58 +1,58 @@
-softmmu_ss.add(when: 'CONFIG_APPLESMC', if_true: files('applesmc.c'))
-softmmu_ss.add(when: 'CONFIG_EDU', if_true: files('edu.c'))
-softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('vmcoreinfo.c'))
-softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugexit.c'))
-softmmu_ss.add(when: 'CONFIG_ISA_TESTDEV', if_true: files('pc-testdev.c'))
-softmmu_ss.add(when: 'CONFIG_PCA9552', if_true: files('pca9552.c'))
-softmmu_ss.add(when: 'CONFIG_PCI_TESTDEV', if_true: files('pci-testdev.c'))
-softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
-softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
-softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
-softmmu_ss.add(when: 'CONFIG_PVPANIC_COMMON', if_true: files('pvpanic.c'))
+system_ss.add(when: 'CONFIG_APPLESMC', if_true: files('applesmc.c'))
+system_ss.add(when: 'CONFIG_EDU', if_true: files('edu.c'))
+system_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('vmcoreinfo.c'))
+system_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugexit.c'))
+system_ss.add(when: 'CONFIG_ISA_TESTDEV', if_true: files('pc-testdev.c'))
+system_ss.add(when: 'CONFIG_PCA9552', if_true: files('pca9552.c'))
+system_ss.add(when: 'CONFIG_PCI_TESTDEV', if_true: files('pci-testdev.c'))
+system_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
+system_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
+system_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
+system_ss.add(when: 'CONFIG_PVPANIC_COMMON', if_true: files('pvpanic.c'))
 
 # ARM devices
-softmmu_ss.add(when: 'CONFIG_PL310', if_true: files('arm_l2x0.c'))
-softmmu_ss.add(when: 'CONFIG_INTEGRATOR_DEBUG', if_true: files('arm_integrator_debug.c'))
-softmmu_ss.add(when: 'CONFIG_A9SCU', if_true: files('a9scu.c'))
-softmmu_ss.add(when: 'CONFIG_ARM11SCU', if_true: files('arm11scu.c'))
+system_ss.add(when: 'CONFIG_PL310', if_true: files('arm_l2x0.c'))
+system_ss.add(when: 'CONFIG_INTEGRATOR_DEBUG', if_true: files('arm_integrator_debug.c'))
+system_ss.add(when: 'CONFIG_A9SCU', if_true: files('a9scu.c'))
+system_ss.add(when: 'CONFIG_ARM11SCU', if_true: files('arm11scu.c'))
 
-softmmu_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_ras.c'))
+system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_ras.c'))
 
 # Mac devices
-softmmu_ss.add(when: 'CONFIG_MOS6522', if_true: files('mos6522.c'))
+system_ss.add(when: 'CONFIG_MOS6522', if_true: files('mos6522.c'))
 
 # virt devices
-softmmu_ss.add(when: 'CONFIG_VIRT_CTRL', if_true: files('virt_ctrl.c'))
+system_ss.add(when: 'CONFIG_VIRT_CTRL', if_true: files('virt_ctrl.c'))
 
 # RISC-V devices
-softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_DMC', if_true: files('mchp_pfsoc_dmc.c'))
-softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_IOSCB', if_true: files('mchp_pfsoc_ioscb.c'))
-softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_SYSREG', if_true: files('mchp_pfsoc_sysreg.c'))
-softmmu_ss.add(when: 'CONFIG_SIFIVE_TEST', if_true: files('sifive_test.c'))
-softmmu_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true: files('sifive_e_prci.c'))
-softmmu_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true: files('sifive_u_otp.c'))
-softmmu_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_prci.c'))
+system_ss.add(when: 'CONFIG_MCHP_PFSOC_DMC', if_true: files('mchp_pfsoc_dmc.c'))
+system_ss.add(when: 'CONFIG_MCHP_PFSOC_IOSCB', if_true: files('mchp_pfsoc_ioscb.c'))
+system_ss.add(when: 'CONFIG_MCHP_PFSOC_SYSREG', if_true: files('mchp_pfsoc_sysreg.c'))
+system_ss.add(when: 'CONFIG_SIFIVE_TEST', if_true: files('sifive_test.c'))
+system_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true: files('sifive_e_prci.c'))
+system_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true: files('sifive_u_otp.c'))
+system_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_prci.c'))
 
 subdir('macio')
 
-softmmu_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem.c'))
+system_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem.c'))
 
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_SRAMC', if_true: files('allwinner-sramc.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_CCM', if_true: files('allwinner-a10-ccm.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_DRAMC', if_true: files('allwinner-a10-dramc.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-ccu.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_SRAMC', if_true: files('allwinner-sramc.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_A10_CCM', if_true: files('allwinner-a10-ccm.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_A10_DRAMC', if_true: files('allwinner-a10-dramc.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-ccu.c'))
 specific_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-cpucfg.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-dramc.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-sysctrl.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-sid.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40-ccu.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40-dramc.c'))
-softmmu_ss.add(when: 'CONFIG_AXP2XX_PMU', if_true: files('axp2xx.c'))
-softmmu_ss.add(when: 'CONFIG_REALVIEW', if_true: files('arm_sysctl.c'))
-softmmu_ss.add(when: 'CONFIG_NSERIES', if_true: files('cbus.c'))
-softmmu_ss.add(when: 'CONFIG_ECCMEMCTL', if_true: files('eccmemctl.c'))
-softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_pmu.c', 'exynos4210_clk.c', 'exynos4210_rng.c'))
-softmmu_ss.add(when: 'CONFIG_IMX', if_true: files(
+system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-dramc.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-sysctrl.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-sid.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40-ccu.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40-dramc.c'))
+system_ss.add(when: 'CONFIG_AXP2XX_PMU', if_true: files('axp2xx.c'))
+system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('arm_sysctl.c'))
+system_ss.add(when: 'CONFIG_NSERIES', if_true: files('cbus.c'))
+system_ss.add(when: 'CONFIG_ECCMEMCTL', if_true: files('eccmemctl.c'))
+system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_pmu.c', 'exynos4210_clk.c', 'exynos4210_rng.c'))
+system_ss.add(when: 'CONFIG_IMX', if_true: files(
   'imx25_ccm.c',
   'imx31_ccm.c',
   'imx6_ccm.c',
@@ -64,22 +64,22 @@ softmmu_ss.add(when: 'CONFIG_IMX', if_true: files(
   'imx_ccm.c',
   'imx_rngc.c',
 ))
-softmmu_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mst_fpga.c'))
-softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
+system_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mst_fpga.c'))
+system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
   'npcm7xx_clk.c',
   'npcm7xx_gcr.c',
   'npcm7xx_mft.c',
   'npcm7xx_pwm.c',
   'npcm7xx_rng.c',
 ))
-softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files(
+system_ss.add(when: 'CONFIG_OMAP', if_true: files(
   'omap_clk.c',
   'omap_gpmc.c',
   'omap_l4.c',
   'omap_sdrc.c',
   'omap_tap.c',
 ))
-softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
+system_ss.add(when: 'CONFIG_RASPI', if_true: files(
   'bcm2835_mbox.c',
   'bcm2835_mphi.c',
   'bcm2835_property.c',
@@ -88,35 +88,35 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
   'bcm2835_cprman.c',
   'bcm2835_powermgt.c',
 ))
-softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
-softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-apu-ctrl.c'))
+system_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
+system_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
+system_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
+system_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-apu-ctrl.c'))
 specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-crl.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(
+system_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(
   'xlnx-versal-xramc.c',
   'xlnx-versal-pmc-iou-slcr.c',
 ))
-softmmu_ss.add(when: 'CONFIG_STM32F2XX_SYSCFG', if_true: files('stm32f2xx_syscfg.c'))
-softmmu_ss.add(when: 'CONFIG_STM32F4XX_SYSCFG', if_true: files('stm32f4xx_syscfg.c'))
-softmmu_ss.add(when: 'CONFIG_STM32F4XX_EXTI', if_true: files('stm32f4xx_exti.c'))
-softmmu_ss.add(when: 'CONFIG_MPS2_FPGAIO', if_true: files('mps2-fpgaio.c'))
-softmmu_ss.add(when: 'CONFIG_MPS2_SCC', if_true: files('mps2-scc.c'))
+system_ss.add(when: 'CONFIG_STM32F2XX_SYSCFG', if_true: files('stm32f2xx_syscfg.c'))
+system_ss.add(when: 'CONFIG_STM32F4XX_SYSCFG', if_true: files('stm32f4xx_syscfg.c'))
+system_ss.add(when: 'CONFIG_STM32F4XX_EXTI', if_true: files('stm32f4xx_exti.c'))
+system_ss.add(when: 'CONFIG_MPS2_FPGAIO', if_true: files('mps2-fpgaio.c'))
+system_ss.add(when: 'CONFIG_MPS2_SCC', if_true: files('mps2-scc.c'))
 
-softmmu_ss.add(when: 'CONFIG_TZ_MPC', if_true: files('tz-mpc.c'))
-softmmu_ss.add(when: 'CONFIG_TZ_MSC', if_true: files('tz-msc.c'))
-softmmu_ss.add(when: 'CONFIG_TZ_PPC', if_true: files('tz-ppc.c'))
-softmmu_ss.add(when: 'CONFIG_IOTKIT_SECCTL', if_true: files('iotkit-secctl.c'))
-softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSCTL', if_true: files('iotkit-sysctl.c'))
-softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSINFO', if_true: files('iotkit-sysinfo.c'))
-softmmu_ss.add(when: 'CONFIG_ARMSSE_CPU_PWRCTRL', if_true: files('armsse-cpu-pwrctrl.c'))
-softmmu_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: files('armsse-cpuid.c'))
-softmmu_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
+system_ss.add(when: 'CONFIG_TZ_MPC', if_true: files('tz-mpc.c'))
+system_ss.add(when: 'CONFIG_TZ_MSC', if_true: files('tz-msc.c'))
+system_ss.add(when: 'CONFIG_TZ_PPC', if_true: files('tz-ppc.c'))
+system_ss.add(when: 'CONFIG_IOTKIT_SECCTL', if_true: files('iotkit-secctl.c'))
+system_ss.add(when: 'CONFIG_IOTKIT_SYSCTL', if_true: files('iotkit-sysctl.c'))
+system_ss.add(when: 'CONFIG_IOTKIT_SYSINFO', if_true: files('iotkit-sysinfo.c'))
+system_ss.add(when: 'CONFIG_ARMSSE_CPU_PWRCTRL', if_true: files('armsse-cpu-pwrctrl.c'))
+system_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: files('armsse-cpuid.c'))
+system_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
 
-softmmu_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
-softmmu_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
-softmmu_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
-softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
+system_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
+system_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
+system_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
+system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_hace.c',
   'aspeed_i3c.c',
   'aspeed_lpc.c',
@@ -126,12 +126,12 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_xdma.c',
   'aspeed_peci.c'))
 
-softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
-softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
+system_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
+system_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
 
-softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
+system_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
 
-softmmu_ss.add(when: 'CONFIG_I2C', if_true: files('i2c-echo.c'))
+system_ss.add(when: 'CONFIG_I2C', if_true: files('i2c-echo.c'))
 
 specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c'))
 
@@ -140,7 +140,7 @@ specific_ss.add(when: 'CONFIG_MAC_VIA', if_true: files('mac_via.c'))
 specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_cmgcr.c', 'mips_cpc.c'))
 specific_ss.add(when: 'CONFIG_MIPS_ITU', if_true: files('mips_itu.c'))
 
-softmmu_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
+system_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
 
 # HPPA devices
-softmmu_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
+system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
diff --git a/hw/net/can/meson.build b/hw/net/can/meson.build
index 8d85201cb0..7382344628 100644
--- a/hw/net/can/meson.build
+++ b/hw/net/can/meson.build
@@ -1,8 +1,8 @@
-softmmu_ss.add(when: 'CONFIG_CAN_SJA1000', if_true: files('can_sja1000.c'))
-softmmu_ss.add(when: 'CONFIG_CAN_PCI', if_true: files('can_kvaser_pci.c'))
-softmmu_ss.add(when: 'CONFIG_CAN_PCI', if_true: files('can_pcm3680_pci.c'))
-softmmu_ss.add(when: 'CONFIG_CAN_PCI', if_true: files('can_mioe3680_pci.c'))
-softmmu_ss.add(when: 'CONFIG_CAN_CTUCANFD', if_true: files('ctucan_core.c'))
-softmmu_ss.add(when: 'CONFIG_CAN_CTUCANFD_PCI', if_true: files('ctucan_pci.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-can.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-canfd.c'))
+system_ss.add(when: 'CONFIG_CAN_SJA1000', if_true: files('can_sja1000.c'))
+system_ss.add(when: 'CONFIG_CAN_PCI', if_true: files('can_kvaser_pci.c'))
+system_ss.add(when: 'CONFIG_CAN_PCI', if_true: files('can_pcm3680_pci.c'))
+system_ss.add(when: 'CONFIG_CAN_PCI', if_true: files('can_mioe3680_pci.c'))
+system_ss.add(when: 'CONFIG_CAN_CTUCANFD', if_true: files('ctucan_core.c'))
+system_ss.add(when: 'CONFIG_CAN_CTUCANFD_PCI', if_true: files('ctucan_pci.c'))
+system_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-can.c'))
+system_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-canfd.c'))
diff --git a/hw/net/meson.build b/hw/net/meson.build
index a7860c5efe..2632634df3 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -1,75 +1,75 @@
-softmmu_ss.add(when: 'CONFIG_DP8393X', if_true: files('dp8393x.c'))
-softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_nic.c'))
-softmmu_ss.add(when: 'CONFIG_NE2000_COMMON', if_true: files('ne2000.c'))
+system_ss.add(when: 'CONFIG_DP8393X', if_true: files('dp8393x.c'))
+system_ss.add(when: 'CONFIG_XEN', if_true: files('xen_nic.c'))
+system_ss.add(when: 'CONFIG_NE2000_COMMON', if_true: files('ne2000.c'))
 
 # PCI network cards
-softmmu_ss.add(when: 'CONFIG_NE2000_PCI', if_true: files('ne2000-pci.c'))
-softmmu_ss.add(when: 'CONFIG_EEPRO100_PCI', if_true: files('eepro100.c'))
-softmmu_ss.add(when: 'CONFIG_PCNET_PCI', if_true: files('pcnet-pci.c'))
-softmmu_ss.add(when: 'CONFIG_PCNET_COMMON', if_true: files('pcnet.c'))
-softmmu_ss.add(when: 'CONFIG_E1000_PCI', if_true: files('e1000.c', 'e1000x_common.c'))
-softmmu_ss.add(when: 'CONFIG_E1000E_PCI_EXPRESS', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
-softmmu_ss.add(when: 'CONFIG_E1000E_PCI_EXPRESS', if_true: files('e1000e.c', 'e1000e_core.c', 'e1000x_common.c'))
-softmmu_ss.add(when: 'CONFIG_IGB_PCI_EXPRESS', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
-softmmu_ss.add(when: 'CONFIG_IGB_PCI_EXPRESS', if_true: files('igb.c', 'igbvf.c', 'igb_core.c'))
-softmmu_ss.add(when: 'CONFIG_RTL8139_PCI', if_true: files('rtl8139.c'))
-softmmu_ss.add(when: 'CONFIG_TULIP', if_true: files('tulip.c'))
-softmmu_ss.add(when: 'CONFIG_VMXNET3_PCI', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
-softmmu_ss.add(when: 'CONFIG_VMXNET3_PCI', if_true: files('vmxnet3.c'))
+system_ss.add(when: 'CONFIG_NE2000_PCI', if_true: files('ne2000-pci.c'))
+system_ss.add(when: 'CONFIG_EEPRO100_PCI', if_true: files('eepro100.c'))
+system_ss.add(when: 'CONFIG_PCNET_PCI', if_true: files('pcnet-pci.c'))
+system_ss.add(when: 'CONFIG_PCNET_COMMON', if_true: files('pcnet.c'))
+system_ss.add(when: 'CONFIG_E1000_PCI', if_true: files('e1000.c', 'e1000x_common.c'))
+system_ss.add(when: 'CONFIG_E1000E_PCI_EXPRESS', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
+system_ss.add(when: 'CONFIG_E1000E_PCI_EXPRESS', if_true: files('e1000e.c', 'e1000e_core.c', 'e1000x_common.c'))
+system_ss.add(when: 'CONFIG_IGB_PCI_EXPRESS', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
+system_ss.add(when: 'CONFIG_IGB_PCI_EXPRESS', if_true: files('igb.c', 'igbvf.c', 'igb_core.c'))
+system_ss.add(when: 'CONFIG_RTL8139_PCI', if_true: files('rtl8139.c'))
+system_ss.add(when: 'CONFIG_TULIP', if_true: files('tulip.c'))
+system_ss.add(when: 'CONFIG_VMXNET3_PCI', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
+system_ss.add(when: 'CONFIG_VMXNET3_PCI', if_true: files('vmxnet3.c'))
 
-softmmu_ss.add(when: 'CONFIG_SMC91C111', if_true: files('smc91c111.c'))
-softmmu_ss.add(when: 'CONFIG_LAN9118', if_true: files('lan9118.c'))
-softmmu_ss.add(when: 'CONFIG_NE2000_ISA', if_true: files('ne2000-isa.c'))
-softmmu_ss.add(when: 'CONFIG_OPENCORES_ETH', if_true: files('opencores_eth.c'))
-softmmu_ss.add(when: 'CONFIG_XGMAC', if_true: files('xgmac.c'))
-softmmu_ss.add(when: 'CONFIG_MIPSNET', if_true: files('mipsnet.c'))
-softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('xilinx_axienet.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_EMAC', if_true: files('allwinner_emac.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_SUN8I_EMAC', if_true: files('allwinner-sun8i-emac.c'))
-softmmu_ss.add(when: 'CONFIG_IMX_FEC', if_true: files('imx_fec.c'))
-softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-emac.c'))
-softmmu_ss.add(when: 'CONFIG_MARVELL_88W8618', if_true: files('mv88w8618_eth.c'))
+system_ss.add(when: 'CONFIG_SMC91C111', if_true: files('smc91c111.c'))
+system_ss.add(when: 'CONFIG_LAN9118', if_true: files('lan9118.c'))
+system_ss.add(when: 'CONFIG_NE2000_ISA', if_true: files('ne2000-isa.c'))
+system_ss.add(when: 'CONFIG_OPENCORES_ETH', if_true: files('opencores_eth.c'))
+system_ss.add(when: 'CONFIG_XGMAC', if_true: files('xgmac.c'))
+system_ss.add(when: 'CONFIG_MIPSNET', if_true: files('mipsnet.c'))
+system_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('xilinx_axienet.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_EMAC', if_true: files('allwinner_emac.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_SUN8I_EMAC', if_true: files('allwinner-sun8i-emac.c'))
+system_ss.add(when: 'CONFIG_IMX_FEC', if_true: files('imx_fec.c'))
+system_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-emac.c'))
+system_ss.add(when: 'CONFIG_MARVELL_88W8618', if_true: files('mv88w8618_eth.c'))
 
-softmmu_ss.add(when: 'CONFIG_CADENCE', if_true: files('cadence_gem.c'))
-softmmu_ss.add(when: 'CONFIG_STELLARIS_ENET', if_true: files('stellaris_enet.c'))
-softmmu_ss.add(when: 'CONFIG_LANCE', if_true: files('lance.c'))
-softmmu_ss.add(when: 'CONFIG_LASI_I82596', if_true: files('lasi_i82596.c'))
-softmmu_ss.add(when: 'CONFIG_I82596_COMMON', if_true: files('i82596.c'))
-softmmu_ss.add(when: 'CONFIG_SUNHME', if_true: files('sunhme.c'))
-softmmu_ss.add(when: 'CONFIG_FTGMAC100', if_true: files('ftgmac100.c'))
-softmmu_ss.add(when: 'CONFIG_SUNGEM', if_true: files('sungem.c'))
-softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_emc.c'))
+system_ss.add(when: 'CONFIG_CADENCE', if_true: files('cadence_gem.c'))
+system_ss.add(when: 'CONFIG_STELLARIS_ENET', if_true: files('stellaris_enet.c'))
+system_ss.add(when: 'CONFIG_LANCE', if_true: files('lance.c'))
+system_ss.add(when: 'CONFIG_LASI_I82596', if_true: files('lasi_i82596.c'))
+system_ss.add(when: 'CONFIG_I82596_COMMON', if_true: files('i82596.c'))
+system_ss.add(when: 'CONFIG_SUNHME', if_true: files('sunhme.c'))
+system_ss.add(when: 'CONFIG_FTGMAC100', if_true: files('ftgmac100.c'))
+system_ss.add(when: 'CONFIG_SUNGEM', if_true: files('sungem.c'))
+system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_emc.c'))
 
-softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_eth.c'))
-softmmu_ss.add(when: 'CONFIG_COLDFIRE', if_true: files('mcf_fec.c'))
+system_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_eth.c'))
+system_ss.add(when: 'CONFIG_COLDFIRE', if_true: files('mcf_fec.c'))
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_llan.c'))
-softmmu_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true: files('xilinx_ethlite.c'))
+system_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true: files('xilinx_ethlite.c'))
 
-softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('net_rx_pkt.c'))
+system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('net_rx_pkt.c'))
 specific_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c'))
 
 if have_vhost_net
-  softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost_net.c'), if_false: files('vhost_net-stub.c'))
-  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost_net-stub.c'))
+  system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost_net.c'), if_false: files('vhost_net-stub.c'))
+  system_ss.add(when: 'CONFIG_ALL', if_true: files('vhost_net-stub.c'))
 else
-  softmmu_ss.add(files('vhost_net-stub.c'))
+  system_ss.add(files('vhost_net-stub.c'))
 endif
 
-softmmu_ss.add(when: 'CONFIG_ETSEC', if_true: files(
+system_ss.add(when: 'CONFIG_ETSEC', if_true: files(
   'fsl_etsec/etsec.c',
   'fsl_etsec/miim.c',
   'fsl_etsec/registers.c',
   'fsl_etsec/rings.c',
 ))
 
-softmmu_ss.add(when: 'CONFIG_ROCKER', if_true: files(
+system_ss.add(when: 'CONFIG_ROCKER', if_true: files(
   'rocker/rocker.c',
   'rocker/rocker_desc.c',
   'rocker/rocker_fp.c',
   'rocker/rocker_of_dpa.c',
   'rocker/rocker_world.c',
 ), if_false: files('rocker/qmp-norocker.c'))
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('rocker/qmp-norocker.c'))
-softmmu_ss.add(files('rocker/rocker-hmp-cmds.c'))
+system_ss.add(when: 'CONFIG_ALL', if_true: files('rocker/qmp-norocker.c'))
+system_ss.add(files('rocker/rocker-hmp-cmds.c'))
 
 subdir('can')
diff --git a/hw/nubus/meson.build b/hw/nubus/meson.build
index 9287c633aa..e7ebda8993 100644
--- a/hw/nubus/meson.build
+++ b/hw/nubus/meson.build
@@ -4,4 +4,4 @@ nubus_ss.add(files('nubus-bus.c'))
 nubus_ss.add(files('nubus-bridge.c'))
 nubus_ss.add(when: 'CONFIG_Q800', if_true: files('mac-nubus-bridge.c'))
 
-softmmu_ss.add_all(when: 'CONFIG_NUBUS', if_true: nubus_ss)
+system_ss.add_all(when: 'CONFIG_NUBUS', if_true: nubus_ss)
diff --git a/hw/nvme/meson.build b/hw/nvme/meson.build
index 3cf40046ee..1a6a2ca2f3 100644
--- a/hw/nvme/meson.build
+++ b/hw/nvme/meson.build
@@ -1 +1 @@
-softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c', 'dif.c', 'ns.c', 'subsys.c'))
+system_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('ctrl.c', 'dif.c', 'ns.c', 'subsys.c'))
diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index f5ee9f6b88..988dff6f8e 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -3,21 +3,21 @@ if have_system or have_tools
   qom_ss.add(files('fw_cfg-interface.c'))
 endif
 
-softmmu_ss.add(files('fw_cfg.c'))
-softmmu_ss.add(when: 'CONFIG_CHRP_NVRAM', if_true: files('chrp_nvram.c'))
-softmmu_ss.add(when: 'CONFIG_DS1225Y', if_true: files('ds1225y.c'))
-softmmu_ss.add(when: 'CONFIG_NMC93XX_EEPROM', if_true: files('eeprom93xx.c'))
-softmmu_ss.add(when: 'CONFIG_AT24C', if_true: files('eeprom_at24c.c'))
-softmmu_ss.add(when: 'CONFIG_MAC_NVRAM', if_true: files('mac_nvram.c'))
-softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_otp.c'))
-softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_nvm.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE_CRC', if_true: files('xlnx-efuse-crc.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE', if_true: files('xlnx-efuse.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE_VERSAL', if_true: files(
+system_ss.add(files('fw_cfg.c'))
+system_ss.add(when: 'CONFIG_CHRP_NVRAM', if_true: files('chrp_nvram.c'))
+system_ss.add(when: 'CONFIG_DS1225Y', if_true: files('ds1225y.c'))
+system_ss.add(when: 'CONFIG_NMC93XX_EEPROM', if_true: files('eeprom93xx.c'))
+system_ss.add(when: 'CONFIG_AT24C', if_true: files('eeprom_at24c.c'))
+system_ss.add(when: 'CONFIG_MAC_NVRAM', if_true: files('mac_nvram.c'))
+system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_otp.c'))
+system_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_nvm.c'))
+system_ss.add(when: 'CONFIG_XLNX_EFUSE_CRC', if_true: files('xlnx-efuse-crc.c'))
+system_ss.add(when: 'CONFIG_XLNX_EFUSE', if_true: files('xlnx-efuse.c'))
+system_ss.add(when: 'CONFIG_XLNX_EFUSE_VERSAL', if_true: files(
                                                    'xlnx-versal-efuse-cache.c',
                                                    'xlnx-versal-efuse-ctrl.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_EFUSE_ZYNQMP', if_true: files(
+system_ss.add(when: 'CONFIG_XLNX_EFUSE_ZYNQMP', if_true: files(
                                                    'xlnx-zynqmp-efuse.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_BBRAM', if_true: files('xlnx-bbram.c'))
+system_ss.add(when: 'CONFIG_XLNX_BBRAM', if_true: files('xlnx-bbram.c'))
 
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_nvram.c'))
diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
index 0edc6c7cbf..6d5ad9f37b 100644
--- a/hw/pci-bridge/meson.build
+++ b/hw/pci-bridge/meson.build
@@ -12,6 +12,6 @@ pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c', 'cxl_upstream.c
 # Sun4u
 pci_ss.add(when: 'CONFIG_SIMBA', if_true: files('simba.c'))
 
-softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
+system_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
 
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('pci_expander_bridge_stubs.c'))
+system_ss.add(when: 'CONFIG_ALL', if_true: files('pci_expander_bridge_stubs.c'))
diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index 9a813d552e..64eada76fe 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -29,7 +29,7 @@ pci_ss.add(when: 'CONFIG_VERSATILE_PCI', if_true: files('versatile.c'))
 # HPPA devices
 pci_ss.add(when: 'CONFIG_DINO', if_true: files('dino.c'))
 
-softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
+system_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
 
 specific_ss.add(when: 'CONFIG_PCI_POWERNV', if_true: files(
   'pnv_phb3.c',
diff --git a/hw/pci/meson.build b/hw/pci/meson.build
index 4fcd888b27..b1855452f5 100644
--- a/hw/pci/meson.build
+++ b/hw/pci/meson.build
@@ -16,8 +16,8 @@ pci_ss.add(files(
 # CONFIG_PCI_EXPRESS=n.
 pci_ss.add(files('pcie.c', 'pcie_aer.c'))
 pci_ss.add(files('pcie_doe.c'))
-softmmu_ss.add(when: 'CONFIG_PCI_EXPRESS', if_true: files('pcie_port.c', 'pcie_host.c'))
-softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
+system_ss.add(when: 'CONFIG_PCI_EXPRESS', if_true: files('pcie_port.c', 'pcie_host.c'))
+system_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
 
-softmmu_ss.add(when: 'CONFIG_PCI', if_false: files('pci-stub.c'))
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('pci-stub.c'))
+system_ss.add(when: 'CONFIG_PCI', if_false: files('pci-stub.c'))
+system_ss.add(when: 'CONFIG_ALL', if_true: files('pci-stub.c'))
diff --git a/hw/pcmcia/meson.build b/hw/pcmcia/meson.build
index 51f2512b8e..04e29c109c 100644
--- a/hw/pcmcia/meson.build
+++ b/hw/pcmcia/meson.build
@@ -1,2 +1,2 @@
-softmmu_ss.add(when: 'CONFIG_PCMCIA', if_true: files('pcmcia.c'))
-softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx.c'))
+system_ss.add(when: 'CONFIG_PCMCIA', if_true: files('pcmcia.c'))
+system_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx.c'))
diff --git a/hw/rdma/meson.build b/hw/rdma/meson.build
index fc7917192f..363c9b8c83 100644
--- a/hw/rdma/meson.build
+++ b/hw/rdma/meson.build
@@ -1,4 +1,4 @@
-softmmu_ss.add(when: 'CONFIG_VMW_PVRDMA', if_true: files(
+system_ss.add(when: 'CONFIG_VMW_PVRDMA', if_true: files(
   'rdma.c',
   'rdma_backend.c',
   'rdma_utils.c',
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index ab25c04906..a1e8708c73 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -14,4 +14,4 @@ remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: libvfio_user_dep)
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('memory.c'))
 specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy-memory-listener.c'))
 
-softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
+system_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
index 34a4d316fa..3ea2affe0b 100644
--- a/hw/rtc/meson.build
+++ b/hw/rtc/meson.build
@@ -1,16 +1,16 @@
 
-softmmu_ss.add(when: 'CONFIG_DS1338', if_true: files('ds1338.c'))
-softmmu_ss.add(when: 'CONFIG_M41T80', if_true: files('m41t80.c'))
-softmmu_ss.add(when: 'CONFIG_M48T59', if_true: files('m48t59.c'))
-softmmu_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
-softmmu_ss.add(when: 'CONFIG_TWL92230', if_true: files('twl92230.c'))
-softmmu_ss.add(when: ['CONFIG_ISA_BUS', 'CONFIG_M48T59'], if_true: files('m48t59-isa.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-rtc.c'))
+system_ss.add(when: 'CONFIG_DS1338', if_true: files('ds1338.c'))
+system_ss.add(when: 'CONFIG_M41T80', if_true: files('m41t80.c'))
+system_ss.add(when: 'CONFIG_M48T59', if_true: files('m48t59.c'))
+system_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
+system_ss.add(when: 'CONFIG_TWL92230', if_true: files('twl92230.c'))
+system_ss.add(when: ['CONFIG_ISA_BUS', 'CONFIG_M48T59'], if_true: files('m48t59-isa.c'))
+system_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-rtc.c'))
 
-softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_rtc.c'))
-softmmu_ss.add(when: 'CONFIG_SUN4V_RTC', if_true: files('sun4v-rtc.c'))
-softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_rtc.c'))
-softmmu_ss.add(when: 'CONFIG_GOLDFISH_RTC', if_true: files('goldfish_rtc.c'))
-softmmu_ss.add(when: 'CONFIG_LS7A_RTC', if_true: files('ls7a_rtc.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-rtc.c'))
-softmmu_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))
+system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_rtc.c'))
+system_ss.add(when: 'CONFIG_SUN4V_RTC', if_true: files('sun4v-rtc.c'))
+system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_rtc.c'))
+system_ss.add(when: 'CONFIG_GOLDFISH_RTC', if_true: files('goldfish_rtc.c'))
+system_ss.add(when: 'CONFIG_LS7A_RTC', if_true: files('ls7a_rtc.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-rtc.c'))
+system_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))
diff --git a/hw/scsi/meson.build b/hw/scsi/meson.build
index 923a34f344..7a1e7f13f0 100644
--- a/hw/scsi/meson.build
+++ b/hw/scsi/meson.build
@@ -11,7 +11,7 @@ scsi_ss.add(when: 'CONFIG_LSI_SCSI_PCI', if_true: files('lsi53c895a.c'))
 scsi_ss.add(when: 'CONFIG_MEGASAS_SCSI_PCI', if_true: files('megasas.c'))
 scsi_ss.add(when: 'CONFIG_MPTSAS_SCSI_PCI', if_true: files('mptsas.c', 'mptconfig.c', 'mptendian.c'))
 scsi_ss.add(when: 'CONFIG_VMW_PVSCSI_SCSI_PCI', if_true: files('vmw_pvscsi.c'))
-softmmu_ss.add_all(when: 'CONFIG_SCSI', if_true: scsi_ss)
+system_ss.add_all(when: 'CONFIG_SCSI', if_true: scsi_ss)
 
 specific_scsi_ss = ss.source_set()
 
diff --git a/hw/sd/meson.build b/hw/sd/meson.build
index 807ca07b7c..abfac9e461 100644
--- a/hw/sd/meson.build
+++ b/hw/sd/meson.build
@@ -1,13 +1,13 @@
-softmmu_ss.add(when: 'CONFIG_PL181', if_true: files('pl181.c'))
-softmmu_ss.add(when: 'CONFIG_SD', if_true: files('sd.c', 'core.c', 'sdmmc-internal.c'))
-softmmu_ss.add(when: 'CONFIG_SDHCI', if_true: files('sdhci.c'))
-softmmu_ss.add(when: 'CONFIG_SDHCI_PCI', if_true: files('sdhci-pci.c'))
-softmmu_ss.add(when: 'CONFIG_SSI_SD', if_true: files('ssi-sd.c'))
+system_ss.add(when: 'CONFIG_PL181', if_true: files('pl181.c'))
+system_ss.add(when: 'CONFIG_SD', if_true: files('sd.c', 'core.c', 'sdmmc-internal.c'))
+system_ss.add(when: 'CONFIG_SDHCI', if_true: files('sdhci.c'))
+system_ss.add(when: 'CONFIG_SDHCI_PCI', if_true: files('sdhci-pci.c'))
+system_ss.add(when: 'CONFIG_SSI_SD', if_true: files('ssi-sd.c'))
 
-softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_mmc.c'))
-softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_mmci.c'))
-softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_sdhost.c'))
-softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_sdhci.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-sdhost.c'))
-softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_sdhci.c'))
-softmmu_ss.add(when: 'CONFIG_CADENCE_SDHCI', if_true: files('cadence_sdhci.c'))
+system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_mmc.c'))
+system_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_mmci.c'))
+system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_sdhost.c'))
+system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_sdhci.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-sdhost.c'))
+system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_sdhci.c'))
+system_ss.add(when: 'CONFIG_CADENCE_SDHCI', if_true: files('cadence_sdhci.c'))
diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
index 9e9be602c3..30e20e27b8 100644
--- a/hw/sensor/meson.build
+++ b/hw/sensor/meson.build
@@ -1,9 +1,9 @@
-softmmu_ss.add(when: 'CONFIG_TMP105', if_true: files('tmp105.c'))
-softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
-softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
-softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
-softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
-softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
-softmmu_ss.add(when: 'CONFIG_LSM303DLHC_MAG', if_true: files('lsm303dlhc_mag.c'))
-softmmu_ss.add(when: 'CONFIG_ISL_PMBUS_VR', if_true: files('isl_pmbus_vr.c'))
-softmmu_ss.add(when: 'CONFIG_MAX31785', if_true: files('max31785.c'))
+system_ss.add(when: 'CONFIG_TMP105', if_true: files('tmp105.c'))
+system_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
+system_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
+system_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
+system_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
+system_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
+system_ss.add(when: 'CONFIG_LSM303DLHC_MAG', if_true: files('lsm303dlhc_mag.c'))
+system_ss.add(when: 'CONFIG_ISL_PMBUS_VR', if_true: files('isl_pmbus_vr.c'))
+system_ss.add(when: 'CONFIG_MAX31785', if_true: files('max31785.c'))
diff --git a/hw/smbios/meson.build b/hw/smbios/meson.build
index 9e762c7108..6eeae4b35c 100644
--- a/hw/smbios/meson.build
+++ b/hw/smbios/meson.build
@@ -4,10 +4,10 @@ smbios_ss.add(when: 'CONFIG_IPMI',
               if_true: files('smbios_type_38.c'),
               if_false: files('smbios_type_38-stub.c'))
 
-softmmu_ss.add_all(when: 'CONFIG_SMBIOS', if_true: smbios_ss)
-softmmu_ss.add(when: 'CONFIG_SMBIOS', if_false: files('smbios-stub.c'))
+system_ss.add_all(when: 'CONFIG_SMBIOS', if_true: smbios_ss)
+system_ss.add(when: 'CONFIG_SMBIOS', if_false: files('smbios-stub.c'))
 
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files(
+system_ss.add(when: 'CONFIG_ALL', if_true: files(
   'smbios-stub.c',
   'smbios_type_38-stub.c',
 ))
diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
index 904a47161a..0aebcdd614 100644
--- a/hw/ssi/meson.build
+++ b/hw/ssi/meson.build
@@ -1,13 +1,13 @@
-softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_smc.c'))
-softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-spi.c'))
-softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_fiu.c', 'npcm_pspi.c'))
-softmmu_ss.add(when: 'CONFIG_PL022', if_true: files('pl022.c'))
-softmmu_ss.add(when: 'CONFIG_SIFIVE_SPI', if_true: files('sifive_spi.c'))
-softmmu_ss.add(when: 'CONFIG_SSI', if_true: files('ssi.c'))
-softmmu_ss.add(when: 'CONFIG_STM32F2XX_SPI', if_true: files('stm32f2xx_spi.c'))
-softmmu_ss.add(when: 'CONFIG_XILINX_SPI', if_true: files('xilinx_spi.c'))
-softmmu_ss.add(when: 'CONFIG_XILINX_SPIPS', if_true: files('xilinx_spips.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-ospi.c'))
-softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_spi.c'))
-softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_spi.c'))
-softmmu_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_spi_host.c'))
+system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_smc.c'))
+system_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-spi.c'))
+system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_fiu.c', 'npcm_pspi.c'))
+system_ss.add(when: 'CONFIG_PL022', if_true: files('pl022.c'))
+system_ss.add(when: 'CONFIG_SIFIVE_SPI', if_true: files('sifive_spi.c'))
+system_ss.add(when: 'CONFIG_SSI', if_true: files('ssi.c'))
+system_ss.add(when: 'CONFIG_STM32F2XX_SPI', if_true: files('stm32f2xx_spi.c'))
+system_ss.add(when: 'CONFIG_XILINX_SPI', if_true: files('xilinx_spi.c'))
+system_ss.add(when: 'CONFIG_XILINX_SPIPS', if_true: files('xilinx_spips.c'))
+system_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-ospi.c'))
+system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_spi.c'))
+system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_spi.c'))
+system_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_spi_host.c'))
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 03092e2ceb..fc632ad445 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -1,40 +1,40 @@
-softmmu_ss.add(when: 'CONFIG_A9_GTIMER', if_true: files('a9gtimer.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_PIT', if_true: files('allwinner-a10-pit.c'))
-softmmu_ss.add(when: 'CONFIG_ALTERA_TIMER', if_true: files('altera_timer.c'))
-softmmu_ss.add(when: 'CONFIG_ARM_MPTIMER', if_true: files('arm_mptimer.c'))
-softmmu_ss.add(when: 'CONFIG_ARM_TIMER', if_true: files('arm_timer.c'))
-softmmu_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_systick.c'))
-softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_timer.c'))
-softmmu_ss.add(when: 'CONFIG_CADENCE', if_true: files('cadence_ttc.c'))
-softmmu_ss.add(when: 'CONFIG_CMSDK_APB_DUALTIMER', if_true: files('cmsdk-apb-dualtimer.c'))
-softmmu_ss.add(when: 'CONFIG_CMSDK_APB_TIMER', if_true: files('cmsdk-apb-timer.c'))
-softmmu_ss.add(when: 'CONFIG_RENESAS_TMR', if_true: files('renesas_tmr.c'))
-softmmu_ss.add(when: 'CONFIG_RENESAS_CMT', if_true: files('renesas_cmt.c'))
-softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic-timer.c'))
-softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_timer.c'))
-softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_mct.c'))
-softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_pwm.c'))
-softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_gptimer.c'))
-softmmu_ss.add(when: 'CONFIG_HPET', if_true: files('hpet.c'))
-softmmu_ss.add(when: 'CONFIG_I8254', if_true: files('i8254_common.c', 'i8254.c'))
-softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_epit.c'))
-softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpt.c'))
-softmmu_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.c'))
-softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-timer.c'))
-softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_timer.c'))
-softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_timer.c'))
-softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gptimer.c'))
-softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_synctimer.c'))
-softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_timer.c'))
-softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_systmr.c'))
-softmmu_ss.add(when: 'CONFIG_SH_TIMER', if_true: files('sh_timer.c'))
-softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
-softmmu_ss.add(when: 'CONFIG_SSE_COUNTER', if_true: files('sse-counter.c'))
-softmmu_ss.add(when: 'CONFIG_SSE_TIMER', if_true: files('sse-timer.c'))
-softmmu_ss.add(when: 'CONFIG_STELLARIS_GPTM', if_true: files('stellaris-gptm.c'))
-softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
-softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
+system_ss.add(when: 'CONFIG_A9_GTIMER', if_true: files('a9gtimer.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_A10_PIT', if_true: files('allwinner-a10-pit.c'))
+system_ss.add(when: 'CONFIG_ALTERA_TIMER', if_true: files('altera_timer.c'))
+system_ss.add(when: 'CONFIG_ARM_MPTIMER', if_true: files('arm_mptimer.c'))
+system_ss.add(when: 'CONFIG_ARM_TIMER', if_true: files('arm_timer.c'))
+system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_systick.c'))
+system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_timer.c'))
+system_ss.add(when: 'CONFIG_CADENCE', if_true: files('cadence_ttc.c'))
+system_ss.add(when: 'CONFIG_CMSDK_APB_DUALTIMER', if_true: files('cmsdk-apb-dualtimer.c'))
+system_ss.add(when: 'CONFIG_CMSDK_APB_TIMER', if_true: files('cmsdk-apb-timer.c'))
+system_ss.add(when: 'CONFIG_RENESAS_TMR', if_true: files('renesas_tmr.c'))
+system_ss.add(when: 'CONFIG_RENESAS_CMT', if_true: files('renesas_cmt.c'))
+system_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic-timer.c'))
+system_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_timer.c'))
+system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_mct.c'))
+system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_pwm.c'))
+system_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_gptimer.c'))
+system_ss.add(when: 'CONFIG_HPET', if_true: files('hpet.c'))
+system_ss.add(when: 'CONFIG_I8254', if_true: files('i8254_common.c', 'i8254.c'))
+system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_epit.c'))
+system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpt.c'))
+system_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.c'))
+system_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-timer.c'))
+system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_timer.c'))
+system_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_timer.c'))
+system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gptimer.c'))
+system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_synctimer.c'))
+system_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_timer.c'))
+system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_systmr.c'))
+system_ss.add(when: 'CONFIG_SH_TIMER', if_true: files('sh_timer.c'))
+system_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
+system_ss.add(when: 'CONFIG_SSE_COUNTER', if_true: files('sse-counter.c'))
+system_ss.add(when: 'CONFIG_SSE_TIMER', if_true: files('sse-timer.c'))
+system_ss.add(when: 'CONFIG_STELLARIS_GPTM', if_true: files('stellaris-gptm.c'))
+system_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
+system_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
 specific_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_timer.c'))
-softmmu_ss.add(when: 'CONFIG_SIFIVE_PWM', if_true: files('sifive_pwm.c'))
+system_ss.add(when: 'CONFIG_SIFIVE_PWM', if_true: files('sifive_pwm.c'))
 
 specific_ss.add(when: 'CONFIG_AVR_TIMER16', if_true: files('avr_timer16.c'))
diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
index 76fe3cb098..6968e60b3f 100644
--- a/hw/tpm/meson.build
+++ b/hw/tpm/meson.build
@@ -1,9 +1,9 @@
-softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_tis_common.c'))
-softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: files('tpm_tis_isa.c'))
-softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('tpm_tis_sysbus.c'))
-softmmu_ss.add(when: 'CONFIG_TPM_TIS_I2C', if_true: files('tpm_tis_i2c.c'))
-softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
-softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_ppi.c'))
-softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_ppi.c'))
+system_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_tis_common.c'))
+system_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: files('tpm_tis_isa.c'))
+system_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('tpm_tis_sysbus.c'))
+system_ss.add(when: 'CONFIG_TPM_TIS_I2C', if_true: files('tpm_tis_i2c.c'))
+system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
+system_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_ppi.c'))
+system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_ppi.c'))
 
 specific_ss.add(when: 'CONFIG_TPM_SPAPR', if_true: files('tpm_spapr.c'))
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 599dc24f0d..e94149ebde 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -1,7 +1,7 @@
 hw_usb_modules = {}
 
 # usb subsystem core
-softmmu_ss.add(when: 'CONFIG_USB', if_true: files(
+system_ss.add(when: 'CONFIG_USB', if_true: files(
   'bus.c',
   'combined-packet.c',
   'core.c',
@@ -12,42 +12,42 @@ softmmu_ss.add(when: 'CONFIG_USB', if_true: files(
 ))
 
 # usb host adapters
-softmmu_ss.add(when: 'CONFIG_USB_UHCI', if_true: files('hcd-uhci.c'))
-softmmu_ss.add(when: 'CONFIG_USB_OHCI', if_true: files('hcd-ohci.c'))
-softmmu_ss.add(when: 'CONFIG_USB_OHCI_PCI', if_true: files('hcd-ohci-pci.c'))
-softmmu_ss.add(when: 'CONFIG_USB_EHCI', if_true: files('hcd-ehci.c'))
-softmmu_ss.add(when: 'CONFIG_USB_EHCI_PCI', if_true: files('hcd-ehci-pci.c'))
-softmmu_ss.add(when: 'CONFIG_USB_EHCI_SYSBUS', if_true: files('hcd-ehci.c', 'hcd-ehci-sysbus.c'))
-softmmu_ss.add(when: 'CONFIG_USB_XHCI', if_true: files('hcd-xhci.c'))
-softmmu_ss.add(when: 'CONFIG_USB_XHCI_PCI', if_true: files('hcd-xhci-pci.c'))
-softmmu_ss.add(when: 'CONFIG_USB_XHCI_SYSBUS', if_true: files('hcd-xhci-sysbus.c'))
-softmmu_ss.add(when: 'CONFIG_USB_XHCI_NEC', if_true: files('hcd-xhci-nec.c'))
-softmmu_ss.add(when: 'CONFIG_USB_MUSB', if_true: files('hcd-musb.c'))
-softmmu_ss.add(when: 'CONFIG_USB_DWC2', if_true: files('hcd-dwc2.c'))
-softmmu_ss.add(when: 'CONFIG_USB_DWC3', if_true: files('hcd-dwc3.c'))
+system_ss.add(when: 'CONFIG_USB_UHCI', if_true: files('hcd-uhci.c'))
+system_ss.add(when: 'CONFIG_USB_OHCI', if_true: files('hcd-ohci.c'))
+system_ss.add(when: 'CONFIG_USB_OHCI_PCI', if_true: files('hcd-ohci-pci.c'))
+system_ss.add(when: 'CONFIG_USB_EHCI', if_true: files('hcd-ehci.c'))
+system_ss.add(when: 'CONFIG_USB_EHCI_PCI', if_true: files('hcd-ehci-pci.c'))
+system_ss.add(when: 'CONFIG_USB_EHCI_SYSBUS', if_true: files('hcd-ehci.c', 'hcd-ehci-sysbus.c'))
+system_ss.add(when: 'CONFIG_USB_XHCI', if_true: files('hcd-xhci.c'))
+system_ss.add(when: 'CONFIG_USB_XHCI_PCI', if_true: files('hcd-xhci-pci.c'))
+system_ss.add(when: 'CONFIG_USB_XHCI_SYSBUS', if_true: files('hcd-xhci-sysbus.c'))
+system_ss.add(when: 'CONFIG_USB_XHCI_NEC', if_true: files('hcd-xhci-nec.c'))
+system_ss.add(when: 'CONFIG_USB_MUSB', if_true: files('hcd-musb.c'))
+system_ss.add(when: 'CONFIG_USB_DWC2', if_true: files('hcd-dwc2.c'))
+system_ss.add(when: 'CONFIG_USB_DWC3', if_true: files('hcd-dwc3.c'))
 
-softmmu_ss.add(when: 'CONFIG_TUSB6010', if_true: files('tusb6010.c'))
-softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))
-softmmu_ss.add(when: 'CONFIG_IMX_USBPHY', if_true: files('imx-usb-phy.c'))
-softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('vt82c686-uhci-pci.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-usb2-ctrl-regs.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_USB_SUBSYS', if_true: files('xlnx-usb-subsystem.c'))
+system_ss.add(when: 'CONFIG_TUSB6010', if_true: files('tusb6010.c'))
+system_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))
+system_ss.add(when: 'CONFIG_IMX_USBPHY', if_true: files('imx-usb-phy.c'))
+system_ss.add(when: 'CONFIG_VT82C686', if_true: files('vt82c686-uhci-pci.c'))
+system_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-usb2-ctrl-regs.c'))
+system_ss.add(when: 'CONFIG_XLNX_USB_SUBSYS', if_true: files('xlnx-usb-subsystem.c'))
 
 # emulated usb devices
-softmmu_ss.add(when: 'CONFIG_USB', if_true: files('dev-hub.c'))
-softmmu_ss.add(when: 'CONFIG_USB', if_true: files('dev-hid.c'))
-softmmu_ss.add(when: 'CONFIG_USB_TABLET_WACOM', if_true: files('dev-wacom.c'))
-softmmu_ss.add(when: 'CONFIG_USB_STORAGE_CORE', if_true: files('dev-storage.c'))
-softmmu_ss.add(when: 'CONFIG_USB_STORAGE_BOT', if_true: files('dev-storage-bot.c'))
-softmmu_ss.add(when: 'CONFIG_USB_STORAGE_CLASSIC', if_true: files('dev-storage-classic.c'))
-softmmu_ss.add(when: 'CONFIG_USB_STORAGE_UAS', if_true: files('dev-uas.c'))
-softmmu_ss.add(when: 'CONFIG_USB_AUDIO', if_true: files('dev-audio.c'))
-softmmu_ss.add(when: 'CONFIG_USB_SERIAL', if_true: files('dev-serial.c'))
-softmmu_ss.add(when: 'CONFIG_USB_NETWORK', if_true: files('dev-network.c'))
-softmmu_ss.add(when: ['CONFIG_POSIX', 'CONFIG_USB_STORAGE_MTP'], if_true: files('dev-mtp.c'))
+system_ss.add(when: 'CONFIG_USB', if_true: files('dev-hub.c'))
+system_ss.add(when: 'CONFIG_USB', if_true: files('dev-hid.c'))
+system_ss.add(when: 'CONFIG_USB_TABLET_WACOM', if_true: files('dev-wacom.c'))
+system_ss.add(when: 'CONFIG_USB_STORAGE_CORE', if_true: files('dev-storage.c'))
+system_ss.add(when: 'CONFIG_USB_STORAGE_BOT', if_true: files('dev-storage-bot.c'))
+system_ss.add(when: 'CONFIG_USB_STORAGE_CLASSIC', if_true: files('dev-storage-classic.c'))
+system_ss.add(when: 'CONFIG_USB_STORAGE_UAS', if_true: files('dev-uas.c'))
+system_ss.add(when: 'CONFIG_USB_AUDIO', if_true: files('dev-audio.c'))
+system_ss.add(when: 'CONFIG_USB_SERIAL', if_true: files('dev-serial.c'))
+system_ss.add(when: 'CONFIG_USB_NETWORK', if_true: files('dev-network.c'))
+system_ss.add(when: ['CONFIG_POSIX', 'CONFIG_USB_STORAGE_MTP'], if_true: files('dev-mtp.c'))
 
 # smartcard
-softmmu_ss.add(when: 'CONFIG_USB_SMARTCARD', if_true: files('dev-smartcard-reader.c'))
+system_ss.add(when: 'CONFIG_USB_SMARTCARD', if_true: files('dev-smartcard-reader.c'))
 
 if cacard.found()
   usbsmartcard_ss = ss.source_set()
@@ -57,15 +57,15 @@ if cacard.found()
 endif
 
 # U2F
-softmmu_ss.add(when: 'CONFIG_USB_U2F', if_true: files('u2f.c'))
-softmmu_ss.add(when: ['CONFIG_LINUX', 'CONFIG_USB_U2F'], if_true: [libudev, files('u2f-passthru.c')])
+system_ss.add(when: 'CONFIG_USB_U2F', if_true: files('u2f.c'))
+system_ss.add(when: ['CONFIG_LINUX', 'CONFIG_USB_U2F'], if_true: [libudev, files('u2f-passthru.c')])
 if u2f.found()
-  softmmu_ss.add(when: 'CONFIG_USB_U2F', if_true: [u2f, files('u2f-emulated.c')])
+  system_ss.add(when: 'CONFIG_USB_U2F', if_true: [u2f, files('u2f-emulated.c')])
 endif
 
 # CanoKey
 if canokey.found()
-  softmmu_ss.add(when: 'CONFIG_USB_CANOKEY', if_true: [canokey, files('canokey.c')])
+  system_ss.add(when: 'CONFIG_USB_CANOKEY', if_true: [canokey, files('canokey.c')])
 endif
 
 # usb redirect
@@ -84,6 +84,6 @@ if libusb.found()
   hw_usb_modules += {'host': usbhost_ss}
 endif
 
-softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN_BUS', libusb], if_true: files('xen-usb.c'))
+system_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN_BUS', libusb], if_true: files('xen-usb.c'))
 
 modules += { 'hw-usb': hw_usb_modules }
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index bdec78bfc6..e83c37fffd 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -62,11 +62,11 @@ virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev-pci.c'
 
 specific_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
 
-softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
-softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
-softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
-softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
-softmmu_ss.add(files('virtio-hmp-cmds.c'))
+system_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
+system_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
+system_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
+system_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
+system_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
+system_ss.add(files('virtio-hmp-cmds.c'))
 
 specific_ss.add_all(when: 'CONFIG_VIRTIO', if_true: specific_virtio_ss)
diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
index 5dcd4fbe2f..15370565bd 100644
--- a/hw/watchdog/meson.build
+++ b/hw/watchdog/meson.build
@@ -1,10 +1,10 @@
-softmmu_ss.add(files('watchdog.c'))
-softmmu_ss.add(when: 'CONFIG_ALLWINNER_WDT', if_true: files('allwinner-wdt.c'))
-softmmu_ss.add(when: 'CONFIG_CMSDK_APB_WATCHDOG', if_true: files('cmsdk-apb-watchdog.c'))
-softmmu_ss.add(when: 'CONFIG_WDT_IB6300ESB', if_true: files('wdt_i6300esb.c'))
-softmmu_ss.add(when: 'CONFIG_WDT_IB700', if_true: files('wdt_ib700.c'))
-softmmu_ss.add(when: 'CONFIG_WDT_DIAG288', if_true: files('wdt_diag288.c'))
-softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('wdt_aspeed.c'))
-softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
-softmmu_ss.add(when: 'CONFIG_WDT_SBSA', if_true: files('sbsa_gwdt.c'))
+system_ss.add(files('watchdog.c'))
+system_ss.add(when: 'CONFIG_ALLWINNER_WDT', if_true: files('allwinner-wdt.c'))
+system_ss.add(when: 'CONFIG_CMSDK_APB_WATCHDOG', if_true: files('cmsdk-apb-watchdog.c'))
+system_ss.add(when: 'CONFIG_WDT_IB6300ESB', if_true: files('wdt_i6300esb.c'))
+system_ss.add(when: 'CONFIG_WDT_IB700', if_true: files('wdt_ib700.c'))
+system_ss.add(when: 'CONFIG_WDT_DIAG288', if_true: files('wdt_diag288.c'))
+system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('wdt_aspeed.c'))
+system_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
+system_ss.add(when: 'CONFIG_WDT_SBSA', if_true: files('sbsa_gwdt.c'))
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_watchdog.c'))
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 19c6aabc7c..102d5d2e6b 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -1,4 +1,4 @@
-softmmu_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
+system_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
   'xen-backend.c',
   'xen-bus-helper.c',
   'xen-bus.c',
@@ -7,7 +7,7 @@ softmmu_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
   'xen_pvdev.c',
 ))
 
-softmmu_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
+system_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
   'xen-operations.c',
 ))
 
diff --git a/migration/meson.build b/migration/meson.build
index 9975407cd0..1ae28523a1 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -9,7 +9,7 @@ migration_files = files(
   'yank_functions.c',
 )
 
-softmmu_ss.add(files(
+system_ss.add(files(
   'block-dirty-bitmap.c',
   'channel.c',
   'channel-block.c',
@@ -31,14 +31,14 @@ softmmu_ss.add(files(
 ), gnutls)
 
 if get_option('replication').allowed()
-  softmmu_ss.add(files('colo-failover.c', 'colo.c'))
+  system_ss.add(files('colo-failover.c', 'colo.c'))
 endif
 
-softmmu_ss.add(when: rdma, if_true: files('rdma.c'))
+system_ss.add(when: rdma, if_true: files('rdma.c'))
 if get_option('live_block_migration').allowed()
-  softmmu_ss.add(files('block.c'))
+  system_ss.add(files('block.c'))
 endif
-softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
+system_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
 
 specific_ss.add(when: 'CONFIG_SYSTEM_ONLY',
                 if_true: files('ram.c',
diff --git a/monitor/meson.build b/monitor/meson.build
index 4c0a33ae65..5269492cf0 100644
--- a/monitor/meson.build
+++ b/monitor/meson.build
@@ -1,11 +1,11 @@
 qmp_ss.add(files('monitor.c', 'qmp.c', 'qmp-cmds-control.c'))
 
-softmmu_ss.add(files(
+system_ss.add(files(
   'fds.c',
   'hmp-cmds.c',
   'hmp.c',
 ))
-softmmu_ss.add([spice_headers, files('qmp-cmds.c')])
+system_ss.add([spice_headers, files('qmp-cmds.c')])
 
 specific_ss.add(when: 'CONFIG_SYSTEM_ONLY',
 		if_true: [files( 'hmp-cmds-target.c', 'hmp-target.c'), spice])
diff --git a/net/can/meson.build b/net/can/meson.build
index f53d9ec54f..45693c82c9 100644
--- a/net/can/meson.build
+++ b/net/can/meson.build
@@ -2,4 +2,4 @@ can_ss = ss.source_set()
 can_ss.add(files('can_core.c', 'can_host.c'))
 can_ss.add(when: 'CONFIG_LINUX', if_true: files('can_socketcan.c'))
 
-softmmu_ss.add_all(when: 'CONFIG_CAN_BUS', if_true: can_ss)
+system_ss.add_all(when: 'CONFIG_CAN_BUS', if_true: can_ss)
diff --git a/net/meson.build b/net/meson.build
index 6f4ecde57f..bdf564a57b 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -1,4 +1,4 @@
-softmmu_ss.add(files(
+system_ss.add(files(
   'announce.c',
   'checksum.c',
   'dump.c',
@@ -18,41 +18,41 @@ softmmu_ss.add(files(
 
 if get_option('replication').allowed() or \
     get_option('colo_proxy').allowed()
-  softmmu_ss.add(files('colo-compare.c'))
-  softmmu_ss.add(files('colo.c'))
+  system_ss.add(files('colo-compare.c'))
+  system_ss.add(files('colo.c'))
 endif
 
 if get_option('colo_proxy').allowed()
-  softmmu_ss.add(files('filter-rewriter.c'))
+  system_ss.add(files('filter-rewriter.c'))
 endif
 
-softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
+system_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
 
 if have_l2tpv3
-  softmmu_ss.add(files('l2tpv3.c'))
+  system_ss.add(files('l2tpv3.c'))
 endif
-softmmu_ss.add(when: slirp, if_true: files('slirp.c'))
-softmmu_ss.add(when: vde, if_true: files('vde.c'))
+system_ss.add(when: slirp, if_true: files('slirp.c'))
+system_ss.add(when: vde, if_true: files('vde.c'))
 if have_netmap
-  softmmu_ss.add(files('netmap.c'))
+  system_ss.add(files('netmap.c'))
 endif
 if have_vhost_net_user
-  softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost-user.c'), if_false: files('vhost-user-stub.c'))
-  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-user-stub.c'))
+  system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost-user.c'), if_false: files('vhost-user-stub.c'))
+  system_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-user-stub.c'))
 endif
 
-softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('tap-linux.c'))
-softmmu_ss.add(when: 'CONFIG_BSD', if_true: files('tap-bsd.c'))
-softmmu_ss.add(when: 'CONFIG_SOLARIS', if_true: files('tap-solaris.c'))
+system_ss.add(when: 'CONFIG_LINUX', if_true: files('tap-linux.c'))
+system_ss.add(when: 'CONFIG_BSD', if_true: files('tap-bsd.c'))
+system_ss.add(when: 'CONFIG_SOLARIS', if_true: files('tap-solaris.c'))
 tap_posix = ['tap.c']
 if not config_host.has_key('CONFIG_LINUX') and not config_host.has_key('CONFIG_BSD') and not config_host.has_key('CONFIG_SOLARIS')
   tap_posix += 'tap-stub.c'
 endif
-softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
-softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
+system_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
+system_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
 if have_vhost_net_vdpa
-  softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost-vdpa.c'), if_false: files('vhost-vdpa-stub.c'))
-  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-vdpa-stub.c'))
+  system_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost-vdpa.c'), if_false: files('vhost-vdpa-stub.c'))
+  system_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-vdpa-stub.c'))
 endif
 
 vmnet_files = files(
@@ -61,5 +61,5 @@ vmnet_files = files(
   'vmnet-host.c',
   'vmnet-shared.c'
 )
-softmmu_ss.add(when: vmnet, if_true: vmnet_files)
+system_ss.add(when: vmnet, if_true: vmnet_files)
 subdir('can')
diff --git a/qom/meson.build b/qom/meson.build
index 062a3789d8..8192243430 100644
--- a/qom/meson.build
+++ b/qom/meson.build
@@ -7,4 +7,4 @@ qom_ss.add(files(
 ))
 
 qmp_ss.add(files('qom-qmp-cmds.c'))
-softmmu_ss.add(files('qom-hmp-cmds.c'))
+system_ss.add(files('qom-hmp-cmds.c'))
diff --git a/replay/meson.build b/replay/meson.build
index 21aefad220..4b4175e8dd 100644
--- a/replay/meson.build
+++ b/replay/meson.build
@@ -1,4 +1,4 @@
-softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
+system_ss.add(when: 'CONFIG_TCG', if_true: files(
   'replay.c',
   'replay-internal.c',
   'replay-events.c',
diff --git a/softmmu/meson.build b/softmmu/meson.build
index d75f45b7c3..ea5603f021 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -10,7 +10,7 @@ specific_ss.add(when: ['CONFIG_SYSTEM_ONLY', 'CONFIG_TCG'], if_true: [files(
   'icount.c',
 )])
 
-softmmu_ss.add(files(
+system_ss.add(files(
   'balloon.c',
   'bootdevice.c',
   'cpus.c',
@@ -32,8 +32,8 @@ softmmu_ss.add(files(
 ), sdl, libpmem, libdaxctl)
 
 if have_tpm
-  softmmu_ss.add(files('tpm.c'))
+  system_ss.add(files('tpm.c'))
 endif
 
-softmmu_ss.add(when: seccomp, if_true: files('qemu-seccomp.c'))
-softmmu_ss.add(when: fdt, if_true: files('device_tree.c'))
+system_ss.add(when: seccomp, if_true: files('qemu-seccomp.c'))
+system_ss.add(when: fdt, if_true: files('device_tree.c'))
diff --git a/stats/meson.build b/stats/meson.build
index c4153f979e..0728dafcd1 100644
--- a/stats/meson.build
+++ b/stats/meson.build
@@ -1 +1 @@
-softmmu_ss.add(files('stats-hmp-cmds.c', 'stats-qmp-cmds.c'))
+system_ss.add(files('stats-hmp-cmds.c', 'stats-qmp-cmds.c'))
diff --git a/target/alpha/meson.build b/target/alpha/meson.build
index 1aec55abb4..3f5253c002 100644
--- a/target/alpha/meson.build
+++ b/target/alpha/meson.build
@@ -11,8 +11,8 @@ alpha_ss.add(files(
   'vax_helper.c',
 ))
 
-alpha_softmmu_ss = ss.source_set()
-alpha_softmmu_ss.add(files('machine.c'))
+alpha_system_ss = ss.source_set()
+alpha_system_ss.add(files('machine.c'))
 
 target_arch += {'alpha': alpha_ss}
-target_softmmu_arch += {'alpha': alpha_softmmu_ss}
+target_softmmu_arch += {'alpha': alpha_system_ss}
diff --git a/target/arm/hvf/meson.build b/target/arm/hvf/meson.build
index 855e6cce5a..afc509a470 100644
--- a/target/arm/hvf/meson.build
+++ b/target/arm/hvf/meson.build
@@ -1,3 +1,3 @@
-arm_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
+arm_system_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
   'hvf.c',
 ))
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 011e8ca113..e645e456da 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -16,8 +16,8 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'gdbstub64.c',
 ))
 
-arm_softmmu_ss = ss.source_set()
-arm_softmmu_ss.add(files(
+arm_system_ss = ss.source_set()
+arm_system_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
   'arm-qmp-cmds.c',
@@ -35,4 +35,4 @@ else
 endif
 
 target_arch += {'arm': arm_ss}
-target_softmmu_arch += {'arm': arm_softmmu_ss}
+target_softmmu_arch += {'arm': arm_system_ss}
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 130ed62fcd..bdcab56489 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -48,6 +48,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'sve_helper.c',
 ))
 
-arm_softmmu_ss.add(files(
+arm_system_ss.add(files(
   'psci.c',
 ))
diff --git a/target/avr/meson.build b/target/avr/meson.build
index 7e8e29c59d..a24cf6d26d 100644
--- a/target/avr/meson.build
+++ b/target/avr/meson.build
@@ -4,7 +4,7 @@ gen = [
 ]
 
 avr_ss = ss.source_set()
-avr_softmmu_ss = ss.source_set()
+avr_system_ss = ss.source_set()
 
 avr_ss.add(gen)
 avr_ss.add(files(
@@ -14,7 +14,7 @@ avr_ss.add(files(
   'gdbstub.c',
   'disas.c'))
 
-avr_softmmu_ss.add(files('machine.c'))
+avr_system_ss.add(files('machine.c'))
 
 target_arch += {'avr': avr_ss}
-target_softmmu_arch += {'avr': avr_softmmu_ss}
+target_softmmu_arch += {'avr': avr_system_ss}
diff --git a/target/cris/meson.build b/target/cris/meson.build
index c1e326d950..07dc3a5682 100644
--- a/target/cris/meson.build
+++ b/target/cris/meson.build
@@ -6,12 +6,12 @@ cris_ss.add(files(
   'translate.c',
 ))
 
-cris_softmmu_ss = ss.source_set()
-cris_softmmu_ss.add(files(
+cris_system_ss = ss.source_set()
+cris_system_ss.add(files(
   'helper.c',
   'machine.c',
   'mmu.c',
 ))
 
 target_arch += {'cris': cris_ss}
-target_softmmu_arch += {'cris': cris_softmmu_ss}
+target_softmmu_arch += {'cris': cris_system_ss}
diff --git a/target/hppa/meson.build b/target/hppa/meson.build
index 81b4b4e617..21c7bba116 100644
--- a/target/hppa/meson.build
+++ b/target/hppa/meson.build
@@ -12,12 +12,12 @@ hppa_ss.add(files(
   'translate.c',
 ))
 
-hppa_softmmu_ss = ss.source_set()
-hppa_softmmu_ss.add(files(
+hppa_system_ss = ss.source_set()
+hppa_system_ss.add(files(
   'machine.c',
   'mem_helper.c',
   'sys_helper.c',
 ))
 
 target_arch += {'hppa': hppa_ss}
-target_softmmu_arch += {'hppa': hppa_softmmu_ss}
+target_softmmu_arch += {'hppa': hppa_system_ss}
diff --git a/target/i386/hax/meson.build b/target/i386/hax/meson.build
index d6c520fb6b..6ac314aa35 100644
--- a/target/i386/hax/meson.build
+++ b/target/i386/hax/meson.build
@@ -1,7 +1,7 @@
-i386_softmmu_ss.add(when: 'CONFIG_HAX', if_true: files(
+i386_system_ss.add(when: 'CONFIG_HAX', if_true: files(
   'hax-all.c',
   'hax-mem.c',
   'hax-accel-ops.c',
 ))
-i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_POSIX'], if_true: files('hax-posix.c'))
-i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_WIN32'], if_true: files('hax-windows.c'))
+i386_system_ss.add(when: ['CONFIG_HAX', 'CONFIG_POSIX'], if_true: files('hax-posix.c'))
+i386_system_ss.add(when: ['CONFIG_HAX', 'CONFIG_WIN32'], if_true: files('hax-windows.c'))
diff --git a/target/i386/hvf/meson.build b/target/i386/hvf/meson.build
index f6d4c394d3..05c3c8cf18 100644
--- a/target/i386/hvf/meson.build
+++ b/target/i386/hvf/meson.build
@@ -1,4 +1,4 @@
-i386_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
+i386_system_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
   'hvf.c',
   'x86.c',
   'x86_cpuid.c',
diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
index 322272091b..40fbde96ca 100644
--- a/target/i386/kvm/meson.build
+++ b/target/i386/kvm/meson.build
@@ -11,6 +11,6 @@ i386_softmmu_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files('xen-emu.c'))
 
 i386_softmmu_kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
 
-i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
+i386_system_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
 
-i386_softmmu_ss.add_all(when: 'CONFIG_KVM', if_true: i386_softmmu_kvm_ss)
+i386_system_ss.add_all(when: 'CONFIG_KVM', if_true: i386_softmmu_kvm_ss)
diff --git a/target/i386/meson.build b/target/i386/meson.build
index ae38dc9563..1effe1ed9a 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -12,15 +12,15 @@ i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'))
 i386_ss.add(when: 'CONFIG_KVM', if_true: files('host-cpu.c'))
 i386_ss.add(when: 'CONFIG_HVF', if_true: files('host-cpu.c'))
 
-i386_softmmu_ss = ss.source_set()
-i386_softmmu_ss.add(files(
+i386_system_ss = ss.source_set()
+i386_system_ss.add(files(
   'arch_dump.c',
   'arch_memory_mapping.c',
   'machine.c',
   'monitor.c',
   'cpu-sysemu.c',
 ))
-i386_softmmu_ss.add(when: 'CONFIG_SEV', if_true: files('sev.c'), if_false: files('sev-sysemu-stub.c'))
+i386_system_ss.add(when: 'CONFIG_SEV', if_true: files('sev.c'), if_false: files('sev-sysemu-stub.c'))
 
 i386_user_ss = ss.source_set()
 
@@ -32,5 +32,5 @@ subdir('hvf')
 subdir('tcg')
 
 target_arch += {'i386': i386_ss}
-target_softmmu_arch += {'i386': i386_softmmu_ss}
+target_softmmu_arch += {'i386': i386_system_ss}
 target_user_arch += {'i386': i386_user_ss}
diff --git a/target/i386/nvmm/meson.build b/target/i386/nvmm/meson.build
index 733e334083..885a708665 100644
--- a/target/i386/nvmm/meson.build
+++ b/target/i386/nvmm/meson.build
@@ -1,8 +1,8 @@
-i386_softmmu_ss.add(when: 'CONFIG_NVMM', if_true:
+i386_system_ss.add(when: 'CONFIG_NVMM', if_true:
   files(
   'nvmm-all.c',
   'nvmm-accel-ops.c',
   )
 )
 
-i386_softmmu_ss.add(when: 'CONFIG_NVMM', if_true: nvmm)
+i386_system_ss.add(when: 'CONFIG_NVMM', if_true: nvmm)
diff --git a/target/i386/tcg/sysemu/meson.build b/target/i386/tcg/sysemu/meson.build
index 7179bd21fb..f9ac254541 100644
--- a/target/i386/tcg/sysemu/meson.build
+++ b/target/i386/tcg/sysemu/meson.build
@@ -1,4 +1,4 @@
-i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SYSTEM_ONLY'], if_true: files(
+i386_system_ss.add(when: ['CONFIG_TCG', 'CONFIG_SYSTEM_ONLY'], if_true: files(
   'tcg-cpu.c',
   'smm_helper.c',
   'excp_helper.c',
diff --git a/target/i386/whpx/meson.build b/target/i386/whpx/meson.build
index 95fc31eb81..9c54aaad39 100644
--- a/target/i386/whpx/meson.build
+++ b/target/i386/whpx/meson.build
@@ -1,4 +1,4 @@
-i386_softmmu_ss.add(when: 'CONFIG_WHPX', if_true: files(
+i386_system_ss.add(when: 'CONFIG_WHPX', if_true: files(
   'whpx-all.c',
   'whpx-apic.c',
   'whpx-accel-ops.c',
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 1117a51c52..b7a27df5a9 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -15,8 +15,8 @@ loongarch_tcg_ss.add(files(
 ))
 loongarch_tcg_ss.add(zlib)
 
-loongarch_softmmu_ss = ss.source_set()
-loongarch_softmmu_ss.add(files(
+loongarch_system_ss = ss.source_set()
+loongarch_system_ss.add(files(
   'loongarch-qmp-cmds.c',
   'machine.c',
   'tlb_helper.c',
@@ -30,4 +30,4 @@ common_ss.add(when: 'CONFIG_LOONGARCH_DIS', if_true: [files('disas.c'), gen])
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
 
 target_arch += {'loongarch': loongarch_ss}
-target_softmmu_arch += {'loongarch': loongarch_softmmu_ss}
+target_softmmu_arch += {'loongarch': loongarch_system_ss}
diff --git a/target/m68k/meson.build b/target/m68k/meson.build
index 27d2d7ba87..355db26c6f 100644
--- a/target/m68k/meson.build
+++ b/target/m68k/meson.build
@@ -9,11 +9,11 @@ m68k_ss.add(files(
   'translate.c',
 ))
 
-m68k_softmmu_ss = ss.source_set()
-m68k_softmmu_ss.add(files(
+m68k_system_ss = ss.source_set()
+m68k_system_ss.add(files(
   'm68k-semi.c',
   'monitor.c'
 ))
 
 target_arch += {'m68k': m68k_ss}
-target_softmmu_arch += {'m68k': m68k_softmmu_ss}
+target_softmmu_arch += {'m68k': m68k_system_ss}
diff --git a/target/microblaze/meson.build b/target/microblaze/meson.build
index 05ee0ec163..50fd9ff378 100644
--- a/target/microblaze/meson.build
+++ b/target/microblaze/meson.build
@@ -10,11 +10,11 @@ microblaze_ss.add(files(
   'translate.c',
 ))
 
-microblaze_softmmu_ss = ss.source_set()
-microblaze_softmmu_ss.add(files(
+microblaze_system_ss = ss.source_set()
+microblaze_system_ss.add(files(
   'mmu.c',
   'machine.c',
 ))
 
 target_arch += {'microblaze': microblaze_ss}
-target_softmmu_arch += {'microblaze': microblaze_softmmu_ss}
+target_softmmu_arch += {'microblaze': microblaze_system_ss}
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 2407a05d4c..f35e8f0eca 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,5 +1,5 @@
 mips_user_ss = ss.source_set()
-mips_softmmu_ss = ss.source_set()
+mips_system_ss = ss.source_set()
 mips_ss = ss.source_set()
 mips_ss.add(files(
   'cpu.c',
@@ -19,5 +19,5 @@ endif
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
 target_arch += {'mips': mips_ss}
-target_softmmu_arch += {'mips': mips_softmmu_ss}
+target_softmmu_arch += {'mips': mips_system_ss}
 target_user_arch += {'mips': mips_user_ss}
diff --git a/target/mips/sysemu/meson.build b/target/mips/sysemu/meson.build
index 261492de5b..498cf289d6 100644
--- a/target/mips/sysemu/meson.build
+++ b/target/mips/sysemu/meson.build
@@ -1,4 +1,4 @@
-mips_softmmu_ss.add(files(
+mips_system_ss.add(files(
   'addr.c',
   'cp0.c',
   'cp0_timer.c',
diff --git a/target/mips/tcg/sysemu/meson.build b/target/mips/tcg/sysemu/meson.build
index 4da2c577b2..43b35b3803 100644
--- a/target/mips/tcg/sysemu/meson.build
+++ b/target/mips/tcg/sysemu/meson.build
@@ -1,4 +1,4 @@
-mips_softmmu_ss.add(files(
+mips_system_ss.add(files(
   'cp0_helper.c',
   'mips-semi.c',
   'special_helper.c',
diff --git a/target/nios2/meson.build b/target/nios2/meson.build
index c6e2243cc3..8f0f9dc628 100644
--- a/target/nios2/meson.build
+++ b/target/nios2/meson.build
@@ -5,8 +5,8 @@ nios2_ss.add(files(
   'translate.c',
 ))
 
-nios2_softmmu_ss = ss.source_set()
-nios2_softmmu_ss.add(files(
+nios2_system_ss = ss.source_set()
+nios2_system_ss.add(files(
   'helper.c',
   'monitor.c',
   'mmu.c',
@@ -14,4 +14,4 @@ nios2_softmmu_ss.add(files(
 ))
 
 target_arch += {'nios2': nios2_ss}
-target_softmmu_arch += {'nios2': nios2_softmmu_ss}
+target_softmmu_arch += {'nios2': nios2_system_ss}
diff --git a/target/openrisc/meson.build b/target/openrisc/meson.build
index 84322086ec..c1cd943f78 100644
--- a/target/openrisc/meson.build
+++ b/target/openrisc/meson.build
@@ -14,12 +14,12 @@ openrisc_ss.add(files(
   'translate.c',
 ))
 
-openrisc_softmmu_ss = ss.source_set()
-openrisc_softmmu_ss.add(files(
+openrisc_system_ss = ss.source_set()
+openrisc_system_ss.add(files(
   'interrupt.c',
   'machine.c',
   'mmu.c',
 ))
 
 target_arch += {'openrisc': openrisc_ss}
-target_softmmu_arch += {'openrisc': openrisc_softmmu_ss}
+target_softmmu_arch += {'openrisc': openrisc_system_ss}
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index 7929de8360..a69f174f41 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -33,21 +33,21 @@ ppc_ss.add(gen)
 ppc_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 ppc_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user_only_helper.c'))
 
-ppc_softmmu_ss = ss.source_set()
-ppc_softmmu_ss.add(files(
+ppc_system_ss = ss.source_set()
+ppc_system_ss.add(files(
   'arch_dump.c',
   'machine.c',
   'mmu-hash32.c',
   'mmu_common.c',
   'ppc-qmp-cmds.c',
 ))
-ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
+ppc_system_ss.add(when: 'CONFIG_TCG', if_true: files(
   'mmu_helper.c',
 ), if_false: files(
   'tcg-stub.c',
 ))
 
-ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
+ppc_system_ss.add(when: 'TARGET_PPC64', if_true: files(
   'compat.c',
   'mmu-book3s-v3.c',
   'mmu-hash64.c',
@@ -55,4 +55,4 @@ ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
 ))
 
 target_arch += {'ppc': ppc_ss}
-target_softmmu_arch += {'ppc': ppc_softmmu_ss}
+target_softmmu_arch += {'ppc': ppc_system_ss}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index e1ff6d9b95..7f56c5f88d 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -24,8 +24,8 @@ riscv_ss.add(files(
 ))
 riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 
-riscv_softmmu_ss = ss.source_set()
-riscv_softmmu_ss.add(files(
+riscv_system_ss = ss.source_set()
+riscv_system_ss.add(files(
   'arch_dump.c',
   'pmp.c',
   'debug.c',
@@ -37,4 +37,4 @@ riscv_softmmu_ss.add(files(
 ))
 
 target_arch += {'riscv': riscv_ss}
-target_softmmu_arch += {'riscv': riscv_softmmu_ss}
+target_softmmu_arch += {'riscv': riscv_system_ss}
diff --git a/target/s390x/kvm/meson.build b/target/s390x/kvm/meson.build
index aef52b6686..37253f75bf 100644
--- a/target/s390x/kvm/meson.build
+++ b/target/s390x/kvm/meson.build
@@ -14,6 +14,6 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
 #  - KVM is enabled
 #  - the linker supports --s390-pgste
 if host_machine.cpu_family() == 's390x' and cc.has_link_argument('-Wl,--s390-pgste')
-  s390x_softmmu_ss.add(when: 'CONFIG_KVM',
+  s390x_system_ss.add(when: 'CONFIG_KVM',
                        if_true: declare_dependency(link_args: ['-Wl,--s390-pgste']))
 endif
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 84c1402a6a..42ed38942a 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -18,8 +18,8 @@ gen_features_h = custom_target('gen-features.h',
 
 s390x_ss.add(gen_features_h)
 
-s390x_softmmu_ss = ss.source_set()
-s390x_softmmu_ss.add(files(
+s390x_system_ss = ss.source_set()
+s390x_system_ss.add(files(
   'helper.c',
   'arch_dump.c',
   'diag.c',
@@ -40,5 +40,5 @@ subdir('tcg')
 subdir('kvm')
 
 target_arch += {'s390x': s390x_ss}
-target_softmmu_arch += {'s390x': s390x_softmmu_ss}
+target_softmmu_arch += {'s390x': s390x_system_ss}
 target_user_arch += {'s390x': s390x_user_ss}
diff --git a/target/sh4/meson.build b/target/sh4/meson.build
index 56a57576da..a78e9ec7e4 100644
--- a/target/sh4/meson.build
+++ b/target/sh4/meson.build
@@ -7,8 +7,8 @@ sh4_ss.add(files(
   'translate.c',
 ))
 
-sh4_softmmu_ss = ss.source_set()
-sh4_softmmu_ss.add(files('monitor.c'))
+sh4_system_ss = ss.source_set()
+sh4_system_ss.add(files('monitor.c'))
 
 target_arch += {'sh4': sh4_ss}
-target_softmmu_arch += {'sh4': sh4_softmmu_ss}
+target_softmmu_arch += {'sh4': sh4_system_ss}
diff --git a/target/sparc/meson.build b/target/sparc/meson.build
index a801802ee2..d32e67b287 100644
--- a/target/sparc/meson.build
+++ b/target/sparc/meson.build
@@ -12,12 +12,12 @@ sparc_ss.add(files(
 sparc_ss.add(when: 'TARGET_SPARC', if_true: files('int32_helper.c'))
 sparc_ss.add(when: 'TARGET_SPARC64', if_true: files('int64_helper.c', 'vis_helper.c'))
 
-sparc_softmmu_ss = ss.source_set()
-sparc_softmmu_ss.add(files(
+sparc_system_ss = ss.source_set()
+sparc_system_ss.add(files(
   'machine.c',
   'mmu_helper.c',
   'monitor.c',
 ))
 
 target_arch += {'sparc': sparc_ss}
-target_softmmu_arch += {'sparc': sparc_softmmu_ss}
+target_softmmu_arch += {'sparc': sparc_system_ss}
diff --git a/target/tricore/meson.build b/target/tricore/meson.build
index 0ccc829517..34825b6048 100644
--- a/target/tricore/meson.build
+++ b/target/tricore/meson.build
@@ -9,7 +9,7 @@ tricore_ss.add(files(
 ))
 tricore_ss.add(zlib)
 
-tricore_softmmu_ss = ss.source_set()
+tricore_system_ss = ss.source_set()
 
 target_arch += {'tricore': tricore_ss}
-target_softmmu_arch += {'tricore': tricore_softmmu_ss}
+target_softmmu_arch += {'tricore': tricore_system_ss}
diff --git a/target/xtensa/meson.build b/target/xtensa/meson.build
index 20bbf9b335..95692bd75f 100644
--- a/target/xtensa/meson.build
+++ b/target/xtensa/meson.build
@@ -15,8 +15,8 @@ xtensa_ss.add(files(
   'xtensa-isa.c',
 ))
 
-xtensa_softmmu_ss = ss.source_set()
-xtensa_softmmu_ss.add(files(
+xtensa_system_ss = ss.source_set()
+xtensa_system_ss.add(files(
   'dbg_helper.c',
   'mmu_helper.c',
   'monitor.c',
@@ -24,4 +24,4 @@ xtensa_softmmu_ss.add(files(
 ))
 
 target_arch += {'xtensa': xtensa_ss}
-target_softmmu_arch += {'xtensa': xtensa_softmmu_ss}
+target_softmmu_arch += {'xtensa': xtensa_system_ss}
diff --git a/tcg/meson.build b/tcg/meson.build
index 565c60bc96..c0252c4198 100644
--- a/tcg/meson.build
+++ b/tcg/meson.build
@@ -42,4 +42,4 @@ libtcg_softmmu = static_library('tcg_softmmu',
 
 tcg_softmmu = declare_dependency(link_with: libtcg_softmmu,
                                  dependencies: tcg_ss.dependencies())
-softmmu_ss.add(tcg_softmmu)
+system_ss.add(tcg_softmmu)
diff --git a/trace/meson.build b/trace/meson.build
index 8e80be895c..b0d31a67e6 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -1,4 +1,4 @@
-softmmu_ss.add(files('trace-hmp-cmds.c'))
+system_ss.add(files('trace-hmp-cmds.c'))
 
 specific_ss.add(files('control-target.c'))
 
diff --git a/ui/meson.build b/ui/meson.build
index 125dd41cd6..a5506ac8ad 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -1,9 +1,9 @@
-softmmu_ss.add(pixman)
+system_ss.add(pixman)
 specific_ss.add(when: ['CONFIG_SYSTEM_ONLY'], if_true: pixman)   # for the include path
 specific_ss.add(when: ['CONFIG_SYSTEM_ONLY'], if_true: opengl)   # for the include path
 
-softmmu_ss.add(png)
-softmmu_ss.add(files(
+system_ss.add(png)
+system_ss.add(files(
   'clipboard.c',
   'console.c',
   'cursor.c',
@@ -19,16 +19,16 @@ softmmu_ss.add(files(
   'util.c',
 ))
 if dbus_display
-  softmmu_ss.add(files('dbus-module.c'))
+  system_ss.add(files('dbus-module.c'))
 endif
-softmmu_ss.add([spice_headers, files('spice-module.c')])
-softmmu_ss.add(when: spice_protocol, if_true: files('vdagent.c'))
+system_ss.add([spice_headers, files('spice-module.c')])
+system_ss.add(when: spice_protocol, if_true: files('vdagent.c'))
 
-softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files(
+system_ss.add(when: 'CONFIG_LINUX', if_true: files(
   'input-linux.c',
   'udmabuf.c',
 ))
-softmmu_ss.add(when: cocoa, if_true: files('cocoa.m'))
+system_ss.add(when: cocoa, if_true: files('cocoa.m'))
 
 vnc_ss = ss.source_set()
 vnc_ss.add(files(
@@ -45,8 +45,8 @@ vnc_ss.add(files(
 ))
 vnc_ss.add(zlib, jpeg, gnutls)
 vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
-softmmu_ss.add_all(when: vnc, if_true: vnc_ss)
-softmmu_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
+system_ss.add_all(when: vnc, if_true: vnc_ss)
+system_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
 
 ui_modules = {}
 
@@ -56,7 +56,7 @@ if curses.found()
   ui_modules += {'curses' : curses_ss}
 endif
 
-softmmu_ss.add(opengl)
+system_ss.add(opengl)
 if opengl.found()
   opengl_ss = ss.source_set()
   opengl_ss.add(gbm)
@@ -98,7 +98,7 @@ if dbus_display
 endif
 
 if gtk.found()
-  softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
+  system_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
 
   gtk_ss = ss.source_set()
   gtk_ss.add(gtk, vte, pixman, files('gtk.c'))
@@ -112,7 +112,7 @@ if gtk.found()
 endif
 
 if sdl.found()
-  softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
+  system_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
 
   sdl_ss = ss.source_set()
   sdl_ss.add(sdl, sdl_image, pixman, glib, files(
-- 
2.38.1


