Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meCgi-00023x-C2
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgg-0001xh-Cw; Sat, 23 Oct 2021 04:47:34 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgd-0006ua-W3; Sat, 23 Oct 2021 04:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978850; x=1666514850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XMbfyezYLlZZPqOTSDDPiQxcWawUqBfVM4lykBwoyOc=;
 b=ik6LqoxRam3yDPbzNZMKiVqwcvlahvAUEH+YGzs6KPPXI61w2aY/67Gd
 9/Gy0/eHUYUKtun0g/u5JqAdb227uU+sHE0JvJoyOCJFrb4bZXBSRuw3G
 4K5N8es7ym/YeLcQw7L3lxiIQX/GR4glzVmlyTL2zCDhnJVWA0tWd8xRb
 SvJUCgawnoo4fs6W4vcchmTgi9dXqSHgSQtv6TJ8llI9Ib3kDBbPvoMVa
 nZTKsggTH59RCsbLkPbNJHWqirvGLDcHwANmZLu+ez2gmaL1dXP+j7wQi
 CLlS4e0JXvH9i5q0uEh/PQfM1zVqo20uH1AmCyjMHZujM4DMkORvwikF3 A==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="188437369"
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:47:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fc4TFWd8pMIFfqyK6ebjt6pV5aZPjjAqhMYheCYKleMsg5JY+CWAC5Ll14W9FzgE6K9yUrUkBMmefmvOSEt4c1K6kTRxBBplgg5SJn6o/yfKLiusYKu8DUTPtGAskgTDtrFspHYm503Z0azdBLPxEhPMQ1hRkBmrc24M7UIbHFYti51xpqL/o2p9UV0WXl3xk4SqFYZ8nAXEMsECVQfp0yadnqqnMeZml1tVgN6znCUiNyT+4zM2Mwje1teO/XwN6jmMEFGsUL9dlHxrJTDR1Az2aUYjIVpvMDKNR3audzm2k3Ed21z08TmkocpL4HpsrOqJfBjeysZJZv9LqNveRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W87Jq2+WmqYQ9cdmWWINQjKkFz3m0utqsjzhxrkRCyY=;
 b=FrO8NOYiPWRNT8/JvdYfwt7fzpachZgcHzo/CGMa+mdEh7XkvgM3kbnKxLxBzSr3eiUqW1ls2kfEdF2JZKdKrs5H3PKCAyonSxuF4N0SWSDTbHbckiDVT4yWYGJoFo5SoIK2o0yHl3l7SBj04r1DPG63hCCsv5pcbVPBxXnNuNC1HNjcijJVn2305NPrDE8iAKWg2p+HBpXIq6G/S2I2+uumNA+QoET0zLcnYZTyjyjR615UML8FIdjF2uikD/fS/D8/8TGa3Dzj9aCueUCqUk2SIHg75QTEsfROJUsIqPH3Jt23NThwLA+kfrNjghaGtc2o01/jEBVFhpQxXfc7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W87Jq2+WmqYQ9cdmWWINQjKkFz3m0utqsjzhxrkRCyY=;
 b=LiPQOrPvWnukFeoytrs0BdArYsX7ZtrMTeegTw89K667vCsJa18IIRbp56ttV6hKulZToT8kztux2O0MV0i17kq048cLyxfnsgDf/q6gEov1jdaMssz5SKv1NZmPPdfyg9+AZUbo6Pw3UWfOptmfxL9XkvQWT7ekqpfnRZLbZ4s=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8345.namprd04.prod.outlook.com (2603:10b6:303:134::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Sat, 23 Oct
 2021 08:47:27 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:47:27 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 02/22] target/riscv: Implement SGEIP bit in hip and hie CSRs
Date: Sat, 23 Oct 2021 14:16:18 +0530
Message-Id: <20211023084638.1697057-3-anup.patel@wdc.com>
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
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:47:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5432dc81-0be9-4f2a-6892-08d99601bd56
X-MS-TrafficTypeDiagnostic: CO6PR04MB8345:
X-Microsoft-Antispam-PRVS: <CO6PR04MB834591665B0C6DE735BFC5888D819@CO6PR04MB8345.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5bEqq3MyailNUo5wdlm+ZuK+w6e4RhgaupmZt33xfHXWhP6IVmDknLon7FraGRMjpdNQqK81WkNcjrPsq4XROKntz5CR+UyIMopXFYkcXZdcI3wqtDum6joEquJoRIchvQLp9ffGtkx+HogHr3wMuTBUhxU1xzksAc8jL0O2wwl2qzuykFOHPU7hemITXba0MklJR5ARoU47KBav0LptRp7nCSiNbh0f8Ct0LwQrUMWcz4T91Yfi+bUJWVPk6NxQDjsvUZFSJ0PIMtayouEAnR9/Ljr9KErmaU/UmDMq3GxOmr/IluouCeFuty46sMwLYG6foWdwQxXnG969SzAxmzoVxHlOt0hW2kD3eTC+i55E1Re0i0fmxy/dXfSZtpPNrPFCffJFw0ghCUftn8lqffCQZANYUj5qao3Wcof7yH+NuF/ikXlKuU3JFgUXPCDE8bIFAfB+eeW6zz2snlsZTyP59RHpGr1TO/h8OlZBzBxIHiXMsx8Onxxnsii8BYyXJvt8w13djeo+eqDiKF9xlKS2Htx0Ob1kGx4OIHuSwLjEnxf+uMAhVE0UHUT1J5Gevri4A+FoF/1KXSCYGDBW2wI95EBMgNF/3FVJjTxPqhaUBoeQRTFwZ7I0B6iPu8THKUbfTIrMAadTiUYZzAPWSgLTq1ab5JB33zQLNGTD1LGkE2I36Cjsy2YaOtPJjtz5T3pEInsAmXE9CJrXhA1erw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(2906002)(1076003)(55016002)(52116002)(316002)(6666004)(2616005)(4326008)(38350700002)(5660300002)(38100700002)(83380400001)(956004)(82960400001)(508600001)(110136005)(26005)(54906003)(66946007)(44832011)(86362001)(8936002)(66556008)(66476007)(36756003)(186003)(8676002)(8886007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o2ExaFjF4U+jj5clR2j7TmC8z3/F7pgsViBsMshMvJtqpf7fZxOOAAROl0k1?=
 =?us-ascii?Q?i1GMZ0s0xiirZJfZSs278fh0nfTc1HmfgzVMk2sanCq3vE1ZM/6Vv6cqYiDd?=
 =?us-ascii?Q?YSZ2X0HP4ufxYzTuPOyVHqK8/Yhhx6MPz9ubY8aMyBT95WWmoovKdFeEkaa3?=
 =?us-ascii?Q?PWG1XcXunNxPad7rpEcDpN5S8A/QJjPNyikiFVYW2DClvc6nsYfTbsTp7KVN?=
 =?us-ascii?Q?Dw0iz0EJ/+PmyJkuGLyN8e5hj520EGLhbQGsS/YEb11pm32FG5JM0yFzpnWW?=
 =?us-ascii?Q?DMZYMqxPmr+WwPd2pF4f/pJmn/SE96LOPtJki7Wn36Odv6xdI1W6E8NMEotr?=
 =?us-ascii?Q?VsIcSzLnRrZucmRRBetbVAaP7bJeuEJEXWvnVobMk2UShhAEdF6K/vHGCW+P?=
 =?us-ascii?Q?gHPDngyVMK67WmQ2Nhb3kz/VbbYsOXJc5PzOH7s++ojvUwEYwiOT/9MWmn5Y?=
 =?us-ascii?Q?1Jki9eQ8dYOqCeriF7aC6+6pOtTdOxqCQPgEjnKGio8QA+91ZQJrrWjgHUmU?=
 =?us-ascii?Q?ZjZV8WxPRrMmhDIq43Jwbfr8JBUjUlaVM23kXq9i1CRMIQfKvIbKOhJyfOnz?=
 =?us-ascii?Q?gx6Bj0LtW3olD9jHirUKj7LXzKdm/kTJBfXT7+plgwYVGCfMNqDn2TqX/TW/?=
 =?us-ascii?Q?H6mRY5E6A9EM/zyHXQSbrR2Bepga/YMVIvJMRZXo3INFC7m0g1+umDRZbmsM?=
 =?us-ascii?Q?x8nNO+COfTIWh3pg5Z388qxdDfUBX9jX3TGfxKIjwqJlb7OF7J1d7kjMZMPR?=
 =?us-ascii?Q?qXDdPxACyA++27S0vUmWTJOqgCIJlSLLveu6mbRiKeGeFF/2XeQsRkep6Pjd?=
 =?us-ascii?Q?4fHbo9W2kUWYLgPDtL2NZzbPaWA1+zYj5guvdri6dGi7xl09wGa4tWn2FqnW?=
 =?us-ascii?Q?o2yHOSOUBSTKhfc5y7zIeHCDbez4I/58D2Y5H3NVmCVuUCkMUo1Rm/mRDl60?=
 =?us-ascii?Q?2ZHGMcmiH7HNMOr5Ksodkek8p83ZHUOWy2QmNAobA1Gp/uUlEOTcYNe0MdPx?=
 =?us-ascii?Q?hDShVDNKVvNOn+Tn+K+8g2x6iOaYomnhv6BrdNemIdPjDdD6/uP6AiSFA1iU?=
 =?us-ascii?Q?FcfJWyUkC5uri8GPH0Lcsj80rcZ/flvEpW6xkFRXdLw5FwAncy/+uefe7VB0?=
 =?us-ascii?Q?UsMh0VS/ciu0jTqNga1AQ/3yuxbIfLiC0L55AO3DZAvi8ejYQknHMDF4J6bo?=
 =?us-ascii?Q?ElMFyQX2g8MAjQs/UDOPH2FjSKTASmPtQhGmSXUKGsZxMKEuIRFRYz2hO0FD?=
 =?us-ascii?Q?/MZ1MxwWE+G8M0dt3Jqkh8dbZWgB2iTrChA2Kakn5fnDVqEdLC8kRZvxfKqT?=
 =?us-ascii?Q?5aPKOCjUlDlWAdkYIxUDpw59WFEFIk2DXHwe5cXwj3vIgCYq5qgmNEr8rv3M?=
 =?us-ascii?Q?pBgIdsyD/XlowMzn3ejFiWYyA83n6P0uZFhn3hGafhshb3BT87yMWBb9YnIo?=
 =?us-ascii?Q?1CTHAMPm9CkVWJ0UrTAF/XOe8MYs2JOYgHrViN+pQwFKh0ki+s3AZHttqbbk?=
 =?us-ascii?Q?WxGEB8P8TsBQDKbTKxn5tOQ8pBqskr8Y/OMVUxoKYAcRZN8s1CtbvTCC7ZmY?=
 =?us-ascii?Q?HAuLc2l3WKTvzEnxyUnAQodW4XaDv8UuO1RzPDnTywJKlnxBunG8TER9AmRd?=
 =?us-ascii?Q?NeGKbS0Eg0GAiJ7nU1pKg2o=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5432dc81-0be9-4f2a-6892-08d99601bd56
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:47:26.8721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdInlviTiQO+pMJS+RvSRxhGQTM+9+ZKoPQGTqspyzcH1RzLyJ9WYBIoV3VsIoD8o2PDBGy1Z6uCDvu99MCCsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8345
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
X-List-Received-Date: Sat, 23 Oct 2021 08:47:34 -0000

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


