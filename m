Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBT-0003UG-Hx
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBM-0003OR-UU; Tue, 26 Oct 2021 02:43:36 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:53168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBK-0001ly-KN; Tue, 26 Oct 2021 02:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230614; x=1666766614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CtHtkLXiLMCVmNIUwSdHSamCeIOuJ4YxOeC1MZGTmd0=;
 b=IbEoIojng2mpayaEzNUaEAZFV4WR7riBqFwWGGKj9PF8Lx+irb6saVKs
 NTCB+W+BIBBkQU3mAZ1Yj2gorAnIOV3VYbSHoKqvJkcNy5LoJ0vRqlV7g
 Blcr5qcEOKlvlPsSvYLCQBkX9RMwSc2+ZG97HkNO8+sfJxo0OKe3amgVG
 tHW6gGLVo8Ubju7M2/hjkMhdYSqhsQJOLpjOi4cg3FccFAoH9cxXVAkJS
 1mWSmlgZRJ9odWlVbiy4T/bnSRSeV5JOf8qC19B8BKz8zdI+6Q6MHpvSY
 DbAfSVdbuNqV/p6UPj7aJNp+D4Yl5zogz+AlBucIFBZlxu0VT6ocK84ku g==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="182854765"
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgzvLSHUWH3gqYxE2nsqba3LXO1Nu5DqD4JXx47kAJupRR09vs5XVKlDyPuBi5QTBrxkTRhvIv65RZR11JbcFm9qUtNrpgkv0tf7/7KEqCT19TOEk9SH/yivSkFZ1ocx/zxWL1NzRGRgMJuYL5XiJ4P66/UrThHuTAskck3GGu9G1sDpvYzksCTSRs+T5KkroOZaw2H+z66PI14hXMxREibrS8Y6tqJVv0ewHU38Zvkx2YCB9CDF5oIUUkfceBbyCjObWtAz0f9g0YoWuUtMNRxl2rLmMa40n1TYDDgV7vj+f+ppw9R8FOQQq4//oT/8drbr7m7TDeZJzSGIjoRE7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/Hi4UdfODeNucs5WPgXOslYNww+VY+KApy6XktK8FM=;
 b=BY4V21NhjKsFpcxhJolRgluRmalfpNloeRV17hBf32kbPhxR4hQoqlaQWOsA/xjWSp/m+BbK+dfAG3HQhkXM3i337Yp2pd77SOjpVM6ZRVzhF5LFa9vVTnsBcrs7Jk11ZwpH8uJvgAHCQnEx9p9ayOtPHwjq8C3vgiedqULtGX7BXjqlksZWSCR/NmJb0utG4MTfq6DBSYxyZF5E5LhY6EVRNDlSQPNDyOGD6JloP4K/Wl91PdmenLY0PCh60RgrTVPrjngkoOWetwpPzBMclGdnrR+qEXT0nb3YWUi0UB/pged3Ikd750/dXVnnPgvSh8kejqU8Q8vp1ViyQtE5bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/Hi4UdfODeNucs5WPgXOslYNww+VY+KApy6XktK8FM=;
 b=VU31y7cMZ5ETZZBbkMch6IvO1taMSaP0Lw5YhwDYzF9aSPuHAD0ydq7S02k2TxrGqf6Oh/6J8sEwYhwKL6PfmDoKNbLle0t1mGz9rP/k02fPlSQhS14AfeasoM0cVbEoDR9c3gLA+kksgsBG8j0a02aehYCT8WgbohWq93zN+iY=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8379.namprd04.prod.outlook.com (2603:10b6:303:142::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 06:43:30 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:30 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 11/22] target/riscv: Implement AIA hvictl and hviprioX CSRs
Date: Tue, 26 Oct 2021 12:12:16 +0530
Message-Id: <20211026064227.2014502-12-anup.patel@wdc.com>
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
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f89a7037-f293-4074-fed9-08d9984bebfd
X-MS-TrafficTypeDiagnostic: CO6PR04MB8379:
X-Microsoft-Antispam-PRVS: <CO6PR04MB83797DFEA18CD8262428194D8D849@CO6PR04MB8379.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xtHsVM58LLw9lP/4JTwdVNwUka548KgfBIdIyy+Nwr30femFiBK2Qi5L+LJsChzACin2BqKktm/lFl1YawhG0JuzLIVV+4BHYFN4TiE2h1fH0+MT2HQIUsSez7Gn6WeD3+Y7pItdvWb6fBp/aHkBxnC3AD1zNyIyiBaSIbsdplFE5xyYJVth49Gt40nnNtUcIlsSfNGAoejAeGLBQ2GVrwaFjEmrJ+W7JoJNR60DBrE8e1C89zzCMurBg/rVYOFzFNvoAgP0dw9JN7jIrTPWXIivlzv2l9N/NGA+UwBK4MUTYGQJmmFdovIa3swQ5LAX9FWBYrH6FdIi3M2g2kpOr/6UHt1L41/u81iC99qzO5baym1cG1Ibz2aFlCl5sMjvM46Cy8IjgKpQrP+JvT3dyO68wlTTfTr/1+ZKxc8f1r3qpKM9IL0+U6LIxwH1dClFhBkJwH0R+t5iyCLIsztWjg9/w5wk/oAZzv0CkFOr2E++ltBEz15rzxYzWYLhWtfqv4OyrsHa/q4aTo1xgoJjTnzqIqincB4y7ILkjaoHj5Cxeki7/Kgx04QwnBA/IzUBf+2D72AJArQqzbBAZ5BNhwELr25Gb30u+gsvpb4hPo9P3ZaO6a7qLV+LXkkYsIUWdWKa1hcoxYtZPi0Pum58zQt4/Uj3FQJDIXq1vf4JMBPNjojv38FG349SeRDNA8cJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(186003)(66476007)(4326008)(110136005)(8886007)(55016002)(2616005)(1076003)(508600001)(7696005)(2906002)(38350700002)(26005)(44832011)(66556008)(86362001)(54906003)(8936002)(66946007)(6666004)(36756003)(52116002)(316002)(8676002)(38100700002)(82960400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?du6hDde0Iw8vyj7xzSPQ+ilEuUPkAXQcsiGVrhkO3L+EiQjVza9B4TV9ijoi?=
 =?us-ascii?Q?DjXi1clOGLcahtW8vnnRwg2WQk9RnzmMnrPQ/MU7v7PwPltt+9Vyw4Kxwcmz?=
 =?us-ascii?Q?OeYL62cTrwPiVlKEriLwfdyHstNFpUf2qUmKstWQ2wh50i3rM5fhGPF0gX/U?=
 =?us-ascii?Q?UcEsZvFTp1J0e8pRe4JeLZYdHzUJsiR9GHfpkZ51AwdtASiYQ1bmTUn3/4Z8?=
 =?us-ascii?Q?d8YU2b7dKvfigAnROPUdxPJgeCoxBjjp4pKulwf3gyYGAl5gKtg4ixw3FgF7?=
 =?us-ascii?Q?90/T7M3b6CFxi4X3Px2cLUdGeoDVzm3iEe6kpDn+FC2nHhV+Xymrhs+hKMkW?=
 =?us-ascii?Q?gSmEv0l7YzwQJOo9Jc0dzZMhk4OtG66hqsHoXMutot5T1ipSgZSdud0xfAR9?=
 =?us-ascii?Q?CxDStpZ/zsE3Q2tr8uPdhagGlETdRBJ6i8H63rUuasKLs6iFeB1oT4zoH6Je?=
 =?us-ascii?Q?g166iGEG2iUinGnwHG2RmQ1VkETNAe2XlM8++G4f3zkcmCh8pnhZ1pn6obkG?=
 =?us-ascii?Q?mlSlHOLfKULh25nuOuHy4TSjaezE46Qs1xvh2eCQg1AWRSfv+YQHzbVO0/M6?=
 =?us-ascii?Q?TReV/N5HiGCbA8ChHbMsO/OEKGybRD0FzlkHs8ar1Ll3pQqLRLlvo4fUzHpw?=
 =?us-ascii?Q?cGe1a4/T787yh8wr8YIq1cOUa+Affd1FA/t7VL3bI31rj18X0Xstt5ST28hS?=
 =?us-ascii?Q?FceIPDaxIaorb9UCqJrtUo1ZS9nh5EGMrrCHmR/QxopkVQFAo2Tn9VJryIef?=
 =?us-ascii?Q?EbMPETZRYZIWjUt4jXRxtORvfNxX3RmzzhyolRHNcQmJS1wGcQ/W/cFDt7e1?=
 =?us-ascii?Q?EW0vB+61RaUDSe6ol/SPwcjx+O/2ShvffgDIQI24dEC90v+gFGeqQj1VFaiq?=
 =?us-ascii?Q?YIDYx1eZzUPLQCgU2VYM15v+K4TLG3Ft7qRJIZdAANgw8EJehTCzY9WaRXTR?=
 =?us-ascii?Q?Zkrte+qHGRF8YGH2S2+6fF4T3dwd3KoFveqDRs4kp53P/YfwU+Ehbsv9OdcZ?=
 =?us-ascii?Q?uh2I+kbiMx4HgVDIIgccrhUdBtsG3Qg7sTIjoCANL3tmwp3tPOJoNjceePKR?=
 =?us-ascii?Q?PCyXWYXd6KR/mq9DAJzdjhURge8tcXmlxeRTEHKD2w2lkQBVORZwON5oz6uP?=
 =?us-ascii?Q?JFThkRnrpqMzCyOa8DYrHRQMjrFbPrhhTpMYLb8jItLTjtOkm/cYocUILZUL?=
 =?us-ascii?Q?ozm3iRkd6VBnPB4xWt9tniV3C+eA+JtRDTDrCP37K+WQDFYOQu8Dd6ggdtge?=
 =?us-ascii?Q?a6tn13KdmRXR9yvzZbCGl1Uld/8c9bxB/yvvNUlta2s5V8DwUPf/7y3bM/WZ?=
 =?us-ascii?Q?kP/L/jz9MwCERic4W0O24A/rnAJKtebJLN9E59fjbhGMGrTxBS515FiasqMP?=
 =?us-ascii?Q?fxaDfO2AAUEqUBaHpZEK/Rrz2V5K6aFU7BDncdQNPkdvPKzIHZtpt3AN6wIb?=
 =?us-ascii?Q?1qpl2kOTIfzuHqC/+56W5Eqen7l+iMl6i2JzT4jujJPt6jyEw3144LI/Alzn?=
 =?us-ascii?Q?muQM+ME5YZNHIrg4Zg7RHSuOGAwapnl59nRnpIKP4dmb0nbDEKO26F6W87a0?=
 =?us-ascii?Q?r1NljCax7x5OYVna/2VkTtaFSa1NJP0efvzAqmUQBM6sbTX038bRv1CWkUs3?=
 =?us-ascii?Q?ajy+YqYUljacaK4xPcI+X7Q=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f89a7037-f293-4074-fed9-08d9984bebfd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:30.1206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEIAJ8FDjZMoRytR3ID9ABN4iRjjl/52FukGbIEvdYPoQdHYfabQp9clPboW3VRQ/PBZi6Oub5arl+/hf1LbsQ==
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
X-List-Received-Date: Tue, 26 Oct 2021 06:43:37 -0000

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


