Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2E9CD610D
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:46:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qptM4-0001P6-J5; Mon, 09 Oct 2023 12:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptKK-00067W-6i
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:53 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptJj-0001ay-OA
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:51 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-405417465aaso45802765e9.1
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 09:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696869674; x=1697474474; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AWA+klmfy/TO5hWaoCvOZgcBSQ2FgQ8iT7JhCCX/n5c=;
 b=kDIxXYYs9DPP4a3eQzE/wyi4bki3llBOu8sDpq9GRUPgYwVeCK8THzArnbfpTsRdQI
 zESHqU9YJsqANpKp+dOpgNjg6NnzUoQ1nedJ36SH0XzIIXncE9r8XR7JvqWh2gpHklS7
 eebEBywKCBTcmWNS5/FSqwObCFBOojXURnnC3Kq2MxQkLi4odRVFnmI3mXlBZ0N9rB/Q
 JWIP6j0Y9+dl3T4DRZ1xmFxg1B9xY/84jHyNQf1sv3RA5adP90q9Ev9GJTKUf0g6274g
 iX7URgM+GB3LLOu10ho2GxJeD5Jmx5CbVww0QAmAff4km9cTGvqoAnLrAAmzyEGZrieH
 xU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696869674; x=1697474474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AWA+klmfy/TO5hWaoCvOZgcBSQ2FgQ8iT7JhCCX/n5c=;
 b=ZELkd6Lthl9HAJDUJBPApSUbMQfk0N7ETIYb21NYlxpb9UePr4Dz8anev/IjroB2lc
 Fx2bfx+ftbJe4pejNiA30/pYXiWIVH4WJdbxIih5fN7MWBp47keKLYdr785J5S28g6Yi
 m95Ll+Un3d3SWGfpHmPnBU09cV3W61ibCi/xTOYCQzt8PsXR4qOV8WugAelgo3ZqsIse
 pv1hYpdJ87vUEKZ29TAAD30ergU+EBAKbb9JfHspb/88sn0woJ0z71zA8wVp5pMFGSDg
 Ysc9ViZ9J+NYNIq9wZ3aZ2wkowMkZdTcJETwqzoHsUCoY9/X3xWyN5W9Rr7i3671B0Ud
 PrvA==
X-Gm-Message-State: AOJu0YwHcua8VLay4DmwpsqXuNFmPMt/MBp9WJSjDns1dqbhFnjHrOcm
 Y64xynAGPh34auzfAPdcxYSyDw==
X-Google-Smtp-Source: AGHT+IG/sxU7fGhVn1O8NO7emhZfxzgF0gMb8y8KpPKDSyH6HPgH6a71j+jy7flA7ZdOuAW4Um+feA==
X-Received: by 2002:a1c:721a:0:b0:405:1baf:cedf with SMTP id
 n26-20020a1c721a000000b004051bafcedfmr14386876wmc.24.1696869673801; 
 Mon, 09 Oct 2023 09:41:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a05600c214500b003fbe791a0e8sm11713158wml.0.2023.10.09.09.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:41:11 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 849FE1FFC5;
 Mon,  9 Oct 2023 17:41:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 12/25] gdbstub: Introduce GDBFeature structure
Date: Mon,  9 Oct 2023 17:40:51 +0100
Message-Id: <20231009164104.369749-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

Before this change, the information from a XML file was stored in an
array that is not descriptive. Introduce a dedicated structure type to
make it easier to understand and to extend with more fields.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230912224107.29669-6-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS             |  2 +-
 meson.build             |  2 +-
 include/exec/gdbstub.h  |  9 ++++--
 gdbstub/gdbstub.c       |  6 ++--
 stubs/gdbstub.c         |  6 ++--
 scripts/feature_to_c.py | 48 ++++++++++++++++++++++++++++
 scripts/feature_to_c.sh | 69 -----------------------------------------
 7 files changed, 63 insertions(+), 79 deletions(-)
 create mode 100755 scripts/feature_to_c.py
 delete mode 100644 scripts/feature_to_c.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index ea91f9e804..0f421a0a03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2836,7 +2836,7 @@ F: include/exec/gdbstub.h
 F: include/gdbstub/*
 F: gdb-xml/
 F: tests/tcg/multiarch/gdbstub/
-F: scripts/feature_to_c.sh
+F: scripts/feature_to_c.py
 F: scripts/probe-gdb-support.py
 
 Memory API
diff --git a/meson.build b/meson.build
index 3bb64b536c..9f4c4f2f1e 100644
--- a/meson.build
+++ b/meson.build
@@ -3693,7 +3693,7 @@ common_all = static_library('common',
                             dependencies: common_all.dependencies(),
                             name_suffix: 'fa')
 
-feature_to_c = find_program('scripts/feature_to_c.sh')
+feature_to_c = find_program('scripts/feature_to_c.py')
 
 if targetos == 'darwin'
   entitlement = find_program('scripts/entitlement.sh')
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 16a139043f..705be2c5d7 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -10,6 +10,11 @@
 #define GDB_WATCHPOINT_READ      3
 #define GDB_WATCHPOINT_ACCESS    4
 
+typedef struct GDBFeature {
+    const char *xmlname;
+    const char *xml;
+} GDBFeature;
+
 
 /* Get or set a register.  Returns the size of the register.  */
 typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int reg);
@@ -48,7 +53,7 @@ void gdb_set_stop_cpu(CPUState *cpu);
  */
 bool gdb_has_xml(void);
 
-/* in gdbstub-xml.c, generated by scripts/feature_to_c.sh */
-extern const char *const xml_builtin[][2];
+/* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
+extern const GDBFeature gdb_static_features[];
 
 #endif
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 4f3762fccf..bba2640293 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -408,11 +408,11 @@ static const char *get_feature_xml(const char *p, const char **newp,
         }
     }
     /* Is it one of the encoded gdb-xml/ files? */
-    for (int i = 0; xml_builtin[i][0]; i++) {
-        const char *name = xml_builtin[i][0];
+    for (int i = 0; gdb_static_features[i].xmlname; i++) {
+        const char *name = gdb_static_features[i].xmlname;
         if ((strncmp(name, p, len) == 0) &&
             strlen(name) == len) {
-            return xml_builtin[i][1];
+            return gdb_static_features[i].xml;
         }
     }
 
diff --git a/stubs/gdbstub.c b/stubs/gdbstub.c
index 2b7aee50d3..580e20702b 100644
--- a/stubs/gdbstub.c
+++ b/stubs/gdbstub.c
@@ -1,6 +1,6 @@
 #include "qemu/osdep.h"
-#include "exec/gdbstub.h"       /* xml_builtin */
+#include "exec/gdbstub.h"       /* gdb_static_features */
 
-const char *const xml_builtin[][2] = {
-  { NULL, NULL }
+const GDBFeature gdb_static_features[] = {
+  { NULL }
 };
diff --git a/scripts/feature_to_c.py b/scripts/feature_to_c.py
new file mode 100755
index 0000000000..bcbcb83beb
--- /dev/null
+++ b/scripts/feature_to_c.py
@@ -0,0 +1,48 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os, sys
+
+def writeliteral(indent, bytes):
+    sys.stdout.write(' ' * indent)
+    sys.stdout.write('"')
+    quoted = True
+
+    for c in bytes:
+        if not quoted:
+            sys.stdout.write('\n')
+            sys.stdout.write(' ' * indent)
+            sys.stdout.write('"')
+            quoted = True
+
+        if c == b'"'[0]:
+            sys.stdout.write('\\"')
+        elif c == b'\\'[0]:
+            sys.stdout.write('\\\\')
+        elif c == b'\n'[0]:
+            sys.stdout.write('\\n"')
+            quoted = False
+        elif c >= 32 and c < 127:
+            sys.stdout.write(c.to_bytes(1, 'big').decode())
+        else:
+            sys.stdout.write(f'\{c:03o}')
+
+    if quoted:
+        sys.stdout.write('"')
+
+sys.stdout.write('#include "qemu/osdep.h"\n' \
+                 '#include "exec/gdbstub.h"\n' \
+                 '\n'
+                 'const GDBFeature gdb_static_features[] = {\n')
+
+for input in sys.argv[1:]:
+    with open(input, 'rb') as file:
+        read = file.read()
+
+    sys.stdout.write('    {\n')
+    writeliteral(8, bytes(os.path.basename(input), 'utf-8'))
+    sys.stdout.write(',\n')
+    writeliteral(8, read)
+    sys.stdout.write('\n    },\n')
+
+sys.stdout.write('    { NULL }\n};\n')
diff --git a/scripts/feature_to_c.sh b/scripts/feature_to_c.sh
deleted file mode 100644
index c1f67c8f6a..0000000000
--- a/scripts/feature_to_c.sh
+++ /dev/null
@@ -1,69 +0,0 @@
-#!/bin/sh
-
-# Convert text files to compilable C arrays.
-#
-# Copyright (C) 2007 Free Software Foundation, Inc.
-#
-# This file is part of GDB.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, see <http://www.gnu.org/licenses/>.
-
-if test -z "$1"; then
-  echo "Usage: $0 INPUTFILE..."
-  exit 1
-fi
-
-for input; do
-  arrayname=xml_feature_$(echo $input | sed 's,.*/,,; s/[-.]/_/g')
-
-  ${AWK:-awk} 'BEGIN { n = 0
-      printf "#include \"qemu/osdep.h\"\n"
-      print "static const char '$arrayname'[] = {"
-      for (i = 0; i < 255; i++)
-        _ord_[sprintf("%c", i)] = i
-    } {
-      split($0, line, "");
-      printf "  "
-      for (i = 1; i <= length($0); i++) {
-        c = line[i]
-        if (c == "'\''") {
-          printf "'\''\\'\'''\'', "
-        } else if (c == "\\") {
-          printf "'\''\\\\'\'', "
-        } else if (_ord_[c] >= 32 && _ord_[c] < 127) {
-	  printf "'\''%s'\'', ", c
-        } else {
-          printf "'\''\\%03o'\'', ", _ord_[c]
-        }
-        if (i % 10 == 0)
-          printf "\n   "
-      }
-      printf "'\''\\n'\'', \n"
-    } END {
-      print "  0 };"
-    }' < $input
-done
-
-echo
-echo '#include "exec/gdbstub.h"'
-echo "const char *const xml_builtin[][2] = {"
-
-for input; do
-  basename=$(echo $input | sed 's,.*/,,')
-  arrayname=xml_feature_$(echo $input | sed 's,.*/,,; s/[-.]/_/g')
-  echo "  { \"$basename\", $arrayname },"
-done
-
-echo "  { (char *)0, (char *)0 }"
-echo "};"
-- 
2.39.2


