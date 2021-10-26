Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBM-0003NO-DM
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBK-0003Lh-OR; Tue, 26 Oct 2021 02:43:34 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:53156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBC-00014K-0e; Tue, 26 Oct 2021 02:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230605; x=1666766605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hOBcfWOZyMxNSEnsrYeNAdCfPEAYfe/PEWI99yI9jf4=;
 b=HuUxkCWGx3y40TrTI8fdzqNmVfBLXJTUPt8O2DXro3FOW8ZEcDRNZRiC
 SU5RZzE91nH/Vw+g30/vVt0zBQpwtVAr9H/jGk+6wSlnWfFCgy7W6DNBd
 BfXTCzkOmibjh1ayl7OpAJR7E8JKeOIVV5996XJ2jXd9F0SH72EnEPUIw
 61cR7p7+9vCRJgrrIp7nzvbW4G3viI0eqScQrBUgjM0WGDnMoTQ+O0onF
 YzqTFlX8AMJK18yJ6BleeU/dJtij1FB9cMetka9n7ulm5VbGz+/6iuSJu
 k7kygu2rLe+h7w167iCedCk/9OJybh69+uKfnB6ujyNxGe78tVXa0DGG5 Q==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="182854759"
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aII0Ze3G0XJWcAeD9kBWwhSmBDpAImyGTKsJewhjxZCIQuCmJRG8zwAPmMtdcWyJYGjsPueCYcCu/+Gqf+v8k/9wkxVbjQ4+HlIf8H6jh2B6mW9UDuYM4uDdkfVDfBNxuDnradxxPoBUFEZB1cZ1eVmB4bEJDNJAw4c8EHQLQVEKbZyy128f5TM93QDNZWEeRJpFK62x9RjyvqfY5Wjyr9JPGX5vShEXNAvED2jLSLT0VQ4XsQ7/WxI7qCtd5rz9I2J2CLl+k8JTaAKMXjlF+p3l9Ub2AC6jXckg29y5xf5TTGx8oGo9JL7VUbdUpmG2/RjaKvqwZweor96nqk3WkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7mpUD20rxUSkfLTal+eQ9Ny345KnghaauwRlhj2gsg=;
 b=DnJIPReuwYZ6LbKaKmC6PlRoDcHobUmzYSHP5KwK4ZKgc41kGLmiugSvDhpV5ScOUvPwTFmVh/DD+PPDpqun3gnhTEyV75YKXYHcuiNT86zdHVrnWUi6aa06+AwD2U+atN5PU22PT8J0F1r9Ql4QBKQciBlNhAvUgvPA5U6WK9GkQNSE+KyOTlX6rKN5tZCF6gY8T3O+wb9Orh7m6mM3ThPc0XsSvM/FgPLlxt8jj33LQLniMvqeaQC/icvXCSCnTSAiBfC+ofZ+0nIN4xox+R6PJQ6ZLFh15x+nTksuDHafseKlUB1W4u5z3uJvciKN59MrVxRZgiEEkzZ0vmKnrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7mpUD20rxUSkfLTal+eQ9Ny345KnghaauwRlhj2gsg=;
 b=hEg1YkL5nTRHcywvucmJ6NgMrqp3yw0T2+WHq4R2+uLKozj0uhz/2K5AqQR4QrJnwwT4Mt05bbo9mShFX/Iq0SSOOxu4ImGs7+Zzbm/lIw1C+wCuj3ezPRhiZHLY+t6bN1MQc7ZzcS4/OfQ4c9fITMSDR21mu9FAPjMGpryX51A=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8379.namprd04.prod.outlook.com (2603:10b6:303:142::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 06:43:23 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:23 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 09/22] target/riscv: Implement AIA local interrupt
 priorities
Date: Tue, 26 Oct 2021 12:12:14 +0530
Message-Id: <20211026064227.2014502-10-anup.patel@wdc.com>
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
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5574036c-39d4-4bb1-7c5c-08d9984be800
X-MS-TrafficTypeDiagnostic: CO6PR04MB8379:
X-Microsoft-Antispam-PRVS: <CO6PR04MB83792DBCBE136378301FD7CE8D849@CO6PR04MB8379.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hiTVPPOR9clXv7dGIzoF7wxC52QTe/oWage0cQXIEVLN4fU3nVxkmPXFaZtSEDJCqlQFOFevPxR6q4t+AaZsfWkbKgxpDj1CDvTXcmSU9pK5OcAaQOz8SUPfX7AdzpyOeP7AaGvrHRolsMsa8ySSPymvj+7v4slNUp8n5KPx1njdJtiRnXtTmXrqckcmCzyCcN/JQt2mKgEkufREnRVI2CVVy9NT3e2xZnezUGWdl+34UNUGgpeF71ieWzEL4ikhGo20EP8Rc41r/0MPQAG1IADszvoGEPJevPsuZ04wGkSOjmtGq2uRpDqoouJzifrUtLQY3UhGcDc3/k+g9BtiJMly9coWzBxigvvbyqBxK3Bj67o4i4d2RLsaQD2gtEiqZ8FP/zJ5VOs2mU8fnIujZXkYXZEepfX6MafrSOVbxja8UDgy43p9+beNAWuSq5tsnsIewXZH1S+/OZxu/zHohwqmxp84p9S7bT5rcderVZY9oHAYFB+iSOHzrf87FFejwvEu4yjuia/k8/pMORasBbu4qCkhgF9tGgPWoe/+cfcA0iZw2Ah3bzhKacpCR/aXAujSIR6V+mDdEpXklks8q5qkd3d9bGM/bPWEYcl26ueW1hHzBWyKhmHZGVs8Ud2Q1KmPXcXZOuVZDS5WFnvbNZsxAwvEIRRmjj4bLfcoPgkWgCX93tVejtWplVzTf/2oihevii8YIlWuCdktSN78aA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(186003)(66476007)(4326008)(110136005)(8886007)(55016002)(2616005)(1076003)(508600001)(7696005)(2906002)(38350700002)(26005)(44832011)(66556008)(86362001)(54906003)(8936002)(83380400001)(30864003)(66946007)(6666004)(36756003)(52116002)(316002)(8676002)(38100700002)(82960400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r+ymPlYu9sNBF1I7ba6WR5sM/DEnlLwKfXZbFU0g0HUkI5T2YC2TOYlCJhui?=
 =?us-ascii?Q?vfhqYybiMN7ajfsa0i5VfHc3napxT7/YxMrpm8Jc35aOMNY7ZGcl0xuLLs0Z?=
 =?us-ascii?Q?bWCAy+uqO6o3YxZP0ilO/ZfgCCULhmWqyvVVYXa6sY9RDLx6vrLcaEU15ENF?=
 =?us-ascii?Q?53o1emSQaUk9YAscrrpt/xBrcClfWwNCt/0KROIKDo5NmIQ8M0LwukyioWtD?=
 =?us-ascii?Q?dduv9Ar6tsrsIK0JllPDzl3/D/QVRz1mp/pLeypj22v5kXUVX8lSIxyXbR7f?=
 =?us-ascii?Q?ZrmMBtMb0unJsHjRgHuBBEUHmi3vv6SMC1oECe/L/l2VGeckrhyjZ4+waZzn?=
 =?us-ascii?Q?vS03hyqTJGVsbHS6Z4NF0kUrSaEMR8FNOC29WwY3vrDAjTmIdtaW7Jg24RvA?=
 =?us-ascii?Q?BmM6jvDoaon9Pt9W8+7DLqKcQybUQ84cPaqJ1CMNlts0RnVCcAnnEGa/AiOH?=
 =?us-ascii?Q?LzybJeF1dJtlcR+8KpUtZUphQ+AAEDlNAN7VbT/L8VwtslQo5guNHUtElSFp?=
 =?us-ascii?Q?gqU/bMxAy6UlKCFWbAhe8O3Ob9rib+qk9LV11cBJzkU5qiWwMLMEjY/fVA8h?=
 =?us-ascii?Q?YZSuB789LY83X7mrlY6OBNRp2O/4UNUWy6HJZZFoPEA8USTv7LMgO/YpRfyg?=
 =?us-ascii?Q?C3B3T7fU9m4qPRFasqDQSAfz1j5yu7r40GYC2resjDYAXCo9Dryo57S4BA4y?=
 =?us-ascii?Q?McUKjlEdsSyaKXam7lzswdxck/Id6FYGONQW54dLLpaUqaOUvtXbLczqqVhY?=
 =?us-ascii?Q?CZik7Wo1XpJ//OY1U9dG+e1yx5g+oitj39RBH3iYg9WVa2YagW3x89zPyOq7?=
 =?us-ascii?Q?V+PMZ/TQT7JM+VrubR1CIIRruC4Aum58DQaVEHxEH7Vg0sQcikjxgVBAsAWl?=
 =?us-ascii?Q?/N8+zWgEK899M+POCJWd6gC8a6bwXkovMmJKA+0CWejRaps56z7sx/l7Lnr4?=
 =?us-ascii?Q?saVrvOjnj700t2DDgXSCAqI9pqs7CufOoVUVrSnrfy8nckl9mekisCEvRBmV?=
 =?us-ascii?Q?EOUS4ri6n0Os1pNTcDb9gbuxrLDL/ehpRLR6SNoMy87yabVW/LD1PYQY5Kcy?=
 =?us-ascii?Q?xuyd1iRfxyDrmRAWLbim2fYekj25cblznkKSNImByNMhhTOdTUiaYzBf6/fo?=
 =?us-ascii?Q?PaqYM33Zu7iufDc6pjRjhPqM7dbFis9OWmI9PIc1YfQ1PN8co/RiOUzpe8Mb?=
 =?us-ascii?Q?zQV0+84szdi3n5TVJxlNazr7U6QWN7j9lGGdjcV8F2q+lpITCXPpQvPng/0J?=
 =?us-ascii?Q?2F7nOOYYm81mmNbxm/Ce/Lre04JiKcjLsIhss9l2/wBBkNKJqyTx53YnE4oc?=
 =?us-ascii?Q?xGfhpZtG+X0A1tLjJEwql1uSnqQgzPg9U4bAEXB5nyinZBpaiGG9ZymvjvX5?=
 =?us-ascii?Q?yXmrUkRyAdCMXiRlxg4rH58MIkEj2CAldo6Tqun/RXrqqZpO3JjIw4IYtMXx?=
 =?us-ascii?Q?r5Suca/3kj86G+Ac1XtKUv1K6CAMpragC8G1rjCRZUzKL35KqPeI4BgAoRRP?=
 =?us-ascii?Q?THZIQALOtjr4Hlm6a4Cjx+gWVHAFeQ6+HJiwGHy2FKdB6sFFMNrKtAm3PFhc?=
 =?us-ascii?Q?BwdxZSSdzDGdD1x55v2YlaEV8Fg/BsfkHSydSDGlgUFiHaG2H+rdFAdKQ++q?=
 =?us-ascii?Q?060F85BUNfylqm4yQ4LPSqg=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5574036c-39d4-4bb1-7c5c-08d9984be800
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:23.5604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhsD6tPFS53n9YmUfdIF05yr2ZTxx6CVjgcCujW+gZOkiX9YThLQ4k9qm/4h2xJHTCo+HaOr/Uk8edRvK0cC7A==
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
X-List-Received-Date: Tue, 26 Oct 2021 06:43:35 -0000

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


