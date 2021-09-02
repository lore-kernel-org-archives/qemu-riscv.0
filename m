Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrJ-000158-JF
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkr5-0000yk-ER; Thu, 02 Sep 2021 07:26:03 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:19800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkr0-0002os-V0; Thu, 02 Sep 2021 07:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581958; x=1662117958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IwLfceaii+ewxtnmZtAf3ROwzid1cVFqrP+CLu+BDRY=;
 b=A5aIdFdYIt3dzlMrryiXaCZxixWD1qCTHpYNdDu0mrOYrAr3CD2ZIr5N
 k0p1fVR5LpmmbZnUeEqSWxAOFpG3ujd/PaIKleLWzcQK2MZuLUaVD06wA
 4wGCCKqTkija8vofpigIH1WrMsZmF0pgqxVE0vwAx9I53/VOOIfrMcCUw
 6/oqGySlibdp1LF36H9uCHjcayAioW/YAqi9U0q6+eLMV2FY4NnjuuGn5
 a0iwAKa5k5rhohQoih6eQnt/Mm/MiEf3kMAwteV4UrpTwJ0AALYXOIRO/
 KtrNDoxsp5+0HY6S5S3zVuUWIPuN3ePKUlZCT14fjUUu7VqUTlk+cx0K/ g==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="183824517"
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:25:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iN1YVEmTZ5IwsPA8K/cxz8JVFLN2oM9bphp6xZOb2gltTPFtpixJ+gX6Jx3HVcPJLJN04coPB6L7LnLED3W4xuFiMUulJTZ4VSyXaGYHwpBZR6DhNmFNXVah8G2KsD6V1QPwJiX850XAO1Uwa4I/BMrXHk8JR5FprJ6av43Cmb2na0i7d3MZ9YXhSKaLLmnMcpsWACgFKeE3wLVaI0C7r0p/5pfCmAHVuIiLjvteIQvP1TBIHZuupSwHZAdAJKQg9Hi7eJRHCZ/RAWiSKjDTdjDLuUEG810tDo2Eeo8N/MvTBvYF7OJfVm3W9Ep/7mXl6WRLlz5p+vkVzbr5wtuaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=kjFSOwjIthW90qmewWG2B0hiF7iLbHK2Q4KVucG4fzc=;
 b=hOhpbVQqV34fLMHySYmEKDnRZNs7q79AQfl9qhf8czj4qHjmX2Gtr3S5V6v0inwUk9WI20QAZaiM0qIEjgy1sPP5pHnfUxh1HCx2yopuAOFS/q47xgz22AuSjntpXzRQuoTv8cJdMF6snURf/6TWO13Wx+VwxRf0Tr5fHxsmvklxfEWSKs/WdjHM42JlOTiA2NJYonS1/Mir+vvoGu0qANK9hnKm1pIDBG+yCvGRz8g3NSAKlzwjkcaHXsnhWVVuhAc1jkBty/kvXAnLtTWA88jPB/oyRPuwZi9T1CdxJiDly/IHLcIckpPWB/bwOAmTv8YGDsabN5X76spltXLHCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjFSOwjIthW90qmewWG2B0hiF7iLbHK2Q4KVucG4fzc=;
 b=KhjYkFqkb6T6yH9TCgqnp5OEFWFvW0HwZ/AX7UTqlVlAWKtETnc8Y82hCGLd32xOPBg9AbieO6L1du8fcTNDxZCpR8i3y9JeAsXty3EfLid36Z11akVpxL8m3OjA4nWyP4uWDgSOl6Lr6X9GrsQ7kVzfREsjnrouA8b6Cj3i1CM=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8250.namprd04.prod.outlook.com (2603:10b6:303:161::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:25:56 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:25:55 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 03/22] target/riscv: Implement hgeie and hgeip CSRs
Date: Thu,  2 Sep 2021 16:55:01 +0530
Message-Id: <20210902112520.475901-4-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:25:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 083c69db-e6e2-47b7-dc78-08d96e046e36
X-MS-TrafficTypeDiagnostic: CO1PR04MB8250:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR04MB82503D38423822C303890C6A8DCE9@CO1PR04MB8250.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7wmAKFLgZ2PnW3x0bN/Da2OwATEefZXbKGNLOGmy2NVPi2KZvjS5g2K1BggMQZTYYiseWWhzXeG36oWEaCxj7slqgjEcUnKtfKQhcwTZmn6KX/qQNLYg+Xh5cJ2+uQ5Y80zEHfhLRLjVdLaYc15FjQs+DS6rHUuGQvFh1LSeJjXXSzB6WSSfXb7dO/XkOCDfQegTS3YN+swNtBlU2RyHqiwtMs9jdJQYAQUgZbOa6vzxGzjk72Or49vQ0k3JsVfSZyogXLQapcn+yPHuh1w+U8BGm7dr+YY15ISPpfCJJNs2vr8xdzmeZcnuwnUK5MRNpnMxprTZkzyvBWSdFWxkIa74tWTJJf2RZpGldEkLSFk/y6wi1+jT9c/IjbGmw/lT/+OTeC3AfsRiNG1SWAF8UVaM/tqi5HoqrIohm6nOYgoY17eatjeJwRfWEg7N/i6mscnEFK+4v8WQiGpcGDXEcENw/8hfsWYMFmjILGNpINRkP+YweG3KysQAIJDVasprwsWKi0NOJAPATn696xsThdKdiBVKC9GGZeeMoDMfGGOIhHdLEsCcHy6PbwUvgneZPxkFo8h51TSIewjzC1hkhY8v6RH1/SZ9qKk/q0n6J4LoH9rTNK5Cvo4yotgXI5nm7NrC8LX3fF1Go2Deegt4T7RAGQL0cE3N+wsUJeKg3vV7Wy+M9RyqKcdb51aLiQwR/FNwF4jocQ/oTT8om6h3ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(30864003)(83380400001)(8886007)(7696005)(52116002)(6666004)(316002)(66476007)(508600001)(66556008)(86362001)(38350700002)(38100700002)(8676002)(186003)(26005)(36756003)(2906002)(956004)(8936002)(1076003)(66946007)(44832011)(5660300002)(54906003)(110136005)(2616005)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hG1fcPslqQvlsGrvJoz5nDvhmzD21H3QnviYOlCzdN1mG8MQDu1MgvUjUh0e?=
 =?us-ascii?Q?j0o9HPHrDeZZSXTJeGGOKxOaXKJusRem0EKNIpJKc+Me/PPA/ptEOEdYC7Nu?=
 =?us-ascii?Q?9xaY3H77J8wn7X35UwSTKfdStn+LUn7EDA5j4uU/6ekYccIct4K6pqyqxdVI?=
 =?us-ascii?Q?H+AWLKgotRCgh58VqQXUls0fxJc3dnM/3VA/iXdjvg2ch0IeMYRHUyVHGkjd?=
 =?us-ascii?Q?rO9eSoAEzaSa2tmh+YayOJn0BoYY7a4BCOhTJ2CdWt4eD1scGdyPVUZw6ezr?=
 =?us-ascii?Q?clhPMO10itXCPelm4umJsplB43slyXPzsbpp2CR1wMI36EvGquvG4uu1q+uu?=
 =?us-ascii?Q?GTP9Db4vR3cF2PbU95MnA3TCrcNUSoazkFHYkWOcHvcSjOY5DhKJ/jsx1lRg?=
 =?us-ascii?Q?tuxuz6OD6L9YmA6/XtauPnVVqZqpjY8lk1rnBaVd+G1n2EXm8BL6Pax4LxiO?=
 =?us-ascii?Q?7qFu1H/amdmEWo0eC5YTIxxEroyfyL/ODV7anCRNOpwLCYhn8tIZ45Cf3kwE?=
 =?us-ascii?Q?yt8gwhgbYs/Ljl0Rob32JeJMxozKcVXA6xMmgK2o8WOBf4sPdbWRUI6lmgUj?=
 =?us-ascii?Q?Gcrg2qs/N5Lka0Dw7fQS7RSy7x8dc//tUYeuPiIsbN9kPzPWu60Q2SM7U97s?=
 =?us-ascii?Q?aEv1t1N/CelMTUiJ8hCNpy+VN0Swt9TGDskdX7E0Fis5O4bIuxLYh5Pr1S5j?=
 =?us-ascii?Q?YWSbfOkv+NzZkJzjZOH5YJ8KA3hh39jhPsQ43Hl8FDHAZ0ZsZKPLJFywpC8b?=
 =?us-ascii?Q?k2jaiy6DOBhUynZVkSeq65MYGvTfGfwf00OCaxX8HK5gi68kNZyf2FqOCGtP?=
 =?us-ascii?Q?qBOtdaenar+W/9DbBmC0h4eqil8ZVXuat3ZF3bmyqeHu6iL8zElVtImii+yp?=
 =?us-ascii?Q?K0g+ylGN2u7+WW9GrKFtOhlo0OCCS3UzdjKaqZqCuz4KoWvKyLQOTkwIP756?=
 =?us-ascii?Q?XZk1qh2XkL0MSp7lgav59U6H/Rs0ULNtySF5ZhKpgOfcCHoYlIxL4AJWplf1?=
 =?us-ascii?Q?z2PZ1R1Lv2XtkXxSsj76lU0QzjqObcydOmFi+sYLffwn0xyd8g11aOnJ3tTd?=
 =?us-ascii?Q?HH4qYhRdLMlUt4cqdR00RSmoNaZph/70OrgwTBd0brUriTlCN3S9vS5h9ZiT?=
 =?us-ascii?Q?h65aQSCUk50OtzF6tDmTrRLLwmIDDNwcMwntcpzRv35Pc6tuACxPLKdOCoxR?=
 =?us-ascii?Q?KDF1D5TBLqc5yBNMOwkib3cn4s9f1BhDUwYLnLWfg4q/gkSkJzjYmd4lGuoV?=
 =?us-ascii?Q?+TG5eQ0obuch0Ww8Y37xLcz0ri6QvIN232MgabXpZHQN1ydCo4ApKKGfHWW0?=
 =?us-ascii?Q?Vmnzan9CwI5x91nWGPPTgQyk?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 083c69db-e6e2-47b7-dc78-08d96e046e36
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:25:55.8993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKvJemaWEw6kPWmUsCXrd6sZwOc1rfuIkJA0umFeRDevhbloh8L2+aH/zb0OVDevFHp2u+fi5MnlhSLL69X73w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8250
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=872ab4b15=Anup.Patel@wdc.com; helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Thu, 02 Sep 2021 11:26:03 -0000

The hgeie and hgeip CSRs are required for emulating an external
interrupt controller capable of injecting virtual external
interrupt to Guest/VM running at VS-level.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.c        | 61 ++++++++++++++++++++++++++++-----------
 target/riscv/cpu.h        |  5 ++++
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 36 +++++++++++++++++++++--
 target/riscv/csr.c        | 43 ++++++++++++++++++---------
 target/riscv/machine.c    |  6 ++--
 6 files changed, 117 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9d97fbe3d9..0ade6ad144 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -572,23 +572,49 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
@@ -601,7 +627,8 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 
 #ifndef CONFIG_USER_ONLY
-    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
+                      IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf1c899c00..59b36f758f 100644
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
@@ -336,6 +339,8 @@ int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
+target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
+void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 17ede1d4a9..a1958dbd6a 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -506,6 +506,7 @@ typedef enum RISCVException {
 #define IRQ_M_EXT                          11
 #define IRQ_S_GEXT                         12
 #define IRQ_LOCAL_MAX                      13
+#define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
 
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 968cb8046f..ee316db594 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -46,7 +46,10 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 
     target_ulong pending = env->mip & env->mie &
                                ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
-    target_ulong vspending = (env->mip & env->mie &
+    target_ulong vsgemask =
+                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEIN);
+    target_ulong vsgein = (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
+    target_ulong vspending = ((env->mip | vsgein) & env->mie &
                               (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
 
     target_ulong mie    = env->priv < PRV_M ||
@@ -167,6 +170,28 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
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
@@ -228,9 +253,14 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
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
@@ -238,7 +268,7 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
 
     env->mip = (env->mip & ~mask) | (value & mask);
 
-    if (env->mip) {
+    if (env->mip | vsgein) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index bc25c79e39..77fb5884bc 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -764,7 +764,7 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
     RISCVCPU *cpu = env_archcpu(env);
     /* Allow software control of delegable interrupts not claimed by hardware */
     target_ulong mask = write_mask & delegable_ints & ~env->miclaim;
-    uint32_t old_mip;
+    uint32_t gin, old_mip;
 
     if (mask) {
         old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
@@ -772,6 +772,11 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
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
@@ -939,7 +944,7 @@ static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
                                target_ulong new_value, target_ulong write_mask)
 {
     /* Shift the S bits to their VS bit location in mip */
-    int ret = rmw_mip(env, 0, ret_value, new_value << 1,
+    int ret = rmw_mip(env, csrno, ret_value, new_value << 1,
                       (write_mask << 1) & vsip_writable_mask & env->hideleg);
 
     if (ret_value) {
@@ -959,7 +964,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
     if (riscv_cpu_virt_enabled(env)) {
         ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
     } else {
-        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
+        ret = rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & env->mideleg & sip_writable_mask);
     }
 
@@ -1078,7 +1083,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
                                target_ulong *ret_value,
                                target_ulong new_value, target_ulong write_mask)
 {
-    int ret = rmw_mip(env, 0, ret_value, new_value,
+    int ret = rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & hvip_writable_mask);
 
     if (ret_value) {
@@ -1091,7 +1096,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
                               target_ulong *ret_value,
                               target_ulong new_value, target_ulong write_mask)
 {
-    int ret = rmw_mip(env, 0, ret_value, new_value,
+    int ret = rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & hip_writable_mask);
 
     if (ret_value) {
@@ -1128,15 +1133,27 @@ static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
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
@@ -1164,11 +1181,11 @@ static RISCVException write_htinst(CPURISCVState *env, int csrno,
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
@@ -1595,10 +1612,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
index 16a08302da..a669d63e0f 100644
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


