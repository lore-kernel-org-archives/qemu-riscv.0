Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6Iqt-0000hq-F0
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 17:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iqp-0000fc-3s
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 17:06:43 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iql-0005if-Dv
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 17:06:42 -0500
Received: by mail-ej1-x634.google.com with SMTP id tz12so9247179ejc.9
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 14:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKk4+6qTXmgaYyPsv6k9eMYUz9uXm7tmF1K/e5qW2CU=;
 b=zBRbg6X9TEhk6XXN3GVh6Kh9MzTp2KOt9mnVwQ/I0IT3ScIOWqUOYp2JzT38/KmNkT
 xT1sToARe44GrtXNEbVF/wemOvayGCG6ixeJLkS/2rb2Qj3Yjmyww76b4+AgT6DCNY/l
 AnrBfogvMEAfgN+XA2RHu5NsRPx1kH6ZAfxn17G9siihb8eNR29JpWdbgA8TGAvKRvgw
 RH4/YGqUCdmm2ei2IJrTeY7ctw3PMLjJIjWnTfToIkmPQHXlfTwFJh18um/UTLN8TqCd
 DuzqKJ3f0t2AL8F/0gkIpVm4CUPUfIDJ/gg5dPyAtnM9F/pQDD7j2MkmwfYuk97SY3D7
 cpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKk4+6qTXmgaYyPsv6k9eMYUz9uXm7tmF1K/e5qW2CU=;
 b=M2fyFRLuL+RTvL8P3UzYrI4RCY36D8HnJrUFyeAWMw8U82soJicMmXXpS/sqlXknZa
 ID9BJZep/jTyoJlDobvEo8VRNfiO9iEfI6gpr971II76PMjRV7eUN73jhnNNmUfuEuys
 rWDWmhQP/bKhhIj0TkIYrA4G7sp0mf444aDGeKy4OEQMuep7DdYs/RG0glzFqkceFmtn
 ep5Ed1A2TMbWA92E3+zJkd27Ly4GTid4rJ4DbXuA5agvZfH0evO+Ftr2xDuZBWjz863N
 o8rdcB7qpAyJPdzmzP3r8AyFgoqjnKTM5/AodrXcDVpomLf92Gc+ZrEF48n1FhHP509/
 KGFA==
X-Gm-Message-State: ANoB5pns5XuJb/cGxYmeWnX8Pe8Ccu+btql2Ll7/49sq4iUi+Ie6Ulou
 OeCgu5lJQaVVndoT/AuinAkNmw==
X-Google-Smtp-Source: AA0mqf49JST9AU3ICWc7NLG8TXKcARI1VlUSFvyP7hzWBR314l7xwyifOgzYsgO8ig1maAraQpAXfQ==
X-Received: by 2002:a17:906:a157:b0:7ae:83f4:3bf5 with SMTP id
 bu23-20020a170906a15700b007ae83f43bf5mr28725376ejb.68.1671228397655; 
 Fri, 16 Dec 2022 14:06:37 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a170906090900b007b9269a0423sm1302927ejd.172.2022.12.16.14.06.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:06:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/10] target/riscv/cpu: Restrict sysemu-specific fields from
 CPUArchState
Date: Fri, 16 Dec 2022 23:05:37 +0100
Message-Id: <20221216220539.7065-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220539.7065-1-philmd@linaro.org>
References: <20221216220539.7065-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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
X-List-Received-Date: Fri, 16 Dec 2022 22:06:45 -0000

The 'hwaddr' type is only available / meaningful on system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.h | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fc1f72e5c3..bd4e16d946 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -368,16 +368,6 @@ struct CPUArchState {
     uint64_t menvcfg;
     target_ulong senvcfg;
     uint64_t henvcfg;
-#endif
-    target_ulong cur_pmmask;
-    target_ulong cur_pmbase;
-
-    float_status fp_status;
-
-    /* Fields from here on are preserved across CPU reset. */
-    QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
-    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
-    bool vstime_irq;
 
     hwaddr kernel_addr;
     hwaddr fdt_addr;
@@ -388,6 +378,16 @@ struct CPUArchState {
     uint64_t kvm_timer_compare;
     uint64_t kvm_timer_state;
     uint64_t kvm_timer_frequency;
+#endif
+    target_ulong cur_pmmask;
+    target_ulong cur_pmbase;
+
+    float_status fp_status;
+
+    /* Fields from here on are preserved across CPU reset. */
+    QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
+    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
+    bool vstime_irq;
 };
 
 OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
@@ -553,12 +553,20 @@ bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
+#ifndef CONFIG_USER_ONLY
+hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                                MMUAccessType access_type, int mmu_idx,
                                                uintptr_t retaddr);
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
+void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                     vaddr addr, unsigned size,
+                                     MMUAccessType access_type,
+                                     int mmu_idx, MemTxAttrs attrs,
+                                     MemTxResult response, uintptr_t retaddr);
+#endif
 char *riscv_isa_string(RISCVCPU *cpu);
 void riscv_cpu_list(void);
 
@@ -566,12 +574,6 @@ void riscv_cpu_list(void);
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
-void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
-                                     vaddr addr, unsigned size,
-                                     MMUAccessType access_type,
-                                     int mmu_idx, MemTxAttrs attrs,
-                                     MemTxResult response, uintptr_t retaddr);
-hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
-- 
2.38.1


