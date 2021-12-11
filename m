Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtso-00074m-0z
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:21:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsl-0006zO-AN; Fri, 10 Dec 2021 23:21:11 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:26535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsh-0001oI-6S; Fri, 10 Dec 2021 23:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196466; x=1670732466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aK0D0TKpK6IPA6eplhquvuZr+86wF5qaLTaxQ0Z38y4=;
 b=DxcLERo6TVTkNqpaGY5fzkU67kMpMec6smfoudk5D9ZlnbsNVXfTQ9H5
 j/EsQKKH+Qi9EZGguSK9TQqqp9dkufKa9zJysS8tC/OkVbehiGkaEBcU9
 megDUPexKZrRVuGBXZnT1n12Oj0IcA4rAnoXhJO92bkCDU3BrfpXXzK52
 WJ5i1u6EHBkLfbrvQ2pdBVeSGEcQZNvWXA2wTyoutYvYd8Rsfmsok59aJ
 FoRTceWh/vgtjVVUfgcw1bPOBZReWzC3W5KboLTDijdXO4ppAbfIT9VzN
 We0mItzte0kEh4QmnbOP3MP2iwj5g1iF0zKTc18+9igvI+wtzK66YbOYh Q==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="187989971"
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:21:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lay2wk7+FRyu/XLUtSn9uP+HGDLn0qRMgUWA8R3MoKuMVLK1OGQ2u/Rp40ERnKpgas5C2kJTK/AHlaw3NvzdNYRATybXqEcgqLfr3yoGnh7sWeYjsG5yCUA4UuHfRXbXiV+y5AHA/c0I6s+R81JB/QG2Us8b+J9R6ssMEnQLuqXP0tHD2zLwA2jWrDMY6GpdZvO4cTtvJLyNa2LK/6K2lkAanN+FuZJ0p69iucAf0SAfsX4VawJIG+hrkq6wHg7PSRcJ0BjbdF+iIEMCU0nirayk2LajzGWxEVOmSSlTdYr1MDLGB0zGExzwf66kHa4IBdB7YZqvcKe4kd1TArAbPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgRnhl/5gJAgzDhY/BbjiB0pEvExLwRQbRJ4/osgkNY=;
 b=XGzqYSxAX0qkr8XdfUGXNEml+O7l2FU0f2USu2b1ruwNkxm/Q/0frSW3tMZuUVPXBoF0JagjZv+e84W83HTwGr9cFew+yknAD2Hgsg59OAM2Cl4jE9QRK4pPuHuipUSScxW9NTJzVb7lZlWn+5zVYxxI37rDyQk/Ajtc5KwxQBjH86ItdOjzcJtUUzyhdAN5Z7UZKjLT3+zb/NwcnEzEhoNDLgKZe5m7NnuLKhRTcIGFvy4THBC7fV3bEwtBr2tuIDY2Ys0VID5+GBMZQN6GwAWzVnGfpADzT2/ivaTlIPHOnaH80bJ3zFvJC8tldnekLVF+gwFm8Nu/yJix8CCN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgRnhl/5gJAgzDhY/BbjiB0pEvExLwRQbRJ4/osgkNY=;
 b=rEcJXN1qwWVSTruLVTscjNo08Y1kO49bISO2w5DTNGuINiYdkNcH5KUyziQYbkI3eugb0Plz63/Y6JoYqrBd2YpyoiJkh8nMdj2Z0nxSoOKZRVueidB/13dIrm7gTMS3uBqRflHg21kVyCKzFUqzrr2B6BnMYN0Q8A4r5Mt/Awo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:21:03 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:21:03 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 21/23] hw/riscv: virt: Add optional AIA IMSIC support to
 virt machine
Date: Sat, 11 Dec 2021 09:49:15 +0530
Message-Id: <20211211041917.135345-22-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2158b769-a124-4a8e-5f15-08d9bc5da485
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB826869FB505D5967BC3204678D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4/vVpJqszM/sfQD0wTAGPGzpYM+z9GabEgfSotiPcut3/uM1UesA65M+XsLlu2iL9MmGVYfqv2QTCzbVp3S2G7+CbB1XYtOgEAJoxxVwV8XXp4Kd7a3jVU+GButdGL8EeJ2jf/uLndePqGomAPq92xxJNJ/njzJ7oX/GSwPwosrFniPEjXBaCz1JKw9QNLAeTNbCTE9rF4EhetMrBejnai17l40T+1s+42ecejNcJtChoHAFSkpT0ezSXAF1g8BqwlmT54fFF6FuBeKO+gcHIduqLbms9pRoCQhXy0wlhAgFKZn7N0sg112R9YFTJN4MnfkLbfX2TVD8CEt+pJyXKONcZmFWQZ5qa2kjrkGfJ+rxPfK/3NvfSgwuAo6vswQhtzYJknLpQCSO8GjviF5Oc66p+djSV4aIpOE304tR0eOam9CJoCAUa+iVKAQh94JCf0PmD/zQ2kJ2VJ0Z5iBNS9+EUarztCWS52vNcH2rkZmaJ7L/pAtLrQ2kL7DehYMI+efYLer+sf9ti5n9YfiQYdAUIfdUmZwDwb4BJMaUCs9cUn3aKcCKJ2i3iFmZCJJqqCgOFeF0Fi5kTY6FKx7KQRenvexnXv0XfXlQ72QnZBIJQKUZCexhTu7A23qvpYOvRo26MjDjz0B+eLymeAv6go/OyBO8p1uwZK/BZq9NU7uJL2sRcfu3aqK0t9qUVtqW4WSsvBrVW8ldM2v23my3cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(30864003)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KggpMcbWRMqGWUVHvmx3EjqHin0jZ8F7OeBLLULiL3kH+kPBid4bcLcyr05F?=
 =?us-ascii?Q?hrfkGiV4RrFki57yt8Y3Ji6MYQzJWjyzEhAalyejuDG8DI7C6L0QEvLCE/Mz?=
 =?us-ascii?Q?jlmpf8ddmG8CVqXFnGFc6EE/w3eMTYmiODPIiI9kIFEMv9AFas+Ng9DHyoTC?=
 =?us-ascii?Q?6wafrZ3ptHsaUZQJIbpz4j2iFexJSTqAzhcnMFpEa/oTOCZeY5xKUncR+7DM?=
 =?us-ascii?Q?0bP3mkWXt+Jm68yFYdaIe1ahRd8dZI2U21wxHmrWKTKqaFeIjptZGJRIptgc?=
 =?us-ascii?Q?I9rM/0WGLYNei9Akc1/pzEMslEW4kJ3rj/efMP0vyeG82laoZX/Kf4ru+qWk?=
 =?us-ascii?Q?BQKxG+23RK83mcSHdE+P1s/EIhP923gL9BH87BEyrNPyNDOus23QiA0rbptt?=
 =?us-ascii?Q?4MEgwHyCIxUfovtnjAeddwcl0ebo5jm3xSliRXBzhWjrxv+HbE/yq1jIgBfT?=
 =?us-ascii?Q?vDyjfSvZKhtbOXkPKRCfz6h8bObSJl5gU3LfAqHiJxB//5MjAQ+hLnz55z7X?=
 =?us-ascii?Q?DzXKVu21UuvhJxbzFro5iySdBBypD2MX4BF96AzwrAegF0HKu3RPya5Mw0PQ?=
 =?us-ascii?Q?0r967s8AyYKpC0os1dHBKciRcyrVQQpixNx90a0gOAj5D4u9NQ89IOevAIaa?=
 =?us-ascii?Q?UTMGThJhnbHNpGvfgMVrKAhS7n/jFOM3xoBT4Hi7sbuqbFBseGuD0mnGHLX1?=
 =?us-ascii?Q?tHU1lVkoJat/8nTO5qoDau90V35HPGwuCvJH1vIxYWv9VSnPq1GtQhgdRAo3?=
 =?us-ascii?Q?9BFVSQoEuy0+MtkEyGFTzrfedVTxWPkDlFpfsW0JT3thFVJiuVxVTh2D/TXE?=
 =?us-ascii?Q?id5isX0mTxAk0vbFlK/SEGuw1V0plhHgQgCl2sqrhlF9p2dySNWaG+e+ESi9?=
 =?us-ascii?Q?mgqLG3uqQdEKiBefRIjdVAwrpOUbLjjEaRNH+kY19yhtrBGm81/+KF+8P7QM?=
 =?us-ascii?Q?IztIpy8/cxutLkrxEm8XSAHRSXF9XhefNMUXOzH/M3o21lhzyZLP2YYmWfmL?=
 =?us-ascii?Q?ZUtW+GJgCuoG/RbtDsJs51WaIpgAxlcktmA4DJpYo9sr/SVLI+i+nr5BmuSw?=
 =?us-ascii?Q?Z8/vWeV79jLnmbPoC2MPG7EWT0A6mCCjoyqtrYfAdafd9dOB2UxmFUsedjcJ?=
 =?us-ascii?Q?gVkxgnkZk9aYnudb7XRzurzeTRXdY14AKXS2wbu3vB/8DNshsYv7nlbUCTEP?=
 =?us-ascii?Q?joMgTb59ZV2zc1y5bKbXUtyy+dkBzWXPYiG/2qH4NQ39GEmqWX6rfeFw3Bdj?=
 =?us-ascii?Q?bGcs2kN7I3ef2lA8xNIZ4xOwSQG6aYoBQRt9Nk3RaFVxBoGnpOkGyg5eDt1+?=
 =?us-ascii?Q?wovnI6hdQ92sb4cFl5HcErWObs40yyGITCBCe2Ys7bzIC9WI0ZmVhVhN75ni?=
 =?us-ascii?Q?/vxwWAGQLytHuFe7ZQnf+iSXMPMoL/EZDcXw2Zn0b0BqnyKSg6N3GtoLMSJG?=
 =?us-ascii?Q?y6eFD/0kjHx3EQGNYohrXGfD6Z+sPmwb2bKTGRjvSbrhu96PHlSUaRKGBh0D?=
 =?us-ascii?Q?D8iztTBdstcevR0s7iiRqsYNWIAGVqrSIgIACAmRR30DdBjG7hf8PzGHrSUc?=
 =?us-ascii?Q?k3s2zIIzXRUjJMac/5sa4378q0Vc+mozqpg1xBJ7iIk6eFyHwxapAv4tbvDv?=
 =?us-ascii?Q?SsreewayWN6yes0lzwV7vSs=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2158b769-a124-4a8e-5f15-08d9bc5da485
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:21:03.1600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 976DrRoc0oS3UE7TBaANk6CHnUSUW7KC4UVMaMLwWDS4KwRwW3d5YRNAxG3FFXPgHh2+JCqQlq2AHLVTMRuq1g==
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
X-List-Received-Date: Sat, 11 Dec 2021 04:21:12 -0000

We extend virt machine to emulate both AIA IMSIC and AIA APLIC
devices only when "aia=aplic-imsic" parameter is passed along
with machine name in the QEMU command-line. The AIA IMSIC is
only a per-HART MSI controller so we use AIA APLIC in MSI-mode
to forward all wired interrupts as MSIs to the AIA IMSIC.

We also provide "aia-guests=<xyz>" parameter which can be used
to specify number of VS-level AIA IMSIC Guests MMIO pages for
each HART.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/riscv/Kconfig        |   1 +
 hw/riscv/virt.c         | 434 ++++++++++++++++++++++++++++++++--------
 include/hw/riscv/virt.h |  18 +-
 3 files changed, 369 insertions(+), 84 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index c30bb7cb6c..91bb9d21c4 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -43,6 +43,7 @@ config RISCV_VIRT
     select SERIAL
     select RISCV_ACLINT
     select RISCV_APLIC
+    select RISCV_IMSIC
     select SIFIVE_PLIC
     select SIFIVE_TEST
     select VIRTIO_MMIO
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8aa9f8a988..74e9e333d1 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -34,6 +34,7 @@
 #include "hw/riscv/numa.h"
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/riscv_aplic.h"
+#include "hw/intc/riscv_imsic.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "chardev/char.h"
@@ -43,6 +44,18 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
 
+#define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
+#if VIRT_IMSIC_GROUP_MAX_SIZE < \
+    IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
+#error "Can't accomodate single IMSIC group in address space"
+#endif
+
+#define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
+                                        VIRT_IMSIC_GROUP_MAX_SIZE)
+#if 0x4000000 < VIRT_IMSIC_MAX_SIZE
+#error "Can't accomodate all IMSIC groups in address space"
+#endif
+
 static const MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =       {        0x0,         0x100 },
     [VIRT_MROM] =        {     0x1000,        0xf000 },
@@ -58,6 +71,8 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
     [VIRT_FW_CFG] =      { 0x10100000,          0x18 },
     [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
+    [VIRT_IMSIC_M] =     { 0x24000000, VIRT_IMSIC_MAX_SIZE },
+    [VIRT_IMSIC_S] =     { 0x28000000, VIRT_IMSIC_MAX_SIZE },
     [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
     [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
     [VIRT_DRAM] =        { 0x80000000,           0x0 },
@@ -309,7 +324,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
 {
     int cpu;
     char *name;
-    unsigned long addr;
+    unsigned long addr, size;
     uint32_t aclint_cells_size;
     uint32_t *aclint_mswi_cells;
     uint32_t *aclint_sswi_cells;
@@ -330,29 +345,38 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
     }
     aclint_cells_size = s->soc[socket].num_harts * sizeof(uint32_t) * 2;
 
-    addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
-    name = g_strdup_printf("/soc/mswi@%lx", addr);
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "riscv,aclint-mswi");
-    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
-        0x0, addr, 0x0, RISCV_ACLINT_SWI_SIZE);
-    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
-        aclint_mswi_cells, aclint_cells_size);
-    qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
-    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
-    g_free(name);
+    if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
+        addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
+        name = g_strdup_printf("/soc/mswi@%lx", addr);
+        qemu_fdt_add_subnode(mc->fdt, name);
+        qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+            "riscv,aclint-mswi");
+        qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+            0x0, addr, 0x0, RISCV_ACLINT_SWI_SIZE);
+        qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+            aclint_mswi_cells, aclint_cells_size);
+        qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
+        riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+        g_free(name);
+    }
 
-    addr = memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
-        (memmap[VIRT_CLINT].size * socket);
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        addr = memmap[VIRT_CLINT].base +
+               (RISCV_ACLINT_DEFAULT_MTIMER_SIZE * socket);
+        size = RISCV_ACLINT_DEFAULT_MTIMER_SIZE;
+    } else {
+        addr = memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
+            (memmap[VIRT_CLINT].size * socket);
+        size = memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE;
+    }
     name = g_strdup_printf("/soc/mtimer@%lx", addr);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible",
         "riscv,aclint-mtimer");
     qemu_fdt_setprop_cells(mc->fdt, name, "reg",
         0x0, addr + RISCV_ACLINT_DEFAULT_MTIME,
-        0x0, memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE -
-             RISCV_ACLINT_DEFAULT_MTIME,
+        0x0, size - RISCV_ACLINT_DEFAULT_MTIME,
         0x0, addr + RISCV_ACLINT_DEFAULT_MTIMECMP,
         0x0, RISCV_ACLINT_DEFAULT_MTIME);
     qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
@@ -360,19 +384,22 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
     riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
     g_free(name);
 
-    addr = memmap[VIRT_ACLINT_SSWI].base +
-        (memmap[VIRT_ACLINT_SSWI].size * socket);
-    name = g_strdup_printf("/soc/sswi@%lx", addr);
-    qemu_fdt_add_subnode(mc->fdt, name);
-    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "riscv,aclint-sswi");
-    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
-        0x0, addr, 0x0, memmap[VIRT_ACLINT_SSWI].size);
-    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
-        aclint_sswi_cells, aclint_cells_size);
-    qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
-    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
-    g_free(name);
+    if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
+        addr = memmap[VIRT_ACLINT_SSWI].base +
+            (memmap[VIRT_ACLINT_SSWI].size * socket);
+        name = g_strdup_printf("/soc/sswi@%lx", addr);
+        qemu_fdt_add_subnode(mc->fdt, name);
+        qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+            "riscv,aclint-sswi");
+        qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+            0x0, addr, 0x0, memmap[VIRT_ACLINT_SSWI].size);
+        qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+            aclint_sswi_cells, aclint_cells_size);
+        qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
+        riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+        g_free(name);
+    }
 
     g_free(aclint_mswi_cells);
     g_free(aclint_mtimer_cells);
@@ -425,10 +452,145 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     g_free(plic_cells);
 }
 
-static void create_fdt_socket_aia(RISCVVirtState *s,
-                                  const MemMapEntry *memmap, int socket,
-                                  uint32_t *phandle, uint32_t *intc_phandles,
-                                  uint32_t *aplic_phandles)
+static uint32_t imsic_num_bits(uint32_t count)
+{
+    uint32_t ret = 0;
+
+    while (BIT(ret) < count) {
+        ret++;
+    }
+
+    return ret;
+}
+
+static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
+                             uint32_t *phandle, uint32_t *intc_phandles,
+                             uint32_t *msi_m_phandle, uint32_t *msi_s_phandle)
+{
+    int cpu, socket;
+    char *imsic_name;
+    MachineState *mc = MACHINE(s);
+    uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
+    uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
+
+    *msi_m_phandle = (*phandle)++;
+    *msi_s_phandle = (*phandle)++;
+    imsic_cells = g_new0(uint32_t, mc->smp.cpus * 2);
+    imsic_regs = g_new0(uint32_t, riscv_socket_count(mc) * 4);
+
+    /* M-level IMSIC node */
+    for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
+        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
+    }
+    imsic_max_hart_per_socket = 0;
+    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+        imsic_addr = memmap[VIRT_IMSIC_M].base +
+                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
+        imsic_regs[socket * 4 + 0] = 0;
+        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
+        imsic_regs[socket * 4 + 2] = 0;
+        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
+        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
+            imsic_max_hart_per_socket = s->soc[socket].num_harts;
+        }
+    }
+    imsic_name = g_strdup_printf("/soc/imsics@%lx",
+        memmap[VIRT_IMSIC_M].base);
+    qemu_fdt_add_subnode(mc->fdt, imsic_name);
+    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
+        "riscv,imsics");
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
+        FDT_IMSIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
+        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
+        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
+        VIRT_IRQCHIP_NUM_MSIS);
+    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-range",
+        VIRT_IRQCHIP_BASE_IPI, VIRT_IRQCHIP_NUM_IPIS);
+    if (riscv_socket_count(mc) > 1) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
+            imsic_num_bits(imsic_max_hart_per_socket));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
+            imsic_num_bits(riscv_socket_count(mc)));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
+            IMSIC_MMIO_GROUP_MIN_SHIFT);
+    }
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
+    g_free(imsic_name);
+
+    /* S-level IMSIC node */
+    for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
+        imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
+    }
+    imsic_guest_bits = imsic_num_bits(s->aia_guests + 1);
+    imsic_max_hart_per_socket = 0;
+    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+        imsic_addr = memmap[VIRT_IMSIC_S].base +
+                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
+                     s->soc[socket].num_harts;
+        imsic_regs[socket * 4 + 0] = 0;
+        imsic_regs[socket * 4 + 1] = cpu_to_be32(imsic_addr);
+        imsic_regs[socket * 4 + 2] = 0;
+        imsic_regs[socket * 4 + 3] = cpu_to_be32(imsic_size);
+        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
+            imsic_max_hart_per_socket = s->soc[socket].num_harts;
+        }
+    }
+    imsic_name = g_strdup_printf("/soc/imsics@%lx",
+        memmap[VIRT_IMSIC_S].base);
+    qemu_fdt_add_subnode(mc->fdt, imsic_name);
+    qemu_fdt_setprop_string(mc->fdt, imsic_name, "compatible",
+        "riscv,imsics");
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "#interrupt-cells",
+        FDT_IMSIC_INT_CELLS);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupt-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "msi-controller",
+        NULL, 0);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
+        imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
+    qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
+        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
+        VIRT_IRQCHIP_NUM_MSIS);
+    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-range",
+        VIRT_IRQCHIP_BASE_IPI, VIRT_IRQCHIP_NUM_IPIS);
+    if (imsic_guest_bits) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bits",
+            imsic_guest_bits);
+    }
+    if (riscv_socket_count(mc) > 1) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
+            imsic_num_bits(imsic_max_hart_per_socket));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
+            imsic_num_bits(riscv_socket_count(mc)));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
+            IMSIC_MMIO_GROUP_MIN_SHIFT);
+    }
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_s_phandle);
+    g_free(imsic_name);
+
+    g_free(imsic_regs);
+    g_free(imsic_cells);
+}
+
+static void create_fdt_socket_aplic(RISCVVirtState *s,
+                                    const MemMapEntry *memmap, int socket,
+                                    uint32_t msi_m_phandle,
+                                    uint32_t msi_s_phandle,
+                                    uint32_t *phandle,
+                                    uint32_t *intc_phandles,
+                                    uint32_t *aplic_phandles)
 {
     int cpu;
     char *aplic_name;
@@ -454,8 +616,13 @@ static void create_fdt_socket_aia(RISCVVirtState *s,
     qemu_fdt_setprop_cell(mc->fdt, aplic_name,
         "#interrupt-cells", FDT_APLIC_INT_CELLS);
     qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
-        aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
+        qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    } else {
+        qemu_fdt_setprop_cell(mc->fdt, aplic_name, "msi-parent",
+            msi_m_phandle);
+    }
     qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
         0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
@@ -481,8 +648,13 @@ static void create_fdt_socket_aia(RISCVVirtState *s,
     qemu_fdt_setprop_cell(mc->fdt, aplic_name,
         "#interrupt-cells", FDT_APLIC_INT_CELLS);
     qemu_fdt_setprop(mc->fdt, aplic_name, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
-        aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC) {
+        qemu_fdt_setprop(mc->fdt, aplic_name, "interrupts-extended",
+            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 2);
+    } else {
+        qemu_fdt_setprop_cell(mc->fdt, aplic_name, "msi-parent",
+            msi_s_phandle);
+    }
     qemu_fdt_setprop_cells(mc->fdt, aplic_name, "reg",
         0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_S].size);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
@@ -499,13 +671,14 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
                                bool is_32_bit, uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
                                uint32_t *irq_pcie_phandle,
-                               uint32_t *irq_virtio_phandle)
+                               uint32_t *irq_virtio_phandle,
+                               uint32_t *msi_pcie_phandle)
 {
-    int socket;
     char *clust_name;
-    uint32_t *intc_phandles;
+    int socket, phandle_pos;
     MachineState *mc = MACHINE(s);
-    uint32_t xplic_phandles[MAX_NODES];
+    uint32_t msi_m_phandle = 0, msi_s_phandle = 0;
+    uint32_t *intc_phandles, xplic_phandles[MAX_NODES];
 
     qemu_fdt_add_subnode(mc->fdt, "/cpus");
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
@@ -514,35 +687,53 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(mc->fdt, "/cpus/cpu-map");
 
+    intc_phandles = g_new0(uint32_t, mc->smp.cpus);
+
+    phandle_pos = mc->smp.cpus;
     for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
+        phandle_pos -= s->soc[socket].num_harts;
+
         clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
         qemu_fdt_add_subnode(mc->fdt, clust_name);
 
-        intc_phandles = g_new0(uint32_t, s->soc[socket].num_harts);
-
         create_fdt_socket_cpus(s, socket, clust_name, phandle,
-            is_32_bit, intc_phandles);
+            is_32_bit, &intc_phandles[phandle_pos]);
 
         create_fdt_socket_memory(s, memmap, socket);
 
+        g_free(clust_name);
+
         if (s->have_aclint) {
-            create_fdt_socket_aclint(s, memmap, socket, intc_phandles);
+            create_fdt_socket_aclint(s, memmap, socket,
+                &intc_phandles[phandle_pos]);
         } else {
-            create_fdt_socket_clint(s, memmap, socket, intc_phandles);
+            create_fdt_socket_clint(s, memmap, socket,
+                &intc_phandles[phandle_pos]);
         }
+    }
+
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        create_fdt_imsic(s, memmap, phandle, intc_phandles,
+            &msi_m_phandle, &msi_s_phandle);
+        *msi_pcie_phandle = msi_s_phandle;
+    }
+
+    phandle_pos = mc->smp.cpus;
+    for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
+        phandle_pos -= s->soc[socket].num_harts;
 
         if (s->aia_type == VIRT_AIA_TYPE_NONE) {
             create_fdt_socket_plic(s, memmap, socket, phandle,
-                intc_phandles, xplic_phandles);
+                &intc_phandles[phandle_pos], xplic_phandles);
         } else {
-            create_fdt_socket_aia(s, memmap, socket, phandle,
-                intc_phandles, xplic_phandles);
+            create_fdt_socket_aplic(s, memmap, socket,
+                msi_m_phandle, msi_s_phandle, phandle,
+                &intc_phandles[phandle_pos], xplic_phandles);
         }
-
-        g_free(intc_phandles);
-        g_free(clust_name);
     }
 
+    g_free(intc_phandles);
+
     for (socket = 0; socket < riscv_socket_count(mc); socket++) {
         if (socket == 0) {
             *irq_mmio_phandle = xplic_phandles[socket];
@@ -590,7 +781,8 @@ static void create_fdt_virtio(RISCVVirtState *s, const MemMapEntry *memmap,
 }
 
 static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap,
-                            uint32_t irq_pcie_phandle)
+                            uint32_t irq_pcie_phandle,
+                            uint32_t msi_pcie_phandle)
 {
     char *name;
     MachineState *mc = MACHINE(s);
@@ -610,6 +802,9 @@ static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cells(mc->fdt, name, "bus-range", 0,
         memmap[VIRT_PCIE_ECAM].size / PCIE_MMCFG_SIZE_MIN - 1);
     qemu_fdt_setprop(mc->fdt, name, "dma-coherent", NULL, 0);
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        qemu_fdt_setprop_cell(mc->fdt, name, "msi-parent", msi_pcie_phandle);
+    }
     qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0,
         memmap[VIRT_PCIE_ECAM].base, 0, memmap[VIRT_PCIE_ECAM].size);
     qemu_fdt_setprop_sized_cells(mc->fdt, name, "ranges",
@@ -735,7 +930,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     MachineState *mc = MACHINE(s);
-    uint32_t phandle = 1, irq_mmio_phandle = 1;
+    uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
     uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
 
     if (mc->dtb) {
@@ -765,11 +960,12 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, "/soc", "#address-cells", 0x2);
 
     create_fdt_sockets(s, memmap, is_32_bit, &phandle,
-        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle);
+        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle,
+        &msi_pcie_phandle);
 
     create_fdt_virtio(s, memmap, irq_virtio_phandle);
 
-    create_fdt_pcie(s, memmap, irq_pcie_phandle);
+    create_fdt_pcie(s, memmap, irq_pcie_phandle, msi_pcie_phandle);
 
     create_fdt_reset(s, memmap, &phandle);
 
@@ -884,30 +1080,55 @@ static DeviceState *virt_create_plic(const MemMapEntry *memmap, int socket,
     return ret;
 }
 
-static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type,
+static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
                                     const MemMapEntry *memmap, int socket,
                                     int base_hartid, int hart_count)
 {
+    int i;
+    hwaddr addr;
+    uint32_t guest_bits;
     DeviceState *aplic_m;
+    bool msimode = (aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) ? true : false;
+
+    if (msimode) {
+        /* Per-socket M-level IMSICs */
+        addr = memmap[VIRT_IMSIC_M].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        for (i = 0; i < hart_count; i++) {
+            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
+                               base_hartid + i, true, 1,
+                               VIRT_IRQCHIP_NUM_MSIS);
+        }
+
+        /* Per-socket S-level IMSICs */
+        guest_bits = imsic_num_bits(aia_guests + 1);
+        addr = memmap[VIRT_IMSIC_S].base + socket * VIRT_IMSIC_GROUP_MAX_SIZE;
+        for (i = 0; i < hart_count; i++) {
+            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(guest_bits),
+                               base_hartid + i, false, 1 + aia_guests,
+                               VIRT_IRQCHIP_NUM_MSIS);
+        }
+    }
 
     /* Per-socket M-level APLIC */
     aplic_m = riscv_aplic_create(
         memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size,
         memmap[VIRT_APLIC_M].size,
-        base_hartid, hart_count,
+        (msimode) ? 0 : base_hartid,
+        (msimode) ? 0 : hart_count,
         VIRT_IRQCHIP_NUM_SOURCES,
         VIRT_IRQCHIP_NUM_PRIO_BITS,
-        false, true, NULL);
+        msimode, true, NULL);
 
     if (aplic_m) {
         /* Per-socket S-level APLIC */
         riscv_aplic_create(
             memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S].size,
             memmap[VIRT_APLIC_S].size,
-            base_hartid, hart_count,
+            (msimode) ? 0 : base_hartid,
+            (msimode) ? 0 : hart_count,
             VIRT_IRQCHIP_NUM_SOURCES,
             VIRT_IRQCHIP_NUM_PRIO_BITS,
-            false, false, aplic_m);
+            msimode, false, aplic_m);
     }
 
     return aplic_m;
@@ -966,23 +1187,38 @@ static void virt_machine_init(MachineState *machine)
                                 hart_count, &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
 
-        /* Per-socket CLINT */
-        riscv_aclint_swi_create(
-            memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
-            base_hartid, hart_count, false);
-        riscv_aclint_mtimer_create(
-            memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size +
-                RISCV_ACLINT_SWI_SIZE,
-            RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
-            RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
-            RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
-
-        /* Per-socket ACLINT SSWI */
         if (s->have_aclint) {
+            if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+                /* Per-socket ACLINT MTIMER */
+                riscv_aclint_mtimer_create(memmap[VIRT_CLINT].base +
+                        i * RISCV_ACLINT_DEFAULT_MTIMER_SIZE,
+                    RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
+                    RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+                    RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
+            } else {
+                /* Per-socket ACLINT MSWI, MTIMER, and SSWI */
+                riscv_aclint_swi_create(memmap[VIRT_CLINT].base +
+                        i * memmap[VIRT_CLINT].size,
+                    base_hartid, hart_count, false);
+                riscv_aclint_mtimer_create(memmap[VIRT_CLINT].base +
+                        i * memmap[VIRT_CLINT].size + RISCV_ACLINT_SWI_SIZE,
+                    RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
+                    RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+                    RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
+                riscv_aclint_swi_create(memmap[VIRT_ACLINT_SSWI].base +
+                        i * memmap[VIRT_ACLINT_SSWI].size,
+                    base_hartid, hart_count, true);
+            }
+        } else {
+            /* Per-socket SiFive CLINT */
             riscv_aclint_swi_create(
-                memmap[VIRT_ACLINT_SSWI].base +
-                    i * memmap[VIRT_ACLINT_SSWI].size,
-                base_hartid, hart_count, true);
+                memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
+                base_hartid, hart_count, false);
+            riscv_aclint_mtimer_create(memmap[VIRT_CLINT].base +
+                    i * memmap[VIRT_CLINT].size + RISCV_ACLINT_SWI_SIZE,
+                RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
+                RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+                RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
         }
 
         /* Per-socket interrupt controller */
@@ -990,8 +1226,9 @@ static void virt_machine_init(MachineState *machine)
             s->irqchip[i] = virt_create_plic(memmap, i,
                                              base_hartid, hart_count);
         } else {
-            s->irqchip[i] = virt_create_aia(s->aia_type, memmap, i,
-                                            base_hartid, hart_count);
+            s->irqchip[i] = virt_create_aia(s->aia_type, s->aia_guests,
+                                            memmap, i, base_hartid,
+                                            hart_count);
         }
 
         /* Try to use different IRQCHIP instance based device type */
@@ -1138,6 +1375,27 @@ static void virt_machine_instance_init(Object *obj)
 {
 }
 
+static char *virt_get_aia_guests(Object *obj, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+    char val[32];
+
+    sprintf(val, "%d", s->aia_guests);
+    return g_strdup(val);
+}
+
+static void virt_set_aia_guests(Object *obj, const char *val, Error **errp)
+{
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    s->aia_guests = atoi(val);
+    if (s->aia_guests < 0 || s->aia_guests > VIRT_IRQCHIP_MAX_GUESTS) {
+        error_setg(errp, "Invalid number of AIA IMSIC guests");
+        error_append_hint(errp, "Valid values be between 0 and %d.\n",
+                          VIRT_IRQCHIP_MAX_GUESTS);
+    }
+}
+
 static char *virt_get_aia(Object *obj, Error **errp)
 {
     RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
@@ -1147,6 +1405,9 @@ static char *virt_get_aia(Object *obj, Error **errp)
     case VIRT_AIA_TYPE_APLIC:
         val = "aplic";
         break;
+    case VIRT_AIA_TYPE_APLIC_IMSIC:
+        val = "aplic-imsic";
+        break;
     default:
         val = "none";
         break;
@@ -1163,9 +1424,12 @@ static void virt_set_aia(Object *obj, const char *val, Error **errp)
         s->aia_type = VIRT_AIA_TYPE_NONE;
     } else if (!strcmp(val, "aplic")) {
         s->aia_type = VIRT_AIA_TYPE_APLIC;
+    } else if (!strcmp(val, "aplic-imsic")) {
+        s->aia_type = VIRT_AIA_TYPE_APLIC_IMSIC;
     } else {
         error_setg(errp, "Invalid AIA interrupt controller type");
-        error_append_hint(errp, "Valid values are none, and aplic.\n");
+        error_append_hint(errp, "Valid values are none, aplic, and "
+                          "aplic-imsic.\n");
     }
 }
 
@@ -1187,6 +1451,7 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
 
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
+    char str[128];
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "RISC-V VirtIO board";
@@ -1213,7 +1478,14 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "aia",
                                           "Set type of AIA interrupt "
                                           "conttoller. Valid values are "
-                                          "none, and aplic.");
+                                          "none, aplic, and aplic-imsic.");
+
+    object_class_property_add_str(oc, "aia-guests",
+                                  virt_get_aia_guests,
+                                  virt_set_aia_guests);
+    sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
+                 "should be between 0 and %d.", VIRT_IRQCHIP_MAX_GUESTS);
+    object_class_property_set_description(oc, "aia-guests", str);
 }
 
 static const TypeInfo virt_machine_typeinfo = {
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 43603a769c..e12e8ddcae 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -24,8 +24,10 @@
 #include "hw/block/flash.h"
 #include "qom/object.h"
 
-#define VIRT_CPUS_MAX 8
-#define VIRT_SOCKETS_MAX 8
+#define VIRT_CPUS_MAX_BITS             3
+#define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
+#define VIRT_SOCKETS_MAX_BITS          2
+#define VIRT_SOCKETS_MAX               (1 << VIRT_SOCKETS_MAX_BITS)
 
 #define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
 typedef struct RISCVVirtState RISCVVirtState;
@@ -35,6 +37,7 @@ DECLARE_INSTANCE_CHECKER(RISCVVirtState, RISCV_VIRT_MACHINE,
 typedef enum RISCVVirtAIAType {
     VIRT_AIA_TYPE_NONE=0,
     VIRT_AIA_TYPE_APLIC,
+    VIRT_AIA_TYPE_APLIC_IMSIC,
 } RISCVVirtAIAType;
 
 struct RISCVVirtState {
@@ -50,6 +53,7 @@ struct RISCVVirtState {
     int fdt_size;
     bool have_aclint;
     RISCVVirtAIAType aia_type;
+    int aia_guests;
 };
 
 enum {
@@ -65,6 +69,8 @@ enum {
     VIRT_UART0,
     VIRT_VIRTIO,
     VIRT_FW_CFG,
+    VIRT_IMSIC_M,
+    VIRT_IMSIC_S,
     VIRT_FLASH,
     VIRT_DRAM,
     VIRT_PCIE_MMIO,
@@ -81,8 +87,13 @@ enum {
     VIRTIO_NDEV = 0x35 /* Arbitrary maximum number of interrupts */
 };
 
-#define VIRT_IRQCHIP_NUM_SOURCES 127
+#define VIRT_IRQCHIP_BASE_IPI 1
+#define VIRT_IRQCHIP_NUM_IPIS 7
+#define VIRT_IRQCHIP_NUM_MSIS 255
+#define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
+#define VIRT_IRQCHIP_MAX_GUESTS_BITS 3
+#define VIRT_IRQCHIP_MAX_GUESTS ((1U << VIRT_IRQCHIP_MAX_GUESTS_BITS) - 1U)
 
 #define VIRT_PLIC_PRIORITY_BASE 0x04
 #define VIRT_PLIC_PENDING_BASE 0x1000
@@ -97,6 +108,7 @@ enum {
 #define FDT_PCI_INT_CELLS     1
 #define FDT_PLIC_INT_CELLS    1
 #define FDT_APLIC_INT_CELLS   2
+#define FDT_IMSIC_INT_CELLS   0
 #define FDT_MAX_INT_CELLS     2
 #define FDT_MAX_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
                                  1 + FDT_MAX_INT_CELLS)
-- 
2.25.1


