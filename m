Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meChf-0003ZT-GY
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChU-0003Ig-DB; Sat, 23 Oct 2021 04:48:24 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChO-0007FK-AR; Sat, 23 Oct 2021 04:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978897; x=1666514897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qesbuuEt1k5lDjm2lc3GrA5LxA6lJCG8dTP6OBcwp/Y=;
 b=LBR1cpgWXN4nHti5cbHJ6SH4QIdK/lyGJM89XcYz5sofJ0VbqBjT5EQy
 bugy4pFANFfYOeC5DrLoWzk4qYwYPDBEBGg8lNLeWg6f56ByZzgU7IL3U
 xG7YFyLbCHpFOyr8NwG6O1KzwbtoSr8jMPKCSb6ZxGYesSEIG/yF3sMr0
 oNw0gjcPKGmtRodX4kO0Q06A6RK7UFn2Z0fDD6Mo1SRgJetMoaQBT9txJ
 CPj0bgGZ49U4UpV2FfTkDjlXZk6W57+EIWmrtuVFRf7wyn8qgJFFKQhjj
 ZQRu1B2BjF2LIu6v/pSyd7cZIUfy8+7sqRGMJ9lOi5YsCGCHmUpxCMC6J w==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="188437383"
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:48:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edBustvmxIqvmcqje/pwb3zy4Cas0hCPG7t3Bp/3yjlaIOEk6G4NVzfyFtptkwtZjmzlv88le77mjdNxTbEBYAiSp2tpG4MoUAVcHDPy+kSP3Dtwr5ESVT5ecqmBOKNhL/iiuyBNGOOc+QScOFPIXLGVj0XjpX9wCUR/SVQmV8cX41LJjUnhHq+Q9Me5zJ3vZI257N+ud22414HRrFmCM9YVxJE0eeWuhzTIlIJJlkc4VXHCIeffS2kXNq4vKekfYEo3Nj3nKNp2PrO7L6LtN0J2OerduSSkKnmRrpxEt89aPwGuAnSLU+VxYxOWfxvVqv/wDcLyiz7GPQf2ASXPxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6+yJR5Zwh4+dvBJqZcHbxy6tL2JticSalZpLVSsgnI=;
 b=DAg7qtkvpWDX5AhE79HYesCvkyCSSNtLdZ8IqE9mEeZH82CAbpi+02IPPJmdbCF/Zsqyng5bNK66l0Dh4CuBFKQJ9n3N274a+P6ECxMClHVL9cCd1sV7VroR+mDchu3BFkETQj1+KpKylUX6paVrWRBjaxoTiCcN+joUCEAwCgM7gWj7q1L4Q8Z/9OxB1vketRoweTxQ3GuP18zVPws9Ku8dHVsyN4vXHgV5WE4SBpGinQ0mfPEaBqarRcBQetNYm8WM5G4WFo2p4Roy2lNTVIGaVLjfaKBJ8C0q6U34iH7AmwiKGHyLF0kJs2xTm9RKBcTcd2QePWOkdrbHV0VJWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6+yJR5Zwh4+dvBJqZcHbxy6tL2JticSalZpLVSsgnI=;
 b=Abl9mLBa9KyUvjKEDESIfdey65zQg3WvROA69dQ4Bk6dCrKlWRk8KIsZ1n1Tnz7NWOK33CS7f8qW0R5qch9m1JZ42B1zSxnNqdwT/tc1/AlbIj6EpnK140DHdZ8whtGVNO3vc4XM8CpFABYG4MScTPHAUENho5F3tD42Da01Ijw=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8409.namprd04.prod.outlook.com (2603:10b6:303:140::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Sat, 23 Oct
 2021 08:48:14 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:48:14 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 17/22] target/riscv: Allow users to force enable AIA CSRs
 in HART
Date: Sat, 23 Oct 2021 14:16:33 +0530
Message-Id: <20211023084638.1697057-18-anup.patel@wdc.com>
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
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:48:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d7ce5d2-afe6-4de8-d8cc-08d99601d9f8
X-MS-TrafficTypeDiagnostic: CO6PR04MB8409:
X-Microsoft-Antispam-PRVS: <CO6PR04MB840902C6EE6DF849C42E49398D819@CO6PR04MB8409.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5MkIHqoIVc8wJekTtbdn6ou1aNrmNk13rFcLVG+jPj34p/AyaAQLz26N8GnankuAgoQSvRKypRxl7NADnl/5oEcJiHqrs2WAcnGQifJ765+o8ha+5X5uClpgcPeNkwfoO5gMrK+NP1H8cudPucQoy8BRwKh2jcwuySxYF86/XD8VRhIVpCJFDH76KaFMU7ExrJn9cJsXc3pbJ82Et3/E4NQnSwHtQgfxalogJQTce7hBye3WP5unG+Fvru9P90reoQ0JQRG4y9nFY3ueIsoUFtx+qFq5Qwc2VMRRNkrl+rDjTHIMzPqH2U7znJVJmi1IVrRL3pXdd4dAbp3WKkBSgalvhzgC3OI8v9p70eksoQXY5req7FAMi9vNt5PxB5xYSHLMx4TzoHXQp7MtqSgmeqLAPrGZ2xgupiKxgoeCfDRl8dasP9Ltlg2PiYusmcyYV3YXOc+U1+nopNFitR2CkMJehpl0PGFXbX0BvzOySTZBBaDQWzfajdTztyBw2qZX6F3U4EDwW1mRKofsO0jCjrdTb59K+EjQAw2ivFJTUo2ZdUuYGbUW8Vg1nqjFEs3BSUnwRYTp0zaF0Dad/EXxuUJe+lQ+XICFAaa3Hzh0N8xLaoF37tcLCnCcrm8x6U+4Si8W0Lb/K4vBLcHBFhVbrVGEcmWlQq5hVaUX7VrBgqhxkkDT92JRwkrlJaKwucPilAx3xNip5Eh5s4zlxI5kLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(1076003)(66556008)(83380400001)(44832011)(186003)(6666004)(66476007)(2616005)(8886007)(316002)(66946007)(36756003)(4326008)(26005)(110136005)(54906003)(38100700002)(55016002)(8676002)(956004)(7696005)(52116002)(38350700002)(508600001)(2906002)(5660300002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hh3LybofD+jkWtyPW+PkoBVSZC+e6gSiH33G4bWIRhq2J+yTvoNGLp80Ptm/?=
 =?us-ascii?Q?gxHrVBljx0589wC1LPKkK48fzdWBRhK4CtW82YMhxKPaJbTa3XSaz7hPRGVs?=
 =?us-ascii?Q?OY7WhqDosLktwP0/cMly8L4V7J24TaOj91qlWCEN7UcBiwD7e4xyQ2wQdPXt?=
 =?us-ascii?Q?ISIr9AmDLGHoHf4SnBBU+bJDME3FEOMOwYmz4e9++f5UDZ+VI0HF5j7GCIIQ?=
 =?us-ascii?Q?Pey84jRWtT+ziwfE9KI+47aMhT7NILxgtuK9rMsGFH5t1vTLu9TvU3xMmyAA?=
 =?us-ascii?Q?PYf+tw+VSGJyL915IPdwS9J0Kyavo6kmavuyTnrDDN/KnjKNJVREjgHUYiM3?=
 =?us-ascii?Q?6iMHT8ziRTeyjotPogAScHkqZhVqLda3MnDmyxI5ZK4hoUEFD4vqIykpnkqH?=
 =?us-ascii?Q?io2iyVEB+RhSHu67C6vrjOfdkhRKTOwQ3sNc2ANdrefH2WRfqjrvcbWPm1Ip?=
 =?us-ascii?Q?9HDh7B47Wkw8oWuZthHnQE0febSydvzNoaAEYtUDA10Rr3rmkHMpi3dyT/6U?=
 =?us-ascii?Q?3Ym9pD8XLJ5/32aROeldyWEvYJW0uewJhHguKYWKzRma3USve3f2A86FXLH3?=
 =?us-ascii?Q?Wb3ffWP0fq/QVF36/bAEE36GmaSM90BFew/oeK9ZA1v38ffG8YK0aavDM+H7?=
 =?us-ascii?Q?mPl0jWFXnLtRW+n7YH21X0OLVNz6o4vXD3gA+37xya494Rkrl8/g1GyQPEcd?=
 =?us-ascii?Q?3CBQLVc6Ct6pQXvJPawWBKaMmz9gSOjgNx+hhfKAUSlYj9DV4EKKTrF2K9SA?=
 =?us-ascii?Q?se4Fv/e+XeY6rnICliB+cLeTH6V24kwoTKQ/CAZMXQKyeFwmjsu6Ub0fRRJD?=
 =?us-ascii?Q?//l4LGTFx4nqde71A8z4BcJqmzU2hny16WgP13+aqWpIuV4lG1kQfBBAmP96?=
 =?us-ascii?Q?Ij9Y8D0eJAhP42MtY4aa2jhf8TNpAwFVLCcPgHVQh7Y4+iuz+IKTyOzaH62/?=
 =?us-ascii?Q?ILraBQzfv/NsYturpWugG3SlTUIOkmbaDYi449cczGRQS+vErk6deIK47xF9?=
 =?us-ascii?Q?YuSazsLNEWZ6WCePBV/A/0Bookoj1PXmYu48nqT1aLT2L3m4Be2kjj6a7FZ4?=
 =?us-ascii?Q?zDMsfCveDnf5KSFuj02zNwUcYUg2DZtLPnvtq9VXMHal3ggGp9KaSLd4ThzX?=
 =?us-ascii?Q?OKTerZcLaoVvYIOo+CUlevAkZTl+TxEnbLE3phuBUfTataVsW9tbNusWEnIg?=
 =?us-ascii?Q?jZYSmA8QuQlLteQfIO4ZqyBnxJ/oiYg+BZHHt2Vjn7GZ3a/uT0Ds/FWyrsLn?=
 =?us-ascii?Q?bw+dKQJ3a3DgwdQJ/7psUN/bodpwF+pbSG8vrYMYrJ0c8BuLXRhH52RVlGJK?=
 =?us-ascii?Q?9kFbcCPrh1CoKU5YVnaeUu74bnRJ2j3kEdKdvs6FuSv486lKksYSXVTFsZpm?=
 =?us-ascii?Q?rVrznS06jQtE+wgbzVHFgyqtOAcqBABFsU5DtGl4b+jib4mTfCxNtfvnYObD?=
 =?us-ascii?Q?6amEBGKcMRPoyUuQLX0csq7ldE7ZOsNozBcHREe1lynhQfWGtZXWjUfQZiNV?=
 =?us-ascii?Q?KnoyBlSNhALy0VksLf0hVbRBEMw4In9YxUIIqeN274kA+8aclTF2kXAVRN9h?=
 =?us-ascii?Q?z3bJpe0XaKOvcanM2N7Zk3PDt6dAdsSuvFT/bO3IIcPp9TiG0OrTL3jw/mNf?=
 =?us-ascii?Q?wwEtJbFLUBIYrPp79F2ONhs=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7ce5d2-afe6-4de8-d8cc-08d99601d9f8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:48:14.7028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axcI6NNbxA+pynTYcMVjle7wmNMW7cTbLyx7y6VAB2/4NAnrm6QyQnhe1+/s8pmJ3g4MzjXOW5QHNUDqtyqEFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8409
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
X-List-Received-Date: Sat, 23 Oct 2021 08:48:25 -0000

We add "x-aia" command-line option for RISC-V HART using which
allows users to force enable CPU AIA CSRs without changing the
interrupt controller available in RISC-V machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0006989c39..d88a2bd766 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -454,6 +454,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (cpu->cfg.aia) {
+        riscv_set_feature(env, RISCV_FEATURE_AIA);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* Validate that MISA_MXL is set properly. */
@@ -676,6 +680,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
 
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bf688eb1ea..b7a9506544 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -340,6 +340,7 @@ struct RISCVCPU {
         bool mmu;
         bool pmp;
         bool epmp;
+        bool aia;
         uint64_t resetvec;
     } cfg;
 };
-- 
2.25.1


