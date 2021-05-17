Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liar7-0004s5-Lk
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liar5-0004kU-MM; Mon, 17 May 2021 06:52:11 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liar3-0006VY-IX; Mon, 17 May 2021 06:52:11 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 h3-20020a05600c3503b0290176f13c7715so1692899wmq.5; 
 Mon, 17 May 2021 03:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QHwci2qixAR5d1Isgklmt+j6/VrQrgpHFVrFxfi8kA4=;
 b=hIjZiZywwjEOcyj3lWCEIVxY2rgQexMxS5BUVk0N/okR18/OkYkOV+OzpxtT4UL1/D
 sKt/sCKaBcz0A/VTzwVVXEkLweJUbuzTNHAqRoSdzkZ9rArDRn7TDnvwU2BmCB7uhHWA
 +7YxE09SyPop1dSoLWvjKvXpNOYhxWfHsD+uFqbe2PfmzEz/MEcl/cakjDoD9Rqz1gh1
 NI1Ljx1+skuBFZJcvBRZFb4ynOaobAXiQrRsmOC2qmpJ2TsD2ji5Xp49qW3W13HTSEIy
 1Kz88IE+bzDgEVSYsJJwm90C0E6tBsPaIiPWc/S3yU3ubITIsy0ApFBCyNbxIrGU2lJn
 lDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QHwci2qixAR5d1Isgklmt+j6/VrQrgpHFVrFxfi8kA4=;
 b=hgbxV0ivyNjXvz4f9UvRHwU5O4w4fpBq49nC3e0nUNT4lIh31xW25T8C/34UbqTBul
 IW/P+9zFGrlE/c7jZcHZRiYdJq33DTNcc9zWtGTVNzwRRWYhDhoJdbXR+IjEpUS5eIxa
 XFPWyb0TUd/T33QP3ZU8j7qdcCf5ngbsTgWQP6Y4yey5WjRwzDc8DXj5TuzTvIhZ96jm
 NnGWj1lGi0SvKgcospGTtnQr7q70pyLjmihBa0+Nbrj5kX0SS0ykGzve6eIGr32iEMxN
 fFxZooMm+WxsB9jdAnzEAzS6e1ZcIcAO7XPbuDbNF+wIZSJcVmJh0y9esTp0FKLbMtzd
 m8OA==
X-Gm-Message-State: AOAM533HkvC/3Zo7skBtnE6HW+B3tCTowd+aBMHDVn5IiORXaTzVXsXC
 Z05Y8+IPVPR47KvDpJDjnhVkjp1VfVLG4w==
X-Google-Smtp-Source: ABdhPJzRoEu3JEhowL2N3n+rfMlRNV1PdYfrNH7GONxkoN3BUs+C4cakf4LjaYQUnaQIVHxL3I8iaQ==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr9174015wmi.125.1621248726537; 
 Mon, 17 May 2021 03:52:06 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r11sm10990297wrp.46.2021.05.17.03.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:52:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 05/23] cpu: Split as cpu-common / cpu-sysemu
Date: Mon, 17 May 2021 12:51:22 +0200
Message-Id: <20210517105140.1062037-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 May 2021 10:52:12 -0000

The current cpu.c contains sysemu-specific methods.
To avoid building them in user-mode builds, split the
current cpu.c as cpu-common.c / cpu-sysemu.c.

Start by moving cpu_get_crash_info().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/{cpu.c => cpu-common.c} | 17 -----------------
 hw/core/cpu-sysemu.c            | 34 +++++++++++++++++++++++++++++++++
 hw/core/meson.build             |  3 ++-
 3 files changed, 36 insertions(+), 18 deletions(-)
 rename hw/core/{cpu.c => cpu-common.c} (96%)
 create mode 100644 hw/core/cpu-sysemu.c

diff --git a/hw/core/cpu.c b/hw/core/cpu-common.c
similarity index 96%
rename from hw/core/cpu.c
rename to hw/core/cpu-common.c
index 919dc3435a3..ddddf4b10eb 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu-common.c
@@ -190,23 +190,6 @@ static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
     return target_words_bigendian();
 }
 
-/*
- * XXX the following #if is always true because this is a common_ss
- * module, so target CONFIG_* is never defined.
- */
-#if !defined(CONFIG_USER_ONLY)
-GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    GuestPanicInformation *res = NULL;
-
-    if (cc->get_crash_info) {
-        res = cc->get_crash_info(cpu);
-    }
-    return res;
-}
-#endif
-
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
new file mode 100644
index 00000000000..f517ef5d460
--- /dev/null
+++ b/hw/core/cpu-sysemu.c
@@ -0,0 +1,34 @@
+/*
+ * QEMU CPU model (system emulation specific)
+ *
+ * Copyright (c) 2012-2014 SUSE LINUX Products GmbH
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/core/cpu.h"
+
+GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    GuestPanicInformation *res = NULL;
+
+    if (cc->get_crash_info) {
+        res = cc->get_crash_info(cpu);
+    }
+    return res;
+}
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 59f1605bb07..18f44fb7c24 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -13,7 +13,7 @@
   'qdev-clock.c',
 )
 
-common_ss.add(files('cpu.c'))
+common_ss.add(files('cpu-common.c'))
 common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
 common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
 common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
@@ -25,6 +25,7 @@
 common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
 
 softmmu_ss.add(files(
+  'cpu-sysemu.c',
   'fw-path-provider.c',
   'loader.c',
   'machine-hmp-cmds.c',
-- 
2.26.3


