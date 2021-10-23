Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meCgx-0002iQ-Cq
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgv-0002eG-LQ; Sat, 23 Oct 2021 04:47:49 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgt-0006xZ-1t; Sat, 23 Oct 2021 04:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978866; x=1666514866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VFsPm/Le0NmunV+Z0t7675HUmm8YKZpuqWcYIU4WpSg=;
 b=OagOroTvVY71w0bmQvJeafMmaqayunCxf7uW8kNisYxkyrwfLjb1Cni1
 1exn88cpbju/0hR33RbxpReUu5Tdma10q49FC8TwXrMKGSC5R+kgjsPHY
 u84qtT6ZUoem0Ddu4BBtB1UEqdtVfPHI9A/py0ebvAdEf4xLwC9PTSuHy
 z1rIZKdwmLyuVmBtzW6fdy3aiYqfkdkiGYrYt4Zm17m6hKgD2gQ8D8g+9
 rK2z1hLyasDJE1eGuUCbOZ17s3Epmf6OUEIGlIrKai27NPA6uEMI/Yk8x
 7onjla2vvogm79Tf6RtTTHr4iJe4FuPzuJIoASfkli+ChtOD2BcysU27q Q==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="295398055"
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:47:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBCIQ8MMtaRDSaCkSrUNrPtYLEWbAlJEIAHTXym3p+7S10C1PlkeOwcuqLjOYXTf/CUR9yYL5QOj7GkcVFfHWnbhrObfax6hWbgTSpND4u91/+OuPUzjPLza+nC2nmHtWepKKbvnw5je6MbOR4PGKUI1pFbJzWYhV1jMAV6H++aa7M2kv1zt7YxDRm0jBKZYLisF7Vewjq+ohzis/oIQOw5981Y3t9XBXHAV/Ko7qWr57gApf4FfFBpVJlYeXAPodliwjVHsS+u8rOJPb8PtMY5dne9QyTf05gvhScBolFVrvVlg3LaccEPtaVkTvgEgeJU249mETxhC8rf/jNBbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rdkORUTMcNAMPkdUgbqfjrm5/Q9/FUfd14WFnTfzFI=;
 b=bbiyBGCA+HERVkd4d4OhIZko5s0rYMJRfP3YscBnHlXADW0zYv63WnrN03Js+/HqNpfcI+nWiMd7E8TMKJVV8N9iBvYnJC96j8rJMWnHCQk62JHPjvM1Hb0Vys1A6ttnTmcR8ioQ6KpL7NGn4VSaXWdUfgqiPEqfv95lC77StmVCzfu9NfrJq4a1FQCKVF/jUcii9yWl89+ZXPsw92qm+aO3zOkBuikTpx7eKua397QOi3iOFV311W95jPUV0niv9qy0gX/cEivIzS/3dfn8JKW17wxoWwovhVnrsRIiMSOMvohsBzNk7080kyqIZrdZjT7HL0DJQy4KJPNEl7FtpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rdkORUTMcNAMPkdUgbqfjrm5/Q9/FUfd14WFnTfzFI=;
 b=HhtXsuoPn8KNASHAAglZekr2jm16jmmJu101szjpZ0UfVX2CnPEGvKklzd768FMU6c6Xyw0vk1MpIkH+c+JNh0kpfgkF8LbpmW7EgOYK7ZHJ3A9CWh+h3wZpQteAQfzanBQXJ4BTdr5dpDc6ed6BJk0u660y/3m8AACx0uVsxI4=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8345.namprd04.prod.outlook.com (2603:10b6:303:134::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Sat, 23 Oct
 2021 08:47:43 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:47:43 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 07/22] target/riscv: Add defines for AIA CSRs
Date: Sat, 23 Oct 2021 14:16:23 +0530
Message-Id: <20211023084638.1697057-8-anup.patel@wdc.com>
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
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:47:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 620fe688-eee9-45c2-8f72-08d99601c74a
X-MS-TrafficTypeDiagnostic: CO6PR04MB8345:
X-Microsoft-Antispam-PRVS: <CO6PR04MB83450FC37AFA575C3D91DFD48D819@CO6PR04MB8345.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L0eWOL66EDUsU35Bu9jSXxMErNEsj0V7WHvgAJA3PwCCV0k8Btg+zriKWG/T8Gheu8sfvC8YdVyqAqPusqT2mEUAQUkU8rQ7s6xknaYZnlnqdaSPHuKFyGsRRGgBeTU3LS8P0OjsL0D1Cli/Pc+JPrc8jmfOyFkE7mjSpExc1GRSO0rq3v/r3Cu0tsQDogKHCBlLkemgPvKlG9HH17wX06rIPIm74MEwNKGBZObDPFxqSSm1Gz/01NeM9h8jxzcPP7Vis8I3JK6LgKmla+mD6o3aAuPtdSU2cCXIahLeNtoR8gTHD8tOeM8amoogLaynXh4gR9ru4hqDSV29iB2NnF+3IBojmfcVgx8tQwRpkxyPWHm6HJu4ljk4Mmt9KvT2l1geh1hzd8Tn7awywas+5iSiIv3ZO8XIISNifQSO7e3oW5yauKqlskS1X8ctwsASxBqOIn0DQvK7AOwwV8jPU77VA+HeESDMprIMEfi3O+fS94y84ZliN0g/5ZXMoDOum9Igt/kkOhumO1jvN2n7kyET8D3jBmIhVA41CjbwOhBwXabmLxTvUiR8+UqQZNjS9HUQee5YCoKkX6C7Sh5Q2x90cTQbcQbfWWc6Qczn5QGVMNMBfZm1Ga9A2CyWZc4WCgcJtKbIr1q1Gl6wdD87fgxX7/RIy05fbH3EQQGNto3O71mLRCrwpTmetbZ7sWmB6C7/je9wC7sgvyPni3T1QA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(2906002)(1076003)(55016002)(52116002)(316002)(6666004)(2616005)(4326008)(38350700002)(5660300002)(38100700002)(83380400001)(956004)(82960400001)(508600001)(110136005)(26005)(54906003)(66946007)(44832011)(86362001)(8936002)(66556008)(66476007)(36756003)(186003)(8676002)(8886007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F1L74zkBjibqXMNGK9OIL4mqNXPVPLGX3yJx2sTzBeWc6K4pzpRxSnkhAwNf?=
 =?us-ascii?Q?xqVyWtAgRV2jxkK0hL+EPVI1dQ9wc11hNGVanFVq9BFJEOmS5+RbCVKbYg4o?=
 =?us-ascii?Q?Nqa8Z0nyhiUkfRxc38gk2chJSb4AlAIF80nXiVSo4qol78Hc+4DuNAamv6ec?=
 =?us-ascii?Q?QyHBun7ViZYuRvfSimnm+03vbMIaj88XFUWNWGpuIrOdwy6YxNOmAmH4oDzA?=
 =?us-ascii?Q?SmI3uyhLoXD2hv2IG7Ekca0xlvQKfmVDJcaDX8cTO+fwDwA/HJhHdK8bLjvU?=
 =?us-ascii?Q?gwMLpv00DZvFoX3o2DZq4mmkpPDvuWfYHxfQm/SiZ512J5Sbqt1GcVgQEOdS?=
 =?us-ascii?Q?mMB1tj5J1TCA1zjKB/Xxvd9imathizdi+sKBnojvoJ6zv1+2fhohDvinPAFB?=
 =?us-ascii?Q?msp+eqGsJUWZrWnl1xj0m3KANNSWnL0QmJ3IwtSEoR3yaCN3HDKPvfwaQfOO?=
 =?us-ascii?Q?RDQuAivk6qTsp6JBUAES+fznlTheHv7bo38wcNu4KeJ0goHRVKl1wdp5Zn90?=
 =?us-ascii?Q?d+eI3lDaJuhQ9jcarLCWVEM6VjFq8fpzWMFTw3ZC1M8RWk2HSADvLjEMDrNG?=
 =?us-ascii?Q?HJFXbU212yi8k21wvJrk2K/nllCeH133BYvDBrhy+5GegK6JECpG9qdYd/OG?=
 =?us-ascii?Q?SukciaFkcS7zV960frkf41SzeP1UmhuKwu9G39cQ1v+DvcqGn/AodLPBCAl5?=
 =?us-ascii?Q?Blup0c4SSOlSNUmkVJTkV94/Oo+AgqgNZQ2c222Kp0pcTzE1wHp+7FNLntzQ?=
 =?us-ascii?Q?BH1KTIuy+NnAXDI9Q6qjJWYogv91QAFp1DgIgnd5yNH78MSUG/95AGEGa4fC?=
 =?us-ascii?Q?IHjktazSPFZPEgEaIUSXN8HsU/qgXHRyeI51fGxRlMmsvuJXLbBqu2BkfACR?=
 =?us-ascii?Q?VA1OLEVE/LzCIxDuI6K4VcnAJWWcuaHIqhEOxxBXiN8CbiT+0RdC5StMIU7V?=
 =?us-ascii?Q?3t46Q3NEvXxgNStNUkg/hXP7fAZK6JFCT03n0T9G9cVhAT30wXKwQ/dj2CvS?=
 =?us-ascii?Q?5xtuvNdAsB2VcEDsqi0Ml1eZY6u+bVqqSTew3/P4STz4Yqlc9zKXfNPZsbGz?=
 =?us-ascii?Q?QsRw86eQEBXV86zMuST4KNM6Dnv79/tJG+VeUACozUFaGbKJNGBwmWV/aSJ8?=
 =?us-ascii?Q?PBu9kCZGSqfD/sLILSWhXXhJMpuniPHIJdqWrt1K7fvVxyFWWxSTk19LSSFd?=
 =?us-ascii?Q?kbeChEk1cZdoLloGctijcgiNjfFLMSUXJn5hj+j24wEQYhDS/ga78mtJElKO?=
 =?us-ascii?Q?6ETzwkTOh23Az9kpW+UyxWss5t3v8d9+0mqbvXHGUMdpQUkmmiXELWy3D5+d?=
 =?us-ascii?Q?KZKvBlwx3NnpexJn5KfNETtMjtCePILFYiXCNbm94RanRR/Pogk04ZPpTFXS?=
 =?us-ascii?Q?6lAIbhBpkD9Q/L4CJAPZPvUOw4QHHF7cCw7pvpJNAZiowIi0JzZR9fmnt2Ko?=
 =?us-ascii?Q?kO1MFEpDKrS2B0OiUCyx+kJyCqKLjCofyEGjD/PR6j03zUxvgX7DsIbU7Zof?=
 =?us-ascii?Q?z/dFM9SjZdAl1cZqeCsUrBC2oa2VGI/0HyyZM3iHsi/gQm9ZzHoSAJiIW4Ya?=
 =?us-ascii?Q?nPvojwjzJ9kdtoTZyfMVj3Z4EZ/w3UqyLcCjiBsoTETU9Db9iDtLL1AESXlD?=
 =?us-ascii?Q?cqXSWaJaZMmI9iuzd92P7A0=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 620fe688-eee9-45c2-8f72-08d99601c74a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:47:43.3636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gplMMa+LvQsUf4OHElblG6N/t3NBZvPxYfyeSneLQUyJAG6Bu9wAmrkLh4QJvEYMwQHmuCdiy7KaH80Qeg/q6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8345
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=92346df24=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Sat, 23 Oct 2021 08:47:50 -0000

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


