Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A766AC83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 12:58:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhEf-0002Pd-Ks; Thu, 31 Aug 2023 08:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhEP-0002Ft-BI
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:57:05 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhEG-00054P-SA
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:57:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40061928e5aso7496585e9.3
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486615; x=1694091415; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o+2KyMTfnBLukFgKCHiZLb49AOPGtSjL7wjYjiU/DWM=;
 b=TBj/MejVy3vVwwETw3a2Jc4uZpg0628X2prEZf0TT2ewa4u4OLe5l0pSkO3vJlu0l0
 nGEQxc6TzqPTwkaV66mvq537+yOXTHNnL4PIgk2nsVb371CnJrAvmKBJZSnCV9sil9zH
 hxzN8Yxub6PFbWyDn4An0yPVqLsQ4nSLTIVwNwUvX29mfzFQ99H51gTQzhez9vDFhTLL
 pSZiAPHwVd83DPFHYTbrqRGFqIv8ugKOFuev9OjMnjAdUznSCUPjeuPyPxiwjcIcPo4R
 pfJ+wYHMDIPrUJpITFxdqZJWUdo5i0rmJag0bpQ5kTadE0EelTKSYz+txvv78oczzgSb
 T0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486615; x=1694091415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o+2KyMTfnBLukFgKCHiZLb49AOPGtSjL7wjYjiU/DWM=;
 b=Zg4SMe/rLNA2TLp32EYsT2TWBWFK9dmoCVNcm1MQT1slO/WUwh6eCOkPHaKxMvVrjc
 oSbxb4RtCDHmNR6YiB4MM0tHC3BqWceps/O7m5ukXjxx0wuAv3xpVM4kOpTaN3pjgTjs
 60DnR6QJqrcgUvFtDPC30AvxPrnD9BgDiYP6FhkgavwdhRs6AoUUNyXEDCnx1T/1px0a
 eB4Y1OkETaXbLDjYrhd1C7o/V5TsIce8fMNfvc+8wcd92VksHmgdGjrE+RnZ72nwpNON
 IVBWqzZTKA3oOU8uWn5hfMrqqJxYbmbgo6o2PhqC096ksG4W9HTQ+6T7ikJdfzF1LYw9
 RzDg==
X-Gm-Message-State: AOJu0Yy5ITBnucy33a+G2W3Enu1mrJfKLnkSKSAUO50re+zdg4RRwhoM
 ZHx/1/2aLjqEITYccm1SPlekhA==
X-Google-Smtp-Source: AGHT+IGBw4V6ZwO6/SUWQbgZrCXTzC4dY3ZvnQ9j2K7D9NftKl5+lQxmM5mdTvGYYxWZbW6KXGYtwg==
X-Received: by 2002:a1c:7217:0:b0:3fe:21b9:806 with SMTP id
 n23-20020a1c7217000000b003fe21b90806mr4243980wmc.0.1693486614756; 
 Thu, 31 Aug 2023 05:56:54 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a056000000800b0030647449730sm2148945wrx.74.2023.08.31.05.56.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:56:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, libvir-list@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 01/41] accel: Remove HAX accelerator
Date: Thu, 31 Aug 2023 14:56:03 +0200
Message-ID: <20230831125646.67855-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

HAX is deprecated since commits 73741fda6c ("MAINTAINERS: Abort
HAXM maintenance") and 90c167a1da ("docs/about/deprecated: Mark
HAXM in QEMU as deprecated"), released in v8.0.0.

Per the latest HAXM release (v7.8 [*]), the latest QEMU supported
is v7.2:

  Note: Up to this release, HAXM supports QEMU from 2.9.0 to 7.2.0.

The next commit (https://github.com/intel/haxm/commit/da1b8ec072)
added:

  HAXM v7.8.0 is our last release and we will not accept
  pull requests or respond to issues after this.

It became very hard to build and test HAXM. Its previous
maintainers made it clear they won't help.  It doesn't seem to be
a very good use of QEMU maintainers to spend their time in a dead
project. Save our time by removing this orphan zombie code.

[*] https://github.com/intel/haxm/releases/tag/v7.8.0

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230831082016.60885-1-philmd@linaro.org>
---
 MAINTAINERS                                   |    8 -
 docs/about/build-platforms.rst                |    2 +-
 docs/about/deprecated.rst                     |    6 -
 docs/about/index.rst                          |    2 +-
 docs/about/removed-features.rst               |   11 +-
 docs/system/index.rst                         |    2 +-
 docs/system/introduction.rst                  |    3 -
 meson.build                                   |    7 -
 include/exec/poison.h                         |    1 -
 include/hw/core/cpu.h                         |    2 +-
 include/sysemu/hax.h                          |   49 -
 include/sysemu/hw_accel.h                     |    1 -
 target/i386/hax/hax-accel-ops.h               |   31 -
 target/i386/hax/hax-i386.h                    |   98 --
 target/i386/hax/hax-interface.h               |  369 ------
 target/i386/hax/hax-posix.h                   |   61 -
 target/i386/hax/hax-windows.h                 |   88 --
 accel/stubs/hax-stub.c                        |   24 -
 hw/intc/apic_common.c                         |    3 +-
 softmmu/cpus.c                                |    6 -
 softmmu/vl.c                                  |    6 -
 target/i386/hax/hax-accel-ops.c               |  105 --
 target/i386/hax/hax-all.c                     | 1141 -----------------
 target/i386/hax/hax-mem.c                     |  323 -----
 target/i386/hax/hax-posix.c                   |  305 -----
 target/i386/hax/hax-windows.c                 |  485 -------
 accel/Kconfig                                 |    3 -
 accel/stubs/meson.build                       |    1 -
 meson_options.txt                             |    2 -
 qemu-options.hx                               |    8 +-
 .../ci/org.centos/stream/8/x86_64/configure   |    1 -
 scripts/meson-buildoptions.sh                 |    3 -
 target/i386/hax/meson.build                   |    7 -
 target/i386/meson.build                       |    1 -
 34 files changed, 16 insertions(+), 3149 deletions(-)
 delete mode 100644 include/sysemu/hax.h
 delete mode 100644 target/i386/hax/hax-accel-ops.h
 delete mode 100644 target/i386/hax/hax-i386.h
 delete mode 100644 target/i386/hax/hax-interface.h
 delete mode 100644 target/i386/hax/hax-posix.h
 delete mode 100644 target/i386/hax/hax-windows.h
 delete mode 100644 accel/stubs/hax-stub.c
 delete mode 100644 target/i386/hax/hax-accel-ops.c
 delete mode 100644 target/i386/hax/hax-all.c
 delete mode 100644 target/i386/hax/hax-mem.c
 delete mode 100644 target/i386/hax/hax-posix.c
 delete mode 100644 target/i386/hax/hax-windows.c
 delete mode 100644 target/i386/hax/meson.build

diff --git a/MAINTAINERS b/MAINTAINERS
index 6111b6b4d9..3b29568ed4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -543,14 +543,6 @@ F: include/sysemu/xen.h
 F: include/sysemu/xen-mapcache.h
 F: stubs/xen-hw-stub.c
 
-Guest CPU Cores (HAXM)
----------------------
-X86 HAXM CPUs
-S: Orphan
-F: accel/stubs/hax-stub.c
-F: include/sysemu/hax.h
-F: target/i386/hax/
-
 Guest CPU Cores (NVMM)
 ----------------------
 NetBSD Virtual Machine Monitor (NVMM) CPU support
diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 0e2cb9e770..f2a7aec56f 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -52,7 +52,7 @@ Those hosts are officially supported, with various accelerators:
    * - SPARC
      - tcg
    * - x86
-     - hax, hvf (64 bit only), kvm, nvmm, tcg, whpx (64 bit only), xen
+     - hvf (64 bit only), kvm, nvmm, tcg, whpx (64 bit only), xen
 
 Other host architectures are not supported. It is possible to build QEMU system
 emulation on an unsupported host architecture using the configure
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 92a2bafd2b..dc4da95329 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -105,12 +105,6 @@ Use ``-machine hpet=off`` instead.
 The ``-no-acpi`` setting has been turned into a machine property.
 Use ``-machine acpi=off`` instead.
 
-``-accel hax`` (since 8.0)
-''''''''''''''''''''''''''
-
-The HAXM project has been retired (see https://github.com/intel/haxm#status).
-Use "whpx" (on Windows) or "hvf" (on macOS) instead.
-
 ``-async-teardown`` (since 8.1)
 '''''''''''''''''''''''''''''''
 
diff --git a/docs/about/index.rst b/docs/about/index.rst
index b00b584b31..4f96ab5d91 100644
--- a/docs/about/index.rst
+++ b/docs/about/index.rst
@@ -8,7 +8,7 @@ QEMU can be used in several different ways. The most common is for
 :ref:`System Emulation`, where it provides a virtual model of an
 entire machine (CPU, memory and emulated devices) to run a guest OS.
 In this mode the CPU may be fully emulated, or it may work with a
-hypervisor such as KVM, Xen, Hax or Hypervisor.Framework to allow the
+hypervisor such as KVM, Xen or Hypervisor.Framework to allow the
 guest to run directly on the host CPU.
 
 The second supported way to use QEMU is :ref:`User Mode Emulation`,
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 5b258b446b..c2043fd415 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -659,15 +659,18 @@ Use ``Icelake-Server`` instead.
 System accelerators
 -------------------
 
-Userspace local APIC with KVM (x86, removed 8.0)
-''''''''''''''''''''''''''''''''''''''''''''''''
+Userspace local APIC with KVM (x86, removed in 8.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''
 
 ``-M kernel-irqchip=off`` cannot be used on KVM if the CPU model includes
 a local APIC.  The ``split`` setting is supported, as is using ``-M
 kernel-irqchip=off`` when the CPU does not have a local APIC.
 
-System accelerators
--------------------
+HAXM (``-accel hax``) (removed in 8.2)
+''''''''''''''''''''''''''''''''''''''
+
+The HAXM project has been retired (see https://github.com/intel/haxm#status).
+Use "whpx" (on Windows) or "hvf" (on macOS) instead.
 
 MIPS "Trap-and-Emulate" KVM support (removed in 8.0)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 3605bbe1ce..45bf1f19e7 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -6,7 +6,7 @@ System Emulation
 
 This section of the manual is the overall guide for users using QEMU
 for full system emulation (as opposed to user-mode emulation).
-This includes working with hypervisors such as KVM, Xen, Hax
+This includes working with hypervisors such as KVM, Xen
 or Hypervisor.Framework.
 
 .. toctree::
diff --git a/docs/system/introduction.rst b/docs/system/introduction.rst
index 3e256f8326..51ac132d6c 100644
--- a/docs/system/introduction.rst
+++ b/docs/system/introduction.rst
@@ -21,9 +21,6 @@ Tiny Code Generator (TCG) capable of emulating many CPUs.
   * - Xen
     - Linux (as dom0)
     - Arm, x86
-  * - Intel HAXM (hax)
-    - Linux, Windows
-    - x86
   * - Hypervisor Framework (hvf)
     - MacOS
     - x86 (64 bit only), Arm (64 bit only)
diff --git a/meson.build b/meson.build
index 98e68ef0b1..ec14079c67 100644
--- a/meson.build
+++ b/meson.build
@@ -140,7 +140,6 @@ if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
 endif
 if cpu in ['x86', 'x86_64']
   accelerator_targets += {
-    'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
     'CONFIG_HVF': ['x86_64-softmmu'],
     'CONFIG_NVMM': ['i386-softmmu', 'x86_64-softmmu'],
     'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
@@ -663,11 +662,6 @@ if get_option('hvf').allowed()
     accelerators += 'CONFIG_HVF'
   endif
 endif
-if get_option('hax').allowed()
-  if get_option('hax').enabled() or targetos in ['windows', 'darwin', 'netbsd']
-    accelerators += 'CONFIG_HAX'
-  endif
-endif
 if targetos == 'netbsd'
   nvmm = cc.find_library('nvmm', required: get_option('nvmm'))
   if nvmm.found()
@@ -4140,7 +4134,6 @@ endif
 summary_info = {}
 if have_system
   summary_info += {'KVM support':       config_all.has_key('CONFIG_KVM')}
-  summary_info += {'HAX support':       config_all.has_key('CONFIG_HAX')}
   summary_info += {'HVF support':       config_all.has_key('CONFIG_HVF')}
   summary_info += {'WHPX support':      config_all.has_key('CONFIG_WHPX')}
   summary_info += {'NVMM support':      config_all.has_key('CONFIG_NVMM')}
diff --git a/include/exec/poison.h b/include/exec/poison.h
index e94ee8dfef..1ea5633eb3 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -81,7 +81,6 @@
 #pragma GCC poison CONFIG_SPARC_DIS
 #pragma GCC poison CONFIG_XTENSA_DIS
 
-#pragma GCC poison CONFIG_HAX
 #pragma GCC poison CONFIG_HVF
 #pragma GCC poison CONFIG_LINUX_USER
 #pragma GCC poison CONFIG_KVM
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fdcbe87352..92a4234439 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -422,7 +422,7 @@ struct CPUState {
     int32_t exception_index;
 
     AccelCPUState *accel;
-    /* shared by kvm, hax and hvf */
+    /* shared by kvm and hvf */
     bool vcpu_dirty;
 
     /* Used to keep track of an outstanding cpu throttle thread for migration
diff --git a/include/sysemu/hax.h b/include/sysemu/hax.h
deleted file mode 100644
index 80fc716f80..0000000000
--- a/include/sysemu/hax.h
+++ /dev/null
@@ -1,49 +0,0 @@
-/*
- * QEMU HAXM support
- *
- * Copyright IBM, Corp. 2008
- *
- * Authors:
- *  Anthony Liguori   <aliguori@us.ibm.com>
- *
- * Copyright (c) 2011 Intel Corporation
- *  Written by:
- *  Jiang Yunhong<yunhong.jiang@intel.com>
- *  Xin Xiaohui<xiaohui.xin@intel.com>
- *  Zhang Xiantao<xiantao.zhang@intel.com>
- *
- * Copyright 2016 Google, Inc.
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-/* header to be included in non-HAX-specific code */
-
-#ifndef QEMU_HAX_H
-#define QEMU_HAX_H
-
-int hax_sync_vcpus(void);
-
-#ifdef NEED_CPU_H
-# ifdef CONFIG_HAX
-#  define CONFIG_HAX_IS_POSSIBLE
-# endif
-#else /* !NEED_CPU_H */
-# define CONFIG_HAX_IS_POSSIBLE
-#endif
-
-#ifdef CONFIG_HAX_IS_POSSIBLE
-
-extern bool hax_allowed;
-
-#define hax_enabled()               (hax_allowed)
-
-#else /* !CONFIG_HAX_IS_POSSIBLE */
-
-#define hax_enabled()               (0)
-
-#endif /* CONFIG_HAX_IS_POSSIBLE */
-
-#endif /* QEMU_HAX_H */
diff --git a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
index 22903a55f7..c71b77e71f 100644
--- a/include/sysemu/hw_accel.h
+++ b/include/sysemu/hw_accel.h
@@ -12,7 +12,6 @@
 #define QEMU_HW_ACCEL_H
 
 #include "hw/core/cpu.h"
-#include "sysemu/hax.h"
 #include "sysemu/kvm.h"
 #include "sysemu/hvf.h"
 #include "sysemu/whpx.h"
diff --git a/target/i386/hax/hax-accel-ops.h b/target/i386/hax/hax-accel-ops.h
deleted file mode 100644
index 9e357e7b40..0000000000
--- a/target/i386/hax/hax-accel-ops.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- * Accelerator CPUS Interface
- *
- * Copyright 2020 SUSE LLC
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef TARGET_I386_HAX_ACCEL_OPS_H
-#define TARGET_I386_HAX_ACCEL_OPS_H
-
-#include "sysemu/cpus.h"
-
-#include "hax-interface.h"
-#include "hax-i386.h"
-
-int hax_init_vcpu(CPUState *cpu);
-int hax_smp_cpu_exec(CPUState *cpu);
-int hax_populate_ram(uint64_t va, uint64_t size);
-
-void hax_cpu_synchronize_state(CPUState *cpu);
-void hax_cpu_synchronize_post_reset(CPUState *cpu);
-void hax_cpu_synchronize_post_init(CPUState *cpu);
-void hax_cpu_synchronize_pre_loadvm(CPUState *cpu);
-
-int hax_vcpu_destroy(CPUState *cpu);
-void hax_raise_event(CPUState *cpu);
-void hax_reset_vcpu_state(void *opaque);
-
-#endif /* TARGET_I386_HAX_ACCEL_OPS_H */
diff --git a/target/i386/hax/hax-i386.h b/target/i386/hax/hax-i386.h
deleted file mode 100644
index 87153f40ab..0000000000
--- a/target/i386/hax/hax-i386.h
+++ /dev/null
@@ -1,98 +0,0 @@
-/*
- * QEMU HAXM support
- *
- * Copyright (c) 2011 Intel Corporation
- *  Written by:
- *  Jiang Yunhong<yunhong.jiang@intel.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#ifndef HAX_I386_H
-#define HAX_I386_H
-
-#include "cpu.h"
-#include "sysemu/hax.h"
-
-#ifdef CONFIG_POSIX
-typedef int hax_fd;
-#endif
-
-#ifdef CONFIG_WIN32
-typedef HANDLE hax_fd;
-#endif
-
-extern struct hax_state hax_global;
-
-struct AccelCPUState {
-#ifdef _WIN32
-    HANDLE hThread;
-#endif
-    hax_fd fd;
-    int vcpu_id;
-    struct hax_tunnel *tunnel;
-    unsigned char *iobuf;
-};
-
-struct hax_state {
-    hax_fd fd; /* the global hax device interface */
-    uint32_t version;
-    struct hax_vm *vm;
-    uint64_t mem_quota;
-    bool supports_64bit_ramblock;
-};
-
-#define HAX_MAX_VCPU 0x10
-
-struct hax_vm {
-    hax_fd fd;
-    int id;
-    int numvcpus;
-    AccelCPUState **vcpus;
-};
-
-/* Functions exported to host specific mode */
-hax_fd hax_vcpu_get_fd(CPUArchState *env);
-int valid_hax_tunnel_size(uint16_t size);
-
-/* Host specific functions */
-int hax_mod_version(struct hax_state *hax, struct hax_module_version *version);
-int hax_inject_interrupt(CPUArchState *env, int vector);
-struct hax_vm *hax_vm_create(struct hax_state *hax, int max_cpus);
-int hax_vcpu_run(AccelCPUState *vcpu);
-int hax_vcpu_create(int id);
-void hax_kick_vcpu_thread(CPUState *cpu);
-
-int hax_sync_vcpu_state(CPUArchState *env, struct vcpu_state_t *state,
-                        int set);
-int hax_sync_msr(CPUArchState *env, struct hax_msr_data *msrs, int set);
-int hax_sync_fpu(CPUArchState *env, struct fx_layout *fl, int set);
-
-int hax_vm_destroy(struct hax_vm *vm);
-int hax_capability(struct hax_state *hax, struct hax_capabilityinfo *cap);
-int hax_notify_qemu_version(hax_fd vm_fd, struct hax_qemu_version *qversion);
-int hax_set_ram(uint64_t start_pa, uint32_t size, uint64_t host_va, int flags);
-
-/* Common host function */
-int hax_host_create_vm(struct hax_state *hax, int *vm_id);
-hax_fd hax_host_open_vm(struct hax_state *hax, int vm_id);
-int hax_host_create_vcpu(hax_fd vm_fd, int vcpuid);
-hax_fd hax_host_open_vcpu(int vmid, int vcpuid);
-int hax_host_setup_vcpu_channel(AccelCPUState *vcpu);
-hax_fd hax_mod_open(void);
-void hax_memory_init(void);
-
-
-#ifdef CONFIG_POSIX
-#include "hax-posix.h"
-#endif
-
-#ifdef CONFIG_WIN32
-#include "hax-windows.h"
-#endif
-
-#include "hax-interface.h"
-
-#endif
diff --git a/target/i386/hax/hax-interface.h b/target/i386/hax/hax-interface.h
deleted file mode 100644
index 537ae084e9..0000000000
--- a/target/i386/hax/hax-interface.h
+++ /dev/null
@@ -1,369 +0,0 @@
-/*
- * QEMU HAXM support
- *
- * Copyright (c) 2011 Intel Corporation
- *  Written by:
- *  Jiang Yunhong<yunhong.jiang@intel.com>
- *  Xin Xiaohui<xiaohui.xin@intel.com>
- *  Zhang Xiantao<xiantao.zhang@intel.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-/* Interface with HAX kernel module */
-
-#ifndef HAX_INTERFACE_H
-#define HAX_INTERFACE_H
-
-/* fx_layout has 3 formats table 3-56, 512bytes */
-struct fx_layout {
-    uint16_t fcw;
-    uint16_t fsw;
-    uint8_t ftw;
-    uint8_t res1;
-    uint16_t fop;
-    union {
-        struct {
-            uint32_t fip;
-            uint16_t fcs;
-            uint16_t res2;
-        };
-        uint64_t fpu_ip;
-    };
-    union {
-        struct {
-            uint32_t fdp;
-            uint16_t fds;
-            uint16_t res3;
-        };
-        uint64_t fpu_dp;
-    };
-    uint32_t mxcsr;
-    uint32_t mxcsr_mask;
-    uint8_t st_mm[8][16];
-    uint8_t mmx_1[8][16];
-    uint8_t mmx_2[8][16];
-    uint8_t pad[96];
-} __attribute__ ((aligned(8)));
-
-struct vmx_msr {
-    uint64_t entry;
-    uint64_t value;
-} __attribute__ ((__packed__));
-
-/*
- * Fixed array is not good, but it makes Mac support a bit easier by avoiding
- * memory map or copyin staff.
- */
-#define HAX_MAX_MSR_ARRAY 0x20
-struct hax_msr_data {
-    uint16_t nr_msr;
-    uint16_t done;
-    uint16_t pad[2];
-    struct vmx_msr entries[HAX_MAX_MSR_ARRAY];
-} __attribute__ ((__packed__));
-
-union interruptibility_state_t {
-    uint32_t raw;
-    struct {
-        uint32_t sti_blocking:1;
-        uint32_t movss_blocking:1;
-        uint32_t smi_blocking:1;
-        uint32_t nmi_blocking:1;
-        uint32_t reserved:28;
-    };
-    uint64_t pad;
-};
-
-typedef union interruptibility_state_t interruptibility_state_t;
-
-/* Segment descriptor */
-struct segment_desc_t {
-    uint16_t selector;
-    uint16_t _dummy;
-    uint32_t limit;
-    uint64_t base;
-    union {
-        struct {
-            uint32_t type:4;
-            uint32_t desc:1;
-            uint32_t dpl:2;
-            uint32_t present:1;
-            uint32_t:4;
-            uint32_t available:1;
-            uint32_t long_mode:1;
-            uint32_t operand_size:1;
-            uint32_t granularity:1;
-            uint32_t null:1;
-            uint32_t:15;
-        };
-        uint32_t ar;
-    };
-    uint32_t ipad;
-};
-
-typedef struct segment_desc_t segment_desc_t;
-
-struct vcpu_state_t {
-    union {
-        uint64_t _regs[16];
-        struct {
-            union {
-                struct {
-                    uint8_t _al, _ah;
-                };
-                uint16_t _ax;
-                uint32_t _eax;
-                uint64_t _rax;
-            };
-            union {
-                struct {
-                    uint8_t _cl, _ch;
-                };
-                uint16_t _cx;
-                uint32_t _ecx;
-                uint64_t _rcx;
-            };
-            union {
-                struct {
-                    uint8_t _dl, _dh;
-                };
-                uint16_t _dx;
-                uint32_t _edx;
-                uint64_t _rdx;
-            };
-            union {
-                struct {
-                    uint8_t _bl, _bh;
-                };
-                uint16_t _bx;
-                uint32_t _ebx;
-                uint64_t _rbx;
-            };
-            union {
-                uint16_t _sp;
-                uint32_t _esp;
-                uint64_t _rsp;
-            };
-            union {
-                uint16_t _bp;
-                uint32_t _ebp;
-                uint64_t _rbp;
-            };
-            union {
-                uint16_t _si;
-                uint32_t _esi;
-                uint64_t _rsi;
-            };
-            union {
-                uint16_t _di;
-                uint32_t _edi;
-                uint64_t _rdi;
-            };
-
-            uint64_t _r8;
-            uint64_t _r9;
-            uint64_t _r10;
-            uint64_t _r11;
-            uint64_t _r12;
-            uint64_t _r13;
-            uint64_t _r14;
-            uint64_t _r15;
-        };
-    };
-
-    union {
-        uint32_t _eip;
-        uint64_t _rip;
-    };
-
-    union {
-        uint32_t _eflags;
-        uint64_t _rflags;
-    };
-
-    segment_desc_t _cs;
-    segment_desc_t _ss;
-    segment_desc_t _ds;
-    segment_desc_t _es;
-    segment_desc_t _fs;
-    segment_desc_t _gs;
-    segment_desc_t _ldt;
-    segment_desc_t _tr;
-
-    segment_desc_t _gdt;
-    segment_desc_t _idt;
-
-    uint64_t _cr0;
-    uint64_t _cr2;
-    uint64_t _cr3;
-    uint64_t _cr4;
-
-    uint64_t _dr0;
-    uint64_t _dr1;
-    uint64_t _dr2;
-    uint64_t _dr3;
-    uint64_t _dr6;
-    uint64_t _dr7;
-    uint64_t _pde;
-
-    uint32_t _efer;
-
-    uint32_t _sysenter_cs;
-    uint64_t _sysenter_eip;
-    uint64_t _sysenter_esp;
-
-    uint32_t _activity_state;
-    uint32_t pad;
-    interruptibility_state_t _interruptibility_state;
-};
-
-/* HAX exit status */
-enum exit_status {
-    /* IO port request */
-    HAX_EXIT_IO = 1,
-    /* MMIO instruction emulation */
-    HAX_EXIT_MMIO,
-    /* QEMU emulation mode request, currently means guest enter non-PG mode */
-    HAX_EXIT_REAL,
-    /*
-     * Interrupt window open, qemu can inject interrupt now
-     * Also used when signal pending since at that time qemu usually need
-     * check interrupt
-     */
-    HAX_EXIT_INTERRUPT,
-    /* Unknown vmexit, mostly trigger reboot */
-    HAX_EXIT_UNKNOWN_VMEXIT,
-    /* HALT from guest */
-    HAX_EXIT_HLT,
-    /* Reboot request, like because of tripple fault in guest */
-    HAX_EXIT_STATECHANGE,
-    /* the vcpu is now only paused when destroy, so simply return to hax */
-    HAX_EXIT_PAUSED,
-    HAX_EXIT_FAST_MMIO,
-};
-
-/*
- * The interface definition:
- * 1. vcpu_run execute will return 0 on success, otherwise mean failed
- * 2. exit_status return the exit reason, as stated in enum exit_status
- * 3. exit_reason is the vmx exit reason
- */
-struct hax_tunnel {
-    uint32_t _exit_reason;
-    uint32_t _exit_flag;
-    uint32_t _exit_status;
-    uint32_t user_event_pending;
-    int ready_for_interrupt_injection;
-    int request_interrupt_window;
-    union {
-        struct {
-            /* 0: read, 1: write */
-#define HAX_EXIT_IO_IN  1
-#define HAX_EXIT_IO_OUT 0
-            uint8_t _direction;
-            uint8_t _df;
-            uint16_t _size;
-            uint16_t _port;
-            uint16_t _count;
-            uint8_t _flags;
-            uint8_t _pad0;
-            uint16_t _pad1;
-            uint32_t _pad2;
-            uint64_t _vaddr;
-        } pio;
-        struct {
-            uint64_t gla;
-        } mmio;
-        struct {
-        } state;
-    };
-} __attribute__ ((__packed__));
-
-struct hax_module_version {
-    uint32_t compat_version;
-    uint32_t cur_version;
-} __attribute__ ((__packed__));
-
-/* This interface is support only after API version 2 */
-struct hax_qemu_version {
-    /* Current API version in QEMU */
-    uint32_t cur_version;
-    /* The minimum API version supported by QEMU */
-    uint32_t min_version;
-} __attribute__ ((__packed__));
-
-/* The mac specfic interface to qemu, mostly is ioctl related */
-struct hax_tunnel_info {
-    uint64_t va;
-    uint64_t io_va;
-    uint16_t size;
-    uint16_t pad[3];
-} __attribute__ ((__packed__));
-
-struct hax_alloc_ram_info {
-    uint32_t size;
-    uint32_t pad;
-    uint64_t va;
-} __attribute__ ((__packed__));
-
-struct hax_ramblock_info {
-    uint64_t start_va;
-    uint64_t size;
-    uint64_t reserved;
-} __attribute__ ((__packed__));
-
-#define HAX_RAM_INFO_ROM     0x01 /* Read-Only */
-#define HAX_RAM_INFO_INVALID 0x80 /* Unmapped, usually used for MMIO */
-struct hax_set_ram_info {
-    uint64_t pa_start;
-    uint32_t size;
-    uint8_t flags;
-    uint8_t pad[3];
-    uint64_t va;
-} __attribute__ ((__packed__));
-
-#define HAX_CAP_STATUS_WORKING     0x1
-#define HAX_CAP_STATUS_NOTWORKING  0x0
-#define HAX_CAP_WORKSTATUS_MASK    0x1
-
-#define HAX_CAP_FAILREASON_VT      0x1
-#define HAX_CAP_FAILREASON_NX      0x2
-
-#define HAX_CAP_MEMQUOTA           0x2
-#define HAX_CAP_UG                 0x4
-#define HAX_CAP_64BIT_RAMBLOCK     0x8
-
-struct hax_capabilityinfo {
-    /* bit 0: 1 - working
-     *        0 - not working, possibly because NT/NX disabled
-     * bit 1: 1 - memory limitation working
-     *        0 - no memory limitation
-     */
-    uint16_t wstatus;
-    /* valid when not working
-     * bit 0: VT not enabeld
-     * bit 1: NX not enabled*/
-    uint16_t winfo;
-    uint32_t pad;
-    uint64_t mem_quota;
-} __attribute__ ((__packed__));
-
-struct hax_fastmmio {
-    uint64_t gpa;
-    union {
-        uint64_t value;
-        uint64_t gpa2;  /* since HAX API v4 */
-    };
-    uint8_t size;
-    uint8_t direction;
-    uint16_t reg_index;
-    uint32_t pad0;
-    uint64_t _cr0;
-    uint64_t _cr2;
-    uint64_t _cr3;
-    uint64_t _cr4;
-} __attribute__ ((__packed__));
-#endif
diff --git a/target/i386/hax/hax-posix.h b/target/i386/hax/hax-posix.h
deleted file mode 100644
index fb7c64426d..0000000000
--- a/target/i386/hax/hax-posix.h
+++ /dev/null
@@ -1,61 +0,0 @@
-/*
- * QEMU HAXM support
- *
- * Copyright (c) 2011 Intel Corporation
- *  Written by:
- *  Jiang Yunhong<yunhong.jiang@intel.com>
- *  Xin Xiaohui<xiaohui.xin@intel.com>
- *  Zhang Xiantao<xiantao.zhang@intel.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#ifndef TARGET_I386_HAX_POSIX_H
-#define TARGET_I386_HAX_POSIX_H
-
-#include <sys/ioctl.h>
-
-#define HAX_INVALID_FD  (-1)
-static inline int hax_invalid_fd(hax_fd fd)
-{
-    return fd <= 0;
-}
-
-static inline void hax_mod_close(struct hax_state *hax)
-{
-    close(hax->fd);
-}
-
-static inline void hax_close_fd(hax_fd fd)
-{
-    close(fd);
-}
-
-/* HAX model level ioctl */
-#define HAX_IOCTL_VERSION _IOWR(0, 0x20, struct hax_module_version)
-#define HAX_IOCTL_CREATE_VM _IOWR(0, 0x21, uint32_t)
-#define HAX_IOCTL_DESTROY_VM _IOW(0, 0x22, uint32_t)
-#define HAX_IOCTL_CAPABILITY _IOR(0, 0x23, struct hax_capabilityinfo)
-
-#define HAX_VM_IOCTL_VCPU_CREATE _IOWR(0, 0x80, uint32_t)
-#define HAX_VM_IOCTL_ALLOC_RAM _IOWR(0, 0x81, struct hax_alloc_ram_info)
-#define HAX_VM_IOCTL_SET_RAM _IOWR(0, 0x82, struct hax_set_ram_info)
-#define HAX_VM_IOCTL_VCPU_DESTROY _IOW(0, 0x83, uint32_t)
-#define HAX_VM_IOCTL_NOTIFY_QEMU_VERSION _IOW(0, 0x84, struct hax_qemu_version)
-#define HAX_VM_IOCTL_ADD_RAMBLOCK _IOW(0, 0x85, struct hax_ramblock_info)
-
-#define HAX_VCPU_IOCTL_RUN  _IO(0, 0xc0)
-#define HAX_VCPU_IOCTL_SET_MSRS _IOWR(0, 0xc1, struct hax_msr_data)
-#define HAX_VCPU_IOCTL_GET_MSRS _IOWR(0, 0xc2, struct hax_msr_data)
-
-#define HAX_VCPU_IOCTL_SET_FPU  _IOW(0, 0xc3, struct fx_layout)
-#define HAX_VCPU_IOCTL_GET_FPU  _IOR(0, 0xc4, struct fx_layout)
-
-#define HAX_VCPU_IOCTL_SETUP_TUNNEL _IOWR(0, 0xc5, struct hax_tunnel_info)
-#define HAX_VCPU_IOCTL_INTERRUPT _IOWR(0, 0xc6, uint32_t)
-#define HAX_VCPU_SET_REGS       _IOWR(0, 0xc7, struct vcpu_state_t)
-#define HAX_VCPU_GET_REGS       _IOWR(0, 0xc8, struct vcpu_state_t)
-
-#endif /* TARGET_I386_HAX_POSIX_H */
diff --git a/target/i386/hax/hax-windows.h b/target/i386/hax/hax-windows.h
deleted file mode 100644
index b1f5d4f32f..0000000000
--- a/target/i386/hax/hax-windows.h
+++ /dev/null
@@ -1,88 +0,0 @@
-/*
- * QEMU HAXM support
- *
- * Copyright IBM, Corp. 2008
- *
- * Authors:
- *  Anthony Liguori   <aliguori@us.ibm.com>
- *
- * Copyright (c) 2011 Intel Corporation
- *  Written by:
- *  Jiang Yunhong<yunhong.jiang@intel.com>
- *  Xin Xiaohui<xiaohui.xin@intel.com>
- *  Zhang Xiantao<xiantao.zhang@intel.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#ifndef TARGET_I386_HAX_WINDOWS_H
-#define TARGET_I386_HAX_WINDOWS_H
-
-#include <winioctl.h>
-#include <windef.h>
-
-#include "hax-accel-ops.h"
-
-#define HAX_INVALID_FD INVALID_HANDLE_VALUE
-
-static inline void hax_mod_close(struct hax_state *hax)
-{
-    CloseHandle(hax->fd);
-}
-
-static inline void hax_close_fd(hax_fd fd)
-{
-    CloseHandle(fd);
-}
-
-static inline int hax_invalid_fd(hax_fd fd)
-{
-    return (fd == INVALID_HANDLE_VALUE);
-}
-
-#define HAX_DEVICE_TYPE 0x4000
-
-#define HAX_IOCTL_VERSION       CTL_CODE(HAX_DEVICE_TYPE, 0x900, \
-                                         METHOD_BUFFERED, FILE_ANY_ACCESS)
-#define HAX_IOCTL_CREATE_VM     CTL_CODE(HAX_DEVICE_TYPE, 0x901, \
-                                         METHOD_BUFFERED, FILE_ANY_ACCESS)
-#define HAX_IOCTL_CAPABILITY    CTL_CODE(HAX_DEVICE_TYPE, 0x910, \
-                                         METHOD_BUFFERED, FILE_ANY_ACCESS)
-
-#define HAX_VM_IOCTL_VCPU_CREATE   CTL_CODE(HAX_DEVICE_TYPE, 0x902, \
-                                            METHOD_BUFFERED, FILE_ANY_ACCESS)
-#define HAX_VM_IOCTL_ALLOC_RAM     CTL_CODE(HAX_DEVICE_TYPE, 0x903, \
-                                            METHOD_BUFFERED, FILE_ANY_ACCESS)
-#define HAX_VM_IOCTL_SET_RAM       CTL_CODE(HAX_DEVICE_TYPE, 0x904, \
-                                            METHOD_BUFFERED, FILE_ANY_ACCESS)
-#define HAX_VM_IOCTL_VCPU_DESTROY  CTL_CODE(HAX_DEVICE_TYPE, 0x905, \
-                                            METHOD_BUFFERED, FILE_ANY_ACCESS)
-#define HAX_VM_IOCTL_ADD_RAMBLOCK  CTL_CODE(HAX_DEVICE_TYPE, 0x913, \
-                                            METHOD_BUFFERED, FILE_ANY_ACCESS)
-
-#define HAX_VCPU_IOCTL_RUN      CTL_CODE(HAX_DEVICE_TYPE, 0x906, \
-                                         METHOD_BUFFERED, FILE_ANY_ACCESS)
-#define HAX_VCPU_IOCTL_SET_MSRS CTL_CODE(HAX_DEVICE_TYPE, 0x907, \
-                                         METHOD_BUFFERED, FILE_ANY_ACCESS)
-#define HAX_VCPU_IOCTL_GET_MSRS CTL_CODE(HAX_DEVICE_TYPE, 0x908, \
-                                         METHOD_BUFFERED, FILE_ANY_ACCESS)
-#define HAX_VCPU_IOCTL_SET_FPU  CTL_CODE(HAX_DEVICE_TYPE, 0x909, \
-                                         METHOD_BUFFERED, FILE_ANY_ACCESS)
-#define HAX_VCPU_IOCTL_GET_FPU  CTL_CODE(HAX_DEVICE_TYPE, 0x90a, \
-                                         METHOD_BUFFERED, FILE_ANY_ACCESS)
-
-#define HAX_VCPU_IOCTL_SETUP_TUNNEL  CTL_CODE(HAX_DEVICE_TYPE, 0x90b, \
-                                              METHOD_BUFFERED, FILE_ANY_ACCESS)
-#define HAX_VCPU_IOCTL_INTERRUPT     CTL_CODE(HAX_DEVICE_TYPE, 0x90c, \
-                                              METHOD_BUFFERED, FILE_ANY_ACCESS)
-#define HAX_VCPU_SET_REGS            CTL_CODE(HAX_DEVICE_TYPE, 0x90d, \
-                                              METHOD_BUFFERED, FILE_ANY_ACCESS)
-#define HAX_VCPU_GET_REGS            CTL_CODE(HAX_DEVICE_TYPE, 0x90e, \
-                                              METHOD_BUFFERED, FILE_ANY_ACCESS)
-
-#define HAX_VM_IOCTL_NOTIFY_QEMU_VERSION CTL_CODE(HAX_DEVICE_TYPE, 0x910, \
-                                                  METHOD_BUFFERED,        \
-                                                  FILE_ANY_ACCESS)
-#endif /* TARGET_I386_HAX_WINDOWS_H */
diff --git a/accel/stubs/hax-stub.c b/accel/stubs/hax-stub.c
deleted file mode 100644
index 2fe31aaa9a..0000000000
--- a/accel/stubs/hax-stub.c
+++ /dev/null
@@ -1,24 +0,0 @@
-/*
- * QEMU HAXM support
- *
- * Copyright (c) 2015, Intel Corporation
- *
- * Copyright 2016 Google, Inc.
- *
- * This software is licensed under the terms of the GNU General Public
- * License version 2, as published by the Free Software Foundation, and
- * may be copied, distributed, and modified under those terms.
- *
- * See the COPYING file in the top-level directory.
- *
- */
-
-#include "qemu/osdep.h"
-#include "sysemu/hax.h"
-
-bool hax_allowed;
-
-int hax_sync_vcpus(void)
-{
-    return 0;
-}
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 4a34f03047..68ad30e2f5 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -28,7 +28,6 @@
 #include "hw/intc/kvm_irqcount.h"
 #include "trace.h"
 #include "hw/boards.h"
-#include "sysemu/hax.h"
 #include "sysemu/kvm.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
@@ -271,7 +270,7 @@ static void apic_common_realize(DeviceState *dev, Error **errp)
 
     /* Note: We need at least 1M to map the VAPIC option ROM */
     if (!vapic && s->vapic_control & VAPIC_ENABLE_MASK &&
-        !hax_enabled() && current_machine->ram_size >= 1024 * 1024) {
+            current_machine->ram_size >= 1024 * 1024) {
         vapic = sysbus_create_simple("kvmvapic", -1, NULL);
     }
     s->vapic = vapic;
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index fed20ffb5d..0848e0dbdb 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -427,12 +427,6 @@ void qemu_wait_io_event(CPUState *cpu)
         qemu_plugin_vcpu_resume_cb(cpu);
     }
 
-#ifdef _WIN32
-    /* Eat dummy APC queued by cpus_kick_thread. */
-    if (hax_enabled()) {
-        SleepEx(0, TRUE);
-    }
-#endif
     qemu_wait_io_event_common(cpu);
 }
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b0b96f67fa..5a10b3c309 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -86,7 +86,6 @@
 #include "migration/colo.h"
 #include "migration/postcopy-ram.h"
 #include "sysemu/kvm.h"
-#include "sysemu/hax.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qemu/option.h"
 #include "qemu/config-file.h"
@@ -2546,11 +2545,6 @@ static void qemu_init_board(void)
     drive_check_orphaned();
 
     realtime_init();
-
-    if (hax_enabled()) {
-        /* FIXME: why isn't cpu_synchronize_all_post_init enough? */
-        hax_sync_vcpus();
-    }
 }
 
 static void qemu_create_cli_devices(void)
diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
deleted file mode 100644
index 5031096760..0000000000
--- a/target/i386/hax/hax-accel-ops.c
+++ /dev/null
@@ -1,105 +0,0 @@
-/*
- * QEMU HAX support
- *
- * Copyright IBM, Corp. 2008
- *           Red Hat, Inc. 2008
- *
- * Authors:
- *  Anthony Liguori   <aliguori@us.ibm.com>
- *  Glauber Costa     <gcosta@redhat.com>
- *
- * Copyright (c) 2011 Intel Corporation
- *  Written by:
- *  Jiang Yunhong<yunhong.jiang@intel.com>
- *  Xin Xiaohui<xiaohui.xin@intel.com>
- *  Zhang Xiantao<xiantao.zhang@intel.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#include "qemu/osdep.h"
-#include "qemu/error-report.h"
-#include "qemu/main-loop.h"
-#include "sysemu/runstate.h"
-#include "sysemu/cpus.h"
-#include "qemu/guest-random.h"
-
-#include "hax-accel-ops.h"
-
-static void *hax_cpu_thread_fn(void *arg)
-{
-    CPUState *cpu = arg;
-    int r;
-
-    rcu_register_thread();
-    qemu_mutex_lock_iothread();
-    qemu_thread_get_self(cpu->thread);
-
-    cpu->thread_id = qemu_get_thread_id();
-    current_cpu = cpu;
-    hax_init_vcpu(cpu);
-    cpu_thread_signal_created(cpu);
-    qemu_guest_random_seed_thread_part2(cpu->random_seed);
-
-    do {
-        if (cpu_can_run(cpu)) {
-            r = hax_smp_cpu_exec(cpu);
-            if (r == EXCP_DEBUG) {
-                cpu_handle_guest_debug(cpu);
-            }
-        }
-
-        qemu_wait_io_event(cpu);
-    } while (!cpu->unplug || cpu_can_run(cpu));
-    hax_vcpu_destroy(cpu);
-    cpu_thread_signal_destroyed(cpu);
-    rcu_unregister_thread();
-    return NULL;
-}
-
-static void hax_start_vcpu_thread(CPUState *cpu)
-{
-    char thread_name[VCPU_THREAD_NAME_SIZE];
-
-    cpu->thread = g_new0(QemuThread, 1);
-    cpu->halt_cond = g_new0(QemuCond, 1);
-    qemu_cond_init(cpu->halt_cond);
-
-    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HAX",
-             cpu->cpu_index);
-    qemu_thread_create(cpu->thread, thread_name, hax_cpu_thread_fn,
-                       cpu, QEMU_THREAD_JOINABLE);
-    assert(cpu->accel);
-#ifdef _WIN32
-    cpu->accel->hThread = qemu_thread_get_handle(cpu->thread);
-#endif
-}
-
-static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
-{
-    AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
-
-    ops->create_vcpu_thread = hax_start_vcpu_thread;
-    ops->kick_vcpu_thread = hax_kick_vcpu_thread;
-
-    ops->synchronize_post_reset = hax_cpu_synchronize_post_reset;
-    ops->synchronize_post_init = hax_cpu_synchronize_post_init;
-    ops->synchronize_state = hax_cpu_synchronize_state;
-    ops->synchronize_pre_loadvm = hax_cpu_synchronize_pre_loadvm;
-}
-
-static const TypeInfo hax_accel_ops_type = {
-    .name = ACCEL_OPS_NAME("hax"),
-
-    .parent = TYPE_ACCEL_OPS,
-    .class_init = hax_accel_ops_class_init,
-    .abstract = true,
-};
-
-static void hax_accel_ops_register_types(void)
-{
-    type_register_static(&hax_accel_ops_type);
-}
-type_init(hax_accel_ops_register_types);
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
deleted file mode 100644
index 18d78e5b6b..0000000000
--- a/target/i386/hax/hax-all.c
+++ /dev/null
@@ -1,1141 +0,0 @@
-/*
- * QEMU HAX support
- *
- * Copyright IBM, Corp. 2008
- *           Red Hat, Inc. 2008
- *
- * Authors:
- *  Anthony Liguori   <aliguori@us.ibm.com>
- *  Glauber Costa     <gcosta@redhat.com>
- *
- * Copyright (c) 2011 Intel Corporation
- *  Written by:
- *  Jiang Yunhong<yunhong.jiang@intel.com>
- *  Xin Xiaohui<xiaohui.xin@intel.com>
- *  Zhang Xiantao<xiantao.zhang@intel.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-/*
- * HAX common code for both windows and darwin
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/address-spaces.h"
-
-#include "qemu/accel.h"
-#include "sysemu/reset.h"
-#include "sysemu/runstate.h"
-#include "hw/boards.h"
-
-#include "hax-accel-ops.h"
-
-#define DEBUG_HAX 0
-
-#define DPRINTF(fmt, ...) \
-    do { \
-        if (DEBUG_HAX) { \
-            fprintf(stdout, fmt, ## __VA_ARGS__); \
-        } \
-    } while (0)
-
-/* Current version */
-const uint32_t hax_cur_version = 0x4; /* API v4: unmapping and MMIO moves */
-/* Minimum HAX kernel version */
-const uint32_t hax_min_version = 0x4; /* API v4: supports unmapping */
-
-bool hax_allowed;
-
-struct hax_state hax_global;
-
-static void hax_vcpu_sync_state(CPUArchState *env, int modified);
-static int hax_arch_get_registers(CPUArchState *env);
-
-int valid_hax_tunnel_size(uint16_t size)
-{
-    return size >= sizeof(struct hax_tunnel);
-}
-
-hax_fd hax_vcpu_get_fd(CPUArchState *env)
-{
-    AccelCPUState *vcpu = env_cpu(env)->accel;
-    if (!vcpu) {
-        return HAX_INVALID_FD;
-    }
-    return vcpu->fd;
-}
-
-static int hax_get_capability(struct hax_state *hax)
-{
-    int ret;
-    struct hax_capabilityinfo capinfo, *cap = &capinfo;
-
-    ret = hax_capability(hax, cap);
-    if (ret) {
-        return ret;
-    }
-
-    if ((cap->wstatus & HAX_CAP_WORKSTATUS_MASK) == HAX_CAP_STATUS_NOTWORKING) {
-        if (cap->winfo & HAX_CAP_FAILREASON_VT) {
-            DPRINTF
-                ("VTX feature is not enabled, HAX driver will not work.\n");
-        } else if (cap->winfo & HAX_CAP_FAILREASON_NX) {
-            DPRINTF
-                ("NX feature is not enabled, HAX driver will not work.\n");
-        }
-        return -ENXIO;
-
-    }
-
-    if (!(cap->winfo & HAX_CAP_UG)) {
-        fprintf(stderr, "UG mode is not supported by the hardware.\n");
-        return -ENOTSUP;
-    }
-
-    hax->supports_64bit_ramblock = !!(cap->winfo & HAX_CAP_64BIT_RAMBLOCK);
-
-    if (cap->wstatus & HAX_CAP_MEMQUOTA) {
-        if (cap->mem_quota < hax->mem_quota) {
-            fprintf(stderr, "The VM memory needed exceeds the driver limit.\n");
-            return -ENOSPC;
-        }
-    }
-    return 0;
-}
-
-static int hax_version_support(struct hax_state *hax)
-{
-    int ret;
-    struct hax_module_version version;
-
-    ret = hax_mod_version(hax, &version);
-    if (ret < 0) {
-        return 0;
-    }
-
-    if (hax_min_version > version.cur_version) {
-        fprintf(stderr, "Incompatible HAX module version %d,",
-                version.cur_version);
-        fprintf(stderr, "requires minimum version %d\n", hax_min_version);
-        return 0;
-    }
-    if (hax_cur_version < version.compat_version) {
-        fprintf(stderr, "Incompatible QEMU HAX API version %x,",
-                hax_cur_version);
-        fprintf(stderr, "requires minimum HAX API version %x\n",
-                version.compat_version);
-        return 0;
-    }
-
-    return 1;
-}
-
-int hax_vcpu_create(int id)
-{
-    AccelCPUState *vcpu = NULL;
-    int ret;
-
-    if (!hax_global.vm) {
-        fprintf(stderr, "vcpu %x created failed, vm is null\n", id);
-        return -1;
-    }
-
-    if (hax_global.vm->vcpus[id]) {
-        fprintf(stderr, "vcpu %x allocated already\n", id);
-        return 0;
-    }
-
-    vcpu = g_new0(AccelCPUState, 1);
-
-    ret = hax_host_create_vcpu(hax_global.vm->fd, id);
-    if (ret) {
-        fprintf(stderr, "Failed to create vcpu %x\n", id);
-        goto error;
-    }
-
-    vcpu->vcpu_id = id;
-    vcpu->fd = hax_host_open_vcpu(hax_global.vm->id, id);
-    if (hax_invalid_fd(vcpu->fd)) {
-        fprintf(stderr, "Failed to open the vcpu\n");
-        ret = -ENODEV;
-        goto error;
-    }
-
-    hax_global.vm->vcpus[id] = vcpu;
-
-    ret = hax_host_setup_vcpu_channel(vcpu);
-    if (ret) {
-        fprintf(stderr, "Invalid hax tunnel size\n");
-        ret = -EINVAL;
-        goto error;
-    }
-    return 0;
-
-  error:
-    /* vcpu and tunnel will be closed automatically */
-    if (vcpu && !hax_invalid_fd(vcpu->fd)) {
-        hax_close_fd(vcpu->fd);
-    }
-
-    hax_global.vm->vcpus[id] = NULL;
-    g_free(vcpu);
-    return -1;
-}
-
-int hax_vcpu_destroy(CPUState *cpu)
-{
-    AccelCPUState *vcpu = cpu->accel;
-
-    if (!hax_global.vm) {
-        fprintf(stderr, "vcpu %x destroy failed, vm is null\n", vcpu->vcpu_id);
-        return -1;
-    }
-
-    if (!vcpu) {
-        return 0;
-    }
-
-    /*
-     * 1. The hax_tunnel is also destroyed when vcpu is destroyed
-     * 2. close fd will cause hax module vcpu be cleaned
-     */
-    hax_close_fd(vcpu->fd);
-    hax_global.vm->vcpus[vcpu->vcpu_id] = NULL;
-#ifdef _WIN32
-    CloseHandle(vcpu->hThread);
-#endif
-    g_free(vcpu);
-    cpu->accel = NULL;
-    return 0;
-}
-
-int hax_init_vcpu(CPUState *cpu)
-{
-    int ret;
-
-    ret = hax_vcpu_create(cpu->cpu_index);
-    if (ret < 0) {
-        fprintf(stderr, "Failed to create HAX vcpu\n");
-        exit(-1);
-    }
-
-    cpu->accel = hax_global.vm->vcpus[cpu->cpu_index];
-    cpu->vcpu_dirty = true;
-    qemu_register_reset(hax_reset_vcpu_state, cpu->env_ptr);
-
-    return ret;
-}
-
-struct hax_vm *hax_vm_create(struct hax_state *hax, int max_cpus)
-{
-    struct hax_vm *vm;
-    int vm_id = 0, ret, i;
-
-    if (hax_invalid_fd(hax->fd)) {
-        return NULL;
-    }
-
-    if (hax->vm) {
-        return hax->vm;
-    }
-
-    if (max_cpus > HAX_MAX_VCPU) {
-        fprintf(stderr, "Maximum VCPU number QEMU supported is %d\n", HAX_MAX_VCPU);
-        return NULL;
-    }
-
-    vm = g_new0(struct hax_vm, 1);
-
-    ret = hax_host_create_vm(hax, &vm_id);
-    if (ret) {
-        fprintf(stderr, "Failed to create vm %x\n", ret);
-        goto error;
-    }
-    vm->id = vm_id;
-    vm->fd = hax_host_open_vm(hax, vm_id);
-    if (hax_invalid_fd(vm->fd)) {
-        fprintf(stderr, "Failed to open vm %d\n", vm_id);
-        goto error;
-    }
-
-    vm->numvcpus = max_cpus;
-    vm->vcpus = g_new0(AccelCPUState *, vm->numvcpus);
-    for (i = 0; i < vm->numvcpus; i++) {
-        vm->vcpus[i] = NULL;
-    }
-
-    hax->vm = vm;
-    return vm;
-
-  error:
-    g_free(vm);
-    hax->vm = NULL;
-    return NULL;
-}
-
-int hax_vm_destroy(struct hax_vm *vm)
-{
-    int i;
-
-    for (i = 0; i < vm->numvcpus; i++)
-        if (vm->vcpus[i]) {
-            fprintf(stderr, "VCPU should be cleaned before vm clean\n");
-            return -1;
-        }
-    hax_close_fd(vm->fd);
-    vm->numvcpus = 0;
-    g_free(vm->vcpus);
-    g_free(vm);
-    hax_global.vm = NULL;
-    return 0;
-}
-
-static int hax_init(ram_addr_t ram_size, int max_cpus)
-{
-    struct hax_state *hax = NULL;
-    struct hax_qemu_version qversion;
-    int ret;
-
-    hax = &hax_global;
-
-    memset(hax, 0, sizeof(struct hax_state));
-    hax->mem_quota = ram_size;
-
-    hax->fd = hax_mod_open();
-    if (hax_invalid_fd(hax->fd)) {
-        hax->fd = 0;
-        ret = -ENODEV;
-        goto error;
-    }
-
-    ret = hax_get_capability(hax);
-
-    if (ret) {
-        if (ret != -ENOSPC) {
-            ret = -EINVAL;
-        }
-        goto error;
-    }
-
-    if (!hax_version_support(hax)) {
-        ret = -EINVAL;
-        goto error;
-    }
-
-    hax->vm = hax_vm_create(hax, max_cpus);
-    if (!hax->vm) {
-        fprintf(stderr, "Failed to create HAX VM\n");
-        ret = -EINVAL;
-        goto error;
-    }
-
-    hax_memory_init();
-
-    qversion.cur_version = hax_cur_version;
-    qversion.min_version = hax_min_version;
-    hax_notify_qemu_version(hax->vm->fd, &qversion);
-
-    return ret;
-  error:
-    if (hax->vm) {
-        hax_vm_destroy(hax->vm);
-    }
-    if (hax->fd) {
-        hax_mod_close(hax);
-    }
-
-    return ret;
-}
-
-static int hax_accel_init(MachineState *ms)
-{
-    int ret = hax_init(ms->ram_size, (int)ms->smp.max_cpus);
-
-    if (ret && (ret != -ENOSPC)) {
-        fprintf(stderr, "No accelerator found.\n");
-    } else {
-        fprintf(stdout, "HAX is %s and emulator runs in %s mode.\n",
-                !ret ? "working" : "not working",
-                !ret ? "fast virt" : "emulation");
-        fprintf(stdout,
-                "NOTE: HAX is deprecated and will be removed in a future release.\n"
-                "      Use 'whpx' (on Windows) or 'hvf' (on macOS) instead.\n");
-    }
-    return ret;
-}
-
-static int hax_handle_fastmmio(CPUArchState *env, struct hax_fastmmio *hft)
-{
-    if (hft->direction < 2) {
-        cpu_physical_memory_rw(hft->gpa, &hft->value, hft->size,
-                               hft->direction);
-    } else {
-        /*
-         * HAX API v4 supports transferring data between two MMIO addresses,
-         * hft->gpa and hft->gpa2 (instructions such as MOVS require this):
-         *  hft->direction == 2: gpa ==> gpa2
-         */
-        uint64_t value;
-        cpu_physical_memory_read(hft->gpa, &value, hft->size);
-        cpu_physical_memory_write(hft->gpa2, &value, hft->size);
-    }
-
-    return 0;
-}
-
-static int hax_handle_io(CPUArchState *env, uint32_t df, uint16_t port,
-                         int direction, int size, int count, void *buffer)
-{
-    uint8_t *ptr;
-    int i;
-    MemTxAttrs attrs = { 0 };
-
-    if (!df) {
-        ptr = buffer;
-    } else {
-        ptr = buffer + size * count - size;
-    }
-    for (i = 0; i < count; i++) {
-        address_space_rw(&address_space_io, port, attrs,
-                         ptr, size, direction == HAX_EXIT_IO_OUT);
-        if (!df) {
-            ptr += size;
-        } else {
-            ptr -= size;
-        }
-    }
-
-    return 0;
-}
-
-static int hax_vcpu_interrupt(CPUArchState *env)
-{
-    CPUState *cpu = env_cpu(env);
-    AccelCPUState *vcpu = cpu->accel;
-    struct hax_tunnel *ht = vcpu->tunnel;
-
-    /*
-     * Try to inject an interrupt if the guest can accept it
-     * Unlike KVM, HAX kernel check for the eflags, instead of qemu
-     */
-    if (ht->ready_for_interrupt_injection &&
-        (cpu->interrupt_request & CPU_INTERRUPT_HARD)) {
-        int irq;
-
-        irq = cpu_get_pic_interrupt(env);
-        if (irq >= 0) {
-            hax_inject_interrupt(env, irq);
-            cpu->interrupt_request &= ~CPU_INTERRUPT_HARD;
-        }
-    }
-
-    /* If we have an interrupt but the guest is not ready to receive an
-     * interrupt, request an interrupt window exit.  This will
-     * cause a return to userspace as soon as the guest is ready to
-     * receive interrupts. */
-    if ((cpu->interrupt_request & CPU_INTERRUPT_HARD)) {
-        ht->request_interrupt_window = 1;
-    } else {
-        ht->request_interrupt_window = 0;
-    }
-    return 0;
-}
-
-void hax_raise_event(CPUState *cpu)
-{
-    AccelCPUState *vcpu = cpu->accel;
-
-    if (!vcpu) {
-        return;
-    }
-    vcpu->tunnel->user_event_pending = 1;
-}
-
-/*
- * Ask hax kernel module to run the CPU for us till:
- * 1. Guest crash or shutdown
- * 2. Need QEMU's emulation like guest execute MMIO instruction
- * 3. Guest execute HLT
- * 4. QEMU have Signal/event pending
- * 5. An unknown VMX exit happens
- */
-static int hax_vcpu_hax_exec(CPUArchState *env)
-{
-    int ret = 0;
-    CPUState *cpu = env_cpu(env);
-    X86CPU *x86_cpu = X86_CPU(cpu);
-    AccelCPUState *vcpu = cpu->accel;
-    struct hax_tunnel *ht = vcpu->tunnel;
-
-    if (!hax_enabled()) {
-        DPRINTF("Trying to vcpu execute at eip:" TARGET_FMT_lx "\n", env->eip);
-        return 0;
-    }
-
-    if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
-        cpu->interrupt_request &= ~CPU_INTERRUPT_POLL;
-        apic_poll_irq(x86_cpu->apic_state);
-    }
-
-    /* After a vcpu is halted (either because it is an AP and has just been
-     * reset, or because it has executed the HLT instruction), it will not be
-     * run (hax_vcpu_run()) until it is unhalted. The next few if blocks check
-     * for events that may change the halted state of this vcpu:
-     *  a) Maskable interrupt, when RFLAGS.IF is 1;
-     *     Note: env->eflags may not reflect the current RFLAGS state, because
-     *           it is not updated after each hax_vcpu_run(). We cannot afford
-     *           to fail to recognize any unhalt-by-maskable-interrupt event
-     *           (in which case the vcpu will halt forever), and yet we cannot
-     *           afford the overhead of hax_vcpu_sync_state(). The current
-     *           solution is to err on the side of caution and have the HLT
-     *           handler (see case HAX_EXIT_HLT below) unconditionally set the
-     *           IF_MASK bit in env->eflags, which, in effect, disables the
-     *           RFLAGS.IF check.
-     *  b) NMI;
-     *  c) INIT signal;
-     *  d) SIPI signal.
-     */
-    if (((cpu->interrupt_request & CPU_INTERRUPT_HARD) &&
-         (env->eflags & IF_MASK)) ||
-        (cpu->interrupt_request & CPU_INTERRUPT_NMI)) {
-        cpu->halted = 0;
-    }
-
-    if (cpu->interrupt_request & CPU_INTERRUPT_INIT) {
-        DPRINTF("\nhax_vcpu_hax_exec: handling INIT for %d\n",
-                cpu->cpu_index);
-        do_cpu_init(x86_cpu);
-        hax_vcpu_sync_state(env, 1);
-    }
-
-    if (cpu->interrupt_request & CPU_INTERRUPT_SIPI) {
-        DPRINTF("hax_vcpu_hax_exec: handling SIPI for %d\n",
-                cpu->cpu_index);
-        hax_vcpu_sync_state(env, 0);
-        do_cpu_sipi(x86_cpu);
-        hax_vcpu_sync_state(env, 1);
-    }
-
-    if (cpu->halted) {
-        /* If this vcpu is halted, we must not ask HAXM to run it. Instead, we
-         * break out of hax_smp_cpu_exec() as if this vcpu had executed HLT.
-         * That way, this vcpu thread will be trapped in qemu_wait_io_event(),
-         * until the vcpu is unhalted.
-         */
-        cpu->exception_index = EXCP_HLT;
-        return 0;
-    }
-
-    do {
-        int hax_ret;
-
-        if (cpu->exit_request) {
-            ret = 1;
-            break;
-        }
-
-        hax_vcpu_interrupt(env);
-
-        qemu_mutex_unlock_iothread();
-        cpu_exec_start(cpu);
-        hax_ret = hax_vcpu_run(vcpu);
-        cpu_exec_end(cpu);
-        qemu_mutex_lock_iothread();
-
-        /* Simply continue the vcpu_run if system call interrupted */
-        if (hax_ret == -EINTR || hax_ret == -EAGAIN) {
-            DPRINTF("io window interrupted\n");
-            continue;
-        }
-
-        if (hax_ret < 0) {
-            fprintf(stderr, "vcpu run failed for vcpu  %x\n", vcpu->vcpu_id);
-            abort();
-        }
-        switch (ht->_exit_status) {
-        case HAX_EXIT_IO:
-            ret = hax_handle_io(env, ht->pio._df, ht->pio._port,
-                            ht->pio._direction,
-                            ht->pio._size, ht->pio._count, vcpu->iobuf);
-            break;
-        case HAX_EXIT_FAST_MMIO:
-            ret = hax_handle_fastmmio(env, (struct hax_fastmmio *) vcpu->iobuf);
-            break;
-        /* Guest state changed, currently only for shutdown */
-        case HAX_EXIT_STATECHANGE:
-            fprintf(stdout, "VCPU shutdown request\n");
-            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
-            hax_vcpu_sync_state(env, 0);
-            ret = 1;
-            break;
-        case HAX_EXIT_UNKNOWN_VMEXIT:
-            fprintf(stderr, "Unknown VMX exit %x from guest\n",
-                    ht->_exit_reason);
-            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
-            hax_vcpu_sync_state(env, 0);
-            cpu_dump_state(cpu, stderr, 0);
-            ret = -1;
-            break;
-        case HAX_EXIT_HLT:
-            if (!(cpu->interrupt_request & CPU_INTERRUPT_HARD) &&
-                !(cpu->interrupt_request & CPU_INTERRUPT_NMI)) {
-                /* hlt instruction with interrupt disabled is shutdown */
-                env->eflags |= IF_MASK;
-                cpu->halted = 1;
-                cpu->exception_index = EXCP_HLT;
-                ret = 1;
-            }
-            break;
-        /* these situations will continue to hax module */
-        case HAX_EXIT_INTERRUPT:
-        case HAX_EXIT_PAUSED:
-            break;
-        case HAX_EXIT_MMIO:
-            /* Should not happen on UG system */
-            fprintf(stderr, "HAX: unsupported MMIO emulation\n");
-            ret = -1;
-            break;
-        case HAX_EXIT_REAL:
-            /* Should not happen on UG system */
-            fprintf(stderr, "HAX: unimplemented real mode emulation\n");
-            ret = -1;
-            break;
-        default:
-            fprintf(stderr, "Unknown exit %x from HAX\n", ht->_exit_status);
-            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
-            hax_vcpu_sync_state(env, 0);
-            cpu_dump_state(cpu, stderr, 0);
-            ret = 1;
-            break;
-        }
-    } while (!ret);
-
-    if (cpu->exit_request) {
-        cpu->exit_request = 0;
-        cpu->exception_index = EXCP_INTERRUPT;
-    }
-    return ret < 0;
-}
-
-static void do_hax_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
-{
-    CPUArchState *env = cpu->env_ptr;
-
-    hax_arch_get_registers(env);
-    cpu->vcpu_dirty = true;
-}
-
-void hax_cpu_synchronize_state(CPUState *cpu)
-{
-    if (!cpu->vcpu_dirty) {
-        run_on_cpu(cpu, do_hax_cpu_synchronize_state, RUN_ON_CPU_NULL);
-    }
-}
-
-static void do_hax_cpu_synchronize_post_reset(CPUState *cpu,
-                                              run_on_cpu_data arg)
-{
-    CPUArchState *env = cpu->env_ptr;
-
-    hax_vcpu_sync_state(env, 1);
-    cpu->vcpu_dirty = false;
-}
-
-void hax_cpu_synchronize_post_reset(CPUState *cpu)
-{
-    run_on_cpu(cpu, do_hax_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
-}
-
-static void do_hax_cpu_synchronize_post_init(CPUState *cpu, run_on_cpu_data arg)
-{
-    CPUArchState *env = cpu->env_ptr;
-
-    hax_vcpu_sync_state(env, 1);
-    cpu->vcpu_dirty = false;
-}
-
-void hax_cpu_synchronize_post_init(CPUState *cpu)
-{
-    run_on_cpu(cpu, do_hax_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
-}
-
-static void do_hax_cpu_synchronize_pre_loadvm(CPUState *cpu, run_on_cpu_data arg)
-{
-    cpu->vcpu_dirty = true;
-}
-
-void hax_cpu_synchronize_pre_loadvm(CPUState *cpu)
-{
-    run_on_cpu(cpu, do_hax_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
-}
-
-int hax_smp_cpu_exec(CPUState *cpu)
-{
-    CPUArchState *env = cpu->env_ptr;
-    int fatal;
-    int ret;
-
-    while (1) {
-        if (cpu->exception_index >= EXCP_INTERRUPT) {
-            ret = cpu->exception_index;
-            cpu->exception_index = -1;
-            break;
-        }
-
-        fatal = hax_vcpu_hax_exec(env);
-
-        if (fatal) {
-            fprintf(stderr, "Unsupported HAX vcpu return\n");
-            abort();
-        }
-    }
-
-    return ret;
-}
-
-static void set_v8086_seg(struct segment_desc_t *lhs, const SegmentCache *rhs)
-{
-    memset(lhs, 0, sizeof(struct segment_desc_t));
-    lhs->selector = rhs->selector;
-    lhs->base = rhs->base;
-    lhs->limit = rhs->limit;
-    lhs->type = 3;
-    lhs->present = 1;
-    lhs->dpl = 3;
-    lhs->operand_size = 0;
-    lhs->desc = 1;
-    lhs->long_mode = 0;
-    lhs->granularity = 0;
-    lhs->available = 0;
-}
-
-static void get_seg(SegmentCache *lhs, const struct segment_desc_t *rhs)
-{
-    lhs->selector = rhs->selector;
-    lhs->base = rhs->base;
-    lhs->limit = rhs->limit;
-    lhs->flags = (rhs->type << DESC_TYPE_SHIFT)
-        | (rhs->present * DESC_P_MASK)
-        | (rhs->dpl << DESC_DPL_SHIFT)
-        | (rhs->operand_size << DESC_B_SHIFT)
-        | (rhs->desc * DESC_S_MASK)
-        | (rhs->long_mode << DESC_L_SHIFT)
-        | (rhs->granularity * DESC_G_MASK) | (rhs->available * DESC_AVL_MASK);
-}
-
-static void set_seg(struct segment_desc_t *lhs, const SegmentCache *rhs)
-{
-    unsigned flags = rhs->flags;
-
-    memset(lhs, 0, sizeof(struct segment_desc_t));
-    lhs->selector = rhs->selector;
-    lhs->base = rhs->base;
-    lhs->limit = rhs->limit;
-    lhs->type = (flags >> DESC_TYPE_SHIFT) & 15;
-    lhs->present = (flags & DESC_P_MASK) != 0;
-    lhs->dpl = rhs->selector & 3;
-    lhs->operand_size = (flags >> DESC_B_SHIFT) & 1;
-    lhs->desc = (flags & DESC_S_MASK) != 0;
-    lhs->long_mode = (flags >> DESC_L_SHIFT) & 1;
-    lhs->granularity = (flags & DESC_G_MASK) != 0;
-    lhs->available = (flags & DESC_AVL_MASK) != 0;
-}
-
-static void hax_getput_reg(uint64_t *hax_reg, target_ulong *qemu_reg, int set)
-{
-    target_ulong reg = *hax_reg;
-
-    if (set) {
-        *hax_reg = *qemu_reg;
-    } else {
-        *qemu_reg = reg;
-    }
-}
-
-/* The sregs has been synced with HAX kernel already before this call */
-static int hax_get_segments(CPUArchState *env, struct vcpu_state_t *sregs)
-{
-    get_seg(&env->segs[R_CS], &sregs->_cs);
-    get_seg(&env->segs[R_DS], &sregs->_ds);
-    get_seg(&env->segs[R_ES], &sregs->_es);
-    get_seg(&env->segs[R_FS], &sregs->_fs);
-    get_seg(&env->segs[R_GS], &sregs->_gs);
-    get_seg(&env->segs[R_SS], &sregs->_ss);
-
-    get_seg(&env->tr, &sregs->_tr);
-    get_seg(&env->ldt, &sregs->_ldt);
-    env->idt.limit = sregs->_idt.limit;
-    env->idt.base = sregs->_idt.base;
-    env->gdt.limit = sregs->_gdt.limit;
-    env->gdt.base = sregs->_gdt.base;
-    return 0;
-}
-
-static int hax_set_segments(CPUArchState *env, struct vcpu_state_t *sregs)
-{
-    if ((env->eflags & VM_MASK)) {
-        set_v8086_seg(&sregs->_cs, &env->segs[R_CS]);
-        set_v8086_seg(&sregs->_ds, &env->segs[R_DS]);
-        set_v8086_seg(&sregs->_es, &env->segs[R_ES]);
-        set_v8086_seg(&sregs->_fs, &env->segs[R_FS]);
-        set_v8086_seg(&sregs->_gs, &env->segs[R_GS]);
-        set_v8086_seg(&sregs->_ss, &env->segs[R_SS]);
-    } else {
-        set_seg(&sregs->_cs, &env->segs[R_CS]);
-        set_seg(&sregs->_ds, &env->segs[R_DS]);
-        set_seg(&sregs->_es, &env->segs[R_ES]);
-        set_seg(&sregs->_fs, &env->segs[R_FS]);
-        set_seg(&sregs->_gs, &env->segs[R_GS]);
-        set_seg(&sregs->_ss, &env->segs[R_SS]);
-
-        if (env->cr[0] & CR0_PE_MASK) {
-            /* force ss cpl to cs cpl */
-            sregs->_ss.selector = (sregs->_ss.selector & ~3) |
-                                  (sregs->_cs.selector & 3);
-            sregs->_ss.dpl = sregs->_ss.selector & 3;
-        }
-    }
-
-    set_seg(&sregs->_tr, &env->tr);
-    set_seg(&sregs->_ldt, &env->ldt);
-    sregs->_idt.limit = env->idt.limit;
-    sregs->_idt.base = env->idt.base;
-    sregs->_gdt.limit = env->gdt.limit;
-    sregs->_gdt.base = env->gdt.base;
-    return 0;
-}
-
-static int hax_sync_vcpu_register(CPUArchState *env, int set)
-{
-    struct vcpu_state_t regs;
-    int ret;
-    memset(&regs, 0, sizeof(struct vcpu_state_t));
-
-    if (!set) {
-        ret = hax_sync_vcpu_state(env, &regs, 0);
-        if (ret < 0) {
-            return -1;
-        }
-    }
-
-    /* generic register */
-    hax_getput_reg(&regs._rax, &env->regs[R_EAX], set);
-    hax_getput_reg(&regs._rbx, &env->regs[R_EBX], set);
-    hax_getput_reg(&regs._rcx, &env->regs[R_ECX], set);
-    hax_getput_reg(&regs._rdx, &env->regs[R_EDX], set);
-    hax_getput_reg(&regs._rsi, &env->regs[R_ESI], set);
-    hax_getput_reg(&regs._rdi, &env->regs[R_EDI], set);
-    hax_getput_reg(&regs._rsp, &env->regs[R_ESP], set);
-    hax_getput_reg(&regs._rbp, &env->regs[R_EBP], set);
-#ifdef TARGET_X86_64
-    hax_getput_reg(&regs._r8, &env->regs[8], set);
-    hax_getput_reg(&regs._r9, &env->regs[9], set);
-    hax_getput_reg(&regs._r10, &env->regs[10], set);
-    hax_getput_reg(&regs._r11, &env->regs[11], set);
-    hax_getput_reg(&regs._r12, &env->regs[12], set);
-    hax_getput_reg(&regs._r13, &env->regs[13], set);
-    hax_getput_reg(&regs._r14, &env->regs[14], set);
-    hax_getput_reg(&regs._r15, &env->regs[15], set);
-#endif
-    hax_getput_reg(&regs._rflags, &env->eflags, set);
-    hax_getput_reg(&regs._rip, &env->eip, set);
-
-    if (set) {
-        regs._cr0 = env->cr[0];
-        regs._cr2 = env->cr[2];
-        regs._cr3 = env->cr[3];
-        regs._cr4 = env->cr[4];
-        hax_set_segments(env, &regs);
-    } else {
-        env->cr[0] = regs._cr0;
-        env->cr[2] = regs._cr2;
-        env->cr[3] = regs._cr3;
-        env->cr[4] = regs._cr4;
-        hax_get_segments(env, &regs);
-    }
-
-    if (set) {
-        ret = hax_sync_vcpu_state(env, &regs, 1);
-        if (ret < 0) {
-            return -1;
-        }
-    }
-    return 0;
-}
-
-static void hax_msr_entry_set(struct vmx_msr *item, uint32_t index,
-                              uint64_t value)
-{
-    item->entry = index;
-    item->value = value;
-}
-
-static int hax_get_msrs(CPUArchState *env)
-{
-    struct hax_msr_data md;
-    struct vmx_msr *msrs = md.entries;
-    int ret, i, n;
-
-    n = 0;
-    msrs[n++].entry = MSR_IA32_SYSENTER_CS;
-    msrs[n++].entry = MSR_IA32_SYSENTER_ESP;
-    msrs[n++].entry = MSR_IA32_SYSENTER_EIP;
-    msrs[n++].entry = MSR_IA32_TSC;
-#ifdef TARGET_X86_64
-    msrs[n++].entry = MSR_EFER;
-    msrs[n++].entry = MSR_STAR;
-    msrs[n++].entry = MSR_LSTAR;
-    msrs[n++].entry = MSR_CSTAR;
-    msrs[n++].entry = MSR_FMASK;
-    msrs[n++].entry = MSR_KERNELGSBASE;
-#endif
-    md.nr_msr = n;
-    ret = hax_sync_msr(env, &md, 0);
-    if (ret < 0) {
-        return ret;
-    }
-
-    for (i = 0; i < md.done; i++) {
-        switch (msrs[i].entry) {
-        case MSR_IA32_SYSENTER_CS:
-            env->sysenter_cs = msrs[i].value;
-            break;
-        case MSR_IA32_SYSENTER_ESP:
-            env->sysenter_esp = msrs[i].value;
-            break;
-        case MSR_IA32_SYSENTER_EIP:
-            env->sysenter_eip = msrs[i].value;
-            break;
-        case MSR_IA32_TSC:
-            env->tsc = msrs[i].value;
-            break;
-#ifdef TARGET_X86_64
-        case MSR_EFER:
-            env->efer = msrs[i].value;
-            break;
-        case MSR_STAR:
-            env->star = msrs[i].value;
-            break;
-        case MSR_LSTAR:
-            env->lstar = msrs[i].value;
-            break;
-        case MSR_CSTAR:
-            env->cstar = msrs[i].value;
-            break;
-        case MSR_FMASK:
-            env->fmask = msrs[i].value;
-            break;
-        case MSR_KERNELGSBASE:
-            env->kernelgsbase = msrs[i].value;
-            break;
-#endif
-        }
-    }
-
-    return 0;
-}
-
-static int hax_set_msrs(CPUArchState *env)
-{
-    struct hax_msr_data md;
-    struct vmx_msr *msrs;
-    msrs = md.entries;
-    int n = 0;
-
-    memset(&md, 0, sizeof(struct hax_msr_data));
-    hax_msr_entry_set(&msrs[n++], MSR_IA32_SYSENTER_CS, env->sysenter_cs);
-    hax_msr_entry_set(&msrs[n++], MSR_IA32_SYSENTER_ESP, env->sysenter_esp);
-    hax_msr_entry_set(&msrs[n++], MSR_IA32_SYSENTER_EIP, env->sysenter_eip);
-    hax_msr_entry_set(&msrs[n++], MSR_IA32_TSC, env->tsc);
-#ifdef TARGET_X86_64
-    hax_msr_entry_set(&msrs[n++], MSR_EFER, env->efer);
-    hax_msr_entry_set(&msrs[n++], MSR_STAR, env->star);
-    hax_msr_entry_set(&msrs[n++], MSR_LSTAR, env->lstar);
-    hax_msr_entry_set(&msrs[n++], MSR_CSTAR, env->cstar);
-    hax_msr_entry_set(&msrs[n++], MSR_FMASK, env->fmask);
-    hax_msr_entry_set(&msrs[n++], MSR_KERNELGSBASE, env->kernelgsbase);
-#endif
-    md.nr_msr = n;
-    md.done = 0;
-
-    return hax_sync_msr(env, &md, 1);
-}
-
-static int hax_get_fpu(CPUArchState *env)
-{
-    struct fx_layout fpu;
-    int i, ret;
-
-    ret = hax_sync_fpu(env, &fpu, 0);
-    if (ret < 0) {
-        return ret;
-    }
-
-    env->fpstt = (fpu.fsw >> 11) & 7;
-    env->fpus = fpu.fsw;
-    env->fpuc = fpu.fcw;
-    for (i = 0; i < 8; ++i) {
-        env->fptags[i] = !((fpu.ftw >> i) & 1);
-    }
-    memcpy(env->fpregs, fpu.st_mm, sizeof(env->fpregs));
-
-    for (i = 0; i < 8; i++) {
-        env->xmm_regs[i].ZMM_Q(0) = ldq_p(&fpu.mmx_1[i][0]);
-        env->xmm_regs[i].ZMM_Q(1) = ldq_p(&fpu.mmx_1[i][8]);
-        if (CPU_NB_REGS > 8) {
-            env->xmm_regs[i + 8].ZMM_Q(0) = ldq_p(&fpu.mmx_2[i][0]);
-            env->xmm_regs[i + 8].ZMM_Q(1) = ldq_p(&fpu.mmx_2[i][8]);
-        }
-    }
-    env->mxcsr = fpu.mxcsr;
-
-    return 0;
-}
-
-static int hax_set_fpu(CPUArchState *env)
-{
-    struct fx_layout fpu;
-    int i;
-
-    memset(&fpu, 0, sizeof(fpu));
-    fpu.fsw = env->fpus & ~(7 << 11);
-    fpu.fsw |= (env->fpstt & 7) << 11;
-    fpu.fcw = env->fpuc;
-
-    for (i = 0; i < 8; ++i) {
-        fpu.ftw |= (!env->fptags[i]) << i;
-    }
-
-    memcpy(fpu.st_mm, env->fpregs, sizeof(env->fpregs));
-    for (i = 0; i < 8; i++) {
-        stq_p(&fpu.mmx_1[i][0], env->xmm_regs[i].ZMM_Q(0));
-        stq_p(&fpu.mmx_1[i][8], env->xmm_regs[i].ZMM_Q(1));
-        if (CPU_NB_REGS > 8) {
-            stq_p(&fpu.mmx_2[i][0], env->xmm_regs[i + 8].ZMM_Q(0));
-            stq_p(&fpu.mmx_2[i][8], env->xmm_regs[i + 8].ZMM_Q(1));
-        }
-    }
-
-    fpu.mxcsr = env->mxcsr;
-
-    return hax_sync_fpu(env, &fpu, 1);
-}
-
-static int hax_arch_get_registers(CPUArchState *env)
-{
-    int ret;
-
-    ret = hax_sync_vcpu_register(env, 0);
-    if (ret < 0) {
-        return ret;
-    }
-
-    ret = hax_get_fpu(env);
-    if (ret < 0) {
-        return ret;
-    }
-
-    ret = hax_get_msrs(env);
-    if (ret < 0) {
-        return ret;
-    }
-
-    x86_update_hflags(env);
-    return 0;
-}
-
-static int hax_arch_set_registers(CPUArchState *env)
-{
-    int ret;
-    ret = hax_sync_vcpu_register(env, 1);
-
-    if (ret < 0) {
-        fprintf(stderr, "Failed to sync vcpu reg\n");
-        return ret;
-    }
-    ret = hax_set_fpu(env);
-    if (ret < 0) {
-        fprintf(stderr, "FPU failed\n");
-        return ret;
-    }
-    ret = hax_set_msrs(env);
-    if (ret < 0) {
-        fprintf(stderr, "MSR failed\n");
-        return ret;
-    }
-
-    return 0;
-}
-
-static void hax_vcpu_sync_state(CPUArchState *env, int modified)
-{
-    if (hax_enabled()) {
-        if (modified) {
-            hax_arch_set_registers(env);
-        } else {
-            hax_arch_get_registers(env);
-        }
-    }
-}
-
-/*
- * much simpler than kvm, at least in first stage because:
- * We don't need consider the device pass-through, we don't need
- * consider the framebuffer, and we may even remove the bios at all
- */
-int hax_sync_vcpus(void)
-{
-    if (hax_enabled()) {
-        CPUState *cpu;
-
-        cpu = first_cpu;
-        if (!cpu) {
-            return 0;
-        }
-
-        for (; cpu != NULL; cpu = CPU_NEXT(cpu)) {
-            int ret;
-
-            ret = hax_arch_set_registers(cpu->env_ptr);
-            if (ret < 0) {
-                return ret;
-            }
-        }
-    }
-
-    return 0;
-}
-
-void hax_reset_vcpu_state(void *opaque)
-{
-    CPUState *cpu;
-    for (cpu = first_cpu; cpu != NULL; cpu = CPU_NEXT(cpu)) {
-        cpu->accel->tunnel->user_event_pending = 0;
-        cpu->accel->tunnel->ready_for_interrupt_injection = 0;
-    }
-}
-
-static void hax_accel_class_init(ObjectClass *oc, void *data)
-{
-    AccelClass *ac = ACCEL_CLASS(oc);
-    ac->name = "HAX";
-    ac->init_machine = hax_accel_init;
-    ac->allowed = &hax_allowed;
-}
-
-static const TypeInfo hax_accel_type = {
-    .name = ACCEL_CLASS_NAME("hax"),
-    .parent = TYPE_ACCEL,
-    .class_init = hax_accel_class_init,
-};
-
-static void hax_type_init(void)
-{
-    type_register_static(&hax_accel_type);
-}
-
-type_init(hax_type_init);
diff --git a/target/i386/hax/hax-mem.c b/target/i386/hax/hax-mem.c
deleted file mode 100644
index bb5ffbc9ac..0000000000
--- a/target/i386/hax/hax-mem.c
+++ /dev/null
@@ -1,323 +0,0 @@
-/*
- * HAX memory mapping operations
- *
- * Copyright (c) 2015-16 Intel Corporation
- * Copyright 2016 Google, Inc.
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See
- * the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/address-spaces.h"
-#include "qemu/error-report.h"
-
-#include "hax-accel-ops.h"
-#include "qemu/queue.h"
-
-#define DEBUG_HAX_MEM 0
-
-#define DPRINTF(fmt, ...) \
-    do { \
-        if (DEBUG_HAX_MEM) { \
-            fprintf(stdout, fmt, ## __VA_ARGS__); \
-        } \
-    } while (0)
-
-/**
- * HAXMapping: describes a pending guest physical memory mapping
- *
- * @start_pa: a guest physical address marking the start of the region; must be
- *            page-aligned
- * @size: a guest physical address marking the end of the region; must be
- *          page-aligned
- * @host_va: the host virtual address of the start of the mapping
- * @flags: mapping parameters e.g. HAX_RAM_INFO_ROM or HAX_RAM_INFO_INVALID
- * @entry: additional fields for linking #HAXMapping instances together
- */
-typedef struct HAXMapping {
-    uint64_t start_pa;
-    uint32_t size;
-    uint64_t host_va;
-    int flags;
-    QTAILQ_ENTRY(HAXMapping) entry;
-} HAXMapping;
-
-/*
- * A doubly-linked list (actually a tail queue) of the pending page mappings
- * for the ongoing memory transaction.
- *
- * It is used to optimize the number of page mapping updates done through the
- * kernel module. For example, it's effective when a driver is digging an MMIO
- * hole inside an existing memory mapping. It will get a deletion of the whole
- * region, then the addition of the 2 remaining RAM areas around the hole and
- * finally the memory transaction commit. During the commit, it will effectively
- * send to the kernel only the removal of the pages from the MMIO hole after
- * having computed locally the result of the deletion and additions.
- */
-static QTAILQ_HEAD(, HAXMapping) mappings =
-    QTAILQ_HEAD_INITIALIZER(mappings);
-
-/**
- * hax_mapping_dump_list: dumps @mappings to stdout (for debugging)
- */
-static void hax_mapping_dump_list(void)
-{
-    HAXMapping *entry;
-
-    DPRINTF("%s updates:\n", __func__);
-    QTAILQ_FOREACH(entry, &mappings, entry) {
-        DPRINTF("\t%c 0x%016" PRIx64 "->0x%016" PRIx64 " VA 0x%016" PRIx64
-                "%s\n", entry->flags & HAX_RAM_INFO_INVALID ? '-' : '+',
-                entry->start_pa, entry->start_pa + entry->size, entry->host_va,
-                entry->flags & HAX_RAM_INFO_ROM ? " ROM" : "");
-    }
-}
-
-static void hax_insert_mapping_before(HAXMapping *next, uint64_t start_pa,
-                                      uint32_t size, uint64_t host_va,
-                                      uint8_t flags)
-{
-    HAXMapping *entry;
-
-    entry = g_malloc0(sizeof(*entry));
-    entry->start_pa = start_pa;
-    entry->size = size;
-    entry->host_va = host_va;
-    entry->flags = flags;
-    if (!next) {
-        QTAILQ_INSERT_TAIL(&mappings, entry, entry);
-    } else {
-        QTAILQ_INSERT_BEFORE(next, entry, entry);
-    }
-}
-
-static bool hax_mapping_is_opposite(HAXMapping *entry, uint64_t host_va,
-                                    uint8_t flags)
-{
-    /* removed then added without change for the read-only flag */
-    bool nop_flags = (entry->flags ^ flags) == HAX_RAM_INFO_INVALID;
-
-    return (entry->host_va == host_va) && nop_flags;
-}
-
-static void hax_update_mapping(uint64_t start_pa, uint32_t size,
-                               uint64_t host_va, uint8_t flags)
-{
-    uint64_t end_pa = start_pa + size;
-    HAXMapping *entry, *next;
-
-    QTAILQ_FOREACH_SAFE(entry, &mappings, entry, next) {
-        uint32_t chunk_sz;
-        if (start_pa >= entry->start_pa + entry->size) {
-            continue;
-        }
-        if (start_pa < entry->start_pa) {
-            chunk_sz = end_pa <= entry->start_pa ? size
-                                                 : entry->start_pa - start_pa;
-            hax_insert_mapping_before(entry, start_pa, chunk_sz,
-                                      host_va, flags);
-            start_pa += chunk_sz;
-            host_va += chunk_sz;
-            size -= chunk_sz;
-        } else if (start_pa > entry->start_pa) {
-            /* split the existing chunk at start_pa */
-            chunk_sz = start_pa - entry->start_pa;
-            hax_insert_mapping_before(entry, entry->start_pa, chunk_sz,
-                                      entry->host_va, entry->flags);
-            entry->start_pa += chunk_sz;
-            entry->host_va += chunk_sz;
-            entry->size -= chunk_sz;
-        }
-        /* now start_pa == entry->start_pa */
-        chunk_sz = MIN(size, entry->size);
-        if (chunk_sz) {
-            bool nop = hax_mapping_is_opposite(entry, host_va, flags);
-            bool partial = chunk_sz < entry->size;
-            if (partial) {
-                /* remove the beginning of the existing chunk */
-                entry->start_pa += chunk_sz;
-                entry->host_va += chunk_sz;
-                entry->size -= chunk_sz;
-                if (!nop) {
-                    hax_insert_mapping_before(entry, start_pa, chunk_sz,
-                                              host_va, flags);
-                }
-            } else { /* affects the full mapping entry */
-                if (nop) { /* no change to this mapping, remove it */
-                    QTAILQ_REMOVE(&mappings, entry, entry);
-                    g_free(entry);
-                } else { /* update mapping properties */
-                    entry->host_va = host_va;
-                    entry->flags = flags;
-                }
-            }
-            start_pa += chunk_sz;
-            host_va += chunk_sz;
-            size -= chunk_sz;
-        }
-        if (!size) { /* we are done */
-            break;
-        }
-    }
-    if (size) { /* add the leftover */
-        hax_insert_mapping_before(NULL, start_pa, size, host_va, flags);
-    }
-}
-
-static void hax_process_section(MemoryRegionSection *section, uint8_t flags)
-{
-    MemoryRegion *mr = section->mr;
-    hwaddr start_pa = section->offset_within_address_space;
-    ram_addr_t size = int128_get64(section->size);
-    unsigned int delta;
-    uint64_t host_va;
-    uint32_t max_mapping_size;
-
-    /* We only care about RAM and ROM regions */
-    if (!memory_region_is_ram(mr)) {
-        if (memory_region_is_romd(mr)) {
-            /* HAXM kernel module does not support ROMD yet  */
-            warn_report("Ignoring ROMD region 0x%016" PRIx64 "->0x%016" PRIx64,
-                        start_pa, start_pa + size);
-        }
-        return;
-    }
-
-    /* Adjust start_pa and size so that they are page-aligned. (Cf
-     * kvm_set_phys_mem() in kvm-all.c).
-     */
-    delta = qemu_real_host_page_size() - (start_pa & ~qemu_real_host_page_mask());
-    delta &= ~qemu_real_host_page_mask();
-    if (delta > size) {
-        return;
-    }
-    start_pa += delta;
-    size -= delta;
-    size &= qemu_real_host_page_mask();
-    if (!size || (start_pa & ~qemu_real_host_page_mask())) {
-        return;
-    }
-
-    host_va = (uintptr_t)memory_region_get_ram_ptr(mr)
-            + section->offset_within_region + delta;
-    if (memory_region_is_rom(section->mr)) {
-        flags |= HAX_RAM_INFO_ROM;
-    }
-
-    /*
-     * The kernel module interface uses 32-bit sizes:
-     * https://github.com/intel/haxm/blob/master/API.md#hax_vm_ioctl_set_ram
-     *
-     * If the mapping size is longer than 32 bits, we can't process it in one
-     * call into the kernel. Instead, we split the mapping into smaller ones,
-     * and call hax_update_mapping() on each.
-     */
-    max_mapping_size = UINT32_MAX & qemu_real_host_page_mask();
-    while (size > max_mapping_size) {
-        hax_update_mapping(start_pa, max_mapping_size, host_va, flags);
-        start_pa += max_mapping_size;
-        size -= max_mapping_size;
-        host_va += max_mapping_size;
-    }
-    /* Now size <= max_mapping_size */
-    hax_update_mapping(start_pa, (uint32_t)size, host_va, flags);
-}
-
-static void hax_region_add(MemoryListener *listener,
-                           MemoryRegionSection *section)
-{
-    memory_region_ref(section->mr);
-    hax_process_section(section, 0);
-}
-
-static void hax_region_del(MemoryListener *listener,
-                           MemoryRegionSection *section)
-{
-    hax_process_section(section, HAX_RAM_INFO_INVALID);
-    memory_region_unref(section->mr);
-}
-
-static void hax_transaction_begin(MemoryListener *listener)
-{
-    g_assert(QTAILQ_EMPTY(&mappings));
-}
-
-static void hax_transaction_commit(MemoryListener *listener)
-{
-    if (!QTAILQ_EMPTY(&mappings)) {
-        HAXMapping *entry, *next;
-
-        if (DEBUG_HAX_MEM) {
-            hax_mapping_dump_list();
-        }
-        QTAILQ_FOREACH_SAFE(entry, &mappings, entry, next) {
-            if (entry->flags & HAX_RAM_INFO_INVALID) {
-                /* for unmapping, put the values expected by the kernel */
-                entry->flags = HAX_RAM_INFO_INVALID;
-                entry->host_va = 0;
-            }
-            if (hax_set_ram(entry->start_pa, entry->size,
-                            entry->host_va, entry->flags)) {
-                fprintf(stderr, "%s: Failed mapping @0x%016" PRIx64 "+0x%"
-                        PRIx32 " flags %02x\n", __func__, entry->start_pa,
-                        entry->size, entry->flags);
-            }
-            QTAILQ_REMOVE(&mappings, entry, entry);
-            g_free(entry);
-        }
-    }
-}
-
-/* currently we fake the dirty bitmap sync, always dirty */
-static void hax_log_sync(MemoryListener *listener,
-                         MemoryRegionSection *section)
-{
-    MemoryRegion *mr = section->mr;
-
-    if (!memory_region_is_ram(mr)) {
-        /* Skip MMIO regions */
-        return;
-    }
-
-    memory_region_set_dirty(mr, 0, int128_get64(section->size));
-}
-
-static MemoryListener hax_memory_listener = {
-    .name = "hax",
-    .begin = hax_transaction_begin,
-    .commit = hax_transaction_commit,
-    .region_add = hax_region_add,
-    .region_del = hax_region_del,
-    .log_sync = hax_log_sync,
-    .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
-};
-
-static void hax_ram_block_added(RAMBlockNotifier *n, void *host, size_t size,
-                                size_t max_size)
-{
-    /*
-     * We must register each RAM block with the HAXM kernel module, or
-     * hax_set_ram() will fail for any mapping into the RAM block:
-     * https://github.com/intel/haxm/blob/master/API.md#hax_vm_ioctl_alloc_ram
-     *
-     * Old versions of the HAXM kernel module (< 6.2.0) used to preallocate all
-     * host physical pages for the RAM block as part of this registration
-     * process, hence the name hax_populate_ram().
-     */
-    if (hax_populate_ram((uint64_t)(uintptr_t)host, max_size) < 0) {
-        fprintf(stderr, "HAX failed to populate RAM\n");
-        abort();
-    }
-}
-
-static struct RAMBlockNotifier hax_ram_notifier = {
-    .ram_block_added = hax_ram_block_added,
-};
-
-void hax_memory_init(void)
-{
-    ram_block_notifier_add(&hax_ram_notifier);
-    memory_listener_register(&hax_memory_listener, &address_space_memory);
-}
diff --git a/target/i386/hax/hax-posix.c b/target/i386/hax/hax-posix.c
deleted file mode 100644
index a057a5bd94..0000000000
--- a/target/i386/hax/hax-posix.c
+++ /dev/null
@@ -1,305 +0,0 @@
-/*
- * QEMU HAXM support
- *
- * Copyright (c) 2011 Intel Corporation
- *  Written by:
- *  Jiang Yunhong<yunhong.jiang@intel.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-/* HAX module interface - darwin version */
-#include "qemu/osdep.h"
-#include <sys/ioctl.h>
-
-#include "sysemu/cpus.h"
-#include "hax-accel-ops.h"
-
-hax_fd hax_mod_open(void)
-{
-    int fd = open("/dev/HAX", O_RDWR);
-    if (fd == -1) {
-        fprintf(stderr, "Failed to open the hax module\n");
-    }
-
-    qemu_set_cloexec(fd);
-
-    return fd;
-}
-
-int hax_populate_ram(uint64_t va, uint64_t size)
-{
-    int ret;
-
-    if (!hax_global.vm || !hax_global.vm->fd) {
-        fprintf(stderr, "Allocate memory before vm create?\n");
-        return -EINVAL;
-    }
-
-    if (hax_global.supports_64bit_ramblock) {
-        struct hax_ramblock_info ramblock = {
-            .start_va = va,
-            .size = size,
-            .reserved = 0
-        };
-
-        ret = ioctl(hax_global.vm->fd, HAX_VM_IOCTL_ADD_RAMBLOCK, &ramblock);
-    } else {
-        struct hax_alloc_ram_info info = {
-            .size = (uint32_t)size,
-            .pad = 0,
-            .va = va
-        };
-
-        ret = ioctl(hax_global.vm->fd, HAX_VM_IOCTL_ALLOC_RAM, &info);
-    }
-    if (ret < 0) {
-        fprintf(stderr, "Failed to register RAM block: ret=%d, va=0x%" PRIx64
-                ", size=0x%" PRIx64 ", method=%s\n", ret, va, size,
-                hax_global.supports_64bit_ramblock ? "new" : "legacy");
-        return ret;
-    }
-    return 0;
-}
-
-int hax_set_ram(uint64_t start_pa, uint32_t size, uint64_t host_va, int flags)
-{
-    struct hax_set_ram_info info;
-    int ret;
-
-    info.pa_start = start_pa;
-    info.size = size;
-    info.va = host_va;
-    info.flags = (uint8_t) flags;
-
-    ret = ioctl(hax_global.vm->fd, HAX_VM_IOCTL_SET_RAM, &info);
-    if (ret < 0) {
-        return -errno;
-    }
-    return 0;
-}
-
-int hax_capability(struct hax_state *hax, struct hax_capabilityinfo *cap)
-{
-    int ret;
-
-    ret = ioctl(hax->fd, HAX_IOCTL_CAPABILITY, cap);
-    if (ret == -1) {
-        fprintf(stderr, "Failed to get HAX capability\n");
-        return -errno;
-    }
-
-    return 0;
-}
-
-int hax_mod_version(struct hax_state *hax, struct hax_module_version *version)
-{
-    int ret;
-
-    ret = ioctl(hax->fd, HAX_IOCTL_VERSION, version);
-    if (ret == -1) {
-        fprintf(stderr, "Failed to get HAX version\n");
-        return -errno;
-    }
-
-    return 0;
-}
-
-static char *hax_vm_devfs_string(int vm_id)
-{
-    return g_strdup_printf("/dev/hax_vm/vm%02d", vm_id);
-}
-
-static char *hax_vcpu_devfs_string(int vm_id, int vcpu_id)
-{
-    return g_strdup_printf("/dev/hax_vm%02d/vcpu%02d", vm_id, vcpu_id);
-}
-
-int hax_host_create_vm(struct hax_state *hax, int *vmid)
-{
-    int ret;
-    int vm_id = 0;
-
-    if (hax_invalid_fd(hax->fd)) {
-        return -EINVAL;
-    }
-
-    if (hax->vm) {
-        return 0;
-    }
-
-    ret = ioctl(hax->fd, HAX_IOCTL_CREATE_VM, &vm_id);
-    *vmid = vm_id;
-    return ret;
-}
-
-hax_fd hax_host_open_vm(struct hax_state *hax, int vm_id)
-{
-    hax_fd fd;
-    char *vm_name = NULL;
-
-    vm_name = hax_vm_devfs_string(vm_id);
-    if (!vm_name) {
-        return -1;
-    }
-
-    fd = open(vm_name, O_RDWR);
-    g_free(vm_name);
-
-    qemu_set_cloexec(fd);
-
-    return fd;
-}
-
-int hax_notify_qemu_version(hax_fd vm_fd, struct hax_qemu_version *qversion)
-{
-    int ret;
-
-    if (hax_invalid_fd(vm_fd)) {
-        return -EINVAL;
-    }
-
-    ret = ioctl(vm_fd, HAX_VM_IOCTL_NOTIFY_QEMU_VERSION, qversion);
-
-    if (ret < 0) {
-        fprintf(stderr, "Failed to notify qemu API version\n");
-        return ret;
-    }
-    return 0;
-}
-
-/* Simply assume the size should be bigger than the hax_tunnel,
- * since the hax_tunnel can be extended later with compatibility considered
- */
-int hax_host_create_vcpu(hax_fd vm_fd, int vcpuid)
-{
-    int ret;
-
-    ret = ioctl(vm_fd, HAX_VM_IOCTL_VCPU_CREATE, &vcpuid);
-    if (ret < 0) {
-        fprintf(stderr, "Failed to create vcpu %x\n", vcpuid);
-    }
-
-    return ret;
-}
-
-hax_fd hax_host_open_vcpu(int vmid, int vcpuid)
-{
-    char *devfs_path = NULL;
-    hax_fd fd;
-
-    devfs_path = hax_vcpu_devfs_string(vmid, vcpuid);
-    if (!devfs_path) {
-        fprintf(stderr, "Failed to get the devfs\n");
-        return -EINVAL;
-    }
-
-    fd = open(devfs_path, O_RDWR);
-    g_free(devfs_path);
-    if (fd < 0) {
-        fprintf(stderr, "Failed to open the vcpu devfs\n");
-    }
-    qemu_set_cloexec(fd);
-    return fd;
-}
-
-int hax_host_setup_vcpu_channel(AccelCPUState *vcpu)
-{
-    int ret;
-    struct hax_tunnel_info info;
-
-    ret = ioctl(vcpu->fd, HAX_VCPU_IOCTL_SETUP_TUNNEL, &info);
-    if (ret) {
-        fprintf(stderr, "Failed to setup the hax tunnel\n");
-        return ret;
-    }
-
-    if (!valid_hax_tunnel_size(info.size)) {
-        fprintf(stderr, "Invalid hax tunnel size %x\n", info.size);
-        ret = -EINVAL;
-        return ret;
-    }
-
-    vcpu->tunnel = (struct hax_tunnel *) (intptr_t) (info.va);
-    vcpu->iobuf = (unsigned char *) (intptr_t) (info.io_va);
-    return 0;
-}
-
-int hax_vcpu_run(AccelCPUState *vcpu)
-{
-    return ioctl(vcpu->fd, HAX_VCPU_IOCTL_RUN, NULL);
-}
-
-int hax_sync_fpu(CPUArchState *env, struct fx_layout *fl, int set)
-{
-    int ret, fd;
-
-    fd = hax_vcpu_get_fd(env);
-    if (fd <= 0) {
-        return -1;
-    }
-
-    if (set) {
-        ret = ioctl(fd, HAX_VCPU_IOCTL_SET_FPU, fl);
-    } else {
-        ret = ioctl(fd, HAX_VCPU_IOCTL_GET_FPU, fl);
-    }
-    return ret;
-}
-
-int hax_sync_msr(CPUArchState *env, struct hax_msr_data *msrs, int set)
-{
-    int ret, fd;
-
-    fd = hax_vcpu_get_fd(env);
-    if (fd <= 0) {
-        return -1;
-    }
-    if (set) {
-        ret = ioctl(fd, HAX_VCPU_IOCTL_SET_MSRS, msrs);
-    } else {
-        ret = ioctl(fd, HAX_VCPU_IOCTL_GET_MSRS, msrs);
-    }
-    return ret;
-}
-
-int hax_sync_vcpu_state(CPUArchState *env, struct vcpu_state_t *state, int set)
-{
-    int ret, fd;
-
-    fd = hax_vcpu_get_fd(env);
-    if (fd <= 0) {
-        return -1;
-    }
-
-    if (set) {
-        ret = ioctl(fd, HAX_VCPU_SET_REGS, state);
-    } else {
-        ret = ioctl(fd, HAX_VCPU_GET_REGS, state);
-    }
-    return ret;
-}
-
-int hax_inject_interrupt(CPUArchState *env, int vector)
-{
-    int fd;
-
-    fd = hax_vcpu_get_fd(env);
-    if (fd <= 0) {
-        return -1;
-    }
-
-    return ioctl(fd, HAX_VCPU_IOCTL_INTERRUPT, &vector);
-}
-
-void hax_kick_vcpu_thread(CPUState *cpu)
-{
-    /*
-     * FIXME: race condition with the exit_request check in
-     * hax_vcpu_hax_exec
-     */
-    cpu->exit_request = 1;
-    cpus_kick_thread(cpu);
-}
diff --git a/target/i386/hax/hax-windows.c b/target/i386/hax/hax-windows.c
deleted file mode 100644
index 4bf6cc08d2..0000000000
--- a/target/i386/hax/hax-windows.c
+++ /dev/null
@@ -1,485 +0,0 @@
-/*
- * QEMU HAXM support
- *
- * Copyright (c) 2011 Intel Corporation
- *  Written by:
- *  Jiang Yunhong<yunhong.jiang@intel.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "hax-accel-ops.h"
-
-/*
- * return 0 when success, -1 when driver not loaded,
- * other negative value for other failure
- */
-static int hax_open_device(hax_fd *fd)
-{
-    uint32_t errNum = 0;
-    HANDLE hDevice;
-
-    if (!fd) {
-        return -2;
-    }
-
-    hDevice = CreateFile("\\\\.\\HAX",
-                         GENERIC_READ | GENERIC_WRITE,
-                         0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
-
-    if (hDevice == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "Failed to open the HAX device!\n");
-        errNum = GetLastError();
-        if (errNum == ERROR_FILE_NOT_FOUND) {
-            return -1;
-        }
-        return -2;
-    }
-    *fd = hDevice;
-    return 0;
-}
-
-/* hax_fd hax_mod_open */
- hax_fd hax_mod_open(void)
-{
-    int ret;
-    hax_fd fd = NULL;
-
-    ret = hax_open_device(&fd);
-    if (ret != 0) {
-        fprintf(stderr, "Open HAX device failed\n");
-    }
-
-    return fd;
-}
-
-int hax_populate_ram(uint64_t va, uint64_t size)
-{
-    int ret;
-    HANDLE hDeviceVM;
-    DWORD dSize = 0;
-
-    if (!hax_global.vm || !hax_global.vm->fd) {
-        fprintf(stderr, "Allocate memory before vm create?\n");
-        return -EINVAL;
-    }
-
-    hDeviceVM = hax_global.vm->fd;
-    if (hax_global.supports_64bit_ramblock) {
-        struct hax_ramblock_info ramblock = {
-            .start_va = va,
-            .size = size,
-            .reserved = 0
-        };
-
-        ret = DeviceIoControl(hDeviceVM,
-                              HAX_VM_IOCTL_ADD_RAMBLOCK,
-                              &ramblock, sizeof(ramblock), NULL, 0, &dSize,
-                              (LPOVERLAPPED) NULL);
-    } else {
-        struct hax_alloc_ram_info info = {
-            .size = (uint32_t) size,
-            .pad = 0,
-            .va = va
-        };
-
-        ret = DeviceIoControl(hDeviceVM,
-                              HAX_VM_IOCTL_ALLOC_RAM,
-                              &info, sizeof(info), NULL, 0, &dSize,
-                              (LPOVERLAPPED) NULL);
-    }
-
-    if (!ret) {
-        fprintf(stderr, "Failed to register RAM block: va=0x%" PRIx64
-                ", size=0x%" PRIx64 ", method=%s\n", va, size,
-                hax_global.supports_64bit_ramblock ? "new" : "legacy");
-        return ret;
-    }
-
-    return 0;
-}
-
-int hax_set_ram(uint64_t start_pa, uint32_t size, uint64_t host_va, int flags)
-{
-    struct hax_set_ram_info info;
-    HANDLE hDeviceVM = hax_global.vm->fd;
-    DWORD dSize = 0;
-    int ret;
-
-    info.pa_start = start_pa;
-    info.size = size;
-    info.va = host_va;
-    info.flags = (uint8_t) flags;
-
-    ret = DeviceIoControl(hDeviceVM, HAX_VM_IOCTL_SET_RAM,
-                          &info, sizeof(info), NULL, 0, &dSize,
-                          (LPOVERLAPPED) NULL);
-
-    if (!ret) {
-        return -EFAULT;
-    } else {
-        return 0;
-    }
-}
-
-int hax_capability(struct hax_state *hax, struct hax_capabilityinfo *cap)
-{
-    int ret;
-    HANDLE hDevice = hax->fd;        /* handle to hax module */
-    DWORD dSize = 0;
-    DWORD err = 0;
-
-    if (hax_invalid_fd(hDevice)) {
-        fprintf(stderr, "Invalid fd for hax device!\n");
-        return -ENODEV;
-    }
-
-    ret = DeviceIoControl(hDevice, HAX_IOCTL_CAPABILITY, NULL, 0, cap,
-                          sizeof(*cap), &dSize, (LPOVERLAPPED) NULL);
-
-    if (!ret) {
-        err = GetLastError();
-        if (err == ERROR_INSUFFICIENT_BUFFER || err == ERROR_MORE_DATA) {
-            fprintf(stderr, "hax capability is too long to hold.\n");
-        }
-        fprintf(stderr, "Failed to get Hax capability:%luu\n", err);
-        return -EFAULT;
-    } else {
-        return 0;
-    }
-}
-
-int hax_mod_version(struct hax_state *hax, struct hax_module_version *version)
-{
-    int ret;
-    HANDLE hDevice = hax->fd; /* handle to hax module */
-    DWORD dSize = 0;
-    DWORD err = 0;
-
-    if (hax_invalid_fd(hDevice)) {
-        fprintf(stderr, "Invalid fd for hax device!\n");
-        return -ENODEV;
-    }
-
-    ret = DeviceIoControl(hDevice,
-                          HAX_IOCTL_VERSION,
-                          NULL, 0,
-                          version, sizeof(*version), &dSize,
-                          (LPOVERLAPPED) NULL);
-
-    if (!ret) {
-        err = GetLastError();
-        if (err == ERROR_INSUFFICIENT_BUFFER || err == ERROR_MORE_DATA) {
-            fprintf(stderr, "hax module verion is too long to hold.\n");
-        }
-        fprintf(stderr, "Failed to get Hax module version:%lu\n", err);
-        return -EFAULT;
-    } else {
-        return 0;
-    }
-}
-
-static char *hax_vm_devfs_string(int vm_id)
-{
-    return g_strdup_printf("\\\\.\\hax_vm%02d", vm_id);
-}
-
-static char *hax_vcpu_devfs_string(int vm_id, int vcpu_id)
-{
-    return g_strdup_printf("\\\\.\\hax_vm%02d_vcpu%02d", vm_id, vcpu_id);
-}
-
-int hax_host_create_vm(struct hax_state *hax, int *vmid)
-{
-    int ret;
-    int vm_id = 0;
-    DWORD dSize = 0;
-
-    if (hax_invalid_fd(hax->fd)) {
-        return -EINVAL;
-    }
-
-    if (hax->vm) {
-        return 0;
-    }
-
-    ret = DeviceIoControl(hax->fd,
-                          HAX_IOCTL_CREATE_VM,
-                          NULL, 0, &vm_id, sizeof(vm_id), &dSize,
-                          (LPOVERLAPPED) NULL);
-    if (!ret) {
-        fprintf(stderr, "Failed to create VM. Error code: %lu\n",
-                GetLastError());
-        return -1;
-    }
-    *vmid = vm_id;
-    return 0;
-}
-
-hax_fd hax_host_open_vm(struct hax_state *hax, int vm_id)
-{
-    char *vm_name = NULL;
-    hax_fd hDeviceVM;
-
-    vm_name = hax_vm_devfs_string(vm_id);
-    if (!vm_name) {
-        fprintf(stderr, "Failed to open VM. VM name is null\n");
-        return INVALID_HANDLE_VALUE;
-    }
-
-    hDeviceVM = CreateFile(vm_name,
-                           GENERIC_READ | GENERIC_WRITE,
-                           0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
-    if (hDeviceVM == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "Open the vm device error:%s, ec:%lu\n",
-                vm_name, GetLastError());
-    }
-
-    g_free(vm_name);
-    return hDeviceVM;
-}
-
-int hax_notify_qemu_version(hax_fd vm_fd, struct hax_qemu_version *qversion)
-{
-    int ret;
-    DWORD dSize = 0;
-    if (hax_invalid_fd(vm_fd)) {
-        return -EINVAL;
-    }
-    ret = DeviceIoControl(vm_fd,
-                          HAX_VM_IOCTL_NOTIFY_QEMU_VERSION,
-                          qversion, sizeof(struct hax_qemu_version),
-                          NULL, 0, &dSize, (LPOVERLAPPED) NULL);
-    if (!ret) {
-        fprintf(stderr, "Failed to notify qemu API version\n");
-        return -1;
-    }
-    return 0;
-}
-
-int hax_host_create_vcpu(hax_fd vm_fd, int vcpuid)
-{
-    int ret;
-    DWORD dSize = 0;
-
-    ret = DeviceIoControl(vm_fd,
-                          HAX_VM_IOCTL_VCPU_CREATE,
-                          &vcpuid, sizeof(vcpuid), NULL, 0, &dSize,
-                          (LPOVERLAPPED) NULL);
-    if (!ret) {
-        fprintf(stderr, "Failed to create vcpu %x\n", vcpuid);
-        return -1;
-    }
-
-    return 0;
-}
-
-hax_fd hax_host_open_vcpu(int vmid, int vcpuid)
-{
-    char *devfs_path = NULL;
-    hax_fd hDeviceVCPU;
-
-    devfs_path = hax_vcpu_devfs_string(vmid, vcpuid);
-    if (!devfs_path) {
-        fprintf(stderr, "Failed to get the devfs\n");
-        return INVALID_HANDLE_VALUE;
-    }
-
-    hDeviceVCPU = CreateFile(devfs_path,
-                             GENERIC_READ | GENERIC_WRITE,
-                             0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL,
-                             NULL);
-
-    if (hDeviceVCPU == INVALID_HANDLE_VALUE) {
-        fprintf(stderr, "Failed to open the vcpu devfs\n");
-    }
-    g_free(devfs_path);
-    return hDeviceVCPU;
-}
-
-int hax_host_setup_vcpu_channel(AccelCPUState *vcpu)
-{
-    hax_fd hDeviceVCPU = vcpu->fd;
-    int ret;
-    struct hax_tunnel_info info;
-    DWORD dSize = 0;
-
-    ret = DeviceIoControl(hDeviceVCPU,
-                          HAX_VCPU_IOCTL_SETUP_TUNNEL,
-                          NULL, 0, &info, sizeof(info), &dSize,
-                          (LPOVERLAPPED) NULL);
-    if (!ret) {
-        fprintf(stderr, "Failed to setup the hax tunnel\n");
-        return -1;
-    }
-
-    if (!valid_hax_tunnel_size(info.size)) {
-        fprintf(stderr, "Invalid hax tunnel size %x\n", info.size);
-        ret = -EINVAL;
-        return ret;
-    }
-    vcpu->tunnel = (struct hax_tunnel *) (intptr_t) (info.va);
-    vcpu->iobuf = (unsigned char *) (intptr_t) (info.io_va);
-    return 0;
-}
-
-int hax_vcpu_run(AccelCPUState *vcpu)
-{
-    int ret;
-    HANDLE hDeviceVCPU = vcpu->fd;
-    DWORD dSize = 0;
-
-    ret = DeviceIoControl(hDeviceVCPU,
-                          HAX_VCPU_IOCTL_RUN,
-                          NULL, 0, NULL, 0, &dSize, (LPOVERLAPPED) NULL);
-    if (!ret) {
-        return -EFAULT;
-    } else {
-        return 0;
-    }
-}
-
-int hax_sync_fpu(CPUArchState *env, struct fx_layout *fl, int set)
-{
-    int ret;
-    hax_fd fd;
-    HANDLE hDeviceVCPU;
-    DWORD dSize = 0;
-
-    fd = hax_vcpu_get_fd(env);
-    if (hax_invalid_fd(fd)) {
-        return -1;
-    }
-
-    hDeviceVCPU = fd;
-
-    if (set) {
-        ret = DeviceIoControl(hDeviceVCPU,
-                              HAX_VCPU_IOCTL_SET_FPU,
-                              fl, sizeof(*fl), NULL, 0, &dSize,
-                              (LPOVERLAPPED) NULL);
-    } else {
-        ret = DeviceIoControl(hDeviceVCPU,
-                              HAX_VCPU_IOCTL_GET_FPU,
-                              NULL, 0, fl, sizeof(*fl), &dSize,
-                              (LPOVERLAPPED) NULL);
-    }
-    if (!ret) {
-        return -EFAULT;
-    } else {
-        return 0;
-    }
-}
-
-int hax_sync_msr(CPUArchState *env, struct hax_msr_data *msrs, int set)
-{
-    int ret;
-    hax_fd fd;
-    HANDLE hDeviceVCPU;
-    DWORD dSize = 0;
-
-    fd = hax_vcpu_get_fd(env);
-    if (hax_invalid_fd(fd)) {
-        return -1;
-    }
-    hDeviceVCPU = fd;
-
-    if (set) {
-        ret = DeviceIoControl(hDeviceVCPU,
-                              HAX_VCPU_IOCTL_SET_MSRS,
-                              msrs, sizeof(*msrs),
-                              msrs, sizeof(*msrs), &dSize, (LPOVERLAPPED) NULL);
-    } else {
-        ret = DeviceIoControl(hDeviceVCPU,
-                              HAX_VCPU_IOCTL_GET_MSRS,
-                              msrs, sizeof(*msrs),
-                              msrs, sizeof(*msrs), &dSize, (LPOVERLAPPED) NULL);
-    }
-    if (!ret) {
-        return -EFAULT;
-    } else {
-        return 0;
-    }
-}
-
-int hax_sync_vcpu_state(CPUArchState *env, struct vcpu_state_t *state, int set)
-{
-    int ret;
-    hax_fd fd;
-    HANDLE hDeviceVCPU;
-    DWORD dSize;
-
-    fd = hax_vcpu_get_fd(env);
-    if (hax_invalid_fd(fd)) {
-        return -1;
-    }
-
-    hDeviceVCPU = fd;
-
-    if (set) {
-        ret = DeviceIoControl(hDeviceVCPU,
-                              HAX_VCPU_SET_REGS,
-                              state, sizeof(*state),
-                              NULL, 0, &dSize, (LPOVERLAPPED) NULL);
-    } else {
-        ret = DeviceIoControl(hDeviceVCPU,
-                              HAX_VCPU_GET_REGS,
-                              NULL, 0,
-                              state, sizeof(*state), &dSize,
-                              (LPOVERLAPPED) NULL);
-    }
-    if (!ret) {
-        return -EFAULT;
-    } else {
-        return 0;
-    }
-}
-
-int hax_inject_interrupt(CPUArchState *env, int vector)
-{
-    int ret;
-    hax_fd fd;
-    HANDLE hDeviceVCPU;
-    DWORD dSize;
-
-    fd = hax_vcpu_get_fd(env);
-    if (hax_invalid_fd(fd)) {
-        return -1;
-    }
-
-    hDeviceVCPU = fd;
-
-    ret = DeviceIoControl(hDeviceVCPU,
-                          HAX_VCPU_IOCTL_INTERRUPT,
-                          &vector, sizeof(vector), NULL, 0, &dSize,
-                          (LPOVERLAPPED) NULL);
-    if (!ret) {
-        return -EFAULT;
-    } else {
-        return 0;
-    }
-}
-
-static void CALLBACK dummy_apc_func(ULONG_PTR unused)
-{
-}
-
-void hax_kick_vcpu_thread(CPUState *cpu)
-{
-    /*
-     * FIXME: race condition with the exit_request check in
-     * hax_vcpu_hax_exec
-     */
-    cpu->exit_request = 1;
-    if (!qemu_cpu_is_self(cpu)) {
-        if (!QueueUserAPC(dummy_apc_func, cpu->accel->hThread, 0)) {
-            fprintf(stderr, "%s: QueueUserAPC failed with error %lu\n",
-                    __func__, GetLastError());
-            exit(1);
-        }
-    }
-}
diff --git a/accel/Kconfig b/accel/Kconfig
index 8bdedb7d15..a30cf2eb48 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -4,9 +4,6 @@ config WHPX
 config NVMM
     bool
 
-config HAX
-    bool
-
 config HVF
     bool
 
diff --git a/accel/stubs/meson.build b/accel/stubs/meson.build
index f7a9486e06..6b0f200efe 100644
--- a/accel/stubs/meson.build
+++ b/accel/stubs/meson.build
@@ -1,5 +1,4 @@
 sysemu_stubs_ss = ss.source_set()
-sysemu_stubs_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
 sysemu_stubs_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
 sysemu_stubs_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 sysemu_stubs_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
diff --git a/meson_options.txt b/meson_options.txt
index aaea5ddd77..4f3b1ecab0 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -69,8 +69,6 @@ option('malloc', type : 'combo', choices : ['system', 'tcmalloc', 'jemalloc'],
 
 option('kvm', type: 'feature', value: 'auto',
        description: 'KVM acceleration support')
-option('hax', type: 'feature', value: 'auto',
-       description: 'HAX acceleration support')
 option('whpx', type: 'feature', value: 'auto',
        description: 'WHPX acceleration support')
 option('hvf', type: 'feature', value: 'auto',
diff --git a/qemu-options.hx b/qemu-options.hx
index 29b98c3d4c..463f520c57 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -26,7 +26,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "-machine [type=]name[,prop[=value][,...]]\n"
     "                selects emulated machine ('-machine help' for list)\n"
     "                property accel=accel1[:accel2[:...]] selects accelerator\n"
-    "                supported accelerators are kvm, xen, hax, hvf, nvmm, whpx or tcg (default: tcg)\n"
+    "                supported accelerators are kvm, xen, hvf, nvmm, whpx or tcg (default: tcg)\n"
     "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
     "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
     "                mem-merge=on|off controls memory merge support (default: on)\n"
@@ -59,7 +59,7 @@ SRST
 
     ``accel=accels1[:accels2[:...]]``
         This is used to enable an accelerator. Depending on the target
-        architecture, kvm, xen, hax, hvf, nvmm, whpx or tcg can be available.
+        architecture, kvm, xen, hvf, nvmm, whpx or tcg can be available.
         By default, tcg is used. If there is more than one accelerator
         specified, the next one is used if the previous one fails to
         initialize.
@@ -178,7 +178,7 @@ ERST
 
 DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "-accel [accel=]accelerator[,prop[=value][,...]]\n"
-    "                select accelerator (kvm, xen, hax, hvf, nvmm, whpx or tcg; use 'help' for a list)\n"
+    "                select accelerator (kvm, xen, hvf, nvmm, whpx or tcg; use 'help' for a list)\n"
     "                igd-passthru=on|off (enable Xen integrated Intel graphics passthrough, default=off)\n"
     "                kernel-irqchip=on|off|split controls accelerated irqchip support (default=on)\n"
     "                kvm-shadow-mem=size of KVM shadow MMU in bytes\n"
@@ -191,7 +191,7 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
 SRST
 ``-accel name[,prop=value[,...]]``
     This is used to enable an accelerator. Depending on the target
-    architecture, kvm, xen, hax, hvf, nvmm, whpx or tcg can be available. By
+    architecture, kvm, xen, hvf, nvmm, whpx or tcg can be available. By
     default, tcg is used. If there is more than one accelerator
     specified, the next one is used if the previous one fails to
     initialize.
diff --git a/scripts/ci/org.centos/stream/8/x86_64/configure b/scripts/ci/org.centos/stream/8/x86_64/configure
index d02b09a4b9..131f8ee5f3 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/configure
+++ b/scripts/ci/org.centos/stream/8/x86_64/configure
@@ -68,7 +68,6 @@
 --disable-gtk \
 --disable-guest-agent \
 --disable-guest-agent-msi \
---disable-hax \
 --disable-hvf \
 --disable-iconv \
 --disable-kvm \
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 9da3fe299b..504a61ad01 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -110,7 +110,6 @@ meson_options_help() {
   printf "%s\n" '  gtk-clipboard   clipboard support for the gtk UI (EXPERIMENTAL, MAY HANG)'
   printf "%s\n" '  guest-agent     Build QEMU Guest Agent'
   printf "%s\n" '  guest-agent-msi Build MSI package for the QEMU Guest Agent'
-  printf "%s\n" '  hax             HAX acceleration support'
   printf "%s\n" '  hvf             HVF acceleration support'
   printf "%s\n" '  iconv           Font glyph conversion support'
   printf "%s\n" '  jack            JACK sound support'
@@ -312,8 +311,6 @@ _meson_option_parse() {
     --disable-guest-agent) printf "%s" -Dguest_agent=disabled ;;
     --enable-guest-agent-msi) printf "%s" -Dguest_agent_msi=enabled ;;
     --disable-guest-agent-msi) printf "%s" -Dguest_agent_msi=disabled ;;
-    --enable-hax) printf "%s" -Dhax=enabled ;;
-    --disable-hax) printf "%s" -Dhax=disabled ;;
     --enable-hexagon-idef-parser) printf "%s" -Dhexagon_idef_parser=true ;;
     --disable-hexagon-idef-parser) printf "%s" -Dhexagon_idef_parser=false ;;
     --enable-hvf) printf "%s" -Dhvf=enabled ;;
diff --git a/target/i386/hax/meson.build b/target/i386/hax/meson.build
deleted file mode 100644
index 6ac314aa35..0000000000
--- a/target/i386/hax/meson.build
+++ /dev/null
@@ -1,7 +0,0 @@
-i386_system_ss.add(when: 'CONFIG_HAX', if_true: files(
-  'hax-all.c',
-  'hax-mem.c',
-  'hax-accel-ops.c',
-))
-i386_system_ss.add(when: ['CONFIG_HAX', 'CONFIG_POSIX'], if_true: files('hax-posix.c'))
-i386_system_ss.add(when: ['CONFIG_HAX', 'CONFIG_WIN32'], if_true: files('hax-windows.c'))
diff --git a/target/i386/meson.build b/target/i386/meson.build
index 1effe1ed9a..6f1036d469 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -25,7 +25,6 @@ i386_system_ss.add(when: 'CONFIG_SEV', if_true: files('sev.c'), if_false: files(
 i386_user_ss = ss.source_set()
 
 subdir('kvm')
-subdir('hax')
 subdir('whpx')
 subdir('nvmm')
 subdir('hvf')
-- 
2.41.0


