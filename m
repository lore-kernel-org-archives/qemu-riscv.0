Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meChG-0002tA-0t
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChA-0002oh-SF; Sat, 23 Oct 2021 04:48:04 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCh5-000792-Nm; Sat, 23 Oct 2021 04:48:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978879; x=1666514879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rKP8ERSSBeopz63Qg33Ie7Q4IWAK6FD4XKl/43KmKp4=;
 b=VZqQIdbeT9ODVwyi6p0CUZbnVB1BJkqMqQ17VOvdnke8nr50ggwRZbDi
 VPTerFhs7uKEDb9zNkuSennv3IV30lBWgbCgmv5iLQu+EdUWJOjmtPAzQ
 sNuNMxpINQlnNxSGgIdzBWMZNUT7wnkjyDxsmMUud0t084IPhJe207h2/
 OU9ebRAH0K5/L0H/5R3DEYtkfDLtApNpQlzoWZzdljFlCenRMToZbn7Yx
 8R77qFITllkOimLHLhIYt3twjzmT4znAdN2W3qyIbn10w7mgncdS2DpO1
 /cvqia+Vkvl5J4MVrTVHc7ylMEfLcKjTuNBtnwgtqnVc/UrQxFZ4UWkRz Q==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="295398057"
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:47:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8eIXk9fH1POK8+lxK926VH5IwQg+RG59h7nehLloVIh2jv7CQm5cdfKnFlQ0L+DFYV8NY5rKlQgXBoMh0iIaVZ2k+clETsxBnAE+10kGGwh30HBGxyMaMUEFERWwOjRx0+vyMenzVb1xnHmQvpn+0nm42wKzX7tC/YV6g8sNA3J/5MabgXmPdEk49rktNOMoQat/jxh2nyWBxf36O3jA23FOw+mlxmbMaZnusm6FwaKVOvXNUaq39kCVagNY/Zb+Fpe5YXitd2KAOBfPbrbhGJQ/mztMaQ/h19ZYTSHSO2cwerqqzwMixz5WDmjMg2Ek2fcfKFkaNimmGvEohA5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34+3LCWzxEVgk0mpKaOex72lodu5H+aIGa7Bx1Am4EE=;
 b=VKc0GPkF8zENPAWoGZtqOzCRQPAn6QdFMwPpMXrv1wek86wBsKqiZo07funLpOT/8CI41AzFHgNH6y3dPA40PNzU98/mdZIMEBb17M9tieDpNe/RuGCxKVc4miIKJFPAkCk9Zktv1x2RvBFyYvEVmcTsNRy+EOENKkUd7hAxqLVAyi94he2WEMTGK9/mDuyWu6jp6JQasaX/v03YP/eirR0KrqCc31kzXS8sj3lak4Sq0bdHQAg4oYxKbYSPYtyWZA35QZvOR70PkedqJm0VWN6smG0TyMj7iHqmJQFHbsPCD4e5YL7sWBGTsSRvqRMG2dwILmZn3sCfQdAxN7psJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34+3LCWzxEVgk0mpKaOex72lodu5H+aIGa7Bx1Am4EE=;
 b=btKA5l0xe4/gFA6FmV93uN+0DmN/0fvIuE9TS7wQFtHmnf2TvjyWjJqMTyopkPEvPR/f8gRG41kxNQQ/VCjEKlAwlgQ+ZhEJcugCkJyU4nvQbGO8II6UoYiEA9BA6MTdnOyhTN7THx7rGdG6a94KZCrtlpIO5rLPpsX7I3K/FlM=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7745.namprd04.prod.outlook.com (2603:10b6:5:35a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sat, 23 Oct
 2021 08:47:52 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:47:52 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 10/22] target/riscv: Implement AIA CSRs for 64 local
 interrupts on RV32
Date: Sat, 23 Oct 2021 14:16:26 +0530
Message-Id: <20211023084638.1697057-11-anup.patel@wdc.com>
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
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:47:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7dd575b-13fc-4159-f31e-08d99601cce1
X-MS-TrafficTypeDiagnostic: CO6PR04MB7745:
X-Microsoft-Antispam-PRVS: <CO6PR04MB77456362A7CF380734C735798D819@CO6PR04MB7745.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kBQJ+KPoERWDiJ5drLKlyWYAhLGFvlPeQJO7EeCkdhKbQ9G11H7wrFgEev2Lq22OtlPlEiMYm9G/CAGHfTc7G4Yp9o869maRVqDe2Lj3cdIVwZ6+SWICE+ENkstsy7/PlN5LmV3eadwiSUwxhy3w7bWv7DKELCcPRUz5D5rXdVZHLXXuUtQbB3cQBbeHbfTQCsKm+XvOr8D8j0e/h9aruwC8AIkGDeWXia5V6M3DsdiLqUtmftfrb5ykT+oHEQhPZu5t1DO1hOaYnrsWCpKHw6jZkGRqD6ZtKY/gp5vX1qGOa5uBZiWlEDqzenBsPeH8NkN2LSIcSyRmDSYWRsu8p9BBGwqsaHpdjOLV7er7UJ7I+N92TPnAqiQfbZIaSplLxFvm8UUYyy4bFQhYbeDE1y7iZ9TsSy9nJ+HOyJL+iZ4cCEQl4ZQITiVt1fukLykR9QD70yJ6PuU1QScTNhtEIa98bVM8YCDezprS2xw3Sbf/+iWt2sUGTnVaXNwrxv1BMnnxfYp6w0HjDge7CB+LMWMgE61udR+XT+SB3o7p034NWsU/GqOJYQgLG356eFeJzFJzMylLxdLFluAoax8QbKx5PBLJqF6vi9kRsQZ/BRN12CGen0XKZLoMsM4rFExMLnzJajoSIEhzsUIQvJkWijCy+yxcFl/vKfUSj/drIQMz9eUR23zkphehTZJrXmpjX+9QrUfxfqKXFHZnn7qtOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(110136005)(5660300002)(186003)(1076003)(54906003)(55016002)(316002)(508600001)(8886007)(86362001)(36756003)(956004)(82960400001)(2616005)(83380400001)(26005)(44832011)(8936002)(7696005)(6666004)(66556008)(66476007)(4326008)(30864003)(66946007)(2906002)(38100700002)(38350700002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7hr7Seb5o4HZxIP3ImGAzNNZzgkduWTUTQIxbQbxnaoQGQbUkoa5pAMyceZG?=
 =?us-ascii?Q?gLq78UZmHRcbV7/T9bSKxD8Rb2vHLWnqonL/CruY1LhkZ2eabTlKXJKJe8wB?=
 =?us-ascii?Q?Z9rvbvvQkdnol7ZW62dJebhsERAMjQBM8HfhcNBtENRwgyXgv3HMp7Mdui+J?=
 =?us-ascii?Q?057pnih5aBKsWwYQK0oCQfh7Nkm3ENjYep3sYNs9ClqOFSrkzs8xLugjecF4?=
 =?us-ascii?Q?fGesOy32KDJ1XnY/Xk+sNVMqAEMputgj4dfzIcbH+6D+YkbWqGoQCwXTmHxB?=
 =?us-ascii?Q?7DdL9uRe4fHCNifFRz3g8k2H0GbdxqONnWB7Gi+ncY1FlX8Ywe9+lU35Lfxx?=
 =?us-ascii?Q?j+p3p2DebgKTrrwgrWsXitWNdrVq93EenL2haeUeL21iZgY1Z26C89Jd9js/?=
 =?us-ascii?Q?FnJpqf8M/9/cbxHkLpbE+f6Jb/lIIlzCKG1TNCRaPAPDeIE3SiCWO/Oj8KNR?=
 =?us-ascii?Q?n4dTMiHsVo8GRvQYEEUVPHGWDhMTmk1U2r2mfnZtDiCFENqpdLG3nvmMa2E3?=
 =?us-ascii?Q?vtIiij1JtVkDK1xfhQNc+hyPdjIfvz22Fx6Ih9q6GxUYA1jkwpWGYs/HXgd1?=
 =?us-ascii?Q?PjLFsVCnW2iQ7theak23hLfPGxzJj3r1HLLZkVGG2p24dF7Kl55lYEOYwNLj?=
 =?us-ascii?Q?dtkVlRvJE9KRxqmptD9BSQfqX/8AEumM0SQX84hh71LEMykZhBXY+UoLPvke?=
 =?us-ascii?Q?xGdPRyUQ2lVA1sJ38daTG+PZ70wAWOisirwCda0i/o9V05OKHyTH4tr+/UxA?=
 =?us-ascii?Q?QrBYvuHn4fx7UJsRwMHsDuxAIluwi+cVYxiQ1NSi8qLzIuwdRJ6jH9XbBEid?=
 =?us-ascii?Q?fizgjxeFVX/3JqJckU7n//Dmh07qhwydE44IiKNmvrlt8AB4c0TQS+e+Gd9p?=
 =?us-ascii?Q?Zi86Zul7wD0fj94SelvHMKGHjK2S7W5BUG1AFm0qmyEaYR91Unkp/rsGsKOT?=
 =?us-ascii?Q?OIxdQFNNR5dySj5KCTwLgTwaxHC2pyqO5OZH+/KIMmBZ2LWVEIalEfg8aJsf?=
 =?us-ascii?Q?bVRHk5iUG1yS2p55ReDlNdjfM3no9sopXUGElDMrf0spK8z348pyPU1F3SUY?=
 =?us-ascii?Q?zYXkHf096JSDX8MVjiTLgZUVNB2yKkeVr2hcY6QPlbR04pjZFr41lAyDYh9i?=
 =?us-ascii?Q?gseRVzy59vIQg02XY1T+QDo49BMKFfH0ACPyI12Chu2+IkKDCQpUrHwokmEm?=
 =?us-ascii?Q?8sprVkXfreQKfxbWHC72p4UsmkN+PoY2ahxz7mbUwd/rx6Ng792l+faPpAOc?=
 =?us-ascii?Q?BRgjLfIautmjWQPqZK1qkC3Pku4A5B3ZqMJvOoRocYHWFual7QcdpnSlPktM?=
 =?us-ascii?Q?D8pfpIHdgnAqhcSb4AAg03P/n76SHYTcv+D/kPhyoXUyhtsFihBt6GRGA9vN?=
 =?us-ascii?Q?mp4LlOxtXzl0qGPGLhVx0FnR3eXzc07UFDDe5dL9HvoD/opQ868vWzEHEqun?=
 =?us-ascii?Q?jyTZnBPS8KevEJ/uhvThHr3XaV8olGmi6rHtuPH1d7IedKt8FOkIQRg986ou?=
 =?us-ascii?Q?nsRMUgXbUmY+0vfrrnuIocVW72B61lk8gnqVzPV3A7pXFP2UpsFgIbVGXpYd?=
 =?us-ascii?Q?/kQcDeHTk/dIMf5h85zL4zWSlKBvW5upUaa33vxEx0cWhBymyRtgqyhuxhMx?=
 =?us-ascii?Q?YNaorqTd8dq+nWutEWGvltg=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7dd575b-13fc-4159-f31e-08d99601cce1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:47:52.7792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AqyGsNRaHgZ0BSHDMaeXPZ1gr39Tmn4tBdZE8FkE+Brt5tuZ2SVDGzO6Ix9cgdNoJ6dXV7APtm3VyRs2wUd9YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7745
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
X-List-Received-Date: Sat, 23 Oct 2021 08:48:07 -0000

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
index c47e57efc8..718a95e864 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -159,12 +159,12 @@ struct CPURISCVState {
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
@@ -186,7 +186,7 @@ struct CPURISCVState {
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
-    target_ulong hideleg;
+    uint64_t hideleg;
     target_ulong hcounteren;
     target_ulong htval;
     target_ulong htinst;
@@ -399,8 +399,8 @@ void riscv_cpu_list(void);
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
index 73ebce1efd..416b11f85c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -506,7 +506,7 @@ bool riscv_cpu_two_stage_lookup(int mmu_idx)
     return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
 }
 
-int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
 {
     CPURISCVState *env = &cpu->env;
     if (env->miclaim & interrupts) {
@@ -517,11 +517,11 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
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
@@ -1244,7 +1244,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
      */
     bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
     target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
-    target_ulong deleg = async ? env->mideleg : env->medeleg;
+    uint64_t deleg = async ? env->mideleg : env->medeleg;
     bool write_tval = false;
     target_ulong tval = 0;
     target_ulong htval = 0;
@@ -1311,7 +1311,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
         /* handle the trap in S-mode */
         if (riscv_has_ext(env, RVH)) {
-            target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
+            uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
 
             if (env->two_stage_lookup && write_tval) {
                 /*
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 7ff285282b..3a7d89ac34 100644
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
@@ -192,6 +219,15 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
 
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
@@ -405,15 +441,15 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 
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
@@ -662,40 +698,107 @@ static RISCVException write_medeleg(CPURISCVState *env, int csrno,
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
@@ -786,17 +889,17 @@ static RISCVException write_mtval(CPURISCVState *env, int csrno,
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
@@ -806,13 +909,44 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
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
@@ -832,45 +966,112 @@ static RISCVException write_sstatus(CPURISCVState *env, int csrno,
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
@@ -963,38 +1164,111 @@ static RISCVException write_stval(CPURISCVState *env, int csrno,
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
+        ret = rmw_vsip64(env, CSR_VSIE, ret_val, new_val, wr_mask);
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
 
@@ -1089,30 +1363,94 @@ static RISCVException write_hedeleg(CPURISCVState *env, int csrno,
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
 
@@ -1129,18 +1467,19 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
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
@@ -1598,9 +1937,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
 
@@ -1613,9 +1952,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
 
@@ -1629,12 +1973,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -1646,7 +1994,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
     [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,    write_vsstatus    },
     [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,    rmw_vsip          },
-    [CSR_VSIE]        = { "vsie",        hmode,   read_vsie,        write_vsie        },
+    [CSR_VSIE]        = { "vsie",        hmode,   NULL,    NULL,    rmw_vsie          },
     [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,      write_vstvec      },
     [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch,   write_vsscratch   },
     [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,       write_vsepc       },
@@ -1657,6 +2005,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
index a7102220b6..7356d70be6 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -108,7 +108,7 @@ static const VMStateDescription vmstate_hyper = {
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL(env.hstatus, RISCVCPU),
         VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
-        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
+        VMSTATE_UINT64(env.hideleg, RISCVCPU),
         VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.htval, RISCVCPU),
         VMSTATE_UINTTL(env.htinst, RISCVCPU),
@@ -168,10 +168,10 @@ const VMStateDescription vmstate_riscv_cpu = {
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


