Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBA-0003Cm-5T
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGB6-00038D-C5; Tue, 26 Oct 2021 02:43:21 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:53133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGB3-0000fV-C0; Tue, 26 Oct 2021 02:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230597; x=1666766597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=F4pbNsiSyjXt/w3RGLt2kpfldLdxI9pJ+NPektJMfPQ=;
 b=a6NjxA3U0w35K79y9As9Y6GfYpHjOK1i/GQ83Y83SwRZoYfMLK390bde
 718dWbAVnDAE9DSbWHWORG/pm1uie0NhrdWgYPj74HswR7FzzndAYCeKi
 3xpUEJt2iYxeEWQtAjuABDsrcSw2PBKbg3jTKdU6RjlF7T1gSCgOT52e7
 4BtQFxlgZ7WSDUt1mUO013beplh1UZw1Lfextm+kDVmfgGfK9CxZ30Dka
 3ARC0QNjx/RqRweQHJ05dra2HBocTAHQIoGrDKH1Bzua7AZvg6yRczlqc
 NTaH2a0a8jWG0l/Vo4fS18Ygdad5V7cqgA4sM5hEmbpxOOA1WmYWbg0vf Q==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="182854745"
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZG0qxCs59jshkMfYc5UXESi07zahCIRHpGm+/HPAaVpVPPmHHXdiO2RJnQAqt7+P0oFka2ZgT8dZNRaTLa3DoQdnyN/8BVhyYP16RkILGfFn+2/UQtONfSm3hk9CBp2l62/k5mHAg4FPJiU/olGgi0+Nbko5Ggcl7yMBGsOxYwtU4HdtHM+jHVeWSmy16m+h7HAs96lygxSnp+Vls08PDqRCew1PtsQHjSscYB+HLBuL3IxbDjbasE+S5HMfgMoqpT3XuxaO+DqE7btVeeskMzOqcYVCrYnkb3G5GVIr1wdcxIn61yWXXDUQbBEz1RtMgpFZGXwyuUX2IAxywOilA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZRw8yn4wv6nwmvRB4TZv4OYoG8c4FtHXTYiLykfc1Q=;
 b=P4PfQo6BgUL5dsyxd7lyi+ous9vsiLJBz757oPpG8rtxBouZg5frxKcMpPp06q2JobUDxBX6U3d7AoWfAFrwq+U9IXODWvI02LRPPwHfII4zfXFOC7tBBtM+gDdgSdHr9iDgMKhfrYuRzx6VdeMj/DlavuV4z78msAJfegAJiRHphmCAMVOJexMH10Q/FYRxR+RgvPIFDZPkwdS88YkR2PzfQfLC59KBfvkGs+bMvM0N4WZSQ5MtyL142+dpZTz2JZNI1YRx4L/CbEwr9zvyFpfPv5Sn+ChaL62BZNtB0gRQ91nC+LKrZ4V+Rj3j472n/7KQoj1BxjlW0DIW2IkNbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZRw8yn4wv6nwmvRB4TZv4OYoG8c4FtHXTYiLykfc1Q=;
 b=imZamo6o8lRC8Q/1CBx5m8K8NPplV6Q/rfmVwf1WcecT0wst9MfxD7tOx4MZqmcffMl4pvtSNRYfx6jsrXYgthvl6qT6FR/7hOLf5d+pnIYx9KKDC03WVggkphmZJHS66aaMc8A9OtQYk7m/PAZZSvzLWvCu0oZMFeQtsIOcl2M=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8379.namprd04.prod.outlook.com (2603:10b6:303:142::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 06:43:10 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:10 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 05/22] target/riscv: Allow setting CPU feature from
 machine/device emulation
Date: Tue, 26 Oct 2021 12:12:10 +0530
Message-Id: <20211026064227.2014502-6-anup.patel@wdc.com>
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
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4bf7f52-c4e8-4475-78bf-08d9984be084
X-MS-TrafficTypeDiagnostic: CO6PR04MB8379:
X-Microsoft-Antispam-PRVS: <CO6PR04MB83790515EC8622F0D62A317B8D849@CO6PR04MB8379.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NWRkA3yP6lEWcq0evpPY7he7DflfxjQxZLI9vUCObGicTqvF+STbHb0DJ6DpRmPeWGn4AQ9NlI+LvMzHVajj+zaAOn/CpUc99FphEzPgISF+cO3YY3M0T6alAiUQYVP4oe3N/w/3zNcq4GjCBPWMLOjVYI9r8SCY15zxbOvyD3zQpWjwHPVRo1ya93Yjq9cOHb1ga4Vs11FqyvziQ7CkS/GyVvejNqkAjArx0JCg2WWbDaSwKJeqSwy5OFC8F+H3I1JSxfEcHNaXoJu4UNPAN1IHNRovza5Kjc7peWqjO6NqdIBS54s4vETCuaDtu/lyjITZ2yQhS7Xy839VWo/qCKgHm7bp6XDC3lCQ9EnZTPcZN7wqs4jESDlxPwRdBjsDnpB0v2l/bdrBLmz9B1pfJEDA35/f21eFq6D03dxDkoOIIFfYCbP1t9/OVF+XtaLUQpMIwHD1mz5dxh0eskWCaUxoy9Lmb8jb4D7+ef6xe3entyKflDWLno5uaOD04OnQEEmAqE9Xkn1N9sp2VNUdM1ltzxcB6dG3AboBtXEG+M1k39A9vPsQI6tA5Q7JQGZyjPmjwQ9FCwZKmSsiEoZG59KQaG3P4PAKuiRxEvrCMDTAGq0Lo1DMrfdWb3XuV+HodED1BiSKcm+WOGT7W2gLynnBHMo8qC6ByBwNBg9HGT7vNJeCu1NF3Ccvi3WIs2LZPX/ILAhX10NEvJZ8MUWoGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(186003)(66476007)(4326008)(110136005)(8886007)(55016002)(2616005)(1076003)(508600001)(7696005)(2906002)(38350700002)(26005)(44832011)(66556008)(86362001)(54906003)(8936002)(83380400001)(66946007)(6666004)(36756003)(52116002)(316002)(8676002)(38100700002)(82960400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OYVmoWbldiusoO+/AVsoRPFTWWOZFWnhw9+g3PtcR3yhR6x/Zj5CjPR4agZR?=
 =?us-ascii?Q?/c3CDp98UsS+RvlolDTttSe2snTGZYp/CtyTFg6uZ5lWc5yrWCarqJQIf2u1?=
 =?us-ascii?Q?uF3RhpW/z7qSCe8Ki07X8a+z7fe6LnI/4PdKnuffJ1hpe63sdIGfP+vH16fa?=
 =?us-ascii?Q?PpGpke64YJXvnoiVe9bD1R822uaPsMXhZ5GxDmN9BxzzNH63wfHPW6weAcZ6?=
 =?us-ascii?Q?hfkO9VyvxY2mvB5HiHSchqBealtwUmnvzOwUbrE6+6Ju/L0gZx5lsTdCCcWA?=
 =?us-ascii?Q?dh3zdV/K09LXw4K5JfPgwQPtqpsVvMRI3Cd7H9SP79CcvhhttkF7e9KahwP4?=
 =?us-ascii?Q?HarofC7wKtKtU8TqR6Oee5e9DuRM6uUka9CyGeibQEQ/wez3thQE79ahclaU?=
 =?us-ascii?Q?dO03aYo/UL68Ymo8ZProTFTeYI1u7+0Cgq2Zfrni6yaGYADG71Jgc3YtfgQ0?=
 =?us-ascii?Q?drpQhaS+ZhbgBc0cDRaBlBAxkSifxWzOPzGjO/qrcTFUNG9+tEdTjS8i386j?=
 =?us-ascii?Q?yo4EFTn9zx/ShovURfHI6o3eaDEXHYm8zXoCc8z9LnWWer4c2nfgrVteBdK5?=
 =?us-ascii?Q?JBqQFvWcJCzTr8wHRGLnBQQsl75Do1DXqSiIzk37J5ysJzRWvrtsWviZvw/W?=
 =?us-ascii?Q?4PZ6Nn6kRI7r6JahHC1MlX5TAxZ9QQBC3IpgkeSRycs3V8v6UdrGPbKbZXbw?=
 =?us-ascii?Q?UKljqdXUHARb1Y0UKa0D6HGNFnYw2jpGikNLtIkmjiH6nKGf54+4fEn8o1c1?=
 =?us-ascii?Q?WNC9x5HLHN2mgNKIldsBBWk0kQDQ45uKuYhKq5YkGL5WxefBGE/+ztsUBRqo?=
 =?us-ascii?Q?vevlzHT95wlItIAHEj+SUY3nOHOUMotGIYwVkMGFfmTv2io6S/cY+dxP9OwG?=
 =?us-ascii?Q?PHxYPXFx4gIo7k0DdowhXySwB908YgOSzwMOVU+uAPU1Wc/yIWva8SE7Bv2x?=
 =?us-ascii?Q?O1LPN2JDs8pLve1PYXkiwZ4YPu87pYLx/7TTvwxK2R7SV+mDN+yP02pks3fG?=
 =?us-ascii?Q?EdQZkXscxsgjysr+9Ml+LdeoBsY1V2j3vpyiUk+XK8+tQG3ihfDX+cRn64dD?=
 =?us-ascii?Q?ilGJcxBjHmvYPXQkc5pswJj+6Ur8RrnVVXEDUoT5KWHs1T3u7QjNdN3W4/De?=
 =?us-ascii?Q?Eb4YXez5Vv0X/+zQfwrUKjIE6m+ZD+4N2/3J86I8SE1+IOsvAlhEaVeJiCRu?=
 =?us-ascii?Q?kyzr85oBh72gJ9PjCc8yNnGUTrQEupgHNAPHOIJ45wVfMJ7gqqoPz9/a4pBy?=
 =?us-ascii?Q?dMCVtBK/+9kG794dME2prlRA2iExW1Q+jYbbBow+720KpqL+LHbsiqwnQAfK?=
 =?us-ascii?Q?Hm4UPprxK1xQK+oOP2Vl/azIrJJ0fl4r4pU0WP1OyG7lSnyCpD0pLEN+jhpX?=
 =?us-ascii?Q?GukEQUiK5Ri1qCeHDMeKEIAed/2/jM1O9aQcXe/GA8QswOb6LCfIrPTxKvCq?=
 =?us-ascii?Q?rnpZTHpu756OOqaIU0VvP5AGZr5oVuHQuK37v4KmGs8G8Vfr+sfr4tXvefDG?=
 =?us-ascii?Q?kNHd3FZm7kX+12D4dBRUUpPN+K43DAkPQJ3o1+F1gBoz/NOBMBaD5LJ66Dvc?=
 =?us-ascii?Q?0BmBiJRBfqsx+yjQcLZuSyuapinjwhfMZYUGMV3RdsvJoy6xpg4lPRuRSkqu?=
 =?us-ascii?Q?xFweWBcVIfL/vgUSD5oPDsk=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bf7f52-c4e8-4475-78bf-08d9984be084
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:10.7428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdiTxUaEDXVTpwEAL7dXTUcFZGmT/deZuc0RPY8A7Z6A83YSn5U/EGAGbbYOrPIznGma+4GPgp84vqVoKRoAAg==
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
X-List-Received-Date: Tue, 26 Oct 2021 06:43:21 -0000

The machine or device emulation should be able to force set certain
CPU features because:
1) We can have certain CPU features which are in-general optional
   but implemented by RISC-V CPUs on the machine.
2) We can have devices which require a certain CPU feature. For example,
   AIA IMSIC devices expect AIA CSRs implemented by RISC-V CPUs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 11 +++--------
 target/riscv/cpu.h |  5 +++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8042c4ebcf..69d6b5eb36 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -124,11 +124,6 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
     env->vext_ver = vext_ver;
 }
 
-static void set_feature(CPURISCVState *env, int feature)
-{
-    env->features |= (1ULL << feature);
-}
-
 static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 {
 #ifndef CONFIG_USER_ONLY
@@ -425,18 +420,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (cpu->cfg.mmu) {
-        set_feature(env, RISCV_FEATURE_MMU);
+        riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
 
     if (cpu->cfg.pmp) {
-        set_feature(env, RISCV_FEATURE_PMP);
+        riscv_set_feature(env, RISCV_FEATURE_PMP);
 
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
         if (cpu->cfg.epmp) {
-            set_feature(env, RISCV_FEATURE_EPMP);
+            riscv_set_feature(env, RISCV_FEATURE_EPMP);
         }
     }
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bbf469f079..cc035a8897 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -326,6 +326,11 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
     return env->features & (1ULL << feature);
 }
 
+static inline void riscv_set_feature(CPURISCVState *env, int feature)
+{
+    env->features |= (1ULL << feature);
+}
+
 #include "cpu_user.h"
 
 extern const char * const riscv_int_regnames[];
-- 
2.25.1


