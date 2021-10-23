Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meChJ-00035Q-As
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChF-0002sr-TJ; Sat, 23 Oct 2021 04:48:09 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChB-0007BL-Gn; Sat, 23 Oct 2021 04:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978885; x=1666514885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8hCfvF6U3YpAM0d9MZNIIUkZmdVvqrgow2wJTWop+lo=;
 b=PwVWrhw5bKAoMmcs9aVFxxFniA8TtRFJm65LOLJdbVjaxD10okAEdPAU
 mJhufRFARIasELMdcqJpC++vWKyAJ0iTj8+xlZzz3zNcYcF89FcW1YBFu
 fk+29UgpJSOAmMhe7OLqhN1BBBi7E6r/SnyyafQ/GlkJuXQ8m2j0Qw84d
 W+3gDQ0o1fyxj7B3mXSVMFx2JWOuG0AscWJBEpEf2FPz6eMdupbg10x9K
 3sF+EO+7JG04TU7aMAlQXStpkydjRCVuv74bP4CN8rSAwlsQb7xFE3mNw
 Mr0OjrFlSL6DxPTgPaw/cHYOJjoiP+j6RhTYjTydSK3/OMrGBU9xqCVqD A==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="295398060"
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:48:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFfND3nKKg0crIdRjRAGrKjzvewli3j56w70YdCkwZ1nMdaKSf+ypKyegGjpQINm9A5gKZt+6oLKuc7Y3DbsQavAAfeaVfOTG9QMbwjqdqeEhXSdM8qpiE0G6D/CrGXTQocdX06JjDAu07LLwg10DFPFgei0v85ju8Bs5KMAZA7xvzrSVoQS5B9cAJA7zPIO5q9rJ2cb9Zh2lRYZfnbCLXMYWhJkH1yK5Lv0oszWktgzDUR85WyYOdV+aSWGHOwwSYDCnp7TGJ9jWleAzyeqj92kN+7TruckZj4+AZd1Awke04FZBMBhAGgH9ySJigunlMrc7gaavjIB7nRoFFG7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdW/996re6102wzlutMgaIwMLUHwY2GHwdAMZDfEEK4=;
 b=Zbg7JdfjPqh5x9enb2psA2aojIs5BuunqdCrwLhLd48pNLKXZ4Ca0smHjO0l1Q5RXt1/zYxB9+TpvlUPspZw5w63E1n7tWBQvinwP+wX3u3nwi+GNkBrOZ1WsiSoVAL1Hc+yjAv8TziruuHZJDB6wS3P7vifVxH9UxyeMCLvf+f2NhjfKBS+NokP/cGBchmDEsWEn/XBzkfXNzGg3vvXeicvatJ8Va62ttdnSxg0wb6iAhTMChR56hIvYT8lblik42nY9xrnUQxW5TVNBaHcYDTBCKccLuqIHBNqdGqj84CyBfWaab7fDArGNbkaLYCXROO/p7YsjhLyhqRvZXQ6Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdW/996re6102wzlutMgaIwMLUHwY2GHwdAMZDfEEK4=;
 b=lZQT+IBTJw1rrk32yGd7mYr+RYNwK3eiBn6Q7zs315M6ChUj41X4jB2jL0y5+hUaFOp8GAabKjkUyjWCzDpPYXtD9eBpPXTs2Y7RGUu/mBobUOXs7Uwh7cVHi/2X3clrMlxPOorXup7ugHfZojykfSB1AUVZCXU9CIkdrnYFphA=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8348.namprd04.prod.outlook.com (2603:10b6:303:137::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Sat, 23 Oct
 2021 08:48:02 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:48:01 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 13/22] target/riscv: Implement AIA mtopi, stopi,
 and vstopi CSRs
Date: Sat, 23 Oct 2021 14:16:29 +0530
Message-Id: <20211023084638.1697057-14-anup.patel@wdc.com>
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
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:47:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22208c32-1145-4c49-3802-08d99601d24c
X-MS-TrafficTypeDiagnostic: CO6PR04MB8348:
X-Microsoft-Antispam-PRVS: <CO6PR04MB83482522940CF46E693284088D819@CO6PR04MB8348.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:250;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cQ7mRgckzm8bx0LSxE9k4MhdjNrs1mb/odmXflh4E7Lf9sY6Hj4EBOJ9NOkYNccMJhLt7YBgTz8ly9tNjxvFneFv0LAVQ+CCGLmmKQC57iVxH3nXpk9D4txHfjlwwFV7qNxdkcZeln7EAPx8XpZ2GlnEN9xWw+40TPNA6wy/sFqnrpSvRr4ALPowC+K+01fgAURRs6Ing2VGgUK0iSG0T5mDOUOhmD/b1y11JC96z+SjzYhE/4aVR4WeS+wjwdmSNp0qiyC2sZzEkQgTwOSvnY/HiUIopocD1/U5+sBeru5DztRnz+s2Wb73lH7etrGs3XTwsDXne6qGxhDbGlMnOnc0bPMiPbW0W3la0aWxH6FEx+gJKqmto/KgzBTKOQXb1C/7luOjVMGhFty3n/e/1FX/kQSmRcrdpIfZSUTGaSUZencT5sqXfoxCLwVcC6/1L3sA0QP3jqw0DfkKhCt3AjhLLMLUEaBFpykVFsK8HCG5jKMit5Sz0bYjl3EuAwQqb8KqUMAPTTkZb9tB5BEBVV64FBtjHcifESJvTSrzFDgyUanLhZOhcCTRxqJ4zR5IciCuPmA6lcIopbYhhemLKoXHFfx1ncmZhoRRAuluDnia2G9CSr4DbSUY7DP8WfhWqQ0Jjy/nn0XK7BSFzDhdqLT+w4oVJ3GFNlslY4o3uKxq+Ao3jX+xfSmXki8hkpEtYc0hvXtfIyMA4dn8Ga4ZCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(186003)(55016002)(36756003)(110136005)(2906002)(5660300002)(44832011)(52116002)(316002)(54906003)(508600001)(26005)(7696005)(956004)(2616005)(82960400001)(66556008)(66946007)(8886007)(66476007)(6666004)(1076003)(38350700002)(8676002)(4326008)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N0wi+fB2n9etZBvLS5DO+y53nIUMzVxmy7H7spyqryUkZzL/FNOpJnVdBQcK?=
 =?us-ascii?Q?0SkF45iqpKX8Xu8VIttHReDn5fxQsYErcg11rO9jx/AIsuf7zzcfL1k67y1i?=
 =?us-ascii?Q?ADM0QUoiF70J0iitLGkImtdqQ1K+DvyUo23GgHz9q+loj1TcNzmiyEGIUdJE?=
 =?us-ascii?Q?I/wk8AsWIMqqc8eGhjBr2L8gAagVpr1t7kmTklDLr3gECe2sSeOK9XvlDOtY?=
 =?us-ascii?Q?ef+TZPk7e3kidMw3/qcv9rTubptMF5vi1UXsJVFgMtfm8vvP0Bqm0FlVOu4m?=
 =?us-ascii?Q?QHiK3fyMU0f2NCy1Wr2DueatGhi8PAoC5k2gC/d7QGhjeeZ5u7uojlGIFbmf?=
 =?us-ascii?Q?fMMVraQSN17wU603KrUeh8q6FESHOYxcJtlwIl5W24gjgkWEyqmgxAGYVnY8?=
 =?us-ascii?Q?hozTKSgbJP1ntGvEFkdC4nYeks3HTnAEmf5vk9qdk2N++YAZ2/6Bs1ZWmsgm?=
 =?us-ascii?Q?2pnvrq5+Xnd3c26Og/eOt8MCkJvtzuY4Q67ET8x498MiLAXpCBR+oBXBjAkX?=
 =?us-ascii?Q?iSWEJeFyxpWWzZGzMxf1X6akHqIjXadBuiJAtMaswg230A9NtlZepYCucF8Q?=
 =?us-ascii?Q?pzEawMjdCk631MJxkx3EEDo45G0kaHPzoTxakfeUcl51DDwcNI/aWw0m377P?=
 =?us-ascii?Q?l6ZV+JCeRgs8M0PorY7hFeO3eEhAcwTP58nxgodbK0H/f+QpxyJnbbRP1xfD?=
 =?us-ascii?Q?gxxdqhgUtVzzqySP3jDvRp8cJh1BzXmVmbM9PA9MCEQO0bHewnyhJb9VYyi4?=
 =?us-ascii?Q?9Zwu2RLUKd9FfP8ar5VtwrRLJUC+qBI37RkgavadsqARlM9kGkgPAyhX8ByJ?=
 =?us-ascii?Q?FW/Mlj3Jv22nOrsZWU8wnKCfzz6xaMn1MD21zy/H+ALkARZlXbYuPyijUZKL?=
 =?us-ascii?Q?ibfrhIJmYlQCTyPowESRUGbsFdiKA7fK0SwUMSu1O/lpz8sJH2hHmvecMjKY?=
 =?us-ascii?Q?oX6slpt9cCXbAAp0Kt/V+7/XipAXL0FaVv0O+ZG61TWaJ+B3VcfiRnvZIdB9?=
 =?us-ascii?Q?6xIt/7/DeZ2qLxTN/bQHAWhj9Q3E58mleqsufXAYzBmQu7zBN9zEuDg11vhs?=
 =?us-ascii?Q?bFec647Lo7CVzjTIjbydksbutw26CLUgylPaOb2jAX3kn5klYohNnqDSePqT?=
 =?us-ascii?Q?dep1thHO+oowbN73eEbvZRl2z15HR0H47RL+snmQB5HENn7geJcOo0cieNJ5?=
 =?us-ascii?Q?KCng1v1+BuOoZcn/3r5rdMuwp9WH9cGx8ftLGLtVrp8D6CtGL8nUDd3sN8OO?=
 =?us-ascii?Q?Vhq0tboC8B4HD+4v5EYUiLTCn/0tBtgNO/biGuZU4BRw7zxmWvbq9Wu/6t0u?=
 =?us-ascii?Q?1vHnkXMvgqeh946tC7n7eGH68W2L8i9N7qvXTvnUou352p524QpW8aukRDMQ?=
 =?us-ascii?Q?TFBuVzxN9Cmec2NWtXE+XfXA3ZXBaBn4CHRVwTVnB5kkbTJCxzITIV3C2pMg?=
 =?us-ascii?Q?kWmHPSoM4c+qaStKJ744TcRHu5A6sQ9l7B9+LS8hviLKMX6zjdYTl5f8sQXL?=
 =?us-ascii?Q?Pgy3sSBjE306DSSn9P00QPio2PKEsZpSrMfZQKbWs1mCzjxiOBTsGmqjJt96?=
 =?us-ascii?Q?FkDuyN79jdF6U9rxuY/fsa+YmvYf/uKMpK6Q/dOG3N+0qpgIs32eaKZb8x5l?=
 =?us-ascii?Q?gGlW787fKQ0mxHRPR6kcAcU=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22208c32-1145-4c49-3802-08d99601d24c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:48:01.8702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VluDCTYGM1i6iw+n0v8SewnIgppDqU6nfrzXBrmmFVG/mXJBeJcM2tPdUSWBWvO1Ew4qLRUhVp51+vet6Jx1Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8348
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
X-List-Received-Date: Sat, 23 Oct 2021 08:48:10 -0000

The AIA specification introduces new [m|s|vs]topi CSRs for
reporting pending local IRQ number and associated IRQ priority.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/csr.c | 154 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 43ae444774..69e857d1e5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -189,6 +189,15 @@ static int smode32(CPURISCVState *env, int csrno)
     return smode(env, csrno);
 }
 
+static int aia_smode(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return smode(env, csrno);
+}
+
 static int aia_smode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
@@ -823,6 +832,28 @@ static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
     return ret;
 }
 
+static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq;
+    uint8_t iprio;
+
+    irq = riscv_cpu_mirq_pending(env);
+    if (irq <= 0 || irq > 63) {
+       *val = 0;
+    } else {
+       iprio = env->miprio[irq];
+       if (!iprio) {
+           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_M) {
+               iprio = IPRIO_MMAXIPRIO;
+           }
+       }
+       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+       *val |= iprio;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -1352,6 +1383,120 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq, ret;
+    target_ulong topei;
+    uint64_t vseip, vsgein;
+    uint32_t iid, iprio, hviid, hviprio, gein;
+#define VSTOPI_NUM_SRCS 5
+    uint32_t s, scount = 0, siid[VSTOPI_NUM_SRCS], siprio[VSTOPI_NUM_SRCS];
+
+    gein = get_field(env->hstatus, HSTATUS_VGEIN);
+    hviid = get_field(env->hvictl, HVICTL_IID);
+    hviprio = get_field(env->hvictl, HVICTL_IPRIO);
+
+    if (gein) {
+        vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+        vseip = env->mie & (env->mip | vsgein) & MIP_VSEIP;
+        if (gein <= env->geilen && vseip) {
+            siid[scount] = IRQ_S_EXT;
+            siprio[scount] = IPRIO_MMAXIPRIO + 1;
+            if (env->aia_ireg_rmw_fn[PRV_S]) {
+                /*
+                 * Call machine specific IMSIC register emulation for
+                 * reading TOPEI.
+                 */
+                ret = env->aia_ireg_rmw_fn[PRV_S](
+                        env->aia_ireg_rmw_fn_arg[PRV_S],
+                        AIA_MAKE_IREG(ISELECT_IMSIC_TOPEI, PRV_S, true, gein),
+                        &topei, 0, 0);
+                if (!ret && topei) {
+                    siprio[scount] = topei & IMSIC_TOPEI_IPRIO_MASK;
+                }
+            }
+            scount++;
+        }
+    } else {
+        if (hviid == IRQ_S_EXT && hviprio) {
+            siid[scount] = IRQ_S_EXT;
+            siprio[scount] = hviprio;
+            scount++;
+        }
+    }
+
+    if (env->hvictl & HVICTL_VTI) {
+        if (hviid != IRQ_S_EXT) {
+            siid[scount] = hviid;
+            siprio[scount] = hviprio;
+            scount++;
+        }
+    } else {
+        irq = riscv_cpu_vsirq_pending(env);
+        if (irq != IRQ_S_EXT && 0 < irq && irq <= 63) {
+           siid[scount] = irq;
+           siprio[scount] = env->hviprio[irq];
+           scount++;
+        }
+    }
+
+    iid = 0;
+    iprio = UINT_MAX;
+    for (s = 0; s < scount; s++) {
+        if (siprio[s] < iprio) {
+            iid = siid[s];
+            iprio = siprio[s];
+        }
+    }
+
+    if (iid) {
+        if (env->hvictl & HVICTL_IPRIOM) {
+            if (iprio > IPRIO_MMAXIPRIO) {
+                iprio = IPRIO_MMAXIPRIO;
+            }
+            if (!iprio) {
+                if (riscv_cpu_default_priority(iid) > IPRIO_DEFAULT_S) {
+                    iprio = IPRIO_MMAXIPRIO;
+                }
+            }
+        } else {
+            iprio = 1;
+        }
+    } else {
+        iprio = 0;
+    }
+
+    *val = (iid & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+    *val |= iprio;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_stopi(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int irq;
+    uint8_t iprio;
+
+    if (riscv_cpu_virt_enabled(env)) {
+        return read_vstopi(env, CSR_VSTOPI, val);
+    }
+
+    irq = riscv_cpu_sirq_pending(env);
+    if (irq <= 0 || irq > 63) {
+       *val = 0;
+    } else {
+       iprio = env->siprio[irq];
+       if (!iprio) {
+           if (riscv_cpu_default_priority(irq) > IPRIO_DEFAULT_S) {
+               iprio = IPRIO_MMAXIPRIO;
+           }
+       }
+       *val = (irq & TOPI_IID_MASK) << TOPI_IID_SHIFT;
+       *val |= iprio;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 /* Hypervisor Extensions */
 static RISCVException read_hstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
@@ -2086,6 +2231,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Machine-Level Interrupts (AIA) */
+    [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
+
     /* Virtual Interrupts for Supervisor Level (AIA) */
     [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
     [CSR_MVIP]       = { "mvip",  aia_any, read_zero, write_ignore },
@@ -2113,6 +2261,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
+    /* Supervisor-Level Interrupts (AIA) */
+    [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
+
     /* Supervisor-Level High-Half CSRs (AIA) */
     [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
     [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
@@ -2151,6 +2302,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
     [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
 
+    /* VS-Level Interrupts (H-extension with AIA) */
+    [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
+
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
     [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero, write_ignore },
-- 
2.25.1


