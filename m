Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtsR-000651-Fv
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsP-0005zG-Rc; Fri, 10 Dec 2021 23:20:49 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:25446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsN-0001kV-4q; Fri, 10 Dec 2021 23:20:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196447; x=1670732447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WcT7rY/pyMF9kxvmVAqqhyGPiF/mLi3PZm2VyRrC9hM=;
 b=hzulLSS/5jA+u8Ykq84EUyguQGy3thXKokNmxJwRr6LhOaYCv0oOp0Ix
 lpFK0QWocUaoDEOWVMzpCgOkPukRAtxCac1atbsEoIXag16ww/K/OvMBc
 TzXDl4k2JnzwJ7zfq2e9Ayy/yDF/x7OH++hhkiOsWsCRIChI5ZoLiQT50
 x09HRRky0W/7JnJ4vVAouYS0L48Z7jx79zXp/ViynueXzlsXg9N9nqJM+
 yb9OXVQUBhHBNfXHjYLJ25Rvlynza/yZnQYs341voOWopN4QSFGnjMfFN
 /CuFMfiNvKjZH1H+EKQFU54wbrwy+xgenwqUY0qDrQS2bjigXBF15T9U/ A==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="299834369"
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsO+f5Nq4Ogo37kVVxF1GMouGebjp4fwoE4c7aaZvO8AEFu0SADKOwS5REFjt8lDU2wMrjvGCcGyU1/v9rHfZ24bDNnz8Zg53c99S4NO66qpvAtThzuAUTWLc9xCr0RDLSl9YNagfV3IvLq4iwyFQ93HRQU6nQkdmbuErOP5jJY7Cl5V1r5r52lpO0wzSXNA7U+Ca7/PVlm22n3b01c8Xw1C6lJnxHHfd9cBLEqqabz9CMRHffoA0pQZUXYKfJwhLqJJkMCFc7RL2snjqwfR9EEZeWwgr0sNivDvBltCyumJw0Mmul3ouPC7pNKbjQlAd0GRWNXRSytYeQzwJWNy5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ai81awGXgXiVVbp5ejcwCHhlCEeaLWUpNjS9u67JKOo=;
 b=GqOJyATKG2Reex/84bLAG9Zgu+KtT0j0ZkbcahHul0nBwPsjECE0UO6ebW9YONOCjBfcZRxaOVW+kktKbD4WOT0zS+OcEd7eorC4MCwyc9GVuw7Yelct86iv48dfqFgiyui1F0OktWDLcyaJFheeG3I4demwhgli47cBiuvsTRDQk5MIqt6OYWqbVuvrVeJmRatuRoO1HBMzeJKInOnC4AeIe4ragIMLOdIh2KgOAsPZfqo62OYe0qdmjK4chQZ+IOFYzjOBenXQlE2nY/XcThB/X9DbfIEAWnA8XJZ8nWX52soQPDBCDl/BqTWmjVa843+ab9VjCd/TVnG3fFmn8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ai81awGXgXiVVbp5ejcwCHhlCEeaLWUpNjS9u67JKOo=;
 b=Yi+ow27XCXu/IPmD6A+8gJvS/UQPEJuRD55p+NcVDFUKsr0269CmTPMXPorM2ppoloEGvbj9SshvXJpb87wLpTexsELWG7b639n6QmhoG48+eFWfJsdPbmxDGhX07+RTEFG7gmi1T9VNImS3Mv8qhjvQfuijUzBUUdRNqFDnTb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:20:37 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:37 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 13/23] target/riscv: Implement AIA mtopi, stopi,
 and vstopi CSRs
Date: Sat, 11 Dec 2021 09:49:07 +0530
Message-Id: <20211211041917.135345-14-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: 339dc0b0-ff39-49dc-4500-08d9bc5d951e
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB826860AE65D90246D4C8C7B58D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:250;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hs3oJzRWRbvBgseFpz10n00uHYJXElnH9MjWLEz7I+VKofSFWA+TwPIj11ifioHTA6u2j9Hf4s5S5XOuNzfQNTypdcukn2LTA5bG/akb03XqUMjOr+dqQR+JLdMcNPx9zqt7DD0A+VF004CP8ym266FJq3yYGDl6X/aec8YQYZ+1YxRPohZ+vtyStB7Quynp3j+1RMyVRI12DlRuXc3GrgbAALqE2mztExwLt/7f9eFuvBYZ9iKhX5h0XokQUKoyRsnhRSEnyajTWFSeS9ZCFL8+aM8Ut9+kQ7wSfWbWeLngQQ3Q6MeljU53Ob5/QUxvRcOvY65HlMjWFDzEbgPf6cjW3qNPjrC0H7XCcpEAlLfcLvXMx5vrIgHSXiASrJDkboizjIAJwApfXa7C9xgC22QqaYnWzgGSLIuT9+QTcQHocwMNBdq9GEHUU38XesEauHf3i6Mt+gEJ4KansYnRvhFdXm2nR6HwLwOej0JuEiKgsj/aMmt9fe+Qosrkx8N8EnrtV9a+VN2DOOFyRl3fKMvp9+vxmLVrWE6ltnz3u8/KX2bmcUj4iKIp5xleVLTuSFaPysEjzbLJHqLwFkUJc4Fn5AjzMaIHNJYnPBXCVI0E1ZjLeKhyiLhdDEWuDkDNFCE6JOTlg+yQ80VkrA/GKG3lLZPlfF4h65Et2IysFZPgAgkC69ybV7RGG1UXtxyAcK/fOgWOrUEigbxeENeKbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zMjur4F+K6dq65qq3tIy7zXjLa2NV8MMYXIe4x4A0F5JMa+3BmfsIIoyLF5V?=
 =?us-ascii?Q?BX9RDSmEua+4iYUaaK3LNtA5DBau3JPA90qgxSN6P+ziQaxJyn5LYumiczyk?=
 =?us-ascii?Q?KgezqmgmBB6Jyz+NY1d9elo2sBWIjkaaVvecwu8NZOLZR/vEQiZR6g6pngjW?=
 =?us-ascii?Q?MCYwf+L9fDaPzKJOheWofs+oOwbJdOKqMQNhtEutlEDp2+gagjDoHl/dwcvm?=
 =?us-ascii?Q?O37AvCxf1Ub7gsffJlSJ7S5aD4L8oPvEKzjnc6VfpjT20vaWKdFKidixJhAy?=
 =?us-ascii?Q?Zf+sBYnVMbZuJeaHMerR4iMpkBTQY02o0Ehjm2Xg4SYhAEPiCTBDGeaIzv/u?=
 =?us-ascii?Q?J3lS5wAovRMeXNm3LgouKMRP7xh1ujoE0GNjbzl8G2ZxiGAYIren+JMbKBLl?=
 =?us-ascii?Q?wAzDcjbefV4dmZqXf8GdcKGZo2HDk0mYxDSoELN21ItCYnE+1uKpWff4IEu6?=
 =?us-ascii?Q?Z7q73W5QbYEtu4JiasWPBBAkRVGWiS033Zj6zQdjSQjTDNFhHEN1Un3DtYZ7?=
 =?us-ascii?Q?LzbbQV3Avp57jLzBVM4qBLS8qmjUB5L4YIfpQgTAU1o48ammRfUDCaZfXxDZ?=
 =?us-ascii?Q?x2ZVBw2PYkug36QELdLs/427ghXbk78keVd3+PUYFHIyVLWleQ1MmyobtqgL?=
 =?us-ascii?Q?kv5nMBhwbEkN1T8J36ppofHzm+MGzWjinIOILvr97dBvxflpDBIHzzSPfSkX?=
 =?us-ascii?Q?6+ivVAuh2r3wXwRY/5tUB+fpQ0ODoTf5KlanDCz0pkzcW6ZedwE7q0QCcYjt?=
 =?us-ascii?Q?FaNfmvca3Z/TDEZF/UPFnXwvLcKHKjkK5c3In+EBZgVNWnQQr3/xPdz6r9Dq?=
 =?us-ascii?Q?LCosVW7vcEwRRXRRHlh7f+rGkemEqRY0Tcw0CyON+bJbxwcNn2aKBOX6wog3?=
 =?us-ascii?Q?ngwJz4ZAEc2I3Z0oTu/UbXg1tcr35JCS1h7FZeFYSuYzHGrxD63lXJ0klI9y?=
 =?us-ascii?Q?LUa4Qkl+SVVpQy34YVKIgZ9/Biry/ciaG7Kl6LBW3ILfW7nFNForANkTTXXR?=
 =?us-ascii?Q?jTjL18hqYG5u2N4rp70Eo6m6d1sX00WA3ilI3+dWFzPeBqXewr7n2KyVx3c8?=
 =?us-ascii?Q?4qC9zJTBHJqlHA0UKk//HS4J/hnpfWBqgR6EFFNRcNlbtkqdh1ORBSyFngrE?=
 =?us-ascii?Q?8dx3AC/Soa39+lMoqn2u3HQKWkUQoKbCz5gey3z7JODi5POarcbuWCgsrf1N?=
 =?us-ascii?Q?SSx2gLzVmlGUBkEUT6+s+yNFrJ+bZScHXPvpbPnNtQBTg1ZhGNT2KsXKpFyO?=
 =?us-ascii?Q?PAHtsp7MNcwk/Vm1YYqfjhYIqbognrTNw29tsChCQ2k9hbsaAk1gYreUNHu8?=
 =?us-ascii?Q?orfF/fR3C2rdkjW+avQMOT4HzGG+U8xaAGxaUySy/wW5m1p3wifc2ymwXZwS?=
 =?us-ascii?Q?RzOsjtu68Y1mbz4zC+Vqn9/+HpAdp/KFf7mf300k+FVlcfOLohuF6lqvIy2a?=
 =?us-ascii?Q?ib9aTWAN3nza3JOJVhRLuNwCqcJ6Fke3KgoeaNRZg/HgM0zW45nm0CCzRg6d?=
 =?us-ascii?Q?WGjG1LkjVcONsG52m9sUfMV8eNZ5cZQgQi8vZbXzRfVmiP7MUSQN2uo3KX11?=
 =?us-ascii?Q?SD/7wMZoXIwdTrfU+lVVN/wYIsTHJ4TNx2UaJuygUlvVqvTpeMFr2cqmiYbG?=
 =?us-ascii?Q?ZHbFAIU9zW5He3NB96gFZqE=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339dc0b0-ff39-49dc-4500-08d9bc5d951e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:37.0967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLQO97m7ctfQCojenV5/USHc1cv4b995pcLdXJf7OxfYJ1L9cAEOovRvvE0z/Dmt/SQf7ZUCSQqk2frgBeeR9A==
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:50 -0000

The AIA specification introduces new [m|s|vs]topi CSRs for
reporting pending local IRQ number and associated IRQ priority.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/csr.c | 155 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4b3edc1043..6f613d182d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -189,6 +189,15 @@ static int smode32(CPURISCVState *env, int csrno)
     return smode(env, csrno);
 }
 
+static int aia_smode(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return smode(env, csrno);
+}
+
 static int aia_smode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
@@ -833,6 +842,28 @@ static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
     return ret;
 }
 
+static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq;
+    uint8_t iprio;
+
+    irq = riscv_cpu_mirq_pending(env);
+    if (irq <= 0 || irq > 63) {
+       *val = 0;
+    } else {
+       iprio = env->miprio[irq];
+       if (!iprio) {
+           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_M) {
+               iprio = IPRIO_MMAXIPRIO;
+           }
+       }
+       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+       *val |= iprio;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -1362,6 +1393,121 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq, ret;
+    target_ulong topei;
+    uint64_t vseip, vsgein;
+    uint32_t iid, iprio, hviid, hviprio, gein;
+#define VSTOPI_NUM_SRCS 5
+    uint32_t s, scount = 0, siid[VSTOPI_NUM_SRCS], siprio[VSTOPI_NUM_SRCS];
+
+    gein = get_field(env->hstatus, HSTATUS_VGEIN);
+    hviid = get_field(env->hvictl, HVICTL_IID);
+    hviprio = get_field(env->hvictl, HVICTL_IPRIO);
+
+    if (gein) {
+        vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+        vseip = env->mie & (env->mip | vsgein) & MIP_VSEIP;
+        if (gein <= env->geilen && vseip) {
+            siid[scount] = IRQ_S_EXT;
+            siprio[scount] = IPRIO_MMAXIPRIO + 1;
+            if (env->aia_ireg_rmw_fn[PRV_S]) {
+                /*
+                 * Call machine specific IMSIC register emulation for
+                 * reading TOPEI.
+                 */
+                ret = env->aia_ireg_rmw_fn[PRV_S](
+                        env->aia_ireg_rmw_fn_arg[PRV_S],
+                        AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, PRV_S, true, gein,
+                                      riscv_cpu_mxl_bits(env)),
+                        &topei, 0, 0);
+                if (!ret && topei) {
+                    siprio[scount] = topei & IMSIC_TOPEI_IPRIO_MASK;
+                }
+            }
+            scount++;
+        }
+    } else {
+        if (hviid == IRQ_S_EXT && hviprio) {
+            siid[scount] = IRQ_S_EXT;
+            siprio[scount] = hviprio;
+            scount++;
+        }
+    }
+
+    if (env->hvictl & HVICTL_VTI) {
+        if (hviid != IRQ_S_EXT) {
+            siid[scount] = hviid;
+            siprio[scount] = hviprio;
+            scount++;
+        }
+    } else {
+        irq = riscv_cpu_vsirq_pending(env);
+        if (irq != IRQ_S_EXT && 0 < irq && irq <= 63) {
+           siid[scount] = irq;
+           siprio[scount] = env->hviprio[irq];
+           scount++;
+        }
+    }
+
+    iid = 0;
+    iprio = UINT_MAX;
+    for (s = 0; s < scount; s++) {
+        if (siprio[s] < iprio) {
+            iid = siid[s];
+            iprio = siprio[s];
+        }
+    }
+
+    if (iid) {
+        if (env->hvictl & HVICTL_IPRIOM) {
+            if (iprio > IPRIO_MMAXIPRIO) {
+                iprio = IPRIO_MMAXIPRIO;
+            }
+            if (!iprio) {
+                if (riscv_cpu_default_priority(iid) > IPRIO_DEFAULT_S) {
+                    iprio = IPRIO_MMAXIPRIO;
+                }
+            }
+        } else {
+            iprio = 1;
+        }
+    } else {
+        iprio = 0;
+    }
+
+    *val = (iid & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+    *val |= iprio;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_stopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq;
+    uint8_t iprio;
+
+    if (riscv_cpu_virt_enabled(env)) {
+        return read_vstopi(env, CSR_VSTOPI, val);
+    }
+
+    irq = riscv_cpu_sirq_pending(env);
+    if (irq <= 0 || irq > 63) {
+       *val = 0;
+    } else {
+       iprio = env->siprio[irq];
+       if (!iprio) {
+           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_S) {
+               iprio = IPRIO_MMAXIPRIO;
+           }
+       }
+       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+       *val |= iprio;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 /* Hypervisor Extensions */
 static RISCVException read_hstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
@@ -2358,6 +2504,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Machine-Level Interrupts (AIA) */
+    [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
+
     /* Virtual Interrupts for Supervisor Level (AIA) */
     [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
     [CSR_MVIP]       = { "mvip",  aia_any, read_zero, write_ignore },
@@ -2385,6 +2534,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
+    /* Supervisor-Level Interrupts (AIA) */
+    [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
+
     /* Supervisor-Level High-Half CSRs (AIA) */
     [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
     [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
@@ -2423,6 +2575,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
     [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
 
+    /* VS-Level Interrupts (H-extension with AIA) */
+    [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
+
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
     [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero, write_ignore },
-- 
2.25.1


