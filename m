Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C411C0218C
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 17:07:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taHiA-0003yh-6u; Tue, 21 Jan 2025 12:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1taHi7-0003xD-TC
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 12:06:43 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1taHi6-0006a0-6X
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 12:06:43 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-215770613dbso76769035ad.2
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 09:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1737479200; x=1738084000; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fmkc6bBb+HgSrw9XzuEaJgDnALN5HKYN9Bheo5qcDys=;
 b=eJgGFN9bHbKjvwrfBJBj1odATOW8vCxRx4306olDdS2bKQmExLfJU30MwlMiznpTCb
 O/XYCP5c0Aj35idrxan/FqlMY+lU47Bem2eotiAIY3vxp/kHcQR18he360f8yVVoalFp
 zHwghpLWffoilykRPhysXfBjbKbND7qRDGVmYgs44ZPu1uqnruHfw5HP8ZLx35jyrBJz
 Hu4o3HduATdmgxZq/u0supX8LdR1cXaTi5FFR6yu1s6cg1LTwsR6C4+6sB3OVa0U+MS3
 ivJRSDGlOdekl7NSCYZE+qThcCzQds9e6ITGnfj25Re6yNrv9d0QmFu0spXHNlyEBDLM
 knAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737479200; x=1738084000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fmkc6bBb+HgSrw9XzuEaJgDnALN5HKYN9Bheo5qcDys=;
 b=TvjKfBPwJbdyy31kd0busvdwvmKTDrootPejUtRmE+PBZoohwcI0PUBB8Z6UxRX3Uw
 8JGlSD2dkMfsya03bgDmK+nWuHy6l1eKciHA3XtvBFI+SP1HSf2nDIl0RzHU934ghpUs
 WgU9Pmod1YC+cFlQU2TO2AFIlRsTnE8CPLx4O1I2byPNVRr7c7+piseauPRRg1rgor1e
 R7m0Al6PtTWnfzPl2uuqGuTmdECAm2x5oXTIwolPRRx7wG+Ze11QzA3YuM6zvKDaazcq
 MvyiVqN8bVUCZi1QHpH/c0O0Xon5hfxHSPw2dvFgXs2jIX0xIhspTtDslNZLImtvE2BW
 YHMg==
X-Gm-Message-State: AOJu0YwR6yyWM7aNy/Zw6wGniQwtT8++OWnwHn+du6Umsd+ZtTHgobBF
 0t6YFyRWT2jnsnnK+TslO4urQlErYoNyWkNys4awDOmLrW07tSvh9OnlepSYJOo=
X-Gm-Gg: ASbGncvGq/pfqAFSrQ2+qNVmL8Tp2SkuIoEWb33dZ3ub/P9Uw6m2Jcjn8PJLknn0Fx+
 dugEA37234zTTLLvkRA7rUNajVZ1dEcw+7NrFoDH8lzEe+xVSVMaaF3yeOQSN+vrj1fW8MxdwBV
 yVV4MnqYsfq74m0GxdHZ2Z7wZEatjFl1xO+dLqGjned0ENntB7L/ExNJlkl6Cjx2GfD9sM7zikL
 H766LMiiVsNb3OPYbY8o6gv1bTtYsZpEm5+CahQtnrhOlX2I1MwwqhrU5NEzTPKt3XTpII0
X-Google-Smtp-Source: AGHT+IErdRMpQCoLNBlwipWtVjo3PGdCzA1j6LReAYI4j6z0XUcVIdC48oiW2qR8n9LnZx8Ht3Ut9A==
X-Received: by 2002:a17:902:e84c:b0:216:6769:9eca with SMTP id
 d9443c01a7336-21c355b9442mr225226465ad.37.1737479199767; 
 Tue, 21 Jan 2025 09:06:39 -0800 (PST)
Received: from grind.. ([191.202.238.10]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2cfbbdf0sm80657825ad.105.2025.01.21.09.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 09:06:39 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 2/2] target/riscv: throw debug exception before page fault
Date: Tue, 21 Jan 2025 14:06:26 -0300
Message-ID: <20250121170626.1992570-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121170626.1992570-1-dbarboza@ventanamicro.com>
References: <20250121170626.1992570-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In the RISC-V privileged ISA section 3.1.15 table 15, it is determined
that a debug exception that is triggered from a load/store has a higher
priority than a possible fault that this access might trigger.

This is not the case ATM as shown in [1]. Adding a breakpoint in an
address that deliberately will fault is causing a load page fault
instead of a debug exception. The reason is that we're throwing in the
page fault as soon as the fault occurs (end of riscv_cpu_tlb_fill(),
raise_mmu_exception()), not allowing the installed watchpoints to
trigger.

Call cpu_check_watchpoint() in the page fault path to search and execute
any watchpoints that might exist for the address, never returning back
to the fault path. If no watchpoints are found cpu_check_watchpoint()
will return and we'll fall-through the regular path to
raise_mmu_exception().

[1] https://gitlab.com/qemu-project/qemu/-/issues/2627

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2627
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu_helper.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e1dfc4ecbf..df5de53379 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -27,6 +27,7 @@
 #include "exec/page-protection.h"
 #include "instmap.h"
 #include "tcg/tcg-op.h"
+#include "hw/core/tcg-cpu-ops.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
 #include "system/cpu-timers.h"
@@ -1708,6 +1709,23 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else if (probe) {
         return false;
     } else {
+        int wp_access = 0;
+
+        if (access_type == MMU_DATA_LOAD) {
+            wp_access |= BP_MEM_READ;
+        } else if (access_type == MMU_DATA_STORE) {
+            wp_access |= BP_MEM_WRITE;
+        }
+
+        /*
+         * If a watchpoint isn't found for 'addr' this will
+         * be a no-op and we'll resume the mmu_exception path.
+         * Otherwise we'll throw a debug exception and execution
+         * will continue elsewhere.
+         */
+        cpu_check_watchpoint(cs, address, size, MEMTXATTRS_UNSPECIFIED,
+                             wp_access, retaddr);
+
         raise_mmu_exception(env, address, access_type, pmp_violation,
                             first_stage_error, two_stage_lookup,
                             two_stage_indirect_error);
-- 
2.47.1


