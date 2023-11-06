Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF0FC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:10:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxPM-0006mb-CY; Mon, 06 Nov 2023 06:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxPE-0006Wa-QN
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:04:32 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxPB-0003n7-3u
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:04:32 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40790b0a224so32901025e9.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268667; x=1699873467; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=599/Bj9mord/rWtxWCsNHAuRNbZVNvVu72yn9cQly6g=;
 b=Yxgy1zQGP+Iyqy4ROUU1gtZZj/ITd4ikqfV+CeUXLztYdTcbVzE8Xu5D8BEJYXX0ce
 e5AunMIoSvXr/bXwcQklmj4zO6DV09oUeLNUONgBDGne8vciEdyUAh/jDCPhYRGE8hx3
 sHd+eICPeJyVa8zkAVecr0kmjFx+Ccn0n1wb/CCUJ9oJu9kIzADrHSuHhdw8vd8ZD1d1
 ur8KpY8ig5uVRs6idcm6ilzo7JAobdbkTeB6xl3F55zeAqPRJH3qbHGe/X8ngfkZ+ZjD
 3OPzDOsDMZKj7g8fmOayBVOc7M2em+xgu6rqFs542gBd7lblBobpFACwCaDKiWEOZSXm
 H5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268667; x=1699873467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=599/Bj9mord/rWtxWCsNHAuRNbZVNvVu72yn9cQly6g=;
 b=U17Mtncb7bPXlaET0Em6kEWZNu3euTDSKunMw0PfpNj0iuVf8jUMwOocTV2xJFJYz7
 XH9OWdGU+PUEh0P6EZTWDMAkW9YA2N/0iCdlW5Pa4eWOuZssd8MUmYCkzbo7hfUdcPY9
 F6ACrPHf+cbexwfrbd70bUsrl7kVYYKWM/MKO4jnnNt9qKD4WVr3J8pLRvVaIgvvRMwd
 vRzYend1tqBP3aHN6n+VZzZ/hwLLBlmQf7mZpWV2N70XPVfr2MOxPTfHXjM4kTc7xntw
 RH6tjaFvMVroalHmLW6TXGm+sCH3JNMYC+Pk5ReHZnFccv74Ukg5FvhR5fcdrv3uZc5k
 YDUg==
X-Gm-Message-State: AOJu0Yxc6DpZ15y0LAxPaWJFUfi74oxi+cDJfJ1a5I9WHRM8TX824n0P
 szVyHxviA2YiT4X454qop8OoeA==
X-Google-Smtp-Source: AGHT+IEzp/mPbFUy8SkmetAAoTy+TS+vDzZzjoAJkoCTBAmaD/KNwWEWoOROTPCc4oN0cNW9yDLu/w==
X-Received: by 2002:a05:600c:488a:b0:408:3c8f:afd9 with SMTP id
 j10-20020a05600c488a00b004083c8fafd9mr22199866wmp.3.1699268667013; 
 Mon, 06 Nov 2023 03:04:27 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a05600c45c700b003fc16ee2864sm11816561wmo.48.2023.11.06.03.04.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:04:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 07/60] accel/tcg: Factor tcg_cpu_reset_hold() out
Date: Mon,  6 Nov 2023 12:02:39 +0100
Message-ID: <20231106110336.358-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Factor the TCG specific code from cpu_common_reset_hold() to
tcg_cpu_reset_hold() within tcg-accel-ops.c. Since this file
is sysemu specific, we can inline tcg_flush_softmmu_tlb(),
removing its declaration in "exec/cpu-common.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230918104153.24433-4-philmd@linaro.org>
---
 include/exec/cpu-common.h | 2 --
 accel/stubs/tcg-stub.c    | 4 ----
 accel/tcg/tcg-accel-ops.c | 8 ++++++++
 accel/tcg/translate-all.c | 8 --------
 hw/core/cpu-common.c      | 5 -----
 5 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index f700071d12..41115d8919 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -45,8 +45,6 @@ void cpu_list_lock(void);
 void cpu_list_unlock(void);
 unsigned int cpu_list_generation_id_get(void);
 
-void tcg_flush_softmmu_tlb(CPUState *cs);
-
 void tcg_iommu_init_notifier_list(CPUState *cpu);
 void tcg_iommu_free_notifier_list(CPUState *cpu);
 
diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index a9e7a2d5b4..8a496a2a6f 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -22,10 +22,6 @@ void tlb_set_dirty(CPUState *cpu, vaddr vaddr)
 {
 }
 
-void tcg_flush_jmp_cache(CPUState *cpu)
-{
-}
-
 int probe_access_flags(CPUArchState *env, vaddr addr, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr)
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 7ddb05c332..1b57290682 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -78,6 +78,13 @@ int tcg_cpus_exec(CPUState *cpu)
     return ret;
 }
 
+static void tcg_cpu_reset_hold(CPUState *cpu)
+{
+    tcg_flush_jmp_cache(cpu);
+
+    tlb_flush(cpu);
+}
+
 /* mask must never be zero, except for A20 change call */
 void tcg_handle_interrupt(CPUState *cpu, int mask)
 {
@@ -206,6 +213,7 @@ static void tcg_accel_ops_init(AccelOpsClass *ops)
         }
     }
 
+    ops->cpu_reset_hold = tcg_cpu_reset_hold;
     ops->supports_guest_debug = tcg_supports_guest_debug;
     ops->insert_breakpoint = tcg_insert_breakpoint;
     ops->remove_breakpoint = tcg_remove_breakpoint;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 8cb6ad3511..27e8152f0a 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -800,11 +800,3 @@ void tcg_flush_jmp_cache(CPUState *cpu)
         qatomic_set(&jc->array[i].tb, NULL);
     }
 }
-
-/* This is a wrapper for common code that can not use CONFIG_SOFTMMU */
-void tcg_flush_softmmu_tlb(CPUState *cs)
-{
-#ifdef CONFIG_SOFTMMU
-    tlb_flush(cs);
-#endif
-}
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 7d266c36ac..baa6d28b64 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -27,7 +27,6 @@
 #include "qemu/main-loop.h"
 #include "exec/log.h"
 #include "exec/cpu-common.h"
-#include "exec/tb-flush.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "sysemu/tcg.h"
@@ -138,10 +137,6 @@ static void cpu_common_reset_hold(Object *obj)
     cpu->cflags_next_tb = -1;
 
     cpu_exec_reset_hold(cpu);
-    if (tcg_enabled()) {
-        tcg_flush_jmp_cache(cpu);
-        tcg_flush_softmmu_tlb(cpu);
-    }
 }
 
 static bool cpu_common_has_work(CPUState *cs)
-- 
2.41.0


