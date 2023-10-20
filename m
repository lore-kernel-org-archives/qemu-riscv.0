Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2817AC0032E
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:42:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtsWq-0007Oe-Ej; Fri, 20 Oct 2023 12:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsWp-0007EK-5k
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:39:15 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsWm-0002v1-4W
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:39:14 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9ba081173a3so170701766b.1
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 09:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697819950; x=1698424750; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yOZrNX/+z7aB8oqqC+6GO7cwysfniQeher82irVu/7U=;
 b=Q6vgPprvGN6jbYm6YOwR6K6mnqmjRpulyLpUkCTYn33bzgdVTUgD2sPeRSgvgqg1Xf
 JmGaBp0lIeRiZKyT94kvjU77bMir3dq0xY7i/vvCDtpjhdDwZL5t3wVrBiqSXTYBjY/q
 XRbocDXABmAjn6+YsRuHu+ycsDAWiS3i7FomTnZcv3rQFEgje9PxaInn3Y5JeSLMzU85
 tVvqkcH88+eaWUw3a1dTpThYIWngyLlTkTDbBwAu4EJzbZYGBziGTF67HIo8ZvnLmJRy
 bCW8zoFKKMWGeVirTgMHPckzfaaiHwyf0D1HxB9uQEf8BJSvt4gAjhVOBP4518NPKCEi
 cLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819950; x=1698424750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yOZrNX/+z7aB8oqqC+6GO7cwysfniQeher82irVu/7U=;
 b=lB0DMdS5ZXrP5+/4N34xQTSR+N5xQGatipKqoemwvTDng3sQQ9sh56vXXTPBc3SHwb
 ijXYynHcZBiwOW/6tZqN+vEzf/XJKTSYaXu0FBqpIQsqkN3vMUQsMHIJCRkRQJ+JZnWs
 7Srzb1Kc7ZsVUSOLqfhMPnFUjFVf5/wyP7JbHDlr+oo1XftDwHgg+MCEkOoYK4liTGSu
 ZdNdx8x/0+LwfN9Jg/1t/Ft49xd6Mv7jkv0SENoOJaD1YWPY6aEO+0BnSAb1TYU4QIn1
 Z1VtgwjWD+c3AEXnkSSqoJEtpt8v8F8N5hohzksJ1ks4BzWD7GSGT7oJk8Of2fDkr34Z
 O1sg==
X-Gm-Message-State: AOJu0YwUeNKBNRH3r1B5iptk+Nzw7N6xYheC0skcSpzKxCweQQ5Q9DgP
 +xkmpmqTPbKOGUPiQ24tBqsAwwPSTmWf255wTPg=
X-Google-Smtp-Source: AGHT+IGsgNGfCT5XpM2lTQY8HMLu12TWjzLu8IMAwyY25dXL0k0/QS5mYRTmqOEG0tkPfFgRkGRxOw==
X-Received: by 2002:a17:907:7b9f:b0:9ae:5f51:2e4a with SMTP id
 ne31-20020a1709077b9f00b009ae5f512e4amr2165318ejc.36.1697819950597; 
 Fri, 20 Oct 2023 09:39:10 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 do6-20020a170906c10600b009ad7fc17b2asm1806575ejc.224.2023.10.20.09.39.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 09:39:10 -0700 (PDT)
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org
Subject: [PATCH 19/19] cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_X86_CPU)
Date: Fri, 20 Oct 2023 18:36:41 +0200
Message-ID: <20231020163643.86105-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
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

Mechanical change using the following coccinelle script:

  @@ @@
  -   first_cpu
  +   qemu_get_cpu(0, TYPE_X86_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/kvm/clock.c                 | 4 ++--
 hw/i386/kvmvapic.c                  | 3 ++-
 hw/i386/microvm.c                   | 2 +-
 hw/i386/pc.c                        | 7 ++++---
 hw/i386/pc_piix.c                   | 3 ++-
 hw/i386/x86.c                       | 2 +-
 hw/isa/lpc_ich9.c                   | 2 +-
 target/i386/arch_dump.c             | 6 +++---
 target/i386/kvm/kvm.c               | 6 +++---
 target/i386/tcg/sysemu/fpu_helper.c | 4 ++--
 10 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index f25977d3f6..00067adde3 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -65,7 +65,7 @@ struct pvclock_vcpu_time_info {
 
 static uint64_t kvmclock_current_nsec(KVMClockState *s)
 {
-    CPUState *cpu = first_cpu;
+    CPUState *cpu = qemu_get_cpu(0, TYPE_X86_CPU);
     CPUX86State *env = cpu_env(cpu);
     hwaddr kvmclock_struct_pa;
     uint64_t migration_tsc = env->tsc;
@@ -330,7 +330,7 @@ static const TypeInfo kvmclock_info = {
 /* Note: Must be called after VCPU initialization. */
 void kvmclock_create(bool create_always)
 {
-    X86CPU *cpu = X86_CPU(first_cpu);
+    X86CPU *cpu = X86_CPU(qemu_get_cpu(0, TYPE_X86_CPU));
 
     assert(kvm_enabled());
     if (!kvm_has_adjust_clock()) {
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 43f8a8f679..e10c2bfc5a 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -760,7 +760,8 @@ static void kvmvapic_vm_state_change(void *opaque, bool running,
 
     if (s->state == VAPIC_ACTIVE) {
         if (ms->smp.cpus == 1) {
-            run_on_cpu(first_cpu, do_vapic_enable, RUN_ON_CPU_HOST_PTR(s));
+            run_on_cpu(qemu_get_cpu(0, TYPE_X86_CPU), do_vapic_enable,
+                       RUN_ON_CPU_HOST_PTR(s));
         } else {
             zero = g_malloc0(s->rom_state.vapic_size);
             cpu_physical_memory_write(s->vapic_paddr, zero,
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index b9c93039e2..d043f71992 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -229,7 +229,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
 
     if (x86_machine_is_acpi_enabled(x86ms) && mms->pcie == ON_OFF_AUTO_ON) {
         /* use topmost 25% of the address space available */
-        hwaddr phys_size = (hwaddr)1 << X86_CPU(first_cpu)->phys_bits;
+        hwaddr phys_size = (hwaddr)1 << X86_CPU(qemu_get_cpu(0, TYPE_X86_CPU))->phys_bits;
         if (phys_size > 0x1000000ll) {
             mms->gpex.mmio64.size = phys_size / 4;
             mms->gpex.mmio64.base = phys_size - mms->gpex.mmio64.size;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index bb3854d1d0..7f10078096 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -813,7 +813,7 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
 
 static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
 {
-    X86CPU *cpu = X86_CPU(first_cpu);
+    X86CPU *cpu = X86_CPU(qemu_get_cpu(0, TYPE_X86_CPU));
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     MachineState *ms = MACHINE(pcms);
 
@@ -898,7 +898,7 @@ void pc_memory_init(PCMachineState *pcms,
     X86MachineState *x86ms = X86_MACHINE(pcms);
     hwaddr maxphysaddr, maxusedaddr;
     hwaddr cxl_base, cxl_resv_end = 0;
-    X86CPU *cpu = X86_CPU(first_cpu);
+    X86CPU *cpu = X86_CPU(qemu_get_cpu(0, TYPE_X86_CPU));
 
     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
@@ -1182,7 +1182,8 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
     }
     port92 = isa_create_simple(isa_bus, TYPE_PORT92);
 
-    a20_line = qemu_allocate_irqs(handle_a20_line_change, first_cpu, 2);
+    a20_line = qemu_allocate_irqs(handle_a20_line_change,
+                                  qemu_get_cpu(0, TYPE_X86_CPU), 2);
     i8042_setup_a20_line(i8042, a20_line[0]);
     qdev_connect_gpio_out_named(DEVICE(port92),
                                 PORT92_A20_LINE, 0, a20_line[1]);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index e36a3262b2..1e0c2bb2e3 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -363,7 +363,8 @@ static void pc_init1(MachineState *machine,
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
         PCIDevice *piix4_pm;
 
-        smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
+        smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt,
+                                    qemu_get_cpu(0, TYPE_X86_CPU), 0);
         piix4_pm = pci_new(piix3_devfn + 3, TYPE_PIIX4_PM);
         qdev_prop_set_uint32(DEVICE(piix4_pm), "smb_io_base", 0xb100);
         qdev_prop_set_bit(DEVICE(piix4_pm), "smm-enabled",
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index b3d054889b..ef7949ac42 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -538,7 +538,7 @@ uint64_t cpu_get_tsc(CPUX86State *env)
 /* IRQ handling */
 static void pic_irq_request(void *opaque, int irq, int level)
 {
-    CPUState *cs = first_cpu;
+    CPUState *cs = qemu_get_cpu(0, TYPE_X86_CPU);
     X86CPU *cpu = X86_CPU(cs);
 
     trace_x86_pic_interrupt(irq, level);
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 3f59980aa0..0b9c37e0bf 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -327,7 +327,7 @@ static PCIINTxRoute ich9_route_intx_pin_to_irq(void *opaque, int pirq_pin)
 
 void ich9_generate_smi(void)
 {
-    cpu_interrupt(first_cpu, CPU_INTERRUPT_SMI);
+    cpu_interrupt(qemu_get_cpu(0, TYPE_X86_CPU), CPU_INTERRUPT_SMI);
 }
 
 /* Returns -1 on error, IRQ number on success */
diff --git a/target/i386/arch_dump.c b/target/i386/arch_dump.c
index c290910a04..c167f893db 100644
--- a/target/i386/arch_dump.c
+++ b/target/i386/arch_dump.c
@@ -185,7 +185,7 @@ int x86_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
     X86CPU *cpu = X86_CPU(cs);
     int ret;
 #ifdef TARGET_X86_64
-    X86CPU *first_x86_cpu = X86_CPU(first_cpu);
+    X86CPU *first_x86_cpu = X86_CPU(qemu_get_cpu(0, TYPE_X86_CPU));
     bool lma = !!(first_x86_cpu->env.hflags & HF_LMA_MASK);
 
     if (lma) {
@@ -401,8 +401,8 @@ int cpu_get_dump_info(ArchDumpInfo *info,
     GuestPhysBlock *block;
 
 #ifdef TARGET_X86_64
-    X86CPU *first_x86_cpu = X86_CPU(first_cpu);
-    lma = first_cpu && (first_x86_cpu->env.hflags & HF_LMA_MASK);
+    X86CPU *first_x86_cpu = X86_CPU(qemu_get_cpu(0, TYPE_X86_CPU));
+    lma = qemu_get_cpu(0, TYPE_X86_CPU) && (first_x86_cpu->env.hflags & HF_LMA_MASK);
 #endif
 
     if (lma) {
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ab72bcdfad..c38e68275e 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -3464,7 +3464,7 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
          * Hyper-V partition-wide MSRs: to avoid clearing them on cpu hot-add,
          * only sync them to KVM on the first cpu
          */
-        if (current_cpu == first_cpu) {
+        if (current_cpu == qemu_get_cpu(0, TYPE_X86_CPU)) {
             if (has_msr_hv_hypercall) {
                 kvm_msr_entry_add(cpu, HV_X64_MSR_GUEST_OS_ID,
                                   env->msr_hv_guest_os_id);
@@ -5601,10 +5601,10 @@ uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address)
     CPUX86State *env;
     uint64_t ext_id;
 
-    if (!first_cpu) {
+    if (!qemu_get_cpu(0, TYPE_X86_CPU)) {
         return address;
     }
-    env = &X86_CPU(first_cpu)->env;
+    env = &X86_CPU(qemu_get_cpu(0, TYPE_X86_CPU))->env;
     if (!(env->features[FEAT_KVM] & (1 << KVM_FEATURE_MSI_EXT_DEST_ID))) {
         return address;
     }
diff --git a/target/i386/tcg/sysemu/fpu_helper.c b/target/i386/tcg/sysemu/fpu_helper.c
index 93506cdd94..942d04037c 100644
--- a/target/i386/tcg/sysemu/fpu_helper.c
+++ b/target/i386/tcg/sysemu/fpu_helper.c
@@ -41,13 +41,13 @@ void fpu_check_raise_ferr_irq(CPUX86State *env)
 
 void cpu_clear_ignne(void)
 {
-    CPUX86State *env = &X86_CPU(first_cpu)->env;
+    CPUX86State *env = &X86_CPU(qemu_get_cpu(0, TYPE_X86_CPU))->env;
     env->hflags2 &= ~HF2_IGNNE_MASK;
 }
 
 void cpu_set_ignne(void)
 {
-    CPUX86State *env = &X86_CPU(first_cpu)->env;
+    CPUX86State *env = &X86_CPU(qemu_get_cpu(0, TYPE_X86_CPU))->env;
 
     assert(qemu_mutex_iothread_locked());
 
-- 
2.41.0


