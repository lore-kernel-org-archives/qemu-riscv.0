Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtrn-0003zB-V3
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtrl-0003uP-T0; Fri, 10 Dec 2021 23:20:10 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:50820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtrh-0001ZC-Jm; Fri, 10 Dec 2021 23:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196405; x=1670732405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NAVv9AOgzbZpHGJSv28sw8nxZ+5O3OCQrQmssfmKeOE=;
 b=mA1mDA6CP1upSafR23GcauTp/LOmp7WVKS4B8T9J9Daj24XuHpW/eXvB
 y2AVQ8C6j7UVeS4XwuHFBZDSDasWZJ9MBd59NfWQ7wDnw3ETRTjNcS6ny
 8GbCWaWp/qSfeR6MPczDolZKWZ10StPHdMq0tAvwBDHonKc7g+k96E+U6
 /pwHUWyZDlmf0xxJX6+wNzVIWeg7FrDBJQ3/J1YINUirQzp3v5y4IUZa+
 q/SDz0UtP1uUWD0Yg7y5idTl3SWqzZHAbXRwsrKOhB6xYb6ZuzD0ioLhg
 +2z6QrWEJ+oXMh4x/+TwKW3sayrU66nssVKn17+waa0XgZil8X8jBZt3l A==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="186970359"
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4/WvPqcGTIEo9V+IHDoCJxpMQv3zdfHmbqASWln5LZdBAc5hEwbi+t2DwNsi5PyXlEoqFwK/jl+gy4hlVmX3vUYw2Fsi+toa8hrcXwWTp6smTT72kx8JQEbd/PLwXdhanqg/0jimlQnThmXOQbxPXv85mMHex3XVzdtoB6uESoKhYKrXIjpytWUjTwSAPZ9s6VveYWczF1APoy/E5DmJpNz4GZ6q9wj5TFybKb9zaHvcgEaEvrK/FefCGZuxIEQJFDY4NlNqLvdvbXYYByt6TJaqw8aTNL2imG+h/EVnO7JRQFVqjT5Ti7MdiByQvL0UQ/ZVbA6YyF0guhloij3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79INbsxQOMMapqgcKLEHx0iL5XgqVItO7DVAveZ0Klc=;
 b=PVH5seHIx2rSGA80bO5qP+TkI1jvT6wEFsDKwTm+w5EVW0jm3q7wM+6aQa1IcrrDwGIh8XZWJOocXp1r1im0lhfqGqaVbbuWItWIewborMaIJ6hbF5lpK25soVYbiqnEoiGmAUwvuy0O16aBh4e8//f1gWhZO8cfUe7xlcyl2OF0Ld7dUPzZ4erfq3LhG5SIl6Fu4QbPmrIwv+ikUAgqJM/GfpC7Ct4AkXYgu06N3kMTmgQccg+HOu6proHPkcsULyXjeTazcQedoBZkMJxhb4n08Ra0ETRDqyT7J+H2smXprfJFYICicWPaVKIBRJC5UgI4JkOVfZxNshCjyikgvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79INbsxQOMMapqgcKLEHx0iL5XgqVItO7DVAveZ0Klc=;
 b=eTF1xhLDEsO5SpYus9WrNA6MzNAT8EXGC4mtrmboa7kKkOBYasZmIl6wK485e0LZXix404oisT01sPYDuHt4C7ZdBBPxL1czHL4iBMF6NuQuv0ixDRzdi8LNbGtfJoh2v26fZNv5wrfyotuwEY8KE0HIstzfzPeQiC/IEIMY44Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8265.namprd04.prod.outlook.com (2603:10b6:303:150::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Sat, 11 Dec
 2021 04:20:01 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:01 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 02/23] target/riscv: Implement SGEIP bit in hip and hie CSRs
Date: Sat, 11 Dec 2021 09:48:56 +0530
Message-Id: <20211211041917.135345-3-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: 518365fb-a9ac-40a1-fc0f-08d9bc5d7fc4
X-MS-TrafficTypeDiagnostic: CO1PR04MB8265:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB8265A2CA6BFC48B16BCE20948D729@CO1PR04MB8265.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8rCUnNfddB12lZdKeDz5V5zwX5qmjfgXp/umqWNOC4QDJC0icHWsn0dQcnoojhbQmRsK2etiAEp7mm55wmRmAjn2278bJCcph24KPT8miHhpVokBhewWlmwn+ut8grUAlOziva4+O9oDr4N/3al4hjA2Yoyg85S8NQzE8TBULVtw2KUX4LaQfAyUAXPg4ydjK2dB+B/ASH822+xtRAaVV98+3fwRYSOsWQjrGfDlynzcuqUuL4Ame/gNR51XMivxFjcRgJ7PxDaGyBhfoq9ljBHr2CK+quyT8/Etd868nAWZLeMLlK6DjDePQWzLudtAVe+L2zBe1bRVvsra/WyaX4UnkBt/BNj1kiFpV0XewBrTwNeJYNvWkZrmzTaLyJGzppmNMGJBG4fWlKUK04sxM+R01XXoZKnDnDMUQzNyLVYy1UrL5g2nbkNzzJvuYIQk+UrLcm33bnpVYYx4ZSV4qTJ7brIi8YjiGp2nTUxrKQ9Llwy1ndp6oMRwgLpfTa/riwwdr1JRVy7J5AAJH28eREK2ih7FsCOQ7j+Fl+XAX4IjnEOAYjN99n/MsbnI6BBUnpYrJBXGfk+QCqtt25eQU7BTO9tyuPiRaJwsbGCuRHJ+FX5MIUIdTs1fRyUKySy90m7HB39rsBDv3GtFdemfHdgK9xPAm9YU6XIaY3Jcn6ZDlQBLcSEhdDRqHWse/MT+o/F1QcdNizI4yIV22lUu1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(508600001)(110136005)(316002)(82960400001)(83380400001)(6506007)(2616005)(86362001)(36756003)(186003)(52116002)(2906002)(4326008)(26005)(5660300002)(66946007)(6666004)(6512007)(66476007)(44832011)(6486002)(66556008)(8936002)(8676002)(38350700002)(38100700002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L3UeBR143gfIb3dfweESOCtDkxj7gFFhsWx8O46FCmCFL8cVeBtWSNhWQgBv?=
 =?us-ascii?Q?VClOvPJUyjtsFyEdLNJDILkG8kMsyR76qSqifjef9P8jatcBIEumyBPY9Abt?=
 =?us-ascii?Q?2Y8mfb6B3SLPQpBYz6lAf0NiEYVmEIhj7KCX/P7tiAsPFGj++dRXDKtMEz1P?=
 =?us-ascii?Q?aJIwPjfUz5J5MX8lwwACs0xJLEXnM5LYgfcE2Ge0w65PJzk60uIVOZqVJPYG?=
 =?us-ascii?Q?ALlwNeHqviyw5EbUQZ3iB/bYw3S8cxFGLlNCjd76drSkIMoKvkggGrBNn2dA?=
 =?us-ascii?Q?rcRDuJQGMb/hNeTWnGjW5VA9lopIKbmjzR3T/hWKQo82TTRvIwJYAzGVuDoQ?=
 =?us-ascii?Q?M2DhNG3WDX8Mv55Y29+e3csXpwtZ98i9ywqeCgkCn9XDnx3k5aUB7yvcK6wE?=
 =?us-ascii?Q?MeRSmHMDh5bPfuKJ0v2gsvmB4cPcDFLEHc61qXHohDnnkG571BC2oSwNADJz?=
 =?us-ascii?Q?uy5iZNqjvTCXQR4lR51qaKzel2M+L9VqIz4OaVVuQbfGloPdogNN2LVytJAf?=
 =?us-ascii?Q?So9tdAmzd1W5GdJCpuvotAc/BiQ/xwrcZXd26r4YZLwdXpnNTn0Nwbw8u9eo?=
 =?us-ascii?Q?YMCiXCwB3OrHgogPCVKPnrG1eUJ/h1UlGS//2/YTJHffuiITlo/iViqNxMKS?=
 =?us-ascii?Q?9TQd36S8bmrCZA7V6NNpZKzLS6RA7ND6Q9tU39ZWDoHZhMC1Q0/QV3rG03J8?=
 =?us-ascii?Q?KW5d7raZ0Zle88Qh9cyqtAk/8DvvCgrxhv2wqdxrsGealo77WR45Cpehwofx?=
 =?us-ascii?Q?3/LBg2Knlqzxe6AxszuvtFnifJVn8Re7Ev1lO2wJw0JA/BX/QaRMVRlSVBRU?=
 =?us-ascii?Q?tRePSJ9qnWuAxUBalatIQ7BJdL6C84SR5DP22FqBP24S/WgMraljrpqa7V0c?=
 =?us-ascii?Q?Yzhni+qq5TvmdYPh+B7aHPOqL6YdH8EyNIN0JtXmy5cHha+6rrtPr8/4TSwj?=
 =?us-ascii?Q?yin8eEUnB/4wVdINJTqWY36jNF5SHd4+DurzekRt1g23h9QtLun7ebgV4KBP?=
 =?us-ascii?Q?eFMktcfC5nYP4iJJjPtuo4YRSP7+cs+Scvc6JQo5as2W3jK0j7uwRDSWU8ko?=
 =?us-ascii?Q?xnKKC1mnEU/rMrmQVjDfJHBphAntJ9mqJC6np10ducHSCv9gO+1xLNQRg2FT?=
 =?us-ascii?Q?NsDgCMhTctLILqVnpTsDqeDwdZYDU3M1y/iyaW23QE5cRo0NHaWcldCKm6KU?=
 =?us-ascii?Q?M8IoNcShTI7A5HPgDpaO1ApfHn5prf3YyIM1Bn7L9UgtQzmekFBoernRwuZy?=
 =?us-ascii?Q?52u/zfMTvqlK+tqzI3qW1Wtj0vVh9uXvSLWC6/Q1oIbfWg3q1gDdFYDvkrJO?=
 =?us-ascii?Q?M7/0sDAzRMpciSLvaR4sJieDjOPWco5s3DF9Ze61lpvmVOadgjpkoY43+3a4?=
 =?us-ascii?Q?Svr1FcrJXWe9kkymN44kaCRiExvqDrxevP0OaS6576NlQfmEx6eP3itObyE9?=
 =?us-ascii?Q?7TFJyUNqHPLYX1F3kjnnhJzDu8UDnYMr6TCk8SVT8VmarlPfYE5RgBjdHY7b?=
 =?us-ascii?Q?Ue8OLkwc9q7SBhqB0e3PZD1016htuJYUZR+lFBF6IUVJw1bhRTMVBZW3E2Eb?=
 =?us-ascii?Q?KD/ls7giG3lFtpYVxNAiqfL/BMGdoo5hC9kQ1qBGmhX8P5Jm+QVscRMhAJzY?=
 =?us-ascii?Q?6HBKfFXD4d2Z6lmRZAfHWKo=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 518365fb-a9ac-40a1-fc0f-08d9bc5d7fc4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:01.3576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5XE1rF4YHbX+YVePv2PoEvjNeyQ+/acZNk4eCzpBzgFdAiE5OUI2UnlJ9j044O2d92fM31GRlC8tmVeOybRvg==
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:10 -0000

A hypervisor can optionally take guest external interrupts using
SGEIP bit of hip and hie CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c      |  3 ++-
 target/riscv/cpu_bits.h |  3 +++
 target/riscv/csr.c      | 18 +++++++++++-------
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f812998123..f3b1b9a775 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -372,6 +372,7 @@ static void riscv_cpu_reset(DeviceState *dev)
         env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
     }
     env->mcause = 0;
+    env->miclaim = MIP_SGEIP;
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
     /* mmte is supposed to have pm.current hardwired to 1 */
@@ -610,7 +611,7 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 
 #ifndef CONFIG_USER_ONLY
-    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 9913fa9f77..c8ce77b1bb 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -524,6 +524,8 @@ typedef enum RISCVException {
 #define IRQ_S_EXT                          9
 #define IRQ_VS_EXT                         10
 #define IRQ_M_EXT                          11
+#define IRQ_S_GEXT                         12
+#define IRQ_LOCAL_MAX                      16
 
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
@@ -538,6 +540,7 @@ typedef enum RISCVException {
 #define MIP_SEIP                           (1 << IRQ_S_EXT)
 #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
 #define MIP_MEIP                           (1 << IRQ_M_EXT)
+#define MIP_SGEIP                          (1 << IRQ_S_GEXT)
 
 /* sip masks */
 #define SIP_SSIP                           MIP_SSIP
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d170c7fd08..56e8d35217 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -418,12 +418,13 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
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
@@ -683,7 +684,7 @@ static RISCVException write_mideleg(CPURISCVState *env, int csrno,
 {
     env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
     if (riscv_has_ext(env, RVH)) {
-        env->mideleg |= VS_MODE_INTERRUPTS;
+        env->mideleg |= HS_MODE_INTERRUPTS;
     }
     return RISCV_EXCP_NONE;
 }
@@ -699,6 +700,9 @@ static RISCVException write_mie(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
     env->mie = (env->mie & ~all_ints) | (val & all_ints);
+    if (!riscv_has_ext(env, RVH)) {
+        env->mie &= ~MIP_SGEIP;
+    }
     return RISCV_EXCP_NONE;
 }
 
@@ -994,7 +998,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
     }
 
     if (ret_value) {
-        *ret_value &= env->mideleg;
+        *ret_value &= env->mideleg & S_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1112,7 +1116,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
                       write_mask & hvip_writable_mask);
 
     if (ret_value) {
-        *ret_value &= hvip_writable_mask;
+        *ret_value &= VS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1125,7 +1129,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
                       write_mask & hip_writable_mask);
 
     if (ret_value) {
-        *ret_value &= hip_writable_mask;
+        *ret_value &= HS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1133,14 +1137,14 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
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


