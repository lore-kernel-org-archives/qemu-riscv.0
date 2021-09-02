Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrv-0002J1-45
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrt-0002F5-Iv; Thu, 02 Sep 2021 07:26:53 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:33004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrm-00034J-CI; Thu, 02 Sep 2021 07:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630582007; x=1662118007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=57v6PbswiVHkJJUhET7nxkAv9tWLT+UP0mP+ReMDEwM=;
 b=I4VA5AwOm6zHwkpLNchbJJfQ6xI478BzNIjumoZOGp30VkuU8id0K9VT
 hwHPCUFlDbN6L79W9MEZ3vrYyK4ib8gZ0GbhuIIiMid/YOjpEkES+o0jW
 dJ6QCObKN3nYveeXEtQy1apVPdfkl2BAQhEoYmO92AEYAEHJjlGZr5icQ
 VOMujSrhTvzo4FI1BTbkXS8Xe0IOoWSsvkmueJ7Rl9wiZVsaN0oKd8km7
 hOKlMT/dEkIzJ0/F0OUHkz2HQqZCwTzZX7MSQSeHMTI8/Plgzj3Iqc/RZ
 5oF4E049h4tgm5ZcuX87EQVON/2JeEVoUC1pGAXD+sCd+V8xzLU92J5BH w==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="179581941"
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRLLAs6bP802M7ShAEh0yuSfC0x5Jekj0sRew/JSMhuCJ8DwQb4AsyTX7jcC6LOjI9Ne16jMVr4MHOrCefqiffFUKmLLxefas9xhUEbLL1SFBsDPe0Pso3ZZJs6y0TFYO0nH54Mtf2O8H7Ppdv/QlNobtrG+IyfgqGzAnkXIyUNW4DMvlWHLjlMiGTqLL+5X+bGqmv2zlQ2AptPNwqCIwl4qi6i0o4pYstBmO95GE9Bh908uCQaA7DEZyY1qmj0IQdZpXipt972YrJPd13p6lXP8qD8x0Miitqt+0/N2asQH++D5XRKQXR3/Cjm/HoZg3nPE6JDVCln5j2/yAWZ08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Urty9Wc63/MjAtC8oiJFNSuqz2vpjdYBAEqHDFGohXk=;
 b=jReH9hZEQ5rHXDpAIDllv2cjrrjirtXM/XvawIirkrU7ylHGHMVdTM40JY7HozGzO1vli84IGanq67zUxM1kutCejLAVGlSsIMqGOIiTGiPWkCE19UBYYMshPm2ms02EJ4cWYq7igcn2MM3MmBzC+G7CwE+2n1hpA7EU+Th+7DovUXo20PZrGp30XP1GBCDTY0WobNuHGK7kWX5qXU9969g0nL8UBdNDiZixpB7D9kfq2G9lXYTa8SfyccJ4/zNEpWT8mO7iKjHsP7f6A1cttn7G0GAe1wi7wJ7D38PviZr40i25Qtd1YHtXp6xEulE+a7OJ6brq8giqgtG53VVYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Urty9Wc63/MjAtC8oiJFNSuqz2vpjdYBAEqHDFGohXk=;
 b=zOl7pbYjGmaQTlymBFrPpDq4LrJfocEV5mSiB+VSwkbRaymrfwOaTZxUG1ol9JsIhnq+DbNgR8kLVfoKjytEUm8D3DP/9wSkLTCneZbReKeMvTTL7cK7tlDzR1Rass7KucSaON3Q6cdiEDPFb+E9vEdP1efmClT89Sj/k/GsMI8=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7841.namprd04.prod.outlook.com (2603:10b6:5:358::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:26:43 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:43 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 17/22] target/riscv: Allow users to force enable AIA CSRs
 in HART
Date: Thu,  2 Sep 2021 16:55:15 +0530
Message-Id: <20210902112520.475901-18-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82835e77-2fbe-49b8-31dd-08d96e048ab0
X-MS-TrafficTypeDiagnostic: CO6PR04MB7841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB78412F0FE16F08537AEF878B8DCE9@CO6PR04MB7841.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tBSsaAm1rPqhf2UpWbp3kvTodbAKFNFLbIx71JsEWKjcEx3Xh6jol5GTv1oIbeS8OMaOAS8lkh9m0eEAHBxIOuNCufSj7xb0HALaXf9Fz2uLxqoRDdfV7CpGFJdRVU6wWAm7AqB+jFGaRIWB0i8HPxGFRY6/bJUyjCNlYFLX1IVuFG6KKrYGpB0vgM0T4drjL71JtN1r/BgYP0LXybNI9cJsr9P7FdNWkO9ueXp3i5LGSKL7aXSLnhs2mU81jUV0v6t8v3dwYAVgEQfhRt85tKwr5nitGhRN7qiZ/6hScdsbYFgDsEiyQYL8HIt5a8QkC+JVvsfJr6YWj5Z2GhBWoci1JwTvornXyY/BEoWI5STUFsh/d6bHFzoiHx54B946UC4bvYhu7m7Eqsfd4tS3jLarVvnDK0sqG0zPuVhU9PYhsCE+yXWD/gmzpwpqkAtbeH8KtS0uaEA8X8d7xrwKpSvuctU7xpxhVcSFi2ALUcoV6ctJn4L7akwcBJMkybWTS2DqfM5q1+cFUeTsBG+biNrghAGCL+AglTgLJydueTmiSuPRxFb/KyMvIqLBUldC7vhWDLouPiE2I/x9s2aCFaHeiBTQmSDwjdYoILBmv7Qk+Vzh3qau4MX1lfTHd9Rr/xOlFY4Z6iWI4IvhSTyjI9jgoeYzAu05dq6koQgYshOICu8t8iRj6bundqB1Z0Qd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(38100700002)(52116002)(110136005)(44832011)(4326008)(38350700002)(8936002)(8676002)(2616005)(6666004)(66946007)(5660300002)(36756003)(54906003)(316002)(66556008)(8886007)(66476007)(1076003)(2906002)(7696005)(55016002)(478600001)(26005)(186003)(956004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QIYj8FhNyyuVThgVQCgbgGe9j97alFWilGZoIcccjQClYdzGu4C5PmAAD5PH?=
 =?us-ascii?Q?pmRBGXtyBOaAw+dnPnNoWKjLeyxx3N4Ht0LvXRSs/5rC+jkmHnlUN83nWctY?=
 =?us-ascii?Q?yQPmkRcxbSyi6mkUcTvKxjfZcEo28AAgW/Wgv4n4cGbgrHQo49Q+Sp7rNL9d?=
 =?us-ascii?Q?1F3iv8Q7dj2bBlrItOvVrC0NO6/M/Ewcu12sxAXgga9aNT0s/0tnvm34LRga?=
 =?us-ascii?Q?jjk7+AusImqJ9LuTKh+aRQ3N+FH+iw8GrncUAO29EqNSmBHGVborh+LcMT+D?=
 =?us-ascii?Q?jBb7OnNfvmqzrCkq29hr6F6rDi8jJjDTgfTd8i501UYUajjpVP9eFFVJ9sm9?=
 =?us-ascii?Q?nLqsQ7zSsI+j7qOD51XRRE/e3BZN6mjNi+UGt+Oh4NPlT2YZLq9TPBKaU5tX?=
 =?us-ascii?Q?l3yfg8O2pOLe1rMKg6lsPw0TvYyK9Al1h6XQCUruPgNTilXBF9TWvA6Xz9gM?=
 =?us-ascii?Q?28bKaSn/0JLEHSh2QsDvZRFK8WquUqqO76eNs0//DCg+B90smVCMRyKpc5ZH?=
 =?us-ascii?Q?BP/b0c//S8y9A54sKHTLPLCCaYjBZMLczQxRieKqGTJZ4e72oFgUy9aBym6L?=
 =?us-ascii?Q?vGQ98RVffk8zw6r4YLRDW48hVxEJ6bpwcdDZ/nqYsgN2PxoNQgDQ4zy70Jf0?=
 =?us-ascii?Q?HQIN+MHfrhgxXjeAUxdkkwLQxQ170I1+1peIwrLtkq0l8kH2VhJHXZNb5I+L?=
 =?us-ascii?Q?99ThkFpTuYf9B+0cTj6HPrWV8yXu22gyr/nLjXYa1EVDw6ygQyQUNHfSpcWp?=
 =?us-ascii?Q?gIuXRXWik8IQIcWugmCEGT8hviX3X8QLIqYHzlLhicizf/oqWA6HeyWhKIpa?=
 =?us-ascii?Q?SphRo3opl/eF7TMZBeZ+0ngabqS392sblOQ2D32zKhgpUW3Rqze/vN0PgJf1?=
 =?us-ascii?Q?8a+5nSuhdsVLn7gviNi2mcx2H2MmiYoK0lb6bn1aOWKNo8jCZ4Ab6lg+MwHz?=
 =?us-ascii?Q?SBdgLGM6NgmIekxlsbVbdY7lDFM64F0v4BRtAnWHgF+HBzibQ4IshwIerqmu?=
 =?us-ascii?Q?PjX0aTcd6lmA08trOdrAchyFyg9DnTIXeDfI6UdkQWOZ868qwDuQLAoCZx2Z?=
 =?us-ascii?Q?SjKMoRpVr8q9UTUk2S1vOgXjGRVNroO19K88EUA+pnoWWSHghluyzPRQhsQ9?=
 =?us-ascii?Q?sTzl6ZDmDEDL0j6dCJJ0iUETGrHEEN8Kob5944pn8op5ZPU9I5wPUBoB8Nhp?=
 =?us-ascii?Q?2Gwe3ZukltjZ6JHF2EEMkB4AVpYZGZbFR1tIv7RJYedn/UzhiLenznsEYkMm?=
 =?us-ascii?Q?5CRCKyJp3b/oudVTVdvS5tqqMZzXZm1LQRdGnMMKX9bFC828CDWitJN6/mHl?=
 =?us-ascii?Q?0tYD/LYdxCTq/4VgGD/UFmwC?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82835e77-2fbe-49b8-31dd-08d96e048ab0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:43.8111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9os4xs6oKT6XZ8OkYr3emXwPf4rCSv67I3mI0/Dcbx20G7aHgPx8+3v4D6DspgyP6/hipCNwiSF6ASAj4gKqRw==
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
X-List-Received-Date: Thu, 02 Sep 2021 11:26:53 -0000

We add "x-aia" command-line option for RISC-V HART using which
allows users to force enable CPU AIA CSRs without changing the
interrupt controller available in RISC-V machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e0f4ae4224..9723d54eaf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -452,6 +452,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (cpu->cfg.aia) {
+        riscv_set_feature(env, RISCV_FEATURE_AIA);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* If only XLEN is set for misa, then set misa from properties */
@@ -672,6 +676,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
 
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 16a4596433..cab9e90153 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -337,6 +337,7 @@ struct RISCVCPU {
         bool mmu;
         bool pmp;
         bool epmp;
+        bool aia;
         uint64_t resetvec;
     } cfg;
 };
-- 
2.25.1


