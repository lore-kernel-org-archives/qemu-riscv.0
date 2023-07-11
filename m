Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D46AEB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 12:16:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJCGz-0001Qd-T0; Tue, 11 Jul 2023 08:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJCGy-0001Q5-HY
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:15:16 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJCGw-0005KW-GQ
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:15:16 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fc04692e20so40940155e9.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 05:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689077713; x=1691669713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zr17NIVAdDw5pKGRetVfMHtNCxfQWEBUL+tHolB+dpE=;
 b=dl+S5i65g/AsyBNSwirV6EsuTX65d/X71WzgHxU5Nnt/CWxFSMg0ePy5aWKhEtbyBV
 0wY0cSBWBhE6rOEKMMXiRtZcA9Qd6kvIvgSLBwV+m5o+Syc0lB+RR7uiSaQcYijRaRvI
 zMpg6OrsUOGIw0guioYordT/dLeiDEem085JmipOKpNNnug3j3Jldpy4SDm8wWvZHUGi
 tbS8yaYCq7rymHVVXd+nj13ys3ouzIeMBS/wwpG6PfLw8pqmipR+iX6ed78bEuS6lmK6
 c1tJVUxxt8YWaHk7P8u4zKTu9ZFkOsMZ1k+kvNOEXjc6prCk9Z58+/6nIYK20ToWp8jl
 HpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689077713; x=1691669713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zr17NIVAdDw5pKGRetVfMHtNCxfQWEBUL+tHolB+dpE=;
 b=efJ9x5Carvi33bvZXlF9DiS5uwtcLJ5Lgf+3l//irvRTjYLbE5Tw17KZhPj3lnis5m
 SsDgChEScOG1VFrD8pOgc4wXJXnv72I6P6Yh/s6DWQKJN54hDD+4DVgUfuUOSljxSb7X
 fQ9DxecqJrLHdvtATbs6X98U2v0Th6vLOgf60l3fCOe/NBWoOPkQvn4Dz16ghGhJYvr9
 x4zJmu38frQDqRVC438z6JuHlwcUYGta1bkmG7vUCqQNEzJh2N8yE9SexRy2/qjBno0Y
 rOVYjcTEB6nIF/5wTGK7OAUsD5lIdUItUo9PrqX+qZW7oNZczN6SvITfmTVMSzKBn4UN
 Kv7A==
X-Gm-Message-State: ABy/qLaqc5nTu95GkgDIc/wTuwW+tBrO6NZAGSr+18wGGXoJFHxejkPU
 h/AjpYflwlTuaf+JWR0ZlqPlww==
X-Google-Smtp-Source: APBJJlEtbf0chVd7/NlFUpaHK1d1fc/9igs52PXYSRBQsu5pg9yEXztUgEOpEEO0HrUSFcqfizdX1A==
X-Received: by 2002:a1c:6a1a:0:b0:3f8:c70e:7ed1 with SMTP id
 f26-20020a1c6a1a000000b003f8c70e7ed1mr15198955wmc.20.1689077713098; 
 Tue, 11 Jul 2023 05:15:13 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.194.156])
 by smtp.gmail.com with ESMTPSA id
 12-20020a05600c020c00b003f819faff24sm12971972wmi.40.2023.07.11.05.15.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Jul 2023 05:15:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 03/16] target/riscv: Restrict sysemu specific header to
 user emulation
Date: Tue, 11 Jul 2023 14:14:40 +0200
Message-Id: <20230711121453.59138-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230711121453.59138-1-philmd@linaro.org>
References: <20230711121453.59138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
 target/riscv/cpu.c        | 10 ++++++----
 target/riscv/cpu_helper.c |  2 ++
 target/riscv/csr.c        |  2 ++
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9339c0241d..5712a54404 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -23,9 +23,14 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "cpu_vendorid.h"
+#ifndef CONFIG_USER_ONLY
 #include "pmu.h"
-#include "internals.h"
 #include "time_helper.h"
+#include "sysemu/tcg.h"
+#include "sysemu/kvm.h"
+#include "kvm_riscv.h"
+#endif
+#include "internals.h"
 #include "exec/exec-all.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
@@ -33,9 +38,6 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "fpu/softfloat-helpers.h"
-#include "sysemu/kvm.h"
-#include "sysemu/tcg.h"
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


