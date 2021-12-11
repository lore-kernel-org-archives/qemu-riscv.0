Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvts8-00056W-Qg
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvts6-0004zw-Ua; Fri, 10 Dec 2021 23:20:30 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:26480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvts4-0001gi-12; Fri, 10 Dec 2021 23:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196427; x=1670732427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3MjoCe6nmpaxlAmJOJ2UGH5e6XF9Ni/WdjG4Jy6qh1g=;
 b=ZjOc+oUR8ibFgqNR50wdonBVcViIoFniv0AWFrQV3s8LRpB0MyyFPE3w
 NcfRMHx+TsMezk+8PMBFXiEb8OQxj58AeUCtyEJh1NWgr7KamPb5EAP65
 Jh827i6PSKHaD2NAidrU2lYuiqb/nB1ERixmZszxBjUhh2b0xtpNksrm5
 j4oz+Dus7Dva6mleJtzq7+5c8VDqP5++aUC/TCt49eX0dgNOPSRZ+p3JN
 B+cwQzHlrE2nzCY1wMgZTkoV72vVgZD4m932ImLaQ3GDaVjLCnUQ8/1K2
 dBOgwmwfDf9cfNmYa1NhyVBYVTRr6dKHdghUw7YqKsFDfmlbG1jv/69L5 Q==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="187989932"
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrd/EWuQ6qKHCLUbNgXL+8AKQj5pm826Vb2QYZNOhBd8EyUL0qpYFafQkUmZeYhqsHzmlk+YrxFZGzcOoYrcbtCtPoSQvrw0tSkUHipiG6QLlTqFDIXkFTtYc2CucYM3K63ZoZNOGEx12ArCcc6GmlY8J7jngBMn2zplwq5hq/aZ9lKKxGbITLYqXx1/1nyWqWxiep42KDtvPqbJqwRbadHsNRkO9y2hOa+iCU7Ac/XSZZHY9I5hqHI5VnRHykfT+j/hG1OqDxSb1oYTP4miWWSjxBfDzgRKCr1Yjkq12qFiX4FREHDIi4kmj696qTmn6fPSfk3HqO1YDOe7IsGZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLdA7dRrGGUg1CGXDzpntXzrADvAVNpXUAZ1XSnMwm4=;
 b=iWvSZObXn23391ZpIDAyk6reZNQ46WYChi0kJSMf2JtvUfsxpxYkcx9+bxmT7nw+iTFZwqToQgSPRll/oklT3TicjLLF+Zz0zz9f/Fw1gQIVZ27ek3nQSIY5xAsj9DDv5hz6PYuq0hqHBg91Ao6ec57HdesPNNFaeoDN2iLHEXVgxAkRWJmR70TXZvTGjinVMxtD9XrIYbkxPFm7Awbl698FgRLsLCs2qZt6ogHulaTJErdRYA7N7/DmAVC3iiLnn1WZnrQAuJbMGShMZsUZP7yYJ2uHxEIR2xulpz5kqCDvuzGD/0D2B0CNJGwcyVjVF5M9YUdr0kOOwL6a6TUyGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLdA7dRrGGUg1CGXDzpntXzrADvAVNpXUAZ1XSnMwm4=;
 b=C+aOZcDJYyB65gIZ6Grsv+YQQ5jxJlyArQl+otVuTVpzFtvLDFyKM1EvgWR8fTifNKFeKK9X3OBE/VfNHB2uQSrFF+3aZspDCLlM0o+7DzqYE7fgnAD627L8j7s4aZ7bzXWbNpInYyJfHV4K3PGmsLeRumw6RZqJeG7/zugHXBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:20:24 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:24 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 09/23] target/riscv: Implement AIA local interrupt
 priorities
Date: Sat, 11 Dec 2021 09:49:03 +0530
Message-Id: <20211211041917.135345-10-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: c9ec7b25-0450-4045-7946-08d9bc5d8d60
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB82682BB4C3EAB9FA67B68A318D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ex4pmRwc8nUIo+7X/SOBCpiQvRyPIpmA3njsnF04J1GwJwFuUA79UWJ13kuM4RPLrOo+hKmXMojkYYlS3khpnxTVv8R5sOYA+nSXuio1C0kiIbT24pURAfgXfXzhQ/SRRxamZQL5FLtpZCxnPi2Eym5vTTiQoxc3dVPpc6o0lW6lK9HD8KwZz2OnifPzX148handCwrc8mJuIK5e75NJEd5SV7MkYh8PYbL9KZUj70h5HxppFN+j4XwhXTnWLoGiiVlkTLUoeO+Lp4d/cJSu9JFmry4DT/yPKzcz1vEfQnJxGg8wXPB0Q1wmxc8DL1hO3YSlx5xmyygyfcVlveweemm3SzyPjVavYC6oo2dQC6f6bjv1loDHFPeZ/pqYYqNzgQICYL/sAR9ZGpXTokU5fAuP1CL+6xjickZbQ3NRE3HR2wqmhRbRA47NWMd4kFUGOYoYOi0l48BZDffjNrsr3ccJLT7R7s+eRQiU7qgYfg5fzEGf9hPF+FvRDkkPsVqlyKSMieMzJh8gtcC1qEmYmMlgmodPgnF2ssi4sT2q5mQNga6cRijQkCCLP0tvyNCaBHWvCCSkBu2fBmUEFFMHz5la6/s+fSNL4y2jWpnJ8bnseea+WAmQnlc5z9InY17j6pyhi/qAsW0xWBKxD8zQLisnQB70HgwXrG5oykMTKcne2aY8iqpZzJ6i49LNTmiDBlus/IS7yuC+j7SfNie5KA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(30864003)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jICZlyFymxo587vtTAoNdrPu5d4BgB0gu9dNShhgh5fdf6PTdOsmp5R/I7MF?=
 =?us-ascii?Q?SccnujvOsBIgQAABuLylFZRA6aUjp10AouQGodl914njKQRM2uplhkVdBjYK?=
 =?us-ascii?Q?cnmLeBPRLtQ+kQ3ydCLs0LpEvPz5d8GMc8tXQt5iCxy5OigNvq06Lzc6pwOi?=
 =?us-ascii?Q?06ps9ZFbK9trr4Q1N+R0p9FKvyJ4Vy/W/b5ZXzbT3gGRulaAfic47Vcufrnf?=
 =?us-ascii?Q?zbgS6aHgAdjxGK+YUXgiaVl20RLrfmXIcrkc1MZv1M1w5j55wOjKB8KYVL/B?=
 =?us-ascii?Q?74CeB3+tvUc4DsPSn431yq7tCwIHUNcAcmnii3R42m8uNpGVElksHHkB5ECh?=
 =?us-ascii?Q?2bY8NrT2DzxwtAcfqoTFXiTcCMagkSczJs1baEvyrx+Wa0B5yFGfvvfkGtqd?=
 =?us-ascii?Q?NdS/OXpnsMAtUx4XU1CPZwQlfPNpBXdOBkdtQr01AYvK8bTnRadkUW+ANUU4?=
 =?us-ascii?Q?VU3DMgNtFkzTIaJfrlq+wxK8aGN2QAfuFFCh55yuyYB0nCXYsYoDqF79iLSP?=
 =?us-ascii?Q?6SCJ2SqL/s654J7H+nDNszGsNNjX9tWyWdEf3JeTf0G96YMz9NXZPnXagT+V?=
 =?us-ascii?Q?bhv+W2l3a5F4FFBltbJaYMlPShN0AWad592v5aBdc31b5RpsDHpSTrPhTwNA?=
 =?us-ascii?Q?62JdEwilH3jLWLU7Xdx70jDlO3mcXuoTxJBnVufRaWO63y0EZD0vk8DiUJdk?=
 =?us-ascii?Q?f8KkuMZSSSGOaG2Ucykty7C3NQ7ixTBLXZJRqCCX0YjXrgQZX4388co58wmP?=
 =?us-ascii?Q?5bVKuqiCOTcCf3/3qBrdTGAgsaaHqiAkLZUKnT/5EM8uiR4RKkRtjelBCT84?=
 =?us-ascii?Q?lSqmUEQjTSXdmwOjSytXX06vfgVBoMOzTP4GDYZdliPA8I1l0QhTQMu7lfZ5?=
 =?us-ascii?Q?iJC8tspG2Q1cV8J6LapEMgQF9Dj2wwCeH5Xmos849sjQhkxTT6B0+BPwMWBs?=
 =?us-ascii?Q?UUf4SftKjp9R0WVwQEVb6qvbShVL+clqA7uBgGUz4ga+caDIHj6XMJ+COM4i?=
 =?us-ascii?Q?7Tf1zyZlLbvAUNwBwusZqWquebPuMRXmc4l7hyDg8ISw7v/D0ibfzUJkEY9S?=
 =?us-ascii?Q?Mc55Cpin3FahHECtKC4WruxGDiWq1AyMmeN/olr258mKKnRsR7E+PK4fk+Sz?=
 =?us-ascii?Q?n49/DDJ36xOd19PIuC6M67ANBtC0O/xwEafZ4VlD4AlqaJ/486Gn1sSLbTZ1?=
 =?us-ascii?Q?I/yI5uqBi9JzRn7yFjMi7GwEFO5vEnKeruT9XnRs6pv1LyWnDIxt1RP9HIhm?=
 =?us-ascii?Q?KfCY48HscnIxiNeCKkmMrhNoNPLtLGmF0scHsQI3pIL9hCvjL2cVL5//2zRl?=
 =?us-ascii?Q?ZGkO8KlOJAZ/uEM6UFjB+59mSgB1daRr8PJA4kGwkDWXZ/3b+0ydc45hBViv?=
 =?us-ascii?Q?qsKblGuo6nhyAhWlBivyE5LwLloqn0wYADjrJEvrU8uC7LBOCMxI5nWQvgP4?=
 =?us-ascii?Q?GwGSZk81ujt0TFEiRfe3n+fP6z/Rwy4/Sq3Un2okEC2jxz8qI6czsW2NaTXA?=
 =?us-ascii?Q?THKY57aQXSab/BGz1FxHEz46D4N4ELIqpxUk5eRR0SqQDTMC53FyFWI5wpOP?=
 =?us-ascii?Q?JihA4oLK7zgtxyOYnW1+e18VUKJf0Whppyd+DxFWFTvyG30HqrKwDA9EnFQt?=
 =?us-ascii?Q?6d+jZGu+jaZWLyB+/Ayv68E=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ec7b25-0450-4045-7946-08d9bc5d8d60
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:24.1713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5j/zk3UKK9o3PFndIVnTUYUDIWkUjbL1gPvgXl9YDplThSZ0lloPk+evcPUrJ+leCA0rSSVvTtsfhqp2DJ0jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8268
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:31 -0000

The AIA spec defines programmable 8-bit priority for each local interrupt
at M-level, S-level and VS-level so we extend local interrupt processing
to consider AIA interrupt priorities. The AIA CSRs which help software
configure local interrupt priorities will be added by subsequent patches.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.c        |  19 ++++
 target/riscv/cpu.h        |  12 ++
 target/riscv/cpu_helper.c | 231 ++++++++++++++++++++++++++++++++++----
 target/riscv/machine.c    |   3 +
 4 files changed, 244 insertions(+), 21 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 827cff0d2b..916319afcd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -348,6 +348,10 @@ void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
 
 static void riscv_cpu_reset(DeviceState *dev)
 {
+#ifndef CONFIG_USER_ONLY
+    uint8_t iprio;
+    int i, irq, rdzero;
+#endif
     CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(cs);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
@@ -370,6 +374,21 @@ static void riscv_cpu_reset(DeviceState *dev)
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
     /* mmte is supposed to have pm.current hardwired to 1 */
     env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index df1d792951..69d9c42ad3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -180,6 +180,10 @@ struct CPURISCVState {
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
 
+    /* Machine and Supervisor interrupt priorities */
+    uint8_t miprio[64];
+    uint8_t siprio[64];
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -192,6 +196,9 @@ struct CPURISCVState {
     target_ulong hgeip;
     uint64_t htimedelta;
 
+    /* Hypervisor controlled virtual interrupt priorities */
+    uint8_t hviprio[64];
+
     /* Virtual CSRs */
     /*
      * For RV32 this is 32-bit vsstatus and 32-bit vsstatush.
@@ -374,6 +381,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
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
index 57c07ba1a4..033feb3463 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -133,36 +133,225 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 }
 
 #ifndef CONFIG_USER_ONLY
-static int riscv_cpu_local_irq_pending(CPURISCVState *env)
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
 {
-    target_ulong virt_enabled = riscv_cpu_virt_enabled(env);
+    if (index < 0 || ARRAY_SIZE(hviprio_index2irq) <= index) {
+        return -EINVAL;
+    }
+
+    if (out_irq) {
+        *out_irq = hviprio_index2irq[index];
+    }
 
-    target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
-    target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
+    if (out_rdzero) {
+        *out_rdzero = hviprio_index2rdzero[index];
+    }
 
-    target_ulong vsgemask =
-                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEIN);
-    target_ulong vsgein = (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
+    return 0;
+}
 
-    target_ulong pending = (env->mip | vsgein) & env->mie;
+uint8_t riscv_cpu_default_priority(int irq)
+{
+    int u, l;
+    uint8_t iprio = IPRIO_MMAXIPRIO;
 
-    target_ulong mie    = env->priv < PRV_M ||
-                          (env->priv == PRV_M && mstatus_mie);
-    target_ulong sie    = env->priv < PRV_S ||
-                          (env->priv == PRV_S && mstatus_sie);
-    target_ulong hsie   = virt_enabled || sie;
-    target_ulong vsie   = virt_enabled && sie;
+    if (irq < 0 || irq > 63) {
+        return iprio;
+    }
 
-    target_ulong irqs =
-            (pending & ~env->mideleg & -mie) |
-            (pending &  env->mideleg & ~env->hideleg & -hsie) |
-            (pending &  env->mideleg &  env->hideleg & -vsie);
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
 
-    if (irqs) {
-        return ctz64(irqs); /* since non-zero */
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
+static int riscv_cpu_local_irq_pending(CPURISCVState *env)
+{
+    int virq;
+    uint64_t irqs, pending, mie, hsie, vsie;
+
+    /* Determine interrupt enable state of all privilege modes */
+    if (riscv_cpu_virt_enabled(env)) {
+        mie = 1;
+        hsie = 1;
+        vsie = (env->priv < PRV_S) ||
+               (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_SIE));
     } else {
-        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
+        mie = (env->priv < PRV_M) ||
+              (env->priv == PRV_M && get_field(env->mstatus, MSTATUS_MIE));
+        hsie = (env->priv < PRV_S) ||
+               (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_SIE));
+        vsie = 0;
     }
+
+    /* Determine all pending interrupts */
+    pending = riscv_cpu_all_pending(env);
+
+    /* Check M-mode interrupts */
+    irqs = pending & ~env->mideleg & -mie;
+    if (irqs) {
+        return riscv_cpu_pending_to_irq(env, irqs, env->miprio);
+    }
+
+    /* Check HS-mode interrupts */
+    irqs = pending & env->mideleg & ~env->hideleg & -hsie;
+    if (irqs) {
+        return riscv_cpu_pending_to_irq(env, irqs, env->siprio);
+    }
+
+    /* Check VS-mode interrupts */
+    irqs = pending & env->mideleg & env->hideleg & -vsie;
+    if (irqs) {
+        virq = riscv_cpu_pending_to_irq(env, irqs >> 1, env->hviprio);
+        return (virq <= 0) ? virq : virq + 1;
+    }
+
+    /* Indicate no pending interrupt */
+    return RISCV_EXCP_NONE;
 }
 
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 76dd0d415c..cffc444969 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.hgeie, RISCVCPU),
         VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
+        VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
 
         VMSTATE_UINT64(env.vsstatus, RISCVCPU),
         VMSTATE_UINTTL(env.vstvec, RISCVCPU),
@@ -173,6 +174,8 @@ const VMStateDescription vmstate_riscv_cpu = {
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


