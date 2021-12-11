Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtsX-0006Le-Ut
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsT-000697-6s; Fri, 10 Dec 2021 23:20:53 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:25446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsQ-0001kV-Iq; Fri, 10 Dec 2021 23:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196450; x=1670732450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pjoMmTGTi/kHHoHz9FsWbchb30fLuMol0LCEs9ozmig=;
 b=CJfsnMFlTW34nLbz6wKdprHkGLlorQjTbZ+4a+nPtGpicyOI9fqRM1mb
 vj+cA6ySTy4XbEYFQcuP9F/y+MuLuboVj+u3hz7/365tgZ3Wi8u6c7zpw
 RQVUwueXWsg1LfDZPUtKMEH53KI3iUZ/OevRzQGmT8xc10qkoPy8BCNkw
 QJ+lj6kH7ivU9EC3Kwz7/DJevdynvcYyZT2dgd1KVCwW6P4fYc3RANgYt
 ril6gu5Z/H5GffKnAwThkLcRKdQZxetRj4217cbh+JhnuIuwheCnkpjUL
 ro/ROFkaYbwjzPk+kG3oYOr+yRwjSQjjXSsr2GbGOFcn2GCA2fyzw2dpM Q==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="299834377"
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1GRwl3xCO8L2EnNDMvtJc54JAIekdHPuWppeNQgS7BhpypaGNM4WGPmNGtF+gPVKyVt+ViwZE+YG9GRpTym3adn/yBVA+lDXjM3/2OJiWL49k7+dOyQ56VmwH7UvOAiysY6/t5wiVF5cgA5kGK7uyKs769rgF7ayzcZEdZOVr6rX2/KQVOxYqG4tln1liY1xhGuqoRmw7Rj2gPaltaawEsi8FwR1cD5qM7Ot+Gky/FA226Y01ewmKeDjFF+2rDl1oBzg8GMg+17pc39DQOZ/8X7Ln9A6oW8UYje1GYnMvnIugtzbHnMZ/KRRqAYZMAH34El9pWG4aZL4brIKMebIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXZUkGU2zFcre/4U94gZAjWM68SZQXXTHS0wuBJ2dsc=;
 b=kluInBrWyiy5aByOu2odbqcX9kYLhTS4OqyI7szSOLipdznrw5aE1/5UaRoROfMqnumpPPe+aJV4xKnSagzThrdW3i6B/7MoSLRjUpzlJ7bbHGcpJEGoI2xnE2auru4ydkxXiyCmXRwqPzF3kzPSZp1WLLDz9ogMrl/tZIir0OsHn7zgJrEkR3p7tOeSPIxsNUaxMzYez6y4/mHO6Z2pNWPFQkgnQpu6pSrPwNKopBd8k11yqlq2E9sIipdtENfWk6ZuGWfJPeZ7YrqogikL4Epm3Zq2oG/G9Y2y6kpcYPeaDbfvYMOMpzoR59myjINn7wGQfx9ve7lTtNps7n7Ixg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXZUkGU2zFcre/4U94gZAjWM68SZQXXTHS0wuBJ2dsc=;
 b=Qyk3QuZTJUata8+yakyFrrXbO+rI3evfFOJ6CjMAiDz6NNm9wx83kKsgydryEqJC4sGzQDfOHJ4WE5jhgHOyp41+ro/1UnlWjpHJmXNxji7qjG5p5F3Lai29LsBF/+Z6MJVDrA0UP1MCXyjKl4gG1j1kOtJjd54BNEyYQ0MJ/KE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:20:44 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:44 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 15/23] target/riscv: Implement AIA IMSIC interface CSRs
Date: Sat, 11 Dec 2021 09:49:09 +0530
Message-Id: <20211211041917.135345-16-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1b822785-94ed-4111-b952-08d9bc5d990c
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB826868C9428749B5F4ED72F18D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MtJTfQRxqeKj/u7V2WYUFHHpI/oNJnA5Bz4I+6bcd1Ru3tvuRC9TQDtzfvuwv/9+KRF+leVaz/R1W5bL/nA6J1gSVS/Oz/wKQcCfbcZkGr8TUMfZ0h3ytMmLYQYu1qKDj7PsWHgSQRM7IaJqAi1N0IDW1KXaCMsvbPDjnlcYtmH2SzL9EkrXnSBAzf9tNLwsloNjKNlC4OrPmW3Y5FUtcYtdWIKmfxfBKgb/1o6KuQ2iyF5my1jv4GhIfLJi5IrPT26HSMTVqXkIlcMcEV0Ejk5RI7pZ80ood9CTNVLZ/Al51DaW4TIJTVyeMxE6uuEkUZLJRscUv7v5dqcA55rppSy+jUKm49H8mZVQJw9a0sjo07m/brwBTHDssCmnufdjlU1pWy8tia9onTo6oPrJux/xGhZEUwnhxMydDEn7vNbcDOPxSklxaHP831D7Y54u2h7/Ptd1c2ZjU+rt/mdK5ahDAyj8w+7WQi75fzpM9kiXZB/aGZ4fCdE54LfP60quks52BGXC1HYSKP2jlCkwKSPFfzHTED2M4IKXv/xlqbQqLo8jYH/slrUORz11DmT2B1kaVNVpooUZ8qdCd3VjW6ilRfbdrx9eqbKlGoUZxAArVSM1mzJj9ikbN1JxYuJuqCy4BYqfbYaHGTfpP2VNmwtUwL2HNEKG+zdC26iiWw6tX93ui8aXWE5Eey1koiM82dG2I2tqzR7j0M9A+mEsUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HImYxUWXuemHJAA1ftRx+b/1jGS6YQVDTbH1p5CHpMKpMYIqRjMfLlj0wkJ4?=
 =?us-ascii?Q?TP2GjPv0d5VEgHzKz+Q7rfghylUeb6UeuhZP+mGqIwfq5Tpcm+98NxD1X3yd?=
 =?us-ascii?Q?woU3D4g0KRz1rmKKucgtspmjcPewaGovz36MixOvZCk+pzzQk65U80TtBW9d?=
 =?us-ascii?Q?eREEa/NCFxlOPMLQ3o9RNG+M5ZfCSJz7Aa+e4RsRnBGltzieCqgXGRg63PMn?=
 =?us-ascii?Q?qLJnA8MbMF5JR2tw9TE+UURhlDwiQLdLA1mBy2QvBQZUcbdezNdJzzPCXb3S?=
 =?us-ascii?Q?56cOdPoBVeNcOmCrFdXVoegueReDa5qW2JSfLheMPLYqhNrDk9aD1t3cVLRa?=
 =?us-ascii?Q?eY8AF3BNtKWxzB6yzdRCLYL0vYmGY1yajpOvLUmVw+U/NE0Yoz9NqadtC9Tb?=
 =?us-ascii?Q?7MDPjcmrDtm0zxOScFUehokVdPI5zQnImhjSiuwH+dIHijK/3lfKQX/g7UiT?=
 =?us-ascii?Q?t8kNMEs24L9FJt4RBF4jIf/vKzqyq5865Z1lGU6JmyXk5Ird03UOQWQt7gID?=
 =?us-ascii?Q?TTaz61NN0NHiVXLoZ0rMhjXVl18wla5rApmxwdP0XnEEWKzbWojZevLXld1A?=
 =?us-ascii?Q?TvZInV6gvC2BaEHJJjvT1thLFrHLfOWGL7H+SWuRIVq3GnL3I74keeBtvUaC?=
 =?us-ascii?Q?sM6Ye8HZz9UO+NNvqLc8qFVTcL/fQMWP37oWxziUSvKKakV/c7rBMDvzMUUO?=
 =?us-ascii?Q?VmrJQFTLcjH2DdU8a23kBBZSctP/L4pLZ5o9hAn43U7YtorkQaM4L27JGtXT?=
 =?us-ascii?Q?PyehrmGQ5yFSNEX1WRMQc8AexLKeq8uaMQOLh7hnKCpWhqyFatoi7mVHroRb?=
 =?us-ascii?Q?djNiAGp5dcNk/UxnNokqLgWQslS1F0BugdLmjnuLeAiBqMaW2otqzj6gY6tn?=
 =?us-ascii?Q?ozzZ7EgIN82MC4mbXMpF9UH8u+RAXHCgsriSDutPPyBov99bL6pIB/zj6xGy?=
 =?us-ascii?Q?Qu0P5n6LH80mYeUAlntFR5bcGcG0V6f4fv2y5HjWtEdlXa5zRFdqm9CyMT5c?=
 =?us-ascii?Q?+865xTz9uodrLcMJj1UCHppxriHhI9vT9URXGX88r9/48ef+TjHpgc2zQWIs?=
 =?us-ascii?Q?M2i4HZ8G1sB8m5hwtMySd70cFp6j6/A6F8DvFdg67nIrE+3ORmBkTYJeMU9G?=
 =?us-ascii?Q?MHaNJ6LJhatnRyJr6KCrqFeeQrODirdjIFWnXM4SkHrZ7pvTRLXc6YdmA5Lg?=
 =?us-ascii?Q?YopGGHAkh/AlbNr57H6hdjYos9cMO4AYv+W3zfPLHKi70X/cBjxn7+l10jgy?=
 =?us-ascii?Q?JuDqO6T7XubsnLptlQ1bvxykI1x8fw4qvxvy85gPcK/DK5FgphbELFm3cJ66?=
 =?us-ascii?Q?Y02P/DLzc9dzZF4xTcb8hzABDwPEfCvcanyzr4D9Oi+5kf9fIyb25GNCH/df?=
 =?us-ascii?Q?h7uLPJmijpOQCPfZr5IsVZc/xU0iay4Ofv9zDAyI2AtUtgsFONb6MtdoWeqt?=
 =?us-ascii?Q?tNh7bI+vuX6wZAJeG9oukOqrCildjeV2EaDc9aJVzVEnq24wXt3svioYYThF?=
 =?us-ascii?Q?J2kAZIg7OySAqMwa/dhzGFHrtid0mvVedgslG5p/qyyO+g3S5i35g3L4UE7M?=
 =?us-ascii?Q?cLEeIRVCtepJYmg2ADy6MHIJ0HAyRez5Cvd6JJFDjGUE3ZYorWt4/iDfwmk2?=
 =?us-ascii?Q?zwPILBeQZ6cLaropbbhtEfE=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b822785-94ed-4111-b952-08d9bc5d990c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:43.9113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T60/A7aJQg/o5FPxiEzg6aTvfuzF47UcQrOe46hzJ0Rjn/i8biVyx7KDRRQ4zWMbDqScHGpUxAMHfBk2eR1UMA==
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:53 -0000

The AIA specification defines IMSIC interface CSRs for easy access
to the per-HART IMSIC registers without using indirect xiselect and
xireg CSRs. This patch implements the AIA IMSIC interface CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/csr.c | 202 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a8d169e6f4..6bd15c1e7c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -875,6 +875,16 @@ static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
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
@@ -1027,6 +1037,177 @@ done:
     return RISCV_EXCP_NONE;
 }
 
+static int rmw_xsetclreinum(CPURISCVState *env, int csrno, target_ulong *val,
+                            target_ulong new_val, target_ulong wr_mask)
+{
+    int ret = -EINVAL;
+    bool set, pend, virt;
+    target_ulong priv, isel, vgein, xlen, nval, wmask;
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
+        xlen = riscv_cpu_mxl_bits(env);
+        isel = (new_val / xlen);
+        isel *= (xlen / IMSIC_EIPx_BITS);
+        isel += (pend) ? ISELECT_IMSIC_EIP0 : ISELECT_IMSIC_EIE0;
+
+        /* Find the interrupt bit to be set/clear */
+        wmask = ((target_ulong)1) << (new_val % xlen);
+        nval = (set) ? wmask : 0;
+
+        /* Call machine specific IMSIC register emulation */
+        ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
+                                         AIA_MAKE_IREG(isel, priv, virt,
+                                                       vgein, xlen),
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
+                    AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, priv, virt, vgein,
+                                  riscv_cpu_mxl_bits(env)),
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
@@ -2674,6 +2855,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -2708,6 +2896,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -2753,6 +2948,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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


