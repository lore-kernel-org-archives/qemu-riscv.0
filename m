Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75863C001B3
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 18:35:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGOLm-0007iH-DJ; Mon, 03 Jul 2023 14:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOLl-0007hk-FS
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:37 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOLj-0000JR-Ia
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:37 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc54cab6fso39501795e9.0
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 11:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688409154; x=1691001154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a2jBqwLYTVPATDHfEQY0x1Pdqr8EcmmmZ1uz1yNnpOk=;
 b=KRVWgYdroOLbfrpPlUEnPovRCeX/FnRYQy/HWjU85fZZnVwhhgrGD93/umv5cknqf5
 Vi6uJtFniwaPdV4SZpUzJNODrc0jLtp5TwHh6BKgwuT2nhCS/5bwjL4SC1LS0R0DMz2R
 BfTmeccdQtFqSNKl4SfGzURhSiMkf88h6lKDAe6Od1DlEnn0CT41RO5hJv5dg4cAAukO
 2kbrS8ToE+/vO5HvUwTMyWW6p0wZpr9L0e3Dvy59+il/cDt6ECVzUyeKTPPYzUGfsBlm
 z5GRBEA6+nyojYOJ9MDdnqOnFzqDl1moJrBnscfaulNWsBGzG/s3g1f09a1zRHGgyxui
 BF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688409154; x=1691001154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a2jBqwLYTVPATDHfEQY0x1Pdqr8EcmmmZ1uz1yNnpOk=;
 b=OHEvTlofEVrGXgBpY7r9iIMVdrr8BxsH24AjqC+y4GvtFumY2MK7gkEEnxqyrRqmXa
 IyXMe5TcP2y/ZqMjpt9Rm/VY9NJL4V/MHK9d473FtFjxPxK3zGt+t7bUPPLlbDZo/XE5
 xNmPzHOAbO7hJc4qRDxEM/N6jiwUPh2BS2YygTKYC5bgWfp1DUG453icAAXoNRTnoShr
 eChQ9RFq6IgJJKr+T1bgavS+NA6SIks81hgvQpsbQnrhgl7iPg+Zz6PCbct5/FAWZc7Z
 gg13HPjh1hhC2XZOopH4X3IEeE2bq4rO3iNzMec7/VfinbVpeAm+OOtyBbtQKtWDkkzw
 KgJA==
X-Gm-Message-State: AC+VfDwdpsLYRdjHr3vfpSpUUDiuidaD9k7NDyug+k8M6YEoBRFw4TU7
 oyXVXCw57s1VaRo3Xmt4xvHj9A==
X-Google-Smtp-Source: ACHHUZ5zsZoIjEv2zUIgeh7IU0oTrQdTcvHZIhRm+EzuqA+11ODSRm/jzYdF4Mvd9Kiyhesq/x7DQw==
X-Received: by 2002:a7b:ce16:0:b0:3fb:b1bf:7df3 with SMTP id
 m22-20020a7bce16000000b003fbb1bf7df3mr8758013wmc.16.1688409154345; 
 Mon, 03 Jul 2023 11:32:34 -0700 (PDT)
Received: from localhost.localdomain ([176.176.178.91])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c214400b003fa95890484sm23095216wml.20.2023.07.03.11.32.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Jul 2023 11:32:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 07/16] target/riscv: Move TCG-specific files to
 target/riscv/tcg/
Date: Mon,  3 Jul 2023 20:31:36 +0200
Message-Id: <20230703183145.24779-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230703183145.24779-1-philmd@linaro.org>
References: <20230703183145.24779-1-philmd@linaro.org>
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

Move TCG-specific files to the a new 'tcg' sub-directory. Add
stubs for riscv_cpu_[get/set]_fflags and riscv_raise_exception().
Adapt meson rules.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/{ => tcg}/XVentanaCondOps.decode |  0
 target/riscv/{ => tcg}/insn16.decode          |  0
 target/riscv/{ => tcg}/insn32.decode          |  0
 target/riscv/{ => tcg}/xthead.decode          |  0
 target/riscv/{ => tcg}/bitmanip_helper.c      |  0
 target/riscv/{ => tcg}/crypto_helper.c        |  0
 target/riscv/{ => tcg}/fpu_helper.c           |  0
 target/riscv/{ => tcg}/m128_helper.c          |  0
 target/riscv/{ => tcg}/op_helper.c            |  0
 target/riscv/tcg/tcg-stub.c                   | 25 +++++++++++++++++++
 target/riscv/{ => tcg}/translate.c            |  0
 target/riscv/{ => tcg}/vector_helper.c        |  0
 target/riscv/{ => tcg}/zce_helper.c           |  0
 target/riscv/meson.build                      | 18 +------------
 target/riscv/tcg/meson.build                  | 19 ++++++++++++++
 15 files changed, 45 insertions(+), 17 deletions(-)
 rename target/riscv/{ => tcg}/XVentanaCondOps.decode (100%)
 rename target/riscv/{ => tcg}/insn16.decode (100%)
 rename target/riscv/{ => tcg}/insn32.decode (100%)
 rename target/riscv/{ => tcg}/xthead.decode (100%)
 rename target/riscv/{ => tcg}/bitmanip_helper.c (100%)
 rename target/riscv/{ => tcg}/crypto_helper.c (100%)
 rename target/riscv/{ => tcg}/fpu_helper.c (100%)
 rename target/riscv/{ => tcg}/m128_helper.c (100%)
 rename target/riscv/{ => tcg}/op_helper.c (100%)
 create mode 100644 target/riscv/tcg/tcg-stub.c
 rename target/riscv/{ => tcg}/translate.c (100%)
 rename target/riscv/{ => tcg}/vector_helper.c (100%)
 rename target/riscv/{ => tcg}/zce_helper.c (100%)
 create mode 100644 target/riscv/tcg/meson.build

diff --git a/target/riscv/XVentanaCondOps.decode b/target/riscv/tcg/XVentanaCondOps.decode
similarity index 100%
rename from target/riscv/XVentanaCondOps.decode
rename to target/riscv/tcg/XVentanaCondOps.decode
diff --git a/target/riscv/insn16.decode b/target/riscv/tcg/insn16.decode
similarity index 100%
rename from target/riscv/insn16.decode
rename to target/riscv/tcg/insn16.decode
diff --git a/target/riscv/insn32.decode b/target/riscv/tcg/insn32.decode
similarity index 100%
rename from target/riscv/insn32.decode
rename to target/riscv/tcg/insn32.decode
diff --git a/target/riscv/xthead.decode b/target/riscv/tcg/xthead.decode
similarity index 100%
rename from target/riscv/xthead.decode
rename to target/riscv/tcg/xthead.decode
diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/tcg/bitmanip_helper.c
similarity index 100%
rename from target/riscv/bitmanip_helper.c
rename to target/riscv/tcg/bitmanip_helper.c
diff --git a/target/riscv/crypto_helper.c b/target/riscv/tcg/crypto_helper.c
similarity index 100%
rename from target/riscv/crypto_helper.c
rename to target/riscv/tcg/crypto_helper.c
diff --git a/target/riscv/fpu_helper.c b/target/riscv/tcg/fpu_helper.c
similarity index 100%
rename from target/riscv/fpu_helper.c
rename to target/riscv/tcg/fpu_helper.c
diff --git a/target/riscv/m128_helper.c b/target/riscv/tcg/m128_helper.c
similarity index 100%
rename from target/riscv/m128_helper.c
rename to target/riscv/tcg/m128_helper.c
diff --git a/target/riscv/op_helper.c b/target/riscv/tcg/op_helper.c
similarity index 100%
rename from target/riscv/op_helper.c
rename to target/riscv/tcg/op_helper.c
diff --git a/target/riscv/tcg/tcg-stub.c b/target/riscv/tcg/tcg-stub.c
new file mode 100644
index 0000000000..dfe42ae2ac
--- /dev/null
+++ b/target/riscv/tcg/tcg-stub.c
@@ -0,0 +1,25 @@
+/*
+ * QEMU RISC-V TCG stubs
+ *
+ * Copyright (c) 2023 Linaro
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+
+target_ulong riscv_cpu_get_fflags(CPURISCVState *env)
+{
+    g_assert_not_reached();
+}
+
+void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong)
+{
+    g_assert_not_reached();
+}
+
+G_NORETURN void riscv_raise_exception(CPURISCVState *env,
+                                      uint32_t exception, uintptr_t pc)
+{
+    g_assert_not_reached();
+}
diff --git a/target/riscv/translate.c b/target/riscv/tcg/translate.c
similarity index 100%
rename from target/riscv/translate.c
rename to target/riscv/tcg/translate.c
diff --git a/target/riscv/vector_helper.c b/target/riscv/tcg/vector_helper.c
similarity index 100%
rename from target/riscv/vector_helper.c
rename to target/riscv/tcg/vector_helper.c
diff --git a/target/riscv/zce_helper.c b/target/riscv/tcg/zce_helper.c
similarity index 100%
rename from target/riscv/zce_helper.c
rename to target/riscv/tcg/zce_helper.c
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 8967dfaded..8ef47f43f9 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -1,34 +1,18 @@
-# FIXME extra_args should accept files()
-gen = [
-  decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
-  decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
-  decodetree.process('xthead.decode', extra_args: '--static-decode=decode_xthead'),
-  decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
-]
-
 riscv_ss = ss.source_set()
 riscv_system_ss = ss.source_set()
 
-riscv_ss.add(gen)
 riscv_ss.add(files(
   'cpu.c',
   'cpu_helper.c',
   'csr.c',
-  'fpu_helper.c',
   'gdbstub.c',
-  'op_helper.c',
-  'vector_helper.c',
-  'bitmanip_helper.c',
-  'translate.c',
-  'm128_helper.c',
-  'crypto_helper.c',
-  'zce_helper.c'
 ))
 
 riscv_system_ss.add(files(
   'debug.c',
 ))
 
+subdir('tcg')
 subdir('sysemu')
 
 target_arch += {'riscv': riscv_ss}
diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
new file mode 100644
index 0000000000..65670493b1
--- /dev/null
+++ b/target/riscv/tcg/meson.build
@@ -0,0 +1,19 @@
+# FIXME extra_args should accept files()
+gen = [
+  decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
+  decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
+  decodetree.process('xthead.decode', extra_args: '--static-decode=decode_xthead'),
+  decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
+]
+riscv_ss.add(when: 'CONFIG_TCG', if_true: gen)
+
+riscv_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'fpu_helper.c',
+  'op_helper.c',
+  'vector_helper.c',
+  'bitmanip_helper.c',
+  'translate.c',
+  'm128_helper.c',
+  'crypto_helper.c',
+  'zce_helper.c',
+), if_false: files('tcg-stub.c'))
-- 
2.38.1


