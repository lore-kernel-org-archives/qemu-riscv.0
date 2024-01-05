Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4B4C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 09:07:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLgAA-0001NT-B8; Fri, 05 Jan 2024 04:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rLgA9-0001NA-F4; Fri, 05 Jan 2024 04:06:45 -0500
Received: from mail-sh0chn02on2061d.outbound.protection.partner.outlook.cn
 ([2406:e500:4420:2::61d]
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rLgA6-0008TI-UB; Fri, 05 Jan 2024 04:06:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOdFmwFvrsFxc9Vs+VjxXT4qb/mIhHp2jarpk6XcNuVuTkzuatIYOO4bgjVhPn+eaYqUdoD0uqkvHJZY9MlW6iCqt3bGh1NBSHH4RJ1XpVomUBGUuJra/UhVPDJBcfhN6IXkuYtVVJ7adJ0k4GCxB7V/M1J30NreXxBDZlgunABhh9lkIyL2D1L6Y2EBKOVV4HMfGH3sr8xL7jgdW7FzocgviwCAm4YdHVF7UfH0PKLcmVqzoxISIc4x6dHnVr3n+dkjjlIRQWsFksM8LZA5sgLoQPmTibHZeE4ykC1Q3iVXB/tqAxvO0ntLcPPmkf9mbwb0AntcevxC1hffFVkAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDcgZh74fta9rwyvzCLiZ8DlQlJ+CqiToaRZYcBYn6w=;
 b=FbGyiP87hgbnwUAf5+DFUWbf7aVdD027X/uAyEVg4Jsfn3OrvSnVKW07GVQRKTUsRT7wyWpWwGbFXSD3GpUFP17XbRBH/4eAA7rMc2xcSCBS6biz7RzVOVFvpcR/Xi/ukEFmsMYCsdr7EgApwBA1zF9FoNCnR+W633oS/O07AfDPikMC180XARlqWztYP3q+c9g/BF5KG9HalKC8i9HtMd9lleo5O+feyLeXCjYAlL67db5bac4DuYad5jdxAmBIbQZdx+mWBQA7OQVgJkOxRENoyAVrIxn5ETNuUZCHjEMm7RD8cuWFK5N5UqAIqlzFXoI0gpq81XZmMbeBbMG7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:f::16) by BJSPR01MB0755.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.29; Fri, 5 Jan
 2024 09:06:29 +0000
Received: from BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
 ([fe80::3862:65b4:c857:c4a6]) by
 BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn ([fe80::3862:65b4:c857:c4a6%4])
 with mapi id 15.20.7135.028; Fri, 5 Jan 2024 09:06:29 +0000
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, jeeheng.sia@starfivetech.com,
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: [RESEND RFC v1 2/2] hw/riscv/virt-acpi-build.c: Generate SPCR table
Date: Fri,  5 Jan 2024 17:06:08 +0800
Message-Id: <20240105090608.5745-3-jeeheng.sia@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 90d5167b-1572-49d0-deaf-08dc0dcd9ad5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQxCZ1+krjHlZLduEh3puSuOPCZ8nrWt7tWucw0idIF64O0GF3IlVSjYXCAPSQ7J/9JkoCZjyy8TG4YQHiEDAXqzO37wPYUbfsDqjPm0Wb+vUI8pIS5/o01ndrz1qC9IS7Up/DdKAvSoojZ3KkJLcOYMldnXb3LyHaK5ZtaOPR6YPsqcRes6kkSDeRSFfNJLzs9bDOTO9lJh0XLWlm+KxuJ6zeaj7nY0k4HD0O+RjR+uGMzENdbsWTeZIZcR/u8DkbfT1tz+oatl3E38VrVQJuIi37QdqctV3x/HziSy7zNMRGP1aXJ4SjBUsw2EdfYJKLY08tvwKTjyOezX9E8CJWXCwL4qM3MkKyvokm4j+0MS8Ng5nOs3QV3XE7UX/rfnIcCKtsWIs+E+4WbAEJSm6CUyOIWlSUg+1aX23zJSfCyJoBAPn43pMzZTsYRJl4FJ2nu3dRJG9SIVNPZE8jAYovYzevp5ci89jzkk8MeyZdz/Jgzepq/h65aKt+HRO5Z5wmmzQ2nIMThcguI5mAKHfk7IzHHzOI7zcsEETBmmfV83aTW4A8vUQTr00K1T0vdG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(39830400003)(136003)(346002)(366004)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2616005)(1076003)(26005)(52116002)(6666004)(40160700002)(36756003)(86362001)(38100700002)(40180700001)(38350700005)(5660300002)(7416002)(4326008)(55236004)(41300700001)(66946007)(66556008)(66476007)(2906002)(8676002)(508600001)(8936002)(41320700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?URYE1dsyAPiRgxgM4M3nZOWfSrawJ0zumxQJ2SCmR+FirP6HZsAb2ycjjCIw?=
 =?us-ascii?Q?+I5DHxPdFM0IO6ov0nhEr7g6jbRlQw+LVy4H/OIgndrCmPUdbJv7TudCfTGO?=
 =?us-ascii?Q?XJnD+jNHeWCymDEqRtYucFgtrbOoIs1bEg308y2YhJDYiOEVNB0RWqbmiAHP?=
 =?us-ascii?Q?ogZekZR9Z/hJ4X22DEz7T6Yqc/TaTLUF84ju+kJLGAVIXkvk33GHLyw0oEyd?=
 =?us-ascii?Q?3yAZaxs0wU9/5P1KFCVRKfBv+4zk2SIyofQqxKXM+ePRhKy4pIl204LozNYR?=
 =?us-ascii?Q?rO91UtDzJJJwXzAh6uuXFIYRpl+JCiSh6W21LMGYwZaK9FAPX11RqfJSum8q?=
 =?us-ascii?Q?oG/+sv2JSRIrYAu7cgy3+iMnETxtLKaqsflwpXQ41orpScHlJDYVZnPltFZG?=
 =?us-ascii?Q?+aR0EXpGQ/XdEseJH3/RU1dAvW1DnQo6TvQyRgV0FqCzhhETSNVpUkBRDqX7?=
 =?us-ascii?Q?iRI91lVBC9JR9b1/NKgyIXaCgHbYL0FORf/dYNX6fxdSoAkpyb9RZyO++Hf0?=
 =?us-ascii?Q?a3/Zw5qU811tos1d7vLOcysuJkCfKdlmta+ei/zBVlKk7TMTYZwelLgKigRK?=
 =?us-ascii?Q?OOcPlLjsJaZAqI2nPQJ1RgmyI05fvVRzhyVKrI2KkkIQ4rbWyCyXrMKK8QPb?=
 =?us-ascii?Q?LovJNH4/XcDsXywl9bMlQT+Bvgxeo20L1xf2XpaICJIxVokUcVAeelluuysz?=
 =?us-ascii?Q?N1Zgd1eBqj2wVJIeDCEzb9MYKwMV8ryJrFPwKKBqrUi+lm+Vm2+UBwR2pT30?=
 =?us-ascii?Q?aafp54ip5VDeURA/YeJIWAI0CAI42VIuOgHVZ3f/5i2/x94xC184EUzPvJ/v?=
 =?us-ascii?Q?qCvEUGYCzNG5Q6eyH9+IfXaK0KqnhyENXrEJrf0HxquXKbVOzf+p0BaHES2s?=
 =?us-ascii?Q?H4wZ1rdWzt5ogJDnhzxYtYIc4lHjJKSDB7NAFjj0ka6BMWRlH1xQqolKUIOw?=
 =?us-ascii?Q?cZ2SxWZ1wo2+bIudnQVsjAZ8Uss23h1P7Kf6xL/R8TMizNRVHnVjxQM2C3ml?=
 =?us-ascii?Q?yXDhxhdqjXjOzCIkUkGTizkdF+nHLNRb1x8WfK4BuMWGtTGMz5F7Rt0tr1Rk?=
 =?us-ascii?Q?V+PMVF8sdRm/uGAIwCq9IUzvY7TDC86ZY3lz3QbO7UawzvqqfhhlvOd6Jvwg?=
 =?us-ascii?Q?YoPcUgJful48xhejwgTDQ/HN7vSrruao4D8Qcrayx35yNnF4dJmV5XqtM8sr?=
 =?us-ascii?Q?iyM9OOj+E4Li8Ld6msPWYxHWD7jzLoS9Y3rV4Yw4M3vZOn2oev1jXECurLA1?=
 =?us-ascii?Q?GJkmMv37bMxxfQd7gQfgzayEiAF6LLAtO3kKLUicoEPrXlYNMXoqqeaUPTql?=
 =?us-ascii?Q?UtsnQrTaVU9t/exjwLVXVikguxT1Z0iETGJASM0mTTDXUZ384rr5kfdCRdT2?=
 =?us-ascii?Q?FcNL+zUPrHMrmLjVdrcdn9X5KOny9zoS3NS1z8qiYP0Jc4KjOGAffvbQBtEl?=
 =?us-ascii?Q?Kq4czGkKc9+e1pFRiSSfYbLGItuyQToJJ3aSHJ6V3JxpG+g6yLKD7KQkR4U/?=
 =?us-ascii?Q?4FXclNUbl9pW3cf5N9vCbAcaubL3hW4ArOV2rVHy311xesCSVnk3KMwM9C2r?=
 =?us-ascii?Q?1HBMTsfRuVUwJ8hV888ZjYgwKerjD9GYMSitGsG9nRsZBTkdZBzfaaYhSnux?=
 =?us-ascii?Q?EA2PVyJPPRtSI7UP5UVAIgA=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d5167b-1572-49d0-deaf-08dc0dcd9ad5
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 09:06:29.8614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qeAj3dh9FJD6iDRmT+Ls8O1/UlwH4TnNo+CYuR80r2w3ytXBrX3LolZNZlmfak66DMDZcA0OmYz5YxK1UZSQFEnADZHLPfEwdaXI+hvZrbQ=
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
@@ -174,6 +174,42 @@ acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
     aml_append(scope, dev);
 }
 
+/*
+ * Serial Port Console Redirection Table (SPCR)
+ * Rev: 1.07
+ */
+
+static void
+build_spcr_rev2(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
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
+    build_spcr(table_data, linker, &serial, s->oem_id, s->oem_table_id);
+}
+
 /* RHCT Node[N] starts at offset 56 */
 #define RHCT_NODE_ARRAY_OFFSET 56
 
@@ -555,6 +591,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_rhct(tables_blob, tables->linker, s);
 
+    acpi_add_table(table_offsets, tables_blob);
+    build_spcr_rev2(tables_blob, tables->linker, s);
+
     acpi_add_table(table_offsets, tables_blob);
     {
         AcpiMcfgInfo mcfg = {
-- 
2.34.1


