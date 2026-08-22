Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F422C5DF97
	for <qemu-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 19:44:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxrdH-0001y4-8m; Sat, 22 Aug 2026 15:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1wxrdF-0001wr-C4
 for qemu-riscv@nongnu.org; Sat, 22 Aug 2026 15:43:57 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1wxrdD-00079q-I2
 for qemu-riscv@nongnu.org; Sat, 22 Aug 2026 15:43:57 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2ccf2360620so18582485ad.3
 for <qemu-riscv@nongnu.org>; Sat, 22 Aug 2026 12:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787427834; x=1788032634; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JBvsZAtWzJaZpsxtJQRfqRaJmH274crQHiXqqspTmds=;
 b=Vid8uSVu51jdev1z4hFp/s3SNGpnarIy3Szs0toD50Ic7d6wfiREuR6rMDUX4Wp6YS
 Ed87ICWWzZeNi0A1oQeatY8dHwHx0UVrKPZyudGVbMUvjUhJtZ+7CNs6TZUwW3ZNwzIq
 Xy+N60kWym3Tl6jR4a06DsnUjxIpLtSo8xDM2YO6AFFW2wrihWdaN9BOASTUTcpFSwJz
 HQolCyek5029lSqfeZ+H7722cSkGOZy99EfwRk/AHYNICHIAH6JyCrSK9xSUzVVIbNnh
 DTS4i0fah5ns1Af8vZ4Vyi7MyZmVRuEBmd0Xq2trYIEjKtinJr0cuf8jid9so2xwL5K6
 pyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787427834; x=1788032634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=JBvsZAtWzJaZpsxtJQRfqRaJmH274crQHiXqqspTmds=;
 b=GeAcAUcgpz04UK8hyZcqiIFM78SjpVUIOsFG/vRwwLOr2ahkP0LoS7QTpbMQs2a7LU
 L5HEo23ZPI8m/08ZxbQDOvDdkVYfCXMZUmZac9m6jvNO4tA66GIH9n9wvJ+UEbl5tW8Z
 NAI8pniej6YTS4hwcwMQAg7bgm13CIBgTNhwA6LFrwaiI6mNl513Fqg3j2UJbmDIZmqX
 i46419HlaFyOBLf58ywERbJ3wsUY7PnfP8CGCC0dTRA0OqB7E5E47WYzBTJkY00CoAg2
 bLHi88KqPXFbdyAQ7ryEHhzjBM15FXBffWhrdyTI7ENheCUe+/9/1A2JTrVEKL4yHJdM
 t/sA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrj5hRqRcLsh92xgeR1P8RdtbW69OIufSbiqbsAVwRRaa5LwyJBFmzIoE8rl5jZ24MCpZW6oUIT0JPT@nongnu.org
X-Gm-Message-State: AFuF++mN7AkYIuVho6DXJvh5qpfLiUQFUTBwyK6sFN9MsR5CpZAKgIBm
 aGpC7EwqpBEcrSnoqzX5klfCt3qwdg70habECAGRTmbt5fr12LaZe/bi
X-Gm-Gg: AR+sD10SezJhKaeOabb+i7xoYL0sAVubZOZicRsA1ehwlRBJidjSf5USBU0SO24rTdJ
 LXyBHYnzplvxv2qPqJBb6nSdGJ8OuEjUs3CP2Eb0bcHwpHcTwx4OtPdzbDjNvtQDvT1M3NSj73A
 LIriNMCOqHXJ7L3lNC5vM+sQyMxoYKtnef6ghyDUnXbYP+dn4921PgTE9hv+9L7nB7fitEDKZyL
 qq//lGe9paENWVj3Wwb5t+2fIs/eXbr6O3M1dGZqRn4euoxhhvxkf8SnPmizjVFOpQJ8zHh+cOT
 LG57pi8Wkkrj8Q/hs4W8ui4lAT692+552xCtJvDDwhN6iTFc282p8efbyM1AWSd6fXPuqamI+IE
 xBX5VOJz1aKSfoPCpGgH9fUHwh2mUoyq/voXiX7dMYAcHK3aAP7k2Y/khEnK6BJN4EwTWKd54EX
 FB+OAiUutHgqbKIzU74YweQkhRABd2XdyJ9CMgVxUJTnZ7pwZszcuHlXLAjeA7OMosiGnXycHdV
 DJMMn1nTsDoiJfJfOM0g8ybHG7qf5iPFDGShpFcPLMHpgAKmd4v9JGQnzV8BbInsQ==
X-Received: by 2002:a17:902:f68d:b0:2ca:660:b1d with SMTP id
 d9443c01a7336-2d64b025d01mr259977445ad.11.1787427834121; 
 Sat, 22 Aug 2026 12:43:54 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com
 (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d676895799sm5892715ad.38.2026.08.22.12.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2026 12:43:53 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: pierrick.bouvier@oss.qualcomm.com, almer@dabbelt.com,
 alistair.francis@wdc.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 farosas@suse.de, lvivier@redhat.com
Cc: liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 wxchen0913@gmail.com, jserv@ccns.ncku.edu.tw, marscheng@google.com,
 eleanor15x@gmail.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>
Subject: [PATCH v4 4/7] hw/riscv: Add Milk-V Duo board support
Date: Sat, 22 Aug 2026 19:43:11 +0000
Message-ID: <20260822194315.2550260-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.766.g2966f0265a-goog
In-Reply-To: <20260822194315.2550260-1-visitorckw@gmail.com>
References: <20260822194315.2550260-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=visitorckw@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Add support for the Milk-V Duo development board, which is powered by
the Sophgo CV1800B SoC.

The implementation includes:
- Board-level machine initialization with 64mb of default ram.
- Integration of the CV1800B SoC.
- Support for loading external FDT, kernel, and initrd images.
- Proper setup of the reset vector to match the CV1800B's boot flow.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
---
 MAINTAINERS                                 |  11 ++
 configs/devices/riscv64-softmmu/default.mak |   1 +
 hw/riscv/Kconfig                            |   6 +
 hw/riscv/meson.build                        |   1 +
 hw/riscv/milkv_duo.c                        | 120 ++++++++++++++++++++
 5 files changed, 139 insertions(+)
 create mode 100644 hw/riscv/milkv_duo.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 08017f4786..dde85ef420 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1851,6 +1851,17 @@ F: include/hw/watchdog/k230_wdt.h
 F: tests/functional/riscv64/test_k230.py
 F: tests/qtest/k230-wdt-test.c
 
+Milk-V Duo
+M: Kuan-Wei Chiu <visitorckw@gmail.com>
+S: Maintained
+F: hw/char/dw8250.c
+F: hw/misc/cv1800b_clk.c
+F: hw/riscv/cv1800b.c
+F: hw/riscv/milkv_duo.c
+F: include/hw/char/dw8250.h
+F: include/hw/misc/cv1800b_clk.h
+F: include/hw/riscv/cv1800b.h
+
 RX Machines
 -----------
 rx-gdbsim
diff --git a/configs/devices/riscv64-softmmu/default.mak b/configs/devices/riscv64-softmmu/default.mak
index a8e4d0ab33..2ba91b14d4 100644
--- a/configs/devices/riscv64-softmmu/default.mak
+++ b/configs/devices/riscv64-softmmu/default.mak
@@ -13,3 +13,4 @@
 # CONFIG_SHAKTI_C=n
 # CONFIG_XIANGSHAN_KUNMINGHU=n
 # CONFIG_MIPS_BOSTON_AIA=n
+# CONFIG_MILKV_DUO=n
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 5ab38f228f..6360de4260 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -170,3 +170,9 @@ config SOPHGO_CV1800B
     select SIFIVE_PLIC
     select SOPHGO_CV1800B_CLK
     select DW8250
+
+config MILKV_DUO
+    bool
+    depends on RISCV64
+    default y
+    select SOPHGO_CV1800B
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index b278b443b6..0ab1baec88 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -22,5 +22,6 @@ riscv_ss.add(when: 'CONFIG_MIPS_BOSTON_AIA', if_true: files('boston-aia.c'))
 riscv_ss.add(when: 'CONFIG_K230', if_true: files('k230.c'))
 
 riscv_ss.add(when: 'CONFIG_SOPHGO_CV1800B', if_true: files('cv1800b.c'))
+riscv_ss.add(when: 'CONFIG_MILKV_DUO', if_true: files('milkv_duo.c'))
 
 hw_arch += {'riscv': riscv_ss}
diff --git a/hw/riscv/milkv_duo.c b/hw/riscv/milkv_duo.c
new file mode 100644
index 0000000000..ec09243bef
--- /dev/null
+++ b/hw/riscv/milkv_duo.c
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Milk-V Duo board
+ *
+ * Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
+#include "hw/core/boards.h"
+#include "hw/riscv/cv1800b.h"
+#include "hw/riscv/boot.h"
+#include "target/riscv/cpu-qom.h"
+#include "system/system.h"
+#include "system/device_tree.h"
+#include "qemu/error-report.h"
+#include "hw/core/loader.h"
+#include <libfdt.h>
+#include "hw/riscv/machines-qom.h"
+
+struct MilkVDuoState {
+    MachineState parent_obj;
+    CV1800BSoCState soc;
+};
+
+#define TYPE_MILK_V_DUO MACHINE_TYPE_NAME("milkv-duo")
+OBJECT_DECLARE_SIMPLE_TYPE(MilkVDuoState, MILK_V_DUO)
+
+static void milkv_duo_init(MachineState *machine)
+{
+    MilkVDuoState *s = MILK_V_DUO(machine);
+    MemoryRegion *system_memory = get_system_memory();
+    RISCVBootInfo boot_info;
+    const char *firmware_name;
+    hwaddr firmware_load_addr, firmware_end_addr;
+    hwaddr fdt_load_addr = 0;
+    int fdt_size = 0;
+    uint64_t kernel_entry = 0;
+
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_CV1800B_SOC);
+    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
+
+    memory_region_add_subregion(system_memory,
+                                cv1800b_memmap[CV1800B_DEV_DRAM].base,
+                                machine->ram);
+
+    riscv_boot_info_init(&boot_info, &s->soc.cpus);
+
+    firmware_name = riscv_default_firmware_name(&s->soc.cpus);
+    firmware_load_addr = cv1800b_memmap[CV1800B_DEV_DRAM].base;
+    firmware_end_addr = riscv_find_and_load_firmware(machine, &boot_info,
+                                                     firmware_name,
+                                                     &firmware_load_addr, NULL);
+
+    if (machine->dtb) {
+        machine->fdt = load_device_tree(machine->dtb, &fdt_size);
+        if (!machine->fdt) {
+            error_report("Failed to load device tree");
+            exit(1);
+        }
+
+        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
+            if (fdt_path_offset(machine->fdt, "/chosen") < 0) {
+                qemu_fdt_add_subnode(machine->fdt, "/chosen");
+            }
+            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
+                                    machine->kernel_cmdline);
+        }
+    }
+
+    if (machine->kernel_filename) {
+        hwaddr kernel_start_addr = riscv_calc_kernel_start_addr(&boot_info,
+                                                                firmware_end_addr);
+        riscv_load_kernel(machine, &boot_info, kernel_start_addr, true, NULL);
+        kernel_entry = boot_info.image_low_addr;
+    }
+
+    if (machine->dtb) {
+        fdt_load_addr = riscv_compute_fdt_addr(cv1800b_memmap[CV1800B_DEV_DRAM].base,
+                                               machine->ram_size, machine, &boot_info);
+        riscv_load_fdt(fdt_load_addr, machine->fdt);
+    }
+
+    riscv_setup_rom_reset_vec(machine, &s->soc.cpus,
+                              firmware_load_addr,
+                              cv1800b_memmap[CV1800B_DEV_ROM].base,
+                              cv1800b_memmap[CV1800B_DEV_ROM].size,
+                              kernel_entry,
+                              fdt_load_addr);
+}
+
+static void milkv_duo_machine_class_init(ObjectClass *oc, const void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    static const char *const valid_cpu_types[] = {
+        TYPE_RISCV_CPU_THEAD_C906,
+        NULL
+    };
+
+    mc->desc = "Milk-V Duo Board (CV1800B)";
+    mc->init = milkv_duo_init;
+    mc->max_cpus = 2;
+    mc->default_cpu_type = TYPE_RISCV_CPU_THEAD_C906;
+    mc->valid_cpu_types = valid_cpu_types;
+    mc->default_ram_size = 64 * MiB;
+    mc->default_ram_id = "riscv.milkv_duo.ram";
+}
+
+static const TypeInfo milkv_duo_machine_type_infos[] = {
+    {
+        .name = TYPE_MILK_V_DUO,
+        .parent = TYPE_MACHINE,
+        .instance_size = sizeof(MilkVDuoState),
+        .class_init = milkv_duo_machine_class_init,
+        .interfaces = riscv64_machine_interfaces,
+    },
+};
+
+DEFINE_TYPES(milkv_duo_machine_type_infos)
-- 
2.55.0.766.g2966f0265a-goog


