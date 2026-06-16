Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BC2CD98E1
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 19:03:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZZ3d-0001Nm-4z; Tue, 16 Jun 2026 15:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1wZZ3U-0001Li-W2
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 15:02:38 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1wZZ3R-0007cT-45
 for qemu-riscv@nongnu.org; Tue, 16 Jun 2026 15:02:36 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-8419ab3a297so2216271b3a.2
 for <qemu-riscv@nongnu.org>; Tue, 16 Jun 2026 12:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781636550; x=1782241350; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c04pXZzv/xwq2ngiuhWFNtQ5L0WrFCf278WNjJZoPtc=;
 b=NPj7mCnQZaYEKrRNJbmVyYPJUOhD0i4jGgugixUVLj4I99tE+SHLMKp1NBmhPklzA8
 ywweL/0iLopLK71YvUmYWtQUiRluz8ceNP1WV8IYtNS7REbX2J4590tkM0FegKcM20DW
 H96Y6dB6fuAaFDoFgvxr+QacOQy0ut+T8zCrQDiEN8ry5RxE8HL+oKypz9OfpWtas6Tt
 tPh0+veOx8nbyAzi/QMGRZNV1UXbnHdn4iszX36//d1hJe4OaIL/PU8+fNmUC/vC64Jn
 XUl9QOBndSQrGWomcLhP31nHFyJt+q6V594D+YA6Pp0O4QSQ7DeX5SiaoSGBDk5JZKxi
 xeKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781636550; x=1782241350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c04pXZzv/xwq2ngiuhWFNtQ5L0WrFCf278WNjJZoPtc=;
 b=F/YD+z8SEYKlhymYz1I72bGA4x8EOgzXdW9sPPxVU8MqTr0aT5AbFQBfUuXuB49Dx6
 3dlu3DDu2N3RiS2A4UNVVjHJZNVGXopXlZiMITWnTzYumYz9OhCKPDm6pPBKVF+Vlga9
 FucNsh3Ok3CpNmaJ2ngRnMwYq0c2LAcpouTBd3K9d5F0bAV/rlX4BjxDXfDSAlHp3jDG
 EhhRmRGWHy/MmugCtKXQrZsVNoq/Hr4r9d/UtFH/h7tDRFzIfFNxJU+i/UECK59ukzAx
 QC9Xjou1OC6Jmm1RaTj66y976hcrK1v19vFyA9Op4B3mOpzOKspgL9KKHTYM2QRMMUQ7
 7fvQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Qf1H1ZPcd074ikR4HQKGFIEFA9FV9yf6XRgXr2cb3pmMY1FbwFbL2ff70vim3P24ee8r2alHZeEBr@nongnu.org
X-Gm-Message-State: AOJu0YzIHMA1j8imhbOmG+HdSFdN11jC/YJtzAKb2QsdwPlPf821K96W
 lP0uAvr+dp72g36fAMQ6iIGIaSOETQvf9XVJWIR70ieRAOpuXn7SNjyh
X-Gm-Gg: Acq92OEz7+ulqZ3kVOYGakdmpdGfuuNBpW3o/BPIrDJoUGSDdTf/yzD26Lyk5CRCKUl
 Vq/dSoAb+SVtm6/Yzt3GX/NAKZMkyQswCWIClCD/Qjo09Dn58chH8hVeanmAM20+4G89B7nhTe7
 +2Z1VDgRRqm5nh2y/nMnnxK9Gf4l0qWOK8K5pugMmcwunmgQVzL8G+zFD3WGGOijn9yCVK43My2
 vAnYE0Zgns5avbjSkPXaRtFobLPk9q+D92rAUC9FuctPNN8dzNKSPKQ5NOGX/dCKuv/dYl//c2u
 5Xto9LdzDY/nIeKZRg0f4vXMVzpvjl8hyop+r98yOZAvBDCnfigF0k13xXFgCaGXtONQrUkwCs2
 uzDDqoaAyTuBTjbA/G0oYibo1pfl9luvOaWSnQjtHUSFZGSjZohUJYaC0HbP8ZB4+RYX4dA+OqS
 JGGCaJRgg+ZcnPCF09Y4hpIlGjRw0SABZUK/X0IAiGB5EOzLwXEPv6MnH2N5q+pCCd4EtJAt8Dk
 B8wAU0zVrUJDg1tCIH8E1gcC1kAPjmkoQ==
X-Received: by 2002:a05:6a00:1907:b0:843:4937:6d0e with SMTP id
 d2e1a72fcca58-8452448103fmr466979b3a.16.1781636550200; 
 Tue, 16 Jun 2026 12:02:30 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com
 (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8434ac9c474sm12671540b3a.2.2026.06.16.12.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 12:02:29 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: pbonzini@redhat.com, marcandre.lureau@redhat.com, alistair.francis@wdc.com,
 farosas@suse.de, lvivier@redhat.com
Cc: liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, marscheng@google.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v3 4/5] hw/riscv: Add Milk-V Duo board support
Date: Tue, 16 Jun 2026 19:01:46 +0000
Message-ID: <20260616190147.1286316-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
In-Reply-To: <20260616190147.1286316-1-visitorckw@gmail.com>
References: <20260616190147.1286316-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=visitorckw@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Add support for the Milk-V Duo development board, which is powered by
the Sophgo CV1800B SoC.

The implementation includes:
- Board-level machine initialization with 64mb of default ram.
- Integration of the CV1800B SoC.
- Support for loading external FDT, kernel, and initrd images.
- Proper setup of the reset vector to match the CV1800B's boot flow.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS                                 |  11 ++
 configs/devices/riscv64-softmmu/default.mak |   1 +
 hw/riscv/Kconfig                            |   6 +
 hw/riscv/meson.build                        |   1 +
 hw/riscv/milkv_duo.c                        | 124 ++++++++++++++++++++
 5 files changed, 143 insertions(+)
 create mode 100644 hw/riscv/milkv_duo.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 93df53d87f..e197dcb5b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1797,6 +1797,17 @@ F: include/hw/riscv/k230.h
 F: include/hw/watchdog/k230_wdt.h
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
index 299baed4a8..42a0e78574 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -157,3 +157,9 @@ config SOPHGO_CV1800B
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
index 6c242d77da..8c88f2bc25 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -20,5 +20,6 @@ riscv_ss.add(when: 'CONFIG_MIPS_BOSTON_AIA', if_true: files('boston-aia.c'))
 riscv_ss.add(when: 'CONFIG_K230', if_true: files('k230.c'))
 
 riscv_ss.add(when: 'CONFIG_SOPHGO_CV1800B', if_true: files('cv1800b.c'))
+riscv_ss.add(when: 'CONFIG_MILKV_DUO', if_true: files('milkv_duo.c'))
 
 hw_arch += {'riscv': riscv_ss}
diff --git a/hw/riscv/milkv_duo.c b/hw/riscv/milkv_duo.c
new file mode 100644
index 0000000000..8e9a553a57
--- /dev/null
+++ b/hw/riscv/milkv_duo.c
@@ -0,0 +1,124 @@
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
+    firmware_load_addr = cv1800b_memmap[CV1800B_DEV_DRAM].base;
+    firmware_end_addr = firmware_load_addr;
+    if (machine->firmware) {
+        firmware_end_addr = riscv_find_and_load_firmware(machine, machine->firmware,
+                                                         &firmware_load_addr, NULL);
+    }
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
+        rom_add_blob_fixed_as("fdt", machine->fdt, fdt_size, fdt_load_addr,
+                              &address_space_memory);
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
+static const TypeInfo milkv_duo_machine_type_info = {
+    .name = TYPE_MILK_V_DUO,
+    .parent = TYPE_MACHINE,
+    .instance_size = sizeof(MilkVDuoState),
+    .class_init = milkv_duo_machine_class_init,
+    .interfaces = riscv64_machine_interfaces,
+};
+
+static void milkv_duo_machine_register_types(void)
+{
+    type_register_static(&milkv_duo_machine_type_info);
+}
+
+type_init(milkv_duo_machine_register_types)
-- 
2.54.0.1136.gdb2ca164c4-goog


