Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meCgn-0002Do-Ii
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgl-0002B1-Al; Sat, 23 Oct 2021 04:47:39 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgh-0006w2-7B; Sat, 23 Oct 2021 04:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978854; x=1666514854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cCSVrMFQZK0YBYECnnhAPfLUnCnHNqNNUJ+jWklO1VM=;
 b=UPVoqJIKDMhf+vac+zr8SxNStJo5AA09Om7wxAWuGM7oWgnOMMlhpphO
 QaTv6Z6WePA6V72yyrub+BeqUmB0kZwVVWT89bX8PEq7F98WSkT55uvt/
 pJRfopEg7SQku9qY4qL0WDVohAHIgJdJtb+TITMfnI4tNKOK/z8LeqdPB
 nV7pdqCaRCDI12ezDrwcV93CavDt0vDkEq5PHXRwFldejTXdGoGiBZpND
 uJ0G4AohI+DTnnOWIB7JMX42A8JZHfr7GJk5+55lp3URP0VTvSxsLqm28
 Ti8rasFEq+vaFx7CURzEKT7r5wxhVnGeYqVIpkkHC2L/ZolrBsUOoGLfC A==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="295398049"
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:47:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ING5KvtZeZXK9gSeI3H7904CaGDDqE7OnrYUUCxUuVbdNYBpuIbPscS9u7E2LsbuQ+30k0zYwpfx72V8/cRE0DR95HzPXQt2+9mQa8DE8cCEM405oAT6hnVPkcQAf+fnmB0KbAocN71VzBElW6qh0RO7e/gKTxP9bKL9FiCMHGVvAu79TXj8jjxqBtaKb5Ec9bMF8+sWFtlr76UtWFEBZjbm/rJDDzcd+Ml+1QubA62QCbPNQJRgnXiEAeM1FXf3GInShi36GmjAUf7w6LA+G86JlltxYlQf9stJ88Bz3e6lkn7H3SM9XaSG9K0hzQl0MlIOyVPHyKWnuw5PbjkqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlRWqy2KFGv4IYynZao2oNqPMPDr2xUqua+m+KlFHS4=;
 b=kWZvuv2H5/jtgOCBI9vPiNNnHwF3RUQeh/x7LBZtEyufWWo0JPFfQ7gwYTJi2lx9ecCzwycEMwpJqY54LDEIkUml5UlIlru52lALSGrFJBHKOa119rqU46g0ifK4ng9iZUShs/7SvwNikjI9ZNhFVvMio0V0z/snBflZQAHcMQ1jkjW+kMBm4rskXi+fUQ9TZh+T8GavR1yTQ8mCzaxPThy/pMYcS/B57lZ2a7tY1uEZtJfZdTjLJ53RkEHvS7Pm+Jf1Fyfs83359+pl2OgOwxocbnEmaCXmzv699EcxPyETpcFGcTSE4Sji3I5q7xKy7Yd6oD6A35YJrwPMkYcBuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlRWqy2KFGv4IYynZao2oNqPMPDr2xUqua+m+KlFHS4=;
 b=tl41TWSVND39SntmF9nNSOQSEKDnbF8Su/BMqs/9YpgkqIPUClAPySef3Ra9Qyw13XFsqeMHj5M0aRsig6GmmlRPIlDDQLVbahuCeK9zDt5gP5qNwc7BODTrljf3QddD5PeikYDQyZlqesNMLAK7EEt4ZBxyMSpm+FDtRPQgy9g=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8345.namprd04.prod.outlook.com (2603:10b6:303:134::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Sat, 23 Oct
 2021 08:47:30 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:47:30 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 03/22] target/riscv: Implement hgeie and hgeip CSRs
Date: Sat, 23 Oct 2021 14:16:19 +0530
Message-Id: <20211023084638.1697057-4-anup.patel@wdc.com>
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
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:47:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a1b2dc6-47e4-420e-a51c-08d99601bf5f
X-MS-TrafficTypeDiagnostic: CO6PR04MB8345:
X-Microsoft-Antispam-PRVS: <CO6PR04MB83459D22EB94D683F9597C948D819@CO6PR04MB8345.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tIBpvOWFAc2e3WdR7FGtYkL3mFOS5/+nVvyVeb3xMwt9SrTKV/NvK58zc/BAIW5lgTpeqfuyGVAT+O6lUdyrddgR/DbS+EHFtikpQzC7hmTe5OGnuw8IfcZpe0JAsDETe+0YNNr8h+sQ8nsxEWHSKpw29fufCJxus8/DNRrTl4LUSY8DMcgHu4xSmTFrr/so8QOflM2+1t0Nq6LsY/WwnJYremLAavVARC6dKvM7Sf+XnWAAM9AKmTl9kOJBpqGWDmmlBNZw5ag+rg+s/OVq/HV6a4HDz3Hx9MgnEYWRqkuKvqJnGVL0GsdAHX/BWIrUeSRDi4eEwfPTwmqbtkpLjDQe8gwHl21F1AnIkvrodwmscX/8Gro6HthY+WCMLZs6Q8bP+z2Wy13GDUPdbU0w9QSJhij8tqGc0ZRRXlJOSbM2RSEjNW6/Rr/wQtRoymb7MI0zQQSLBUCoOCikGPpJZ82Ip493QmiGlq4Vc+KUW5Dg0km9SLpsJGObYlPHGxJfp3T1Wm27brmzzFrItnXPu11TD0a4cCppbuu05s4Bx9MI1clLwJ12EaKu9WXLsOYlE7NBI1Qea47u+feMMntO1Y0F+tKx4SP6bFfZHF3T8qjmRgTYyEUfu0PiQmq9v3P24wQKAz7LVcv7G6Yg6EMMd5TsT5l6zW4HwLbsA8dXE0S96C2gYV3o9sLwoOw0SjriESbuXGy0CRnDfsEufZAk9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(2906002)(1076003)(55016002)(52116002)(316002)(6666004)(2616005)(4326008)(38350700002)(5660300002)(38100700002)(83380400001)(956004)(82960400001)(508600001)(110136005)(26005)(30864003)(54906003)(66946007)(44832011)(86362001)(8936002)(66556008)(66476007)(36756003)(186003)(8676002)(8886007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IVDMkJyTG0YqIKIrvx3FTAOrRaUSu3Cz3Vngr99yPuSlkvIGMy3T1By8Wee+?=
 =?us-ascii?Q?TAMs+0RMCgON1XPXzZ3IUlNaZR0eLtBPsXa6uMlYQzhC9oYIg5zHM7RnHhKx?=
 =?us-ascii?Q?7D9WPu4zaJJ13gBp6/otREiSQLhyF0/7RWRgR+zoGZCyk9diA3E2ijQqu6qF?=
 =?us-ascii?Q?CnFXmfKNb0DbwSzS0LfAPkrXlAfbUxTWj3xJ6uh83jlrw7RF/BeD1BBYPlSD?=
 =?us-ascii?Q?/OWVzmDJxKsKl/glCEEK+kxSuZR+xDHglqG6YFWHy3Y9d/TrI1SGdNHFYhGm?=
 =?us-ascii?Q?JGJ34anNsDj65ZTZE78gI+WkfYbsBAMVcbSbmc7RVxV51UFVSHqCPKpMXPI3?=
 =?us-ascii?Q?InDfKNf+53zCa2xUCSqZh42kKWwwiljW5ZNISJcnHiNQDdiPKt9WVXUHP9F+?=
 =?us-ascii?Q?aVZVwmnyq4rCrI43ES+1z9rVakK/op2AoygKJIpuUqpwFQ2zGYip3574gdRI?=
 =?us-ascii?Q?r8OHK+yzt1QFWWILiBUOdUePHn/lq++yYOUdHRVpK1OFLcqahkRa4IRPyDrv?=
 =?us-ascii?Q?lAaG0s+o04K/pOt8X4/pBHAXrWaKKtyfdzLwfNK8mfcCuPGKlj3uUDJdDN0V?=
 =?us-ascii?Q?Rg/0UKWAxCx/kEKtliFrObRgXY3/oTLe5YttfdV8cSQaBzXhGil0PqOnmu7K?=
 =?us-ascii?Q?kQH18FT8skO4F3n/Y+yrGlJT6Z/0GAyE9ZFV3LpGdF4dMxyEcOjQs2O+RKMd?=
 =?us-ascii?Q?3zNa3JxSw57nQzMjjDsXEEZfOLDnCGterAakcjal94mlchybYJgrMuwU4Bzb?=
 =?us-ascii?Q?Maxfrfti4re+0PfkvCSoYeaqfM86e4+iTjL0S74VB/iN6neHR7YCSBj8moSf?=
 =?us-ascii?Q?nexouTfMKr2aL7SKtRYJbaBVR8fFMu+wG314jUlDvlMra4Tx2r3UMPw+SI4b?=
 =?us-ascii?Q?UWP4ljm3K5CfMJ33LBbVmn9WAKRWrbx8wB6whvYGopqDLNWkZHWYY1q+cnxl?=
 =?us-ascii?Q?otireWdG6J5SQ9mTMA/BCeaYRFlD9Vi2PPkNEwTPoCeUYAbRrEuAS5FVAkI5?=
 =?us-ascii?Q?FEo7DSP3AhAqumEd6DIdHzTQC8/HAKVdkUwQOmv4vejXKetfrA921PvQ9hwK?=
 =?us-ascii?Q?SIBWDsD4AwBLaSokmwP1SZyp0nboXVft7boyxM2pfGeyiUNKqMfEu13+/tDP?=
 =?us-ascii?Q?SNwQCxVjJEdmXT84c+kh6ZAKA5TuqBhu4Kr6rs7aeGQNAajhOnIpk7aE90hs?=
 =?us-ascii?Q?hg6Z2Cd7H9HNCvQ7IVvyu1/Ou5+UvpXeXIoWjmCbq7Sxcf5/VB+pEgX4nS3P?=
 =?us-ascii?Q?XuYIjucnwEXcLfU+LupmStdWFbung5ywO4y83dExxx1KYvBsIPQoHLZUaRqx?=
 =?us-ascii?Q?i+Y0u/FL3H0k8pTIj4yQhBZH7s9adVqNi7xY4rwZLYlMVRIa3Zux5szV2GjR?=
 =?us-ascii?Q?AFLdXb9hD3tN912W9Tccn8Y8PZW4oZcHHz/ZqufU7nvxSgvw3cDXLffFdwcf?=
 =?us-ascii?Q?pA9rknNuk2CPB2NgOTXvJ/JW4rBMXeTubPHB7FL1sNJoUPZ9WR+pKCcYdm1R?=
 =?us-ascii?Q?ksXFHz/0DawAYCupf95j5EgiAiK7X24qWD9moQelP7d948LiwlxVp7PuNAVy?=
 =?us-ascii?Q?pc21l2GchaSnF30wS/DW1ESI5EbwNZjNzZlyy2x0GFFX5ZZgPLHZnuvEgCss?=
 =?us-ascii?Q?80b0rOOHur1MIqit3vhHztg=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1b2dc6-47e4-420e-a51c-08d99601bf5f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:47:30.2482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: waw/KhhJNvV7Es6tP3qEpIybFH19bGCmAwvkuEp+jQeidktEsgg+9LQnZuPFWDdegvUZy1uSj7385GisNtolJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8345
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=92346df24=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Sat, 23 Oct 2021 08:47:39 -0000

The hgeie and hgeip CSRs are required for emulating an external
interrupt controller capable of injecting virtual external
interrupt to Guest/VM running at VS-level.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c        | 61 ++++++++++++++++++++++++++++-----------
 target/riscv/cpu.h        |  5 ++++
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 36 +++++++++++++++++++++--
 target/riscv/csr.c        | 43 ++++++++++++++++++---------
 target/riscv/machine.c    |  6 ++--
 6 files changed, 117 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0460a3972b..8042c4ebcf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -570,23 +570,49 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
@@ -599,7 +625,8 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 
 #ifndef CONFIG_USER_ONLY
-    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
+                      IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a33dc30be8..bbf469f079 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -148,6 +148,7 @@ struct CPURISCVState {
     target_ulong priv;
     /* This contains QEMU specific information about the virt state. */
     target_ulong virt;
+    target_ulong geilen;
     target_ulong resetvec;
 
     target_ulong mhartid;
@@ -185,6 +186,8 @@ struct CPURISCVState {
     target_ulong htval;
     target_ulong htinst;
     target_ulong hgatp;
+    target_ulong hgeie;
+    target_ulong hgeip;
     uint64_t htimedelta;
 
     /* Virtual CSRs */
@@ -337,6 +340,8 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
+target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
+void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8a5a4cde95..335e0193a9 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -500,6 +500,7 @@ typedef enum RISCVException {
 #define IRQ_M_EXT                          11
 #define IRQ_S_GEXT                         12
 #define IRQ_LOCAL_MAX                      13
+#define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
 
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0d1132f39d..bb7ac9890b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -125,7 +125,10 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 
     target_ulong pending = env->mip & env->mie &
                                ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
-    target_ulong vspending = (env->mip & env->mie &
+    target_ulong vsgemask =
+                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEIN);
+    target_ulong vsgein = (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
+    target_ulong vspending = ((env->mip | vsgein) & env->mie &
                               (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
 
     target_ulong mie    = env->priv < PRV_M ||
@@ -241,6 +244,28 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
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
@@ -302,9 +327,14 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
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
@@ -312,7 +342,7 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
 
     env->mip = (env->mip & ~mask) | (value & mask);
 
-    if (env->mip) {
+    if (env->mip | vsgein) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9a0a0c0679..7ff285282b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -793,7 +793,7 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
     RISCVCPU *cpu = env_archcpu(env);
     /* Allow software control of delegable interrupts not claimed by hardware */
     target_ulong mask = write_mask & delegable_ints & ~env->miclaim;
-    uint32_t old_mip;
+    uint32_t gin, old_mip;
 
     if (mask) {
         old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
@@ -801,6 +801,11 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
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
@@ -963,7 +968,7 @@ static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
                                target_ulong new_value, target_ulong write_mask)
 {
     /* Shift the S bits to their VS bit location in mip */
-    int ret = rmw_mip(env, 0, ret_value, new_value << 1,
+    int ret = rmw_mip(env, csrno, ret_value, new_value << 1,
                       (write_mask << 1) & vsip_writable_mask & env->hideleg);
 
     if (ret_value) {
@@ -983,7 +988,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
     if (riscv_cpu_virt_enabled(env)) {
         ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
     } else {
-        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
+        ret = rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & env->mideleg & sip_writable_mask);
     }
 
@@ -1102,7 +1107,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
                                target_ulong *ret_value,
                                target_ulong new_value, target_ulong write_mask)
 {
-    int ret = rmw_mip(env, 0, ret_value, new_value,
+    int ret = rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & hvip_writable_mask);
 
     if (ret_value) {
@@ -1115,7 +1120,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
                               target_ulong *ret_value,
                               target_ulong new_value, target_ulong write_mask)
 {
-    int ret = rmw_mip(env, 0, ret_value, new_value,
+    int ret = rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & hip_writable_mask);
 
     if (ret_value) {
@@ -1152,15 +1157,27 @@ static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
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
@@ -1188,11 +1205,11 @@ static RISCVException write_htinst(CPURISCVState *env, int csrno,
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
@@ -1619,10 +1636,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
index f64b2a96c1..fe99ec7304 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -102,8 +102,8 @@ static const VMStateDescription vmstate_vector = {
 
 static const VMStateDescription vmstate_hyper = {
     .name = "cpu/hyper",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .needed = hyper_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL(env.hstatus, RISCVCPU),
@@ -113,6 +113,8 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.htval, RISCVCPU),
         VMSTATE_UINTTL(env.htinst, RISCVCPU),
         VMSTATE_UINTTL(env.hgatp, RISCVCPU),
+        VMSTATE_UINTTL(env.hgeie, RISCVCPU),
+        VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
 
         VMSTATE_UINT64(env.vsstatus, RISCVCPU),
-- 
2.25.1


