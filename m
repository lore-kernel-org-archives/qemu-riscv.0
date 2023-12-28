Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD354C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 14:25:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rIrJ7-0003xW-S5; Thu, 28 Dec 2023 09:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rIlQy-0004eO-JG; Thu, 28 Dec 2023 03:08:04 -0500
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rIlQw-0002Cf-2i; Thu, 28 Dec 2023 03:08:04 -0500
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id 03A067FF9;
 Thu, 28 Dec 2023 16:06:31 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 28 Dec
 2023 16:06:30 +0800
Received: from jsia-virtual-machine.localdomain (175.136.135.142) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 28 Dec 2023 16:06:25 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <mst@redhat.com>, <imammedo@redhat.com>, <anisinha@redhat.com>,
 <peter.maydell@linaro.org>, <jeeheng.sia@starfivetech.com>,
 <shannon.zhaosl@gmail.com>, <sunilvl@ventanamicro.com>, <palmer@dabbelt.com>, 
 <alistair.francis@wdc.com>, <bin.meng@windriver.com>, <liwei1518@gmail.com>,
 <dbarboza@ventanamicro.com>, <zhiwei_liu@linux.alibaba.com>
Subject: [RFC v1 1/2] hw/arm/virt-acpi-build.c: Migrate SPCR creation to
 common location
Date: Thu, 28 Dec 2023 16:06:15 +0800
Message-ID: <20231228080616.158822-2-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231228080616.158822-1-jeeheng.sia@starfivetech.com>
References: <20231228080616.158822-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [175.136.135.142]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=61.152.239.71;
 envelope-from=jeeheng.sia@starfivetech.com; helo=fd01.gateway.ufhost.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 28 Dec 2023 09:24:20 -0500
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

RISC-V should also generate the SPCR in a manner similar to ARM.
Therefore, instead of replicating the code, relocate this function
to the common AML build.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
---
 hw/acpi/aml-build.c         | 51 ++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 68 +++++++++++++++----------------------
 include/hw/acpi/acpi-defs.h | 33 ++++++++++++++++++
 include/hw/acpi/aml-build.h |  4 +++
 4 files changed, 115 insertions(+), 41 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index af66bde0f5..1efa534aa8 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1994,6 +1994,57 @@ static void build_processor_hierarchy_node(GArray =
*tbl, uint32_t flags,
     }
 }
=20
+void build_spcr(GArray *table_data, BIOSLinker *linker,
+                const AcpiSpcrData *f, const char *oem_id,
+                const char *oem_table_id)
+{
+    AcpiTable table =3D { .sig =3D "SPCR", .rev =3D 2, .oem_id =3D oem_i=
d,
+                        .oem_table_id =3D oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+    /* Interface type */
+    build_append_int_noprefix(table_data, f->interface_type, 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 3);
+    /* Base Address */
+    build_append_gas(table_data, f->base_addr.id, f->base_addr.width,
+                     f->base_addr.offset, f->base_addr.size,
+                     f->base_addr.addr);
+    /* Interrupt type */
+    build_append_int_noprefix(table_data, f->interrupt_type, 1);
+    /* IRQ */
+    build_append_int_noprefix(table_data, f->pc_interrupt, 1);
+    /* Global System Interrupt */
+    build_append_int_noprefix(table_data, f->interrupt, 4);
+    /* Baud Rate */
+    build_append_int_noprefix(table_data, f->baud_rate, 1);
+    /* Parity */
+    build_append_int_noprefix(table_data, f->parity, 1);
+    /* Stop Bits */
+    build_append_int_noprefix(table_data, f->stop_bits, 1);
+    /* Flow Control */
+    build_append_int_noprefix(table_data, f->flow_control, 1);
+    /* Terminal Type */
+    build_append_int_noprefix(table_data, f->terminal_type, 1);
+    /* PCI Device ID  */
+    build_append_int_noprefix(table_data, f->pci_device_id, 2);
+    /* PCI Vendor ID */
+    build_append_int_noprefix(table_data, f->pci_vendor_id, 2);
+    /* PCI Bus Number */
+    build_append_int_noprefix(table_data, f->pci_bus, 1);
+    /* PCI Device Number */
+    build_append_int_noprefix(table_data, f->pci_device, 1);
+    /* PCI Function Number */
+    build_append_int_noprefix(table_data, f->pci_function, 1);
+    /* PCI Flags */
+    build_append_int_noprefix(table_data, f->pci_flags, 4);
+    /* PCI Segment */
+    build_append_int_noprefix(table_data, f->pci_segment, 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 4);
+
+    acpi_table_end(linker, &table);
+}
 /*
  * ACPI spec, Revision 6.3
  * 5.2.29 Processor Properties Topology Table (PPTT)
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 510ab0dcca..a31f736d1a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -431,48 +431,34 @@ build_iort(GArray *table_data, BIOSLinker *linker, =
VirtMachineState *vms)
  * Rev: 1.07
  */
 static void
-build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms=
)
+build_spcr_v2(GArray *table_data, BIOSLinker *linker, VirtMachineState *=
vms)
 {
-    AcpiTable table =3D { .sig =3D "SPCR", .rev =3D 2, .oem_id =3D vms->=
oem_id,
-                        .oem_table_id =3D vms->oem_table_id };
-
-    acpi_table_begin(&table, table_data);
-
-    /* Interface Type */
-    build_append_int_noprefix(table_data, 3, 1); /* ARM PL011 UART */
-    build_append_int_noprefix(table_data, 0, 3); /* Reserved */
-    /* Base Address */
-    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 32, 0, 3,
-                     vms->memmap[VIRT_UART].base);
-    /* Interrupt Type */
-    build_append_int_noprefix(table_data,
-        (1 << 3) /* Bit[3] ARMH GIC interrupt */, 1);
-    build_append_int_noprefix(table_data, 0, 1); /* IRQ */
-    /* Global System Interrupt */
-    build_append_int_noprefix(table_data,
-                              vms->irqmap[VIRT_UART] + ARM_SPI_BASE, 4);
-    build_append_int_noprefix(table_data, 3 /* 9600 */, 1); /* Baud Rate=
 */
-    build_append_int_noprefix(table_data, 0 /* No Parity */, 1); /* Pari=
ty */
-    /* Stop Bits */
-    build_append_int_noprefix(table_data, 1 /* 1 Stop bit */, 1);
-    /* Flow Control */
-    build_append_int_noprefix(table_data,
-        (1 << 1) /* RTS/CTS hardware flow control */, 1);
-    /* Terminal Type */
-    build_append_int_noprefix(table_data, 0 /* VT100 */, 1);
-    build_append_int_noprefix(table_data, 0, 1); /* Language */
-    /* PCI Device ID  */
-    build_append_int_noprefix(table_data, 0xffff /* not a PCI device*/, =
2);
-    /* PCI Vendor ID */
-    build_append_int_noprefix(table_data, 0xffff /* not a PCI device*/, =
2);
-    build_append_int_noprefix(table_data, 0, 1); /* PCI Bus Number */
-    build_append_int_noprefix(table_data, 0, 1); /* PCI Device Number */
-    build_append_int_noprefix(table_data, 0, 1); /* PCI Function Number =
*/
-    build_append_int_noprefix(table_data, 0, 4); /* PCI Flags */
-    build_append_int_noprefix(table_data, 0, 1); /* PCI Segment */
-    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+    AcpiSpcrData serial =3D {
+        .interface_type =3D 3,       /* ARM PL011 UART */
+        .base_addr.id =3D AML_AS_SYSTEM_MEMORY,
+        .base_addr.width =3D 32,
+        .base_addr.offset =3D 0,
+        .base_addr.size =3D 3,
+        .base_addr.addr =3D vms->memmap[VIRT_UART].base,
+        .interrupt_type =3D (1 << 3),/* Bit[3] ARMH GIC interrupt*/
+        .pc_interrupt =3D 0,         /* IRQ */
+        .interrupt =3D (vms->irqmap[VIRT_UART] + ARM_SPI_BASE),
+        .baud_rate =3D 3,            /* 9600 */
+        .parity =3D 0,               /* No Parity */
+        .stop_bits =3D 1,            /* 1 Stop bit */
+        .flow_control =3D 1 << 1,    /* RTS/CTS hardware flow control */
+        .terminal_type =3D 0,        /* VT100 */
+        .language =3D 0,             /* Language */
+        .pci_device_id =3D 0xffff,   /* not a PCI device*/
+        .pci_vendor_id =3D 0xffff,   /* not a PCI device*/
+        .pci_bus =3D 0,
+        .pci_device =3D 0,
+        .pci_function =3D 0,
+        .pci_flags =3D 0,
+        .pci_segment =3D 0,
+    };
=20
-    acpi_table_end(linker, &table);
+    build_spcr(table_data, linker, &serial, vms->oem_id, vms->oem_table_=
id);
 }
=20
 /*
@@ -930,7 +916,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuild=
Tables *tables)
     }
=20
     acpi_add_table(table_offsets, tables_blob);
-    build_spcr(tables_blob, tables->linker, vms);
+    build_spcr_v2(tables_blob, tables->linker, vms);
=20
     acpi_add_table(table_offsets, tables_blob);
     build_dbg2(tables_blob, tables->linker, vms);
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 2b42e4192b..0e6e82b339 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -90,6 +90,39 @@ typedef struct AcpiFadtData {
     unsigned *xdsdt_tbl_offset;
 } AcpiFadtData;
=20
+typedef struct AcpiGas {
+    uint8_t id;                /* Address space ID */
+    uint8_t width;             /* Register bit width */
+    uint8_t offset;            /* Register bit offset */
+    uint8_t size;              /* Access size */
+    uint64_t addr;             /* Address */
+} AcpiGas;
+
+/* SPCR (Serial Port Console Redirection table) */
+typedef struct AcpiSpcrData {
+    uint8_t interface_type;
+    uint8_t reserved[3];
+    struct AcpiGas base_addr;
+    uint8_t interrupt_type;
+    uint8_t pc_interrupt;
+    uint32_t interrupt;        /* Global system interrupt */
+    uint8_t baud_rate;
+    uint8_t parity;
+    uint8_t stop_bits;
+    uint8_t flow_control;
+    uint8_t terminal_type;
+    uint8_t language;
+    uint8_t reserved1;
+    uint16_t pci_device_id;    /* Must be 0xffff if not PCI device */
+    uint16_t pci_vendor_id;    /* Must be 0xffff if not PCI device */
+    uint8_t pci_bus;
+    uint8_t pci_device;
+    uint8_t pci_function;
+    uint32_t pci_flags;
+    uint8_t pci_segment;
+    uint32_t reserved2;
+} AcpiSpcrData;
+
 #define ACPI_FADT_ARM_PSCI_COMPLIANT  (1 << 0)
 #define ACPI_FADT_ARM_PSCI_USE_HVC    (1 << 1)
=20
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index ff2a310270..44e03e76bd 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -497,4 +497,8 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, cons=
t AcpiFadtData *f,
=20
 void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                 const char *oem_id, const char *oem_table_id);
+
+void build_spcr(GArray *table_data, BIOSLinker *linker,
+                const AcpiSpcrData *f, const char *oem_id,
+                const char *oem_table_id);
 #endif
--=20
2.34.1


