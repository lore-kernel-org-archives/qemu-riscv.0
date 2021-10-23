Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meChi-0003k6-Ji
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChg-0003et-Lc; Sat, 23 Oct 2021 04:48:36 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChe-0007M3-1c; Sat, 23 Oct 2021 04:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978913; x=1666514913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HTYIOb6C2qHs7esQRqgXBd67VP3nWWSgi2maOSH4iPI=;
 b=jgdSq2BKtHasYrSdOqT55aDASMP8XIEGOyf52Kfnwd+gmwbq9OeDoQ5/
 n9x5wmDi6RxW7TbxoAoaSASwklL5AkfRlBGNE12ex2QtdqAerUbY5qh0w
 1Ws16NJXojT8CLzYnj1RIq6+XOtorMLcULBd8SLDU8GFBrKj/lLWIp5BV
 M4xu5lOV3d2/gmXX32ksp6E+7pSNFoUnHzX/Sol4Kd9nsIj9pkJGBrCO2
 ZEPIB4tP1EVru6AICA3Q55nFRyOeHCk28cmUrwfaJenmH1uwk/Om7K23c
 ZrZ1YFYm0go6K6NLSkCx+dXDt35ESw3ugERYkWbWQF5tgcKXvYGffJyLP w==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="188437393"
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:48:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eo96c+DA94Fj5pUQTJ5FyH6svz9RcQ788HHpARYtBiXWqTEWm5yfR3M9CXHKohsnJPIoSjzyVQysMFAskteRJOgPaElRN2VirD0xEKqlbUEi+YpjdCxLe4poR+kv4qlkwow/QBsqGKOqx5RoHP0pAfXOqG/0LWeJKEJMtqYRbRXZ3ouxfxjr5sUFsqKlObi/LcVZd38dfxtdfuppQh9+sPkxHzIKK6edfrHzld5U0Hi9FKskUdo5IGg28LHUQnKOelvIpAmSJ1HEFEQIA9Eb4V4kZUFJ7daiBzObpzPYboU60i3oJNhqF+y+DEKqp3gOYLgVOBnFIpeVCT7jLN8M0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsjCn+PCJ59S3KqnNiw/JxRHOlAsA8UYUUIigy2RXOA=;
 b=iVcjAzOJ5IiVA35pql0DAAZueeF6HKC4cJHPoh0UbVpHlpqFP3isPoQDGIkAhL0AwLLjjdXtGGtvLy/BTIjsoqhK7RTmAWJ/BngoZUQ3Y7pa3nflZup3QXP/T2caU2YuzR0FfSZ986AqSgKFIn26lTLfHm2sA3HgbP0aElU2QyEEc60ibXBA0s/pI/ws+YC46V+qtpICZ+miiXLQA6U5qxrgQo8efsqdBE+ZHXhiNwa86BdlF3n+N+fdhA/gZ5MuFX7gE+B6UDljfG4Fo+UQUZ74bBUZ5LxwQc/UjE47DkAH61qE5MySqDKH1K2CbmflRYY8n3sYcRdR5m4HkMmXNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsjCn+PCJ59S3KqnNiw/JxRHOlAsA8UYUUIigy2RXOA=;
 b=aeCnCVHa97G05wkozQEIfTC4FFepckZifigxcpuHcnNqZpLI7unbBLj8CBG7y1TMnAmDQiXMQOvTfkQupGUPKZ56XDWRyaF/VtM2lyMxBlZ1UPkgJLr1O07SM6eNuYgbD++d+HDea/zi+MXfy3KpgAclvdagrqO/oHyUA5/jgpo=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8409.namprd04.prod.outlook.com (2603:10b6:303:140::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Sat, 23 Oct
 2021 08:48:30 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:48:30 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 22/22] docs/system: riscv: Document AIA options for virt
 machine
Date: Sat, 23 Oct 2021 14:16:38 +0530
Message-Id: <20211023084638.1697057-23-anup.patel@wdc.com>
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
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:48:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f01bebac-0b99-495f-f7cb-08d99601e36f
X-MS-TrafficTypeDiagnostic: CO6PR04MB8409:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8409105E590098C045E9A31B8D819@CO6PR04MB8409.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VmZqewpIl9vXSobVQjqp/IRHVVxdWOIKLOISNF77Bp94fyDag2q7SOnPEdsaxh8vraGqjY5nTQej5mPb09DUGhkWuxfpy/S5LGf/gOsABRdhXIWOwCTaFmNfKcx9+VSiLE4ioZQ+Xi6xP2bR75datLZWm5RT7DvaPyi5AqfBP3v2CULSHEIQS4RVU+2STcWB3w1wpQUXkQsZeZd0WvmbuN1EK2QUEMLKSCdGTTHpe1Pd9zDbQdRj3UL5ZWYaKx0wHV6i+3N1NH40xXBocs9HlCqNkTUakaAKKBJL1Arybjrqq/Qp5BmfxU/NRhKvqsEbC2J9q+oI6KesAosAxAr/qV3QHoRJXU1HWlsAthWBEonQ4VQgOU3TBrOkR1Rlf5gkOcgWNwJk2g7cRqq0qJL4sbK+UWPVNHjE/s3Z+2jDPfx2jf05qasvpEAOLn1ZGdTwznggs4Uq0UvHtJAjchaVfq7fCNewBWyoSMosAOihsz71UxeW4CZevRDTp0NqeZgQs+xjDTe5l55K1gvl8hr4SPh3+UosZLPXMHBB+9mrXYrAhVYXQNuY+pBW6FAKnzgZe0p0GtpMbnUn15FEw1eZPDorIyotBY90EKuGkV2b40G7zPnQSxT4D+eS5ufu2F0tKcO6jpsXkPTqPuDR2WmYgToGLfRgy4gIO12sY+dZmA0lGTY9s+URrbf5gIw0KrJVnaEyHRFHaIRB+53FIA6Owg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(1076003)(66556008)(83380400001)(44832011)(186003)(6666004)(66476007)(2616005)(8886007)(316002)(66946007)(36756003)(4326008)(26005)(110136005)(54906003)(38100700002)(55016002)(8676002)(956004)(7696005)(52116002)(38350700002)(508600001)(2906002)(5660300002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6sOFJn3xiavxDNXTdrZuJiuf9n0kk1XUDrI41h+dqpPPAGAl+uc7L/quQzxh?=
 =?us-ascii?Q?gdrxgMrGeMe/C+m8fzKVqy73NDn4SSTArhAclx58JZ/6tbLBOLs62KHEE7wF?=
 =?us-ascii?Q?kIcWGLj5kMbD9trlRx1ej26sPR9yU0pKcR49q+wYgSh8FeaZ/P+BQnkEXzK0?=
 =?us-ascii?Q?QWAZhgcp4ofL/P/SdnvgSsv80IitvC6bS6dxSwPkxrt4ainorwg6UlkztEU5?=
 =?us-ascii?Q?qcEiQ5wtLiYPrtE8Fve7bXusKW0m0pqgHifsOfhH+6Kw+TViJdPTDSdwMWxj?=
 =?us-ascii?Q?aJcbi9XTbL6fPWN8G/OGE0Gvsa+xXTAZa6wnbiaTqI/t+Ye6CHmwsDFM/WEm?=
 =?us-ascii?Q?tykvLV/qU+EGjcwOYi4iWPJ7kW29enCRc+WZKiYhDBXHVim8y7uZHohFUf5b?=
 =?us-ascii?Q?e9Sk9G0Jc6seNx+IM06d3s1tTBaPw2aaDFGkghXUHXd9ofZhv7+4WHqecgXs?=
 =?us-ascii?Q?gRCOZtjOK97oBTBBw59CohOC6u/oJ4OG7xiWMSZDKdHrZU8i1mvQHzmkREvE?=
 =?us-ascii?Q?1xMzh/Xa5ubNX6fNym+yfAEXSbK5Q/sMPY1apbRhTZ3tFBJ1AmOTnUf39NKw?=
 =?us-ascii?Q?nkTQLQIThz6pWf29ht4EWmu6d1igqQJ7TvcSbBGZCuHyhpuCgdYIhpabE8FG?=
 =?us-ascii?Q?cjXMfbrmMfN15UxZPPsb3hb4693EcYim/Rs3SCXGaTIvKbRnXVXQuevJWEE8?=
 =?us-ascii?Q?KneNxSRNEhG/aZI5jbSDp9onKzUyiiyD69kK4VGu7PyWcFqHrlnMRbZurUCL?=
 =?us-ascii?Q?yewPHbmpPKyfrFaNhqJPxbrpJce5lmFBdb5BiELGVDFtZ9THh768PxHRYirr?=
 =?us-ascii?Q?OsMe7zmZe0YVHW60ICD9kusP+ueATGtrG8tcOxAIAFBoFrxY3h7GDikd0kQn?=
 =?us-ascii?Q?zh/fGXp3nwBPQmsgPYneIkrlwnoLKUAuC0Gmtk2xSLqTEquK5spUwU4kroyc?=
 =?us-ascii?Q?t/utJUceMrrZajWuVbejJyNZRn/R3ivPqq1ich3+bZ+jU/MuP/VBt6D36USE?=
 =?us-ascii?Q?U2B1fsOUgS08rNZcs62y33oxDJ4pnqnZO1nsqT+EAMEwjD+Bf1d//e8px9YL?=
 =?us-ascii?Q?VJld4LpMsrBPDtPZFbveilbXurc8n6+TMq0XhzuAq+QQKlbKJOslzTk2+N0o?=
 =?us-ascii?Q?xpIz3dumOxAbGxGO30AyiRhlzpQUzQO1eP6A6sUVGuYutxmvsnl8+tF/heJ7?=
 =?us-ascii?Q?+evdx+qItSzrJMiHGWNM5jasB/SwdP10yrlW4KX7f8xreQv9EPd670giwo7t?=
 =?us-ascii?Q?7QXxVx1UZO29dngd87Tl3E9LHexQMhJF0lOtCSRF9WjgjgRXPZZjYiIEueWo?=
 =?us-ascii?Q?iFrVZQojc9wTf3YIj6EMR7P3TrjZZnDweBWbJfnvXXDskBblcX95DUZokP/q?=
 =?us-ascii?Q?Bb13hF4NcOzOqb4qRPZx1EGjva8m4QTtCUQNi19VpFMOV93eHPsw9QO9X27w?=
 =?us-ascii?Q?pxq7S07exSPJ4oJ/7UMbDJUymxCs2Ea8iHdq6wQIMQRkgkkcPO5QmF9QsMD1?=
 =?us-ascii?Q?20C5DiQVXzGICMH7YPtcduHSjFPi1LdtIe2//pejA6AAqNGiL2lWjI08WF48?=
 =?us-ascii?Q?kG6TOe+gqMlrGGng7Hxe/Ky1bm9rBSm6wp/So7sIo3lZGBkCeo1NF+x3qT/P?=
 =?us-ascii?Q?/WgQSNJsBTjL+sv6/Q+c6e4=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01bebac-0b99-495f-f7cb-08d99601e36f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:48:30.5939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qxp+zTh68j6ZPR3cGhPXcW+FfxFLsX1XEEQ+v84cIYSQNvKq3PFrlU32yLmVCN5ZweZa58F2FzcPhqvOmw4nA==
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
X-List-Received-Date: Sat, 23 Oct 2021 08:48:37 -0000

We have two new machine options "aia" and "aia-guests" available
for the RISC-V virt machine so let's document these options.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/virt.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index fa016584bf..373645513a 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -63,6 +63,22 @@ The following machine-specific options are supported:
   When this option is "on", ACLINT devices will be emulated instead of
   SiFive CLINT. When not specified, this option is assumed to be "off".
 
+- aia=[none|aplic|aplic-imsic]
+
+  This option allows selecting interrupt controller defined by the AIA
+  (advanced interrupt architecture) specification. The "aia=aplic" selects
+  APLIC (advanced platform level interrupt controller) to handle wired
+  interrupts whereas the "aia=aplic-imsic" selects APLIC and IMSIC (incoming
+  message signaled interrupt controller) to handle both wired interrupts and
+  MSIs. When not specified, this option is assumed to be "none" which selects
+  SiFive PLIC to handle wired interrupts.
+
+- aia-guests=nnn
+
+  The number of per-HART VS-level AIA IMSIC pages to be emulated for a guest
+  having AIA IMSIC (i.e. "aia=aplic-imsic" selected). When not specified,
+  the default number of per-HART VS-level AIA IMSIC pages is 0.
+
 Running Linux kernel
 --------------------
 
-- 
2.25.1


