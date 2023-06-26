Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956BEEB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 23:21:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDvVn-0004hQ-GD; Mon, 26 Jun 2023 19:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDvVl-0004eI-Ob
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 19:20:45 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDvVj-0008WK-JJ
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 19:20:45 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-991b7a4d2e8so196939566b.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 16:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687821642; x=1690413642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgOYNNSnoVwlQK/r9wkyHNyY/Yl022DGjtE43qf1HB0=;
 b=DMKuUklZ/aESEWoH5CgrsX3F4rcfgPe9IrSZaXQpG4FXUBKofvrH4/lsKzLPIfFfRs
 7nbwF1DT5cAOKIYyBXdiUnCJakYNxQHosGP5Bbhwd4aByVwPZ9sOC8UJY2HefGetNAm/
 yeGWG0L77JyAiqFZTdkpvgZmkI7JwvAbDuVWJof39mkoX31p4f/J6aSIsXmY5AGDMAlX
 nnTW273WVHCawSNloNfyia29CXFP52v9mvjvSzzVhy2TyQtkzhT2t/nzj0sEr7oRnWaT
 W1KnOzRrJH8O0ovcnpNA89i9IsTpssqTBlQrQAgqpeZYPpFkxxw/bvBVTIJuFuKNajXk
 ePeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687821642; x=1690413642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgOYNNSnoVwlQK/r9wkyHNyY/Yl022DGjtE43qf1HB0=;
 b=PG8rzvbV8/AblhgIAu1lBgu8YPSHtPn7ZX0gMRiwawIwa8Z9mbh8dHTZH3iw1cYnwe
 96f3K2ZgfL0SpNk4Jg616u6lWVgH6lH6gGNTb9WGbLISMrTxyJRApLc9tI44KjwH5P4h
 62fFCW5Pd3AkXDK7Fgd/hop2S+3VC7XfrnaTeIvzmaOEOqcietKLHJFOEIxBPUVm0Rw2
 L4Hv5A8EGz+zHtQ7KNkaasTckNkK4PxXFcozkPJZyMJuetlaT3b8WzdJ9DPzauentueQ
 M/1+hOhZdL4BfDcYDqmGGvEXPH01QUUkQoknSowhDIb2S4e0xj94GsQL/U02k3IU2XaQ
 vVLg==
X-Gm-Message-State: AC+VfDyU++JwQ/3CabS2fzN5yjMAcY0GGwhk4/DmPAiHINkMXKPA7s2Y
 uW4aFGPVGT81NgadhZIJOu+c3w==
X-Google-Smtp-Source: ACHHUZ7CCLSkPrh0C0sPMD+HAJJSGoX+OLIqD1OuKi9lCbnDlBTRL4w6eBQfPS8JQMQLhK+6LqaaIg==
X-Received: by 2002:a17:906:fe03:b0:96f:b58e:7e21 with SMTP id
 wy3-20020a170906fe0300b0096fb58e7e21mr26173106ejb.52.1687821642178; 
 Mon, 26 Jun 2023 16:20:42 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.226])
 by smtp.gmail.com with ESMTPSA id
 gg18-20020a170906e29200b0098d2d219649sm3843858ejb.174.2023.06.26.16.20.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Jun 2023 16:20:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org
Subject: [PATCH 05/16] target/riscv: Move sysemu-specific files to
 target/riscv/sysemu/
Date: Tue, 27 Jun 2023 01:19:56 +0200
Message-Id: <20230626232007.8933-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230626232007.8933-1-philmd@linaro.org>
References: <20230626232007.8933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Move sysemu-specific files to the a new 'sysemu' sub-directory,
adapt meson rules.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.h                         |  2 +-
 target/riscv/{ => sysemu}/instmap.h        |  0
 target/riscv/{ => sysemu}/kvm_riscv.h      |  0
 target/riscv/{ => sysemu}/pmp.h            |  0
 target/riscv/{ => sysemu}/pmu.h            |  0
 target/riscv/{ => sysemu}/time_helper.h    |  0
 hw/riscv/virt.c                            |  2 +-
 target/riscv/cpu.c                         |  6 +++---
 target/riscv/cpu_helper.c                  |  4 ++--
 target/riscv/csr.c                         |  4 ++--
 target/riscv/{ => sysemu}/arch_dump.c      |  0
 target/riscv/{ => sysemu}/kvm-stub.c       |  0
 target/riscv/{ => sysemu}/kvm.c            |  0
 target/riscv/{ => sysemu}/machine.c        |  0
 target/riscv/{ => sysemu}/monitor.c        |  0
 target/riscv/{ => sysemu}/pmp.c            |  0
 target/riscv/{ => sysemu}/pmu.c            |  0
 target/riscv/{ => sysemu}/riscv-qmp-cmds.c |  0
 target/riscv/{ => sysemu}/time_helper.c    |  0
 target/riscv/meson.build                   | 13 ++++---------
 target/riscv/sysemu/meson.build            | 12 ++++++++++++
 21 files changed, 25 insertions(+), 18 deletions(-)
 rename target/riscv/{ => sysemu}/instmap.h (100%)
 rename target/riscv/{ => sysemu}/kvm_riscv.h (100%)
 rename target/riscv/{ => sysemu}/pmp.h (100%)
 rename target/riscv/{ => sysemu}/pmu.h (100%)
 rename target/riscv/{ => sysemu}/time_helper.h (100%)
 rename target/riscv/{ => sysemu}/arch_dump.c (100%)
 rename target/riscv/{ => sysemu}/kvm-stub.c (100%)
 rename target/riscv/{ => sysemu}/kvm.c (100%)
 rename target/riscv/{ => sysemu}/machine.c (100%)
 rename target/riscv/{ => sysemu}/monitor.c (100%)
 rename target/riscv/{ => sysemu}/pmp.c (100%)
 rename target/riscv/{ => sysemu}/pmu.c (100%)
 rename target/riscv/{ => sysemu}/riscv-qmp-cmds.c (100%)
 rename target/riscv/{ => sysemu}/time_helper.c (100%)
 create mode 100644 target/riscv/sysemu/meson.build

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b1b56aa29e..83a9a965d1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -88,7 +88,7 @@ typedef enum {
 #define MAX_RISCV_PMPS (16)
 
 #if !defined(CONFIG_USER_ONLY)
-#include "pmp.h"
+#include "sysemu/pmp.h"
 #include "debug.h"
 #endif
 
diff --git a/target/riscv/instmap.h b/target/riscv/sysemu/instmap.h
similarity index 100%
rename from target/riscv/instmap.h
rename to target/riscv/sysemu/instmap.h
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/sysemu/kvm_riscv.h
similarity index 100%
rename from target/riscv/kvm_riscv.h
rename to target/riscv/sysemu/kvm_riscv.h
diff --git a/target/riscv/pmp.h b/target/riscv/sysemu/pmp.h
similarity index 100%
rename from target/riscv/pmp.h
rename to target/riscv/sysemu/pmp.h
diff --git a/target/riscv/pmu.h b/target/riscv/sysemu/pmu.h
similarity index 100%
rename from target/riscv/pmu.h
rename to target/riscv/sysemu/pmu.h
diff --git a/target/riscv/time_helper.h b/target/riscv/sysemu/time_helper.h
similarity index 100%
rename from target/riscv/time_helper.h
rename to target/riscv/sysemu/time_helper.h
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 95708d890e..11f9577004 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -30,7 +30,7 @@
 #include "hw/char/serial.h"
 #include "target/riscv/cpu.h"
 #include "hw/core/sysbus-fdt.h"
-#include "target/riscv/pmu.h"
+#include "target/riscv/sysemu/pmu.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7f281cdcf6..a1513bf5cc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -24,10 +24,10 @@
 #include "cpu.h"
 #include "cpu_vendorid.h"
 #ifndef CONFIG_USER_ONLY
-#include "pmu.h"
-#include "time_helper.h"
+#include "sysemu/pmu.h"
+#include "sysemu/time_helper.h"
 #include "sysemu/kvm.h"
-#include "kvm_riscv.h"
+#include "sysemu/kvm_riscv.h"
 #endif
 #include "internals.h"
 #include "exec/exec-all.h"
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d871718e5d..5ff48be561 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -22,9 +22,9 @@
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "internals.h"
-#include "pmu.h"
+#include "sysemu/pmu.h"
 #include "exec/exec-all.h"
-#include "instmap.h"
+#include "sysemu/instmap.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 936ba2be24..788d169502 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -22,8 +22,8 @@
 #include "qemu/timer.h"
 #include "cpu.h"
 #ifndef CONFIG_USER_ONLY
-#include "pmu.h"
-#include "time_helper.h"
+#include "sysemu/pmu.h"
+#include "sysemu/time_helper.h"
 #endif
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
diff --git a/target/riscv/arch_dump.c b/target/riscv/sysemu/arch_dump.c
similarity index 100%
rename from target/riscv/arch_dump.c
rename to target/riscv/sysemu/arch_dump.c
diff --git a/target/riscv/kvm-stub.c b/target/riscv/sysemu/kvm-stub.c
similarity index 100%
rename from target/riscv/kvm-stub.c
rename to target/riscv/sysemu/kvm-stub.c
diff --git a/target/riscv/kvm.c b/target/riscv/sysemu/kvm.c
similarity index 100%
rename from target/riscv/kvm.c
rename to target/riscv/sysemu/kvm.c
diff --git a/target/riscv/machine.c b/target/riscv/sysemu/machine.c
similarity index 100%
rename from target/riscv/machine.c
rename to target/riscv/sysemu/machine.c
diff --git a/target/riscv/monitor.c b/target/riscv/sysemu/monitor.c
similarity index 100%
rename from target/riscv/monitor.c
rename to target/riscv/sysemu/monitor.c
diff --git a/target/riscv/pmp.c b/target/riscv/sysemu/pmp.c
similarity index 100%
rename from target/riscv/pmp.c
rename to target/riscv/sysemu/pmp.c
diff --git a/target/riscv/pmu.c b/target/riscv/sysemu/pmu.c
similarity index 100%
rename from target/riscv/pmu.c
rename to target/riscv/sysemu/pmu.c
diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/sysemu/riscv-qmp-cmds.c
similarity index 100%
rename from target/riscv/riscv-qmp-cmds.c
rename to target/riscv/sysemu/riscv-qmp-cmds.c
diff --git a/target/riscv/time_helper.c b/target/riscv/sysemu/time_helper.c
similarity index 100%
rename from target/riscv/time_helper.c
rename to target/riscv/sysemu/time_helper.c
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 7f56c5f88d..8967dfaded 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -7,6 +7,8 @@ gen = [
 ]
 
 riscv_ss = ss.source_set()
+riscv_system_ss = ss.source_set()
+
 riscv_ss.add(gen)
 riscv_ss.add(files(
   'cpu.c',
@@ -22,19 +24,12 @@ riscv_ss.add(files(
   'crypto_helper.c',
   'zce_helper.c'
 ))
-riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 
-riscv_system_ss = ss.source_set()
 riscv_system_ss.add(files(
-  'arch_dump.c',
-  'pmp.c',
   'debug.c',
-  'monitor.c',
-  'machine.c',
-  'pmu.c',
-  'time_helper.c',
-  'riscv-qmp-cmds.c',
 ))
 
+subdir('sysemu')
+
 target_arch += {'riscv': riscv_ss}
 target_softmmu_arch += {'riscv': riscv_system_ss}
diff --git a/target/riscv/sysemu/meson.build b/target/riscv/sysemu/meson.build
new file mode 100644
index 0000000000..5f8e1edcf2
--- /dev/null
+++ b/target/riscv/sysemu/meson.build
@@ -0,0 +1,12 @@
+riscv_system_ss.add(files(
+  'arch_dump.c',
+  'machine.c',
+  'monitor.c',
+  'pmp.c',
+  'pmu.c',
+  'riscv-qmp-cmds.c',
+  'time_helper.c',
+))
+
+riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'),
+                                 if_false: files('kvm-stub.c'))
-- 
2.38.1


