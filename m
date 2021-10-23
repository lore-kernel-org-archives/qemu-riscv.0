Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meChH-0002xl-Dq
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCh2-0002kV-Fc; Sat, 23 Oct 2021 04:47:57 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCgm-0006w2-SV; Sat, 23 Oct 2021 04:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978860; x=1666514860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=F4pbNsiSyjXt/w3RGLt2kpfldLdxI9pJ+NPektJMfPQ=;
 b=hP5TujX8kFtD/vBhTZ4sFN8lsRoSl80S6Lll738kXbtWwObd5eM9yXe0
 Xm73gwvw/K4l054Ij51V1GFQENffuh6ui+6ut3O9pJLwcmHSWEmKrnZJS
 83vYAISlPqoEIgD93uMBJttEb+ceN04P55UtVBzLX+YXyke6b5iKGawPG
 +Kj/5G8688av3K8xqXv5EqMznj6O9uBmw4RCKItiyaGxKLHmDivNZQZy2
 PpQO/Ct6S1SB7Nd9Bvv56nEnbdLdBm9ScJ2szqBkYGK8JE9gTXUajbAoy
 KVR9N2DtrAslAmEjlo4ozWZScFiINJJC+y7f80Q2W1rurODqbQaTPBLCg w==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="295398052"
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:47:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOM7qUFxXt63jYlSVvGvmw1jgubFnHkALyll0etrw2KeCzZe46AXvnWZsfJlnkE+4K84lBrtmh4aBglGW0j3ln8sFKiOxUIEVnas8Aa2gCbEcpdoQHVl9IUznn66zZnxXd4TllpcX7bNDpByr4oAis6zEKAD6N6axNKuMqJ+v88nWX6dXR/hWqqbHfHC8yo6ZqgGEf/iKlhNDxq/12A4yP9pUbE5aVO/ncTK1L14I6PteOK8OAlFjKGqrqBk64hPB2vAEIgKsJkMOiVTSPVMnCY5/k5dULTaceVBViHOZGMwyHal1+UQtE1G9OQwTKXT1myhdDjS1FaBknvi3jlSIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZRw8yn4wv6nwmvRB4TZv4OYoG8c4FtHXTYiLykfc1Q=;
 b=ngT1N/f4VVIYpLpBp47dScmO6D2TnW7P4e5ajIRJqKvj3WeroYX1TzjYZALF1tQXRlum+7sBF7kWVgWDArlSDJfMn5IOW30ywXAKG62QNsExvrDJtHYOYvMUXyr2bJ+H6K++0tnwph0UOSbOVVP4ZmyyYMi5hCFhaFNUyh3B4oQYV7loIk5P94+6LZ9WBOpBywp5Ia3m2edRvNVThuhXQj0fVUW67zoZUgNWzwKjgCDN57+Ki9ZMWCSi46OytnwkoGotnDLc7WZQ7Qs8p6Sv2dfC55gyjXEi5tB790V4/MoMzmvhNuX5Ii20cp9WKQGLe2mUvJv2Px1DR2LhSA7XMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZRw8yn4wv6nwmvRB4TZv4OYoG8c4FtHXTYiLykfc1Q=;
 b=F2l8ZzVPfmB6R79eepI58d6FcpZOBO9nC0ca2iGAZeft27cxxZzACGHHgX42TR1L6NjRRbdfGd3wo0zo5w/zFPD1eFhfMDlTkj5cY3vm1RS4Wfd7ca6FIllwDnEe4YYBKzn5Yz2lgLcqPrA62G3ReAhsnvYosBkZgSUx5bXQ91s=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8345.namprd04.prod.outlook.com (2603:10b6:303:134::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Sat, 23 Oct
 2021 08:47:36 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:47:36 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 05/22] target/riscv: Allow setting CPU feature from
 machine/device emulation
Date: Sat, 23 Oct 2021 14:16:21 +0530
Message-Id: <20211023084638.1697057-6-anup.patel@wdc.com>
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
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:47:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1effa527-7888-4904-54d4-08d99601c35b
X-MS-TrafficTypeDiagnostic: CO6PR04MB8345:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8345AE14AD66315949C3A3988D819@CO6PR04MB8345.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E1rf21hXA6bptpuaIjWMs7fbnXsrw2dC+Scr68/0XgsIAxYFLggXXfDEBX1dTW9DrtnMRzBfKwrxyaNbdSbZQ29PiKh5x3zXxrhgMmCXvxTiWGulAlc37oiqIe34gNzWikoCUDz6CMLoP50sh71LhJFGnr1XjZ+LTDYH8BW6s3X3JtJ96z/we9fwOJQSuow16xjkoEwl8hQjIXHIiMEDN1sNtuMDP0aSJ8ZDDzHm1PkoxVgD7Xd3q19vRPfXkG7cYz6hYC48DUwsE6TZfPX00g2Al1rEN0I1rfvId7swK6QELxAIK+k7BsXwCiLq0sHC+9DmLkTQwcOhi4YWV7p6FWpHYU2EEhsfaf4X6tFH1ZHNv26ZQs+cTVtZBV6tXgAUXxNNY7uOPHdYpUtNswYdTMCOWC6ufXK8/zkjT4MHc42JRNp9SV5T+ik0Qg36dA7fVJkkGdILnKs9s634/QGLdQP52vxpiveT+qBGFNtEXATWLHd6ycBru06a8cecc6SpHWRpUOGif2vqJFpC9YczfDSyX2gpFzvxeo+LEyU5KwzDILS4rC+XzS/eV67q5DQfzaMEOriyxEcGWmkQLtdYFyM9I8HpXJigaQDieVnNh2oHQRNEjAfUQXDPY6x2WkWHjkR/mDfFE1M8VR+2MOv57w3wTTukZBRtqwEOS+uvnAvtXxg+73UXVIwbsyFUbKaYevEaM/YHAtyGjG9xWm59hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(2906002)(1076003)(55016002)(52116002)(316002)(6666004)(2616005)(4326008)(38350700002)(5660300002)(38100700002)(83380400001)(956004)(82960400001)(508600001)(110136005)(26005)(54906003)(66946007)(44832011)(86362001)(8936002)(66556008)(66476007)(36756003)(186003)(8676002)(8886007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ulDt/3pIA8dXGv7pf+UjWlMSv3/tVVz5UbwkibSU2pr5td2q6JTbj3rq+pH?=
 =?us-ascii?Q?RD3DWOEZdnp/7y14ztYJNAsgl5FRA9wrmodkyWHmmL/tkeDcMfoJpBFA8QKm?=
 =?us-ascii?Q?D+50PQXc3Tra7DlE0OUaP8ddvFt++0E2Bp5Q8CfE8/QM3Yv6/Vzwu0TL6Wn9?=
 =?us-ascii?Q?oEK46U3kjiTFE/v6/Wh5YR3/xpl7XV0Bs8Svbnw1acbyoPIOZ/0tlQExAByd?=
 =?us-ascii?Q?rcly7QTgUtdaqVpRM6y1tgt5Ul/Ov17XEFnslFMZbam7axTiurwm+tVHd9Q2?=
 =?us-ascii?Q?LCFo6YJZ4acbWv1hEY3H5tiYL1Bld79aEAAwJBfdgeZMtuAbwuPY8q0dtR+5?=
 =?us-ascii?Q?8U1qzrgwl2VXwXiW8fLK8vn4EiANzQv7LsgDwbK6jnzuFdy7NsQg9SQ6mVPU?=
 =?us-ascii?Q?pZ2ISKL43oskbqm7sc1zbuLC67nDf0sN0hBUBdHKFNAN5tnOls+JiZsPkAvd?=
 =?us-ascii?Q?RqagBNhczC55y9xSG85ndHpFbqX0knfKHqwcmAMv30tJoEU8WVJs05ZO/2js?=
 =?us-ascii?Q?1GWV7J3++Hkz5NfSjbGFkt7qLIkddsgIA+eua4/o/rjWK05jJePwIVNEjVWb?=
 =?us-ascii?Q?TXjcirdbFZB9dG4eHoGnERt4amcQ8ErbIoI7dtwJR/4/NGN6oGE8pNQEnIAG?=
 =?us-ascii?Q?Q7j/ycgZFiyJ8FAyPVmEDOK43tXQvBUx1AhuYqj+wEsaDMPpvoltysw79X6b?=
 =?us-ascii?Q?IgWUXjFb2r5YD7Cl7Wv2DpyRNCt6JZb8P3yoyslePPJU7iL95nK/FccnMpUD?=
 =?us-ascii?Q?3KgbZt0TdnqAbN8LM0yWmTtikDjcJNUU3WCC0QVaEgtx1GlT4cVHHuG1jB4/?=
 =?us-ascii?Q?E9s59vUXZUC6eIOYzULOoajanrUgiC5E/3aJCadaP3EKqGkLpUCWXGORFmlc?=
 =?us-ascii?Q?wqLYgvG/hrfYSeIyCjvIAhsQk+3SttdqjfbfNUvhGn+Z0axG9uYLT6s3VjZr?=
 =?us-ascii?Q?kVloQb+92m+5VsbM2KGRZZSh1Xua5XAJfu+1OCBdV/vL5QaCoCaj9pIZTbBa?=
 =?us-ascii?Q?bckyt0LPV3rsCquc1uz+dPc9/V0HXBbB4LotCl9/a6aCLxABO4sZZxoFdByM?=
 =?us-ascii?Q?dCuwpe3zd3wUf7Inhi7RD9RCs87Srq2p8+calM94oQn76psdkfkazNFgkmP1?=
 =?us-ascii?Q?3rJDHN3OD4IqNGf8tg+jIRVJbqHHv7+DKR5rUV1ki6welbG9PoV6oDtxWeMp?=
 =?us-ascii?Q?SMWbJLFOr//Y1W0gqqO/kPiKjhzGC9F5nMTYOyI+1H9ZqCZTuAQrsAywORv9?=
 =?us-ascii?Q?gz5+MwjjxjSZvmieRvp6C43hC9Gy2j7Saoex/f4DWrEK0tzBSHPPX+JRf8T8?=
 =?us-ascii?Q?NAF9+cC0jJDmAwiFj66qekeEZyuEX4a7zrjMhypmUgwngIE8gk0yH58J0TMZ?=
 =?us-ascii?Q?NQ2Pl2n8412zTPSqzvywEg0gM+IEyUoBivx/wNzIgjpkC2OD4ePiw8O8i2SJ?=
 =?us-ascii?Q?kMgHI8Bi3EbMSL8FeuPFGvAlcl/k0dcnwZvLca/VoXE5lVrNDYQF8tMBNmmJ?=
 =?us-ascii?Q?/7WLH2EvbdTCf/NHIX8PeBp+mjYBTTtgF+c/wnFOMP1sFyvq5N+TKJFPjYWY?=
 =?us-ascii?Q?DIOP9PnxP+oUQe27XVlIpq6VH9KUWOkn7lkmTCuy/esF3Gx9Y54xEOOFqNiA?=
 =?us-ascii?Q?JCw4XxIVHz6C4ueLylx5lM8=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1effa527-7888-4904-54d4-08d99601c35b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:47:36.7706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eU21bYxSx8qNTUjhXAt89d8wAk4aSk9UQQwFmBVhdNFO6gTJLePoG0ChCrLn+ogB+10phE6Vu6GZlS9SgAkN+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8345
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=92346df24=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 23 Oct 2021 08:47:57 -0000

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


