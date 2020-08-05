Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3Nz1-0004h5-FM
	for mharc-qemu-riscv@gnu.org; Wed, 05 Aug 2020 14:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1k3Nyx-0004eT-L4
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2020 14:17:44 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1k3Nyv-0006V9-JU
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2020 14:17:43 -0400
Received: by mail-pg1-x544.google.com with SMTP id h12so13585028pgf.7
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2020 11:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YM01JZCOBFTkObfq+41JWuhzyHiJWJ7EohnvO1vdIJU=;
 b=E/xsOwj1out5jTDw1B6uHewMdZZssRhI0qYSGvOkDZ8q6nMosifaO3SUYGRsaBrefG
 lCS6oar456DouWXOhlB8jJwebXTQJBkXUBBT3yMi31IV4n5ivkGztic6TDWfqGKUTl5J
 dAlDI4wDLoElA1Q13fhWkuZPLGirHNQtYZtr5WQyIXDJFAs/T0fzVaQZ5E1tBjz1E//v
 cLbSnZVD5h+HDdfIPibvT7lx4V5TC18YZc3vgwxZLDCp+E9ZEHLOre+dDUhrjxPxDDyD
 ETTYsY8MPdmf7V0Kgh2qNVG73U/Heu4NEuXS+HXK0q5RG4oD5BFGQqJXDJAI9Me8IAoI
 vuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YM01JZCOBFTkObfq+41JWuhzyHiJWJ7EohnvO1vdIJU=;
 b=fyiUQr4kaVEz59x6iJXzt8CC8dHoBSApt+XvfBTN7B9lYopsZmw6sN5gOd5hyAELve
 1kcm7/h1Rl6/OyzpPT88OrAeEcrHE8kCyAOmSBuRNbZIk9GQTLRN40LxZvDVYMNgeNPv
 n9I6hLg3ge6c1kOi8RasRAJXxcgMxHsCf5GubkxvcaaoF5MGDUc64roHyykCDhaZzQYy
 Jm2mXrgiiMx3SJdsoCm53yEtkFdBlLyyMAb7HGoDTuW8hz5Gu8fia0rj8m0hoALtDB9O
 uf1fJIcaea+QWwbKx4ofiSSe4SRlgYlisgl66+aSNc2cjj1AYW6Te8umNnairqh9fQGm
 5SBA==
X-Gm-Message-State: AOAM530un84JrohuSlR2MsmQyU5AzgaDRz/thHXEdYVKC837XhssQnPr
 pQcnPnM8tQtK+DlIokIntRqpWw==
X-Google-Smtp-Source: ABdhPJxjuA9Ylj1mq4sVihjlFA2l6FIIAeNxChpioXsJuOaar6eJVj1oCra0DTnrID81k0Z6xroI4A==
X-Received: by 2002:a62:647:: with SMTP id 68mr4820009pfg.45.1596651460295;
 Wed, 05 Aug 2020 11:17:40 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:38ab:50b1:ff8a:26ef])
 by smtp.gmail.com with ESMTPSA id a15sm3670196pfo.185.2020.08.05.11.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 11:17:39 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, cota@braap.org, pbonzini@redhat.com,
 peter.puhov@linaro.org, robert.foley@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v1 15/21] target/riscv: add BQL to do_interrupt and
 cpu_exec_interrupt
Date: Wed,  5 Aug 2020 14:12:57 -0400
Message-Id: <20200805181303.7822-16-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805181303.7822-1-robert.foley@linaro.org>
References: <20200805181303.7822-1-robert.foley@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=robert.foley@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Aug 2020 18:17:45 -0000

This is part of a series of changes to remove the implied BQL
from the common code of cpu_handle_interrupt and
cpu_handle_exception.  As part of removing the implied BQL
from the common code, we are pushing the BQL holding
down into the per-arch implementation functions of
do_interrupt and cpu_exec_interrupt.

The purpose of this set of changes is to set the groundwork
so that an arch could move towards removing
the BQL from the cpu_handle_interrupt/exception paths.

This approach was suggested by Paolo Bonzini.
For reference, here are two key posts in the discussion, explaining
the reasoning/benefits of this approach.
https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg08731.html
https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00044.html

Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/riscv/cpu_helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 75d2ae3434..5050802e95 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -80,14 +80,17 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
 #if !defined(CONFIG_USER_ONLY)
     if (interrupt_request & CPU_INTERRUPT_HARD) {
+        qemu_mutex_lock_iothread();
         RISCVCPU *cpu = RISCV_CPU(cs);
         CPURISCVState *env = &cpu->env;
         int interruptno = riscv_cpu_local_irq_pending(env);
         if (interruptno >= 0) {
             cs->exception_index = RISCV_EXCP_INT_FLAG | interruptno;
             riscv_cpu_do_interrupt(cs);
+            qemu_mutex_unlock_iothread();
             return true;
         }
+        qemu_mutex_unlock_iothread();
     }
 #endif
     return false;
@@ -822,6 +825,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
  */
 void riscv_cpu_do_interrupt(CPUState *cs)
 {
+    bool bql = !qemu_mutex_iothread_locked();
+    if (bql) {
+        qemu_mutex_lock_iothread();
+    }
 #if !defined(CONFIG_USER_ONLY)
 
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -982,4 +989,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
 #endif
     cs->exception_index = EXCP_NONE; /* mark handled to qemu */
+    if (bql) {
+        qemu_mutex_unlock_iothread();
+    }
 }
-- 
2.17.1


