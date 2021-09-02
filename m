Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrg-0001aE-C1
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrd-0001Ts-PH; Thu, 02 Sep 2021 07:26:37 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:26521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrb-0002xP-Ix; Thu, 02 Sep 2021 07:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581995; x=1662117995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rEtWhUuQL3W3xHfAja15+qr55bYWwP1sYghfBTKdJaQ=;
 b=RtoT1jBIy9g2vxRTxa5vPIu3/f4tx1PHizq+bAPHwHwCKmih1eoxwqMY
 CEcc/hNbdQWUIDQMT7pyBoMXtA/zcAW8lsT7r0WjZYwC2u9S9SAEQl5GX
 2XI0EwcOc+RuEuJ470wHk/pteddrmxII5UvdDGGXmep/YTn6QeFuQjzEK
 dNGQlr9Qu0wm1lIMG3IhEn5wmXBLJHtZbINtdS4QCDAdaXycPes4mcODl
 VIyMkS/XiUtMW06KN/xiXt4YQPQSWi2GvYcR+mbGSuNOP9tH3tQYV6q4O
 sE1tvEG1mRFs8r3vhakm+eD3gG2S6wCeEg1329FvD0Pqjr6IZWLEvVU9F w==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="290644621"
Received: from mail-bn8nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.177])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFjweO0kE7Zuxeb8FJwlj7sFm1naKUE5W18d1mfSk8ofLaXx7NMpMtbWMvOJ+Ku04mPs0OomJAg4JyWP82blhNI1u1bnMSrlthhksx5Yt/aO6Am7/zhgo8rW3EPXpIfw5B4YXF/v+3LO9rlqHmGdZR2tq/2/ZQ4kkWoWk7psQLB0s+xqHf+K7m0mtdpNsCctekVlZIo2Xc0lRCk4ylAc8AOFdUgkPluTUWH4MD/o7pVYiFbQ8pNEDaEKByhGU3Kjc3bY6GhHJFbHvSzFpXubfJxMmQXkG+f3DlnYAMMypGwbryjDihiJB9NmfvNwYjuLqeyPkLqhNtHpPYDv1zS2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=qi+8XXc7aJmHuQcpMu0pPd0tYhdaAe26MMvy6sVnZac=;
 b=e8/IhkcpKzuvs8R1XZ6uhgbAW9yZP975y8Xu/Tt/Ik2xBjFW+K+qaJRBkS9nmn02C/LYNGatqgudvP3UknJVQk0H9JW5WUdyFdi+BWZ8c0J+XL+yPj86ERb8aJn1f9YY0M6KA1uEC/iLgEM7uTv5e9F9oR7TStJsrGwrl5OjDqPwPgyfWVFqYk24yPDSFNPwDPjVEm13XXHmEEMDLFAgOCdqwcpv1OENGgWHDrlj4FrHbvGNRZAB6sYzwVQ6ucyzFpiOMc9D5/HhZEkVApk2YhauAmh47SEAJNMLR7xZOmC8OsiuPwbeV7bmBICsKCtvcUEq50oNlPpS4Bzdb0Smdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qi+8XXc7aJmHuQcpMu0pPd0tYhdaAe26MMvy6sVnZac=;
 b=P0QLM9LeAXai3wrG+Ktio+FwhfvTdxJMe+r3huLGLzi98p9Qf+qYaIh7auFNoUVNd1GgbBPdXgAY4lYmCfO7/+L69ZE2mdNJIMJZlM+FuElX+nZG0JurHvsIFihzZzAIm5tS937TqH4MQEPMnYSGN/Sy2Y6SxV7WM0DP+ex+STc=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7841.namprd04.prod.outlook.com (2603:10b6:5:358::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:26:30 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:30 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 13/22] target/riscv: Implement AIA mtopi, stopi,
 and vstopi CSRs
Date: Thu,  2 Sep 2021 16:55:11 +0530
Message-Id: <20210902112520.475901-14-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0f94b17-67ee-4914-b658-08d96e0482f0
X-MS-TrafficTypeDiagnostic: CO6PR04MB7841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB78417198600BCCB893710A658DCE9@CO6PR04MB7841.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:250;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UisN0tB30g+kWxSprd+1lMBh0pvqHeE8ORydpnY9ihpZJDYEYjf1QJoLyG9GnzRo7aoIObvnZJnAJnlAc/dJg+LByd7bCjGIECfbElOv5relM988nVgGQu7yBoi1Bsoc0/fazDxFOG54/Lyb8hKtIyQ29A8212Rc05VtwJkgbJe0bA2sGrwXXBxl9qH+9rmt7jFHxun2ZnNVyWvzMNjSDoMI3F5ZHj8Ij+KR258uqz76c5+Xc7YZwwpBAKBbRhTPBEGgVg9JeE+OMILYyyKdfY3A5BYkb+glf3SAw9rYxNHEMJXCWaFuEBF3PPId0IQGKEwHMitcSne+KXMAzHDd7g2bWy0XcXNJ1r2p2OliQC13HiEnruYe1n2rwy0OR/WOhwMa48FONROXMslYj+EWI/s4EmL61rYnM5OHwOqoI59VKeADTEXXeVlouJGWdH78XBQ3k5MS18uAj213ZwR4HlqHvNjrssqfjq00xBt/26gyfP9heScyKVINsg+UZiE8mgjKD/Y5D0n2/AUak/LB8OCizwt8tXbvKxH6tESczGYBXAT6y+GSzDqgzj9dmDHmgMihK8lkB7UPEJhHM4ejC7LcLF5hV/+mvrXmCRT5iUs0N1CLPewoT8sSYydqF3KOEL9xgo2iGxmmW2BiBRkhxmx1K14JXwL2WXf//aHf1a7wdo/BSITwoo69NjKWzkiwgfwab4C7IS3qO4XbPli59g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(38100700002)(52116002)(110136005)(44832011)(4326008)(38350700002)(8936002)(8676002)(2616005)(6666004)(66946007)(5660300002)(36756003)(54906003)(316002)(66556008)(8886007)(66476007)(1076003)(2906002)(7696005)(55016002)(478600001)(26005)(186003)(956004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3I8vbKfJ+IhsqMkAZOHQkQPM9mH+CKlAlwMaHf1U+Yd2PXCjtBv5OWNT+fxC?=
 =?us-ascii?Q?/Nrhdyii/yczLuSLlt6du3DAAG9TLzdSvtCx1g4cOvWk/nReL8cSWYApeww0?=
 =?us-ascii?Q?YLUBvWso8pqG38jnC0fe0/ZR7cbiGUZxeSa6eAtJqwyttaCSjv761Q3IRsHZ?=
 =?us-ascii?Q?QV76oOVnxp5GKtDeAVcfrVh9hs1605Q3dsG3bd2YzaLL0PT4bmxqH+2HkrrH?=
 =?us-ascii?Q?5kuu4dgpe+Wy8oj59C5elq+9JZxSflc2gAX1yMQKHbJliMNnF3Kmf7YePlo9?=
 =?us-ascii?Q?hYUr/XBALo2tKp2ho8qJyl6GJR8iWp3vsbIt3cyQeJ3rQDsbsZ8GlO6OrW9J?=
 =?us-ascii?Q?rqsNeKPJOy9TdIcn2tjzQfSYDvd3sq6G/w8k+vHmJmcaRD84GjFIZKZEwsUl?=
 =?us-ascii?Q?LApPqn9mQO3lBTHH4UkVh58MaLsIbpvt4dOvU50hlqieJogGA80Tpi7R3uDt?=
 =?us-ascii?Q?yRABEoHHDTuANJ2TcCgJDOglfSuyzUaRzHNW/tGwiL0ejqbGRLTjINjboEg/?=
 =?us-ascii?Q?YImYfIWmLmqmX7wHOj9LzjSHZhoysJglgDKCJEEKJ/GN+JIZZtUWJ0SE0OSb?=
 =?us-ascii?Q?1FCgFP+oX5JWk7E2nRDIFOHwcF1czJfeI/p9qSOrOecdxkdDv1xgbloZQ2g2?=
 =?us-ascii?Q?5hjagHVkWoVbXUQ+0Gros9L9SVDsazcywkeQ4pp6/g/d5F26DV+0ZXvypFbA?=
 =?us-ascii?Q?Rjw4H0L1+Z2oowiCJZfs5TMJmp4JY+cGvakaimlTW2i1wRmQFyy76Px0WCMC?=
 =?us-ascii?Q?sCUfHvxgv6S4JijG8d+QCU7sOLaZnR0tDW0RC7mVue9omHj592cLeUiWml+h?=
 =?us-ascii?Q?oHY+B3H6isdAqoyH85UaQYUC7iS/fR+3FWPbcJ9CBiXN75AnxlURGP9bczqb?=
 =?us-ascii?Q?/UXs6etS/45FI5uyBq6Wl8n/h+fdBtROrGsHtdzdI7Pxq/9r2rn4JWyPWjm/?=
 =?us-ascii?Q?dT7N6JkM2L21oDN1UnnuvKbfgph4/+olTM7XPTwaydR7vHi2+Hbh3RR2k8wY?=
 =?us-ascii?Q?3d+Tco9DN3e1+iXoJoyEU+8U377nvHCqfGoqFrrNaI7TEoHs/sjExNieNBaH?=
 =?us-ascii?Q?D5iVuw6+apAC0FL8roGwovasZujd5V7wdyf97zGnOgx6GZsw8mbLLO1z+sN5?=
 =?us-ascii?Q?pl5Aa7ck2J5TCm5PiuW7OnJ+sVB8d9+OwT/61Jn1Bpl2YL2C4CSGweN5EJxw?=
 =?us-ascii?Q?l8OGW9AQ++eZ68taghkGcwMiZ7layzeLkq8BUDx+blRFBPOBjgYuDL9pDZxH?=
 =?us-ascii?Q?BR0csInYLoNXNCt1uOZcXUac4ctlknEIv/aTp/F61+TQhqd1Qg7wSuLmMaTq?=
 =?us-ascii?Q?7C336yKKSnNN1TpE3k8lBqLj?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f94b17-67ee-4914-b658-08d96e0482f0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:30.6339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPDGXKrYCLyuXQtAJ1iQ5/aAA5kaJax4kav774ab4FF2z0htFhP1aH6ghxE6vhKQTtsElCXilbRvZaqKrZa39w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7841
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
X-List-Received-Date: Thu, 02 Sep 2021 11:26:38 -0000

The AIA specification introduces new [m|s|vs]topi CSRs for
reporting pending local IRQ number and associated IRQ priority.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/csr.c | 154 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c4057b44cb..273c8ac13d 100644
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
@@ -794,6 +803,28 @@ static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
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
@@ -1328,6 +1359,120 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
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
@@ -2062,6 +2207,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Machine-Level Interrupts (AIA) */
+    [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
+
     /* Virtual Interrupts for Supervisor Level (AIA) */
     [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
     [CSR_MVIP]       = { "mvip",  aia_any, read_zero, write_ignore },
@@ -2089,6 +2237,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
+    /* Supervisor-Level Interrupts (AIA) */
+    [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
+
     /* Supervisor-Level High-Half CSRs (AIA) */
     [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
     [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
@@ -2127,6 +2278,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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


