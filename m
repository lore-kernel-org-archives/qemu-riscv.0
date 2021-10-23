Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meChf-0003aQ-Nt
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChW-0003Lq-Be; Sat, 23 Oct 2021 04:48:26 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChR-0007Fj-CX; Sat, 23 Oct 2021 04:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978900; x=1666514900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+Qy6G5VJJXJ9tGrMmWOuTUHFe/waSOQh5skzBKLuXPk=;
 b=LxI6EVfMME4ndt8crJDVvd32aHrLrqdH0gWzNYAu/5nGss/7OXpYLnlD
 Fa52/YRYyzUSSrJYUYsnPrqUorAvp2NXKgEYixGcogdaGEX1IWXQ5nLH0
 fYVjsNlY6zVxP5gSmsz/twCEAKIDFk36vW2dvmvL7W/D2bHp1/HC1A3IY
 AclqgXl8lVoFzHCvUu1MMgBEMWF4L+dwKFiK+cL8psajDBlmjlpq1t3FY
 54N9ufO2vtf84v6DooZZyosk+740RZh5F/vF+ue9l58Y6vJNS5ypYTZpU
 aodqaxKQepy6LvVhjTXlJ8ywoR5+FmuwkfSvVZbsAtAV2gvdLQ+8QlyVE Q==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="188437387"
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:48:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MahuJlkw6zqIbhN+HYlb8qjYXOMX1v/4Fni7IC6sBmhU+kk7jTuh2HpbY6OMOz3mRtDZE5IrtnQ1sEgEGBed2XST0FT0FfHwW+i0yJD1QT4ZoDZNVlLFn1b6duIW9nU0/qa373WAy5jvnk3qlTjZVNE00zJxGS/6EIVdULzI1CaP5ufUntZr5yTpmv4AXpM6CgErs1J8pXgmM6h0YzFhxNT57ciYoITjASh9GjndvxS9T2YqJaK9lk9NfM2BwcnbllQPoMWUtniXlgVM15qHJQTe62UeUlif+aXbDFXfdqP+YU9lz56a7SZcn/t6zZKXKR0iWAwFktlrsDjdWaNwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwy5QZ825Z0lIKqVh8zmRSrtrhWyLdmvg0j2+kijEdk=;
 b=KLB47ktDsxiS7yUcua0sd7V4GQxJ+7dq5WfqCI1fI96c+4o+xCCxdShrbN/xET/hs3JrK8NW9mJQViwjQiDMnsG9E2gGn0bdFDRa4VXdPDHtPJCWXEbUNB1htIEWWjDsYlaeXzXSrD2KRZy6seImNxtRobV3UCBRSvArP5eyJ9JaeGcU6AizSNN+1ojpxZ2UjqKvJFk6tBc7L/n58iGFwSGVuoW9eNIWdLoegfEzSuhDPEcpqSvoGusN75B4pbh6oYddh4Q8qtZLMJ8FhQ6My+6PWjEr/Ev+lVaqWNb+MUwEPjekDty/VYC2KvD1/k6mDinF9vLMwdBKHl7tqRm5eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwy5QZ825Z0lIKqVh8zmRSrtrhWyLdmvg0j2+kijEdk=;
 b=V4WJ1iG+6ZeVoPlT67OgodgYOVsID0iV6aQvCAfQ22n5JFoju1Eac0QWPGbVQrIFAqo5Gnt2t/uJ4TURH5Fg95xtDAvL6LHldXTiLyI72DCv6El4CG6tsO/TMhUse1LcjYueJ7f25zlc5AlLYIoRlpNH0yeSaxgJj9wE/1BjugY=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8409.namprd04.prod.outlook.com (2603:10b6:303:140::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Sat, 23 Oct
 2021 08:48:18 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:48:17 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 18/22] hw/intc: Add RISC-V AIA APLIC device emulation
Date: Sat, 23 Oct 2021 14:16:34 +0530
Message-Id: <20211023084638.1697057-19-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211023084638.1697057-1-anup.patel@wdc.com>
References: <20211023084638.1697057-1-anup.patel@wdc.com>
Content-Type: text/plain; charset=ascii
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.179.82.21) by
 MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:48:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42a28ffa-3a2c-4301-53da-08d99601dbbe
X-MS-TrafficTypeDiagnostic: CO6PR04MB8409:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8409EC6860EDAE55C818F6898D819@CO6PR04MB8409.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:313;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVXbhRdhtrs9friRu7xv1sYOSs15lr/P19EADRn0VVCUxRDXz1uF9zN46rlMC9E83C7lHRL7j7GDktXDboSi2WvvEpasRM/sMy5lHkaC/YHYSYk27ysH2JuKuG50l+S/10wOeKCd6lRMB5Vrmh/erp0/IOAmkO0zp4jLYSDhn4oxY5qQZbo2SkJB58692NsAB+tIktZph0gPcQwZ9eLr6UfEjbbva4CfYyKgCizPiIUMPsShuben8+EB6i4/goJpNQ1XEGg+efamnd+5fIeJud6mu/UWf53MPp18mQGV9UsAbKHuzoiWGaZWj0M/JnAmFD12T78X7n0zAX+Gwat+HTbDY1dVpSxpSRzgO9RGe50Ymt1S5HKjQRBiRXauQFlOzaQQkoKCWbEIw+zuF9F1CFtkLDWtui3UVEtrM0Xafh9CNzGGtHN7n++8Pzm3RhOaBSqa8XfoBywYPOa3twhx4KDedo1BGNnlbLaScwx/ne4AFuug4siAGTXSEh3JAEJ0H7ssQGMitR4xzQxQmATf4kxYQUKiyB1OkccGGTElS8Inu1fBYCkfXRl6DWGKTRxUYWJho221YzfbDBAS3cGDSXogKQC0dJsZuNH5d9tSlrgQxf3sn6YLCOjBGU6cWC7PzmUuVmBRhWhzUaaSddyxi1IwO2mSgwCHTi5wYB8an2OE2ptzT9d+3L4uSghoZpZrffA+uF0GdgM2EO3qegoiIrkntFPmAjoML4KH2S5s31mRnBtxT8VOhHd1uH/S9qbmBC3fYgLEZqemIwmxQ6c99LQPNgYpUu12oBXPFvvxXcs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(1076003)(66556008)(83380400001)(44832011)(186003)(6666004)(30864003)(66476007)(2616005)(8886007)(316002)(66946007)(36756003)(4326008)(26005)(110136005)(54906003)(38100700002)(55016002)(8676002)(956004)(7696005)(52116002)(38350700002)(508600001)(2906002)(5660300002)(82960400001)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UbfbyWC/+Y4qcyFBsGqTVibIKq1GDAbVRqLualpk3WQvhq+NZxwkxn9yPhsX?=
 =?us-ascii?Q?XssOVYvrj15KM+sVSyCKHfJUq6bHCEU2wLQXMPUlO15J4GB1jOE7adExswRN?=
 =?us-ascii?Q?YA6mtoHACl2b1ZRQ0PzJi4RLOYHEL8Ly8Yfg12iq5+jJsZZ2FH4JvpdQz0Rq?=
 =?us-ascii?Q?HhIJEuoU6AIEsQ270M8bNdxHNFJGQ66/S0WQTn5Y2Q089UFPvZJwtxgDvzW3?=
 =?us-ascii?Q?fAgo5p7GORejMvPxl7zx3fX44WvHGjBrX8FVn8I9n2uAV/HTvwDZZJa5tDVI?=
 =?us-ascii?Q?kJJIivATYriUwpkcg8oq44O6GUB7RAjiapJ1rGrmfWrNxrW3WirwEIKBIPtO?=
 =?us-ascii?Q?T4LxLATUDN9J3PVW7fTffiKWvcqOKZHq2fQnblQmzb0CxaH4y5Nu3kW5GbDf?=
 =?us-ascii?Q?YMkhjex/3Z/OX/qC+2mlOWjmEw0GQdmsFZeNFPAzD7vc8QAs2ojsWcOVfxIh?=
 =?us-ascii?Q?DY/RAagzvx+8LcId7VitKCtIkJ5qeP4E+4LSA270Sh7HPyTFsQ054wZon/c1?=
 =?us-ascii?Q?tS0kDsTxE2oRVhiI0Ajjh9eaIFjlO9d7zBFAtZ/RgFkrJDdoz8/wrZ+PSiAJ?=
 =?us-ascii?Q?X1eK+0dy2IynqzaOvRfBrtnzEewYfmwM52FTktRcsvj6BIbNaKT+hc9lIFfg?=
 =?us-ascii?Q?/cW2Sze2TdkIV68jPCRtqLEBtbzed5UNKPWvtoTh3m2u+ZnWYeZAqxCLmbiX?=
 =?us-ascii?Q?RBSyCkcpxeqDBXVCz2s27UfFSjsCpdOkTbbeHRY1jrmYGkDkcF8ExaQZ+NEj?=
 =?us-ascii?Q?GkW+3EkX6nn1uedRogJAarmMgkjs1mPTCL3dIbDpiL3FI6zFxcAUwoKd82x1?=
 =?us-ascii?Q?xBSVArkbd28Ud0BiG4zHqjmJabZF56IvktQF8EbkVMgR1rWQDwJHEnyhm0D2?=
 =?us-ascii?Q?BmoOrSbCXRtmhiuYs/7SI4gauSsI0ZpVGPXp/XDrpgvz0MP0kvj0Xxgb/2JH?=
 =?us-ascii?Q?wkMRwzgkAPwEn1X7WTvaxj/cHvb2qE6BiESLTBRG1/KkMIeX5HGUCrJToq4e?=
 =?us-ascii?Q?Kt64vKUDTL/gB3EFepAm68/a6hydAE9c+sCejV/9W19iv9aXVminw7Gm09g0?=
 =?us-ascii?Q?NtdmoXOgitUtQBcAbAqc0S3QqPN4+3I4G57jTgjCcvsQJKn4dQbf3olOrSSb?=
 =?us-ascii?Q?PHUoBI5rfQv07BGzGCZi0LMcCj66KbKkk4mcPVAgxAe58of6B2yLAI9ulctj?=
 =?us-ascii?Q?KMluoKpunyEeQp+QD108PUvQI/4KjvZfiSrnOS6EjJ9uHaGgx3c5eqKu7HlW?=
 =?us-ascii?Q?sZDBFL7QZe/1AP5xGvLF6VQTWITxyc9sKKL4tXQXxZH52VKjK2NyVoOAc5Ft?=
 =?us-ascii?Q?fCS9K2mlj7w9XensgtT9mvQjpMYhCxrjjpBEoqEbe/KZRE5aKq8lAuKd8dhG?=
 =?us-ascii?Q?jLwHph1XMFFQHjs+U2g7NA6RgUyBTTwHXPL5w6kpw7s39IVDZooq1AAmituH?=
 =?us-ascii?Q?MX1nLhNJvF2HKDsSIoKh3UOrtgmOcVP5OEXJ45un+/0xj09JMdn3Ushq0J6q?=
 =?us-ascii?Q?rn8p8/WJc8FfSK/qmw/VwUr5Vzf8F2yQbI2t7qsWoApCQZymQ5+xVx5T5IL7?=
 =?us-ascii?Q?AzJvjL/jJfo2XgAl4Pq5B5gr/EAWAKAyFiwUJHnvIPuhGVCNr2cSq9uXrg4E?=
 =?us-ascii?Q?Vi2751k+JsOIntnfNXQZ6jY=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a28ffa-3a2c-4301-53da-08d99601dbbe
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:48:17.8698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFP1Z4lXF4lMtEJCF3GJx8a58ZwphSnwKe7jMmPqAfrw9C+sD/wlHfjfSmWPyHYD35axadzt82Ip2DZokmE10A==
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
X-List-Received-Date: Sat, 23 Oct 2021 08:48:27 -0000

The RISC-V AIA (Advanced Interrupt Architecture) defines a new
interrupt controller for wired interrupts called APLIC (Advanced
Platform Level Interrupt Controller). The APLIC is capabable of
forwarding wired interupts to RISC-V HARTs directly or as MSIs
(Message Signaled Interupts).

This patch adds device emulation for RISC-V AIA APLIC.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/intc/Kconfig               |   3 +
 hw/intc/meson.build           |   1 +
 hw/intc/riscv_aplic.c         | 970 ++++++++++++++++++++++++++++++++++
 include/hw/intc/riscv_aplic.h |  73 +++
 4 files changed, 1047 insertions(+)
 create mode 100644 hw/intc/riscv_aplic.c
 create mode 100644 include/hw/intc/riscv_aplic.h

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 78aed93c45..1592623233 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -65,6 +65,9 @@ config LOONGSON_LIOINTC
 config RISCV_ACLINT
     bool
 
+config RISCV_APLIC
+    bool
+
 config SIFIVE_PLIC
     bool
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index a1d00aa48d..76d7ba08d0 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -48,6 +48,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
 specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
 specific_ss.add(when: 'CONFIG_RISCV_ACLINT', if_true: files('riscv_aclint.c'))
+specific_ss.add(when: 'CONFIG_RISCV_APLIC', if_true: files('riscv_aplic.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
new file mode 100644
index 0000000000..f4b8828dac
--- /dev/null
+++ b/hw/intc/riscv_aplic.c
@@ -0,0 +1,970 @@
+/*
+ * RISC-V APLIC (Advanced Platform Level Interrupt Controller)
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
+#include "hw/intc/riscv_aplic.h"
+#include "hw/irq.h"
+#include "target/riscv/cpu.h"
+#include "sysemu/sysemu.h"
+#include "migration/vmstate.h"
+
+#define APLIC_MAX_IDC                  (1UL << 14)
+#define APLIC_MAX_SOURCE               1024
+#define APLIC_MIN_IPRIO_BITS           1
+#define APLIC_MAX_IPRIO_BITS           8
+#define APLIC_MAX_CHILDREN             1024
+
+#define APLIC_DOMAINCFG                0x0000
+#define APLIC_DOMAINCFG_IE             (1 << 8)
+#define APLIC_DOMAINCFG_DM             (1 << 2)
+#define APLIC_DOMAINCFG_BE             (1 << 0)
+
+#define APLIC_SOURCECFG_BASE           0x0004
+#define APLIC_SOURCECFG_D              (1 << 10)
+#define APLIC_SOURCECFG_CHILDIDX_MASK  0x000003ff
+#define APLIC_SOURCECFG_SM_MASK        0x00000007
+#define APLIC_SOURCECFG_SM_INACTIVE    0x0
+#define APLIC_SOURCECFG_SM_DETACH      0x1
+#define APLIC_SOURCECFG_SM_EDGE_RISE   0x4
+#define APLIC_SOURCECFG_SM_EDGE_FALL   0x5
+#define APLIC_SOURCECFG_SM_LEVEL_HIGH  0x6
+#define APLIC_SOURCECFG_SM_LEVEL_LOW   0x7
+
+#define APLIC_MMSICFGADDR              0x1bc0
+#define APLIC_MMSICFGADDRH             0x1bc4
+#define APLIC_SMSICFGADDR              0x1bc8
+#define APLIC_SMSICFGADDRH             0x1bcc
+
+#define APLIC_xMSICFGADDRH_L           (1UL << 31)
+#define APLIC_xMSICFGADDRH_HHXS_MASK   0x1f
+#define APLIC_xMSICFGADDRH_HHXS_SHIFT  24
+#define APLIC_xMSICFGADDRH_LHXS_MASK   0x7
+#define APLIC_xMSICFGADDRH_LHXS_SHIFT  20
+#define APLIC_xMSICFGADDRH_HHXW_MASK   0x7
+#define APLIC_xMSICFGADDRH_HHXW_SHIFT  16
+#define APLIC_xMSICFGADDRH_LHXW_MASK   0xf
+#define APLIC_xMSICFGADDRH_LHXW_SHIFT  12
+#define APLIC_xMSICFGADDRH_BAPPN_MASK  0xfff
+
+#define APLIC_xMSICFGADDR_PPN_SHIFT    12
+
+#define APLIC_xMSICFGADDR_PPN_HART(__lhxs) \
+    ((1UL << (__lhxs)) - 1)
+
+#define APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) \
+    ((1UL << (__lhxw)) - 1)
+#define APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs) \
+    ((__lhxs))
+#define APLIC_xMSICFGADDR_PPN_LHX(__lhxw, __lhxs) \
+    (APLIC_xMSICFGADDR_PPN_LHX_MASK(__lhxw) << \
+     APLIC_xMSICFGADDR_PPN_LHX_SHIFT(__lhxs))
+
+#define APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) \
+    ((1UL << (__hhxw)) - 1)
+#define APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs) \
+    ((__hhxs) + APLIC_xMSICFGADDR_PPN_SHIFT)
+#define APLIC_xMSICFGADDR_PPN_HHX(__hhxw, __hhxs) \
+    (APLIC_xMSICFGADDR_PPN_HHX_MASK(__hhxw) << \
+     APLIC_xMSICFGADDR_PPN_HHX_SHIFT(__hhxs))
+
+#define APLIC_xMSICFGADDRH_VALID_MASK   \
+    (APLIC_xMSICFGADDRH_L | \
+     (APLIC_xMSICFGADDRH_HHXS_MASK << APLIC_xMSICFGADDRH_HHXS_SHIFT) | \
+     (APLIC_xMSICFGADDRH_LHXS_MASK << APLIC_xMSICFGADDRH_LHXS_SHIFT) | \
+     (APLIC_xMSICFGADDRH_HHXW_MASK << APLIC_xMSICFGADDRH_HHXW_SHIFT) | \
+     (APLIC_xMSICFGADDRH_LHXW_MASK << APLIC_xMSICFGADDRH_LHXW_SHIFT) | \
+     APLIC_xMSICFGADDRH_BAPPN_MASK)
+
+#define APLIC_SETIP_BASE               0x1c00
+#define APLIC_SETIPNUM                 0x1cdc
+
+#define APLIC_CLRIP_BASE               0x1d00
+#define APLIC_CLRIPNUM                 0x1ddc
+
+#define APLIC_SETIE_BASE               0x1e00
+#define APLIC_SETIENUM                 0x1edc
+
+#define APLIC_CLRIE_BASE               0x1f00
+#define APLIC_CLRIENUM                 0x1fdc
+
+#define APLIC_SETIPNUM_LE              0x2000
+#define APLIC_SETIPNUM_BE              0x2004
+
+#define APLIC_ISTATE_PENDING           (1U << 0)
+#define APLIC_ISTATE_ENABLED           (1U << 1)
+#define APLIC_ISTATE_ENPEND            (APLIC_ISTATE_ENABLED | \
+                                        APLIC_ISTATE_PENDING)
+#define APLIC_ISTATE_INPUT             (1U << 8)
+
+#define APLIC_GENMSI                   0x3000
+
+#define APLIC_TARGET_BASE              0x3004
+#define APLIC_TARGET_HART_IDX_SHIFT    18
+#define APLIC_TARGET_HART_IDX_MASK     0x3fff
+#define APLIC_TARGET_GUEST_IDX_SHIFT   12
+#define APLIC_TARGET_GUEST_IDX_MASK    0x3f
+#define APLIC_TARGET_IPRIO_MASK        0xff
+#define APLIC_TARGET_EIID_MASK         0x7ff
+
+#define APLIC_IDC_BASE                 0x4000
+#define APLIC_IDC_SIZE                 32
+
+#define APLIC_IDC_IDELIVERY            0x00
+
+#define APLIC_IDC_IFORCE               0x04
+
+#define APLIC_IDC_ITHRESHOLD           0x08
+
+#define APLIC_IDC_TOPI                 0x18
+#define APLIC_IDC_TOPI_ID_SHIFT        16
+#define APLIC_IDC_TOPI_ID_MASK         0x3ff
+#define APLIC_IDC_TOPI_PRIO_MASK       0xff
+
+#define APLIC_IDC_CLAIMI               0x1c
+
+static uint32_t riscv_aplic_read_input_word(RISCVAPLICState *aplic,
+                                            uint32_t word)
+{
+    uint32_t i, irq, ret = 0;
+
+    for (i = 0; i < 32; i++) {
+        irq = word * 32 + i;
+        if (!irq || aplic->num_irqs <= irq) {
+            continue;
+        }
+
+        ret |= ((aplic->state[irq] & APLIC_ISTATE_INPUT) ? 1 : 0) << i;
+    }
+
+    return ret;
+}
+
+static uint32_t riscv_aplic_read_pending_word(RISCVAPLICState *aplic,
+                                              uint32_t word)
+{
+    uint32_t i, irq, ret = 0;
+
+    for (i = 0; i < 32; i++) {
+        irq = word * 32 + i;
+        if (!irq || aplic->num_irqs <= irq) {
+            continue;
+        }
+
+        ret |= ((aplic->state[irq] & APLIC_ISTATE_PENDING) ? 1 : 0) << i;
+    }
+
+    return ret;
+}
+
+static void riscv_aplic_set_pending_raw(RISCVAPLICState *aplic,
+                                        uint32_t irq, bool pending)
+{
+    if (pending) {
+        aplic->state[irq] |= APLIC_ISTATE_PENDING;
+    } else {
+        aplic->state[irq] &= ~APLIC_ISTATE_PENDING;
+    }
+}
+
+static void riscv_aplic_set_pending(RISCVAPLICState *aplic,
+                                    uint32_t irq, bool pending)
+{
+    uint32_t sourcecfg, sm;
+
+    if ((irq <= 0) || (aplic->num_irqs <= irq)) {
+        return;
+    }
+
+    sourcecfg = aplic->sourcecfg[irq];
+    if (sourcecfg & APLIC_SOURCECFG_D) {
+        return;
+    }
+
+    sm = sourcecfg & APLIC_SOURCECFG_SM_MASK;
+    if ((sm == APLIC_SOURCECFG_SM_INACTIVE) ||
+        (!aplic->msimode && ((sm == APLIC_SOURCECFG_SM_LEVEL_HIGH) ||
+                             (sm == APLIC_SOURCECFG_SM_LEVEL_LOW)))) {
+        return;
+    }
+
+    riscv_aplic_set_pending_raw(aplic, irq, pending);
+}
+
+static void riscv_aplic_set_pending_word(RISCVAPLICState *aplic,
+                                         uint32_t word, uint32_t value,
+                                         bool pending)
+{
+    uint32_t i, irq;
+
+    for (i = 0; i < 32; i++) {
+        irq = word * 32 + i;
+        if (!irq || aplic->num_irqs <= irq) {
+            continue;
+        }
+
+        if (value & (1U << i)) {
+            riscv_aplic_set_pending(aplic, irq, pending);
+        }
+    }
+}
+
+static uint32_t riscv_aplic_read_enabled_word(RISCVAPLICState *aplic,
+                                              int word)
+{
+    uint32_t i, irq, ret = 0;
+
+    for (i = 0; i < 32; i++) {
+        irq = word * 32 + i;
+        if (!irq || aplic->num_irqs <= irq) {
+            continue;
+        }
+
+        ret |= ((aplic->state[irq] & APLIC_ISTATE_ENABLED) ? 1 : 0) << i;
+    }
+
+    return ret;
+}
+
+static void riscv_aplic_set_enabled_raw(RISCVAPLICState *aplic,
+                                        uint32_t irq, bool enabled)
+{
+    if (enabled) {
+        aplic->state[irq] |= APLIC_ISTATE_ENABLED;
+    } else {
+        aplic->state[irq] &= ~APLIC_ISTATE_ENABLED;
+    }
+}
+
+static void riscv_aplic_set_enabled(RISCVAPLICState *aplic,
+                                    uint32_t irq, bool enabled)
+{
+    uint32_t sourcecfg, sm;
+
+    if ((irq <= 0) || (aplic->num_irqs <= irq)) {
+        return;
+    }
+
+    sourcecfg = aplic->sourcecfg[irq];
+    if (sourcecfg & APLIC_SOURCECFG_D) {
+        return;
+    }
+
+    sm = sourcecfg & APLIC_SOURCECFG_SM_MASK;
+    if (sm == APLIC_SOURCECFG_SM_INACTIVE) {
+        return;
+    }
+
+    riscv_aplic_set_enabled_raw(aplic, irq, enabled);
+}
+
+static void riscv_aplic_set_enabled_word(RISCVAPLICState *aplic,
+                                         uint32_t word, uint32_t value,
+                                         bool enabled)
+{
+    uint32_t i, irq;
+
+    for (i = 0; i < 32; i++) {
+        irq = word * 32 + i;
+        if (!irq || aplic->num_irqs <= irq) {
+            continue;
+        }
+
+        if (value & (1U << i)) {
+            riscv_aplic_set_enabled(aplic, irq, enabled);
+        }
+    }
+}
+
+static void riscv_aplic_msi_send(RISCVAPLICState *aplic,
+                                 uint32_t hart_idx, uint32_t guest_idx,
+                                 uint32_t eiid)
+{
+    uint64_t addr;
+    MemTxResult result;
+    RISCVAPLICState *aplic_m;
+    uint32_t lhxs, lhxw, hhxs, hhxw, group_idx, msicfgaddr, msicfgaddrH;
+
+    aplic_m = aplic;
+    while (aplic_m && !aplic_m->mmode) {
+        aplic_m = aplic_m->parent;
+    }
+    if (!aplic_m) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: m-level APLIC not found\n",
+                      __func__);
+        return;
+    }
+
+    if (aplic->mmode) {
+        msicfgaddr = aplic_m->mmsicfgaddr;
+        msicfgaddrH = aplic_m->mmsicfgaddrH;
+    } else {
+        msicfgaddr = aplic_m->smsicfgaddr;
+        msicfgaddrH = aplic_m->smsicfgaddrH;
+    }
+
+    lhxs = (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXS_SHIFT) &
+            APLIC_xMSICFGADDRH_LHXS_MASK;
+    lhxw = (msicfgaddrH >> APLIC_xMSICFGADDRH_LHXW_SHIFT) &
+            APLIC_xMSICFGADDRH_LHXW_MASK;
+    hhxs = (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXS_SHIFT) &
+            APLIC_xMSICFGADDRH_HHXS_MASK;
+    hhxw = (msicfgaddrH >> APLIC_xMSICFGADDRH_HHXW_SHIFT) &
+            APLIC_xMSICFGADDRH_HHXW_MASK;
+
+    group_idx = hart_idx >> lhxw;
+    hart_idx &= APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw);
+
+    addr = msicfgaddr;
+    addr |= ((uint64_t)(msicfgaddrH & APLIC_xMSICFGADDRH_BAPPN_MASK)) << 32;
+    addr |= ((uint64_t)(group_idx & APLIC_xMSICFGADDR_PPN_HHX_MASK(hhxw))) <<
+             APLIC_xMSICFGADDR_PPN_HHX_SHIFT(hhxs);
+    addr |= ((uint64_t)(hart_idx & APLIC_xMSICFGADDR_PPN_LHX_MASK(lhxw))) <<
+             APLIC_xMSICFGADDR_PPN_LHX_SHIFT(lhxs);
+    addr |= (uint64_t)(guest_idx & APLIC_xMSICFGADDR_PPN_HART(lhxs));
+    addr <<= APLIC_xMSICFGADDR_PPN_SHIFT;
+
+    address_space_stl_le(&address_space_memory, addr,
+                         eiid, MEMTXATTRS_UNSPECIFIED, &result);
+    if (result != MEMTX_OK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: MSI write failed for "
+                      "hart_index=%d guest_index=%d eiid=%d\n",
+                      __func__, hart_idx, guest_idx, eiid);
+    }
+}
+
+static void riscv_aplic_msi_irq_update(RISCVAPLICState *aplic, uint32_t irq)
+{
+    uint32_t hart_idx, guest_idx, eiid;
+
+    if (!aplic->msimode || (aplic->num_irqs <= irq) ||
+        !(aplic->domaincfg & APLIC_DOMAINCFG_IE)) {
+        return;
+    }
+
+    if ((aplic->state[irq] & APLIC_ISTATE_ENPEND) != APLIC_ISTATE_ENPEND) {
+        return;
+    }
+
+    riscv_aplic_set_pending_raw(aplic, irq, false);
+
+    hart_idx = aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIFT;
+    hart_idx &= APLIC_TARGET_HART_IDX_MASK;
+    if (aplic->mmode) {
+        /* M-level APLIC ignores guest_index */
+        guest_idx = 0;
+    } else {
+        guest_idx = aplic->target[irq] >> APLIC_TARGET_GUEST_IDX_SHIFT;
+        guest_idx &= APLIC_TARGET_GUEST_IDX_MASK;
+    }
+    eiid = aplic->target[irq] & APLIC_TARGET_EIID_MASK;
+    riscv_aplic_msi_send(aplic, hart_idx, guest_idx, eiid);
+}
+
+static uint32_t riscv_aplic_idc_topi(RISCVAPLICState *aplic, uint32_t idc)
+{
+    uint32_t best_irq, best_iprio;
+    uint32_t irq, iprio, ihartidx, ithres;
+
+    if (aplic->num_harts <= idc) {
+        return 0;
+    }
+
+    ithres = aplic->ithreshold[idc];
+    if (!ithres) {
+        return 0;
+    }
+
+    best_irq = best_iprio = UINT32_MAX;
+    for (irq = 1; irq < aplic->num_irqs; irq++) {
+        if ((aplic->state[irq] & APLIC_ISTATE_ENPEND) !=
+            APLIC_ISTATE_ENPEND) {
+            continue;
+        }
+
+        ihartidx = aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIFT;
+        ihartidx &= APLIC_TARGET_HART_IDX_MASK;
+        if (ihartidx != idc) {
+            continue;
+        }
+
+        iprio = aplic->target[irq] & aplic->iprio_mask;
+        if (iprio >= ithres) {
+            continue;
+        }
+
+        if (iprio < best_iprio) {
+            best_irq = irq;
+            best_iprio = iprio;
+        }
+    }
+
+    if (best_irq < aplic->num_irqs && best_iprio <= aplic->iprio_mask) {
+        return (best_irq << APLIC_IDC_TOPI_ID_SHIFT) | best_iprio;
+    }
+
+    return 0;
+}
+
+static void riscv_aplic_idc_update(RISCVAPLICState *aplic, uint32_t idc)
+{
+    uint32_t topi;
+
+    if (aplic->msimode || aplic->num_harts <= idc) {
+        return;
+    }
+
+    topi = riscv_aplic_idc_topi(aplic, idc);
+    if ((aplic->domaincfg & APLIC_DOMAINCFG_IE) &&
+        aplic->idelivery[idc] &&
+        (aplic->iforce[idc] || topi)) {
+        qemu_irq_raise(aplic->external_irqs[idc]);
+    } else {
+        qemu_irq_lower(aplic->external_irqs[idc]);
+    }
+}
+
+static uint32_t riscv_aplic_idc_claimi(RISCVAPLICState *aplic, uint32_t idc)
+{
+    uint32_t irq, state, sm, topi = riscv_aplic_idc_topi(aplic, idc);
+
+    if (!topi) {
+        aplic->iforce[idc] = 0;
+        return 0;
+    }
+
+    irq = (topi >> APLIC_IDC_TOPI_ID_SHIFT) & APLIC_IDC_TOPI_ID_MASK;
+    sm = aplic->sourcecfg[irq] & APLIC_SOURCECFG_SM_MASK;
+    state = aplic->state[irq];
+    riscv_aplic_set_pending_raw(aplic, irq, false);
+    if ((sm == APLIC_SOURCECFG_SM_LEVEL_HIGH) &&
+        (state & APLIC_ISTATE_INPUT)) {
+        riscv_aplic_set_pending_raw(aplic, irq, true);
+    } else if ((sm == APLIC_SOURCECFG_SM_LEVEL_LOW) &&
+               !(state & APLIC_ISTATE_INPUT)) {
+        riscv_aplic_set_pending_raw(aplic, irq, true);
+    }
+    riscv_aplic_idc_update(aplic, idc);
+
+    return topi;
+}
+
+static void riscv_aplic_request(void *opaque, int irq, int level)
+{
+    bool update = false;
+    RISCVAPLICState *aplic = opaque;
+    uint32_t sourcecfg, childidx, state, idc;
+
+    assert((0 < irq) && (irq < aplic->num_irqs));
+
+    sourcecfg = aplic->sourcecfg[irq];
+    if (sourcecfg & APLIC_SOURCECFG_D) {
+        childidx = sourcecfg & APLIC_SOURCECFG_CHILDIDX_MASK;
+        if (childidx < aplic->num_children) {
+            riscv_aplic_request(aplic->children[childidx], irq, level);
+        }
+        return;
+    }
+
+    state = aplic->state[irq];
+    switch (sourcecfg & APLIC_SOURCECFG_SM_MASK) {
+    case APLIC_SOURCECFG_SM_EDGE_RISE:
+        if ((level > 0) && !(state & APLIC_ISTATE_INPUT) &&
+            !(state & APLIC_ISTATE_PENDING)) {
+            riscv_aplic_set_pending_raw(aplic, irq, true);
+            update = true;
+        }
+        break;
+    case APLIC_SOURCECFG_SM_EDGE_FALL:
+        if ((level <= 0) && (state & APLIC_ISTATE_INPUT) &&
+            !(state & APLIC_ISTATE_PENDING)) {
+            riscv_aplic_set_pending_raw(aplic, irq, true);
+            update = true;
+        }
+        break;
+    case APLIC_SOURCECFG_SM_LEVEL_HIGH:
+        if ((level > 0) && !(state & APLIC_ISTATE_PENDING)) {
+            riscv_aplic_set_pending_raw(aplic, irq, true);
+            update = true;
+        }
+        break;
+    case APLIC_SOURCECFG_SM_LEVEL_LOW:
+        if ((level <= 0) && !(state & APLIC_ISTATE_PENDING)) {
+            riscv_aplic_set_pending_raw(aplic, irq, true);
+            update = true;
+        }
+        break;
+    default:
+        break;
+    }
+
+    if (level <= 0) {
+        aplic->state[irq] &= ~APLIC_ISTATE_INPUT;
+    } else {
+        aplic->state[irq] |= APLIC_ISTATE_INPUT;
+    }
+
+    if (update) {
+        if (aplic->msimode) {
+            riscv_aplic_msi_irq_update(aplic, irq);
+        } else {
+            idc = aplic->target[irq] >> APLIC_TARGET_HART_IDX_SHIFT;
+            idc &= APLIC_TARGET_HART_IDX_MASK;
+            riscv_aplic_idc_update(aplic, idc);
+        }
+    }
+}
+
+static uint64_t riscv_aplic_read(void *opaque, hwaddr addr, unsigned size)
+{
+    uint32_t irq, word, idc;
+    RISCVAPLICState *aplic = opaque;
+
+    /* Reads must be 4 byte words */
+    if ((addr & 0x3) != 0) {
+        goto err;
+    }
+
+    if (addr == APLIC_DOMAINCFG) {
+        return aplic->domaincfg | (aplic->msimode ? APLIC_DOMAINCFG_DM : 0);
+    } else if ((APLIC_SOURCECFG_BASE <= addr) &&
+            (addr < (APLIC_SOURCECFG_BASE + (aplic->num_irqs - 1) * 4))) {
+        irq  = ((addr - APLIC_SOURCECFG_BASE) >> 2) + 1;
+        return aplic->sourcecfg[irq];
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_MMSICFGADDR)) {
+        return aplic->mmsicfgaddr;
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_MMSICFGADDRH)) {
+        return aplic->mmsicfgaddrH;
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_SMSICFGADDR)) {
+        /* Registers SMSICFGADDR and SMSICFGADDRH are implemented only if:
+         * (a) the interrupt domain is at machine level
+         * (b) the domain???s harts implement supervisor mode
+         * (c) the domain has one or more child supervisor-level domains
+         *     that support MSI delivery mode (domaincfg.DM is not read-
+         *     only zero in at least one of the supervisor-level child
+         * domains).
+         */
+        return (aplic->num_children) ? aplic->smsicfgaddr : 0;
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_SMSICFGADDRH)) {
+        return (aplic->num_children) ? aplic->smsicfgaddrH : 0;
+    } else if ((APLIC_SETIP_BASE <= addr) &&
+            (addr < (APLIC_SETIP_BASE + aplic->bitfield_words * 4))) {
+        word = (addr - APLIC_SETIP_BASE) >> 2;
+        return riscv_aplic_read_pending_word(aplic, word);
+    } else if (addr == APLIC_SETIPNUM) {
+        return 0;
+    } else if ((APLIC_CLRIP_BASE <= addr) &&
+            (addr < (APLIC_CLRIP_BASE + aplic->bitfield_words * 4))) {
+        word = (addr - APLIC_CLRIP_BASE) >> 2;
+        return riscv_aplic_read_input_word(aplic, word);
+    } else if (addr == APLIC_CLRIPNUM) {
+        return 0;
+    } else if ((APLIC_SETIE_BASE <= addr) &&
+            (addr < (APLIC_SETIE_BASE + aplic->bitfield_words * 4))) {
+        word = (addr - APLIC_SETIE_BASE) >> 2;
+        return riscv_aplic_read_enabled_word(aplic, word);
+    } else if (addr == APLIC_SETIENUM) {
+        return 0;
+    } else if ((APLIC_CLRIE_BASE <= addr) &&
+            (addr < (APLIC_CLRIE_BASE + aplic->bitfield_words * 4))) {
+        return 0;
+    } else if (addr == APLIC_CLRIENUM) {
+        return 0;
+    } else if (addr == APLIC_SETIPNUM_LE) {
+        return 0;
+    } else if (addr == APLIC_SETIPNUM_BE) {
+        return 0;
+    } else if (addr == APLIC_GENMSI) {
+        return (aplic->msimode) ? aplic->genmsi : 0;
+    } else if ((APLIC_TARGET_BASE <= addr) &&
+            (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4))) {
+        irq = ((addr - APLIC_TARGET_BASE) >> 2) + 1;
+        return aplic->target[irq];
+    } else if (!aplic->msimode && (APLIC_IDC_BASE <= addr) &&
+            (addr < (APLIC_IDC_BASE + aplic->num_harts * APLIC_IDC_SIZE))) {
+        idc = (addr - APLIC_IDC_BASE) / APLIC_IDC_SIZE;
+        switch (addr - (APLIC_IDC_BASE + idc * APLIC_IDC_SIZE)) {
+        case APLIC_IDC_IDELIVERY:
+            return aplic->idelivery[idc];
+        case APLIC_IDC_IFORCE:
+            return aplic->iforce[idc];
+        case APLIC_IDC_ITHRESHOLD:
+            return aplic->ithreshold[idc];
+        case APLIC_IDC_TOPI:
+            return riscv_aplic_idc_topi(aplic, idc);
+        case APLIC_IDC_CLAIMI:
+            return riscv_aplic_idc_claimi(aplic, idc);
+        default:
+            goto err;
+        };
+    }
+
+err:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
+    return 0;
+}
+
+static void riscv_aplic_write(void *opaque, hwaddr addr, uint64_t value,
+        unsigned size)
+{
+    RISCVAPLICState *aplic = opaque;
+    uint32_t irq, word, idc = UINT32_MAX;
+
+    /* Writes must be 4 byte words */
+    if ((addr & 0x3) != 0) {
+        goto err;
+    }
+
+    if (addr == APLIC_DOMAINCFG) {
+        /* Only IE bit writeable at the moment */
+        value &= APLIC_DOMAINCFG_IE;
+        aplic->domaincfg = value;
+    } else if ((APLIC_SOURCECFG_BASE <= addr) &&
+            (addr < (APLIC_SOURCECFG_BASE + (aplic->num_irqs - 1) * 4))) {
+        irq  = ((addr - APLIC_SOURCECFG_BASE) >> 2) + 1;
+        if (!aplic->num_children && (value & APLIC_SOURCECFG_D)) {
+            value = 0;
+        }
+        if (value & APLIC_SOURCECFG_D) {
+            value &= (APLIC_SOURCECFG_D | APLIC_SOURCECFG_CHILDIDX_MASK);
+        } else {
+            value &= (APLIC_SOURCECFG_D | APLIC_SOURCECFG_SM_MASK);
+        }
+        aplic->sourcecfg[irq] = value;
+        if ((aplic->sourcecfg[irq] & APLIC_SOURCECFG_D) ||
+            (aplic->sourcecfg[irq] == 0)) {
+            riscv_aplic_set_pending_raw(aplic, irq, false);
+            riscv_aplic_set_enabled_raw(aplic, irq, false);
+        }
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_MMSICFGADDR)) {
+        if (!(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
+            aplic->mmsicfgaddr = value;
+        }
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_MMSICFGADDRH)) {
+        if (!(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
+            aplic->mmsicfgaddrH = value & APLIC_xMSICFGADDRH_VALID_MASK;
+        }
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_SMSICFGADDR)) {
+        /* Registers SMSICFGADDR and SMSICFGADDRH are implemented only if:
+         * (a) the interrupt domain is at machine level
+         * (b) the domain???s harts implement supervisor mode
+         * (c) the domain has one or more child supervisor-level domains
+         *     that support MSI delivery mode (domaincfg.DM is not read-
+         *     only zero in at least one of the supervisor-level child
+         * domains).
+         */
+        if (aplic->num_children &&
+            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
+            aplic->smsicfgaddr = value;
+        }
+    } else if (aplic->mmode && aplic->msimode &&
+               (addr == APLIC_SMSICFGADDRH)) {
+        if (aplic->num_children &&
+            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
+            aplic->smsicfgaddrH = value & APLIC_xMSICFGADDRH_VALID_MASK;
+        }
+    } else if ((APLIC_SETIP_BASE <= addr) &&
+            (addr < (APLIC_SETIP_BASE + aplic->bitfield_words * 4))) {
+        word = (addr - APLIC_SETIP_BASE) >> 2;
+        riscv_aplic_set_pending_word(aplic, word, value, true);
+    } else if (addr == APLIC_SETIPNUM) {
+        riscv_aplic_set_pending(aplic, value, true);
+    } else if ((APLIC_CLRIP_BASE <= addr) &&
+            (addr < (APLIC_CLRIP_BASE + aplic->bitfield_words * 4))) {
+        word = (addr - APLIC_CLRIP_BASE) >> 2;
+        riscv_aplic_set_pending_word(aplic, word, value, false);
+    } else if (addr == APLIC_CLRIPNUM) {
+        riscv_aplic_set_pending(aplic, value, false);
+    } else if ((APLIC_SETIE_BASE <= addr) &&
+            (addr < (APLIC_SETIE_BASE + aplic->bitfield_words * 4))) {
+        word = (addr - APLIC_SETIE_BASE) >> 2;
+        riscv_aplic_set_enabled_word(aplic, word, value, true);
+    } else if (addr == APLIC_SETIENUM) {
+        riscv_aplic_set_enabled(aplic, value, true);
+    } else if ((APLIC_CLRIE_BASE <= addr) &&
+            (addr < (APLIC_CLRIE_BASE + aplic->bitfield_words * 4))) {
+        word = (addr - APLIC_CLRIE_BASE) >> 2;
+        riscv_aplic_set_enabled_word(aplic, word, value, false);
+    } else if (addr == APLIC_CLRIENUM) {
+        riscv_aplic_set_enabled(aplic, value, false);
+    } else if (addr == APLIC_SETIPNUM_LE) {
+        riscv_aplic_set_pending(aplic, value, true);
+    } else if (addr == APLIC_SETIPNUM_BE) {
+        riscv_aplic_set_pending(aplic, bswap32(value), true);
+    } else if (addr == APLIC_GENMSI) {
+        if (aplic->msimode) {
+            aplic->genmsi = value & ~(APLIC_TARGET_GUEST_IDX_MASK <<
+                                      APLIC_TARGET_GUEST_IDX_SHIFT);
+            riscv_aplic_msi_send(aplic,
+                                 value >> APLIC_TARGET_HART_IDX_SHIFT,
+                                 0,
+                                 value & APLIC_TARGET_EIID_MASK);
+        }
+    } else if ((APLIC_TARGET_BASE <= addr) &&
+            (addr < (APLIC_TARGET_BASE + (aplic->num_irqs - 1) * 4))) {
+        irq = ((addr - APLIC_TARGET_BASE) >> 2) + 1;
+        if (aplic->msimode) {
+            aplic->target[irq] = value;
+        } else {
+            aplic->target[irq] = (value & ~APLIC_TARGET_IPRIO_MASK) |
+                                 (value & aplic->iprio_mask);
+        }
+    } else if (!aplic->msimode && (APLIC_IDC_BASE <= addr) &&
+            (addr < (APLIC_IDC_BASE + aplic->num_harts * APLIC_IDC_SIZE))) {
+        idc = (addr - APLIC_IDC_BASE) / APLIC_IDC_SIZE;
+        switch (addr - (APLIC_IDC_BASE + idc * APLIC_IDC_SIZE)) {
+        case APLIC_IDC_IDELIVERY:
+            aplic->idelivery[idc] = value & 0x1;
+            break;
+        case APLIC_IDC_IFORCE:
+            aplic->iforce[idc] = value & 0x1;
+            break;
+        case APLIC_IDC_ITHRESHOLD:
+            aplic->ithreshold[idc] = value & aplic->iprio_mask;
+            break;
+        default:
+            goto err;
+        };
+    } else {
+        goto err;
+    }
+
+    if (aplic->msimode) {
+        for (irq = 1; irq < aplic->num_irqs; irq++) {
+            riscv_aplic_msi_irq_update(aplic, irq);
+        }
+    } else {
+        if (idc == UINT32_MAX) {
+            for (idc = 0; idc < aplic->num_harts; idc++) {
+                riscv_aplic_idc_update(aplic, idc);
+            }
+        } else {
+            riscv_aplic_idc_update(aplic, idc);
+        }
+    }
+
+    return;
+
+err:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
+                  __func__, addr);
+}
+
+static const MemoryRegionOps riscv_aplic_ops = {
+    .read = riscv_aplic_read,
+    .write = riscv_aplic_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+static void riscv_aplic_realize(DeviceState *dev, Error **errp)
+{
+    uint32_t i;
+    RISCVAPLICState *aplic = RISCV_APLIC(dev);
+
+    aplic->bitfield_words = (aplic->num_irqs + 31) >> 5;
+    aplic->sourcecfg = g_new0(uint32_t, aplic->num_irqs);
+    aplic->state = g_new(uint32_t, aplic->num_irqs);
+    aplic->target = g_new0(uint32_t, aplic->num_irqs);
+    aplic->idelivery = g_new0(uint32_t, aplic->num_harts);
+    aplic->iforce = g_new0(uint32_t, aplic->num_harts);
+    aplic->ithreshold = g_new0(uint32_t, aplic->num_harts);
+
+    memory_region_init_io(&aplic->mmio, OBJECT(dev), &riscv_aplic_ops, aplic,
+                          TYPE_RISCV_APLIC, aplic->aperture_size);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &aplic->mmio);
+
+    /* Only root APLICs have hardware IRQ lines. All non-root APLICs
+     * have IRQ lines delegated by their parent APLIC.
+     */
+    if (!aplic->parent) {
+        qdev_init_gpio_in(dev, riscv_aplic_request, aplic->num_irqs);
+    }
+
+    /* Create output IRQ lines for non-MSI mode */
+    if (!aplic->msimode) {
+        aplic->external_irqs = g_malloc(sizeof(qemu_irq) * aplic->num_harts);
+        qdev_init_gpio_out(dev, aplic->external_irqs, aplic->num_harts);
+
+        /* Claim the CPU interrupt to be triggered by this APLIC */
+        for (i = 0; i < aplic->num_harts; i++) {
+            RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(aplic->hartid_base + i));
+            if (riscv_cpu_claim_interrupts(cpu,
+                (aplic->mmode) ? MIP_MEIP : MIP_SEIP) < 0) {
+                error_report("%s already claimed",
+                             (aplic->mmode) ? "MEIP" : "SEIP");
+                exit(1);
+            }
+        }
+    }
+
+    msi_nonbroken = true;
+}
+
+static Property riscv_aplic_properties[] = {
+    DEFINE_PROP_UINT32("aperture-size", RISCVAPLICState, aperture_size, 0),
+    DEFINE_PROP_UINT32("hartid-base", RISCVAPLICState, hartid_base, 0),
+    DEFINE_PROP_UINT32("num-harts", RISCVAPLICState, num_harts, 0),
+    DEFINE_PROP_UINT32("iprio-mask", RISCVAPLICState, iprio_mask, 0),
+    DEFINE_PROP_UINT32("num-irqs", RISCVAPLICState, num_irqs, 0),
+    DEFINE_PROP_BOOL("msimode", RISCVAPLICState, msimode, 0),
+    DEFINE_PROP_BOOL("mmode", RISCVAPLICState, mmode, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription vmstate_riscv_aplic = {
+    .name = "riscv_aplic",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+            VMSTATE_UINT32(domaincfg, RISCVAPLICState),
+            VMSTATE_UINT32(mmsicfgaddr, RISCVAPLICState),
+            VMSTATE_UINT32(mmsicfgaddrH, RISCVAPLICState),
+            VMSTATE_UINT32(smsicfgaddr, RISCVAPLICState),
+            VMSTATE_UINT32(smsicfgaddrH, RISCVAPLICState),
+            VMSTATE_UINT32(genmsi, RISCVAPLICState),
+            VMSTATE_VARRAY_UINT32(sourcecfg, RISCVAPLICState,
+                                  num_irqs, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(state, RISCVAPLICState,
+                                  num_irqs, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(target, RISCVAPLICState,
+                                  num_irqs, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(idelivery, RISCVAPLICState,
+                                  num_harts, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(iforce, RISCVAPLICState,
+                                  num_harts, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_VARRAY_UINT32(ithreshold, RISCVAPLICState,
+                                  num_harts, 0,
+                                  vmstate_info_uint32, uint32_t),
+            VMSTATE_END_OF_LIST()
+        }
+};
+
+static void riscv_aplic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, riscv_aplic_properties);
+    dc->realize = riscv_aplic_realize;
+    dc->vmsd = &vmstate_riscv_aplic;
+}
+
+static const TypeInfo riscv_aplic_info = {
+    .name          = TYPE_RISCV_APLIC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(RISCVAPLICState),
+    .class_init    = riscv_aplic_class_init,
+};
+
+static void riscv_aplic_register_types(void)
+{
+    type_register_static(&riscv_aplic_info);
+}
+
+type_init(riscv_aplic_register_types)
+
+/*
+ * Add a APLIC device to another APLIC device as child for
+ * interrupt delegation.
+ */
+void riscv_aplic_add_child(DeviceState *parent, DeviceState *child)
+{
+    RISCVAPLICState *caplic, *paplic;
+
+    assert(parent && child);
+    caplic = RISCV_APLIC(child);
+    paplic = RISCV_APLIC(parent);
+
+    assert(paplic->num_irqs == caplic->num_irqs);
+    assert(paplic->num_children <= QEMU_APLIC_MAX_CHILDREN);
+
+    caplic->parent = paplic;
+    paplic->children[paplic->num_children] = caplic;
+    paplic->num_children++;
+}
+
+/*
+ * Create APLIC device.
+ */
+DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
+    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
+    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent)
+{
+    DeviceState *dev = qdev_new(TYPE_RISCV_APLIC);
+    uint32_t i;
+
+    assert(num_harts < APLIC_MAX_IDC);
+    assert((APLIC_IDC_BASE + (num_harts * APLIC_IDC_SIZE)) <= size);
+    assert(num_sources < APLIC_MAX_SOURCE);
+    assert(APLIC_MIN_IPRIO_BITS <= iprio_bits);
+    assert(iprio_bits <= APLIC_MAX_IPRIO_BITS);
+
+    qdev_prop_set_uint32(dev, "aperture-size", size);
+    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
+    qdev_prop_set_uint32(dev, "num-harts", num_harts);
+    qdev_prop_set_uint32(dev, "iprio-mask", ((1U << iprio_bits) - 1));
+    qdev_prop_set_uint32(dev, "num-irqs", num_sources + 1);
+    qdev_prop_set_bit(dev, "msimode", msimode);
+    qdev_prop_set_bit(dev, "mmode", mmode);
+
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    if (parent) {
+        riscv_aplic_add_child(parent, dev);
+    }
+
+    if (!msimode) {
+        for (i = 0; i < num_harts; i++) {
+            CPUState *cpu = qemu_get_cpu(hartid_base + i);
+
+            qdev_connect_gpio_out_named(dev, NULL, i,
+                                        qdev_get_gpio_in(DEVICE(cpu),
+                                            (mmode) ? IRQ_M_EXT : IRQ_S_EXT));
+        }
+    }
+
+    return dev;
+}
diff --git a/include/hw/intc/riscv_aplic.h b/include/hw/intc/riscv_aplic.h
new file mode 100644
index 0000000000..d96d7b38c1
--- /dev/null
+++ b/include/hw/intc/riscv_aplic.h
@@ -0,0 +1,73 @@
+/*
+ * RISC-V APLIC (Advanced Platform Level Interrupt Controller) interface
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
+#ifndef HW_RISCV_APLIC_H
+#define HW_RISCV_APLIC_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_RISCV_APLIC "riscv.aplic"
+
+typedef struct RISCVAPLICState RISCVAPLICState;
+DECLARE_INSTANCE_CHECKER(RISCVAPLICState, RISCV_APLIC, TYPE_RISCV_APLIC)
+
+struct RISCVAPLICState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    qemu_irq *external_irqs;
+
+    /*< public >*/
+    MemoryRegion mmio;
+    uint32_t bitfield_words;
+    uint32_t domaincfg;
+    uint32_t mmsicfgaddr;
+    uint32_t mmsicfgaddrH;
+    uint32_t smsicfgaddr;
+    uint32_t smsicfgaddrH;
+    uint32_t genmsi;
+    uint32_t *sourcecfg;
+    uint32_t *state;
+    uint32_t *target;
+    uint32_t *idelivery;
+    uint32_t *iforce;
+    uint32_t *ithreshold;
+
+    /* topology */
+#define QEMU_APLIC_MAX_CHILDREN        16
+    struct RISCVAPLICState *parent;
+    struct RISCVAPLICState *children[QEMU_APLIC_MAX_CHILDREN];
+    uint16_t num_children;
+
+    /* config */
+    uint32_t aperture_size;
+    uint32_t hartid_base;
+    uint32_t num_harts;
+    uint32_t iprio_mask;
+    uint32_t num_irqs;
+    bool msimode;
+    bool mmode;
+};
+
+void riscv_aplic_add_child(DeviceState *parent, DeviceState *child);
+
+DeviceState *riscv_aplic_create(hwaddr addr, hwaddr size,
+    uint32_t hartid_base, uint32_t num_harts, uint32_t num_sources,
+    uint32_t iprio_bits, bool msimode, bool mmode, DeviceState *parent);
+
+#endif
-- 
2.25.1


