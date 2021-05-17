Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liaqx-0004So-NN
	for mharc-qemu-riscv@gnu.org; Mon, 17 May 2021 06:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liaqs-0004KW-Pl; Mon, 17 May 2021 06:51:58 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liaqp-0006Lm-PU; Mon, 17 May 2021 06:51:58 -0400
Received: by mail-wr1-x429.google.com with SMTP id v12so5873420wrq.6;
 Mon, 17 May 2021 03:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J++NDLnF3ZLjQJuDikbfz+qqlVxXQCnKQi7mCfFvCw8=;
 b=mZTsOjj3LWDbZgvFyA7NV3RaiQb1WFhBGbE1A1hLQLSWZ6lbo9cF/JTYOaDceQ+ZR4
 ZnUESu8TKoJuRoL2A/ujqULQjEg2laKgYu8Z+UwG/dziXYracDTo6VJw26wq5LMW/VU0
 vObsTR2/yjxbdBvJHwDtPNC5r9XPXnd03o5/fKog96aqtxbv4fjVMr8fwlDrujWrBkTG
 gtqqkLDwXEZhZdPJDpcsN8XZrETQCfLhDNC5Y/zUFsARR1yN0UcX352zl9homP9Qy/pm
 4myGEfTSWFr5c9l6tktkzx8odsuSEykaxWDPbax4WEYcSXucDgct69PGNnnHEAIorZ3J
 ih5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J++NDLnF3ZLjQJuDikbfz+qqlVxXQCnKQi7mCfFvCw8=;
 b=GYI0SpCJWHkMHJOymr6Zm1qVF1NOnYi2hWvXZ1brwOm6++9Z7O1TmDuItvQbBHrTLd
 RWpxei/IMRHDZFToYS6Qr5kj4KnwbwZ3kudVEZ5rgLZ2d6C7xssmhhG5l5tjTOf7VXbj
 81FCdNWhYdh+0Wb1PlrO3gv9UJt/4KrTyobZ7PXa9ZP9gi1djEIEbGx8/HAL/3DpDzLC
 brurkgBQrRqNwNGJbywapH1G5GM1pOViX+uveiZzcn1kQc+aYYPJ7n7g1BRy/qrRhWnZ
 EuRA+rM619o5lsIURRl5T1ThZ9d6Xq/+4anqljhMt1EdaeOuUHAUqZpfPiUa3rG+rieE
 7O0Q==
X-Gm-Message-State: AOAM531J3cjLVIlRsFjvFBEz5f4HsAduCGZu2j3/8zYMy7Fg6Gm68l8S
 7dw9tp11DHDHX+5PDAV9LIqr1hGhvQ2T4g==
X-Google-Smtp-Source: ABdhPJzv3VIwKFhk6zkwm9PrX+5xBZFFYOPB7ZnN/gWssFbJ0ycPkS71ak1ykFXNEIMtnjcn8jX/PA==
X-Received: by 2002:a5d:4c48:: with SMTP id n8mr17063451wrt.422.1621248712701; 
 Mon, 17 May 2021 03:51:52 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t13sm349995wmi.2.2021.05.17.03.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:51:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 02/23] cpu: Restrict target cpu_do_transaction_failed()
 handlers to sysemu
Date: Mon, 17 May 2021 12:51:19 +0200
Message-Id: <20210517105140.1062037-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 May 2021 10:52:01 -0000

In commit cbc183d2d9f ("cpu: move cc->transaction_failed to tcg_ops")
we restricted the do_transaction_failed() handler to the sysemu part
of TCGCPUOps, but forgot to restrict the target specific declarations.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/internals.h |  2 ++
 target/m68k/cpu.h      |  2 ++
 target/riscv/cpu.h     | 10 +++++-----
 target/xtensa/cpu.h    |  8 ++++----
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 886db56b580..3614f6dd988 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -583,6 +583,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
                                  int mmu_idx, uintptr_t retaddr);
 
+#if !defined(CONFIG_USER_ONLY)
 /* arm_cpu_do_transaction_failed: handle a memory system error response
  * (eg "no device/memory present at address") by raising an external abort
  * exception
@@ -592,6 +593,7 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                    MMUAccessType access_type,
                                    int mmu_idx, MemTxAttrs attrs,
                                    MemTxResult response, uintptr_t retaddr);
+#endif
 
 /* Call any registered EL change hooks */
 static inline void arm_call_pre_el_change_hook(ARMCPU *cpu)
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 402c86c8769..cf58fee9ada 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -572,10 +572,12 @@ static inline int cpu_mmu_index (CPUM68KState *env, bool ifetch)
 bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
+#if !defined(CONFIG_USER_ONLY)
 void m68k_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                  unsigned size, MMUAccessType access_type,
                                  int mmu_idx, MemTxAttrs attrs,
                                  MemTxResult response, uintptr_t retaddr);
+#endif
 
 typedef CPUM68KState CPUArchState;
 typedef M68kCPU ArchCPU;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0619b491a42..aa19d8f304e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -346,11 +346,6 @@ void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
-void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
-                                     vaddr addr, unsigned size,
-                                     MMUAccessType access_type,
-                                     int mmu_idx, MemTxAttrs attrs,
-                                     MemTxResult response, uintptr_t retaddr);
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
 
@@ -359,6 +354,11 @@ void riscv_cpu_list(void);
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
+void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                     vaddr addr, unsigned size,
+                                     MMUAccessType access_type,
+                                     int mmu_idx, MemTxAttrs attrs,
+                                     MemTxResult response, uintptr_t retaddr);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
 uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 3bd4f691c1a..cbe9e5ff230 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -569,10 +569,6 @@ bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          bool probe, uintptr_t retaddr);
 void xtensa_cpu_do_interrupt(CPUState *cpu);
 bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
-void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
-                                      unsigned size, MMUAccessType access_type,
-                                      int mmu_idx, MemTxAttrs attrs,
-                                      MemTxResult response, uintptr_t retaddr);
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
@@ -675,6 +671,10 @@ static inline int xtensa_get_cring(const CPUXtensaState *env)
 }
 
 #ifndef CONFIG_USER_ONLY
+void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
+                                      unsigned size, MMUAccessType access_type,
+                                      int mmu_idx, MemTxAttrs attrs,
+                                      MemTxResult response, uintptr_t retaddr);
 int xtensa_get_physical_addr(CPUXtensaState *env, bool update_tlb,
         uint32_t vaddr, int is_write, int mmu_idx,
         uint32_t *paddr, uint32_t *page_size, unsigned *access);
-- 
2.26.3


