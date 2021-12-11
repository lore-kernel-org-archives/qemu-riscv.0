Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvts4-0004p1-3M
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvts1-0004fE-J5; Fri, 10 Dec 2021 23:20:25 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:64471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtrz-0001eZ-0I; Fri, 10 Dec 2021 23:20:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196424; x=1670732424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UEdtD4EX+z39wBqXMoKWSXaSSc8Muc4cvjAZezt5/Ao=;
 b=r46YvMrV+w8MKbTdDeOG0arO6Yhzoi2vQ5nUUNx/tp8spmIrdMsCimHW
 dLnNtFJ6F+DSNndkhrumBedC3K+hRb6a6hD1cPS9Qo/uKX1rbcZ7+RWAZ
 kKKBz9hReZewf1+q3ZV/05juzX/+jpjZxIF5oGT74yDFDVQT8bUDn00W6
 eGVxUDck+/58Ur81MR4euaWH5feT2WzYQNSx1Yv4QWegTozKtUJ1b8Ftn
 E8oXobRgp/dS/cYUzD0i/G9P6SjI2AK/k3qGZkLc2KeT7OnPN4MIJCVMG
 vgZhctdW4xRXPmlT7rLC/zFWKPLRvlFZqHGL0aSqUy40HPagr4TyUkzYi A==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="188998791"
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHjk9ET865npLN8zDxJqaNh1R6tQN59MH4aWz9TpfSem22cdQQ7SctHqD1RTfF1hctmS+4uKG1owWlrBfPLqZrVLrKZHPmArCR15kD/SImzhB+kB4yjGuvqOMM20q7AqQRw4ZFupMO53GqB0Q8SoHMRI6XkPdwwSuY10ARC5YqlrMZfGkoYnMRSzPB1aFhiCrMN1xHqLKjw8sgWjgZ8wh/BFZmGPAntGAkLRPJ1LaK/8PE3zhcQtNMwRbF+ytQVQ3HoMRzwe0qg471h3qui2xiG59htBmNmgBhSLfOQG2rYUVeDMokEXAA2GwHr9FJiUWE5juzYiGIqSIVR8ETBKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wusqrzVdRlW75i3Yn+9bYWPM8G/osKnZYY8EOYeIqyo=;
 b=LfDhsIiHjHJwhYNtjvqs41GbydzKLuRzJo3CUjqSFB8F2OM0uMGEXvYgkcnI9xDU2BhdEVErTr47xY+Gn9H3HfvbV40U9sID1W02V5CBvdawTcB2KDi+/OVWgtyZCVkU8EmTFxlFTI2SvTFS/9dc68wkNKaCRqc0OrUNhPEAnJ76Ap2rleRKWf4/mUZRY7CHtkMIYH7GTbxxyMwwox+9byH6TML/qyscM4Vrj7pR0bhq0iheDEDjj9fn+V0nll59N6nq6O3OdqV+ziullI4c5tviiKM6WRL8M9a11ZxKULMTK0j6oblmxoprY45M5d/rmDJgaihGUVgXApwNH59ibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wusqrzVdRlW75i3Yn+9bYWPM8G/osKnZYY8EOYeIqyo=;
 b=XrlfDA2zOCEEtrUtycHazGyEtT62gktc6LHy47lQsf6q+ebyvVBq50PUPBacd8AHJ825LRyOYMS53y4mUTikRO/beCoT5ObytZ+QYtF5UB3x/YUce5/VNMXbp/zkQcDMNG9w4MkUfR7vX/Zv/k85VaxtuvKX3cn0ilS81IGQy+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:20:18 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:18 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 07/23] target/riscv: Add defines for AIA CSRs
Date: Sat, 11 Dec 2021 09:49:01 +0530
Message-Id: <20211211041917.135345-8-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: c75621f3-1894-48d7-cfe8-08d9bc5d89c7
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB826806FBB2FF4B35854F9C988D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7CZZw8+efmKj57OmHIFWEpb2RgMDO0HNdIioMqzUwEPwfoP6u6O9rEhPKJNFrNlQIWBMbeWp1J8RGgWMkOFVFKsdGqtZ/9KC/5gIb1yH88YAf3EuLQQmadqXvXWcYXxvdf61TE68/Psci2Y2R/azVjzL2dJZdo5NZernaLX0C+VMqp/XnRIKHnS5Y/aRKvMpwAPGZQl/oVan3aALqo4Wl75PTwUwpW4H8BZQiK7IjWkfZTfJosa4Zm1qGLWdBt3faV1Y5BXoDqqOWXXwdl2z0n516jSSuUPksWXwp9kueinUWdCSF2jSuzSctbsfuwLS76Bxi/qSXe5ddoC77KnrsRhesIVh1p/3iFRMCGjspZB/UYfh3A0V/jrnD5dqXjWmYDHxrg3oKivmTC+Fp6HAmBAquW6BSLCZPCNJcBxfnXVjmvgB3tf2FSxzqVjZs+p/DeaGVZaxpPWUs8NY42koHDMXgcXU6NpIFu1bF6nDUf5WXxXwcXTsQ4G/tR2l5uFd+aUgRypPT70LUqhvc3tVt9qqYfpcNiDsk8t5W3iMIV2ovkxinSQhgAdHVy3CgDNbXBcWMes487SY++KEAtzzQcJ/137W7ze/v4EddEYGRPoHJMlcCGN/wsXRKAGRIJUB+XOj6LUAqRHDBBUuJspLpcETgyA+QARNHRujN7kfo2Rpw5Ta46vclG2+DQ79UKiZJjE7BnYNAqKNUBtGqT2acQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oYB69FSg49OuoZwcE3Ibf5IXaQmEsVnj8DxLgQ4ucCvY8vE/6RZvcfJYR9nb?=
 =?us-ascii?Q?SyqnUpOVKZIjZ3X22/vyQ7g0u27ovA55rVkUXtEzwqYAL7QBSMzxxwrplMXr?=
 =?us-ascii?Q?8mSrQc8mhfDY6yPeRdcDWIzLU+xJNtVOJPsOawXi6sgUWi2cId9/8K1yBRJ/?=
 =?us-ascii?Q?XB5VQcAUPw/EVTayk/8dBjWENqPgBL2xZawR1xX3nsYnTPyI/0YqSSRZWorv?=
 =?us-ascii?Q?6wdCTkNIhD2zoZ9p+W1RIDeQfdwb7am4FqdnPsVc3YrIlcopfY1I3p+4XGXn?=
 =?us-ascii?Q?nrXJ9O/CvMP6DyGUkPW/hrW0aomcBOxpSa0dBoq8uhHnIS3Z6wWYVpuV+n7t?=
 =?us-ascii?Q?CXL+fRsYFpU46TrX7jMFeTU3JViKZJMzoyGa5nH3+QT2En05GAT1nR8chZS0?=
 =?us-ascii?Q?UK0OMwiHExywL0h0YUFcBP6PVNIz/0apLEMvM22tN2czBxpp18/+qgltq+6n?=
 =?us-ascii?Q?ODCgUDZN+TC8HD/lq9UqBtiXnOeD/jSK5IKhWRnDVCtgFk++EZdTbGXb+yRr?=
 =?us-ascii?Q?IFI91S4QEPGlZFS5lPkw6qqzjNYSkTMQEpP2b7aO8o+nNVRird7Rk9Ger54E?=
 =?us-ascii?Q?0NEuJSw22vqaFo3sOIQzxuRzS0NlL32hFfqlVVma9wvpOJxnuHbTm8sgfacX?=
 =?us-ascii?Q?U7NlJ3gxS+Rp+IGjCueajwdSo9xExe6UMBnwAZizdpwu6VTQUBlbOdg9C0GT?=
 =?us-ascii?Q?ShQVHplPK7aBb82hYv8bZkqX4NK9Y8hbQ0wqgL7VKxLJfbKY43ucMr972RwF?=
 =?us-ascii?Q?GoWNwmSqkCmQlj3ZAN4GVw3KXlifcdycJ9EI8meTiMB8yE2nKb9F6xCIr/77?=
 =?us-ascii?Q?uWk73uAKXF84/rmXa8O/0/52S6SJh+4SjalxDpCZPvkRWPtEMClLnaXYTJaB?=
 =?us-ascii?Q?SgV3vTsWRwHWArQwgp93ORJc2yaEwWwTS/IF/JALfbkCRhShwZsSaFGzcs2g?=
 =?us-ascii?Q?Cjf+V5ffRFHCGQzHvyaScQQiVCSExX2jzKIVbNXRcQjeLyJIbg1dYi0IVSqr?=
 =?us-ascii?Q?PfQRHNYwXCyQ2ZNbLM1FemjA6YPdmdnFTOW2bxviIGkcV3Ia85Hrwh/no9tR?=
 =?us-ascii?Q?pnJ1p6Deya0TW1Xgx11NoYAAAFIa+5H+vniWA/2YNaqBUAB5TsoqMv5y1TG7?=
 =?us-ascii?Q?tPYYR631Q2ypyy3M1SdSrN+0sg3MEz7UBlUuhL8u+plD4XZm4ZPc+tqpCqm+?=
 =?us-ascii?Q?CZgU8mncOMT8SHo1qLRXcxiQuX2FVzROEyL7F/rryHZmckxsU2zod58qIH9O?=
 =?us-ascii?Q?4KkHRjOOs7r5sYiyvKZslUcJPizdsuoveJ2eTR4YovujL/8TRAEGsiqO+hqu?=
 =?us-ascii?Q?aRkR72wRnogsCMR56NusBCVzhjP2fw3uoEuM05VjK/Ma/4fLV5HVQpgMzKHs?=
 =?us-ascii?Q?3XiOr25ajIvunpcvuK9K7kThHrB90zz97llT9IgN25ICE2uAerTxdI1uIGO3?=
 =?us-ascii?Q?ulZgZX63zcG3HqclA8lNeVEj35WUO7nQo5ceAhfylqC3nT13rbeiTSaymKwj?=
 =?us-ascii?Q?8G++seBPK27wWtLT9iv/WHW2wNB2X2L3JBd1tNhJfhLL5Q5UibTFlHKQ2ViA?=
 =?us-ascii?Q?yePR3ls5pZwdCyEgcIsldwXziSneGm/1DYWeAOSZdeRvAYwwabeb76BFvDRP?=
 =?us-ascii?Q?6IV3DETzTWLZcAg6U+egRb0=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c75621f3-1894-48d7-cfe8-08d9bc5d89c7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:18.1220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlsiTQr+Vn8VRNl7ZvEIepFXujWe9PNhV1t/GxPX07gq2NOqo+plwsLW5VxU6TN4YyX9LHB43JWuDR+Yhj2JHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8268
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa6.hgst.iphmx.com
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:25 -0000

The RISC-V AIA specification extends RISC-V local interrupts and
introduces new CSRs. This patch adds defines for the new AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu_bits.h | 127 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 0c6ef6e51c..5b28e73506 100644
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
@@ -619,4 +691,59 @@ typedef enum RISCVException {
 #define UMTE_U_PM_INSN      U_PM_INSN
 #define UMTE_MASK     (UMTE_U_PM_ENABLE | MMTE_U_PM_CURRENT | UMTE_U_PM_INSN)
 
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


