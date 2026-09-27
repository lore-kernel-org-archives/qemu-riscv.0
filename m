Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE0CC9833F
	for <qemu-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 20:15:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAvGE-0008LT-A2; Sun, 27 Sep 2026 16:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1xAvGC-0008LD-Ok
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 16:14:08 -0400
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1xAvGA-0003Z1-Sf
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 16:14:08 -0400
Received: by mail-pj2-x0d.google.com with SMTP id
 98e67ed59e1d1-3a0b6200eb0so1783314a91.2
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 13:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790540045; x=1791144845; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tkNWi6bqLSlvCJO/5RICW4jPtEBQA0a/asEIW2oEfZE=;
 b=FuT8pnt4EQWqwrLdxtYvlzDe5pdVuV/n51TpXpk/0dnc9W4S0uvkfyF1BnY//a/v0R
 B6vRuPP4G4Yq5ppeHDO8IRGkNe5JsheqZToxMsCtNKMNwe+XN1Di7ld5GiQjBbbeGHjO
 LHFHZ40kDPdpNQ8rvNK5B+m4VNvz17wO2hRlTlCRXYkFvHR9w3AH1been3jGVlKGZ9cT
 JmeKXXBQ8+mmyBB7QVxdYQt6Do3I7GE+oSPuHuByBgWZRE3IzobUor0YhEjyAT+uliXw
 wMr80n/Q2YbCbxZ+Izgb/sKX0iysB0xwyKELFME0aFT14GvkMii+HjFXqR9JLX16ZqB9
 tXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790540045; x=1791144845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tkNWi6bqLSlvCJO/5RICW4jPtEBQA0a/asEIW2oEfZE=;
 b=AUHPYf3lc834RZxHBt13BPaTVbxtQtbYYPVvlhWaNHr6oZGbf7KwFxaOTd2Za1+MsP
 aa0k0q6XJ4ke8+Ip1NZVkDRWBp2psvBSj8RzQEhjfVcPJPlwxlwQSQw5x3HTThjxnDjy
 MaNpoWBUtWL7NhCWdATUooNuhf5cpDmCF/QQ8zPhNh0cXFx1KdTEBk/1sjUSHX0Kd1uO
 wemDLeaeAgh9z4axtHDTJnqabbTIJb3ei6Jbeda8E2+3AjFvkfB32hqSpWlzYb6Ldyya
 5b4V9b66AiRrJWI+4HKJ5eDPdvMUMhf07u+ukx1aGcK8Iuk5UGfgA6i+OedIGpBT2CtP
 tcXA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzzoJ/j8g97dbG5rxBcMkeFZ6PgkdAOEHCph2YOQUo+Wcimi6cvvg3Pu2KoDHT4TfFpHy1Ir4nQ+IOg@nongnu.org
X-Gm-Message-State: AFq9FYK+p9cOxXSJp8sgzak/0WT0MQip0X3WoaAorO0RoAc1hg0u+Dnq
 bOLmn0TxHvg1fHG9FHAfeufVXYu/bVTkZ48x/qw2yuFdPi1MweS0ORsU
X-Gm-Gg: AYBFou00GzKaiu0SVnUsCIhzXx3yUKULNfPZe3ccdwljvEz0AzhHJkK7xW6H8HWbTl/
 9mfA8HMc8CKFCMlqdrCkNOZpGBhm15RgNl/IAGFgA5cRegVa97XjDwTrz4uBTfgqkpdlx+wg2mp
 DqCB3wGaXlGjB2oQeOzkCSJHtFKijzvWHIN69TQD8HmGLByNAsvPHwRuo5d2r4heEqQwr7RKG28
 mLyBxWJI6uTYp/Da1++Y4m7n9y1PXXti8bq096ik7QguCWqg+N7ghQEgzjBujf3fRV18ZOSqFrb
 1CKLAj3SE/69/3AoLIqjWUMqx2o7Etljg9PES8BkC3ydzhD9A3+r/E3z97mK5aTc4u5SbCxkKPf
 Q7fgzERcv2VeQhuMqwdhWYpQNVtSgMLryD6YgX88IBxGedrlijnwB0H0fzW9B7pWX09LjqJbDvr
 TKKasGJiGdvm4lQIYgh4G+Nh4lI7WY3V/mS9AnyrUdA6tyK2PEbvgl/yNb1zs7rSYyZN5yLiZnG
 DRs8N/HYX8dFrodOd0+B/i1n9afcU6cTqJ7uebGFaE5w9BFg2zMF+1dwOzGFH0jFes1iwKpUA==
X-Received: by 2002:a17:90b:3a08:b0:3a0:7d5b:8d56 with SMTP id
 98e67ed59e1d1-3a0bb599f07mr6087169a91.28.1790540045445; 
 Sun, 27 Sep 2026 13:14:05 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com
 (33.223.194.35.bc.googleusercontent.com. [35.194.223.33])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0c719f86fsm13932737a91.7.2026.09.27.13.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 13:14:05 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 farosas@suse.de, lvivier@redhat.com
Cc: liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 portias@oss.tenstorrent.com, wxchen0913@gmail.com, jserv@ccns.ncku.edu.tw,
 marscheng@google.com, eleanor15x@gmail.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>
Subject: [PATCH v5 4/7] hw/riscv: Add Milk-V Duo board support
Date: Sun, 27 Sep 2026 20:13:23 +0000
Message-ID: <20260927201326.650943-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260927201326.650943-1-visitorckw@gmail.com>
References: <20260927201326.650943-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::d;
 envelope-from=visitorckw@gmail.com; helo=mail-pj2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 MAINTAINERS                                 |   9 ++
 configs/devices/riscv64-softmmu/default.mak |   1 +
 hw/riscv/Kconfig                            |   6 +
 hw/riscv/meson.build                        |   1 +
 hw/riscv/milkv_duo.c                        | 118 ++++++++++++++++++++
 5 files changed, 135 insertions(+)
 create mode 100644 hw/riscv/milkv_duo.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d4e9cf61ea..bef8c2f3b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1872,6 +1872,15 @@ F: tests/qtest/k230-wdt-test.c
 F: tests/qtest/k230-gsdma-test.c
 F: tests/qtest/k230-decomp-gzip-test.c
 
+Milk-V Duo
+M: Kuan-Wei Chiu <visitorckw@gmail.com>
+S: Maintained
+F: hw/misc/cv1800b_clk.c
+F: hw/riscv/cv1800b.c
+F: hw/riscv/milkv_duo.c
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
index b7c0871c67..70a331f7ae 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -172,3 +172,9 @@ config SOPHGO_CV1800B
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
index 45895486d4..a40e80645b 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -23,5 +23,6 @@ riscv_ss.add(when: 'CONFIG_MIPS_BOSTON_AIA', if_true: files('boston-aia.c'))
 riscv_ss.add(when: 'CONFIG_K230', if_true: files('k230.c'))
 
 riscv_ss.add(when: 'CONFIG_SOPHGO_CV1800B', if_true: files('cv1800b.c'))
+riscv_ss.add(when: 'CONFIG_MILKV_DUO', if_true: files('milkv_duo.c'))
 
 hw_arch += {'riscv': riscv_ss}
diff --git a/hw/riscv/milkv_duo.c b/hw/riscv/milkv_duo.c
new file mode 100644
index 0000000000..1285c8d34f
--- /dev/null
+++ b/hw/riscv/milkv_duo.c
@@ -0,0 +1,118 @@
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
+    },
+};
+
+DEFINE_TYPES(milkv_duo_machine_type_infos)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


