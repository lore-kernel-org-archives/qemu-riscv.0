Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrb-0001PT-IZ
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrO-00016E-Mf; Thu, 02 Sep 2021 07:26:26 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:32972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrM-0002sp-2B; Thu, 02 Sep 2021 07:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581981; x=1662117981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Zaq9rY7zRbJ0u2IfY0OOBu4e+YyiRRYEQslXwBxJG84=;
 b=fnprGOIbhd5XQWFWUhmNcgZWJPMUL9dLL8lxFBdnOS5g9mLcWBMPe4tf
 Chj29MK/RxJsIDeObyy7VWaM5Uv/pRX19Vw/Kyk+6WAyZon+Q5FwQGk+H
 1EcoWO4ecRFDJUlikuz6JDt90hIotcllWbR0LfT5NGWhEXt3ZBnH+P9gq
 CIHBkdu3t4vzJy9O6smmg+QIF0XGQ9/Tx03Bxgv+bjGBVbEFmrOQdK2dw
 w0+KF+XWGEKCfxKVk0YruZD5+pbZ57dv/a6mxZvNd860UkyYcr9M+PkV+
 rTo9uXhIugacZpc+49lyfcVa97NC8GWHJBYq4APHu9lgPwqgBcoBZPMO0 w==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="179581927"
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBFcTYjm0wu+4gbjAj5ZekQv63GUgL61ed0M39+xxBqejLrminATY1Tuivq8+xg8JhruzsLfBRsTLbT89oQTXNBAN6bs0dWHunTohlnL7nSJ+bn6bDwfBrt8VKXIHXZxwF3nbISmGgIbLsFkXwn97ZFWuaVN2/JvCTjrv5QkuAS1mG7O/TTPESyHo9shA6kcOJz53B8MAH9+4Rye5v4FLMDa/H+y39B0Eui4g0YjjO/RxxoLmPEHmWeRsdebnXlbT3ddSmhVVra/cJMy6Bwzm2LVIrZUJAO/iz8ZMNck2IUgWzZ714PiplX9oqkeuvauSiVEBd9yScSRiB4i429Ozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=4CChMG4LNaYW09nnBRa5hnQxMs9sCjmjDDZG0XeC6Kk=;
 b=h+GYFrw3bXJAHHfD2FG5VYH/Bkl2ih3H+ZGbxZZYwHp1rd7ma5rYxSNcFWyNWww8gJQMvdDxmzQmQMitiURUiZ5ofkIvdrrXD+c+IJhyVtJql2zSpb8swoig+r8pFpPnFCJN0bl+U24Bs/77mstLOvxNwuHan2lVs1U9qnQ//r4SkqEqc4ZUFYuxg8+5BB2/Z+L1kTAVoJrtHCWutZlH2jD0zg0jZKU491LAqRpIlaG1jid9Qb3EBfLMEF03ev26IV/EZDPilw9XRKn/dFAIqMA7om0xC7kzmNTW9T1t1QvGH6XXJT+EoNgDctV1MwxH2cQ9D0UIFb820jtsuFu3UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CChMG4LNaYW09nnBRa5hnQxMs9sCjmjDDZG0XeC6Kk=;
 b=EXggvmpuAnMFlTAZ2SxCTVw3EAMDPoVuD17oxedQnU2Xhfmlb7ni0REZMs9dOAkDVEaoghEvKKte6enmjRNEXTY/gGzJWe/oXpCuM2+MAdzFkpHNbD8WjGTgENajs+XRCRypPk35pLJLI3zDblb+b2YeGJNI5j/5Q1l1gexkRDU=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7841.namprd04.prod.outlook.com (2603:10b6:5:358::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:26:16 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:16 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 09/22] target/riscv: Implement AIA local interrupt
 priorities
Date: Thu,  2 Sep 2021 16:55:07 +0530
Message-Id: <20210902112520.475901-10-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902112520.475901-1-anup.patel@wdc.com>
References: <20210902112520.475901-1-anup.patel@wdc.com>
Content-Type: text/plain; charset=ascii
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::8) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.167.220.163) by
 MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1c17429-7c20-4e24-a2ef-08d96e047a97
X-MS-TrafficTypeDiagnostic: CO6PR04MB7841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7841F9C4C0582882479161FD8DCE9@CO6PR04MB7841.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RLDVvVZ1mv6ciVUuTd9b8S04XQfjnMfsXfMA9Mp0BVubyvY5F4pm8I202XIV2a1puTZ5ZrsrOSLIhl0ogdt1Zb7Gq7vyAjOq61ISpYPf1iy93BxkCPMdjsmY1Gy9V8J6RcNKQVP+QIH7Nol0nST9gaxpDnS1XmVYxu7iRgcXlyH1GXyqq1GKs9dOq3JufEY/fEHrxP/vVv1nlrvzI/g5zSFjFkh1eyShcJxiG7bPuuiC3MEfu16tXkUVaD9kLY1f1ZkdIwDdmJ3HNJrcADc7UXGVHp/ki9dhiPqxoLUkZuinWiavD008d3wxeg7T1grxs5LYYEyouevfNQxL6/DIBGz7FcS+xyLOLJBXJWZvjaw1gDFazNCtB7ijf1uWRp5txHC5rEhtqDD3PNINX9GWWbQyvJ5NWtKiSQZUPl1Kp6JnfY7ZNaZzLswVLa4iEa20jXPFcCdELq3iFrafAe9r7zvvza96M0tahKBj9vf4xOllbacduhjVP3+MuniALfRLLIdyJtupzeAwL79FfpAZQQcjulv9iFkuTQHyBc2P3WBO7MagasXuW4ig/jpUDAbjzROaVPOORbi0q5Fud4LN8FFE3WUhZ+xB9ixBZuRaXVpFDledF1aUiRZJB4FGs8/MzGZaxpxwCcmX0R4AAhV4N3Ns4aRhgVB2hphIATtJvrN6Z5mjKqC2wCbod7Vn66sV2YtMW89XcjYnM9Wj506+7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(38100700002)(83380400001)(52116002)(110136005)(44832011)(4326008)(38350700002)(8936002)(8676002)(2616005)(6666004)(66946007)(5660300002)(36756003)(54906003)(316002)(66556008)(8886007)(66476007)(1076003)(2906002)(7696005)(55016002)(30864003)(478600001)(26005)(186003)(956004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yPnJ+pnKDYOzImiOgDkRsEJDhuJlVATY7hTT8CAFg3n+clDWqiKN95va7Ckz?=
 =?us-ascii?Q?JOPxDGDlo90EMo//SbAoiP+bNExoIKsqqQLt6i4a81gryrBCXFhVlyMrPp8j?=
 =?us-ascii?Q?4oBDdb1Me2aFfuJ3z5n8xT8fTFy/2RTAmWp3P54QEfPslatX9UHcFADXPjwD?=
 =?us-ascii?Q?tauQ7Lw5F8DG6lGjCHyGkpWSAgbS4iMtbrLg8qyX8Lew82pEF2VUqh+SnFpC?=
 =?us-ascii?Q?o36c9VUTRQNf4Y6jq5EgqvE4NxojlSEljPSAq+DAT7UKkwuyS1KUkEHF9mHn?=
 =?us-ascii?Q?Gx3xPZcgyPkJd2ODP3CziJSUolnyuyRHe76JULOZclrJL/ZcKSc6XNOMoEZt?=
 =?us-ascii?Q?kRCCf00f4zdZKHYRsrTfT61uLgkTNtYUzSpXtKSdO1jGAz1MWuYYNz59wgNU?=
 =?us-ascii?Q?1Jo9KjcIpsEMx43qPpRcnD03kMHUVLQLWTAIZ56r62T1fVOMgnmhgHgCm90d?=
 =?us-ascii?Q?imHk/tlJhl1OK59bM+0JvNAIOuqS/TqL7JhuOVQRD3n1XmOOlMyGf3Rp0OL/?=
 =?us-ascii?Q?Lo2RzRRsDmvgm2MyfHtfXJep2OLDBVgw6ZnpAGcxthRMN+eq4+VainrHEsKH?=
 =?us-ascii?Q?RdhlKY5pajh/6pgimP8nRgFCVCGiu3izjRJqff/R6gTMalOZT4l9AtHFbzf8?=
 =?us-ascii?Q?dvK4hmCpERch2s+KVdrb4xqI7dBIFlDC/C0IgSgiAUC2dWcSW8m5w901yn89?=
 =?us-ascii?Q?kRBk8ZGeZXKM8z1EuzB71gFWqzdVtF9NzAbb3t7ztUGgJjeh/QRStaBKhWbX?=
 =?us-ascii?Q?iPMS8GSl0IDm5FE9Fu4X4FhpY3JnHrez2I2lDnSWEO8Ywa32sNa5HoGxmdL+?=
 =?us-ascii?Q?xiugC2pdvchZqifsMeExpZirAmgdrJA+aT2f42d46TsSvyO/A0I55eWJUqsm?=
 =?us-ascii?Q?rekBFtgWclARxumhWFkj7bqahNJ0drPE+IVN932Z/xKfpYSwImhN9g1nGrXO?=
 =?us-ascii?Q?ICPMn1T84LJ4CYLHA9zwlHREglJORkkG7DXL2Vr7ncRHtkwPhI1lAjfm/1Kk?=
 =?us-ascii?Q?GyFyXvYtNJ+HoI1UMZSY4JZmvR8T9zxpZsnRxm33hezpsYvtnvb6nxfKfmmA?=
 =?us-ascii?Q?Dv16sZVznEFDWviYaN8NWuWIcTQxjCgVn18ChuzXUjJeno6ocsbH7TypU0rZ?=
 =?us-ascii?Q?6oRgUjEJkJqHT0xBEEgUrzvwfNH5WNC+eAH8pWbQCJiHvDm5jrXOTNlE9gl6?=
 =?us-ascii?Q?gPuy4Hf+a/EVohGRvmaE/4i9LdZaVUSg6gHWE1zFwEow9Zyt+HkWZGNabo60?=
 =?us-ascii?Q?ptSZUp0hgH0uCl5tw+K/XgToGED4/US/2Ppd6SNQan0ccxBclu6BzwgYA7bY?=
 =?us-ascii?Q?HlKvRUYRnYGpAlyOHg2pqdqU?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c17429-7c20-4e24-a2ef-08d96e047a97
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:16.8464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHkn95eoLOZ9v4EU48h1zRgYpCixI2JQc7cMJyHycvK+/BJkK6mf6qHzo1ujAaRJ0QYp2oPDIMG75PegMsZTxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7841
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=872ab4b15=Anup.Patel@wdc.com; helo=esa6.hgst.iphmx.com
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
X-List-Received-Date: Thu, 02 Sep 2021 11:26:29 -0000

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
index 9dc9d04923..39af5402e9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -353,6 +353,10 @@ void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
 
 static void riscv_cpu_reset(DeviceState *dev)
 {
+#ifndef CONFIG_USER_ONLY
+    uint8_t iprio;
+    int i, irq, rdzero;
+#endif
     CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(cs);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
@@ -366,6 +370,21 @@ static void riscv_cpu_reset(DeviceState *dev)
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
index c5cdd26de4..9f9c2a9934 100644
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
@@ -355,6 +362,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, void *opaque);
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
+uint8_t riscv_cpu_default_priority(int irq);
+int riscv_cpu_mirq_pending(CPURISCVState *env);
+int riscv_cpu_sirq_pending(CPURISCVState *env);
+int riscv_cpu_vsirq_pending(CPURISCVState *env);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
 target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index fcc8bbd1b3..b441da1511 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -36,47 +36,228 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
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
+ * 22 ”
+ * 24 ”
+ * 26 ”
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
+    /* Indicates no pending interrupt */
+    return RISCV_EXCP_NONE;
 }
 #endif
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index a669d63e0f..9a51e2bfcf 100644
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


