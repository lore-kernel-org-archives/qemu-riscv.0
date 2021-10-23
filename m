Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meChG-0002tm-6h
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChA-0002os-TM; Sat, 23 Oct 2021 04:48:05 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCh8-0006w2-Ar; Sat, 23 Oct 2021 04:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978882; x=1666514882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xQ+uoogFLR4BdpvIx+FQYy5pY3pNfH/hNMFmtvUv1i4=;
 b=SP9X90/9Uo2PPEFGN+GC9fzGlfnABLZgCm5MoEzjnNKfLUofAYH9o1xz
 PSNzVwcqX5DgCZbVaRKK0tAknf7iy2FlTkbsLraSf4xusR4janWl7Nqry
 IToSjw6OnXvOlSu+cU51P1OC2LMI0hTpD32eVKXizjViHNMgMvRVVkVfL
 FcvD1SI/+LcuZiGD+ul3j5TKxUvNeGG6qDna1tbE35Sl/O0NV1z1e6cQu
 0UetkVy9szBdlOrgbLQo/heA/BC2wshOVjE0kgfAun3+nuxl4V+kGz88L
 oJKVSrqvjDzvatJpVhSC25Knp6Qm9/q+N9E9E5bLidrYh2wdjUWIYh848 w==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="295398059"
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:47:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mx/fmXcd2y82zHnecutJ8HQfegPyWEqNP7gJ1rVmUGkD5nZLP7lq1YQMZDPTwNbdev5DtfpShS6R8Ocx3pib+rGA2OIDND4EJ1L3GhlYl+lfbjDIANw9RqVdcr2/SOJNrQBqONIFGGlU00+LaGRGV/hrk/ConVcjtQJgmbRNE2RIApEN5WZgUrR0Y7/a9gjmtaQth1qWOqdSEzS/F8zw/oISLly7/eEa1gTdfAN8hnf7pikPWCpGFjLbimCUSYsiklS0l2zqMDSB5ZS10syy0Oc6uArCqv66fdo0xVOHl8XWWeqf1w8aIBBb8eA0tHfq8pgD5LiqdrXUi3WJCSJ9xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlHAPG0OuTGyaL39JRZZDmoqnAC97fPSA6n7pThq9R4=;
 b=nqaHUt62LfzC6WpRwiLH2k+Uu7hGv7iz0l0ZZRkiRJu/uH9SRUKUzvMlGv9JX2GDT9vWyMIGBFakwdca1i3jr3G1mMWeuq5A9XnDA9gT4PdkIBAC5FAKPKjvenRxKM8Ehk4Q+EdqSvMJEMjcomz4DcReRrcEj+mMDJ24F31NGOh6p2tz7JY9UEgCL6Bei627LfcncuL8Nm0DjCGApZujtgJe6UX72Z4l5ZNq6rbkm8qwe/OyvpGLDi3q6RrHEnh+WKbtyEnuEnEuD1dMwnI/8dpsZRdDbJbLrVQoW47bpg3dF+h00FF4wQpTH/0WuE4ma2EBdfiorINGbWAnzafT0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlHAPG0OuTGyaL39JRZZDmoqnAC97fPSA6n7pThq9R4=;
 b=fy0ol7afXJbDf4Zm+Pvw+6aw9Lccu91WexGxOLG0bmrOxpeFU377nJIap95GmYlejA5t5hZxvrUiooD5LH01hkAw2IgFdXM86mkcKzaHCmHgj2lkH6dZA2sNEYcCI+6JjrNl/4F5D/D9Bka/aFgQ8I6U8lDXGltAOiED0xpVNQk=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8348.namprd04.prod.outlook.com (2603:10b6:303:137::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Sat, 23 Oct
 2021 08:47:59 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:47:58 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 12/22] target/riscv: Implement AIA interrupt filtering CSRs
Date: Sat, 23 Oct 2021 14:16:28 +0530
Message-Id: <20211023084638.1697057-13-anup.patel@wdc.com>
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
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:47:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0692f013-1492-4a2c-1414-08d99601d07e
X-MS-TrafficTypeDiagnostic: CO6PR04MB8348:
X-Microsoft-Antispam-PRVS: <CO6PR04MB83486A30B5D89115C83875788D819@CO6PR04MB8348.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8VXxWqWwh6dhR2gsxW6Hoo38ooKRCnq9nJnhShlYfC3iyLUeaTD8MoLhXg/7/xXo2846rZBQcPHhrq5qd31gnFrjeyyY6UOq0yGUnb0qcsmPh/1/ae2if8n1k+Yv8YSkNzfLDV7jFuiRKQZ4fofP8S2y2k3PFAS7EJjyJpxkPN2Eh5D1l8fjl/+GtE38InyPN8cnn5Pph78dA2mAknWgMfPnunRbAqfqfFCm6u5gYAqLXqGxmmuKYVti6aF+d88ZLtdOPtcdwbVT4H/FKB2n5NwHV+SYjj8f0Zpu5SsR8Iy1Qq0qFeFP/MNVVd6g2BOt0a07BPsyuVqjQzU1hL/GQSZzbOJIBa9gmOQ92JgDrw3RwSCE3G8ABv/xXUoc4E0qaawDQpEtdbFOayiEUWF4cv3dJkLEFrh6ax+clUWzBB1KJ+ahvYuxudvZvk6oLEpreE2cyUuP+X3GArCgcVaV1mALBKk/wO2Tv4hXSyQCZbW5ENsyFEFc+7bP8QCfPJ9nE/p6JP7cd+XtKK1yFeaYEZUU9xPBNaNy7mqDK/j0T4Eza8hoq7bEq6UnF5ypS6ww3m8PDGYD7cs+wdciaoAkehX0A3ANESZORgBKb+JvB9zNVj1nfQEFPdoLDILt1Tq8Qzw+B06LLlNUtTmLVvNYcEHTRBsdkuH3fOTB/Tv8dHdVuCyJJXAW+CIPTM//sDuI+5MrpYhSMMp3gurfjgjafA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(186003)(55016002)(36756003)(110136005)(2906002)(5660300002)(44832011)(52116002)(316002)(54906003)(508600001)(26005)(7696005)(956004)(2616005)(82960400001)(66556008)(66946007)(8886007)(66476007)(6666004)(1076003)(38350700002)(8676002)(4326008)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yu4tT3aFcEuwmEZ5iH6EWWbdv2Cgj/U7sc5qtePO7lOcTXgDe3ATgpujAWyi?=
 =?us-ascii?Q?zwzP5B8CQ6P4sVwJbi1C+kwW4lyR8BZP08vu23+JaBhzF2Skj3Enb5HjLQEW?=
 =?us-ascii?Q?iT3D7TBeG1wo05vCj89vfxUuOY6U1E0L4RDvYWNBYXqrlxH2ZBgH8t4etUrs?=
 =?us-ascii?Q?9VkY3snvqThwHBacR08AKDvlkz7m+zyDPuSFlzUfoPS5ZRBvGsajnpqo0SZ5?=
 =?us-ascii?Q?yaNZnMqsaiwB7SjwZtpORRhK9WBoKctNdfN7x2fMuT6cPiFzFLt8ONZy6AI8?=
 =?us-ascii?Q?q8TtBo3My+Xh6HedlkuSykuUkdSEKbvAxPs7n8AJGL/vOqXjf9LQ3lgyAkAy?=
 =?us-ascii?Q?8dU9S3f/MEBsEqx6o2ML9lvd305uHN17vGuiYdpCiZapZTJaRhhwdo8RUSpc?=
 =?us-ascii?Q?v8nv8UdfyIGks1DHsS5FVnrd/KqGL2zny144bOW1TLcN1y8UF10mqMwSrk5I?=
 =?us-ascii?Q?sq8xlZUIYzwE+iNTz43d7oaguztQWI+UghketRpBzxk9+6/GkuZip3GGlDyk?=
 =?us-ascii?Q?yjYejZBa7VoVbmfUZdJiqoG0QP5ksLFzTN7SuFFCyToJWVWLj3Lruv1ArSUu?=
 =?us-ascii?Q?d61PgI1iVOMBR3HIUXfsRaOYFvxNJEuDkcgiMgVYsZtRyD2aEVAxzNAdpfHk?=
 =?us-ascii?Q?Me0GKMJT10FCZP53lUq/4rulJLVM7d6TGJiQ5FK+CyKKty3d+jYUi3QkmuYw?=
 =?us-ascii?Q?ZxwtU10o08mrb2NgG6V8ZSzicrawIRLJH3DopRbgdcDMMTRsHn58yKA2olu6?=
 =?us-ascii?Q?9MoBKu4jkFzqtyHcCKeGKc/lm4Dl4s2erl5JkisI854JMMdVttvIn7utFYo/?=
 =?us-ascii?Q?2PF9h3XZhEwGxXRkz9elePIy0up59cHc0wI8IwKHEM7+mBLvnRMG6SoClksd?=
 =?us-ascii?Q?8MwPF56pXGFm5/6FeESr2kz5BBQf3OcaOmrYU1CPFji8gs4ABmLdfVGi1irR?=
 =?us-ascii?Q?JK2T8513KubavFoPTRHF6FmCEtloysHgv8vXWw27b3tuJAS4PcbhyUgPhitF?=
 =?us-ascii?Q?C8eHMjebVAzVNDF/YSbSP8q4qa5D6uwWa9Nop5FNBrxia2VGBazkniNJ/ub7?=
 =?us-ascii?Q?Cl7JqcG2LR8wEROE+CV/UopO32zLLovqJC/bKi6OWg88eLikESt9tk1RQ4T3?=
 =?us-ascii?Q?a4/7O6WB+Y9xJtihNbDpSvKT6bls7Ne9zhYy/6TXO7E4Zbr/ci8s25hAqDaz?=
 =?us-ascii?Q?OByNxKY3H217fXAbp7D//JfT668t9TTgYT6kYUwxk42EQqSGEKBjZc7xg6gn?=
 =?us-ascii?Q?z3adcYZFrj3h0M7zKtQ09zFw4HyPvUg1itN/BkrsBSiXUWW9VPvkgfElHYFV?=
 =?us-ascii?Q?N7C88HpO4AFXx145Uz+f7fzq11zrjBMbZDfr7Kqxp2usisbeaa1JFM/lIGpd?=
 =?us-ascii?Q?oUf1ks34+enMCKKW4S6S8UE3bBxFBr1S+mjsNYpw5H2/pE6ebdqyqBA2utIv?=
 =?us-ascii?Q?HNxThRjdNxrPyHo/0zD/Z0OLqW0lJ9BZ2FAqIlFOZ7I0QGJmp+WealmMJDgo?=
 =?us-ascii?Q?t7KOw31VMB8JR96hUlrTa4+KiCZ/qubFs5nTeibDBOHX3JUsu9mMRaBCpl5x?=
 =?us-ascii?Q?EeYvEk1pRVwYhU11H6K6tTxmmRe19/nvBkqmbWEYSWk2J8sjV6K7K9riCMmj?=
 =?us-ascii?Q?9fz2VXJZIkeLDZH+iwVBnxo=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0692f013-1492-4a2c-1414-08d99601d07e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:47:58.8236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2hfLMJocJcgLV/0NUA1M9z0Uw9rveHECy8zZJU7ykLXjCAkshLW6f2U0vhjMr9BCm4cdjaqOBnc/xprhENzfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8348
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=92346df24=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Sat, 23 Oct 2021 08:48:07 -0000

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
index 46d0cabbde..43ae444774 100644
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
@@ -2071,9 +2086,15 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -2125,12 +2146,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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


