Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtsR-00065Y-Sg
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsQ-00061Y-FE; Fri, 10 Dec 2021 23:20:50 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:25453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsO-0001kd-3S; Fri, 10 Dec 2021 23:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196448; x=1670732448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=STRNeT6sDpE9GJ4Bosh++wA81WocT2uEDHjK46kw6xE=;
 b=evVXR0WFc2fxieSn9NZhadCSUhrzvY8XtGbRlrSOTlzH31juuL4djYrq
 ig+HzwVGT2IyYk9SEaV6/6o0u00YaJFgnItlQYKpzAcwnx4b9MosHGMIE
 UPs8mvpBE/5XKDBcSnDbmrZtNSo5ajlnLlNZdmbQ3PviW2pA6hAkTzXIv
 2LiaSCpU2FXQP6kZ/k6bf4oA2uIHqoGZAMRECk2s0bi/HGfHoHa072O7X
 nQvKM2dwKp45YqIqm8ELVHSXT0c/ZvXDKXniNFvxTjovIV4bsQoqZc3tJ
 cFGT+t6CkTm1UVDjxst+iUvi2UTLzPMZO7pH89X1gzvTL5iOSfEvUnrAi g==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="299834374"
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3KzWzPWHKDmVfSHXcrUB9KxWF9ecbCcBAcbUaYox49kgcx5fUDDubvmh2hNXsufjyh4Vk0LKaIhkh/BAvNvxEI/zk3Zid/xRS0YmGElyTC+m8o+WksYoNyS8th15v8gwzyZWgd/AyS1LduqmYVKJMUnTWXZE1OczOykSHZhtZKHq1La1cWTmPpXBJkVytVbhJRC+u2VG4e1U2YxqnHvJVJ5M4vgfeNludyopJizgQVURnvEd8q6OG2iN9Hrx2nOT4/TPCJKIiwUvJ8o1Zp6xTRDHBQxnSd9+1RuEmLeicaVSOznV2HtkbRKdlJk7quQmVMkIXxZNYxjuvZJyThanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lh8RHToU2fSiEsJl7X/FUk3VMxZRmSMQImkf+OaGg3k=;
 b=bCEiAv8YOGIzVDXQfuhIjTztfD1fp8VkL9YjhghXeLVSIjWXzuVIPoAZxEe5voHsoBy5pxH87qFWOWwJC8XTXmc04Sla7XU8Uxevi1RA78Zony3sfs/takaXaFPVXKG7Tcm7BWuV+wLvCAUd0FgXTmA4m7TsMvq9m9NDjag+TKp3E0B/jqXdv1ikFG0ICQjGlkZBvVzFtoA8sYwd+rEIUN8KAr2MwnGPR7t+SpB0nDNQchHfCZQb2WqCxfzVEBt9zH2I/8/TOlslEYEehPqWySeBHIExrNpCbw7utIwfpaLrbr0aTjHfO/QF8DxsGjQFevZOV24fAVEnh8RdxbvDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lh8RHToU2fSiEsJl7X/FUk3VMxZRmSMQImkf+OaGg3k=;
 b=S0SNLGSVMtIBcU8OG6GnzQYhTcdnT7lgcbrBTZgwgomhs4LAQ+BEbY3nPyQSvfSnTcA1rxtEAxU8tYyOLzqybWnS8w4aU/JYEJA5E3SxYL9HgIozE5d+Orj//+n2EXTtk3NrrEpK2/x3330oLKf3r6EnmH5UUfh1oqLa7ZAXsk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:20:40 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:40 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 14/23] target/riscv: Implement AIA xiselect and xireg CSRs
Date: Sat, 11 Dec 2021 09:49:08 +0530
Message-Id: <20211211041917.135345-15-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: 96b6e0cf-eb60-4f06-7748-08d9bc5d970e
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB82683AA4F9A50030F76C6BEB8D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uBBLT6ZP7oS3ZOp/zVbCkLXP0gOslP0r5Pj2qb+VWnCOraSSrgUAKfTounGMEdFYiJOl76CfEq0wuw71n8YNoIkkjqq7nquI4icaD56mN7a3MniQUkDBeSQdMVa8hRdYAFrJaCAAS6EQ4URXuSDQGCF2YQLIk1asmreatkyQ7zTuuwraXDk/ed9u7YgtSCeUKrPAZuQZleEVaLMVx+b28N+QgIAeVOKC2lolEi19sGHOGgw5UkGyZEprodzL+hrCm3VPq9D4Djd93fPiNJXHt/v8tZXG5+TJ66ogUoGpgCbpfJSxbTTmLXTjhSbOKrzRfJWHN0o3PwCfX6wPL89vkmNseVU940TBTKkLJIziIM8gGRHZcG/4i8H8HmvGWf82M1+OJJTdoaf0uEKQhuEGaSJmcMsl+E0dDqKrSUZaS3wqYWCcF9JZ2JRI+1zyasp3StzhizybuLY+2xaHOAnnhaxMzqvgu51QvqnzInXat+vcDQxR9UREGUlf0d3Skd2B61wgN2X9oNTx34I6jNWDfl8J/jRCaXA0Qq3dkBVpg5t24qO6vzcQpwT80niUi22yHJgCYaBIw3CpUZAQIkZKa3hxyXoXCjE5HK9WsuLr68I58TdhNQg7+h2vZ0AQQOWLWibSbZmATvfMzuidm+4HlAkwEdzweuPSauDWeRFZmprf8py6tzAXRsBrUmoF7MvK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dXl0NF8T/uanX/HS5X+Ko2hEcHBcklETFtZ5KUi4dmeUFOv/03c4YYEGXJ/4?=
 =?us-ascii?Q?s8oXNyNDw4gLydKvyGn31hnm2weiSAAHT7NfulendqxGWk7mMUYppKRDHAzm?=
 =?us-ascii?Q?Tq9X3lvk78nn0jZtpx3UVG9ycGxd6bx2KaiJHt1gPDwpM9mfSAgdl0SdM82n?=
 =?us-ascii?Q?KqcCJ4mQqRh1OAVyQSLYFJI/7vNtq85Tw/JHcrLYNq1x0zMf5SU2vaBAVEm7?=
 =?us-ascii?Q?ES+Ue+EB6f6MMa1wAYuO6bFmBFUwW1Xndp870K/nP0rj29zw94gzeomS46e8?=
 =?us-ascii?Q?YI3u/9/hT/dDa1IiB3V3h4Orz0w2xRFBlHtQ3dync8FLCEhOMdVwMKZVVPwz?=
 =?us-ascii?Q?KyJiGBUZ3l863hFkovl3MDR8vhmk0pSEaSrYW7/qcvKbprl34mSEB6WJCzVX?=
 =?us-ascii?Q?CYSTGGK5AABHf+t2eAS1+kuJeS1lE/GpVEqPD5hVY7YWK3vp7KEMMxq1O8IF?=
 =?us-ascii?Q?06MBxQXPCBhscc75Rfs25F8S4Hqh8Ai3qdrYHiJb8oxSwuVFF5hERrr8Ulka?=
 =?us-ascii?Q?+UINegrhOTEHxDwZj07BCcE5s+5Zq3YMFCrbfSuKVm/XzauZt2X9sExZ7vSo?=
 =?us-ascii?Q?u6/tPfYqNji/TTaIJYS5mBeHtaS0LLA6mJbCHtVszRa0hg8rSaolQYFQqL+r?=
 =?us-ascii?Q?azaom4WstLa9UaYNW7uQH9ZejnZwm7mqkpKnwNWx5RrpqW01MVhgmpaguGYM?=
 =?us-ascii?Q?YraevhLM6Of8tCs45dW9LiRM55nY3sDDW568NcwZltYtRyK8FBVEPPVmKhqx?=
 =?us-ascii?Q?ajxK37Go5PYyh8bzI6p1vavaiWG27DCseSsuIV4M3EcUBHUYkAUuQsnvLC9o?=
 =?us-ascii?Q?heilKRMJ0J6inVc/CQmm1MWUVBYINqeUqtUJ5s1JtIIg55nWBIqIyCEhNb6c?=
 =?us-ascii?Q?Ok/vtk1LVFjbu6Q7cVhCAriDBflLuv81+nsRCotoie3L7HH2LSeet80oKCWc?=
 =?us-ascii?Q?z1YI2Vxjv0hGz7AT8geUAtG4dh7ejY8DRcch2cUPDPAkVtKacDGDsV+Yttzx?=
 =?us-ascii?Q?5/SJioSbctvNeUyMV/H0SEZoHstEg7Gb8UsBClV1jo3wTBB49bGeB826i6zP?=
 =?us-ascii?Q?m1OFrjrVYu0sFuI5kDPM+abYYhLhWWc2TJpcJziZmeGDoV3lBmXK6orTRhGm?=
 =?us-ascii?Q?fPaD9CTdwrpu8mb94Q2u/j/TdWCp3W88ZJT6q9qaGZqJwhriqOddMvAf3TCG?=
 =?us-ascii?Q?MIg+CbXY9BWSaSwLOtiGJ0Ajzu/Jn1O79lWLQx/NdGCYofe8TS0OgRJP9BHa?=
 =?us-ascii?Q?yN70gEwuQ1FmUE8NnHoT0hW/oMlnEHNqWO/BkxzhjwLeVRbTv3AbQqElHxHe?=
 =?us-ascii?Q?I0qw9ejkxV7YLT+uo7o/uaDERD2rPlMIcy/eChet/8WFfNWhdCXj9F5Y6/vO?=
 =?us-ascii?Q?3Z/jlrgOjbKzv22khOY1avuGCNJk8CFtW73JyHgLWpmiLe2fvbmOywPy2Xqu?=
 =?us-ascii?Q?LOTjZC4wHlDIlYjlBjnPb8tWpc9yKY03qSDDNGZcqqf5xRup6YKRmfuvB6ph?=
 =?us-ascii?Q?Thr30U1m77RUsZ89Mw3u0pXb8dQd8/5xWpRM7RCsgHh+vE6L6+vCCZQyN6vo?=
 =?us-ascii?Q?27oC/HoPCIamjk87lsAVy0Gu/szQSh/25nhLTBoBSO+m/DylMJ7Zlm+0GzgE?=
 =?us-ascii?Q?ElUju+Tu3aSgob39YvExPRQ=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b6e0cf-eb60-4f06-7748-08d9bc5d970e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:40.5517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 438loQfiTg/sE0jlUArnTrxhrMlr9iJmEG/xrSvgU6LqWAu+Iy5GqC57oSgvhAiB6Nf3SIGBExyAKo8GDw1Fhw==
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

The AIA specification defines [m|s|vs]iselect and [m|s|vs]ireg CSRs
which allow indirect access to interrupt priority arrays and per-HART
IMSIC registers. This patch implements AIA xiselect and xireg CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.h     |   7 ++
 target/riscv/csr.c     | 175 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c |   3 +
 3 files changed, 185 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c6b9cc0f2a..a43e38dd2e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -184,6 +184,10 @@ struct CPURISCVState {
     uint8_t miprio[64];
     uint8_t siprio[64];
 
+    /* AIA CSRs */
+    target_ulong miselect;
+    target_ulong siselect;
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -213,6 +217,9 @@ struct CPURISCVState {
     target_ulong vstval;
     target_ulong vsatp;
 
+    /* AIA VS-mode CSRs */
+    target_ulong vsiselect;
+
     target_ulong mtval2;
     target_ulong mtinst;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6f613d182d..a8d169e6f4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -864,6 +864,169 @@ static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
     return RISCV_EXCP_NONE;
 }
 
+static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_virt_enabled(env)) {
+        return csrno;
+    }
+
+    switch (csrno) {
+    case CSR_SISELECT:
+        return CSR_VSISELECT;
+    case CSR_SIREG:
+        return CSR_VSIREG;
+    default:
+        return csrno;
+    };
+}
+
+static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
+                        target_ulong new_val, target_ulong wr_mask)
+{
+    target_ulong *iselect;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Find the iselect CSR based on CSR number */
+    switch (csrno) {
+    case CSR_MISELECT:
+        iselect = &env->miselect;
+        break;
+    case CSR_SISELECT:
+        iselect = &env->siselect;
+        break;
+    case CSR_VSISELECT:
+        iselect = &env->vsiselect;
+        break;
+    default:
+         return RISCV_EXCP_ILLEGAL_INST;
+    };
+
+    if (val) {
+        *val = *iselect;
+    }
+
+    wr_mask &= ISELECT_MASK;
+    if (wr_mask) {
+        *iselect = (*iselect & ~wr_mask) | (new_val & wr_mask);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static int rmw_iprio(target_ulong xlen,
+                     target_ulong iselect, uint8_t *iprio,
+                     target_ulong *val, target_ulong new_val,
+                     target_ulong wr_mask, int ext_irq_no)
+{
+    int i, firq, nirqs;
+    target_ulong old_val;
+
+    if (iselect < ISELECT_IPRIO0 || ISELECT_IPRIO15 < iselect) {
+        return -EINVAL;
+    }
+    if (xlen != 32 && iselect & 0x1) {
+        return -EINVAL;
+    }
+
+    nirqs = 4 * (xlen / 32);
+    firq = ((iselect - ISELECT_IPRIO0) / (xlen / 32)) * (nirqs);
+
+    old_val = 0;
+    for (i = 0; i < nirqs; i++) {
+        old_val |= ((target_ulong)iprio[firq + i]) << (IPRIO_IRQ_BITS * i);
+    }
+
+    if (val) {
+        *val = old_val;
+    }
+
+    if (wr_mask) {
+        new_val = (old_val & ~wr_mask) | (new_val & wr_mask);
+        for (i = 0; i < nirqs; i++) {
+            /*
+             * M-level and S-level external IRQ priority always read-only
+             * zero. This means default priority order is always preferred
+             * for M-level and S-level external IRQs.
+             */
+            if ((firq + i) == ext_irq_no) {
+                continue;
+            }
+            iprio[firq + i] = (new_val >> (IPRIO_IRQ_BITS * i)) & 0xff;
+        }
+    }
+
+    return 0;
+}
+
+static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
+                     target_ulong new_val, target_ulong wr_mask)
+{
+    bool virt;
+    uint8_t *iprio;
+    int ret = -EINVAL;
+    target_ulong priv, isel, vgein;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt = false;
+    switch (csrno) {
+    case CSR_MIREG:
+        iprio = env->miprio;
+        isel = env->miselect;
+        priv = PRV_M;
+        break;
+    case CSR_SIREG:
+        iprio = env->siprio;
+        isel = env->siselect;
+        priv = PRV_S;
+        break;
+    case CSR_VSIREG:
+        iprio = env->hviprio;
+        isel = env->vsiselect;
+        priv = PRV_S;
+        virt = true;
+        break;
+    default:
+         goto done;
+    };
+
+    /* Find the selected guest interrupt file */
+    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+
+    if (ISELECT_IPRIO0 <= isel && isel <= ISELECT_IPRIO15) {
+        /* Local interrupt priority registers not available for VS-mode */
+        if (!virt) {
+            ret = rmw_iprio(riscv_cpu_mxl_bits(env),
+                            isel, iprio, val, new_val, wr_mask,
+                            (priv == PRV_M) ? IRQ_M_EXT : IRQ_S_EXT);
+        }
+    } else if (ISELECT_IMSIC_FIRST <= isel && isel <= ISELECT_IMSIC_LAST) {
+        /* IMSIC registers only available when machine implements it. */
+        if (env->aia_ireg_rmw_fn[priv]) {
+            /* Selected guest interrupt file should not be zero */
+            if (virt && (!vgein || env->geilen < vgein)) {
+                goto done;
+            }
+            /* Call machine specific IMSIC register emulation */
+            ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
+                                    AIA_MAKE_IREG(isel, priv, virt, vgein,
+                                                  riscv_cpu_mxl_bits(env)),
+                                    val, new_val, wr_mask);
+        }
+    }
+
+done:
+    if (ret) {
+        return (riscv_cpu_virt_enabled(env) && virt) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -2504,6 +2667,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_MISELECT] = { "miselect", aia_any,   NULL, NULL,    rmw_xiselect },
+    [CSR_MIREG]    = { "mireg",    aia_any,   NULL, NULL,    rmw_xireg },
+
     /* Machine-Level Interrupts (AIA) */
     [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
 
@@ -2534,6 +2701,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
+    /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_SISELECT]   = { "siselect",   aia_smode, NULL, NULL, rmw_xiselect },
+    [CSR_SIREG]      = { "sireg",      aia_smode, NULL, NULL, rmw_xireg },
+
     /* Supervisor-Level Interrupts (AIA) */
     [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
 
@@ -2575,6 +2746,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
     [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
 
+    /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
+    [CSR_VSISELECT]   = { "vsiselect",   aia_hmode, NULL, NULL,      rmw_xiselect },
+    [CSR_VSIREG]      = { "vsireg",      aia_hmode, NULL, NULL,      rmw_xireg },
+
     /* VS-Level Interrupts (H-extension with AIA) */
     [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index f027d5e307..376a02a36f 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -103,6 +103,7 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.vscause, RISCVCPU),
         VMSTATE_UINTTL(env.vstval, RISCVCPU),
         VMSTATE_UINTTL(env.vsatp, RISCVCPU),
+        VMSTATE_UINTTL(env.vsiselect, RISCVCPU),
 
         VMSTATE_UINTTL(env.mtval2, RISCVCPU),
         VMSTATE_UINTTL(env.mtinst, RISCVCPU),
@@ -210,6 +211,8 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mepc, RISCVCPU),
         VMSTATE_UINTTL(env.mcause, RISCVCPU),
         VMSTATE_UINTTL(env.mtval, RISCVCPU),
+        VMSTATE_UINTTL(env.miselect, RISCVCPU),
+        VMSTATE_UINTTL(env.siselect, RISCVCPU),
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
-- 
2.25.1


