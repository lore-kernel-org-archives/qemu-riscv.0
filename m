Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGCM-0003q2-Hk
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBz-0003ky-Q6; Tue, 26 Oct 2021 02:44:17 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:57183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBo-0002ts-0u; Tue, 26 Oct 2021 02:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230643; x=1666766643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mFPorsj1ASThHK/4dhs/o5YWaW0/s9Uiub4Mb/k3ZvA=;
 b=Z1cgClR0wvrh2Nox6euk6NWbXvHqGhXGMw6PZf5Cr0R7rWER8Eyqcp/C
 cEnwA+CUTLt/ZCeD+sj3Sj1/H0K7nAi/HUGO5/zkaP/qZ1qb93QwF6Ca/
 gyer6kV0KFiD4tto4IS6uYzEUZRX4rtAyUyra77XJApf5AZk5Gexk1ZUB
 htLz01v0AgtzJ58rmvVvG9XaipfTIeycCJ7xTQLuYCKDRv6LS7z1B0Iy7
 gvVVPk0IowKnz4euodYkD9qe9HV1PiWxc6kLN0d1/XUlHbUejNE1+eh7I
 l47JUjEhLnOEowzvCHwDUNo6SmUgLTDTqIkkbTn6xDbXX7/fpLGMoAILm w==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="295585006"
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y59BRLRFUjjvzf8vttubzpH7fbkPRHgKFjPuDrzl7s67C6FwJN1nDF57HupU2sWtYBU1PcouKpi+kxQdjZV0mFVis/rVC8QgJfi21ERRiGFn6QvOJ4saV2PL+VUkRwhFlWgQZSOAN3djf7MK2gb8C3ucSX3MaVcLwi5K+wXMXnyfMMQUlgLt0cFwPLMjbG0+0p8NiSEfHBvAuiDWwxv6TJUaIdsoDD087lWrDaUNbMCRNtsnx+QBy8twEqeI738q8X+qqDlAuRZXHWoaBMi78qgcw77Me3NJb+OjYSEDqC0PAVL951Nyv4rLFZgHfecu1zhULcjFaIP7qXAoWNAKvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hviGy8ShJe2mssNuhWRdhtEdfdPds2KyZr2esvoqhEA=;
 b=oO7Vg6h6oyTP1s7eExYHsQkFKX00ge7Ug1sZd4uN3/4J9H6dxZZKrPSViwu/aBPA9Z4Hko8T9ZGdv5jZpZyLacfzXNG8HgYwgze7npUL1X29SGfu7cZc337F+UxiMTECJrrXbbMBFEdTnZs1OOtoSW3d4wKX1pL66lbmcuT3lotyQtp2IXZH75CZ3PUFPD7dQgE0U84hX8VtswWm71ESuHmV9sobWf/ZUKQ6BEH0XTfejhZjFojws4zzeQI6WD1t8qfo8mmW8PUspNflB/Nuylk8VLe5igqLsBqOonnw6fPoUUl64KppnHxt0BoIXT76tD6hvA16/a8wPUWguI7VuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hviGy8ShJe2mssNuhWRdhtEdfdPds2KyZr2esvoqhEA=;
 b=0K65ykTYqzEoe5LnB9JTT4QBpmcfTONh/SkvSS5ww3UQn6VICw3uwYUxaQg4Akz+x7N5muvsv3BeJzR9+DoKQwBl98A8WYGJLs8hTyAkmFifKpXg+uNXo3LpOygwJ6oYEqhxouICr6DupIAPNvu0Q04iB2lA98o9NW9Kh2GozMA=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7825.namprd04.prod.outlook.com (2603:10b6:303:13b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 06:43:55 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:55 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 19/22] hw/riscv: virt: Add optional AIA APLIC support to
 virt machine
Date: Tue, 26 Oct 2021 12:12:24 +0530
Message-Id: <20211026064227.2014502-20-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026064227.2014502-1-anup.patel@wdc.com>
References: <20211026064227.2014502-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.162.126.221) by
 MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bf82d53-6248-4b50-5233-08d9984bfb21
X-MS-TrafficTypeDiagnostic: CO6PR04MB7825:
X-Microsoft-Antispam-PRVS: <CO6PR04MB782569444822C2A5AE41B59E8D849@CO6PR04MB7825.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:163;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Jg4hFZdvYfPWxDyJq7gvvYjm3/rQDrVMrR4teA14QoCViebgemks8hiDTzwt585m2VCAhKLIAho0EV28DEvDDWqv4+YvHJTAi6gylineWJDeLzeT16RSvI/sWMGM9rUFlddnjm0RootrRv/WZBkWdHIZxJ54n3P/Bc1km+yxhzRTxdNjslaAjV+rxudRzjPCiJA+h/hh6B/HMJodZDOqJt/f2qcxgMeNcgY3DyLFkeUEhuLYuw1mFeFfuMxNrh6+sIF+nbQqj+KjwAMQwNy4BRq/YKJ01sTqJ1v3/sdxvSKooBnRYm7MHHVyEG9jzi/SydEQu9kXzFKLJvhV4vTAehlMxcVf/oLH+r19gN/nK9GMtIkqkf5nOiuLqreo8S9RYd6Wp6LFFDq/rIFX1lNMAD+MIhN/nFhPW9Fdx9Ewlbb19MwRcOzI7QpvNUMZDaao0TBCMxoRw5RVnSb4hnkFoUz9K7oa9xKhoyxoQg2IutnUvxaEIiZYXoqgFHOz7u5sYVWy1fZe7sGqnEwgYm2/uof8WMaaFWC4hafOEigkkVnNsgidMtSwPLWeGY+EUABP54Hx0BcdTw/8brQT25IHbsepGy9w1NJB5zQCyjoVygsW6a5MHHfnZNR6fN/RnokF924XVpxx/Mdd6pPixjZ9tMLR/PKRtxbyPz6so0oiGim361qEvbiqQM3brfm2Iiw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(2906002)(66476007)(8936002)(66556008)(55016002)(82960400001)(52116002)(5660300002)(508600001)(186003)(66946007)(8676002)(36756003)(54906003)(38350700002)(38100700002)(6666004)(4326008)(30864003)(110136005)(1076003)(86362001)(26005)(2616005)(44832011)(956004)(8886007)(7696005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1E4VJSnXWC57qoKvUTC5MncPX+z+63yvOz20AsNvwQtRqjielpBJ4t0iRYLh?=
 =?us-ascii?Q?V6lH+DkstR8DIpy4L0lyKVsN2d/Tauj9f+ZaYY5OkofN4LePMmvJY0jT5TTz?=
 =?us-ascii?Q?VC1n+wh4KTA+ibJ/lwoqzz4jgGax7nCKnAa2U3QRW70gwEQ/9R6BSzSUAwCq?=
 =?us-ascii?Q?FUVTrh6WmUiYTrxBQGPZu5O0u1U/m1sLOA3/XfmpBbkHbppuudtAKyqvEusf?=
 =?us-ascii?Q?VsNJghVWiNsfb5dyeU/+JTLGwiA9Z9bVsOa55ob4IIwyQ7aQlwwA/t2mm1Cy?=
 =?us-ascii?Q?QBtp3iXSftPS44Eto/sIDEQo6jPZFkFDSVSaHRwiKr19rbLyV212Vam68y7n?=
 =?us-ascii?Q?Y/ajpotWk9eoMjnrg3u0h2NuMP9daaNkO1p1w5kL7U5/SIuaCvF648dWanmM?=
 =?us-ascii?Q?LaOeFDYwrhIkLd8Sv1jv0+r0FjQqsTouwzlG9hRN1/W0CtZHaWEJX6V9zchu?=
 =?us-ascii?Q?+tNHumNHUH8Veks624+yudPJPJcRv3KvWQ5raGbL2fi9SgEprvSaB5dcpT+n?=
 =?us-ascii?Q?ysbpe7co0agZAwLheQ+fGpeZu7h5NOPdWu+6H4JJ8kyOWlBD9EXPl3I1t1+n?=
 =?us-ascii?Q?esXsZ8o9fvXgyxhjitMqaQfj+MBlEeMKzYRhTq+S7cemgx83DiomHUZCWbeP?=
 =?us-ascii?Q?Idp4sPb4mE5iIT9MyNJ0Yb4zKlP2iwEHSvxjMzbniKsgB4wVQ9+EN10Z07Gi?=
 =?us-ascii?Q?jTmfntcY4SNCIrFj0/LmBBavSTEwE8eQhtSDvPKopMOlvxETN79G6URNELTG?=
 =?us-ascii?Q?3c2ggHTkrBUILC/afJRDyJm8xQQ3z1qr66UChHgko3TcNDgzR7ZrKY/zRs4C?=
 =?us-ascii?Q?NaKrf0wDfDZ9RjBcfeJ4l9ZLk1+KjPhmjhYtPUNovIvjqINxh6LBM+t+5c0O?=
 =?us-ascii?Q?ogcss5YfAwa5SZguNI3u99Wc+23CAB/WFv1lkA6Wg160KC15z8UuWjwa8U86?=
 =?us-ascii?Q?ozzzRciXvrJOTkVlWbq21mbV9S6gp8GxMalSTvi94NlAXV617LLi1bHaJjm5?=
 =?us-ascii?Q?LFNg42qFo5w20O+/rul83Tv7W/duDkoQAF+fLPVvT1QUFiRxCTY+b9YtyiPX?=
 =?us-ascii?Q?pCdT06rty9HxxoOMNhyd0nNsBghtPUnY9l0VRULHJNChSOOV3JHBWF0wKE17?=
 =?us-ascii?Q?4u8iZqNOeMaLE2tNzqKWTWLDbqb1Lj/8tBWN9WY512VUb50XteV3f9+brEZv?=
 =?us-ascii?Q?8igonxmxd1GWpm/ZVp8vJqWUAqR/SwJbZ90PdDENMwDOmNwmgsPrY4cceTUr?=
 =?us-ascii?Q?T+b/dGCY/JUA29G7U3TSMCJsUfFYpLArzxZ4+hGVsbS8d1elU1030nMwpdmX?=
 =?us-ascii?Q?7ZeMGRcYRAnfCKeSuW3kTb3zrz/GuA1BcoYYsoIG1CqIOnFceF+DLtH0WJNR?=
 =?us-ascii?Q?V66REqA2H6UgWOXI9+N1ja23al8lCeP9zFCDtTjOiRAUuBGm46E8q4FHDbvM?=
 =?us-ascii?Q?ILTsD1zaU2wY1riyH6ncUw2P3AMzxbxsLn4Kg4UHbftjAG3TlZ9q41f/Ur3B?=
 =?us-ascii?Q?pKEipSQ3czs+ig5omvhsSO2M88CP2XqR2L1clH9mxHRoEdRJmCsANdQHVPN9?=
 =?us-ascii?Q?EUCg4oWoZcHPodCwgv+66YwV6cUBDrWcuGly+V02XgLcLHUd8qlYfeTCqloO?=
 =?us-ascii?Q?ecW4E36gmrFmqoG26/GwnlY=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf82d53-6248-4b50-5233-08d9984bfb21
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:55.6344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egndKW1tkADlcgWThc0oE02Ot+zeStnXcTDkKjCc3a5fTk+9lO3rp3981N0RtZXSGG1BcW7tBHoi7263dMtQ0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7825
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Oct 2021 06:44:17 -0000

We extend virt machine to emulate AIA APLIC devices only when
"aia=aplic" parameter is passed along with machine name in QEMU
command-line. When "aia=none" or not specified then we fallback
to original PLIC device emulation.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/riscv/Kconfig        |   1 +
 hw/riscv/virt.c         | 293 ++++++++++++++++++++++++++++++++--------
 include/hw/riscv/virt.h |  26 +++-
 3 files changed, 260 insertions(+), 60 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index d2d869aaad..c30bb7cb6c 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -42,6 +42,7 @@ config RISCV_VIRT
     select PFLASH_CFI01
     select SERIAL
     select RISCV_ACLINT
+    select RISCV_APLIC
     select SIFIVE_PLIC
     select SIFIVE_TEST
     select VIRTIO_MMIO
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 83f784bdee..4e21b485aa 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -33,6 +33,7 @@
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
 #include "hw/intc/riscv_aclint.h"
+#include "hw/intc/riscv_aplic.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "chardev/char.h"
@@ -51,6 +52,8 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_ACLINT_SSWI] = {  0x2F00000,        0x4000 },
     [VIRT_PCIE_PIO] =    {  0x3000000,       0x10000 },
     [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
+    [VIRT_APLIC_M] =     {  0xc000000,        0x8000 },
+    [VIRT_APLIC_S] =     {  0xd000000,        0x8000 },
     [VIRT_UART0] =       { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
     [VIRT_FW_CFG] =      { 0x10100000,          0x18 },
@@ -132,12 +135,13 @@ static void virt_flash_map(RISCVVirtState *s,
                     sysmem);
 }
 
-static void create_pcie_irq_map(void *fdt, char *nodename,
-                                uint32_t plic_phandle)
+static void create_pcie_irq_map(RISCVVirtState *s, void *fdt, char *nodename,
+                                uint32_t irqchip_phandle)
 {
     int pin, dev;
-    uint32_t
-        full_irq_map[GPEX_NUM_IRQS * GPEX_NUM_IRQS * FDT_INT_MAP_WIDTH] = {};
+    uint32_t irq_map_stride = 0;
+    uint32_t full_irq_map[GPEX_NUM_IRQS * GPEX_NUM_IRQS *
+                          FDT_MAX_INT_MAP_WIDTH] = {};
     uint32_t *irq_map = full_irq_map;
 
     /* This code creates a standard swizzle of interrupts such that
@@ -155,23 +159,31 @@ static void create_pcie_irq_map(void *fdt, char *nodename,
             int irq_nr = PCIE_IRQ + ((pin + PCI_SLOT(devfn)) % GPEX_NUM_IRQS);
             int i = 0;
 
+            /* Fill PCI address cells */
             irq_map[i] = cpu_to_be32(devfn << 8);
-
             i += FDT_PCI_ADDR_CELLS;
-            irq_map[i] = cpu_to_be32(pin + 1);
 
+            /* Fill PCI Interrupt cells */
+            irq_map[i] = cpu_to_be32(pin + 1);
             i += FDT_PCI_INT_CELLS;
-            irq_map[i++] = cpu_to_be32(plic_phandle);
 
-            i += FDT_PLIC_ADDR_CELLS;
-            irq_map[i] = cpu_to_be32(irq_nr);
-
-            irq_map += FDT_INT_MAP_WIDTH;
+            /* Fill interrupt controller phandle and cells */
+            irq_map[i++] = cpu_to_be32(irqchip_phandle);
+            irq_map[i++] = cpu_to_be32(irq_nr);
+            if (s->aia_type != VIRT_AIA_TYPE_NONE) {
+                irq_map[i++] = cpu_to_be32(0x4);
+            }
+
+            if (!irq_map_stride) {
+                irq_map_stride = i;
+            }
+            irq_map += irq_map_stride;
         }
     }
 
-    qemu_fdt_setprop(fdt, nodename, "interrupt-map",
-                     full_irq_map, sizeof(full_irq_map));
+    qemu_fdt_setprop(fdt, nodename, "interrupt-map", full_irq_map,
+                     GPEX_NUM_IRQS * GPEX_NUM_IRQS *
+                     irq_map_stride * sizeof(uint32_t));
 
     qemu_fdt_setprop_cells(fdt, nodename, "interrupt-map-mask",
                            0x1800, 0, 0, 0x7);
@@ -394,8 +406,6 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     plic_addr = memmap[VIRT_PLIC].base + (memmap[VIRT_PLIC].size * socket);
     plic_name = g_strdup_printf("/soc/plic@%lx", plic_addr);
     qemu_fdt_add_subnode(mc->fdt, plic_name);
-    qemu_fdt_setprop_cell(mc->fdt, plic_name,
-        "#address-cells", FDT_PLIC_ADDR_CELLS);
     qemu_fdt_setprop_cell(mc->fdt, plic_name,
         "#interrupt-cells", FDT_PLIC_INT_CELLS);
     qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
@@ -415,6 +425,76 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     g_free(plic_cells);
 }
 
+static void create_fdt_socket_aia(RISCVVirtState *s,
+                                  const MemMapEntry *memmap, int socket,
+                                  uint32_t *phandle, uint32_t *intc_phandles,
+                                  uint32_t *aplic_phandles)
+{
+    int cpu;
+    char *aplic_name;
+    uint32_t *aplic_cells;
+    unsigned long aplic_addr;
+    MachineState *mc = MACHINE(s);
+    uint32_t aplic_m_phandle, aplic_s_phandle;
+
+    aplic_m_phandle = (*phandle)++;
+    aplic_s_phandle = (*phandle)++;
+    aplic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
+
+    /* M-level APLIC node */
+    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+        aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
+    }
+    aplic_addr = memmap[VIRT_APLIC_M].base +
+                 (memmap[VIRT_APLIC_M].size * socket);
+    aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
+    qemu_fdt_add_subnode(mc->fdt, aplic_name);
+    qemu_fdt_setprop_string(mc->fdt, aplic_name, "compatible", "riscv,aplic");
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name,
+        "#interrupt-cells", FDT_APLIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+        aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
+        0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
+        VIRT_IRQCHIP_NUM_SOURCES);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,children",
+        aplic_s_phandle);
+    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "riscv,delegate",
+        0x1, VIRT_IRQCHIP_NUM_SOURCES, aplic_s_phandle);
+    riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_m_phandle);
+    g_free(aplic_name);
+
+    /* S-level APLIC node */
+    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+        aplic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        aplic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
+    }
+    aplic_addr = memmap[VIRT_APLIC_S].base +
+                 (memmap[VIRT_APLIC_S].size * socket);
+    aplic_name = g_strdup_printf("/soc/aplic@%lx", aplic_addr);
+    qemu_fdt_add_subnode(mc->fdt, aplic_name);
+    qemu_fdt_setprop_string(mc->fdt, aplic_name, "compatible", "riscv,aplic");
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name,
+        "#interrupt-cells", FDT_APLIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+        aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
+        0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_S].size);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
+        VIRT_IRQCHIP_NUM_SOURCES);
+    riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandle);
+    g_free(aplic_name);
+
+    g_free(aplic_cells);
+    aplic_phandles[socket] = aplic_s_phandle;
+}
+
 static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
                                bool is_32_bit, uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
@@ -451,8 +531,13 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
             create_fdt_socket_clint(s, memmap, socket, intc_phandles);
         }
 
-        create_fdt_socket_plic(s, memmap, socket, phandle,
-            intc_phandles, xplic_phandles);
+        if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+            create_fdt_socket_plic(s, memmap, socket, phandle,
+                intc_phandles, xplic_phandles);
+        } else {
+            create_fdt_socket_aia(s, memmap, socket, phandle,
+                intc_phandles, xplic_phandles);
+        }
 
         g_free(intc_phandles);
         g_free(clust_name);
@@ -493,7 +578,13 @@ static void create_fdt_virtio(RISCVVirtState *s, const MemMapEntry *memmap,
             0x0, memmap[VIRT_VIRTIO].size);
         qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent",
             irq_virtio_phandle);
-        qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", VIRTIO_IRQ + i);
+        if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+            qemu_fdt_setprop_cell(mc->fdt, name, "interrupts",
+                                  VIRTIO_IRQ + i);
+        } else {
+            qemu_fdt_setprop_cells(mc->fdt, name, "interrupts",
+                                   VIRTIO_IRQ + i, 0x4);
+        }
         g_free(name);
     }
 }
@@ -531,7 +622,7 @@ static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap,
         2, virt_high_pcie_memmap.base,
         2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
 
-    create_pcie_irq_map(mc->fdt, name, irq_pcie_phandle);
+    create_pcie_irq_map(s, mc->fdt, name, irq_pcie_phandle);
     g_free(name);
 }
 
@@ -590,7 +681,11 @@ static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
         0x0, memmap[VIRT_UART0].size);
     qemu_fdt_setprop_cell(mc->fdt, name, "clock-frequency", 3686400);
     qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent", irq_mmio_phandle);
-    qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", UART0_IRQ);
+    if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+        qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", UART0_IRQ);
+    } else {
+        qemu_fdt_setprop_cells(mc->fdt, name, "interrupts", UART0_IRQ, 0x4);
+    }
 
     qemu_fdt_add_subnode(mc->fdt, "/chosen");
     qemu_fdt_setprop_string(mc->fdt, "/chosen", "stdout-path", name);
@@ -611,7 +706,11 @@ static void create_fdt_rtc(RISCVVirtState *s, const MemMapEntry *memmap,
         0x0, memmap[VIRT_RTC].base, 0x0, memmap[VIRT_RTC].size);
     qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent",
         irq_mmio_phandle);
-    qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", RTC_IRQ);
+    if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+        qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", RTC_IRQ);
+    } else {
+        qemu_fdt_setprop_cells(mc->fdt, name, "interrupts", RTC_IRQ, 0x4);
+    }
     g_free(name);
 }
 
@@ -692,7 +791,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                                           hwaddr high_mmio_base,
                                           hwaddr high_mmio_size,
                                           hwaddr pio_base,
-                                          DeviceState *plic)
+                                          DeviceState *irqchip)
 {
     DeviceState *dev;
     MemoryRegion *ecam_alias, *ecam_reg;
@@ -726,7 +825,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, pio_base);
 
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
-        irq = qdev_get_gpio_in(plic, PCIE_IRQ + i);
+        irq = qdev_get_gpio_in(irqchip, PCIE_IRQ + i);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
         gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
@@ -775,18 +874,75 @@ static char *plic_hart_config_string(int hart_count)
     return g_strjoinv(",", (char **)vals);
 }
 
+static DeviceState *virt_create_plic(const MemMapEntry *memmap, int socket,
+                                     int base_hartid, int hart_count)
+{
+    DeviceState *ret;
+    char *plic_hart_config;
+
+    /* Per-socket PLIC hart topology configuration string */
+    plic_hart_config = plic_hart_config_string(hart_count);
+
+    /* Per-socket PLIC */
+    ret = sifive_plic_create(
+            memmap[VIRT_PLIC].base + socket * memmap[VIRT_PLIC].size,
+            plic_hart_config, hart_count, base_hartid,
+            VIRT_IRQCHIP_NUM_SOURCES,
+            ((1U << VIRT_IRQCHIP_NUM_PRIO_BITS) - 1),
+            VIRT_PLIC_PRIORITY_BASE,
+            VIRT_PLIC_PENDING_BASE,
+            VIRT_PLIC_ENABLE_BASE,
+            VIRT_PLIC_ENABLE_STRIDE,
+            VIRT_PLIC_CONTEXT_BASE,
+            VIRT_PLIC_CONTEXT_STRIDE,
+            memmap[VIRT_PLIC].size);
+
+    g_free(plic_hart_config);
+
+    return ret;
+}
+
+static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type,
+                                    const MemMapEntry *memmap, int socket,
+                                    int base_hartid, int hart_count)
+{
+    DeviceState *aplic_m;
+
+    /* Per-socket M-level APLIC */
+    aplic_m = riscv_aplic_create(
+        memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
+        memmap[VIRT_APLIC_M].size,
+        base_hartid, hart_count,
+        VIRT_IRQCHIP_NUM_SOURCES,
+        VIRT_IRQCHIP_NUM_PRIO_BITS,
+        false, true, NULL);
+
+    if (aplic_m) {
+        /* Per-socket S-level APLIC */
+        riscv_aplic_create(
+            memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
+            memmap[VIRT_APLIC_S].size,
+            base_hartid, hart_count,
+            VIRT_IRQCHIP_NUM_SOURCES,
+            VIRT_IRQCHIP_NUM_PRIO_BITS,
+            false, false, aplic_m);
+    }
+
+    return aplic_m;
+}
+
 static void virt_machine_init(MachineState *machine)
 {
     const MemMapEntry *memmap = virt_memmap;
     RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
-    char *plic_hart_config, *soc_name;
+    char *soc_name;
     target_ulong start_addr = memmap[VIRT_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
-    DeviceState *mmio_plic, *virtio_plic, *pcie_plic;
+    DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
     int i, base_hartid, hart_count;
 
     /* Check socket count limit */
@@ -797,7 +953,7 @@ static void virt_machine_init(MachineState *machine)
     }
 
     /* Initialize sockets */
-    mmio_plic = virtio_plic = pcie_plic = NULL;
+    mmio_irqchip = virtio_irqchip = pcie_irqchip = NULL;
     for (i = 0; i < riscv_socket_count(machine); i++) {
         if (!riscv_socket_check_hartids(machine, i)) {
             error_report("discontinuous hartids in socket%d", i);
@@ -847,36 +1003,27 @@ static void virt_machine_init(MachineState *machine)
                 base_hartid, hart_count, true);
         }
 
-        /* Per-socket PLIC hart topology configuration string */
-        plic_hart_config = plic_hart_config_string(hart_count);
-
-        /* Per-socket PLIC */
-        s->plic[i] = sifive_plic_create(
-            memmap[VIRT_PLIC].base + i * memmap[VIRT_PLIC].size,
-            plic_hart_config, hart_count, base_hartid,
-            VIRT_PLIC_NUM_SOURCES,
-            VIRT_PLIC_NUM_PRIORITIES,
-            VIRT_PLIC_PRIORITY_BASE,
-            VIRT_PLIC_PENDING_BASE,
-            VIRT_PLIC_ENABLE_BASE,
-            VIRT_PLIC_ENABLE_STRIDE,
-            VIRT_PLIC_CONTEXT_BASE,
-            VIRT_PLIC_CONTEXT_STRIDE,
-            memmap[VIRT_PLIC].size);
-        g_free(plic_hart_config);
+        /* Per-socket interrupt controller */
+        if (s->aia_type == VIRT_AIA_TYPE_NONE) {
+            s->irqchip[i] = virt_create_plic(memmap, i,
+                                             base_hartid, hart_count);
+        } else {
+            s->irqchip[i] = virt_create_aia(s->aia_type, memmap, i,
+                                            base_hartid, hart_count);
+        }
 
-        /* Try to use different PLIC instance based device type */
+        /* Try to use different IRQCHIP instance based device type */
         if (i == 0) {
-            mmio_plic = s->plic[i];
-            virtio_plic = s->plic[i];
-            pcie_plic = s->plic[i];
+            mmio_irqchip = s->irqchip[i];
+            virtio_irqchip = s->irqchip[i];
+            pcie_irqchip = s->irqchip[i];
         }
         if (i == 1) {
-            virtio_plic = s->plic[i];
-            pcie_plic = s->plic[i];
+            virtio_irqchip = s->irqchip[i];
+            pcie_irqchip = s->irqchip[i];
         }
         if (i == 2) {
-            pcie_plic = s->plic[i];
+            pcie_irqchip = s->irqchip[i];
         }
     }
 
@@ -975,7 +1122,7 @@ static void virt_machine_init(MachineState *machine)
     for (i = 0; i < VIRTIO_COUNT; i++) {
         sysbus_create_simple("virtio-mmio",
             memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size,
-            qdev_get_gpio_in(DEVICE(virtio_plic), VIRTIO_IRQ + i));
+            qdev_get_gpio_in(DEVICE(virtio_irqchip), VIRTIO_IRQ + i));
     }
 
     gpex_pcie_init(system_memory,
@@ -986,14 +1133,14 @@ static void virt_machine_init(MachineState *machine)
                    virt_high_pcie_memmap.base,
                    virt_high_pcie_memmap.size,
                    memmap[VIRT_PCIE_PIO].base,
-                   DEVICE(pcie_plic));
+                   DEVICE(pcie_irqchip));
 
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
-        0, qdev_get_gpio_in(DEVICE(mmio_plic), UART0_IRQ), 399193,
+        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
-        qdev_get_gpio_in(DEVICE(mmio_plic), RTC_IRQ));
+        qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
 
     virt_flash_create(s);
 
@@ -1009,6 +1156,37 @@ static void virt_machine_instance_init(Object *obj)
 {
 }
 
+static char *virt_get_aia(Object *obj, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+    const char *val;
+
+    switch (s->aia_type) {
+    case VIRT_AIA_TYPE_APLIC:
+        val = "aplic";
+        break;
+    default:
+        val = "none";
+        break;
+    };
+
+    return g_strdup(val);
+}
+
+static void virt_set_aia(Object *obj, const char *val, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    if (!strcmp(val, "none")) {
+        s->aia_type = VIRT_AIA_TYPE_NONE;
+    } else if (!strcmp(val, "aplic")) {
+        s->aia_type = VIRT_AIA_TYPE_APLIC;
+    } else {
+        error_setg(errp, "Invalid AIA interrupt controller type");
+        error_append_hint(errp, "Valid values are none, and aplic.\n");
+    }
+}
+
 static bool virt_get_aclint(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -1047,6 +1225,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "aclint",
                                           "Set on/off to enable/disable "
                                           "emulating ACLINT devices");
+
+    object_class_property_add_str(oc, "aia", virt_get_aia,
+                                  virt_set_aia);
+    object_class_property_set_description(oc, "aia",
+                                          "Set type of AIA interrupt "
+                                          "conttoller. Valid values are "
+                                          "none, and aplic.");
 }
 
 static const TypeInfo virt_machine_typeinfo = {
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index d9105c1886..a26ef4a295 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -32,18 +32,24 @@ typedef struct RISCVVirtState RISCVVirtState;
 DECLARE_INSTANCE_CHECKER(RISCVVirtState, RISCV_VIRT_MACHINE,
                          TYPE_RISCV_VIRT_MACHINE)
 
+typedef enum RISCVVirtAIAType {
+    VIRT_AIA_TYPE_NONE=0,
+    VIRT_AIA_TYPE_APLIC,
+} RISCVVirtAIAType;
+
 struct RISCVVirtState {
     /*< private >*/
     MachineState parent;
 
     /*< public >*/
     RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
-    DeviceState *plic[VIRT_SOCKETS_MAX];
+    DeviceState *irqchip[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
     FWCfgState *fw_cfg;
 
     int fdt_size;
     bool have_aclint;
+    RISCVVirtAIAType aia_type;
 };
 
 enum {
@@ -54,6 +60,8 @@ enum {
     VIRT_CLINT,
     VIRT_ACLINT_SSWI,
     VIRT_PLIC,
+    VIRT_APLIC_M,
+    VIRT_APLIC_S,
     VIRT_UART0,
     VIRT_VIRTIO,
     VIRT_FW_CFG,
@@ -73,9 +81,10 @@ enum {
     VIRTIO_NDEV = 0x35 /* Arbitrary maximum number of interrupts */
 };
 
+#define VIRT_IRQCHIP_NUM_SOURCES 127
+#define VIRT_IRQCHIP_NUM_PRIO_BITS 3
+
 #define VIRT_PLIC_HART_CONFIG "MS"
-#define VIRT_PLIC_NUM_SOURCES 127
-#define VIRT_PLIC_NUM_PRIORITIES 7
 #define VIRT_PLIC_PRIORITY_BASE 0x04
 #define VIRT_PLIC_PENDING_BASE 0x1000
 #define VIRT_PLIC_ENABLE_BASE 0x2000
@@ -87,9 +96,14 @@ enum {
 
 #define FDT_PCI_ADDR_CELLS    3
 #define FDT_PCI_INT_CELLS     1
-#define FDT_PLIC_ADDR_CELLS   0
 #define FDT_PLIC_INT_CELLS    1
-#define FDT_INT_MAP_WIDTH     (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + 1 + \
-                               FDT_PLIC_ADDR_CELLS + FDT_PLIC_INT_CELLS)
+#define FDT_APLIC_INT_CELLS   2
+#define FDT_MAX_INT_CELLS     2
+#define FDT_MAX_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
+                                 1 + FDT_MAX_INT_CELLS)
+#define FDT_PLIC_INT_MAP_WIDTH  (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
+                                 1 + FDT_PLIC_INT_CELLS)
+#define FDT_APLIC_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
+                                 1 + FDT_APLIC_INT_CELLS)
 
 #endif
-- 
2.25.1


