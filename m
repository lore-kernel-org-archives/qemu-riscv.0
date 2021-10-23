Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meChF-0002sD-OQ
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCh7-0002nI-MF; Sat, 23 Oct 2021 04:48:01 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCh5-0006w2-1C; Sat, 23 Oct 2021 04:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978878; x=1666514878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CtHtkLXiLMCVmNIUwSdHSamCeIOuJ4YxOeC1MZGTmd0=;
 b=qV8oC8iOZv8DFeiFH3UK8wsiftvpuxxytokx+bSoaDN7Kez/dxr+K9OY
 4HlrDOXVtLg3EEHtMkjTmDznEr7G86xCHj3UfCXNEyNjpAqDQcx0dyePT
 Dq++LRqrFxSaLhsAfQUD2LBW1diro8Deb9TeZ7tZ48Cth6vqiXIFnia8v
 gmdLP6Yoc3Xu9yUIfs4glOHW29GmmsDB2RV4vMZVC3gvSQtzkf3Jjagkt
 8fwGywYPBBxzKqo1K3qvLWSLZq3QmIvvkjgIm2kDTK0lOGSKTCQ0XmNWG
 GW7c1384lr3F90CRG/4FcufaDqZy5OypVCIg3vwnLRcjJDDfmY5X/ZsW6 g==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="295398058"
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:47:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSdvcnCPzHSzMYTqx8Irvhmpj9nXa41i45Y4ELuCwv9iLaKuoNhj9saYGX1fLZs1rmSWpghIRIOLKdhbSw7Kuzhr5j+qyxsKr+w5//DrwnyDqhvrJqaCnu4aa26UFr8h2o51n/LATdL3cdzVJ/65asZDg0P4G7Lz580FfsmcjhStzlyOkgnIDNFSlqYstGpE7ccj7KP90lson/3+fTokco9ekh3KSDchqCxB8l13j7qNsizU5dfcYvs4qyv+6A5djGgHvLfPmqC2WtR7s2u6+BUrZJDXteQoYpF2XO9lXfOjvtYxkLfbFHARgrFih141FFvNb1mEUEx1eERv14axHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/Hi4UdfODeNucs5WPgXOslYNww+VY+KApy6XktK8FM=;
 b=QvmBDnDVwEmOyIsJs12GezQ8ze/mA0WUdGhkY+Vlrnkk9eTV31ejmdhSANiWQC5483hRtaKJ4Ef3kfwu6B401MqTfEb0ym2EmDzO0j5C1IdsZbZVNg/TDI/uyL8xf0gc/Zz8RKmPIhtjzYlQXZGiIP2o3EXGvaSeCppvkEti4a0AsUeJkyGVOq2Ac4f7UCTRAHoI71cZR6Yh1PWXFI9g7aHsgez7j7/QEQQ3BQyAEGOa155qJS0PjjdUL54R7NlJ+4b2HrRH2bZ67Z1KmYSguc7G8fgtaEa6DIf2UxDxM7PB42a9U4AJfR5D6crceAoU5fq65ztZskEfhDLzST1sLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/Hi4UdfODeNucs5WPgXOslYNww+VY+KApy6XktK8FM=;
 b=N51b8T2jPzjKoDtYZRC7vcUKkItpqMf7poC6fdAKP6W9drlQf/izEI3pQykos9Xgm5FP5DD+vYHbLxu/kdhGiu8hmtTD6nqu19aUzYF8tzuX7oToHisYw+znI2+lII0peODKcd/xz2Sp/y/P/Z1pT20kCqSzosfhu0CiLzhb390=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8348.namprd04.prod.outlook.com (2603:10b6:303:137::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Sat, 23 Oct
 2021 08:47:56 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:47:55 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 11/22] target/riscv: Implement AIA hvictl and hviprioX CSRs
Date: Sat, 23 Oct 2021 14:16:27 +0530
Message-Id: <20211023084638.1697057-12-anup.patel@wdc.com>
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
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:47:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc0e605f-e15d-4236-8f20-08d99601ceb5
X-MS-TrafficTypeDiagnostic: CO6PR04MB8348:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8348A03289732ACBA77677CF8D819@CO6PR04MB8348.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /2fRQCBAoXm9qiMJgqGFwC29TxRA+lVrb2WRymf8CO3xAi2Jt6hvbyu5i1Z5ANs8OxWEqtP1+zwPva3dsSBaPgoNJvk0XfDBsL5mmU261MdH0jmWFqeSAGwolnJCvN/ALLrQL+v0ZxsI862JKNEqEPXK1Ta8wcNx6BtyAPRy+g6zMFrLaRfFKgF4K8vs04P6J1xxtzcxN10iy6rx8Z3Nifc11MfvHMjph3L0XxtUXp6VhQ6GOR5pE4w6c8i6qtKd4Q+25Pwlb3bbU2+vUhYeGn3Ybl0ASvgk3G3TvPEIUMrGx4gkfAvdWkTMVqBX2bZr1wqIfzE96HT3uPp0atDascndx4PpE1DUDm7f6d18jdab2sGljKWmG8Rm9YgTN7k8ekLRsR8B4WHUwutkbO18FUMHVzecax4XFHHBhDvGec3+v3fCXAJd0xXUQjcnTIsFGUx0sYHoNPbTtMuec0rqmyzGm4PytN34a83b/cM2ntWusKsmwJhXQmXiV1rSCNlUvIsRbVun+13tG5nZjTibnOUCruRTDRumss26ua6JLiIz/yYmawYOiA2EwD83g7nwwv4U/cok37BQqEW3fSLhYnIi6xFrbCZ4gX6iljfKbQDOImpreF5X3v6D4SOb7EnMko0u2wQoJMF1hx+57+01ftHLWiu45MQUBWNmZ2C0ldAkvsXT3Zsdm6LG7zP7rFgC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(186003)(55016002)(36756003)(110136005)(2906002)(5660300002)(44832011)(52116002)(316002)(54906003)(508600001)(26005)(7696005)(956004)(2616005)(82960400001)(66556008)(66946007)(8886007)(66476007)(6666004)(1076003)(38350700002)(8676002)(4326008)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mjRs/3V8MHr5ixCGz1ULC4R64dHEXWO1tWklxw5DE82sTVZoKHZ6Z5YUurD3?=
 =?us-ascii?Q?ocqFXka/R92Oak6YpnzcgKREu07uiJFKxGflJ60sR0IbcQd/5F6gtGRd+v3X?=
 =?us-ascii?Q?0AuqdNGfLbEAK8nVGkgLGB9u60p8j5PKyKwNWpGG/zMEgK1JXWc9LAhuQ+3m?=
 =?us-ascii?Q?VZB4vRredq86/6Q8G98kBGGspeRDp/DR5fTU8s4Roe/De+N39tk1HbLMaTHg?=
 =?us-ascii?Q?MAJfFB3bt1iWTgN/ddWlFfn3a5048++J8IS+63N3r9Ezs1Ux5FXVCJCf53Uc?=
 =?us-ascii?Q?YYjrzg5VlGc4dSiqo9sWwFghO8LGEzer5UsaKBgwH7lunVu2pn2bEo1rZuUY?=
 =?us-ascii?Q?uI8LMtw3Qu5fX1xdtn7wvLl/bXza3pQhOFDXeiOS+4sg6TzoNljNVBiA8FVm?=
 =?us-ascii?Q?fOtJbB9ZMv2P3ioKPanDkiguwsNXQHHAHlJZgKtWrVCvakT78LbBw9Eu0VZE?=
 =?us-ascii?Q?2PaVAii32+5RNNViF25039VJM1DnPT5fAMGG1Rf2aD1R2pUPt+BKoC1m4tlH?=
 =?us-ascii?Q?KuuX8Vczd+EFFIEmRf5GFHcnQ7bJMna8GS7tcaoPDIkGOOn5Y3zzr8BkoER3?=
 =?us-ascii?Q?z4+DPyYUwRrz+OW5EUq6O5blwtA9RF55DklXdR7ZPYN5zPoflCOLs1RLln21?=
 =?us-ascii?Q?6yZVft/HzBAvcFAeeWXQjKAB3l94XdhObsOIKLVzxR+AxMmU7jvLmBAk+Y70?=
 =?us-ascii?Q?cYC7+EQfVsEDUcPKH17jMLHnRXSWKIE+qMWJqONDGXrdgS3Y1d5TG0mHAIQq?=
 =?us-ascii?Q?+UAveJGVxJ07Bd+tfNMbcjAGFqXJPjnY1GQ7MCQ0E3Zh7QSlFbG4fQwigsT1?=
 =?us-ascii?Q?1Wizvz+FvZP0cEmyBvBVk7Bp7Wc/PYCLm87ejFGGqJqzHZIFoLXncQ/P4dnY?=
 =?us-ascii?Q?4eJf+D2JwTwzCy7OalLUJ8mcJ9XJidCj2EHNeNI2gHJtO58t1Rs4vn5b0Mc6?=
 =?us-ascii?Q?axEQxfqDBPZ9ycQh+VWCEU1ujhWW9iw2Zld+DAVB6j/3Dodj/B/fx/tL71YD?=
 =?us-ascii?Q?zAgURDbjA3GUKKeGRKg7heEvjMoNz/oKTY3uZ6erGFhxeotfKoOCVwsLZCMl?=
 =?us-ascii?Q?KVZ81AQ0VeKZX+Ej3r8GxWxd9q5i2mHFiZkwXLfvyR5wkOWEgB4p02ZFmqod?=
 =?us-ascii?Q?PZ/G/hzrL4tl0AQ9SRZ6/5k2Rv0XDrj49IO4h8cWgRyzNKJQWgFjatjqNqlN?=
 =?us-ascii?Q?SA5yNg0wNkbUNcv/0ASpFnY0pGWvdIQWcCKl+3KKdIGZAt7PNs2iZx0gU0V9?=
 =?us-ascii?Q?MsBE7Z3B9i0TgzBSSqOTmZ+A5uFqJ50GLRznI9tSuE+REI0VlI26XLWu8H7V?=
 =?us-ascii?Q?c/4R5qMeJGdcJhn5mfaTTrdnZYVMy7jMEz36MnQHB8UeX6OseCBEk70vBWfG?=
 =?us-ascii?Q?1VvTff74PCOls1GR4nDsD3kfK168T6jQxE/2hzoGLR39b2m/aGweUhWo4Zwy?=
 =?us-ascii?Q?TKcoEhfQeGzBEkQ397wCPDRRbvknVmt1oDespAVa+XYmGVA/0OvnRl1S2BPS?=
 =?us-ascii?Q?Rv8UCbrqpJJkteL7bNxIilo1Oh2wvxHaMmIUubF36iwe8ZUBazWwiAVYCpjl?=
 =?us-ascii?Q?M+U1PNw/2nGk/9Hy0QmFBnw1atpzzqE57RMZuALcG2sJpge6xcf5wW/ETAIo?=
 =?us-ascii?Q?aW2/XVxpHDx7agtN+nceMvI=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0e605f-e15d-4236-8f20-08d99601ceb5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:47:55.8158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzmMGGH6TVuvjCGXSltOzWmXbOldGX5XKwhIqRUhNiXFIVzaVWXJLBLp0MsUnR4EVU/cE4h7q6sjherWbcVyIA==
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
X-List-Received-Date: Sat, 23 Oct 2021 08:48:02 -0000

The AIA hvictl and hviprioX CSRs allow hypervisor to control
interrupts visible at VS-level. This patch implements AIA hvictl
and hviprioX CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.h     |   1 +
 target/riscv/csr.c     | 126 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c |   2 +
 3 files changed, 129 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 718a95e864..21d9c536ef 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -196,6 +196,7 @@ struct CPURISCVState {
     uint64_t htimedelta;
 
     /* Hypervisor controlled virtual interrupt priorities */
+    target_ulong hvictl;
     uint8_t hviprio[64];
 
     /* Virtual CSRs */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3a7d89ac34..46d0cabbde 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -219,6 +219,15 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
 
 }
 
+static int aia_hmode(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+     }
+
+     return hmode(env, csrno);
+}
+
 static int aia_hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
@@ -1031,6 +1040,9 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
     uint64_t mask = env->mideleg & S_MODE_INTERRUPTS;
 
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         ret = rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
     } else {
         ret = rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
@@ -1229,6 +1241,9 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
     uint64_t mask = env->mideleg & sip_writable_mask;
 
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         ret = rmw_vsip64(env, CSR_VSIE, ret_val, new_val, wr_mask);
     } else {
         ret = rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
@@ -1615,6 +1630,110 @@ static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static int read_hvictl(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->hvictl;
+    return RISCV_EXCP_NONE;
+}
+
+static int write_hvictl(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->hvictl = val & HVICTL_VALID_MASK;
+    return RISCV_EXCP_NONE;
+}
+
+static int read_hvipriox(CPURISCVState *env, int first_index,
+                         uint8_t *iprio, target_ulong *val)
+{
+    int i, irq, rdzero, num_irqs = 4 * (TARGET_LONG_BITS / 32);
+
+    /* First index has to be multiple of numbe of irqs per register */
+    if (first_index % num_irqs) {
+        return (riscv_cpu_virt_enabled(env)) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    /* Fill-up return value */
+    *val = 0;
+    for (i = 0; i < num_irqs; i++) {
+        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero)) {
+            continue;
+        }
+        if (rdzero) {
+            continue;
+        }
+        *val |= ((target_ulong)iprio[irq]) << (i * 8);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static int write_hvipriox(CPURISCVState *env, int first_index,
+                          uint8_t *iprio, target_ulong val)
+{
+    int i, irq, rdzero, num_irqs = 4 * (TARGET_LONG_BITS / 32);
+
+    /* First index has to be multiple of numbe of irqs per register */
+    if (first_index % num_irqs) {
+        return (riscv_cpu_virt_enabled(env)) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    /* Fill-up priority arrary */
+    for (i = 0; i < num_irqs; i++) {
+        if (riscv_cpu_hviprio_index2irq(first_index + i, &irq, &rdzero)) {
+            continue;
+        }
+        if (rdzero) {
+            iprio[irq] = 0;
+        } else {
+            iprio[irq] = (val >> (i * 8)) & 0xff;
+        }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static int read_hviprio1(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 0, env->hviprio, val);
+}
+
+static int write_hviprio1(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 0, env->hviprio, val);
+}
+
+static int read_hviprio1h(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 4, env->hviprio, val);
+}
+
+static int write_hviprio1h(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 4, env->hviprio, val);
+}
+
+static int read_hviprio2(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 8, env->hviprio, val);
+}
+
+static int write_hviprio2(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 8, env->hviprio, val);
+}
+
+static int read_hviprio2h(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    return read_hvipriox(env, 12, env->hviprio, val);
+}
+
+static int write_hviprio2h(CPURISCVState *env, int csrno, target_ulong val)
+{
+    return write_hvipriox(env, 12, env->hviprio, val);
+}
+
 /* Virtual CSR Registers */
 static RISCVException read_vsstatus(CPURISCVState *env, int csrno,
                                     target_ulong *val)
@@ -2005,9 +2124,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,      write_mtval2      },
     [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
 
+    /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+    [CSR_HVICTL]      = { "hvictl",      aia_hmode, read_hvictl, write_hvictl },
+    [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
+    [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
+
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
     [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL, rmw_hviph },
+    [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h, write_hviprio1h },
+    [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h, write_hviprio2h },
     [CSR_VSIEH]       = { "vsieh",       aia_hmode32, NULL, NULL, rmw_vsieh },
     [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 7356d70be6..bc20960260 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -116,6 +116,8 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.hgeie, RISCVCPU),
         VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
+
+        VMSTATE_UINTTL(env.hvictl, RISCVCPU),
         VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
 
         VMSTATE_UINT64(env.vsstatus, RISCVCPU),
-- 
2.25.1


