Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4B2C001DF
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:38:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtsVE-00034C-K3; Fri, 20 Oct 2023 12:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsVB-000308-AF
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:37:34 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsUv-0002Rc-Gg
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:37:33 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so168900866b.3
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697819834; x=1698424634; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xSJLVJB+BSGW/cgUeZYPxlitCJtzsUBSAokmrhtXDW0=;
 b=Q1Ar6WaOZWWlF0sqgFC27YM61x/5gBpjJckf7E8TSnEw0bfgdutatb1NrD2VpVOzdb
 PlZiW5vmaR7lpuZ3YHjkRhQ6VF3NKqnYNlzhRagrQFATb8uP8YB4vTqzMT2T2umfg17c
 cgzmSWGE4BwMVlxTWrs8pyibot/P5c98UKFWpuNFq1auar9rGfuadRpaRzuA+L33ZZBR
 vF2tnCqdfy6yT9GNTS6cy/3bTgrsym0ydTYc+WCxvpwFeTs2qAXYeVcmEwrzcoS/bFuG
 3cx5GswxIkesjKbaizygtE7oPAlA/AyK+R0uEJEZ3qVIjRx7cAtkIvXsCC/1os9Rczg1
 Sylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819834; x=1698424634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xSJLVJB+BSGW/cgUeZYPxlitCJtzsUBSAokmrhtXDW0=;
 b=VH/9AJ/QnGiF7QCTuJ/Yr6FKUVr8aokoTqy9coKe/7i3v9QPRqrDIXD6+sAqK5mhqa
 GKlNn36EAwNwdys3sjzvb8aAN5igGxij0h5unIOVbflQt8vYnb8Ec2RT1t++2TJSqzOR
 o+W8ZMFaX8imKqNY2GT5aOzKLDNZ69zYqFPCYrlY6qf5iuTncYERIZgElOdz9zwtZwAF
 GqljZUIx4K/gTU6yQA2ArGAe6CpuUkRgO4P0OP62uNN2qwn0K7Qk6h3NgyD9J6K1dAWh
 376APTVqrlBN5EhIGKEepxyHfsnb0pV7vxu0LbNevUjrbC8Fdl49ta380aHDisH3QNaj
 J7/w==
X-Gm-Message-State: AOJu0YxwjiZCnzqwIhgGzbwf1MBKNj23UHncQVx8436tqXhXmEzblnzS
 N1FanqVXu7252p72rBZn6LH/1A==
X-Google-Smtp-Source: AGHT+IFwR4eeI0PcMji7bsSOyXqIPfeWK3QXSfkKqlegpEm8Ef2v2EFfCuR8JZGzeu/3ji8Uqg5M9Q==
X-Received: by 2002:a17:906:d555:b0:9bd:cd8b:6247 with SMTP id
 cr21-20020a170906d55500b009bdcd8b6247mr2128857ejc.38.1697819834495; 
 Fri, 20 Oct 2023 09:37:14 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 d24-20020a170906041800b0099cb1a2cab0sm1813134eja.28.2023.10.20.09.37.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 09:37:14 -0700 (PDT)
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
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 03/19] cpus: Filter for target specific CPU (arm)
Date: Fri, 20 Oct 2023 18:36:25 +0200
Message-ID: <20231020163643.86105-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Enforce qemu_get_cpu() to return ARM CPUs in ARM specific files.

Mechanical change using the following coccinelle script:

  @@ expression index; @@
  -   qemu_get_cpu(index, NULL)
  +   qemu_get_cpu(index, TYPE_ARM_CPU)

and manually including "target/arm/cpu-qom.h" in
hw/intc/arm_gicv3_common.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx7.c          | 2 +-
 hw/arm/sbsa-ref.c          | 2 +-
 hw/arm/vexpress.c          | 2 +-
 hw/arm/virt.c              | 2 +-
 hw/cpu/a15mpcore.c         | 4 ++--
 hw/cpu/a9mpcore.c          | 2 +-
 hw/intc/arm_gicv3_common.c | 3 ++-
 7 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 1c1585f3e1..7a62e9f5cf 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -212,7 +212,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 
     for (i = 0; i < smp_cpus; i++) {
         SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
-        DeviceState  *d   = DEVICE(qemu_get_cpu(i, NULL));
+        DeviceState  *d   = DEVICE(qemu_get_cpu(i, TYPE_ARM_CPU));
 
         irq = qdev_get_gpio_in(d, ARM_CPU_IRQ);
         sysbus_connect_irq(sbd, i, irq);
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f6f64099c3..a85004809f 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -478,7 +478,7 @@ static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
      * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
      */
     for (i = 0; i < smp_cpus; i++) {
-        DeviceState *cpudev = DEVICE(qemu_get_cpu(i, NULL));
+        DeviceState *cpudev = DEVICE(qemu_get_cpu(i, TYPE_ARM_CPU));
         int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
         int irq;
         /*
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 0590332fe5..e20d865d5a 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -257,7 +257,7 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
 
     /* Connect the CPUs to the GIC */
     for (n = 0; n < smp_cpus; n++) {
-        DeviceState *cpudev = DEVICE(qemu_get_cpu(n, NULL));
+        DeviceState *cpudev = DEVICE(qemu_get_cpu(n, TYPE_ARM_CPU));
 
         sysbus_connect_irq(busdev, n, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
         sysbus_connect_irq(busdev, n + smp_cpus,
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index be31ef5718..da5b738f0a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -799,7 +799,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
      * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
      */
     for (i = 0; i < smp_cpus; i++) {
-        DeviceState *cpudev = DEVICE(qemu_get_cpu(i, NULL));
+        DeviceState *cpudev = DEVICE(qemu_get_cpu(i, TYPE_ARM_CPU));
         int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
         /* Mapping from the output timer irq lines from the CPU to the
          * GIC PPI inputs we use for the virt board.
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index 8c9098d5d3..7ec5b27207 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -65,7 +65,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
         /* Make the GIC's TZ support match the CPUs. We assume that
          * either all the CPUs have TZ, or none do.
          */
-        cpuobj = OBJECT(qemu_get_cpu(0, NULL));
+        cpuobj = OBJECT(qemu_get_cpu(0, TYPE_ARM_CPU));
         has_el3 = object_property_find(cpuobj, "has_el3") &&
             object_property_get_bool(cpuobj, "has_el3", &error_abort);
         qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
@@ -90,7 +90,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
      * appropriate GIC PPI inputs
      */
     for (i = 0; i < s->num_cpu; i++) {
-        DeviceState *cpudev = DEVICE(qemu_get_cpu(i, NULL));
+        DeviceState *cpudev = DEVICE(qemu_get_cpu(i, TYPE_ARM_CPU));
         int ppibase = s->num_irq - 32 + i * 32;
         int irq;
         /* Mapping from the output timer irq lines from the CPU to the
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index 62b7fb3836..a9919ac78a 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -56,7 +56,7 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     CPUState *cpu0;
     Object *cpuobj;
 
-    cpu0 = qemu_get_cpu(0, NULL);
+    cpu0 = qemu_get_cpu(0, TYPE_ARM_CPU);
     cpuobj = OBJECT(cpu0);
     if (strcmp(object_get_typename(cpuobj), ARM_CPU_TYPE_NAME("cortex-a9"))) {
         /* We might allow Cortex-A5 once we model it */
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index cdf21dfc11..e7ad5aa202 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -31,6 +31,7 @@
 #include "migration/vmstate.h"
 #include "gicv3_internal.h"
 #include "hw/arm/linux-boot-if.h"
+#include "target/arm/cpu-qom.h"
 #include "sysemu/kvm.h"
 
 
@@ -392,7 +393,7 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
     s->cpu = g_new0(GICv3CPUState, s->num_cpu);
 
     for (i = 0; i < s->num_cpu; i++) {
-        CPUState *cpu = qemu_get_cpu(i, NULL);
+        CPUState *cpu = qemu_get_cpu(i, TYPE_ARM_CPU);
         uint64_t cpu_affid;
 
         s->cpu[i].cpu = cpu;
-- 
2.41.0


