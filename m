Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtsD-0005O2-Tq
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsC-0005K4-Lv; Fri, 10 Dec 2021 23:20:36 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:25424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvts8-0001io-IR; Fri, 10 Dec 2021 23:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196432; x=1670732432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ojzk+qENhEgkfyUeBnglnjCzVeFnmug2KXqCTZ0Y7WI=;
 b=j/BU2vNBGG8mnNZfbGfYvh2d5eaMGfnERd2jyquCbEbblTfhHcrPf04E
 /4DfFI8YO1yVOGfb/cJmvPwR12Hkg9r9mDoBe+EBn4EnIijWDUXvHBySO
 3jeonwqyRP7o1WB09wXzbnlKFf3lLQsB7DwiYLzEmQAUWVFr8wsbddw9X
 XHO8iZTMoG13vLZMQVeGv8VYaO9/QDAM9gszNhh0Fyftw5/4hLGYAdKHp
 WNFcGzKaWOej7m9q8+B8S8e3CjEMT/ywIyz+E05BOCc/q4UUW7zqFRqfR
 GVisW9tHmU5gjLlfTNeQmxaCR6f3kTD4xEjYnkitskqys1bYrpw0GWfOe g==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="299834357"
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffBqKoch+4lJKV69LvBqilv9DP7XktOhOmP1cX13s+5AFCusIDEGeDyfQIU6bX2Cos0fZ30J2TjJoUZjR56DxzaG7w/Lj4t4A8XG7YhPLe7hDjA5trZjPJLhdmEGj3eNqHeT6RTsEas2P2dVApPeElUCKbF4aZ81KgOew3tq5icIR27ptxxo/b5O/j9/k3kj1nwWewWZhl/pVIAx7hxF66QHWS/KOCg4cKOlsT3tskgZ+ov/89DwkOwjaWyKZcPOghBeoJxKMAZPIf6HOmxl/7mBfyOhERgGJU4WouOFpjJGZt1TVLjqVd8hQtSvc+slAgYsdTr/iwz1BMG7zWlhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vzo3UOPPDgIWXM2FkTKl/s9dkvjELReckMweQtVsTPA=;
 b=K4cRchO4X8oSS6v0FLien3e3A4cz6Pyp9YyH82il5KWmXAxtLDsaetZzHxwQWmADlr9Nj6EIoQikhLz9IavQsOXiuJ7PdgSFUCvr09nKwixSHYBfwPYFgQIMWyZgomQ1ky5P82666O24GT4gRkIvQwAYUIQgWsRieJMXiNUT4fR5fPlpJ+IzR0wzEnnLLmsFP2D9W3RgooGbZsVEpr+4RJEDMw83fcUkwHuolUtPw1vYy7IgloXGdF6mMv9DPUYcekEdPGYnM3KdMBEtvTNvpqEmTqfgCEcTjgjWGlhlTPQx09ZebeunqSe3K7+4yaY1ca2smLSLkb8MfXbWhyuO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vzo3UOPPDgIWXM2FkTKl/s9dkvjELReckMweQtVsTPA=;
 b=yw9CdNpefQy/n24CoXZLhZ2eBP7mZljGd05p3u7CRNqXSo7fLv3W795oCAPcJ7Pyaw16Msl2xtYkhdfhCfewIThp1M6FhvdanOyIpY5d+G1YZzVn5YY/QopPHdCncO9k6hTWbubeNKTKX4hOmXpqdn7BGBqzNWtbDANkPt8FPqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:20:27 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:27 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 10/23] target/riscv: Implement AIA CSRs for 64 local
 interrupts on RV32
Date: Sat, 11 Dec 2021 09:49:04 +0530
Message-Id: <20211211041917.135345-11-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: 87dfba4f-7543-45b2-8c83-08d9bc5d8f63
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB82685A94721256F277358C138D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JMG3AuDcfokCSVLFAcqPudveBXr087GbZFs8GhkZxgSYrtfSdCn9M88CHlUko97ULzwSybWEn5INRRuln6gBxuKmoKhhEuStbVoy+HFw/feeRsMenKv84ds3NBhWb721UpEXVx3NpuYSwAio9PR6joZoHvGUQtCzwLotTtqkNF3NJc9c4/zPQ3ZxylvUlzAy8C/bMOYjv2MCHsV+U3Rwvgdann5KNaOMqPttF1zvM6lMa/Om5IzqvD0RBls/zRzHwH+e0v40bEtBO3AFZhbr5tB06yEJzXBBGp0AsMwhyqmcjiT0tFS4aBj0uv6MBmPWSF2V+FbNfj5w4lSc9VuykjP058MwUrbqqs5zBjIDedcnzhfcVmrUost+xZH/lSOMjNZtpofZX/zY70lfkiNVmTlXlrB/HDV7pZ2a8ZSPoHt7apT0vyDmmrgq1a8d/QFtwAPaOw1V5VhJhuz/IDikfukQGKMtOq8k7veYuUVKVwUgxXTnJX8wpkFkV+QU3nL5vYGPshFf3kPtFGf4HIWmIjipHfmq+ei/tXzt3rduk9e30yAd9xH2KIb/3oxnD6MlMQ4zMAlx9akz0KMHatGH4NHcGRLRNy2hWz1FR8UjJ32QCxEyZEdyXcWeso9/eJlTt/ahnmgUP2CfgRr9QtSSfB3bAQQcDwX2ccWGE8h/t1q8+ATQyqA1NiSqrMn3WCTnhCclSz7huYHKxiO935YEEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(30864003)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kPGZcqPRH0CK7AV2l7oyVgMAknsLZZdFsx6PSMS91gtTpMNMegUa6ciZJRlQ?=
 =?us-ascii?Q?l9QfvrN7XBDTw4HdYHCgIj0RFx2UIzOnuFb3unu2UZFHJdyBGjjV5GWtBGcR?=
 =?us-ascii?Q?pmThNpN4CZL8S3Ae/DBRVAbwjgqqjKZ8GG29Ngh1aJLzMTlUkNfKwLqbgA6j?=
 =?us-ascii?Q?nuQ0XacG35E6Wfed1h6c9vxB4jWLfBbzzxlqwniGOvJpy9hLY8bi0/GR0niJ?=
 =?us-ascii?Q?UNN7PIN7McHL1fONRk3Fu0lGceXxSu0Dce35xyMSoDw7OUKYXHDr1Vzvv5/9?=
 =?us-ascii?Q?WrDP1pj0Hg4Sk0f9dEDKIKoVhRFvc5iR2yjeKCz5iTOiEaGS3fJ1ulM4WCg2?=
 =?us-ascii?Q?bWeL+3twpJ/nsryTnD0jsgum1K29hgkTA+7uW+TkkIA4rHmEB0C6x4KFodoC?=
 =?us-ascii?Q?mtBSjPeLAuDSGoL309Gey94NszzzyFtCZ+gTT8q2MJV40PADYIwZqSAMfa5M?=
 =?us-ascii?Q?CMPWLfbPLH6PsvZ6Gqgqvlw46YpvXBNAQT5Omv+onmq0sZlI9i/IjzPoD93Q?=
 =?us-ascii?Q?0aVozkUi3raR5mnrL8iQv7joTixYAN5PW7tmOL1dEolR5YhTvEr0gINoGNPk?=
 =?us-ascii?Q?Pypu0p9MdYE0/xXh9AeLYQLSr5e9RTq8M0yyKx0sYcOir/9NnfqYCJ0uoQi/?=
 =?us-ascii?Q?1g+8BO3Zs4FIrjMgrpwyREXZw04vGg+7xfaM5RTXhiDyvEEldAdARzHjPxrI?=
 =?us-ascii?Q?0qJx4Nj1V43SMC7UaB1aVIeNjkA9aki6nvvblJf+o4wK7zFlfiAqZCFqFl30?=
 =?us-ascii?Q?QKS2mvqu3QfpqmUg31G+C5sZ9au+/7TgS75DDs76BFngHf5GDSFX+RMz3ELp?=
 =?us-ascii?Q?oRmoIsATbdCwFbNlpk97oJKke++k4rbnqpK/Mo6pGPUb1mzgBadSynL+4fpS?=
 =?us-ascii?Q?26Q1SYc37nMZ+nvT7MRHzM3EpyCdHZSZhkiDP9wFGG+b3tt6qe3+e0riY5CI?=
 =?us-ascii?Q?ePBb9J2bWr5Gh3IKpU8H6tCi5VNtSarpWhNQ00ipyIiXauPyNoW/I5iBS010?=
 =?us-ascii?Q?QVoIoA8Y8p+Wm6NWvnO2nVnfagZu1inhRjwhawwX35yi0LP9p/P2+gowh5Qk?=
 =?us-ascii?Q?crKmc1HVGIXgAMDPDXOOJVyEDZz91ycD55gyHui8faZNxshdpM/YpKrOPB8w?=
 =?us-ascii?Q?l1Eet+/f6fV29dAxF24hk5vKpbjme1yzf29u3OtXkTUEzw6keTmlKCTZVJMG?=
 =?us-ascii?Q?4ePO4sEbrFBBqsxwkA8Ktc7lPyt0IUYUFxgGl019PMjCgNi0u0obhcrI/Scs?=
 =?us-ascii?Q?oX+VngSteoRUVSRi+Ierx6kgksikVsUIRdpZpJ4L21+lrWEVFcfsWqayhJat?=
 =?us-ascii?Q?SgyM2SePJFGEXIQ/36ipFo53KUSQZDehZGBp/XJF7wUxjfCM8AZ6BxsNvFZS?=
 =?us-ascii?Q?GV7tePFhlqYgPGFyq+BgCg8/MgUp+jfMpnTe5H/GRiDLRssEqPLxzwVrq4d3?=
 =?us-ascii?Q?1r8ma1yQy/uON1WVZrbPPVUAkMdCmftOkapZXM5vh3SKOcqDr4u0pqVfF0GE?=
 =?us-ascii?Q?GSqVXRfzZiwKc1kuiAkKGIHzhDbOSmi9t06a0IWoxVj7bwawhrKmMSVcfsn5?=
 =?us-ascii?Q?JbZHzkQJqPVafnQP47fERmx5WH+iLZ/EeisRoVp+MN3wUtmlAlWPp525dQ2T?=
 =?us-ascii?Q?GVvewRTu+2PfaewPcuFggi0=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87dfba4f-7543-45b2-8c83-08d9bc5d8f63
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:27.6718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nlm4G/cus1al7SARdKZt3x4Y8fa0lUivCdVPxUisore3/ayPwfXmFFuArAPjp2xmQ8dEBY8s1b3/BegDpwZNbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8268
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:37 -0000

The AIA specification adds new CSRs for RV32 so that RISC-V hart can
support 64 local interrupts on both RV32 and RV64.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.h        |  14 +-
 target/riscv/cpu_helper.c |  10 +-
 target/riscv/csr.c        | 560 +++++++++++++++++++++++++++++++-------
 target/riscv/machine.c    |  10 +-
 4 files changed, 474 insertions(+), 120 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 69d9c42ad3..8b14fac9a9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -160,12 +160,12 @@ struct CPURISCVState {
      */
     uint64_t mstatus;
 
-    target_ulong mip;
+    uint64_t mip;
 
-    uint32_t miclaim;
+    uint64_t miclaim;
 
-    target_ulong mie;
-    target_ulong mideleg;
+    uint64_t mie;
+    uint64_t mideleg;
 
     target_ulong satp;   /* since: priv-1.10.0 */
     target_ulong stval;
@@ -187,7 +187,7 @@ struct CPURISCVState {
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
-    target_ulong hideleg;
+    uint64_t hideleg;
     target_ulong hcounteren;
     target_ulong htval;
     target_ulong htinst;
@@ -414,8 +414,8 @@ void riscv_cpu_list(void);
 #ifndef CONFIG_USER_ONLY
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
-int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
-uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
+uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
                              uint32_t arg);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 033feb3463..e387e9b1e1 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -503,7 +503,7 @@ bool riscv_cpu_two_stage_lookup(int mmu_idx)
     return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
 }
 
-int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
 {
     CPURISCVState *env = &cpu->env;
     if (env->miclaim & interrupts) {
@@ -514,11 +514,11 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
     }
 }
 
-uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
+uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
 {
     CPURISCVState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
-    uint32_t gein, vsgein = 0, old = env->mip;
+    uint64_t gein, vsgein = 0, old = env->mip;
     bool locked = false;
 
     if (riscv_cpu_virt_enabled(env)) {
@@ -1221,7 +1221,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
      */
     bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
     target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
-    target_ulong deleg = async ? env->mideleg : env->medeleg;
+    uint64_t deleg = async ? env->mideleg : env->medeleg;
     bool write_tval = false;
     target_ulong tval = 0;
     target_ulong htval = 0;
@@ -1286,7 +1286,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
         /* handle the trap in S-mode */
         if (riscv_has_ext(env, RVH)) {
-            target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
+            uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
 
             if (env->two_stage_lookup && write_tval) {
                 /*
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e5234a1964..d9bb5ff649 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -153,6 +153,15 @@ static RISCVException any32(CPURISCVState *env, int csrno)
 
 }
 
+static int aia_any32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return any32(env, csrno);
+}
+
 static RISCVException smode(CPURISCVState *env, int csrno)
 {
     if (riscv_has_ext(env, RVS)) {
@@ -162,6 +171,24 @@ static RISCVException smode(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
+static int smode32(CPURISCVState *env, int csrno)
+{
+    if (riscv_cpu_mxl(env) != MXL_RV32) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return smode(env, csrno);
+}
+
+static int aia_smode32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return smode32(env, csrno);
+}
+
 static RISCVException hmode(CPURISCVState *env, int csrno)
 {
     if (riscv_has_ext(env, RVS) &&
@@ -202,6 +229,15 @@ static RISCVException pointer_masking(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
+static int aia_hmode32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return hmode32(env, csrno);
+}
+
 static RISCVException pmp(CPURISCVState *env, int csrno)
 {
     if (riscv_feature(env, RISCV_FEATURE_PMP)) {
@@ -415,15 +451,15 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 
 /* Machine constants */
 
-#define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
-#define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
-#define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
-#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)
+#define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
+#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP))
+#define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP))
+#define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
 
-static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
+static const uint64_t delegable_ints = S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
-static const target_ulong vs_delegable_ints = VS_MODE_INTERRUPTS;
-static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
+static const uint64_t vs_delegable_ints = VS_MODE_INTERRUPTS;
+static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
                                      HS_MODE_INTERRUPTS;
 #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
                          (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
@@ -672,40 +708,107 @@ static RISCVException write_medeleg(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException read_mideleg(CPURISCVState *env, int csrno,
-                                   target_ulong *val)
+static RISCVException rmw_mideleg64(CPURISCVState *env, int csrno,
+                                    uint64_t *ret_val,
+                                    uint64_t new_val, uint64_t wr_mask)
 {
-    *val = env->mideleg;
-    return RISCV_EXCP_NONE;
-}
+    uint64_t mask = wr_mask & delegable_ints;
+
+    if (ret_val) {
+        *ret_val = env->mideleg;
+    }
+
+    env->mideleg = (env->mideleg & ~mask) | (new_val & mask);
 
-static RISCVException write_mideleg(CPURISCVState *env, int csrno,
-                                    target_ulong val)
-{
-    env->mideleg = (env->mideleg & ~delegable_ints) | (val & delegable_ints);
     if (riscv_has_ext(env, RVH)) {
         env->mideleg |= HS_MODE_INTERRUPTS;
     }
+
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException read_mie(CPURISCVState *env, int csrno,
-                               target_ulong *val)
+static RISCVException rmw_mideleg(CPURISCVState *env, int csrno,
+                                  target_ulong *ret_val,
+                                  target_ulong new_val, target_ulong wr_mask)
 {
-    *val = env->mie;
-    return RISCV_EXCP_NONE;
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_mideleg64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val = rval;
+    }
+
+    return ret;
 }
 
-static RISCVException write_mie(CPURISCVState *env, int csrno,
-                                target_ulong val)
+static RISCVException rmw_midelegh(CPURISCVState *env, int csrno,
+                                   target_ulong *ret_val,
+                                   target_ulong new_val,
+                                   target_ulong wr_mask)
 {
-    env->mie = (env->mie & ~all_ints) | (val & all_ints);
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_mideleg64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val = rval >> 32;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_mie64(CPURISCVState *env, int csrno,
+                                uint64_t *ret_val,
+                                uint64_t new_val, uint64_t wr_mask)
+{
+    uint64_t mask = wr_mask & all_ints;
+
+    if (ret_val) {
+        *ret_val = env->mie;
+    }
+
+    env->mie = (env->mie & ~mask) | (new_val & mask);
+
     if (!riscv_has_ext(env, RVH)) {
-        env->mie &= ~MIP_SGEIP;
+        env->mie &= ~((uint64_t)MIP_SGEIP);
     }
+
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException rmw_mie(CPURISCVState *env, int csrno,
+                              target_ulong *ret_val,
+                              target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_mie64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val = rval;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_mie64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val = rval >> 32;
+    }
+
+    return ret;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -796,17 +899,17 @@ static RISCVException write_mtval(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException rmw_mip(CPURISCVState *env, int csrno,
-                              target_ulong *ret_value,
-                              target_ulong new_value, target_ulong write_mask)
+static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
+                                uint64_t *ret_val,
+                                uint64_t new_val, uint64_t wr_mask)
 {
     RISCVCPU *cpu = env_archcpu(env);
     /* Allow software control of delegable interrupts not claimed by hardware */
-    target_ulong mask = write_mask & delegable_ints & ~env->miclaim;
-    uint32_t gin, old_mip;
+    uint64_t old_mip, mask = wr_mask & delegable_ints & ~env->miclaim;
+    uint32_t gin;
 
     if (mask) {
-        old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
+        old_mip = riscv_cpu_update_mip(cpu, mask, (new_val & mask));
     } else {
         old_mip = env->mip;
     }
@@ -816,13 +919,44 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
         old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
     }
 
-    if (ret_value) {
-        *ret_value = old_mip;
+    if (ret_val) {
+        *ret_val = old_mip;
     }
 
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException rmw_mip(CPURISCVState *env, int csrno,
+                              target_ulong *ret_val,
+                              target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_mip64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val = rval;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_miph(CPURISCVState *env, int csrno,
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_mip64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val = rval >> 32;
+    }
+
+    return ret;
+}
+
 /* Supervisor Trap Setup */
 static RISCVException read_sstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
@@ -842,45 +976,112 @@ static RISCVException write_sstatus(CPURISCVState *env, int csrno,
     return write_mstatus(env, CSR_MSTATUS, newval);
 }
 
-static RISCVException read_vsie(CPURISCVState *env, int csrno,
-                                target_ulong *val)
+static RISCVException rmw_vsie64(CPURISCVState *env, int csrno,
+                                 uint64_t *ret_val,
+                                 uint64_t new_val, uint64_t wr_mask)
 {
-    /* Shift the VS bits to their S bit location in vsie */
-    *val = (env->mie & env->hideleg & VS_MODE_INTERRUPTS) >> 1;
-    return RISCV_EXCP_NONE;
+    RISCVException ret;
+    uint64_t rval, vsbits, mask = env->hideleg & VS_MODE_INTERRUPTS;
+
+    /* Bring VS-level bits to correct position */
+    vsbits = new_val & (VS_MODE_INTERRUPTS >> 1);
+    new_val &= ~(VS_MODE_INTERRUPTS >> 1);
+    new_val |= vsbits << 1;
+    vsbits = wr_mask & (VS_MODE_INTERRUPTS >> 1);
+    wr_mask &= ~(VS_MODE_INTERRUPTS >> 1);
+    wr_mask |= vsbits << 1;
+
+    ret = rmw_mie64(env, csrno, &rval, new_val, wr_mask & mask);
+    if (ret_val) {
+        rval &= mask;
+        vsbits = rval & VS_MODE_INTERRUPTS;
+        rval &= ~VS_MODE_INTERRUPTS;
+        *ret_val = rval | (vsbits >> 1);
+    }
+
+    return ret;
 }
 
-static RISCVException read_sie(CPURISCVState *env, int csrno,
-                               target_ulong *val)
+static RISCVException rmw_vsie(CPURISCVState *env, int csrno,
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mask)
 {
-    if (riscv_cpu_virt_enabled(env)) {
-        read_vsie(env, CSR_VSIE, val);
-    } else {
-        *val = env->mie & env->mideleg;
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_vsie64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val = rval;
     }
-    return RISCV_EXCP_NONE;
+
+    return ret;
 }
 
-static RISCVException write_vsie(CPURISCVState *env, int csrno,
-                                 target_ulong val)
+static RISCVException rmw_vsieh(CPURISCVState *env, int csrno,
+                                target_ulong *ret_val,
+                                target_ulong new_val, target_ulong wr_mask)
 {
-    /* Shift the S bits to their VS bit location in mie */
-    target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) |
-                          ((val << 1) & env->hideleg & VS_MODE_INTERRUPTS);
-    return write_mie(env, CSR_MIE, newval);
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_vsie64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val = rval >> 32;
+    }
+
+    return ret;
 }
 
-static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
+                                uint64_t *ret_val,
+                                uint64_t new_val, uint64_t wr_mask)
 {
+    RISCVException ret;
+    uint64_t mask = env->mideleg & S_MODE_INTERRUPTS;
+
     if (riscv_cpu_virt_enabled(env)) {
-        write_vsie(env, CSR_VSIE, val);
+        ret = rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
     } else {
-        target_ulong newval = (env->mie & ~S_MODE_INTERRUPTS) |
-                              (val & S_MODE_INTERRUPTS);
-        write_mie(env, CSR_MIE, newval);
+        ret = rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
     }
 
-    return RISCV_EXCP_NONE;
+    if (ret_val) {
+        *ret_val &= mask;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_sie(CPURISCVState *env, int csrno,
+                              target_ulong *ret_val,
+                              target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_sie64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val = rval;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_sieh(CPURISCVState *env, int csrno,
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_sie64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val = rval >> 32;
+    }
+
+    return ret;
 }
 
 static RISCVException read_stvec(CPURISCVState *env, int csrno,
@@ -973,38 +1174,111 @@ static RISCVException write_stval(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException rmw_vsip64(CPURISCVState *env, int csrno,
+                                 uint64_t *ret_val,
+                                 uint64_t new_val, uint64_t wr_mask)
+{
+    RISCVException ret;
+    uint64_t rval, vsbits, mask = env->hideleg & vsip_writable_mask;
+
+    /* Bring VS-level bits to correct position */
+    vsbits = new_val & (VS_MODE_INTERRUPTS >> 1);
+    new_val &= ~(VS_MODE_INTERRUPTS >> 1);
+    new_val |= vsbits << 1;
+    vsbits = wr_mask & (VS_MODE_INTERRUPTS >> 1);
+    wr_mask &= ~(VS_MODE_INTERRUPTS >> 1);
+    wr_mask |= vsbits << 1;
+
+    ret = rmw_mip64(env, csrno, &rval, new_val, wr_mask & mask);
+    if (ret_val) {
+        rval &= mask;
+        vsbits = rval & VS_MODE_INTERRUPTS;
+        rval &= ~VS_MODE_INTERRUPTS;
+        *ret_val = rval | (vsbits >> 1);
+    }
+
+    return ret;
+}
+
 static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
-                               target_ulong *ret_value,
-                               target_ulong new_value, target_ulong write_mask)
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mask)
 {
-    /* Shift the S bits to their VS bit location in mip */
-    int ret = rmw_mip(env, csrno, ret_value, new_value << 1,
-                      (write_mask << 1) & vsip_writable_mask & env->hideleg);
+    uint64_t rval;
+    RISCVException ret;
 
-    if (ret_value) {
-        *ret_value &= VS_MODE_INTERRUPTS;
-        /* Shift the VS bits to their S bit location in vsip */
-        *ret_value >>= 1;
+    ret = rmw_vsip64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val = rval;
     }
+
     return ret;
 }
 
-static RISCVException rmw_sip(CPURISCVState *env, int csrno,
-                              target_ulong *ret_value,
-                              target_ulong new_value, target_ulong write_mask)
+static RISCVException rmw_vsiph(CPURISCVState *env, int csrno,
+                                target_ulong *ret_val,
+                                target_ulong new_val, target_ulong wr_mask)
 {
-    int ret;
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_vsip64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val = rval >> 32;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
+                                uint64_t *ret_val,
+                                uint64_t new_val, uint64_t wr_mask)
+{
+    RISCVException ret;
+    uint64_t mask = env->mideleg & sip_writable_mask;
 
     if (riscv_cpu_virt_enabled(env)) {
-        ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
+        ret = rmw_vsip64(env, CSR_VSIP, ret_val, new_val, wr_mask);
     } else {
-        ret = rmw_mip(env, csrno, ret_value, new_value,
-                      write_mask & env->mideleg & sip_writable_mask);
+        ret = rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
     }
 
-    if (ret_value) {
-        *ret_value &= env->mideleg & S_MODE_INTERRUPTS;
+    if (ret_val) {
+        *ret_val &= env->mideleg & S_MODE_INTERRUPTS;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_sip(CPURISCVState *env, int csrno,
+                              target_ulong *ret_val,
+                              target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_sip64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val = rval;
     }
+
+    return ret;
+}
+
+static RISCVException rmw_siph(CPURISCVState *env, int csrno,
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_sip64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val = rval >> 32;
+    }
+
     return ret;
 }
 
@@ -1099,30 +1373,94 @@ static RISCVException write_hedeleg(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException read_hideleg(CPURISCVState *env, int csrno,
-                                   target_ulong *val)
+static RISCVException rmw_hideleg64(CPURISCVState *env, int csrno,
+                                    uint64_t *ret_val,
+                                    uint64_t new_val, uint64_t wr_mask)
 {
-    *val = env->hideleg;
+    uint64_t mask = wr_mask & vs_delegable_ints;
+
+    if (ret_val) {
+        *ret_val = env->hideleg & vs_delegable_ints;
+    }
+
+    env->hideleg = (env->hideleg & ~mask) | (new_val & mask);
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException write_hideleg(CPURISCVState *env, int csrno,
-                                    target_ulong val)
+static RISCVException rmw_hideleg(CPURISCVState *env, int csrno,
+                                  target_ulong *ret_val,
+                                  target_ulong new_val, target_ulong wr_mask)
 {
-    env->hideleg = val & vs_delegable_ints;
-    return RISCV_EXCP_NONE;
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_hideleg64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val = rval;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_hidelegh(CPURISCVState *env, int csrno,
+                                   target_ulong *ret_val,
+                                   target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_hideleg64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val = rval >> 32;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_hvip64(CPURISCVState *env, int csrno,
+                                 uint64_t *ret_val,
+                                 uint64_t new_val, uint64_t wr_mask)
+{
+    RISCVException ret;
+
+    ret = rmw_mip64(env, csrno, ret_val, new_val,
+                    wr_mask & hvip_writable_mask);
+    if (ret_val) {
+        *ret_val &= VS_MODE_INTERRUPTS;
+    }
+
+    return ret;
 }
 
 static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
-                               target_ulong *ret_value,
-                               target_ulong new_value, target_ulong write_mask)
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mask)
 {
-    int ret = rmw_mip(env, csrno, ret_value, new_value,
-                      write_mask & hvip_writable_mask);
+    uint64_t rval;
+    RISCVException ret;
 
-    if (ret_value) {
-        *ret_value &= VS_MODE_INTERRUPTS;
+    ret = rmw_hvip64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val = rval;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_hviph(CPURISCVState *env, int csrno,
+                                target_ulong *ret_val,
+                                target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_hvip64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val = rval >> 32;
     }
+
     return ret;
 }
 
@@ -1139,18 +1477,19 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
     return ret;
 }
 
-static RISCVException read_hie(CPURISCVState *env, int csrno,
-                               target_ulong *val)
+static RISCVException rmw_hie(CPURISCVState *env, int csrno,
+                              target_ulong *ret_val,
+                              target_ulong new_val, target_ulong wr_mask)
 {
-    *val = env->mie & HS_MODE_INTERRUPTS;
-    return RISCV_EXCP_NONE;
-}
+    uint64_t rval;
+    RISCVException ret;
 
-static RISCVException write_hie(CPURISCVState *env, int csrno,
-                                target_ulong val)
-{
-    target_ulong newval = (env->mie & ~HS_MODE_INTERRUPTS) | (val & HS_MODE_INTERRUPTS);
-    return write_mie(env, CSR_MIE, newval);
+    ret = rmw_mie64(env, csrno, &rval, new_val, wr_mask & HS_MODE_INTERRUPTS);
+    if (ret_val) {
+        *ret_val = rval & HS_MODE_INTERRUPTS;
+    }
+
+    return ret;
 }
 
 static RISCVException read_hcounteren(CPURISCVState *env, int csrno,
@@ -1870,9 +2209,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Machine Trap Setup */
     [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus     },
     [CSR_MISA]        = { "misa",       any,   read_misa,        write_misa        },
-    [CSR_MIDELEG]     = { "mideleg",    any,   read_mideleg,     write_mideleg     },
+    [CSR_MIDELEG]     = { "mideleg",    any,   NULL,    NULL,    rmw_mideleg       },
     [CSR_MEDELEG]     = { "medeleg",    any,   read_medeleg,     write_medeleg     },
-    [CSR_MIE]         = { "mie",        any,   read_mie,         write_mie         },
+    [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
     [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
     [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
 
@@ -1885,9 +2224,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Machine-Level High-Half CSRs (AIA) */
+    [CSR_MIDELEGH] = { "midelegh", aia_any32, NULL, NULL, rmw_midelegh },
+    [CSR_MIEH]     = { "mieh",     aia_any32, NULL, NULL, rmw_mieh     },
+    [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
+
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus    },
-    [CSR_SIE]        = { "sie",        smode, read_sie,        write_sie        },
+    [CSR_SIE]        = { "sie",        smode, NULL,   NULL,    rmw_sie          },
     [CSR_STVEC]      = { "stvec",      smode, read_stvec,      write_stvec      },
     [CSR_SCOUNTEREN] = { "scounteren", smode, read_scounteren, write_scounteren },
 
@@ -1901,12 +2245,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
+    /* Supervisor-Level High-Half CSRs (AIA) */
+    [CSR_SIEH]       = { "sieh",   aia_smode32, NULL, NULL, rmw_sieh },
+    [CSR_SIPH]       = { "siph",   aia_smode32, NULL, NULL, rmw_siph },
+
     [CSR_HSTATUS]     = { "hstatus",     hmode,   read_hstatus,     write_hstatus     },
     [CSR_HEDELEG]     = { "hedeleg",     hmode,   read_hedeleg,     write_hedeleg     },
-    [CSR_HIDELEG]     = { "hideleg",     hmode,   read_hideleg,     write_hideleg     },
+    [CSR_HIDELEG]     = { "hideleg",     hmode,   NULL,   NULL,     rmw_hideleg       },
     [CSR_HVIP]        = { "hvip",        hmode,   NULL,   NULL,     rmw_hvip          },
     [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,     rmw_hip           },
-    [CSR_HIE]         = { "hie",         hmode,   read_hie,         write_hie         },
+    [CSR_HIE]         = { "hie",         hmode,   NULL,   NULL,     rmw_hie           },
     [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,  write_hcounteren  },
     [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie       },
     [CSR_HTVAL]       = { "htval",       hmode,   read_htval,       write_htval       },
@@ -1918,7 +2266,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
     [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,    write_vsstatus    },
     [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,    rmw_vsip          },
-    [CSR_VSIE]        = { "vsie",        hmode,   read_vsie,        write_vsie        },
+    [CSR_VSIE]        = { "vsie",        hmode,   NULL,    NULL,    rmw_vsie          },
     [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,      write_vstvec      },
     [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch,   write_vsscratch   },
     [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,       write_vsepc       },
@@ -1929,6 +2277,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL2]      = { "mtval2",      hmode,   read_mtval2,      write_mtval2      },
     [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
 
+    /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
+    [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
+    [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL, rmw_hviph },
+    [CSR_VSIEH]       = { "vsieh",       aia_hmode32, NULL, NULL, rmw_vsieh },
+    [CSR_VSIPH]       = { "vsiph",       aia_hmode32, NULL, NULL, rmw_vsiph },
+
     /* Physical Memory Protection */
     [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg },
     [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index cffc444969..44dca84ded 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -84,7 +84,7 @@ static const VMStateDescription vmstate_hyper = {
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL(env.hstatus, RISCVCPU),
         VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
-        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
+        VMSTATE_UINT64(env.hideleg, RISCVCPU),
         VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.htval, RISCVCPU),
         VMSTATE_UINTTL(env.htinst, RISCVCPU),
@@ -194,10 +194,10 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.resetvec, RISCVCPU),
         VMSTATE_UINTTL(env.mhartid, RISCVCPU),
         VMSTATE_UINT64(env.mstatus, RISCVCPU),
-        VMSTATE_UINTTL(env.mip, RISCVCPU),
-        VMSTATE_UINT32(env.miclaim, RISCVCPU),
-        VMSTATE_UINTTL(env.mie, RISCVCPU),
-        VMSTATE_UINTTL(env.mideleg, RISCVCPU),
+        VMSTATE_UINT64(env.mip, RISCVCPU),
+        VMSTATE_UINT64(env.miclaim, RISCVCPU),
+        VMSTATE_UINT64(env.mie, RISCVCPU),
+        VMSTATE_UINT64(env.mideleg, RISCVCPU),
         VMSTATE_UINTTL(env.satp, RISCVCPU),
         VMSTATE_UINTTL(env.stval, RISCVCPU),
         VMSTATE_UINTTL(env.medeleg, RISCVCPU),
-- 
2.25.1


