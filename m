Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBFBC0015E
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 23:21:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDvW5-0004sc-Px; Mon, 26 Jun 2023 19:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDvVy-0004oD-RM
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 19:21:01 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDvVw-0000Cz-Rc
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 19:20:58 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-991b7a4d2e8so196955166b.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 16:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687821655; x=1690413655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a2jBqwLYTVPATDHfEQY0x1Pdqr8EcmmmZ1uz1yNnpOk=;
 b=aLotfzdICzBQ387oz8NSmz1yvjh4Ae+hmXmJSAf3Eim4D3ZJYxRez/M+9MQNDI8QYF
 aaW06adt5me5FQbtIcbTHKXZc2oSgVl79gWYTmZHAVJwP0e4y5sNTvZsZOTCh9lfownS
 evSYsZez/egr+6esN4TrAqBajg8VgTIeMHC9XrQjZCM5lnpqCRP0/agx90wzwa6c6t+d
 yVQsNw86ctS3TtFKbc9SV3I3bgvY/tEKJ++vcFfPz7HPCbw4nFVSfX5+4wN3w9HW8G70
 4lZzyyfpFPm5lqw0P/i5RasVk5/8NIwn0BppOStH8nJZHM7PtWH/lejOn6/AVplbk310
 XOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687821655; x=1690413655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a2jBqwLYTVPATDHfEQY0x1Pdqr8EcmmmZ1uz1yNnpOk=;
 b=FL55eYE8FyauZ9NrRpSyOL+Eb/NPPPULT/zaiFxKtYfIGRIfNzgyZ982uXduybw2fW
 OvSGGrNH9ruWjG9H2VVUQg3A+jWdMdN1/BHzMTUFchWZ6G1EUP5c4WNBXCoPvU/t+agy
 pLA2F0tA5mkQ5GbJu6tvc5NLHDSsfdHgkaS6UzP4eNsnEGwfOGJK5OZqlOpxshMh8eHW
 eTyClhuBNWG2VYQxOFrusI8lpnQi6VpUaWFONPBdftTAeEDQYyTwdmmNTyOQVy1G5TYW
 CViRsPl6rmZ7N7fd4zJXYy/jlGN3PFtZEN8Cc7wY0tLBuvi/gzUJP6JNxlqcB+T0Dl62
 fcuw==
X-Gm-Message-State: AC+VfDxeKv576HRreSKfsOrdswddagAiUMwcnwOoSrKcLLfCpkHh3zDz
 UMTZWnK0VeEl1YTJ+eIUwBARQQ==
X-Google-Smtp-Source: ACHHUZ4hgMZOq9IDjVB3MX/FhKOJMxs29F1HqXBJT899aJ/cc1QiOgXJVAEkg0BrbBEax58qLn/8WQ==
X-Received: by 2002:a17:907:a01:b0:987:fe18:1c56 with SMTP id
 bb1-20020a1709070a0100b00987fe181c56mr22405581ejc.47.1687821654702; 
 Mon, 26 Jun 2023 16:20:54 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.226])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a170906528f00b00982a352f078sm3767560ejm.124.2023.06.26.16.20.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Jun 2023 16:20:53 -0700 (PDT)
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
Subject: [PATCH 07/16] target/riscv: Move TCG-specific files to
 target/riscv/tcg/
Date: Tue, 27 Jun 2023 01:19:58 +0200
Message-Id: <20230626232007.8933-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230626232007.8933-1-philmd@linaro.org>
References: <20230626232007.8933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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


