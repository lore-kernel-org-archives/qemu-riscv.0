Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4B8C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 09:08:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLgA7-0001MV-NF; Fri, 05 Jan 2024 04:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rLgA5-0001Lq-Qk; Fri, 05 Jan 2024 04:06:41 -0500
Received: from mail-sh0chn02on2061d.outbound.protection.partner.outlook.cn
 ([2406:e500:4420:2::61d]
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rLgA3-0008TI-Kw; Fri, 05 Jan 2024 04:06:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgmYHax7mGW8C0gj59fG/wzCI3SKIpxH+prXP7X9Z1Z7jI9SXYc4eIKuNVklvCIkeQQPoEi0W5pyvDkFiILTd4GlpJemhJix1/+wxQF92O6NgOI2sb1uJbvgBMZJXfIxsUSEfECQdHq8PcblyuvGpw7eXP54B97qYxQyPhrBtLNrFYIj+1uBaudiisGLATeiROncY9VFFu+S6MKeaTzEqZDCwxbp/IzdzaJA+fM5SC72xS/WRyhT758iw+bliytcW636jWt0I1vxaSooIt7UqO3frIqdqpoywCnSrak6YO4l7MAEHwNG+0/2yPA9wWcdM2z6z2nxA+V9/9pqdZs6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GU8wZxWukKO5ottAlSfJnZgoLvlBp4LP5kVOrDA27o=;
 b=lQpejTSH75kvREm8BFkLQB4KxmQK9WBo8fbrC/aZxeD8gm8wUXEGaWhcHSbtLHELHGAjuQL3VWoLCs/vbybVTNe+iEVsHbHeA4gD09B2VaQl3ptwPOtrBA/1KSdq4pEvgQzyEG5epnzcjlECok9FiYssLB0qe5Z5ad3CO05SkEUA6/91qJ1gL/iG5SLIpyJ0Lcz6OINMDFUaSF8XJsD9sv8WrfF43CYmW+PZAFNHYlD4d/rwbasgwARERFyPe/dJCw7V9JR5c8fljYiT9EL8BAOZW9GUHmjjiRNkV7xSDnbf8U+a4x7WqQOQol/fesTA/yt/U8NHMvKpY+7J9H6FjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:f::16) by BJSPR01MB0755.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.29; Fri, 5 Jan
 2024 09:06:26 +0000
Received: from BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
 ([fe80::3862:65b4:c857:c4a6]) by
 BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn ([fe80::3862:65b4:c857:c4a6%4])
 with mapi id 15.20.7135.028; Fri, 5 Jan 2024 09:06:26 +0000
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, jeeheng.sia@starfivetech.com,
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: [RESEND RFC v1 1/2] hw/arm/virt-acpi-build.c: Migrate SPCR creation
 to common location
Date: Fri,  5 Jan 2024 17:06:07 +0800
Message-Id: <20240105090608.5745-2-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105090608.5745-1-jeeheng.sia@starfivetech.com>
References: <20240105090608.5745-1-jeeheng.sia@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0007.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::19) To BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJSPR01MB0561:EE_|BJSPR01MB0755:EE_
X-MS-Office365-Filtering-Correlation-Id: f85dfeb2-3b01-4a37-2c2c-08dc0dcd9890
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kHlB8qA/kXu6mz598WHhmwN7/MUw4JNgG2YitJsS5Cn/Fb7y2s0ymeId4Dd4nYz/+K1MLQZPQr+IIpJY+F5cr+JhOtrTZKnHDVhVQ2qpu2ULNKZuMfQrOni0nK7Ryc8MCCJ9LWLqK0Q54oOtrxyPcgQjbBvGoGrA2q0iK2Kaxx/GaDc3i3IlSRreIOQr14GA9wmxni/QMDP2k2BshrOUW8SYw3+A2nIYq09mW0IioJIhwqK0+1nI/IlikfycZyxIq5KCmqvgXAFD7qWf51OxZa/AP6bpbpJtqKKMs+dhUDJZXty4x4mQK+RdC3uAUh2UDoTrvD3/caeZIoPvLwwJ3Kh+Smg7YtwjtZCX37QzM3ZVjSyCmmZFmGMlpnbaJ25rrtYXAYvL6wUgK3pjTVfVOxqWb8L4svoFhKNDo289E29Ug/mWOGUIZ8zqYR49aDeTfky5PTqM3kbNaizPnsUAWw2D9vuqOyyNX4NIzmXIvDwe/nr6D1QvOHAvGug4Nrrh6XOMcIWWNWn/eJILirvzP3F9qDbszgssJKZriz2eS7HoK6650hUPyRolutFMRVPj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(39830400003)(136003)(346002)(366004)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2616005)(1076003)(26005)(52116002)(6666004)(83380400001)(40160700002)(36756003)(86362001)(38100700002)(40180700001)(38350700005)(5660300002)(7416002)(4326008)(55236004)(41300700001)(66946007)(66556008)(66476007)(2906002)(8676002)(508600001)(8936002)(41320700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?82CEamZmXITypUXthCqiLj4rnYlrQKzvGUUIAvuBouMhGQrYL7q9YK8Tpx4o?=
 =?us-ascii?Q?2SiYXDxVMCsOCC3Ka8mb/w5Wsm+h4y/e4LaPE9kKsh7ha0IcoYZf2UhOOACo?=
 =?us-ascii?Q?pTfBCFsaRPkEYJ0oGiD1k1AfFLmFObzJPSW1xnE05Fxuqnidk7dKSeKXuKls?=
 =?us-ascii?Q?bLXN8gHYtMiIYWz1NB+Gf5ZLFeagtzVoKzuag6ZSgLbGVnwCgCCQY3nlfLc/?=
 =?us-ascii?Q?H0oAiJQQ4rA16EMeBRXFFJsGKY4s56AebMhJCR7FHq21Q35E4IpSDJG8xaUR?=
 =?us-ascii?Q?moUas4qWYwFkKMjmrbRVu9umhF1OJaFR0XWPVsvP60sVb4u00LgIkJfUZb6t?=
 =?us-ascii?Q?lGZ3Lr9i5qRG8+FeQx7Iw0jScmb3BI/TyhOGRJjkZ7udY9Ub4vhecDqYoNQT?=
 =?us-ascii?Q?TkjyfzGib8LcJgwcvvyrYLO2+CR18jdNIQpq9pdejQEkrys52N1nB65AAaM4?=
 =?us-ascii?Q?mxagMbCbcPOtdQg5lZE5UWnCrbV6KRZyqKs/qxVutDuTZMjekAHFHZS2fwDv?=
 =?us-ascii?Q?X2XxZeaaxrKY7JQ/xAhuf4s+nQ39jM6dE9y9m6ldMqL9LcM6gRQbS0XHZQuT?=
 =?us-ascii?Q?eOZ4PejxQRx6vax+IpxRiqIp+fz+hkEq9a3fX94wUSFxBbU1lNRSW1HKt4st?=
 =?us-ascii?Q?D0Lwi44+/waR4AyfOzqXIXdeGBXIM/NuiKvxCaLYjOg1e+vtwLGYuLFekgaU?=
 =?us-ascii?Q?a+GLzK7fw7kFp4O28IDl1UcGyCgl1/r+eiNo8KE7mC9l9KWoF2ZElRS/fXi5?=
 =?us-ascii?Q?qeteaskGaiQ3GAgPm9GYdALrg6CFdGnwDLqqhClzK5Bk78kkMvM+QcIVkaiL?=
 =?us-ascii?Q?4DfmecJWazAveG+3tT9OlT59izPvz0o6sACR2nMU8D/WGx2p3G+eaILtLzls?=
 =?us-ascii?Q?ZPDysxVhryyNRias5ewc5vjRVRIRTMS8NA6J65p9dQf2fr9RF4r3OqyKNgmg?=
 =?us-ascii?Q?YXrWPMRVDA248onH30cjwAGvRKku8MNX2COPrQMc8H9DXiLeMXpZlshcuBHg?=
 =?us-ascii?Q?RFBNAUfrhP6xVvetQs2eDi65RoPjdU9mCydqpKczI6S8hXvJCaWc/WXGuuk9?=
 =?us-ascii?Q?cIUH7vsADOt6iJkxodn5r7hArwCZ7PMsHts1kU9OpcBq5GYh8w9c1rcuWL5j?=
 =?us-ascii?Q?ijBrjUxA3vUDKhHuAwrm1+daawLBtwiUWc+p6rWtORtiTNQ89nT/pPgrwNYh?=
 =?us-ascii?Q?Q4DqhGjfOtItFZFyhQCAAYwd4TW0AGbdmKXO9Rk4XZi7K+p3rgZHa/iMvayV?=
 =?us-ascii?Q?ZTbgdzqpUHagDgdGE3qsFFBSOjwDFgXcarq5a6BUTKtvPgoO8kMWG+PM6Tw3?=
 =?us-ascii?Q?TqWxUwoYLyW5vXUH1Y1o3d0GT0vfBQ28g1EPa6oAsHpmwzgIS5KDhBQnvRSr?=
 =?us-ascii?Q?NMxvu51VaM1SnC1sPzIHE/xMzFJ/qSJCCZMclmP9WGanIEInq3h0ng4JR+il?=
 =?us-ascii?Q?CDGz8m+hHe8wwIKUanSLtQgkxwzz86ZMJVN4XqeyhhwOWf/P1t8dOCFCySBq?=
 =?us-ascii?Q?L37wXM1J7rBZ4j2wl4U3bFONwzDhO2XQ6i+wjU90jc/1a2hPIk0/qXQTmnpM?=
 =?us-ascii?Q?ubB9mPpO37w978iN6m3U/Q0fRZoYIT6SS2YmxehNQEah4ofbhBkc1mLkSqnr?=
 =?us-ascii?Q?Uw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f85dfeb2-3b01-4a37-2c2c-08dc0dcd9890
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 09:06:26.0924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiliKadkRre83PhGwq9vm6Qck0kGQsHpdDsj1FuduynNrRnhvXmF5ctG+C35AzcNh8Z50FDuVmcSsZH915HaP7zEXl3pgKU4NSbQukFuoa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0755
Received-SPF: pass client-ip=2406:e500:4420:2::61d;
 envelope-from=jeeheng.sia@starfivetech.com;
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
@@ -1994,6 +1994,57 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
     }
 }
 
+void build_spcr(GArray *table_data, BIOSLinker *linker,
+                const AcpiSpcrData *f, const char *oem_id,
+                const char *oem_table_id)
+{
+    AcpiTable table = { .sig = "SPCR", .rev = 2, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
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
@@ -431,48 +431,34 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
  * Rev: 1.07
  */
 static void
-build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+build_spcr_v2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-    AcpiTable table = { .sig = "SPCR", .rev = 2, .oem_id = vms->oem_id,
-                        .oem_table_id = vms->oem_table_id };
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
-    build_append_int_noprefix(table_data, 3 /* 9600 */, 1); /* Baud Rate */
-    build_append_int_noprefix(table_data, 0 /* No Parity */, 1); /* Parity */
-    /* Stop Bits */
-    build_append_int_noprefix(table_data, 1 /* 1 Stop bit */, 1);
-    /* Flow Control */
-    build_append_int_noprefix(table_data,
-        (1 << 1) /* RTS/CTS hardware flow control */, 1);
-    /* Terminal Type */
-    build_append_int_noprefix(table_data, 0 /* VT100 */, 1);
-    build_append_int_noprefix(table_data, 0, 1); /* Language */
-    /* PCI Device ID  */
-    build_append_int_noprefix(table_data, 0xffff /* not a PCI device*/, 2);
-    /* PCI Vendor ID */
-    build_append_int_noprefix(table_data, 0xffff /* not a PCI device*/, 2);
-    build_append_int_noprefix(table_data, 0, 1); /* PCI Bus Number */
-    build_append_int_noprefix(table_data, 0, 1); /* PCI Device Number */
-    build_append_int_noprefix(table_data, 0, 1); /* PCI Function Number */
-    build_append_int_noprefix(table_data, 0, 4); /* PCI Flags */
-    build_append_int_noprefix(table_data, 0, 1); /* PCI Segment */
-    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+    AcpiSpcrData serial = {
+        .interface_type = 3,       /* ARM PL011 UART */
+        .base_addr.id = AML_AS_SYSTEM_MEMORY,
+        .base_addr.width = 32,
+        .base_addr.offset = 0,
+        .base_addr.size = 3,
+        .base_addr.addr = vms->memmap[VIRT_UART].base,
+        .interrupt_type = (1 << 3),/* Bit[3] ARMH GIC interrupt*/
+        .pc_interrupt = 0,         /* IRQ */
+        .interrupt = (vms->irqmap[VIRT_UART] + ARM_SPI_BASE),
+        .baud_rate = 3,            /* 9600 */
+        .parity = 0,               /* No Parity */
+        .stop_bits = 1,            /* 1 Stop bit */
+        .flow_control = 1 << 1,    /* RTS/CTS hardware flow control */
+        .terminal_type = 0,        /* VT100 */
+        .language = 0,             /* Language */
+        .pci_device_id = 0xffff,   /* not a PCI device*/
+        .pci_vendor_id = 0xffff,   /* not a PCI device*/
+        .pci_bus = 0,
+        .pci_device = 0,
+        .pci_function = 0,
+        .pci_flags = 0,
+        .pci_segment = 0,
+    };
 
-    acpi_table_end(linker, &table);
+    build_spcr(table_data, linker, &serial, vms->oem_id, vms->oem_table_id);
 }
 
 /*
@@ -930,7 +916,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     }
 
     acpi_add_table(table_offsets, tables_blob);
-    build_spcr(tables_blob, tables->linker, vms);
+    build_spcr_v2(tables_blob, tables->linker, vms);
 
     acpi_add_table(table_offsets, tables_blob);
     build_dbg2(tables_blob, tables->linker, vms);
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 2b42e4192b..0e6e82b339 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -90,6 +90,39 @@ typedef struct AcpiFadtData {
     unsigned *xdsdt_tbl_offset;
 } AcpiFadtData;
 
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
 
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index ff2a310270..44e03e76bd 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -497,4 +497,8 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
 
 void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                 const char *oem_id, const char *oem_table_id);
+
+void build_spcr(GArray *table_data, BIOSLinker *linker,
+                const AcpiSpcrData *f, const char *oem_id,
+                const char *oem_table_id);
 #endif
-- 
2.34.1


