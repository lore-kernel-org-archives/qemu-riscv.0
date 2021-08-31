Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL1bT-0004lt-Jb
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 07:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=870f666b0=Anup.Patel@wdc.com>)
 id 1mL1bS-0004gp-58; Tue, 31 Aug 2021 07:06:54 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:13073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=870f666b0=Anup.Patel@wdc.com>)
 id 1mL1bO-00010P-3z; Tue, 31 Aug 2021 07:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630408010; x=1661944010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=m6buCGHeO1yYfZ7R87bYbhbyVzO24vfQuEc3h+EZUP4=;
 b=kdJF+Bl+OZfqWsPCjcvubahj3ttKRkBJ5SqHQrA7no71rCuHg69lD6EO
 Nge2rupyb+B16HK/ZKVhnWe15YeDfvOIe9iOf5LIeknD7v8QT10ICYLQj
 P+n2/I1kmijcn5ZLHUwxnlakGd36LBlSv5CEHhn38Ix3Na4qwG50+9fL3
 lzYW/xmoPe8rvi4J8L1prHAGlI/qCbwWgTJwqlkp59/wGcFSNmASkGXgs
 qebcIXV9/L0meYUhoYyDDl7vL0YiimNR53ROutF8Qdq7ky65yHJKjZmXk
 oJwOG4uXqqey3LsE9Hr4sFhn2HRMwlbcRWauU9sDD36YKvPQl4NLNEFfo A==;
X-IronPort-AV: E=Sophos;i="5.84,366,1620662400"; d="scan'208";a="177951719"
Received: from mail-dm6nam08lp2044.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.44])
 by ob1.hgst.iphmx.com with ESMTP; 31 Aug 2021 19:06:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8hRHgP1REBvbLuPnqV5q29459D8k30A0AY6aiVqHuN0Q05aLXgcJ+CtFIQv1AFXZZpVXkurUu6ZvvwgVYgonIUk47TbgyTOPoCapuKG7XW5DyDELZE1LRTqRXEU8B/LqChyPHmjFyIZmzHLkLmp1KIuDIIYTCmIeAM7iDZiOchdvE1FWbTLOr6DbHz827DXkWeF3nNGzJ+fYLexoqyGK66FVCX3athZ1GA7TZG8I4UeyPj2qZC1iMFrU5IM4rJFGT+FueVyKln6/R2WYjGOlcbBCviyYBujEuYo3J4TfshgFGb8y3nBnfnrFnimIQ1Aowa39mzTdLyAM9UYuFh36A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H8dgDA0+tgkmTKTK2NcyJL5UjFnbHjCqUBF/ZSQj7A=;
 b=iuPuP91OKZBbfpp74tHFQkfToRC86c3Dqzr48RsA782lr8WWWy6qhY6mLYOdWaAqeaHxpVSv3dx2l9efH1OJdugdGGCGABRRkXv9wfuUbqG8eZXPEf6qn/4xz602XT+JENEs37PU8L6NBCiytHumz636o9DU1XHEi6BqO1tc8ZOqZm3TLzZl7DXkwXU32jcNqlw9MAvOG4bWBQAD2C8lokDl6gmyVlIl6bRBtzrU9ccEdOrkMpV+iLbiGStcQ/gb/TZp2k6ToDScxUlGFumBsrhBHZ9OMoIEhxxV57uOWEY75K2FahZ/de2Yq3e0OkRnOET7NlIJEKm1kzbD/Afb5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H8dgDA0+tgkmTKTK2NcyJL5UjFnbHjCqUBF/ZSQj7A=;
 b=OSaJioC14G43VuRJMM2bY8osx+enhxV+Ll+fIbvnSf1nH7d6SEnRXKgZo3UnJ8gmGxY+1fuR1ba726B0taCdd8jOAz4NFPCdqCDDVnW6DeZmrJowp/UKLqpVCSdfrhN+USOu4/zjvPjopatczmhzEoUzKbklszBgFT1lWF/vPSE=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com (2603:10b6:a03:3ac::8)
 by SJ0PR04MB7886.namprd04.prod.outlook.com (2603:10b6:a03:300::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 11:06:46 +0000
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514]) by SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514%8]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 11:06:46 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 2/4] hw/intc: Upgrade the SiFive CLINT implementation to
 RISC-V ACLINT
Date: Tue, 31 Aug 2021 16:36:01 +0530
Message-Id: <20210831110603.338681-3-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831110603.338681-1-anup.patel@wdc.com>
References: <20210831110603.338681-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To SJ0PR04MB7821.namprd04.prod.outlook.com
 (2603:10b6:a03:3ac::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.35.197) by
 MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Tue, 31 Aug 2021 11:06:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97a7857d-fd4a-413a-ad4d-08d96c6f6bda
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7886:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB788683EC73EBBA36D23420518DCC9@SJ0PR04MB7886.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:117;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pgw+ZCpqUZ6IMbWYeUTVqkKEGy4Gfa8d1yomBrinRjFqtxZ5EF2soIzhtAf9JQMS4Jz1HCyce+OZowM46ffKFlcSf44gRYQRVzxBHEYbpsiTQZKf9M2dD7DxOZPS66r7FspCG91o9XwLb3ymqbLnh5CH1WfQ+QSu10KBwfsI7uik65lQ8BTUXPKr2gIWjR8PYja08btZfgJs0Lty9UupIZ3Zj3gAzLAGZh/tl1E5vnQhBjbrR2pmYDsP2Ibjq30OzTKgaF0XZZNHSzTp2Ds7ATHLGKvFYi8D5Yu87QpjoY4RMljIFeZQ/nb6NceO/5lQZqD+lA0k0/VuADeOIjnlk6ieHOYWKmOpVGpGp27+WEJA7zaNG9nxbDL7ZoRlf6NBBKqMIeJVDtGir9tTlrukZVK7LodgqXd9W+HOsKITvf0tkctzWdJMU1+GNgtE8qLzvMMoo48I5eH0xh0bttXAnJZDDEWYcEAd/rocMXtssPSiaWX+pub9810DOnR2KRK3eDmtr6kN3BZg2ITB0sDHeTM7I7FGltEyV9249p3ABMN4bgDj3dq8Unn+kovgA8qMcVjSzTs2qFqBrjCxSmqo8SEqMTevAKUY2IR3rS+rOeZIC0bVpRnsgh//RMNyI9zJCs9x84NmCkG6uxDgV2+W5if+EGU/Lg19JuMcTzEh5apQ3cUHTmY9yOuax6HDGD0URUr7DJVNdDtIkZBvGELk6/P6St0ar+LFJiZUDhMbn48Hh59rM0Z+PTsOVELwI4Fx2iuZFJer0fL7TPRuqZ1UowK6/AQtdeECm/8gR7NKJ33u18SUpI2ECTsvSNOEbqdD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7821.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(38350700002)(86362001)(2616005)(7696005)(38100700002)(44832011)(2906002)(26005)(8936002)(956004)(66556008)(8676002)(55016002)(54906003)(5660300002)(8886007)(66476007)(83380400001)(316002)(66946007)(186003)(36756003)(110136005)(478600001)(1076003)(52116002)(30864003)(4326008)(6666004)(966005)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f58yNOwwcN1o4DIMWvdDjjhfQSXriZQJtZ2IVL5P+vKfPzWwC9A5UdBvTPLO?=
 =?us-ascii?Q?QjVf/CseL+MPUqZgguu8ZoDtQKh7bELEI3UnHbxdlg4C37FkTVwkkyJ4fTsu?=
 =?us-ascii?Q?T+cyCLRei3RkNQ+tsBHfhYHTj5JCg1kcjh1szv2D8KfqCV3KXXZsUYb6Ws/H?=
 =?us-ascii?Q?Dm7GTRNhsEuJuo/JKG3hBnJKYXBWyNGwu4BeyQQejd7RjFsT5e3zhyO0YeoB?=
 =?us-ascii?Q?amgROuDG8vO0Vjr6z14PbQYHVjPxw6Y50/OJrljJuVf9nWNiMlBZZVy9GYep?=
 =?us-ascii?Q?TkehhmngvPc2efJjtEBqUsHh/s514R74jWRSTih73GiHV038fHo2otDog+Ut?=
 =?us-ascii?Q?V15lROCC+jkwcsHxV7KXlcxmU3ewtvlukz+9fEE0nfRnwP55zj73VSN5fi9g?=
 =?us-ascii?Q?S4HYgTlOmmOfLL09DylXx4LeZd0B2amHQZfpxiuYTNtPmVpGPRc1X59iIpml?=
 =?us-ascii?Q?X7v4BQ3kCLB25gMOUNTRguN3PoJGKzDVyeJydO3mn8Uz71EATJDwrfZ5NfXm?=
 =?us-ascii?Q?Ravh9V5Fr1Qdkro6Ne5GtaiMXDcSNTen4aIuF99BE9OO0UyutiHd66rM5Mb7?=
 =?us-ascii?Q?1YiYKCKgupVR9ELr7xeVXti33K6yD74ns8b/0xDmm4u3pTzmGL10rlCU3C13?=
 =?us-ascii?Q?4OAws2ZAiIkqKPFiRX32iPUQAu+VFCxlOO7ZUbMlc74ODTvwkC/b+TxE0KB5?=
 =?us-ascii?Q?vrjxru1uGFJrTXI50N6eaH8e8qX2/v4/QpZJeMCJElQ1SUKlw2CabCzbSNeo?=
 =?us-ascii?Q?BO+Ee7lDIyy44NLDGDU7Y5VWxXUR59Mh2OVd6XXH64xSGPPBA4kLJg7ROhBg?=
 =?us-ascii?Q?c9nmiyJ6IUlXGebRLVdpKmu5LpEQ9M9AidgxIBDmSyTKgxKckjioUN+tq8tn?=
 =?us-ascii?Q?jGWFwHw2bUiiuac6NN5v3ttOHxeZGeXwvr4J1vLiuVwUC02lhjG9SlEKBcSm?=
 =?us-ascii?Q?jvvR90YiNf5VSXZkkBawgCNfSMZxWgWAk/m0yIxRyNOqa81e7zH+JNpYIZIM?=
 =?us-ascii?Q?OQYwHTQFfw6P8YgJdPQWNARkh36P5M05HADn83i+4YGDh5KRBFtNhXsaXLiG?=
 =?us-ascii?Q?+y+GFRrvl3Nb4vvwoxX+yEydd/wt7yNHAjOCi4GQnULi8x5MNVv7iPj41aUI?=
 =?us-ascii?Q?N1eRhn33jxQC3FIYfnttFlyGH8XkFDJ6ixIfFSx4xUqhCjTnKvofTj6as3v0?=
 =?us-ascii?Q?ioFi1AOih/FZPuYkYGrllPCAsFJq3p3WRYA3Ev9Jkcq0RlbRKiBZVymOcpuc?=
 =?us-ascii?Q?3nLzyN9tv69/sK/93lGcu0QHTPxXwXGcavsgFxzEEMdRAqtXxIi0Aq+GtTXO?=
 =?us-ascii?Q?fR9y38q5sAC9rbmZwgaSwLnd?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a7857d-fd4a-413a-ad4d-08d96c6f6bda
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7821.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 11:06:45.9435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSDoBKqsRNE9GIXsuj2lrdVePYG2XNm2N4BM8kYIxpxD9vBhq878jRsONBhgcHLTa6/DxWlD3MwSwn3c+8/tiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7886
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=870f666b0=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Tue, 31 Aug 2021 11:06:54 -0000

The RISC-V ACLINT is more modular and backward compatible with
original SiFive CLINT so instead of duplicating the original
SiFive CLINT implementation we upgrade the current SiFive CLINT
implementation to RISC-V ACLINT implementation.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/riscv_aclint.c         | 373 +++++++++++++++++++++++----------
 hw/riscv/microchip_pfsoc.c     |   9 +-
 hw/riscv/shakti_c.c            |  11 +-
 hw/riscv/sifive_e.c            |  11 +-
 hw/riscv/sifive_u.c            |   9 +-
 hw/riscv/spike.c               |  14 +-
 hw/riscv/virt.c                |  14 +-
 include/hw/intc/riscv_aclint.h |  54 +++--
 8 files changed, 339 insertions(+), 156 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 31ce990d0e..f1a5d3d284 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -1,8 +1,10 @@
 /*
- * SiFive CLINT (Core Local Interruptor)
+ * RISC-V ACLINT (Advanced Core Local Interruptor)
+ * URL: https://github.com/riscv/riscv-aclint
  *
  * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
  * Copyright (c) 2017 SiFive, Inc.
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
  *
  * This provides real-time clock, timer and interprocessor interrupts.
  *
@@ -22,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/sysbus.h"
 #include "target/riscv/cpu.h"
@@ -30,10 +33,10 @@
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
@@ -45,10 +48,11 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
  * Called when timecmp is written to update the QEMU timer or immediately
  * trigger timer interrupt if mtimecmp <= current timer value.
  */
-static void sifive_clint_write_timecmp(SiFiveCLINTState *s, RISCVCPU *cpu,
-                                       int hartid,
-                                       uint64_t value,
-                                       uint32_t timebase_freq)
+static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
+                                              RISCVCPU *cpu,
+                                              int hartid,
+                                              uint64_t value,
+                                              uint32_t timebase_freq)
 {
     uint64_t next;
     uint64_t diff;
@@ -57,14 +61,16 @@ static void sifive_clint_write_timecmp(SiFiveCLINTState *s, RISCVCPU *cpu,
 
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
     uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
@@ -97,38 +103,28 @@ static void sifive_clint_write_timecmp(SiFiveCLINTState *s, RISCVCPU *cpu,
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
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
             /* timecmp_lo */
             uint64_t timecmp = env->timecmp;
@@ -138,79 +134,76 @@ static uint64_t sifive_clint_read(void *opaque, hwaddr addr, unsigned size)
             uint64_t timecmp = env->timecmp;
             return (timecmp >> 32) & 0xFFFFFFFF;
         } else {
-            error_report("clint: invalid read: %08x", (uint32_t)addr);
+            qemu_log_mask(LOG_UNIMP,
+                          "aclint-mtimer: invalid read: %08x", (uint32_t)addr);
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
+    qemu_log_mask(LOG_UNIMP,
+                  "aclint-mtimer: invalid read: %08x", (uint32_t)addr);
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
-        CPUState *cpu = qemu_get_cpu(hartid);
-        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
-        if (!env) {
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
+    if (addr >= mtimer->timecmp_base &&
+        addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
+        size_t hartid = mtimer->hartid_base +
+                        ((addr - mtimer->timecmp_base) >> 3);
         CPUState *cpu = qemu_get_cpu(hartid);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
         if (!env) {
-            error_report("clint: invalid timecmp hartid: %zu", hartid);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "aclint-mtimer: invalid hartid: %zu", hartid);
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
+            qemu_log_mask(LOG_UNIMP,
+                          "aclint-mtimer: invalid timecmp write: %08x",
+                          (uint32_t)addr);
         }
         return;
-    } else if (addr == clint->time_base) {
+    } else if (addr == mtimer->time_base) {
         /* time_lo */
-        error_report("clint: time_lo write not implemented");
+        qemu_log_mask(LOG_UNIMP,
+                      "aclint-mtimer: time_lo write not implemented");
         return;
-    } else if (addr == clint->time_base + 4) {
+    } else if (addr == mtimer->time_base + 4) {
         /* time_hi */
-        error_report("clint: time_hi write not implemented");
+        qemu_log_mask(LOG_UNIMP,
+                      "aclint-mtimer: time_hi write not implemented");
         return;
     }
 
-    error_report("clint: invalid write: %08x", (uint32_t)addr);
+    qemu_log_mask(LOG_UNIMP,
+                  "aclint-mtimer: invalid write: %08x", (uint32_t)addr);
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
@@ -218,66 +211,75 @@ static const MemoryRegionOps sifive_clint_ops = {
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
+    assert(num_harts <= RISCV_ACLINT_MAX_HARTS);
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
@@ -289,7 +291,8 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
         CPUState *cpu = qemu_get_cpu(hartid_base + i);
         RISCVCPU *rvcpu = RISCV_CPU(cpu);
         CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
-        sifive_clint_callback *cb = g_malloc0(sizeof(sifive_clint_callback));
+        riscv_aclint_mtimer_callback *cb =
+            g_malloc0(sizeof(riscv_aclint_mtimer_callback));
 
         if (!env) {
             g_free(cb);
@@ -299,17 +302,159 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
             riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_freq);
         }
 
-        cb->s = SIFIVE_CLINT(dev);
+        cb->s = RISCV_ACLINT_MTIMER(dev);
         cb->num = i;
         env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                  &sifive_clint_timer_cb, cb);
+                                  &riscv_aclint_mtimer_cb, cb);
         env->timecmp = 0;
 
         qdev_connect_gpio_out(dev, i,
                               qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIMER));
-        qdev_connect_gpio_out(dev, num_harts + i,
-                              qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_SOFT));
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
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "aclint-swi: invalid hartid: %zu", hartid);
+        } else if ((addr & 0x3) == 0) {
+            return (swi->sswi) ? 0 : ((env->mip & MIP_MSIP) > 0);
+        }
+    }
+
+    qemu_log_mask(LOG_UNIMP,
+                  "aclint-swi: invalid read: %08x", (uint32_t)addr);
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
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "aclint-swi: invalid hartid: %zu", hartid);
+        } else if ((addr & 0x3) == 0) {
+            if (value & 0x1) {
+                qemu_irq_raise(swi->soft_irqs[hartid - swi->hartid_base]);
+            } else {
+                if (!swi->sswi) {
+                    qemu_irq_lower(swi->soft_irqs[hartid - swi->hartid_base]);
+                }
+            }
+            return;
+        }
+    }
+
+    qemu_log_mask(LOG_UNIMP,
+                  "aclint-swi: invalid write: %08x", (uint32_t)addr);
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
+            error_report("MSIP already claimed");
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
+    assert(num_harts <= RISCV_ACLINT_MAX_HARTS);
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
+        qdev_connect_gpio_out(dev, i,
+                              qdev_get_gpio_in(DEVICE(rvcpu),
+                                  (sswi) ? IRQ_S_SOFT : IRQ_M_SOFT));
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
index a73848958e..6e95ea5896 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -207,10 +207,13 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
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
index 5a7c202dad..c680bcb161 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -847,9 +847,12 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
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
index 690c19c12a..79ae355ae2 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -84,7 +84,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-        SIFIVE_CLINT_TIMEBASE_FREQ);
+        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
@@ -227,11 +227,15 @@ static void spike_board_init(MachineState *machine)
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
index df33fd74c2..1cd7ac1546 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -228,7 +228,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-                          SIFIVE_CLINT_TIMEBASE_FREQ);
+                          RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
@@ -613,11 +613,15 @@ static void virt_machine_init(MachineState *machine)
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
         plic_hart_config = plic_hart_config_string(hart_count);
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


