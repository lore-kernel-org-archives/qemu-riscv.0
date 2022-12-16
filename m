Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6IgV-000412-Ml
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 16:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IgM-0003sa-O2
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 16:55:54 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IgK-00038R-7z
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 16:55:54 -0500
Received: by mail-ej1-x636.google.com with SMTP id kw15so9168748ejc.10
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 13:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R64IlhE62Gce7WWHy+/lvlA4aB3WoOCUIDwNh/Ggh4k=;
 b=tTFKiSJTmiAU6RGbXkTjZqiGVVHLc9mvreSJtdRrsSJdIh8JpiZURabsi6f1+dsJpy
 hp75Fiw/QajcTsLfJo5uNhx9QoLU1cYHa8NwzHxRgBTESu58r3wDu0sgLIqBXCurAhMY
 hSIZmV68HDJrvpnlmzrUKTP/3e+nQcz9CgbKojV30wtKOchX4szOy/79nUW06VL3wQ1I
 UeHVtMciQdxJAu4BhH/zhvUDM217fWzlVPpBcvA1nHX6n+VfRlmSCLrRA1JMFHXWcvwO
 hsTjUTz5lXd5+O6VlVwEdwQUVmCvrcYxRawMRqXQDfwOphXdm32LTpHbSU339rJmyo5H
 nvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R64IlhE62Gce7WWHy+/lvlA4aB3WoOCUIDwNh/Ggh4k=;
 b=FhCAtOPogCrnSNerYOVwQozmefUZ4HEB3MiLHnvOQlMeyegvzXAWuSzE/wwlZyY2tI
 yhbkKOHEb3G5Cwru9dCFUpxW2FTRazTzoO+powu2J8oUlA2Rsh97YkgSrNa8pbvXBQE1
 uyXoQraMXnMEvhCR1cCidCyVuFOJ4cYDv21l5yTX9pcQQXIHrEirLtPK9VkzCPG4Yvik
 rAk36olNatUYE8mTMNTIIMYat3gS3GB0wNW5jhyN7wDkhJVrkG0sGp0/8/zq3sbWc3i+
 VeY9Ox3diopKBjszst1sMxyixOyR92VU/9T1DcHgoUNOJsrIJd/L1PA8bopW9m9EMjl+
 TVhQ==
X-Gm-Message-State: ANoB5pnuZXT2+Ull9fP+/I3iWCtyOcjjTuC8oXxLS8AbIMRp162lPtjT
 rXt+EsSY1msgSIvMvWBudTlC7Q==
X-Google-Smtp-Source: AA0mqf4CHlpVjyF2LUnBhjJp7fi5UEGCxWpRuntiNQe1lbsIy5CN7LxDHuc/W9Yrj/II4mH5TEBS6A==
X-Received: by 2002:a17:907:11dd:b0:7c1:1b1c:5ecb with SMTP id
 va29-20020a17090711dd00b007c11b1c5ecbmr30591605ejb.7.1671227751525; 
 Fri, 16 Dec 2022 13:55:51 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a170906944100b007c491f53497sm1287645ejx.170.2022.12.16.13.55.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 13:55:51 -0800 (PST)
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
Subject: [PATCH v3 4/5] target/cpu: Restrict cpu_get_phys_page_debug()
 handlers to sysemu
Date: Fri, 16 Dec 2022 22:55:18 +0100
Message-Id: <20221216215519.5522-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216215519.5522-1-philmd@linaro.org>
References: <20221216215519.5522-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
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
X-List-Received-Date: Fri, 16 Dec 2022 21:55:57 -0000

The 'hwaddr' type is only available / meaningful on system emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/alpha/cpu.h      | 2 +-
 target/arm/cpu.h        | 2 +-
 target/cris/cpu.h       | 3 +--
 target/hppa/cpu.h       | 2 +-
 target/i386/cpu.h       | 5 ++---
 target/m68k/cpu.h       | 2 +-
 target/microblaze/cpu.h | 4 ++--
 target/nios2/cpu.h      | 2 +-
 target/openrisc/cpu.h   | 3 ++-
 target/ppc/cpu.h        | 2 +-
 target/riscv/cpu.h      | 2 +-
 target/rx/cpu.h         | 2 +-
 target/rx/helper.c      | 4 ++--
 target/sh4/cpu.h        | 2 +-
 target/sparc/cpu.h      | 3 ++-
 target/xtensa/cpu.h     | 2 +-
 16 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index d0abc949a8..5e67304d81 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -276,9 +276,9 @@ extern const VMStateDescription vmstate_alpha_cpu;
 
 void alpha_cpu_do_interrupt(CPUState *cpu);
 bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
+hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif /* !CONFIG_USER_ONLY */
 void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
-hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2b4bd20f9d..38c7e5c8af 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1085,10 +1085,10 @@ extern const VMStateDescription vmstate_arm_cpu;
 
 void arm_cpu_do_interrupt(CPUState *cpu);
 void arm_v7m_cpu_do_interrupt(CPUState *cpu);
-#endif /* !CONFIG_USER_ONLY */
 
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                          MemTxAttrs *attrs);
+#endif /* !CONFIG_USER_ONLY */
 
 int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index e6776f25b1..71fa1f96e0 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -193,12 +193,11 @@ bool cris_cpu_exec_interrupt(CPUState *cpu, int int_req);
 bool cris_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
+hwaddr cris_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif
 
 void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 
-hwaddr cris_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-
 int crisv10_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int cris_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int cris_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 6f3b6beecf..b595ef25a9 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -322,11 +322,11 @@ static inline void cpu_hppa_change_prot_id(CPUHPPAState *env) { }
 void cpu_hppa_change_prot_id(CPUHPPAState *env);
 #endif
 
-hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
 int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void hppa_cpu_dump_state(CPUState *cs, FILE *f, int);
 #ifndef CONFIG_USER_ONLY
+hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
 bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d4bc19577a..f729e0f09c 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1987,9 +1987,6 @@ void x86_cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 
 void x86_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 
-hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
-                                         MemTxAttrs *attrs);
-
 int x86_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int x86_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
@@ -1997,6 +1994,8 @@ void x86_cpu_list(void);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
 #ifndef CONFIG_USER_ONLY
+hwaddr x86_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                         MemTxAttrs *attrs);
 int cpu_get_pic_interrupt(CPUX86State *s);
 
 /* MSDOS compatibility mode FPU exception support */
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 3a9cfe2f33..68ed531fc3 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -176,9 +176,9 @@ struct ArchCPU {
 #ifndef CONFIG_USER_ONLY
 void m68k_cpu_do_interrupt(CPUState *cpu);
 bool m68k_cpu_exec_interrupt(CPUState *cpu, int int_req);
+hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif /* !CONFIG_USER_ONLY */
 void m68k_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int m68k_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int m68k_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 1e84dd8f47..dc51eb6ca9 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -358,13 +358,13 @@ struct ArchCPU {
 #ifndef CONFIG_USER_ONLY
 void mb_cpu_do_interrupt(CPUState *cs);
 bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);
+hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                        MemTxAttrs *attrs);
 #endif /* !CONFIG_USER_ONLY */
 G_NORETURN void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                            MMUAccessType access_type,
                                            int mmu_idx, uintptr_t retaddr);
 void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
-                                        MemTxAttrs *attrs);
 int mb_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int mb_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index f85581ee56..2f43b67a8f 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -262,7 +262,6 @@ void nios2_tcg_init(void);
 void nios2_cpu_do_interrupt(CPUState *cs);
 void dump_mmu(CPUNios2State *env);
 void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 G_NORETURN void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                               MMUAccessType access_type, int mmu_idx,
                                               uintptr_t retaddr);
@@ -288,6 +287,7 @@ static inline int cpu_mmu_index(CPUNios2State *env, bool ifetch)
 }
 
 #ifndef CONFIG_USER_ONLY
+hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 1d5efa5ca2..31a4ae5ad3 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -312,7 +312,6 @@ struct ArchCPU {
 
 void cpu_openrisc_list(void);
 void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int openrisc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void openrisc_translate_init(void);
@@ -321,6 +320,8 @@ int print_insn_or1k(bfd_vma addr, disassemble_info *info);
 #define cpu_list cpu_openrisc_list
 
 #ifndef CONFIG_USER_ONLY
+hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+
 bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                            MMUAccessType access_type, int mmu_idx,
                            bool probe, uintptr_t retaddr);
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 81d4263a07..6a7a8634da 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1346,12 +1346,12 @@ static inline bool vhyp_cpu_in_nested(PowerPCCPU *cpu)
 #endif /* CONFIG_USER_ONLY */
 
 void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf, int reg);
 int ppc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int reg);
 #ifndef CONFIG_USER_ONLY
+hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void ppc_gdb_gen_spr_xml(PowerPCCPU *cpu);
 const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3a9e25053f..758336295b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -553,7 +553,6 @@ bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
-hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                                MMUAccessType access_type, int mmu_idx,
                                                uintptr_t retaddr);
@@ -572,6 +571,7 @@ void riscv_cpu_list(void);
 #define cpu_mmu_index riscv_cpu_mmu_index
 
 #ifndef CONFIG_USER_ONLY
+hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 5655dffeff..555d230f24 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -123,11 +123,11 @@ const char *rx_crname(uint8_t cr);
 #ifndef CONFIG_USER_ONLY
 void rx_cpu_do_interrupt(CPUState *cpu);
 bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);
+hwaddr rx_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif /* !CONFIG_USER_ONLY */
 void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-hwaddr rx_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
 void rx_translate_init(void);
 void rx_cpu_list(void);
diff --git a/target/rx/helper.c b/target/rx/helper.c
index f34945e7e2..dad5fb4976 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -144,9 +144,9 @@ bool rx_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
-#endif /* !CONFIG_USER_ONLY */
-
 hwaddr rx_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     return addr;
 }
+
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 727b829598..02bfd612ea 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -214,7 +214,6 @@ struct ArchCPU {
 
 
 void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 G_NORETURN void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
@@ -225,6 +224,7 @@ void sh4_translate_init(void);
 void sh4_cpu_list(void);
 
 #if !defined(CONFIG_USER_ONLY)
+hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr);
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index e478c5eb16..ed0069d0b1 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -569,10 +569,11 @@ struct ArchCPU {
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_sparc_cpu;
+
+hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif
 
 void sparc_cpu_do_interrupt(CPUState *cpu);
-hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 579adcb769..b7a54711a6 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -576,9 +576,9 @@ void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
+hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 #endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
                        unsigned *n_regs, unsigned *n_core_regs);
 int xtensa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-- 
2.38.1


