Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m7Gi1-0004k8-Q1
	for mharc-qemu-riscv@gnu.org; Sat, 24 Jul 2021 08:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=832e875c5=Anup.Patel@wdc.com>)
 id 1m7Ghz-0004cx-LQ; Sat, 24 Jul 2021 08:24:47 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:10323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=832e875c5=Anup.Patel@wdc.com>)
 id 1m7Ghv-0006Zm-Pm; Sat, 24 Jul 2021 08:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627129483; x=1658665483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=l5CnKfG6VAiRoUBlEXS64LXGEo9P6kzAo+USMHOPtPU=;
 b=mvuIy42saFexOyEG0kHBqKabQUGNScSBkADpW5B7kroZLfms4SVfEv3A
 sKJROlSROZyM0fYo4cEzGQMnBMBCBml2ZsfbXcDhzQ6PpKg7bj3pSOW8g
 Q3O40pQHjF5FgPU5adZ4/v9NArE6o2/mAO56nQg93RtvKGN9ej1L754Nb
 pXVWQvmiqTwz96940My2kDeus+wfevGBxNAMRTrVw/E/0CQYNlHdaXcOi
 Z4YJ2p5b1yW34/Jhbf18jLfmIqVS6qkp+QqeS/F7c5h3B9tuUbDOCGgEs
 0lBHcs40dL5/x7Zc2pC60n1TrvQLZw6qeaM08GgJde/eVAecVGjArfJ2d Q==;
X-IronPort-AV: E=Sophos;i="5.84,266,1620662400"; d="scan'208";a="180215597"
Received: from mail-dm6nam08lp2044.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.44])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2021 20:24:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kj01aQNuLW4KD94mrLjLU1d/DMpZxEXNF5JNlIdeYeEC/QDH3MoOLHaDoukJtkpGIzjFDpmeB75WpoIrH+g/V/Ce1X3hLsToqzLnO7VsEtfaovssOAzTd0em+5LP32LfbHMSjzIS/aOSPNHr8SIQVW8lxxrWDNiNl7mhax1b/eMAyUhgT6YOW6yDTMNa+IdkjwI9MH5LrJonKdsJphQuX5220qhuqewe4FJ2syjg+UTn2YkJ/08yHBgmIAhM0I+gb5PuCAvJ1agTQP0KNh5uonNFLmFqa2TMSnH3PrhQ/odD1yWjxV5SWNq/JZIxYmNO9t4sFh2+bFqEMg3lTHrcuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1B3Tyz4/v+DdCzm9YDjw4pZzZBXEG+p7N3lV/fgZayk=;
 b=Adzbq016k8PmOKNis2R1LEsY/AUa/jpEyTSCdVqK9COPfp4rtPS6PinWEY3cfYh/yIylR11h7MEHBkMlaiXoUP2Y7rTkS5TYhjDAHzUfoUcRECTysH8yPGBSrDeV9wim1TV+j8ZlRtvSbWbBLw7Qq+fE9NBew6GTXecI9rLYYEydIc1ez7jKvuf0I2o8wlRsEJyau6ihA8xatIJ0VIvEBi27+baOyUw0knOKDr3JIimkZpx2oYDhay6mb2R3U5BbTiCm+QIdtpxruKvURG9BHhpjK0HV/S0qBRh7M7HT9POfL2Pr0wB6BzaQckMygnhOSTe+IdGhhQylUK2MSAIDag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1B3Tyz4/v+DdCzm9YDjw4pZzZBXEG+p7N3lV/fgZayk=;
 b=XYCcWZAU+GHrmCDNCsYVUcicCcD7GAriUz0KaCl26PVVE0JB7jBIc37Ic/9YKCdCws+9GIsEIZVpTdRDlWKfgQQXYSHZv38Fu295CybV8b4O7KtPsZhqutXG9LEuCPk5YE0CJnkPKVEQP75W3et8L/3Glv1gZ6B0fDHhW6Bb8fQ=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7764.namprd04.prod.outlook.com (2603:10b6:303:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Sat, 24 Jul
 2021 12:24:39 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%8]) with mapi id 15.20.4352.029; Sat, 24 Jul 2021
 12:24:38 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 2/4] hw/intc: Upgrade the SiFive CLINT implementation to
 RISC-V ACLINT
Date: Sat, 24 Jul 2021 17:54:05 +0530
Message-Id: <20210724122407.2486558-3-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210724122407.2486558-1-anup.patel@wdc.com>
References: <20210724122407.2486558-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::19) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.61.225) by
 MA1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Sat, 24 Jul 2021 12:24:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d05bd322-0170-497b-5cc2-08d94e9e0162
X-MS-TrafficTypeDiagnostic: CO6PR04MB7764:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7764DA577E173B5C624A7C0A8DE69@CO6PR04MB7764.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:117;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZP6nMImmtoMirlCGo7qCIjc4eTQPiZxg/P80BMbSJ5y+DpWKkAAcNng66aOouVttLIpCUCyEWMxxH06E8A2BliYGZ4bsytfElTd9VxcaU0wyFsMYREL9WCdFX9R8Z7rnfOt8bj7zjNnzoRc3ocGv66vWu+XN3GrBqWCLCZh0hm3lE/DEBVbg+AvvJI8ugR1kHggn8EKGHVCAZXHm2xq5QEa3kWAZNEY7vGB1JAS50+DakDCB5Ju+8kchoDBWn/QGC7FJPmf9+oxr779E0/YY+o/oCef7BqXV7eKyIPeHJRCxQ5U+BsM9V/yFftMgQbJSOp2g92eY9AUAlpVkrqt4CGV+HhJ7/icEpwyHEb4NhSybuyFLLcE26jLTTxyJNG/mdqP74zthn3qKnEe13fu6RqTtOll7Id88ct10JtJCWSwVVRP2/Ig9/XK2ZpI45uSqXC6RpehjmmEOBxnkveMXg5ijxZT+4O2KpF9YThKS5GcEbU5sv7dDpbf9DnEXAa1V/Q8RP004wIMtZYO5W2k9PUUT4HZoDe/MW+OLgt40+OSF4K+ATX26H7/ylmvKW3Vy+TW43YcfdGAeROpuucu7KZFpDqQ+2XzV0LfTjUkZZ8MIlMpCGDuMQ5Wql8iO3Je1UMu19tpdkWoi9bJhAmmkrw3jjQq23unh5xVNH15jzoy98u/BEE8c/ikH8rLnE3UrT2QVn39ObMHLmzLfsHj6/8kRK9b+L32mP62lXktwSyZtyzrSxoEcDwO6zf/EyDdBqqXZZSiQwC9dM7dgluf4Nrg38lu4lz9dOSYWjw7Mm4o++e65SWu/kwQ1aMCZehAi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(366004)(956004)(44832011)(2616005)(38350700002)(36756003)(1076003)(8676002)(38100700002)(4326008)(508600001)(5660300002)(55016002)(110136005)(8936002)(66476007)(66556008)(66946007)(316002)(8886007)(6666004)(54906003)(52116002)(7696005)(83380400001)(86362001)(2906002)(26005)(186003)(30864003)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p3yXy+aUHmSb4NQftqMtfn6yXEdlRrZzcoKnmkuBiyksFyXvwQ3ORclv5qo0?=
 =?us-ascii?Q?4lYLVbH5jCEq30mIjf++t8M7Yz4PCBvHx3XXyhXXAU+OVRPGyf0CIhN22knY?=
 =?us-ascii?Q?W3f4m4f2hgAMd3nEiSwqTzJfoi/gg+g3Zi8pqCMIP2S/x/LUsQcfkxb79zDE?=
 =?us-ascii?Q?V7F2QNPm9Vvu/GVr9Y80NgiMoyp25oA1kuEotvVHAXeaNPvIgdKT5LzEyAaH?=
 =?us-ascii?Q?6zw3YzLQqs1C4rflM9vNsKPJ2HmtS/Una5OXugXA3lAIN2d4P9PqMuErWVtc?=
 =?us-ascii?Q?kWedWLzupBQ0Bwhq8rFHks+1jGI7GBuLRCElspydLajZf/KgXlZnp30CMNDG?=
 =?us-ascii?Q?aXCB/zZXvgz7Fc6Ktr5PVfCI0aP/HVJai5h8uncPZSUt5deXwNtNk4rrJfc3?=
 =?us-ascii?Q?c4/Wg9/dSDDkA9HgN7v0vqGVj53GlOXgOHD5wRpHey1cX+Ic/Zsz4+86mBBl?=
 =?us-ascii?Q?FLW7IrF893d2J0iTqFxCy434VDYwzz5dJi18yCLKw6fwDMNaSpCXdzbIVuR6?=
 =?us-ascii?Q?iwiJ6biJE82hf+jKpKCK39aJ72MvIL0iy0coPacvN1vxvNSbFB4VzcwOGhvW?=
 =?us-ascii?Q?qrw2EKUHNDntvQuAqnSYZdgKCjciKez8NyOfUjoOo5eoFNTV4idn27QYl27I?=
 =?us-ascii?Q?KbqKJd1/lUmnZjGEfGP0f6x+mQIdz1GXuxNmmmAfxA2FvmlmCxLm/asJ1hb/?=
 =?us-ascii?Q?N5PPB7qwE5KPqsgVZJWgt+p4aTgCi7DFY+TF8yPbdsqFph0gL4Cuxy2WW0/J?=
 =?us-ascii?Q?wGbviueiThHl9iiOP+ZANUNjo1vQkCrMOIq7iUobl4y0f8D53OLT9n9Qn8H6?=
 =?us-ascii?Q?AWoGK0Hm9W5Dcct+UvNs4qYG3tOoqs4Uds1v7pQnob+fFUrG0yKZtxi5IU9e?=
 =?us-ascii?Q?CX3tug3g2itfGf9QT7NPF4268cNxh5Hrud47ica2nk5Z2e3AfIG7LVZLqaL9?=
 =?us-ascii?Q?ldyDWSQP4GaGYKXh7i+1Nb3X8WvAaG0sPwAZzXsG7nVJVW3t6r72uLpvDTFE?=
 =?us-ascii?Q?dPhIc/R2oaNnbm4+8CzqbnhL+Wjs4xG9dQKPLWTod16JareZwttGLrx8fcMy?=
 =?us-ascii?Q?6FoG5s2YEkbto2mEiiSrsZzjhwRmNyQHA2Df4SmTIoHl61tznCeN6fjQ9oii?=
 =?us-ascii?Q?BCPWBCIWNH6fLAr1To2KH887cqxygt9qSchIR1ydRY5+pUvxPDlcRVk8Uzk2?=
 =?us-ascii?Q?Rf8JxmaEsjukU4xDFgLtnc8BSQAAgyxQo51momsQGyFTgVTG7yOQ0vyNioN8?=
 =?us-ascii?Q?xDqbOZCTh//ywRU5ztRNS6Irg60ql5LBWVhJxRg4UjUggxmSw7KlpLxdm18F?=
 =?us-ascii?Q?xLbvDD9zqbHqdxOXHPJSVKbA?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d05bd322-0170-497b-5cc2-08d94e9e0162
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2021 12:24:38.8113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvJ4FAjf+8muWPWVUnqJnPH8pSdVFJn6Do/lDxkiTXrjEQFJlutr8bXB67hORN9aEHT+Fdain7XtApTdLCdJUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7764
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=832e875c5=Anup.Patel@wdc.com; helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Sat, 24 Jul 2021 12:24:48 -0000

The RISC-V ACLINT is more modular and backward compatible with
original SiFive CLINT so instead of duplicating the original
SiFive CLINT implementation we upgrade the current SiFive CLINT
implementation to RISC-V ACLINT implementation.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/intc/riscv_aclint.c         | 351 ++++++++++++++++++++++-----------
 hw/riscv/microchip_pfsoc.c     |   9 +-
 hw/riscv/shakti_c.c            |  11 +-
 hw/riscv/sifive_e.c            |  11 +-
 hw/riscv/sifive_u.c            |   9 +-
 hw/riscv/spike.c               |  14 +-
 hw/riscv/virt.c                |  14 +-
 include/hw/intc/riscv_aclint.h |  54 +++--
 8 files changed, 320 insertions(+), 153 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 0f940e332b..367f850b47 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -1,8 +1,9 @@
 /*
- * SiFive CLINT (Core Local Interruptor)
+ * RISC-V ACLINT (Advanced Core Local Interruptor)
  *
  * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
  * Copyright (c) 2017 SiFive, Inc.
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
  *
  * This provides real-time clock, timer and interprocessor interrupts.
  *
@@ -30,10 +31,10 @@
 #include "qemu/timer.h"
 #include "hw/irq.h"
 
-typedef struct sifive_clint_callback {
-    SiFiveCLINTState *s;
+typedef struct riscv_aclint_mtimer_callback {
+    RISCVAclintMTimerState *s;
     int num;
-} sifive_clint_callback;
+} riscv_aclint_mtimer_callback;
 
 static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
 {
@@ -45,7 +46,8 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
  * Called when timecmp is written to update the QEMU timer or immediately
  * trigger timer interrupt if mtimecmp <= current timer value.
  */
-static void sifive_clint_write_timecmp(SiFiveCLINTState *s, RISCVCPU *cpu,
+static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
+                                       RISCVCPU *cpu,
                                        int hartid,
                                        uint64_t value,
                                        uint32_t timebase_freq)
@@ -57,14 +59,16 @@ static void sifive_clint_write_timecmp(SiFiveCLINTState *s, RISCVCPU *cpu,
 
     cpu->env.timecmp = value;
     if (cpu->env.timecmp <= rtc_r) {
-        /* if we're setting an MTIMECMP value in the "past",
-           immediately raise the timer interrupt */
-        qemu_irq_raise(s->timer_irqs[hartid - s->hartid_base]);
+        /*
+         * If we're setting an MTIMECMP value in the "past",
+         * immediately raise the timer interrupt
+         */
+        qemu_irq_raise(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
         return;
     }
 
     /* otherwise, set up the future timer interrupt */
-    qemu_irq_lower(s->timer_irqs[hartid - s->hartid_base]);
+    qemu_irq_lower(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
     diff = cpu->env.timecmp - rtc_r;
     /* back to ns (note args switched in muldiv64) */
     next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
@@ -76,38 +80,27 @@ static void sifive_clint_write_timecmp(SiFiveCLINTState *s, RISCVCPU *cpu,
  * Callback used when the timer set using timer_mod expires.
  * Should raise the timer interrupt line
  */
-static void sifive_clint_timer_cb(void *opaque)
+static void riscv_aclint_mtimer_cb(void *opaque)
 {
-    sifive_clint_callback *state = opaque;
+    riscv_aclint_mtimer_callback *state = opaque;
 
     qemu_irq_raise(state->s->timer_irqs[state->num]);
 }
 
-/* CPU wants to read rtc or timecmp register */
-static uint64_t sifive_clint_read(void *opaque, hwaddr addr, unsigned size)
+/* CPU read MTIMER register */
+static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
+    unsigned size)
 {
-    SiFiveCLINTState *clint = opaque;
-    if (addr >= clint->sip_base &&
-        addr < clint->sip_base + (clint->num_harts << 2)) {
-        size_t hartid = clint->hartid_base + ((addr - clint->sip_base) >> 2);
-        CPUState *cpu = qemu_get_cpu(hartid);
-        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
-        if (!env) {
-            error_report("clint: invalid timecmp hartid: %zu", hartid);
-        } else if ((addr & 0x3) == 0) {
-            return (env->mip & MIP_MSIP) > 0;
-        } else {
-            error_report("clint: invalid read: %08x", (uint32_t)addr);
-            return 0;
-        }
-    } else if (addr >= clint->timecmp_base &&
-        addr < clint->timecmp_base + (clint->num_harts << 3)) {
-        size_t hartid = clint->hartid_base +
-            ((addr - clint->timecmp_base) >> 3);
+    RISCVAclintMTimerState *mtimer = opaque;
+
+    if (addr >= mtimer->timecmp_base &&
+        addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
+        size_t hartid = mtimer->hartid_base +
+                        ((addr - mtimer->timecmp_base) >> 3);
         CPUState *cpu = qemu_get_cpu(hartid);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
         if (!env) {
-            error_report("clint: invalid timecmp hartid: %zu", hartid);
+            error_report("aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
             /* timecmp_lo */
             uint64_t timecmp = env->timecmp;
@@ -117,79 +110,69 @@ static uint64_t sifive_clint_read(void *opaque, hwaddr addr, unsigned size)
             uint64_t timecmp = env->timecmp;
             return (timecmp >> 32) & 0xFFFFFFFF;
         } else {
-            error_report("clint: invalid read: %08x", (uint32_t)addr);
+            error_report("aclint-mtimer: invalid read: %08x", (uint32_t)addr);
             return 0;
         }
-    } else if (addr == clint->time_base) {
+    } else if (addr == mtimer->time_base) {
         /* time_lo */
-        return cpu_riscv_read_rtc(clint->timebase_freq) & 0xFFFFFFFF;
-    } else if (addr == clint->time_base + 4) {
+        return cpu_riscv_read_rtc(mtimer->timebase_freq) & 0xFFFFFFFF;
+    } else if (addr == mtimer->time_base + 4) {
         /* time_hi */
-        return (cpu_riscv_read_rtc(clint->timebase_freq) >> 32) & 0xFFFFFFFF;
+        return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) & 0xFFFFFFFF;
     }
 
-    error_report("clint: invalid read: %08x", (uint32_t)addr);
+    error_report("aclint-mtimer: invalid read: %08x", (uint32_t)addr);
     return 0;
 }
 
-/* CPU wrote to rtc or timecmp register */
-static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
-        unsigned size)
+/* CPU write MTIMER register */
+static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
+    uint64_t value, unsigned size)
 {
-    SiFiveCLINTState *clint = opaque;
+    RISCVAclintMTimerState *mtimer = opaque;
 
-    if (addr >= clint->sip_base &&
-        addr < clint->sip_base + (clint->num_harts << 2)) {
-        size_t hartid = clint->hartid_base + ((addr - clint->sip_base) >> 2);
+    if (addr >= mtimer->timecmp_base &&
+        addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
+        size_t hartid = mtimer->hartid_base +
+                        ((addr - mtimer->timecmp_base) >> 3);
         CPUState *cpu = qemu_get_cpu(hartid);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
         if (!env) {
-            error_report("clint: invalid timecmp hartid: %zu", hartid);
-        } else if ((addr & 0x3) == 0) {
-            qemu_set_irq(clint->soft_irqs[hartid - clint->hartid_base], value);
-        } else {
-            error_report("clint: invalid sip write: %08x", (uint32_t)addr);
-        }
-        return;
-    } else if (addr >= clint->timecmp_base &&
-        addr < clint->timecmp_base + (clint->num_harts << 3)) {
-        size_t hartid = clint->hartid_base +
-            ((addr - clint->timecmp_base) >> 3);
-        CPUState *cpu = qemu_get_cpu(hartid);
-        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
-        if (!env) {
-            error_report("clint: invalid timecmp hartid: %zu", hartid);
+            error_report("aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
             /* timecmp_lo */
             uint64_t timecmp_hi = env->timecmp >> 32;
-            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
-                timecmp_hi << 32 | (value & 0xFFFFFFFF), clint->timebase_freq);
+            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
+                timecmp_hi << 32 | (value & 0xFFFFFFFF),
+                mtimer->timebase_freq);
             return;
         } else if ((addr & 0x7) == 4) {
             /* timecmp_hi */
             uint64_t timecmp_lo = env->timecmp;
-            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
-                value << 32 | (timecmp_lo & 0xFFFFFFFF), clint->timebase_freq);
+            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
+                value << 32 | (timecmp_lo & 0xFFFFFFFF),
+                mtimer->timebase_freq);
         } else {
-            error_report("clint: invalid timecmp write: %08x", (uint32_t)addr);
+            error_report("aclint-mtimer: invalid timecmp write: %08x",
+                         (uint32_t)addr);
         }
         return;
-    } else if (addr == clint->time_base) {
+    } else if (addr == mtimer->time_base) {
         /* time_lo */
-        error_report("clint: time_lo write not implemented");
+        error_report("aclint-mtimer: time_lo write not implemented");
         return;
-    } else if (addr == clint->time_base + 4) {
+    } else if (addr == mtimer->time_base + 4) {
         /* time_hi */
-        error_report("clint: time_hi write not implemented");
+        error_report("aclint-mtimer: time_hi write not implemented");
         return;
     }
 
-    error_report("clint: invalid write: %08x", (uint32_t)addr);
+    error_report("aclint-mtimer: invalid write: %08x", (uint32_t)addr);
 }
 
-static const MemoryRegionOps sifive_clint_ops = {
-    .read = sifive_clint_read,
-    .write = sifive_clint_write,
+static const MemoryRegionOps riscv_aclint_mtimer_ops = {
+    .read = riscv_aclint_mtimer_read,
+    .write = riscv_aclint_mtimer_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 4,
@@ -197,66 +180,75 @@ static const MemoryRegionOps sifive_clint_ops = {
     }
 };
 
-static Property sifive_clint_properties[] = {
-    DEFINE_PROP_UINT32("hartid-base", SiFiveCLINTState, hartid_base, 0),
-    DEFINE_PROP_UINT32("num-harts", SiFiveCLINTState, num_harts, 0),
-    DEFINE_PROP_UINT32("sip-base", SiFiveCLINTState, sip_base, 0),
-    DEFINE_PROP_UINT32("timecmp-base", SiFiveCLINTState, timecmp_base, 0),
-    DEFINE_PROP_UINT32("time-base", SiFiveCLINTState, time_base, 0),
-    DEFINE_PROP_UINT32("aperture-size", SiFiveCLINTState, aperture_size, 0),
-    DEFINE_PROP_UINT32("timebase-freq", SiFiveCLINTState, timebase_freq, 0),
+static Property riscv_aclint_mtimer_properties[] = {
+    DEFINE_PROP_UINT32("hartid-base", RISCVAclintMTimerState,
+        hartid_base, 0),
+    DEFINE_PROP_UINT32("num-harts", RISCVAclintMTimerState, num_harts, 1),
+    DEFINE_PROP_UINT32("timecmp-base", RISCVAclintMTimerState,
+        timecmp_base, RISCV_ACLINT_DEFAULT_MTIMECMP),
+    DEFINE_PROP_UINT32("time-base", RISCVAclintMTimerState,
+        time_base, RISCV_ACLINT_DEFAULT_MTIME),
+    DEFINE_PROP_UINT32("aperture-size", RISCVAclintMTimerState,
+        aperture_size, RISCV_ACLINT_DEFAULT_MTIMER_SIZE),
+    DEFINE_PROP_UINT32("timebase-freq", RISCVAclintMTimerState,
+        timebase_freq, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void sifive_clint_realize(DeviceState *dev, Error **errp)
+static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
 {
-    SiFiveCLINTState *s = SIFIVE_CLINT(dev);
-    memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_clint_ops, s,
-                          TYPE_SIFIVE_CLINT, s->aperture_size);
+    RISCVAclintMTimerState *s = RISCV_ACLINT_MTIMER(dev);
+    int i;
+
+    memory_region_init_io(&s->mmio, OBJECT(dev), &riscv_aclint_mtimer_ops,
+                          s, TYPE_RISCV_ACLINT_MTIMER, s->aperture_size);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
 
     s->timer_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
     qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
 
-    s->soft_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
-    qdev_init_gpio_out(dev, s->soft_irqs, s->num_harts);
+    /* Claim timer interrupt bits */
+    for (i = 0; i < s->num_harts; i++) {
+        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
+        if (riscv_cpu_claim_interrupts(cpu, MIP_MTIP) < 0) {
+            error_report("MTIP already claimed");
+            exit(1);
+        }
+    }
 }
 
-static void sifive_clint_class_init(ObjectClass *klass, void *data)
+static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    dc->realize = sifive_clint_realize;
-    device_class_set_props(dc, sifive_clint_properties);
+    dc->realize = riscv_aclint_mtimer_realize;
+    device_class_set_props(dc, riscv_aclint_mtimer_properties);
 }
 
-static const TypeInfo sifive_clint_info = {
-    .name          = TYPE_SIFIVE_CLINT,
+static const TypeInfo riscv_aclint_mtimer_info = {
+    .name          = TYPE_RISCV_ACLINT_MTIMER,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(SiFiveCLINTState),
-    .class_init    = sifive_clint_class_init,
+    .instance_size = sizeof(RISCVAclintMTimerState),
+    .class_init    = riscv_aclint_mtimer_class_init,
 };
 
-static void sifive_clint_register_types(void)
-{
-    type_register_static(&sifive_clint_info);
-}
-
-type_init(sifive_clint_register_types)
-
 /*
- * Create CLINT device.
+ * Create ACLINT MTIMER device.
  */
-DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
-    uint32_t hartid_base, uint32_t num_harts, uint32_t sip_base,
+DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
+    uint32_t hartid_base, uint32_t num_harts,
     uint32_t timecmp_base, uint32_t time_base, uint32_t timebase_freq,
     bool provide_rdtime)
 {
     int i;
+    DeviceState *dev = qdev_new(TYPE_RISCV_ACLINT_MTIMER);
+
+    assert(num_harts < RISCV_ACLINT_MAX_HARTS);
+    assert(!(addr & 0x7));
+    assert(!(timecmp_base & 0x7));
+    assert(!(time_base & 0x7));
 
-    DeviceState *dev = qdev_new(TYPE_SIFIVE_CLINT);
     qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
     qdev_prop_set_uint32(dev, "num-harts", num_harts);
-    qdev_prop_set_uint32(dev, "sip-base", sip_base);
     qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
     qdev_prop_set_uint32(dev, "time-base", time_base);
     qdev_prop_set_uint32(dev, "aperture-size", size);
@@ -268,7 +260,8 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
         CPUState *cpu = qemu_get_cpu(hartid_base + i);
         RISCVCPU *rvcpu = RISCV_CPU(cpu);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
-        sifive_clint_callback *cb = g_malloc0(sizeof(sifive_clint_callback));
+        riscv_aclint_mtimer_callback *cb =
+            g_malloc0(sizeof(riscv_aclint_mtimer_callback));
 
         if (!env) {
             g_free(cb);
@@ -278,17 +271,153 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
             riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_freq);
         }
 
-        cb->s = SIFIVE_CLINT(dev);
+        cb->s = RISCV_ACLINT_MTIMER(dev);
         cb->num = i;
         env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                  &sifive_clint_timer_cb, cb);
+                                  &riscv_aclint_mtimer_cb, cb);
         env->timecmp = 0;
 
         qdev_connect_gpio_out_named(dev, NULL, i,
                            qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIMER));
-        qdev_connect_gpio_out_named(dev, NULL, num_harts + i,
-                           qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_SOFT));
     }
 
     return dev;
 }
+
+/* CPU read [M|S]SWI register */
+static uint64_t riscv_aclint_swi_read(void *opaque, hwaddr addr,
+    unsigned size)
+{
+    RISCVAclintSwiState *swi = opaque;
+
+    if (addr < (swi->num_harts << 2)) {
+        size_t hartid = swi->hartid_base + (addr >> 2);
+        CPUState *cpu = qemu_get_cpu(hartid);
+        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
+        if (!env) {
+            error_report("aclint-swi: invalid hartid: %zu", hartid);
+        } else if ((addr & 0x3) == 0) {
+            return (env->mip & ((swi->sswi) ? MIP_SSIP : MIP_MSIP)) > 0;
+        }
+    }
+
+    error_report("aclint-swi: invalid read: %08x", (uint32_t)addr);
+    return 0;
+}
+
+/* CPU write [M|S]SWI register */
+static void riscv_aclint_swi_write(void *opaque, hwaddr addr, uint64_t value,
+        unsigned size)
+{
+    RISCVAclintSwiState *swi = opaque;
+
+    if (addr < (swi->num_harts << 2)) {
+        size_t hartid = swi->hartid_base + (addr >> 2);
+        CPUState *cpu = qemu_get_cpu(hartid);
+        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
+        if (!env) {
+            error_report("aclint-swi: invalid hartid: %zu", hartid);
+        } else if ((addr & 0x3) == 0) {
+            if (value) {
+                qemu_irq_raise(swi->soft_irqs[hartid - swi->hartid_base]);
+            } else {
+                qemu_irq_lower(swi->soft_irqs[hartid - swi->hartid_base]);
+            }
+            return;
+        }
+    }
+
+    error_report("aclint-swi: invalid write: %08x", (uint32_t)addr);
+}
+
+static const MemoryRegionOps riscv_aclint_swi_ops = {
+    .read = riscv_aclint_swi_read,
+    .write = riscv_aclint_swi_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+static Property riscv_aclint_swi_properties[] = {
+    DEFINE_PROP_UINT32("hartid-base", RISCVAclintSwiState, hartid_base, 0),
+    DEFINE_PROP_UINT32("num-harts", RISCVAclintSwiState, num_harts, 1),
+    DEFINE_PROP_UINT32("sswi", RISCVAclintSwiState, sswi, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void riscv_aclint_swi_realize(DeviceState *dev, Error **errp)
+{
+    RISCVAclintSwiState *swi = RISCV_ACLINT_SWI(dev);
+    int i;
+
+    memory_region_init_io(&swi->mmio, OBJECT(dev), &riscv_aclint_swi_ops, swi,
+                          TYPE_RISCV_ACLINT_SWI, RISCV_ACLINT_SWI_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &swi->mmio);
+
+    swi->soft_irqs = g_malloc(sizeof(qemu_irq) * swi->num_harts);
+    qdev_init_gpio_out(dev, swi->soft_irqs, swi->num_harts);
+
+    /* Claim software interrupt bits */
+    for (i = 0; i < swi->num_harts; i++) {
+        RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(swi->hartid_base + i));
+        /* We don't claim mip.SSIP because it is writeable by software */
+        if (riscv_cpu_claim_interrupts(cpu, swi->sswi ? 0 : MIP_MSIP) < 0) {
+            error_report("MTIP already claimed");
+            exit(1);
+        }
+    }
+}
+
+static void riscv_aclint_swi_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = riscv_aclint_swi_realize;
+    device_class_set_props(dc, riscv_aclint_swi_properties);
+}
+
+static const TypeInfo riscv_aclint_swi_info = {
+    .name          = TYPE_RISCV_ACLINT_SWI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(RISCVAclintSwiState),
+    .class_init    = riscv_aclint_swi_class_init,
+};
+
+/*
+ * Create ACLINT [M|S]SWI device.
+ */
+DeviceState *riscv_aclint_swi_create(hwaddr addr, uint32_t hartid_base,
+    uint32_t num_harts, bool sswi)
+{
+    int i;
+    DeviceState *dev = qdev_new(TYPE_RISCV_ACLINT_SWI);
+
+    assert(num_harts < RISCV_ACLINT_MAX_HARTS);
+    assert(!(addr & 0x3));
+
+    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
+    qdev_prop_set_uint32(dev, "num-harts", num_harts);
+    qdev_prop_set_uint32(dev, "sswi", sswi ? true : false);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    for (i = 0; i < num_harts; i++) {
+        CPUState *cpu = qemu_get_cpu(hartid_base + i);
+        RISCVCPU *rvcpu = RISCV_CPU(cpu);
+
+        qdev_connect_gpio_out_named(dev, NULL, i,
+                           qdev_get_gpio_in(DEVICE(rvcpu),
+                           (sswi) ? IRQ_S_SOFT : IRQ_M_SOFT));
+    }
+
+    return dev;
+}
+
+static void riscv_aclint_register_types(void)
+{
+    type_register_static(&riscv_aclint_mtimer_info);
+    type_register_static(&riscv_aclint_swi_info);
+}
+
+type_init(riscv_aclint_register_types)
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index eed9e81355..e475b6d511 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -234,9 +234,12 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
         memmap[MICROCHIP_PFSOC_BUSERR_UNIT4].size);
 
     /* CLINT */
-    sifive_clint_create(memmap[MICROCHIP_PFSOC_CLINT].base,
-        memmap[MICROCHIP_PFSOC_CLINT].size, 0, ms->smp.cpus,
-        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
+    riscv_aclint_swi_create(memmap[MICROCHIP_PFSOC_CLINT].base,
+        0, ms->smp.cpus, false);
+    riscv_aclint_mtimer_create(
+        memmap[MICROCHIP_PFSOC_CLINT].base + RISCV_ACLINT_SWI_SIZE,
+        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
+        RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
         CLINT_TIMEBASE_FREQ, false);
 
     /* L2 cache controller */
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index f9f0a45651..2f084d3c8d 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -124,10 +124,13 @@ static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
         SHAKTI_C_PLIC_CONTEXT_STRIDE,
         shakti_c_memmap[SHAKTI_C_PLIC].size);
 
-    sifive_clint_create(shakti_c_memmap[SHAKTI_C_CLINT].base,
-        shakti_c_memmap[SHAKTI_C_CLINT].size, 0, 1,
-        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-        SIFIVE_CLINT_TIMEBASE_FREQ, false);
+    riscv_aclint_swi_create(shakti_c_memmap[SHAKTI_C_CLINT].base,
+        0, 1, false);
+    riscv_aclint_mtimer_create(shakti_c_memmap[SHAKTI_C_CLINT].base +
+            RISCV_ACLINT_SWI_SIZE,
+        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, 1,
+        RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
 
     qdev_prop_set_chr(DEVICE(&(sss->uart)), "chardev", serial_hd(0));
     if (!sysbus_realize(SYS_BUS_DEVICE(&sss->uart), errp)) {
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 1c55435d8a..5ffdd7f1da 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -208,10 +208,13 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
         SIFIVE_E_PLIC_CONTEXT_BASE,
         SIFIVE_E_PLIC_CONTEXT_STRIDE,
         memmap[SIFIVE_E_DEV_PLIC].size);
-    sifive_clint_create(memmap[SIFIVE_E_DEV_CLINT].base,
-        memmap[SIFIVE_E_DEV_CLINT].size, 0, ms->smp.cpus,
-        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-        SIFIVE_CLINT_TIMEBASE_FREQ, false);
+    riscv_aclint_swi_create(memmap[SIFIVE_E_DEV_CLINT].base,
+        0, ms->smp.cpus, false);
+    riscv_aclint_mtimer_create(memmap[SIFIVE_E_DEV_CLINT].base +
+            RISCV_ACLINT_SWI_SIZE,
+        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
+        RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
     create_unimplemented_device("riscv.sifive.e.aon",
         memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
     sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d1211e1c3d..92b240c78a 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -848,9 +848,12 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
         serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART0_IRQ));
     sifive_uart_create(system_memory, memmap[SIFIVE_U_DEV_UART1].base,
         serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART1_IRQ));
-    sifive_clint_create(memmap[SIFIVE_U_DEV_CLINT].base,
-        memmap[SIFIVE_U_DEV_CLINT].size, 0, ms->smp.cpus,
-        SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
+    riscv_aclint_swi_create(memmap[SIFIVE_U_DEV_CLINT].base, 0,
+        ms->smp.cpus, false);
+    riscv_aclint_mtimer_create(memmap[SIFIVE_U_DEV_CLINT].base +
+            RISCV_ACLINT_SWI_SIZE,
+        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
+        RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
         CLINT_TIMEBASE_FREQ, false);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->prci), errp)) {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index f682b7ed4e..2619aa1071 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -85,7 +85,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-        SIFIVE_CLINT_TIMEBASE_FREQ);
+        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
@@ -228,11 +228,15 @@ static void spike_board_init(MachineState *machine)
         sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
 
         /* Core Local Interruptor (timer and IPI) for each socket */
-        sifive_clint_create(
+        riscv_aclint_swi_create(
             memmap[SPIKE_CLINT].base + i * memmap[SPIKE_CLINT].size,
-            memmap[SPIKE_CLINT].size, base_hartid, hart_count,
-            SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-            SIFIVE_CLINT_TIMEBASE_FREQ, false);
+            base_hartid, hart_count, false);
+        riscv_aclint_mtimer_create(
+            memmap[SPIKE_CLINT].base + i * memmap[SPIKE_CLINT].size +
+                RISCV_ACLINT_SWI_SIZE,
+            RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
+            RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+            RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
     }
 
     /* register system main memory (actual RAM) */
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 66de5d3767..3cbb4cd47f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -229,7 +229,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-                          SIFIVE_CLINT_TIMEBASE_FREQ);
+                          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
@@ -597,11 +597,15 @@ static void virt_machine_init(MachineState *machine)
         sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
 
         /* Per-socket CLINT */
-        sifive_clint_create(
+        riscv_aclint_swi_create(
             memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
-            memmap[VIRT_CLINT].size, base_hartid, hart_count,
-            SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-            SIFIVE_CLINT_TIMEBASE_FREQ, true);
+            base_hartid, hart_count, false);
+        riscv_aclint_mtimer_create(
+            memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size +
+                RISCV_ACLINT_SWI_SIZE,
+            RISCV_ACLINT_DEFAULT_MTIMER_SIZE, base_hartid, hart_count,
+            RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
+            RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
 
         /* Per-socket PLIC hart topology configuration string */
         plic_hart_config_len =
diff --git a/include/hw/intc/riscv_aclint.h b/include/hw/intc/riscv_aclint.h
index 921b1561dd..229bd08d25 100644
--- a/include/hw/intc/riscv_aclint.h
+++ b/include/hw/intc/riscv_aclint.h
@@ -1,8 +1,9 @@
 /*
- * SiFive CLINT (Core Local Interruptor) interface
+ * RISC-V ACLINT (Advanced Core Local Interruptor) interface
  *
  * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
  * Copyright (c) 2017 SiFive, Inc.
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -17,17 +18,17 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef HW_SIFIVE_CLINT_H
-#define HW_SIFIVE_CLINT_H
+#ifndef HW_RISCV_ACLINT_H
+#define HW_RISCV_ACLINT_H
 
 #include "hw/sysbus.h"
 
-#define TYPE_SIFIVE_CLINT "riscv.sifive.clint"
+#define TYPE_RISCV_ACLINT_MTIMER "riscv.aclint.mtimer"
 
-#define SIFIVE_CLINT(obj) \
-    OBJECT_CHECK(SiFiveCLINTState, (obj), TYPE_SIFIVE_CLINT)
+#define RISCV_ACLINT_MTIMER(obj) \
+    OBJECT_CHECK(RISCVAclintMTimerState, (obj), TYPE_RISCV_ACLINT_MTIMER)
 
-typedef struct SiFiveCLINTState {
+typedef struct RISCVAclintMTimerState {
     /*< private >*/
     SysBusDevice parent_obj;
 
@@ -35,28 +36,45 @@ typedef struct SiFiveCLINTState {
     MemoryRegion mmio;
     uint32_t hartid_base;
     uint32_t num_harts;
-    uint32_t sip_base;
     uint32_t timecmp_base;
     uint32_t time_base;
     uint32_t aperture_size;
     uint32_t timebase_freq;
     qemu_irq *timer_irqs;
-    qemu_irq *soft_irqs;
-} SiFiveCLINTState;
+} RISCVAclintMTimerState;
 
-DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
-    uint32_t hartid_base, uint32_t num_harts, uint32_t sip_base,
+DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
+    uint32_t hartid_base, uint32_t num_harts,
     uint32_t timecmp_base, uint32_t time_base, uint32_t timebase_freq,
     bool provide_rdtime);
 
-enum {
-    SIFIVE_SIP_BASE     = 0x0,
-    SIFIVE_TIMECMP_BASE = 0x4000,
-    SIFIVE_TIME_BASE    = 0xBFF8
-};
+#define TYPE_RISCV_ACLINT_SWI "riscv.aclint.swi"
+
+#define RISCV_ACLINT_SWI(obj) \
+    OBJECT_CHECK(RISCVAclintSwiState, (obj), TYPE_RISCV_ACLINT_SWI)
+
+typedef struct RISCVAclintSwiState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+    uint32_t hartid_base;
+    uint32_t num_harts;
+    uint32_t sswi;
+    qemu_irq *soft_irqs;
+} RISCVAclintSwiState;
+
+DeviceState *riscv_aclint_swi_create(hwaddr addr, uint32_t hartid_base,
+    uint32_t num_harts, bool sswi);
 
 enum {
-    SIFIVE_CLINT_TIMEBASE_FREQ = 10000000
+    RISCV_ACLINT_DEFAULT_MTIMECMP      = 0x0,
+    RISCV_ACLINT_DEFAULT_MTIME         = 0x7ff8,
+    RISCV_ACLINT_DEFAULT_MTIMER_SIZE   = 0x8000,
+    RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ = 10000000,
+    RISCV_ACLINT_MAX_HARTS             = 4095,
+    RISCV_ACLINT_SWI_SIZE              = 0x4000
 };
 
 #endif
-- 
2.25.1


