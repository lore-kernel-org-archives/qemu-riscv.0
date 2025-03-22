Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD162C35FFC
	for <qemu-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 04:32:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tvqWd-0006xh-Px; Sat, 22 Mar 2025 00:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1tvqWb-0006x8-Nl
 for qemu-riscv@nongnu.org; Sat, 22 Mar 2025 00:31:57 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1tvqWZ-0002YL-Hi
 for qemu-riscv@nongnu.org; Sat, 22 Mar 2025 00:31:57 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2264aefc45dso30436335ad.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Mar 2025 21:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1742617914; x=1743222714; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4UDuZZEvx52TYf4VWrZHlqnYHUptgGVGsYU0XYdLZzM=;
 b=Ov2BwwqZrK0Voq7D2gfAOEy5xWm6ZGqHRMRuGvTurzNWR65f9h+0IBicV/r0WDC3z/
 5ZTzVpZhfu2LqiUFbA+Konsrwj0EDtm/7HZENmTB1SfqWr44Aqs2oX0PcqhjqRrX3nmn
 W0/r9jGsy7Yuns3DpKJHZerGG6cu3jPl1Ame2+AamMrSgJrKohAMLj/V0T3gPisw03i8
 XbpCm2DgdVFRB0rjLQTvOO7FO/1st+GoMLGPabJXiMiQinA0paakqjIeM8GUefhE739O
 h6XRW5JHjD3uVOLJrioKyhhuT9iEJWKKHw07/pDTLBdZaTq6l2eEEbaf09dUWXgThArr
 yIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742617914; x=1743222714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4UDuZZEvx52TYf4VWrZHlqnYHUptgGVGsYU0XYdLZzM=;
 b=YMxy2ycJijAq3pSSM2M1h4jjXQ2N9u7Acnd0X+2pbxlDI8BRzTugK+OPs6j29gEQ02
 EgjadjiPU+9j7xJPOP2SuVJI2pfTEfKqvg9gCiCwKdqElbe7i12kAGyv/N3jE9mm4eBb
 jUilZ+0YBFxbrO9QyvC/kQHg6dTCAvHvhRlZLkba9n3ZoRNaC24QNX4+N7Bw5qHY5Ael
 4noaHUsd77PZBwPvKluZeyTWzJ82VPqv3gVh9pbXqO6Dr34jm3XoTmgG+bymlpFekqFg
 3Uq95Hhm4jETo9UW6Wd3M7GRyQ/0lPlGras8yjg+6tnZ0eWvmDfe95qWAcn2yxkSYq9Q
 ywOA==
X-Gm-Message-State: AOJu0YyrRoRKoXXvUj/jl1dg8h34NIjvS7DktaRGlt+WmsbBZ4kgAXyZ
 9lyty0NFcmJ6B/haxsJlthGEU9E2d/5OQMa49pvLEMVAXp73r5nFZwQap/VRQ3qWKILI10gKR+0
 Cnj8=
X-Gm-Gg: ASbGncuKbawW6vj7VSdvB/wtQT0Mj8CGbqj1+7h33gUcmC0vMbSg5x4tKAx1cegg7Ii
 fZYJSu+piZ9aCgjo5NVzcpxb6G4Dp3hTkNQq+WcTC3dDffdipDcBWrL9YmlkmWhZNSuNYBrtlyM
 R+7ps6iINwir1j/8U+kTb9b5g4NlNU+62eo2B2J0IcBjpUMEpBGbP1PQ4gaskYvTjNBa1PRnbWM
 4E6FBmCnxek1c6B6XoPC7yyNZutElb+ECVHZ016tdcvVb4ussnf1dIC+8JPS+8JMZCP1EHaJjxW
 6v6PcW5BfMc+UTG2j4hYtm7Eu8JRNycvaTSYwd8yO3MRAIwIQLrNqx4=
X-Google-Smtp-Source: AGHT+IH5JNv4ufMNsERTCd+u631Iq0qIpmi6A6i7ibP6FSElmT5iQ00ptU1/D/4P+c4HhCADil0GAA==
X-Received: by 2002:a17:903:32c3:b0:224:1774:1ecd with SMTP id
 d9443c01a7336-22780c5599amr75325645ad.4.1742617913669; 
 Fri, 21 Mar 2025 21:31:53 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.199.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2278120a5b6sm26824645ad.252.2025.03.21.21.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Mar 2025 21:31:53 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 2/2] hw/riscv/virt-acpi-build: Add support for RIMT
Date: Sat, 22 Mar 2025 10:01:38 +0530
Message-ID: <20250322043139.2003479-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250322043139.2003479-1-sunilvl@ventanamicro.com>
References: <20250322043139.2003479-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62c.google.com
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

RISC-V IO Mapping Table (RIMT) is a new static ACPI table used to
communicate IOMMU information to the OS. Add support for creating this
table when the IOMMU is present. The specification is frozen and
available at [1].

[1] - https://github.com/riscv-non-isa/riscv-acpi-rimt/releases/download/v0.99/rimt-spec.pdf

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 215 +++++++++++++++++++++++++++++++++++++
 1 file changed, 215 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 1ad6800508..1eef2fb4eb 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -198,6 +198,32 @@ acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
     aml_append(scope, dev);
 }
 
+/*
+ * Add DSDT entry for the IOMMU platform device.
+ * ACPI ID for IOMMU is defined in the section 6.2 of RISC-V BRS spec.
+ * https://github.com/riscv-non-isa/riscv-brs/releases/download/v0.8/riscv-brs-spec.pdf
+ */
+static void acpi_dsdt_add_iommu_sys(Aml *scope, const MemMapEntry *iommu_memmap,
+                                    uint32_t iommu_irq)
+{
+    uint32_t i;
+
+    Aml *dev = aml_device("IMU0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("RSCV0004")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(iommu_memmap->base,
+                                       iommu_memmap->size, AML_READ_WRITE));
+    for (i = iommu_irq; i < iommu_irq + 4; i++) {
+        aml_append(crs, aml_interrupt(AML_CONSUMER, AML_EDGE, AML_ACTIVE_LOW,
+                                      AML_EXCLUSIVE, &i, 1));
+    }
+
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 /*
  * Serial Port Console Redirection Table (SPCR)
  * Rev: 1.10
@@ -450,6 +476,9 @@ static void build_dsdt(GArray *table_data,
     }
 
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0], UART0_IRQ);
+    if (virt_is_iommu_sys_enabled(s)) {
+        acpi_dsdt_add_iommu_sys(scope, &memmap[VIRT_IOMMU_SYS], IOMMU_SYS_IRQ);
+    }
 
     if (socket_count == 1) {
         virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
@@ -602,6 +631,187 @@ static void build_madt(GArray *table_data,
     acpi_table_end(linker, &table);
 }
 
+#define ID_MAPPING_ENTRY_SIZE        20
+#define IOMMU_ENTRY_SIZE             40
+#define RISCV_INTERRUPT_WIRE_OFFSSET 40
+#define ROOT_COMPLEX_ENTRY_SIZE      20
+#define RIMT_NODE_OFFSET             48
+
+/*
+ * ID Mapping Structure
+ */
+static void build_rimt_id_mapping(GArray *table_data, uint32_t source_id_base,
+                                  uint32_t num_ids, uint32_t dest_id_base)
+{
+    /* Source ID Base */
+    build_append_int_noprefix(table_data, source_id_base, 4);
+    /* Number of IDs */
+    build_append_int_noprefix(table_data, num_ids, 4);
+    /* Destination Device ID Base */
+    build_append_int_noprefix(table_data, source_id_base, 4);
+    /* Destination IOMMU Offset */
+    build_append_int_noprefix(table_data, dest_id_base, 4);
+    /* Flags */
+    build_append_int_noprefix(table_data, 0, 4);
+}
+
+struct AcpiRimtIdMapping {
+    uint32_t source_id_base;
+    uint32_t num_ids;
+};
+typedef struct AcpiRimtIdMapping AcpiRimtIdMapping;
+
+/* Build the rimt ID mapping to IOMMU for a given PCI host bridge */
+static int rimt_host_bridges(Object *obj, void *opaque)
+{
+    GArray *idmap_blob = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
+        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
+
+        if (bus && !pci_bus_bypass_iommu(bus)) {
+            int min_bus, max_bus;
+
+            pci_bus_range(bus, &min_bus, &max_bus);
+
+            AcpiRimtIdMapping idmap = {
+                .source_id_base = min_bus << 8,
+                .num_ids = (max_bus - min_bus + 1) << 8,
+            };
+            g_array_append_val(idmap_blob, idmap);
+        }
+    }
+
+    return 0;
+}
+
+static int rimt_idmap_compare(gconstpointer a, gconstpointer b)
+{
+    AcpiRimtIdMapping *idmap_a = (AcpiRimtIdMapping *)a;
+    AcpiRimtIdMapping *idmap_b = (AcpiRimtIdMapping *)b;
+
+    return idmap_a->source_id_base - idmap_b->source_id_base;
+}
+
+/*
+ * RISC-V IO Mapping Table (RIMT)
+ * https://github.com/riscv-non-isa/riscv-acpi-rimt/releases/download/v0.99/rimt-spec.pdf
+ */
+static void build_rimt(GArray *table_data, BIOSLinker *linker,
+                       RISCVVirtState *s)
+{
+    int i, nb_nodes, rc_mapping_count;
+    size_t node_size, iommu_offset = 0;
+    uint32_t id = 0;
+    g_autoptr(GArray) iommu_idmaps = g_array_new(false, true,
+                                                 sizeof(AcpiRimtIdMapping));
+
+    AcpiTable table = { .sig = "RIMT", .rev = 1, .oem_id = s->oem_id,
+                        .oem_table_id = s->oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+
+    object_child_foreach_recursive(object_get_root(),
+                                   rimt_host_bridges, iommu_idmaps);
+
+    /* Sort the ID mapping  by Source ID Base*/
+    g_array_sort(iommu_idmaps, rimt_idmap_compare);
+
+    nb_nodes = 2; /* RC, IOMMU */
+    rc_mapping_count = iommu_idmaps->len;
+    /* Number of RIMT Nodes */
+    build_append_int_noprefix(table_data, nb_nodes, 4);
+
+    /* Offset to Array of RIMT Nodes */
+    build_append_int_noprefix(table_data, RIMT_NODE_OFFSET, 4);
+    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+
+    iommu_offset = table_data->len - table.table_offset;
+    /*  IOMMU Device Structure */
+    build_append_int_noprefix(table_data, 0, 1);         /* Type - IOMMU*/
+    build_append_int_noprefix(table_data, 1, 1);         /* Revision */
+    node_size =  IOMMU_ENTRY_SIZE;
+    build_append_int_noprefix(table_data, node_size, 2); /* Length */
+    build_append_int_noprefix(table_data, 0, 2);         /* Reserved */
+    build_append_int_noprefix(table_data, id++, 2);      /* ID */
+    if (virt_is_iommu_sys_enabled(s)) {
+        /* Hardware ID */
+        build_append_int_noprefix(table_data, 'R', 1);
+        build_append_int_noprefix(table_data, 'S', 1);
+        build_append_int_noprefix(table_data, 'C', 1);
+        build_append_int_noprefix(table_data, 'V', 1);
+        build_append_int_noprefix(table_data, '0', 1);
+        build_append_int_noprefix(table_data, '0', 1);
+        build_append_int_noprefix(table_data, '0', 1);
+        build_append_int_noprefix(table_data, '4', 1);
+        /* Base Address */
+        build_append_int_noprefix(table_data,
+                                  s->memmap[VIRT_IOMMU_SYS].base, 8);
+        build_append_int_noprefix(table_data, 0, 4);   /* Flags */
+    } else {
+        /* Hardware ID */
+        build_append_int_noprefix(table_data, '0', 1);
+        build_append_int_noprefix(table_data, '0', 1);
+        build_append_int_noprefix(table_data, '1', 1);
+        build_append_int_noprefix(table_data, '0', 1);
+        build_append_int_noprefix(table_data, '0', 1);
+        build_append_int_noprefix(table_data, '0', 1);
+        build_append_int_noprefix(table_data, '1', 1);
+        build_append_int_noprefix(table_data, '4', 1);
+
+        build_append_int_noprefix(table_data, 0, 8);   /* Base Address */
+        build_append_int_noprefix(table_data, 1, 4);   /* Flags */
+    }
+
+    build_append_int_noprefix(table_data, 0, 4);       /* Proximity Domain */
+    build_append_int_noprefix(table_data, 0, 2);       /* PCI Segment number */
+    /* PCIe B/D/F */
+    if (virt_is_iommu_sys_enabled(s)) {
+        build_append_int_noprefix(table_data, 0, 2);
+    } else {
+        build_append_int_noprefix(table_data, s->pci_iommu_bdf, 2);
+    }
+    /* Number of interrupt wires */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Interrupt wire array offset */
+    build_append_int_noprefix(table_data, RISCV_INTERRUPT_WIRE_OFFSSET, 2);
+
+    /*  PCIe Root Complex Node */
+    build_append_int_noprefix(table_data, 1, 1);           /* Type */
+    build_append_int_noprefix(table_data, 1, 1);           /* Revision */
+    node_size =  ROOT_COMPLEX_ENTRY_SIZE +
+                 ID_MAPPING_ENTRY_SIZE * rc_mapping_count;
+    build_append_int_noprefix(table_data, node_size, 2);   /* Length */
+    build_append_int_noprefix(table_data, 0, 2);           /* Reserved */
+    build_append_int_noprefix(table_data, id++, 2);        /* ID */
+    build_append_int_noprefix(table_data, 0, 4);           /* Flags */
+    build_append_int_noprefix(table_data, 0, 2);           /* Reserved */
+    /* PCI Segment number */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* ID mapping array offset */
+    build_append_int_noprefix(table_data, ROOT_COMPLEX_ENTRY_SIZE, 2);
+    /* Number of ID mappings */
+    build_append_int_noprefix(table_data, rc_mapping_count, 2);
+
+    /* Output Reference */
+    AcpiRimtIdMapping *range;
+
+    /* ID mapping array */
+    for (i = 0; i < iommu_idmaps->len; i++) {
+        range = &g_array_index(iommu_idmaps, AcpiRimtIdMapping, i);
+        if (virt_is_iommu_sys_enabled(s)) {
+            range->source_id_base = 0;
+        } else {
+            range->source_id_base = s->pci_iommu_bdf + 1;
+        }
+        range->num_ids = 0xffff - s->pci_iommu_bdf;
+        build_rimt_id_mapping(table_data, range->source_id_base,
+                              range->num_ids, iommu_offset);
+    }
+
+    acpi_table_end(linker, &table);
+}
+
 /*
  * ACPI spec, Revision 6.5+
  * 5.2.16 System Resource Affinity Table (SRAT)
@@ -679,6 +889,11 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_rhct(tables_blob, tables->linker, s);
 
+    if (virt_is_iommu_sys_enabled(s) || s->pci_iommu_bdf) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_rimt(tables_blob, tables->linker, s);
+    }
+
     acpi_add_table(table_offsets, tables_blob);
     spcr_setup(tables_blob, tables->linker, s);
 
-- 
2.43.0


