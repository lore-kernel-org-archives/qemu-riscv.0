Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF712C00A98
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:38:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtsW5-00055c-3x; Fri, 20 Oct 2023 12:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsW3-0004zw-OR
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:38:27 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsVx-0002fT-Sp
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:38:27 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-53de0d1dc46so1540087a12.3
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 09:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697819900; x=1698424700; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gyJaNaz+yQUi1oc2/ICF5HBrjSZAS7PKSP5aD7nnSG8=;
 b=W4ccIbXSN5MmJu8TJ+Qu/tXEu26M5QMRDBAD0leJi39k4EoHy3D0N/U7Kfwiw9yv/N
 dvh0EnloGrn6EqAHx/HKNuMnvCPfBTFo/98qLYAHqFFhB6kONdDLC1T7+i4zyHznK3rJ
 iVUY4qjCyeedOcSB3Z7U4hkyf107J3RspKUjEuhzHHf0BBUk9B5h6tc1EXZkbILtNc4P
 MPEdqioy3dIptlIxAJdsA0Qlt40pWRg8EbslOLBh6IwoPPHTYG3SMlRWcIFY561/GxO3
 ZrsAnWaGepDmaoONutvYLpW9s1uPyxFAcUftQFa/J1MkooHifQuljVx2wsWrPZZLJIFp
 G/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819900; x=1698424700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gyJaNaz+yQUi1oc2/ICF5HBrjSZAS7PKSP5aD7nnSG8=;
 b=PFcDi0kf+bRlAMjlBdn20BTsaS82LeSxNOHd3YyvUpG+S/vikCL1qLFmJrKaUbJkAo
 +xs0NDwEQ4edbOSxaXVviEKTaA614vzUSs/eAQt+ASafxHA7HFEBbxhsEXWwi99G8Juf
 Z550gTbnfNWMmfPWgMOCzOHAyg5w+wYr4oqMykuXxmCyU1QkcYXufw4iEigb+oh/Qmfi
 2Zj9MpI/uLY4XjnT60K2wUw5T5/mo4hn/I+Ni/G3BhtrdudDKuJa03XxSiZjzqpYOrgj
 QoSbMMNgdwyLAnfpU7Lr9Zx6OLEQyImK/uHPe1tn3VgztBSUBFbsdNrE2BD/EJ3MAkDl
 MI4Q==
X-Gm-Message-State: AOJu0Ywwn+e+2lh1Q0BYyjjErJ65n2poufSMWJR0eUsi0p2xu68Zfo+e
 TXAUYMxulfpXaznSk+DpCHG8EA==
X-Google-Smtp-Source: AGHT+IFBfKbQwH9V3tIztlCgedZL06X6xkpxRSX0F2ztCJXYo/UXY7UYQxkYQktWmALhyqPrbSACzw==
X-Received: by 2002:a50:f683:0:b0:53f:2128:ff4f with SMTP id
 d3-20020a50f683000000b0053f2128ff4fmr1999564edn.17.1697819900211; 
 Fri, 20 Oct 2023 09:38:20 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 y90-20020a50bb63000000b0053e8bb112adsm1775109ede.53.2023.10.20.09.38.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 09:38:19 -0700 (PDT)
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
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH 12/19] cpus: Replace first_cpu by qemu_get_cpu(0,
 TYPE_MIPS_CPU)
Date: Fri, 20 Oct 2023 18:36:34 +0200
Message-ID: <20231020163643.86105-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
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

Mechanical change using the following coccinelle script:

  @@ @@
  -   first_cpu
  +   qemu_get_cpu(0, TYPE_MIPS_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/internal.h              | 2 +-
 hw/intc/mips_gic.c                  | 2 +-
 hw/mips/bootloader.c                | 3 ++-
 hw/mips/cps.c                       | 5 +++--
 hw/mips/loongson3_bootp.c           | 2 +-
 hw/mips/loongson3_virt.c            | 7 ++++---
 hw/mips/malta.c                     | 2 +-
 hw/misc/mips_cpc.c                  | 4 ++--
 target/mips/tcg/sysemu/cp0_helper.c | 8 ++++----
 target/mips/tcg/sysemu/tlb_helper.c | 2 +-
 10 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 1d0c026c7d..d373063fd0 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -270,7 +270,7 @@ static inline int mips_vpe_active(CPUMIPSState *env)
 
 static inline int mips_vp_active(CPUMIPSState *env)
 {
-    CPUState *other_cs = first_cpu;
+    CPUState *other_cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
 
     /* Check if the VP disabled other VPs (which means the VP is enabled) */
     if ((env->CP0_VPControl >> CP0VPCtl_DIS) & 1) {
diff --git a/hw/intc/mips_gic.c b/hw/intc/mips_gic.c
index 77ba7348a3..4c4791aefa 100644
--- a/hw/intc/mips_gic.c
+++ b/hw/intc/mips_gic.c
@@ -406,7 +406,7 @@ static void mips_gic_init(Object *obj)
 static void mips_gic_realize(DeviceState *dev, Error **errp)
 {
     MIPSGICState *s = MIPS_GIC(dev);
-    CPUState *cs = first_cpu;
+    CPUState *cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
     int i;
 
     if (s->num_vps > GIC_MAX_VPS) {
diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 1dd6ef2096..c4943f193f 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -51,7 +51,8 @@ typedef enum bl_reg {
 
 static bool bootcpu_supports_isa(uint64_t isa_mask)
 {
-    return cpu_supports_isa(&MIPS_CPU(first_cpu)->env, isa_mask);
+    return cpu_supports_isa(&MIPS_CPU(qemu_get_cpu(0, TYPE_MIPS_CPU))->env,
+                            isa_mask);
 }
 
 static void st_nm32_p(void **ptr, uint32_t insn)
diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 2b5269ebf1..d2f72cbf90 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -107,7 +107,8 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
     if (itu_present) {
         object_initialize_child(OBJECT(dev), "itu", &s->itu, TYPE_MIPS_ITU);
         object_property_set_link(OBJECT(&s->itu), "cpu[0]",
-                                 OBJECT(first_cpu), &error_abort);
+                                 OBJECT(qemu_get_cpu(0, TYPE_MIPS_CPU)),
+                                 &error_abort);
         object_property_set_uint(OBJECT(&s->itu), "num-fifo", 16,
                                 &error_abort);
         object_property_set_uint(OBJECT(&s->itu), "num-semaphores", 16,
@@ -147,7 +148,7 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
                             sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gic), 0));
 
     /* Global Configuration Registers */
-    gcr_base = MIPS_CPU(first_cpu)->env.CP0_CMGCRBase << 4;
+    gcr_base = MIPS_CPU(qemu_get_cpu(0, TYPE_MIPS_CPU))->env.CP0_CMGCRBase << 4;
 
     object_initialize_child(OBJECT(dev), "gcr", &s->gcr, TYPE_MIPS_GCR);
     object_property_set_uint(OBJECT(&s->gcr), "num-vp", s->num_vp,
diff --git a/hw/mips/loongson3_bootp.c b/hw/mips/loongson3_bootp.c
index f99af22932..3ad9cf2f0c 100644
--- a/hw/mips/loongson3_bootp.c
+++ b/hw/mips/loongson3_bootp.c
@@ -32,7 +32,7 @@ static void init_cpu_info(void *g_cpuinfo, uint64_t cpu_freq)
     struct efi_cpuinfo_loongson *c = g_cpuinfo;
 
     c->cputype = cpu_to_le32(Loongson_3A);
-    c->processor_id = cpu_to_le32(MIPS_CPU(first_cpu)->env.CP0_PRid);
+    c->processor_id = cpu_to_le32(MIPS_CPU(qemu_get_cpu(0, TYPE_MIPS_CPU))->env.CP0_PRid);
     if (cpu_freq > UINT_MAX) {
         c->cpu_clock_freq = cpu_to_le32(UINT_MAX);
     } else {
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index b74b358874..9dd943d477 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -159,7 +159,8 @@ static uint64_t get_cpu_freq_hz(void)
     };
 
     if (kvm_enabled()) {
-        ret = kvm_vcpu_ioctl(first_cpu, KVM_GET_ONE_REG, &freq_reg);
+        ret = kvm_vcpu_ioctl(qemu_get_cpu(0, TYPE_MIPS_CPU), KVM_GET_ONE_REG,
+                             &freq_reg);
         if (ret >= 0) {
             return freq * 2;
         }
@@ -387,7 +388,7 @@ static void main_cpu_reset(void *opaque)
 
     /* Loongson-3 reset stuff */
     if (loaderparams.kernel_filename) {
-        if (cpu == MIPS_CPU(first_cpu)) {
+        if (cpu == MIPS_CPU(qemu_get_cpu(0, TYPE_MIPS_CPU))) {
             env->active_tc.gpr[4] = loaderparams.a0;
             env->active_tc.gpr[5] = loaderparams.a1;
             env->active_tc.gpr[6] = loaderparams.a2;
@@ -543,7 +544,7 @@ static void mips_loongson3_virt_init(MachineState *machine)
                                pin, cpu->env.irq[ip + 2]);
         }
     }
-    env = &MIPS_CPU(first_cpu)->env;
+    env = &MIPS_CPU(qemu_get_cpu(0, TYPE_MIPS_CPU))->env;
 
     /* Allocate RAM/BIOS, 0x00000000~0x10000000 is alias of 0x80000000~0x90000000 */
     memory_region_init_rom(bios, NULL, "loongson3.bios",
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index dac27fad9d..2e26b8a26d 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1044,7 +1044,7 @@ static void create_cpu_without_cps(MachineState *ms, MaltaState *s,
         qemu_register_reset(main_cpu_reset, cpu);
     }
 
-    cpu = MIPS_CPU(first_cpu);
+    cpu = MIPS_CPU(qemu_get_cpu(0, TYPE_MIPS_CPU));
     env = &cpu->env;
     *i8259_irq = env->irq[2];
     *cbus_irq = env->irq[4];
diff --git a/hw/misc/mips_cpc.c b/hw/misc/mips_cpc.c
index 4a94c87054..583081cdeb 100644
--- a/hw/misc/mips_cpc.c
+++ b/hw/misc/mips_cpc.c
@@ -44,7 +44,7 @@ static void mips_cpu_reset_async_work(CPUState *cs, run_on_cpu_data data)
 
 static void cpc_run_vp(MIPSCPCState *cpc, uint64_t vp_run)
 {
-    CPUState *cs = first_cpu;
+    CPUState *cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
 
     CPU_FOREACH(cs) {
         uint64_t i = 1ULL << cs->cpu_index;
@@ -62,7 +62,7 @@ static void cpc_run_vp(MIPSCPCState *cpc, uint64_t vp_run)
 
 static void cpc_stop_vp(MIPSCPCState *cpc, uint64_t vp_stop)
 {
-    CPUState *cs = first_cpu;
+    CPUState *cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
 
     CPU_FOREACH(cs) {
         uint64_t i = 1ULL << cs->cpu_index;
diff --git a/target/mips/tcg/sysemu/cp0_helper.c b/target/mips/tcg/sysemu/cp0_helper.c
index af0cd60829..bf934be58a 100644
--- a/target/mips/tcg/sysemu/cp0_helper.c
+++ b/target/mips/tcg/sysemu/cp0_helper.c
@@ -1633,7 +1633,7 @@ target_ulong helper_emt(void)
 
 target_ulong helper_dvpe(CPUMIPSState *env)
 {
-    CPUState *other_cs = first_cpu;
+    CPUState *other_cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
     target_ulong prev = env->mvp->CP0_MVPControl;
 
     CPU_FOREACH(other_cs) {
@@ -1649,7 +1649,7 @@ target_ulong helper_dvpe(CPUMIPSState *env)
 
 target_ulong helper_evpe(CPUMIPSState *env)
 {
-    CPUState *other_cs = first_cpu;
+    CPUState *other_cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
     target_ulong prev = env->mvp->CP0_MVPControl;
 
     CPU_FOREACH(other_cs) {
@@ -1669,7 +1669,7 @@ target_ulong helper_evpe(CPUMIPSState *env)
 /* R6 Multi-threading */
 target_ulong helper_dvp(CPUMIPSState *env)
 {
-    CPUState *other_cs = first_cpu;
+    CPUState *other_cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
     target_ulong prev = env->CP0_VPControl;
 
     if (!((env->CP0_VPControl >> CP0VPCtl_DIS) & 1)) {
@@ -1687,7 +1687,7 @@ target_ulong helper_dvp(CPUMIPSState *env)
 
 target_ulong helper_evp(CPUMIPSState *env)
 {
-    CPUState *other_cs = first_cpu;
+    CPUState *other_cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
     target_ulong prev = env->CP0_VPControl;
 
     if ((env->CP0_VPControl >> CP0VPCtl_DIS) & 1) {
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index 7dbc2e24c4..2d31c8e17f 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -344,7 +344,7 @@ void helper_ginvt(CPUMIPSState *env, target_ulong arg, uint32_t type)
     uint32_t invMsgVPN2 = arg & (TARGET_PAGE_MASK << 1);
     uint8_t invMsgR = 0;
     uint32_t invMsgMMid = env->CP0_MemoryMapID;
-    CPUState *other_cs = first_cpu;
+    CPUState *other_cs = qemu_get_cpu(0, TYPE_MIPS_CPU);
 
 #ifdef TARGET_MIPS64
     invMsgR = extract64(arg, 62, 2);
-- 
2.41.0


