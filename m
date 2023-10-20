Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96132CDB474
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:39:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtsVu-0004bV-IP; Fri, 20 Oct 2023 12:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsVt-0004Sh-0B
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:38:17 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsVq-0002e6-Kq
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:38:16 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9bdf5829000so162023766b.0
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 09:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697819893; x=1698424693; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sWVSb4kJOx4Py9xCdpLQSCowqDiVUo6mKEdRlRPdC3M=;
 b=QoIN9rxYdoTVZr/OPJ98bL3VmrRNN2M+XkPFoo7H0pBFnWRoj7iYpM04asbzZHJPgA
 u1KDev6JxV1nc/k5X1mKWV90mhAsWRaorlE1rNDx89zvqiMuOD3UkcxKzc+NfLMxNcHS
 kVq3FK/1+no9GPWZO2z53R9VvyD5E7jQOjKuBMjyiCV6ohqcGb7CCxCgYWDnQi1Jnm6K
 vYhr5iTHmMQ9QKkARE/m04g4OP4LArm2CA3K/sy9WA+ROijNafMa3DNvXuG5iE5lD9Px
 UvzkRss/oxr52nUmDxL1DItkq+iKWSVAinRSpEigcK2X+rlqn56tkeJryMv83gmqASbd
 Do/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819893; x=1698424693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sWVSb4kJOx4Py9xCdpLQSCowqDiVUo6mKEdRlRPdC3M=;
 b=TaxRwxWYt0lFLmjgr+yqQ595OC2viYwZIZEt1CB3CopNUyOmPzeKpt39VGJtXctDT3
 jiFTDx8SbBHVRFsCQ5M+LEGoEYHgillT5m84Lqi6HV5/3pXRj0pqQL3cs23iLPQfN0Vv
 IvDtmWdJAF/+oBxyM/3oAyfgB6xJbKsVRNGZqStni/arIjk6X1YPOQul2t5M+oihYFp6
 t6xgFmHuIISRJNDfdxQIA8AFx0J1ljuxvESRsrKyJ3lhBAThL9XvPaYSaAghjBaW7hYL
 xtCOFnUP1Lpy/VuPHHx4ZJ6ru8xHQbkKU3PRj/WJYPtOgiizJ665EjV7w3QgblW1PaAV
 JPOA==
X-Gm-Message-State: AOJu0Yy6uNmPevngrGnT6niZIvfR4nOrVLjIIoEyEcyTfoRosCnLTAil
 uSowpmZFH4Bcq6Zvd9gFHcslng==
X-Google-Smtp-Source: AGHT+IEMqrtne6Pvcq15oEXxD3gxQ67/Vyyv98aCsGT08pg/OfAYRxDc6BbyAqJ31WIn3cQ2nejFNA==
X-Received: by 2002:a17:907:948e:b0:9bf:9c58:e91e with SMTP id
 dm14-20020a170907948e00b009bf9c58e91emr1600709ejc.56.1697819892970; 
 Fri, 20 Oct 2023 09:38:12 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 w21-20020a170907271500b009ad81554c1bsm1780965ejk.55.2023.10.20.09.38.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 09:38:12 -0700 (PDT)
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
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH 11/19] cpus: Replace first_cpu by qemu_get_cpu(0,
 TYPE_POWERPC_CPU)
Date: Fri, 20 Oct 2023 18:36:33 +0200
Message-ID: <20231020163643.86105-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
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
  +   qemu_get_cpu(0, TYPE_POWERPC_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/e500.c          |  2 +-
 hw/ppc/ppc.c           |  4 ++--
 hw/ppc/prep_systemio.c |  2 +-
 hw/ppc/spapr.c         | 11 ++++++-----
 hw/ppc/spapr_caps.c    | 10 +++++-----
 hw/ppc/spapr_rtas.c    |  2 +-
 hw/ppc/spapr_vof.c     |  2 +-
 hw/ppc/vof.c           |  3 ++-
 target/ppc/arch_dump.c |  4 ++--
 9 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index c4bf3fef32..02d14404d9 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -373,7 +373,7 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
     MachineState *machine = MACHINE(pms);
     unsigned int smp_cpus = machine->smp.cpus;
     const PPCE500MachineClass *pmc = PPCE500_MACHINE_GET_CLASS(pms);
-    CPUPPCState *env = cpu_env(first_cpu);
+    CPUPPCState *env = cpu_env(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     int ret = -1;
     uint64_t mem_reg_property[] = { 0, cpu_to_be64(machine->ram_size) };
     int fdt_size;
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index be167710a3..be0b1536f5 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -970,7 +970,7 @@ void cpu_ppc_store_purr(CPUPPCState *env, uint64_t value)
 static void timebase_save(PPCTimebase *tb)
 {
     uint64_t ticks = cpu_get_host_ticks();
-    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
 
     if (!first_ppc_cpu->env.tb_env) {
         error_report("No timebase object");
@@ -998,7 +998,7 @@ static void timebase_save(PPCTimebase *tb)
 static void timebase_load(PPCTimebase *tb)
 {
     CPUState *cpu;
-    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     int64_t tb_off_adj, tb_off;
     unsigned long freq;
 
diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
index c96cefb13d..0431cde91c 100644
--- a/hw/ppc/prep_systemio.c
+++ b/hw/ppc/prep_systemio.c
@@ -261,7 +261,7 @@ static void prep_systemio_realize(DeviceState *dev, Error **errp)
     s->iomap_type = PORT0850_IOMAP_NONCONTIGUOUS;
     qemu_set_irq(s->non_contiguous_io_map_irq,
                  s->iomap_type & PORT0850_IOMAP_NONCONTIGUOUS);
-    cpu = POWERPC_CPU(first_cpu);
+    cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     s->softreset_irq = qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_HRESET);
 
     isa_register_portio_list(isa, &s->portio, 0x0, ppc_io800_port_list, s,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index cb840676d3..a5006eaa5e 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -981,7 +981,7 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
 static void spapr_dt_ov5_platform_support(SpaprMachineState *spapr, void *fdt,
                                           int chosen)
 {
-    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
 
     char val[2 * 4] = {
         23, 0x00, /* XICS / XIVE mode */
@@ -1125,7 +1125,7 @@ static void spapr_dt_hypervisor(SpaprMachineState *spapr, void *fdt)
          * Older KVM versions with older guest kernels were broken
          * with the magic page, don't allow the guest to map it.
          */
-        if (!kvmppc_get_hypercall(cpu_env(first_cpu), hypercall,
+        if (!kvmppc_get_hypercall(cpu_env(qemu_get_cpu(0, TYPE_POWERPC_CPU)), hypercall,
                                   sizeof(hypercall))) {
             _FDT(fdt_setprop(fdt, hypervisor, "hcall-instructions",
                              hypercall, sizeof(hypercall)));
@@ -1669,7 +1669,7 @@ static void spapr_machine_reset(MachineState *machine, ShutdownCause reason)
     pef_kvm_reset(machine->cgs, &error_fatal);
     spapr_caps_apply(spapr);
 
-    first_ppc_cpu = POWERPC_CPU(first_cpu);
+    first_ppc_cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     if (kvm_enabled() && kvmppc_has_cap_mmu_radix() &&
         ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_00, 0,
                               spapr->max_compat_pvr)) {
@@ -1845,7 +1845,7 @@ static int spapr_post_load(void *opaque, int version_id)
     }
 
     if (kvm_enabled() && spapr->patb_entry) {
-        PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+        PowerPCCPU *cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
         bool radix = !!(spapr->patb_entry & PATE1_GR);
         bool gtse = !!(cpu->env.spr[SPR_LPCR] & LPCR_GTSE);
 
@@ -4014,7 +4014,8 @@ static void spapr_core_plug(HotplugHandler *hotplug_dev, DeviceState *dev)
      */
     if (hotplugged) {
         for (i = 0; i < cc->nr_threads; i++) {
-            ppc_set_compat(core->threads[i], POWERPC_CPU(first_cpu)->compat_pvr,
+            ppc_set_compat(core->threads[i],
+                           POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU))->compat_pvr,
                            &error_abort);
         }
     }
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 5a0755d34f..0c1f00d869 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -194,7 +194,7 @@ static void cap_htm_apply(SpaprMachineState *spapr, uint8_t val, Error **errp)
 static void cap_vsx_apply(SpaprMachineState *spapr, uint8_t val, Error **errp)
 {
     ERRP_GUARD();
-    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     CPUPPCState *env = &cpu->env;
 
     if (!val) {
@@ -213,7 +213,7 @@ static void cap_vsx_apply(SpaprMachineState *spapr, uint8_t val, Error **errp)
 static void cap_dfp_apply(SpaprMachineState *spapr, uint8_t val, Error **errp)
 {
     ERRP_GUARD();
-    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     CPUPPCState *env = &cpu->env;
 
     if (!val) {
@@ -440,7 +440,7 @@ static void cap_nested_kvm_hv_apply(SpaprMachineState *spapr,
                                     uint8_t val, Error **errp)
 {
     ERRP_GUARD();
-    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     CPUPPCState *env = &cpu->env;
 
     if (!val) {
@@ -494,7 +494,7 @@ static void cap_large_decr_apply(SpaprMachineState *spapr,
                                  uint8_t val, Error **errp)
 {
     ERRP_GUARD();
-    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
 
     if (!val) {
@@ -632,7 +632,7 @@ static void cap_ail_mode_3_apply(SpaprMachineState *spapr,
                                      uint8_t val, Error **errp)
 {
     ERRP_GUARD();
-    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
 
     if (!val) {
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 7df21581c2..3d4e93a188 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -539,7 +539,7 @@ uint64_t qtest_rtas_call(char *cmd, uint32_t nargs, uint64_t args,
     for (token = 0; token < RTAS_TOKEN_MAX - RTAS_TOKEN_BASE; token++) {
         if (strcmp(cmd, rtas_table[token].name) == 0) {
             SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
-            PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
+            PowerPCCPU *cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
 
             rtas_table[token].fn(cpu, spapr, token + RTAS_TOKEN_BASE,
                                  nargs, args, nret, rets);
diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
index 09f29be0b9..301b3cd433 100644
--- a/hw/ppc/spapr_vof.c
+++ b/hw/ppc/spapr_vof.c
@@ -58,7 +58,7 @@ void spapr_vof_reset(SpaprMachineState *spapr, void *fdt, Error **errp)
 {
     target_ulong stack_ptr;
     Vof *vof = spapr->vof;
-    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
+    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
 
     vof_init(vof, spapr->rma_size, errp);
 
diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index e3b430a81f..9fa1cd9e19 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -797,7 +797,8 @@ static uint32_t vof_call_method(MachineState *ms, Vof *vof, uint32_t methodaddr,
                 VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
 
                 g_assert(vmc->client_architecture_support);
-                ret = (uint32_t)vmc->client_architecture_support(ms, first_cpu,
+                ret = (uint32_t)vmc->client_architecture_support(ms,
+                                                                 qemu_get_cpu(0, TYPE_POWERPC_CPU),
                                                                  param1);
             }
 
diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index a8315659d9..be2a78d01f 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -228,11 +228,11 @@ int cpu_get_dump_info(ArchDumpInfo *info,
 {
     PowerPCCPU *cpu;
 
-    if (first_cpu == NULL) {
+    if (qemu_get_cpu(0, TYPE_POWERPC_CPU) == NULL) {
         return -1;
     }
 
-    cpu = POWERPC_CPU(first_cpu);
+    cpu = POWERPC_CPU(qemu_get_cpu(0, TYPE_POWERPC_CPU));
 
     info->d_machine = PPC_ELF_MACHINE;
     info->d_class = ELFCLASS;
-- 
2.41.0


