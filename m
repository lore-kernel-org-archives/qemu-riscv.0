Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhYsP-00005P-Sz
	for mharc-qemu-riscv@gnu.org; Fri, 14 May 2021 10:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=761afde0a=Anup.Patel@wdc.com>)
 id 1lhYsO-0008RE-6e; Fri, 14 May 2021 10:33:16 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:34521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=761afde0a=Anup.Patel@wdc.com>)
 id 1lhYsL-00072v-Iv; Fri, 14 May 2021 10:33:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1621002793; x=1652538793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EniPEKMnEr8oXFZtbFUyesWVl1DQUYNFYayrY+U27pM=;
 b=D6DNpv/Y/90ALpPT2PwSGp9k/ZaZ9Xf/CafHN6E1ti22iPZRYT/L45fI
 9cu1i6g5jkiAxc5rcxQbQ4eWtUAqkpdcWmuocGM8SyH9SYDY+bG3lJak+
 IIsmUMJq0ci+L6eBDlOKmElfMoEpYVi5CKRZXsHyhD+NDNGGMXAEDcr41
 +L5oQQcWi7dyj+AkVC/Gp80Vdxa/eJYsn75pYRAG/1IB8YtMUevSCMg2p
 h/bberCxj1Wi1C6bsHPUpVGuT6u1wsunH0fMTOLsgRO7hjK0kC+3cVR/h
 zxsHxQ/8OLOrLurIhPwWbrsJH4ZfiC/FSrXDMLKcsrSWUK0RPkdyDXV0V A==;
IronPort-SDR: PJqdt4yl0BUzED8y7AzQDcJTEjVfHWHEMyKZhflCivhAEn+1KIbK8Ieda55r19OEONZbxu0biy
 NHD6RllSJbOpyJ+9qu2e3ZFRTgWmIcPgwNbDWZv76deGZSMY6Vo3ClY0b7f17550CMPhQCnQH+
 mp6SpeJqe+3cRjfIsCe2p5J5CTwxN6y6PsAA2FTHKRrT7TTdWrJEQiQgeNW0I2bNO8T37VrqtZ
 8lPrzbs1mO+TE3Sjg+6Lc59K6NJ8i1se4TLcVFrpVhHS5OJxsuMprJI9Ev5aRTZQS7Eq13NzKC
 u3c=
X-IronPort-AV: E=Sophos;i="5.82,300,1613404800"; d="scan'208";a="167526766"
Received: from mail-sn1anam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.49])
 by ob1.hgst.iphmx.com with ESMTP; 14 May 2021 22:33:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuqQmqWqaJHqHuW+K9E9nCbiqe8ZTtjNeE9NsBvoaufRo8uaAzCcblveYkGFz2xdGRicFQp166Z98L/7+W8kwuquTMxtrxzeeP2wu8FcwaeCeWmofmyKUOGece9cfOwGvhPguSRcVI5kUGHTcZ0bsmoqz/QHziXm7taxsEW/x6a3SJwQ2g9L58niymGnz0NYhZgNzOvpomFWU/9+f1hbAm+bXcMrWdsenWnSf9Q0J+QaM2PrOmCzQRU5NB+B/JnRuBcOvZhxiLH/8PZW7r15VCNlhmnX0BQdY5vVhHbn4SbqKpJEa+XnzXabT/2hEUhbkWvqCuZGWOr2wnBuOTJL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwZthBkobJRmJuntBPYbhZ/+s8+qDL6hwilBEn8mzVk=;
 b=fv657VFBAMw00mhNkf7foEdkfcs18vjYkCtYube0L/kugeoou5gbysj4MiyY5x5qSTWJorBHlitSCfREhOEnGveZMCd1Rw/7UyZ2Ki90tMxPtk/6X5yb28inkBA68ldYszHQYr7P3S9++/9XASVb12FZa+mcVnSyxzkEXrk3ZEiQ2Vhd6c6KGSUMlGbDe2zDWoNNbUndpIvfpYdFx1Xdo58doZ+dHAdhqDcOjYJ2wHhgIh7WjzY8+vOKNILSV1uIkhYJhTWpM4B23nGBTc3zCWgvSjs0BHwkPPx4osUZNC75wrWZOfwodI3TFBFYW8EJi38x/kLjKOcIB//gk1BFrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwZthBkobJRmJuntBPYbhZ/+s8+qDL6hwilBEn8mzVk=;
 b=oYL+6Ekqn1Wd8oWr8XofwlBjHj3hKgW6ibfvNdpa7//XY69bm46NQ2MWGk++6SyBHnzqQwNavi9kEJ2BUoOhJs5f31oYhLlgxRzc7nEP/rN+s8oEhqW3CWn3NnMY2MqsjTa8NgeIR9tmXT2/Pdv47BGQY5arfoLw3DfXNqYEOjo=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7810.namprd04.prod.outlook.com (2603:10b6:5:358::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 14 May
 2021 14:33:10 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::88a0:bf18:b01d:1a50]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::88a0:bf18:b01d:1a50%4]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 14:33:10 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH 1/4] target/riscv: Add defines for AIA local interrupt CSRs
Date: Fri, 14 May 2021 20:02:39 +0530
Message-Id: <20210514143242.377645-2-anup.patel@wdc.com>
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
 Transport; Fri, 14 May 2021 14:33:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c4378f4-5b6c-4823-522b-08d916e5329a
X-MS-TrafficTypeDiagnostic: CO6PR04MB7810:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB78105957D3F9D5479CD58FDD8D509@CO6PR04MB7810.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mGr1xqU3UTlJyvfvoN+1ov1IriS38njOmpLdUH4i7lGD5+xdkzSo25U/g0VL6xS9WGQzuMjo20bndqfm95aw9/jBLyyrTmj/26rc6WKmRpgTUwlA6AFpG1nv1lERIXHBfHICG7JS7m+6vUTnEUTnu8QR8n54xacyMkb7slC+Cc9yUZHWr3c9mi8e2QSqoUjYtH32hWop9ygLd7Xs0yUmlQ47ti4VCrLABiuDV6YzHLBzO5qeZU9m+8CHXh0wW8ImN5D7hVy6Oyp4Kb3CBmZ1YtwMW/WouIGamLKkgUjIlDfs+XrqVqHn1G6ZMfzW9OkEHSNrvztGZtBZGid1SfpKMtpwKUbXWuE4VsFSWVBiCKyZjTbG8gdF6kOMfrI9T1EeBB5jQgU6YcrEkwGrzyqXreNUSNlV1gU9ELx7/S4YMcHyg7gmW/Iaep3UzR5rQ8RDgxCbVKLv8Z+wJqSCprSkubTVUj1ibVHxyu2H3W0o4ZLRXCnpmVDX9+qEi9cdjV/i+OmfkKmWBtSO7fTuPbJAIOKeH8Nm/DgaUyK+3ZB3hMtl3j9qZxALILk+NUFVlsxdrWDwMQXogJX4ophNHBZriHLMNUiPp7apwJ13B5WwZ5Oxj0MPZS/CPWnur0cObVXlQnMDlJiRsSa0+AhcBuhhH6ybkOqB5UAWNBVbcoHCzcI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(346002)(136003)(376002)(366004)(52116002)(7696005)(1076003)(26005)(5660300002)(38350700002)(83380400001)(86362001)(66556008)(478600001)(36756003)(8886007)(66476007)(66946007)(6666004)(54906003)(16526019)(110136005)(186003)(316002)(8676002)(38100700002)(55016002)(8936002)(956004)(2906002)(2616005)(4326008)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Fqn47mcLdvizBaS4aLENkWxand/+/YNl4OsWct7L2UEbJTAHWtCWX0PAzyOn?=
 =?us-ascii?Q?ETmbVCAvMVPfkUYLQITug41p3z0YVIFttBGsWg9Yu4LYT6yy4Zdw7dyzJ8kc?=
 =?us-ascii?Q?AMIino9Yj2XDJyZ0BmR2YC8V47NfbkQX4fQ0fReM34jS+Tiruev0EtiXL/Dc?=
 =?us-ascii?Q?2lvKWwEl8dfwkGQaxSZwpiCANUgjSg7D9Q/c20Q+/3jUS1FN4ZvFgbfnQR7K?=
 =?us-ascii?Q?greVlSp5M6kbOXI9q8KnsXDJe9jItfO2xjvYeNC38Dqd+96Zcvs6/BuF1LG1?=
 =?us-ascii?Q?rFlXJtvqnCDZZbmEmGdrWWvvhfcBTlY7BaWdw4BxH4ooIARYpwlOOeojfe76?=
 =?us-ascii?Q?mr2dQZ1r/V3yMYMyNGXzEW20Qm3wwgjNcE0GcQPi5sGRkemE62ak0fwVaACb?=
 =?us-ascii?Q?2I7cDgT4HUt53fqTIuUUjvi+H+LXwl5G6inLmpraviojJTzjRYPSi5BExJ7u?=
 =?us-ascii?Q?atTrN1EekiJMIXnjSeYkbRXuVELLYqPn6/6aur7EaYSVJ77Kdjb8h1rXzFvG?=
 =?us-ascii?Q?ujvqJkctVmONoXNYxXHDdtkznzZeuCy/ydrmWIwOCKOXQzmoydx6rvCteyz7?=
 =?us-ascii?Q?TBegSZIhsK9OjtD+v8SrTqfJSQMSzzNhWPkfbDjhLYGRssRsugJDa6BIhAbP?=
 =?us-ascii?Q?4XLdC7Wlv+XMslN9Xr2Y+0iK01JiCB3revKNB9hZbngx0pw3Nu1D7ZLEfXlt?=
 =?us-ascii?Q?IVz6MsT174qPo9yBSQ6NGMtaYbykjcp2DY+o/KibRaa+akLEm3q4E3COkIRq?=
 =?us-ascii?Q?tTGlQlT2C0BZ17rC76n+6pwOKVg1Eptp9AypG5J22OAHZ3Rw9PW4jExt/B8+?=
 =?us-ascii?Q?SJWkCYrwYHTbup3ACWicmM8PJAKNTUJ+9hDH22LWSz1t2kK04VqubphzaU4L?=
 =?us-ascii?Q?WTvBOy00RFqjUj8dYvtsYmBNpgParm1olOe1ewScAzLke7oNZ57tQKjwJdV/?=
 =?us-ascii?Q?3avgNHto5uto3LUH8K4M3AsDgHCNhBCcuMCfnEIeDTX0xdEV+2axcCorBqW+?=
 =?us-ascii?Q?WghroeZt+f/gc/urvnqhoqrEBpvjUB2th4CskaLa3k5GXeagBnDAYjo73O1w?=
 =?us-ascii?Q?EZdcD+jQSbGa2suyWPxbOR33m6rvVnPWFaIhKgAwp2WJVC7Ixy3zcGRWlj/7?=
 =?us-ascii?Q?/FtrwnxWj+gcbCgGeeYhvw7/cTunxAQS6LeLcm0S8TjxUcdhAzk3Is1pYRl8?=
 =?us-ascii?Q?N0KZ1h//Qqa5AxaKSW7795sPntNhgadTuGOT/C8+3WclaXSX3eqeg3qt1KoV?=
 =?us-ascii?Q?KKujARSWuZ2gSPDZf3DWSSxWxLd8Ywgw4BRDP4nkNyCZcdl8mFG6bLLmYsrd?=
 =?us-ascii?Q?xOeL3AEQzavg7ELB+cwiZmg0?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4378f4-5b6c-4823-522b-08d916e5329a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 14:33:10.5526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZXPB5PeK7VWtvgYP0YD/O/OgZ02FNpfOp8R8OqDxGyGKMiz5TTGYdsZyM56Dx1o40/kEK9G9qb5+KRSU7vzHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7810
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=761afde0a=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Fri, 14 May 2021 14:33:16 -0000

The RISC-V AIA specification extends RISC-V local interrupts and
introduces new CSRs. This patch adds defines for the new AIA
local interrupt CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu_bits.h | 128 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index caf4599207..d23242655e 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -169,6 +169,31 @@
 /* Legacy Machine Trap Handling (priv v1.9.1) */
 #define CSR_MBADADDR        0x343
 
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
+#define CSR_MCLAIMEI        0xfa8
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
@@ -191,6 +216,24 @@
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
+#define CSR_SCLAIMEI        0xda8
+
+/* Supervisor-Level High-Half CSRs (AIA) */
+#define CSR_SIEH            0x114
+#define CSR_SIPH            0x154
+
 /* Hpervisor CSRs */
 #define CSR_HSTATUS         0x600
 #define CSR_HEDELEG         0x602
@@ -232,6 +275,34 @@
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
+/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+#define CSR_HVIEN           0x608
+#define CSR_HVICONTROL      0x609
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
 /* Physical Memory Protection */
 #define CSR_PMPCFG0         0x3a0
 #define CSR_PMPCFG1         0x3a1
@@ -436,6 +507,7 @@
 #define HSTATUS_SPVP         0x00000100
 #define HSTATUS_HU           0x00000200
 #define HSTATUS_VGEIN        0x0003F000
+#define HSTATUS_VGEIN_SHIFT  12
 #define HSTATUS_VTVM         0x00100000
 #define HSTATUS_VTSR         0x00400000
 #define HSTATUS_VSXL         0x300000000
@@ -565,6 +637,7 @@
 #define IRQ_S_EXT                          9
 #define IRQ_VS_EXT                         10
 #define IRQ_M_EXT                          11
+#define IRQ_S_GEXT                         12
 
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
@@ -592,4 +665,59 @@
 #define MIE_UTIE                           (1 << IRQ_U_TIMER)
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
+
+/* MISELECT, SISELECT, and VSISELECT bits (AIA) */
+#define ISELECT_IPRIO0                     0x30
+#define ISELECT_IPRIO15                    0x3f
+#define ISELECT_IMSIC_EIDELIVERY           0x70
+#define ISELECT_IMSIC_EITHRESHOLD          0x72
+#define ISELECT_IMSIC_TOPEI                0x76
+#define ISELECT_IMSIC_EIP0                 0x80
+#define ISELECT_IMSIC_EIP63                0xbf
+#define ISELECT_IMSIC_EIE0                 0xc0
+#define ISELECT_IMSIC_EIE63                0xff
+#define ISELECT_IMSIC_FIRST                ISELECT_IMSIC_EIDELIVERY
+#define ISELECT_IMSIC_LAST                 ISELECT_IMSIC_EIE63
+
+/* IMSIC bits (AIA) */
+#define IMSIC_TOPEI_IID_SHIFT              16
+#define IMSIC_TOPEI_IID_MASK               0x7ff
+#define IMSIC_TOPEI_IPIRO_MASK             0x7ff
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
+/* HVICONTROL bits (AIA) */
+#define HVICONTROL_VTI                     0x40000000
+#define HVICONTROL_IID_MASK                0xfff
+#define HVICONTROL_IID_SHIFT               16
+#define HVICONTROL_IPRIO_MASK              0xff
+#define HVICONTROL_VALID_MASK              \
+    (HVICONTROL_VTI | \
+     (HVICONTROL_IID_MASK << HVICONTROL_IID_SHIFT) | \
+     HVICONTROL_IPRIO_MASK)
+
 #endif
-- 
2.25.1


