Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrY-0001Gw-N6
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrB-00011Z-A8; Thu, 02 Sep 2021 07:26:09 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:26462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkr8-0002qq-L8; Thu, 02 Sep 2021 07:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581966; x=1662117966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=shUCg4c5i8MVEajQCQxcaOHA1GKwDvbzvx5dUE4em1o=;
 b=aaIzBt5B3OHe60k2i9jo5KfJL4GdX3Lrq0Ib2VVKYDt9QUKc9rOOxFR6
 j/4NLsLJdpA+VnfhKB41MxkDHlUHGkEV4nZKGlav14uagp2Q/l3tZcjbn
 oU2qVXgYBhl5Tfi79UUA07yRCTlH970O6X3Nb2HyFDL/qt/E6AmibWD8o
 dDn2HHDkD3Hnks2fs5ytPB/cYuBrmJSV1IDX83Jk8EyBoY7UNTMXBSwXT
 wRswwDQqNMFhjM7jQvioXcOGFArmuGTTiAkp8mTIRm7EMy89tdfvC+AQ+
 EXMege2DzY5fPc9If5cp9CrFMSPu4ZjT2ww/XfGdq1dBIFgpDP8bIpuBt Q==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="290644568"
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmxY7gCYaM9tkBFuH/1k6Si19IOQB2T+NTJEaagulbtcBCjXUQq/KCXgOA52wttfTYhLk7Q7e4UqTv+Kpfr2k98I1OF2XI0aiORTpkyzZb6cwy9s0ASXowyzJ9VlAPzVAJ6sZKVJboTkZ6chJAEUuveV3dGg3xy2veqARo4PFgmHkAddXT523E0vhqyUogdDmpkjSwfbPv9NAD/aYSWeyNV23ISqC5/Az2oavysB6WW74iby+Yy7fRxf7rz6BtU5ZCiDx6s7uaei3Ulij8YN6aZF+8H+x2v59V51QHqyx2EICfBwI3iOG8z0u7jkr2PRZ1Ab2HTge6aBMec4fhnACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=7OpZ3IBsu9JKyqGBP/xiICgWd4Qwa2r14sZCn5O3Xq0=;
 b=WM6koI7RMoePAjv1XDdmQOQmVhBDZbROu1qvPL7yCnhQzUV231bGaLv2OoHGxoOWWBHtHov5sSq6jWSzBM0g4dhmFT7ZCS3ppyeiVHnjedWowYb6/F7v4zGWaLniHgH46PohfvjAc9OJs3fPkPIj09COF1ru+W9Q0eZc3NaIl28Shwi+/nEeFfxIVZGPEDpZlRd/SdGlYwvvzlCM0/wXRFlRy3OdMmKAe9fjVDBQTcwEo+1y/LXxh26j+1bxD/sY2UzKUdlci42/kMf5g6f2xiP8HyDtCJmega2RzNOjgaSFachDkECHUaNogob0+ngFxxluF6Z6/aKeMJOw+fL4zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OpZ3IBsu9JKyqGBP/xiICgWd4Qwa2r14sZCn5O3Xq0=;
 b=0QS3memN6iF+cb1CqxO1O95PiLGtRTti1G7KKfOCULdRsngCuUqxaBlrZPGWekdxnlVngybfAz/GGxHJSyaNDeGv/nalIfPlTHJnlPpAwMCMs2gsrQPRmseO1vu2F4LVi4gBX1yGfbKb+8bnAUwhyyeiiaJlEyZ3hWNJdRPRjBc=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7796.namprd04.prod.outlook.com (2603:10b6:303:13b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:26:03 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:03 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 05/22] target/riscv: Allow setting CPU feature from
 machine/device emulation
Date: Thu,  2 Sep 2021 16:55:03 +0530
Message-Id: <20210902112520.475901-6-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:25:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6f5d16f-c353-4e68-aca2-08d96e047247
X-MS-TrafficTypeDiagnostic: CO6PR04MB7796:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB77965FDD0716AA4E38AF71F78DCE9@CO6PR04MB7796.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MKsfOG7tDaHHILsB6dODyLLiajeyCtcv33lu9ZmSbMYxo5tU46egd3y41JE8dBCpwe7h3xpfsSIXiVh9d28zDdunuHW+wRZmjEyIWTZE/5vZCj41nut5khkaUIQ8WgBv/3zXrp6KsyncCWnO3CNDgb3RFkc4UCw0V1ra9nQlnubAFqByI6XUbg3sqaGGT5uxKXVxd+NPQIlOzE17vPGdxkMRPowM/XjN6kgy3MwQmcNLJHXbJqKhF6f0N8OiIr8aQToO3lEUUF0zvnE0DYH6dKVY2lcIn14ePprz8BtBYPXxAP0gaTDZPjEHGwua9G7QUNXPbzVyNjuQZ5lvtzScRqacxsyL78+iEEH3htKJNHg1cu3ClM4KQJZuFnaGqBTFdHhUlyu/wwk47B2bXhrVh0NiEpVmqIJEraS/paeYSs2gUn1WPg6gZ8CVO/29q981/F5+bf9iKuGvq0Um3isVBXgkmbwyDiV8Ne4UiC0zkSml1QuoxQsgqYnKXxZXOm/9aogYgd7uG9Rq62RCgasvn4v/dGLy69BCtUgWRYPAo40bM2LxEsdr7e/9ESrf7s4EAkxa+Eac9LwBBfi3YGjb0ovE2tdiWmLGbSgg7MDVTmTBCmRbLuYXWsFQctcGg6DVBs00V9dJJhHIxaeOsEKETlePASwfQng9RPqW3cZQryhDY+qFIE5FousGWUeTXdmjXQnWx9jq77pZ4GRL+SwhSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(110136005)(55016002)(66946007)(956004)(38350700002)(26005)(36756003)(66556008)(86362001)(54906003)(2906002)(66476007)(44832011)(38100700002)(52116002)(8936002)(8676002)(1076003)(8886007)(186003)(6666004)(508600001)(7696005)(4326008)(83380400001)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L2qCrIn8okjRl3KQAsa+xDM4CJN9zmY4VowgDfHQFEiWMLzBuPFTSJbOH3z6?=
 =?us-ascii?Q?pxcvwK0ciseMFI1GdDucf0FMsBnQ9nYW+fJb936kA9UMT3vlv6uzlg/jPC/g?=
 =?us-ascii?Q?b3SfSNlS7nF0Bm4LT/lSk2hxVDnmdZCr3DwG9TVKFjTwV1m19Xu+yHfWC/bj?=
 =?us-ascii?Q?SybmQvCkjf+BMqMwEtRWw2I3xuvCu0/Tk5vRx73ceIutnt5NS9JDOq2ftBJ5?=
 =?us-ascii?Q?T2xirRoGsYur0GqQnC0TRRJHJxijNSOm+VUCLUDIMbBJAFtlwjVf4MEm9p8C?=
 =?us-ascii?Q?lyy8Cf+DJcQfnEi/H3Mm0IApx65F7o6r0NvfTKPxkosVWxdYKGpMNaj4tg0G?=
 =?us-ascii?Q?o94TilYK+KdCeSAumRryUMkZ1clFGXY+5VdhxNGNGWn5z+ou1kyYvmvqvQ02?=
 =?us-ascii?Q?pMdOGqNuUhhyvZCkryn972PEio6MSKKnyb4KdM6VdjN/qsFG4G6KO/CP+hdf?=
 =?us-ascii?Q?kNhcoTmg1d4QxyUKnipEP1CaWJcD40Ay+eB2LyTpHFsdr81NmjMfIP8AXZFJ?=
 =?us-ascii?Q?HTXjrtE/Dy85BwKTY2lRm7LENO5DoxVW8X2u6f/X1z080/nf7W/biSKrKIhQ?=
 =?us-ascii?Q?u9O9IdnMJrPOPgQZjDCqH54ekvM/LWQanxKBC9O2nQlMKw8+sPNpZ1Yl5Bnb?=
 =?us-ascii?Q?U/mCNJHTJbB95w9OtsPxjvVgAcmc1YqW2BBykQ9omdk9s8JdNPq9bBdDWYM+?=
 =?us-ascii?Q?m4pSqqFlNnls+iqkjn3vvwb85GTSMQFxCbijEoaeiaBPGlFHtQnyRk0xenyc?=
 =?us-ascii?Q?24S76ezP7mcOMND+QX154EiTNhCCcHiydDnt56Sx9VW3LvZlH1/OAYN41O2q?=
 =?us-ascii?Q?sm+QsAHec+H5Ar5CDN7OKa2yH0xkcNM5XQez/SOUxUgIA0V9F77EujxaZf6T?=
 =?us-ascii?Q?PHZvAB6gzYjdjTOvwxyewLWHZE0Ib4fbOWpeFE5kqRwzFr73Yz59Q16aRnZc?=
 =?us-ascii?Q?YMuyk04EWqApKo/O4ED0bZ9/VP3JdIXUNDNbccwPIFK/HKU2NtCUjhEA77ys?=
 =?us-ascii?Q?Fxi/ErYzM1FqwqiV9MGdMpzjJ4JZD7HRHxiPZjby8jPeGNi7WQ3rRqx42IqU?=
 =?us-ascii?Q?wD28+8IEWJCM6dKkEGE+cU7IA54js0Do9vB8ywFPLzLIDZ/JRZQhbnvv8UG8?=
 =?us-ascii?Q?xILtWwjo2ORsuVwrRmcCl1+DAKkOZKI3X/o6xVkQoFA1LumpZigFxBZzJfqm?=
 =?us-ascii?Q?+Z39uu0RqvFCKJF3w7oYR8eXp6O0vHcVsn9be7Dlcp+sX8053mPfJP2J1vNY?=
 =?us-ascii?Q?YGUlJ/ox0ChpEgg4rgPRzd08c/6robDddJnhs3z6VVmzk3iH4aDJuKn8kqfs?=
 =?us-ascii?Q?PEMmQmw6V7vFWCqV6UZGB5F+?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f5d16f-c353-4e68-aca2-08d96e047247
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:03.0420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecKXAfmXnSRnlbHJ0oAs6bRy3gmmt2+yB3DGDg8iPzWh+fu85AD6sXOJ19ZjbJ6HRtQoAnE+3eYCWITZn6cYWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7796
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=872ab4b15=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Thu, 02 Sep 2021 11:26:09 -0000

The machine or device emulation should be able to force set certain
CPU features because:
1) We can have certain CPU features which are in-general optional
   but implemented by RISC-V CPUs on machine.
2) We can have devices which require certain CPU feature. For example,
   AIA IMSIC devices expects AIA CSRs implemented by RISC-V CPUs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.c | 11 +++--------
 target/riscv/cpu.h |  5 +++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0ade6ad144..9dc9d04923 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -137,11 +137,6 @@ static void set_vext_version(CPURISCVState *env, int vext_ver)
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
@@ -423,18 +418,18 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
index 59b36f758f..6fe1cc67e5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -323,6 +323,11 @@ static inline bool riscv_feature(CPURISCVState *env, int feature)
     return env->features & (1ULL << feature);
 }
 
+static inline void riscv_set_feature(CPURISCVState *env, int feature)
+{
+    env->features |= (1ULL << feature);
+}
+
 #include "cpu_user.h"
 #include "cpu_bits.h"
 
-- 
2.25.1


