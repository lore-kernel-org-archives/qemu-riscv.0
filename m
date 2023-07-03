Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40770C001DD
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 18:33:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGOLK-0007co-SI; Mon, 03 Jul 2023 14:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOLJ-0007cS-VY
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:09 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOLI-0000A9-FH
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:09 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57dcso25698605e9.0
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 11:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688409127; x=1691001127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MmplW2ex2rHzihVJ44uJ4xkpwEybdiXLv3F1bYg0V9o=;
 b=crGvpkCQQsqDzLIoUgcMsHdYqvWJOnGoIuQ/6q/mfvoIOHSvNImdJpaPo0q1U3jT2V
 mHkp9rOwRKSD+mdTIH7KH4BysB9MboC9TrJ3sbDDCs5rGZBiJHxrrDH0dY64YNJAOqoq
 tBXke0PJ5p30cVXtQeZZgY77oGV0GyibjGMvkj0PvyoB8DSLW7TwIqYh8G5qYWpn5IRD
 UL37SB8mV0rE4SA1d0peFobkwPBhrVCRQBSqVLPuaPzHAFuS7W9S9KvUQwtPmBB+qnFa
 ncO1oEu+0lkVzugu+6t+YcDF1GLWAFEmg3L/YyXbX9QVgBCnOh/DLQmOrumB6yodiLVi
 L7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688409127; x=1691001127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MmplW2ex2rHzihVJ44uJ4xkpwEybdiXLv3F1bYg0V9o=;
 b=EDG+G6VJhl82LmbgR279H5GObwmgmTFh1poILliSniuK6eLnF8eVUpsFCF0Wiq8Xip
 XWXku9t2zjP3/u8VzFOic/vR0/47EC17lSKjEaJwMjD2AOYA9YCnOufOcbrmCND0cj9t
 xxHQOXcbjxz3XAEmW8vlWEY+QTVUTW/NubGsungGBtYArn59K5557zKOSNmheyWPY7Tq
 zp/mo26meDygfu++nsRYdh7fHV4DWHlcXXPT4c1Um/jEVjH8Z2cLOiuOd3qIkDIPd/k7
 ytoGb5+Iukzx7Rsl8BQPhheKLJiz7onPwrEuLQIhSgWfNVxVUZcIzIGbKdXUb1TE7VhQ
 Wdbg==
X-Gm-Message-State: AC+VfDylvUW0NO/G2TkNLeU+TXk8XVAC2VJWT+/cZCCRmY790mlG/IW0
 KTaZAurfb8HSwKt/0Q/HzTQbsA==
X-Google-Smtp-Source: ACHHUZ5P9NPaUY2M9plko56MMlY+LD4D0vX+GUYll+SWPHJdo6WhISnJstsVpBPOD24/pxFJoXi75Q==
X-Received: by 2002:a1c:790b:0:b0:3fb:b280:f551 with SMTP id
 l11-20020a1c790b000000b003fbb280f551mr9744606wme.41.1688409127036; 
 Mon, 03 Jul 2023 11:32:07 -0700 (PDT)
Received: from localhost.localdomain ([176.176.178.91])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a7bcb95000000b003faabd8fcb8sm21627386wmi.46.2023.07.03.11.32.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Jul 2023 11:32:06 -0700 (PDT)
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
Subject: [PATCH v2 03/16] target/riscv: Restrict sysemu specific header to
 user emulation
Date: Mon,  3 Jul 2023 20:31:32 +0200
Message-Id: <20230703183145.24779-4-philmd@linaro.org>
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c        | 8 +++++---
 target/riscv/cpu_helper.c | 2 ++
 target/riscv/csr.c        | 2 ++
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fd647534cf..174003348f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -23,9 +23,13 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "cpu_vendorid.h"
+#ifndef CONFIG_USER_ONLY
 #include "pmu.h"
-#include "internals.h"
 #include "time_helper.h"
+#include "sysemu/kvm.h"
+#include "kvm_riscv.h"
+#endif
+#include "internals.h"
 #include "exec/exec-all.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
@@ -33,8 +37,6 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "fpu/softfloat-helpers.h"
-#include "sysemu/kvm.h"
-#include "kvm_riscv.h"
 #include "tcg/tcg.h"
 
 /* RISC-V CPU definitions */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9f611d89bb..e8b7f70be3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -28,7 +28,9 @@
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
+#ifndef CONFIG_USER_ONLY
 #include "sysemu/cpu-timers.h"
+#endif
 #include "cpu_bits.h"
 #include "debug.h"
 #include "tcg/oversized-guest.h"
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ea7585329e..e5737dcf58 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -21,8 +21,10 @@
 #include "qemu/log.h"
 #include "qemu/timer.h"
 #include "cpu.h"
+#ifndef CONFIG_USER_ONLY
 #include "pmu.h"
 #include "time_helper.h"
+#endif
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "exec/tb-flush.h"
-- 
2.38.1


