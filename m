Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBr-0003fW-96
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBh-0003ZE-P9; Tue, 26 Oct 2021 02:43:59 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:53782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBd-0002t7-CZ; Tue, 26 Oct 2021 02:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230633; x=1666766633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=qesbuuEt1k5lDjm2lc3GrA5LxA6lJCG8dTP6OBcwp/Y=;
 b=OkCySlEx7ttdZic1k3D9XH2zqnBe7tFcgYGEkRlirJmowTUZFKR9S3Bt
 duxzYnFt/p4SzFXD6dciwP6cWjXCylWWQjuJsHgK3bEGProf1CEiheTS2
 aHv6IYV6Fi8Ce4V3ysX8lEtI9H27vVFzo5CPyWeq6LNbOOf1OM9vtl1nb
 KMiTIwwBerE+Cm6p8lkTQnyGTY5objsxI9dBzzH9lZ+SNKy6SoogRw9jG
 Bmk5TIPYPtpy5tC5qpL6N5m2Gh6zpM/EdEiUNT3BBoS5m8Nx1x20x36uy
 mdbO3uegxaGAnQSK3u5kuqNDgcCP/xtewegJWkjviRq741/6U49oMTGs0 A==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="287722108"
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDU5Dp/Lr1mnazbasFXoW4Yy2UTKWQ2fT+XXKpmnqCDPHjqEmTz8nJiQJe7KxuCQPJm6tMfvinzr2cus/tnIgNVSLcqW09PYBtJr964mW6oK/Dcd+DJus2U6qS9c55PydrT3FXG/lvSdrHzAncQqEl90DCBbZXzNXigZsPDTJu2t7KDkt/ffZHitliLxyBAJrLLewpgrBw4caA/ZoHRBVTl5rFs4yU0vA33+OqQMWywc7Dw58y7YClQXL+aefTxZHQNiSxG03ElyMJsrTH1nM8EULYcdNR1x13e7NJFFzrZeMyMhe7k11Kl9J9WwQozog5C7HhWNgC/NrP8HlcMUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6+yJR5Zwh4+dvBJqZcHbxy6tL2JticSalZpLVSsgnI=;
 b=XM+/n8MWOgDa5rv3XpkoreVqfxQLGi+oUxO0jbtaX2LIXzebL1xyT+9R8vIBlOhdEPWeR+xWufvsTcM1fCxgbVeM6Y9f10eUbqw4aXoDzDqUhmnYh16jRR+xGOLFusqg+s8CJz2VuuFt/dMBfh/DBsoCY8w1y104NGIvoQ5HmK/WiK2bKGAmoYxMFA1pNPSSsSIpmYF1IPdSVVeLoZnjLCkbu/xOyTEODuDCh5152hN/UfamgKJAyef8AmNqTCbcTXbT0cdUVd3mBa/NDxicvc4eYA9yjklQedKxlSPum2dywi7tBeCDt1BOMXjd7HdPwU28y1UvxGy6ceF17oouIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6+yJR5Zwh4+dvBJqZcHbxy6tL2JticSalZpLVSsgnI=;
 b=obJajwubqrJIVDnKkjuVZVrA0V0vFcLKijpJBLA4G3/MVEcOJlgDZ0kcqQQZ0VvP5KcBrk7H7iiKfbEe/3uXcx7fUMPr6y4+y8PGG/GDBIoFtBjqGhhy1CWjzzHG6XTXbTPAn+NGUVdLoQrsapHEvwUXP8L5ldBMF6D/M3RfSO0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8379.namprd04.prod.outlook.com (2603:10b6:303:142::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 06:43:49 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:49 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 17/22] target/riscv: Allow users to force enable AIA CSRs
 in HART
Date: Tue, 26 Oct 2021 12:12:22 +0530
Message-Id: <20211026064227.2014502-18-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026064227.2014502-1-anup.patel@wdc.com>
References: <20211026064227.2014502-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.162.126.221) by
 MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f255614-ea6f-4ca3-eb84-08d9984bf757
X-MS-TrafficTypeDiagnostic: CO6PR04MB8379:
X-Microsoft-Antispam-PRVS: <CO6PR04MB83795D62E78C0A34B24925868D849@CO6PR04MB8379.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bKqvam4LbBAlf6vThb8CVV47FV0pdaJSnGWswenibWEbdgA/DflNaLWnBm6uQ+CLPBp/6hba57ToLefyklTA/TvkB2GUeJC+1QW2UZUnrceA96ynP+HuqVeqEvDwphuw2S74dYQUMkR+8A1W/uu87P2r2vYUhZDHn1PGUoDz5Zr+MHy++qWUmuAaZruVUmXEH7hw9AVFZDsONx5tAZTRbexW9OSM/VTJtcjGyuwa3aLuUPJEoAp/m1y6cZp4fRVc28Qi8hgMT9/lEZtp91PUks/fPSmIL71x5ZrwVO5WOI6Svt1ppT7qfBa96pTJfEsh/xrwxGwrWyeGUwkpCFjqmHgSDIEYBASseavRLgHbSIzIoz33AWIqB72FSZ8vxTqPkoMLQjxph+zjCUiEpITIzPB9J5TVacSGLCy20dNj8AgWz67mTgVPeceO4BjQjgn/eYv9J867oJBviunpx72RIlk86Zr2q4ytpxawcdSldYgkR0wY9/60Wk9PBlps0AMUb5pJcMOyHFh+Fc5TA7hoU2HmxXgLxkIeRIiSVKuMt78zRmrYyMFm7fB6tzcD/GNlZnkl1pXhyt7jvG4tUnvbCAp4TYao9vWfcaN98EDMVwHAAtlzlnCk3zZCvYGlXKGkVpMtHDu4CJIV8uc1d4WfImZwN4IFc/dELwXA6j9r3mWNXBNvAt2tJXfWovC1GFYI8f/AhuakR95CtN+Bjrp44Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(186003)(66476007)(4326008)(110136005)(8886007)(55016002)(2616005)(1076003)(508600001)(7696005)(2906002)(38350700002)(26005)(44832011)(66556008)(86362001)(54906003)(8936002)(83380400001)(66946007)(6666004)(36756003)(52116002)(316002)(8676002)(38100700002)(82960400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4eyjONkJqbgK4t+JAlTON6ljzo3kHEK7jgGkb/MsV98H2DVLcfCA8DtuxR09?=
 =?us-ascii?Q?kC8GEiTbVNmVTd2wnkyGFNv6j86GD0rTOksnzhU3htThDRTIDkiXIf7/JqeQ?=
 =?us-ascii?Q?V6S4XJtA3XRcCzQLSBJe5OIVtZWIlWRjoqB123M8mQEOxt4+NxLpv2NZyQdT?=
 =?us-ascii?Q?Pmk6rOE2TQFA5vtk1IV5loJOUVzJPrXgztRymd2YQbSj+ybsPP3yOj594tE2?=
 =?us-ascii?Q?2JjTZIgcTBWqxFb9IiyAKyMCw762MxpzWoye6/akp5c1jazM7eTQHQOR8fUQ?=
 =?us-ascii?Q?nUfLjG1uNoJ9G+PMSOjP8ape67uULuv+cK+rD2LECu8dLR5emV0o5OCkFpF4?=
 =?us-ascii?Q?qc3b0dUGp3AaFljB3rNWraQZLm4tG+/zbfs7tbdlsjakEQWPmF9OxP/7qvGI?=
 =?us-ascii?Q?C58HQP8d7swyz3gLKQH/mOSX5OwLLhSLhzKW6kyvhmpjcIYiWB0bH8Gp9wLc?=
 =?us-ascii?Q?NIfMLjOqZ66kBE/HnIedJKfQRimgyc9Ma3Gtql0IYjXNANLcLCv6pGqQ+Hf+?=
 =?us-ascii?Q?mDS+W1a+u8PIBYIwranXCm1fXwyrvRLAa1Oyj1mx4wCW+kOZ9hRH7vAJSiFT?=
 =?us-ascii?Q?D5qjZvvIbPw9YwnHpv7Y71sZfCOyYogE0ulw/mCaQAcw8xYOJ3ghTfjyULtL?=
 =?us-ascii?Q?EHBwLqirn9/FuVP6fX5naroHF3YBjjaCPMYwZ02uSqs11O/YzM8zonTP9NC1?=
 =?us-ascii?Q?Ye2d3V9w/nEDxUAKBFm5KIv7oHvMPyPdooyw5TCzTZBbpAhlwft7lGAbSpNz?=
 =?us-ascii?Q?EJZ02RWtqHg92OcHBoB+AiGg/WFZ0JNj8QB2b422kHifRwEt833zBDbdq0sq?=
 =?us-ascii?Q?sJaKnb3SUoVPf+YukETgxmSA3pgg0vPFWuFjh3kHbZid50hA9LlsZ1X+g9WI?=
 =?us-ascii?Q?Rq5pa6THVEe+D5qka3mK0iSKND7A85/WEfNea8mAvJF9rkz4PSGQppjRaZR3?=
 =?us-ascii?Q?ZjQZlwgIQiXPWyUiYgrY1AcrRJusBg9CxerPlqb42rvqdsZmhzjvRB/hQjmA?=
 =?us-ascii?Q?fGXELmwMlCqCZa/s8tCKe0CJ1AoneTJ7m3QR4h8Bc6nj5sr2WAmuCb1mUy+i?=
 =?us-ascii?Q?DBMgoYBl9PcXmFIuodDhxsGv1GcMkJPQyeTfW05ZnffeC0lMtbP7sqC2VR4g?=
 =?us-ascii?Q?6eOM52ei77Qh0u+1jWWgB6hF5xjMEK5ypJtdGPvpMnkowkW5r5RM6Pqe/rvy?=
 =?us-ascii?Q?HXu35RtirjfFgi9cV8bTu7cnX0D07DSqsQB4T8jPHk4o1fbcMgnHmZQueCSt?=
 =?us-ascii?Q?weZ1NR7/S6EfLG3Xdzit9nvkUaEr2URWzMucZrlcXRcZwZS1qXlThNpqz8nU?=
 =?us-ascii?Q?dg9RK7p4pGJlsc9r6rOfFqSmikIm/UYDheyBQG8+AR3xaIKLCt+oUflq5jfF?=
 =?us-ascii?Q?noGR35J9lBDVbm62Lkly4zrrARTwInvD8B3vIscFjfKyvz4w4eb35hID7lID?=
 =?us-ascii?Q?sDCcKuS1joUzoJM8z8cWP3SUX0IOPnI7BUuAXRQmVQqbSsis7TkfjN/oFAEc?=
 =?us-ascii?Q?9YrCCwsxKvAcYrbz+AZifwvSiXgu6ahgLB9I/fZIXQey5moRqb2fH+fiUwEZ?=
 =?us-ascii?Q?bg88GHVtjX6Y8sRLLZu0TrbTQYbLLuD7uV7b3N2Kd6jwvg6wm9lmaKd1EMo/?=
 =?us-ascii?Q?d/EJhFNEXU6gwMrHWvfHe10=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f255614-ea6f-4ca3-eb84-08d9984bf757
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:49.0892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBie3mpRf3T+qUOsXzhrCg1J1rZ1DAnNqZ00QFEtHW5AsRGpL3nU2n8CcPaSSc6VS+wTTsieNMDjs48p+IplBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8379
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Tue, 26 Oct 2021 06:43:59 -0000

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


