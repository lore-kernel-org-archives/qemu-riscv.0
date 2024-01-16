Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2144C3DA79
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 01:11:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPXy6-0007US-DP; Mon, 15 Jan 2024 20:10:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rPXxw-0007Q7-4K; Mon, 15 Jan 2024 20:10:09 -0500
Received: from mail-sh0chn02on2062c.outbound.protection.partner.outlook.cn
 ([2406:e500:4420:2::62c]
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rPXxt-0005hs-I9; Mon, 15 Jan 2024 20:10:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRE6y3z1L/m4kjADfvQUCrteGem7f6JHTH5/+yWK+g2PJAN/KSJn5PoE6sUxkSUsizaUp9Ng9lH3mF9t5WvHJicOY6LH/92u4H8A1JjPsmm48VzcLKolZMkDrXlYIn6bg1uI6HA00Hpn6zov0sMEdPasz1orxm6rsfniVVSD3sHUUjP6OR/wU7EOJz5iewUbJSNr4/jhbs5/UrSGehV3CQxxBn91WSQm2uKi2p0CP9r3AWB+qwyrLPvt6bzPMuTflErrJj552rXnFfZKDwaT7jQwa52JvHC/oOQGWg9EPxbAHjpJBJdmUsTFhlLwa6q25B0adbepw0tV/yQfCXCZig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvUQs5EwDieDi245Mv3eG/jlzvXs0vEue7vdm3fvcpE=;
 b=ehY1jYOOwznRiEfHExl5M7gqs3mwv0DHpdBY1dgkA758JzLAUeOPyY5yJwQJi6Ge3UqeTtj+BWIiUlyWnK5My4GuuLdU6grL/par/xGb++Qqc0TKVugBhUdZoUJfRDsMBd2J96PYexA9UsK/Ush5XP81fULo815KKxjN+iR5mj6VOGfuIdiXo5ytvw1dv7fKpVxzXOcW+Ufv4en18kCMBRcG+ZzQUQGN1Y6M2JKb3X2D+baywxa74e4BaTSYTLb1KYmqBl7M8+Qw7PyokZE08bAgCcm7ojm291B9t5gAiYrGEDdkSr0l2lH8I5DYTFkCa0h4nqEG2RONz6GwBMrlQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::14) by SHXPR01MB0527.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.33; Tue, 16 Jan
 2024 01:09:49 +0000
Received: from SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 ([fe80::535d:fb55:ed0:334f]) by SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 ([fe80::535d:fb55:ed0:334f%3]) with mapi id 15.20.7135.033; Tue, 16 Jan 2024
 01:09:49 +0000
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, jeeheng.sia@starfivetech.com,
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: [PATCH v2 1/2] hw/arm/virt-acpi-build.c: Migrate SPCR creation to
 common location
Date: Mon, 15 Jan 2024 17:09:29 -0800
Message-Id: <20240116010930.43433-2-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116010930.43433-1-jeeheng.sia@starfivetech.com>
References: <20240116010930.43433-1-jeeheng.sia@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::16) To SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0574:EE_|SHXPR01MB0527:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a72ad9-5bfc-4c8b-ac5f-08dc162fd604
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U9CpvrMgwsH6Zk4dOzlUPzF0kohy0gOFht6gzEqmUKOBGLcNKlXtbQK16OYtxKO7j08ush/k4xJJTtfoD1ZKm+BDFLH6R+1jGvXXG05JOc6MzDz32qGstZSNYbntMoUD1yk+jcvm7P4t8qiAh+wYl5Vljee9lhgrF7roOvFMF4xPye1OtSwgxRd/LiDD1hvAA/KmNSdeL1nUm8/8rCoqqUCu4U3+Z1OBEf1xC2CxazLdeNTKv0Y0jQBLuyhjkhqxSw1woTmjsEdu0UwkJJcW6iHBeX8GgDnuz4wFh8Az6lo2Hl+/wkc6iNOvu5xbl9ixYnHG5jpJaiOAmpjABg6/Rhk/eSlGeyWDp/qfxpb3dFFwAG5U1BfGdwTzmBeSSqdd3DFfCsyor7XXYfSsdAA2+pDZQxyH19eOZsCplWJHhKME90WMV4whaEqES2IF3WOh0Jnz6Q2Tb882cDhBw0++Kh1C0o5Ytg9Dbc3OWKAcyRHXOKVkerMJlQCSW1lQRDgOOc7IufffxJh7uDtP7r0xx0pbGvihyuIzy/b1I/T8gE8B2VNqliEf+9HBUwe3DxVg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39830400003)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(1076003)(26005)(41320700001)(8936002)(83380400001)(41300700001)(66556008)(66476007)(8676002)(66946007)(508600001)(86362001)(6666004)(2616005)(36756003)(2906002)(38100700002)(38350700005)(5660300002)(40160700002)(52116002)(7416002)(4326008)(40180700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N/GPjFL1VxgG24AKa6fAk5Di7dZtFjAeuG50mINfSaR5XTzG+Cpj4NdUwdpR?=
 =?us-ascii?Q?cHrOG7i2xcvCcfKrK2+LMAUJEYGD7Dkc8N7eG1S9ndh8xFquXj73mmtAQy2h?=
 =?us-ascii?Q?Rwu6RCa0RBFczgv000m4WVZP10qFoV85JnQdRKOvdDnpnwttV5IRGQwEDzWj?=
 =?us-ascii?Q?nZfxJO11Kuy96PrMuXcx07vqA/GLx46LgSYQYRCjzrdE3F6ZWCpf/8SRPYSO?=
 =?us-ascii?Q?qtxTbRtIAQ5EWGD5x+oShwwAIAeH6WOqDGml/PWxSfQVrZof4VAFc+cV8xkQ?=
 =?us-ascii?Q?i2gcgd3J7E1SBWXPQ8AbGLyGNlwLNIfmkG6kws4QTBBHpJpBhqZTleJonEbL?=
 =?us-ascii?Q?aIzeBjMaF7Va2pSeIm/66jk0LF8GO/16xVpGEpD4fkbT4NmcItIRmPbF7exl?=
 =?us-ascii?Q?paWwOEad3uxWJmmgvdTeezuzhcmQl9v37hMm2/rd7cPBoCJJhi4c2SW+lyLQ?=
 =?us-ascii?Q?/kjT9LvyJW0kR6Cuvvzb3zHFKPybxGFpuoU4eLyVfnbEOHRh9enIuh4Y/dCa?=
 =?us-ascii?Q?MjDtgW0icMoRHGQmLqCPsf4EukId1n/gCbUDlLQ4Mh9U9aGWPfD2TvNftpZB?=
 =?us-ascii?Q?cyIakc8F9S7vZUT/btDo39IDSSznhiMrKHJPAtwMZeAsMaMbe3/E/LPm0kW2?=
 =?us-ascii?Q?7A6ZBe3wDpY4vYrKv75BTQLbdbLybf3Ry59CjeJqA6WktL50FP7R7P4q8CLZ?=
 =?us-ascii?Q?citmO04k4jd8u6LReweqV950gLIeq8kVYuvs60R0lqY3t0wPvelu0CXxyvZb?=
 =?us-ascii?Q?qyMoSX5JH++EZMumAWIHndBz864zNINDmgEJ6F7jM+aRs/TPNGJ9HY7uZik0?=
 =?us-ascii?Q?8zLfwB/udSeWSfViYqslD7gs5WB2ILJK1efuEW7uJWwcG9tBBjNsFGGIdX2T?=
 =?us-ascii?Q?1Q58ugl9j/ucgqrU6W+eDkbMOpf7hD5G3Cyh91KYKvyss/YAYfKXK8W3k8Xa?=
 =?us-ascii?Q?4tPhYwXuHcB5Xpe5YCr7HjO74UFIk0OkDfsGMblS4lqJc+yAGjh0o+Dh6KiM?=
 =?us-ascii?Q?VGeDWUk2Md7ufyqj0BqC/RNIGlwz8kGyl3+/ATfxsY/AcOQ8GLIO13U/mUlO?=
 =?us-ascii?Q?gD3lnGaQn80b8HnUKcSPkug5L6zkx+HJrcNsYaPYRW1bbRXch4VnH0DNcnVw?=
 =?us-ascii?Q?8efKGY60DyhPwLO/g7rbfgtAhDuRNMdz21HEZzhMk90dzhBI9s4AOcH76sPR?=
 =?us-ascii?Q?PsVDNFmgBi+NLamSpa5Y7PdAlMEvn2FTiJiOWphcoIuwWoS7J9qlqT0N+9/5?=
 =?us-ascii?Q?AwcRkLwEBL+FSsxGmEhlGj8n/J+v/zUYJCk/dvmOPrcEnufiIb46AgOaIpVx?=
 =?us-ascii?Q?h3KMNvWycsv5JncaQ3DQW6vEUh/rg9Z2f7wXCiY6qPaBVJtCsbqGl/8Lpb9S?=
 =?us-ascii?Q?lDoCtZSfTqNLNDsMdprli2GUYN6oUjzbARfqJRVF91l2zhkvOpRBbwXlBRMC?=
 =?us-ascii?Q?05TM6j2rr2l+jgzz4Pw7Z9XJ+HLlRh4wAJItpNWHPmtDXEgdj0hZAr3rS0/v?=
 =?us-ascii?Q?0mtmSIOinh10AxpOMn25y+8C3ToEMgg57qadrFAUdxmqjYdgTGUc9HFYX6VW?=
 =?us-ascii?Q?kdorGSZuq4NGjIiCcH2i2KCHI2eM3EMb8VqGdeKNKS87B2b1vtTbkJ1ePVVe?=
 =?us-ascii?Q?3Q=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a72ad9-5bfc-4c8b-ac5f-08dc162fd604
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 01:09:49.1863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHbHmPUfDW4tZQ1uFgVx1gBUf01QVhXGUNHLVRenFAJMxNRw04zheSnNpLsDj2lCY1iRxhPi8lixeayHRsQFgRfiH97wcvvBEc2IP3ym8HA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0527
Received-SPF: pass client-ip=2406:e500:4420:2::62c;
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
index af66bde0f5..f3904650e4 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1994,6 +1994,57 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
     }
 }
 
+void build_spcr(GArray *table_data, BIOSLinker *linker,
+                const AcpiSpcrData *f, const uint8_t rev,
+                const char *oem_id, const char *oem_table_id)
+{
+    AcpiTable table = { .sig = "SPCR", .rev = rev, .oem_id = oem_id,
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
index a22a2f43a5..195767c0f0 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -431,48 +431,34 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
  * Rev: 1.07
  */
 static void
-build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+spcr_setup(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
+    build_spcr(table_data, linker, &serial, 2, vms->oem_id, vms->oem_table_id);
 }
 
 /*
@@ -930,7 +916,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     }
 
     acpi_add_table(table_offsets, tables_blob);
-    build_spcr(tables_blob, tables->linker, vms);
+    spcr_setup(tables_blob, tables->linker, vms);
 
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
index ff2a310270..a3784155cb 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -497,4 +497,8 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
 
 void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                 const char *oem_id, const char *oem_table_id);
+
+void build_spcr(GArray *table_data, BIOSLinker *linker,
+                const AcpiSpcrData *f, const uint8_t rev,
+                const char *oem_id, const char *oem_table_id);
 #endif
-- 
2.34.1


