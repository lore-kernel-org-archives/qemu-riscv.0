Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63185C4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 20:08:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qz0RC-0004wR-8W; Fri, 03 Nov 2023 16:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0RA-0004gh-Dt
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:06:36 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0Qr-00070l-Qj
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:06:35 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4084b0223ccso18144705e9.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 13:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699041976; x=1699646776; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=irSpAQbacIjAn4tboyPxxEXP8GwQwy4xoP2FBlrokWA=;
 b=CL17HGF2hU2mxc3ZxvIiciDoZSUgd9KcAx5I+kWKHOTlyRedcF6cddEZoX/WmIlbvC
 SOSwNfG9qYtv1Gp37xnjLW+S+E/GJ4TUysH3hDsOKnFlzUbmS8DdYzZJX6n72NSotAam
 7tIrdQMd5breXeTPcq3WHoaqF6oNLwDK+prDYzHf8yEziRXBRELo5KNSnm8A4Z90JZ5m
 Wz/agTQoqt92Y5xnWyQw74yjMn1XIIcLtkRrMiHZKp8ML96L/ladZNPiGvYIwv8ple0z
 Ln6TTbWRhKzQg2nipH2zuHWmrMUDaN3RLWgdETT/vODpD+P2WM5SBiYzCVZRLh2yxoWZ
 fhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699041976; x=1699646776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=irSpAQbacIjAn4tboyPxxEXP8GwQwy4xoP2FBlrokWA=;
 b=KIV+xj1INZTLhQwtkodUpRvzo/IQzAaJEMqA3L1JPcPkxGATWcAuJWLUGk9L2iqkP2
 ove1GddkIfx0P76pRNWD6iG8hfAUYIzjIovfAz3pfzj+nBW2V+XnVIyO5tW+GFleT3nk
 HKQ856cU+BrBYXGf39sKnumE45DBOdmI/US+RVHQBH/1HpUsOqy9WgfbIzSlVfr44mgn
 FlaIx16+KQvZOI04/k9gZluyo6HRoREHhSl5sjsEjQCOAhavRK2v1pyFHWQDcBiCFoa9
 EBzw5F6vtidV613SseYVg4Evo/ETthc0o8sqJGAXYwXOObqHXVc43AwkUtYos4injxcy
 V1Rg==
X-Gm-Message-State: AOJu0YzqaMhbuIbgMSeYJ10veiJ1ywciurqpou7rqhJxoUnbtDBSbNbt
 rIZJ8p4WVKMlYYcfXjvgUlY9Vg==
X-Google-Smtp-Source: AGHT+IHHhMuKNdPg+AOCkbwjwLrPAympsT3P7t8FqW+Pd5C9VDf8Qv0/LUdILGkIddTJdUJY15cM1A==
X-Received: by 2002:adf:e590:0:b0:31f:d2dc:df26 with SMTP id
 l16-20020adfe590000000b0031fd2dcdf26mr15669864wrm.28.1699041971325; 
 Fri, 03 Nov 2023 13:06:11 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 k12-20020adff28c000000b0032f99801273sm2613842wro.66.2023.11.03.13.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 13:06:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A709E65757;
 Fri,  3 Nov 2023 19:59:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Brian Cain <bcain@quicinc.com>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Greg Manning <gmanning@rapitasystems.com>
Subject: [PATCH 27/29] plugins: make test/example plugins work on windows
Date: Fri,  3 Nov 2023 19:59:54 +0000
Message-Id: <20231103195956.1998255-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Greg Manning <gmanning@rapitasystems.com>

Generate a qemu_plugin_api.lib delay import lib on windows, for
windows qemu plugins to link against.

Implement an example dll load fail hook to link up the API functions
correctly when a plugin is loaded on windows.

Update the build scripts for the test and example plugins to use these
things.

Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231102172053.17692-3-gmanning@rapitasystems.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                      |  3 +++
 contrib/plugins/win32_linker.c | 34 ++++++++++++++++++++++++++++++++++
 contrib/plugins/Makefile       | 20 ++++++++++++++++----
 plugins/meson.build            | 17 +++++++++++++++++
 tests/plugin/meson.build       | 14 +++++++++++---
 5 files changed, 81 insertions(+), 7 deletions(-)
 create mode 100644 contrib/plugins/win32_linker.c

diff --git a/configure b/configure
index f1456f6123..04f2cdd166 100755
--- a/configure
+++ b/configure
@@ -1662,6 +1662,9 @@ echo "CFLAGS=${CFLAGS-$default_cflags} $EXTRA_CFLAGS" >> contrib/plugins/$config
 if test "$targetos" = darwin; then
   echo "CONFIG_DARWIN=y" >> contrib/plugins/$config_host_mak
 fi
+if test "$targetos" = windows; then
+  echo "CONFIG_WIN32=y" >> contrib/plugins/$config_host_mak
+fi
 
 # tests/tcg configuration
 (config_host_mak=tests/tcg/config-host.mak
diff --git a/contrib/plugins/win32_linker.c b/contrib/plugins/win32_linker.c
new file mode 100644
index 0000000000..50797d616e
--- /dev/null
+++ b/contrib/plugins/win32_linker.c
@@ -0,0 +1,34 @@
+/*
+ * Copyright (C) 2023, Greg Manning <gmanning@rapitasystems.com>
+ *
+ * This hook, __pfnDliFailureHook2, is documented in the microsoft documentation here:
+ * https://learn.microsoft.com/en-us/cpp/build/reference/error-handling-and-notification
+ * It gets called when a delay-loaded DLL encounters various errors.
+ * We handle the specific case of a DLL looking for a "qemu.exe",
+ * and give it the running executable (regardless of what it is named).
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ */
+
+#include <Windows.h>
+#include <delayimp.h>
+
+FARPROC WINAPI dll_failure_hook(unsigned dliNotify, PDelayLoadInfo pdli);
+
+
+PfnDliHook __pfnDliFailureHook2 = dll_failure_hook;
+
+FARPROC WINAPI dll_failure_hook(unsigned dliNotify, PDelayLoadInfo pdli) {
+    if (dliNotify == dliFailLoadLib) {
+        /* If the failing request was for qemu.exe, ... */
+        if (strcmp(pdli->szDll, "qemu.exe") == 0) {
+            /* Then pass back a pointer to the top level module. */
+            HMODULE top = GetModuleHandle(NULL);
+            return (FARPROC) top;
+        }
+    }
+    /* Otherwise we can't do anything special. */
+    return 0;
+}
+
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 8ba78c7a32..751fa38619 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -22,7 +22,14 @@ NAMES += hwprofile
 NAMES += cache
 NAMES += drcov
 
-SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
+ifeq ($(CONFIG_WIN32),y)
+SO_SUFFIX := .dll
+LDLIBS += $(shell $(PKG_CONFIG) --libs glib-2.0)
+else
+SO_SUFFIX := .so
+endif
+
+SONAMES := $(addsuffix $(SO_SUFFIX),$(addprefix lib,$(NAMES)))
 
 # The main QEMU uses Glib extensively so it's perfectly fine to use it
 # in plugins (which many example do).
@@ -35,15 +42,20 @@ all: $(SONAMES)
 %.o: %.c
 	$(CC) $(CFLAGS) $(PLUGIN_CFLAGS) -c -o $@ $<
 
-lib%.so: %.o
-ifeq ($(CONFIG_DARWIN),y)
+ifeq ($(CONFIG_WIN32),y)
+lib%$(SO_SUFFIX): %.o win32_linker.o ../../plugins/qemu_plugin_api.lib
+	$(CC) -shared -o $@ $^ $(LDLIBS)
+else ifeq ($(CONFIG_DARWIN),y)
+lib%$(SO_SUFFIX): %.o
 	$(CC) -bundle -Wl,-undefined,dynamic_lookup -o $@ $^ $(LDLIBS)
 else
+lib%$(SO_SUFFIX): %.o
 	$(CC) -shared -o $@ $^ $(LDLIBS)
 endif
 
+
 clean:
-	rm -f *.o *.so *.d
+	rm -f *.o *$(SO_SUFFIX) *.d
 	rm -Rf .libs
 
 .PHONY: all clean
diff --git a/plugins/meson.build b/plugins/meson.build
index 71ed996ed3..8ed9fa270c 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -14,6 +14,23 @@ if not enable_modules
 endif
 
 if get_option('plugins')
+  if targetos == 'windows'
+    # Generate a .lib file for plugins to link against.
+    # First, create a .def file listing all the symbols a plugin should expect to have
+    # available in qemu
+    win32_plugin_def = configure_file(
+      input: files('qemu-plugins.symbols'),
+      output: 'qemu_plugin_api.def',
+      capture: true,
+      command: ['sed', '-e', '0,/^/s//EXPORTS/; s/[{};]//g', '@INPUT@'])
+    # then use dlltool to assemble a delaylib.
+    win32_qemu_plugin_api_lib = configure_file(
+      input: win32_plugin_def,
+      output: 'qemu_plugin_api.lib',
+      command: ['dlltool', '--input-def', '@INPUT@',
+                '--output-delaylib', '@OUTPUT@', '--dllname', 'qemu.exe']
+    )
+  endif
   specific_ss.add(files(
     'loader.c',
     'core.c',
diff --git a/tests/plugin/meson.build b/tests/plugin/meson.build
index 322cafcdf6..528bb9d86c 100644
--- a/tests/plugin/meson.build
+++ b/tests/plugin/meson.build
@@ -1,9 +1,17 @@
 t = []
 if get_option('plugins')
   foreach i : ['bb', 'empty', 'insn', 'mem', 'syscall']
-    t += shared_module(i, files(i + '.c'),
-                       include_directories: '../../include/qemu',
-                       dependencies: glib)
+    if targetos == 'windows'
+      t += shared_module(i, files(i + '.c') + '../../contrib/plugins/win32_linker.c',
+                        include_directories: '../../include/qemu',
+                        objects: [win32_qemu_plugin_api_lib],
+                        dependencies: glib)
+
+    else
+      t += shared_module(i, files(i + '.c'),
+                        include_directories: '../../include/qemu',
+                        dependencies: glib)
+    endif
   endforeach
 endif
 if t.length() > 0
-- 
2.39.2


