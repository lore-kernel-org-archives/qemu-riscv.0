Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrl-0001pk-8S
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrj-0001i4-3K; Thu, 02 Sep 2021 07:26:43 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:26521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrg-0002xP-Nl; Thu, 02 Sep 2021 07:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630582000; x=1662118000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MQjau2oGOYVed/qK0F6bMfoGed4rgyx7nx409f48V7s=;
 b=Vh6QH2h1wpKfN7+5OejjrMJzHpQWX+M1YXv9+qK2cMqZPlQ/b/kWmmMJ
 6BbUF2+9f8sjR0Hw67EYytAbH7+wnggkCuNfh0mtYsAnGs0Ap3NkJqSZs
 LQfBYy1bYkA1j4Tae+VljFEONXPope0V6AUze0Xh/5WfyizsaQIAA+fH2
 q+mQziorgSKJHc+drpC4jFREcaXjckTjhl/5go9Cxf9ylK5taGMDCCkVH
 OlJeIiAgWQVIKSo3Tgr7DcfbwpSwF6TAX9Ql45zki3/8rlNvSEGN3xTQJ
 IQmgvG1Lp4GZH96QaY8e7TjoEJL1912NMc3lk7lVpS8+2Oj63J4rm6axs A==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="290644634"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMvEpkNbwDXx+FupcTacifwOhz/0Da6bdtsBSz3p50Y42GEH0ZoHpHblo3p/KQsSO+d4Iw/YjodwT4XaCwE/Tdm2YIeABeAcei+0LmF/u23Tacc3fsbKvrQPes4AdxaK5elH0JUfaAYL/0eu5ixpdUgUNGXZnwenyTrTh8IZCXSqMyUxSYfHPspRbzAd+ivXuAvJLGFhNmxV69MG2SRaJz1v0AhAEE43TsRshNFV8+TzeaNEwrBxOsypEzjCccM6ji/J7pKYGmRtwxWulHfh25V/2IAqMnMApRlAPeRIt2X2YLVCXbZ3PGflbYItDa2T9cjVQis9nds7UBCjLEwxeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=4paBlUixr6FfoqEF7gpU7ZYSK5VMffob92xMm7fIoZs=;
 b=V2Q4intvWV/wiY4Civ89nVjqmeEAFCkkoxWeOhwj05HSZRfy7Xh6zE+S/5eMYcKrmTbsS4m50ucYm5JYV77rFnYT7l/it32zxbgv3/YpI2KvOOF+MWaVepiHiLJYSifoouSdras1ALWicZ3bBR0CeznD+1kFENzpANqt9YVcMFzym1XZ26W+ZfxokibhIFoA02bimw99kROdbsGiLVxRys/IE/gdzugXJjk4mM/LMCqw3AYqu3sh307qQx3Nhh5Ce1PEYBlLOgkQXJZoUzkaE/4ZonVyFH1HRpHKsKN3fnP7p88TSBD0v30dsExqIr7GB9oOr8DNCoFARTJ6T/GXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4paBlUixr6FfoqEF7gpU7ZYSK5VMffob92xMm7fIoZs=;
 b=vdFYn0CNeGXHQLjCq+2oSCmeUMOC0Ok5kg/EM/HCoOKllVtRwFfZJOEdPfj6gW4XqJ50ivsMgYou8eYhoXA370suNTlRDKMx5S8aXkqn2ZqPhXRWS5ebxWqV5uxpW6omvIILeap2D4kyCCSqurLlaFDeK2TKLmDsDPwubHKqQ58=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7841.namprd04.prod.outlook.com (2603:10b6:5:358::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:26:37 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:37 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 15/22] target/riscv: Implement AIA IMSIC interface CSRs
Date: Thu,  2 Sep 2021 16:55:13 +0530
Message-Id: <20210902112520.475901-16-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e733058d-1b92-4474-89d7-08d96e0486b7
X-MS-TrafficTypeDiagnostic: CO6PR04MB7841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7841939D2681BF7AA45695038DCE9@CO6PR04MB7841.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X2Ldlpfi3ZgFbGSxpT6kfh/TCoZVjdpl1dYr9vuuUyE3dS0/vwNPxTMBQ0fn+dDhZv8/d7lKXZfbSGW1SS7I5dnvC41YXu7+D4ibV08YEtKN35Q7WrTfGVgILu4tvwJOCI3HI0r76vRyAUXSKui+hmNCfSyBPs2XYJFvt0eXNpWJ11UC9TCJsQdAYz8Mdql29vHeIiNWrxjqXSj5duPTb2LwgbC1gnbcDQZhToA7sMMymFDBPbrfCCrB1w9E5D6xg+1wwq74XbyuMc/Z4MAQZlMgBKFPbVnu8kKD81C0t0D9WPi1MCIaxcwMR1BP/j28zoxrmh1AtcOFNcGV/dvbh3w1ciBCQYEi2CCt+i802wQbkwqAqo0eN1svPYFswFg1zUcxMkni/MxZNFsEF2mcSsi/Uus1EbP9bBHG3N0ptPTizrgMN9Hcaz0AZQqy4npcvD9DjKprjgtAtJhmYIe/EVuWajmXKo+ZDKuQmWp8kw6tDo0rDVWpFM9MMYb0RB3snOOYB0eoyFrkkxe/mYzcFBgBsNF6r5P4RBJv7CFs/CrE9PX4RziWojEPqwbjXi4xWZVNiCzjTIICQDdD7kBJ5GnLef+jQzE2zm25GuNFeAoLlOsid40qmQkcaqLiCQYhm7CJBqZrwEsOB+hM2yY4q1iy875UJuujADPeG8y/ygaYJV/Ibxp0t+FWaHFmjNeJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(38100700002)(83380400001)(52116002)(110136005)(44832011)(4326008)(38350700002)(8936002)(8676002)(2616005)(6666004)(66946007)(5660300002)(36756003)(54906003)(316002)(66556008)(8886007)(66476007)(1076003)(2906002)(7696005)(55016002)(478600001)(26005)(186003)(956004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LtOksg+49enKIFkFoqFEn+JmEL3Evz+v7/7gAfv15+hpHgqzQOHWBdqcHD+t?=
 =?us-ascii?Q?DdBlVLn2O5ArxsCAx9rB6B77NLR5iJ0nWQJmV8Rywq4I1H743t7cLYvJ1TNn?=
 =?us-ascii?Q?6DjARJVFozhixurpxr6s0vpG7Isf9e3NldZTFoMA+KxHer77pQEIqODco6St?=
 =?us-ascii?Q?FrYsyJHT602AOUrIBlxNnyEl1NIak+Bdyhwt/KKxrNxoXI9bDijSi/gQ56/s?=
 =?us-ascii?Q?JXYrQ8v4ksuHDhqu/bimwm14MnC62zEvaZmulU7RbsfxdVg3P+DfLRtvO2iF?=
 =?us-ascii?Q?ku6CIfLC3Y+lJ2QFLo8BAgHNVSSW7BW/bytWCjf5idRmtUhRcvuvE3fXTfjg?=
 =?us-ascii?Q?zURAfDIrs0uicr2TaJeuxazf772WrFz+yQHzDyjojNP+qxFxf+Cf3UKTWlWt?=
 =?us-ascii?Q?GMoSj7kig5UTwJWrC8B2Oc6yoroIqJ86jEZKpY8g1iVVWW/VZMtpohkKxnhP?=
 =?us-ascii?Q?VxKkZHKa6F44mta1imkny6cpTUeSnpzOZ9R26aP65o9C7I+FeQe3ilPycX2S?=
 =?us-ascii?Q?wkDXEs6LL6xGVww2EVg6VEj3e0T+rbdEfaZlA3TKtNMxQhGdUMhKg3H/h+Ag?=
 =?us-ascii?Q?nw8tF3p93tyJRDrWyzKgEeJzZh1RrpVIfR/GqN1rInrrkieFVavo93R8UEtR?=
 =?us-ascii?Q?SrBSBUhxldfVNEFCrS4HknsMoUQefyQBwhrxZ8PWWkmiqDyuB0cWiggN7CDU?=
 =?us-ascii?Q?sZB3jPYXy1TYuVAsYgYjrkbzO+bf9mdVh2N5vHV3zrKiQED3r31Zb2Eue3yt?=
 =?us-ascii?Q?iSBAcYwrgDdoK4q3jg2YgsU+uNATrf8SoXwlugxeHCeYONBxXjGV7NklVjdl?=
 =?us-ascii?Q?IfzZDKkt7pK6ybnFgMoBUjKTpD9YE5MztaiUWmobJ81553jW6SZ2ZZe9oyDU?=
 =?us-ascii?Q?FiCvE05o3Ox+NH3NO7/tS7orlbuU2JHU82rIEKL7d+z6YN0CjUbRlZVVw87v?=
 =?us-ascii?Q?hvh/T8LSKaom9I3PNqhu2rubuHtbmpkuUqVkDunyHDzK0kku8aJT705lo7Cu?=
 =?us-ascii?Q?A5dUUqEg2SJANInM42BL+CH2pOMMiwgnnrbSb7jiavc8kMrOlWp9gib69mqW?=
 =?us-ascii?Q?WGc93Mld3+vi8S9CQnMfArgsYZpL3VP7jsFQl/aF8sY5lCYuXy3lXEKgxnYJ?=
 =?us-ascii?Q?f8nWhR56N0NyCGIJQDSlaZABsg8y2Ir5+kjD7oMYkpbJ024rrZ0+1MngzOu/?=
 =?us-ascii?Q?xGN6EfVLjnMglcoZ0FxcRabA+Pd5n6qQwdaShOBG2lLnQj5H84WNOGqKrETo?=
 =?us-ascii?Q?YU3HyWBuL7UwxRguN7aCYmKNose7Jv6xEWAuh2bdEWqurRt2abvRMTzc01Zg?=
 =?us-ascii?Q?JZ0riPlwihO0TjjfTYDa3pu2?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e733058d-1b92-4474-89d7-08d96e0486b7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:37.2090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYGOyX9V7tFuWik+xlvdPsmRot1vG2zkdhCJvex6sfcWD7g48OClowooRQbgKcPT2MC2vh2vEl9cJMGDUeAF0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7841
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=872ab4b15=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Thu, 02 Sep 2021 11:26:43 -0000

The AIA specification defines IMSIC interface CSRs for easy access
to the per-HART IMSIC registers without using indirect xiselect and
xireg CSRs. This patch implements the AIA IMSIC interface CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/csr.c | 199 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 199 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 71e88e5b41..31e0a62f91 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -836,6 +836,16 @@ static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
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
@@ -987,6 +997,174 @@ done:
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
@@ -2376,6 +2554,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -2410,6 +2595,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -2455,6 +2647,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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


