Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrd-0001UJ-TS
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrY-0001FM-8s; Thu, 02 Sep 2021 07:26:32 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:32987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrW-0002vE-91; Thu, 02 Sep 2021 07:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581991; x=1662117991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iq3V0AKcehj6gHciAOfKHiL2RzKeNZrp90c+Z6C/+8E=;
 b=qbodNXie4ZGG3F8TNn5zatyHxR9XPolnSSlaxuHdmi8UIvbUrBrlUFap
 P2xkfjNatBdcjwqnQDuDId0g/swSYmkgZZps3WmOqql4w+vTBKvSG3S5r
 gkvPsOyQnI/uqgR8EvhtjtiIEfONgJ52gvgFzUsESKU2l+FXUajw2isA4
 qFIjA4/Z9N4vmfFWJrCoyGveAYDEo5iE7jImtT1mG7hVc8vojOjifO7U5
 aCm8xVyCJ1UfldBX/kNOdNNJ0cG1iTIV3TDl/715ZJpGRZJb9DTDrlEA0
 WOTLdxey8AM9r+yout/DAINiTjfdbqoxKtbSUWtOmWb4JACFbaRawMsJH A==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="179581934"
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bf36FAEeXHJdE6J/h/e3oXZwt+GOsQcdh6cnkeZMgb+Q4e8c8hcAlK6c6MyYPQbVvnhBf3qhIUlLfQFbdnfnlk+ojbuO94GLMZ7/wQv9oUfije3Ipv63CXLfnxwvA5zaMJuG9GM9spkZB1eSq6ElW+Fh7ISwXxDbRvXn3DM00yCEfE+BdTiLvqRmwvsq32giXLiW7e4kBwWA6MxjwQucOTzCt1DsB4fjxFslX7j7dJ2ANihT2UafDPdguyGng39dpKnH+iUFeYYC/iFV5KxKRg88svNcsMz1URpifrYsxcfVPk2Bzbs5twg9kY4/f0fDGlF23562522GPULdZ97uXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=+vEKT7UGik+JahRoZsvfMXhbpTK88iuWSr+ZcNC2PP4=;
 b=ke7ymbRW5TWFuqFIT9Ic6p3Ed94qMuzbfVflOilej/4Qevf3V94UTChaYbzVrH7EW5uudvoD5IgInB2s9nB6xXhzKHFpXOsLRg6FTvO13YBKGX7W3xj5DVPGiEfds/JSs7/JicjIx7kURfTHB0026zk8GjFMDBwofeANxF11PoV5EZPvsKvvbyNvdP7+HcWNQIqlIJjK4ff5vFpnJ4t2+worJu5IwgmYZqaP0GM+wtvlBJ8jYbfGbh//SIjMcQOcKsZyv/20zSk8NMf0s8a3oRxP9nnXdc30P1YGOYxYkD5hvXCgGwUWCHDT/AavSowGcPcVao9ejHu03AVWgfWhrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vEKT7UGik+JahRoZsvfMXhbpTK88iuWSr+ZcNC2PP4=;
 b=KFAZRPc24yp6GvtNYK1yN3YMOKFKnx9KJNLqyKwJ0JPy7E8PL8Upk3fqneMBfY9YCSGvu8G195HWKpNK9Zks6ytclw0PhUakl1DGonSvYypRdan/jMlzpuPSe5ARSXivlkJimbJwCNsPr1bdm/QizNjN1Hcj2EJbjHR3TM3bWcM=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7841.namprd04.prod.outlook.com (2603:10b6:5:358::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:26:27 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:27 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 12/22] target/riscv: Implement AIA interrupt filtering CSRs
Date: Thu,  2 Sep 2021 16:55:10 +0530
Message-Id: <20210902112520.475901-13-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05c086b3-7f8b-4752-dcef-08d96e0480e6
X-MS-TrafficTypeDiagnostic: CO6PR04MB7841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7841F7D60FE26241FD0FAB7C8DCE9@CO6PR04MB7841.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UydVsQ7y+5CkQIRDGbKfekXtFJAW1O3nAi8czM4VbkAbMBWsK/NuDdambMQwhbaYMcnrrC1OJm5w6HTtDghTuwL4CU4xIZBZp7Z7H6z6eY3x4cQsUQKYSZTGWcKN7hN0M+q9JCHmFuDs0lOlLsX44zv8EsDQv2FJ92vSDtySiTjf7kbRVycnbRMnm4K4jaZOkyU+lsNM2jBI9qbsTK8Kh2ccw5uS3u7KP3urpYrBlTh/pfz0Av/gihlbXL8lAvwMNddxVxWMnN1GPfk/rWhZCDvuwJdrjaqt89gUhOx7h7G81HiXpH5W0b4KjJPTZcFerChx25aCu01Rf+YEndnHpSF1ktziQRoSJUKVAWIhmVCxR90NHlTYA7KZH2D7M/fHKBEdNmoy61pwL+8SEyOCQPKZqMHykwtblDVxek9jRZhudeNkGhh0pzQK/Hl8mGILHmzz18F49ETnaAqUtxBGfRVsBmrIdO38vXNFp9+izDwNtmcEWYzj0U1jC7VksZOdivT6tKFDDvWdC4/t+ymzUbD/4njS27Qluct2SjvUCvUmq41bOG8WPBDtfuV7lBGwAj6UKnarmI3snnRl4c1OLvUhN0xyA7GA8F8JCvjvfJhzU//dFhf3zUF3LE36c2zf5jEIxyGpIh8OAh4bgZEa/+7wRosd318ecBzaR6IvRxCdFfUreld8JpxsmiavKndZo9cVlg9rBracz79hZR/rsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(38100700002)(52116002)(110136005)(44832011)(4326008)(38350700002)(8936002)(8676002)(2616005)(6666004)(66946007)(5660300002)(36756003)(54906003)(316002)(66556008)(8886007)(66476007)(1076003)(2906002)(7696005)(55016002)(478600001)(26005)(186003)(956004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J9G0f6lnrmtjX8+DbiycIaNO8yjaLnHvkPN39Kl3k1eQFEUrWqT/dzxf2qsG?=
 =?us-ascii?Q?aPZ+Zf2Ogc07GZcLMDtmaO/J4uT7W9qAnKtHvOFsCVUFDi+4AkbvsHTw0oQ3?=
 =?us-ascii?Q?tn9G+wSUryJrmghOdJQOaLECjVJZA0Zvdl0QtDeWWTEW9ZvtDgN99bIsVxqZ?=
 =?us-ascii?Q?x84f/fqR2vW2XRzZtAw2PMM7ypQaaMCgsGtf5JRMch13NiwdiNxF4Opn10we?=
 =?us-ascii?Q?2YUlcShu9KPKKiYk2BJMHNohDxxB5/SWHIIxFJCUGjgdyUJ58xHnytMsPXVi?=
 =?us-ascii?Q?6F0+SgmKtbjrYh8mXhpQvGvrIqi9/xNNcbWZIuvDcVUEpYOsLcOCgg4ERh0v?=
 =?us-ascii?Q?tbi1mXuKyPhAZK61Jh+gHmvau6D+a3InNqSRwNk9yvrezJ/mnHpwwLmzY+YX?=
 =?us-ascii?Q?taCenIiSj8uWWmXq2on46gNDuJBkVO3s59F19mZRILQZsckoUxXCC/wKNMNL?=
 =?us-ascii?Q?FxWG/xEPFZDOXeJduaMMhsbhbCjB92sP1xG4jp7IwHQLNm5PNPbsH9jyWmxM?=
 =?us-ascii?Q?zVeXIkRn99aZ0aBhi3s+qPfB3RM3NYIMth5mbFEkIHl6s+9gAQ9ynfrlyZc1?=
 =?us-ascii?Q?PR3lJZ8tA3WbYrMmyeoS6XBv3vDIxXaB8t6N8+GClyqTGl8hriVGAuCcZ0nR?=
 =?us-ascii?Q?PCMF6TayE5VAF9amMV3rwGiBhCxA7je2lOjvluZhAbAbVUC9iaB7l2YVzStS?=
 =?us-ascii?Q?1dZ/ZNv/990ovS+xB6axueBA7FsEhtvk3WkV+ZL8TP3eHWz1NP6OBbDWs8Bk?=
 =?us-ascii?Q?7uHt2rP8CMpwJW1bxOks8wBeVbY8nOkaKbo8E5YVtyiYUSrXstxJ19sKl63K?=
 =?us-ascii?Q?wV3DDovvtFHWSw9DXIfmA42WynU4f0O8ppKlkLaKwkFnhRt7yVnN75Jzu/sY?=
 =?us-ascii?Q?4W5dPny27rV6tTdkglCyTgGLm0lDWrG4RqKtjoplvPiGmL4gJWD0XFNKHKvx?=
 =?us-ascii?Q?bBd7Q6isZHKX/NZVIrG9qeKhcvd/+aPKZ+3rU6X52VRrm+GUPewEJ7ernTw0?=
 =?us-ascii?Q?03wsMTrn6FTFovvBy28jBk8ipqyTrE32tdXuZwhJhgH+TTmXIGJbabXgzQUq?=
 =?us-ascii?Q?3Oqf5UNTAy5YtJ6fP5C6ZbkxkoHSx+T7v7R/1JU1353Q719Wt98bj4Ie3ZnX?=
 =?us-ascii?Q?27kzy8ilEUwEd4ipgiol475tyEhyjByY2yLe46m58C5JesNgkprsPEb540u5?=
 =?us-ascii?Q?Vfnej8m2sIJJfIJu0u4xZfI5zeH7oa0YXSNkM+SFIN6r2lyub/Vdhd53tEI8?=
 =?us-ascii?Q?YntAEozd5ihqDWav9qiZk8qzR2EY3N01CR/qavFQBwFFDMvPDUETOWg6/Ngo?=
 =?us-ascii?Q?xJl6Y2F1T6lsVuVCNIaLmj4r?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c086b3-7f8b-4752-dcef-08d96e0480e6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:27.6858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OkNbivPWPhC4sA5Kz4osQxylzV1ZptvOvyqZdoYJWbSJuoZruYUieOv497Hbsga6NzfwsvYjffrMfl+yZHA0Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7841
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=872ab4b15=Anup.Patel@wdc.com; helo=esa6.hgst.iphmx.com
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
X-List-Received-Date: Thu, 02 Sep 2021 11:26:32 -0000

The AIA specificaiton adds interrupt filtering support for M-mode
and HS-mode. Using AIA interrupt filtering M-mode and H-mode can
take local interrupt 13 or above and selectively inject same local
interrupt to lower privilege modes.

At the moment, we don't have any local interrupts above 12 so we
add dummy implementation (i.e. read zero and ignore write) of AIA
interrupt filtering CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/csr.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 7180cc927c..c4057b44cb 100644
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
@@ -515,6 +524,12 @@ static RISCVException read_zero(CPURISCVState *env, int csrno,
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
@@ -2047,9 +2062,15 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -2101,12 +2122,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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


