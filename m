Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBt-0003ie-Ez
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBr-0003gX-UO; Tue, 26 Oct 2021 02:44:08 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:53782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBo-0002t7-0V; Tue, 26 Oct 2021 02:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230643; x=1666766643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=INNmg/hDvf169nc2ZiqfiMFwT909p8OF0AB4mrgOtxo=;
 b=VbXygnMqHFMOifgUf1OJU3pEMsRo/tagheU1z3E0Jdysqml5DWBEiQJc
 DtBGoieoGtn9rM6NC/PKOvnzAHTRnyhLN5HCPyDr2s6Oeyjdgz7zGap0a
 on7biWfDC0T/wJuAH1HaUrjsXC/rANeNHUOdeueXLL/M3VFi1oV5uBS9e
 df9lCa/Q1k9GxsKHWRIaMMuO9xzQg4rWwN+TBU5B0L0PSWXXp4AjpES6f
 lGKxOjfdHiNf+3pp5WdeQX6PXPYHOuovzDoVNC5Bftqj7dT0UiBKcEZdB
 /DopvcnugLUCMLdfT1FFQJ6xJjJ1MTmCWVQMfpo88wrajQxxSJiADaARd w==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="287722113"
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:44:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzFE+7Va80nilM+faZFrOWfjXRmEj+n3PeBFaYO6IQTEQwZ+KeVFL8aIxv8pD+zdsImS0uuYUqzdOurX9oRpQJ9EmAhwzPB5VhSHin9m7I8RTEXuJNp0nsFHuL7/wiVYf0bWNfNBuLQQ/25aubIkaS3fgySdAVXO+s/VML1kzbG2VfVd6POEsTpHiq6N+yC8XUv961fiwdZEZ4tJOcFJO4fk/RYaiJSpjSpXswEQhbouJCLFOzcKjFsfpGmrQYaSiwFb4f84J+Bm+eFF5a1uq6YQcD76jfp0YysYMrALaFLpaejlvuQb0uSibhGMYX7vyNQtZ2u8LfVLX0r8gkvY1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZExT2KE+FXyyR+Z/ptYaBm2OEHhmHudUcOL4ornmbEQ=;
 b=co+4EIGf6VZVZuQDF+DoLJl0Dc+byEgcZ32y8oFsFQ50bo4pTKK/xvtHRSGVQV3TBejqpqwGkac5DFInAppQj1fxj0eHdJco4HyeuZZ17v5vfIw2OUWW7Ynoip1rtfncJcRfOpy08kVg6/v4hgfPxCaWRdr2lQiNsGTTmsSd3lHXVxJu/QbXxXgF9VqXnDrWiqotbRGD/3BJaBpyfi9dnZiUbsZHw1ceOqQZrCkhqCURPMmAIBgKfK4tqIhOL+kDMgecdfd8+tQCxX42ENmpRbXvbfaN7kVI9FXvz7q+G1u3o5b4rIytjwioDp0RinPEguYyAyRJ3XjipabQPcSezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZExT2KE+FXyyR+Z/ptYaBm2OEHhmHudUcOL4ornmbEQ=;
 b=Rz/wYKhR7JX89DFNEHbQ2/3HnOW8fVK/fn+xwSuwse/PHySIVdW3c7FAXCtmD/VSwj6OCMfdsZk/faqzVZciWQ82gXu3I/ONdkiRi/Xb0p79pWQ2poqILd3QaESFRYvVF2PM97d/RfsD4h93H+cdZt6FL2UMm9W/JcVtIsaQTSs=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7825.namprd04.prod.outlook.com (2603:10b6:303:13b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 06:43:58 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:58 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 20/22] hw/intc: Add RISC-V AIA IMSIC device emulation
Date: Tue, 26 Oct 2021 12:12:25 +0530
Message-Id: <20211026064227.2014502-21-anup.patel@wdc.com>
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
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70447197-1ace-4389-2338-08d9984bfd15
X-MS-TrafficTypeDiagnostic: CO6PR04MB7825:
X-Microsoft-Antispam-PRVS: <CO6PR04MB78252E74BEC5AF5A4EC3FCD18D849@CO6PR04MB7825.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:224;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ETrJRWNsyekkTHAa/H1VRB/aL/s/jZpSLh6sjsYLjci2GUJs/fOjou4p9mvwR/y6iHNAmOvC/HKZyokMhx8zojIyf19UsqsSs5FoXgH/XA0vQaDRU/qGyXK0GY1F4Uvi1pzyowM7ddBF+a+f7fzW/RMpyjmcb2YL4VqILBBoKixQwv9qP02rrizqmcio+MPktHkn60GECcOeImAuqVU5xmRqAvZu4sgViaskGu5kF8B5ITwDaYb9TW+zShZQJsAJLIW7aCpK7jFx5FfMWPJVf6pCnrmWXKh+qbBH+MgoPpEP/buuDC+R/Up8tqVrIiiLSwYEwetNYSve/ljm5QTjNS8GBTXHhV/QSnk7uqRM7VzpHe5fyGmukFQLYllcp1/Rs29TYuhOQTn5lUi1A9D8gvJyWhmA5kMk4/5QLWDunlngBQmP25lM696TLYZNucg4IcqXW+3X0l3h299ZRlAUqfXtKXCeTGS5aw87xPtKJjVNFEF1A1aU3cNlKvqv5kuA6ktD4SjIrc3MtvVKMaDj5Pi/vflQIwftcRASNlAHZBhgQj5bEWHc5H+mECLRv/XzMUAmKK84FfSkdxr1xY3O6PnI9+O0YptT1hADJGfy6Nvxva/bcPv5swaxWZJAJwLG8e+ziKkA1PEjwgBBDDqVSx6X0LwSDZBX5Q4Hb433G8NVInch2y2GTfiKGgTLO3Jm6XFsYXVYJQq7aMH3o5K2b1g+q0iBjcqzGZa65nadCKqzJOIpD1I7o4ihlSZvorZdCvkUsFMqbPZPQXSYRxSLU2pGRXkqHHw3kfFHe+biFhw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(2906002)(66476007)(8936002)(66556008)(55016002)(82960400001)(52116002)(5660300002)(508600001)(186003)(66946007)(8676002)(36756003)(54906003)(38350700002)(38100700002)(6666004)(4326008)(30864003)(110136005)(1076003)(86362001)(26005)(2616005)(44832011)(956004)(8886007)(7696005)(83380400001)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3oVD1z0X8BFWiJJIdoqVI1wibsfbh13XrxqhHBRsBjY1t8CedaXCrUoGmDjG?=
 =?us-ascii?Q?Rkua59ZuYgw4SP76F412z4qMW6AagZuzx4Zr9i1n0j7O9XUe0XDaMOT/uFHM?=
 =?us-ascii?Q?ZePD0D5Ek/MCL5XF9ORh7I4frFzChmMEMDxUsm9Q3i+vpBoTPBfHDPy3lRg0?=
 =?us-ascii?Q?Uq660E07oRaeZBA2MqnaVGU50QKTvduh4EafF+LTyWhZN6Mj/uvFeMYEob70?=
 =?us-ascii?Q?hZhY6gbqJrELAUF+rY4TSH0wQJGTS+F5kXRtRLyyZW06Ff+AJzscb2EGlkXB?=
 =?us-ascii?Q?pvyi/T6a1/VJgGKUgguvt+OY0XP6W/VFgf5biW/zZYnJZCNsMZG+RHRM/X2L?=
 =?us-ascii?Q?OyTMigsYNoTmvTE4rQicIs1iVBHdQhZqwAsE51dBMizBg0nPougesFvwj88R?=
 =?us-ascii?Q?sgoE2om2W2nwN3A8iNc1R9SCycVANcHGZ2ZQFzmoqUJfY0atq80p/BBjtrjY?=
 =?us-ascii?Q?GgloUzFW0fG+xqoBVa5kCbqm7C7fQxcODpiXjzqUM7q/ncdpW2xhpxpV+ROS?=
 =?us-ascii?Q?oj7ieuxg73EkQsoP+G5sgkDgC9L9CVOkL7sKhtdyw/nPsYhgh+WP40TONzbu?=
 =?us-ascii?Q?I6te3nx9IgHeMGH3HlC2qPmazkGN3EhONOmzp3FvLY1JXmKGg3Qri+Nhl1pQ?=
 =?us-ascii?Q?qOX7up4WO0/RgHcjRceVCpJXZiAmyRNQSU8wnXUZ0s31S617GcUaq9T4wlcA?=
 =?us-ascii?Q?UuPYLstekai3Fou9FPotBa2KCBe+i1Xd8DxTPEbj5+TOvqwnk1r18q/ZqUV8?=
 =?us-ascii?Q?Ds9vrXz+wlsyjw2E3bafJ0kspBKJ8FMtTjyN1AucRrjic20/yDJDbwkQyjQg?=
 =?us-ascii?Q?t8aI5KxcW3IQKC7g0g2JvYA8q+nn23BupjSt25reSx8QsJYIuSn3Ya36BKCU?=
 =?us-ascii?Q?Wc6/zwl81+R/j0gwrJGMwNVE3lPTDFWHrAjJ3Yce0ZvR8VOcVs2kPqamX0LL?=
 =?us-ascii?Q?OwaRqUD+nT/9miCCe50GT+dKXKn6PwLJAEmkHeMr6hq4510GxHcCE166yZnS?=
 =?us-ascii?Q?VxHbwKl77FOnrqisUR0kN3vb4oSX7XfaXeRPhZRYJ22sq1giWa4iVnr3b5nG?=
 =?us-ascii?Q?07nK7KD19ch6J6D4lAukEAaOF3CTs13zBylUqAhwKSkkjxVGDoBcq+CujH6A?=
 =?us-ascii?Q?ow/xO6jFxk+CTzYsLaooAhBXAerB1otXgyI20QLdtc7STb8pTuaaxJY4FfG6?=
 =?us-ascii?Q?w4Vju0rSoCdI6CO84TmRCEassoAi/lEci5ikQgifqqAyYUv0tlWGcbHg2TMh?=
 =?us-ascii?Q?eSyMTQ/QOqRyhDizvpZWiQYAPC4YqqYDO64IEUuoE+QGL/wVcjUCEgG04Vgn?=
 =?us-ascii?Q?kyYopKN+CiESb+tRzieGMhkOgl7voLE40cmKqMa5zFAcoe6fJ2iYXS3WI8N2?=
 =?us-ascii?Q?p4TvNx3lvWvbJ4zudF5xlPfUO5SZnLDP63CACxzre+JK2nsfpUOHlDFMA5EF?=
 =?us-ascii?Q?adHhG52tGRptOyiWfdyWNizyeKWDeRO0UqP3mQx6661SWQl6dr2ZtymSEKt4?=
 =?us-ascii?Q?BjAbAqs0yJKBKR/XR071878+Y510t4h19uuKSkdpLQadcQVQBKoV8WjRpnVK?=
 =?us-ascii?Q?Z0ZABOKn1rjd81TQ5UaZe2ZY8KypW6i6tnOJ1F8Dfar2tSuabL+EwcPTWXAh?=
 =?us-ascii?Q?eWuxuU9BzroNDtMpxtCyUsQ=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70447197-1ace-4389-2338-08d9984bfd15
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:58.7577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBnqcoA6pCBcp3uHP3V3VssDqS8GVvC3HnhOYS93UvuxFZH7juU+dz2Og47+VfeehHXGppw/DIja2Q8hL4mmow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7825
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Tue, 26 Oct 2021 06:44:08 -0000

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
index 77b068f673..bcfd7758a9 100644
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


