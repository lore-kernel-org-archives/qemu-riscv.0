Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrb-0001Pr-PL
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrT-00016z-Ly; Thu, 02 Sep 2021 07:26:28 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:32972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrP-0002sp-Bu; Thu, 02 Sep 2021 07:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581984; x=1662117984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Shez89BQXqRFKV8VdtREu5nqutfelMIlWXx64rkYxJA=;
 b=fxHlGCTZ5zx0MauXHtNRQL49DRX3aIG73z6DnwqwJeGH/gKhgniYnt7A
 Uyyj+g0Pk8ZylGyEIkNdHbIMeL0ChyQQUGylIWuMguhj/UFxAcoUrF+OC
 DqfC5/fC4qselBUrYsbJBcNCJSXMxi1hmj2xEU3G0kyyH84sq3Y5Y+nKG
 Kt2zaP3QPWPJk4xKKX8iXRMFnfqrOSrXBBV/gMwlX9HAr/HdQ2I5dgRRS
 oNIbtLMJLFEzGecggdsGuTL5my1NIel03Q2jlyQ4WqcLwSwrtiEMc4hM4
 1z07HAGobWov2JsqfCj8PZisKdKQeiXpTP4OJpvroKXhpk/m5eaV2SikK g==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="179581929"
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHinyoOAWXuHHcBLDOoBGng8U8cnAslJT4ODY2on2jIpCFzOe5FC4B2blsrHlRAKVqD5WecWCzViFrfHGky5Z+k0BJ8yFgww9lwMQpNGasJJu4mwZxttFllA+CFKYnKIAbAlaSVMX612IJJxnmwmQatA+lADmvyrkmHrmFwDUuYhKLhKlHdWe+9wCEowSeOrn5OgBqSB+fwEep3UJ6JFkWx5Lbe3038QrNIWJiFSG5DuXhcmT/k1VV6LaYnkR4Rev5ujo4drOL3PcJepoe4EcftcYRt0Bly6j83dJLD8yZxDtDvCEWA0JdpSPwVf6RnwEbbuJx6Vbls8HOEgRO2lxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=3dVagXezb9lmM1xNpyBgCHcH/v8TQ4WJ2ilDzWRWfgU=;
 b=ExGtAa6wjlJ0phOOmbAYK0LzANsUglJtDJPOG28sHzf4TW/V4pFLiwTEcnfp1OYYA25p/2KhFMjovWxcCWq/8iyVlBiEm32nPfW/L1VTCSt5yFVxbAaWuvNotCkQnr85j3G4xz+OdDXgzspUOU8YtDGDvjyxTzmcsARNolzX3j4TFtmiKX4eGSUXXdwksdR33YgDJUEaIBmmUvCHdWRrk2Nnckiq84KTFmrDlo0lTCys1yDqvqzPZ3jIJeNMOsWNufGubyqimKLa3xfQW0S+PAgGfflnZP7dElhsgQtdFvE4w2zLD2imMPe/bbR7ebIKHuTZx7JmU7j77QRRH9C4vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dVagXezb9lmM1xNpyBgCHcH/v8TQ4WJ2ilDzWRWfgU=;
 b=hW905TZRVPBkXyFEMLLcKEqe9L3Uo5Q8zBoFEAmsZFOrQQLxrN3anDI3YjW8kF8g3VzUWk6mupl2dc6yUwDedQvw4WmDbNnZPfPEGUXJWYRLzaafiiYPwhb2rQ5oZnZpIVXoF7Y5MAGcFAd8+ljtacbip7LKktQIVKXsJHJ4oYk=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7841.namprd04.prod.outlook.com (2603:10b6:5:358::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:26:20 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:20 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 10/22] target/riscv: Implement AIA CSRs for 64 local
 interrupts on RV32
Date: Thu,  2 Sep 2021 16:55:08 +0530
Message-Id: <20210902112520.475901-11-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3eb89613-ee17-444a-9f20-08d96e047cdf
X-MS-TrafficTypeDiagnostic: CO6PR04MB7841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB78410C37FD496A0731F8F4538DCE9@CO6PR04MB7841.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S8Vhm+WdAJwFsglu1NHe/WoOCJmZ6JI16csDBukZKF/6iqrseulj4QFfxQOhNKj190MLcphN14pl+9OckcOHVc7SVsMbHYJmnYR6Ct6wagE5TCx61KARgUeGQBBWkqJBFSGo2pKqxGdYIcZClf8+yATewhGwu/enkwkjtOH78ytOX08biPCQt+L220r7PT9aODYFZmXwwn50WYquQ+V2c+gc53WsN6VfDzDaJPGijz3j/RpaAgPW0ZOgA+Vxi1X7J73WDtDlICMonFjqQEdoL8LR/dNmx6UIVbSJkkGOnks41l+/TI0m8+XDzHmSsCwjbqZJnIq6HorwGJZGAt91DTa0Fe3i76AopjiIKKbO3gV85Gz7KoYAXlqF+W5utWevJwxJ028AKfLW12DDi6ilTiaMycSVDloBPXltVpwkRgvwID15gAK2fvkK5JJgUVmy2qqyBN876HJlA7Qt+ALq++g16tBvko1UsLC1TBo1BGiorfcaQVPf+7IqVu5YbOTmgt4N2qbzQXhb+Ze1e52fyVL/esS44uCmBjROGEHnrYVoTl1flc/iCrQw6ZngZW33pAX/jGXtrgE78HHJxK19qsN8L07Kbi3cl0OTVZKaFvLNW02hXwCP171GfBM+eLIgul9Dr6vOajzh9L93CPH0XUzWmLLWkgvjsNZMNO4gDuO3UTC+NMMuul2mhb/b3fmj20hXZVcAIoR3ByTAXS1TVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(38100700002)(83380400001)(52116002)(110136005)(44832011)(4326008)(38350700002)(8936002)(8676002)(2616005)(6666004)(66946007)(5660300002)(36756003)(54906003)(316002)(66556008)(8886007)(66476007)(1076003)(2906002)(7696005)(55016002)(30864003)(478600001)(26005)(186003)(956004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gqev8BKnIt2n4fudqmPGoFxSBkAIGOgxmX5CaNhgNt6PfWnrLTjSfH2mlqVo?=
 =?us-ascii?Q?bdlL66vTQ7u8LLsubRQRlh/uudSB+VvvCsJbphe/aty2SrDqum1yp1zIRU7c?=
 =?us-ascii?Q?QIqhKJd0qIKeLOBi338OwqQWFRz/VnYYRuK64zhv94pH5/gf90uPuhHyp7z/?=
 =?us-ascii?Q?xsHwJfal/Cys/YGet1g388jSRr5YvnpMbsi4UZPvkiG7dGa10orxdCToOxX8?=
 =?us-ascii?Q?GTyd29AShB0ddDYoO6hbX1GN1vSbP2sCvaz3lwEFF5wr5ck9dg0bpU8QZDnA?=
 =?us-ascii?Q?0VsOYdvdC354qdbfoBqrbUPQ1dZbFRoG1VgZaWjdj+liw5ZhWtRd5hHW5H3a?=
 =?us-ascii?Q?oFV32rfIZ5Ddjni8IU8muRvRg6sAy+ym+ZqFFthOX20YirrGICcORd6S4XM1?=
 =?us-ascii?Q?S1+TV1A/DmX0VC72fvVzQUeH628pr6tOpPJPS+Z1ZBOkycNPkC2+Tq9PGUo6?=
 =?us-ascii?Q?MZkzWWnOr0J/aUUZUcRo636wnRO800rGUMFoDEe36RCcbJc2fodmPYV68PPz?=
 =?us-ascii?Q?uRLsbRtrNqzXs/7rVTLA+3AEHNxW5jGwqVXl6mxypGqHBxrOAejXxHchTzS1?=
 =?us-ascii?Q?eyd0xatLH57XA3ZOxPi7KDNs9hOPHvx0BeGYiP7W2au7utlNW0mcXIif6Dqc?=
 =?us-ascii?Q?3TZqCV2XLKQXSmQet29FI61lNKUZm0MNIv8AUyPvlxTOwP6fdp/falF1nXWT?=
 =?us-ascii?Q?CsjVhJUw93ra9UAdIvo47tGMnTQ1P5kzorGDkB0EAXBQFCi0k9oVahjEVjMz?=
 =?us-ascii?Q?lEioQu3qZXpNUn/8c9GfvKJQ2czE7W0gptVFak1fi1klYCE8Qwit5LFWFtz0?=
 =?us-ascii?Q?EcIcU/cc9ROyqHoyZIhvNDD8gZWPmnV0Khdj0cwTJeAOLY7qoNGS7qD/TGxM?=
 =?us-ascii?Q?LBgxMr3hRvyA2XEkaC8/+SH5eoGY2RQA8ibYShxHV9xFegidgXBnzCXBK4Zg?=
 =?us-ascii?Q?i2+lM8SwFwUdOQlsoDXKWWO6Ci/Bk2yciBTzhYmBG5FJFV4QlVsgKwoP2SCQ?=
 =?us-ascii?Q?0L2m9nYqoNl+mMEoWYO1MwkgG4ImAWMz7OkMSLVxZzvY3RI36+/S1tKeDwFd?=
 =?us-ascii?Q?zisYGv/uEf9upkyHXQ7cnKvVzwqgb50RRbASMGslyDD+X0iPquWFLuEogkVA?=
 =?us-ascii?Q?x7pjzh7BDVcBZmQwN93BfnuYg1dM/FOH1FdniqO5tGghaeCv4JBfbgMoUI+u?=
 =?us-ascii?Q?7INlrbKBMOiQzrLmF3GCiy+Ab+DibfID6lUpltK+zKgdEucUpLvxxySu6ReQ?=
 =?us-ascii?Q?rVTHqnR35h642oNX7pYP+VxhFR97FkASl281Ni3gjKRKY8I08fl/W92FgSYq?=
 =?us-ascii?Q?VyEK792WrRpw0jPlKUTHoe30?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb89613-ee17-444a-9f20-08d96e047cdf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:20.5253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qkSYLchlbv/aJIjxReEhxz3Hii6+p/v9axH9GpaB3aEi5Qs7b7ygG277CuP9/VSuXSlTCclNLeMDlT0j2Kqsw==
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

The AIA specification adds new CSRs for RV32 so that RISC-V hart can
support 64 local interrupts on both RV32 and RV64.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.c        |   8 +-
 target/riscv/cpu.h        |  14 +-
 target/riscv/cpu_helper.c |  10 +-
 target/riscv/csr.c        | 560 +++++++++++++++++++++++++++++++-------
 target/riscv/machine.c    |  10 +-
 5 files changed, 478 insertions(+), 124 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 39af5402e9..e0f4ae4224 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -261,11 +261,11 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
                      (target_ulong)env->vsstatus);
     }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg);
+    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mip     ", env->mip);
+    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mie     ", env->mie);
+    qemu_fprintf(f, " %s %016" PRIx64 "\n", "mideleg ", env->mideleg);
     if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hideleg ", env->hideleg);
+        qemu_fprintf(f, " %s %016" PRIx64 "\n", "hideleg ", env->hideleg);
     }
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg);
     if (riscv_has_ext(env, RVH)) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9f9c2a9934..284b2c737a 100644
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
@@ -398,8 +398,8 @@ void riscv_cpu_list(void);
 
 #ifndef CONFIG_USER_ONLY
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
-int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
-uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
+uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
                              uint32_t arg);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b441da1511..a2182d7231 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -419,7 +419,7 @@ bool riscv_cpu_two_stage_lookup(int mmu_idx)
     return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
 }
 
-int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
 {
     CPURISCVState *env = &cpu->env;
     if (env->miclaim & interrupts) {
@@ -430,11 +430,11 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
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
@@ -1157,7 +1157,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
      */
     bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
     target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
-    target_ulong deleg = async ? env->mideleg : env->medeleg;
+    uint64_t deleg = async ? env->mideleg : env->medeleg;
     bool write_tval = false;
     target_ulong tval = 0;
     target_ulong htval = 0;
@@ -1224,7 +1224,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
         /* handle the trap in S-mode */
         if (riscv_has_ext(env, RVH)) {
-            target_ulong hdeleg = async ? env->hideleg : env->hedeleg;
+            uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
 
             if (env->two_stage_lookup && write_tval) {
                 /*
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 77fb5884bc..62bf014fca 100644
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
+    if (!riscv_cpu_is_32bit(env)) {
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
@@ -633,40 +669,107 @@ static RISCVException write_medeleg(CPURISCVState *env, int csrno,
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
@@ -757,17 +860,17 @@ static RISCVException write_mtval(CPURISCVState *env, int csrno,
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
@@ -777,13 +880,44 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
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
@@ -808,45 +942,112 @@ static RISCVException write_sstatus(CPURISCVState *env, int csrno,
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
@@ -939,38 +1140,111 @@ static RISCVException write_stval(CPURISCVState *env, int csrno,
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
 
@@ -1065,30 +1339,94 @@ static RISCVException write_hedeleg(CPURISCVState *env, int csrno,
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
 
@@ -1105,18 +1443,19 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
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
@@ -1574,9 +1913,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
 
@@ -1589,9 +1928,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
 
@@ -1605,12 +1949,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -1622,7 +1970,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
     [CSR_VSSTATUS]    = { "vsstatus",    hmode,   read_vsstatus,    write_vsstatus    },
     [CSR_VSIP]        = { "vsip",        hmode,   NULL,    NULL,    rmw_vsip          },
-    [CSR_VSIE]        = { "vsie",        hmode,   read_vsie,        write_vsie        },
+    [CSR_VSIE]        = { "vsie",        hmode,   NULL,    NULL,    rmw_vsie          },
     [CSR_VSTVEC]      = { "vstvec",      hmode,   read_vstvec,      write_vstvec      },
     [CSR_VSSCRATCH]   = { "vsscratch",   hmode,   read_vsscratch,   write_vsscratch   },
     [CSR_VSEPC]       = { "vsepc",       hmode,   read_vsepc,       write_vsepc       },
@@ -1633,6 +1981,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
index 9a51e2bfcf..36de40991e 100644
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
@@ -166,10 +166,10 @@ const VMStateDescription vmstate_riscv_cpu = {
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


