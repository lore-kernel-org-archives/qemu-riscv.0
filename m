Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKCuA-0004HG-3u
	for mharc-qemu-riscv@gnu.org; Sun, 29 Aug 2021 00:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8689bb0ac=Anup.Patel@wdc.com>)
 id 1mKCu7-0004Fm-TX; Sun, 29 Aug 2021 00:58:47 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:54436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8689bb0ac=Anup.Patel@wdc.com>)
 id 1mKCu4-0006P2-FV; Sun, 29 Aug 2021 00:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630213124; x=1661749124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fYCuQ02btmXA3G0y/JODZ8B6fAzkUfHvbrgQMHGJo/M=;
 b=bpyIpIfy35AnvFMd0NMssPX0ipMe6jEFKivbm6hoDBNL9noE36vJABNP
 fOZrac+okC7gFXIn2s6fv4R7MPY973RtbkBDMq1UFBIK8L0WJuU5zkRyo
 tQmEsvBAwlXvakJ9ij4+LeEOr+JTxDlAmlCJzsCKzDASyjX4YQ5BkSfGZ
 47nxUi6IsxSVVuegDmv4DJvOWTSjeW6Va//I4NncEeUS48YvNRzFeAmlH
 3LOjOxkfYthhrMmA3pMdIKwZcL8pXEVWk80uM2DuDVkZBlyoc4wlfT5yw
 Ug3LDECvjr1ZCDYqC7t8kapjNpeUMwVkoWdW3bO2yGguKe5aT8vr9L7Ma w==;
X-IronPort-AV: E=Sophos;i="5.84,360,1620662400"; d="scan'208";a="177798721"
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hgst.iphmx.com with ESMTP; 29 Aug 2021 12:58:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFb1sbcWrBd4vJHRIIPES/Fon6J+SzuZxsGEncay0ZkJZzzO6ihwvJipxxdb2KsRHJ6NQ4UQmv3DRLzc+X0QBVzUEDbjk20Z9ARpLQLr6THOh+182sR25U/djWvuuXrWuI8sV0RkiO/m8D+D4oT4hJ5WMLFsptP1TctRcyegekWGissEmZdRk3kGN7K8/CEF0PkHqpd10A4vsxHVYvMDKtuJ8AR9GFHl311ic6ThSCB7Rtf/cVy1gVvQcaNVi2SmYoIHAYi9/CMyJse9sO9vBxd7tuJFlI37IwlFbU0V8yjDPK51GAlTICzmsMGdoHtrBv1L+2+20y6W9TKfOFST/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=800e/JMH+VJuXiWsb6J+wnMn4erOCeYCCvw2ENvtS5Y=;
 b=hptE8DUGQV/H0tJplg7rm6qmJRkO+deY4VJuyNYRAiPVA0O1fdbaWfxTTFAV+zr4Hn0nJX4AwNBe2g2jXRS7f31jWYcC9WWe2xrFqg2dM5Zgk81/CjBO+me/ibhEiPP19BW3EPM23GCzVLWeMAKi6Yn/YdxTdfAmQKDA3QD9XGXFFDzK21EgZpKJjb+s/OCduMg8KEUHFJV/as093W3isMs4Ws8B9fyf0kac9IUDwVa8w6XZem8w0vszjxNYc8Jw4QrIkuGYm7MpOHoW+mLYEvkWnxq6BR70BFhRgF7eMNeCbfuQalMZQ/HEcmN4sez1aJJ7dyZsqp79Td6P7CNmnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=800e/JMH+VJuXiWsb6J+wnMn4erOCeYCCvw2ENvtS5Y=;
 b=zkb0AYuc+fKc0LR+Ntuq3AM8wzBchg3Rtwf2RmdXYozWQ3kwt1MgVJEHFGEGmJgRdoItV9HPEy0249kzqH+6wnczQzkuHVYXUoDR2sTs/4nXw50LXTVpJbi1j6RYa6F5v3P9gAd3nRB8TX2QU0uBwt5g8sna0P+E5uT+sV7ep+w=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com (2603:10b6:a03:3ac::8)
 by SJ0PR04MB8274.namprd04.prod.outlook.com (2603:10b6:a03:3e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Sun, 29 Aug
 2021 04:58:40 +0000
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514]) by SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514%8]) with mapi id 15.20.4457.024; Sun, 29 Aug 2021
 04:58:40 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 1/4] hw/intc: Rename sifive_clint sources to riscv_aclint
 sources
Date: Sun, 29 Aug 2021 10:28:11 +0530
Message-Id: <20210829045814.69744-2-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210829045814.69744-1-anup.patel@wdc.com>
References: <20210829045814.69744-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::23) To SJ0PR04MB7821.namprd04.prod.outlook.com
 (2603:10b6:a03:3ac::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.185.161) by
 MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Sun, 29 Aug 2021 04:58:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3562076-a1be-4d27-afd5-08d96aa9ab5d
X-MS-TrafficTypeDiagnostic: SJ0PR04MB8274:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB827474F498F47EFA27F9826B8DCA9@SJ0PR04MB8274.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:23;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SV/yck5LgSxMXA4Cep597wsjGYqBDoYkIrUXn91ljdJHuCywz5fr6qaddo69G5vCXNR3S0X+Vr5kVQSI+sLtLO7o3Mmt7P9xiB7HFvg7aWCyFrdH2CUApqZ2qvFAl9B2YUDmaseU5JjMMTeGzbI7scV3/zHiHnKBb19V06tVzREReP9VFkFWAjz20bvQFnk4mIyHOw3obSL5P4CN9OUntIzgI0BzcF0wEfeRxmqz999kHrFEPuw3wqJO2o7r4TxpqDbmvWa6pr2uZJbs4g6TxmOrtbtddCQTTfhL8pCJaq5okEGpgbc/GweYI44heHOIFEv6CEVKiSHwm2Ggc2WcThLomnc/jBSbc3WD0o5K3dbHRCMimQYf/0IbfZt5jOga1tQndZmL6OvPp6hzJLDfjpg+Q9rRUMuJaKe+jf+3hodFDYw1lCaZ4mQNmJMa/9fWkXX6JPAwRiu+2WcISeJ5kXYWsplaQn/2h4YOuTKOjj8QS+ScVk0hRrNEEVkED6M9pY6QdKFMcYu+QTSC5XilUQAB/Pe95noPe3tMP4IZIoGUmRvNKwbWysTLrhTlnUTC9zEsFb0J0gpcqTq1cvKEOpMjbx3416CahinmhIIA7C/kkNzOmLoNGPtIpNiKR2HwbdJ5C0B9BfweJfCj1aS5TX78Z7HNskvabLdmzQK8zEntoETA5P+ojxSssmNJ5ANojgmuwB03SkTJ/CETutSIiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7821.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(38350700002)(2616005)(478600001)(66476007)(86362001)(66556008)(38100700002)(52116002)(186003)(66946007)(956004)(2906002)(7696005)(6666004)(316002)(55016002)(36756003)(54906003)(8886007)(110136005)(4326008)(8676002)(8936002)(26005)(5660300002)(1076003)(44832011)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/q+D2DEGaKUqLww+eBmH1rlrYtFLdBebq1kAuovRmTXIPJFXdOeuLuqTAwb6?=
 =?us-ascii?Q?y8to3pbTHsNJkADA5pl6dgPTjtf+yY5c+U7ioMaWH7pByKxbkkZ46n7QUPW8?=
 =?us-ascii?Q?lrV+G1llrfaqCcx0cggM7FED/nF20TVR9i4YpzSQv8KhCU/IAr3RNjHROYzL?=
 =?us-ascii?Q?ZTHYiVRCehCD75pJvfIFElcMvqez+hxq15iVocu0UMwXPhae+7g50K1AHGY5?=
 =?us-ascii?Q?CbS+NiWkMN9iYm9dFUzuK9Ps76Ax29YiOA8pM/UAuKE8rcUeeOnBubP+PHrZ?=
 =?us-ascii?Q?dD32j/oQPiaJ/ldsj9Wb2fVoa0+hPMDvm7vL0U2ublE8gtolk5n9rlslOlYq?=
 =?us-ascii?Q?094o5pW4tmBU3TY9qfaMp/v3Lhsu2GhpMWJYuU5nh8V6YQX6h5F3WSjE962s?=
 =?us-ascii?Q?iRXmA8PMhF3GOvtjrFKLbvfKMrDk33Uz3BiMdGoiM9PUrcAQh+W3IdWOY+qF?=
 =?us-ascii?Q?+Z6YELyeGRcQCT9HnOAhWeZMO3iNHaCJc+Ap+OFdJJgGS4caNJan0x4wh1hL?=
 =?us-ascii?Q?nBjy4hQ5hfAQRqVAhk5j01XNwe58PvPjNxvleVgTVKXMtg5wtWLghNjM+oX/?=
 =?us-ascii?Q?Gbl91rpf0HAMQbFhfZj9gqVc++hNrZP2B+AfE4qvgQ4iGRsuK1/WpZ0BnVRc?=
 =?us-ascii?Q?rtclnbgKgtTPZfc0FcQj5/JxDeVb7YWXuE2ugVa6P14yd1zgHv7e3mE+hg53?=
 =?us-ascii?Q?VnSCJ+b7dWijcDTH7dH7TNZpznOu2xreZ3EbgYfJlY/co3tO0JP5CRyvkKMs?=
 =?us-ascii?Q?6e+BRl+/KdpV+wtRN/F13OmAta3AKG4vYeSy7BJBKBdossPzAiGugKFZUYjS?=
 =?us-ascii?Q?HigEBzBqKXvO3nj6gOLHkChOioTHHEfQjHaOCC1xCXFSgUaz+YjnSYMIBNBm?=
 =?us-ascii?Q?PBB/2X2U6B5r66htJrVt+hWr1laP39T0Idr7Y1/dr+WVKVcSdTshmaUjEBId?=
 =?us-ascii?Q?oihTx65pcykLgzEfnptLfRdfYVHzevN7JI6entChRqMUoqypBsMJxd1p2okm?=
 =?us-ascii?Q?kI1GafY5U6ekR0YFZoCUmV7dgsG/9JvaZ5lkd4yOyMbavMDWezSKXvddGFiF?=
 =?us-ascii?Q?rMeH9MFRI2WcRf5R5p22IQMBX2W5sNtWQHd65mZsyvV07Rqv/FKVLZ1zuuEe?=
 =?us-ascii?Q?UZAD7Bfo6pDojvGkqi2OP0xloxXA5l7kEO5Fe/UwkDPnHbg093tFoHPEAqwI?=
 =?us-ascii?Q?HE9csEd2H3z4ircEGUbI7XXqmq539lDStZZZKVihbIQbzbw53LkABh0nqEw8?=
 =?us-ascii?Q?Igd71gn2jzrYmHs4bWgja8eEd2d7hFsMhKcLjgdgmdiumo/GlO/dKtYADZgr?=
 =?us-ascii?Q?47sq/ICgsA3z8hsfRBMJoEu2?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3562076-a1be-4d27-afd5-08d96aa9ab5d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7821.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2021 04:58:40.8220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zSSQStn37tz7o3YvOpaEq51c4wvkxTcxHlxnZUTQwaKlmyFQK42v/BJvdXrCCIDYqWBqCP6mT4fpktcFktPXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8274
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=8689bb0ac=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Sun, 29 Aug 2021 04:58:48 -0000

We will be upgrading SiFive CLINT implementation into RISC-V ACLINT
implementation so let's first rename the sources.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/intc/Kconfig                                    |  2 +-
 hw/intc/meson.build                                |  2 +-
 hw/intc/{sifive_clint.c => riscv_aclint.c}         |  2 +-
 hw/riscv/Kconfig                                   | 12 ++++++------
 hw/riscv/microchip_pfsoc.c                         |  2 +-
 hw/riscv/shakti_c.c                                |  2 +-
 hw/riscv/sifive_e.c                                |  2 +-
 hw/riscv/sifive_u.c                                |  2 +-
 hw/riscv/spike.c                                   |  2 +-
 hw/riscv/virt.c                                    |  2 +-
 include/hw/intc/{sifive_clint.h => riscv_aclint.h} |  0
 11 files changed, 15 insertions(+), 15 deletions(-)
 rename hw/intc/{sifive_clint.c => riscv_aclint.c} (99%)
 rename include/hw/intc/{sifive_clint.h => riscv_aclint.h} (100%)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index f4694088a4..78aed93c45 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -62,7 +62,7 @@ config RX_ICU
 config LOONGSON_LIOINTC
     bool
 
-config SIFIVE_CLINT
+config RISCV_ACLINT
     bool
 
 config SIFIVE_PLIC
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 6e52a166e3..9c9338a9e4 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -46,7 +46,7 @@ specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('rx_icu.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
 specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
-specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.c'))
+specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true: files('riscv_aclint.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
diff --git a/hw/intc/sifive_clint.c b/hw/intc/riscv_aclint.c
similarity index 99%
rename from hw/intc/sifive_clint.c
rename to hw/intc/riscv_aclint.c
index 8a460fdf00..0f940e332b 100644
--- a/hw/intc/sifive_clint.c
+++ b/hw/intc/riscv_aclint.c
@@ -26,7 +26,7 @@
 #include "hw/sysbus.h"
 #include "target/riscv/cpu.h"
 #include "hw/qdev-properties.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "qemu/timer.h"
 #include "hw/irq.h"
 
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index ff75add6f3..f065e32dea 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -12,7 +12,7 @@ config MICROCHIP_PFSOC
     select MCHP_PFSOC_MMUART
     select MCHP_PFSOC_SYSREG
     select MSI_NONBROKEN
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_PDMA
     select SIFIVE_PLIC
     select UNIMP
@@ -26,7 +26,7 @@ config SHAKTI_C
     bool
     select UNIMP
     select SHAKTI_UART
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_PLIC
 
 config RISCV_VIRT
@@ -41,7 +41,7 @@ config RISCV_VIRT
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
     select SERIAL
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_PLIC
     select SIFIVE_TEST
     select VIRTIO_MMIO
@@ -50,7 +50,7 @@ config RISCV_VIRT
 config SIFIVE_E
     bool
     select MSI_NONBROKEN
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PLIC
     select SIFIVE_UART
@@ -61,7 +61,7 @@ config SIFIVE_U
     bool
     select CADENCE
     select MSI_NONBROKEN
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PDMA
     select SIFIVE_PLIC
@@ -78,5 +78,5 @@ config SPIKE
     select RISCV_NUMA
     select HTIF
     select MSI_NONBROKEN
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_PLIC
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index eef55f69fd..eed9e81355 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -49,7 +49,7 @@
 #include "hw/riscv/boot.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/microchip_pfsoc.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 09d4e1433e..f9f0a45651 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -21,7 +21,7 @@
 #include "hw/riscv/shakti_c.h"
 #include "qapi/error.h"
 #include "hw/intc/sifive_plic.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "sysemu/sysemu.h"
 #include "hw/qdev-properties.h"
 #include "exec/address-spaces.h"
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 03bff21527..1c55435d8a 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -41,7 +41,7 @@
 #include "hw/riscv/sifive_e.h"
 #include "hw/riscv/boot.h"
 #include "hw/char/sifive_uart.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_e_prci.h"
 #include "chardev/char.h"
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e4eeb25596..d1211e1c3d 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -51,7 +51,7 @@
 #include "hw/riscv/sifive_u.h"
 #include "hw/riscv/boot.h"
 #include "hw/char/sifive_uart.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "chardev/char.h"
 #include "net/eth.h"
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index fead77f0c4..f682b7ed4e 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -35,7 +35,7 @@
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
 #include "hw/char/riscv_htif.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "chardev/char.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/device_tree.h"
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4db40bacae..66de5d3767 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -32,7 +32,7 @@
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
 #include "hw/riscv/numa.h"
-#include "hw/intc/sifive_clint.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_test.h"
 #include "chardev/char.h"
diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/riscv_aclint.h
similarity index 100%
rename from include/hw/intc/sifive_clint.h
rename to include/hw/intc/riscv_aclint.h
-- 
2.25.1


