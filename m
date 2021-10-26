Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBq-0003el-SI
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBf-0003Yn-QO; Tue, 26 Oct 2021 02:43:56 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:53775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBZ-0002eZ-2Y; Tue, 26 Oct 2021 02:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230628; x=1666766628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YalgbHXxM2191ElR0bM+PDks8VpaQ7psxsle5UZzVnc=;
 b=OCrCAbtzjrzYSGp5B81bCWmFdNR1CnSa4MmbnlyyjVMh6Fv1wEzZ0f7S
 s0q/gk8Xyy5pK/u7mbktx0Ujf6jNCRSwjRXEvp4GHeGSItCNTIWYWTlY6
 zzpO0lnCxnlL6i662vd/Cz5dxBKke0r2H61B7dLC4M6uIuSzqA0egFg1s
 WY962f0U/Z0atEzQt6Rwnn7+VM0DduMMhjNvZTA0ME5EIpuLj866ZJN2h
 yXF2/oxcwzVhXLrniLWBIPXHdtZ7U7kTC4U+Bk01ycjUKWNcVVrmP2t1c
 D23ONkyJz8f+AcOea/MmAXOCLNPn2GFtmD7yTHj/Y+IQubVsLOmIzg1ES Q==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="287722103"
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHR4I2Z4/B43mfI31Lvmaau2//yliWo4cN9oI6Oeo47aX7gBiZHF5f0nPrBp68dcITyv8NxUX85spxUlgUw7NT0v6WaLcVfIXTC01VrwXlGwFfEQ4aeyttx8zfsTeBYIcCZwdCzRHsCIMqoj4JvcMIs18bzc+ALyfV0kEXCI0oqKky+zznMuwszX2Bs+Mi0w1jvkTj8+ScP7dpNx9GwcbvotJCJryuE1Dbtd40Vg8sS5clUK3g0jzbx8dtOT9qd5os1L8yLwwjBGSZV/T1m2il98lZNELD6ssNzCoCxz6F11szj0adCEilU7S8M5XqH9biBJdhfIhoKQNmbC2lMI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaPYwARyIYVOGxfft2tJEZ9ddwVOXkB243Qumr4i1vY=;
 b=gN3bCgOZipKtFkWQhNZXxlstwVoGqDQwhsyZWQLfPXTUbSLOV70iW8N+qrCBZ3pjx9ZLnVD2dLRZNALkk9Iczk4YlavpyUlEROIvVbjQfWSnI//fgwbE94nG5mwuQQ2rsCKmOh0On1cBRvKOCYUOei5OlmZ2pIVskxexb1xmS0CsF5LZq76YPGdeaL44wFzIsUanVWQNkMQxfDVmjNkvswO8fByl3ZjY9WsE3CHctgWJwtKehhAwZBfQelkX/XXLMoUc4IotDHe787lJd6NoMZdAcamtVZXbLQ6wqqYI0jcSqp8OLQZZQdI19my6euc1zSBfIiyCSSDVTk/Nx9mBCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaPYwARyIYVOGxfft2tJEZ9ddwVOXkB243Qumr4i1vY=;
 b=nupiu+CjsAo4nlikeyFXhaqXkf+c3YODSit0tSn5QJLrUieLEN/zUcHd3+inBgWAlrqTFwzFbL34Oqp0HnU60/XD/xN59IVRkfcFoVCNP9smHZEDqXaaGCjORU+1cEAidH2Y39iBF27JPwXAOpllcwxYsLNrRwVS5t2j/rXGnO0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8379.namprd04.prod.outlook.com (2603:10b6:303:142::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 06:43:42 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:42 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 15/22] target/riscv: Implement AIA IMSIC interface CSRs
Date: Tue, 26 Oct 2021 12:12:20 +0530
Message-Id: <20211026064227.2014502-16-anup.patel@wdc.com>
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
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d6254f5-1e34-4585-31e4-08d9984bf359
X-MS-TrafficTypeDiagnostic: CO6PR04MB8379:
X-Microsoft-Antispam-PRVS: <CO6PR04MB837978E66F64D0C6E33035E48D849@CO6PR04MB8379.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4lGmBn8WmeY2qlZkw67IfIQxwMe8bq5GWQVHekZe/b4ww0HYpIeY2gQzbTk68nd6ONjOL458h2sfBHUfWAigDSFkEHR0/pmJ4uPHeWFyKcmjV3LKEmN+5dVVX+yMHKf4yVw28ttLLu76/IWm1CA8NpAH3agYH4MmdTehBMfaELlCZXJJR5PrKg1I4xU5S/OFSS1rtUGMxWNnW1cwbbSBISipyghrjwMn6b+ZjTKQf3/d5sEDQpqYq4+D/RCS521P+KXkJ80kYzFDLKPUzGdy3OsIKWc62Au1wRyW+fy4Sc07emfnMqEYTvxapJvxk8KV4HeYHicd56lkWqv2TyMVPyVw/wSyes+uDglvzTgr+dWDYIrRZ7Qazn8aleOahk9you6tBryrGnmJjPtk1Zgt/uQh27ZeLKe2kgU1kIKaRYuYVRozo62Cc0BpJRaxaeivsvSgrJOLwLXGsLgVNFqMQntFUHrenZt7n0dXs4PuvjwW1UHq/yiDhubGFPb3w0KSmox3v5qnT7hhQ4gesHfVhxKsEnXYL5vhLl3gV+JXmQBNucYUSABy92qJJHh+X0qAQMQVspxGnC8TXH71lUILfJvEZecR+BvNNV1+5tj0Mk1Ox5m5znihIgXC/Yh/H/Y2rXG8DPKHPwJaAI+USYKuyD326dACzGAR3Y5zjSDDrF2SWO1LKFIfWtsPDQj/lSyI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(186003)(66476007)(4326008)(110136005)(8886007)(55016002)(2616005)(1076003)(508600001)(7696005)(2906002)(38350700002)(26005)(44832011)(66556008)(86362001)(54906003)(8936002)(83380400001)(66946007)(6666004)(36756003)(52116002)(316002)(8676002)(38100700002)(82960400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tCz8+RAAMKFggEcdSphlCCoYVHp1b/sEJ70vN3a56VB23gc8inTr7sZbwDqf?=
 =?us-ascii?Q?y6vklabUQP46gvPQBIMmKfwsezVOdEOZGesiSM6uFAkLfVbfySLwAQouqimx?=
 =?us-ascii?Q?I8HQhQB1Vz+OQzOHFruf7um/pymMMAIuCEtkEvAFEZNel33f0/4lYqy4+3GG?=
 =?us-ascii?Q?wAr46P6cKy4II2Zr8fi4Ayl/pyduO95780fH2NOzuyvwq85RUq36jn/YyUpS?=
 =?us-ascii?Q?W/2fnjaFTYDmSF9WXuLX1/z5MG7bUHZZHw1O1wyuFOVEFrHel5rBxpOysMhT?=
 =?us-ascii?Q?35JNJtjlbUtZNgsXxHfEi5djXZdFDjTyfgDLSnWjCdSlZntsY/kWwnUqkJIL?=
 =?us-ascii?Q?qHPKqo8H8X5Bf3BpJeQTG4f4FLjVsxNcCVGopyL5ZGX8M9eA65+xfBg2oBDP?=
 =?us-ascii?Q?DT2jGykNDx20Idl2gY+NZj7C4uJdk87RsbJJobzmc5MTbQOYgbUNZl+BPfBX?=
 =?us-ascii?Q?nsvUZ5JBR39gig23ZNxrvAd/R31xp4QHNnFfFan6XrJmU3BtRoC9D7+tkT1d?=
 =?us-ascii?Q?UOaNtS4kwfJIvi+OpflM9u+7U5QSYp3onfAAa3PnXxJdGSVvFQTWCBGTNJMw?=
 =?us-ascii?Q?sywnZBTq+JfkjlRjqRHP88EoJFBDc8CcRrumFaQR7YTJ6AFk7lAJHM0Dfnxd?=
 =?us-ascii?Q?oa5M62HflfLX4v6m5NS0mjoZdvJCOvQTaaAbLWyDYp+WfgoXQnKA0BfwnjZR?=
 =?us-ascii?Q?g+uw6aFqbWP7kfgCbBjSaRuptgXbBf1HvioP70PIB/bHcbIgFX6JgBMZ0BQ/?=
 =?us-ascii?Q?KDEcKpA9lTfRu5KUAq4r2PQo25txzQaI62+xG1xydybz1gohVrz16EYdUGzM?=
 =?us-ascii?Q?a1J/JC4hvOC4N9wxD720AyMICFw64JTOhGIKNtDc15aGQ2OcXMnsNQThUCdp?=
 =?us-ascii?Q?4xP/Z+Q9YrFHsbb7plIr/QW9LWlk+M6E9FFPJXxFPABIQiOxGR+anYRp0kWW?=
 =?us-ascii?Q?99GSx5SO4TknRqSfOkRgjTYZ8pdUIOgyyzYwDvVnmuXGmczjLP5Usweq3QHd?=
 =?us-ascii?Q?YnV1YM0jS43tDdsJ5nJMwWUMwd9GJyZytEfbqV+X1EeuhS4jIiJA9B9CN2cB?=
 =?us-ascii?Q?YfHjJElrenPNbART3x+AlfGIvhf252KnK2ceK94CKohlpMO1gZOAEiPWVtMD?=
 =?us-ascii?Q?g1y1cFSH9QgwO6EPpzSd3WbOAu3c22Pd7Mb+wmMtI1VBA7QxBfv0KWNWbvsB?=
 =?us-ascii?Q?OfsUaM66pO4blsHdeDJL3OpptQdUq4Zr5GZiAy6WuP5rj8qpYFiUhWk3rNAN?=
 =?us-ascii?Q?GnmL20czfnUvCa81mDyaRmpur3qyrSQjNaYzm18eBR8dNZO10LuhDQUTpqqR?=
 =?us-ascii?Q?zmxdifU1r5m6xUBKOo+0uAOISvpqGWOeS/0PxyBinWSJAcyLxAOB6jo0YcHR?=
 =?us-ascii?Q?wysWjqtT6EwmdKQy7Y9J+FRFiRNwH/4XiSZMmwFIflwJqGZCRCk/+KFqiAST?=
 =?us-ascii?Q?9uBGi0TcIqnbhgZvpregS8sfuUo5XuPPFs//m8zYSUBIHT3DYS2/ksEnU0lw?=
 =?us-ascii?Q?WMPobUNWohMnhHTKg3mBDemxea8InDQI/cObrwtonSKNJBsiUtR5VR4sbheo?=
 =?us-ascii?Q?FBriKE5SCJOZsgIqOBKADvoEthpBl/KNpd3+NaqxNwkt4pB4wKQi2ElRYQ0k?=
 =?us-ascii?Q?6EHYYdeH7v/4P0RmC4G/VhA=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6254f5-1e34-4585-31e4-08d9984bf359
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:42.5012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jD/1QaGGSWSjZ+g3U5cJ1Dtb9eFfaKfjRO2xaAplfxYotnbN14LyS6UYkdfJAszINyh83q+FHsT0URDCGugztQ==
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


