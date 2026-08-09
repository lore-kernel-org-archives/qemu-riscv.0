Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9F0C5AD56
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 01:34:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wssQF-0000MV-8d; Sat, 08 Aug 2026 21:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wssQD-0000Jg-47
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 21:33:53 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wssQB-0002KO-4H
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 21:33:52 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-38d489b6b71so666789a91.0
 for <qemu-riscv@nongnu.org>; Sat, 08 Aug 2026 18:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786239230; x=1786844030; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xMgsCAzpsxr99VprhfKZkcv1OibNXXEBZ1Rt/1CfLY0=;
 b=Pj89OhqxmREy0XuKX0uWHoGhbr/IJ5SX8VWBKnE7aXcxymn+21Zofhgn+H11S4rvoI
 HQWUE7O9D87pT40ILoVUrQinI/6ZoAzl9JmtBW1AoSoOavinuCDH71rgNYQiFXBcCg8W
 Q7tmuiWuPyhqNbcbrSdPxmOYl7Z+5cYD7/0WRHgdkUyZhblWoTJQj+EeECXo3fb1sfpj
 7qTxN+d9nRcpZBlIS8feC6sMOYpKWsm0lr0f6Fp5E8frH5Yu1nj5Aq8q+s7zE7c626o0
 JHjKjYTeM7C+lFU0l38qIXczzqwSuFdHZg+7oQ1Ao+ophA5UvSc9WtB3ErM+bFLgxifH
 5ISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786239230; x=1786844030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xMgsCAzpsxr99VprhfKZkcv1OibNXXEBZ1Rt/1CfLY0=;
 b=UD99LSsWesRRTqlqrAx4qALYz7f0QSAFeut/hohgAt2UNLrCkBhis3Ck/mN3lJJXB3
 2pGoryvc8RcmRXyIFvZjy1Wj434o9FeOko7kv/Hw4Qdx+ogN5GvRQfjUI2XNxbcqadjz
 vCQO1LXBSCebyu2dNq6PwBV/FUgsR15x1viMav9hG6RM6CR4eb3lgrdzyimcMEifDKgG
 wrJCZeKIScpiwreuNxFlHXTg9ldXyUYq8nT7OY7g7SvDnXdQ1yWur/p4pvrx73UrAbZv
 Y31Tb1huozmRt/8YJpgyn8srVkMpMrSuZT+0CnopEh6b9efcypse4YSFoXRodqFGYq32
 p4Qg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrqAz9zF9mI/5u87/jLKSGoy2z8j2e9EatLR7J9qA9uAkP3covIrtN8ouj5wEdVlTHW74HqY0UMBT7I@nongnu.org
X-Gm-Message-State: AOJu0YzTAMJdq179qDfhSBsPhJc6SJeX9SjBDZiQRImbEygvE9ZcdVaW
 T9djhy9v85v9nBC/6xf7OoyRAOvRjoz5AphOWHCJZHDYvet8v7iu80xlI7dH5Ttw3eo=
X-Gm-Gg: AR+sD1169jJ3cvdXyB05ej/jfowvS5UjJ8xVF/B1HHj3roriQ1yPl6LKA3+x89vwJkZ
 CaV+XHgAG0OzzqSCofKb4BIrKUEzrjOGZaTNsB8a3COOuA69hJRwTO4H+TB9JCWSAjHCNoSB+el
 6G+JbHv19l9OPNdMIaPImRkyAKJW9uT4vMGwDlL3zEkt4O+AK5DRJTtYJQqbnN2BJHt0M3KD984
 d8ShtSWlF0ii79uIqdDXAMp/lqcN/URVGsUZLCOJN29RUPuZQZFyPkMpamFWCptZMw961psE6Rp
 Pp0UlxiRfCAnkqPm4hEa5uLKMEDpSdNcAA1VyPrTgEHwBvevhL3zCLpH7gtQeYJgWvi/anIzC08
 8ayjatziBczPxE64qcfgBPsCc4rXaVs2gscR2UhGDOm0jc9Ok7nmJkNxtBPI0DjmEjk1Y3sZfas
 DOIjBkFToCmHvhDn0kllyGFvK94iMcASGJowkHyHLdjNCUOkb9sKf8I62PfX0mSH3ATscMrx/A5
 oIdK27URUgPvMU52n4Wo183nauJa7U=
X-Received: by 2002:a17:90b:580b:b0:38e:9e9d:9209 with SMTP id
 98e67ed59e1d1-3903c5c51cdmr34482563a91.17.1786239229585; 
 Sat, 08 Aug 2026 18:33:49 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39085de8ddcsm10067927a91.6.2026.08.08.18.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 18:33:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH 4/9] target/sh4: Enable disassembly via capstone
Date: Sat,  8 Aug 2026 18:33:38 -0700
Message-ID: <20260809013343.664966-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809013343.664966-1-richard.henderson@linaro.org>
References: <20260809013343.664966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/disas/capstone.h |  7 +++++++
 target/sh4/cpu.c         | 14 ++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/disas/capstone.h b/include/disas/capstone.h
index 5c78824da2..788f90771a 100644
--- a/include/disas/capstone.h
+++ b/include/disas/capstone.h
@@ -71,4 +71,11 @@
 #define CS_MODE_RISCV_VENTANA    0
 #endif
 
+#if CS_API_MAJOR < 5
+#define CS_ARCH_SH              -1
+#define CS_MODE_SHFPU            0
+#define CS_MODE_SH4              0
+#define CS_MODE_SH4A             0
+#endif
+
 #endif /* QEMU_CAPSTONE_H */
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 763424695c..7593062993 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -28,6 +28,7 @@
 #include "fpu/softfloat-helpers.h"
 #include "accel/tcg/cpu-ops.h"
 #include "tcg/tcg.h"
+#include "disas/capstone.h"
 
 static void superh_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -167,10 +168,23 @@ static void superh_cpu_reset_hold(Object *obj, ResetType type)
 static void superh_cpu_disas_set_info(const CPUState *cpu,
                                       disassemble_info *info)
 {
+    const CPUSH4State *env = cpu_env((CPUState *)cpu);
+
     info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_BIG
                                      : BFD_ENDIAN_LITTLE;
     info->mach = bfd_mach_sh4;
     info->print_insn = print_insn_sh;
+
+    info->cap_arch = CS_ARCH_SH;
+    info->cap_insn_unit = 2;
+    info->cap_insn_split = 2;
+    /*
+     * Possible capstone bug: the isa levels are not additive:
+     * least significant bit wins, so SH4 overrides SH4A.
+     * Work around by settiing one or the other but not both.
+     */
+    info->cap_mode = CS_MODE_SHFPU
+        | (env->features & SH_FEATURE_SH4A ? CS_MODE_SH4A : CS_MODE_SH4);
 }
 
 static ObjectClass *superh_cpu_class_by_name(const char *cpu_model)
-- 
2.43.0


