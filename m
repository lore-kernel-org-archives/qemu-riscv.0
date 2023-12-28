Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F48C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 14:25:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rIrJ7-0003xU-R5; Thu, 28 Dec 2023 09:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rIlPq-0004QO-KK; Thu, 28 Dec 2023 03:06:54 -0500
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rIlPn-0002D0-S3; Thu, 28 Dec 2023 03:06:54 -0500
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id B2CF97FFD;
 Thu, 28 Dec 2023 16:06:38 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 28 Dec
 2023 16:06:38 +0800
Received: from jsia-virtual-machine.localdomain (175.136.135.142) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 28 Dec 2023 16:06:33 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <mst@redhat.com>, <imammedo@redhat.com>, <anisinha@redhat.com>,
 <peter.maydell@linaro.org>, <jeeheng.sia@starfivetech.com>,
 <shannon.zhaosl@gmail.com>, <sunilvl@ventanamicro.com>, <palmer@dabbelt.com>, 
 <alistair.francis@wdc.com>, <bin.meng@windriver.com>, <liwei1518@gmail.com>,
 <dbarboza@ventanamicro.com>, <zhiwei_liu@linux.alibaba.com>
Subject: [RFC v1 2/2] hw/riscv/virt-acpi-build.c: Generate SPCR table
Date: Thu, 28 Dec 2023 16:06:16 +0800
Message-ID: <20231228080616.158822-3-jeeheng.sia@starfivetech.com>
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

Generate Serial Port Console Redirection Table (SPCR) for RISC-V
virtual machine.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
---
 hw/riscv/virt-acpi-build.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index d4a02579d6..388b3d1a84 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -174,6 +174,42 @@ acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *ua=
rt_memmap,
     aml_append(scope, dev);
 }
=20
+/*
+ * Serial Port Console Redirection Table (SPCR)
+ * Rev: 1.07
+ */
+
+static void
+build_spcr_rev2(GArray *table_data, BIOSLinker *linker, RISCVVirtState *=
s)
+{
+    AcpiSpcrData serial =3D {
+        .interface_type =3D 0,       /* 16550 compatible */
+        .base_addr.id =3D AML_AS_SYSTEM_MEMORY,
+        .base_addr.width =3D 32,
+        .base_addr.offset =3D 0,
+        .base_addr.size =3D 1,
+        .base_addr.addr =3D s->memmap[VIRT_UART0].base,
+        .interrupt_type =3D (1 << 4),/* Bit[4] RISC-V PLIC/APLIC */
+        .pc_interrupt =3D 0,
+        .interrupt =3D UART0_IRQ,
+        .baud_rate =3D 7,            /* 15200 */
+        .parity =3D 0,
+        .stop_bits =3D 1,
+        .flow_control =3D 0,
+        .terminal_type =3D 3,        /* ANSI */
+        .language =3D 0,             /* Language */
+        .pci_device_id =3D 0xffff,   /* not a PCI device*/
+        .pci_vendor_id =3D 0xffff,   /* not a PCI device*/
+        .pci_bus =3D 0,
+        .pci_device =3D 0,
+        .pci_function =3D 0,
+        .pci_flags =3D 0,
+        .pci_segment =3D 0,
+    };
+
+    build_spcr(table_data, linker, &serial, s->oem_id, s->oem_table_id);
+}
+
 /* RHCT Node[N] starts at offset 56 */
 #define RHCT_NODE_ARRAY_OFFSET 56
=20
@@ -555,6 +591,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBu=
ildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_rhct(tables_blob, tables->linker, s);
=20
+    acpi_add_table(table_offsets, tables_blob);
+    build_spcr_rev2(tables_blob, tables->linker, s);
+
     acpi_add_table(table_offsets, tables_blob);
     {
         AcpiMcfgInfo mcfg =3D {
--=20
2.34.1


