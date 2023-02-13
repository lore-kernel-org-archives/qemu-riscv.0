Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRa0s-00069V-8b
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 09:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0q-000698-TU
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:41:00 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0o-0005Sh-LC
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 09:41:00 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 nh19-20020a17090b365300b00233ceae8407so4831174pjb.3
 for <qemu-riscv@nongnu.org>; Mon, 13 Feb 2023 06:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0eLoQ9zLWtFImYwDb8SvLj1FDC7mv1tfjr/gtA6oPLc=;
 b=kE18qm8l+Pg6h4tmmFsanNlsC/XjQW08AJRWRnuBOuyiw5f27i4Hs7twq22ITxJMRs
 JX2htEZS7TQtOQNq3CIUoY1mZ2hsoRkHrSQNOOsgYIVegsrOOLtHYr1Lh97/WwVzpcC8
 6qMTVEtbqdf7wNDFJdQ4PHeI7j29NgW8FJsnOeNqXPhm4nohSqA9Yl7Ldfo/CrS9B+Ug
 Mc6kpJkzikaQzkyTeYM7Mhn7eL06JWPijnv0uUZ/XxP9cbMlnpuygHEdMVoH0T2/RZi4
 EDy5DoN5cdFROwTGz5Lwfd1BFs7mn2zJwGWE+XLtPaifKRrYOtAV7+Fu5zYz6QCPkNPo
 2dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0eLoQ9zLWtFImYwDb8SvLj1FDC7mv1tfjr/gtA6oPLc=;
 b=BEnLd8Btcq6YfGYrEXoC09tmVF9U5WFIJzcf2OiNVnJfrZTwszvZlz6dLR56dgEK68
 G/ZxABpt+sBO+33zrxK737fHGFJ/gI9LpxqPMhTtQzvBZB/efURBOWWdRM9s9NiI8II/
 c7QPKBC2N1sCxxpmJOSi4AJbJaMOzzYq7b/F/MKN8x0mK2W/OtpfwXZE2FVUReLhauhK
 AZ/GJzb3ViHQT3oWiINffRo8PdqDD2R5v3z+hiF0XZSgTnPPgMsd3rBgFr5spXdM/Sy+
 Ha5fhxDHwXuR0a11zu1D+w//wi75FkA8Ze5AOJ6sZYS+gMYXrwEhwD+Nk2hgvHIQ85ID
 zEHQ==
X-Gm-Message-State: AO0yUKWxgbSyfe/tisrBmuDzxsP3dDfks/a4UyU9LRYWW1wVK1P+d/eg
 TQAxoLmDLNf9XL3wIthajM6Hrg==
X-Google-Smtp-Source: AK7set/tMgWFsOrJeOz0RnupbsJPdS+F4szB8hZj4WwlIWne7F7c0YLVEI3UUG6kySJFEUwXvCe0Ug==
X-Received: by 2002:a05:6a21:3398:b0:be:cbee:ed9d with SMTP id
 yy24-20020a056a21339800b000becbeeed9dmr29454408pzb.45.1676299257876; 
 Mon, 13 Feb 2023 06:40:57 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:40:57 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V2 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic ACPI
 tables
Date: Mon, 13 Feb 2023 20:10:32 +0530
Message-Id: <20230213144038.2547584-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Mon, 13 Feb 2023 14:41:01 -0000

Add few basic ACPI tables and DSDT with few devices in a
new file virt-acpi-build.c.

These are mostly leveraged from arm64.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 285 +++++++++++++++++++++++++++++++++++++
 include/hw/riscv/virt.h    |   1 +
 2 files changed, 286 insertions(+)
 create mode 100644 hw/riscv/virt-acpi-build.c

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
new file mode 100644
index 0000000000..3c4da6c385
--- /dev/null
+++ b/hw/riscv/virt-acpi-build.c
@@ -0,0 +1,285 @@
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
+#include "hw/riscv/virt.h"
+#include "hw/riscv/numa.h"
+#include "hw/acpi/pci.h"
+#include "hw/acpi/utils.h"
+#include "sysemu/reset.h"
+#include "hw/pci-host/gpex.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
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
+static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
+{
+    MachineState *ms = MACHINE(s);
+    uint16_t i;
+
+    for (i = 0; i < ms->smp.cpus; i++) {
+        Aml *dev = aml_device("C%.03X", i);
+        aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
+        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
+        aml_append(scope, dev);
+    }
+}
+
+static void
+acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
+{
+    Aml *dev = aml_device("FWCF");
+    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
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
+static void
+build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
+                RISCVVirtState *s, unsigned dsdt_tbl_offset)
+{
+    /* ACPI v5.1 */
+    AcpiFadtData fadt = {
+        .rev = 6,
+        .minor_ver = 0,
+        .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
+        .xdsdt_tbl_offset = &dsdt_tbl_offset,
+    };
+
+    build_fadt(table_data, linker, &fadt, s->oem_id, s->oem_table_id);
+}
+
+/* DSDT */
+static void
+build_dsdt(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
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
+static void
+virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
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
+    /* FADT and others pointed to by RSDT */
+    acpi_add_table(table_offsets, tables_blob);
+    build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
+
+    acpi_add_table(table_offsets, tables_blob);
+    build_madt(tables_blob, tables->linker, s);
+
+    acpi_add_table(table_offsets, tables_blob);
+    build_rhct(tables_blob, tables->linker, s);
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
+        error_printf("Try removing CPUs, NUMA nodes, memory slots"
+                     " or PCI bridges.");
+    }
+    acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
+
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
2.34.1


