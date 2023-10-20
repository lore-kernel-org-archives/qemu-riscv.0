Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7C6C001DF
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:39:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtsUr-0002kU-Vz; Fri, 20 Oct 2023 12:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsUq-0002iR-4X
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:37:12 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsUn-0002PY-5Z
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:37:11 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9c773ac9b15so98617866b.2
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697819827; x=1698424627; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A7B1eCzypxeXFMF1kKBwY/8dmya6s2C6K0DgCBsTCTY=;
 b=OFeRltFLz23SmggeFti6TgqWHAHLLXJXpcRnwnC5QfbdUY06eShjfXBqibuv+96Ixs
 Z4bxWg/zHasn4kOKrPF1OTJTT6UnSDwJzDc0FAmc2C767h3GFCsLKZLPhzr8n72VVuHI
 E0RoLITqyCB47rRUFpYeRWLzt17sRxwBAASKNyvixnF1+dOnOa3+n03GRlmSSCIpDGmu
 Xe28WpMkm53tc9+2Gi38wjiyt6sfVHzbv0uRw6aWPDP1NmDqQZyyRlle7P3Snm5cfrV1
 SMN5gUdcgNNssK1mmS8ucOQyO7rG+EQZNQmfGLTRAKav6JybvDhYJ8Q8i9qH2bEuAx+4
 MBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819827; x=1698424627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A7B1eCzypxeXFMF1kKBwY/8dmya6s2C6K0DgCBsTCTY=;
 b=ed5lM0vUKnzqbeEjwhVke7+ApqCuNmtT6R+3gCGt1zQnQe4eQBJM7AeE/I5sEQPUzD
 9w3qGBqnSjPQ8i9mgmpn895b0VqizdOzncvGW2lSRR7LqMyzUQnUKhpQ6NQWf96lg0Iw
 wjvNGlxIObK0E9NdMNf4Vw8sx2MCi8Cgn/pjDP1AdE/eNN/Tw92sTMRylEZiAjSyMEja
 aNh31soGQgQ01FXXGhJXkR6WIIxIFc65P93Jx5rsPkoPqgYUqlvKEA+C0co1e7bmrafC
 C11s0A/XHCYVkVicJPU7qU/DhDvu+p5TYxkppVUb4hDDFhSNpQcLB6iwFHi6eZm9/GqP
 rK9w==
X-Gm-Message-State: AOJu0YwnGF3EfmwAbBZ/XFzhkxZkzUJgrGa1h939cqURIKGMxLnVjSU0
 D30InuiN7ROYhX3qTv1ibSERog==
X-Google-Smtp-Source: AGHT+IH3OFQCcej8C1Nu7bwhV2sk2BKDbXDxoaNocUKf/fpQXvZKWrYv0TGnQ8hTizssIQURr7pQlQ==
X-Received: by 2002:a17:907:9342:b0:9be:40ba:5f1 with SMTP id
 bv2-20020a170907934200b009be40ba05f1mr1910557ejc.60.1697819827449; 
 Fri, 20 Oct 2023 09:37:07 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 25-20020a170906005900b009c65e13c33dsm1780502ejg.122.2023.10.20.09.37.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 09:37:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Song Gao <gaosong@loongson.cn>,
 Thomas Huth <huth@tuxfamily.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 02/19] cpus: Filter for target specific CPU (generic)
Date: Fri, 20 Oct 2023 18:36:24 +0200
Message-ID: <20231020163643.86105-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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

When the CPUState is casted to a specific target, enforce
that target CPU type as qemu_get_cpu() filter.

Mechanical change using the following coccinelle script:

  @@
  expression index;
  @@
  (
  -   ARM_CPU(qemu_get_cpu(index, NULL))
  +   ARM_CPU(qemu_get_cpu(index, TYPE_ARM_CPU))
  |
  -   LOONGARCH_CPU(qemu_get_cpu(index, NULL))
  +   LOONGARCH_CPU(qemu_get_cpu(index, TYPE_LOONGARCH_CPU))
  |
  -   M68K_CPU(qemu_get_cpu(index, NULL))
  +   M68K_CPU(qemu_get_cpu(index, TYPE_M68K_CPU))
  |
  -   MIPS_CPU(qemu_get_cpu(index, NULL))
  +   MIPS_CPU(qemu_get_cpu(index, TYPE_MIPS_CPU))
  |
  -   RISCV_CPU(qemu_get_cpu(index, NULL))
  +   RISCV_CPU(qemu_get_cpu(index, TYPE_RISCV_CPU))
  |
  -   S390_CPU(qemu_get_cpu(index, NULL))
  +   S390_CPU(qemu_get_cpu(index, TYPE_S390_CPU))
  )

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/boot.c             |  2 +-
 hw/arm/pxa2xx_gpio.c      |  2 +-
 hw/arm/sbsa-ref.c         |  2 +-
 hw/arm/virt-acpi-build.c  |  2 +-
 hw/arm/virt.c             |  6 +++---
 hw/arm/xlnx-versal-virt.c |  2 +-
 hw/intc/arm_gicv3_cpuif.c |  2 +-
 hw/intc/arm_gicv3_kvm.c   |  2 +-
 hw/intc/riscv_aclint.c    |  2 +-
 hw/intc/sifive_plic.c     |  2 +-
 hw/loongarch/virt.c       |  6 +++---
 hw/m68k/mcf5206.c         |  2 +-
 target/mips/cpu.c         |  2 +-
 target/s390x/cpu_models.c | 10 +++++-----
 14 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index e260168cf5..f7def3a60c 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -438,7 +438,7 @@ static void fdt_add_psci_node(void *fdt)
     uint32_t cpu_off_fn;
     uint32_t cpu_on_fn;
     uint32_t migrate_fn;
-    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0, NULL));
+    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU));
     const char *psci_method;
     int64_t psci_conduit;
     int rc;
diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
index 0a698171ab..9795451f19 100644
--- a/hw/arm/pxa2xx_gpio.c
+++ b/hw/arm/pxa2xx_gpio.c
@@ -303,7 +303,7 @@ static void pxa2xx_gpio_realize(DeviceState *dev, Error **errp)
 {
     PXA2xxGPIOInfo *s = PXA2XX_GPIO(dev);
 
-    s->cpu = ARM_CPU(qemu_get_cpu(s->ncpu, NULL));
+    s->cpu = ARM_CPU(qemu_get_cpu(s->ncpu, TYPE_ARM_CPU));
 
     qdev_init_gpio_in(dev, pxa2xx_gpio_set, s->lines);
     qdev_init_gpio_out(dev, s->handler, s->lines);
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 3571d5038f..f6f64099c3 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -275,7 +275,7 @@ static void create_fdt(SBSAMachineState *sms)
 
     for (cpu = sms->smp_cpus - 1; cpu >= 0; cpu--) {
         char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
-        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu, NULL));
+        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu, TYPE_ARM_CPU));
         CPUState *cs = CPU(armcpu);
         uint64_t mpidr = sbsa_ref_cpu_mp_affinity(sms, cpu);
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index fd6c239c31..0d09007d9b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -727,7 +727,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, 0, 3);   /* Reserved */
 
     for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
-        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i, NULL));
+        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i, TYPE_ARM_CPU));
         uint64_t physical_base_address = 0, gich = 0, gicv = 0;
         uint32_t vgic_interrupt = vms->virt ? PPI(ARCH_GIC_MAINT_IRQ) : 0;
         uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a8f9d88519..be31ef5718 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -355,7 +355,7 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
 
     qemu_fdt_add_subnode(ms->fdt, "/timer");
 
-    armcpu = ARM_CPU(qemu_get_cpu(0, NULL));
+    armcpu = ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU));
     if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
         const char compat[] = "arm,armv8-timer\0arm,armv7-timer";
         qemu_fdt_setprop(ms->fdt, "/timer", "compatible",
@@ -394,7 +394,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
      * at least one of them has Aff3 populated, we set #address-cells to 2.
      */
     for (cpu = 0; cpu < smp_cpus; cpu++) {
-        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu, NULL));
+        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu, TYPE_ARM_CPU));
 
         if (armcpu->mp_affinity & ARM_AFF3_MASK) {
             addr_cells = 2;
@@ -408,7 +408,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 
     for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
         char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
-        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu, NULL));
+        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu, TYPE_ARM_CPU));
         CPUState *cs = CPU(armcpu);
 
         qemu_fdt_add_subnode(ms->fdt, nodename);
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 419ee3b882..2646b63b79 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -103,7 +103,7 @@ static void fdt_add_cpu_nodes(VersalVirt *s, uint32_t psci_conduit)
 
     for (i = XLNX_VERSAL_NR_ACPUS - 1; i >= 0; i--) {
         char *name = g_strdup_printf("/cpus/cpu@%d", i);
-        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i, NULL));
+        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i, TYPE_ARM_CPU));
 
         qemu_fdt_add_subnode(s->fdt, name);
         qemu_fdt_setprop_cell(s->fdt, name, "reg", armcpu->mp_affinity);
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index f765b3d4b5..3b11b33b3e 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2795,7 +2795,7 @@ void gicv3_init_cpuif(GICv3State *s)
     int i;
 
     for (i = 0; i < s->num_cpu; i++) {
-        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i, NULL));
+        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i, TYPE_ARM_CPU));
         GICv3CPUState *cs = &s->cpu[i];
 
         /*
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index d1ff9886aa..440a84f0fe 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -808,7 +808,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
     gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL);
 
     for (i = 0; i < s->num_cpu; i++) {
-        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i, NULL));
+        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i, TYPE_ARM_CPU));
 
         define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
     }
diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index a97c0449ec..7e57c03ef7 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -483,7 +483,7 @@ static void riscv_aclint_swi_realize(DeviceState *dev, Error **errp)
 
     /* Claim software interrupt bits */
     for (i = 0; i < swi->num_harts; i++) {
-        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(swi->hartid_base + i, NULL));
+        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(swi->hartid_base + i, TYPE_RISCV_CPU));
         /* We don't claim mip.SSIP because it is writable by software */
         if (riscv_cpu_claim_interrupts(cpu, swi->sswi ? 0 : MIP_MSIP) < 0) {
             error_report("MSIP already claimed");
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index a32e7f1924..3e2534ac04 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -392,7 +392,7 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
      * hardware controlled when a PLIC is attached.
      */
     for (i = 0; i < s->num_harts; i++) {
-        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i, NULL));
+        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i, TYPE_RISCV_CPU));
         if (riscv_cpu_claim_interrupts(cpu, MIP_SEIP) < 0) {
             error_setg(errp, "SEIP already claimed");
             return;
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index e888aea892..902e32a3e3 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -170,7 +170,7 @@ static void fdt_add_cpu_nodes(const LoongArchMachineState *lams)
     /* cpu nodes */
     for (num = smp_cpus - 1; num >= 0; num--) {
         char *nodename = g_strdup_printf("/cpus/cpu@%d", num);
-        LoongArchCPU *cpu = LOONGARCH_CPU(qemu_get_cpu(num, NULL));
+        LoongArchCPU *cpu = LOONGARCH_CPU(qemu_get_cpu(num, TYPE_LOONGARCH_CPU));
         CPUState *cs = CPU(cpu);
 
         qemu_fdt_add_subnode(ms->fdt, nodename);
@@ -726,7 +726,7 @@ static void loongarch_direct_kernel_boot(LoongArchMachineState *lams,
     kernel_addr = load_kernel_info(loaderparams);
     if (!machine->firmware) {
         for (i = 0; i < machine->smp.cpus; i++) {
-            lacpu = LOONGARCH_CPU(qemu_get_cpu(i, NULL));
+            lacpu = LOONGARCH_CPU(qemu_get_cpu(i, TYPE_LOONGARCH_CPU));
             lacpu->env.load_elf = true;
             lacpu->env.elf_address = kernel_addr;
         }
@@ -859,7 +859,7 @@ static void loongarch_init(MachineState *machine)
     fdt_add_flash_node(lams);
     /* register reset function */
     for (i = 0; i < machine->smp.cpus; i++) {
-        lacpu = LOONGARCH_CPU(qemu_get_cpu(i, NULL));
+        lacpu = LOONGARCH_CPU(qemu_get_cpu(i, TYPE_LOONGARCH_CPU));
         qemu_register_reset(reset_load_elf, lacpu);
     }
     /* Initialize the IO interrupt subsystem */
diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index a0851f58a9..d409c25ee6 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -601,7 +601,7 @@ static void mcf5206_mbar_realize(DeviceState *dev, Error **errp)
     s->timer[1] = m5206_timer_init(s->pic[10]);
     s->uart[0] = mcf_uart_init(s->pic[12], serial_hd(0));
     s->uart[1] = mcf_uart_init(s->pic[13], serial_hd(1));
-    s->cpu = M68K_CPU(qemu_get_cpu(0, NULL));
+    s->cpu = M68K_CPU(qemu_get_cpu(0, TYPE_M68K_CPU));
 }
 
 static void mcf5206_mbar_class_init(ObjectClass *oc, void *data)
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 17e9e06a15..3ba329fa61 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -117,7 +117,7 @@ static void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 
 void cpu_set_exception_base(int vp_index, target_ulong address)
 {
-    MIPSCPU *vp = MIPS_CPU(qemu_get_cpu(vp_index, NULL));
+    MIPSCPU *vp = MIPS_CPU(qemu_get_cpu(vp_index, TYPE_MIPS_CPU));
     vp->env.exception_base = address;
 }
 
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 4a44ee56a9..7d1f5df114 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -150,7 +150,7 @@ uint32_t s390_get_hmfai(void)
     static S390CPU *cpu;
 
     if (!cpu) {
-        cpu = S390_CPU(qemu_get_cpu(0, NULL));
+        cpu = S390_CPU(qemu_get_cpu(0, TYPE_S390_CPU));
     }
 
     if (!cpu || !cpu->model) {
@@ -164,7 +164,7 @@ uint8_t s390_get_mha_pow(void)
     static S390CPU *cpu;
 
     if (!cpu) {
-        cpu = S390_CPU(qemu_get_cpu(0, NULL));
+        cpu = S390_CPU(qemu_get_cpu(0, TYPE_S390_CPU));
     }
 
     if (!cpu || !cpu->model) {
@@ -179,7 +179,7 @@ uint32_t s390_get_ibc_val(void)
     static S390CPU *cpu;
 
     if (!cpu) {
-        cpu = S390_CPU(qemu_get_cpu(0, NULL));
+        cpu = S390_CPU(qemu_get_cpu(0, TYPE_S390_CPU));
     }
 
     if (!cpu || !cpu->model) {
@@ -199,7 +199,7 @@ void s390_get_feat_block(S390FeatType type, uint8_t *data)
     static S390CPU *cpu;
 
     if (!cpu) {
-        cpu = S390_CPU(qemu_get_cpu(0, NULL));
+        cpu = S390_CPU(qemu_get_cpu(0, TYPE_S390_CPU));
     }
 
     if (!cpu || !cpu->model) {
@@ -213,7 +213,7 @@ bool s390_has_feat(S390Feat feat)
     static S390CPU *cpu;
 
     if (!cpu) {
-        cpu = S390_CPU(qemu_get_cpu(0, NULL));
+        cpu = S390_CPU(qemu_get_cpu(0, TYPE_S390_CPU));
     }
 
     if (!cpu || !cpu->model) {
-- 
2.41.0


