Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrX-0001D4-MM
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkr7-00010K-7o; Thu, 02 Sep 2021 07:26:05 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:19803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkr3-0002pt-UV; Thu, 02 Sep 2021 07:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581960; x=1662117960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gaVCLCT5nu5cczbi0j2zvGrDF8aN6X90pSzZe/7HHqU=;
 b=UpPmW7+f+EwO3ILz1PU7LSFWboUkYOkqkbstEj1Gb1c1AbjjVZmMtFbF
 yD7FS+lmRAnJIt3rjn4pOzskjrQ//xgoiqgr7SzmQXMYNVfVf8ZDy88J5
 +WGuyGRct3a1hZr+NvAJQH9A1vnK5EW1uZQxoD3SzsvylfQt2wipB5mwp
 ZVXEzm/N6zWnvWfLSoh0BIhQK9nsNvhPbRaRtoFbybuvirBWTedTN8Z6f
 tveyoJHQVMUEPHFHsY3CXdWNcN+mC6dqdw8mFElH3X/OHtEBFLPRzBXII
 tiKud7G1r3UC5MVMD5w4UAmZ7P6vHSY1coD9LeTUlirO4ab3q683XlgBA w==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="183824520"
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:25:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TL4o2+hq5K4OgcFLCG4vV0ejk0HU7hW/dN0k2gNybJsS/tvHtkNT9i3Z1z4EgKUFE9DcPQYyNoHaGoIyBVHHx2huywl5VY7y+GbHLltEVFc2bWnBJDQjziMraO/XixS7fmW26BawNT1OM65Ns+IAH8YZWeMYZo8uxV2H3hAkVsqi4dOPo2MIcMeWtbsgtoBlVbB8vtaNL6fwuqDeX4xgw+xsX7J+VMSB1PXi8wUWO1Fm0Rg3yZmV5VtZ8rb8m7T+PIaQhbhoSgfbVNH+Xx8pQmdqWSpRJzSbsxx+IGHOFwWFGIYl+HA/ksK0ixXgcQ4mrqm9T2XI9w7LdSAmwofTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=86p4n7wmpBtm9zpGinTL2tsKN7ASdpKmd8V85jQto0Y=;
 b=YOjdXcrDMBuWEh0yFlcxgiF5NR7WAAoDsW0j6ndPQ0syEqQJeD357VTHtQ124IOxkaIvBvbBeTIXrKsISK0yDvZ7kzdw9yytFdcOZTG5a+bk0mcUW2bBZNhEMbV7YDU+5FcEpLl8t0wvxmRGRUwLM7pk9HeZb38xR/4B0ZUSVcs4KNY1G8kAMCLLhR/QoyfEBNzm8zZTmCxngah7PDMufftCZf87Uu+7DbUEUQIZ6mGhW4K8btRw5whk5+FceDoddeM/IBXReKPn41TePc3rqju6ETfRc3Ze1n+KWQmQCqe50lMJqmddKU1mZ1bhE+AbNkL14hyuO1yOyxDpi+TIhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86p4n7wmpBtm9zpGinTL2tsKN7ASdpKmd8V85jQto0Y=;
 b=y6S1PVpc7Ip2fxsXR8An8VkqcBQuG2Xe2ujNVxPt9qJJSJY9UvUnxcuGovr+TM1Z2ctYoMVYP0q6bDA2gg0iPsnCLyB3HxpruEhr0LN96cqlipxhYdYdeWUHqE5RP9aUHoRNnsysIGTqwMWEnshrn5yQlmCl7eY2pdld3mmdGe8=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8250.namprd04.prod.outlook.com (2603:10b6:303:161::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:25:59 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:25:59 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 04/22] target/riscv: Improve fidelity of guest external
 interrupts
Date: Thu,  2 Sep 2021 16:55:02 +0530
Message-Id: <20210902112520.475901-5-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:25:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: deacd860-3d1f-4501-4749-08d96e047032
X-MS-TrafficTypeDiagnostic: CO1PR04MB8250:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR04MB8250B8D10D1092384FE1A2E98DCE9@CO1PR04MB8250.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8vCVZkdjKuxmpKy+XfFxJXdif77gBLMWVgDFsuc/M1qB3aK7QqFUaq/lAMuGS0xwSK7brnyHZBsubhYY6zRYjTSwtS/UBTJD4AeX3w9Zw3mSfSvvFkNZ8QyQzTYCB7/VvDd3GvBUiJB7hzc63dQNmRjE0GdxDmyk8r5x1Bm1E9321wBjPVIxERWtvZ2gMHUkS/pJgUuiSQdPPy93bivFQTR59M2dRj4lv7yw61pXRi5Q/fG60mbei1MesB5Sin82i7FE4LzDkSf6SS1cthZKWpc8vpAgJ7UQKlO/uEZkMDfvmoD3hHk/R6uqLTJPnfeIf6aYstJRivh6tn3lSX7L4SQqGgKq7g1QLI/dbleyt8yG3wfwv67CzjxvMjVjnL4IkKWXsizBbvr/7pQIS7vhxXuFKA6PiYSXeGY/3jQj1UFtbGyLua5NVCiraigw8ihkPvzlmroD4zDbZh+EZyasf2lidWgd8TThCXtrxTKgDhCF9h2i0Ws5RSXrD8Wo4SZDTtINVF+79YONMUAa1NUSsM8OydljJim69Z8bymfQf5uvygkv7U508VelrnYSMEt2aazqqPUe4T+HcJea+fASYjHieirsehT2VuKVst9dyoUhOUptJiKxz9eELTf0EvDg6d5HL9DGgtq1d7hbdWzfXvUcKYFYpM+S1QKOJEQzCaDQMFbFMNr8Z9R5nmyHRP1PD3o1aiyAa01iOQ1gJeqGJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(83380400001)(8886007)(7696005)(52116002)(6666004)(316002)(66476007)(508600001)(66556008)(86362001)(38350700002)(38100700002)(8676002)(186003)(26005)(36756003)(2906002)(956004)(8936002)(1076003)(66946007)(44832011)(5660300002)(54906003)(110136005)(2616005)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZI3EKCDLlasmzwm2GMQ3af7WSG7D2mh941w/xF1gHHk6mmAGcXPixAJMDnVf?=
 =?us-ascii?Q?1e64ERpJB0VObP66jBblNRt06w2H5cjiYpAYxEMSrbJ5qBn+7ZVLvhbNBsRH?=
 =?us-ascii?Q?0IXKvwjkRBb1PRX36ph+PeT9t6X63FftmM6yiwJhSXBTWrJy9lF+11AVTyVC?=
 =?us-ascii?Q?OsoQEtTwEsqVRnld0shZ67544OSXvjqxWZ+P+LMy6EALxhWtRSl61vR0nAkf?=
 =?us-ascii?Q?vI85arxoL/H0tN4z210G0osbUS5IBrI8j1TRs1SnHlqKWdecFmWQWS5IJwei?=
 =?us-ascii?Q?gC5O6cWydDVAzavszOzBGmLyqa/puy6vkGiVddW+d1xmVsr5sj9lTcJxxzxg?=
 =?us-ascii?Q?YOK+as00gvDf4LADJcyoNfSoNZyn7/7n43VnXC6EO74PGnVvWU9mII6vD7RF?=
 =?us-ascii?Q?EGJOxBD+jU8OMgEGlJ3tHLCG6P+OA+Fn7pHRnq6lc2MFnivuR8lo1YBF3rDh?=
 =?us-ascii?Q?jADmPs8YMw9XId2DPqaIDKzVcs+VTfcw40bE7rA9vLi+t9ZI4Mqutx+6f05S?=
 =?us-ascii?Q?UT9bnQZ7Xr7Nup+Ml0tvIWEJ2b5K4wp57jX11UgmUW3hwrnmBCyKsH2APwkQ?=
 =?us-ascii?Q?DK7xQAMpHF5XWMiMrJFDGskYdyT2cF7LjKuythhPVAqienhtLwOda539BIDN?=
 =?us-ascii?Q?sXH4i9F3LDYW2V/szWEpGQWcwaU7xU6mmVTPNbtUeSy6G6sveMc8kEQBIMn2?=
 =?us-ascii?Q?fye/h1poTikGaIIOpCf7yzpeHNQ0Smd3bc3nBd2tv1BKpiCqYbJH6euZg+xn?=
 =?us-ascii?Q?V2hzgkXLZcb37aH/YhiCskVAkv/0z1vJCeAQ/xSB+ofrpH0D3SxvafIaObQa?=
 =?us-ascii?Q?8E3llUty32CTjqA4/gr1cRqu+77yKzi4lS6ZKk8m9sJ1dSrRTsSp9hjQJeGt?=
 =?us-ascii?Q?ZIF27m0MGVEXu4Em08aEoBkMQuNc58QciyMQxpS7J4pMqMnEseLmRWq7+d/Z?=
 =?us-ascii?Q?bJyrnYkmYgdvgcet8bcY62CHJSnvkxIfTrhmdcZDKuMab3B4I8u+SsVps38y?=
 =?us-ascii?Q?Lfk/XZ83kX23D60dXq5aRrwpf70Bf8pm6sGYCdPEwPs0ai1SwfUY1DT7P01V?=
 =?us-ascii?Q?iCo6tMYuqwws/1XmWWlZ+A6GaWThMha1rEhIA9wjktjQSac/OoQkUeXNMOL0?=
 =?us-ascii?Q?BN+LDLy0r/rEpISXdPBTf1Oa1e8gvBgIIfFoC1ZUrhSv3J5f2eBxNz/1xn56?=
 =?us-ascii?Q?QjeXxB58cr3LwNsovLvmimQ9/Wd6VeZYw8GkJ2IOKqTs8ar2T42ZnWleacqv?=
 =?us-ascii?Q?4De9XOxYxfPBJrjFCz7UXeIZaQa86mDHS5m+ja48nBzU7ajz6oXkKq+KQavo?=
 =?us-ascii?Q?dt61XJ3A4iUU3CD9FsoRns9b?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deacd860-3d1f-4501-4749-08d96e047032
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:25:59.4069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5kP1qywXSxVqRt1DSkHZ+C5tHWY/WaVpWBsooAvjQR2PzQpPefxc8NisrlJzTwNeP2GFEm1sQGisEmr7b7p6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8250
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=872ab4b15=Anup.Patel@wdc.com; helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Thu, 02 Sep 2021 11:26:09 -0000

The guest external interrupts for external interrupt controller are
not delivered to the guest running under hypervisor on time. This
results in a guest having sluggish response to serial console input
and other I/O events. To improve timely delivery of guest external
interrupts, we check and inject interrupt upon every sret instruction.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/op_helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index ee7c24efe7..4c995c239e 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -129,6 +129,15 @@ target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
 
     riscv_cpu_set_mode(env, prev_priv);
 
+    /*
+     * QEMU does not promptly deliver guest external interrupts
+     * to a guest running on a hypervisor which in-turn is running
+     * on QEMU. We make dummy call to riscv_cpu_update_mip() upon
+     * every sret instruction so that QEMU pickup guest external
+     * interrupts sooner.
+     */
+     riscv_cpu_update_mip(env_archcpu(env), 0, 0);
+
     return retpc;
 }
 
-- 
2.25.1


