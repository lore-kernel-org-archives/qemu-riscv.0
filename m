Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhYsT-0000Iy-5h
	for mharc-qemu-riscv@gnu.org; Fri, 14 May 2021 10:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=761afde0a=Anup.Patel@wdc.com>)
 id 1lhYsR-0000Dz-Td; Fri, 14 May 2021 10:33:19 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:4336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=761afde0a=Anup.Patel@wdc.com>)
 id 1lhYsP-00075s-TP; Fri, 14 May 2021 10:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1621002798; x=1652538798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mSKQX2scjYO0kQ/NLv/Uc3/4MigoS/+nvPTLETUzKGc=;
 b=pud0HS514FSH3SueTjZkGJvdHnePyni8GUXmS4ZxoFSas2KDRt468PIM
 jsmOVowbqm9saAOZhEG+x3KVuStPcVkpjtHS7xergVNYyzcBA9wfYQeKl
 36vMT9fwXrQ7ULwFSu5dC3NUTfLZOuJwWwSqrjLKokIdLQp3S7hB2sZu6
 crpFP5stDFF+EbxIf5oRUUUVSkJE5XVcKFrl+PsbHEaaQH2PzscYxuudp
 5ABRumOzv2eu6XXk5LmRti9PcVSp2zU/nZMc1ENY0B6jfv+YG/yPSsiRe
 m6PgL6DhtcZRrn4eK6TL1/6ttEBf2v37crZ4NkXxKW+wBM6awhmZAdDeN g==;
IronPort-SDR: NHw4RFKhRJULIzpi/4dp2+f5063kncWBuRLJcXmEfYOKdDrX0PKmIohq3J4fVcBgWBILgefkem
 rhfgtIS9A49T0h34PLD0xB8IWuCjZfTa7GDl/L4KGKLO6+Uf/BzOuLYvFSBoCVXZBIfWI5ZXIa
 IRb8i1rp/RBcUNQt8MbDw83ovJgSUmpCdDmxC/mczSdK3vJg+c/oYTyNrtTyH2/e7BdKryr+Es
 QjVwuf2eha0QV5CfXbtfv7p/Qb14d2Ea1JEB2vlxDVI/abiVIoJqC+GlH2f+K7Nxx6B0Kj0Ca2
 KNE=
X-IronPort-AV: E=Sophos;i="5.82,300,1613404800"; d="scan'208";a="168759605"
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hgst.iphmx.com with ESMTP; 14 May 2021 22:33:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiOOebElWmajJ204aNtSX8poDpmXyyn8NDz3PGCo5u1gihia2/5QElEaycoZb1R92HZIXMFikOvJ4Hn9AMzlDahON5H68fIfBXvkpnJ6iKa2rUStkPhD4sHAiOYlTfW6kKrt9SZ2d6iXD4l/NbRb08tiSLSegVx35a0HzPluuCHYwE4W2RWEvqfWkvk4ziMTNJNqcs1sl5wUC+L3Y/lsJpDZpjUzgfK7O0tfbC7w25qLyK7S3IGvOm+NgCLjtPMIYv0lJMigo7OLnI2ZpaT6d/MaPSbqe397zFLlEw4Q24jP6Han5A4WMCgk8BT3+h51KK3rh5xq7Sl4KgG6F50mJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BO7apSkh5on2A7azci+D46uso+TY/gcTHDdMRls6lOg=;
 b=kfZaFpbe3KxZpdky0jbc1FxVTKk5nClgrkiU1jEk7DyJZEmwvv6tYHOmLSQpI4Q+qZglOSmvuJ7miepgHlh/SIQrymJw/JB4zLzUiiodHiuLFMGPUl0+PUoHIyB6k/QGoQrCe8MZsoDwBGrpBnrNluRQjD/rnzE9mCMOrIKs7sfP1lUFlpr/rnXCUnEHke+2qR+kzA+v8jmZuUSS4gt2DRg2BurxXHdSMfWwVO51T0DEYjkTBa0JXoEJIAweKzPW3NaXbQ4QuKX0hYMj+UN3awGom+gzJlJNWwdvqgXd4/haojPKDgscgNgm6ImhIULgKXmwOQc5u4efVblqK8z+kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BO7apSkh5on2A7azci+D46uso+TY/gcTHDdMRls6lOg=;
 b=DuUF7XUyCdZ4HI58x3+QY4At675cOJZLiY9w7HlMCpsTi9y4IFgpBMblp3cqhV6Izk4jLJeNGDuYd26SWKXVhqwDdM9E+rrfUbEgJQCztW9LFvQ8qWFOogZfW3jYkThTD7jd8KvPCjnLw/6oX2jIO/zi+PSbg5bzKyFhmFIuqPg=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7810.namprd04.prod.outlook.com (2603:10b6:5:358::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 14 May
 2021 14:33:14 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::88a0:bf18:b01d:1a50]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::88a0:bf18:b01d:1a50%4]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 14:33:14 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH 2/4] target/riscv: Add CPU feature for AIA CSRs
Date: Fri, 14 May 2021 20:02:40 +0530
Message-Id: <20210514143242.377645-3-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514143242.377645-1-anup.patel@wdc.com>
References: <20210514143242.377645-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [122.179.90.73]
X-ClientProxiedBy: MAXPR0101CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::32) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.90.73) by
 MAXPR0101CA0046.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 14 May 2021 14:33:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9708a108-c452-4033-4f97-08d916e534db
X-MS-TrafficTypeDiagnostic: CO6PR04MB7810:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7810B610E17F9BD4FC2D80798D509@CO6PR04MB7810.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vh36Kx2n8oorANjCkIXpPcu/6omp05N23S3HK7RZrxlflP1yBp6oSTKhPcV7hKV4Guti5SNdtpdixR9MmbLT7/ah57JcN0Hz0qErn6MBXs8tIJbefM/cCqhY2gGH7hDx9Lgscn+wOSgmCzW+8UzT8ss8KR8jVQuHhUvUCKHvIQc6YHD2VBXzy+hG8bnWpOtCpsXe8jDpWjwxpd7Zf6drVFeYbt/NWUamJj+OqxJyAEOmcTU/oyV9PLgeBJyHkYC1AQwNwFI+KY2EjoBlo1O1y7tNPOP7bkuSmBw3rw6CI52Yw/dFZbQSbGhaW5NR4c2qNP4n0NF/9j4Gbvbe0VXhRGqmbJ1v/gZhCGL+wpXVdatTSkvhjS7TUJYZi5KJtBCEGr+YLIBrfjBvdIUFNN+abCxCgPPjcg3LOD1+tfp1rC2P0My3LqCHHm+AYsU7WsiBFW6tHiLIvJgkc2LhFp3OLDpQ/QWgIuFHojoIAmka/98unSkFgfiUUngaVlt8/05vp0xeHjlpnWT/r3i6XPkCMNLMUupBJBDaV24VfbFTKlXFrUmdPkYjpNPdg2DDSHpe35HlQxvq9w2/zmo822Gf6Lad7oj3GkeEMdjlVXIo3S6rMUSuv64pvWqc+L4BRvngJH3Fs5ZsMBOzKxDFaIMVdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(346002)(136003)(376002)(366004)(52116002)(7696005)(1076003)(26005)(5660300002)(38350700002)(83380400001)(86362001)(66556008)(478600001)(36756003)(8886007)(66476007)(66946007)(6666004)(54906003)(16526019)(110136005)(186003)(316002)(8676002)(38100700002)(55016002)(8936002)(956004)(2906002)(2616005)(4326008)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GmPT+W2xeEOLitGtWg/iLjpjNcnKBMVBZqhFTV65h0ZAM0AWBaL2IxQ0OkFl?=
 =?us-ascii?Q?S4L9T1zlcY3RStaFE8iWOiDULHDVekGlQohc/6C15tU+PrSfAxlMC5+5Cn7F?=
 =?us-ascii?Q?oXElPiZ/pF2+Cdwhpnwr/j7AUbT25zmVXmSZL6q48fSKJZbuUG9PDRA6fmCI?=
 =?us-ascii?Q?6Y2WuQcuJwOtufIDPx2gRjyL7acpXk+wZkcqBjuIPhExNAOAr2Sl/exwHI74?=
 =?us-ascii?Q?2kE6ZU4ldR43L64KAAM0qoD++YYBtqDb/Nll5SZ/5L7y+uO0eTBnSLE/nX+m?=
 =?us-ascii?Q?NWwM379S2CDMmSXB3YzBbRigSWqpBUVpAFKa82VswYlwn6nUOFjDqxQTu01z?=
 =?us-ascii?Q?j6ewUbmpa6yb5Ii45tR50KjX4qWFz3Cg+gwI2n6DBTu/IYLs+FTjQTjiR4ne?=
 =?us-ascii?Q?CGuB5dmkmlF5KuPDhsvpp09vmP+AAjqseM3U5ey1KQT2KSOeUqOnW/ZaRhLU?=
 =?us-ascii?Q?FWFe/zzJ2FeXM4Cv3Ufo1Zd9KVPldbx15R2J+Yc0skeyrKsYkaDtjU1meHgD?=
 =?us-ascii?Q?yYLjYm6ntjOmGPTXkZwuNfRkJ5jU5femDqqCTjHf6Rv4IIqB8ZL9M7nGWomU?=
 =?us-ascii?Q?qoKgdbatYNiHUEbnwCQGG91OtcMM4q6FGpbuQT/a/6eP5BgsWjuhJX5M2B66?=
 =?us-ascii?Q?3KFyFXmbfLGe/OhdMsWCEQeXl/A3NbLm09/jNkkZiFKnhzA0vZusn0lHIetb?=
 =?us-ascii?Q?d+PoKJt6ucfNvLlWZX5JiDO15VaOShWoMYzl4pPiidnCO79fjeYz8appgQQS?=
 =?us-ascii?Q?LrxelDGMICEgLbD98Hc5t7cOvXE7oYI3Krm9fB2Ileilh9rQeIEASWWapQit?=
 =?us-ascii?Q?fLANNIGTbrD+8OwWLOYWoFk7MUz4mM9cZYe6PDgaHpWTHBRjHkI3RS5K++eu?=
 =?us-ascii?Q?KAeWNMcBSNadMvgKg9RDYaUuPqiLII4PgB/A3yGu82g72MvO4PFHRSmIszrY?=
 =?us-ascii?Q?XvS7GB8SElIyConVEVaKGGvwj3r2XmtdAs7LiY891hAb0sZm9yymqjZ/aE0U?=
 =?us-ascii?Q?6/sPCKU25ZVSGq90Ryx0mdOovzsHr39QlI9ulOUfop889Z288o748bsB6dbL?=
 =?us-ascii?Q?/KzlulcpNtEWJSskpQ0miaKLYZGrjmZbqTP3p3vRB3lT8hBIQdb5TzW9M2VJ?=
 =?us-ascii?Q?wCJ07uAOSvGt7cPA/mTPbtSZbgBlT5pEJQRKfniZurAaAJw74RmieH/MCNkF?=
 =?us-ascii?Q?CnEXZzJtY+VozPqJ7nlUAJs+3/1L/1ZMutO+6aH07xy8Yz0VmQPyr+WEWE3O?=
 =?us-ascii?Q?bjVHSErPsXkuVlqgmhxTbvQ2AiviW3aACBrPJIAxdGrGf/kLkkvSAMkPnRX+?=
 =?us-ascii?Q?uUgwXZvZSpplmEMey/Y7wJXA?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9708a108-c452-4033-4f97-08d916e534db
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 14:33:14.1179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tlcItBSdeHDbqHRVWIMCBlgHQV53tc4OnpgqwiSlAiSiEYuQbnOytv32DHowzmHRbF1MdCloRSMM90apkLLig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7810
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=761afde0a=Anup.Patel@wdc.com; helo=esa6.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 14 May 2021 14:33:20 -0000

We add experimental CPU feature to enable AIA CSRs. This experimental
feature can be enabled by setting "x-aia=true" for CPU in the QEMU
command-line parameters.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b..f3702111ae 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -414,6 +414,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_feature(env, RISCV_FEATURE_PMP);
     }
 
+    if (cpu->cfg.aia) {
+        set_feature(env, RISCV_FEATURE_AIA);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* If only XLEN is set for misa, then set misa from properties */
@@ -554,6 +558,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba..f00c60c840 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -80,7 +80,8 @@
 enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_AIA
 };
 
 #define PRIV_VERSION_1_10_0 0x00011000
@@ -303,6 +304,7 @@ struct RISCVCPU {
         uint16_t elen;
         bool mmu;
         bool pmp;
+        bool aia;
         uint64_t resetvec;
     } cfg;
 };
-- 
2.25.1


