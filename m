Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBG-0003HU-10
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGB7-00038G-4J; Tue, 26 Oct 2021 02:43:21 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGAw-0008LU-6z; Tue, 26 Oct 2021 02:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230589; x=1666766589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XMbfyezYLlZZPqOTSDDPiQxcWawUqBfVM4lykBwoyOc=;
 b=Cq9adOrbYUdBDSYi9ZtN8UQLhHKOkg+w68J1j72yijEClwBBHil4KEcB
 yqRPBoN7Zd++Y3gjRq2820LZRfbmwPc3RRomPSbuT9HQWFaRLoYcDOVFr
 08Ijc+G8Bw04pEnMnY0/xJ2qwnyGBJihMn9Q82Q/k6vT9MQwq2ELlV8ia
 AcP2xEQxo3/vjc6Ibt1y3VJeFT7EL1f9dt5tWidXhzg0lF2M5fwJ29EG+
 4KXweDqxTH83vXctPYLvDAGGMI+QFBvehVPl/E/oSUS3jfSiDNkBeL7o7
 ipi+BcxbPfse8z+wPJcOsLq24qDbm/YaCvqvUJBAT3mRRG1FTWtb2P9Qy Q==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="188620392"
Received: from mail-dm6nam08lp2043.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.43])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECgvgsVbal2dLpTE+KeLBa8xfkwMeOV9vqvySdOLHR9uIhcQgnRnJIBzdureRnZUbqmeT1xzEtc+i77obr/Qjowq40g6h4So4BzSORX59O9Yp9szWYFSlSnviccExAbktxs+QEdveUy1HXD9qg4UFv1cdsQTCiUaKJsw/ZKYO4vLhcMR2D84Rm87y2gfhc8ias3/CUeGoNLU1mfa5eCR235PxLd9RasObuxiqQK+iDrETUt+kIyMsFCMEVhSR4zNYfyp8EN22SLuqnBd3FUjCyTjKfbITlLcqPFL1FFCzW0lLR51Dk5Qq9MUWd12byjZpo4ZDHS/YDVAYkPTjTnJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W87Jq2+WmqYQ9cdmWWINQjKkFz3m0utqsjzhxrkRCyY=;
 b=cbqYa0bBBYao1oAI7jbe13FyD+3mVFnYy5CvVZBRrEgiLuN/laaXYyAWNm7HqXCg2+l1fqJHFnq8V4xrvs7xYzVDfB7wtVzWVz5ABm7pzgGx4bJWo3tbD2Z+Bs/Arn926cgPmFePq588eu0+qgtvM76x5GlUo+VI2ASPc3Rs9XmEqvbcb538p7E5cN+NrhG8EkLjEFnukviD0z/QmlOW5Du9C2aQy4Xc7xiV6r5Gm0mMwfAZD9VKQvc9aV68dJpZOLgVs4EIIXRXvVOrk0qvWzuGqY/VvpjzeDBaHVt7jSyNmPzvO1P9t93w2bPJjy/NGna7+ml017ANBYx1qSnAcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W87Jq2+WmqYQ9cdmWWINQjKkFz3m0utqsjzhxrkRCyY=;
 b=XbmzjfUyBYrpbLHIAyUSjxz5rcuQz8fjR2G2L6IRPy2ipExbjLAR3asu9Q1rTaHPG0E747jZ9PxlZFlHo8kQ0DApDdSFZx8bUHnYS/a7ZQv77pLZzAaIcXYQjWXM1rzBStWDP7T84W9dSK6YYZ+owfPF6PYwtutl063OzJM403c=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8394.namprd04.prod.outlook.com (2603:10b6:303:141::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 06:43:01 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:01 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 02/22] target/riscv: Implement SGEIP bit in hip and hie CSRs
Date: Tue, 26 Oct 2021 12:12:07 +0530
Message-Id: <20211026064227.2014502-3-anup.patel@wdc.com>
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
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:42:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 196be9dd-81bf-4117-d695-08d9984bdad5
X-MS-TrafficTypeDiagnostic: CO6PR04MB8394:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8394CA81AF23E96C709ACE398D849@CO6PR04MB8394.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t152lgfsQ6IGcKo1OmggN20KqyFxmDgY20EHQJGHdegR3vB4KLVJSnjgoqznb4R5spOpSYMkVZNAy5hG1O17ByeEL/7h0SS0AtY6QQ/r6NVYiu+20Nrub8fWQ4UWCiJYElrSkrLRxe6r1kEvdwaV3Q6j/7jBpJ0gZv0uUfrhnh+swOf41ouEyk3+gHubL8fwPdgiFoqCcJlqpi8F6IEMKqp+eJ/s8hIX+KmGirKOPMHUYpdAWXNMAqZfugy2kgAe5zUfRlLep4zN1Lad0y0QDCbrq2Ki+r2sal/QbkmmMyi6s7oeyseggeJOj2O7xSkC/mF6zBtFdFJEXbFBNVFopo32CHrt5/w8Sqe8CKCGKTHEJMAnDVHt0QXl63aSju6Satl0t46+XOuwCvl64JL//c1DPvf5ToNEKCxTX7fUIkhAKvMhDOo4pTKe4p4Zvs2n1uGrtI4Ofql2x0pqXHif6FyX6mbomEKYKRMwK5+jMOe80/G302X5yQg1m6hC/QZNzYtdszKABQoJ3+ahaYJxzZ7H4ROnOikJnmMm4UCTpTYzjUbyXpuFW+cp/I2s1k8RMQAIlQaapkXupwESu8lxViS7jPmK3cBGec81+ID1b47NMksjyIL/dp+txTl5bRDA3Me+65DKx4E+fMqC3DWQe9/D0I0y3nsr0QS8+jJRzanQqJzfuOeWneq+7RrvJh1BlRpWXQa7zzCvfoLThobCqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(956004)(83380400001)(8886007)(508600001)(6666004)(8936002)(44832011)(82960400001)(8676002)(5660300002)(55016002)(186003)(26005)(36756003)(1076003)(38350700002)(66556008)(38100700002)(66476007)(66946007)(316002)(52116002)(7696005)(4326008)(86362001)(54906003)(2906002)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cCiH0mkGOgY8qUeNHguzgtbfFcefGayqI4ayjZIPuBUb6D9R6RYoFHfHiKfX?=
 =?us-ascii?Q?jIOQcerqJAfCPua53kRuqWpv9nomo71ZJsmA3YiPNH0zYek5a6Oawv1ZHttc?=
 =?us-ascii?Q?vv6T0K7UGtrIAhwl/w3+7tHwIBQihKd1XTV6SIzaS6j9N+dJVsEDH3aMj8Cx?=
 =?us-ascii?Q?Htwt0lIUJIkOW3lDoIEUArgy9aUfBQDn9l7g/JuuLwIj0y8CkhdvliuPx79w?=
 =?us-ascii?Q?kiNuaZDgunVKXhCqCZctIJ0tiWYDXdS/1jotACWDXO1xNVbhVTNfmXosZ8yI?=
 =?us-ascii?Q?7OJFY5/BuDsICGWxX/xg0lOVj90UYoMly7wsqTx3SZxIYcPjmbGveFBgK7Xc?=
 =?us-ascii?Q?iyIwfAX6xkjgNq/SL6HAJfsoVgwdyLOyq5NHxR137H43SMmMDuEmzOSGT5hC?=
 =?us-ascii?Q?/DT/Z9gqBXHxDRjsWoiG+r0z9P1xM0OhZeaHrzippnhFapaD7Vn20qc7HMwz?=
 =?us-ascii?Q?GZDmQ3LjYlY3jVOWjAeMTdyq8GkkbveyZyATaUrCIc6IprDDnRQ3ChZXK/OC?=
 =?us-ascii?Q?rZ4L0UsTXehy1/Dsy6fk3DsILu1ba1b82EiHKxWg9XP7t4RPqSbZ3BngBzKo?=
 =?us-ascii?Q?flCBC0oz1+8m9Rlok2ml+qpq0QiTOJS70YknR+7RVBbD41nbdwpx4TMdDyoo?=
 =?us-ascii?Q?JRK6/4+0epRaoqA8s/SOGvJwvfxRfvJHU3JewaEaU+RAtH41wiYA/kn+Ks+C?=
 =?us-ascii?Q?ca/s2fhWiNCfzNZMPXfG/KO1kZHm+QpwDQ2IteaH+jGNy5+95HfOK0vMdrVr?=
 =?us-ascii?Q?gAN1ehHKFXJFlIAwIkleXC/VhC8vKwhvOqUNCv+PtLXQhG6W6y+2wxN6hNAa?=
 =?us-ascii?Q?NqwRD0zsk7jy02XUmKOA4RShVSVREGljZRFy+csEANQTlHsaPTy+41X3TPwG?=
 =?us-ascii?Q?UlxlCFGjjVl6fsTe0wgny9NbvEzPiZm1B5kh+3K8RcbuvbZJSZfiHD+c5Ynu?=
 =?us-ascii?Q?J64pvFr02xoOiOOr6HeOtIN4vXAaAY3KjVONShzV6RGZuUUDG2sW2UJsKCAp?=
 =?us-ascii?Q?uQzl9qRSsbsljeITEFB0u/Nf5jN+CBtZsko+o4pSFiolHrslIwjGAtlSkbkl?=
 =?us-ascii?Q?VVu4OjCpu+kS2lZewwKIGJx262d14QRImyE1q8yt3TvLDzsAg+jNiB4sovGa?=
 =?us-ascii?Q?2ikKgJHSHI4gj/YrE22tp66k0YOMFJ5WDCMf6L9Q9G5N2xkrfTAj4IshuTy9?=
 =?us-ascii?Q?+h+v2qhzPCYg49TMhS79o+HwATG/jeOTXTggM+OeNI1gJbMzdKoe7YPDU0+z?=
 =?us-ascii?Q?RkEOYtKZWms6m60rhPK/xOZ4LeFWAPAeuKgCP4+TAes+JctysttNXT8IWNSB?=
 =?us-ascii?Q?679h/LNpeXfDF3X2GnAi5q9G7VlBad1OOQTp2S4FJg1yahtX9W1rhE07Hk1/?=
 =?us-ascii?Q?kCDYS9z/gynK8UVUDcmCS2JpK5UrTtIWjrsf1g0oAkHI9xL8oWQGfc1SgvEh?=
 =?us-ascii?Q?OJ5FpTMNsrkAarSnu7AN7A/EptTJgHmOK7T3dPA23arzxeELUe0oXHCjOrgj?=
 =?us-ascii?Q?iaLEIVgA5V2Wkr906M5QHEvNnpzGar+/zXnPPMotoYy0BU2aPYMTeGK2Mpw4?=
 =?us-ascii?Q?b8O2NrfUIxFGDW3+pYcXEHoC9EkBkvCRr5dD34onLOuxnCPF6ye2LeM75v8G?=
 =?us-ascii?Q?ggk1JqK36xD+WpVPdvzbnU8=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196be9dd-81bf-4117-d695-08d9984bdad5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:01.2894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kx+pDYb8e/Qg3zl+6kIlDu1b9XakSqrYxMl5Zcy99koFHw79lkhAHOPz7wSs72nCLvqWtrV3vlD6qN9wY0GzrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8394
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Tue, 26 Oct 2021 06:43:21 -0000

A hypervsior can optionally take guest external interrupts using
SGEIP bit of hip and hie CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c      |  3 ++-
 target/riscv/cpu_bits.h |  3 +++
 target/riscv/csr.c      | 18 +++++++++++-------
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 788fa0b11c..0460a3972b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -365,6 +365,7 @@ static void riscv_cpu_reset(DeviceState *dev)
         env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
     }
     env->mcause = 0;
+    env->miclaim = MIP_SGEIP;
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
 #endif
@@ -598,7 +599,7 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 
 #ifndef CONFIG_USER_ONLY
-    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index cffcd3a5df..8a5a4cde95 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -498,6 +498,8 @@ typedef enum RISCVException {
 #define IRQ_S_EXT                          9
 #define IRQ_VS_EXT                         10
 #define IRQ_M_EXT                          11
+#define IRQ_S_GEXT                         12
+#define IRQ_LOCAL_MAX                      13
 
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
@@ -512,6 +514,7 @@ typedef enum RISCVException {
 #define MIP_SEIP                           (1 << IRQ_S_EXT)
 #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
 #define MIP_MEIP                           (1 << IRQ_M_EXT)
+#define MIP_SGEIP                          (1 << IRQ_S_GEXT)
 
 /* sip masks */
 #define SIP_SSIP                           MIP_SSIP
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9dfc9b5eba..9a0a0c0679 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -408,12 +408,13 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 #define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
 #define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
 #define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
+#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)
 
 static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
 static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
 static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
-                                     VS_MODE_INTERRUPTS;
+                                     HS_MODE_INTERRUPTS;
 #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
                          (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
                          (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
@@ -673,7 +674,7 @@ static RISCVException write_mideleg(CPURISCVState *env, int csrno,
 {
     env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
     if (riscv_has_ext(env, RVH)) {
-        env->mideleg |= VS_MODE_INTERRUPTS;
+        env->mideleg |= HS_MODE_INTERRUPTS;
     }
     return RISCV_EXCP_NONE;
 }
@@ -689,6 +690,9 @@ static RISCVException write_mie(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
     env->mie = (env->mie & ~all_ints) | (val & all_ints);
+    if (!riscv_has_ext(env, RVH)) {
+        env->mie &= ~MIP_SGEIP;
+    }
     return RISCV_EXCP_NONE;
 }
 
@@ -984,7 +988,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
     }
 
     if (ret_value) {
-        *ret_value &= env->mideleg;
+        *ret_value &= env->mideleg & S_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1102,7 +1106,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
                       write_mask & hvip_writable_mask);
 
     if (ret_value) {
-        *ret_value &= hvip_writable_mask;
+        *ret_value &= VS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1115,7 +1119,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
                       write_mask & hip_writable_mask);
 
     if (ret_value) {
-        *ret_value &= hip_writable_mask;
+        *ret_value &= HS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1123,14 +1127,14 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
 static RISCVException read_hie(CPURISCVState *env, int csrno,
                                target_ulong *val)
 {
-    *val = env->mie & VS_MODE_INTERRUPTS;
+    *val = env->mie & HS_MODE_INTERRUPTS;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_hie(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
-    target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) | (val & VS_MODE_INTERRUPTS);
+    target_ulong newval = (env->mie & ~HS_MODE_INTERRUPTS) | (val & HS_MODE_INTERRUPTS);
     return write_mie(env, CSR_MIE, newval);
 }
 
-- 
2.25.1


