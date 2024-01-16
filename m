Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4B8C4707B
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 01:10:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPXy5-0007Tq-6J; Mon, 15 Jan 2024 20:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rPXy1-0007Qv-8G; Mon, 15 Jan 2024 20:10:13 -0500
Received: from mail-sh0chn02on2062c.outbound.protection.partner.outlook.cn
 ([2406:e500:4420:2::62c]
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rPXxy-0005hs-CI; Mon, 15 Jan 2024 20:10:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acSE9P1sV/s6dLrdtU8S2HL3hSh8wSg20Hk9fQId1BI8zzZN/QeCZwg/JaUYbQpG90zuX/2v1V1O3xLUW2MJGF6KMsRyWPxIlI9hB4dMX7bhi2UDoeK7/V/xjnfaNR6KuuYrhHHkHMa7AkchMTvtpNtEaOjmBlMUILE2igWutneKBrZJkzMDiFftQpbmcsFvj1EomQMO8DBjG4a4QP46z4/uOuVirx2ZdkMsvHymxTDqdNkcr4s83AyrgUxVMSSXSTwY7Z6GtxcI7Om3TEthDLs4EamIDZexQt7SLlvEtbpcnD7maAChxw8SZ4ZqiNn5jnK4I1TzH7KcIsbFK2saog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWgcDjUyZMtL9DFUEv4cj7M9P0hs02oxETW145rxLtg=;
 b=Z2Euo63BQEau+fJKZJp+lW+qKM3uQ1+KOTcSLsKo4SYQiarNM3WcVt+iInnqEDau1DsNjs7jxSWPpaX77J1wn6ocAMLZ4+6kf3JoOHYlvz08BJhgqot0hhdJ+aesi54r5uWxUMWlykPScVNJ88HIPYXWTIiyZ5Dcf/M/LePXv7KU82GDuHqL7Z+H05hpzS5X3DPb6p3b/qME2P8Y/UVBJPfVOjV+QVbucBbvR0jSeiDtYuxdgjudahezNSoUogHf7YKxKxNa6CsxUFKEf2qIn/zu5VWS0lGUXMgZBO3VP8H0KPzdpOcuVKrf3xiX5CHts8PgUsXMWpfCTQr9mkzsFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::14) by SHXPR01MB0527.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.33; Tue, 16 Jan
 2024 01:09:54 +0000
Received: from SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 ([fe80::535d:fb55:ed0:334f]) by SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
 ([fe80::535d:fb55:ed0:334f%3]) with mapi id 15.20.7135.033; Tue, 16 Jan 2024
 01:09:54 +0000
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, jeeheng.sia@starfivetech.com,
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: [PATCH v2 2/2] hw/riscv/virt-acpi-build.c: Generate SPCR table
Date: Mon, 15 Jan 2024 17:09:30 -0800
Message-Id: <20240116010930.43433-3-jeeheng.sia@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 412dbab7-e065-439f-0158-08dc162fd972
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0JjhB5pgBW1FYD/xKugSCMLI5rDVGN+bFi48BPsJcVHnAqo254KrtajXerlRJtoMHehVhF/0ZkRfZAFr2N7gIUvkSVSV0dsN+AYmahXj+TG5Mv7Ih0tBSskUsH2/DCL+uJ0n3QJ9o8sGpWciZDxagY7PINm31vjGlwA8Fwfc2vyDoEJDL5/Zh/PTIGV8huD9x3Q09HJeJW7FM4PWs2ALPWEAM1WOLebivU4yJyN6kWt6keBfpxfJbqWtv7KDI9bOSeDTo8iymZz7WgDEGVhd6wa+GmM3VdF5DYmTH/WKJ6I+FPGhqM415eu2i2JGCAQ8bTZl69KK4Hq2O4cpdEaPK6osk0hbqJLWU3x9STlngJgXbyauLHUOYmchWr9YASIDkH9jX1cCGJyiAhafgNS7NA/uxg7Pi2PnRryX3unHaAMY7tn0OghUMypwgm88scbFlzjwd9X7ZKeJoZSiXqj3chZImi67ic7/DIVC6Ea3lQTJmL8KDndD499ElBYQ42Dq5q3NStKGUKlGGUGSzngdajJqhGsLc0bnn3wE2rGghk/x8sgMmSdIPvxjRgKRdgKV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39830400003)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(1076003)(26005)(41320700001)(8936002)(41300700001)(66556008)(66476007)(8676002)(66946007)(508600001)(86362001)(6666004)(2616005)(36756003)(2906002)(38100700002)(38350700005)(5660300002)(40160700002)(52116002)(7416002)(4326008)(40180700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3FQ/UbsVzUX/+3Usmq5fVxDns7Q6qn+Gww6Lzrb0fAQVqYBOEj5BgTGLDOc4?=
 =?us-ascii?Q?/wEg+d1hYYlkVD0Kxny+/YOofFHT0iXOIAEFzO/lUVrTmUB7997g3OPeP3vp?=
 =?us-ascii?Q?CNKST69t8tuSQplnFr6F7VtrdJ0HrzVf9ROim2UGVv1OawbS4RtXK1ssSwF9?=
 =?us-ascii?Q?XhGS+K5xzyS5Ms5KIvtLvzv171wVphGLL44abAjVlSIGXTINmIou2dSyKKKN?=
 =?us-ascii?Q?sHJmWckFGo+7lF30WwY84TvER3DriHxDvlSwvbR23dAmR55vXFUgndopoVVt?=
 =?us-ascii?Q?Hj2tDd0IIviXjOgqYDA35d/k36x6nBDXoepNlFIYLe0BdTzhRcbDPfgz4rLd?=
 =?us-ascii?Q?RvyLLOrg6bbE4uLrPzbYkMBsKyQYEI1ylmCoBf4yHaqNpwTxQ/qL2xEls5cH?=
 =?us-ascii?Q?x4m3G3Cm/f1Lxc1TxPcr4CpuPDWpi31z/SaF3vz1NX56spwbuE47RQu2ZbNe?=
 =?us-ascii?Q?VtgrXsnZuFQOVLyYdfPL1+WEhObxU+/BVBZ8z+8AkmbBeOGVOc1z3U/vxQdW?=
 =?us-ascii?Q?/pQais6KnEW7ciyE5MRQxZmvmZONTA3WBT6NK9gWFP1El0j3e2AmTjEjXsNk?=
 =?us-ascii?Q?+AZbwQQ8NzKbN2qbz9G1zs6EXqnylMpJ5ycqyAxzSbwioPvHUb8Z0o5er9R9?=
 =?us-ascii?Q?fLJvyk7lKQFil2wJ7Ucg4K5gdnyXPKLUhBwHatAaClQQVqPU6fYvBzMI1ToI?=
 =?us-ascii?Q?gg3aI/T4lOvRQt8F8VUCaTMhfoDD1p/OBoOBE78MZZNVnjAcdS6aNkq+yb0T?=
 =?us-ascii?Q?qe3RMgwWiRWLVNSGa3QkSWNzTJcMZBdugHA32o2C8OcsqiBnYIJZICW4FrPa?=
 =?us-ascii?Q?+NZzZVYVjjYyeNPPVEmGtJJ37fHZDnv9TN+Ua6UrBgWW8UT9D61mr9X1MWx8?=
 =?us-ascii?Q?ZAyest/qneMv1ktt6Lwu199fRdx1hzDSNwUiYf+hNlbXBUkJQrTFc4yi489a?=
 =?us-ascii?Q?wY0K7vaZCQANaPz9egXkAEa14ymrKHfyYoQPbSks7jm2d06AAnY1UW1kWiiZ?=
 =?us-ascii?Q?KBklowyRIb7mIG/+kRsM8rJgKJ2n/IgsvAmGP+wpZY58EdzGZqHcZ7M161I4?=
 =?us-ascii?Q?YBDwzlTfRVqDUG9O61az/kJKKJULyQ9ibbzrjwOy9UDKn6OTHZ0Kh4h8QGFu?=
 =?us-ascii?Q?mRXVL53aSzOwHJ53D7d8EX+/suPA/+/UuAhWlnb8P2/kzv026pLhmV/UKcgD?=
 =?us-ascii?Q?Hy8C/TezUM7RLdRz8+iXYnO5xJvUVE5H2cfcWFWBjM6X+y6Cwy8s3f7zCrCY?=
 =?us-ascii?Q?47HqtovUosM3glqENgApb0Xe9lZRdHwN6cBL+r17FG/kbCzjAa+RIs841TR6?=
 =?us-ascii?Q?UiidXYE4KMMWlKL3pxgWySKMFt1+ThAhQkP44o5M4Ss4kxbnt+gk9Sv6Y+7w?=
 =?us-ascii?Q?+mEOwBPSQ6EYuiNjQSAwHuo4ofI1CMDw+SUFaUa4XXoAUaVAFfjfoeWyokSV?=
 =?us-ascii?Q?/bC34HggG3spwwZCF0Ltv+XCUBryL8tFzMz+X6WP1xaY+VhYFuc8QtOkqUHT?=
 =?us-ascii?Q?8B6Naf6RP67t0gVQ+KlSUlPhgIoj/4f/t17fxBApCiyLbFGTvuBNwbjwf9eX?=
 =?us-ascii?Q?aqJNKsL6MH2pvYXgw4mp1AQwyFJxNL1RrBKhObQ8FgXspzSHKfICCNkRj9fE?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 412dbab7-e065-439f-0158-08dc162fd972
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0574.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 01:09:54.9501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Z+006pjy77HiNUa2wgDMBAb+9MW4XkGkhsp7KUqBOiJuqjLZ4qbRWOjE+heWpQ3nmsNI48l19gdA3L7H4NdZcAMpSMP4VPCB0Mzira1G8Y=
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

Generate Serial Port Console Redirection Table (SPCR) for RISC-V
virtual machine.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 26c7e4482d..7fc5071c84 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -174,6 +174,42 @@ acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
     aml_append(scope, dev);
 }
 
+/*
+ * Serial Port Console Redirection Table (SPCR)
+ * Rev: 1.07
+ */
+
+static void
+spcr_setup(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
+{
+    AcpiSpcrData serial = {
+        .interface_type = 0,       /* 16550 compatible */
+        .base_addr.id = AML_AS_SYSTEM_MEMORY,
+        .base_addr.width = 32,
+        .base_addr.offset = 0,
+        .base_addr.size = 1,
+        .base_addr.addr = s->memmap[VIRT_UART0].base,
+        .interrupt_type = (1 << 4),/* Bit[4] RISC-V PLIC/APLIC */
+        .pc_interrupt = 0,
+        .interrupt = UART0_IRQ,
+        .baud_rate = 7,            /* 15200 */
+        .parity = 0,
+        .stop_bits = 1,
+        .flow_control = 0,
+        .terminal_type = 3,        /* ANSI */
+        .language = 0,             /* Language */
+        .pci_device_id = 0xffff,   /* not a PCI device*/
+        .pci_vendor_id = 0xffff,   /* not a PCI device*/
+        .pci_bus = 0,
+        .pci_device = 0,
+        .pci_function = 0,
+        .pci_flags = 0,
+        .pci_segment = 0,
+    };
+
+    build_spcr(table_data, linker, &serial, 2, s->oem_id, s->oem_table_id);
+}
+
 /* RHCT Node[N] starts at offset 56 */
 #define RHCT_NODE_ARRAY_OFFSET 56
 
@@ -555,6 +591,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_rhct(tables_blob, tables->linker, s);
 
+    acpi_add_table(table_offsets, tables_blob);
+    spcr_setup(tables_blob, tables->linker, s);
+
     acpi_add_table(table_offsets, tables_blob);
     {
         AcpiMcfgInfo mcfg = {
-- 
2.34.1


