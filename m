Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6Iga-00043c-Eg
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 16:56:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IgV-00041D-Ow
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 16:56:03 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IgS-0003Bu-E8
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 16:56:03 -0500
Received: by mail-ej1-x634.google.com with SMTP id gh17so9236032ejb.6
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 13:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pk8E2AjZn31oa9IhgwNXOyvN0Kf6YBgcqfW7HGQm56M=;
 b=Dw0tCLftkXtEaitQ5Jly8qTyc8IMfcBrJglEK9yS36kfuJZ8Sz6FWVga9H3oEkx6ks
 vedh5zXZUfjlH3Bd2n2N93QHuyIaDjY+bi49BSexONf3xQGHp4IXd72BoyPCzNq4Df+L
 JrAuSLehYrSvXkHLDuZtTIFah0Z+T46mmZcs3IxHSteIZ8S0+0hdk3+fAT5c+oGOC1lf
 /6cb6ph8w5XEZWG1XjgY6QQgLAMMjks4ZJcz5UIsDHhdDr4a0Zq++0M3k8FvAaTDxedh
 MLV78rP7yB4yy0n2KV1G7CMIRTwS0WUXPlBmvN6HsuupiC4gK/XQ18lybnGi2fR2vJdk
 paYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pk8E2AjZn31oa9IhgwNXOyvN0Kf6YBgcqfW7HGQm56M=;
 b=oJcy3xsTKUuWTMx7tfS619BThxdMjCUUy+Lj6U/L/XM8DeY10aUSGfuAArq2HWbKdP
 kcVZ1VxHBhR+qB6IoLGgB+Fjy9UeW888NqDK9hSrK9vmPPh9VRsSnfHyCFGADTUuV7RL
 3qQPu2gQWc34jH4ok4Rbao5mdX41V66AoqJe+ZlhaJvpQa1CKafO39Llnlq04D6JvxOP
 xBlGKMWa010W7DC17h/4yRCCMpZ9zhX2ql/KltydNOqMRu86Wd/B8Kh/KoNIso5ajG/Z
 4YSEjw/xEpFXHfDjW0ttOvM/Mrbn9Y+ULFovnznpLas8ZLGFShm7aPKJvjRP/Z0vYlsX
 nIFg==
X-Gm-Message-State: ANoB5pkm2dpP7BTi5H3W5eOUi6a3fEGO4/+dKPEMw3nwtP1LYU+G4f4e
 nFHiEll1q7W2D3PFarh4Jt5YZg==
X-Google-Smtp-Source: AA0mqf5C/EOPursnJ8tMWp/JMeEiPXZqq3kciTnDo0W7NNU0c8QnFiXjCEmk1jRk5QQq0uZsNX9Upw==
X-Received: by 2002:a17:906:d10d:b0:7c1:4623:400e with SMTP id
 b13-20020a170906d10d00b007c14623400emr18254030ejz.16.1671227759469; 
 Fri, 16 Dec 2022 13:55:59 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 27-20020a170906301b00b00782539a02absm1278990ejz.194.2022.12.16.13.55.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 13:55:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Marek Vasut <marex@denx.de>,
 Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>
Subject: [PATCH v3 5/5] target/cpu: Restrict do_transaction_failed() handlers
 to sysemu
Date: Fri, 16 Dec 2022 22:55:19 +0100
Message-Id: <20221216215519.5522-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216215519.5522-1-philmd@linaro.org>
References: <20221216215519.5522-1-philmd@linaro.org>
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
X-List-Received-Date: Fri, 16 Dec 2022 21:56:04 -0000

The 'hwaddr' type is only available / meaningful on system emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h |  2 ++
 target/m68k/cpu.h      |  2 ++
 target/riscv/cpu.h     | 10 +++++-----
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 161e42d50f..14eb791226 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -624,6 +624,7 @@ G_NORETURN void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                             MMUAccessType access_type,
                                             int mmu_idx, uintptr_t retaddr);
 
+#ifndef CONFIG_USER_ONLY
 /* arm_cpu_do_transaction_failed: handle a memory system error response
  * (eg "no device/memory present at address") by raising an external abort
  * exception
@@ -633,6 +634,7 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
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
index 758336295b..fc1f72e5c3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -559,11 +559,6 @@ G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
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
 
@@ -571,6 +566,11 @@ void riscv_cpu_list(void);
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


