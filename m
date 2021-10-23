Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meChg-0003cy-7R
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChX-0003OH-Pr; Sat, 23 Oct 2021 04:48:28 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChU-0007H2-6t; Sat, 23 Oct 2021 04:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978903; x=1666514903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=T8uzaFLPBg6czKLGT0WUHEYuqiI70L7zm/107lFdDjw=;
 b=iudIOZannu30nmq3YQBGHHvF7K55IyRgnjSXngOnCZghPaZoR6mBhL9y
 wZG7Lgeki9doupE3fn/H07OP1Y2vZk7/L3+Tav+i1rTYVDCQZZg/ZRP8X
 DcromMA0FuwTT5RIyRQ00M3U5/Wh0+5xGAjv59z6NhkU6WJn3BtGtTUQN
 HeN0l7McIFRAdJjCKPZb0U4cViy8gtLFk6AhO05+RitXE1DadoJS/fKyU
 iqFQhTKJhyD16EHv18SiuPhJg47wt+IjylZfpE5QMpxRrhvTeoZzIxu//
 lDW1DoXeBE9NUt5O44FWWaOcFveBpTRb7C/UaTKRtrTdyRytZC6q7Zc8y Q==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="188437389"
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:48:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=futGCBtenVWrOTxMp0sbqMTpmIxNtJdMeeyvQItD6Yxzr5wVrfy5H4teFRETloLgSnEJNd5Xh1Kfx+0xYNfJC6q+CSgnOxc+ZicVdWSekaGHFmt+feT07hNRR+76H6mYmqY5ai+mTncYCrckvMQx/CdrZRWLBa14/sxJ0splPTxOViC8z8gMYNcdYoB7sjH1izJhUzMPub55YJpwIjVE2GWqxV5XYraVBnEMA5rUENI1YeUYhFc5T+DTXcvXVPsKA90FBdseq+PXe3uJZQQpKjVFwjAl4jXYjhlPmmZHhojh7hKc8FP+kY4lgNwSA/e1tOtfd28HpC5CbIYTRgWXTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CXhq8zkmAtHMaUTZtIm/NrhBctS4MZ7WNweQodPMKk=;
 b=ZtReoWHrryWh5XPEHDvsl82wuyiDodzADSIJnEEHTCDMMWPpz39kRyz5b0bF/k3FsjrHhqFZHUnO4IyARfZZHtQnnSTS50rwwxGfkPeSNk/8mJefRNkf87E2dR34blFy/zV3xf18yxXudlnHMzqXrhNL3xq6Z1BU5ZhWAsSmQjCAAcgmaUJ/n7fXsfyJIXO3daVLgtzfuHukQ2jtwIZJ1zNiG5kRisNx1+vmWoWc7tXXSJcX+JqXY5YKvCgYWD6CNP1+HQ7xKjEyS0pLgJc6CnwzByuKSQfGd5q1Ab81HXYHOvOx5hECGYRT2ktWZy9sjEs14WqPXEVmRGltRZrXfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CXhq8zkmAtHMaUTZtIm/NrhBctS4MZ7WNweQodPMKk=;
 b=OFnT3lRaymcdYwT9pP+3p1e8/o7cVVDUr1yab6niDzUqZn4dv5NTSfYEItatvrnyycbmKIQvK5mQ3xMEeBbfxWGay4x9Grftndjv42ra5RY4qoorLbH9/4oSMXAojVTU4Qruc+1+K9yJnIUE5Y1ATHdEjopTlm5IoQ3kB3/zL98=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8409.namprd04.prod.outlook.com (2603:10b6:303:140::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Sat, 23 Oct
 2021 08:48:21 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:48:21 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 19/22] hw/riscv: virt: Add optional AIA APLIC support to
 virt machine
Date: Sat, 23 Oct 2021 14:16:35 +0530
Message-Id: <20211023084638.1697057-20-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211023084638.1697057-1-anup.patel@wdc.com>
References: <20211023084638.1697057-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.179.82.21) by
 MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:48:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d747de4-31be-45a8-6852-08d99601dda3
X-MS-TrafficTypeDiagnostic: CO6PR04MB8409:
X-Microsoft-Antispam-PRVS: <CO6PR04MB84090BE7BE484CCF0AA2018A8D819@CO6PR04MB8409.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:163;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y8uG24XSr3lZgwaHRbdLFVr5BHefdbGx0qyngIvBbfAa5fQRmGm45Z/kduLtwdRoi8FFaOAxtcR0zbi+9lBNxleuu1M1IaAsZ6kf+IttgzUbD4fxWYL9hnSdQ0Bmfxs7cOv1+UcuT1V6Ltiw/0VeNAq9c8/ArOyb0Dt8yG+PLkxr5qV1RRigdByNAsCSEv6XzFrdyDiwwv9Ha6PyHKyu2H66zwdM80yXWkfA3BDfLq1lrDYzAC55b3Nl5KAJ1iiKQrm4mhSnAUq4h3b2iHvJUtFKAXE2linEq8/gY/WZ1YQ4i2aQ6q2sRQjoP9M7aYFi/9UbQ+K4cBjhfXdMXqpowm9gCD7vitH8XdqkV/1mlYuuml1WMrrHZbq6XumVU896QztSF9f3iAVZGkgB5TiuBVitoBZh6LtZ7R3oUdRZderQA/j+0ZFLDgJK6lGIzXwcr1qWkEElT8dfIpNwM3dKCiGT8ZDk+DV6goQxazbngYIXD0P5LbU4XWsFG0Roj70qq9XXqSzXvdplnJ60XxHTcn+nbTZtRQzpahPb1D5ZPDfygP7C3/RUZZzLM1CnxIHm6eQ8dXPy0/WDACECwd1hSXrqhS14k0iXqegmRCyzhxLHG9pBlwNaNSKoG0JJ4veuJH8JJi0KHLXakOIzjTo7fAHmasCRcK+8hVF5WtxEooy37Z50UHvcv4MgptgPxFWZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(1076003)(66556008)(83380400001)(44832011)(186003)(6666004)(30864003)(66476007)(2616005)(8886007)(316002)(66946007)(36756003)(4326008)(26005)(110136005)(54906003)(38100700002)(55016002)(8676002)(956004)(7696005)(52116002)(38350700002)(508600001)(2906002)(5660300002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZAhheEYykZSo6+wUF00/RneK4Y9mRpYyTtKhkk7Z2rFqLm8eKox/lhI+mISe?=
 =?us-ascii?Q?pC65yNkSnia5OtNBIV0xu4SJMhww4+C6RiqmU0y/D2O8dwJv4LpFCSCOrQe9?=
 =?us-ascii?Q?dRNHta9NlLSgVYJiP9skLXyZ4IGXMvf7oYDXxEhHirLtQydUinFG9G6WdHN3?=
 =?us-ascii?Q?GKL6ynI3iTF8rrNzlMnus9qT9DkgAzQ0YGGuk6Ionth7PQtLlkTE68O+bBrc?=
 =?us-ascii?Q?TqN8SJP9yn7glIX24AB7blLJT+nerXOxcQndLmDR1yZHfG20liTrO8We/2VO?=
 =?us-ascii?Q?ZA1NX2meOoJxEksDnmz+BfrzR1DgOlKXAO9JtKhrWMkwo4lKs4bY3dH9cOvW?=
 =?us-ascii?Q?lXtLD/2OoClMN2ixmW0xWrkrvejQplMbMznb0opor1rrXYcUrgchKBOORMOb?=
 =?us-ascii?Q?HvSEP7e7ufmp8KlCR1niV+5RKUYqFkFStm6i0IfTJtmpJcGiwSi3rOc9Mkkq?=
 =?us-ascii?Q?boV8dmLoDsVEHDxeKWY7E7lNdZ+cpdyoM4l5eywYzSvJTzsnLUWYTJLz5hHD?=
 =?us-ascii?Q?3XLTsnrC7gWmkHJMkCjQoVKYkEfYclbIVvSYQ6HL5ZJVtMDi67+nxBrqjGxJ?=
 =?us-ascii?Q?NSscc2/BNv4kGAJA7JgSKKgE+HCvsmofcb4uYZe9xHbOav3TQGmW5ZakhUqC?=
 =?us-ascii?Q?ZMOCABq2WrdfRu7H0tET5yp0hxhm3d7XFii2yuKQc3NN+p4uOIXKosa/U8Yy?=
 =?us-ascii?Q?rY8jmxLj4NLU6l//2bvxWHqXXjwzGTOoVCAZXQfNoJB8c84m20lTa46TpOga?=
 =?us-ascii?Q?xh+vpIxmhoDWsrVJCBWg65v4U85iYmQqG2X7p4azOh3HOecySetdud1qpIEu?=
 =?us-ascii?Q?+aBBQw9ZjWxD8Tngh/CWlIXF1Z5mz2VIlcmjYZFhY3yf+APwW9aeQgGBsci9?=
 =?us-ascii?Q?b+squYVVj5ubf71fKqoTsAv02bhzmTiDBOubyXwDlCTl+GG40SuyJAUqm22t?=
 =?us-ascii?Q?xPLAfGwP6mOkEX8nTGp+K1XuuoJXAu7zfFvDLLKgRaIftvC8CcoJExzwsihn?=
 =?us-ascii?Q?gq7h18ENb4f42RVQHppZPIE1n7kFEvkF8px0a2NuAFMmYDMnPoohpjrfU4LK?=
 =?us-ascii?Q?/ysh+JaVZQwCwyQOtT8jqXeOu1qdMqf6xksVY/KiE2hgLJMNbF9xbvX2pTHJ?=
 =?us-ascii?Q?4iUoP+pRP0UOyp99rdg1wtFG/yHq6s153WbSg/J6z9ysLYGO2sm9ZzZr2TvN?=
 =?us-ascii?Q?puic2MmK2134CNJNdi3rrsn7hTn9L0PBPo9PlvY0GWvBwMVrnRNLVAGkvjLq?=
 =?us-ascii?Q?urVc54KRxZxZE6tOCrYK5WALiRcz6DQgHo0Kd5Heb7dmnBg6y9Bt77X8GAOZ?=
 =?us-ascii?Q?ksMuto2Y8axVAuXsAZA88shtCbhLUORkNHqSkFy/Tj0BVR5gsLdKuIxxsZLn?=
 =?us-ascii?Q?6q24wXmrVvsaZraf4Uun7nD01O3Zru8Y2LGHUsj4PiOYoPROGVCBaNZrK44s?=
 =?us-ascii?Q?rpIIqyMzCU3W2wyHxa8A8S+vW+tPlBJiGyFr8fVLtyhW2cKfvH1kxHYZ2EUa?=
 =?us-ascii?Q?+KI3GJZcZtU/qwERUjFKHdbdIhwvBJEv1JYBUoOiCfPfMlCRAUK20JaRGwYe?=
 =?us-ascii?Q?pou78qjbK9Ar9hO6GQeRPIqG6Rk3aWPTkFsvrFEqh5lZa/XCwumfnYtl2f95?=
 =?us-ascii?Q?Y2bxZ88og+VeCc8fuQZUyU0=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d747de4-31be-45a8-6852-08d99601dda3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:48:20.8876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJ9+bZOpiB1aZOh/XTE5otxZ9fudt76mcORvCgMMpEdT2+sML/9hWrWd5uNwFabsQRxvJJQoAOyNRO/IgmZ/Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8409
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=92346df24=Anup.Patel@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Sat, 23 Oct 2021 08:48:28 -0000

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
index 83f784bdee..48ce616432 100644
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
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "aplic,num-sources",
+        VIRT_IRQCHIP_NUM_SOURCES);
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "aplic,children",
+        aplic_s_phandle);
+    qemu_fdt_setprop_cells(mc->fdt, aplic_name, "aplic,delegate",
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
+    qemu_fdt_setprop_cell(mc->fdt, aplic_name, "aplic,num-sources",
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


