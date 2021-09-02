Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLks8-0002mc-Oa
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLks7-0002i4-1T; Thu, 02 Sep 2021 07:27:07 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:26552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLks1-00036k-SL; Thu, 02 Sep 2021 07:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630582021; x=1662118021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=E20kRSRU11NVpZoAYlJk4f+4iyaLPcyFV4uEzNeSMys=;
 b=XGiTPuXlszrZvI8u0IFTVoENkrELg2RjYkmEmwsyxrvowckllawI/nUQ
 wuUTpFRviT4dxWRhtJYV5IytyrXUbTqKHGz0g7eCfjaaXirhiyxLEg0wY
 OHFmPetYOEiJl4bhm+nad05I1h7Oybx4NWlmNm1WiMywSTi85fxRZPyw0
 o0ZahQ1NqAsTmeA6h0BnITSEI1Hocn8DSIcbP/fdIR23BFEGtJVKmbjWf
 mYrXVGRL8tAAIKbaLelksy5Ckue9w/NG+OZgqOsCQ42W8vd6E6paRZZWS
 NiRmvv47IfN126DWnFH5dlEyIqSatzjSEew51hrSANCUTelFTilb6Zqov A==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="290644652"
Received: from mail-dm6nam08lp2040.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.40])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfeTXGq2eyNCr+tX/OcLoHnEH+7NwmP+dIzL5C+RCTz9oBFnnwBkxmfl9V6dFVXEZi5P7PgoblFz6Y0Nl0pQ13R8gSE0Z5jp6UpFM8amEunrJaQQ65ZcBKtlv8CytRDa77IZ5uk2ImT1PB7F6+tmuG9c09y871+q9jB1m9RFNRxp+2u/VnxE8v/1IWg+gzgJevp2twr7XLg8yfb39UGhFMg5BUad2/Y8JGzbcOHjNTrvSFshE4a6hzdym+Ld8XEdHStaDMrU9fZHkyYkxopoHAkdozaaNIn0UDqzklF+cfD7zej6Rv4iPCD0pXxaWHxovtG9G2fp/D3N5uh/JHb1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=fcbKF7SE/3QnZ79Sn9QjdiBOweMf+QYw8gXeT7xCNuk=;
 b=HuMWxp2whAEzcCFzB+JAzWt481JaAHGWey7FLqwO7597ouwDc9IKmx6XtKTguxBx5gzYXkGgtltK/fXNlQxlpT0BrvYI6N5PjnRqCth4Og7CdJqVx/cqDJepY7tpfzoX+c9X/7PCOfw6JFxx3FEydRevXZ+GNt6fV9SbQAevi3wOue+m3vs+yKy7ajAUhSGU235gZ83Pcfj25niD2fndcvpWzGIpcibCoA8hsJA0TV0eqgvowaB1J20zdbcEBJwFkxCT2apgUaFyyiEKJhBQZuJmEC8SCVbS8nf55qMsopoqvaDC7loblKISnu7gmSzGWghuepUg7KPYEO28DnQyZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcbKF7SE/3QnZ79Sn9QjdiBOweMf+QYw8gXeT7xCNuk=;
 b=FzvmjYNx1n0clI/N6CHguPlnPUfwV45xI997eYTattX2f6EujXiN+ppL7nr2416och28ACkVGptYwVen+S7KZ5cfXsrh+OhI67m29amv5Lt7dZb8+yEJnoCKsiTsFm9PSEGwwyXR8sTyIksoGdPHRKVIWBaiK6GMpsip90sk0jQ=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7891.namprd04.prod.outlook.com (2603:10b6:5:35b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 11:26:57 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:57 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 21/22] hw/riscv: virt: Add optional AIA IMSIC support to
 virt machine
Date: Thu,  2 Sep 2021 16:55:19 +0530
Message-Id: <20210902112520.475901-22-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902112520.475901-1-anup.patel@wdc.com>
References: <20210902112520.475901-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::8) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.167.220.163) by
 MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5cfb520-4d21-416e-b499-08d96e0492e0
X-MS-TrafficTypeDiagnostic: CO6PR04MB7891:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB78918FF221FFCB7891C5FC278DCE9@CO6PR04MB7891.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4a9Hj7iYqgg5cjqtWZpuOJYSTvapZtwkWc1OIiVzdbsyXwjNFFz6t8tBArKRUdZ2wQz6WXuA9bvLKWLTT842qWw4pu7+oRyDySdHzPW4drVxWThXUBaLG2fh6v4RoKigFDgRvS/u9I9RtAhct2mKjWGV2QLNlBubguqVSGjmFRmewzZ6uQhbIiPee7Mh98XtP6be5CEfwfo45YVm75nU4GpxRO2te9Qpcgu8Sa87OyBP50PIpfI6IXWQ9zuvWTAfRBP4/FMsUV0EGurWhAXyqFaU5XP6DZ8QxZjQn13KZOJseoo0ZrFHk7GoiLFS7eGzv84k56rYarpx+VSHoo0Yth0LGcoa2kCGcV6wW8mYwuFUgGOXdwqeAMNDtwQ0Yj+c9PgXBQ/srsYzmr2SJ3CK5unzguYJVUfp8DzEzoHzWjs3SCh6V7ioVtRL1LKeQ3uy3dWCZyBO08LUZth65kOhNJbx45iG7TzpQO8kXwPOAzwVTWfNOwwOfxBspzFoCj3N+FpkE4my2zLIp37yYkuYuBIhddhhPUZSAK14lbbhB9na/W4SXF1SsQ+3OTEmxJMAbaodLVWH3LsAmi0q6IpoThxZGNTQC+9iLLm47OK803yRttALwDLnA3wl6NQP8jW2ATBd89Zx24UPC09XJdCVaVkdIn1LrY5KnfeBcCd95gLLM6nrPxvqFEV6dph5UVjWSPSaDhwncA8DMmD1uKwaiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(38350700002)(7696005)(83380400001)(5660300002)(52116002)(186003)(8886007)(38100700002)(6666004)(8676002)(8936002)(110136005)(316002)(36756003)(55016002)(54906003)(66946007)(66476007)(30864003)(66556008)(86362001)(4326008)(1076003)(44832011)(2616005)(478600001)(26005)(956004)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?82sHywIC5kXIK9sp58F1NmWQk86qjFRU3FE7FIzgdb7tTmrpYy+i8aMtXUM4?=
 =?us-ascii?Q?uAAqghWR9OzU9zUFlLgxY0Tmd8hOCdmoeS6mmLLSuMdg/G+AktLAzuJ/G8+z?=
 =?us-ascii?Q?3jOv6zFh3yZ6yeIngFNQLtyr5C9hUsuqWgOLCdrO2N7ufCxiMxMbNaFtPSOS?=
 =?us-ascii?Q?hCc38rsMCXQBB04coTTud9IfMKfI5CVOdl+ZA5iuFpgUupkIxW0VE/TvmKE1?=
 =?us-ascii?Q?yw9gim7T/bDTKJtxq+4Zv8R8a0Vd1pCUA5IDlX7ooOC37k/viqnVCfLmBSzn?=
 =?us-ascii?Q?czlM7gn6rAaKhCiXbiLD16KERpNFUPpWOQFJ0YFxis1QnHVYX1wQP1Ug98P2?=
 =?us-ascii?Q?91GW87gCH8070E8lLxyzUS91ipb2jM8D97YPy3fjPGYk6hZ6OMMgfsluPGGj?=
 =?us-ascii?Q?+3w7qc68+kh7jyeB2HOcRAPnns3oaR8oQhvH9zXVY0qGeOGhVta5tI1CeqYf?=
 =?us-ascii?Q?KchaPqEXdoERDycBLce989FRivN2OD14uHAVTXq/twd6s3pkuz7bglKiAQjw?=
 =?us-ascii?Q?nyTZ6T+8giw3tDDipg5HBf3evqFBTv+Vf+/lV6Txv9IAG7cYrYvLudmToI5L?=
 =?us-ascii?Q?CrYhTmPY2gqmAih1a9z/pT1gj69quCH7cj2g32VEHtuAhJawG/9Pv1rUOGKk?=
 =?us-ascii?Q?U1QVa2HSPusXw3UiOjqRrSEW9zE2LeEB7Pcg1SIPqD1lz63fDxsvvU4Lo/AP?=
 =?us-ascii?Q?uDycGjPDRz8pUbwan6a7yvnWv68qaWKS7rJPpB9aynM4yU2hQP9JmQFjed6n?=
 =?us-ascii?Q?+Vfu85srNmJ4OTivDc46YSNzzMPnrDXgZnyt8lSKm2OKROmw/lPI6EW5c6k1?=
 =?us-ascii?Q?gZlS6Xlt7fQvU5SxTY1ngCZaBsOjqur2P2yaDPhGEzFQloDMI841DsDPhdzH?=
 =?us-ascii?Q?JdVGzZN7sv4g/9A2blIHWMiEhcNViY5sY7pqKwUZVGl5oCESQDf7i/oEuvRB?=
 =?us-ascii?Q?wH5pjotblu62u2nn/W6lN7JszN30sV+G1E9IfKPuCCRm8/B6ngf16KbIZ6B1?=
 =?us-ascii?Q?5+Z/1GzS/j+s3SxVqd3vcBIEULLRfDh37KojH50fVZANj080JDMItzPNDHSE?=
 =?us-ascii?Q?pn1Hzhlaxd6s/sOF6+W1IeFJqb8tXcj/lvLshFFWg9b3DNX2R01LQ09FZ0rc?=
 =?us-ascii?Q?/uA706Cxgy+3NX3E1HY50h9+1pJeEr3oU5IxtIujEpyd+U4Lgwhiojl0vjgI?=
 =?us-ascii?Q?G1g0BV3cpOPinu8Ubut/z9lkwE5wa5ubIcpQo2tBvnoU4rqcRPMLxInNiId/?=
 =?us-ascii?Q?4bf+JRBl9v/qh4xDt8Z9Irl6PqRSLm6WKC0VJ0m5iHoUHZynxzP10zVrgOAG?=
 =?us-ascii?Q?Hecb5kRPQfr+B2AI9a3zPsxz?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cfb520-4d21-416e-b499-08d96e0492e0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:57.6025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OivWNqlAdQuqafwkcp9HEtZ6vTCot2WT72MTANh6hPQ4qLekXTiDes0DCjgwLTE/Rmv+vhqB2YoFMKMHCPvjcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7891
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=872ab4b15=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 02 Sep 2021 11:27:07 -0000

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
 hw/riscv/virt.c         | 430 ++++++++++++++++++++++++++++++++--------
 include/hw/riscv/virt.h |  16 +-
 3 files changed, 363 insertions(+), 84 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index ed6630f646..dfbed3cc6e 100644
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
index 8cc1fb3e1c..f9ddc4073f 100644
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
@@ -43,6 +44,13 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
 
+#define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
+#define VIRT_IMSIC_MAX_SIZE            (VIRT_SOCKETS_MAX * \
+                                        VIRT_IMSIC_GROUP_MAX_SIZE)
+#if 0x4000000 < VIRT_IMSIC_MAX_SIZE
+#error "Can't accomodate IMSIC in address space"
+#endif
+
 static const MemMapEntry virt_memmap[] = {
     [VIRT_DEBUG] =       {        0x0,         0x100 },
     [VIRT_MROM] =        {     0x1000,        0xf000 },
@@ -58,6 +66,8 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
     [VIRT_FW_CFG] =      { 0x10100000,          0x18 },
     [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
+    [VIRT_IMSIC_M] =     { 0x24000000,     0x4000000 },
+    [VIRT_IMSIC_S] =     { 0x28000000,     0x4000000 },
     [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
     [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
     [VIRT_DRAM] =        { 0x80000000,           0x0 },
@@ -309,7 +319,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
 {
     int cpu;
     char *name;
-    unsigned long addr;
+    unsigned long addr, size;
     uint32_t aclint_cells_size;
     uint32_t *aclint_mswi_cells;
     uint32_t *aclint_sswi_cells;
@@ -330,29 +340,38 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
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
@@ -360,19 +379,22 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
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
@@ -425,10 +447,145 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
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
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "imsic,num-ids",
+        VIRT_IRQCHIP_NUM_MSIS);
+    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "imsic,ipi-range",
+        VIRT_IRQCHIP_BASE_IPI, VIRT_IRQCHIP_NUM_IPIS);
+    if (riscv_socket_count(mc) > 1) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "imsic,hart-index-bits",
+            imsic_num_bits(imsic_max_hart_per_socket));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "imsic,group-index-bits",
+            imsic_num_bits(riscv_socket_count(mc)));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "imsic,group-index-shift",
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
+    qemu_fdt_setprop_cell(mc->fdt, imsic_name, "imsic,num-ids",
+        VIRT_IRQCHIP_NUM_MSIS);
+    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "imsic,ipi-range",
+        VIRT_IRQCHIP_BASE_IPI, VIRT_IRQCHIP_NUM_IPIS);
+    if (imsic_guest_bits) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "imsic,guest-index-bits",
+            imsic_guest_bits);
+    }
+    if (riscv_socket_count(mc) > 1) {
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "imsic,hart-index-bits",
+            imsic_num_bits(imsic_max_hart_per_socket));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "imsic,group-index-bits",
+            imsic_num_bits(riscv_socket_count(mc)));
+        qemu_fdt_setprop_cell(mc->fdt, imsic_name, "imsic,group-index-shift",
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
@@ -454,8 +611,13 @@ static void create_fdt_socket_aia(RISCVVirtState *s,
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
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "aplic,num-sources",
@@ -481,8 +643,13 @@ static void create_fdt_socket_aia(RISCVVirtState *s,
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
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "aplic,num-sources",
@@ -499,13 +666,14 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
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
@@ -514,35 +682,53 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
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
@@ -590,7 +776,8 @@ static void create_fdt_virtio(RISCVVirtState *s, const MemMapEntry *memmap,
 }
 
 static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap,
-                            uint32_t irq_pcie_phandle)
+                            uint32_t irq_pcie_phandle,
+                            uint32_t msi_pcie_phandle)
 {
     char *name;
     MachineState *mc = MACHINE(s);
@@ -610,6 +797,9 @@ static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cells(mc->fdt, name, "bus-range", 0,
         memmap[VIRT_PCIE_ECAM].size / PCIE_MMCFG_SIZE_MIN - 1);
     qemu_fdt_setprop(mc->fdt, name, "dma-coherent", NULL, 0);
+    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
+        qemu_fdt_setprop_cell(mc->fdt, name, "msi-parent", msi_pcie_phandle);
+    }
     qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0,
         memmap[VIRT_PCIE_ECAM].base, 0, memmap[VIRT_PCIE_ECAM].size);
     qemu_fdt_setprop_sized_cells(mc->fdt, name, "ranges",
@@ -735,7 +925,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
                        uint64_t mem_size, const char *cmdline, bool is_32_bit)
 {
     MachineState *mc = MACHINE(s);
-    uint32_t phandle = 1, irq_mmio_phandle = 1;
+    uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
     uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
 
     if (mc->dtb) {
@@ -765,11 +955,12 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, "/soc", "#address-cells", 0x2);
 
     create_fdt_sockets(s, memmap, is_32_bit, &phandle,
-        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle);
+        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle,
+        &msi_pcie_phandle);
 
     create_fdt_virtio(s, memmap, irq_virtio_phandle);
 
-    create_fdt_pcie(s, memmap, irq_pcie_phandle);
+    create_fdt_pcie(s, memmap, irq_pcie_phandle, msi_pcie_phandle);
 
     create_fdt_reset(s, memmap, &phandle);
 
@@ -902,30 +1093,55 @@ static DeviceState *virt_create_plic(const MemMapEntry *memmap, int socket,
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
@@ -985,23 +1201,38 @@ static void virt_machine_init(MachineState *machine)
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
@@ -1009,8 +1240,9 @@ static void virt_machine_init(MachineState *machine)
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
@@ -1159,6 +1391,27 @@ static void virt_machine_instance_init(Object *obj)
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
+    if (s->aia_guests < 0 || s->aia_guests > IRQ_LOCAL_GUEST_MAX) {
+        error_setg(errp, "Invalid number of AIA IMSIC guests");
+        error_append_hint(errp, "Valid values be between 0 and 31 (for RV32) "
+                         "or between 0 and 63 (for RV64).\n");
+    }
+}
+
 static char *virt_get_aia(Object *obj, Error **errp)
 {
     RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
@@ -1168,6 +1421,9 @@ static char *virt_get_aia(Object *obj, Error **errp)
     case VIRT_AIA_TYPE_APLIC:
         val = "aplic";
         break;
+    case VIRT_AIA_TYPE_APLIC_IMSIC:
+        val = "aplic-imsic";
+        break;
     default:
         val = "none";
         break;
@@ -1184,9 +1440,12 @@ static void virt_set_aia(Object *obj, const char *val, Error **errp)
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
 
@@ -1233,7 +1492,16 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "aia",
                                           "Set type of AIA interrupt "
                                           "conttoller. Valid values are "
-                                          "none, and aplic.");
+                                          "none, aplic, and aplic-imsic.");
+
+    object_class_property_add_str(oc, "aia-guests",
+                                  virt_get_aia_guests,
+                                  virt_set_aia_guests);
+    object_class_property_set_description(oc, "aia-guests",
+                                          "Set number of guest MMIO pages "
+                                          "for AIA IMSIC. Valid value should "
+                                          "be between 0 and 31 (for RV32) or "
+                                          "between 0 and 63 (for RV64).");
 }
 
 static const TypeInfo virt_machine_typeinfo = {
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index a26ef4a295..a20b80dd1d 100644
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
@@ -81,7 +87,10 @@ enum {
     VIRTIO_NDEV = 0x35 /* Arbitrary maximum number of interrupts */
 };
 
-#define VIRT_IRQCHIP_NUM_SOURCES 127
+#define VIRT_IRQCHIP_BASE_IPI 1
+#define VIRT_IRQCHIP_NUM_IPIS 7
+#define VIRT_IRQCHIP_NUM_MSIS 255
+#define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
 
 #define VIRT_PLIC_HART_CONFIG "MS"
@@ -98,6 +107,7 @@ enum {
 #define FDT_PCI_INT_CELLS     1
 #define FDT_PLIC_INT_CELLS    1
 #define FDT_APLIC_INT_CELLS   2
+#define FDT_IMSIC_INT_CELLS   0
 #define FDT_MAX_INT_CELLS     2
 #define FDT_MAX_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
                                  1 + FDT_MAX_INT_CELLS)
-- 
2.25.1


