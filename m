Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBF-0003Gy-Lv
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGB8-0003A7-Ec; Tue, 26 Oct 2021 02:43:22 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:53150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGB6-0000sH-5x; Tue, 26 Oct 2021 02:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230599; x=1666766599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VFsPm/Le0NmunV+Z0t7675HUmm8YKZpuqWcYIU4WpSg=;
 b=RlHGXxXa+OPio+wa4UlfA5qrkr51uVsQleIMJ0bv2fOn33L2rt14VHm3
 oW62OqMNPRu5ZJ7eTS5tu7hB3/+R4lEo2hDoY6R/REbP+GqWNCAYGqBGJ
 ALTZiBBFdqWljSFS/O4oXCTXb0jl1NntvVoEP7LBHFszbSungrp+unH2m
 YVQEaLjF9vvK8lnL9D5Tp+Xw60rRNpkLgAGYt1FB9o6eBVLhpWAbXFvlJ
 l0GhlZx6sSYHBSwNuVPZfjk/a9U7KoAHGDKWlZD4Wv5rD+lmogkLgoerq
 0cbu8rwlJizl8HWs2y4DpXcrthci7PHtOhTF/ClWxZ4/61GaQOYo+kTdT g==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="182854756"
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPCh0tNje0EuO6P4vT5YlU3jQI3gWm8jSiaL2WaECjq6PQH+iFXnF6gBfp/T32GxlNGYjjmdaiRrPYjrrd92njpxnAjgF8QEM9CgS8fpgHSnENeigafMlwNikOGi63QFBVAb/h4W8krqwNpOC7L6CKMcI5q9pYCPcP0RUpwzPxcjvyNc2dHvYXOSKajV+h9tGC9zUdpSAjBZ/QQ5yNvnjP2r6lCjZhwa8XGOTNeMT09adWToitrjNuRR+8Zf2zqIt8nY6sM2X3/IQFzClP1mVuGjuABBPrGe1rKdWU4NahKbQhAE5pEt0yiMnUYC85ov5bC46EFQIjCrZXkutK0N4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rdkORUTMcNAMPkdUgbqfjrm5/Q9/FUfd14WFnTfzFI=;
 b=KLAEehVdBj9q4SIxFsIEv9U/Rt6CpQsHKB4gJ+W2jfGCQT7OAAxN5KdSgA3IdsEHugr6i+y1rFh+DBdUbe/zWQ7o0N59/Gm8L01lrOkl4UQ+m5/wkWH757CRHmZkyHaGoARpVldphMgv2+Y5HD99i/2j5IB0p6SyDsSX1zct1aCEIXxyjzIxprZAEKlwMN+HreyYHAj7eb57N9hNWPE4BWvvGLGTjTD87hySv8bQG8I8rF7V8SOqFf4Tr7dY1HJNURFUvLQi609QBeRc5K2PaeS41P66/UgPlFRKLvK2b/QZdd6oiQwsAggsyAySzSwTDfnOcGp/vLMljPsa1KX4/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rdkORUTMcNAMPkdUgbqfjrm5/Q9/FUfd14WFnTfzFI=;
 b=mqY780v6KFdKc6ojxtiM9QeVnf1jmo8y8MsePJ5HTegQh1FfSZJpRQIe1C3x7UQckJe2ijmZ/w/PI7+uZwRh739rCbcXTRJ/HVEDhUMQ8oY7BVRWienc6sIv+/znoYsjnvKBo1QndoVDOXsRHzvSj8/LgQAz6ENgyUq+wLHV3XU=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8379.namprd04.prod.outlook.com (2603:10b6:303:142::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 06:43:17 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:17 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 07/22] target/riscv: Add defines for AIA CSRs
Date: Tue, 26 Oct 2021 12:12:12 +0530
Message-Id: <20211026064227.2014502-8-anup.patel@wdc.com>
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
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cdf0515-edd7-4b44-71fd-08d9984be463
X-MS-TrafficTypeDiagnostic: CO6PR04MB8379:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8379C0BAE480ADA7C5B87B188D849@CO6PR04MB8379.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FVSoKjbqlNgO9XSuhzsxs41AxrK28PXYWwwBjxw0nmc/NxqXTM8w1gtNY72M2UgRuXtM1DCWZYs2NcrmwTT3qudmj4afN1+CufAFEHAEAYXU5GKFbVFjIgsufV208VvAmEDnU3T0/KdUHGlvepbX6dVmRkKgzB3pYqAn9psWUu1BG2jY98lhbV0I+68ItJoBXcwr5f0YD0dxTRh7GELa2STChE4dk2yd5sI5G/s/7ONWKx1i8hfSum1VA2hqQxRXkbwPkHtyb/2Eo1zf4lHCPcT1gaqRS0JH6+GgBzzvTy5P41lnG2UJogfaVsyDt/5xB23DAQtAqQZnyAVOtkes1AMElHyAmSsuPpdVxGpNSnQiDOrFJgMzzPKx36byGgaXKhuACU/VHOpsHyJxIkbeoLkGnjAwWaV/F5843WTqwFi28dgdMhZ35wnazAXYzChfXSm1i7HSGmZjugzAsgmn/pipALIocYnXE65hSExLQDwTEdBCuXhk6GexLnBLx5h/gYqe0s74P8FykKnguiqcDRiTkoCGgUGRuonC62glPw68RKm55PRdYt2Lg+OBphkyyZWzFqW+Y87I23HeaDUoZogKUSZKNa0U8M7YooGEGYJXlwd9w6/9CDLhn42EbzU7aO7yVNA9KYwq0n0hzBuAvDMMeFCqgSMePiSc1Xpqc/KMrJTz7E9ofRH9yvxrcx/0bXcdiYmCA5tKCOm7ZI5hmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(186003)(66476007)(4326008)(110136005)(8886007)(55016002)(2616005)(1076003)(508600001)(7696005)(2906002)(38350700002)(26005)(44832011)(66556008)(86362001)(54906003)(8936002)(83380400001)(66946007)(36756003)(52116002)(316002)(8676002)(38100700002)(82960400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xGIko9RJdojklQ6h7BKLMZ/Mp1aCF8BMvm7ATG7z2Bbn63tavSQx8Q0Em5Qr?=
 =?us-ascii?Q?Bp+kCxWczgeSTcx/QQUznznOORDGlyuFErAxknOPoR14I2nQhamzs4d37pr/?=
 =?us-ascii?Q?jDDTE5ZD1pg9ufpxXXDcBI5mPIfJQC/r+tzX2Bxgtq6ARfHUUg7c36h/bGAL?=
 =?us-ascii?Q?c+XL2fpd4gOimU4P4U8HDibuHpJQ+2F1f8lDstdMUWJ6WT9QfU2rMlMOvJKl?=
 =?us-ascii?Q?Li7xfu190VPta+DNm1SQYrIb7ezO0lpkRF2wXJEbwh8gAC0agT2amDb/tGj/?=
 =?us-ascii?Q?5tg3aTsV3gjxVF/6JKwxlS3UdoBmB7FgHcZ11PP+e78MF6Hl51Pn6CxxEHWp?=
 =?us-ascii?Q?Zub3A3DjW1n4EihcES2ju+gASCYP0s2e4Jr0o5VZ0oMg7QbNtnpHwgHlw2Au?=
 =?us-ascii?Q?rYE2AvNp5w/3DfHpXZ5aG2RB8x8oPd4NC2+j8eek9p81eCyBghEmRiJCQBCf?=
 =?us-ascii?Q?YXv+4+bHFqkvyf34askpnItzFNO9jqTFM3wd6m02bw1ZkAP4ouQFBoB+xKtA?=
 =?us-ascii?Q?uK5Hpei0nC3LxNWDwwCzZTVycx21UE3shM0q8XjD2SzM5ZHpOLtDhnlYRvF5?=
 =?us-ascii?Q?Dd85JTjWH7/sVFDRlytCYhTyuHF17Z9kP4wXA/yrF+C3F8pvPksL50NZa3R5?=
 =?us-ascii?Q?j/lz6iKd1/731iuPllU6mkX0ru3Xhtj8KU+E3Y02FS9958vyKaUZWtRYnM21?=
 =?us-ascii?Q?6myRaybFGUuqJVZxRzmFhd5Z3hIBRftMpGpnpOe/iqMsBHrEMe5PuC8DmMUP?=
 =?us-ascii?Q?QX4eYuNeYj2gpRG6vAn5FU6z1QQzMNUj8uEfP9VH8tSNXu3VERNzvqcFvLSR?=
 =?us-ascii?Q?0B6B50u9c6rBwyI80Xp2YFWdS76SBfzhDtcHRXqtSHC6j67/rFELauL673js?=
 =?us-ascii?Q?i74jAX+z6bssMYcMoQBoNKW7Nxgjjo/GBO7ahNcrDdzSAm8KLlQ0WaH/M8Kr?=
 =?us-ascii?Q?bgcdCFJ6falNn+grPqShQbxxo4fPj1Ye3Ae507EIuYw6HS5P6i0vwCfCBlF8?=
 =?us-ascii?Q?mr9vRRVB7oNFHloz88LEj92G4KQKaiDTX452x3u4dwpAi534BQqbgfrlOVWX?=
 =?us-ascii?Q?/aUnwo+HXWJC6R5UtbHZvUu5Le9C7Ts+7MjTnjxAltrEnK2JLPM6/32CqfF3?=
 =?us-ascii?Q?2TxWlLVhWT+7UrYyYFUXXIZ5x25nYFJvxD/meTt9o4b35Nix0LpClcJ9ICTb?=
 =?us-ascii?Q?o6EH+8Uxq70thChfytUkHQdEd5o3A4pQePgkNbcaQF1EaGzNTgvmpuPWyRFN?=
 =?us-ascii?Q?LwCdeQUorwGfdxtzr4b2n75g/uA+LAjPXKL7U0NtA8Cx4KcHidQjYeRI2/sj?=
 =?us-ascii?Q?jX2cbMvNRizJ0yI4SeWzdfTQQ6MOTChEHt925tYM+q7Nt/h5nlkCdq9v56VN?=
 =?us-ascii?Q?WA7lushpygoEwb/hku/ZDP6MRpkiUENa1A3L0Eq4afdJUZZwJX2ZO2TdvuRY?=
 =?us-ascii?Q?riDqAQ8wnYKs+fivmXTSASTD+NLCAtSqng67uyWj9mi3BWJaSwQuDxBiEif9?=
 =?us-ascii?Q?L6rHOSehIu3kwoRt8Eb1hTN20jNr2Qe/zFCGMqBtsUoPjkiRlsTQasQBl1Cu?=
 =?us-ascii?Q?itXDtO9sb1Lw5UXTMVxDNly+BCZlKionzBNxjQrXWuhHvJFdUyoFzg9ansXR?=
 =?us-ascii?Q?/EpqByPCNkhHeI683/RT9OI=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdf0515-edd7-4b44-71fd-08d9984be463
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:17.2472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j04xR7zn3da1geJx621UYtbzIuVMDCkIa7YBew67l7KwuE3VpoW7ojlX1/U8vO6fmPQtp9z6eO6/Sfuiu3yX5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8379
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Tue, 26 Oct 2021 06:43:23 -0000

The RISC-V AIA specification extends RISC-V local interrupts and
introduces new CSRs. This patch adds defines for the new AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu_bits.h | 128 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 335e0193a9..0a79784d99 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -160,6 +160,31 @@
 #define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
 
+/* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_MISELECT        0x350
+#define CSR_MIREG           0x351
+
+/* Machine-Level Interrupts (AIA) */
+#define CSR_MTOPI           0xfb0
+
+/* Machine-Level IMSIC Interface (AIA) */
+#define CSR_MSETEIPNUM      0x358
+#define CSR_MCLREIPNUM      0x359
+#define CSR_MSETEIENUM      0x35a
+#define CSR_MCLREIENUM      0x35b
+#define CSR_MTOPEI          0x35c
+
+/* Virtual Interrupts for Supervisor Level (AIA) */
+#define CSR_MVIEN           0x308
+#define CSR_MVIP            0x309
+
+/* Machine-Level High-Half CSRs (AIA) */
+#define CSR_MIDELEGH        0x313
+#define CSR_MIEH            0x314
+#define CSR_MVIENH          0x318
+#define CSR_MVIPH           0x319
+#define CSR_MIPH            0x354
+
 /* Supervisor Trap Setup */
 #define CSR_SSTATUS         0x100
 #define CSR_SEDELEG         0x102
@@ -179,6 +204,24 @@
 #define CSR_SPTBR           0x180
 #define CSR_SATP            0x180
 
+/* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_SISELECT        0x150
+#define CSR_SIREG           0x151
+
+/* Supervisor-Level Interrupts (AIA) */
+#define CSR_STOPI           0xdb0
+
+/* Supervisor-Level IMSIC Interface (AIA) */
+#define CSR_SSETEIPNUM      0x158
+#define CSR_SCLREIPNUM      0x159
+#define CSR_SSETEIENUM      0x15a
+#define CSR_SCLREIENUM      0x15b
+#define CSR_STOPEI          0x15c
+
+/* Supervisor-Level High-Half CSRs (AIA) */
+#define CSR_SIEH            0x114
+#define CSR_SIPH            0x154
+
 /* Hpervisor CSRs */
 #define CSR_HSTATUS         0x600
 #define CSR_HEDELEG         0x602
@@ -209,6 +252,35 @@
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
+/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+#define CSR_HVIEN           0x608
+#define CSR_HVICTL          0x609
+#define CSR_HVIPRIO1        0x646
+#define CSR_HVIPRIO2        0x647
+
+/* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
+#define CSR_VSISELECT       0x250
+#define CSR_VSIREG          0x251
+
+/* VS-Level Interrupts (H-extension with AIA) */
+#define CSR_VSTOPI          0xeb0
+
+/* VS-Level IMSIC Interface (H-extension with AIA) */
+#define CSR_VSSETEIPNUM     0x258
+#define CSR_VSCLREIPNUM     0x259
+#define CSR_VSSETEIENUM     0x25a
+#define CSR_VSCLREIENUM     0x25b
+#define CSR_VSTOPEI         0x25c
+
+/* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
+#define CSR_HIDELEGH        0x613
+#define CSR_HVIENH          0x618
+#define CSR_HVIPH           0x655
+#define CSR_HVIPRIO1H       0x656
+#define CSR_HVIPRIO2H       0x657
+#define CSR_VSIEH           0x214
+#define CSR_VSIPH           0x254
+
 /* Enhanced Physical Memory Protection (ePMP) */
 #define CSR_MSECCFG         0x747
 #define CSR_MSECCFGH        0x757
@@ -529,4 +601,60 @@ typedef enum RISCVException {
 #define MIE_UTIE                           (1 << IRQ_U_TIMER)
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
+
+/* MISELECT, SISELECT, and VSISELECT bits (AIA) */
+#define ISELECT_IPRIO0                     0x30
+#define ISELECT_IPRIO15                    0x3f
+#define ISELECT_IMSIC_EIDELIVERY           0x70
+#define ISELECT_IMSIC_EITHRESHOLD          0x72
+#define ISELECT_IMSIC_EIP0                 0x80
+#define ISELECT_IMSIC_EIP63                0xbf
+#define ISELECT_IMSIC_EIE0                 0xc0
+#define ISELECT_IMSIC_EIE63                0xff
+#define ISELECT_IMSIC_FIRST                ISELECT_IMSIC_EIDELIVERY
+#define ISELECT_IMSIC_LAST                 ISELECT_IMSIC_EIE63
+#define ISELECT_MASK                       0x1ff
+
+/* Dummy [M|S|VS]ISELECT value for emulating [M|S|VS]TOPEI CSRs */
+#define ISELECT_IMSIC_TOPEI                (ISELECT_MASK + 1)
+
+/* IMSIC bits (AIA) */
+#define IMSIC_TOPEI_IID_SHIFT              16
+#define IMSIC_TOPEI_IID_MASK               0x7ff
+#define IMSIC_TOPEI_IPRIO_MASK             0x7ff
+#define IMSIC_EIPx_BITS                    32
+#define IMSIC_EIEx_BITS                    32
+
+/* MTOPI and STOPI bits (AIA) */
+#define TOPI_IID_SHIFT                     16
+#define TOPI_IID_MASK                      0xfff
+#define TOPI_IPRIO_MASK                    0xff
+
+/* Interrupt priority bits (AIA) */
+#define IPRIO_IRQ_BITS                     8
+#define IPRIO_MMAXIPRIO                    255
+#define IPRIO_DEFAULT_MMAXIPRIO            15
+#define IPRIO_DEFAULT_VS                   (IPRIO_DEFAULT_MMAXIPRIO - 4)
+#define IPRIO_DEFAULT_SGEXT                (IPRIO_DEFAULT_MMAXIPRIO - 5)
+#define IPRIO_DEFAULT_S                    (IPRIO_DEFAULT_MMAXIPRIO - 6)
+#define IPRIO_DEFAULT_M                    (IPRIO_DEFAULT_MMAXIPRIO - 7)
+#define IPRIO_DEFAULT_U(_i)                (((_i) >> 4) & 0x3)
+#define IPRIO_DEFAULT_L(_i)                ((_i) & 0xf)
+#define IPRIO_DEFAULT_16_23(_i)            \
+    (IPRIO_DEFAULT_MMAXIPRIO - (IPRIO_DEFAULT_L(_i) >> 1))
+#define IPRIO_DEFAULT_24_31(_i)            \
+    (IPRIO_DEFAULT_MMAXIPRIO - (4 + (IPRIO_DEFAULT_L(_i) >> 1)))
+#define IPRIO_DEFAULT_32_47(_i)            \
+    (IPRIO_DEFAULT_MMAXIPRIO - (IPRIO_DEFAULT_L(_i) >> 2))
+#define IPRIO_DEFAULT_48_63(_i)            \
+    (IPRIO_DEFAULT_MMAXIPRIO - (8 + (IPRIO_DEFAULT_L(_i) >> 2)))
+
+/* HVICTL bits (AIA) */
+#define HVICTL_VTI                         0x40000000
+#define HVICTL_IID                         0x0fff0000
+#define HVICTL_IPRIOM                      0x00000100
+#define HVICTL_IPRIO                       0x000000ff
+#define HVICTL_VALID_MASK                  \
+    (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)
+
 #endif
-- 
2.25.1


