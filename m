Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGCB-0003o8-RZ
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGC2-0003lT-N6; Tue, 26 Oct 2021 02:44:19 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:57203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBu-0002v8-9E; Tue, 26 Oct 2021 02:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230650; x=1666766650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HTYIOb6C2qHs7esQRqgXBd67VP3nWWSgi2maOSH4iPI=;
 b=RjIgxYC01P9AprcJSYU1dkWx/SqGH1QDyutZ26QfxfC2z9Yxm7Rqtk7p
 HFxsOWVbmWBzWbdIEsFRL8tWf+1ft2LPQujb2vG79O4bEpEytGC5k3qGb
 O1M7O1lww7SrRQC9uM28Gxlb/kNz+wDbfe8vHav3++LoLzwEj4FnTOan8
 9b8vL4lFsbVQ1E+6dlPJcIrLap5pBEnVb7oCBP3pRFXpa0GhefjY24Pcz
 ueG7V0gm4lZUXZSZgeuImE3OBAqcGcoTShwDlxGXJ8CBQhZswmx90nGhH
 /FVNbruly+rHzns25OEMwNgZPA95SfiDHcEjjcjXQ1ereEQauv/Xsaqzj g==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="295585019"
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:44:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEODKE74mGFAlYBBZeyflvAYHvrjt7A9z6tt6wDFLir2bAEaUr8x86CwkAhK9NQ5NLNOqYpDEQdbP1yy1IQ2QELWgwAvkNIgAv8HRk5vpolSLETEqoNAbJNegc6W3g6FLzQq0rax870kBO3CybRt6ff58nRNCxX1PsCJ8VLnm/zaND0MNlefy74pEzTegEm8AGK5kHZCx7kC/hnoE4D6AJD8CxBZH5+4NqXjd+0TKlSFVl+h5p8i1bZMfsbH7qjMR7QK+Wf4Ofs/5AXCR5hbhVPU+vZkpFSEQyFmXSZJzX290fsseYyOWtwsX/cNEf+7fEK4k3MD28fD8vcCVcQudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsjCn+PCJ59S3KqnNiw/JxRHOlAsA8UYUUIigy2RXOA=;
 b=JWBINRRw6cCvW5OkHZzosy/FdgJ/qgVtfPeThXf6uka/8qaIt4qoKXgRa7ZBAJ3wGNyJTn9ZqsJRspoRXnIpYN4GMrJSzsFNa28qVFqReuepx5Ky9YWs8jO6J3B6mm4CpjUzqNEgyZ11Gdl+C8Z3jfZ4W2aRWFLCoiBWMcYRHPikOM7ZTWozAjc/PBdJqb1SubOGEBiqjVfgKkuFvdPkdEYRC4rc9jHneKQmBwBcQP7/eSiJU6WamUavxXSaDuF2Y13NUhq4ZzEJYHu1PUPcVJwtbTNwpE/L2EHUh4jJbI2STMvyvnp762nhh8cvUE7wRoimi46aGaiXwTiVCVGpBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsjCn+PCJ59S3KqnNiw/JxRHOlAsA8UYUUIigy2RXOA=;
 b=SKCPUcZyNuSREO3Mv++6sw1ZweKKhfr8ERIQcitNozX2GYpmYG2uiKd0xhJkcmKlJbd7ycv0puywZG/kis12RbIdQA1A4aINsWzn3+wFfaoZDrd4ehTeI7JevAXFZl1IwKPT+itCPuJ7kTLLOAHL3rxeDOERuYXrQMwYUIul2v4=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7825.namprd04.prod.outlook.com (2603:10b6:303:13b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 06:44:05 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:44:05 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 22/22] docs/system: riscv: Document AIA options for virt
 machine
Date: Tue, 26 Oct 2021 12:12:27 +0530
Message-Id: <20211026064227.2014502-23-anup.patel@wdc.com>
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
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:44:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a5706a2-91de-45f1-83f2-08d9984c00ec
X-MS-TrafficTypeDiagnostic: CO6PR04MB7825:
X-Microsoft-Antispam-PRVS: <CO6PR04MB7825F87866286173AF9712F88D849@CO6PR04MB7825.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A52X3dhDZlNi4X/aTuascIRjj16qMCZoiWu5seJoHdZYG/F3BbhB1X/4gI30nRXGuO+sDkMWpAnbwHF/UMYtrQyYm+760BDJSQUOj1FEaP94Ugx+8VR0ywBQ9qeliJrRw1rqjHNS822Ksw2/XXyBu5lm5g7JeeKR/0oUgvQMZenSO0UhQKKnhATzh2+ALSh/6plt372tpRGszMLhfSNtE4Pb7QimuNThkOkMce2jl+H0PTFxxc2cYaeYJEwKNhh1/yP12bU0ZCcP/BBIh3mk1ChnEevXXguZ1dQNMadzc33HiN0BniwQkh3AFk4lCc7EaCN9AetnkEgkNamo5Luz+24MA+cOwwyECangYTj4Lbka++ldz2e0UYAD4tGptp55BOBkUgI0atom8W//pQqTfFLXhRe4xulOT4B/fJnftkzgeMMVBl1zW2cFNWjNT/Oakl1Uoyc0wSVF3Nr699gkDqxnObXFS+bzZOEOOktuk/XyMsNaScQtPmszfl+AzdSJuYht+IjTy30NPmjDdWz8PvkCiie2mnG/0gM1jkCMRcayX+8kEdnr2CvTW93VTUnwdJKgEsOPijHPID0OBFccrJHJm0e4ngxczGQiK3FKBfJLJl/a7H2Ckr9a3T2nFAZbLtAlPbVn2HnSEz3+nk5lWhga8IVSfrO6oBzHkGreX8g85GFIAuYzt9NqINdI+hMTlQ93ZamV2w9pNnMxqpq/tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(2906002)(66476007)(8936002)(66556008)(55016002)(82960400001)(52116002)(5660300002)(508600001)(186003)(66946007)(8676002)(36756003)(54906003)(38350700002)(38100700002)(6666004)(4326008)(110136005)(1076003)(86362001)(26005)(2616005)(44832011)(956004)(8886007)(7696005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bSvq7QhPQFfiydPDcdtZk8obY2naLbg7VWvQpv98KeF5Z80gFUpCBYl7AV5V?=
 =?us-ascii?Q?e6cSDq9ZDkweLgU08oIEk2RnXepSf7F5+J0kdy/TDIYIgTJLThuiEwjcLP6y?=
 =?us-ascii?Q?aY42WTGt8YLW2AvlSLPT9esbaL/ju7qNJERrvM0KVKBxZgKp1f7B2bJUbRWF?=
 =?us-ascii?Q?GFh5vEBxLrWa8QGjdqNVagqxWJ2g+srvoosc0I32OC4d+Do8LM9cdSWXULnf?=
 =?us-ascii?Q?NAJbK/j8kLgrFHykccPG30rWHbNTl53AWMqYN34bxR89gv79GHPveMiMc9SB?=
 =?us-ascii?Q?sVxxbrnFR27LIGGcZ8o7lUsERXIgW+DUR2A9DiOdofS32ZUYaFyw9R5uZoUg?=
 =?us-ascii?Q?Oe1u0j9YBgiovnvDtjBpexRwHp30u033avnjhUuDevNlT+2oJFLwGHmED6zI?=
 =?us-ascii?Q?4dFO3EW/uZg53YBNV32tpLom5byHMbVno5okwZkaSH+K71674qx/J9PItX80?=
 =?us-ascii?Q?GUxK/2tSPd0yOVaf6vhSw0JjYerDpPRWHyI4mRHrT6Z9T8K/Sfit/rLqC1sd?=
 =?us-ascii?Q?yGczG74aduRJ6Nj71GWp2598LDRaAQXpomNYYZDbCkeXEM/vrjpy3ivY/Rda?=
 =?us-ascii?Q?j+4xhLF6lrVOEMJK+3GHyv/O6nN7PyXOfG/FNX7gYKmjuhnG2ZENBZ4kGjI4?=
 =?us-ascii?Q?HczxrYtHBFxGai5TT1ggrHzOJZE1hTvHadx5UoHqI9LPbu61GsCTftRuQDur?=
 =?us-ascii?Q?SHC9PnKYepxPieXHjrgUG4WHx6fLJuzKLhYP/EaBbT5pr/ZCLPbgMGwTsptS?=
 =?us-ascii?Q?pssRYV/ekJDYrypGtX6tVs66TmWflrShy13qRleBfr1NUJ8o8j2zFieyo3lP?=
 =?us-ascii?Q?ZeQ4OrQ5XfBfG50PGjQnDb7ax+pSN0BRvE18e6ZEdF9r58czzN1PKnlxg3Ze?=
 =?us-ascii?Q?2KACJj38UaJQQ7a3M/ULlXQ0PTOGcJ6shdd47sZPo9PTpllzbo4lhrst8255?=
 =?us-ascii?Q?e/LGv+KERClhfmQNkJStKNBlsrRk2tIZLKlbPFgsXuebg15nrY8M0m02dQna?=
 =?us-ascii?Q?EzsG+t6M/f9xCPXkRpwS0WbMauiLxVcwRq+LWleyWdUAUs88mOaW+h7lKEse?=
 =?us-ascii?Q?RK91MWIwaohx4ShpUw+5eMdKMGjEmd/NyVsLRwOWcwzW2ui6wtz5uj7rmqtV?=
 =?us-ascii?Q?LN+iHmtz5ZcwYAqjOn8aUjUyGhwbTtDReAW/GTn8KjVd+6EZnl47ALgadFhc?=
 =?us-ascii?Q?oX+t2u4VN/RXvJ4jkSBe01vR6uN+Gaq+FgTZRUf3U9tcMDVd1girwAASeFk3?=
 =?us-ascii?Q?vnDwKNzw3q1IgbtJLaRfkZFRyPW1A6iB9YVISLbB+o6BHekF/WFLhAQzJMf/?=
 =?us-ascii?Q?vuJS5XsyHPwrab4BOd6Uhq0OqojdkQUn/j5LXrparzeXaCc7KHBOd28z0TuZ?=
 =?us-ascii?Q?BhLUH0YA9XPR7XNXOaOL56xqa7AtMifAY1Uty1tO1Ss+suVvT7HKXDYNscHW?=
 =?us-ascii?Q?n4zlgO/ZKhIHiibHVaflRatD3DF89Q3GzopskAtb+HFZoH8mEZdhpYk6Vxsw?=
 =?us-ascii?Q?ZGl4eR/llreDbB2DdnyfonYn2ROm+sgI0T+RH6YzIr9O2eoD5ivxQPkvBPxc?=
 =?us-ascii?Q?8ErTOwNTHk82tt0HPq1MMCibHXc01mds1cOREtjP38JRodFxM/jsrOYqKybd?=
 =?us-ascii?Q?BtWcT3Ao7Ex7oyYR7OrRKHM=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5706a2-91de-45f1-83f2-08d9984c00ec
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:44:05.0968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7D8bXtQFHalYqpv73vl3tWKfXIhyYN8OB9Ct/aL9VsKWkvKHGWqTOIB1+lJ6yYcnE2N3VJUC/VTa+i1QakLWYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7825
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Tue, 26 Oct 2021 06:44:19 -0000

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


