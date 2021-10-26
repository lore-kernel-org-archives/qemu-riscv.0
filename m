Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBd-0003YO-UG
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBU-0003VS-B0; Tue, 26 Oct 2021 02:43:44 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:53176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBS-0002ER-09; Tue, 26 Oct 2021 02:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230621; x=1666766621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8hCfvF6U3YpAM0d9MZNIIUkZmdVvqrgow2wJTWop+lo=;
 b=fG4rAppx5vA2BVE1/KnLT9QHP+oqyPuPhzdIMBSovZrzfqqhsn2Remxn
 eg6Btd7E3OHqZSwpqC6rkgZDZktf06DsMgrOjIPZpvjcG7Exg44f0EZsp
 M3xytAyOhNLThukXgNiDjWXnqdQUmlPes5/UY9oavqpTFNiaJuSdydxZc
 X1AUXSywEcozgaeqE0IS/Zm49swjwr4Difp399Jm7wkVqW9TfXupMn7LN
 2+05hKA6HRw3Z7fIuGwaMx6epk8NkHfDkYNszfm0RAojbTP9Cl7T+9zsB
 ISgWHP+0hBOZ7Eu1rcGiffopm4+4ZjyX5hrv6NNog08ZtBThiHyfdFRvl Q==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="182854770"
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TM9uhPUvcOtwuIxzSC0+GhfXhIOdvCpl/+Ur1hWIhtnUwXSmgfB0M3CQDmktJPYlKdu9TxpC2XwV/oOCYABfPZcS2CWUf1y7g4WYOyZcN7brDHCJxKFQpOhTNVsCI23eEak95GWGqbAGX0lnuuuDyr3ZQhAP2fJaQ+hFITzvDyJ1dLMcGPdQNFd3KrrOKKFchvbmVvfDgoMf/m/67+96OIyVMzGgaJd+f2lasxB2dE2Zrg9vKZTBXz+/+Z7nTphl10J/r98vx7GfrK3jkpJucVi8SqRpybGVPrngrWx47jSUcxv2b+o/KvhTSYsY+GhPOBMy7PxHeM17gjGBXentag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdW/996re6102wzlutMgaIwMLUHwY2GHwdAMZDfEEK4=;
 b=bS8//iJozkbJJ7o/+Ow0HzanxobN9vEo+Z/GEDESp8Y7UPgHypeOU83Q4FyykNwwuNPzqhXIRZuP1zOc9xdHiP6usHk4duU02KP5PPHg5UEUmTv7nRby/XeZu26VgW75wgTQ5ibZnxtHzcGD4YBCDao0lea2QMfwUWscqvP6TicMlS0arCxnc0/lLhfU67+bxj2i5e/SU6AzPd5hj0Lfvrp1RXo+J8HC8Jk3m6RYjsehaTjPWQk3/riu9ZaZFOmJzB3b8zfR8oXtOMyA2nrnFGbSDaP7rzLNN1MPW3F3I2e6AjPWJGBIQCmbNL3WeckaGezMaWlXFOkVDs2XbwNY8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdW/996re6102wzlutMgaIwMLUHwY2GHwdAMZDfEEK4=;
 b=PVKXO8AkU3J8cxYQopbmcSbIHsvTPccTVtpK6c99KYkXQlddrVPw9AMV+rDonjdL1ZAhThmTovU2jCT910aTX/2hA8TNqATMnKxBKHEymZhMRMufUfiw8W3f7ZfV0C3xjt/ksgCwfBWKbdua4LHSriCfDiL0hVXMnNBcg06WRPU=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8379.namprd04.prod.outlook.com (2603:10b6:303:142::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 06:43:36 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:36 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 13/22] target/riscv: Implement AIA mtopi, stopi,
 and vstopi CSRs
Date: Tue, 26 Oct 2021 12:12:18 +0530
Message-Id: <20211026064227.2014502-14-anup.patel@wdc.com>
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
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41803108-f3ae-4267-19de-08d9984befa8
X-MS-TrafficTypeDiagnostic: CO6PR04MB8379:
X-Microsoft-Antispam-PRVS: <CO6PR04MB83795756CD32493C2C9F17F68D849@CO6PR04MB8379.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:250;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NW6JwKUObiuoiLyckxnNXiye7haRxXIPuzGmrvlma4Ce6Wtk4E/ZDXe1KFtnIVsaEbWygJh4I3ffuXTD+BsomxioerRBcOn6lzUkCz4SEbISykdJq7wZBd6231DMneOIga+JBc52M7Z4jotd8Nnied7BADNO+RQu231PDXe/cl+jbcgGx+YJrmdsXo0mHUo3YKeu4D8UCpC3Irp/dubXCwPVHoWkTWdyHMWo+ym5ax1Ajh/LXvyZaEiGRb8/DArDsTERMAan50QN3KEpnnxGrzH+jRzEB5O3zPmb7sSeq6J4hD1LICHZOWlmFomgXY7eVP/AO0KBsfEXqs3acsgCcfEanS3yu8ayQ1kZYDWssFrd3bFDMuXVZXqx0rqhtVvXW5t2Qg5v+1lvnfa/rTGVmKNgDI0lmlP0sZkfq7AMJZZy/VuW+/lLl1sF3M3GaMdT8KTNgEg6wgFTrXitGqI0xTlMeXlhbvT9N67bZzzgW00spHTwmlOnaYggYQafIkvFGL7S2u538A6jCw/tPj+GtKfutWUg2YYc0pS8cX/JxT99OLG+y0PKFt1GRUQUa2jk8epUTOxoVuwHYF7cqzbECHqfpb0CUN4CnkJ8evjc1xnaelKaRPmoDpvyU9dY8NQW2NRFOZ3IbRWbMvzUs5BtOLYxiz103tDxjOkoDcNROvu1CUOmmwEfyVCVX3lfqjRHr7Pvvk+4fzr67pWiYhj/zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(186003)(66476007)(4326008)(110136005)(8886007)(55016002)(2616005)(1076003)(508600001)(7696005)(2906002)(38350700002)(26005)(44832011)(66556008)(86362001)(54906003)(8936002)(66946007)(6666004)(36756003)(52116002)(316002)(8676002)(38100700002)(82960400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EihTosm53RyQvhTmrf37a5VfL/gRWp3VO7guew9tna01wj9CXlw9DBRmBoS0?=
 =?us-ascii?Q?b0PDHJnNV8mNYdUFchZOD9GKTY6cruKisC85P9J8UhWsawx/O3ZWjTiX3Y/p?=
 =?us-ascii?Q?Zt95nGCBCEu/Ny7IoMNVHmw9yLikNXsYVpRjB7MniCIUSR/LFJX/Hz0JgPxV?=
 =?us-ascii?Q?4g5InFzfNo42E92cANsOX27lDzqXshvzkJdPqTJ9PnjmPnyA7ISG/FfTqX3X?=
 =?us-ascii?Q?hgyfm9/Vjt0pdKFe8IyYM3fzmRuha1WJDHY096sqP5QE/9dkx4jCVv5XQxis?=
 =?us-ascii?Q?gj90sHHc97YXVJ0w9mA/UB53vep4VDsJqe0hmaoeifVc7s+xEspZMZauGYkV?=
 =?us-ascii?Q?iuM5rIzQEdkLch0DOE/yptSLBNKS1rAEsan/yBu0hXWc3TJhedbgd1qz/bvi?=
 =?us-ascii?Q?IYECOACHKW9pRS1bcuavBN8haZe44AqVUi31d8ZNMyMMFzUrpE8tV30oau/j?=
 =?us-ascii?Q?u62PfT5xQ5MkNisZDA6z2x6U9F1/ZAPLUXkHWCQ8AXOYDly5M8pJJociJjNe?=
 =?us-ascii?Q?xRR/a8Bd97HkkRLGPId19UTebFDLdFY/uQGQXg6QUJjvl2cRTqDgRdemhwm4?=
 =?us-ascii?Q?+QqOeke9z18D4UffJ88j+OstXF4NxhMkeJH29y7FdKgZkPnLcqo7a1wA3L0j?=
 =?us-ascii?Q?4rIOUtGoVDm8bNkNE3hkDwBvmzNRo6djtSzywAu2GNliu8X/ZRt+G3cV245h?=
 =?us-ascii?Q?1xHokj6nKpPC6WrYFZb4pStRWx9ofdCpNgYQ/4ihkGMJCNYODO0sjnSLwIgU?=
 =?us-ascii?Q?lsFdDxGgflQOznuFIkMpk2VVA+zDTy4q3mXHXraLRTSCQsF3igqmBU5hN4Fp?=
 =?us-ascii?Q?9x9u8h0ZwG/cGM4DHJUlrRbBA8j/lxY4dby9qxblWcS/fcsi7lcHRz+n/cK3?=
 =?us-ascii?Q?BBaxOGFXnEh8k/nZqQ5TJsakZK1uXsK9o9XRImnVqQxIXQpERdXDQ304KXj+?=
 =?us-ascii?Q?G+NlcJGWzw1oNfEax8OdHbAwkExH1e/gOhpjXh+gY1KlE+n2nkV/ee/FNigO?=
 =?us-ascii?Q?wtI/teB57oxPJiCPUIzkswMT4gHmS81tKcOgw1YojfFKXu4zaXNbEHsqv6qy?=
 =?us-ascii?Q?4/XYoQQUwj9uGt8MRIkX+bMrr6iQN15CnQaJvXhV881hT6gHzAVOARVlDiA8?=
 =?us-ascii?Q?V1wuGfYsJz40aLYJcC2YYwsWdouyRv6Hnjhqu6lY6SWOiWof4DTS0Ct/8Bwx?=
 =?us-ascii?Q?WdW55f77M2YDCHxU/WSzNWUQfJ1hatZnYqM5pVSm8qwI3n97Jhh7DteUFC/L?=
 =?us-ascii?Q?0o8zzRrbfEPsoFrCSXqJH7hTLAnEvSVGJyo7XBijabx78AP73nyDXlrlgai1?=
 =?us-ascii?Q?XdoK4+YPphilS6xXIwhR9KDGUCHyS7DX0F34bwJlhbGkp2pOvRkIFRRkgfnA?=
 =?us-ascii?Q?laRO10r/WL/mq6k4SGR6Pq8zi94O7gZZsmfnxj0Dr2fkCjjfXd7NE2nHUTMq?=
 =?us-ascii?Q?6DQUesfUQE/QET3ZIe58VdvmmF70o5CCtqTtR+I/19RzVbuseuVXsHfTncA8?=
 =?us-ascii?Q?tDe7KqcnWjs/e6JpPzzrZnAtpd1IyMzjihEhsn2sB7WUGcdhr8sfl5oDeuns?=
 =?us-ascii?Q?50VyH+K9l9ZllLYLxYDTPUzOMM1+m6oJKc+NAVHDc2HDVbzj5GP7xmGQLdxy?=
 =?us-ascii?Q?DAg4vz4LREF91Xi11bt9PyU=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41803108-f3ae-4267-19de-08d9984befa8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:36.1182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fb5SSq6fbGwzYNbLWmQAScSxemnFRflTvD44YbmOGGHi8RYYq1u9OW0mR5bAyIQhShSBdjGFfU9HF3mY1TKJoA==
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
X-List-Received-Date: Tue, 26 Oct 2021 06:43:44 -0000

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


