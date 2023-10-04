Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4764DE8FDDB
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 09:11:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnxsN-0004Ff-QN; Wed, 04 Oct 2023 05:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxrL-00036n-Qh
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:08:04 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxrH-0007fU-9u
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:07:58 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40572aeb673so19236475e9.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Oct 2023 02:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696410472; x=1697015272; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n1miO2dVg32MNtE8qiVkrZLyGPe64MlUNhP6hyq8PUU=;
 b=dEkzeKJtM7A++ZopAmnu4Itblp9qO2VFVlh4q6ic2IVp9UXjHi94i+0eDJ4wm64t3N
 ZSe32ty2r0XIzggVNoOEkRkcZvGG4tkHH1g/GLu63MVi4/Z4E9c5cT5HU5cj8CCOsc0S
 po44gkPQWv7hXHTPGeEUHDJv1JXrynYbq7cxqe8JX6i8FsZvjyY3hibN1+aLk59PhTfb
 jGVQlSeIaR+5l8w3UevSsAzXgRqgYVMsK0F/L64eqbUl0J6i/QNS8Tn9YVQt2FDWCWoZ
 Qa5CcdHbbTsIdxLsPfwdZWKoVeKJDAuVSG4XHDd5rVEEUDR+UqNvE8vHArCYn1sj6k9c
 NbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696410472; x=1697015272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n1miO2dVg32MNtE8qiVkrZLyGPe64MlUNhP6hyq8PUU=;
 b=X2jnFr9ohGIydYNbrSdiZjYXhU/lr7vn3GUzUR22BrkCyzn61bdpzzaeew3Dn2yarS
 s93BZtNMQ0oTML2CdILY1eDCZWNN/rRXgkVNV6WYUgb4+mv1O8UxM1qfk9tG+99Ke65e
 8/pvOGrs6RAD1MlUAmEOK/zdHrqhpNKE0PDaNAylJNSRq3mvZYJI2iJU9JFFMkAxPic3
 1rhhs+ltBFDk2+ZfXSxH5pN7krCi3inB7LhlvfGmQYfdy+KZb3dDrm4iJVZm8N0pAK9b
 ecjiX0zXbforP5r1CJp0o/VwRxbyUvKez/knR5QXR9xnvKfHPxU+F3mSxkdNMdh1WWKc
 zf8w==
X-Gm-Message-State: AOJu0YyobuiavmMoifggFWihcKVjzkc/T0BV1De/06WWzMd7Wer1c2GX
 VfBLIcenZ9fWWKpThnUXnJQYJQ==
X-Google-Smtp-Source: AGHT+IE9U2uZazBR5WjAiO2ooQVIW7E+jhi6N5SkHMnh28gmf2Ti88R9H4dp9vdwBpIImsv/P21TBg==
X-Received: by 2002:a1c:f710:0:b0:404:746e:c601 with SMTP id
 v16-20020a1cf710000000b00404746ec601mr1494591wmh.9.1696410472306; 
 Wed, 04 Oct 2023 02:07:52 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 j10-20020a5d464a000000b00317a04131c5sm3499122wrs.57.2023.10.04.02.07.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 02:07:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH 13/13] system: Rename softmmu/ directory as system/
Date: Wed,  4 Oct 2023 11:06:28 +0200
Message-ID: <20231004090629.37473-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
References: <20231004090629.37473-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The softmmu/ directory contains files specific to system
emulation. Rename it as system/. Update meson rules, the
MAINTAINERS file and all the documentation and comments.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                             | 44 ++++++++++++-------------
 docs/devel/qtest.rst                    |  2 +-
 meson.build                             |  8 ++---
 include/sysemu/runstate-action.h        |  2 +-
 softmmu/trace.h                         |  1 -
 {softmmu => system}/timers-state.h      |  0
 system/trace.h                          |  1 +
 {softmmu => system}/arch_init.c         |  0
 {softmmu => system}/async-teardown.c    |  0
 {softmmu => system}/balloon.c           |  0
 {softmmu => system}/bootdevice.c        |  0
 {softmmu => system}/cpu-throttle.c      |  0
 {softmmu => system}/cpu-timers.c        |  0
 {softmmu => system}/cpus.c              |  0
 {softmmu => system}/datadir.c           |  0
 {softmmu => system}/device_tree.c       |  0
 {softmmu => system}/dirtylimit.c        |  0
 {softmmu => system}/dma-helpers.c       |  0
 {softmmu => system}/globals.c           |  0
 {softmmu => system}/icount.c            |  0
 {softmmu => system}/ioport.c            |  0
 {softmmu => system}/main.c              |  0
 {softmmu => system}/memory.c            |  0
 {softmmu => system}/memory_mapping.c    |  0
 {softmmu => system}/physmem.c           |  6 ++--
 {softmmu => system}/qdev-monitor.c      |  0
 {softmmu => system}/qemu-seccomp.c      |  0
 {softmmu => system}/qtest.c             |  0
 {softmmu => system}/rtc.c               |  0
 {softmmu => system}/runstate-action.c   |  0
 {softmmu => system}/runstate-hmp-cmds.c |  0
 {softmmu => system}/runstate.c          |  0
 {softmmu => system}/tpm-hmp-cmds.c      |  0
 {softmmu => system}/tpm.c               |  0
 {softmmu => system}/vl.c                |  0
 {softmmu => system}/watchpoint.c        |  0
 scripts/checkpatch.pl                   |  2 +-
 scripts/coverity-scan/COMPONENTS.md     |  2 +-
 scripts/get_maintainer.pl               |  2 +-
 {softmmu => system}/meson.build         |  0
 {softmmu => system}/trace-events        |  0
 tests/unit/meson.build                  |  2 +-
 42 files changed, 37 insertions(+), 35 deletions(-)
 delete mode 100644 softmmu/trace.h
 rename {softmmu => system}/timers-state.h (100%)
 create mode 100644 system/trace.h
 rename {softmmu => system}/arch_init.c (100%)
 rename {softmmu => system}/async-teardown.c (100%)
 rename {softmmu => system}/balloon.c (100%)
 rename {softmmu => system}/bootdevice.c (100%)
 rename {softmmu => system}/cpu-throttle.c (100%)
 rename {softmmu => system}/cpu-timers.c (100%)
 rename {softmmu => system}/cpus.c (100%)
 rename {softmmu => system}/datadir.c (100%)
 rename {softmmu => system}/device_tree.c (100%)
 rename {softmmu => system}/dirtylimit.c (100%)
 rename {softmmu => system}/dma-helpers.c (100%)
 rename {softmmu => system}/globals.c (100%)
 rename {softmmu => system}/icount.c (100%)
 rename {softmmu => system}/ioport.c (100%)
 rename {softmmu => system}/main.c (100%)
 rename {softmmu => system}/memory.c (100%)
 rename {softmmu => system}/memory_mapping.c (100%)
 rename {softmmu => system}/physmem.c (99%)
 rename {softmmu => system}/qdev-monitor.c (100%)
 rename {softmmu => system}/qemu-seccomp.c (100%)
 rename {softmmu => system}/qtest.c (100%)
 rename {softmmu => system}/rtc.c (100%)
 rename {softmmu => system}/runstate-action.c (100%)
 rename {softmmu => system}/runstate-hmp-cmds.c (100%)
 rename {softmmu => system}/runstate.c (100%)
 rename {softmmu => system}/tpm-hmp-cmds.c (100%)
 rename {softmmu => system}/tpm.c (100%)
 rename {softmmu => system}/vl.c (100%)
 rename {softmmu => system}/watchpoint.c (100%)
 rename {softmmu => system}/meson.build (100%)
 rename {softmmu => system}/trace-events (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81625f036b..2ddc3413b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -137,8 +137,8 @@ Overall TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
 R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
-F: softmmu/cpus.c
-F: softmmu/watchpoint.c
+F: system/cpus.c
+F: system/watchpoint.c
 F: cpus-common.c
 F: page-vary.c
 F: page-vary-common.c
@@ -2108,7 +2108,7 @@ S: Maintained
 F: docs/interop/virtio-balloon-stats.rst
 F: hw/virtio/virtio-balloon*.c
 F: include/hw/virtio/virtio-balloon.h
-F: softmmu/balloon.c
+F: system/balloon.c
 F: include/sysemu/balloon.h
 
 virtio-9p
@@ -2788,7 +2788,7 @@ Device Tree
 M: Alistair Francis <alistair.francis@wdc.com>
 R: David Gibson <david@gibson.dropbear.id.au>
 S: Maintained
-F: softmmu/device_tree.c
+F: system/device_tree.c
 F: include/sysemu/device_tree.h
 
 Dump
@@ -2844,11 +2844,11 @@ F: include/exec/memory.h
 F: include/exec/ram_addr.h
 F: include/exec/ramblock.h
 F: include/sysemu/memory_mapping.h
-F: softmmu/dma-helpers.c
-F: softmmu/ioport.c
-F: softmmu/memory.c
-F: softmmu/memory_mapping.c
-F: softmmu/physmem.c
+F: system/dma-helpers.c
+F: system/ioport.c
+F: system/memory.c
+F: system/memory_mapping.c
+F: system/physmem.c
 F: include/exec/memory-internal.h
 F: scripts/coccinelle/memory-region-housekeeping.cocci
 
@@ -2901,13 +2901,13 @@ F: include/sysemu/runstate.h
 F: include/sysemu/runstate-action.h
 F: util/main-loop.c
 F: util/qemu-timer.c
-F: softmmu/vl.c
-F: softmmu/main.c
-F: softmmu/cpus.c
-F: softmmu/cpu-throttle.c
-F: softmmu/cpu-timers.c
-F: softmmu/icount.c
-F: softmmu/runstate*
+F: system/vl.c
+F: system/main.c
+F: system/cpus.c
+F: system/cpu-throttle.c
+F: system/cpu-timers.c
+F: system/icount.c
+F: system/runstate*
 F: qapi/run-state.json
 
 Read, Copy, Update (RCU)
@@ -3081,7 +3081,7 @@ F: qapi/qom.json
 F: qapi/qdev.json
 F: scripts/coccinelle/qom-parent-type.cocci
 F: scripts/qom-cast-macro-clean-cocci-gen.py
-F: softmmu/qdev-monitor.c
+F: system/qdev-monitor.c
 F: stubs/qdev.c
 F: qom/
 F: tests/unit/check-qom-interface.c
@@ -3115,7 +3115,7 @@ M: Thomas Huth <thuth@redhat.com>
 M: Laurent Vivier <lvivier@redhat.com>
 R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
-F: softmmu/qtest.c
+F: system/qtest.c
 F: accel/qtest/
 F: tests/qtest/
 F: docs/devel/qgraph.rst
@@ -3191,7 +3191,7 @@ F: scripts/simpletrace.py
 TPM
 M: Stefan Berger <stefanb@linux.ibm.com>
 S: Maintained
-F: softmmu/tpm*
+F: system/tpm*
 F: hw/tpm/*
 F: include/hw/acpi/tpm.h
 F: include/sysemu/tpm*
@@ -3226,7 +3226,7 @@ F: util/userfaultfd.c
 Migration dirty limit and dirty page rate
 M: Hyman Huang <yong.huang@smartx.com>
 S: Maintained
-F: softmmu/dirtylimit.c
+F: system/dirtylimit.c
 F: include/sysemu/dirtylimit.h
 F: migration/dirtyrate.c
 F: migration/dirtyrate.h
@@ -3250,7 +3250,7 @@ F: scripts/xml-preprocess*
 Seccomp
 M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
-F: softmmu/qemu-seccomp.c
+F: system/qemu-seccomp.c
 F: include/sysemu/seccomp.h
 F: tests/unit/test-seccomp.c
 
@@ -3669,7 +3669,7 @@ T: git https://github.com/stefanha/qemu.git block
 Bootdevice
 M: Gonglei <arei.gonglei@huawei.com>
 S: Maintained
-F: softmmu/bootdevice.c
+F: system/bootdevice.c
 
 Quorum
 M: Alberto Garcia <berto@igalia.com>
diff --git a/docs/devel/qtest.rst b/docs/devel/qtest.rst
index 0455aa06ab..c5b8546b3e 100644
--- a/docs/devel/qtest.rst
+++ b/docs/devel/qtest.rst
@@ -81,7 +81,7 @@ which you can run manually.
 QTest Protocol
 --------------
 
-.. kernel-doc:: softmmu/qtest.c
+.. kernel-doc:: system/qtest.c
    :doc: QTest Protocol
 
 
diff --git a/meson.build b/meson.build
index 497a85eb9f..05387853af 100644
--- a/meson.build
+++ b/meson.build
@@ -3307,7 +3307,7 @@ if have_system
     'hw/gpio',
     'migration',
     'net',
-    'softmmu',
+    'system',
     'ui',
     'hw/remote',
   ]
@@ -3434,7 +3434,7 @@ endif
 common_ss.add(files('cpus-common.c'))
 specific_ss.add(files('cpu.c'))
 
-subdir('softmmu')
+subdir('system')
 
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
@@ -3813,14 +3813,14 @@ foreach target : target_dirs
     execs = [{
       'name': 'qemu-system-' + target_name,
       'win_subsystem': 'console',
-      'sources': files('softmmu/main.c'),
+      'sources': files('system/main.c'),
       'dependencies': []
     }]
     if targetos == 'windows' and (sdl.found() or gtk.found())
       execs += [{
         'name': 'qemu-system-' + target_name + 'w',
         'win_subsystem': 'windows',
-        'sources': files('softmmu/main.c'),
+        'sources': files('system/main.c'),
         'dependencies': []
       }]
     endif
diff --git a/include/sysemu/runstate-action.h b/include/sysemu/runstate-action.h
index cff45a047b..db4e3099ae 100644
--- a/include/sysemu/runstate-action.h
+++ b/include/sysemu/runstate-action.h
@@ -11,7 +11,7 @@
 
 #include "qapi/qapi-commands-run-state.h"
 
-/* in softmmu/runstate-action.c */
+/* in system/runstate-action.c */
 extern RebootAction reboot_action;
 extern ShutdownAction shutdown_action;
 extern PanicAction panic_action;
diff --git a/softmmu/trace.h b/softmmu/trace.h
deleted file mode 100644
index 2ad1011572..0000000000
--- a/softmmu/trace.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "trace/trace-softmmu.h"
diff --git a/softmmu/timers-state.h b/system/timers-state.h
similarity index 100%
rename from softmmu/timers-state.h
rename to system/timers-state.h
diff --git a/system/trace.h b/system/trace.h
new file mode 100644
index 0000000000..cd0136dcdc
--- /dev/null
+++ b/system/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-system.h"
diff --git a/softmmu/arch_init.c b/system/arch_init.c
similarity index 100%
rename from softmmu/arch_init.c
rename to system/arch_init.c
diff --git a/softmmu/async-teardown.c b/system/async-teardown.c
similarity index 100%
rename from softmmu/async-teardown.c
rename to system/async-teardown.c
diff --git a/softmmu/balloon.c b/system/balloon.c
similarity index 100%
rename from softmmu/balloon.c
rename to system/balloon.c
diff --git a/softmmu/bootdevice.c b/system/bootdevice.c
similarity index 100%
rename from softmmu/bootdevice.c
rename to system/bootdevice.c
diff --git a/softmmu/cpu-throttle.c b/system/cpu-throttle.c
similarity index 100%
rename from softmmu/cpu-throttle.c
rename to system/cpu-throttle.c
diff --git a/softmmu/cpu-timers.c b/system/cpu-timers.c
similarity index 100%
rename from softmmu/cpu-timers.c
rename to system/cpu-timers.c
diff --git a/softmmu/cpus.c b/system/cpus.c
similarity index 100%
rename from softmmu/cpus.c
rename to system/cpus.c
diff --git a/softmmu/datadir.c b/system/datadir.c
similarity index 100%
rename from softmmu/datadir.c
rename to system/datadir.c
diff --git a/softmmu/device_tree.c b/system/device_tree.c
similarity index 100%
rename from softmmu/device_tree.c
rename to system/device_tree.c
diff --git a/softmmu/dirtylimit.c b/system/dirtylimit.c
similarity index 100%
rename from softmmu/dirtylimit.c
rename to system/dirtylimit.c
diff --git a/softmmu/dma-helpers.c b/system/dma-helpers.c
similarity index 100%
rename from softmmu/dma-helpers.c
rename to system/dma-helpers.c
diff --git a/softmmu/globals.c b/system/globals.c
similarity index 100%
rename from softmmu/globals.c
rename to system/globals.c
diff --git a/softmmu/icount.c b/system/icount.c
similarity index 100%
rename from softmmu/icount.c
rename to system/icount.c
diff --git a/softmmu/ioport.c b/system/ioport.c
similarity index 100%
rename from softmmu/ioport.c
rename to system/ioport.c
diff --git a/softmmu/main.c b/system/main.c
similarity index 100%
rename from softmmu/main.c
rename to system/main.c
diff --git a/softmmu/memory.c b/system/memory.c
similarity index 100%
rename from softmmu/memory.c
rename to system/memory.c
diff --git a/softmmu/memory_mapping.c b/system/memory_mapping.c
similarity index 100%
rename from softmmu/memory_mapping.c
rename to system/memory_mapping.c
diff --git a/softmmu/physmem.c b/system/physmem.c
similarity index 99%
rename from softmmu/physmem.c
rename to system/physmem.c
index 309653c722..edc3ed8ab9 100644
--- a/softmmu/physmem.c
+++ b/system/physmem.c
@@ -2301,8 +2301,10 @@ RAMBlock *qemu_ram_block_by_name(const char *name)
     return NULL;
 }
 
-/* Some of the softmmu routines need to translate from a host pointer
-   (typically a TLB entry) back to a ram offset.  */
+/*
+ * Some of the system routines need to translate from a host pointer
+ * (typically a TLB entry) back to a ram offset.
+ */
 ram_addr_t qemu_ram_addr_from_host(void *ptr)
 {
     RAMBlock *block;
diff --git a/softmmu/qdev-monitor.c b/system/qdev-monitor.c
similarity index 100%
rename from softmmu/qdev-monitor.c
rename to system/qdev-monitor.c
diff --git a/softmmu/qemu-seccomp.c b/system/qemu-seccomp.c
similarity index 100%
rename from softmmu/qemu-seccomp.c
rename to system/qemu-seccomp.c
diff --git a/softmmu/qtest.c b/system/qtest.c
similarity index 100%
rename from softmmu/qtest.c
rename to system/qtest.c
diff --git a/softmmu/rtc.c b/system/rtc.c
similarity index 100%
rename from softmmu/rtc.c
rename to system/rtc.c
diff --git a/softmmu/runstate-action.c b/system/runstate-action.c
similarity index 100%
rename from softmmu/runstate-action.c
rename to system/runstate-action.c
diff --git a/softmmu/runstate-hmp-cmds.c b/system/runstate-hmp-cmds.c
similarity index 100%
rename from softmmu/runstate-hmp-cmds.c
rename to system/runstate-hmp-cmds.c
diff --git a/softmmu/runstate.c b/system/runstate.c
similarity index 100%
rename from softmmu/runstate.c
rename to system/runstate.c
diff --git a/softmmu/tpm-hmp-cmds.c b/system/tpm-hmp-cmds.c
similarity index 100%
rename from softmmu/tpm-hmp-cmds.c
rename to system/tpm-hmp-cmds.c
diff --git a/softmmu/tpm.c b/system/tpm.c
similarity index 100%
rename from softmmu/tpm.c
rename to system/tpm.c
diff --git a/softmmu/vl.c b/system/vl.c
similarity index 100%
rename from softmmu/vl.c
rename to system/vl.c
diff --git a/softmmu/watchpoint.c b/system/watchpoint.c
similarity index 100%
rename from softmmu/watchpoint.c
rename to system/watchpoint.c
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 1ad9ccb74b..6e4100d2a4 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -466,7 +466,7 @@ sub top_of_kernel_tree {
 	my @tree_check = (
 		"COPYING", "MAINTAINERS", "Makefile",
 		"README.rst", "docs", "VERSION",
-		"linux-user", "softmmu"
+		"linux-user", "system"
 	);
 
 	foreach my $check (@tree_check) {
diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index 883da95aff..0e62f10aad 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -148,7 +148,7 @@ tcg
   ~ (/qemu)?(/accel/tcg|/replay|/tcg)/.*
 
 sysemu
-  ~ (/qemu)?(/softmmu/.*|/accel/.*)
+  ~ (/qemu)?(/system/.*|/accel/.*)
 
 (headers)
   ~ (/qemu)?(/include/.*)
diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index e5499b94b4..02fa828100 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -796,7 +796,7 @@ sub top_of_tree {
         && (-d "${lk_path}docs")
         && (-f "${lk_path}VERSION")
         && (-d "${lk_path}linux-user/")
-        && (-d "${lk_path}softmmu/")) {
+        && (-d "${lk_path}system/")) {
 	return 1;
     }
     return 0;
diff --git a/softmmu/meson.build b/system/meson.build
similarity index 100%
rename from softmmu/meson.build
rename to system/meson.build
diff --git a/softmmu/trace-events b/system/trace-events
similarity index 100%
rename from softmmu/trace-events
rename to system/trace-events
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 0299ef6906..e7d72ee80a 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -58,7 +58,7 @@ if have_system or have_tools
   }
 
   if seccomp.found()
-    tests += {'test-seccomp': ['../../softmmu/qemu-seccomp.c', seccomp]}
+    tests += {'test-seccomp': ['../../system/qemu-seccomp.c', seccomp]}
   endif
 endif
 
-- 
2.41.0


