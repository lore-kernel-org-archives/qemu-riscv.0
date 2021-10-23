Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meChS-0003Fu-0D
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChN-0003DQ-Lc; Sat, 23 Oct 2021 04:48:19 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChK-0007FK-EC; Sat, 23 Oct 2021 04:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978893; x=1666514893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YalgbHXxM2191ElR0bM+PDks8VpaQ7psxsle5UZzVnc=;
 b=UcfJdeKfUDcEbDL0O6+om0UT54iPORGWoneC8ZsBZMvy65SOTN9rbzFO
 WyMm9zsPytqRTIYoujyyi+tPaiwwRgSksWb854uzJZXLkpg4yE+MBEYku
 60PWhuOYM+OOej5OMolosqm7SyfoWdZ3ry7XrDt958UVPPggIh1WVJTGE
 ClfexJ0ILtzj3vZ8dBZcF2UXLxfBixjLpMMPI3ElcMigdNAFkDsWZwsZQ
 i2YzQCqiDs98Oc7/ykA1354Jh6GUtWdE4KZTKdmsAtmcTaqZJjyuMBHth
 OFnT1rZA2yQ++QBE+nVBTZBtnP0027HUcO8qivG1xasjUW+mEc3oLjYuG A==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="188437380"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:48:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ne4LZCr6zXla4MeYhPLpXg+O+OK1xQ7kFk7gjr6Ez+e3MgrsI05SF5XRAv+9DquxQCB0lLn1Tq85jjW9XECzJTZ89b2GgeEEmt0riul6H/h83mq3Ot3Aqd39YjdzKRWpdnx1xSLbEIbse9BLA1ItLf1U/ubntX2QJOR3+p2GiDiPMoYog5A9FVuWKjqrSSVQM0vfzKw+fhxA/7VLOIOVJFAmEbiNhvzdAJpI6IpGgLOkzVS3PrjgEcggU4X5TNouCKg6mQkPTu7sfB3zjUbv+FlYgAZoDdQyZbnk+RbJAzqu8/H0XaMwn14VXpELhWsvOq0aOU9RrBsW5qWesmWwqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaPYwARyIYVOGxfft2tJEZ9ddwVOXkB243Qumr4i1vY=;
 b=fd7aIaHCZD4gaKfa7M+SsWNu4/IFv5qLtSzS3OVrWsTbEZh+YKxkhzQwTeYc5ZAEt6ZCB1t4Z7xdTz9JiCGrY9T3sd2IMfw/zrscgkzfIc4OAaQz/UjPgojDlwFlruUeakGTjj/f6+IJ96mVufM7OBRRrGEYNipC9wPEnL/65XNIMRnUv3WCS07sscTp1KlANf2g9N+ZC8R4FmOP3UKKeYYbOwBGoDCQ2YaA/8r7hOgedBWaMi5JIhHidcu1jW7gLtNZ9KvY/Gwbna3eqiNtyN+Kmarsos+rYTjB/yIHXw+SBaqktfnbRMSz+OQf/nvaezYEri0pUyxX2RFoDOfAMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaPYwARyIYVOGxfft2tJEZ9ddwVOXkB243Qumr4i1vY=;
 b=ItVHTtfxzljT/sPU7cQt4LDcaiflcHhMktodknkQ3wd8XtKGhRacF6CuXrEjmyyzCgxiwwBG42EDlfbzJYQpX7BC3ix/5a9A2MLCYahBxGDwy++CFvUJ29UkyQhKKem1PThueL136cVMaCUzbwF5wvRRq5wTGbmviwwgL6T1XE8=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8409.namprd04.prod.outlook.com (2603:10b6:303:140::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Sat, 23 Oct
 2021 08:48:08 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:48:08 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 15/22] target/riscv: Implement AIA IMSIC interface CSRs
Date: Sat, 23 Oct 2021 14:16:31 +0530
Message-Id: <20211023084638.1697057-16-anup.patel@wdc.com>
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
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:48:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f118d05-a8ef-422f-707d-08d99601d5ff
X-MS-TrafficTypeDiagnostic: CO6PR04MB8409:
X-Microsoft-Antispam-PRVS: <CO6PR04MB84093CC09E6D46726242ED428D819@CO6PR04MB8409.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vaQMynUEEFAo5+P58MIl8rgsjAF0b4CuVXcRxZqFgU+v8XEJaAYw8qhLfMyl8yzNCfKOT9dhJ/+FKwJhurwF75CBI0atIXfcxMHcF3I3iF+7Mqoh2EIx+zytTs6L8YDxk9gFnPLDMUuzolGqaDaMHcaFHUlQFuXK603qU0cDo+iDMDoGQJALzgFNBJa2/IDussTfeh7AWNcClp0/pYAcfhNhKImU5twE96AnKQbBcfiJS4CFv3/SaKN4dvLu4Wf0/UNlf06fqMSvlzTVl1YkSBgiVBfv1SQYVQPK8WkXFPABWi5TVlnG+uqgnyJnA3YfUmaOc4CZejbwIjKhSVsRPIZ4fNxt+D2oGbelIGxgnCovPoWg0VZJyVWV2qmkBNB8y+Fl2yoK8sVXC330D6CGRVNDD9GL0GaUzPkRTBIMBjRnG/uQg2Z+a7tWQUyrzFCQffgYO3JevFW9yLKT/aFCPzvAepuHckQ5RwZNaDvJuqLhVfX87EjTWIhGhk9VmXzKsvneS4IbiA077Evnr1GjOj4l9D/3JKw2HIc8cnOtjIpuV393WXKDkliJocS8aEtxibFVfi2nBkiAy8JWpVcwmD30NZpzwlsXcbC+qF8mq3DZSIFxTBGaylmp4J7ZX02HFI6PuwY9AZcSbnkjAZVrjUYp0afZ/uvHib5d4vy8bhhCXLDaZxQFFryvc58mR0EC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(1076003)(66556008)(83380400001)(44832011)(186003)(6666004)(66476007)(2616005)(8886007)(316002)(66946007)(36756003)(4326008)(26005)(110136005)(54906003)(38100700002)(55016002)(8676002)(956004)(7696005)(52116002)(38350700002)(508600001)(2906002)(5660300002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FMmOmOTIxLpP1iKKavJbkHeGCpXNlTFZpxNna1STcBPiFS++LGw9rLJ9r6NR?=
 =?us-ascii?Q?GBmLKehANKQph5NGaTSP/a6h7bojO0wXu3DsEacakORZwIMFdQugYnfe/0J1?=
 =?us-ascii?Q?yXmZrY96v6RLSPmUPUVYFSFWKE7ZFXPaSrMCcO6l9/HqtglXZ2HikgY/s7ZV?=
 =?us-ascii?Q?24+zHBac2mcvKwgQg+okHnKvoacCypV6cKGjLJGmKoH9WGHSWdIZ+RWAuqvy?=
 =?us-ascii?Q?sBFlTXVlVUOfyzs9zyS9VQrTwLFNWfTvzpC0+0xaw/UudQrDOJhVsvYRUgMP?=
 =?us-ascii?Q?FeshUTgsW5dQUTyfHcJ7bsfisrl3+o+5vUk3OOx6io5pw/HZBRXkULzYMzh9?=
 =?us-ascii?Q?mS+SuY0yECFB29AYy9w6IvSOWYu+x4dIt48HcShZ1dtakNfwLaYxSdjPrZlk?=
 =?us-ascii?Q?rMMnqqy0V03Ypt0bA941TnOC+XpQUOVT3K0u/nheuQIGnRNttGH78/X8nER8?=
 =?us-ascii?Q?s1ODajxXLccGbO2j113LLHLR8/+ZBWK04uzc7a/6OyZGITsYtmJ+ZrDQvFwa?=
 =?us-ascii?Q?X3SCT0A7k0ho0QtQ/yGxqxhMhhMzeJG4kqxaUGL2Ozbk4WFkrVM53TM57goB?=
 =?us-ascii?Q?3vm1/9AuZUrQvLwFY0pkUt4HP2CIAL9pZbICHTkBTKepsNtkaxQLNEiMSnCP?=
 =?us-ascii?Q?6u+A9vSptEkQiiDaJ6SGI4mb3BG/Rypo6kecO8Q0OJa9ecSxhM+JtFm5bMv/?=
 =?us-ascii?Q?9TWkMLFk1aO7+3ft7kzAt+RVOQdBlMxOtgxsiwLtz5/HgNyTUlR0Kaec+tvr?=
 =?us-ascii?Q?Dlk5BGk+ehgElwn4sx3/+Lfr/5e1OvweR1PrZB6bN2WbFOxhC60FceEJla8C?=
 =?us-ascii?Q?PmOUAxW3h0NMviZV51UU+m5Qp61zR5e1JZnrWVA4THfLeuMtjd9izVoReKJo?=
 =?us-ascii?Q?lHNzaPHu1rD+rxZNbg4pycHQ+Ob15wMV6Q2t/RTEruI2T2Boe3uoXKTW8w5Y?=
 =?us-ascii?Q?C0np+gTL9LOszM5kGm0qbZQTtJAhdmuMxCOMSO+8ZxyMS8nOx0u0hF7DgRXE?=
 =?us-ascii?Q?1MbBiyrd4DPtM+dvT13GqxPDdb9rcmnkwCxYSB5+MICIK6LJVtA1yeviY6i0?=
 =?us-ascii?Q?ajGjatYOUE5QnGY2MuaTi62BUC+Sp5woT7n1NDNxQ78Na0hG187RAwYXAxmw?=
 =?us-ascii?Q?loRsUWostzgolvzYSM/KxsnTJr4grHUSq/keuYP1PKUp3iH0BBwY2BrcwSXW?=
 =?us-ascii?Q?XeuvnVQzmQ9PIVEOc5ZSrkoVx+pm952OA/d7gEjcwETRIvYl1IIKFIR8lcoA?=
 =?us-ascii?Q?RGevmtEv8iFO7YWiyd5SuXEUU2MpOhvznVqYgmrfQ5sxNPhnhF1mIvgbV0Lp?=
 =?us-ascii?Q?WwB1dMLG4p/J6n7Bls0K9Qtq9tbXzB7Qh1kIm9GpJeZqlzcR27zknOhvaUWS?=
 =?us-ascii?Q?VrVb3OAR+zky4aA2F4fkNYJHnNC5GjhJLfpYrzj2thFssq5cfXvoaefLG3an?=
 =?us-ascii?Q?Cp/caegPO47vSouojt5lA33VaUvGAkSwBZB+aZwyvfyfczx8wrZZQ32kYuMZ?=
 =?us-ascii?Q?W6D+PIdGlQAdxEa+XUk7BWu9MIERqXAHxIW8IWCO7V3A+dbtah/j4CP6UdAV?=
 =?us-ascii?Q?Q1WldwA+8qjO7JJqG8VJNVsrs24CdRy4sL9HwIuWjlTxHfkxKaQV73dhQUBj?=
 =?us-ascii?Q?ZcM5NiynKldM9iagsNMXUp0=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f118d05-a8ef-422f-707d-08d99601d5ff
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:48:08.2243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVcf0bkveVklvuc2ozIzUtaRbu7CYMzxDXUlNsp0rDAYG0xwuXrXdSCUfy8waJcYNu1hAFefx8P29La37B7R2w==
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
X-List-Received-Date: Sat, 23 Oct 2021 08:48:19 -0000

The AIA specification defines IMSIC interface CSRs for easy access
to the per-HART IMSIC registers without using indirect xiselect and
xireg CSRs. This patch implements the AIA IMSIC interface CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/csr.c | 199 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 199 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e72220fd0f..19fe5b76e0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -865,6 +865,16 @@ static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
         return CSR_VSISELECT;
     case CSR_SIREG:
         return CSR_VSIREG;
+    case CSR_SSETEIPNUM:
+        return CSR_VSSETEIPNUM;
+    case CSR_SCLREIPNUM:
+        return CSR_VSCLREIPNUM;
+    case CSR_SSETEIENUM:
+        return CSR_VSSETEIENUM;
+    case CSR_SCLREIENUM:
+        return CSR_VSCLREIENUM;
+    case CSR_STOPEI:
+        return CSR_VSTOPEI;
     default:
         return csrno;
     };
@@ -1016,6 +1026,174 @@ done:
     return RISCV_EXCP_NONE;
 }
 
+static int rmw_xsetclreinum(CPURISCVState *env, int csrno, target_ulong *val,
+                            target_ulong new_val, target_ulong wr_mask)
+{
+    int ret = -EINVAL;
+    bool set, pend, virt;
+    target_ulong priv, isel, vgein, nval, wmask;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt = set = pend = false;
+    switch (csrno) {
+    case CSR_MSETEIPNUM:
+        priv = PRV_M;
+        set = true;
+        break;
+    case CSR_MCLREIPNUM:
+        priv = PRV_M;
+        pend = true;
+        break;
+    case CSR_MSETEIENUM:
+        priv = PRV_M;
+        set = true;
+        break;
+    case CSR_MCLREIENUM:
+        priv = PRV_M;
+        break;
+    case CSR_SSETEIPNUM:
+        priv = PRV_S;
+        set = true;
+        pend = true;
+        break;
+    case CSR_SCLREIPNUM:
+        priv = PRV_S;
+        pend = true;
+        break;
+    case CSR_SSETEIENUM:
+        priv = PRV_S;
+        set = true;
+        break;
+    case CSR_SCLREIENUM:
+        priv = PRV_S;
+        break;
+    case CSR_VSSETEIPNUM:
+        priv = PRV_S;
+        virt = true;
+        set = true;
+        pend = true;
+        break;
+    case CSR_VSCLREIPNUM:
+        priv = PRV_S;
+        virt = true;
+        pend = true;
+        break;
+    case CSR_VSSETEIENUM:
+        priv = PRV_S;
+        virt = true;
+        set = true;
+        break;
+    case CSR_VSCLREIENUM:
+        priv = PRV_S;
+        virt = true;
+        break;
+    default:
+         goto done;
+    };
+
+    /* IMSIC CSRs only available when machine implements IMSIC. */
+    if (!env->aia_ireg_rmw_fn[priv]) {
+        goto done;
+    }
+
+    /* Find the selected guest interrupt file */
+    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+
+    /* Selected guest interrupt file should be valid */
+    if (virt && (!vgein || env->geilen < vgein)) {
+        goto done;
+    }
+
+    /* Set/Clear CSRs always read zero */
+    if (val) {
+        *val = 0;
+    }
+
+    if (wr_mask) {
+        /* Get interrupt number */
+        new_val &= wr_mask;
+
+        /* Find target interrupt pending/enable register */
+        isel = (new_val / TARGET_LONG_BITS);
+        isel *= (TARGET_LONG_BITS / IMSIC_EIPx_BITS);
+        isel += (pend) ? ISELECT_IMSIC_EIP0 : ISELECT_IMSIC_EIE0;
+
+        /* Find the interrupt bit to be set/clear */
+        wmask = ((target_ulong)1) << (new_val % TARGET_LONG_BITS);
+        nval = (set) ? wmask : 0;
+
+        /* Call machine specific IMSIC register emulation */
+        ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
+                                         AIA_MAKE_IREG(isel, priv, virt, vgein),
+                                         NULL, nval, wmask);
+    } else {
+        ret = 0;
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
+static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
+                      target_ulong new_val, target_ulong wr_mask)
+{
+    bool virt;
+    int ret = -EINVAL;
+    target_ulong priv, vgein;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt = false;
+    switch (csrno) {
+    case CSR_MTOPEI:
+        priv = PRV_M;
+        break;
+    case CSR_STOPEI:
+        priv = PRV_S;
+        break;
+    case CSR_VSTOPEI:
+        priv = PRV_S;
+        virt = true;
+        break;
+    default:
+        goto done;
+    };
+
+    /* IMSIC CSRs only available when machine implements IMSIC. */
+    if (!env->aia_ireg_rmw_fn[priv]) {
+        goto done;
+    }
+
+    /* Find the selected guest interrupt file */
+    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+
+    /* Selected guest interrupt file should be valid */
+    if (virt && (!vgein || env->geilen < vgein)) {
+        goto done;
+    }
+
+    /* Call machine specific IMSIC register emulation for TOPEI */
+    ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
+                    AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, priv, virt, vgein),
+                    val, new_val, wr_mask);
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
@@ -2400,6 +2578,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Machine-Level Interrupts (AIA) */
     [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
 
+    /* Machine-Level IMSIC Interface (AIA) */
+    [CSR_MSETEIPNUM] = { "mseteipnum", aia_any, NULL, NULL, rmw_xsetclreinum },
+    [CSR_MCLREIPNUM] = { "mclreipnum", aia_any, NULL, NULL, rmw_xsetclreinum },
+    [CSR_MSETEIENUM] = { "mseteienum", aia_any, NULL, NULL, rmw_xsetclreinum },
+    [CSR_MCLREIENUM] = { "mclreienum", aia_any, NULL, NULL, rmw_xsetclreinum },
+    [CSR_MTOPEI]     = { "mtopei",     aia_any, NULL, NULL, rmw_xtopei },
+
     /* Virtual Interrupts for Supervisor Level (AIA) */
     [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
     [CSR_MVIP]       = { "mvip",  aia_any, read_zero, write_ignore },
@@ -2434,6 +2619,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor-Level Interrupts (AIA) */
     [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
 
+    /* Supervisor-Level IMSIC Interface (AIA) */
+    [CSR_SSETEIPNUM] = { "sseteipnum", aia_smode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_SCLREIPNUM] = { "sclreipnum", aia_smode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_SSETEIENUM] = { "sseteienum", aia_smode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_SCLREIENUM] = { "sclreienum", aia_smode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_STOPEI]     = { "stopei",     aia_smode, NULL, NULL, rmw_xtopei },
+
     /* Supervisor-Level High-Half CSRs (AIA) */
     [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
     [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
@@ -2479,6 +2671,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* VS-Level Interrupts (H-extension with AIA) */
     [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
 
+    /* VS-Level IMSIC Interface (H-extension with AIA) */
+    [CSR_VSSETEIPNUM] = { "vsseteipnum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_VSCLREIPNUM] = { "vsclreipnum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_VSSETEIENUM] = { "vsseteienum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_VSCLREIENUM] = { "vsclreienum", aia_hmode, NULL, NULL, rmw_xsetclreinum },
+    [CSR_VSTOPEI]     = { "vstopei",     aia_hmode, NULL, NULL, rmw_xtopei },
+
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
     [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero, write_ignore },
-- 
2.25.1


