Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtru-0004PJ-S7
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtrt-0004Kr-RO; Fri, 10 Dec 2021 23:20:17 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:50855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtrr-0001ba-Nc; Fri, 10 Dec 2021 23:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196415; x=1670732415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+Gme475WWzmGn+2DmsNWn2ANgiNS9dTlc3rx/RHkgpc=;
 b=BbnoGm9iMAv3tcEUTZ2kovKnv7kIotpqmLKNQ+Rmz9atB+yB/RgS13w3
 8aYkX6HwkN3Li0jrHZfEHoCEYr9+7y+s+Y13Dt3xkKOjkTjKQbNwaVOh0
 TcYnB/8BoyFHyIOzKsD26XSpvjC3yYc2qit5Pf6G2LjdmQZRFUnJfHNRT
 ZhJEieGSL5eGmTxrdYnmsa5msXtCTapHjQA352gnoWl09r2LRWMU27kol
 NBm426nCi8GyUe53TMn/xP9nYiA0ao9aVLVQDiwcGAW9KugyPmy9ZQ3Zz
 3OzUS4Cql1Jk7NLIo4hhdVb58PbEY7HlKnw3hJU9npIaDWeIA8sWp51ex w==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="186970392"
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KG/buJRRVXLuHJF+nLFlQ+HV9JAGCAbxPQn2eqYXH6ZURFCGIZ13Cx+k+Rh/L72OM3N7/PJ7udykrg7inRY87qTnNzdY6js5QQYJn9JfMfW8pY6T6Eo9RsK7el19YijPeJfV7pyBZVs/KTHlgm0rurz0M1/1JlrI5M5XL32GUD1oqWCx69KmuTSmU42H5H4E9TUE+P+mIX1aAkWT81xxxSjgjKTScxN8NavBMlxojIduhb8NllTSiY9abw7UKCou9NX+71hTBJKoKajPZNiPWVHPGhxvG18I29N8ztvpCx0sNsM5b76ASv7kuHyn/hcbNKzlDT2EjxDjqKwrTaDYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmwzTLjkxC2PPKa/IurSF71wvNLaUY7qJTcenD20fe0=;
 b=KnDQOKrAMhfcbupoex4U38SI3Rj3EVLyGe1Hnmq08p7Ny6xemFk0r/+gbd3tmWKaBV3y3xpZxTGXuJVodtlxx4/BYmbI02ixUEdaBo6RIje3XdnIgZWoeVe7ud5FtUX1spvwWXEANks4OzvSY0iiCijalwhgZPj8WumV86YHrhurmltrZVl3dVE2jmj3yLZLQ5QDjkytsSA2I7sg55gZlPup+lRox0vmlIfoO2esCulgpzbCu5lwcc5uD6AP6J1wpiyfdhvY0nIW3b/jWDpxbKN455Rpg6con6FWOlUKtdZrTBOCt+J/8/WO4ZGU8/2MJ7tdgksFwoyidzcPqMvgIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmwzTLjkxC2PPKa/IurSF71wvNLaUY7qJTcenD20fe0=;
 b=PxIhNvi22JwCFyqd5utrX+4yLHCl+9fN7BIvoCCIpBPYkuxWR2NonKpF3ofBFvKrMijhXwPFqx2YT09D03Csi+Y1L1x9pKAffgjgn+1yvaV/NxdLhzhWUKkavhfRVGQ4at9kiFA/BBoG6MVmnQ96TrTFOlNIeH4bKQ9ayvQI4AE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8265.namprd04.prod.outlook.com (2603:10b6:303:150::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Sat, 11 Dec
 2021 04:20:11 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:11 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 05/23] target/riscv: Allow setting CPU feature from
 machine/device emulation
Date: Sat, 11 Dec 2021 09:48:59 +0530
Message-Id: <20211211041917.135345-6-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: 06f85a11-f0e7-4e2b-2892-08d9bc5d85cb
X-MS-TrafficTypeDiagnostic: CO1PR04MB8265:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB8265E9012D530D9DB73C2C508D729@CO1PR04MB8265.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xZYW6P7A4veTmsxFeeBslkqDEorLH2iJBwIUMiPbL3T5QvFAPsFTzO6jLYTLTO+qn1uQH54vQgxPFsVbXC+k0ez6Rl5H7EeU4C54nIZ9A8iPqJL/xTJjZEoNJ7hrS+IKeFVF1UnNsAsm6K6bJypSIM9aTTjFgw9XTySY5FzD7w+738ulLvLQJ9+rkNKUcCNkfvC2szbiIiA86nvQ6quLDgmsJgGSAPd7GsY8GESlYoK/Qi9sZmN6z+amE2D4Wi8EKKQqyZy85QfALy6xAPr3DhqUe/BQ/b5RPGqFex35qAAQABz+PyR6dJMH0AMUDFgYOGjSOu5Yx5iIecH/racTyodKRFD2+A/CqJM8Eh76HvCIH8mm2OUXp3N2TclqplJINPG31SB9jHmNn6uOvgKStvRkxA6r4q+FCP1Cmhhi/knJW1oOjEv0lHitYYb3/Xpdl1g865y3akjFQgX9v3nKBp9V/HLzGbK2D6xMGdCQIs+KWBKTiPyA2zbkOxS3/5BiOqfL4F699He1y511P7dZgX8WfjdmNOqcieKsFBF8+NvCoxLtLKpZBPfKJRGPTjSnVOIAEq04w+ms6lidviNFm5PDV3fGVH7L/qf+IXwhTzqIhXUy/Vg5zXYYBvPFKoMuubmsGhUHeu7FIol3FiW+NJkT6dbtoxKmOGWo9y0XZzPNn+CPlkzbdXzH0PIUZ0b9akXcB86E0Fajx9tzOdqsbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(508600001)(110136005)(316002)(82960400001)(83380400001)(6506007)(2616005)(86362001)(36756003)(186003)(52116002)(2906002)(4326008)(26005)(5660300002)(66946007)(6666004)(6512007)(66476007)(44832011)(6486002)(66556008)(8936002)(8676002)(38350700002)(38100700002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5G7+5wDiDLzGrkz93B9pLk3hdE2P+pqJTRMyW7l6ZCbZD7fjLmjGJuA3mhm3?=
 =?us-ascii?Q?koL1E0e5GGl5agC0FEkVXgAVfKyEN07bTgpQOcO9tzs5R8bcit0Qr+I0nXKk?=
 =?us-ascii?Q?Wcmkf0tHdR/ia4ZHVCyoLbkdWqwhcD0CkCGMBitoll1APoqr+1R12Px3u/kV?=
 =?us-ascii?Q?pIq/i0LbBG8DSUagkFCpOG+AWpkjUZSuiditGKqiXX1CCWlnnVnFgyte5K+k?=
 =?us-ascii?Q?La3iOIgiJINzgZ/EObAGm/ScWygQ/arYKJGRW3RbpC6YJ/HkDOz8vhe2w05n?=
 =?us-ascii?Q?HH8C7fHG9YVovH1P2Nj0ssHncO6rz5xwek2x+hZkpibu4FX6H4KldHqd6A1K?=
 =?us-ascii?Q?6gADjDZC92rhvMBPAKNY/nzSGsdVsHK4FyoCSbdZfKc9ue6Mjaztg7raV+Yd?=
 =?us-ascii?Q?0SjSMdt1SHCgbkS7d0Z05T6V+vWhDrPx9GeafbhtGN5c4N/idh57VyBREcom?=
 =?us-ascii?Q?nLKi9WItZWo1B0Yrpa2RAFxjm1An3+W721BaNEs0SADaoPgO35DVorzrjofs?=
 =?us-ascii?Q?wi7A0vaBuViydbhFUGZDKqnxAr+qLHy2KA65pOLfsqkA8WdOehtNm881S3nA?=
 =?us-ascii?Q?b3Pdo4suoi/6mIj4P28KbEMKcxmHj1qNu7TEJsqLQiicd74wwn0YmUIoq7ed?=
 =?us-ascii?Q?sYgg9Lt8X2kofXhdPJefit1k+GfiOpyXC5dVBmUImF2QZQB5IAqWahdQrhf8?=
 =?us-ascii?Q?ykFgQm5HdRZXrE2+ho37hF+f8dFMuqiz5ANchhclIusCb3nEmVVgVLuJpBjk?=
 =?us-ascii?Q?mtpnO2QkmcXJVSl1SS4oe48Btihtvu1mZst6ifSQi5gsU5Ue8L1eEDkkdd8b?=
 =?us-ascii?Q?Y8+7S1WZ/SHAioPvwWzry5OoIrhiglSVP4Sz09vKlDoYpyjDt4eWGbRKe69L?=
 =?us-ascii?Q?RPRdYn6Lx5Hm62n6VtY1L2tPx6p1ttwGyPi6Erb7qoEcb749ygoDn+NfOZ0O?=
 =?us-ascii?Q?pYDuHoKt/qAyJBUHyc/nkCApQC9lRpGhArDrhJ8dTkZ2noGzmzBLctigHsVY?=
 =?us-ascii?Q?JukwrOF2dmCVg7n4geGx4+J0MUCBJQSId+qbhtLoAI+anKmxYSwWR12fdL9y?=
 =?us-ascii?Q?+1crjrY4kKaRxWWYQzGiN7FNXRFCCFh9+4RwxBqWN7yVpzn8yAHBQXn42gua?=
 =?us-ascii?Q?MUqIvQb6IhClM7+Yb8A7DPrSwTfua89oElk+cSSYxeSyIZ7kXchP1sbKMVrs?=
 =?us-ascii?Q?k3cUbjAdmqgI9Ryjo2MhWUE/DrZNQO2X61S12LATZR7XEY1k8Q2nqHn3IDA4?=
 =?us-ascii?Q?tAF+KOH4XbvA3IwBpo0DbwUt9x/7er0u/U5moFd05e6AIcdnb3eNy3PRA2RR?=
 =?us-ascii?Q?J1pQmR0MDVj0EtxzjHhYdf68e3x3qaS2++LY4BpiLtfdT4HYq/xcx9pX9AYE?=
 =?us-ascii?Q?BUfp38wNB6yM9PheAQwVTz2ULKZzX/osNUHZUyyjKb6TZK4oDODAuYP7R0D1?=
 =?us-ascii?Q?esq2tSHjo7ljDAV/haiEbqj4MMRyAwlzf+PS2FaICRTZdQmOgc9LU1PdPc7K?=
 =?us-ascii?Q?bIufpiHK3XmZSKef1JlTyaXzrJeiCJYnn4nrJRFIRslVHZ27igPK5t/q+oo4?=
 =?us-ascii?Q?eF6cL85nLo51AFUkH+T3L2YClwbxayzt0wYdslfssMES4T006hX+opFeZBox?=
 =?us-ascii?Q?eZyum0GB5Scx7RcRGVQZ8X4=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f85a11-f0e7-4e2b-2892-08d9bc5d85cb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:11.5424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwGE4pdpUoFG46jIdJ8kTPyu3ksfKKZKeOZ5KNtBRuRQPI6UpZtNzLlLqVZ2gL0skIsMqC0zgduriof1/iaL5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8265
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:18 -0000

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
index da58a9654f..827cff0d2b 100644
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
@@ -434,18 +429,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
index 92a276f109..48637342ed 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -339,6 +339,11 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
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


