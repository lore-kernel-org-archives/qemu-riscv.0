Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0D7606A31A
	for <qemu-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 17:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BjBrX+NW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xNCaR-0003oe-Lu; Sat, 31 Oct 2026 13:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNCaP-0003oG-9U
 for qemu-riscv@nongnu.org; Sat, 31 Oct 2026 13:09:45 -0400
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNCaM-0001Uw-OE
 for qemu-riscv@nongnu.org; Sat, 31 Oct 2026 13:09:45 -0400
Received: by mail-dl1-x1229.google.com with SMTP id
 a92af1059eb24-15dd124bbe7so1359279c88.1
 for <qemu-riscv@nongnu.org>; Sat, 31 Oct 2026 10:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793466581; x=1794071381; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+RG6AwrbAc3DBcsycdxRaw/qTZXpuCetdZ3GmPTCm+o=;
 b=BjBrX+NWlSN8KATXHP1KIpVLeRpv6Qs7Oz7joNUs6tp9PxTe1G1HSVDUtEnIw+Cuqf
 YI9T3wM+zabvplmBKs8FAuraA2ub2tR7MSz/AoNyckD8lWDCJ9u8riGv/pMqzD+M7h+K
 yINnB8Z1nE5/tu3Xkg3tHhYdhh+0hlIMd3amg1NbxS+0xBw2gkszSWHTKHLSX1KdKek2
 gWt1LGNiuFRSBfXPKXxwiTiM+CxDbV1/kSrdygQPP66o8tXQ3vwZRYg7VOurc+Mfvm5Q
 ASZ3vbiXWLpJi/gJzjB5fab5A/sSbKnmwn3SLwUvP8q9M36MHMKBKW43FjvtOlm0Xql8
 ARRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793466581; x=1794071381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+RG6AwrbAc3DBcsycdxRaw/qTZXpuCetdZ3GmPTCm+o=;
 b=ICIa6NASy5tHYwS726sPpR4J2pnVj0xj4BdMvwkaos6aKQ7soWIlJ0///rrFwaQ3cB
 KUXwum9PTQ6F/uebRK+PyfKLViCcdLqVS5ZkIkLrHrBqhyuSoIWapeHSEzCWQ6Ne82Kl
 dqvzCO4KfN9hc1/jCSqTyvS6ms9ad61aTBpyqNBd9nYCSLtLzRrwz76Y/YURLbsWY/0O
 oYiwwIkixpbCUMePsPGwIku7kyoEx9JIv6wi3ZlaEAX5zzF+hTfGDDBwPH2SxXuWU3Dy
 Po9Zcn4q59NHeZ5f4gi+xg98gupnEfl3XT7sVHvKJzAPygGn/7yCuZvf3TDYub4lXsUG
 YjAg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw7f18CbXJq7Nau5f5C9li/nsewGuzZsJJ3r4b2xiFnUCeoF+msO9Z2YV2ybwa2BqujdO6Q9g4Ylz4M@nongnu.org
X-Gm-Message-State: AFq9FYJIyxo7qnUSLMfn5yAi12kPW6pDfCV/X2ufiam4e0HO0DSt9/m5
 Tz2coQnKeC3g5HWXt3EZj/SlYmpQXh4gzOM3RqLJZxiq71PxNJwfDM79
X-Gm-Gg: AYBFou2pjBOJliGq1Lj+xHnSn1XP7Fu66y+Lu0odxSXelFVRimf92Jlt2lCO8lCyQfY
 M72vX6MPo7FFNT2MDW5pMPHkRLNZ1algvlHWMuvFf0atGXYzprSJ0817F3oe992Z0Sz0z7l2DBc
 SMr6rFAo/4W/XJfARSupB54p6jtO4IqQZuvZMgRkVSLjVjZ9gNS3w2YHcvM8oIDHgtUF7dFDSjz
 ATPEQ4GGvTHzqUaLlQEYmuLVbtHXNlurUklr4wqPrxrrxr92okI/FlcEMuXLYSx90rnYGMbdB6I
 EptFpgx9BDE4kFg3FK1v+T+McHhegOBZYq4DcLMKxA7Hqg8MXEqg1XATUCHqDHzfnsctOHM2xZb
 X5ZaoLT/qmuk8OMi3YjNnwdOJJW30TvlXi5cL/4Si7hNvnLGkq7u+DT+TqTgqCQrYJvE0tbCbD6
 qlB3DnUrplxMAyoWMWAL7tKtvpHHL4BGF8b0ZS78PK2JT0//snSS0bKLEI2VeOXEA94mbykSyRZ
 IlUBBkXRhUxadgNuO1ioueht6EWUykWqvp1jRFQ7PbispWcphnT+1p5P08SApO9XbQ2WBKdML6G
 vMzLQ37s1IMHbZ03FT8G9KK1aC0hxTBHQVbnG8G+E9hXLMqz
X-Received: by 2002:a05:7022:d98:b0:19e:fbee:5167 with SMTP id
 a92af1059eb24-1ac5ab53b29mr7686596c88.21.1793466581023; 
 Sat, 31 Oct 2026 10:09:41 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854da78sm23749065c88.6.2026.10.31.10.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:09:39 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>
Subject: [PATCH v3 1/3] accel: register CPU parent once per target base arch
Date: Sun,  1 Nov 2026 01:09:23 +0800
Message-ID: <20261031170925.789-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261031170925.789-1-luoyonggang@gmail.com>
References: <20261031170925.789-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1229;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move accel-$cpu_type registration into accel-cpu-target.c. System
targets whose variants share CPU_RESOLVING_TYPE (arm, riscv, sh4,
and xtensa) build that file once per TARGET_BASE_ARCH. User-mode
and every other system target compile it once per target.

test-multi-target checks that each target's accel parent exists
after QOM init.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 accel/accel-common.c           | 15 ---------------
 accel/accel-cpu-target.c       | 27 +++++++++++++++++++++++++++
 meson.build                    | 32 ++++++++++++++++++++++++++++++++
 tests/unit/test-multi-target.c | 10 ++++++++++
 4 files changed, 69 insertions(+), 15 deletions(-)
 create mode 100644 accel/accel-cpu-target.c

diff --git a/accel/accel-common.c b/accel/accel-common.c
index 00a400243f0..e7abec4a7b1 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -129,18 +129,3 @@ static const TypeInfo accel_types[] = {
 };
 
 DEFINE_TYPES(accel_types)
-
-static void register_accel_target_type(void)
-{
-    g_autofree char *name = g_strconcat("accel-", target_cpu_type(), NULL);
-    const TypeInfo accel_cpu_type = {
-        .name = name,
-        .parent = TYPE_OBJECT,
-        .abstract = true,
-        .class_size = sizeof(AccelCPUClass),
-    };
-
-    type_register_static(&accel_cpu_type);
-}
-
-type_init(register_accel_target_type);
diff --git a/accel/accel-cpu-target.c b/accel/accel-cpu-target.c
new file mode 100644
index 00000000000..ef4da5a2b61
--- /dev/null
+++ b/accel/accel-cpu-target.c
@@ -0,0 +1,27 @@
+/*
+ * Accelerator CPU parent registration.
+ *
+ * Compiled once per target. System targets for arm, riscv, sh4, and
+ * xtensa share one CPU_RESOLVING_TYPE, so those bases compile it once.
+ * The constructor is static, so more than one copy can be linked.
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "accel/accel-cpu-target.h"
+
+static void register_accel_target_type(void)
+{
+    const TypeInfo accel_cpu_type = {
+        .name = TYPE_ACCEL_CPU,
+        .parent = TYPE_OBJECT,
+        .abstract = true,
+        .class_size = sizeof(AccelCPUClass),
+    };
+
+    type_register_static(&accel_cpu_type);
+}
+
+type_init(register_accel_target_type);
diff --git a/meson.build b/meson.build
index 7ec3fb90233..2b605b373fa 100644
--- a/meson.build
+++ b/meson.build
@@ -3243,6 +3243,11 @@ config_devices_h = {}
 config_target_h = {}
 config_target_mak = {}
 config_base_arch_mak = {}
+# System targets of these bases share one CPU_RESOLVING_TYPE.
+# i386/x86_64, ppc/ppc64, mips/mips64, and sparc/sparc64 do not.
+# Once they share one name too, drop this workaround.
+config_base_arch_cpu_type = ['arm', 'riscv', 'sh4', 'xtensa']
+config_base_arch_target = {}
 config_target_info = {}
 
 disassemblers = {
@@ -3443,6 +3448,10 @@ foreach target : target_dirs
   target_base_arch = config_target['TARGET_BASE_ARCH']
   config_base_arch = config_base_arch_mak.get(target_base_arch, {}) + config_target
   config_base_arch_mak += {target_base_arch: config_base_arch}
+  if (target.endswith('-softmmu') and
+      target_base_arch in config_base_arch_cpu_type)
+    config_base_arch_target += {target_base_arch: target}
+  endif
 endforeach
 target_dirs = actual_target_dirs
 
@@ -4150,6 +4159,7 @@ common_all = static_library('common',
 target_common_arch_libs = {}
 target_common_system_arch_libs = {}
 target_stubs_arch_libs = {}
+target_cpu_libs = {}
 foreach target_base_arch, config_base_arch : config_base_arch_mak
   target_inc = [include_directories('target' / target_base_arch)]
   inc = [common_user_inc + target_inc]
@@ -4219,6 +4229,23 @@ foreach target_base_arch, config_base_arch : config_base_arch_mak
                          c_args: target_system_c_args)
     target_stubs_arch_libs += {target_base_arch: lib}
   endif
+
+  if target_base_arch in config_base_arch_target
+    accel_target = config_base_arch_target[target_base_arch]
+    target_cpu_libs += {
+      target_base_arch: static_library(
+        'accel-cpu-type-' + target_base_arch,
+        files('accel/accel-cpu-target.c'),
+        config_target_h[accel_target],
+        genh,
+        build_by_default: false,
+        include_directories: inc,
+        c_args: ['-DCOMPILING_PER_TARGET',
+                 '-DCONFIG_TARGET="@0@-config-target.h"'.format(accel_target),
+                 '-DTARGET_ARCH_PREFIX=target_' + target_base_arch.to_lower()],
+        dependencies: common_deps + system_deps)
+    }
+  endif
 endforeach
 
 if have_rust
@@ -4390,6 +4417,11 @@ foreach target : target_dirs
   target_common = common_ss.apply(config_target, strict: false)
   objects = [common_all.extract_objects(target_common.sources())]
   arch_deps += target_common.dependencies()
+  if target_type == 'system' and target_base_arch in target_cpu_libs
+    objects += target_cpu_libs[target_base_arch].extract_all_objects(recursive: false)
+  else
+    arch_srcs += files('accel/accel-cpu-target.c')
+  endif
   if target_base_arch in target_common_arch_libs
     src = target_common_arch[target_base_arch].apply(config_target, strict: false)
     lib = target_common_arch_libs[target_base_arch]
diff --git a/tests/unit/test-multi-target.c b/tests/unit/test-multi-target.c
index c7559827a08..0f0aff0d7d2 100644
--- a/tests/unit/test-multi-target.c
+++ b/tests/unit/test-multi-target.c
@@ -30,6 +30,13 @@
 /* stub for system/main.c */
 int (*qemu_main)(void);
 
+static void test_accel_cpu_parent(const TargetInfo *ti)
+{
+    g_autofree char *name = g_strconcat("accel-", ti->cpu_type, NULL);
+
+    g_assert_nonnull(object_class_by_name(name));
+}
+
 static void test_qom_types_are_unique(const void *data)
 {
     const TargetInfo *ti = data;
@@ -49,6 +56,9 @@ static void test_qom_types_are_unique(const void *data)
     module_call_init(MODULE_INIT_QOM);
     /* trigger type_initialize for all types */
     object_class_get_list("", false);
+
+    /* Accel parent lookup depends on the QOM types above being unique. */
+    test_accel_cpu_parent(ti);
 }
 
 int main(int argc, char **argv)
-- 
2.55.0.windows.3


