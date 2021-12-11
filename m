Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtrr-0004Co-Mo
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtrp-00045M-OR; Fri, 10 Dec 2021 23:20:13 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:50849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtro-0001b1-0B; Fri, 10 Dec 2021 23:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196411; x=1670732411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=q7HJvyM6su8e1nBdjMd/Rp/HytoK1PeFnCenN5sb88I=;
 b=PlAGqDcDDnYbJbkwo9AOzDhuw6ymRUmeKrmXdsWt2O3vWz9vdJs8Ozxx
 ewQKEGazv4kecSHvypUIR5oje+p6IlfsHk3WCk9G+BZPBtL4g674/f5+G
 Kh8eYP3fADE3WsscTfFleWaYrR+jeltNR5aWeKF8dqDB60R4d5dAeKveX
 0RPCbPMDgAUy4z29K5+HOEnDzQctIirKfloPheL6CetF2IhWUVtNEdJ5I
 B4aC7ViFXDzxWL2m6F2eVAGS28mrIsM7UoZiMhbEgCs/dFLhcLxqXCJB/
 1dV13ke1or60GtAsHtx+5W/YEM3obbu12eALfWfLpT1VDTphbrffQhOXV g==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="186970379"
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtXiilEJPxZ97hHdS3O1RU958b9OpPc46rWjCaeL4B1s9U4J3bWQNjnjPMzgYESMBLKrCdwBacfmhUutvkGRILaArc9PmD9chhE8ZVGnbpmooQZJLBQS+YarVVHlGSklhRY1pVoEnxslvkHS5837e5u09euWkWs6M2VxD6AaCzv/xaSaxTtH5WjiuAxSU4SVibE9hVnJ6BEgZ2CBdzhobHSxSXDUpmVuZowi8riLxFcjyLFx/9EmgurJ1z/2JmqhTu2DlvdKUh2OCnDpUuYF6yY8s3WPs6LCE1BetPwNSeiGxdJKLZcxvZCwVHnk5sYLUeVmCkWYFL48Egulb4sRNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsFPLqWIZAAuJbnR2m/3maGx+2oSdXKbiTI9Qq/KBPY=;
 b=G9LlQlugbmgRD29hO7M2GnAP48D7h9nJkbhDmD/fUDANLJPQyYqTFtwCzWnH8zeSldifyHLL9iBjH6nI/4yGkHIDO9QIhWOUXZlczlLDVsl/a3V7sdlveFs11Fuxtn44f3q+bNj9d/+AX5ZurWGvTyOIWDMUcp2ETIaQZFKF217Sdg7RgjU4aJ1oV45niTBfUUzVe/qtjmLzS8p+PXDfD0g+ztby8R9gGVFUnM7i3W5f+f9q90mlvar1mMasn92zaUBytN2PtwKDqmRLeg0H/5+WzwQEIIgObC8iJ8lrN3QuFDar+1Oa8tJcnd5nAXyJwixnvTJR1GRz1Zgm4UE4VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsFPLqWIZAAuJbnR2m/3maGx+2oSdXKbiTI9Qq/KBPY=;
 b=G9+kng4FNf7xDtIRuRMTbQICohrzI7wqvLIKebPq4pYIOCxoUwuR8Twxvonmjj0Ebf/f8hiWmEjyrKCo2FcA9p5Lr0ac33KSJ9Ip7TV5KvILb+Lpn5j0RUZZ5a/+l+jbik7ZiCKiNWFCQxUEhPH+wQjwe9UhE3tpcnLA2L2kQxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8265.namprd04.prod.outlook.com (2603:10b6:303:150::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Sat, 11 Dec
 2021 04:20:08 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:08 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 04/23] target/riscv: Improve delivery of guest external
 interrupts
Date: Sat, 11 Dec 2021 09:48:58 +0530
Message-Id: <20211211041917.135345-5-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: a45b494c-10f3-48d6-be78-08d9bc5d83a1
X-MS-TrafficTypeDiagnostic: CO1PR04MB8265:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB826556C50C4C48F6D6D9D3398D729@CO1PR04MB8265.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TThEDXi9faaZr6XgI7P1IJNlxTa0Juk2j43KypLJrr1h+zKeKTcNH7l5FWr+Bt2wwahIaZRVvxN05HBvhE2zQ/bFeL0s0x//CWVWvaVCTz8Z+sg62qlSfXgvBRit5MDH5Czfm3dU5P9FATf/p+HNMgIaNBqufnAf7GBFXzyIliMMnb/oS7vNE6EUE4+7aKEDzCt2D7e8Nhd5NFaG1ukmQNmoejZBFi3ZwJ5RMrjiUJk+vMWHBycfpOFnC0p5pyROMiNWyTPIADEYlxJgSlx5FVs+faw3GyfS7+dL72+NEqn/GytuusGqykbE6JB5eru/dRUjki3D4qHWMb5GbLHpp+P1YVNMswDZiFsno7bFMTe6hAIKZx5BjfhRhpeFd8muLehyo/gfwtYV5FsG6j0Vhhz0GN+Q0RDKBtDlQNijkR9zOOb/R/Ja2C9TM7662g5HLWemzBo6GNB3keYKhHZVltXfmrIdbQPXlxGW461gPhJVn19TZsV5pqD7ryYWcKPcJW/m+nwKedvYOeXHhdkX8ysMqChaKZ7YMSQhdz8Kb07YjwGmRhmma1UA88qx0dP8iEbs7Gt7io6MoRPF2S+j3IkI2zMjbzpeZShPL0ERuJCYAUGJjiatpt7Ffsy9mV5FezbGYTIM0oxqdUMqftAKLZqYmQ6+F0vOhXmv4BkpHob3p5nVk0P/dlvw+MUuTsS9owPgxWLzG8/RDKSi9VNcaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(508600001)(110136005)(316002)(82960400001)(83380400001)(6506007)(2616005)(86362001)(36756003)(186003)(52116002)(2906002)(4326008)(26005)(5660300002)(66946007)(6666004)(6512007)(66476007)(44832011)(6486002)(66556008)(8936002)(8676002)(38350700002)(38100700002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hxTvTHrRw1pnv0ot8/lPf1+lSHu9biwrN9FphDCIcbXUWZSF7X2jRrE+b8S8?=
 =?us-ascii?Q?m6I/cs08NAmmpOwgMLQweWaD9/Q3zcp9zjWRTeEFFtGjbQUQr2n1QHdtttGK?=
 =?us-ascii?Q?LtmOubwLDauG/gD9SpHjZnDHGb4+tvltLAoMeZ9s23jah49oVGNAS2rkWFUX?=
 =?us-ascii?Q?OkhXhx6PxXrrtKXAk3n8jy4W3HNKb+PJulYB/RFp/BT9ojUI0Y/cKk5wh5vd?=
 =?us-ascii?Q?CU26lwq7w1asWUauMlSkqiFt7QDC7lTDyI/uL8WSY/+dBMZ32d1bJL3ji0T7?=
 =?us-ascii?Q?QZDqaOPwkhnu1NUc3C9Sr/Gq8f1H545mSHBR6GNP/HkYMmV59diJQbNC0FiA?=
 =?us-ascii?Q?DlGVe6AvzuWHsuXKXOqPMOL0uNPW/DXSPn+uGfaxHi1knj54gvxYIAN9VDL+?=
 =?us-ascii?Q?AQvXeJJxAqiuIVf0vK0+/Pmco+BVEVO8QBkV7h8JH10VzSpkej/InnkLrDAJ?=
 =?us-ascii?Q?IdTQyFiPX2qUfTR6TxFinuKT9fbeOe3S779/z6j52wJ179lgm0Npap2vlkiO?=
 =?us-ascii?Q?uoEvvAePyHWeCyLEeKI6xSbg09O639fteSQCoLEhS9/imyX5xKqIIei9Pm8y?=
 =?us-ascii?Q?EpVEhr4Be0E5/LNFhZxWAWT0Z0TgZx1oPkum/cx9KQA0xCF6ksx8r+DkH+jN?=
 =?us-ascii?Q?R8O4b6w/8BbYdaMz/6JpjCsYLYr2LXQyXLHbl9Ug1uOeJAdJxbYnhym0neZD?=
 =?us-ascii?Q?vxfPHhAp129Y9nYHOoP3uF0gVXTHWLX/Q+04TBL7cHhF0TWvm92zZ1ldSUwv?=
 =?us-ascii?Q?K3xDeFlT78JYs2bCdn0k/z+QDv4fjJyRyRYnYeI1tK94s/XUOEOfSTXLSKgM?=
 =?us-ascii?Q?I7qF9O0e1oEtlXsZ7jp1FQSGHdR8sqp8INKKWUI2PMzvSiKjPaQAZovA/1Fq?=
 =?us-ascii?Q?zgIwZ2iXYEv+hS1KyewNEHlSMOx/+BRBYYhRohD+uI9ROvQ2z5bt9pZZBR3T?=
 =?us-ascii?Q?Ax6uQzqVv9D8F2Yrmh/8yin1Uox2FkLEqt7wQf4+7LliDRaBSBjI78oT/8aA?=
 =?us-ascii?Q?7m0jBvrwZM3bSQV/+kAC71qfemKPoKAqPLLvvUQhe26RPsqLaia5Rh0BR+35?=
 =?us-ascii?Q?kIqj0lH8gD2XhtDP8VcD/eWxKAwROmu9KeXV07h6Qfo4FRGoQXeybIR7nYDz?=
 =?us-ascii?Q?11IWidoBje6Lx3LykpG5YoMtm4z9498OVS19icqeGKFYxvrLnjuN8I6s18RD?=
 =?us-ascii?Q?f4U//BG4PXrPoCex9WI5InbNXPIAmTRcowB3cgccg3md+hlqrJjyOFrHE+Gj?=
 =?us-ascii?Q?Us9etQeFNFsSCKc89Wd9yqtOuxS+TMQjeAUk3278FHy3Aw9GgLi5vxS1L8h9?=
 =?us-ascii?Q?/7VJ+NXI0kmZQj4WaTv/E3YedruII/gJ+aucZrWpRRSwkKPqqAySkmTIE2zJ?=
 =?us-ascii?Q?dAHYcEcG+Sz9NVbMw3x4s/mZVEp9pcAzMOukCAAZIVf0OYL3uoL1sWa/84FU?=
 =?us-ascii?Q?IVCnZsbCXmZO2aa3Y0JTMBjsqQPBYGrUKjkab3JHkEMz2cLTWvy17xoAW3a5?=
 =?us-ascii?Q?Ll4Z4y7kjVbpzAx+S+dAJyl37iAyw3SYv+dyiymoGocTXQxpbmdlwwaNhkuW?=
 =?us-ascii?Q?38Fpc5R1tZbe/wwaznvkVunSK0RQvRzwE27dz1+ABLh3t+qJWFWwGGN4kjAA?=
 =?us-ascii?Q?oI1hslsd2+YuV0Yu12b7Mc4=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a45b494c-10f3-48d6-be78-08d9bc5d83a1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:07.9781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyhpSrfywTwdh8y/fLWoQJSmDbhsrpCZKmed0nhXPhCDczfpiD1xu3DVqjy0gf9hK7KpcsFbVbqlpG6s733zow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8265
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:14 -0000

The guest external interrupts from an interrupt controller are
delivered only when the Guest/VM is running (i.e. V=1). This means
any guest external interrupt which is triggered while the Guest/VM
is not running (i.e. V=0) will be missed on QEMU resulting in Guest
with sluggish response to serial console input and other I/O events.

To solve this, we check and inject interrupt after setting V=1.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index bf28118ff5..1fa9f0e584 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -294,6 +294,19 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
     }
 
     env->virt = set_field(env->virt, VIRT_ONOFF, enable);
+
+    if (enable) {
+       /*
+        * The guest external interrupts from an interrupt controller are
+        * delivered only when the Guest/VM is running (i.e. V=1). This means
+        * any guest external interrupt which is triggered while the Guest/VM
+        * is not running (i.e. V=0) will be missed on QEMU resulting in guest
+        * with sluggish response to serial console input and other I/O events.
+        *
+        * To solve this, we check and inject interrupt after setting V=1.
+        */
+        riscv_cpu_update_mip(env_archcpu(env), 0, 0);
+    }
 }
 
 bool riscv_cpu_two_stage_lookup(int mmu_idx)
-- 
2.25.1


