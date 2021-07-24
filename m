Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m7Ghw-0004WM-MH
	for mharc-qemu-riscv@gnu.org; Sat, 24 Jul 2021 08:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=832e875c5=Anup.Patel@wdc.com>)
 id 1m7Ghu-0004Vg-Pv; Sat, 24 Jul 2021 08:24:42 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:42833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=832e875c5=Anup.Patel@wdc.com>)
 id 1m7Ghs-0006Y3-FG; Sat, 24 Jul 2021 08:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627129480; x=1658665480;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=q82xw0lpdKJ9SZnaRqteBs6wt881jn1FcQITb+IiXvs=;
 b=He1ebJG20BLZAuU/ytgPGSEK7ckoqbGaqzGCYsow/A9/NdtZzBFykNKx
 TB6wL1haubzOZ7uty/HRpuyS1bqwtWiWToRum2JdI8MbiR/PQ1kD19YFU
 DkIxw3iGg+26fh3f+SeyNOhm4Q/Yhl29TUp1zofvzH4fZ0mZPLdz5IlVh
 gA+w/EzU0FluElDifHuCSk3oBOS4WXF2a1R/9KfCewwNpd/ygzQalgC/p
 ShkAmdG5mz2ijnHziEftwn8M2+Cq/NXl+VBvYGXy0fUCOE/V5gnHZloF+
 16T05sfJD28WBUQ4ILJ6DQqpQmq5xlkofWvyprcWdrYrsg6aeszTJmlIY A==;
X-IronPort-AV: E=Sophos;i="5.84,266,1620662400"; d="scan'208";a="174620603"
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2021 20:24:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QS3c57Y8KQnHiyc1pXe/bfXpzlUywYPLoH0bQtUqxwQ6NFStjGTjGm4eP8mPeasVZDiDvMur79t3uEEgtBkZvJHQ/HScVzGxcdW0uanO7hUG9yWZUbA2wm4j/8jwAqZyBDqZSxXIQd/q9hEGOkrLjcdFo6wNwmjaN9Hx/aGnaQATZIuXv+ONCI1Z+8z/gtFt58Qrv4vi/0lVEryQ4ejtT3MUO4TaRFWMMH/IjqCsMlFMiwBMc6BDEgBdMDG62sNEs14ws9760Qsfu/TU5isgG1BZCdfSXWbUVGPO7zQV0r8I5RErdLLMMBS2yfE28nWl/wcQ9R872pWVNHV2Xb0eWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dL3qQCy/fdWlDyBjw6MD8Ovpjz+2I7MlJlvcCjD0FUc=;
 b=g5hQhJhFWbroJjpTE9BMEypHcpumEjRI8kyrb4CiOw29bnfGZY50H8TDrQpccpbQuxe3/ODWaPTWHQ8F9NH+GFzjQpSsJvyBar15nbPQ49aSMS2KtPbw8EwcSDXvBiYFSmk5+ZaIebirYk3PaQyOTeiu7jYMsqttW6s5Q7bX1LzbxCt43lKqCkv48+qc2o9ny+gYerv8/9Hk5WmN1bpKvGgjTlh+4U1hilwYCnj1F04ofzfPXX2PniD4p3q27fXw1NEKJgwVdpLDOHw1r4/S7cOewCMJEeuzdCUlxrKVL4diGjRWuXupj3opRN2L+R31TTCbJN2oIWtx5CfSbi7m2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dL3qQCy/fdWlDyBjw6MD8Ovpjz+2I7MlJlvcCjD0FUc=;
 b=lbNHMMihDYbc1zyyC/4qbNKMeHWVmCAOaa8QblCtGMtz9mEyaJqTDETbvtLI+mPooJykerkvfMeywc4hFFjDSMjqZ8x3VxUafJDEFXRHp+gMdV3er/9p/cMOVyx79oGv0MkGkZ+Cx6JWKkUwtdlyIwLQ1ZWtaD7yMgdDG2WWg4A=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8283.namprd04.prod.outlook.com (2603:10b6:303:152::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Sat, 24 Jul
 2021 12:24:33 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%8]) with mapi id 15.20.4352.029; Sat, 24 Jul 2021
 12:24:32 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 0/4] QEMU RISC-V ACLINT Support
Date: Sat, 24 Jul 2021 17:54:03 +0530
Message-Id: <20210724122407.2486558-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::19) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.61.225) by
 MA1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Sat, 24 Jul 2021 12:24:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f1c06c1-7c99-4280-64c5-08d94e9dfdb8
X-MS-TrafficTypeDiagnostic: CO1PR04MB8283:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR04MB828318EEBBDA161C5C8905E68DE69@CO1PR04MB8283.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0KZhZ9cJzbfvKISUKLoDJOi62rH4+eEG9aBHhwFZ5afqZq1GXBZ8bK+faLrPRX/5R52Ny2XMxgl5NjTD80C1WyJJb2nce/wNQY4ts3N4x7RnxMCdjQUGtzuXvqWf2Ka2sQFs9pg0pIWXLbq3NJbzxeCYkTaIcXi0NvTCmwjV6TMlFMQi1ndQ8dkEBgocoA0RJSnjgHDM/qcX/K0DitUWoKRdGmAkL6C1uqYC0Sg5qfU5W73DZjCV0uPlgMmjpFXcIb1QVeZYAa+ZhldwRmNqObE8pTyws1D9PLFzIA9xs7+81gDrJO3pTyXiqcjVSAQSWZM753XkBHhhCgY+OIE3RWdDmXtgh9+9ksSLefQIIIM9mHPStQ5tmRqxcnfU10ft0HMf+BBWcZzznJR1fCuzL3cuCmxLYnaNmTBv8IUxiK30OonghmAVBRoP4QFQIaCqFp8JX/Mu4MlpLKPXk6eod6VLZ3+zkTskR+RqKrlWqBAwo0iteWerlmQUjkFadwTXAEFFlFVNFNa6ArPBJ9Tv3rfIwlLn9w4oVsUivOz9qxipjii72hs2gNE7tfogKiD2mu4lbEiLs95oXYAq8hVSzPw5PCBKJTAytahCvgGqxVwb6SMHM/lYhgUHp7dzetzGU9RiUpWdGmZ/LeJMQ6Dohf5fCYMjey6ntmJO8TgdgNuVnWZ/PKsiKCqRaG9GwP15tpcogkSP2BxfW29y8pn2Aa5TDCK6DLpuo1ltThXdtRKKTyoHHeSZDoA+PBNJHqe6wOrn03NptoU78YMMVPtQ37fV0spImoH++2QZKP4BBAMQcVX/Zawp4NpkVPEtIuyIraDilWyHUbeeZNVf2+XhgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(5660300002)(86362001)(110136005)(2906002)(38100700002)(36756003)(38350700002)(54906003)(966005)(6666004)(55016002)(316002)(8886007)(8936002)(26005)(8676002)(4326008)(1076003)(7696005)(83380400001)(186003)(44832011)(2616005)(478600001)(956004)(66476007)(52116002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?20w18Nw1Dm6ApeZESHx1CHMURihIQGc90Gc9GOQKikw71M53zJmzrH0iBUdb?=
 =?us-ascii?Q?AbjuiezQRW6QGzDP4cRWbkUWDR8OVC3P8XuYy/CEGf9ylT0BMvQkTK3TXCz1?=
 =?us-ascii?Q?YJNJC8TfPOQOAyLESQ4f4GQn/fAt5xPo9mX1s6tTmYSIblkWlTQOvn9i3fCZ?=
 =?us-ascii?Q?UMd+S2cDSiCHHkDlTdSvVZ14ZfVCm4kL8b08cS/IoZFFfW+Gqc//hs1A8/Uq?=
 =?us-ascii?Q?2rtm1oDRgjtebOBeIqJLGq1QDocaJG7CgEiouVSBYa1nqocF5ZvSfJ0Mmi0Q?=
 =?us-ascii?Q?Dk5KvGPSrkbkjEMjBYFJ1wbGbTIUNjt0A+fn2LNmj1m//L7aRGTYickw7ZrZ?=
 =?us-ascii?Q?UJ2UivCATrtfx5hm8LAglXW0zOiG0HIvbnyjJFU7qdFvKNFM1/CFGn7/oG3l?=
 =?us-ascii?Q?1pvCwOG3QROI5e2m8Wl7UMHULAIkVAH//8I3emRokM0kJLLX6GJ+4Alzy6f0?=
 =?us-ascii?Q?Qbn3r+zJ5iVqrDr4jHF9b5R6SnAdjkUY4iULXYJDIrX28+reW30ptbwDQl0M?=
 =?us-ascii?Q?2M5I1y8xwGFTTM8QJFKjsZRv34OawGLPqUP2AdBb00Y0O1TIT/cpXMWcxjtY?=
 =?us-ascii?Q?ej8gL3KovSuWFhHnqNr7L4C0GNDf6gpPuXWKONR7vyGwzywtlVevhFcBWB0b?=
 =?us-ascii?Q?Lw2I0Z9NZ/r0ESQQqs4+Ydkkt6FHiri3eoOixrQlGSsdeBnVTot87wb0KFGd?=
 =?us-ascii?Q?lrYTXZIZwjDPEUWQrjUl3GzV2fxMWbE1Cbcg+H8+/RWiOYdyXQnFlS4fzB86?=
 =?us-ascii?Q?49jWyu/dhnuQ7NmjHZn0LC1JI0OYlz3y8uO2sUJScD7RaQ7A3Bb/zLxOxgQq?=
 =?us-ascii?Q?MOCqOnXAQrNWEVXu0XvCDfqji4wCIa3/XrhF5eXQ5wneV1aR9cQ9gH37KCwX?=
 =?us-ascii?Q?MJIgdVk0CK7UUaCGS3dPGdyqpa3hsOShBbThGvy1NW+UbMP6r3864IucSwiA?=
 =?us-ascii?Q?BXFiIolZMRMriRlgRIPFQGzI1jeuTl62PsEA7smO+xs4LN9bm+JD4Ah1hFKh?=
 =?us-ascii?Q?Ri24/rTegnBw//YELSytrxWXCtysWI8+3f85aa2ZBFI3MWGOE7xb98J+zYZU?=
 =?us-ascii?Q?RsJI0Uvng3yi1iPuffVlV71BtztIWyDkEeg090IhvmGRXz3PL6knZZ6GuXfp?=
 =?us-ascii?Q?Ska7KfZ8TwqbYlvRJOlKp8kKd4n90wQGk34UffvIPDKgapzlqbV/M7FP0JXH?=
 =?us-ascii?Q?FDmqzk0yFfYi5ZwoODPjJoBEOuDRtzBZx32iiNgoImPX2or2KcsjWHzEBF6i?=
 =?us-ascii?Q?X46DM9EIMO4B35h10YEb/RwideZ0ZWdf6h5VL1ZAXV/bbCBVLaCEPSFhr2HV?=
 =?us-ascii?Q?ec71PpU4mMH21xCZHX1F0p8O?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1c06c1-7c99-4280-64c5-08d94e9dfdb8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2021 12:24:32.6941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2bMYtvA7/x99svZwwzH5rxHFKmhuwbQQukVd9VIcak9F6YtxgboYPrR6s5UphhGWMh4c8piZL4UJx8a2CaNzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8283
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=832e875c5=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Sat, 24 Jul 2021 12:24:43 -0000

The RISC-V Advanced Core Local Interruptor (ACLINT) is an improvement
over the SiFive CLINT but also maintains backward compatibility with
the SiFive CLINT.

Latest RISC-V ACLINT specification (will be frozen soon) can be found at:
https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc

This series:
1) Replaces SiFive CLINT implementation with RISC-V ACLINT
2) Refactors RISC-V virt machine FDT generation
3) Adds optional full ACLINT support in QEMU RISC-V virt machine

This series can be found in the riscv_aclint_v2 branch at:
https://github.com/avpatel/qemu.git

Changes since v1:
 - Split PATCH1 into two patches where one patch renames CLINT sources
   and another patch updates the implementation
 - Addressed comments from Alistar and Bin

Anup Patel (4):
  hw/intc: Rename sifive_clint sources to riscv_aclint sources
  hw/intc: Upgrade the SiFive CLINT implementation to RISC-V ACLINT
  hw/riscv: virt: Re-factor FDT generation
  hw/riscv: virt: Add optional ACLINT support to virt machine

 hw/intc/Kconfig                |   2 +-
 hw/intc/meson.build            |   2 +-
 hw/intc/riscv_aclint.c         | 423 +++++++++++++++++++++
 hw/intc/sifive_clint.c         | 294 ---------------
 hw/riscv/Kconfig               |  12 +-
 hw/riscv/microchip_pfsoc.c     |  11 +-
 hw/riscv/shakti_c.c            |  13 +-
 hw/riscv/sifive_e.c            |  13 +-
 hw/riscv/sifive_u.c            |  11 +-
 hw/riscv/spike.c               |  16 +-
 hw/riscv/virt.c                | 646 ++++++++++++++++++++++-----------
 include/hw/intc/riscv_aclint.h |  80 ++++
 include/hw/intc/sifive_clint.h |  62 ----
 include/hw/riscv/virt.h        |   2 +
 14 files changed, 997 insertions(+), 590 deletions(-)
 create mode 100644 hw/intc/riscv_aclint.c
 delete mode 100644 hw/intc/sifive_clint.c
 create mode 100644 include/hw/intc/riscv_aclint.h
 delete mode 100644 include/hw/intc/sifive_clint.h

-- 
2.25.1


