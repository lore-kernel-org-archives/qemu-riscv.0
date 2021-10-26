Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBA-0003Ds-Ri
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGB6-00038C-3m; Tue, 26 Oct 2021 02:43:21 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGAw-000075-76; Tue, 26 Oct 2021 02:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230589; x=1666766589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cCSVrMFQZK0YBYECnnhAPfLUnCnHNqNNUJ+jWklO1VM=;
 b=LSvAUrbBBZ6UkHDkfkvZR8X89mU2G81dgxq8mjL3tYDNBtvKtn9h2qUa
 3oE0+eNw1Mt4n3kz7nW514eoqYLq70+9NnDDrYcg49xn23qVvLqPiuWsi
 +HE/i6KVuoDmLGtp21R9I9nbH8YjOHEe0Ev1q8XiCwI3wnc8+vKTzZWjW
 G1g2LDYZNbnHbPOAqJ8YE4M+BoK/El2DXj2oLBonJaWCJO7TnU6LqqrxE
 4zNiMVyt8zClsFpCzM1iaryEM28IlssVBPQknPBZgjNMKbafCAhi8XAwo
 UcqqKT9r5AupPlJPJRMSbJVEQ/77PH4pSREVfdHfrsmOa8f6QXsEFbus5 g==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="188620394"
Received: from mail-dm6nam08lp2040.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.40])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gF7jD+i39TroE1pb1tCRGvjeeV5TY2mpoEzTyTBxXQEnUvAOoJZxDqeb6mprDGtr6/zI2DgBB/nBIhqxHe8kesguETLhod2LdckYruxtRNtKFVE2u3JtsDeeWR7ERpK6TfzOHV9Q4EmOxWtBCL7KZ4EPa2VOknZZ7itoZf0XLcUgdDb9kVY9czisuLt1G6CVsKGtPUiIQ0KGACkhCLcdDMi3itdet3lq87hoqHlAIb8D637QAJg5HbNQI5UfFWrV6veodL2bmzoFunUjaD0Y9eAqBupDL/JgUBCVeXEnlxJHgSorX6fwBUOJwHkiCiIGU6Eo3cIArnvpc7lb1McvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlRWqy2KFGv4IYynZao2oNqPMPDr2xUqua+m+KlFHS4=;
 b=Vpt+eBlR8qB16tUcSEKqyMEBISKCrPGnEAXRwGewUhWrzpSZOaZAnnp5LC2MCsMEEYSGX5J1L/PjGgpXkr/URuEbdlhhn5UuN2RdR+yJXiPPpdrrWcd9Im+c23TsiKPdcEwzK0GzbhQmK4kydzdHIInvGCMKWgouSXeok2VtSrAv7KaRJ5ir36X8xTptiZorbkqhznpn03EZx/1z/FLex4L1MLdUS1/lTEiKti9tqgsFwz80A3aBGM3+wSgZY6zK3ES2BlcD9XbeBPXRSIFjUYn7pxO7NuLTrU/fh4f1J3igSrnFBmCWRXxeeef1i0xlseYO0MPvbMh5xTN9GTSpOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlRWqy2KFGv4IYynZao2oNqPMPDr2xUqua+m+KlFHS4=;
 b=Uj3BxQSrRDoZ2j+X/zCiORErG0vLXkXoTBlcuI1A22yXG4MANqelPTPvxnfhr59R/oqvvOmW7pKOx3YlZdGY2pCVGNVkom3aykuF0nEVwH0Mlie8mmZ27P8MlR1vJ+A4fvj8LkjwVrfAUOWuMUwd8xc4wVQFpB1LUlF7NQOxCE0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8394.namprd04.prod.outlook.com (2603:10b6:303:141::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 06:43:04 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:04 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 03/22] target/riscv: Implement hgeie and hgeip CSRs
Date: Tue, 26 Oct 2021 12:12:08 +0530
Message-Id: <20211026064227.2014502-4-anup.patel@wdc.com>
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
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed0cc16a-e04f-4ab1-ef01-08d9984bdccb
X-MS-TrafficTypeDiagnostic: CO6PR04MB8394:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8394C1A02AC36958677FE8378D849@CO6PR04MB8394.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u6kvlVRqy/7uScAZukUSkdlqfD8MPgwFLaRx2Na74gX5/EElXNd9dywZ9RNalg0CkpJ7SRVfO3bB06BjT2pWjMOcG73je0x6iQZe+8qerUDstN0FGFnfDpXUogKueQ8TcM2Rk3heymixFLhYXPdY/orrDYwNTy+XkqqqaVN2Cg0n+UqBzFRIbpBOceKjSULwg86mmRSUB0GikpSQ5HJS9aR46Jq0SmEONd1BivrUedlbQDqtfReyf0s2/rwOpM/YeX4P13Q/dvZG1gh7wE2ct+Jbv6wpRz2g6tMdZIb+84cP2kl1O2m1MKInZ39ME1csh1Lkcl3jlpcgq05RPFn2CDSY0r6cjJGmbYyNWG012kj1dWwWme87EfpOfageTzgrrf7t+pfuyLHpf3NtrRti5vgN4HHpbkvkn+mrTPILmUjp1A9Sihmb5QRH/nyktIiSBwlC4ZEC4rpO5RC8q7dci9NnSvqVAZkneAX6DbNg1gW4UlQRMDmQsAhVWqajBKWEKmchVgVQCn4rDYqySSu0HcjSqhKUfrNcIvCxTQumHpNUqaKbI8XTisgICYv3Kva2K0HllFD6amacarwLRIYkYrODpU5fUS3WNRrcNB7+K7MpiijBKaIX/8BS0rUmgjw/CHEeVrN7okg1BrTQO5PEgXPTCkBdDI6qx/jTTY8VGKVV8eJeEqcNYUGo2Zybd+aUoUHT6/xCJgm0+MTL7Govrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(956004)(83380400001)(8886007)(508600001)(8936002)(44832011)(82960400001)(8676002)(5660300002)(55016002)(186003)(26005)(36756003)(1076003)(38350700002)(66556008)(38100700002)(66476007)(66946007)(316002)(52116002)(7696005)(4326008)(86362001)(54906003)(2906002)(30864003)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XQBVUfHVRuhdQwLMrmuffmFxfqlh4PaIJuCWE+p6qP2dr6pXKVo1isV/e+Ty?=
 =?us-ascii?Q?5l5NiMa3wiIpULnYj+AFq2K5bkipf3Jm7lT029TiQRMFrVCZDXw0eBtQCZeE?=
 =?us-ascii?Q?lOz2EuWD019sCI22rP1Jpwj06QEQrBuuDRurGnjLLQ62k4k+xp1hlXZobrII?=
 =?us-ascii?Q?TFr8fxWyPI3SzXX8pYOZg82subOwDn3J6QLHV5XH4YG1zctNL7u76edlfEPH?=
 =?us-ascii?Q?SZ2NP5sBmzjDTuZZRHKkXrxd5Anq5g4P7yXtz1ncXpH9ZbVl24wSYoWfzGPH?=
 =?us-ascii?Q?khuOc1XkIorqiMiNrTpJZxPm2scNiZLv3oazqCbsypheeZaNCJKv98omAsNJ?=
 =?us-ascii?Q?BU+pvjBS//VBcPeq+Hrz9o+TecI99J4LiytSUmzrRbQYlq7rfXil95Gj9/pg?=
 =?us-ascii?Q?lurabhUMpUgMpbs5mAd7AQ1uXv+EFUX1XPoHdOr+Vw4GsIH6BA5xOD0vam90?=
 =?us-ascii?Q?J1EIXaT6bpuICsgKxxIiw9m/C2/wFGQuWw2cppjVq/ZoLuJrcQT2aAcl+Rcc?=
 =?us-ascii?Q?KXP0kISteUu0amKqgTv2peOWGU5PTbIQOb+r1PVc56FtqQgEp0mIKg2BhqTE?=
 =?us-ascii?Q?JoMUNpyj0XEFc2wJuFSv4WwXu0oOgZlGwsxC9/yie4QHlKfI8Ndi3ut/Q3Lz?=
 =?us-ascii?Q?1vs2UPbJgPwqMSG0TeQcOY0QMUEmRbQs9m3biPEssuiIgDisxTTExJg15XwU?=
 =?us-ascii?Q?9fORwRh2wYTi4sweJenVEYx88dkfTtWKm9HGKUYba5aWJhnbHh3jcJi3RICV?=
 =?us-ascii?Q?VEGH8hn+MH+uqdgVrC3lkwrl3CAPsCe80MZjKgSrsvlHk7EcaDt/tYnj1ZYP?=
 =?us-ascii?Q?IYzaN8YnmuGTwmgschZCBtvqmAyA1+L+c730gjq667daM7oMQV8/RtpnDBFS?=
 =?us-ascii?Q?YErfjab78rtjsxm9d+njIdaVTiyvMC9VeDJonPKqhQLm2JX+gipSML7M+xp6?=
 =?us-ascii?Q?DTgzT8DkK9M+mcsE+br5JYH+NDjW+qpOK6ojg206B6VOa5y1mB+GmQPQZuR/?=
 =?us-ascii?Q?S7sPv33h7nkpAS4Z8TgLE12sl5Xki36Y4CkMNLL+n+jPC3qhbyGb/WqkrUpc?=
 =?us-ascii?Q?YOsbSWsVktEKVODEn3kkgnzBmIlnDhsA5nORqsijxh7Vty4xst064Bt9kyzh?=
 =?us-ascii?Q?0d7hf3tlZyG2+LhH3vYCOeP+P9HrKPZssLHtXZRBsSPGKJa0nmCe0zDIYozc?=
 =?us-ascii?Q?P6i3s7LuuX9eDM26mlji1ikAR+7InjmW3sTABDhrl7QV8yLeJJBEvWBUGgYp?=
 =?us-ascii?Q?Cv0WvyrI+MKemGmwOcRs8G5eyVDutD4QrcQloxXpmgZGl2jA9/TshboaEb2T?=
 =?us-ascii?Q?FS/5fxCCoBxgwsmjOTZ3DfLVTD9ZmajNkCcLXxzLsTQqxTMLWp7ZhIq6VJXr?=
 =?us-ascii?Q?BjB9itEYbbfErR7jkc7dPH63r1za9TDc1Dxb6kXwZBJ7fQvm7wHfJMO2TO0P?=
 =?us-ascii?Q?jlIMIUjtdfIBembAOaJfaV7YZYEZm/eITl9Haluozidx1J7fbVtgc9PQtuSd?=
 =?us-ascii?Q?2jz3b3/Lfeya7frU98O1j6GxJN8n6OXzrs0uCVWButJfmxrTx9qC3qRf8Rd+?=
 =?us-ascii?Q?8+wqmYeBNpCxcFue+HkSXkyqxw1M0hWKWMa4pizcl6dG84/XfitkYvcRBLgU?=
 =?us-ascii?Q?cJT3rDkeAr8slCX17c0hf6E=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0cc16a-e04f-4ab1-ef01-08d9984bdccb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:04.4883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNSXFXUKv7/RRg7BqeZUNCN+EdrP20IsEcIv8EkJELknJEUPRNQbgDtbm9ENvgqcF9IvQCKr84uHw5//xr3YVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8394
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Tue, 26 Oct 2021 06:43:21 -0000

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


