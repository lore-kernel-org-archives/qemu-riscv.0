Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtsF-0005TD-8A
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsC-0005KM-UX; Fri, 10 Dec 2021 23:20:36 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:25426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsA-0001jP-Kz; Fri, 10 Dec 2021 23:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196434; x=1670732434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=24EAMZxpMI6FmsUZDTP9hMEtQYI4pjAkDb7oRtKs0B8=;
 b=ciWZnM6RUVNk6sqWwjnUqElt4cqsQKdybIKmf38hWV1QNy/a9Rttduno
 RVSLkkCRjiWtaG9MrxxTjTEhfcvuLrW6fMJNM96h6a0sIHJrPPQVzMias
 hOZcH7sOsQhk9uAu2pBsRO2tPXzO4ws0JKx3tOc+Mf162PF60hFNv6OrV
 Hb/daBXW3XuOX0UEPDze2p4+S0Kq48vCbVIAumNFjlWewXwLhn0HvBtpI
 e2ga9ZdPEyQuYyz9XoLfN7aHtzNdBtbtj1pFF1j1yVHrlDNV485KMfmjd
 Dd+9SxDuHMEGbHt+gQymxF39vZ0+yySQc/BIYUuKaeQh/UL49W7oxJv5h g==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="299834358"
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCbbR5E5PDlhuEilXyNaPQdxvqjrxa3FqAxA+KAKD4qV/YgCzVLePW7+9eDbaVr1nAlNHbw7v+alGsKvKypJJF5PD1wQ6AAG12bWEWxkZrwabVGoJS16qTjTDydGFVfmANpLpn6dEg+us6HsPK9Ck/W9oBH3kZns+ox2Daa3U6SRVH4sKU5h/cPdDaQfr/2EPoCkWvTDg3HK+IAv/JwV/0dcjaW2+NrpK6ZgkBddALapVup82WdRJvRERqogQyD0W0+tsixW3vKHQWqzoyuGEKLjLfPYnqiR+70Y+OyI5WTO+PJI4K6kPKzwPv+Ajc7jiKYOsrBrV54NLllmMp9/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJYBpE68Y8N/1t5nC3n0imz30Bef72KhKiqO8RBIJiM=;
 b=nSRUYchxH4MydhIDQs9kQYEp8Bl9zHBtLosSuqSHUCmc7+bYy9w7/73EvBljSPqYQ6MmIgQsadvyfvATo0FlAkPzwFsYkk3wi0TvYYSzSgXVosa1uNyZl+KglnVu2tUqvxSftib6EgBsRaiyIAO8RuKnQwdaq0ujPbhMOlz9bflRLdP0x5Rygmk8ctUBXQwkeTmA3A7vrVkILD7prcvvBF18fgspEHea0hkHKY/7ARfN/fi8KtlxJUZ4S1fz3+DhmeD93T8SPVbbJbgc/BnTdIJ0/LHddJi+khllrmr+VFAx/fqtAFxUnS3ZdUJj0dD5y58Wh7uLewA+l0MFqVYQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJYBpE68Y8N/1t5nC3n0imz30Bef72KhKiqO8RBIJiM=;
 b=lx6Oxz3IXKzoIbSsi7jcGUISgj3ojGAKVeLD/g9dSY/UWrcVw+jTyYRLcQWoyA45fznJKuXoJFCUAo3IpnwiyhhLJuJ1Gq6cLArb6yaTNMqMxxxRT46bHs2dWHcZWp+s1OcdupgPziSuvZUWthqG4eVbF5Zc8R1BmtB5+AloYas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:20:30 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:30 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 11/23] target/riscv: Implement AIA hvictl and hviprioX CSRs
Date: Sat, 11 Dec 2021 09:49:05 +0530
Message-Id: <20211211041917.135345-12-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7c153188-0151-4e31-b625-08d9bc5d9153
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB8268D4981F28275B1D332FF38D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3bLWnljQbIDGpTbNOSbSHN1gyMsEc0WGgeMiMiRW0cC+WH1OsO9f5RVDnWdAICgZFDYboVn2YpbnpoGcX8GVdHft+YZxjOMVLpgws/iint2qA5kRrjGlSWSFc+414FIP9nvtDvh0qgttlb0j31yqq/QqHqGNeaH98/ZaRXN1DVjY9LqGfnHJ+lwwQj8FXsuCL6RrDAiLWX3kJoG4ZZD00KV9FF8sZIttVBQyWlwFzf0Mj+TXPltUnB1R89S/qiowV/wNywC1vWxLOs3WEsh9a0JunJsdaoFdDDpUGc+QOB1/LvdovYK4P+wuQqeVYtzLb/7hD8anUlOKbsqtVXcV0wTPET70mwlFvateRhWfhGQbOmQhMFm/9iFsgJy23BA+Mf80mobkUhCxGyf8nU/GYiqu2wqfO/HP33itBfTRK8Ddv/jb2PTcvghOlANHOV66iZ9+XuWhkbT8aamy14eA4GAI3RsjTbihi0en32C6hEz8ds8/0V65cYcDNuauaGaSMAgn81E9lVtZQXHzSd+t1PyFD1/FmFfeli2xfPs07Vy/PowCjKmn2lTr2c38vdfOEJkEFTjn4Iazs4PXfbNJTHXQIJ1a1TKlqNOwNE4UXgGC1jM0y5K9MXYGVrF7B/Yxptmb8nmBdFXkLJ8ao1rhcnJWszLikTTgAENhq6r4UKYD4PwFDItACvPeZFx4MsgN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?htvid00M/wet1x+TsoOBFTS37S/oov9g0iNLhynVy8OX6/Ev6QAIDmUXXD8g?=
 =?us-ascii?Q?IASOq2s5HQWqqw5Aa0AKJu1uzGayPl5tHHHmsF9gx8wGznvoZsoemdaNgCYh?=
 =?us-ascii?Q?u30WYZBqg4mrNNJt4wR6Y0XIyRJhepJAI5UdZp5CPgx1je6rkxBSai80ckTP?=
 =?us-ascii?Q?pp1aN/sgtW2hkbzKF2F2R8gGy4FQPBzWGR1SHa5o+OODXtnbRTRGcZFBzdAq?=
 =?us-ascii?Q?3QCHqATPqlh4iYtkoiHcA1Q5VaLPpRyfT9/IZNMSFEAz5Df/8rl2QyDiijQf?=
 =?us-ascii?Q?FA7LkEn4uKQRo6zDWUFxBWgFiqvvjI/FcwhB7c1sHPmM+c/3acVMZ2tmfnDI?=
 =?us-ascii?Q?hHJjYBDYvWvFFoHGx5uMmN+DM3Dv//oWqpn0lT/LmggN8twmweclcljUsMRC?=
 =?us-ascii?Q?XetsxcOyZ/+haSDjULsgdvrEr1eRW9Kg31duATO+578JDUHrBZcOaUUcgfFv?=
 =?us-ascii?Q?FJeCmwCIIZgtAcc6Gpf0gZxoZanrhiXGK/4+b1YUYZ3V03MZfqE3jLpSWXkc?=
 =?us-ascii?Q?ciRmxvcCYZ84zEiYWdj+h7IdPMmFScck3clEojsbAzqhc29yW21QeAHI9Rty?=
 =?us-ascii?Q?gAkKmb108YyIrSiqwidERUheJsyx30GvRLsn+jFWaXRCLI15fNjG5jHASeHF?=
 =?us-ascii?Q?KJdUXB1yI7Bmg0PpDrnofFCiu9pVSOtcp+hD26Gnko6s3otDrIzvwqx2piWu?=
 =?us-ascii?Q?2tVDeF1m2ZDp3jEVij2SW7RZ7EljLaSgZeTaaOAGbNYxigKRCWhvLHmYDj5F?=
 =?us-ascii?Q?b7UxxXgYC/BrKjp8z2ahrSc5XgXuml6cbHj6nVKvdsPcqiy/7VxbVF81mLge?=
 =?us-ascii?Q?S1o1CU32PgEKiXUPK4rSWC6U2nO0tn5JI9BmvDl2dS5CqnWsyP+7yrFJUQHQ?=
 =?us-ascii?Q?93hytlS2sIyb9K390SBqEZ3HHXUutmt4SJevFUtUcAyH+khQLhkU+DGNdUsr?=
 =?us-ascii?Q?W0GhY50LhP99RCqaYo+vXE7rn9MH16IGZeoawXSZXj8gJ7RkB5VOY/7QNmc1?=
 =?us-ascii?Q?RpAvPzggSwU9E5p7gvoLWIY36IzPoY81ajfxaymAWK4PNNf4xMI7JLZchp6q?=
 =?us-ascii?Q?uaCuNOHIxNutNpqFRMwm+eY/mfp0mjX/48LGhWeK76YqNJz+kHo6EVC9BISH?=
 =?us-ascii?Q?t1EHrRQtEuKvd1yogtRWjMe6RSL2s4EguKIzw6qhKYefhd+7tQP4Jt1W7mB3?=
 =?us-ascii?Q?2q1bnPtM33FnyX7CPDnfZ8WZjAS8pPQ9ftAYDEZiafw17vgANUe55vlALK2C?=
 =?us-ascii?Q?mo2qdLrIeGmQhtcWxXYuNdQyu6WSmfeuU3TllACq3+p7tuak9vE3FAS/V8p8?=
 =?us-ascii?Q?lRmU2RJD8pmiSzR6S0HvTdLnd4Uev9sxPPvUYdGN1eCkxXuDe/A8zCaejC2p?=
 =?us-ascii?Q?V1mfZhxqmFm4jfilJjCScnFjShIwU9oWYUNkU1yBgOr2IQzX/KXQeyOh4+a3?=
 =?us-ascii?Q?kmu4vTgNkXk+LDX0pgIjckVCTzT7uPnQ3+wwSm1YoMXXZ8PGV66q+0Rj/5sG?=
 =?us-ascii?Q?4GsVTeR1DTk8umzyrCKBPJbHsa9QZpp/fln6GqhffraeON0JgsLQjXbX4O+m?=
 =?us-ascii?Q?u4hfaAfDEy0LXqOUVtl+hLNIw/PD8o9Pz347DlzC7fuKLxrzRnGukP+Vhn9L?=
 =?us-ascii?Q?HUi/yTjCjVdj1a+wiaHucQg=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c153188-0151-4e31-b625-08d9bc5d9153
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:30.7204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4Lp7YWGU8THjLX9xMJj8clYXX5fZLpZXQ7EnvPLyKeqZHFLCXyb3uK3UrdtgfbVMOfRWWG42g6yHSUagDWW6g==
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:37 -0000

The AIA hvictl and hviprioX CSRs allow hypervisor to control
interrupts visible at VS-level. This patch implements AIA hvictl
and hviprioX CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.h     |   2 +
 target/riscv/csr.c     | 126 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c |   2 +
 3 files changed, 130 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8b14fac9a9..c6b9cc0f2a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -197,6 +197,7 @@ struct CPURISCVState {
     uint64_t htimedelta;
 
     /* Hypervisor controlled virtual interrupt priorities */
+    target_ulong hvictl;
     uint8_t hviprio[64];
 
     /* Virtual CSRs */
@@ -465,6 +466,7 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
     return env->misa_mxl;
 }
 #endif
+#define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
 
 /*
  * A simplification for VLMAX
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d9bb5ff649..968a65bbd2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -229,6 +229,15 @@ static RISCVException pointer_masking(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
+static int aia_hmode(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+     }
+
+     return hmode(env, csrno);
+}
+
 static int aia_hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
@@ -1041,6 +1050,9 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
     uint64_t mask = env->mideleg & S_MODE_INTERRUPTS;
 
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         ret = rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
     } else {
         ret = rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
@@ -1239,6 +1251,9 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
     uint64_t mask = env->mideleg & sip_writable_mask;
 
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         ret = rmw_vsip64(env, CSR_VSIP, ret_val, new_val, wr_mask);
     } else {
         ret = rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
@@ -1625,6 +1640,110 @@ static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static int read_hvictl(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->hvictl;
+    return RISCV_EXCP_NONE;
+}
+
+static int write_hvictl(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->hvictl = val & HVICTL_VALID_MASK;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_hvipriox(CPURISCVState *env, int first_index,
+                         uint8_t *iprio, target_ulong *val)
+{
+    int i, irq, rdzero, num_irqs = 4 * (riscv_cpu_mxl_bits(env) / 32);
+
+    /* First index has to be multiple of numbe of irqs per register */
+    if (first_index % num_irqs) {
+        return (riscv_cpu_virt_enabled(env)) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    /* Fill-up return value */
+    *val = 0;
+    for (i = 0; i < num_irqs; i++) {
+        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero)) {
+            continue;
+        }
+        if (rdzero) {
+            continue;
+        }
+        *val |= ((target_ulong)iprio[irq]) << (i * 8);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static int write_hvipriox(CPURISCVState *env, int first_index,
+                          uint8_t *iprio, target_ulong val)
+{
+    int i, irq, rdzero, num_irqs = 4 * (riscv_cpu_mxl_bits(env) / 32);
+
+    /* First index has to be multiple of numbe of irqs per register */
+    if (first_index % num_irqs) {
+        return (riscv_cpu_virt_enabled(env)) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    /* Fill-up priority arrary */
+    for (i = 0; i < num_irqs; i++) {
+        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero)) {
+            continue;
+        }
+        if (rdzero) {
+            iprio[irq] = 0;
+        } else {
+            iprio[irq] = (val >> (i * 8)) & 0xff;
+        }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static int read_hviprio1(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 0, env->hviprio, val);
+}
+
+static int write_hviprio1(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 0, env->hviprio, val);
+}
+
+static int read_hviprio1h(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 4, env->hviprio, val);
+}
+
+static int write_hviprio1h(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 4, env->hviprio, val);
+}
+
+static int read_hviprio2(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 8, env->hviprio, val);
+}
+
+static int write_hviprio2(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 8, env->hviprio, val);
+}
+
+static int read_hviprio2h(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 12, env->hviprio, val);
+}
+
+static int write_hviprio2h(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 12, env->hviprio, val);
+}
+
 /* Virtual CSR Registers */
 static RISCVException read_vsstatus(CPURISCVState *env, int csrno,
                                     target_ulong *val)
@@ -2277,9 +2396,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,      write_mtval2      },
     [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
 
+    /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+    [CSR_HVICTL]      = { "hvictl",      aia_hmode, read_hvictl, write_hvictl },
+    [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
+    [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
+
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
     [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL, rmw_hviph },
+    [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h, write_hviprio1h },
+    [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h, write_hviprio2h },
     [CSR_VSIEH]       = { "vsieh",       aia_hmode32, NULL, NULL, rmw_vsieh },
     [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 44dca84ded..f027d5e307 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -92,6 +92,8 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.hgeie, RISCVCPU),
         VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
+
+        VMSTATE_UINTTL(env.hvictl, RISCVCPU),
         VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
 
         VMSTATE_UINT64(env.vsstatus, RISCVCPU),
-- 
2.25.1


