Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pO0WP-0002aa-Vs
	for mharc-qemu-riscv@gnu.org; Fri, 03 Feb 2023 13:10:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WO-0002UT-LN
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:48 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0WM-0000ki-K1
 for qemu-riscv@nongnu.org; Fri, 03 Feb 2023 13:10:48 -0500
Received: by mail-wr1-x435.google.com with SMTP id bt17so2356944wrb.8
 for <qemu-riscv@nongnu.org>; Fri, 03 Feb 2023 10:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KssFyaPm059TI8uO1WBCvVEy7+56aC9XzP9/EK8Uaa0=;
 b=zMPSlq0BOs6EJa6ya9h0GgTxlS9MJw59qUI718cglBA2nlAKPeWBUbxRKMYxgtit5M
 TawBRE85lkIN93SIh366mzT0p3z61yPhxhiQfHdnGmmMWTkihylXs023/PA+NMbERVhD
 S4AUQlwNtJ93lh4sbna63930gPNTTJIrh0bVeEh7fIx1EyaJgfVkpkX/I9oXdGhSwLyN
 eJltEKexUAgPdOZ2syswY0F6/HmETvckx86ujIE4L43Bd21VSFpRljNj7YS0PCcZF3z8
 O4DIyxC2pa7BwGJc5N4tVaYF8LR+YKQW5/HQe0GCTpPD5eWArOxuBBMpzUjQP/CzmtaU
 jqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KssFyaPm059TI8uO1WBCvVEy7+56aC9XzP9/EK8Uaa0=;
 b=oPKaE4nDu99uSt+z0xmLop/lhDRV+QQ4IMxaAdPwgIkg4jtIoVjvNAQfDXDPQTd6xw
 oTlC/hrYu6ZhVNj8YvoeBVDxkSIg1YDspfrGRMykO7/a+xl9UN2oA2hhO+rkmPqwKZWv
 uGEMORt2XQG7oj79wcYHKTh7lJ3KpQJOc4iNS7aOLmn6zQVLFEASASAOzU/jicClBJfY
 uAvYmyfIRtEIuMJXvh2HBjPcyR128twRX2qzscSsgQpuKUouX+COD9fRHnPstN1m0SwA
 cuYKBQZRX5I4o5uDZcRmgvqxhOiWWQ5gsvfb0Q6yG0P3maxhdaua5qe//m/om1bxKBo8
 yt1w==
X-Gm-Message-State: AO0yUKVHfUgY+9ZFZY5dMSviweQIh8+sfZeyiZ6cZPE6eGgwATk+qclR
 3roWV72wXDVduk0GXAM+4X06xg==
X-Google-Smtp-Source: AK7set9kDm860Q2jniyjpu+V5HDq3cgShGFlMDbAUHFNqPTzo/CMJ6zB8uV4xKfU6OmLTZxxLkLGPg==
X-Received: by 2002:a05:6000:3cb:b0:2bf:e766:90f4 with SMTP id
 b11-20020a05600003cb00b002bfe76690f4mr10770428wrg.68.1675447845316; 
 Fri, 03 Feb 2023 10:10:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a5d5957000000b002366e3f1497sm2567804wri.6.2023.02.03.10.10.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Vijai Kumar K <vijai@behindbytes.com>
Subject: [RFC PATCH 17/19] hw/riscv: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:12 +0100
Message-Id: <20230203180914.49112-18-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 18:10:48 -0000

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/microchip_pfsoc.c |  8 ++++----
 hw/riscv/opentitan.c       |  9 +++------
 hw/riscv/shakti_c.c        |  7 +++----
 hw/riscv/sifive_e.c        |  8 +++-----
 hw/riscv/sifive_u.c        |  9 +++------
 hw/riscv/spike.c           | 10 ++++------
 hw/riscv/virt.c            |  9 +++------
 7 files changed, 23 insertions(+), 37 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 82ae5e7023..ff6c4b0471 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -423,16 +423,16 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
         qdev_set_nic_properties(DEVICE(&s->gem1), nd);
     }
 
-    object_property_set_int(OBJECT(&s->gem0), "revision", GEM_REVISION, errp);
-    object_property_set_int(OBJECT(&s->gem0), "phy-addr", 8, errp);
+    qdev_prop_set_uint32(DEVICE(&s->gem0), "revision", GEM_REVISION);
+    qdev_prop_set_uint8(DEVICE(&s->gem0), "phy-addr", 8);
     sysbus_realize(SYS_BUS_DEVICE(&s->gem0), errp);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem0), 0,
                     memmap[MICROCHIP_PFSOC_GEM0].base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gem0), 0,
         qdev_get_gpio_in(DEVICE(s->plic), MICROCHIP_PFSOC_GEM0_IRQ));
 
-    object_property_set_int(OBJECT(&s->gem1), "revision", GEM_REVISION, errp);
-    object_property_set_int(OBJECT(&s->gem1), "phy-addr", 9, errp);
+    qdev_prop_set_uint32(DEVICE(&s->gem1), "revision", GEM_REVISION);
+    qdev_prop_set_uint8(DEVICE(&s->gem1), "phy-addr", 9);
     sysbus_realize(SYS_BUS_DEVICE(&s->gem1), errp);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->gem1), 0,
                     memmap[MICROCHIP_PFSOC_GEM1].base);
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 64d5d435b9..f69db8c31e 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -145,12 +145,9 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     MemoryRegion *sys_mem = get_system_memory();
     int i;
 
-    object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "resetvec", s->resetvec,
-                            &error_abort);
+    qdev_prop_set_string(DEVICE(&s->cpus), "cpu-type", ms->cpu_type);
+    qdev_prop_set_uint32(DEVICE(&s->cpus), "num-harts", ms->smp.cpus);
+    qdev_prop_set_uint64(DEVICE(&s->cpus), "resetvec", s->resetvec);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
 
     /* Boot ROM */
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index e43cc9445c..32d3d7cbab 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -168,10 +168,9 @@ static void shakti_c_soc_instance_init(Object *obj)
      * So let it be in instance_init. When supported should use ms->cpu_type
      * instead of TYPE_RISCV_CPU_SHAKTI_C
      */
-    object_property_set_str(OBJECT(&sss->cpus), "cpu-type",
-                            TYPE_RISCV_CPU_SHAKTI_C, &error_abort);
-    object_property_set_int(OBJECT(&sss->cpus), "num-harts", 1,
-                            &error_abort);
+    qdev_prop_set_string(DEVICE(&sss->cpus), "cpu-type",
+                         TYPE_RISCV_CPU_SHAKTI_C);
+    qdev_prop_set_uint32(DEVICE(&sss->cpus), "num-harts", 1);
 }
 
 static const TypeInfo shakti_c_type_info = {
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 3e3f4b0088..0f5dfc5f3d 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -178,9 +178,8 @@ static void sifive_e_soc_init(Object *obj)
     SiFiveESoCState *s = RISCV_E_SOC(obj);
 
     object_initialize_child(obj, "cpus", &s->cpus, TYPE_RISCV_HART_ARRAY);
-    object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x1004, &error_abort);
+    qdev_prop_set_uint32(DEVICE(&s->cpus), "num-harts", ms->smp.cpus);
+    qdev_prop_set_uint64(DEVICE(&s->cpus), "resetvec", 0x1004);
     object_initialize_child(obj, "riscv.sifive.e.gpio0", &s->gpio,
                             TYPE_SIFIVE_GPIO);
 }
@@ -192,8 +191,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
     SiFiveESoCState *s = RISCV_E_SOC(dev);
     MemoryRegion *sys_mem = get_system_memory();
 
-    object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
-                            &error_abort);
+    qdev_prop_set_string(DEVICE(&s->cpus), "cpu-type", ms->cpu_type);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
 
     /* Mask ROM */
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 2fb6ee231f..97f504d011 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -540,10 +540,8 @@ static void sifive_u_machine_init(MachineState *machine)
 
     /* Initialize SoC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_U_SOC);
-    object_property_set_uint(OBJECT(&s->soc), "serial", s->serial,
-                             &error_abort);
-    object_property_set_str(OBJECT(&s->soc), "cpu-type", machine->cpu_type,
-                             &error_abort);
+    qdev_prop_set_uint32(DEVICE(&s->soc), "serial", s->serial);
+    qdev_prop_set_string(DEVICE(&s->soc), "cpu-type", machine->cpu_type);
     qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
 
     /* register RAM */
@@ -905,8 +903,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
         qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
         qdev_set_nic_properties(DEVICE(&s->gem), nd);
     }
-    object_property_set_int(OBJECT(&s->gem), "revision", GEM_REVISION,
-                            &error_abort);
+    qdev_prop_set_uint32(DEVICE(&s->gem), "revision", GEM_REVISION);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gem), errp)) {
         return;
     }
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index badc11ec43..328278d820 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "hw/qdev-properties.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/sysbus.h"
@@ -238,12 +239,9 @@ static void spike_board_init(MachineState *machine)
         object_initialize_child(OBJECT(machine), soc_name, &s->soc[i],
                                 TYPE_RISCV_HART_ARRAY);
         g_free(soc_name);
-        object_property_set_str(OBJECT(&s->soc[i]), "cpu-type",
-                                machine->cpu_type, &error_abort);
-        object_property_set_int(OBJECT(&s->soc[i]), "hartid-base",
-                                base_hartid, &error_abort);
-        object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
-                                hart_count, &error_abort);
+        qdev_prop_set_string(DEVICE(&s->soc[i]), "cpu-type", machine->cpu_type);
+        qdev_prop_set_uint32(DEVICE(&s->soc[i]), "hartid-base", base_hartid);
+        qdev_prop_set_uint32(DEVICE(&s->soc[i]), "num-harts", hart_count);
         sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_fatal);
 
         /* Core Local Interruptor (timer and IPI) for each socket */
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4a11b4b010..0e091cb65f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1360,12 +1360,9 @@ static void virt_machine_init(MachineState *machine)
         object_initialize_child(OBJECT(machine), soc_name, &s->soc[i],
                                 TYPE_RISCV_HART_ARRAY);
         g_free(soc_name);
-        object_property_set_str(OBJECT(&s->soc[i]), "cpu-type",
-                                machine->cpu_type, &error_abort);
-        object_property_set_int(OBJECT(&s->soc[i]), "hartid-base",
-                                base_hartid, &error_abort);
-        object_property_set_int(OBJECT(&s->soc[i]), "num-harts",
-                                hart_count, &error_abort);
+        qdev_prop_set_string(DEVICE(&s->soc[i]), "cpu-type", machine->cpu_type);
+        qdev_prop_set_uint32(DEVICE(&s->soc[i]), "hartid-base", base_hartid);
+        qdev_prop_set_uint32(DEVICE(&s->soc[i]), "num-harts", hart_count);
         sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_fatal);
 
         if (!kvm_enabled()) {
-- 
2.38.1


