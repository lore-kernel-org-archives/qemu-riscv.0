Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLks6-0002hd-UO
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLks1-0002X2-Bl; Thu, 02 Sep 2021 07:27:01 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:39917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkry-00036O-6r; Thu, 02 Sep 2021 07:27:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630582017; x=1662118017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eTWsFV41ePCLrqw0lCip1zEjqdZkomnyiMYgs/X28Yw=;
 b=A4yR1hX5apfTvgDwycfdJYXItcDOZmDsmDxRXbnyqUowFH2NADHE5Opc
 cDzIojir0Q0EkgopKljaKgpK/7sgPLCVWkosmTNRTVafuHLJMq2vbuNxn
 2LWuXnd6sUWElHyp96eaNkkCGWqI/zaFZ0lmaWKgOVf/G/A36B6mM8jlL
 NHhTpAMEi4sDj4zSkBfm403feqKyHQUZeGJUtonYP6aVvbbl5aDqrEmjd
 NiXgwOHQ4LprKO1e6J+4aJjuSZUqPjrlQ4NYNUCGsL67aDS/vOllZ58sX
 D74FcR19fJXfjpHq/FU1m3IJbJhgvUUAsLlPpkbF5eUWmXBTzfcxEpMnw w==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="179039179"
Received: from mail-dm6nam08lp2047.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.47])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcDxt6boECOw9oQiOQphYTVBbi5YrBEDcokiMpqdPz5kCGy7PrBKk6O9abptX0Q/b5FdJPCWIWXH/JJGpIacubjni/FbxDi7L/N0y/7kTeZBTTbJojxzJbBvVTaVl30Q/5pMzr8H5cNoLuVjaejcrSVaFLuoB5Vuawz/tszdE+XUyHSuI1fWmFn6rOU7oL42MIZq5Ovr0AK3xzTfkcblz9tLbdpy7FQCMyOU3e7tvDjWkTel8fI3EZMKX4F+gIyTQfc5Pjc97cJfGNDvuEVBMBm4GfihpvJ2JHyBIZe/eEXmVVtNZHjQUt+kjrQQ3pgFAPpPZ/Y+oXzylDlxs7h7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=5deOfuSLYoOKLQaspRrL99CQFLa1EZB5TGSlH53iXtw=;
 b=aYfWwbQ/yjkJW66z8dzBN2uPrvfioiI9Uo/bqjs4T+c8E5Ltt0aGV/X+RKwB1eA28Y7/fl+RYeDkfIYZcIdglxg+seZwigG0W8XSqop6fOHlc+QhSZB4YoX7V36u/mP/PNjpxGqQGKeQ8xqQf5Spa8vcMrbMY36QaV0vYTTFGXT68aQ7F1QOnKbuCsJ7qVsFgwcJDlkd2LbJzaFWsFz//dgO5YRK5oOg7sXEn3WAt/6AlXoMXMTUh2ilIgDUyLWIbRzn0Gtdv+xEhqz4POfQaREUxdrRud/Th1HiqIGpnULbcuGZ/QcHNJOtudO81vB63gcremCw3dSup9YbZLszHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5deOfuSLYoOKLQaspRrL99CQFLa1EZB5TGSlH53iXtw=;
 b=b5XF33p8g/jRtJlxOkcCM7+yoCPAq3Spmzren9EK37o7P6hryWHVMdNPB3dgLMrmEsHNvZghQcqdLEtGxR1rC1kQSQS1m9/l4S6ztoPzJTYpkUr2Jeh5F8iFMHFVnzoNyjyrmoQ468RZ45wwgSWKE9MYK7bzpfHbbuUkNPJSfPw=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7891.namprd04.prod.outlook.com (2603:10b6:5:35b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 11:26:54 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:54 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 20/22] hw/intc: Add RISC-V AIA IMSIC device emulation
Date: Thu,  2 Sep 2021 16:55:18 +0530
Message-Id: <20210902112520.475901-21-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7ddda2d-8bb3-4548-30db-08d96e0490f9
X-MS-TrafficTypeDiagnostic: CO6PR04MB7891:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7891320FF121C4381EAF0E388DCE9@CO6PR04MB7891.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:224;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IjcMHbJt1UTy3vhLgujilTwPc9fZjJ1yL5hC7MKKlE+ZZ16fynODC0WCS+bA+9XyDI0HfQkDNSNWWHVMQf5qR4bUkDqGV0BVdHHpjY7Tc84/wqxd9AGawD3Rt5RmwNvn4GKHy+0lzZw+yIr9+Gqp0/gIhqYB2iwkvYK961p1xltqjs0LOm1O41YdidZRPPty4w8ybTn+NmCDaxux4oRGqJulzpv0sh/6H+eFpE/oQe1EHRNqhjdPQ5X5L+Q+FB9xtQQLn8uftUUMJp3KNg5UjusgPNV2UvrX0HIe3hFoMDkPkfR5NPD7iJT8Lf0U+xDSD4rMhsBq518U5mbdqXynhlaurygCa1V79UpIdhwaTAXcrg14YFagOmcaSnkXOJThKtQN/NzR7UeIqPRnRxzOrBlPLckrg09oEYUjBBu0cutxr6MUf9coWV2rFJ9brnsBun8DXWb+rJjt39QC36M5eNlf7QI2oTiydtF4hLbpAqm+cWyL9AuBm40W4zN/zS0j0YFt2t7UlM59flIg7vUv4cja3vw2Qjz7Ni11IPZuK+IxPH6U7oq+2RcEB1S7YR9w10TVYHiI/H8K/EvKYdyrSqkM2H5Qb/g8X6wbFF4eMK5bLr27Q9ALmn31JOzvtIMeE8oFG6uj5KqQ/65ToCPmEchroMpmk18gpFynPR0/o8s4cScPjm7TzI8Mn482rSCy9B3TJBsgLCAS3Ue6x8h+Pbp7JjJylBdrmcuDhAWYGc2zMFT7Eguy0Nbsq1+GaWMGisR+HdkcJOqhDXZeAPQicrocXKKVsS2+5GMO6MuCzjo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(38350700002)(7696005)(83380400001)(5660300002)(52116002)(186003)(8886007)(38100700002)(6666004)(8676002)(8936002)(110136005)(316002)(36756003)(55016002)(54906003)(66946007)(66476007)(30864003)(66556008)(86362001)(4326008)(1076003)(44832011)(2616005)(478600001)(26005)(956004)(2906002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?exBWVcjJjTjEvFawP86ibiHy2Lkje8N25KJLYa7jXRqPkzLbv/V9TQjIwQz3?=
 =?us-ascii?Q?RBIbaK6l6zBY1t7FG23jmqTK1XHP4jsdnKroGMiOwgVv3to8++Dm1rMIWiXi?=
 =?us-ascii?Q?rqcnvq/bXolyLyudecE8/Nzvy/FGJvKrx9U+9cKnQV46K1cTWlLfkytxa4qm?=
 =?us-ascii?Q?W1w+xSiY5N059bIjKJwTZMqsYHZd0Hq0MSDuf6fG/bzUYZNYvlHBj+Yh/LtT?=
 =?us-ascii?Q?VPMTOSiOFmI6C3+r1RbK8iBlFw/lgvDgNKKlxwiE736yIjDTedgH/RcO2tkP?=
 =?us-ascii?Q?5dPOvy59zPQdAeTQxYERtA+N3U6aWe+UOB4ZbxCpo1LowmzyISGgyO/GDqbj?=
 =?us-ascii?Q?ubLudK2FSImklzYdr6NlCEnskQ5P/7jmzTdVavgIiHgiLJyR7W7QIuGC4k0e?=
 =?us-ascii?Q?kywvu+xcZoZ9QXrkU9R0ORkXERWeiuPAVHwtPF4l6j2twFe6bcQCfMhVa3/B?=
 =?us-ascii?Q?rWhtdhDqi1hf9qJbHJ1fWlanwlwuLRyLKT/iC+3q/2ITijbNTos9dNFFaVbF?=
 =?us-ascii?Q?gSdknWe0e1hwIvHMFjJiqU9FvR+erzopy6ulaV5Ew2dxtXSS4ziDxZYYoXuB?=
 =?us-ascii?Q?RM1OSJe/l2rYBbJKZK6cnZNRsauKf6BZx+VpEFe5Mcxelj3dMhvqKMb07raV?=
 =?us-ascii?Q?PXyjMBVEe+mNBZS9BzAEHUl3zrhwLdT6m5HugH4xp3BIRz1Kedrs7w6zrqBP?=
 =?us-ascii?Q?2CpEXNy/7a1mJ1TKwmEGiH94QYLLyPnMCMhL4j+0BQ1APZARR8r0g5mpYGEI?=
 =?us-ascii?Q?BcPbym8o2i3RPYSRBcpE7yckQPOM5gdC0j3mhSeCoZksERJu0fvKtKYei9mK?=
 =?us-ascii?Q?xtIQmyyElCA+kIikEhqQv9CD7J2ojyOVZdA6XoqoDcyNRhHDeBZ4sR5kIPGk?=
 =?us-ascii?Q?yjbzc9z32gY9UgAT7qJQQZSZE/VYvXH+/RI+nJypzET+RXSFwgu/T4jaHRnH?=
 =?us-ascii?Q?damqa1teEmjOOfMMdfW/D7m+Sj3khr9h1OUk/Cq+j0oispiWRYinoJv8V8mH?=
 =?us-ascii?Q?40NQOWUHLdqm/4/aBM9YHvFnMUY6VatrFjvSNyrCupJSW/665XSkozZc5W47?=
 =?us-ascii?Q?fOlYmAYATBggb0fxxtbV64xIpS77kzywKgpp/PJ/T2w2nvY5cL4dMK2Ofpby?=
 =?us-ascii?Q?znaiew13doNY/7GYdjggRfH7VUcKPVX0oZrhb4AXt6duUZ2qX3IKDzvRuR6v?=
 =?us-ascii?Q?CbNyw8vsCDXkEoo85lTaF6/fZmrnWk8TOouhUdWqTGGId6Q9RFTyZoKsCxhh?=
 =?us-ascii?Q?tew/5Fozjj1++i174+H4hQdxzfCjf+wsewNa0KBV4ICLkCpwVkHJgiUkTkXk?=
 =?us-ascii?Q?AhVuHMWvgAKzgNaTldtaBbwp?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ddda2d-8bb3-4548-30db-08d96e0490f9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:54.1915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsTgchR+4M40Jv+peBcMAkWV3X/qR6hl/xJ2pAAwEYZChvzHZHSNrKoGSXfJfohrsWy0R63XhPhjdTcCBYIkTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7891
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=872ab4b15=Anup.Patel@wdc.com; helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Thu, 02 Sep 2021 11:27:02 -0000

The RISC-V AIA (Advanced Interrupt Architecture) defines a new
interrupt controller for MSIs (message signal interrupts) called
IMSIC (Incoming Message Signal Interrupt Controller). The IMSIC
is per-HART device and also suppport virtualizaiton of MSIs using
dedicated VS-level guest interrupt files.

This patch adds device emulation for RISC-V AIA IMSIC which
supports M-level, S-level, and VS-level MSIs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/intc/Kconfig               |   3 +
 hw/intc/meson.build           |   1 +
 hw/intc/riscv_imsic.c         | 443 ++++++++++++++++++++++++++++++++++
 include/hw/intc/riscv_imsic.h |  68 ++++++
 4 files changed, 515 insertions(+)
 create mode 100644 hw/intc/riscv_imsic.c
 create mode 100644 include/hw/intc/riscv_imsic.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 1592623233..0bb3166110 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -68,6 +68,9 @@ config RISCV_ACLINT
 config RISCV_APLIC
     bool
 
+config RISCV_IMSIC
+    bool
+
 config SIFIVE_PLIC
     bool
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index c68c1894bf..4aee547dd5 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -48,6 +48,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
 specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
 specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true: files('riscv_aclint.c'))
 specific_ss.add(when: 'CONFIG_RISCV_APLIC', if_true: files('riscv_aplic.c'))
+specific_ss.add(when: 'CONFIG_RISCV_IMSIC', if_true: files('riscv_imsic.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
new file mode 100644
index 0000000000..f33e35986b
--- /dev/null
+++ b/hw/intc/riscv_imsic.c
@@ -0,0 +1,443 @@
+/*
+ * RISC-V IMSIC (Incoming Message Signaled Interrupt Controller)
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/error-report.h"
+#include "qemu/bswap.h"
+#include "exec/address-spaces.h"
+#include "hw/sysbus.h"
+#include "hw/pci/msi.h"
+#include "hw/boards.h"
+#include "hw/qdev-properties.h"
+#include "hw/intc/riscv_imsic.h"
+#include "hw/irq.h"
+#include "target/riscv/cpu.h"
+#include "target/riscv/cpu_bits.h"
+#include "sysemu/sysemu.h"
+#include "migration/vmstate.h"
+
+#define IMSIC_MMIO_PAGE_LE             0x00
+#define IMSIC_MMIO_PAGE_BE             0x04
+
+#define IMSIC_MIN_ID                   ((IMSIC_EIPx_BITS * 2) - 1)
+#define IMSIC_MAX_ID                   (IMSIC_TOPEI_IID_MASK)
+
+#define IMSIC_EISTATE_PENDING          (1U << 0)
+#define IMSIC_EISTATE_ENABLED          (1U << 1)
+#define IMSIC_EISTATE_ENPEND           (IMSIC_EISTATE_ENABLED | \
+                                        IMSIC_EISTATE_PENDING)
+
+static uint32_t riscv_imsic_topei(RISCVIMSICState *imsic, uint32_t page)
+{
+    uint32_t i, max_irq, base;
+
+    base = page * imsic->num_irqs;
+    max_irq = (imsic->num_irqs < imsic->eithreshold[page]) ?
+              imsic->num_irqs : imsic->eithreshold[page];
+    for (i = 1; i < max_irq; i++) {
+        if ((imsic->eistate[base + i] & IMSIC_EISTATE_ENPEND) ==
+                IMSIC_EISTATE_ENPEND) {
+            return (i << IMSIC_TOPEI_IID_SHIFT) | i;
+        }
+    }
+
+    return 0;
+}
+
+static void riscv_imsic_update(RISCVIMSICState *imsic, uint32_t page)
+{
+    if (imsic->eidelivery[page] && riscv_imsic_topei(imsic, page)) {
+        qemu_irq_raise(imsic->external_irqs[page]);
+    } else {
+        qemu_irq_lower(imsic->external_irqs[page]);
+    }
+}
+
+static int riscv_imsic_eidelivery_rmw(RISCVIMSICState *imsic, uint32_t page,
+                                      target_ulong *val,
+                                      target_ulong new_val,
+                                      target_ulong wr_mask)
+{
+    target_ulong old_val = imsic->eidelivery[page];
+
+    if (val) {
+        *val = old_val;
+    }
+
+    wr_mask &= 0x1;
+    imsic->eidelivery[page] = (old_val & ~wr_mask) | (new_val & wr_mask);
+
+    riscv_imsic_update(imsic, page);
+    return 0;
+}
+
+static int riscv_imsic_eithreshold_rmw(RISCVIMSICState *imsic, uint32_t page,
+                                      target_ulong *val,
+                                      target_ulong new_val,
+                                      target_ulong wr_mask)
+{
+    target_ulong old_val = imsic->eithreshold[page];
+
+    if (val) {
+        *val = old_val;
+    }
+
+    wr_mask &= IMSIC_MAX_ID;
+    imsic->eithreshold[page] = (old_val & ~wr_mask) | (new_val & wr_mask);
+
+    riscv_imsic_update(imsic, page);
+    return 0;
+}
+
+static int riscv_imsic_topei_rmw(RISCVIMSICState *imsic, uint32_t page,
+                                 target_ulong *val, target_ulong new_val,
+                                 target_ulong wr_mask)
+{
+    uint32_t base, topei = riscv_imsic_topei(imsic, page);
+
+    /* Read pending and enabled interrupt with highest priority */
+    if (val) {
+        *val = topei;
+    }
+
+    /* Writes ignore value and clear top pending interrupt */
+    if (topei && wr_mask) {
+        topei >>= IMSIC_TOPEI_IID_SHIFT;
+        base = page * imsic->num_irqs;
+        if (topei) {
+            imsic->eistate[base + topei] &= ~IMSIC_EISTATE_PENDING;
+        }
+
+        riscv_imsic_update(imsic, page);
+    }
+
+    return 0;
+}
+
+static int riscv_imsic_eix_rmw(RISCVIMSICState *imsic, uint32_t page,
+                               uint32_t num, bool pend, target_ulong *val,
+                               target_ulong new_val, target_ulong wr_mask)
+{
+    uint32_t i, base;
+    target_ulong mask;
+    uint32_t state = (pend) ? IMSIC_EISTATE_PENDING : IMSIC_EISTATE_ENABLED;
+
+#if TARGET_LONG_BITS == 64
+    if (num & 0x1) {
+        return -EINVAL;
+    }
+    num >>= 1;
+#endif
+
+    if (num >= (imsic->num_irqs / TARGET_LONG_BITS)) {
+        return -EINVAL;
+    }
+    base = (page * imsic->num_irqs) + (num * TARGET_LONG_BITS);
+
+    if (val) {
+        *val = 0;
+        for (i = 0; i < TARGET_LONG_BITS; i++) {
+            mask = (target_ulong)1 << i;
+            *val |= (imsic->eistate[base + i] & state) ? mask : 0;
+        }
+    }
+
+    for (i = 0; i < TARGET_LONG_BITS; i++) {
+        /* Bit0 of eip0 and eie0 are read-only zero */
+        if (!num && !i) {
+            continue;
+        }
+
+        mask = (target_ulong)1 << i;
+        if (wr_mask & mask) {
+            if (new_val & mask) {
+                imsic->eistate[base + i] |= state;
+            } else {
+                imsic->eistate[base + i] &= ~state;
+            }
+        }
+    }
+
+    riscv_imsic_update(imsic, page);
+    return 0;
+}
+
+static int riscv_imsic_rmw(void *arg, target_ulong reg, target_ulong *val,
+                           target_ulong new_val, target_ulong wr_mask)
+{
+    RISCVIMSICState *imsic = arg;
+    uint32_t isel, priv, virt, vgein, page;
+
+    priv = AIA_IREG_PRIV(reg);
+    virt = AIA_IREG_VIRT(reg);
+    isel = AIA_IREG_ISEL(reg);
+    vgein = AIA_IREG_VGEIN(reg);
+
+    if (imsic->mmode) {
+        if (priv == PRV_M && !virt) {
+            page = 0;
+        } else {
+            goto err;
+        }
+    } else {
+        if (priv == PRV_S) {
+            if (virt) {
+                if (vgein && vgein < imsic->num_pages) {
+                    page = vgein;
+                } else {
+                    goto err;
+                }
+            } else {
+                page = 0;
+            }
+        } else {
+            goto err;
+        }
+    }
+
+    switch (isel) {
+    case ISELECT_IMSIC_EIDELIVERY:
+        return riscv_imsic_eidelivery_rmw(imsic, page, val,
+                                          new_val, wr_mask);
+    case ISELECT_IMSIC_EITHRESHOLD:
+        return riscv_imsic_eithreshold_rmw(imsic, page, val,
+                                           new_val, wr_mask);
+    case ISELECT_IMSIC_TOPEI:
+        return riscv_imsic_topei_rmw(imsic, page, val, new_val, wr_mask);
+    case ISELECT_IMSIC_EIP0 ... ISELECT_IMSIC_EIP63:
+        return riscv_imsic_eix_rmw(imsic, page, isel - ISELECT_IMSIC_EIP0,
+                                   true, val, new_val, wr_mask);
+    case ISELECT_IMSIC_EIE0 ... ISELECT_IMSIC_EIE63:
+        return riscv_imsic_eix_rmw(imsic, page, isel - ISELECT_IMSIC_EIE0,
+                                   false, val, new_val, wr_mask);
+    default:
+        break;
+    };
+
+err:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register priv=%d virt=%d isel=%d vgein=%d\n",
+                  __func__, priv, virt, isel, vgein);
+    return -EINVAL;
+}
+
+static uint64_t riscv_imsic_read(void *opaque, hwaddr addr, unsigned size)
+{
+    RISCVIMSICState *imsic = opaque;
+
+    /* Reads must be 4 byte words */
+    if ((addr & 0x3) != 0) {
+        goto err;
+    }
+
+    /* Reads cannot be out of range */
+    if (addr > IMSIC_MMIO_SIZE(imsic->num_pages)) {
+        goto err;
+    }
+
+    return 0;
+
+err:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
+    return 0;
+}
+
+static void riscv_imsic_write(void *opaque, hwaddr addr, uint64_t value,
+        unsigned size)
+{
+    RISCVIMSICState *imsic = opaque;
+    uint32_t page;
+
+    /* Writes must be 4 byte words */
+    if ((addr & 0x3) != 0) {
+        goto err;
+    }
+
+    /* Writes cannot be out of range */
+    if (addr > IMSIC_MMIO_SIZE(imsic->num_pages)) {
+        goto err;
+    }
+
+    /* Writes only supported for MSI little-endian registers */
+    page = addr >> IMSIC_MMIO_PAGE_SHIFT;
+    if ((addr & (IMSIC_MMIO_PAGE_SZ - 1)) == IMSIC_MMIO_PAGE_LE) {
+        if (value && (value < imsic->num_irqs)) {
+            imsic->eistate[(page * imsic->num_irqs) + value] |=
+                                                    IMSIC_EISTATE_PENDING;
+        }
+    }
+
+    /* Update CPU external interrupt status */
+    riscv_imsic_update(imsic, page);
+
+    return;
+
+err:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
+}
+
+static const MemoryRegionOps riscv_imsic_ops = {
+    .read = riscv_imsic_read,
+    .write = riscv_imsic_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+static void riscv_imsic_realize(DeviceState *dev, Error **errp)
+{
+    RISCVIMSICState *imsic = RISCV_IMSIC(dev);
+    RISCVCPU *rcpu = RISCV_CPU(qemu_get_cpu(imsic->hartid));
+    CPUState *cpu = qemu_get_cpu(imsic->hartid);
+    CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
+
+    imsic->num_eistate = imsic->num_pages * imsic->num_irqs;
+    imsic->eidelivery = g_new0(uint32_t, imsic->num_pages);
+    imsic->eithreshold = g_new0(uint32_t, imsic->num_pages);
+    imsic->eistate = g_new0(uint32_t, imsic->num_eistate);
+
+    memory_region_init_io(&imsic->mmio, OBJECT(dev), &riscv_imsic_ops,
+                          imsic, TYPE_RISCV_IMSIC,
+                          IMSIC_MMIO_SIZE(imsic->num_pages));
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &imsic->mmio);
+
+    /* Claim the CPU interrupt to be triggered by this IMSIC */
+    if (riscv_cpu_claim_interrupts(rcpu,
+            (imsic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
+        error_report("%s already claimed",
+                     (imsic->mmode) ? "MEIP" : "SEIP");
+        exit(1);
+    }
+
+    /* Create output IRQ lines */
+    imsic->external_irqs = g_malloc(sizeof(qemu_irq) * imsic->num_pages);
+    qdev_init_gpio_out(dev, imsic->external_irqs, imsic->num_pages);
+
+    /* Force select AIA feature and setup CSR read-modify-write callback */
+    if (env) {
+        riscv_set_feature(env, RISCV_FEATURE_AIA);
+        if (!imsic->mmode) {
+            riscv_cpu_set_geilen(env, imsic->num_pages - 1);
+        }
+        riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ? PRV_M : PRV_S,
+                                      riscv_imsic_rmw, imsic);
+    }
+
+    msi_nonbroken = true;
+}
+
+static Property riscv_imsic_properties[] = {
+    DEFINE_PROP_BOOL("mmode", RISCVIMSICState, mmode, 0),
+    DEFINE_PROP_UINT32("hartid", RISCVIMSICState, hartid, 0),
+    DEFINE_PROP_UINT32("num-pages", RISCVIMSICState, num_pages, 0),
+    DEFINE_PROP_UINT32("num-irqs", RISCVIMSICState, num_irqs, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription vmstate_riscv_imsic = {
+    .name = "riscv_imsic",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+            VMSTATE_VARRAY_UINT32(eidelivery, RISCVIMSICState,
+                                  num_pages, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(eithreshold, RISCVIMSICState,
+                                  num_pages, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(eistate, RISCVIMSICState,
+                                  num_eistate, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_END_OF_LIST()
+        }
+};
+
+static void riscv_imsic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, riscv_imsic_properties);
+    dc->realize = riscv_imsic_realize;
+    dc->vmsd = &vmstate_riscv_imsic;
+}
+
+static const TypeInfo riscv_imsic_info = {
+    .name          = TYPE_RISCV_IMSIC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(RISCVIMSICState),
+    .class_init    = riscv_imsic_class_init,
+};
+
+static void riscv_imsic_register_types(void)
+{
+    type_register_static(&riscv_imsic_info);
+}
+
+type_init(riscv_imsic_register_types)
+
+/*
+ * Create IMSIC device.
+ */
+DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
+                                uint32_t num_pages, uint32_t num_ids)
+{
+    DeviceState *dev = qdev_new(TYPE_RISCV_IMSIC);
+    CPUState *cpu = qemu_get_cpu(hartid);
+    uint32_t i;
+
+    assert(!(addr & (IMSIC_MMIO_PAGE_SZ - 1)));
+    if (mmode) {
+        assert(num_pages == 1);
+    } else {
+        assert(num_pages >= 1 && num_pages <= (IRQ_LOCAL_GUEST_MAX + 1));
+    }
+    assert(IMSIC_MIN_ID <= num_ids);
+    assert(num_ids <= IMSIC_MAX_ID);
+    assert((num_ids & IMSIC_MIN_ID) == IMSIC_MIN_ID);
+
+    qdev_prop_set_bit(dev, "mmode", mmode);
+    qdev_prop_set_uint32(dev, "hartid", hartid);
+    qdev_prop_set_uint32(dev, "num-pages", num_pages);
+    qdev_prop_set_uint32(dev, "num-irqs", num_ids + 1);
+
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    for (i = 0; i < num_pages; i++) {
+        if (!i) {
+            qdev_connect_gpio_out_named(dev, NULL, i,
+                                        qdev_get_gpio_in(DEVICE(cpu),
+                                            (mmode) ? IRQ_M_EXT : IRQ_S_EXT));
+        } else {
+            qdev_connect_gpio_out_named(dev, NULL, i,
+                                        qdev_get_gpio_in(DEVICE(cpu),
+                                            IRQ_LOCAL_MAX + i - 1));
+        }
+    }
+
+    return dev;
+}
diff --git a/include/hw/intc/riscv_imsic.h b/include/hw/intc/riscv_imsic.h
new file mode 100644
index 0000000000..58c2aaa8dc
--- /dev/null
+++ b/include/hw/intc/riscv_imsic.h
@@ -0,0 +1,68 @@
+/*
+ * RISC-V IMSIC (Incoming Message Signal Interrupt Controller) interface
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_RISCV_IMSIC_H
+#define HW_RISCV_IMSIC_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_RISCV_IMSIC "riscv.imsic"
+
+typedef struct RISCVIMSICState RISCVIMSICState;
+DECLARE_INSTANCE_CHECKER(RISCVIMSICState, RISCV_IMSIC, TYPE_RISCV_IMSIC)
+
+#define IMSIC_MMIO_PAGE_SHIFT          12
+#define IMSIC_MMIO_PAGE_SZ             (1UL << IMSIC_MMIO_PAGE_SHIFT)
+#define IMSIC_MMIO_SIZE(__num_pages)   ((__num_pages) * IMSIC_MMIO_PAGE_SZ)
+
+#define IMSIC_MMIO_HART_GUEST_MAX_BTIS 6
+#define IMSIC_MMIO_GROUP_MIN_SHIFT     24
+
+#define IMSIC_HART_NUM_GUESTS(__guest_bits)           \
+    (1U << (__guest_bits))
+#define IMSIC_HART_SIZE(__guest_bits)                 \
+    (IMSIC_HART_NUM_GUESTS(__guest_bits) * IMSIC_MMIO_PAGE_SZ)
+#define IMSIC_GROUP_NUM_HARTS(__hart_bits)            \
+    (1U << (__hart_bits))
+#define IMSIC_GROUP_SIZE(__hart_bits, __guest_bits)   \
+    (IMSIC_GROUP_NUM_HARTS(__hart_bits) * IMSIC_HART_SIZE(__guest_bits))
+
+struct RISCVIMSICState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    qemu_irq *external_irqs;
+
+    /*< public >*/
+    MemoryRegion mmio;
+    uint32_t num_eistate;
+    uint32_t *eidelivery;
+    uint32_t *eithreshold;
+    uint32_t *eistate;
+
+    /* config */
+    bool mmode;
+    uint32_t hartid;
+    uint32_t num_pages;
+    uint32_t num_irqs;
+};
+
+DeviceState *riscv_imsic_create(hwaddr addr, uint32_t hartid, bool mmode,
+                                uint32_t num_pages, uint32_t num_ids);
+
+#endif
-- 
2.25.1


