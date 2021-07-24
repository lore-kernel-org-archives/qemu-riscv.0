Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m7Ghx-0004Y4-BK
	for mharc-qemu-riscv@gnu.org; Sat, 24 Jul 2021 08:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=832e875c5=Anup.Patel@wdc.com>)
 id 1m7Ghv-0004Vp-2I; Sat, 24 Jul 2021 08:24:43 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:42836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=832e875c5=Anup.Patel@wdc.com>)
 id 1m7Ghs-0006Yh-FF; Sat, 24 Jul 2021 08:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627129480; x=1658665480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=T5x2vIecCSAX1cSUq5FGt+EexYZQd1U0gam5hGQmFTA=;
 b=VFcshfasMk5Y4qth60esxzFWVEaVCCLCim1jDzc0J4H0JBLhKn+4qINO
 YjluVqd5YBQnNUW3ALLOOVjnKbnbYWgJ3E6rJh0TD3ZT/BLN2m6g9x7Ud
 DIGXdvXAWzfOV67gpPF59bVxVo0m9o7mgzo5Z9clOJgzjEhmVXnDd5Gjx
 HQDWN70q68O5+5kg1ZmMf6AJpclFh+q76eSrFITkTMM0Lp52+df/ymO4v
 54H7I194KU5Q51vdWCVdbYZ66Q+abp5rFUWdANpjxHqAMoPE7zNcqIjEO
 X04ARhwUe9dPC9iVaACOlXcXt3hzZc2Uv34y+MkPqYegGpX+nqgCWuum2 w==;
X-IronPort-AV: E=Sophos;i="5.84,266,1620662400"; d="scan'208";a="174620605"
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2021 20:24:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfGDH+9/jzSZefBqN1n6aCsSKV/0Hhkbhd3lkUvUMCOMwyq5tHnroHJdjHRCD5RGn7g6Yd9/5G4J1QgfH2uIiQ7xXWo6QVD1TYWepvF71H29NRtQOXpzqtfCZWJkgoTbwYRKSEzElbvfIXeaDvWM90V/V/nnEWjtD1tGL3KKcovIzD794riDsoarUkaIO4HRlgsOuDoApSJaT0IzIWMv5vjKPgGRan5SCIcl7veDcazyrjBQ4XnFBdIfLMijZBdA9oNDqee5BM4FlZ+466stfhcnNkM4LIRE6SOvOodDDCv8Op32Pb202Gqd1IKoyaC32I26RnXkVqBOZRwlPDul+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa+y7uX88TWdstlIYQljtS8WlayDmxO4yCbkit5wnkQ=;
 b=OeUWh8fs1rTqtvbIbHnyKXnf3sremkV8P9Fz5EsR6OSGBMn+3nNuVfX4TB52vPr1Gycn3P3tzlxHOR3m4lT8yuAMjCDptH69xHlflFrL2wmI9Mk6WrnGvtMHV760tBgCkL9i1Hwh2fPrLwf82N/GyvctLxUIiEKWJ6Xd5y6+/6wpR2cU+qoqvT73TD+eWlPyh6TySIyVRh/CGhfusK6Ofd+FPl31AGe1bsr0y6+IxnS7PlZoS2ia7acqp2mi2nwHoS5Z3UYveD9bXPioCODCkDxWTJn8aqj/IFg6AAyN3/dCHfyX9WfRipYiSpA+C2vGeCpp5SzgifF8oAaGJ2KKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa+y7uX88TWdstlIYQljtS8WlayDmxO4yCbkit5wnkQ=;
 b=spg55Z/Dnd1z/eq6MsuK5+cki/8iADrK1NfrkUSda4wQt8zA1CbV1UJmNutmfKQ24RjMEDzROQh7RhXV9RYifeJd+IMnBgGkWPkIpYYjGCE4nu5psi2+86TtQne73zhpnXE5GKOvxO+7C5+/SBcngNRqbbEuXaTu2WyGsFR1Mfw=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8283.namprd04.prod.outlook.com (2603:10b6:303:152::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Sat, 24 Jul
 2021 12:24:35 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%8]) with mapi id 15.20.4352.029; Sat, 24 Jul 2021
 12:24:35 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 1/4] hw/intc: Rename sifive_clint sources to riscv_aclint
 sources
Date: Sat, 24 Jul 2021 17:54:04 +0530
Message-Id: <20210724122407.2486558-2-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210724122407.2486558-1-anup.patel@wdc.com>
References: <20210724122407.2486558-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::19) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.61.225) by
 MA1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Sat, 24 Jul 2021 12:24:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 260412ee-91d4-4ae5-ea19-08d94e9dffab
X-MS-TrafficTypeDiagnostic: CO1PR04MB8283:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR04MB82832FB4F7AD5C0461FA997D8DE69@CO1PR04MB8283.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:23;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dLaBCQdjjMpaeJ3/f+84YTTY71Z80X4qSXhQnUV5MuzEAy0dXQ/L+cf6ExmXcmgDx729iUsUCJrou3RYoav/ehyFb4nqPOHUCpP4/I4jJ6IrHuyabKwY1J4d5JcLI9afTJo3v0u29SX6zpGFjQIzqgjRBlt+mdT0HIL5YKOzQ5NKEPRH67OPK8qx3gv36FKsEI3uya7wPuHgKsq6N7XMG0kU7NUuROUuWD39ud3yoyjJogffNSm+fr1Dhmo+4r/T9qlOsCrz0QlD8PEGkLNxBxRCCNKz3EfGxuid/VackcT845XOh6JnEMZg0ydCk+rfw4jPoAXFZMtYxvEhwt+j14f7OljKZIV63ZjedB+OJWc9bgnsL+u4YxB14JAWwIRSbvc9vL1e64dZG7p+xJ5tppEpyh5zpXaIuEekWrCkwhuMtbcLFV/rZcl40cViIPIJe5WkcfOANkpjkvNJ+N1/La2KbnMcmMKNk9HlKNLdsXAnLzv4kGmh4A5ZM5hqw7L8A2zacN1T3Y8vBmx8EBFh1m0Q3to5kTZtzy7PLM0TVUew2EGe8RSxrfGwsCXbmeCnjJYlq2hAzzD417aCQfzHwaDaKy2Oyn/0XDhDELtoUfj69bVtwyogR2t4GdWwZpTY7/0vzaufIvCvUjV1OFXBzF6XJKvXHe6/7l5zHhTlu2h0NEU+9McDkB6iC5qvlIfY86W6efBQYA/9zECgvtaNqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(5660300002)(86362001)(110136005)(2906002)(38100700002)(36756003)(38350700002)(54906003)(6666004)(55016002)(316002)(8886007)(8936002)(26005)(8676002)(4326008)(1076003)(7696005)(83380400001)(186003)(44832011)(2616005)(478600001)(956004)(66476007)(52116002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7jkf8msRqdQef/Duei90pub5XIR/ONRFKR2QeWMXSzA5FQO97PtsoMqcqKwx?=
 =?us-ascii?Q?NNPA9zstpAkwubqoInMtD6Krv8cppQ8EqLR6EmVDQhoWJjAfvAM8KM8LCAEv?=
 =?us-ascii?Q?p/FTDIw6LTHQCrDMNJUE918x99e4Ix+/l2nV3F/dDtKXVgJY+BaDvgFA9C9r?=
 =?us-ascii?Q?Mli8EJIWA84mg565LxBSo/R03kY72WdIKBTw7tZHTiohtGMOh7uZ6FB2p0av?=
 =?us-ascii?Q?aa5eq/UNt8a0URQ9VpfA77Gebg12LuYrH8ih1hMDRjv6gN96KNnGUZLRlrEA?=
 =?us-ascii?Q?ko71+wDhI6wpw9Xe9BLB0mPDMWRvAxgEUuhiuS04Kp2L7p0blbgb+9ApbdG4?=
 =?us-ascii?Q?1LjvKOFkG4JHPQir2AzpCcFsN3UBSjtV2jwIfkv2J4pEM1LjAMUWl60o4zko?=
 =?us-ascii?Q?lL5/KlLP6sh48snVcsNPPVlYcf97BS9SeKOA+8TxjJlHjXaQQLbmGHB2HPlj?=
 =?us-ascii?Q?oz45B3JbX38TqBDuN1umXe+XxdgBHpQpY6j9v2pDXNAOqdMhUOP84pdFawC1?=
 =?us-ascii?Q?DJzVZ3kQ0lBcB/3E32kdJWFzqwn+9CDMTTGzcxfZoKkgitK83pbRa/hQfJwj?=
 =?us-ascii?Q?vDVNszh/5Qc5lxQnh8k+cXs1hieE2JATfIUbvIx1P0WwysytXicbPYNnfhz2?=
 =?us-ascii?Q?JPVF46fg8jGDSuFpw78EVJkXoLeLQfDPOLBncmugq4MPxcRo9dwUd4N5+uMC?=
 =?us-ascii?Q?pK9wQFnDfR+Yc47wlhdMQonqboS2/0AG+XN5mC7cXRHE/bxqv3cmhUih6jBz?=
 =?us-ascii?Q?I5xTwoSYumeriZisCmEm+EI6pVU5dXnjwZ+hs8C9JlGXXWNGsYT1yIimwr0C?=
 =?us-ascii?Q?69nv3ddOUOVvRmfX5bsvp9pHA+zWYUAXeXADWjayxIXfwKGr8vnxk79sSQ4J?=
 =?us-ascii?Q?5OOfulxLqfDrUxRmV4xzldnPey2Lw4pdg5CcCBL27BgMg5LGa2p9DxHJj3w8?=
 =?us-ascii?Q?ZDHOdELM4fQ1suHdM+OA9u9KsqFNwHxXzyLis9gvQMAZQaGWNipbBZiFQy/q?=
 =?us-ascii?Q?frFsjgETgBV0gQpf2QvgPsbWUCLapVSLWezGU1xqft8x8GdCI1W9C0pZQiTH?=
 =?us-ascii?Q?bWb/DfuC0L2jNi9h7v64c+RV8LD0Ye3xR9yoVGKE/1YrAn0P3cSkUTjlC0jX?=
 =?us-ascii?Q?t81whRaxADJhVU3Wx518jJOis7334xrQNOWqg7SL6BSLZByunvlD4Zkpy3lI?=
 =?us-ascii?Q?YxLkfKnITqiTvziWRVEG2Nw2RfWT5TuZszjHu/2Bj4895OP6QhrWXwKxcda4?=
 =?us-ascii?Q?4Zj5hiO4JOVV1hFrecaZa6LsZTFevp9WaeP9SgFe77winx8remHZ0hpy25Gw?=
 =?us-ascii?Q?ZeV1zKxaFlCSMJAc8YOnLEOd?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 260412ee-91d4-4ae5-ea19-08d94e9dffab
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2021 12:24:35.7109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4DudTaYsiCDPYd3jxcPGfXSJwPUA26buN6H2YiZ33BS144A2zE5KlV3XaKgZpljS1NHLaMKPTYqXRYON3e6Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8283
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=832e875c5=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Sat, 24 Jul 2021 12:24:43 -0000

We will be upgrading SiFive CLINT implementation into RISC-V ACLINT
implementation so let's first rename the sources.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
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
index 86957ec7b0..bfa46694b7 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -9,7 +9,7 @@ config MICROCHIP_PFSOC
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
     select SHAKTI
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_PLIC
 
 config RISCV_VIRT
@@ -40,7 +40,7 @@ config RISCV_VIRT
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
     select SERIAL
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_PLIC
     select SIFIVE_TEST
     select VIRTIO_MMIO
@@ -49,7 +49,7 @@ config RISCV_VIRT
 config SIFIVE_E
     bool
     select MSI_NONBROKEN
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PLIC
     select SIFIVE_UART
@@ -60,7 +60,7 @@ config SIFIVE_U
     bool
     select CADENCE
     select MSI_NONBROKEN
-    select SIFIVE_CLINT
+    select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PDMA
     select SIFIVE_PLIC
@@ -76,5 +76,5 @@ config SPIKE
     bool
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


