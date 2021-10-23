Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meChg-0003dk-Eh
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChb-0003RT-4h; Sat, 23 Oct 2021 04:48:32 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChX-0007M3-SP; Sat, 23 Oct 2021 04:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978906; x=1666514906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Ak0uup0d96hc2wxT3jDMK4AIjD0uXa2oJIOfn+7lg6M=;
 b=YpIJgZ4HLH0Zf3gTU8SAf+x7RZbdACLKOUocuXWBAn6s/OaTi47nhZtB
 rAuOLxSSZ1Fxo1LrM0oOiUv3tFI4IRukZPs8ave5hasXbz3OS1WR70jbP
 jysT1MXOxBT5VYZsn5nFljjpfOaT61tNoHWBli03dBoiDj51u4qc9Nn5+
 t/UO7YUOadKdd+57uii8XwpNgbrJS8pa6puqLhYQ0RpuvY9bMqkx6vUpY
 AXgXnuyGALQG7RPi8Qw1uiQ0W/nEOIYoqbJfMPa3Oy0DyhZULtXF6R0xE
 5weCZXq8hUE1E4/+td9Qe6nuTCboh9+DRu1Nw7cUS6dgHDmi6a9mxtp9X Q==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="188437390"
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:48:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPpKcQFWoUtpXhWEt7FHpbXMDqUopAprNocpZqAAIBdgIIi5YmgI0T76pNt0RHh5w9RudOoV1lM6HByNJJ6fF2FonzeZKN3FfXOjmEvqXiT8dKc32OxmXC4Ih0qem7Vu5LnmlNChwE6/159Y9timqTvq24Hvsu3JfeuVwHFZfePFp409QYfSJxnjCSZ1AD3T3dXafYHv6TJm9n5JNXwoalwKv0kZtMybOV1FN8p/ZEoXdg0X2EYKaqVqqQoP36G2XH4E7im4aeB1W/hNGMAwCW72EObDtU07xOcWdNO3CSd44lHjGgCi2/lrtmSnn9tGf2ujPna45j0Osge2eHyl3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPJSo40mxOP2XRJtZP9ssE6sYMVg/ZRrTALtjXTtDP8=;
 b=bdJ60KKnZcz+aJn3a6UeZiTnb5gUuygcq1J+yoLtbrVbIv0m4JcijNhIyYLmCFqLiy4/l5K5vgIu/5jPS2ToFh8SguB5CFJtBBBbEgtJR2MzU2OS9f36EqgoG7+gfr13dIluUo6Twf5lsBtYgSzqLA0A1jwq1F9yZ9c4qyhfbd3b7nEphn+gICNCW8i2Z3ZfwCGI2xdzjPBo463v8FpHsUGLxDI8yY9NN657r8ZCa9IAmbTX5ZJxI76CppKMMgmQIuReEArZ30lgt/De/XgKZ9d5IB+S+iR2hIDkohGNmd6k+cSDynR+40yssTEJi9fMnIyJNk2Y69P9YMSwgpWsAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPJSo40mxOP2XRJtZP9ssE6sYMVg/ZRrTALtjXTtDP8=;
 b=DaBDRO2/FntPB0Ek0SUQSUTrXwfBGUvQg12Jsu+KSA2qGwZfb5G3w2pvgMYe4CNFsUG5fHAkjYE07PWiBIObhfyS/7POx6j1WqpYFk08/77B3XfoYWLKgjET1/WG/RH+ZEtI8yEJRlqpbEbQ/gSG/7jV2/0kzUeP4cfgzdvuHbk=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8409.namprd04.prod.outlook.com (2603:10b6:303:140::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Sat, 23 Oct
 2021 08:48:24 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:48:24 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 20/22] hw/intc: Add RISC-V AIA IMSIC device emulation
Date: Sat, 23 Oct 2021 14:16:36 +0530
Message-Id: <20211023084638.1697057-21-anup.patel@wdc.com>
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
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:48:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58bcea6c-d0b0-4b7b-41d1-08d99601df76
X-MS-TrafficTypeDiagnostic: CO6PR04MB8409:
X-Microsoft-Antispam-PRVS: <CO6PR04MB840964499078D8D95C9EE9558D819@CO6PR04MB8409.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:224;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wDZgcTR8EUAfa5eEdhjKqNdWjnCsELKYMP1JvzU6knWus7WWguh0/0XfPyV0ab/O6fw6DI3X23RubNClYWt9cRvwZtnFBPOKgk0k6FVycW7vBl+Q6KLDFeF0mt21PhAjUpeiOHYd625snJrOqzlyq/28MusiGv0XuRn65P9dKbc07wu+rXZZQ111WjLSOQ61VWnFOjOqLdBnaZP6k6yIBXMoyVkRvz5tkJFmh5CDbPnyxElKes8JgRp3f9BaRDoTIqgkXshJZmTlJ52SMjg7IhpoyzMO+mN9Zqm5JreQ4gncJ7rijSOEz1ZX36tGz+U6EyYAeVv05D9GBOwgWU6UzwPkkRde9Gro/ur/x2HPJ+Hguw3R+qKVlkiNYo9kNOLThnf9XSf9oNxHymljzImfrtBtx/Ntfn4EEWgMsrINfI8uRqg1h0hpdhZ61uLC/mKNIFBaJvJXFnicpzX8UfC8w1PheTTBNyej94iL5LgPnWYGDbwOqVzg6GfPRKDdI5UDHuDybRrACxnr8+b1Hqygtz51iEufcg9NYzQ/hFB7YO3R05gjlfWFckzfMChHIKl3gG8az1Sbix2l6r/8S3ILi7WyLzkpeB9hhTmSPej0RpAMEzU1pvR6vzoIvKsnuT9C0xDcofsdncKvnjHPfUDrqFUF0O6CmnUJMCt4rNhzk6AykaZ3XZydDu1aYgFuYP6CQyVdBQZVx9nEMDuW3tzNMlJNyaeOPkU/4qAvnYNWUJikdyTBvHMW2U570iD3VWyv6VBwQJHCO9D4VciVFpF7CltkWUjDv9CuDoNiJ5w4Dys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(1076003)(66556008)(83380400001)(44832011)(186003)(6666004)(30864003)(66476007)(2616005)(8886007)(316002)(66946007)(36756003)(4326008)(26005)(110136005)(54906003)(38100700002)(55016002)(8676002)(956004)(7696005)(52116002)(38350700002)(508600001)(2906002)(5660300002)(82960400001)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tNRobAdGpZCVIatp2OxPWV6GSRoPY0Hl5Lr4TcbWUZzVfaXxR+bFuNUWGFjk?=
 =?us-ascii?Q?pKSM5Bdr8j4pf1/QfHua8LcEUQPHSAJKAQhdUS5ayuUdyw3dR0xUdxAC4hPe?=
 =?us-ascii?Q?2ZDU0RsCwy6QFJNIF6wv7w7k9tR/FPVkZGjT/o9TVx0xZ9nM8r2QoI/eYUeG?=
 =?us-ascii?Q?X8dWkOXn25yMPkBlOPpefRpcJESsAdOxsEzT8Y1Z9T9xwDK2Yf72It/hXwt0?=
 =?us-ascii?Q?48WttQDZgoUEEuHneX55P0Z6Ygb2WAQidza4pG5AeHlpg6xHw+33LUQ4Ks/Q?=
 =?us-ascii?Q?OIFQBin4pLGp/JIIAwgoiaHlHx7kFx3Y6jN/odlJzGgULTpT46D3BBub4L/5?=
 =?us-ascii?Q?e979ZKZuhwBKBqsmGAVmRSw3Yhtism+9f6dZhaSG/QufhQshxkiYPDCJTQNI?=
 =?us-ascii?Q?sJrC4dl/jffO0LZnS/aaz0er11hakT+2zvBuOk+pPYOe4Ci+d5yOceX3t6+D?=
 =?us-ascii?Q?trjj2B1a40QggPgfMPb3EWPv/27MZjIxyy5RfhuB7wLo+iRPNzp8I4q8RxMO?=
 =?us-ascii?Q?2iaJwHU1VSjrF200yW1763TtdZNsgKKtOMv6zSZlUazR83lAOZ5e7CZ4Ql3p?=
 =?us-ascii?Q?0g5UPCjvPTGqqu7+CMyb5QgOJgoNI35SIkZA5Ar3RJ/qeVYJyYyDKEBJMNN9?=
 =?us-ascii?Q?+K/enew7GhjxZh0EgPRMjkDGbKfp7q8sFH0m3Ruozuc7sn6XA6MO3UtIKO9Y?=
 =?us-ascii?Q?gpBH0I/moIoGKXO/FkxtjimGlkyNlDIzRMafHLNmfK6BJ3SbBOVcAWDcxBcm?=
 =?us-ascii?Q?TG24aE4XlKxJxsfRCdApLykpksNwOQ1sK7kzD4yRlNy2/jkZYYoCc+3jUw5B?=
 =?us-ascii?Q?ZPdQMmJlDDw7uDEtluFfGnkPSqZWHRZlKydc2Mg5ujQJBkt4wo0lfb1Bl9xa?=
 =?us-ascii?Q?SWCXPwyupFW6crodx194EMUj4q4ki6SZvBCO/ZqzdA3UDmwYWO6rwU09KHSx?=
 =?us-ascii?Q?zQp+D96uid7DVRWQ3BRWOniTPMTTy5plP7G9Gzhj747WIiWfz/ewcMcxquXb?=
 =?us-ascii?Q?MNAnzuI0AZ+ZJDA21jppMDW3y8sp+p6LFZqkMqMPQmroTQvK4Ybyu8bl2+z/?=
 =?us-ascii?Q?/YIi+m3AGlc0qnmMyICNsRJJChQl/X1BfAB9WY/mNL5J3sOpPIWwXB+QvsTt?=
 =?us-ascii?Q?cAQFXK+S8dsdO/fcqdVr7GioANB0OKxh862a2GHhwHqjCRPq8Y7C+enpzO/a?=
 =?us-ascii?Q?/dMRv5TL+z14nBDQyObiK4Haf5dK97wYcEAlP1pzI9YabwYAvuSCSvXjx9m2?=
 =?us-ascii?Q?iBTHvZX+tUHB5jdBW66P5MMeecHhJ4PuoMI/f7lhOjiSfdYc2pnjrBAwPPR+?=
 =?us-ascii?Q?cFqh7m68va3LgfZlU5ChO8o6a13rY81cLXeg+uPF+/ckvN5mJbiLW/qee763?=
 =?us-ascii?Q?csfng2gp7VmQA+BQJnCpgZ4X8mgfsJz30hTjfpaBl5PvVJ75xX400FC9tFkL?=
 =?us-ascii?Q?RPJopkpW6W+nY1V3cJcXyoTOnb6tUqRdb3k9uug32fdRNC6/lVwrLwcCZbd2?=
 =?us-ascii?Q?SocqgZ9eRdjXwkyiEI+0f9gOtcCH79tICLMkZXFDgjVZj8X0OtFscmMgaNeG?=
 =?us-ascii?Q?yjX8CVL15oHqPu8JSNEA3tYv8jgsKb7ZJXa+iMYwMRKEgpJSPB69igaW9z6m?=
 =?us-ascii?Q?HFhn174uS1AM56p4FDKGEx8=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bcea6c-d0b0-4b7b-41d1-08d99601df76
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:48:24.1034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5E8+vva+/xIO0/F0WOUI3EfKWS1EIzg7Day7peQ6INxNxXk351LkSnvlOvJCA9hQei9hvC2lNHjGF3SCMWyaQ==
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
X-List-Received-Date: Sat, 23 Oct 2021 08:48:32 -0000

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
index 76d7ba08d0..3721a6bc39 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -49,6 +49,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
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


