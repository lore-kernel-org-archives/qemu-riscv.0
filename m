Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIx1-0007N2-86
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 17:04:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwt-000731-7f
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:52 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwo-0006vh-TL
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 17:04:50 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so10063291pjg.4
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 14:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140285;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LtnBq7s4bDkJsgeH75CHXNbBj64DnlS7U8qxbOWtiLM=;
 b=Hj/jhHuevfmpbu1R9xhkG9Ws2KHqLrS5Ef6PdybkHbVHEwhgVwOD2xDYah+PVNlCra
 n0Rsaexj8jCHlUXqHRDGMC3jLDmlP/pnWJWHTDASFB1SAa8SjE5Ih5l4zz+rMWdfcHmf
 8Oz7jFAxu4PNSPbYMmWDDgDbAPBstTFqkQFy3esJ09GqEV2YPcJLXkeeRqr/Tgc4NfDE
 0MVrvijZFzjdIxMX0M5J1AAk6rxFDuvgKS8Q27/38ZuPr70/VadsE275ruCXSoQzo3mK
 nNPcblQ7uIPsoce9LGZDZ1q4ozv8Y9LroRZtTMng+nTOUBvOisQ4MznGNU4RPzGXI1Lp
 cbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140285;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LtnBq7s4bDkJsgeH75CHXNbBj64DnlS7U8qxbOWtiLM=;
 b=76/0iGucEN1DA1+tx9T794a1CSZmS2OTmgK+yJ933vlGuiGaSFFxev048mEAn19Zlh
 twdnOazRO0BjyZLKsZz5De3k8O3e+iQjwIdmZVqj2kVHSPNJVdVgKwR0IP5pjMjVBXfd
 Vm++NRsR0Mrw+lOVLCr9IHpDmTeOekVTYaAZsZ+cqqthBbJv3hI093/l6d+724UZ2ZLc
 lB86YZPrqVKM2WUtQ4165xgdUFybD1/yVhzcSUaKL/JtBFJBlI/mOFKX54Us6CN89To0
 peLt2aPPhXUjYxxYVrsvY/T+R/LVCL9FT/Kq3I5GxtofePNkdfRt4gu1Q3TGNtGaxMSy
 Zauw==
X-Gm-Message-State: AO0yUKW9YZuy/0jPSPorxDaXC/K9jU1A42awG7q15J4RSZZ93lAR23N3
 V6MeDGRSrI4yXYQLZMKkhaIsp09mxiqeVkIcQNA=
X-Google-Smtp-Source: AK7set9ujP76koPxARg+6qZ1y2k2CVeeiSqxR5v5/PCncX56axrMMF5DyZUlV3NRG3dxQesVxWTYEg==
X-Received: by 2002:a05:6a20:6d2a:b0:cc:395f:e1ed with SMTP id
 fv42-20020a056a206d2a00b000cc395fe1edmr11574670pzb.22.1678140285112; 
 Mon, 06 Mar 2023 14:04:45 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 e16-20020aa78250000000b005e093020cabsm6724362pfn.45.2023.03.06.14.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:44 -0800 (PST)
Subject: [PULL 18/22] hw/riscv/virt: Enable basic ACPI infrastructure
Date: Mon,  6 Mar 2023 14:02:55 -0800
Message-Id: <20230306220259.7748-19-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 06 Mar 2023 22:04:53 -0000

From: Sunil V L <sunilvl@ventanamicro.com>

Add basic ACPI infrastructure for RISC-V with below tables.
        1) DSDT with below basic objects
                - CPUs
                - fw_cfg
        2) FADT revision 6 with HW_REDUCED flag
        3) XSDT
        4) RSDP

Add this functionality in a new file virt-acpi-build.c and enable
building this infrastructure.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-ID: <20230302091212.999767-5-sunilvl@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 hw/riscv/Kconfig           |   1 +
 hw/riscv/meson.build       |   1 +
 hw/riscv/virt-acpi-build.c | 304 +++++++++++++++++++++++++++++++++++++
 include/hw/riscv/virt.h    |   1 +
 4 files changed, 307 insertions(+)
 create mode 100644 hw/riscv/virt-acpi-build.c

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 4550b3b938..6528ebfa3a 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -44,6 +44,7 @@ config RISCV_VIRT
     select VIRTIO_MMIO
     select FW_CFG_DMA
     select PLATFORM_BUS
+    select ACPI
 
 config SHAKTI_C
     bool
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index ab6cae57ea..2f7ee81be3 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -9,5 +9,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
 riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
+riscv_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 
 hw_arch += {'riscv': riscv_ss}
diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
new file mode 100644
index 0000000000..d6947fdc74
--- /dev/null
+++ b/hw/riscv/virt-acpi-build.c
@@ -0,0 +1,304 @@
+/*
+ * Support for generating ACPI tables and passing them to Guests
+ *
+ * RISC-V virt ACPI generation
+ *
+ * Copyright (C) 2008-2010  Kevin O'Connor <kevin@koconnor.net>
+ * Copyright (C) 2006 Fabrice Bellard
+ * Copyright (C) 2013 Red Hat Inc
+ * Copyright (c) 2015 HUAWEI TECHNOLOGIES CO.,LTD.
+ * Copyright (C) 2021-2023 Ventana Micro Systems Inc
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/acpi/acpi-defs.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/utils.h"
+#include "qapi/error.h"
+#include "sysemu/reset.h"
+#include "migration/vmstate.h"
+#include "hw/riscv/virt.h"
+
+#define ACPI_BUILD_TABLE_SIZE             0x20000
+
+typedef struct AcpiBuildState {
+    /* Copy of table in RAM (for patching) */
+    MemoryRegion *table_mr;
+    MemoryRegion *rsdp_mr;
+    MemoryRegion *linker_mr;
+    /* Is table patched? */
+    bool patched;
+} AcpiBuildState;
+
+static void acpi_align_size(GArray *blob, unsigned align)
+{
+    /*
+     * Align size to multiple of given size. This reduces the chance
+     * we need to change size in the future (breaking cross version migration).
+     */
+    g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
+}
+
+static void riscv_acpi_madt_add_rintc(uint32_t uid,
+                                      const CPUArchIdList *arch_ids,
+                                      GArray *entry)
+{
+    uint64_t hart_id = arch_ids->cpus[uid].arch_id;
+
+    build_append_int_noprefix(entry, 0x18, 1);       /* Type     */
+    build_append_int_noprefix(entry, 20, 1);         /* Length   */
+    build_append_int_noprefix(entry, 1, 1);          /* Version  */
+    build_append_int_noprefix(entry, 0, 1);          /* Reserved */
+    build_append_int_noprefix(entry, 0x1, 4);        /* Flags    */
+    build_append_int_noprefix(entry, hart_id, 8);    /* Hart ID  */
+    build_append_int_noprefix(entry, uid, 4);        /* ACPI Processor UID */
+}
+
+static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(s);
+    MachineState *ms = MACHINE(s);
+    const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
+
+    for (int i = 0; i < arch_ids->len; i++) {
+            Aml *dev;
+            GArray *madt_buf = g_array_new(0, 1, 1);
+
+            dev = aml_device("C%.03X", i);
+            aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
+            aml_append(dev, aml_name_decl("_UID",
+                       aml_int(arch_ids->cpus[i].arch_id)));
+
+            /* build _MAT object */
+            riscv_acpi_madt_add_rintc(i, arch_ids, madt_buf);
+            aml_append(dev, aml_name_decl("_MAT",
+                                          aml_buffer(madt_buf->len,
+                                          (uint8_t *)madt_buf->data)));
+            g_array_free(madt_buf, true);
+
+            aml_append(scope, dev);
+    }
+}
+
+static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
+{
+    Aml *dev = aml_device("FWCF");
+    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
+
+    /* device present, functioning, decoding, not shown in UI */
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
+    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
+                                       fw_cfg_memmap->size, AML_READ_WRITE));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
+/* FADT */
+static void build_fadt_rev6(GArray *table_data,
+                            BIOSLinker *linker,
+                            RISCVVirtState *s,
+                            unsigned dsdt_tbl_offset)
+{
+    AcpiFadtData fadt = {
+        .rev = 6,
+        .minor_ver = 5,
+        .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
+        .xdsdt_tbl_offset = &dsdt_tbl_offset,
+    };
+
+    build_fadt(table_data, linker, &fadt, s->oem_id, s->oem_table_id);
+}
+
+/* DSDT */
+static void build_dsdt(GArray *table_data,
+                       BIOSLinker *linker,
+                       RISCVVirtState *s)
+{
+    Aml *scope, *dsdt;
+    const MemMapEntry *memmap = s->memmap;
+    AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = s->oem_id,
+                        .oem_table_id = s->oem_table_id };
+
+
+    acpi_table_begin(&table, table_data);
+    dsdt = init_aml_allocator();
+
+    /*
+     * When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
+     * While UEFI can use libfdt to disable the RTC device node in the DTB that
+     * it passes to the OS, it cannot modify AML. Therefore, we won't generate
+     * the RTC ACPI device at all when using UEFI.
+     */
+    scope = aml_scope("\\_SB");
+    acpi_dsdt_add_cpus(scope, s);
+
+    acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
+
+    aml_append(dsdt, scope);
+
+    /* copy AML table into ACPI tables blob and patch header there */
+    g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
+
+    acpi_table_end(linker, &table);
+    free_aml_allocator();
+}
+
+static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
+{
+    GArray *table_offsets;
+    unsigned dsdt, xsdt;
+    GArray *tables_blob = tables->table_data;
+
+    table_offsets = g_array_new(false, true,
+                                sizeof(uint32_t));
+
+    bios_linker_loader_alloc(tables->linker,
+                             ACPI_BUILD_TABLE_FILE, tables_blob,
+                             64, false);
+
+    /* DSDT is pointed to by FADT */
+    dsdt = tables_blob->len;
+    build_dsdt(tables_blob, tables->linker, s);
+
+    /* FADT and others pointed to by XSDT */
+    acpi_add_table(table_offsets, tables_blob);
+    build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
+
+    /* XSDT is pointed to by RSDP */
+    xsdt = tables_blob->len;
+    build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
+                s->oem_table_id);
+
+    /* RSDP is in FSEG memory, so allocate it separately */
+    {
+        AcpiRsdpData rsdp_data = {
+            .revision = 2,
+            .oem_id = s->oem_id,
+            .xsdt_tbl_offset = &xsdt,
+            .rsdt_tbl_offset = NULL,
+        };
+        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
+    }
+
+    /*
+     * The align size is 128, warn if 64k is not enough therefore
+     * the align size could be resized.
+     */
+    if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
+        warn_report("ACPI table size %u exceeds %d bytes,"
+                    " migration may not work",
+                    tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
+        error_printf("Try removing some objects.");
+    }
+
+    acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
+
+    /* Clean up memory that's no longer used */
+    g_array_free(table_offsets, true);
+}
+
+static void acpi_ram_update(MemoryRegion *mr, GArray *data)
+{
+    uint32_t size = acpi_data_len(data);
+
+    /*
+     * Make sure RAM size is correct - in case it got changed
+     * e.g. by migration
+     */
+    memory_region_ram_resize(mr, size, &error_abort);
+
+    memcpy(memory_region_get_ram_ptr(mr), data->data, size);
+    memory_region_set_dirty(mr, 0, size);
+}
+
+static void virt_acpi_build_update(void *build_opaque)
+{
+    AcpiBuildState *build_state = build_opaque;
+    AcpiBuildTables tables;
+
+    /* No state to update or already patched? Nothing to do. */
+    if (!build_state || build_state->patched) {
+        return;
+    }
+
+    build_state->patched = true;
+
+    acpi_build_tables_init(&tables);
+
+    virt_acpi_build(RISCV_VIRT_MACHINE(qdev_get_machine()), &tables);
+
+    acpi_ram_update(build_state->table_mr, tables.table_data);
+    acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
+    acpi_ram_update(build_state->linker_mr, tables.linker->cmd_blob);
+
+    acpi_build_tables_cleanup(&tables, true);
+}
+
+static void virt_acpi_build_reset(void *build_opaque)
+{
+    AcpiBuildState *build_state = build_opaque;
+    build_state->patched = false;
+}
+
+static const VMStateDescription vmstate_virt_acpi_build = {
+    .name = "virt_acpi_build",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(patched, AcpiBuildState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+void virt_acpi_setup(RISCVVirtState *s)
+{
+    AcpiBuildTables tables;
+    AcpiBuildState *build_state;
+
+    build_state = g_malloc0(sizeof *build_state);
+
+    acpi_build_tables_init(&tables);
+    virt_acpi_build(s, &tables);
+
+    /* Now expose it all to Guest */
+    build_state->table_mr = acpi_add_rom_blob(virt_acpi_build_update,
+                                              build_state, tables.table_data,
+                                              ACPI_BUILD_TABLE_FILE);
+    assert(build_state->table_mr != NULL);
+
+    build_state->linker_mr = acpi_add_rom_blob(virt_acpi_build_update,
+                                               build_state,
+                                               tables.linker->cmd_blob,
+                                               ACPI_BUILD_LOADER_FILE);
+
+    build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
+                                             build_state, tables.rsdp,
+                                             ACPI_BUILD_RSDP_FILE);
+
+    qemu_register_reset(virt_acpi_build_reset, build_state);
+    virt_acpi_build_reset(build_state);
+    vmstate_register(NULL, 0, &vmstate_virt_acpi_build, build_state);
+
+    /*
+     * Clean up tables but don't free the memory: we track it
+     * in build_state.
+     */
+    acpi_build_tables_cleanup(&tables, false);
+}
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 379501edcc..e5c474b26e 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -126,4 +126,5 @@ enum {
                                  1 + FDT_APLIC_INT_CELLS)
 
 bool virt_is_acpi_enabled(RISCVVirtState *s);
+void virt_acpi_setup(RISCVVirtState *vms);
 #endif
-- 
2.39.2


