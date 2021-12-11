Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtsi-0006yj-Bw
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:21:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsh-0006vJ-Dt; Fri, 10 Dec 2021 23:21:07 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:26511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtse-0001mA-6a; Fri, 10 Dec 2021 23:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196463; x=1670732463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fOAchqjkolUbB37ps5uTKl3VDo9zkK/jShvdEMakJVo=;
 b=Cn4xXdFxFbzi1+v8xrM0UzugTxUagpsZ3g3WhUOl3Gqy0JCdxHdy9LxP
 P0Y8DyFU3LKePKzId6hemOy565d2MoBScC9PAxx9Ou88CL7d22/0i7uH6
 KlMD+hY3CuDiz+qaMVq+37lMzNeLyTds05A4z+0oAJjW+Wjo8P2/jxLBn
 G5bH+j5jC1y66TmOx3u+eTpy998bsglf+yE2DlUDywt7kHhX1UdfBycCL
 djZniobYIyMKBxBB5Zkw2b1BpVnz+JO9d4pVINL37WY3mMDKKEIjZ1kLA
 tS6VVJdctXr4YMSSXb992vhDS6G+/aZUcBI+ic/SArVzySs+0O8irpPGy w==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="187989966"
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:21:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xyfa9JuziZilfgHqV2DmA8Wh+DnoDRzjfJTXUEiFM3fHRMZtDKLpJ6cSrBefEv7AvCJTVlLemkMpYXSglBG+poHnnYWiaCWMziedavnk3XQmy5cMZSdWLtUJT037reuhUYZOGActA/ux1jC1FbIuzGDYiewPZnxWyK9oVTLwmB4gFWr/S37JN+1NKK4Z4gmUuRrYrVO+jLv7G2x4lktx2tPJV7yytXqkE5/ANDyZQXWkme1QMxCD3zkOr57smnd+sCJIW1MBiJmjkHtSuV+7eWuUNUHF0nf/EOip5apAbSXNsNi9B5D7KJIgp7ZtrkE0g6lQCZ2Khvnf5z+ZBffVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zeCZsiS2aPLc6NjilQl0rGSvw/3LmFh3p1Xazw7pwE=;
 b=IZhYxdMcP7CHN8aQSop5vLOssqgfu0CYR7pZ/lsPaSu1IDMSdzPIb/iVTVu9H/M/qDDAir3/NjG/4UzbZCziHApRl9GWdiCgK3YAM6YomGVZUwhXbxbz9FOXkM77zXO3xkwR2eOqca+kimbgPLF7VmmHlw1AGzoE5offPMpT3SU8awI/yvokuSx4l1usmP0Ngq3/rMxsgwMOFrUeZVd03q1pPT8JpuTNqMmmtTHvoUnPktNuj8CWuitsay2ifpqRIkFcECkvkHrxUHsULeoeDyVUbNb3GzTJ60eFnZbXXLpSeyGBJwYoIjT48VWNswteDVeysX1k0afNw4mx8obJ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zeCZsiS2aPLc6NjilQl0rGSvw/3LmFh3p1Xazw7pwE=;
 b=uiook6lb9/LNtx2MP5XyRH7Ut0dEMjuZlztuPgR+fNxbKsDy03jBYhCPpyQV4683bFSlAa4z7Gk7sEy4irQumvfGFpXd7J6Z80phBCoq/vuZ81FnHgfh1jkcR/AogaSt+xB8dZCzSAetHZOcFN7a2nG3bK8Nb5VYSS9EXmX7YIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:21:00 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:21:00 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 20/23] hw/intc: Add RISC-V AIA IMSIC device emulation
Date: Sat, 11 Dec 2021 09:49:14 +0530
Message-Id: <20211211041917.135345-21-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: c914f1f3-a44e-4fd4-d611-08d9bc5da2c2
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB8268F46A908043B4EEF62EB28D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:224;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZU8WuRFo4PGNjT3wB0K/8nt5iRII9Y25u30OqW1dqvzbvQyi8qLf/Ew37lUgE756RlbpaiGkmXwjE6ok/IeoEjqwwrmmQmAeHFJd/bIfN0mKZNCsnTxX2xcmksqNfraiDIeg45JunFFOdZdZHxcIIlYYD5uVcWnSKNsWOOsd+9ihDuo2R3B/L9KYhrazupfVzFp+V4ySUkGwu4rtl6J2zzatzn6kLa3Y3yPVM/2mrqRdAVbi89m4QccoLI5eH8u2MELOq1Dq4rfGO3DUJmksSHrWW38hieMdVhd063d6DNcGLQs4FeRH5w8w1Vf23oJChr20DitvsrER1DsM8e77L+TcSfV4+SZTKGqq1UXd/WmerUOQBEyEnsygmi27oH1YxUGQrqjynrBfBIylHREWxsNCpzRdcDtuiCQVA/SEP24D84uHIe6ws6iGhnCrLe0lkdSynlVDZTvNjBzKp7MRo1s8tSw6+etfZWwaV1ttzWqIbPTce0qp6ZGSEBWqGZBk08oDRD0ly6m2Chqq+Ivf/eSFD1Uz3GdVrbcsxaEqwxn6q6LnuZXOz7vreCZ3iqeLhj2l1jN2samgs2GK3i409CyzHtTE1FN4B6fAlQjgrdasmlVpZzDi51hNqbtWPn5aiAutIbU1bzpcfXx1P4JnlLmmgkjNSPC9TkWXxyI8j1Y1GkX19z5AlbfNTisJykWAt6VR9DUABOeAMsznwnS7UpiggnTUMwXsVubo6w1sJg2axWV4h+uVGdkYjNthXhZzYoA5uEgAkXkLcJW9LscqbtCg29NZ7zaB4VX17JQFXN8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(30864003)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EkwijUM9Cm/TiMZ2eqFe6SXXER6twtsRfBJFF1dbnS7IFPGwzJ6bTokn1cgB?=
 =?us-ascii?Q?7gTF6543MBTckew3mTtlhi0MssBkVrQ2DmUaYX0KOXN+H/RFU5IR475py+q5?=
 =?us-ascii?Q?4arLy7MKGvIU0rfYpJou3pV45NBcTJgTd+jA8K6WVxHHg/4ZJTMfVhqIX5Oj?=
 =?us-ascii?Q?yz8aBZAZfyoJBjaNmakkxd62V/vE1LnIU69/i3oVCgHyPeCB/PmQZdTkRA30?=
 =?us-ascii?Q?4Z0vOWga63WU6DDy1BdUGBuzvAK7Kf/gv4BiDmg8x0l8WYgU3i7I3dZbth2t?=
 =?us-ascii?Q?wrAVbd6vH4cscpXZn9kvTPXlUJQsoz6+tUjJV2rq9cLgNGQN9l+ZaFnJ1sbp?=
 =?us-ascii?Q?NXtvimKDr2kVmS1cBd+IgBL35f8DFby2+8RPTz8hTeyCWVV/B5nmvZHbNE4N?=
 =?us-ascii?Q?UjjdfWsZX9JTWyxDoxobmqbktekkNtX6LGEnq/jbxfRG00e7Bjc/7yvQhzkh?=
 =?us-ascii?Q?JjkZnrX4Y2+vr58EoPeh9kVJ6eC1Vvemiqwp0OlXIdIS9lpu0jCPHvWhLWiF?=
 =?us-ascii?Q?ZG81G5a34r3ft+tIeNbw98sVJDx5KXFNSRQNXb5ST7DvD6S25vMEPv/thuhc?=
 =?us-ascii?Q?Ol5fWgDG9R+NX0/cvhM8IqYfFB6EKE3j4JV0/rz9NmxlMuJoElg8AQ+HITtd?=
 =?us-ascii?Q?NrpV+wHrqpckVhsRhyxPoVjbiONSGRnwPdEPlKWTaMEUJyLrmWBuA1bfWLBD?=
 =?us-ascii?Q?WluTMayQDSMDcQQ+DspIOvA4WGOC21FiEmu2iohZfSTX3THCEIUz1Jf1j6rb?=
 =?us-ascii?Q?SUv87Z8XcwantQLIf6sdUL4PCUle64Lz8VOkrk6fUGUnIyiqtu9NJHVtXzt2?=
 =?us-ascii?Q?/zrzZ3LOXEdfE24zo9EVt1xlYRS2e0t6feLf3AcV/pvAP1OVcmJ6e7nCqTPw?=
 =?us-ascii?Q?bM+lTO9QYKW4s4436DbwkfEoNRj9Ku6Iihl2yhm8zyu/mo2+zoHAN6RiqT+d?=
 =?us-ascii?Q?zjiimlFnJ6YrNnkphjck4Bbg+wWbQ5UGYGFhBvP0W6YGXa2KwdEIlFHoLDvv?=
 =?us-ascii?Q?eM0bKAFm+yN883g3E+5ydEp93sMx6HDBtKESPkOw0OoNDfYMLgKuT437dVE5?=
 =?us-ascii?Q?fy4llCSpIqjMsl7+yxF9wHiTXhqsUdbbAJWJvuIUiN1zFSLll+LFfoDgpGA+?=
 =?us-ascii?Q?vTmJRsdlsl4HGqR9Hm3UeKSV8zWrSr/jUVSSVcDGpKHLtbgBTe0WM6BIDw+m?=
 =?us-ascii?Q?iwqTLA5UKQ1nPEYgB7Ecdmon6yzfGOAhiX8sPyaUnR9A85+xvOgLxgHEqXtd?=
 =?us-ascii?Q?k6J5Lcw9puig54kIYOzgxbY6dTZjkA5NnaUCImCI02zAn7EmKmor5judCta1?=
 =?us-ascii?Q?Q2VhEPTKh2MezEOR6Lwglh4eyHc73Di0dhH7cm3I+NlUIiF+Bva4/oLz3jY2?=
 =?us-ascii?Q?IfO5kqr/OeSlSNA0Yiu+zJ6pQtFhlxKt0uOms2thtHZj7WZ9bV4PEPDpGkKo?=
 =?us-ascii?Q?r8dmTmeiuyjcUBVEDPyEjWInB571VOhsqtRIvAZYosOPksJLWFtrHVtPN6/0?=
 =?us-ascii?Q?6PQl5tSmQYDvsqElPLM7n6/VdozYGIu8Mh+Z2vCSs9H3SC57qJHXuYc3VuGl?=
 =?us-ascii?Q?ZSu3mK5pnbvCtGkJWOd3pe0Psiqx8qSod89/TiQB/DLjga6uMwcOFgurlfC1?=
 =?us-ascii?Q?S787E6O9aKCibFNKKw+wU28=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c914f1f3-a44e-4fd4-d611-08d9bc5da2c2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:59.9856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YhNo3Wyakt8/XMxF3MC4yOwXIgLmunEyJnHVYdW/3MinFwsVfcJ/QFhOvAOG3u3aRhjFohnHb2Pq45MSYAuiGw==
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
X-List-Received-Date: Sat, 11 Dec 2021 04:21:07 -0000

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
 hw/intc/riscv_imsic.c         | 447 ++++++++++++++++++++++++++++++++++
 include/hw/intc/riscv_imsic.h |  68 ++++++
 4 files changed, 519 insertions(+)
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
index 0000000000..753fa11a9c
--- /dev/null
+++ b/hw/intc/riscv_imsic.c
@@ -0,0 +1,447 @@
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
+static int riscv_imsic_eix_rmw(RISCVIMSICState *imsic,
+                               uint32_t xlen, uint32_t page,
+                               uint32_t num, bool pend, target_ulong *val,
+                               target_ulong new_val, target_ulong wr_mask)
+{
+    uint32_t i, base;
+    target_ulong mask;
+    uint32_t state = (pend) ? IMSIC_EISTATE_PENDING : IMSIC_EISTATE_ENABLED;
+
+    if (xlen != 32) {
+        if (num & 0x1) {
+            return -EINVAL;
+        }
+        num >>= 1;
+    }
+    if (num >= (imsic->num_irqs / xlen)) {
+        return -EINVAL;
+    }
+
+    base = (page * imsic->num_irqs) + (num * xlen);
+
+    if (val) {
+        *val = 0;
+        for (i = 0; i < xlen; i++) {
+            mask = (target_ulong)1 << i;
+            *val |= (imsic->eistate[base + i] & state) ? mask : 0;
+        }
+    }
+
+    for (i = 0; i < xlen; i++) {
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
+    uint32_t isel, priv, virt, vgein, xlen, page;
+
+    priv = AIA_IREG_PRIV(reg);
+    virt = AIA_IREG_VIRT(reg);
+    isel = AIA_IREG_ISEL(reg);
+    vgein = AIA_IREG_VGEIN(reg);
+    xlen = AIA_IREG_XLEN(reg);
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
+        return riscv_imsic_eix_rmw(imsic, xlen, page,
+                                   isel - ISELECT_IMSIC_EIP0,
+                                   true, val, new_val, wr_mask);
+    case ISELECT_IMSIC_EIE0 ... ISELECT_IMSIC_EIE63:
+        return riscv_imsic_eix_rmw(imsic, xlen, page,
+                                   isel - ISELECT_IMSIC_EIE0,
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


