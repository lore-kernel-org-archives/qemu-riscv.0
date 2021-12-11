Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtsg-0006t1-R7
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:21:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtse-0006la-S5; Fri, 10 Dec 2021 23:21:04 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:26525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsb-0001me-Ci; Fri, 10 Dec 2021 23:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196460; x=1670732460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yw0idvJ2tezCQ7QaqjcFU9KlPuUQQ3yCLTRpnCP0FTc=;
 b=rXJTfjKRGoD5m6MeDPwn65EE/aTqPRbYsxA2KjHBKzXA6kXiQQhadrMQ
 FMGRxb73dmNcBxss0h6Khx9QYsTIohDfuqE76WqpaMMxc0Tk/1FP7fqxA
 IvLSmR2TEeWFdDMuQFpr4gTP5gFGdquqYBAOrZi/qlMBwA800+rcsGYay
 dBhdW2hnWGlIoGLsLnBLktAkvpLwnCR+CyADEKGK4GFcSrASyIuxb9qg/
 86Z4JwLOAQUM4W1EIdbwovrPn4U6U7xbkU8Yua9eZuYrx8Hqm3b6BqJyJ
 VARrYtkJP9ZkYLvq3qVdSyooNxJX/izE33EWkL+K6RW7ZrXywJjMrg5wt A==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="187989962"
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITA200SVGBO+MMdLma3pIIurcaf44TH7ZnHWdZJ6XlGhbEqo+hE3f6H5RtHIKpDjQQViamGrcQjONvVM1RhMWRaNfYCB4WY170imPMReiVc4ZHoaQ4hZkpscUpLTb5algWQexX7aTW5VzY5V6TNLARPagqkvhGtOX5PbC9wFLi7f9tM7SAWF/0aeaeNaHByAcGWMhUMLZJDwG3ysrryOoOICBWazN4FXZWVCmGLGPQm7ms1zp0ooB8IFJYPP1Z9JCYScXZtkG2GuLvnzwZTsyEQ9a5LwcrwILuxMWvozK8ng9N/R4GAELm2lkn6+2eeR6e9T8QCp1AfjXZXIH/MpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPLmM8s4lkqwegiLKEkPFKB2miTOdgMGWze+r0AYapM=;
 b=R534vX8bt4pkfody5MbipHrDeHzSE0/7ySfBx7IknZeTE5UcrbAenqxK214SpAQF/GvC75NJchWXrAFPL/ZjsxeE/udS87iPN070OxAhY3gfnqehtVnfuGfsqWxyLF1UlP2ft7sLTvP8+Hz5dIjJvswOIsST835BHUtmoj7hzXqapIYrZz8NuiZFazSLAEseEwGINl/lRl4Th2QlauroqOfc4mPYwhvrmwzUT6bXa/xnAzOUuhSUOD7yDS9wtKldMBqzigAAKjfn70jmA/Jaxt38V5Xee3xXVZwqhMXY8hWbuGp+7G+KYL+R8PGPz8xXlP4cTxr/fAAC+XNqgm7piA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPLmM8s4lkqwegiLKEkPFKB2miTOdgMGWze+r0AYapM=;
 b=qdTws5Ldnc2S3AtK1w3AR2wzdW/9CxZaVlo+/cmaWeqThTiDzePVLDG2eLZbHgquw69+56G3qV5TyluVP0n5YdCsny+wZMUK4uEYYtYrkUkggw3FuJCVTXb3P5/4KGfnfiht/2/bTKrPvL0Nan6CBX5cHgGLMFt05mkqkBNvaxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:20:57 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:57 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 19/23] hw/riscv: virt: Add optional AIA APLIC support to
 virt machine
Date: Sat, 11 Dec 2021 09:49:13 +0530
Message-Id: <20211211041917.135345-20-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211041917.135345-1-anup.patel@wdc.com>
References: <20211211041917.135345-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86b65ed8-7b10-4f81-9fd2-08d9bc5da0d9
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB8268CE4539C064C38EEB287F8D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:163;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/THIdXUDNkkkyIgn+rrl/pg779CqJfy2S0oMP6KcRtkl96w4gLQTW/tWsyHNMHKjtm9kesPLhk/5bSOLFWi4xwKVQWHCltqnUjAIPVtb4H5uYyr59FBi4ajPDxH9ucEgmmKhFQ//18LHcAr5OP1Egy4r15pEYmyuguQonMsqd+LL7cKiN/zW2iQHCBn98Xr5Cql40okgDoSqXX9i6dw0dJ9wypi/+MzH9OUYhfrPXooHmd6Trt8TTV15lhyE5oiB+RakA1JncW5rHwZ57Iiz+UdnA0XKL/nJV3oTffG/KAkAed0IH0ex+vVmVLvBUyJ5r+ZAsV4thW0wVLsYliZrS1pcQDGKxGU5eoSAxZWCAnL/vFRQCna66WcAxSGnwb2L+/3zsdVHWv+vNh9uZmnnQS8n9QwRQekl/1ORhTCra3E2lti0eT2xXyBqjftQOIPuueFDVDTrcqtzk/tKimYhrEcXEfdl+LcJ/61CpFR50qf2ilshoBneA+5JOMCslIftGgVb9IteGdMdrHAojJbVEzaiuuuC7lNT4bvCLd8boWEUU1Hm78g0JAh6A6nnRcP3Nt/2jxD6FscM/0yN2Ok+P2HCpXa6ohhoYxX7D5YitBFNiRUkkcYZq1X7szB3u1ihzNgF2JZZrdea1KYowWl+bpJm3NL/xCYM9Gvn8fYDuS5pnfoJLxPpvpPIpbN1rFqSqyxjna9gcwzt3R/Sv9u5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(30864003)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d4uurYvL54FQtO6o9tKk9t33GHZt9750hK1Ppk/qWPZqafL7AR8aOVBA01gu?=
 =?us-ascii?Q?uOT2Bb9mtz4/gIThFsgylAVScL2VYWxz4bnDwqJul2n+ufYYB+qrlwyx/JsE?=
 =?us-ascii?Q?BjXXEQ/M/qvNK8bNMQPhjelXqafVbqrfgnVAjlYYeSm1ZQ8GkBIrpIQg+ngi?=
 =?us-ascii?Q?7RFOxPLp8m3uHYVF3O6dnMusgI3vd+tzmIxeMtUMivh1ODKSwY+6+629cMei?=
 =?us-ascii?Q?VVbIuFcwh/n8kaDyTOUSdXxVTMP+zJIcE05FDiOB/PUXi0UKWgFNzLUF9KPc?=
 =?us-ascii?Q?gddyEsxswNnPvMvgeu5wgDGn8GcheWJ+BxYo6FYAzNr0hsfbbwbKTdaJVi+g?=
 =?us-ascii?Q?9O9RCID/ZATNcS7CPNFs9noRxgNrRhUda0/s7uMoukItfClYcmxrasziaY2w?=
 =?us-ascii?Q?OvWlFvZk2ZQ/oYqYsEsdLwD4/VfiVpBQ9dtawidcY8SnN+5hrTPFhbdJTeK5?=
 =?us-ascii?Q?WwK68C3+kANptqf0NanOOlrsPuI9Syn8e0NUPBtk3I1+07CyWt6rMeIf74yO?=
 =?us-ascii?Q?S/NnZ5IMWQ2YxK2IL5EltfxlBylOTeIM+Jl64Ir0LoMNCl5GjC2yUyzA3a1m?=
 =?us-ascii?Q?5EN0ZIQMbO/cLnQGfRYyMU8z5Yeh4esNZSMJT6aPXfYP6lyvLng4eVE0ImGK?=
 =?us-ascii?Q?dzqniopQE5o8gmYa1p4jBMAD+m8lrg4kjAaSbLNv8teYXQt76b9XVx6TDejd?=
 =?us-ascii?Q?/XUH7B+RJWXD8k3q8RhzlQJVCUQPJssZpwDSooUHptWN+bMXthTHnCyu6eGG?=
 =?us-ascii?Q?mr8FW083TyRA5Q+orBzfVP1pOp2UbRQlKoSDsbquUH2Fnb1XgPcy7UcSu5gV?=
 =?us-ascii?Q?02wQv5r3rJ2jh/ZDPLrKkp83QV3H7Ekme2WIEwBWuxNDAx0yppsplCAAmRqq?=
 =?us-ascii?Q?TS220FI8Wp8AFWF0a4cOJr6zuNCIbDQSINoEu9PWgRZyH5zGXwRO++ksI2y0?=
 =?us-ascii?Q?BhOh4S+qM2bTKw8UrHprk05ZW4q8D9l1Kx4YImi20c+vrozniIgTnfh7m2v/?=
 =?us-ascii?Q?issZ3p+E7BMWrYQgP/oD3lgQZGgJxfq6aPP7WLwhYw2YDilXx8OXF2/TIKTf?=
 =?us-ascii?Q?KatDIzlAEnkxOiC/1z4N/T1sXb0JYtyRSMGjhvjUjgyAW6bguIvGvMiTEz4X?=
 =?us-ascii?Q?UqeAF3TlpBVOXjJLOHtHmG7TgiSqIyEN7EUulFsXntL1Wzgkw8VxvCWiecR5?=
 =?us-ascii?Q?UQgfp4JdzgtNA7qV91OPK7C5WNpA5mIKfs2a9iR1IYm1Ax2+VMXYE9Ehy1In?=
 =?us-ascii?Q?EhguVyiLOjtWj8wtzMR7nyuWVtPeZRF8Xtl6YTze5Tz3jeXO8FmQs03yr6IK?=
 =?us-ascii?Q?8LBNPp2YZ8ZmMiHRScw8izWEfDjiasfzymYOHlyDsCD+UwHxtys9WYcM2xwA?=
 =?us-ascii?Q?uH0fOowWRXDUUwhcybWcPUtLM0Cc0yWjsnHplLkkSRKwVCAfaMLZtg0yNoPR?=
 =?us-ascii?Q?YZR3V5tyY/rsdJfUI1TNq6XEQxzzZWwxWxumTus+ZEFaip/bR0sg3eX6tvcm?=
 =?us-ascii?Q?Wdk5pb6mtbM3sJmOzRlIlzgd+LR1gVmv1o3AJA8nEI3RU88yXb91a8kqWXPV?=
 =?us-ascii?Q?x91c3e86Gp0NFYvXEnL8WQSQWc1AQwiJy+PzhZPfZR3ycAs8IVyvcgTG5P3f?=
 =?us-ascii?Q?nHAZZUkE0ikx817EM3uquPs=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b65ed8-7b10-4f81-9fd2-08d9bc5da0d9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:56.9525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbHOxNIhu2JHXPPj0+Mrzfq5YiGBBjdlkJmak1ShmBJzXQA5j+/H6ZnrZhGpSWdBd1NOPu9GLHjIE9X/QmDbKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8268
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Sat, 11 Dec 2021 04:21:05 -0000

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
index 936156554c..8aa9f8a988 100644
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
+    [VIRT_APLIC_M] =     {  0xc000000, APLIC_SIZE(VIRT_CPUS_MAX) },
+    [VIRT_APLIC_S] =     {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
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
+        aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
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
@@ -757,18 +856,75 @@ static FWCfgState *create_fw_cfg(const MachineState *mc)
     return fw_cfg;
 }
 
+static DeviceState *virt_create_plic(const MemMapEntry *memmap, int socket,
+                                     int base_hartid, int hart_count)
+{
+    DeviceState *ret;
+    char *plic_hart_config;
+
+    /* Per-socket PLIC hart topology configuration string */
+    plic_hart_config = riscv_plic_hart_config_string(hart_count);
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
@@ -779,7 +935,7 @@ static void virt_machine_init(MachineState *machine)
     }
 
     /* Initialize sockets */
-    mmio_plic = virtio_plic = pcie_plic = NULL;
+    mmio_irqchip = virtio_irqchip = pcie_irqchip = NULL;
     for (i = 0; i < riscv_socket_count(machine); i++) {
         if (!riscv_socket_check_hartids(machine, i)) {
             error_report("discontinuous hartids in socket%d", i);
@@ -829,36 +985,27 @@ static void virt_machine_init(MachineState *machine)
                 base_hartid, hart_count, true);
         }
 
-        /* Per-socket PLIC hart topology configuration string */
-        plic_hart_config = riscv_plic_hart_config_string(hart_count);
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
 
@@ -957,7 +1104,7 @@ static void virt_machine_init(MachineState *machine)
     for (i = 0; i < VIRTIO_COUNT; i++) {
         sysbus_create_simple("virtio-mmio",
             memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size,
-            qdev_get_gpio_in(DEVICE(virtio_plic), VIRTIO_IRQ + i));
+            qdev_get_gpio_in(DEVICE(virtio_irqchip), VIRTIO_IRQ + i));
     }
 
     gpex_pcie_init(system_memory,
@@ -968,14 +1115,14 @@ static void virt_machine_init(MachineState *machine)
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
 
@@ -991,6 +1138,37 @@ static void virt_machine_instance_init(Object *obj)
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
@@ -1029,6 +1207,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
index b8ef99f348..43603a769c 100644
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
@@ -73,8 +81,9 @@ enum {
     VIRTIO_NDEV = 0x35 /* Arbitrary maximum number of interrupts */
 };
 
-#define VIRT_PLIC_NUM_SOURCES 127
-#define VIRT_PLIC_NUM_PRIORITIES 7
+#define VIRT_IRQCHIP_NUM_SOURCES 127
+#define VIRT_IRQCHIP_NUM_PRIO_BITS 3
+
 #define VIRT_PLIC_PRIORITY_BASE 0x04
 #define VIRT_PLIC_PENDING_BASE 0x1000
 #define VIRT_PLIC_ENABLE_BASE 0x2000
@@ -86,9 +95,14 @@ enum {
 
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


