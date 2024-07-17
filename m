Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CEFC3DA42
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 10:59:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sU2Lu-0002nT-JJ; Wed, 17 Jul 2024 06:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU2Lt-0002kF-Rq
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 06:57:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU2Lr-0005cc-1o
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 06:57:41 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-36786081ac8so3870390f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 17 Jul 2024 03:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721213856; x=1721818656; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+H84pjhZV03SKMSQm8z6X2LsGjCdphEi5b/GpyyBaBI=;
 b=YX0/ei4IO5avpFUjb2X8cxCPqhzKx7IHG0QWtCai+iZyeRtTzzGwqgz2WDzdeaQi1T
 yDs6ZZxY2RngWFGMG9aVCbEtuKlYQFgVa4yVTR73nXzToI+okPDSBF/oTHHfiEqB7FNZ
 j6d/deoq24DngNyDNAehRp2H2BGUTt+nTNYjOyKB/oNFSfobgp7dJLgXZ08H+B0zd8pe
 XZvBPGI6PtLehbT4VhcCcNV0jedAbOP0dfv2ZKXtqG3orfdD1ZKzAC75uHtoQD3tTVR8
 aiYFaomcYElcuZVnZY0v/PrwauQPSwL/MyBdrHTlEGpEdAufzRqPYiJn5PLDxWwh1AFD
 hg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721213856; x=1721818656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+H84pjhZV03SKMSQm8z6X2LsGjCdphEi5b/GpyyBaBI=;
 b=dBeGPqO6yRZ8MaX9O4Xe02FIBTl0NWNXjb+8Rv+glxL4X8u3dzryteAbcT3SineVKB
 Q+GQTT7bnlpdzr2dEI3GQYtMNx9AfsUekDoZv9KyYj2ukx3eie+to+B9In5g6C8B7Ng0
 5H8DTimAaDP0CIysGcgymjEFenLPRMPpXCi8Q5v+kdR3Gv24jgo/wg1vyrQ/pwKYcpbo
 hNiJ3unEoI2qsBmw+VXGoSmVTA8A1raxy3KblvJ3LxsZpFjFpE+UbhtwYFCQQ48HLQJQ
 XguVs2KMGoGG41l2lYXgPjtF45gTKsVoVc9L7q7O8K+H5qoOjpXJL54rCiqLRIu/Hz09
 XQHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEuAF7STlRRw/eTd02j45kwTdKIjOPglXffbyUdRIz7lH0GjOruUi8oCpaoyJkQ1nLJkKkXbkZCFFcfMle4miCEjTb8vE=
X-Gm-Message-State: AOJu0YxkhfGryjWyqKW1HhKFHPBOEsZ7huA3yF09j2bi8kwzDQEUGBRk
 71y0qv33BNU6rV4RfCp98kokum/l/xS0Xp4r4BvGG/XQx/IprTQQ6Bkp26pJ330=
X-Google-Smtp-Source: AGHT+IHF7SYa4V+5+rhqqd9d5bFweCnycR06dMue3MnLt4LjRHWPqbuWZRDdeYrEnTChWqhACkXXOQ==
X-Received: by 2002:adf:eb45:0:b0:367:958e:9832 with SMTP id
 ffacd0b85a97d-36831600277mr1197662f8f.14.1721213856573; 
 Wed, 17 Jul 2024 03:57:36 -0700 (PDT)
Received: from localhost.localdomain ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dabefa6sm11330056f8f.44.2024.07.17.03.57.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Jul 2024 03:57:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 2/8] target/m68k: Add semihosting stub
Date: Wed, 17 Jul 2024 12:57:17 +0200
Message-ID: <20240717105723.58965-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240717105723.58965-1-philmd@linaro.org>
References: <20240717105723.58965-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Since the SEMIHOSTING feature is optional, we need
a stub to link when it is disabled.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.41.0


