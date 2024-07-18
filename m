Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4FFC3DA49
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 09:46:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sUNhn-00040p-Ru; Thu, 18 Jul 2024 05:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sUNhk-0003l8-EM
 for qemu-riscv@nongnu.org; Thu, 18 Jul 2024 05:45:40 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1sUNhe-0007eI-2L
 for qemu-riscv@nongnu.org; Thu, 18 Jul 2024 05:45:40 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5a1337cfbb5so734439a12.3
 for <qemu-riscv@nongnu.org>; Thu, 18 Jul 2024 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721295932; x=1721900732; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31PAAvqWVfPeuheMTgufizM0WJ/VodpQVnBOiKhybJo=;
 b=kJ5RiiAa/3L/YPqk0F0FMzVwsYLkdnT5QqE5IWM5GVjBFeXKBGxhVR0pVPLdCBAph4
 dB7RmUyL5fSRXdBy4ra9flzjDeDrHD4PjS1zQSgfxNJNaNV+u3y0hF1+j+De7dz3ywqu
 j/hVPFa4G5d5J3wMqxH91zFh5mZUlU2LRAlMp0hF9vEruh/nBHay3NDCMnAoUs1CjPkr
 HXgj6fJRZBv861MBTmEPtIrBHa+u5GEPJ1MXd1MtXw6pvHzf3QnZJ90MoF6AAroHyH5e
 lp91G/N7jLfH6QOQRGmPcpmqLaMRUKzWMUO+fnHi7OLiCCC8+0P0Cjin9yE5cnwG+SCc
 rPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721295932; x=1721900732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=31PAAvqWVfPeuheMTgufizM0WJ/VodpQVnBOiKhybJo=;
 b=lthDcVnRFBJ+rar9M+Yx/iIdMdKhbWxo+uIstzKffVpdd64zJXMKB/08qV2FLwPkxm
 KB1/Hetmjtq7iuyEvX7i5gK7UhbaKOxHhlwpTLUIy2ahojgdLr90Elq+PEQPBMtxbKfZ
 9WDAZ+n6Wj/o7ZMpdgCW8D/bhlx+J4Oc9EVjCab/D0s3srUOuBWoxk43oV6wGndVcczI
 7hHcItGx3ZSzmNhQL44M2H3Itgd0U3AUstcdhCSc9MCosympTKJeuAiQPYwuc/asDeb6
 AHKUDphLGl0X8wgQAzVYY/GpZhZKlglhbVtcuxStRMkIhf40aeAtXqsUtJcG6rXM25t5
 wsKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3Ib+/O5qqXKKCDzyzhgG2I+oZFjFpr2DE0zBeNtLczLMQEuvjjVzKyWMxScHj74ti2PkCFtj2Cp5tsfOdNfLYXX0ePGM=
X-Gm-Message-State: AOJu0YyV5rypKzQx7FzT6JUj3fKEWWI7IKso4ZrpnlBalCriSMEOHD4G
 vqe+QktvmyW0XhwF08+e/hW8SXO1vyj4TSIV7aSwpPywLsdIu7XeB3azCkVQmUU=
X-Google-Smtp-Source: AGHT+IF0wmH/Xfrk1d9lLYichHwO53hsdhT6jY8BIJJZH/wL0d8YBKSvhu5GGm8gnc1CbBkDPd6isA==
X-Received: by 2002:a17:906:6411:b0:a77:cc46:80f7 with SMTP id
 a640c23a62f3a-a7a011a6d55mr277345766b.28.1721295932139; 
 Thu, 18 Jul 2024 02:45:32 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5a394fsm539425566b.31.2024.07.18.02.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 02:45:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DAE685FA3F;
 Thu, 18 Jul 2024 10:45:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Beraldo Leal <bleal@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 09/15] target/m68k: Add semihosting stub
Date: Thu, 18 Jul 2024 10:45:17 +0100
Message-Id: <20240718094523.1198645-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718094523.1198645-1-alex.bennee@linaro.org>
References: <20240718094523.1198645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Since the SEMIHOSTING feature is optional, we need
a stub to link when it is disabled.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240717105723.58965-3-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/m68k/semihosting-stub.c | 15 +++++++++++++++
 target/m68k/meson.build        |  5 ++++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 target/m68k/semihosting-stub.c

diff --git a/target/m68k/semihosting-stub.c b/target/m68k/semihosting-stub.c
new file mode 100644
index 0000000000..d6a5965e29
--- /dev/null
+++ b/target/m68k/semihosting-stub.c
@@ -0,0 +1,15 @@
+/*
+ *  m68k/ColdFire semihosting stub
+ *
+ * SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
+ * SPDX-FileCopyrightText: 2024 Linaro Ltd.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+
+void do_m68k_semihosting(CPUM68KState *env, int nr)
+{
+    g_assert_not_reached();
+}
diff --git a/target/m68k/meson.build b/target/m68k/meson.build
index 8d3f9ce288..4d213daaf6 100644
--- a/target/m68k/meson.build
+++ b/target/m68k/meson.build
@@ -11,9 +11,12 @@ m68k_ss.add(files(
 
 m68k_system_ss = ss.source_set()
 m68k_system_ss.add(files(
-  'm68k-semi.c',
   'monitor.c'
 ))
+m68k_system_ss.add(when: ['CONFIG_SEMIHOSTING'],
+  if_true: files('m68k-semi.c'),
+  if_false: files('semihosting-stub.c')
+)
 
 target_arch += {'m68k': m68k_ss}
 target_system_arch += {'m68k': m68k_system_ss}
-- 
2.39.2


