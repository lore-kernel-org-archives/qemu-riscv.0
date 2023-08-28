Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A480BC83F14
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 22:14:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qakUv-0006Ke-As; Mon, 28 Aug 2023 18:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUs-0006HC-6j
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:14:10 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUm-0004FY-7o
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 18:14:09 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fef56f7222so36066215e9.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 15:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260842; x=1693865642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n9UxN4uR/xgEuDgFqWbmhyuNk7+iYdgvOfZXEjKsASg=;
 b=v5XJ6yKbgtq9YkWXY/MYLESCyybiTuaBlalG35ZmTfvJTnDnpNoyndkjuMX8m+czUS
 nMbVAa+4LdANjwpJJLvXkaEPqUZPLPrRupNGEwLlGxVg40puCAlYp/nqadli8Ctaqjau
 PXcTcMbjwInusBhiKr+RiaEmKCSvWll8RI+6kXFDTycRMk/Af+frq63WsjYpH7N1Y5i1
 qaefbCOrNJeu/2oISaPzfSms0LUL/PAEO0t/hDFJwsO5uqSXDOUs5V9+TEe94PmyOZ6M
 HRnAvV6k52HC186XLMiFEFoczDuXWpmQutU9dotlWqGSme5K/TCi188ifblG2rm6AnOF
 NR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260842; x=1693865642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n9UxN4uR/xgEuDgFqWbmhyuNk7+iYdgvOfZXEjKsASg=;
 b=IvbL9wbsxsvBFYvu4A8yedNHvYpKtDZSAvdAwPx67V3GjbEkum+UeXuPkrD0rn9gN+
 XDhuqY7GewqcD6d6dsLYHWWFPCAxOhTkx+FEhKWCWFEYUnDOP95rZCBlfaWvdSiFEyVF
 eFZL7ZwZnjyy8fptmO8F14iF12RsG+MSVjr15uH9ched4jw1EkpCjfB5z5kCugleEyL2
 V6RQeMYoaGc2JACSnNrQHkpQ/ZcyHGV71II4v8SG5RHmXAh+bDeWtdteEsVl8wX7vumG
 yS1vaQqY6jsEC8Xfbt6m03OOa70xFq7mZaa3T2LdXU30UXUrXzLey2W1bfMqdCUkTW+K
 f+bA==
X-Gm-Message-State: AOJu0Yyr78zV+mAQN+pQQlJxXB1EiNqZE5pTBSN8MksvwqS9fR7IZ/V5
 bxyGhmX2iwnlB31AerhXBXa0gw==
X-Google-Smtp-Source: AGHT+IGBLrDoI0n12WXObDcP4rFy0zSR1C5hYWeXDPgRQRTbNEbylcxaJ378pTKZMLYvFUgYoWLaVQ==
X-Received: by 2002:a1c:7303:0:b0:3fe:19cf:93c9 with SMTP id
 d3-20020a1c7303000000b003fe19cf93c9mr20322978wmb.1.1693260842569; 
 Mon, 28 Aug 2023 15:14:02 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003fe29dc0ff2sm12152766wmc.21.2023.08.28.15.14.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:14:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/11] target/helper: Remove unnecessary 'qemu/main-loop.h'
 header
Date: Tue, 29 Aug 2023 00:13:10 +0200
Message-ID: <20230828221314.18435-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

"qemu/main-loop.h" declares functions related to QEMU's
main loop mutex, which these files don't access. Remove
the unused "qemu/main-loop.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/pmu.h                   | 1 -
 target/arm/ptw.c                     | 1 -
 target/loongarch/iocsr_helper.c      | 1 -
 target/loongarch/op_helper.c         | 1 -
 target/mips/tcg/sysemu/lcsr_helper.c | 1 -
 target/nios2/op_helper.c             | 1 -
 target/ppc/int_helper.c              | 1 -
 target/ppc/machine.c                 | 1 -
 target/ppc/mem_helper.c              | 1 -
 target/ppc/mmu_common.c              | 1 -
 target/ppc/mmu_helper.c              | 1 -
 target/ppc/power8-pmu.c              | 1 -
 target/ppc/translate.c               | 1 -
 target/riscv/csr.c                   | 1 -
 target/riscv/m128_helper.c           | 1 -
 target/riscv/op_helper.c             | 1 -
 target/s390x/tcg/crypto_helper.c     | 1 -
 target/s390x/tcg/misc_helper.c       | 1 -
 target/xtensa/dbg_helper.c           | 1 -
 target/xtensa/fpu_helper.c           | 1 -
 target/xtensa/mmu_helper.c           | 1 -
 target/xtensa/op_helper.c            | 1 -
 target/xtensa/win_helper.c           | 1 -
 23 files changed, 23 deletions(-)

diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 60fdd6f42c..2bfb71ba87 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -17,7 +17,6 @@
  */
 
 #include "cpu.h"
-#include "qemu/main-loop.h"
 
 bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
                                         uint32_t target_ctr);
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index bfbab26b9b..a4b0172df3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -9,7 +9,6 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/range.h"
-#include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "cpu.h"
 #include "internals.h"
diff --git a/target/loongarch/iocsr_helper.c b/target/loongarch/iocsr_helper.c
index dda9845d6c..6cd01d5f09 100644
--- a/target/loongarch/iocsr_helper.c
+++ b/target/loongarch/iocsr_helper.c
@@ -6,7 +6,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index cf84f20aba..fe79c62fa4 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -7,7 +7,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
diff --git a/target/mips/tcg/sysemu/lcsr_helper.c b/target/mips/tcg/sysemu/lcsr_helper.c
index 8f97d04313..fb57bcbb78 100644
--- a/target/mips/tcg/sysemu/lcsr_helper.c
+++ b/target/mips/tcg/sysemu/lcsr_helper.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "internal.h"
 #include "qemu/host-utils.h"
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index 0aaf33ffc2..5017457c5e 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -22,7 +22,6 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "qemu/main-loop.h"
 
 void helper_raise_exception(CPUNios2State *env, uint32_t index)
 {
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 834da80fe3..96cdb3c7e3 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -21,7 +21,6 @@
 #include "cpu.h"
 #include "internal.h"
 #include "qemu/host-utils.h"
-#include "qemu/main-loop.h"
 #include "qemu/log.h"
 #include "exec/helper-proto.h"
 #include "crypto/aes.h"
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 134b16c625..1270a1f7fc 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -7,7 +7,6 @@
 #include "mmu-hash64.h"
 #include "migration/cpu.h"
 #include "qapi/error.h"
-#include "qemu/main-loop.h"
 #include "kvm_ppc.h"
 #include "power8-pmu.h"
 
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 46eae65819..c7535481d6 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -21,7 +21,6 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "qemu/host-utils.h"
-#include "qemu/main-loop.h"
 #include "exec/helper-proto.h"
 #include "helper_regs.h"
 #include "exec/cpu_ldst.h"
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 8c000e250d..6ca5d12207 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -28,7 +28,6 @@
 #include "exec/log.h"
 #include "helper_regs.h"
 #include "qemu/error-report.h"
-#include "qemu/main-loop.h"
 #include "qemu/qemu-print.h"
 #include "internal.h"
 #include "mmu-book3s-v3.h"
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index d3ea7588f9..f87d35379a 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -28,7 +28,6 @@
 #include "exec/log.h"
 #include "helper_regs.h"
 #include "qemu/error-report.h"
-#include "qemu/main-loop.h"
 #include "qemu/qemu-print.h"
 #include "internal.h"
 #include "mmu-book3s-v3.h"
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 2537cded83..cbc5889d91 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -17,7 +17,6 @@
 #include "exec/helper-proto.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
-#include "qemu/main-loop.h"
 #include "hw/ppc/ppc.h"
 #include "power8-pmu.h"
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 49b6a757b7..7111b34030 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -26,7 +26,6 @@
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
 #include "qemu/host-utils.h"
-#include "qemu/main-loop.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ea7585329e..de31818daa 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -23,7 +23,6 @@
 #include "cpu.h"
 #include "pmu.h"
 #include "time_helper.h"
-#include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "exec/tb-flush.h"
 #include "sysemu/cpu-timers.h"
diff --git a/target/riscv/m128_helper.c b/target/riscv/m128_helper.c
index e6a4f6120a..ec14aaa901 100644
--- a/target/riscv/m128_helper.c
+++ b/target/riscv/m128_helper.c
@@ -19,7 +19,6 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 7e2f1908ee..5355225d56 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -21,7 +21,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internals.h"
-#include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
index 762b277884..93aabd236f 100644
--- a/target/s390x/tcg/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -13,7 +13,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index 576157b1f3..e85658ce22 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -20,7 +20,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "s390x-internal.h"
 #include "qemu/host-utils.h"
diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index ce2a820c60..3e0c9e8e8b 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -27,7 +27,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
diff --git a/target/xtensa/fpu_helper.c b/target/xtensa/fpu_helper.c
index d2a10cc797..381e83ded8 100644
--- a/target/xtensa/fpu_helper.c
+++ b/target/xtensa/fpu_helper.c
@@ -27,7 +27,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
diff --git a/target/xtensa/mmu_helper.c b/target/xtensa/mmu_helper.c
index 57b75882c4..12552a3347 100644
--- a/target/xtensa/mmu_helper.c
+++ b/target/xtensa/mmu_helper.c
@@ -27,7 +27,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "qemu/main-loop.h"
 #include "qemu/qemu-print.h"
 #include "qemu/units.h"
 #include "cpu.h"
diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index 10a2b51f91..03e2c1889a 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -26,7 +26,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
diff --git a/target/xtensa/win_helper.c b/target/xtensa/win_helper.c
index 5a1555360a..ec9ff44db0 100644
--- a/target/xtensa/win_helper.c
+++ b/target/xtensa/win_helper.c
@@ -27,7 +27,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
-- 
2.41.0


