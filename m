Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9425EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:03:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEqMn-0002Pd-6t; Thu, 29 Jun 2023 08:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEqMl-0002Ob-3D
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 08:03:15 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qEqMj-0005Ix-DA
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 08:03:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31297125334so493199f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 05:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688040192; x=1690632192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rqeub9QhHhZghiXhwOlqYOD/JyNFrg92mDnkS/0+7ew=;
 b=Yj9ryyAJEC2DeCMX8mcRK63XON6zjvPDQpDOLtpjdN2nrTf4UnKRn/De2gv1MJr6rJ
 zO/FHNAMzy/F3/M/ggpuItH+nQE9msAUKBLYGsQvBRXYMhVmvrRnpATXESzOBG8uMm9V
 iaayWEOSs+CqRyQTNUjLF3JIrnevgIBro8afOC0z6Sga0Nl3JBCCisda8MbP4GtySnSA
 gkprqTBJKY2k+4M2oQ793TA0G3cvPTq0mlCFJ3gTchLAzNq2oHExV4ZIRvHgpKq1qIpd
 4euwm5kvgA7XtHGLUHqFPTT0CkgzaDxWQAyidNMHQj9Ws10RdrkKR1yXt2PmNYfs+e2K
 djxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688040192; x=1690632192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rqeub9QhHhZghiXhwOlqYOD/JyNFrg92mDnkS/0+7ew=;
 b=U4J2ZmOOw/W6avhaARQyMHj3fXdKBKDB+8DWoATNz3lXNwF2bFgamFjaoDrVsJIWqd
 4Zgtk/lTfEaKU/Xk3t6qpBMld8lbUu56NtJbMQAPyViMSngapibwPXP8eKUlq5/vWFGy
 1rNKVubWQ0/BXLIHzxrSOKQc35HuRSte99eSQG3IdN1M+lykA1hAoSzwO68hXCFQ6syl
 qb+b+eAqP6kZa9Syh0X14O6YQslAcRd0q9/R5Vbsy6Z/ddJLxwk/JKh7XQkht6eQt9XH
 N4cxfh2KC0z8ejyEcUpXNLhGEexNE18+pqnRSx3jPuKwb7hYSVNQvcQPr1ok33uWmRbT
 E9aA==
X-Gm-Message-State: AC+VfDymwCBFFxJxVJzDC+fXv4pmNs0FDcUAzV+27OXfTMzrM9Z+KcYH
 GfCCrlk9P3k0+Q3zz4JrpsAd4Q==
X-Google-Smtp-Source: ACHHUZ6DSLbnu/FuECPwQS+fsg6i1vygyQk9T+vOYG3pEzhANYI4CClOb9LjSeCEaP7wEJfvYqgo8Q==
X-Received: by 2002:adf:dcc1:0:b0:313:e740:4956 with SMTP id
 x1-20020adfdcc1000000b00313e7404956mr4294303wrm.25.1688040192055; 
 Thu, 29 Jun 2023 05:03:12 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.242])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a7bc855000000b003f8fac0ad4bsm16167192wml.17.2023.06.29.05.03.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Jun 2023 05:03:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 2/2] accel/tcg: Replace qemu_tcg_mttcg_enabled() by
 mttcg_enabled
Date: Thu, 29 Jun 2023 14:02:55 +0200
Message-Id: <20230629120255.85581-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230629120255.85581-1-philmd@linaro.org>
References: <20230629120255.85581-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Move 'mttcg_enabled' declaration to "tcg-accel-ops-mttcg.h"
which is a TCG-internal header; un-inline and remove the
qemu_tcg_mttcg_enabled() definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tcg-accel-ops-mttcg.h | 8 ++++++++
 include/hw/core/cpu.h           | 9 ---------
 accel/tcg/tcg-accel-ops.c       | 2 +-
 tcg/region.c                    | 3 ++-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.h b/accel/tcg/tcg-accel-ops-mttcg.h
index 8ffa7a9a9f..1ffe8f3ac2 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.h
+++ b/accel/tcg/tcg-accel-ops-mttcg.h
@@ -10,6 +10,14 @@
 #ifndef TCG_ACCEL_OPS_MTTCG_H
 #define TCG_ACCEL_OPS_MTTCG_H
 
+/**
+ * qemu_tcg_mttcg_enabled:
+ * Check whether we are running MultiThread TCG or not.
+ *
+ * Returns: %true if we are in MTTCG mode %false otherwise.
+ */
+extern bool mttcg_enabled;
+
 /* kick MTTCG vCPU thread */
 void mttcg_kick_vcpu_thread(CPUState *cpu);
 
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b08f8b7079..5d26e6c90c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -456,15 +456,6 @@ extern CPUTailQ cpus;
 
 extern __thread CPUState *current_cpu;
 
-/**
- * qemu_tcg_mttcg_enabled:
- * Check whether we are running MultiThread TCG or not.
- *
- * Returns: %true if we are in MTTCG mode %false otherwise.
- */
-extern bool mttcg_enabled;
-#define qemu_tcg_mttcg_enabled() (mttcg_enabled)
-
 /**
  * cpu_paging_enabled:
  * @cpu: The CPU whose state is to be inspected.
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 3973591508..5391f078cf 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -188,7 +188,7 @@ static inline void tcg_remove_all_breakpoints(CPUState *cpu)
 
 static void tcg_accel_ops_init(AccelOpsClass *ops)
 {
-    if (qemu_tcg_mttcg_enabled()) {
+    if (mttcg_enabled) {
         ops->create_vcpu_thread = mttcg_start_vcpu_thread;
         ops->kick_vcpu_thread = mttcg_kick_vcpu_thread;
         ops->handle_interrupt = tcg_handle_interrupt;
diff --git a/tcg/region.c b/tcg/region.c
index 2b28ed3556..45f1742271 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -32,6 +32,7 @@
 #include "qapi/error.h"
 #include "tcg/tcg.h"
 #include "exec/translation-block.h"
+#include "accel/tcg/tcg-accel-ops-mttcg.h"
 #include "tcg-internal.h"
 
 
@@ -413,7 +414,7 @@ static size_t tcg_n_regions(size_t tb_size, unsigned max_cpus)
      * dividing the code_gen_buffer among the vCPUs.
      */
     /* Use a single region if all we have is one vCPU thread */
-    if (max_cpus == 1 || !qemu_tcg_mttcg_enabled()) {
+    if (max_cpus == 1 || !mttcg_enabled) {
         return 1;
     }
 
-- 
2.38.1


