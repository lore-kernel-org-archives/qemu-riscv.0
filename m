Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meCge-0001uR-Lv
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgd-0001uC-7Y; Sat, 23 Oct 2021 04:47:31 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:9749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCga-0006sl-Cv; Sat, 23 Oct 2021 04:47:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978847; x=1666514847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LZY9aIog688ACRn9v1sFVo0EZJ0feFHY9C5xQBrGttQ=;
 b=DsZjY7PMHzPdWsjrdb4h35sdXAZ8V6qMM9Wld8Li76qWJVeZzQw2z6oG
 m61QH1uD0drlkdW9zpCnq3RBWelg40VmznQFBzpL4H5FhO9xZYcCAQSYW
 W/MCz01lzfYVZvae51FOZNbMUAe6KkxS8R9/L2xEMh8Q16HmYb0PgFllE
 5Vs1V5Sx3RupshdC4P5k23s34VpWt03NgCMT08NZdq+pWdnJ5tzoPAX1z
 qonqZD+B+WN2CwregG6qtuuIB9lzp8bkOJAyg7+m/u4aN/3vFwKfEBjP5
 h09/Bz4Xp+Tz+PrYroXgGhrRYisOnA4QjOJ/Wo/VVGM6wjh2qfeepY8Kz w==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="183665040"
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:47:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rrd0PGOWbjRcj8edUrHjIZNX4aMPHKutsTBG5/u9u1y9eonRZnvnl9f7vQsgX9Mw+IZR2YiAKxG8gk6JoEmZPmnm+OUEL1wmeZLRjmRYGl1fJwLr0v+sGt0VpJ0QYtYqfl8+zFjI7+r8wPiTyR1SPRsDVg3BETTAzOAm9ksTo7pdKCtEPytjsUQbSSVVR84ElDwE4jetgmLQG1+iOINsmPgATa9CeM33pQE+yvLA5oQkcCyc1eC3D4m+Hh/PNS0V6o0cPXTpjp54KbmB2jhWwYsyENail7BSX6StKANEMRWGznej4qm2RlknkCbBD6yhegS7ELrd+ozdNBuLXV/aYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pasaDxUrDGGL+adGOjziWJyX9WXrc8eQxAiAYer2fwo=;
 b=LOpT0C0LSlasfRuoUyJuRBONXawM3+eTO3hxdkXjtubZh4PMTkDKLr4MNPaKgt+LUaMYWVJrE/zDGVTZWzsjc5v6sc1iuuJRrsUHEmqmnOMZGXxv7NYEu3W1Q2SzW+uaxOrXru15T0T/ws3nOmuDcU8gqomIpk/DFzuWYYQpMUv+hWv03VimLXaeR3jnEGH91FFPPmelyNSmNsCYBe1UAMeDYM5UNJu97taQ6KJEpli9VSZniw3WI+vszqK13jc7l7cdSlUnG0hWXnahgVhmNKPWj8TTqIqnPEy30pHMESzELVSsXOqjKwkNlHOutxe9vvfvP+YeIcK5HuUcFMP2dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pasaDxUrDGGL+adGOjziWJyX9WXrc8eQxAiAYer2fwo=;
 b=tfP1/Uuu4UXuUes+HB7W9MXkFiQFL7b3+UW6OEN1RIHzWAOWf2Ggh/T/MVbjiFbg/SpiLJG7U6qC6OF6RZtTzXL8T17buV8vvqGRNCrlIWnul1fEtnX5a7BuPHmvLsONvRsa2HQ6lRdguzwGkT19wgSfxzOQFJIasAox+28P3SE=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8345.namprd04.prod.outlook.com (2603:10b6:303:134::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Sat, 23 Oct
 2021 08:47:23 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:47:23 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 01/22] target/riscv: Fix trap cause for RV32 HS-mode CSR
 access from RV64 HS-mode
Date: Sat, 23 Oct 2021 14:16:17 +0530
Message-Id: <20211023084638.1697057-2-anup.patel@wdc.com>
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
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:47:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d1c86f6-6eec-4086-9020-08d99601bb4c
X-MS-TrafficTypeDiagnostic: CO6PR04MB8345:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8345C4DEEF00B2751C8EC83B8D819@CO6PR04MB8345.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CDgwonXXO2McotUkMNu0Mp/nKb1NJssE7kdPiHt6BaJt82uznx9uycHH7QLjoB0AUbmPJxf9B6tjM4az4ZCO7gvH5rS9milL5cpDmu6MRYrqt+9GNpnpTgJV7qGzvQq+bm6cYYAXk1UDPMboBmuloNPnfYHqknKI5zix083Vd4ODSiXrJkYd86+19Ol/azskzopKASukBZTTt5eAS5Cuy8OsexA2ZX+kmrpjk/6tsE2B+mJnSnNktYnZ6jHvgMsGEg6JwTZ7LZUMInQ0z9SQeTh6xuyVcX5a31sZdw1gOVxdBlQ3hJJ+5pvb4KVwCQycDVMuO5h6nmXhWl1IhxE+vL5Dj1SyR6j5eq19YR3QDvupRpMDkwdPxiiRK591iv9/H3zxOKP93Wq+pSnurB99jZpWO58Pfab/BTVB1JnFUT4HaPvuX6sTiGWVrZTny+cnTMpsaErIYQjvm0J3dFFWFHS5QJA6Gn6VntaYmFPuyWyR6w7t3QhuzM7ec1+Cq98zCJ5rN/i1iu86M9Znb+jtkxkIKOUh86M/fpqF5gakrklunLzppIdscj5qjZ0R6q+iqGr2j2Wuj6BLIImqTNUN3bqUtbTNcJTubQ8CGyu90sTYXdHHRhXBsK4Pj5US9qZjq0ergIQgg5voW/gkc8zVf+Ce2pW3qj1GuR1499o52ToIJ43jnuMUYPnFPMaU8NnlKCOrgwgjMyICRYiWbp4+0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(2906002)(1076003)(55016002)(52116002)(4744005)(316002)(6666004)(2616005)(4326008)(38350700002)(5660300002)(38100700002)(83380400001)(956004)(82960400001)(508600001)(110136005)(26005)(54906003)(66946007)(44832011)(86362001)(8936002)(66556008)(66476007)(36756003)(186003)(8676002)(8886007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6W9ysVD/wfRFrFipwKwBG49WElfihvsHmUq+Jw5+i15yldHh+8OQd/QoC9e+?=
 =?us-ascii?Q?2Lht2jBoN8VjEpwrQHA3uYBZ2+6DhFbIgHFxIHLOSG4QJvnTI0G9s3iUmJ15?=
 =?us-ascii?Q?VcNfGb9u7RcKjsheUiZL7bFChapTk3izjVoG8sLvT1IvMJUO7r+4K21e0tQh?=
 =?us-ascii?Q?rhhy5ncAz0anbhawho5kxfceA6FNg2LVnt8YAMsNz9xYPNT5lAsXLv5zxrIM?=
 =?us-ascii?Q?i6jt2G+LUm7uT07x7A8wnFFeJfinatu3vmY/fR62KpoLliWzsnxqaWpygMos?=
 =?us-ascii?Q?oEftiJi2ZW+SWSPERnGKbyJ/oCBbduAIYbJZDbjtbumLO5PYiWVpI21FP0us?=
 =?us-ascii?Q?W/DYDFlMjBgolVRH8MjrQ1cGdz9pLvURy6D/uHpHB99mQ4T7j2PssvW+IbsV?=
 =?us-ascii?Q?HlJb4VSJGax9agpwsjrAySFM1WEP5rCAGw7UksWtmwVheBJJjMn9eyT5f4vM?=
 =?us-ascii?Q?6R3n0IkfnNHiEYaDgBh5YOruWFMWSEBbIOZ6PgDq+03zt81dg3UKJg7Q0fxw?=
 =?us-ascii?Q?FWVY1jF0slffQ2+95CyroTd3uiHNmNQV3jzzLZ+2mOHRCjIFhvN6PbH3zibL?=
 =?us-ascii?Q?X+sNdjusFBdeolNd4OJqF1XlXZvmNas3uYstKtBZqySVF4zligAG9ickhDUd?=
 =?us-ascii?Q?h3YwIMfC/zBLuleDgmdpxgdOqmDoUAG5WZPqZlnCBpdvTh7KQ3bOVtuJw4a0?=
 =?us-ascii?Q?rGqgQVwTLWVlDYubQIeOVUDTUnt2SMpCYFiGY9gHzd7kWYk9NOF8NcYgh/z/?=
 =?us-ascii?Q?PF5YtXMJSnSErD8BWzOB4naHQNItGZucrSx8iVVD8aUbBcbqHoI0SJ5JieLh?=
 =?us-ascii?Q?dRyutNXOoSw8Tqqi0QEvzQpAqBUWjdzAZeJx2zrLiCEn435s+o+ITTHnR03L?=
 =?us-ascii?Q?OR/y/nKuWbg5RdzIfrdPbSBC2JdSEAq/GbF9VSoslHCCjeIdk3PklbuwBl49?=
 =?us-ascii?Q?SiWupduzaNtw9XLSy/suH1TBhCz1dB0hTzGOQwf3z+oe0bOydgnei/pbfzr9?=
 =?us-ascii?Q?LFQ6fR1Fuj2Qt6KBKeRanLzz4pVieL30XytIQiylLDxKWEfRnn8Re6h7SVzg?=
 =?us-ascii?Q?4euogZkWcB19Y/1wNFifVEUsH7NkAIz+gK9GTTuHESpYwYhzHZvZpJ/GE5gZ?=
 =?us-ascii?Q?w5PmEk4/cFcfaOPZOjReRstadP9owA9Vl1atTAirmGQe8eY+p+2sDGjc7KeS?=
 =?us-ascii?Q?YQeQXM2/2BZxX5Kqajl/unBtIN1toaISVcd1OZgt+hTiyCl1HFjbm1xobSw4?=
 =?us-ascii?Q?w/6YWwp0KEcrSZAwmZuFlAsnwW+MreybbR0lKVrCT39YskUiEaASG42eH1Uo?=
 =?us-ascii?Q?NzJq1t+jQiUXJJidBciypNfo1PgzV39MbJnDY5mYHqR6Z3OmrHdqHqfVKVJm?=
 =?us-ascii?Q?xWGC5c1cBoAHULe3o+M8U1b9mscdvBPgB4kCUaM/dO/furLfvbjICjUtyTlI?=
 =?us-ascii?Q?xnIKGQsVF+Bwe/GKlhMhTMiw4PgFNXT9lAY1Ew0/QZBPGC+TrC9VhMIBQnNb?=
 =?us-ascii?Q?Sgc9+GSoNJ1q9kUwWCeTWLg8urSb2qswqPpcxDkS2EAgcwyOKVFO9rv9XlPC?=
 =?us-ascii?Q?3pEFQCsIX8WjhMbvu4grdnLBNqZO/3wZUvxhk585VVLfs9sGNzpo3RlWhSwg?=
 =?us-ascii?Q?3hdQEwwqMq3PeEQsaMO+9W8=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1c86f6-6eec-4086-9020-08d99601bb4c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:47:23.4700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMYf/2FmTNxktIcbMubzrjFZcIM3swI035B6yq/6h2sG/X6jGrPZkWtYQkRDUzXE9GXfL7VEwcprWgDSJYcCig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8345
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=92346df24=Anup.Patel@wdc.com; helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Sat, 23 Oct 2021 08:47:31 -0000

We should be returning illegal instruction trap when RV64 HS-mode tries
to access RV32 HS-mode CSR.

Fixes: d6f20dacea51 ("target/riscv: Fix 32-bit HS mode access permissions")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 69e4d65fcd..9dfc9b5eba 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -181,7 +181,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
-        if (riscv_cpu_virt_enabled(env)) {
+        if (!riscv_cpu_virt_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-- 
2.25.1


