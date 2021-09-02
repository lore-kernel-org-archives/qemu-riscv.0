Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrY-0001I5-Ud
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrJ-00014l-6s; Thu, 02 Sep 2021 07:26:17 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:26481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrH-0002rW-Bf; Thu, 02 Sep 2021 07:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581975; x=1662117975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FZl1UEpT6i3T+rgvbAK7DzWOG3I/vdiIJgCA/8ZsP/Q=;
 b=IyUHscMMJacXQSyJQwc3iLLUKk5pIt3JO51ZjdAUYAKDyDno/kuHmiu3
 0jKyScKnsJViS0NuunXWJKpvymgIl4nWo4rpNfaI/wHr1EleiBfDzVB+/
 vuAoUgr35ui7lBCfjFxVK4SLzaiKlD8R2p5Z+BqzEVD8EtK6y76kI5Dxk
 XTa+s/1Bvq+54Gn0unqBhGkEI9AOhGbP7RqvqJVhYd4RiRPruH+bvCx+O
 J321B66aASYnS/kVI+71oSghNuccSDbzUZskXS9TO8khadWMpiXAPayqO
 GFDxhC8C8JEhRgt40YLv7XK2TPUrYJ1jVymDFW3CUqMF8C+Rge+Sf2AY8 g==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="290644580"
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7SmmrmC6BE4wcN1cQ2fw/LSeMB39i/8S0EybV7hVlOiQ7vN5xNOeEXy2mJ0hXzp/+bUP7pVC/z/7t1W2+v40d+OhH6/epbDM+OZ1ScYfDbsegQJBeRWRbmJjpeYga7o4+s1PM4tJgU09C4Ceg9YHWwHVXcdJm8Q3a8wqMflQRcyod3KLJ5FEbft48m2iRQchoKs2OXWgWm5iMuOcoB9po+9EOYzqy7fmXqjpKCG+MKFstbN/pgQRXmOqwAOmCVvMeodvNKjYGKPUWoBtO8f29glLaPzs9lnhQdMTnWCmfa0RCdygj4DEo3ybrjNwRdDklQb/7cv4kZZx3lTLNyLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=9bmbeJpIOQf5heS+F91fOw6HLCeSijBMPBBaRphCHP8=;
 b=d9zat+EyjZ4WOQ8oBgd3uhg8tu8i/qg/zJnI0ihO+ySvzMqFWl3KmDLcdRsffzG+5H/Cz3nZ4UCS5BVPBNTe2U8uzVoXcdXRW/a8iO0Vf8sHQlHLuAZxVpFgg/ZvaM6iv0tWgn6QmWmOexV97fcVqvukIMhtMf4+gfy3CUPjIETcnrh6ColWltLVWyAhRBAaiMD7jjvefNtV4MhVixziYf6dVsLM+FZeZoq4fMu3c4DpXhoL8xBMK3saH8tcwlqJlua1ehw9m8rExPzbgKzJnBqBzwYIYybfXyBc2MQp/mjfAR7aQQnmc+m3y3qRDjEt5FzQ+180g45MXCYHfm5sRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bmbeJpIOQf5heS+F91fOw6HLCeSijBMPBBaRphCHP8=;
 b=n1aVUJtegPl8UdLHFXnMEv3AI7VSJ0IfkhGtiU8Ejpe26D1/pwaCHIsd0cRp5KfvXCdYgtrVIk0wk5GYMRjv/BUffRYcJtiOCD9l5oUq/vTfj18DFWhT6cJsO7y5QZxuMPfXKxNACbKeHpSUH+ULGqRI87RoJnKV62i4ueLJfYY=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7841.namprd04.prod.outlook.com (2603:10b6:5:358::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:26:10 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:10 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 07/22] target/riscv: Add defines for AIA CSRs
Date: Thu,  2 Sep 2021 16:55:05 +0530
Message-Id: <20210902112520.475901-8-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22053c6d-b7b7-4bda-72bf-08d96e0476a4
X-MS-TrafficTypeDiagnostic: CO6PR04MB7841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7841D14465F8E68B4072E3678DCE9@CO6PR04MB7841.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMo1ca5TkyJDCZdwaizhlfSK245OhT5DcSY1XgAKOORd9ps1Tx1TmK+jhFWzOBYub5hQgwPSA5Wgp80VgEJb9qUG3qRxrRO5OFTAVTf7bvU8LrIpFVgmWJ26mJpW0BuOHD2qnpix1IwJm+uapdla9hyCzIuti0/M9+yuJBp1u50qySyU7DEATyVlwAAflJyqGirTJRgw0ipFldjLbnukWtdCRhBLg5VkH/4F3k+fq7h6mXfOTpoXH42TCRZ3IUVa7Opx9Bh2IU24MNH5v1uXiK0pdbnOGx8oVAWk8w4xs1pLMiznrbriwqrr487PfXqvJ9nV0cIWhigQktJ1KRCNa5Z1uQslG0Vfr43CckBsxSSQiDBRMiMbKF+CeTrjEoYpt1bR2zQGWpstMXwCtfSRifCSe6qbwymEheZvRJq6VVpJzoLdWNYlMg6nLYugV5JyC1YkOUXy9Rk1baDB57jcezmMYetl0Oj6X/b0Po6T0987Om+NulSsEuRQGlmv0m3xmJ2cZxpSiEpBrxB+iuodIc3n0RQgHCTCRR7T/49UCVkbmwFMYLEYbmvcufG5afhOwH9Qtt3kUVFOkd6eoiNmbJaLXFDgN2R1JtOSuPiIhjOo2+sKEr1j69Zwp70cWxzUziYqL/RoLeU4zcdcCuB/wh0xK+R+S6j9JmDi/+/14DPU3FSh0uMZIQ3R6CwYLd9kCp0DOfR6xPjOzFvd+xob4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(38100700002)(83380400001)(52116002)(110136005)(44832011)(4326008)(38350700002)(8936002)(8676002)(2616005)(66946007)(5660300002)(36756003)(54906003)(316002)(66556008)(8886007)(66476007)(1076003)(2906002)(7696005)(55016002)(478600001)(26005)(186003)(956004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/EtHuxXby61DXCmls6MAcFtR2NbGhDK/VeW7hYs1YSWTUbs8w0hCYPA/2Baf?=
 =?us-ascii?Q?riMOZlrjLWXEdFkOXVX35a+HLqFflApae4aEm6iLG1e7UlHGRpm/LCM6reaY?=
 =?us-ascii?Q?aI1u7UqvbbzvevvRK+Fszdn4HK1Z8NOa02Bu927BqQ+KQZKUG8EvK5YGlnQa?=
 =?us-ascii?Q?dEpSi8jNEsgE96GrGE1AgGOvT0CTpRSOi2UV8YsI6UbfxAr2LP67Ma1QTpd4?=
 =?us-ascii?Q?Pn1QMtWEh0khFxU48IL8A3bIaCDyx4b+r1bq9BHGkQmJ8FmaDrSxi+XUaeHP?=
 =?us-ascii?Q?Spxp+bIGUdEx2XPYkLZTFiLKH16LFsb5UiXEUdV899Ub+iL4tJj4VQmca0jk?=
 =?us-ascii?Q?hrNjZbtHmhqL9lCongRlubRiP6nvkddeFVALL/FxIu5jegTA9QU6rBBCcNiR?=
 =?us-ascii?Q?dyt5cSg98P/R8X80ajZcGZBPjo1DO0sFD976OwSg9El6vVDkHtdPQV0dFW/C?=
 =?us-ascii?Q?l1hw6doiz9eUE+0MFWobIt04U+ZOnTQXzwAk3Pg4bWdJ7X7fVTnRu/X4muMv?=
 =?us-ascii?Q?c75dRTBRU6LfRJPecK72afscZYvBWBSVQlbwgY3VEf7vGqcT13UGNLU+1eaC?=
 =?us-ascii?Q?3atyfedLG+c5A6mfTPqtH9PQ3/TMjRHaH2yOJWKBXEFI+Nh3KASvwEeOXP3I?=
 =?us-ascii?Q?bY+yg6hixdBTtRO+7OeOk/IR68NS9ANjKFrHUF1X8p0XXmKacVZd2ZiYnzeT?=
 =?us-ascii?Q?FtYOpCFEz0aP4yZ//a7xZtanx4A8ATO4mYmHPBSYHqmmnhdTPcNKRRHT4BMt?=
 =?us-ascii?Q?Xwi3vLKrwDmkoq1lHZGLJ/UeEvRJdDSRScKmRXHhntBjhlJbv3V2DlY8a273?=
 =?us-ascii?Q?+YKK9lNkGp/KsgCoI7fCZREi3kPqnflIOyFbbne98d/5RC2qX3ZSbAbAA1ig?=
 =?us-ascii?Q?wM89sBLm6f7rO6U+e/2DI0aEOro2cAP7qIitI6YyQ3c8PbuhlOWKrhZ8H9a1?=
 =?us-ascii?Q?frrGrB/Cr6GzgEjOJRmaExoZLvgF7NPk9fYj4I+e1rkysgq9I513Kdx3TCeU?=
 =?us-ascii?Q?Jmrei1uDJhzZN207LbpuzYvJYxwadLSFlyFzkZx6GsOnFXZweRQYSiWFrYha?=
 =?us-ascii?Q?oJRxIMcjry7n1lihEY3shtgtP6HYiPfLvjWKO+2xsC0WM9cBDmcHGV78K1Up?=
 =?us-ascii?Q?LH/aWZtOJSA/vEBcS48iSiQWCuDfua7U5gHCzbCCMgFdYkyI1rGWlMcjb9NL?=
 =?us-ascii?Q?AwLc6Px8aGF+BAWa8m7ps9WjiZ6kBlRpJ/6lqom99dByQB9/l0W0F7ZLYace?=
 =?us-ascii?Q?uzJ+eAqk6lCTurPKCIm5cYebVdiV4LyiKhYziGuh8LQnvQ2i+YRj6/RsbEWP?=
 =?us-ascii?Q?xI/dDLSLcd/Fa8i7jk8c1nBh?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22053c6d-b7b7-4bda-72bf-08d96e0476a4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:10.0293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bzjnew/iUrAsxum2Oj1tGY7igly1SJJtWqDGiE5Fg0/6Xfcsvkmkk1WWdDYioWex9yIu8EtVrs9G8ApglWEDVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7841
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
X-List-Received-Date: Thu, 02 Sep 2021 11:26:19 -0000

The RISC-V AIA specification extends RISC-V local interrupts and
introduces new CSRs. This patch adds defines for the new AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu_bits.h | 128 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index a1958dbd6a..c31c1dde27 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -160,6 +160,31 @@
 #define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
 
+/* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_MISELECT        0x350
+#define CSR_MIREG           0x351
+
+/* Machine-Level Interrupts (AIA) */
+#define CSR_MTOPI           0xfb0
+
+/* Machine-Level IMSIC Interface (AIA) */
+#define CSR_MSETEIPNUM      0x358
+#define CSR_MCLREIPNUM      0x359
+#define CSR_MSETEIENUM      0x35a
+#define CSR_MCLREIENUM      0x35b
+#define CSR_MTOPEI          0x35d
+
+/* Virtual Interrupts for Supervisor Level (AIA) */
+#define CSR_MVIEN           0x308
+#define CSR_MVIP            0x309
+
+/* Machine-Level High-Half CSRs (AIA) */
+#define CSR_MIDELEGH        0x313
+#define CSR_MIEH            0x314
+#define CSR_MVIENH          0x318
+#define CSR_MVIPH           0x319
+#define CSR_MIPH            0x354
+
 /* Supervisor Trap Setup */
 #define CSR_SSTATUS         0x100
 #define CSR_SEDELEG         0x102
@@ -179,6 +204,24 @@
 #define CSR_SPTBR           0x180
 #define CSR_SATP            0x180
 
+/* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_SISELECT        0x150
+#define CSR_SIREG           0x151
+
+/* Supervisor-Level Interrupts (AIA) */
+#define CSR_STOPI           0xdb0
+
+/* Supervisor-Level IMSIC Interface (AIA) */
+#define CSR_SSETEIPNUM      0x158
+#define CSR_SCLREIPNUM      0x159
+#define CSR_SSETEIENUM      0x15a
+#define CSR_SCLREIENUM      0x15b
+#define CSR_STOPEI          0x15d
+
+/* Supervisor-Level High-Half CSRs (AIA) */
+#define CSR_SIEH            0x114
+#define CSR_SIPH            0x154
+
 /* Hpervisor CSRs */
 #define CSR_HSTATUS         0x600
 #define CSR_HEDELEG         0x602
@@ -209,6 +252,35 @@
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
+/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+#define CSR_HVIEN           0x608
+#define CSR_HVICTL          0x609
+#define CSR_HVIPRIO1        0x646
+#define CSR_HVIPRIO2        0x647
+
+/* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
+#define CSR_VSISELECT       0x250
+#define CSR_VSIREG          0x251
+
+/* VS-Level Interrupts (H-extension with AIA) */
+#define CSR_VSTOPI          0xeb0
+
+/* VS-Level IMSIC Interface (H-extension with AIA) */
+#define CSR_VSSETEIPNUM     0x258
+#define CSR_VSCLREIPNUM     0x259
+#define CSR_VSSETEIENUM     0x25a
+#define CSR_VSCLREIENUM     0x25b
+#define CSR_VSTOPEI         0x25d
+
+/* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
+#define CSR_HIDELEGH        0x613
+#define CSR_HVIENH          0x618
+#define CSR_HVIPH           0x655
+#define CSR_HVIPRIO1H       0x656
+#define CSR_HVIPRIO2H       0x657
+#define CSR_VSIEH           0x214
+#define CSR_VSIPH           0x254
+
 /* Enhanced Physical Memory Protection (ePMP) */
 #define CSR_MSECCFG         0x390
 #define CSR_MSECCFGH        0x391
@@ -535,4 +607,60 @@ typedef enum RISCVException {
 #define MIE_UTIE                           (1 << IRQ_U_TIMER)
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
+
+/* MISELECT, SISELECT, and VSISELECT bits (AIA) */
+#define ISELECT_IPRIO0                     0x30
+#define ISELECT_IPRIO15                    0x3f
+#define ISELECT_IMSIC_EIDELIVERY           0x70
+#define ISELECT_IMSIC_EITHRESHOLD          0x72
+#define ISELECT_IMSIC_EIP0                 0x80
+#define ISELECT_IMSIC_EIP63                0xbf
+#define ISELECT_IMSIC_EIE0                 0xc0
+#define ISELECT_IMSIC_EIE63                0xff
+#define ISELECT_IMSIC_FIRST                ISELECT_IMSIC_EIDELIVERY
+#define ISELECT_IMSIC_LAST                 ISELECT_IMSIC_EIE63
+#define ISELECT_MASK                       0x1ff
+
+/* Dummy [M|S|VS]ISELECT value for emulating [M|S|VS]TOPEI CSRs */
+#define ISELECT_IMSIC_TOPEI                (ISELECT_MASK + 1)
+
+/* IMSIC bits (AIA) */
+#define IMSIC_TOPEI_IID_SHIFT              16
+#define IMSIC_TOPEI_IID_MASK               0x7ff
+#define IMSIC_TOPEI_IPRIO_MASK             0x7ff
+#define IMSIC_EIPx_BITS                    32
+#define IMSIC_EIEx_BITS                    32
+
+/* MTOPI and STOPI bits (AIA) */
+#define TOPI_IID_SHIFT                     16
+#define TOPI_IID_MASK                      0xfff
+#define TOPI_IPRIO_MASK                    0xff
+
+/* Interrupt priority bits (AIA) */
+#define IPRIO_IRQ_BITS                     8
+#define IPRIO_MMAXIPRIO                    255
+#define IPRIO_DEFAULT_MMAXIPRIO            15
+#define IPRIO_DEFAULT_VS                   (IPRIO_DEFAULT_MMAXIPRIO - 4)
+#define IPRIO_DEFAULT_SGEXT                (IPRIO_DEFAULT_MMAXIPRIO - 5)
+#define IPRIO_DEFAULT_S                    (IPRIO_DEFAULT_MMAXIPRIO - 6)
+#define IPRIO_DEFAULT_M                    (IPRIO_DEFAULT_MMAXIPRIO - 7)
+#define IPRIO_DEFAULT_U(_i)                (((_i) >> 4) & 0x3)
+#define IPRIO_DEFAULT_L(_i)                ((_i) & 0xf)
+#define IPRIO_DEFAULT_16_23(_i)            \
+    (IPRIO_DEFAULT_MMAXIPRIO - (IPRIO_DEFAULT_L(_i) >> 1))
+#define IPRIO_DEFAULT_24_31(_i)            \
+    (IPRIO_DEFAULT_MMAXIPRIO - (4 + (IPRIO_DEFAULT_L(_i) >> 1)))
+#define IPRIO_DEFAULT_32_47(_i)            \
+    (IPRIO_DEFAULT_MMAXIPRIO - (IPRIO_DEFAULT_L(_i) >> 2))
+#define IPRIO_DEFAULT_48_63(_i)            \
+    (IPRIO_DEFAULT_MMAXIPRIO - (8 + (IPRIO_DEFAULT_L(_i) >> 2)))
+
+/* HVICTL bits (AIA) */
+#define HVICTL_VTI                         0x40000000
+#define HVICTL_IID                         0x0fff0000
+#define HVICTL_IPRIOM                      0x00000100
+#define HVICTL_IPRIO                       0x000000ff
+#define HVICTL_VALID_MASK                  \
+    (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)
+
 #endif
-- 
2.25.1


