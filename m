Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtrp-00044f-HA
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtrn-0003z5-Uf; Fri, 10 Dec 2021 23:20:11 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:50812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtrk-0001Y5-Ey; Fri, 10 Dec 2021 23:20:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196408; x=1670732408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bh0HuZeDD+bnjRnfuGWuQ7hiLk/cDCpIzlI0IJM3pDA=;
 b=ITiU7t/acvW1wFJSeOB1R3h9hnTCtm/u5+4/Bk88552EbYHjz7pX9uKw
 jQ/Ce7OvVjbw3evuwLHKhys3RRO5w5X+GF3CpTGIiUoRQDWlT3PTq3kG/
 sZEq6YL3cL8m+Y+ibIMBJsjc2vS+cnd8P6v7ksQh9943ECsgMbEYDNDyt
 MwAU7+PA1Esr76+gqh0uNwPImaVO3RJW5fBVmK8p4XRPhCmJSXdotWKuR
 YNFtadfRB2MoVJZ+uvwqMvoHbzQH4jrmQ8JCk4lutIpy5EVyG3XmRWdiU
 t+aH0fFCfv0ND1Mo1PIBBxr+EQ+JDJSDwxgBRnXQfPVOQof1U1+Zklwo0 g==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="186970373"
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6P6kwNzWusBDzfnX/8nL5gd8ueUV2DXH2rtJNTrx16BvA7L8gg1LhMKp7vvewHOsiweiSEkoSQzhKSj3nPBjle8ssXg/JbWFKyYrFUbbIyGcaOUib1d0pwNcbq3y00k77y0Y4dWC7N6b96djiHGVAm3AF4DxgjCDn7eZoQbVSDyuY9LwkY1LywgYmSVCL89HteBxWnQQPS6kbv2yArQfV46YSzzCBxKfZqZUroWiYMEbuRfDdZvXTcc549+61CVxMFly+HhzKnNFy0uFUoiJYjtoGBmCpUe3qFkh0thpxlPed1HKZahKhCQYVEEIZ68T0qQ4wosz0A04ipgEdGlWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XONvP6le/ci9k4M8P9M+2rQI6mS7sJ56CWHybSiUU0=;
 b=ALUgBU2c7NX+N9eRGl1r0fbUbkZbSNoJXFMMb5qazSdZaj8TZBUoxLfJ7Jm/LXVQoiDfkeaVxtd639Mt0ndaP0mannPCVOl/mbKgkwY5AVx71QIEKnnvlXslxizMKX6oWvsgN7F3FUXzRO2M4zIOjBWZ5Wg5afhSFidesvt/woGLfa7oKgVIvpnJCubsX4Y0LDdIX/6Dx8eC7/T1VJ5uoq/ZA3NMtbJ94r/+qLTtJ0vFUQGFnWAhBoTjtEynWfTvH9CcZhJahpwMO4par33YPq7oCLN2Ev9PIvwWO+UmsVJ/MAArU+dKpcbR9l+Rcmzimc/oRyfx5EuvdFVwUyJ1fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XONvP6le/ci9k4M8P9M+2rQI6mS7sJ56CWHybSiUU0=;
 b=s5wEQtYbJmOfaG7J9XjAlBeryTLLgHjPpVTdZ97uOb6YjphviHakmKft0RFnlvwBaLU9u2YOZ74ozM4JbtqDFOu7rQmepN6juo4F4tc7OVAyLq3Tlx3hHeexomiCap1hjZLARI4GLWT8fB4sH6KDI+U8yBU87U440+0HKa/jlDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8265.namprd04.prod.outlook.com (2603:10b6:303:150::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Sat, 11 Dec
 2021 04:20:04 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:04 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 03/23] target/riscv: Implement hgeie and hgeip CSRs
Date: Sat, 11 Dec 2021 09:48:57 +0530
Message-Id: <20211211041917.135345-4-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: f6271c4d-dbbd-4378-40e6-08d9bc5d81bb
X-MS-TrafficTypeDiagnostic: CO1PR04MB8265:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB8265E8BEACD886FDB9DE56578D729@CO1PR04MB8265.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OBV2ojZG+pzSr3NqYtHYiusIOJeIe+w3D2aI5WIdj56/BmnIWqV6T+D2rKC+MfZ+QWhLlEibvfZEkrsW/UsFWjQ+6KHQ7J2XC6z9A+JBf1B2mBJT55OUDn30R9in1gKqw14ZgEEIMDwObqwWsUxsohmup/8rx//4R37a4SUaDN1AhBho+t5OnxVn2F3kBf8lnCD0beaZOYn0qFO4yHfxeOBNV47aC/uJFda2KXT8jTB3mwQt4C0duI9oRmdQbp0SvOr0C16iJncFV8FdXssuW6FGGuuSaBqRVHLTUfK7qHsFEB39DgLBWSJiLp8s7Kkqrgb5bZ9lR/0OgnxfqlXOrOlarkL4CT7fxNxvVhY7vWZqubdhVOOaE367kfIRYl7YTngY7I7Lubx9fC/EB93pKTV3g7auexK5xq4MdcGj0HXjShB/u2fI7D/tQXd4ikd++dR1+FTBfDK8irMn9wH2jhKn41r2s1qSQfOAdX1p1H+mME4hMLUrqFRagbHx0nayzsMoPCHvTWCq45MHOxUXxDoI6K03yLazlD5XE6S7bx5nElc4KX+Kog7nvxuIfkDZ5k8BjBYSuk+xWAEts6yZvOj2ptsnA91XlB4/O98Ejggn7cCAHCvVI9POF8lV3pGvuPXM1OLCGKGWP4G4QCUbGrRdTbu4OOnxjGPO3oYZTR5M/US/6zTG0n+M/E+x7Dm6+EFF+78pULv0Y+PxGak8IQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(508600001)(110136005)(316002)(82960400001)(83380400001)(30864003)(6506007)(2616005)(86362001)(36756003)(186003)(52116002)(2906002)(4326008)(26005)(5660300002)(66946007)(6666004)(6512007)(66476007)(44832011)(6486002)(66556008)(8936002)(8676002)(38350700002)(38100700002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?motA+K3iSAwHRRExLV5WO1U5O1K7bCj0c4Yb2iEMAoRFpqQxa9T6Sj0+3s8x?=
 =?us-ascii?Q?tNWoBebTWtwedNzK/fMHfhkKu+RFi/OyCZiSrSgUR1peVnsAFOOkxq+zLz1w?=
 =?us-ascii?Q?jQc+B3/7OX5jC/IrW5YU/Jcv95Mvb0nsqRBaFwFMflIGwgaRMW4NKEH74PYL?=
 =?us-ascii?Q?UkLxRX9MlmM0aV1N5fjJeFTN+lfyRmz3nciOpWNlUIf4CPGXPWPB4jk/O8n7?=
 =?us-ascii?Q?iU5Bh9uiGJx95klPndZkUBMf7tbirLjuWNzHC7U9v3nxCmZAyfcMDyVZxcj0?=
 =?us-ascii?Q?JkmjVZcxPH5XIyov4JR1MAKlp7kUQGRuLTZAd2oPq54TNyw0JM0Xdo1Ox85Q?=
 =?us-ascii?Q?RpMhf/yrWJmA9RxJlsklbmyK4JaTwh/LP6/7zvctg7rVBWVBqUAetM1CZa+L?=
 =?us-ascii?Q?NTU+hNFiZztJZ+Sc7chlU4jLHh0aQdICMPxmYhQx5VLs2hw28xt1y7X1Tk1J?=
 =?us-ascii?Q?5yE0rqI4/T6hE9rMz2mGsXNeEod8savn2SUjmC4ki1FFLA3AAnmQHk2W/AAW?=
 =?us-ascii?Q?105zuKVYFi0QanxSr5yO1ouFjv/EZt+oE8JqojCvXqf6zXTbVqxcAgt40aWw?=
 =?us-ascii?Q?O019GloGjz0mG+RsRQqfixIMEb5cV5ZbrIfZbfKWWHBwEIUIh1xC37mF3mrs?=
 =?us-ascii?Q?lpZ9+7dYl3Fewy9t041bKXMfa2ZGTtIkXzJJ3vyK9l9hvkvcpdaen17HwmgJ?=
 =?us-ascii?Q?c7EbYjChoiP5fgdo3PrAYG2fQ3hV/mEIJl1ebEWBH9itmNJ/mgaiVqVydLnJ?=
 =?us-ascii?Q?a2D6cGoJp5e+ceKb13tGEgxnadcGGEXJIf31Yu95v5ZdW5A1yDZzqIY6loyR?=
 =?us-ascii?Q?BeWQKxFMxamk6CEFatrfIbGYoz3ZU/KuSapsUsyoIibdjoNUYvF1PKt7+G6S?=
 =?us-ascii?Q?Lr1FVfkzI5ks8uPipNKK9oNpzYd4QJj5mBELQqqFyXDZaC3JB4Q0D3Rup7Gt?=
 =?us-ascii?Q?GE2quzhDCKH0zmYU2bEJzchLeIuwOchaYJMqpECvCPIE+7fgjV2eBbtI6Dl8?=
 =?us-ascii?Q?dbOl3ZHQPeIe6Iaq1o/wreT28Jw2qu22fNNEfiDtI7PzEqTfswDiYRSxzVCY?=
 =?us-ascii?Q?3/RqlvDMyC3jXLN+MIFd+34WzFqvXh9S0So6afzf5b6zNAR2FdkHygxW06OP?=
 =?us-ascii?Q?BGdOW76Oky4DJu6ESGTWsoyty87A+wFmehuauszquS52b2cu7lvSyKj4JPUy?=
 =?us-ascii?Q?jTq+Oay0ul3KyQyllz1hcajYexCOVAywhbCYygud1SDse8L23HCX27lV2ikw?=
 =?us-ascii?Q?yrFzXPW0mJVwLI3aXOWggJtu+4k1nhUHja7X1Woa5JKdZxKeiaIexOU+/kcj?=
 =?us-ascii?Q?VIFCepj/HoFe9+QEGIfJAIdU9HN4ZQ0eLNyGKoOJb5Ng+8cvKuN8SPGk9S0T?=
 =?us-ascii?Q?V4cFBVQ2+mDgGi+qcUufCUzxIx5vhCr4PiMObLIXtnulyTtRkhe0z0WRVG1d?=
 =?us-ascii?Q?nYKGEytbri7vheyqUTq8MtHPQm2SSd7Z1kMNTL3VzWbzhM07QMoQrOSu3147?=
 =?us-ascii?Q?xQmVE0+90YK2Io/yhVVY2LWka4eG7kqX6FfygcXpc1JcA7NyjM+8CxUx5Um9?=
 =?us-ascii?Q?XSZEzg6GZxe0VfiLPd4kLNh+C9oqUnJF+SlVNt548VJu1cpjDHBawzgQ+xKt?=
 =?us-ascii?Q?FAQxeqEkS+G0UPN/sxAiC1E=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6271c4d-dbbd-4378-40e6-08d9bc5d81bb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:04.5867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPN6fHq/71XNVfLZZt7tg6V9VUeVa0h3IGCwFBs2LETTSu3z6XnAJTbJcnbYF4MIi9p+I5mxrdTL1ey7h8UnmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8265
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:12 -0000

The hgeie and hgeip CSRs are required for emulating an external
interrupt controller capable of injecting virtual external interrupt
to Guest/VM running at VS-level.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c        | 61 ++++++++++++++++++++++++++++-----------
 target/riscv/cpu.h        |  5 ++++
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 37 ++++++++++++++++++++++--
 target/riscv/csr.c        | 43 ++++++++++++++++++---------
 target/riscv/machine.c    |  6 ++--
 6 files changed, 118 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f3b1b9a775..da58a9654f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -582,23 +582,49 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 static void riscv_cpu_set_irq(void *opaque, int irq, int level)
 {
     RISCVCPU *cpu = RISCV_CPU(opaque);
+    CPURISCVState *env = &cpu->env;
 
-    switch (irq) {
-    case IRQ_U_SOFT:
-    case IRQ_S_SOFT:
-    case IRQ_VS_SOFT:
-    case IRQ_M_SOFT:
-    case IRQ_U_TIMER:
-    case IRQ_S_TIMER:
-    case IRQ_VS_TIMER:
-    case IRQ_M_TIMER:
-    case IRQ_U_EXT:
-    case IRQ_S_EXT:
-    case IRQ_VS_EXT:
-    case IRQ_M_EXT:
-        riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
-        break;
-    default:
+    if (irq < IRQ_LOCAL_MAX) {
+        switch (irq) {
+        case IRQ_U_SOFT:
+        case IRQ_S_SOFT:
+        case IRQ_VS_SOFT:
+        case IRQ_M_SOFT:
+        case IRQ_U_TIMER:
+        case IRQ_S_TIMER:
+        case IRQ_VS_TIMER:
+        case IRQ_M_TIMER:
+        case IRQ_U_EXT:
+        case IRQ_S_EXT:
+        case IRQ_VS_EXT:
+        case IRQ_M_EXT:
+            riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    } else if (irq < (IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX)) {
+        /* Require H-extension for handling guest local interrupts */
+        if (!riscv_has_ext(env, RVH)) {
+            g_assert_not_reached();
+        }
+
+        /* Compute bit position in HGEIP CSR */
+        irq = irq - IRQ_LOCAL_MAX + 1;
+        if (env->geilen < irq) {
+            g_assert_not_reached();
+        }
+
+        /* Update HGEIP CSR */
+        env->hgeip &= ~((target_ulong)1 << irq);
+        if (level) {
+            env->hgeip |= (target_ulong)1 << irq;
+        }
+
+        /* Update mip.SGEIP bit */
+        riscv_cpu_update_mip(cpu, MIP_SGEIP,
+                             BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
+    } else {
         g_assert_not_reached();
     }
 }
@@ -611,7 +637,8 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 
 #ifndef CONFIG_USER_ONLY
-    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
+                      IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0760c0af93..92a276f109 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -149,6 +149,7 @@ struct CPURISCVState {
     target_ulong priv;
     /* This contains QEMU specific information about the virt state. */
     target_ulong virt;
+    target_ulong geilen;
     target_ulong resetvec;
 
     target_ulong mhartid;
@@ -186,6 +187,8 @@ struct CPURISCVState {
     target_ulong htval;
     target_ulong htinst;
     target_ulong hgatp;
+    target_ulong hgeie;
+    target_ulong hgeip;
     uint64_t htimedelta;
 
     /* Virtual CSRs */
@@ -350,6 +353,8 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
+target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
+void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index c8ce77b1bb..0c6ef6e51c 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -526,6 +526,7 @@ typedef enum RISCVException {
 #define IRQ_M_EXT                          11
 #define IRQ_S_GEXT                         12
 #define IRQ_LOCAL_MAX                      16
+#define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
 
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9eeed38c7e..bf28118ff5 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -140,7 +140,11 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
     target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
     target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
 
-    target_ulong pending = env->mip & env->mie;
+    target_ulong vsgemask =
+                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEIN);
+    target_ulong vsgein = (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
+
+    target_ulong pending = (env->mip | vsgein) & env->mie;
 
     target_ulong mie    = env->priv < PRV_M ||
                           (env->priv == PRV_M && mstatus_mie);
@@ -247,6 +251,28 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
     }
 }
 
+target_ulong riscv_cpu_get_geilen(CPURISCVState *env)
+{
+    if (!riscv_has_ext(env, RVH)) {
+        return 0;
+    }
+
+    return env->geilen;
+}
+
+void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen)
+{
+    if (!riscv_has_ext(env, RVH)) {
+        return;
+    }
+
+    if (geilen > (TARGET_LONG_BITS - 1)) {
+        return;
+    }
+
+    env->geilen = geilen;
+}
+
 bool riscv_cpu_virt_enabled(CPURISCVState *env)
 {
     if (!riscv_has_ext(env, RVH)) {
@@ -290,9 +316,14 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
 {
     CPURISCVState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
-    uint32_t old = env->mip;
+    uint32_t gein, vsgein = 0, old = env->mip;
     bool locked = false;
 
+    if (riscv_cpu_virt_enabled(env)) {
+        gein = get_field(env->hstatus, HSTATUS_VGEIN);
+        vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+    }
+
     if (!qemu_mutex_iothread_locked()) {
         locked = true;
         qemu_mutex_lock_iothread();
@@ -300,7 +331,7 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
 
     env->mip = (env->mip & ~mask) | (value & mask);
 
-    if (env->mip) {
+    if (env->mip | vsgein) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 56e8d35217..e5234a1964 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -803,7 +803,7 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
     RISCVCPU *cpu = env_archcpu(env);
     /* Allow software control of delegable interrupts not claimed by hardware */
     target_ulong mask = write_mask & delegable_ints & ~env->miclaim;
-    uint32_t old_mip;
+    uint32_t gin, old_mip;
 
     if (mask) {
         old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
@@ -811,6 +811,11 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
         old_mip = env->mip;
     }
 
+    if (csrno != CSR_HVIP) {
+        gin = get_field(env->hstatus, HSTATUS_VGEIN);
+        old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
+    }
+
     if (ret_value) {
         *ret_value = old_mip;
     }
@@ -973,7 +978,7 @@ static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
                                target_ulong new_value, target_ulong write_mask)
 {
     /* Shift the S bits to their VS bit location in mip */
-    int ret = rmw_mip(env, 0, ret_value, new_value << 1,
+    int ret = rmw_mip(env, csrno, ret_value, new_value << 1,
                       (write_mask << 1) & vsip_writable_mask & env->hideleg);
 
     if (ret_value) {
@@ -993,7 +998,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
     if (riscv_cpu_virt_enabled(env)) {
         ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
     } else {
-        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
+        ret = rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & env->mideleg & sip_writable_mask);
     }
 
@@ -1112,7 +1117,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
                                target_ulong *ret_value,
                                target_ulong new_value, target_ulong write_mask)
 {
-    int ret = rmw_mip(env, 0, ret_value, new_value,
+    int ret = rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & hvip_writable_mask);
 
     if (ret_value) {
@@ -1125,7 +1130,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
                               target_ulong *ret_value,
                               target_ulong new_value, target_ulong write_mask)
 {
-    int ret = rmw_mip(env, 0, ret_value, new_value,
+    int ret = rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & hip_writable_mask);
 
     if (ret_value) {
@@ -1162,15 +1167,27 @@ static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException write_hgeie(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+static RISCVException read_hgeie(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     if (val) {
-        qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
+        *val = env->hgeie;
     }
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException write_hgeie(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    /* Only GEILEN:1 bits implemented and BIT0 is never implemented */
+    val &= ((((target_ulong)1) << env->geilen) - 1) << 1;
+    env->hgeie = val;
+    /* Update mip.SGEIP bit */
+    riscv_cpu_update_mip(env_archcpu(env), MIP_SGEIP,
+                         BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_htval(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -1198,11 +1215,11 @@ static RISCVException write_htinst(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException write_hgeip(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+static RISCVException read_hgeip(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     if (val) {
-        qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
+        *val = env->hgeip;
     }
     return RISCV_EXCP_NONE;
 }
@@ -1891,10 +1908,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,     rmw_hip           },
     [CSR_HIE]         = { "hie",         hmode,   read_hie,         write_hie         },
     [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,  write_hcounteren  },
-    [CSR_HGEIE]       = { "hgeie",       hmode,   read_zero,        write_hgeie       },
+    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie       },
     [CSR_HTVAL]       = { "htval",       hmode,   read_htval,       write_htval       },
     [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,      write_htinst      },
-    [CSR_HGEIP]       = { "hgeip",       hmode,   read_zero,        write_hgeip       },
+    [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,       NULL              },
     [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,       write_hgatp       },
     [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,  write_htimedelta  },
     [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ad8248ebfd..76dd0d415c 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -78,8 +78,8 @@ static bool hyper_needed(void *opaque)
 
 static const VMStateDescription vmstate_hyper = {
     .name = "cpu/hyper",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .needed = hyper_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL(env.hstatus, RISCVCPU),
@@ -89,6 +89,8 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.htval, RISCVCPU),
         VMSTATE_UINTTL(env.htinst, RISCVCPU),
         VMSTATE_UINTTL(env.hgatp, RISCVCPU),
+        VMSTATE_UINTTL(env.hgeie, RISCVCPU),
+        VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
 
         VMSTATE_UINT64(env.vsstatus, RISCVCPU),
-- 
2.25.1


