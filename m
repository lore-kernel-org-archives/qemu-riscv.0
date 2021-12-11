Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtsG-0005YH-IJ
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsF-0005TI-9I; Fri, 10 Dec 2021 23:20:39 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:25424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsD-0001io-Dt; Fri, 10 Dec 2021 23:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196437; x=1670732437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=221fwonuzmUL4JpIyJCEMOjOLU8Bl5oGgUJUzKoMB84=;
 b=BU5uzC7p0dhTHrA3yqigH59vJxi2f+ZpqAH4due6VQ4rL5mLdfyFwZEi
 LDbdWCe7YIJhdblusz4VNROw0Cz7C4cyIF9nDoZND8QqxTebPW1JeXqWg
 jRSbcv9Mh98+jXS5ipCaPsqp2VtQa2T1/O7iAJUYzN/nF/TYtLHruk5SA
 yru6Bc679Kyy/KbIfCNm9uNToXbRNRjXKYZ5hHFMIsxDqnKRxMNfsYDiv
 APsysieV/QgtIbT/iTbH/ClyHmPo9GIgasB77HmBK97QFRyY4uxnZFwPx
 H71xRMS/X6f89G0z90L0UZUIjy/7L1UcEgC4FjAgssjlUHJZg/9qcb0XJ A==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="299834361"
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0+JfK9WvxvdBQzsbxngaB8bRRTC/OCJyjky31WVtQ6d3NcemJKY4heCTW6pNMb33r5b9gMGppAxJFM5tB1Y2WM8P1UKA/v93TBS8RCkw3fSGBRov5bDxY58KDqESFpJGV9osdayA0urmVID/7L+/+BxrRdA0PcJmdsKTCMOFQRVmqbS45v0PsWwYdbC7k6Q16FYbzhSWM7KYm0IaK8YgEQlIYFeAgBkNnHoZDZ2nBj86Fdxc5vlu/jARUvRaVPh5AhuauZy5CFpPk8ze1PU6dKHw7n2dcY5UY8OizCfNJaqVdzAt5ja4OClcr+bze+O/da78dljCcRkWQyoGXtQCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgfw4elSnNVa5zYmZylgviCKbU/BAyaHgG/ELPE8owM=;
 b=KGh6ZYms3Nej5s1fHqVCdUTeG4hK5i5QiHwwvrtrrbpisQ+J2TWCN+rB/VOFkrgN/UUc/0za7Gq2rXv/zJD6KX0RUs6GkvO4/3YhlCgcj6owuizxIc8+BhLyh9c1B5uQd9N7vut78EC7msjjqoa2sQ5NXu/LmTcUnXz0nOnqHMw4kQ5v2qW21IJBeTczU1gZElqQEnLjS3ZYPWskg99TBbj80d7vBW+DPygb3zsWt+eEfI+gJCIv6we4cQOO6EsxwCxXIj7vVeKNNzfV9xnV1C77JpLvG881mnWEGKqUbN7TyDmcchokEDCo19h77iIfraHbvuAAiZOEJeyZ+4y8rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgfw4elSnNVa5zYmZylgviCKbU/BAyaHgG/ELPE8owM=;
 b=WRR5ASNgthZNJ/SDfQHtrf8kNdAAX1wtBdO0WI/hultMRcGYhQQK1dbQTLFwPShjNc+ZWfQTHOjrfU0iaLExsFVekR3zFqq7EnPvFccpoIBRhsBmOXc7lBMdQixy4/Juq3kR8KAp8UFcNGzFokeClFOG4d/0t29iXnt2JotJf0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:20:34 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:34 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 12/23] target/riscv: Implement AIA interrupt filtering CSRs
Date: Sat, 11 Dec 2021 09:49:06 +0530
Message-Id: <20211211041917.135345-13-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9708310d-ce6a-4127-1bc1-08d9bc5d9346
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB8268D94A6DD18A543F3E0DAC8D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ncqxyylNNZm9rz/BApOtbL0VX2unUHpVbOw9H7KP7On9NbRB4rG4TrQZ367KUvNvfPAFJenNktebDjMYqiejuYdw1t1KRrUqZoCvUWTrQyQhdK9La2Owg0RCQ5qEvKiOpQjIwm8KMwvTuvHjehSgI8HhKOy7nGlraqKbea2+emSdLttc5oJMuutnEOfAam7NpS4qcl2cdLGHwmhIbUQhygFRvVAvNAYYgDsVVMesJW9sepWnB5bHvPK3n76E1qrEszERGjdSNUXka1IzL09VHcCWECcMoGFxq/opZ8w28urmExBDmu5DIeeDuVpuAQZZyOpLBRJgGxs0WoSzZMixMj4X31RZOVLnEQ5HS3xT7ddrQ7redXmNQCdu6zePpqjoLxZk5dJBV9OdxyPfzMhXP0a4C+mgBtOwfEyRsXIy6Z2sLphDi4T81oftWJTJagZf6Vg55Zi0wMX5CExMj/7qwZ8gwboYojp9qb+eC4UoRRl0q/YwLNVdV4/4boRgXXwcOaGWwCVo17C6Zw7tWh8zSR+wZ0i1wPu3KaJvFyE/X840CnpALkOz9b3ENRNdKnn7P5/lu+EhJXCZeM08rQbVa658dnpCZ1ogEc8ptC8IR/Rdd0EUmlH2CWSOCd4ysr7BK1ak+CRWWXYVZsC/iCLsLeCF8yZfVDl3aOs8H9K6jeGHWENWgu2sYCI7WiCydcrKeVAVCNeoJ/4SobKGbnugAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?siCeYc68xQmEYRRNiMGsvYNzSTYy6wp5cokmXWh/7PivK0JgF1A3kTjCojQy?=
 =?us-ascii?Q?qhoMk0c89NSouAHFuR3CvdXd2OqWXhLyHeaVNfXc0512zzpZI8A//+tdDxcB?=
 =?us-ascii?Q?hQ9PAkhSG7CQmQzRS3CnNSRzxtdIKLI0xHpQ54iZ3itNTa5SX9DV3UymC2oQ?=
 =?us-ascii?Q?+g7LtOKDn0Xn0ZCO9og7aWLqvFydy2HpmW+A+zuPud9V6ElvUD/bFUjnAK2w?=
 =?us-ascii?Q?MuMLgLooNB8jLDtoCymwnxOP4zCgcb1IHOePENdLqd+O6kyLAMXhrkCOd1xk?=
 =?us-ascii?Q?lbt8VWLoeEIReC5HGZbtDRvlevcvZ2dnQBwxCJftLT5UbWKbPOLMo7Gk0tPk?=
 =?us-ascii?Q?4nX8gT6QRNyGEENtf5yqgceLt8MGFAXVoDdln8+yx+QH6w/jnGhs1GOhRUf4?=
 =?us-ascii?Q?BKIDBm8gelCR8GuTJDPedeXXvJ6X88/+U8t7KGwV1bY/7mxgPhzsnqKnFQd5?=
 =?us-ascii?Q?RzV1VSax5C01SnRLRP3ASg+TN4NEUTYF00ZaiLhKszEmf+bmZ+zLxpiDqsa6?=
 =?us-ascii?Q?dvzw1HlmJ4G/riUXRptDybL3GdEFp8o0h/XVaY5XzUcEiLris3CcGRX8nsn8?=
 =?us-ascii?Q?QOwD0xvxTr3unz6SxcZrmNyw17yA6Ry/3SFl4WpROstUD6ag2oLs1ZgaEmWQ?=
 =?us-ascii?Q?v7V3YRxgOqBuQNCWqKRrAdND0PloFPFzbpvhBZqSpW2zjIathUwCiZo97rR5?=
 =?us-ascii?Q?/URIcGa7uV1jZUirwa5I9A7NfaeD3d+4NfVkQBdHMailJMYRJZJbSXqFrYqa?=
 =?us-ascii?Q?t5XZJg3qe3D9Fht6j53hCo3axXZFFJXa56VzFmVuYqBwwzNtMkabq9PH1RQ6?=
 =?us-ascii?Q?E8AVleQmyNB6bwLHXEVwTkgdMDytehQt9HJ066hJgHugAvtxdSphGI8oa3/w?=
 =?us-ascii?Q?/clUaCA1uZxHbmpDGgcqrhmqKulTWm5QEdzapyiNHzayDNmD2HJ1vOy5L2aJ?=
 =?us-ascii?Q?a4BYRhOFLCDFyV8pU1rrgtKvXw4Epj5jY8mu7OTLM3o4V3halfSa2iTfquSF?=
 =?us-ascii?Q?UwdDFZYWm9hrOICGP/DnNCyH399DP5K0c2Vc7tzDrkazGf6WZIM8bkMoxz3P?=
 =?us-ascii?Q?Np67rXHZGf+Yx5J8aptbxTEeEYFLjD2AaFdUIIM86OhVHO1cY5jJv2RV0Yz9?=
 =?us-ascii?Q?gIKuvddzq3973n6m+awCjTuHBMaIH2HFLJU1dRu+pox5OiqcS5zJWsVRml+2?=
 =?us-ascii?Q?/gCMc80CESwBnFGe7pBWadKI/TFyWoblgG3bM4fpjSIa9DDKGPMfg77nyhuA?=
 =?us-ascii?Q?2yKF0MG23YBEtm1NnxiKN6N1NkGy1I4kjADFQIpEbcfksf7tb4SCG9oV4x5i?=
 =?us-ascii?Q?hdWOmKO/Nr5ktGe+84udvlinXngraVWBkZWjFqDhmWoJXgV1zO3cTBQ6pXbW?=
 =?us-ascii?Q?FzueFhHabvUnGIgLQUGLfof5ekKkWpPX0mS2PUA1L9KnNVkPNCBHWaFyU3sF?=
 =?us-ascii?Q?LgA8ihODCTmDzr0NJC4eyU9P76gkeaOdYzii+4dJGmJfdguHp+/QZBgCtViv?=
 =?us-ascii?Q?sUhMx2WpgYYW5yrf6w/h/XY7PY1WkNqaAuQHE4wqSu2K57mxzLAFPrRkopCu?=
 =?us-ascii?Q?tfHf7kMm7t/rk9TCBQKxyhl12DZpd7PbvDOw7JD2WhP6WLmjEsWKezd4U7Kr?=
 =?us-ascii?Q?sjCQC/pP3yYc+bU7Z0yDd3U=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9708310d-ce6a-4127-1bc1-08d9bc5d9346
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:34.1430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quqjrrxXYAabRt0GdwmCxaEHq9qh/bFPDC43cPILenLftK/1VfqumnTvpZEI8lyUtylO7jW7KuCys0GXdiEtSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8268
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:39 -0000

The AIA specificaiton adds interrupt filtering support for M-mode
and HS-mode. Using AIA interrupt filtering M-mode and H-mode can
take local interrupt 13 or above and selectively inject same local
interrupt to lower privilege modes.

At the moment, we don't have any local interrupts above 12 so we
add dummy implementation (i.e. read zero and ignore write) of AIA
interrupt filtering CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 968a65bbd2..4b3edc1043 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -153,6 +153,15 @@ static RISCVException any32(CPURISCVState *env, int csrno)
 
 }
 
+static int aia_any(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return any(env, csrno);
+}
+
 static int aia_any32(CPURISCVState *env, int csrno)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
@@ -525,6 +534,12 @@ static RISCVException read_zero(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException write_ignore(CPURISCVState *env, int csrno,
+                                   target_ulong val)
+{
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mhartid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -2343,9 +2358,15 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Virtual Interrupts for Supervisor Level (AIA) */
+    [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
+    [CSR_MVIP]       = { "mvip",  aia_any, read_zero, write_ignore },
+
     /* Machine-Level High-Half CSRs (AIA) */
     [CSR_MIDELEGH] = { "midelegh", aia_any32, NULL, NULL, rmw_midelegh },
     [CSR_MIEH]     = { "mieh",     aia_any32, NULL, NULL, rmw_mieh     },
+    [CSR_MVIENH]   = { "mvienh",   aia_any32, read_zero,  write_ignore },
+    [CSR_MVIPH]    = { "mviph",    aia_any32, read_zero,  write_ignore },
     [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
 
     /* Supervisor Trap Setup */
@@ -2397,12 +2418,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
 
     /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+    [CSR_HVIEN]       = { "hvien",       aia_hmode, read_zero, write_ignore },
     [CSR_HVICTL]      = { "hvictl",      aia_hmode, read_hvictl, write_hvictl },
     [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
     [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
 
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
+    [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero, write_ignore },
     [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL, rmw_hviph },
     [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h, write_hviprio1h },
     [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h, write_hviprio2h },
-- 
2.25.1


