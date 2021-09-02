Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrZ-0001Jz-El
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrU-00017A-Rp; Thu, 02 Sep 2021 07:26:28 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:32978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrR-0002tI-LT; Thu, 02 Sep 2021 07:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630581986; x=1662117986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gqoQPasa3fA0OWLVZpFRj2N7l4WuftX6lPLtL0B+H1E=;
 b=QbhVz/XyEAGAuTWPwfpnHtC68A5mrgf8A6QsAKF72ahPqn9BkbjEROuq
 MppDn7qaQk8fko5G/5kMsSozaEyOBIqXCLyj27WycD/EQ7vHwjwJ5TZXg
 y0vi8Ep7pXWiBqqDWzFUUOjNmrMQ+D8kBPuFG9ZDKceIx872LwsWirUTr
 ixpY9YjNbvY6Dm5tMZtETm3TFppPf5xdZ+K72Gz8KkBQ8M8qQfnMhNcYC
 D43t1ZfQqOGyAsuo8JE6RvZlzBg4AtGzLNgZSpmahuB/ys7JxktuCMTsB
 gl1wesv7gEqwvQkHPMslwEU+ngltkKvK3e3t/1V2DRiD2GfKpD85ufhX+ Q==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="179581932"
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Of0bOmYlKNbw0dc+oXlUfCkonLV1GpdJQYVS+sMkzX0w4u3qPYq3CpqHZJkyDF5m36mhA0giENIMl5j1li8nCfA6ZtI9KUzofVQRA1+06PXhpSC6WO2tAICI8N/MGvbeQ62SXenyFXFwFwLZuEv5RrA/9AGLmOIl77qeN35xqWwA4r+MOM0W0aOwkXXduMk6MbnNWATAWOCDu/YJowJmUt5bB2YPGZqlrLiZHX0CGnvDkxypExFaC0Ij1pWdoDwTEDzA3uY3XwBEEomyg6fxc5FWt52vRyk+WOb8Sm761ZTMUUVmyCfmb9wzraFJ7dLw5Lj02Gt+v8vUoOGMakIJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=u1PAGl/6Ga8Ns4fP4965fHSm5nlUn9YgIoObjFL5ZU8=;
 b=fjQ+Xb80N9VFz+7a9lMemk2PfrO7/yKV9bL2KzX2NDzk7Wg375PWn174vqPaj+sB+PsjC/U6Cc81iig3cJ24zPYjgK3K3mkPUm8gt/73ay4UiN7IvpGaZEThYYR6uHb+KfZrVTTFlFdgjojclN9Zu83nZnLpUE+gg7Yc4fPw1+VEf1UE0uG3n1O1pfdULc+Sml6l91QNlzsOEic1TjwZ9/N6aelVFhvnAGhxHvq7n1tv7ncyTjgHnDw4mXhsGYBwylF3ZI+Y4UDi4i5kjoddLjw4bLxeKZk44t/z48wtlOQh+rO0kkjPPy3gtpezxd1zuc4zo2lT67VQtYxkUd3RWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1PAGl/6Ga8Ns4fP4965fHSm5nlUn9YgIoObjFL5ZU8=;
 b=iGadI35k+PN3rRKdn8Pfi+29qZ2X7+Fxz3VHSpZtgy7pijqkJTDVLwozYiOUn/rMKnQgdrPpd0DSfw9kQHKGgdKfUGfQbJwAKvQsAg4cH8VOexxpwWNBjdQKpFZxho9m6n/YcMxYZBe+ZDC8rwm9Oww+8r24mIRrlYwQm4AaUZE=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7841.namprd04.prod.outlook.com (2603:10b6:5:358::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:26:23 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:23 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 11/22] target/riscv: Implement AIA hvictl and hviprioX CSRs
Date: Thu,  2 Sep 2021 16:55:09 +0530
Message-Id: <20210902112520.475901-12-anup.patel@wdc.com>
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
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f04b2c5c-2acf-4a1a-d08d-08d96e047e9d
X-MS-TrafficTypeDiagnostic: CO6PR04MB7841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7841F88178142F811A03AA748DCE9@CO6PR04MB7841.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6fSmunSyaaOmFHzZiyeGu/UNIAVCyMYidH2LWZn00gkLYkpNDDJXRszkpEL047Lm4qNkINrots+UkoMPcSbF9f5sQKgjOc/fse89LmmZrkfcgLAOWq5ctqVoCdtAZdcgtyOklZxCc0HOe0STfGbw7FS/wjWDvufrCPvQs8XDdP/R8ge5sMJ1mALsknYI9sm7tz4pzvlLNN8x4T+6uOz5euG8sl6zRCNB3DP5WYaRD/WBvUxXmWfeea2DPM7dNVmDwlHkDxhSFvxo//Pd1p/+4K3gDQ7SDFQiwQwqENwVhXbh+z2ER2cbcg7LgQ4jGlZOMZcCVQrJIXljIacdmQL+iOonynoMtFgbIz6iUR/kr/ZSq2tntAQuGjaCBDgXGFKbdSHm8UqIoiH1xalWt81n3yNhqFDV+1z/ygf3snzlo+dl7P8zVnr1Vchi19h+diToZsaSWF9yFRFQcLWK6tXaUfhl9Z17tI2SzqCMNHCPdLhqOTG3CUev+EEh5WVI3K1OxuWhWRfxIdNRI0G04wte3gs+EZ7A1qb6gGaHHI5C/MaCBnvkUQzi0tEgBWlwoLkxq+XuSXNjbrHRs/2ef1iSjiTg/OLZCKAbskOMr7sCsEZZwUOBJPqDkfl1d1QraHF4uc/RBI/iZa4PkcQIesLpnt5gMqlbvezHQUfSgHSmwhiUrN748tlreXet9k+cef+UCtB5mKZC4cSOumV0z+sEFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(38100700002)(52116002)(110136005)(44832011)(4326008)(38350700002)(8936002)(8676002)(2616005)(6666004)(66946007)(5660300002)(36756003)(54906003)(316002)(66556008)(8886007)(66476007)(1076003)(2906002)(7696005)(55016002)(478600001)(26005)(186003)(956004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RBaCHYdBgw60STP/7icqrsWOn2FjBSTwExOfvIH9PWfnn/Hg2VYoaP5GRbuR?=
 =?us-ascii?Q?wFY5O6SoXkEfeKEWstO7wX1bSjJrN0i9U0v5h+O54Z+fSFI28pNHnBXWT4fD?=
 =?us-ascii?Q?DOcU8yCpNy1e5y4cApGMC0p3mGjsM8xf6WgMoIouEU04O8c+Ek4K+9Gm4SMl?=
 =?us-ascii?Q?n0kMJ3Hf20f9RipOkv9B91ype1S7mOsVsSvNTGOw0gj4LqNTQRDhpnwzANf1?=
 =?us-ascii?Q?0VoneEpBlutxze3ZmnplTmyUeTYOyUQrNfMLRByWB90XH7GcCX1FsMZw0YJY?=
 =?us-ascii?Q?FOvhb4iXCx93gxmhy9WHUlgBzH//XllQBDw0VH5i9ZmjwtBGT2/RXS9Navbj?=
 =?us-ascii?Q?1VU49esZCxtaPtV67D9IfIJTgOCBIHSijf1eRe5R04oHmiA6VNCT3R5GMxk3?=
 =?us-ascii?Q?NfJKWhlArNiiBcULTmgFZkZwwv86Re3BYH2GflRHlvN98AHS1aEsPVp8URNB?=
 =?us-ascii?Q?AsxFMVFw4y7JhE/stHy7/l9uWSzPF4Frq20U7D7ZlEEmwUQz8kS4EuhwR/hf?=
 =?us-ascii?Q?DKD52zxjUQMa8ZpSElfQ7KhleIkcAS/Lieo1VltOw+gvMDc+fd8qhGmEz7KN?=
 =?us-ascii?Q?bQBPOb4dALzbj1iWtRjP7MXuibnOa4GGcOBuTMD4yzzweKz5nMT2qovnatyk?=
 =?us-ascii?Q?vcpkHSQw/6wNG6ndrDBqI1YERYPkgqIB+sVy9PcRQ5PfMccBy3JekLE089Ds?=
 =?us-ascii?Q?D0wy4SjyAkkg9Is/pAw6/EuFrNqlssFy1zZ8bBE9W+PT7W8fqx2nZsiMd7Ia?=
 =?us-ascii?Q?sCazTX1Vru/H9hW8Z08kwyr7IyXtlw0l7FtpfXRtsSy+3Dt19p9h19pMtVn9?=
 =?us-ascii?Q?xZHQvUE2l9YB2uMGK+LIYp0ti9rrG/xVi6ktKSHKbyRzO1P9X1bQJmLDN0fl?=
 =?us-ascii?Q?qd5M9HMiv5pvEKuUMkFY/kOlUjT3qownSo3k/yZ4FjkEwd2pqYINK+oIyOUg?=
 =?us-ascii?Q?bXiPnCMXuGo/uZj5zvd12gPkoy2p4IBc4+lO2vsttoN2NgWX0a8CmpIOmDyY?=
 =?us-ascii?Q?qbXvVUwlP5lIHnc6trYzSTUB5OnvxLf/CGUV5C5MhreV3Q8E3aH4iC/Ysczp?=
 =?us-ascii?Q?P+JRoWGl1gy+1W75ltEYval3XA6y2Lz6kiqidqQ0hEKUK2rCBDAUGLhoW8Qs?=
 =?us-ascii?Q?5vpJ6XSz8KMSnC1cbZK3Qq5xJCkCMra5N7xyCnTdh/E3hS/WG8/of61yeOnV?=
 =?us-ascii?Q?RmOfJ8j7EORMmrqxayGXvFo8ysW+h73GT4lLZzxud2pFiuxtjmdPH1kyZ4Ez?=
 =?us-ascii?Q?irVYOfqI5FvnytjfNFcbbfrCEo6tzDlXPAbYQnwf0sjo4XefE3yjswK8NuEy?=
 =?us-ascii?Q?VUulp//Auc8PM1CBkjAWiOzp?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04b2c5c-2acf-4a1a-d08d-08d96e047e9d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:23.4036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMB69v5G31ljT0Rh7hDGfIsWEtae06Gl4z7V5OG61l248297Af8inyhrMk6QpIyd3kipBFwCOXos2ipIK8j18w==
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
index 284b2c737a..095a140c3a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -196,6 +196,7 @@ struct CPURISCVState {
     uint64_t htimedelta;
 
     /* Hypervisor controlled virtual interrupt priorities */
+    target_ulong hvictl;
     uint8_t hviprio[64];
 
     /* Virtual CSRs */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 62bf014fca..7180cc927c 100644
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
@@ -1007,6 +1016,9 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
     uint64_t mask = env->mideleg & S_MODE_INTERRUPTS;
 
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         ret = rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
     } else {
         ret = rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
@@ -1205,6 +1217,9 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
     uint64_t mask = env->mideleg & sip_writable_mask;
 
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         ret = rmw_vsip64(env, CSR_VSIE, ret_val, new_val, wr_mask);
     } else {
         ret = rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
@@ -1591,6 +1606,110 @@ static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
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
@@ -1981,9 +2100,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
index 36de40991e..f6d0c80311 100644
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


