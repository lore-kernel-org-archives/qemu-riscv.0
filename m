Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrX-0001CL-GV
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkr1-0000wV-Io; Thu, 02 Sep 2021 07:25:59 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:64029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkqy-0002og-7D; Thu, 02 Sep 2021 07:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581956; x=1662117956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=daFfzZ/Qkti+ZKqnQDNJBCDb7MKZQhcGW6vK/Vz3oAI=;
 b=mmlOKRKsd/qF+C8Q0IJkw6qJ6kzMHLoaQU3jew4RtMzzdlpgdgX4tTGh
 F7PSIthFmrUmUOFG5aavpKwlbLSQ2ACuiPA0bQPtVIMFPKAYMXFTQPQ+p
 KFSeJff1LKvst3HmOhsZLAjydGnayLv8gSxkx6qk/5D/LB9hY1r8MlvaY
 njUQIkd+EkpZ4ZEpiZAcwHoVRfeNp7qgcnuMSgueBUqTxk70KmDp1XgJt
 6yeZ7QtN/wU3LdF99G6zzshhUwQImHrTvK1HuVGTb9fFex3GwFX/1Sqy6
 NeCTK7MT1sKG8hZW4NMm7rFtyyRfFmdIUXdZrePuQR1OpprBmvcxD5kUU Q==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="282832037"
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:25:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNFsUgFO106G2DZpQ0yCPnTaOF3gWwiyxCxUx4MJdw99qFz0wr7ntk29No+FdRTaDHJkart/hf5EpPdC8LlFSl+BLlPrrPFzEqhErQrTJ8ezWwWujaVqntecUVH1uTe9fknoqUGLdEhZEeR/YEUmQAjgax7J8p+5yF6bQ2dyGJ4Q7uqy8mSMqgTz/g3JAKz/pHEGKLpFzQ6nA50Y5OyPnm9nEYau38i83eDHYK3Mqe3ZfdcNn/hzO4rtBCzALBWzzdXvz2GM+1u+7qe7THd7Sur0kmb7EA3Rzezm4vvO/ynm4r4vS0kOqciKUvYfeFiRCQb6kaIsI2R/N33vxclklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=m6bVhk1FBRteZ/JPwH6wRPF9v/QW91pw0j9X0YBex7g=;
 b=ksB0krMMXRQIe1AMkGZwqG9qpaWwcBXiGcogJUmj9Qo39KaUUXcEUaRRRL5K/bMzZtNBy1suX4q75A+XgpFVBcV6yakeV5OwAAy4lV5HhSiHNJxfJ2JnIxhW2jHTG7eh0MmhNl2WQTOYmX5KDmNwNZcwrtHS35yf83F6o6glsJw8LPrWoPSh1W6VJDlg62OJtwr9ojGYAMT+40Aa02KcrgZhBhSRZHz3VW3OpthWlUzqTDh4yt81bZbfJP0xfaIbw/N13ToMpxOYc7dV5LwlRy6Z+BlCc2FWzoepB7TxZlZJZrZqa+zx3SrOXiYCWPbWbT40DwGjjkxwyd/a5HCVNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6bVhk1FBRteZ/JPwH6wRPF9v/QW91pw0j9X0YBex7g=;
 b=MniNymu+dntAQ2h1UhI6W03YX2VKiR/+hl0NAywTbZci1DD0oD9F4lmveNd3BP5nhoR46BZ7oNMG4vKtPaTRgbLZZ3hNzWwT/AxSISmcL1/NtwNWhwwwglaSbfl0YjMfewRtFVf6+3PrHYmhZAGQcFIP4zwMLriuDW4CC6LYwPk=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8250.namprd04.prod.outlook.com (2603:10b6:303:161::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:25:53 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:25:53 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 02/22] target/riscv: Implement SGEIP bit in hip and hie CSRs
Date: Thu,  2 Sep 2021 16:55:00 +0530
Message-Id: <20210902112520.475901-3-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:25:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b47ec052-c6fc-4fca-1343-08d96e046c89
X-MS-TrafficTypeDiagnostic: CO1PR04MB8250:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR04MB82509B871F1E6B78A7106EC98DCE9@CO1PR04MB8250.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SAfKL8F86/xI+YejM8plI4gY1ZWsLO4Gfq9pE4JDg31NK9BAbDHxVGOTJRXvS6gQt51HeOPfJkEo3TBLn7/GzeLiy4lktNziAQE0MpfKIv2yATCSf3JK3cVVJFhESIuINlSbSTH90b6hDarJH6kMKLOdrKDq+BwrDPlm0VRhzBLIHFzb8o2QSwSkpPXtjxf2md5chTL/xsqso4Khwefo1zUo/GBKd16tssd6z0FFOVZk6Z+AzFFpfU2X+DwJh1VfgEksVR6yWJr6Jegyst6zdd5UCqu54S4qatK0KTH9+LjS7hA7V3r8uMRS1vD87kt/EQin8m1Suf7B6QQpcqrLJw9Ximfv6o5KsZZlFicyy56gxdRgX9yl6CBHvxEmK4NmbimE6sL/DLHzGPg80fo2hhf1b2hITyyinalQ7DgyJP5RhC3LCQ/swhJnwYIxKYamjr1xr1sgl6xcsqwIEyZ6AKM5dH3jfHjipatGYS8HoHg1yqWQrGSn6pvmk3OzYuEkr17MznEw+rQk8K4mg+t58qZT5dE3CbnHHeiY/xOMvaK8KOch1NQojGd/uPQKfLAYnxCQ88cW9KKEW/7dcYPLWmMH4tRHouWBXb0Ol1RWKCEDP/YnWCZhv8mQJWKX9lgi45psEdHuvRGm5KAU7Wa1iN6spq0VzBnYUZOXdzeg2qDPBNJvwXlVW6RxL8Jk5+VnJx2l+RhrSf5JWiguexXU3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(83380400001)(8886007)(7696005)(52116002)(6666004)(316002)(66476007)(508600001)(66556008)(86362001)(38350700002)(38100700002)(8676002)(186003)(26005)(36756003)(2906002)(956004)(8936002)(1076003)(66946007)(44832011)(5660300002)(54906003)(110136005)(2616005)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lQh9aMEhFSpZYqfIraPLxjKI4FNQlhyL7fazS0TcXVrCICER2cV45bDzFb3S?=
 =?us-ascii?Q?I4fJrVgJwdxulBZuJiPDx3L2ZV7x2SypJ1JY++icjrFnjIfNsP220sZ1pz4d?=
 =?us-ascii?Q?5E/UxWv15iYm3PVkwdz0+hemzMTL/4xmJscv/MaXAcpeOwa1xBdzvwApyrFv?=
 =?us-ascii?Q?UH6BjRsljJ3ZyGjt6qAYW9mWWdGZTGFzq4d4qY/cdILZBnJq3y5Q+Ad/7+AP?=
 =?us-ascii?Q?ZBK/Hu0B42flFEEHeQqQNJXG2N8vDxuItfeObuZTVdGYuBANc6dwu9/ozaKg?=
 =?us-ascii?Q?3oHZ45jITtWsbRAhsCl8R8gxs+iIHBH05VozoDRPByJxb7qk6Jf7DwvsyE5T?=
 =?us-ascii?Q?1ZEddlR9m8UBehu2pRCyqxTzoNm2De/XuOYmjfS6J6pO+3arDeRUGb20+X34?=
 =?us-ascii?Q?v8y0KafUj41oy482iFxRUqJkqpMX/17pPATMP6aGPS3jYyajBTBFJgzJCwgK?=
 =?us-ascii?Q?LriyAEoB2olwMhWxUeyx0GYjBHw5vcWbmB1v8EGq2CTODzr1fMWmlcaADOFW?=
 =?us-ascii?Q?iuU5vZeP8E6CHfNeuHzUEA2GexrMrW1qcbldT7zTXMUeSy0SZtJ+C78wTtl0?=
 =?us-ascii?Q?OSc4F4Q05qyRmEYiT9eerCMePxICH9RJZux38O94hIckTuSLmTYAolf66jg7?=
 =?us-ascii?Q?EKZQgZCUCOC4KbKWPm4AxB4BT0dh7eXYmWsPRCptHL0qSJjC7HLUmv1UYUBe?=
 =?us-ascii?Q?oAsVh4OItHOFw3sGCMOjfMuRQYsN6bb1AgH9ARSTRCez8BYG1ViaC2nvia1n?=
 =?us-ascii?Q?LN7Kl3IWdNWfeRmUKX01cDasrTEFa8jAAl1LplDo2eZjnXpi8J/VVcK5WhAi?=
 =?us-ascii?Q?vHebTDvPPY9yvoW8BPV1z3j42OmCfmHA7V9qQSFU32XPF6duauybg0O11CZ4?=
 =?us-ascii?Q?W8Bn+kAFmEqEcEv60lnbeCnKy4jaUedyRhNjmCVPpNV2yPyJ0Lb/76JDmcyp?=
 =?us-ascii?Q?7/heDmT8FCDuRolZpr0W0UYSPaqM5k0lY0GtODcHwpy8yKV3Y1TjWB08oTJu?=
 =?us-ascii?Q?PVzHnagqfwbeBnm4w+y5ffenZ/B9vR0vKf63rG5l50HFQvFhKCu29yzz99KK?=
 =?us-ascii?Q?VHC27DCZ/bVWsUs6jy4eBrh9my/Bv+xln+vQE0IAGjnBGxotn3sO68DgpAfM?=
 =?us-ascii?Q?9OxLnxUcwpc7kq/26C4hQTAYQOOYydDl1D/3FMkDKdGEouGb3rCeQ9Iahdpz?=
 =?us-ascii?Q?LzTpmmWvFla20D58FmKH4Dkd79uZbShzIZs0/CkVw8ZygIuedR1cqwdX9J6I?=
 =?us-ascii?Q?YzSjsE4Cyn75ohxG1IB7XvnfH20pEUjky9Iu618MMuqNsz6x896/eHN6G0Sn?=
 =?us-ascii?Q?qxBhiaMnNb9ibAdSEqZ3DDtF?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47ec052-c6fc-4fca-1343-08d96e046c89
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:25:53.0528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ywBCVWn4eVE7OSoXWAuPaq1hSNF0U8oFndwj7ppOZuinqsr5uUUi6rQi1QLCa1dSn0qw/EZnch8DiWRqD4ECw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8250
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=872ab4b15=Anup.Patel@wdc.com; helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Thu, 02 Sep 2021 11:25:59 -0000
X-List-Received-Date: Thu, 02 Sep 2021 11:25:59 -0000

A hypervsior can optionally take guest external interrupts using
SGEIP bit of hip and hie CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.c      |  3 ++-
 target/riscv/cpu_bits.h |  3 +++
 target/riscv/csr.c      | 18 +++++++++++-------
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dc1353b858..9d97fbe3d9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -368,6 +368,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->priv = PRV_M;
     env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
     env->mcause = 0;
+    env->miclaim = MIP_SGEIP;
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
 #endif
@@ -600,7 +601,7 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 
 #ifndef CONFIG_USER_ONLY
-    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7330ff5a19..17ede1d4a9 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -504,6 +504,8 @@ typedef enum RISCVException {
 #define IRQ_S_EXT                          9
 #define IRQ_VS_EXT                         10
 #define IRQ_M_EXT                          11
+#define IRQ_S_GEXT                         12
+#define IRQ_LOCAL_MAX                      13
 
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
@@ -518,6 +520,7 @@ typedef enum RISCVException {
 #define MIP_SEIP                           (1 << IRQ_S_EXT)
 #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
 #define MIP_MEIP                           (1 << IRQ_M_EXT)
+#define MIP_SGEIP                          (1 << IRQ_S_GEXT)
 
 /* sip masks */
 #define SIP_SSIP                           MIP_SSIP
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1f13d1042d..bc25c79e39 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -408,12 +408,13 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 #define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
 #define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
 #define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
+#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)
 
 static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
 static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
 static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
-                                     VS_MODE_INTERRUPTS;
+                                     HS_MODE_INTERRUPTS;
 #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
                          (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
                          (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
@@ -644,7 +645,7 @@ static RISCVException write_mideleg(CPURISCVState *env, int csrno,
 {
     env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
     if (riscv_has_ext(env, RVH)) {
-        env->mideleg |= VS_MODE_INTERRUPTS;
+        env->mideleg |= HS_MODE_INTERRUPTS;
     }
     return RISCV_EXCP_NONE;
 }
@@ -660,6 +661,9 @@ static RISCVException write_mie(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
     env->mie = (env->mie & ~all_ints) | (val & all_ints);
+    if (!riscv_has_ext(env, RVH)) {
+        env->mie &= ~MIP_SGEIP;
+    }
     return RISCV_EXCP_NONE;
 }
 
@@ -960,7 +964,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
     }
 
     if (ret_value) {
-        *ret_value &= env->mideleg;
+        *ret_value &= env->mideleg & S_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1078,7 +1082,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
                       write_mask & hvip_writable_mask);
 
     if (ret_value) {
-        *ret_value &= hvip_writable_mask;
+        *ret_value &= VS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1091,7 +1095,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
                       write_mask & hip_writable_mask);
 
     if (ret_value) {
-        *ret_value &= hip_writable_mask;
+        *ret_value &= HS_MODE_INTERRUPTS;
     }
     return ret;
 }
@@ -1099,14 +1103,14 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
 static RISCVException read_hie(CPURISCVState *env, int csrno,
                                target_ulong *val)
 {
-    *val = env->mie & VS_MODE_INTERRUPTS;
+    *val = env->mie & HS_MODE_INTERRUPTS;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException write_hie(CPURISCVState *env, int csrno,
                                 target_ulong val)
 {
-    target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) | (val & VS_MODE_INTERRUPTS);
+    target_ulong newval = (env->mie & ~HS_MODE_INTERRUPTS) | (val & HS_MODE_INTERRUPTS);
     return write_mie(env, CSR_MIE, newval);
 }
 
-- 
2.25.1


