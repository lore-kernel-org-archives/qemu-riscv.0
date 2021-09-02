Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrh-0001fv-TU
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrf-0001Z0-Vl; Thu, 02 Sep 2021 07:26:40 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:26527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrd-0002yA-NA; Thu, 02 Sep 2021 07:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581997; x=1662117997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=79DoxJBqk11tjwEEH6NV1uJDrQuuWkfB6NrmJol30F8=;
 b=qDhK0xTqLauIObqwMwBl/xFoOxRuyNBMszJOVoj82fTYX1moVrgvfBRY
 7S3E+8pKv0GUy7BrRMwD/+s9pqHn5LTeN9IJd8FY0PR/PTh+bpe7X3qXE
 RbAcEShNZVm7nLT/Q4LZrzk7JiN1GqUWbNO/kZgjuFHDFBAB+jw0zyIT8
 Pn3+OsrPNifz34g3+Y/8HXAfpco9I6k8hf3iG7saVZbKMhluV/mwmeG0X
 cfWvaTBlFM9k7JxMrFAsAzp0SSm7FRqxGJzrnL0e1/RS+m2ZCizrqU9gR
 sN0soz6otHtFngAsaDaP8Ns5ziaAzuxS+cbejZqNSCkficHZ9r4VH076M w==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="290644629"
Received: from mail-bn8nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.176])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFWdhLIse9oxTmG2wlSxIdta8SZhlVyvuoXSxTUcVZJJ/sU8fvrUdcEY7KC7RfoaU8vJrhpLTpVNZzFRZuzCd0tDd/JEtXVCZ7DnDXQ5h4qQeOwhoy0eO3pB1zoMP+heEDTb7PQ1qMbqQccb63xJ+uKFbbR8Sblvw7NdycjaRswkIwUBbOMQ5zbDuA3NWXzxHD/3Bw3m+V6bKNnZlwiuqmpG4nNlJmIngJ+u9yLWbRPkBE8o8bN6kaMJWSl54VzbRYRfoKqVqlSSNJyUwjkeExed5ivacuyCxRBb79tHWpKsC6ZSMgCEj5lnNHGyIM5Nzl+skZxpqDZmiU7KqMdqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Sm+HEwTpcDeMna7jMAhfmd4D4Y6vhn+Hk/QkRHW58fQ=;
 b=Smat8vehfuo3hYPZ0LkuKq85cX/RPDCNA+cOr9KMVkFHjLWzgcPII/cir+/yMlFZ2aV8ociwQjdUJHOHWk9bO1SbQ9A1Zy+KnDZe1MfGEwahjH4JUnA7Z0QjziRHh5lbv1P5XL93oaubYl6rne4/K/SgHYV765wKMyAIPdvJLXITZ7wYknAxuixxl4fKrUzqEyO5fhD1V8h4wJiLa3xbVYCHRZq8dIKsJzmFSNJOFOvgDVdvakCpivQuYZWcPeF4Gq6DNDkqBS3o3EsnkZmR5BH8BnwksOMEhYAfnXFmTT+b99bV1KkjCcXAr1yjWky5LuuWVgMwrhKJNvcDeLKtIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sm+HEwTpcDeMna7jMAhfmd4D4Y6vhn+Hk/QkRHW58fQ=;
 b=Opg+moPesCFrJtgnTEXiD4ID0RjWdVCI19HRqL6RKfGuP0m+NFj0Af5a8Oh2m2Z3PzIYzfi8q5VG1fb8/BWo9BMzzZYFHNPllrbxKfIolC5gKf7/KrWE44Sgkf1iCBp4RRqbsd6e2r2gzzBbso4wP+SI/Lp8latFv/nw5tXRILI=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7841.namprd04.prod.outlook.com (2603:10b6:5:358::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:26:34 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:33 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 14/22] target/riscv: Implement AIA xiselect and xireg CSRs
Date: Thu,  2 Sep 2021 16:55:12 +0530
Message-Id: <20210902112520.475901-15-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3aff9777-e16a-4d1e-3cc3-08d96e0484c5
X-MS-TrafficTypeDiagnostic: CO6PR04MB7841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7841F02834DEAEECA780A63F8DCE9@CO6PR04MB7841.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TIoMzgOz5tXr5wAAADnBYIJlyrbCKY5g4M4UwnccOQg2qSKlpr+aEyizOdvfYGiXL3+S7+ttgGAGQOod2j6h4JGyQ0nBOQPZERphMIicF7oO3y+/yeioOlQ67GoepsE5ogWvm8oaUM//kLJb22NLZr4l1hakop98rT69ui5b69VzrbqduxiJjmD/ZLBdAo8rwWnfSZ/Uf/KOMslyXJcIyYybE0HaGXr3Op7c0GhcSNOwS189rUztV/PjDstG/kUo75YIdLhXMlE/BaDorbTjKmb4buWQP6/v6lvJyKuGlpanGkk6dqB3L2/xW+YzRpl7KywXdkWAACcbblpGWZ/nD8xrput9dCf0cOZoQhvqmlXq2C/aXEZXpOBTpesr8wNcfw/av1HmIAE3oVMoOUOzKt+vW3UKYKSL4QlaWOi3cY2nWk3PYhFM7NJWoHJYHPKInHLufVTKZElxXAmsMqH5xRwXiHrKiXi9r8RbM1hIcYNZ2b5YTBf4mXXSf/cduW9ywezDGPAyb5ASYaLMPwgCX0j1xPwKHbspHA9YrBMDAbYS5QznLjaK5IcBldVyVFdMlwEhbU9YNdpF874kIhLVoK7PVR1muE9UnUBbiJefPGIPXkF4Hj8ptpwDmy1t+0036QXZ6W/otNoX/6ATfUpJICX747KSFNb3e5uB2EkKDdV/PW+xXZG4WWHqRs6YX5cP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(38100700002)(83380400001)(52116002)(110136005)(44832011)(4326008)(38350700002)(8936002)(8676002)(2616005)(6666004)(66946007)(5660300002)(36756003)(54906003)(316002)(66556008)(8886007)(66476007)(1076003)(2906002)(7696005)(55016002)(478600001)(26005)(186003)(956004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cKis6d1udi6vXbtDx7CuBZjxdwjGNtcquP3p0+Gc/Et5Gawk2JuCTXRv+Dak?=
 =?us-ascii?Q?M7R7p1JD98IhI3LGPzj2fA8g2T+dRvGRk2cC+G0KFxK1Ws7ASgUho9yLuKkl?=
 =?us-ascii?Q?ib+V9tmj5SUuvOoO079ATeLh1VV7yZEEA+loaYj3CbSMl203iFBpQnRPLsK7?=
 =?us-ascii?Q?hONhnlxcw6ASy5tUA9nzbRUPDT35C6xVTsoqYbj8AsLBubNjUZWb8IAyt0s6?=
 =?us-ascii?Q?gVF4eHxYazGU5NZF986JrvwCUSrP3+JVimTDofsLi7yM2mvX6iyuS4fKCedv?=
 =?us-ascii?Q?qdlQ11Tyk+bHwdIkAiQTCEjKtjT61uf1HTkKBIwRq6GO3zH1BKsCdmwh/w6k?=
 =?us-ascii?Q?tcEeDpdlFmTcl6HvBqZaQCgIqhDOX6aZUE3qeOaMdOHAypQ4LucsKzih482g?=
 =?us-ascii?Q?YKdOn+HdbJdbQJ1dJg6DcCdMd0nNp/n1Opz/MSKcCniHkQuPhxgtsOx/LA5W?=
 =?us-ascii?Q?PQQHMvCwgV2f7n/GaWqbpJqLv/ttrPl9MvZmFmeUE000+cqdOrcVzR0GLctT?=
 =?us-ascii?Q?c5rsSSfJyKYIaCTs1aZkDHC1oN2Y1uU2lGZ3hkCdiKCd4g7js1rEBm2SgPrE?=
 =?us-ascii?Q?akwJYPODPb2iHZgmr4f6Lt7WDgbM2wmoZhHA+pVQ3yJiAAVj1X4/L+uyMVUe?=
 =?us-ascii?Q?W+dQEhZBJ5ZRGqccZEoNL7nMSc6MXAEqpU8p8axpwVzXKHxusM+izfuNR/pD?=
 =?us-ascii?Q?ggFxj4P9jUdPeEaqxbn93cjcbkKEFzq5eRSW7xw3f12sgVd7g4ocfRic2wnV?=
 =?us-ascii?Q?fZwjSOre5TEYnu117L/+jm6Onmxkr7Cnx1F47uaEIZ1VFJ/lhO//e9eRNAmh?=
 =?us-ascii?Q?VvkYpjo1nmcn9srDokaAW+rq0lM6hkJd1FMgUNMior4LAWbrz1a9Yv74tlcj?=
 =?us-ascii?Q?OMPboUVvP2QdTepBQH5TujhTg1sIJ9g4enCvgVbrHuXYufi5e0PfJr3UJEee?=
 =?us-ascii?Q?tR8vrBimyAsKMltPuRGkot5sJdwPAvhV/AuWZaXRGNootlRDniZiynSlFzCE?=
 =?us-ascii?Q?RVlUnUrUnbeRRQP5uLF3+eUbPbY6mG8l6Uf8FoGx9cUmFGacNq7I4YEoVNS/?=
 =?us-ascii?Q?ARrf6bGFqOLHJNQO71kR9We+L1nSq0dvylF0cduXYBtiQs4WR8ikhpt/Jmvs?=
 =?us-ascii?Q?1vqYMfEvrhxv+Z64F+h7OIUxIfjCIynvYC4OQOLLIJopnrOHyHkSPYnD6i4N?=
 =?us-ascii?Q?yrfkzoiHFvisjTeQ8f4moovWgoVVx1xTbUlc1C3uUVtzAc9ygt1tq+03oirE?=
 =?us-ascii?Q?gff8R/2x9Ll3f1nm2yU18H6wfHBUSKGdPw4g6vI6i9fLTfKXVn0SX5GjZBX2?=
 =?us-ascii?Q?ZCC1RWYWKBNkF5DBPTmft2E3?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aff9777-e16a-4d1e-3cc3-08d96e0484c5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:33.8956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxFlFCyN9DHdqG+Mr4B4B/qGuFrJ6UCaR5o/8jwL9F1ZFrt0Vxvy9/+/g6fiUkQvvDYHXG4fc0LPPvQy+wNw0Q==
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
X-List-Received-Date: Thu, 02 Sep 2021 11:26:40 -0000

The AIA specification defines [m|s|vs]iselect and [m|s|vs]ireg CSRs
which allow indirect access to interrupt priority arrays and per-HART
IMSIC registers. This patch implements AIA xiselect and xireg CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.h     |   7 ++
 target/riscv/csr.c     | 174 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c |   3 +
 3 files changed, 184 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 095a140c3a..16a4596433 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -183,6 +183,10 @@ struct CPURISCVState {
     uint8_t miprio[64];
     uint8_t siprio[64];
 
+    /* AIA CSRs */
+    target_ulong miselect;
+    target_ulong siselect;
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -212,6 +216,9 @@ struct CPURISCVState {
     target_ulong vstval;
     target_ulong vsatp;
 
+    /* AIA VS-mode CSRs */
+    target_ulong vsiselect;
+
     target_ulong mtval2;
     target_ulong mtinst;
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 273c8ac13d..71e88e5b41 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -825,6 +825,168 @@ static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
     return RISCV_EXCP_NONE;
 }
 
+static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
+{
+    if (!riscv_cpu_virt_enabled(env)) {
+        return csrno;
+    }
+
+    switch (csrno) {
+    case CSR_SISELECT:
+        return CSR_VSISELECT;
+    case CSR_SIREG:
+        return CSR_VSIREG;
+    default:
+        return csrno;
+    };
+}
+
+static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
+                        target_ulong new_val, target_ulong wr_mask)
+{
+    target_ulong *iselect;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Find the iselect CSR based on CSR number */
+    switch (csrno) {
+    case CSR_MISELECT:
+        iselect = &env->miselect;
+        break;
+    case CSR_SISELECT:
+        iselect = &env->siselect;
+        break;
+    case CSR_VSISELECT:
+        iselect = &env->vsiselect;
+        break;
+    default:
+         return RISCV_EXCP_ILLEGAL_INST;
+    };
+
+    if (val) {
+        *val = *iselect;
+    }
+
+    wr_mask &= ISELECT_MASK;
+    if (wr_mask) {
+        *iselect = (*iselect & ~wr_mask) | (new_val & wr_mask);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static int rmw_iprio(target_ulong iselect, uint8_t *iprio,
+                     target_ulong *val, target_ulong new_val,
+                     target_ulong wr_mask, int ext_irq_no)
+{
+    int i, firq, nirqs;
+    target_ulong old_val;
+
+    if (iselect < ISELECT_IPRIO0 || ISELECT_IPRIO15 < iselect) {
+        return -EINVAL;
+    }
+#if TARGET_LONG_BITS == 64
+    if (iselect & 0x1) {
+        return -EINVAL;
+    }
+#endif
+
+    nirqs = 4 * (TARGET_LONG_BITS / 32);
+    firq = ((iselect - ISELECT_IPRIO0) / (TARGET_LONG_BITS / 32)) * (nirqs);
+
+    old_val = 0;
+    for (i = 0; i < nirqs; i++) {
+        old_val |= ((target_ulong)iprio[firq + i]) << (IPRIO_IRQ_BITS * i);
+    }
+
+    if (val) {
+        *val = old_val;
+    }
+
+    if (wr_mask) {
+        new_val = (old_val & ~wr_mask) | (new_val & wr_mask);
+        for (i = 0; i < nirqs; i++) {
+            /*
+             * M-level and S-level external IRQ priority always read-only
+             * zero. This means default priority order is always preferred
+             * for M-level and S-level external IRQs.
+             */
+            if ((firq + i) == ext_irq_no) {
+                continue;
+            }
+            iprio[firq + i] = (new_val >> (IPRIO_IRQ_BITS * i)) & 0xff;
+        }
+    }
+
+    return 0;
+}
+
+static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
+                     target_ulong new_val, target_ulong wr_mask)
+{
+    bool virt;
+    uint8_t *iprio;
+    int ret = -EINVAL;
+    target_ulong priv, isel, vgein;
+
+    /* Translate CSR number for VS-mode */
+    csrno = aia_xlate_vs_csrno(env, csrno);
+
+    /* Decode register details from CSR number */
+    virt = false;
+    switch (csrno) {
+    case CSR_MIREG:
+        iprio = env->miprio;
+        isel = env->miselect;
+        priv = PRV_M;
+        break;
+    case CSR_SIREG:
+        iprio = env->siprio;
+        isel = env->siselect;
+        priv = PRV_S;
+        break;
+    case CSR_VSIREG:
+        iprio = env->hviprio;
+        isel = env->vsiselect;
+        priv = PRV_S;
+        virt = true;
+        break;
+    default:
+         goto done;
+    };
+
+    /* Find the selected guest interrupt file */
+    vgein = (virt) ? get_field(env->hstatus, HSTATUS_VGEIN) : 0;
+
+    if (ISELECT_IPRIO0 <= isel && isel <= ISELECT_IPRIO15) {
+        /* Local interrupt priority registers not available for VS-mode */
+        if (!virt) {
+            ret = rmw_iprio(isel, iprio, val, new_val, wr_mask,
+                            (priv == PRV_M) ? IRQ_M_EXT : IRQ_S_EXT);
+        }
+    } else if (ISELECT_IMSIC_FIRST <= isel && isel <= ISELECT_IMSIC_LAST) {
+        /* IMSIC registers only available when machine implements it. */
+        if (env->aia_ireg_rmw_fn[priv]) {
+            /* Selected guest interrupt file should not be zero */
+            if (virt && (!vgein || env->geilen < vgein)) {
+                goto done;
+            }
+            /* Call machine specific IMSIC register emulation */
+            ret = env->aia_ireg_rmw_fn[priv](env->aia_ireg_rmw_fn_arg[priv],
+                                    AIA_MAKE_IREG(isel, priv, virt, vgein),
+                                    val, new_val, wr_mask);
+        }
+    }
+
+done:
+    if (ret) {
+        return (riscv_cpu_virt_enabled(env) && virt) ?
+               RISCV_EXCP_VIRT_INSTRUCTION_FAULT : RISCV_EXCP_ILLEGAL_INST;
+    }
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -2207,6 +2369,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_MISELECT] = { "miselect", aia_any,   NULL, NULL,    rmw_xiselect },
+    [CSR_MIREG]    = { "mireg",    aia_any,   NULL, NULL,    rmw_xireg },
+
     /* Machine-Level Interrupts (AIA) */
     [CSR_MTOPI]    = { "mtopi",    aia_any,   read_mtopi },
 
@@ -2237,6 +2403,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
 
+    /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+    [CSR_SISELECT]   = { "siselect",   aia_smode, NULL, NULL, rmw_xiselect },
+    [CSR_SIREG]      = { "sireg",      aia_smode, NULL, NULL, rmw_xireg },
+
     /* Supervisor-Level Interrupts (AIA) */
     [CSR_STOPI]      = { "stopi",      aia_smode, read_stopi },
 
@@ -2278,6 +2448,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
     [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
 
+    /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
+    [CSR_VSISELECT]   = { "vsiselect",   aia_hmode, NULL, NULL,      rmw_xiselect },
+    [CSR_VSIREG]      = { "vsireg",      aia_hmode, NULL, NULL,      rmw_xireg },
+
     /* VS-Level Interrupts (H-extension with AIA) */
     [CSR_VSTOPI]      = { "vstopi",      aia_hmode, read_vstopi },
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index f6d0c80311..95a43ababa 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -127,6 +127,7 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.vscause, RISCVCPU),
         VMSTATE_UINTTL(env.vstval, RISCVCPU),
         VMSTATE_UINTTL(env.vsatp, RISCVCPU),
+        VMSTATE_UINTTL(env.vsiselect, RISCVCPU),
 
         VMSTATE_UINTTL(env.mtval2, RISCVCPU),
         VMSTATE_UINTTL(env.mtinst, RISCVCPU),
@@ -182,6 +183,8 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mepc, RISCVCPU),
         VMSTATE_UINTTL(env.mcause, RISCVCPU),
         VMSTATE_UINTTL(env.mtval, RISCVCPU),
+        VMSTATE_UINTTL(env.miselect, RISCVCPU),
+        VMSTATE_UINTTL(env.siselect, RISCVCPU),
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
-- 
2.25.1


