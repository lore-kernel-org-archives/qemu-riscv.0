Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLksB-0002qW-EM
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLks7-0002iS-5Y; Thu, 02 Sep 2021 07:27:07 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:26553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLks4-000372-5j; Thu, 02 Sep 2021 07:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630582024; x=1662118024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IdgGJWa8B5qMRxpz6CE1lHAHsSLo2wkXFplvUQNVEGU=;
 b=J2w4fQ9REFFy48VXZFkNYw6+yaecXhqZ6uX8fikBsjb+ckzftjih5rmY
 ytgH9WjsyQshWGWE+45rcd+tA3Y6URMZBWBbW5kHxW5dTRM0HkS5P+t8O
 Qz5yASsO9VD0FMCbwzyJSE0Y28/F1GL17JcIStVP/zrTBgLTSDp19wFH1
 y/cm6npYrFrD3gSxOpAGB7mRSX9tg28aXszLUhc91L7TH7W6A1r3Cu36r
 iohbdwtcXcYhx7kxH2VpJ4tnxbzK+pCeKJRCCD7SdrM+Pz4Ofe/nTCvvc
 aUsVAKlamQgP91q0OIHnYr8PirBczuBWPstKBdznrdf52qceJTJBKrMC5 w==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="290644653"
Received: from mail-dm6nam08lp2046.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.46])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:27:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JacIYOuAJBuQ1lGBhDszXcNwABVBQJZO4cOi89ItLdp8AkGjSzAH2wNTq7LjVs2TNS6aX39oa+C/CoMnBhU5zeT3xcBowoqXPmZsKjKyhMOfsjTQbsBBU0Ly7MwDysRSRjhvv2ux0/ge7u0evkYTm0GhUjYFKwMIQxR/1Q/4b27d4pRqBgkoTq0wwcYApyuvW5wBRq48sjVuaZWoCiSCS43Xgi9l6zHqASZtIWt8C7EFFp8pyyho4v2ttujNJLe2n3J5isbQx/AWPZAJKTOgttP7eOsjSzKRMo5q5gOOIuMZj5e2+Ksvgb9di8UN6zUMI52xhMDoBcSzTZ77qq6tLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=czoIut6iEHA5103FmDq1MvuLzVsjm8bGij6D8ANnbtg=;
 b=e7bhVOOKy0/23Ji/ttdg3jL4d9T2cF17ZB4iG4Mjllp/5H0G02X1cyOxM7vZd+WnU1K4Fq/6ZTe53HAfOV+yffrEhE6Qg0QKthLL6aVnodpKqWgQoHymLHGK+RELr2Nz80b+SHRksiLupro6xLY0eX0TspQl88Q9cnc0m+cXUnCBia4Gsy8B6Q+7oqkZEhOgiEl0Y9C6DntsCLQSt5qKcda+R53KYUsYSti1M42qAg+eYj8cakFhvat9Nokyuz0ZW4jAEz9n4C7qrRUZ7J7oB44zsFVF2wYnAXPNk84MuuWGbyzPJ6uMWO8DlywOjj9QFF9oU5MmBcVe4H8UOFY19A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czoIut6iEHA5103FmDq1MvuLzVsjm8bGij6D8ANnbtg=;
 b=DED9FTHXwh3YcXjWIO/aQqV9DY0MKB+7ScJVOBhvPI91g0Kb6jG6wh0gbZiVm0/qZp9+E/i0kXWxRd4xhhzmHEOIcyY+8WQ8STcMB0d6xEJ0QeAXxCLbKwywlP7pBO6LBsuAeIuOsmSBQcfAEANL/S/y5LkEks2eBuSHdRZ29Z0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7891.namprd04.prod.outlook.com (2603:10b6:5:35b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 11:27:01 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:27:01 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 22/22] docs/system: riscv: Document AIA options for virt
 machine
Date: Thu,  2 Sep 2021 16:55:20 +0530
Message-Id: <20210902112520.475901-23-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a700e56-f30f-4ad2-9b8e-08d96e0494fe
X-MS-TrafficTypeDiagnostic: CO6PR04MB7891:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7891A192CCFE73BC61AB3D148DCE9@CO6PR04MB7891.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tGfIbtQQrTeJVuuLfB+DP1M8/WkxVguQ/fN6CeCi/KBFHSp7kd3gaxP5WBoZen8kb4ELwceC456rPC+YQ2NrtU4KYiRN8oHllbuYFUSCx7oD3LfIUNwOvzXGgP80jGR50d8mJFAYkvMDNVZMVtEyCE7ZG6rjc7+A8aHS9uJRmgXqldbCzrr+VfsDyP7qtJnTxCxsdsFlNOhqO5mFWt1BiRCAa/0CBr8VqyyhJG0xBAOlU22h4QAahDP3l65YtD7/dzEbQJ4j3/r6nTOooM/MkmpHvXU3HEbztJWNKwPzjaAXUUX7LB+2gppsA5teX+pXgqjsw1bKxIDMSxRqQ+SpZRsPgoPVU7nfmP45RiYcKlvqBane3sCHTzwobhyd+rqpNlBnSZrFn8r8pprlit7WKIiyQyWm3PxM7thw0fWzJXUWscUOYy7s0AsR/bGD8UrO/Gv7uuctndAlHnCTMqIQTw+X97YXCGlZlZiANqk6BedltjjzwTCGHHH3EbBvASWo/Yb5vDcT60PRsYeFvyv293nEOq57eocfatVFEnyMTrrJcJDDkvEEmc8KDg8CjT23ApLZ3kD6M1X2u1laC9KftHAQafvB3RkxY9/eaMg6Cl66gKzPH7446qeSWDs4dcutT+fJjTNgRAd1lFgaBiuxDTiKV6V/vz6PiG1awF0J9TnWZtvyUyhLQBj2zp2r1fgW84/MDpyyry9GwmdKouiY9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(38350700002)(7696005)(83380400001)(5660300002)(52116002)(186003)(8886007)(38100700002)(6666004)(8676002)(8936002)(110136005)(316002)(36756003)(55016002)(54906003)(66946007)(66476007)(66556008)(86362001)(4326008)(1076003)(44832011)(2616005)(478600001)(26005)(956004)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/AYowcOcAe7r0v8Kaa8TlgnN5g2+7n4D7t7dT+7gU4YEdURqu4PF9PyJwu6c?=
 =?us-ascii?Q?u03CsE2f+8rp8hzLLpeh54IiXBj6BVMxCgk21Z+VMDPz6bvtXSl8SbGUuGOY?=
 =?us-ascii?Q?NflDTtHawXrxktQ0mDBECZ9J0KNUbfwt20uT2c4xEPb4MkyqMyfB/dztLwjf?=
 =?us-ascii?Q?bQNpl9s/3YGNpW7we9GKpnd7DstRZvIKnVaxIWO2ZPz5tWtYAT9LZtIjjWUZ?=
 =?us-ascii?Q?yoFli1xUx1BxNhIkmMF513jO6WrJqqE0XT4lKQnovT3evI6LAbXP8HOIoq3X?=
 =?us-ascii?Q?gW9aNzFJ0E4RTf3dRF6QTtW7S8csurGXKG4huaI/K94DugfEYPexw/t8S+GO?=
 =?us-ascii?Q?vyZCQM3Qj/PNThinRQMuRm7zoLJBPFsq6dOXkpH83zw7paTx+1p/ZyI0n9Bk?=
 =?us-ascii?Q?UgBI7+6vz2QHcWLP7dP/Vw7MBDvDoHERywQCO819Hi86TeHVMNKTDB+Q80HE?=
 =?us-ascii?Q?1W9OooIY8njvfEgy0D8kEouf1Gfeo13M7GbFsuesPw7hpqcpt+bH492w4g0j?=
 =?us-ascii?Q?VRhDXm3R2djs3uSMX2T5xkXiQkKSPGRIdXuL4oADmn9xgxRXniRINoKot5bU?=
 =?us-ascii?Q?tMabsKCK+Kp8aH4uQc27Px1aIggz9TU2hwQ8wHstcyT6s8GFW0xKFt2mMJwd?=
 =?us-ascii?Q?5UOkoWOSgDnvmBApoz+vhh3d32r+Cui7z/1fDMqoGqP7I8EVMNeSAfW0lk+o?=
 =?us-ascii?Q?qtcxlWhljt1cmRnnDqw9qf/igjEUKkAbUihDpfW5t/UwPFKnYK5u2Xtf854c?=
 =?us-ascii?Q?+C5+hBBm/QWIGt94EO6WTY99vKJ2xiLp+HUBhb8VI7Eipuu7RozBim8eu7G3?=
 =?us-ascii?Q?JFEd/RvYhv984ZF8WjrgFJlG2+SZdaLezk6nnNUHAo4U0sE14f9FmEI1LTkQ?=
 =?us-ascii?Q?ztEbU5hL94xPKmg9yhgeBTKZG+KmmY0DLaE4QJqF22OmV5gOSm9gJqIb3uaO?=
 =?us-ascii?Q?ORftonsNc7J5bH0NIAfUB5Kxcha9Gtw4+6mnNmZJnn+BrjwC2IGDPG9/S36k?=
 =?us-ascii?Q?zD0d9mCxmi4T2CdjQ1IHVufHJOV9j+35Kd+Oyszn54XRWjS0/B/moFYgO7gt?=
 =?us-ascii?Q?jap5F9mEHDCKc1fr/rwUdRLBKsOKZbnoTPidJgkG70ztuw04liHWfdpY0w5b?=
 =?us-ascii?Q?A6Ws3yt3aJUA9HaZt5kHmGUl0+DBPhazSw2r/GRuPQ/vc+O5USAsHR9Wpsdh?=
 =?us-ascii?Q?oNA8pHEYr1vaFut+Brdv/W6eJs9lkf77IfgAOtet0mop+Ah18Zcs1lrcaZYk?=
 =?us-ascii?Q?899uMOBuLseiGt1G0DJjtVOb00jAI7CdJWGRR5SY6vumER/BLsFazt+bATud?=
 =?us-ascii?Q?pBhLmQ/NM+fXN5ZWBYSfo5zE?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a700e56-f30f-4ad2-9b8e-08d96e0494fe
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:27:00.9678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJfDs8a8Ju9XAXDC4qSgdaxnXbaLrBsNUaycnB2sp9bmHUr7QfPG1Gy/1+trjWnuCzEP/Y8TuFvSuANwgAnq/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7891
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=872ab4b15=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 02 Sep 2021 11:27:07 -0000

We have two new machine options "aia" and "aia-guests" available
for the RISC-V virt machine so let's document these options.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
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


