Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meChF-0002rd-IS
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCh4-0002lj-PQ; Sat, 23 Oct 2021 04:47:59 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:19442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meCh0-00076L-RJ; Sat, 23 Oct 2021 04:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978875; x=1666514875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hOBcfWOZyMxNSEnsrYeNAdCfPEAYfe/PEWI99yI9jf4=;
 b=K2kpEW4W3PYt7V2U53rtWkCFu9P5700grXwUMFKdiamgwD1dzGCz1aRH
 rgFUbZh0qOnJLHwbONrhxzwl34S6QG9jBZG0kpzriAZH2KMrijt4AhkG8
 hYQ1BCe84jip8W9SQaxfCm6WGYrLivOV9E8rmQdFF8VNAfTei39gxVyaE
 Qy5ULiZuvjPdqo8LJT3Ma6utLL+gIpYKkbK1baFN+LVbU8H84A4EsaTAN
 rZBrnkw6Rl1SnqsN1eNWT5OTQ8BPRXIkl51i6zbYziMWHK9Z8jlU6WHCl
 gnqEUjpqTItlklI5nm1UnyI2GGmVyF/8HZ59WhUKLgN16bu0xv7Plk1OB Q==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="184603444"
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:47:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRwP4bx8sObvjqBYsrWgww9VEtQgF/DBWRYCjDsffHeOOVV607CmoF6L0VmKxDRzqOdbLfS64veZ+L4ERVa0ayr4ij14At7abhQsoHzxcHS0TlnKglZY4MZUW8MWJvdx7188jUSMHSRhEGL5fmdASPocM1gV9kFO2zbVyCtkYVONWlA+LYjKWsuJrvAo6yVP41n2i+EcgQ8tnz3OvntkU1/kvmO5mppudFCpThzH160SO4jg1wfqnbRjn/JyvrJFU0e6uyhmrd8YPu6YYmVQOwC7kQNGZoMq6rF5OV0ScqhFfGGUH5TTLIiREn9bftY8sVjQ5NeA0enjH8IbB2VcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7mpUD20rxUSkfLTal+eQ9Ny345KnghaauwRlhj2gsg=;
 b=hBVDo6SYdJ2VSkZ1RNRXMO+bFzFMDn+rPy5RwqQfTCQbLepdt1FZAe/RcQagMgKw0nFXZpu7a5zEl3/4TDcM7Y+FYNEhJr+0ajQ1EElL/KPSnW08lKJu05FYypEA/Eh/0zcC2cG5h2wqIve06aGfgGV7Ux5VISZIQHqbtGougolqlrNJ/C27HNyc68BVI9WP5LPmt9LvwXmyItvuz7s/N4PYJ3PYQYJdjgblKG5DZg4OGrWTNlH+dZcFyhFVanPhRlV0G04kYCx25s6/7TaAC95E3ms93e/lXmjQrCvyENc6+iA18KxmAym151uDcaZdpLgJP4Fcde3Say+ba/FbDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7mpUD20rxUSkfLTal+eQ9Ny345KnghaauwRlhj2gsg=;
 b=C4Gn1hclR8EJ/VIaLeIbDOQs8t/n3xRX59DGxCF4lA57UTvbmXraPmDCq56HbltQPoa3ZPweCoOMaUOPiZ4KOZjivvFBj4+lWQcun86pCW7Fw1m9l+EoOU5ek5Ka7IU3YjcE+1iWINB2IlHHEpCiSdwusWxxehOuMOZdzxnSvq0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8348.namprd04.prod.outlook.com (2603:10b6:303:137::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Sat, 23 Oct
 2021 08:47:49 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:47:49 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v3 09/22] target/riscv: Implement AIA local interrupt
 priorities
Date: Sat, 23 Oct 2021 14:16:25 +0530
Message-Id: <20211023084638.1697057-10-anup.patel@wdc.com>
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
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:47:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef1c6467-1cc9-43fa-1ff0-08d99601cb0d
X-MS-TrafficTypeDiagnostic: CO6PR04MB8348:
X-Microsoft-Antispam-PRVS: <CO6PR04MB8348422678481BB0113033848D819@CO6PR04MB8348.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JcMrodStuGD6pY7hgjqmM3E5GWNj07/F7p3GLEZRvfzTSSeiN5Wwfg5fhUzy+GefGgPEjfn4Fe8vK/PlM9ifqhMcaiHeAVOv7/kcrp1ESTfuSVJ8ivudxABdXlY2LJ1U5npGmtxxSz2SCu8hD8Q+tCSh6dxu8EmV9SkthouTyfq1I8GwZ1wDLpWD3wUhJY3PsYrfZv/LhGPU70A6Wx7HMfh6qIJhTkxBlpwQK9yBk78SwTIijsz+T3n0OAvnLy7aav7u/apHg8QRgXyfHGHTG9ejvAHAK9pOrwLbAeZ1dTiRHxAor3dX9S2DpzsZcReIQVkQgm1apt4hGpIyqYmn6Uz53Gs0agDl/Ckvtm8zqEa6+iQn1TuqL/BDBr5NmTC+eiD0XxP1jaCHaNDx9VqkT9u7TQ6649MsJg2vYd9Pbzepjw8/p3RJPFx7ibAdM04oSo9Upm86Dj4Zj3FoO7mC4fHCfz33MyD8hnN3dybh4Dqlc7ZtV9aG+ow70hKyYjF+nzeelTTfPDOAZj4EgclDxc70lGG6WOsbbreQhqzDWNJS/PvJf24vmNSOgXQ3JOQURiG1a6Q3PF/uDp7ErO/0n5agCizS3ByF29I0RkfSDt/P9iRgKx2JEWAD9J5y4I9HsISMFtKOyo9cllp25LHz1ab2lyE0os/4SjORekuEZ1MLqNcKBfQ5BB0zyi2SAbzZdHgpopqpQqE2vTeqkYYVpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(186003)(55016002)(36756003)(110136005)(2906002)(5660300002)(44832011)(52116002)(316002)(54906003)(508600001)(26005)(7696005)(956004)(2616005)(83380400001)(82960400001)(66556008)(66946007)(8886007)(66476007)(30864003)(6666004)(1076003)(38350700002)(8676002)(4326008)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3YKJBN7asQRI6NgaxOuiQHGQ/95eMMFJ8NIe5DH5pzJkh6n9VUMQYTdH6nyN?=
 =?us-ascii?Q?ArWtPl5oOGTXAMWQBKxdwTDZvvGbHYJ3wRRx3U4T19/5zD/aPIgkYOkfPsOr?=
 =?us-ascii?Q?2M7r6IUfo1doqgOWl/EeTSxXl9YlbKhPA47HvygX7P8siQ3SoPxxGbICRS0o?=
 =?us-ascii?Q?h6PM4oK3+aBX3ql5T1j/US2Hntvy5nL+FY0NVhzBbP4gvnL5b0rCGhcGWBhj?=
 =?us-ascii?Q?AmxbO/8zPyPWlZPTamed2m0cprMbFEgIMtTmCuoPrDNfJ6kuZpkUKmkOzueX?=
 =?us-ascii?Q?ykWn8t6RM3xvtII32chQjsCCI/vhStT7hTUqP++l/RUNgfDNaqU/2fkOJUTd?=
 =?us-ascii?Q?JYCqzKTVje/EbSD+uG2XmaS8YmlWsVsqlIGC8d5em+/I60jwItM+a3w9qYaL?=
 =?us-ascii?Q?1s14enaKmyPhxdtB6w4tjjMhHA8I2nKL08hA9ut3UcXPDdACSjAfPDZj8Ll7?=
 =?us-ascii?Q?5/3IABgX4jAUV68SPmTdTk7CjFDuEylbL+a21efzLJgziQh9yRmet3fBxStI?=
 =?us-ascii?Q?ELivq7BhdoydxstFxXJa/dO+YpxZoAN281oeUu4jmo9je5NwK9WDLiX+KjCG?=
 =?us-ascii?Q?NQ5zQDbGUZ/v9jdENpb3QzHtD7cDVEVz17sJ+ak+JLSqJKnYPZ8E4V1yfkg5?=
 =?us-ascii?Q?wXoQEBNnSbJOBAo/nQ/z77jVLG2GQhM4ojbbuV0zXhop645l3q2xB5TGOlpY?=
 =?us-ascii?Q?4p3WYC51wW324V8Y6Jfk0nhvZHUy1NkiGaTjgEIxLgpDDoq4Ig8LkzFJJZJA?=
 =?us-ascii?Q?WMRtvMrU9hMcSXVB+DJlJfW+Sk+uH87kw3geQeA3k8BcUlareWBYTut2t+oZ?=
 =?us-ascii?Q?GJl5TZvnRbMwFp89PyPWHFOwrB3YrpwnKQrYuzy0hTzQNMNBcG1RIYHj1B0I?=
 =?us-ascii?Q?Kgiu1j3ycALL3i4pqgMzzN2BWIlqsFc+R7nKp18R+ZGK1Q0k+YnW2E5/1Blk?=
 =?us-ascii?Q?+mp5bbSoKBPXJfc62Mn7G++5t4qhfPZcfW7/7aANhcGMjps6vTAJr0iJ/SAH?=
 =?us-ascii?Q?xNBOu89qNxq5gwayy4DHEdWaJqM/JQywKsMyDuAiuhmMO+ndQo6Gr9/Rpqo1?=
 =?us-ascii?Q?i8AHZIl1pU8ZmTqf7uMn4o1MRFIWgG4nRPjOReWZkc+J4Zrc4yYY5fofcRfS?=
 =?us-ascii?Q?IRpFG4zYXkfViukV6idpfEpYRwgwAWHDUlx2zYT5tDAxpAHlqyA1Jv5ZjcND?=
 =?us-ascii?Q?sLHGCd2h02VHwoH937bUKPKWWUVNA0Ex19x0TwmsAtqjVBIvOoXrpdRqLj9J?=
 =?us-ascii?Q?/M0cXNjiZdEzRFP9l8TZS5+4om6hMysKH2uaiBJ3885C32SrrLra5aKhCCOO?=
 =?us-ascii?Q?0eFHhsVaztMve6ZVRSDjiY0xnj0wvxMpfB2KdPY1pt4XM58fkKVBS08MDMgd?=
 =?us-ascii?Q?Gvl42kTslHYTeMX/DVV1Db9fjLeVnHdCkvcTElMngjr91CGleknN2HL7GOFQ?=
 =?us-ascii?Q?o1aDVdyP7gzzijF1Jn6fvX6ueuHdiyZDosKhq0JteuGUmvXll0a6AkOzhUUI?=
 =?us-ascii?Q?ZC+qNL8AVJc+qo8foqxSWwqE9CW75Na1ptKdfkglGYjl84X4zvohA/5Cz28N?=
 =?us-ascii?Q?N9j2K/SHmp5ZZwAfHHiWQjCPJy5f6Y/whSr7+AryHI8Iq1rojFyJaoAOFzrE?=
 =?us-ascii?Q?Qyh94sH2T+y4SBxx+MWTQ+4=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1c6467-1cc9-43fa-1ff0-08d99601cb0d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:47:49.6649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wfvz2KEgovu1qEetjNZFU/GEX8Cbym81tYQwpUtlx1mIVD3BYfh/NXv3OyXNdgzGnlf7+AJQR4rgueukw+ISvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8348
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=92346df24=Anup.Patel@wdc.com; helo=esa6.hgst.iphmx.com
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
X-List-Received-Date: Sat, 23 Oct 2021 08:47:59 -0000

The AIA spec defines programmable 8-bit priority for each local interrupt
at M-level, S-level and VS-level so we extend local interrupt processing
to consider AIA interrupt priorities. The AIA CSRs which help software
configure local interrupt priorities will be added by subsequent patches.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.c        |  19 +++
 target/riscv/cpu.h        |  12 ++
 target/riscv/cpu_helper.c | 241 +++++++++++++++++++++++++++++++++-----
 target/riscv/machine.c    |   3 +
 4 files changed, 245 insertions(+), 30 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 69d6b5eb36..0006989c39 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -341,6 +341,10 @@ void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
 
 static void riscv_cpu_reset(DeviceState *dev)
 {
+#ifndef CONFIG_USER_ONLY
+    uint8_t iprio;
+    int i, irq, rdzero;
+#endif
     CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(cs);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
@@ -363,6 +367,21 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->miclaim = MIP_SGEIP;
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
+
+    /* Initialized default priorities of local interrupts. */
+    for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
+        iprio = riscv_cpu_default_priority(i);
+        env->miprio[i] = (i == IRQ_M_EXT) ? 0 : iprio;
+        env->siprio[i] = (i == IRQ_S_EXT) ? 0 : iprio;
+        env->hviprio[i] = 0;
+    }
+    i = 0;
+    while (!riscv_cpu_hviprio_index2irq(i, &irq, &rdzero)) {
+        if (!rdzero) {
+            env->hviprio[irq] = env->miprio[irq];
+        }
+        i++;
+    }
 #endif
     cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ef4298dc69..c47e57efc8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -179,6 +179,10 @@ struct CPURISCVState {
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
 
+    /* Machine and Supervisor interrupt priorities */
+    uint8_t miprio[64];
+    uint8_t siprio[64];
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -191,6 +195,9 @@ struct CPURISCVState {
     target_ulong hgeip;
     uint64_t htimedelta;
 
+    /* Hypervisor controlled virtual interrupt priorities */
+    uint8_t hviprio[64];
+
     /* Virtual CSRs */
     /*
      * For RV32 this is 32-bit vsstatus and 32-bit vsstatush.
@@ -357,6 +364,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, void *opaque);
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
+uint8_t riscv_cpu_default_priority(int irq);
+int riscv_cpu_mirq_pending(CPURISCVState *env);
+int riscv_cpu_sirq_pending(CPURISCVState *env);
+int riscv_cpu_vsirq_pending(CPURISCVState *env);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
 target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
 void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d70def1da8..73ebce1efd 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -115,47 +115,228 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 }
 
 #ifndef CONFIG_USER_ONLY
+
+/*
+ * The HS-mode is allowed to configure priority only for the
+ * following VS-mode local interrupts:
+ *
+ * 0  (Reserved interrupt, reads as zero)
+ * 1  Supervisor software interrupt
+ * 4  (Reserved interrupt, reads as zero)
+ * 5  Supervisor timer interrupt
+ * 8  (Reserved interrupt, reads as zero)
+ * 13 (Reserved interrupt)
+ * 14 "
+ * 15 "
+ * 16 "
+ * 18 Debug/trace interrupt
+ * 20 (Reserved interrupt)
+ * 22 "
+ * 24 "
+ * 26 "
+ * 28 "
+ * 30 (Reserved for standard reporting of bus or system errors)
+ */
+
+static int hviprio_index2irq[] =
+    { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 };
+static int hviprio_index2rdzero[] =
+    { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
+
+int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero)
+{
+    if (index < 0 || ARRAY_SIZE(hviprio_index2irq) <= index) {
+        return -EINVAL;
+    }
+
+    if (out_irq) {
+        *out_irq = hviprio_index2irq[index];
+    }
+
+    if (out_rdzero) {
+        *out_rdzero = hviprio_index2rdzero[index];
+    }
+
+    return 0;
+}
+
+uint8_t riscv_cpu_default_priority(int irq)
+{
+    int u, l;
+    uint8_t iprio = IPRIO_MMAXIPRIO;
+
+    if (irq < 0 || irq > 63) {
+        return iprio;
+    }
+
+    /*
+     * Default priorities of local interrupts are defined in the
+     * RISC-V Advanced Interrupt Architecture specification.
+     *
+     * ----------------------------------------------------------------
+     *  Default  |
+     *  Priority | Major Interrupt Numbers
+     * ----------------------------------------------------------------
+     *  Highest  | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60 (3c),
+     *           | 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56 (38),
+     *           | 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52 (34),
+     *           | 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (30)
+     *           |
+     *           | 11 (0b),  3 (03),  7 (07)
+     *           |  9 (09),  1 (01),  5 (05)
+     *           | 12 (0c)
+     *           | 10 (0a),  2 (02),  6 (06)
+     *           |
+     *           | 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44 (2c),
+     *           | 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40 (28),
+     *           | 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36 (24),
+     *  Lowest   | 35 (23), 34 (22), 17 (11), 16 (10), 33 (21), 32 (20)
+     * ----------------------------------------------------------------
+     */
+
+    u = IPRIO_DEFAULT_U(irq);
+    l = IPRIO_DEFAULT_L(irq);
+    if (u == 0) {
+        if (irq == IRQ_VS_EXT || irq == IRQ_VS_TIMER ||
+            irq == IRQ_VS_SOFT) {
+            iprio = IPRIO_DEFAULT_VS;
+        } else if (irq == IRQ_S_GEXT) {
+            iprio = IPRIO_DEFAULT_SGEXT;
+        } else if (irq == IRQ_S_EXT || irq == IRQ_S_TIMER ||
+                   irq == IRQ_S_SOFT) {
+            iprio = IPRIO_DEFAULT_S;
+        } else if (irq == IRQ_M_EXT || irq == IRQ_M_TIMER ||
+                   irq == IRQ_M_SOFT) {
+            iprio = IPRIO_DEFAULT_M;
+        } else {
+            iprio = IPRIO_DEFAULT_VS;
+        }
+    } else if (u == 1) {
+        if (l < 8) {
+            iprio = IPRIO_DEFAULT_16_23(irq);
+        } else {
+            iprio = IPRIO_DEFAULT_24_31(irq);
+        }
+    } else if (u == 2) {
+        iprio = IPRIO_DEFAULT_32_47(irq);
+    } else if (u == 3) {
+        iprio = IPRIO_DEFAULT_48_63(irq);
+    }
+
+    return iprio;
+}
+
+static int riscv_cpu_pending_to_irq(CPURISCVState *env,
+                                    uint64_t pending, uint8_t *iprio)
+{
+    int irq, best_irq = RISCV_EXCP_NONE;
+    unsigned int prio, best_prio = UINT_MAX;
+
+    if (!pending) {
+        return RISCV_EXCP_NONE;
+    }
+
+    irq = ctz64(pending);
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return irq;
+    }
+
+    pending = pending >> irq;
+    while (pending) {
+        prio = iprio[irq];
+        if (!prio) {
+            prio = (riscv_cpu_default_priority(irq) < IPRIO_DEFAULT_M) ?
+                   1 : IPRIO_MMAXIPRIO;
+        }
+        if ((pending & 0x1) && (prio < best_prio)) {
+            best_irq = irq;
+            best_prio = prio;
+        }
+        irq++;
+        pending = pending >> 1;
+    }
+
+    return best_irq;
+}
+
+static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
+{
+    uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
+    uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+
+    return (env->mip | vsgein) & env->mie;
+}
+
+int riscv_cpu_mirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs = riscv_cpu_all_pending(env) & ~env->mideleg &
+                    ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+
+    return riscv_cpu_pending_to_irq(env, irqs, env->miprio);
+}
+
+int riscv_cpu_sirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg &
+                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+
+    return riscv_cpu_pending_to_irq(env, irqs, env->siprio);
+}
+
+int riscv_cpu_vsirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg &
+                    (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+
+    return riscv_cpu_pending_to_irq(env, irqs >> 1, env->hviprio);
+}
+
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
-    target_ulong irqs;
-
-    target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
-    target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
-    target_ulong hs_mstatus_sie = get_field(env->mstatus_hs, MSTATUS_SIE);
-
-    target_ulong pending = env->mip & env->mie &
-                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
-    target_ulong vsgemask =
-                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEIN);
-    target_ulong vsgein = (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
-    target_ulong vspending = ((env->mip | vsgein) & env->mie &
-                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
-
-    target_ulong mie    = env->priv < PRV_M ||
-                          (env->priv == PRV_M && mstatus_mie);
-    target_ulong sie    = env->priv < PRV_S ||
-                          (env->priv == PRV_S && mstatus_sie);
-    target_ulong hs_sie = env->priv < PRV_S ||
-                          (env->priv == PRV_S && hs_mstatus_sie);
+    int virq;
+    uint64_t irqs, pending, mie, sie, vsie;
 
+    /* Determine interrupt enable state of all privilege modes */
     if (riscv_cpu_virt_enabled(env)) {
-        target_ulong pending_hs_irq = pending & -hs_sie;
+        mie = 1;
+        sie = 1;
+        vsie = (env->priv < PRV_S) ||
+               (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_SIE));
+    } else {
+        mie = (env->priv < PRV_M) ||
+              (env->priv == PRV_M && get_field(env->mstatus, MSTATUS_MIE));
+        sie = (env->priv < PRV_S) ||
+              (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_SIE));
+        vsie = 0;
+    }
 
-        if (pending_hs_irq) {
-            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
-            return ctz64(pending_hs_irq);
-        }
+    /* Determine all pending interrupts */
+    pending = riscv_cpu_all_pending(env);
 
-        pending = vspending;
+    /* Check M-mode interrupts */
+    irqs = pending & ~env->mideleg & -mie &
+                ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+    if (irqs) {
+        return riscv_cpu_pending_to_irq(env, irqs, env->miprio);
     }
 
-    irqs = (pending & ~env->mideleg & -mie) | (pending &  env->mideleg & -sie);
+    /* Check HS-mode interrupts */
+    irqs = pending & env->mideleg & -sie &
+                ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+    if (irqs) {
+        return riscv_cpu_pending_to_irq(env, irqs, env->siprio);
+    }
 
+    /* Check VS-mode interrupts */
+    irqs = pending & env->hideleg & -vsie &
+                (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
     if (irqs) {
-        return ctz64(irqs); /* since non-zero */
-    } else {
-        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
+        virq = riscv_cpu_pending_to_irq(env, irqs >> 1, env->hviprio);
+        return (virq <= 0) ? virq : virq + 1;
     }
+
+    /* Indicate no pending interrupt */
+    return RISCV_EXCP_NONE;
 }
 
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index fe99ec7304..a7102220b6 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -116,6 +116,7 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.hgeie, RISCVCPU),
         VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
+        VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
 
         VMSTATE_UINT64(env.vsstatus, RISCVCPU),
         VMSTATE_UINTTL(env.vstvec, RISCVCPU),
@@ -147,6 +148,8 @@ const VMStateDescription vmstate_riscv_cpu = {
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
+        VMSTATE_UINT8_ARRAY(env.miprio, RISCVCPU, 64),
+        VMSTATE_UINT8_ARRAY(env.siprio, RISCVCPU, 64),
         VMSTATE_UINTTL(env.pc, RISCVCPU),
         VMSTATE_UINTTL(env.load_res, RISCVCPU),
         VMSTATE_UINTTL(env.load_val, RISCVCPU),
-- 
2.25.1


