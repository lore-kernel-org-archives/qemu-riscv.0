Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWcn5-0003Ca-FX
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 07:39:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcn1-00033Y-6u
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 07:39:35 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcmz-0001F3-Am
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 07:39:34 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so4006610wms.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Feb 2023 04:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHkorEEx1ryMbtnru8OP+7VqvXYQH8B0BY1UFqCCXgs=;
 b=LAjrBcoFJHFyCKj5Wso9HN81hN/uyLx8R7vsT4Fdp1fvGCOLv3R8GCT8HUZ9pPmXW0
 gw3occjFJrophu+7cFvnsFFUSah0DWzMGMw91snD1SSN99ZgEhS1NNvKAlPg2VB8g6Wz
 PWYKrYrSeiUoFa8AeFMLEaMT2yB3lBa/wx1OWgVh2QtLGe+l+jiSfIs5BXs2Y2OBhu9M
 UmGQ5zWMucKzfyzguREUkNmIwn30LK1Oz0bnjLtZMaPwhDAhJHpo+99t3R8ViJOvqxyp
 5UfO7DjQ04Yf6vhejhmHTMDf5yvQcXtERN9sB7H77BYmMkuG3b3wvElzNLP6zEI4wb4t
 J8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHkorEEx1ryMbtnru8OP+7VqvXYQH8B0BY1UFqCCXgs=;
 b=IRbeXjN0cyIQQWymjdL0f6ybYfOq3z7WTvZHgNV562vJgFMNqtrrnSFCAUv4OOk/5D
 N8wnaNPBxE3L7loAMTv5aU0oEFalVVLnCtAHYKZDkZhMIej9KepZsKxa4nUtWa7fb6IE
 3W77Xo8tO0T2K/16pUySda9Wbf9r6K9uAuYS5yq+i2gVQkUaoNMQybWG/m7Ym9Tax7n2
 NzZCHtTRrU9Mnlv1vMn2i+a9IMtDGiYafTU/1LXGZWcNso/MdtRtFjhh5m4mdzfMHqww
 pZ9L6petJyUMfCgNaJk1J1Plkf30Bw5DpZVdwzaxgzHjYDCaUcFAw52LDRNxFt8Bc0oC
 /pwg==
X-Gm-Message-State: AO0yUKXOJHcRABuTFxiFkNCI5Lib+i18f81zV2qpSmmZYKStiVe4Z0sL
 lQJYhfZyU3Hmz0ZOUXJOfr3F+Q==
X-Google-Smtp-Source: AK7set/xS92XldLxNa74XIKvAtUSZ1RLIQSR5LQgodE8g2myblZADAl1R9HM/+6T9ONxR09DYtGohg==
X-Received: by 2002:a05:600c:1895:b0:3df:1673:90b6 with SMTP id
 x21-20020a05600c189500b003df167390b6mr18937339wmp.39.1677501571969; 
 Mon, 27 Feb 2023 04:39:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a7bc3d9000000b003e896d953a8sm12632266wmj.17.2023.02.27.04.39.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 04:39:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PULL 006/123] target/cpu: Restrict do_transaction_failed() handlers
 to sysemu
Date: Mon, 27 Feb 2023 13:36:50 +0100
Message-Id: <20230227123847.27110-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227123847.27110-1-philmd@linaro.org>
References: <20230227123847.27110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 12:39:35 -0000

The 'hwaddr' type is only available / meaningful on system emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221216215519.5522-6-philmd@linaro.org>
---
 target/arm/internals.h |  2 ++
 target/m68k/cpu.h      |  2 ++
 target/riscv/cpu.h     | 10 +++++-----
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 759b70c646..2ad4fc4633 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -614,6 +614,7 @@ G_NORETURN void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                             MMUAccessType access_type,
                                             int mmu_idx, uintptr_t retaddr);
 
+#ifndef CONFIG_USER_ONLY
 /* arm_cpu_do_transaction_failed: handle a memory system error response
  * (eg "no device/memory present at address") by raising an external abort
  * exception
@@ -623,6 +624,7 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                    MMUAccessType access_type,
                                    int mmu_idx, MemTxAttrs attrs,
                                    MemTxResult response, uintptr_t retaddr);
+#endif
 
 /* Call any registered EL change hooks */
 static inline void arm_call_pre_el_change_hook(ARMCPU *cpu)
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 68ed531fc3..048d5aae2b 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -581,10 +581,12 @@ static inline int cpu_mmu_index (CPUM68KState *env, bool ifetch)
 bool m68k_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
+#ifndef CONFIG_USER_ONLY
 void m68k_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                  unsigned size, MMUAccessType access_type,
                                  int mmu_idx, MemTxAttrs attrs,
                                  MemTxResult response, uintptr_t retaddr);
+#endif
 
 #include "exec/cpu-all.h"
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index df9cbc0d3f..d8e72c3e7c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -579,11 +579,6 @@ G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
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
 
@@ -591,6 +586,11 @@ void riscv_cpu_list(void);
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
+void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                     vaddr addr, unsigned size,
+                                     MMUAccessType access_type,
+                                     int mmu_idx, MemTxAttrs attrs,
+                                     MemTxResult response, uintptr_t retaddr);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
-- 
2.38.1


