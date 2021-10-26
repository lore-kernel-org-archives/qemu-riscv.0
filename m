Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBU-0003V5-59
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBR-0003Qr-Be; Tue, 26 Oct 2021 02:43:41 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:53156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBL-00014K-Cr; Tue, 26 Oct 2021 02:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230615; x=1666766615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xQ+uoogFLR4BdpvIx+FQYy5pY3pNfH/hNMFmtvUv1i4=;
 b=NFWqCTX1cOhAtlWQ86/tJ8o1QYafoHxQGkrlQbKxmjviGfJFo1kXL/NL
 4EgnkaBoKFlCy+6jSTvzr4jsbiVFlEp6HdRbcKAyjIvjxVXuPkLbWzWZ8
 ldryyBROOQ3dT04qsZcoUgtH5C+TBWPgNThccbS4DXXSuRazkWDh//P9v
 c9QsFY838x+ldY7vhf753jVHK6Rj0ncHuEBiIs0ZqzmUKldugep4Ocx1b
 4mcNgc8PuTssu12jPKnEZ5LlJSCA4mYX19SglrVU3cDX5j7a2RmbmQ+vu
 fjD5PbRSfrO70klflcofU9uOeCMw60Cgcz+KYQ6fPGqCTFCuTvev0sOyl Q==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="182854768"
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOy4isa2fZ6kJUKIKKU7okQCQ/JnBBOlCvqStwkuqaDPq9ClF3gmDNmnBAx1ogjBrJzHK0XwoepkjAz4ThCIB1993och8I5PRqIaaHDlclRIY0A65NtWt/Dzuvo8QJpDuyuyCnhPnsNDwtZH64A1ioeiWJp0HrflsK33taAcVUZsEbFiqGB0ftWurEg+eXt+qpwJOkbJ+rg4kT5Maa3CPQ4/BBuTXOH1W7s5q+ABrSTquMOZW8qwUoQirBq6iqE+5xX6zQOGLq7IvtBpKdfB3yd7B1o1gUamLUZoMht+Xh++8KdwklOCkEbtacrTEJSLs56Z9Y0AgpR6erk/yH1jcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlHAPG0OuTGyaL39JRZZDmoqnAC97fPSA6n7pThq9R4=;
 b=CgpMoy0VfYXPm0778u/7FTKxlF98llesoiEkLM6lxzpBKvzrnPIaO1H66sVG7Q6HjAl5t3SCM3aP77Lm1ut+L2V43NV3yruRcQpKXdTw0fxPS4dhwhtV2B4gA4bfDJSGCeWpC6jZguDXrjKmw9hO+0wyszTvZZUnfaSWeOzDhUPpXMpHJ3RmmZZLE0z105yhg98HBT0pzNoyBLLumObvpi/a1MRRGSTFNVC7PnY1kWGhLAg/90RAiacL57RB8rOVHtc3jZjEhcpGOl8EvGGj/90HZ2Iyp/tKULnzpkSZBvXsuEJGi8T9dhUJaS+YIvNgCBVWtP4W+IQoQP8tnF/WJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlHAPG0OuTGyaL39JRZZDmoqnAC97fPSA6n7pThq9R4=;
 b=dVrEfgissWyDj0HM6Uqq+XuDT1VRIqTmy2cI1dsbBrv849ZPEIYxuaLzYS8ADl3leCc3rdYCV0PM7KXqzBFrb29/uo4ZGldGA4vgKH+prHO1c1iGxSq4iCquf/tMyFPjSmtCx4p3EhRaNU/cFez6+7Shgj2/iX7S+cXbaYBPBEY=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8379.namprd04.prod.outlook.com (2603:10b6:303:142::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 06:43:33 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:33 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v4 12/22] target/riscv: Implement AIA interrupt filtering CSRs
Date: Tue, 26 Oct 2021 12:12:17 +0530
Message-Id: <20211026064227.2014502-13-anup.patel@wdc.com>
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
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99495c71-a509-4015-ec14-08d9984bedd6
X-MS-TrafficTypeDiagnostic: CO6PR04MB8379:
X-Microsoft-Antispam-PRVS: <CO6PR04MB83799DE906A11E971B604CA48D849@CO6PR04MB8379.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rWPKlGc6nrtZvz/5Sd8f9empCY1FS8VEnb9N873ookSutUXx9X8W6B05zT4uSIOGVuyuakBJ0UIWmDYHWlFrW2XTJX2QMKvoeij9ZZaLZCm+BW6itMoSVkny1JtvahML2wEn+1fqVKwT7b3uLMX+0UttHPV2qSEXB1ZG1AGYhC3ZSYsybTR6Mz0MhCghjSfl7A9vX8JwredD3UMbsCk2PXxeGnD/1S83M2qUJ8lM9UJi7M+lywYQzdU5dJj93xfsZcU1HgXdZFqxKytJu4+i+VWZiOFT9hCDbTy/0Xd2EhcIQ6ZAGtTG0+4BOo9eJm6IrkVmhZy+mHzRMwNjwRtF/bF8hR3THmORjTsv2J2wR7wUZ5tsI6NnazVT1xsx8tJv3ATcEQ/us3UCfLL1L4kkwF11ScMbrNHzG74gv6nQPBG1QRwbPvAR+YBcPKFS4i6nFhugyYUN+lqiqAQ2T/1TAs6YxZGiZxNyUDf28Sn1XDtFifAQVrMO6FmzvoSuF89veJ4WSlpFyCtOa0mHoVJYAGEQd5rAuaO+Ic4Om3YUQqaD7d8yQfdTajYlmADKnAcL53VmAztH9+H+y0sR8cUPROZ8b9eJq2UJdJMp9fhaUBL31CFe2hYAMyjoVnI0dRXbnVMcNftOu+sD5Q/BmATD6mcWZR5Fnx+CFz77m6xKWGZcrVSY1NTYZ6+KR8rELvTwkqP6Gk1WxG/LUVvFq3+TGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(186003)(66476007)(4326008)(110136005)(8886007)(55016002)(2616005)(1076003)(508600001)(7696005)(2906002)(38350700002)(26005)(44832011)(66556008)(86362001)(54906003)(8936002)(66946007)(6666004)(36756003)(52116002)(316002)(8676002)(38100700002)(82960400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z0+w4+vq9kfY2yTTOC09qWwFzkLEN92P52g8sSTu5kYIpW+jjppQ7Nge7KeS?=
 =?us-ascii?Q?bfOl9MuCeGd+dzjCbRuq02nhyAVk4yoGYPYovU2XfImhiy/iRPwSlnep0om8?=
 =?us-ascii?Q?lCTgaUANTmXhLrXPgVj5N97ZTdrNleHgzL2tyonIoJCElURnt4wKkbVstVSl?=
 =?us-ascii?Q?/T3ggCVp/kISAQJk4OvwrfAdYjcMIHnOOUMlvOY5n7VjEaNJ8MF4hQ50SjO9?=
 =?us-ascii?Q?cPyGoVid63pCSeJ1qxXGx4QKFlDjTyu51oVaGwqGhCHRpOofagblTGbAZ6Ei?=
 =?us-ascii?Q?E+TAmZfZ56hOFTLMB3GQH0FsGKDPjYSfdnWiRHHAvrsV8LXpK+5klLbKTvgy?=
 =?us-ascii?Q?bsxA/XaEHKoVKQc6qzaA3UJIpAk4YEfPGNe2rEe/0bH7mknCZB2aFzL7IqqV?=
 =?us-ascii?Q?T8oWEF1WhEm1M84bTFa8Yh3eQ36n0c5gRVFuqU+xzyYWIc+1tX2Icz91aeJr?=
 =?us-ascii?Q?ETbAjbdzv4ZZoeDbPhq/P2rBye94sHGqtHBhapbPn+XhLNAXisaSFZY6ciAU?=
 =?us-ascii?Q?lCxMIAkATzNosPpCo3c1G0ObBWcpRMiudhpgncVQkLXC8lGB63XFq+RViNox?=
 =?us-ascii?Q?mPjh7MCadLvvT/sKXROCd9HZGR8JHnhDLZhw33U+7DCZql0ckywt35Pe5sR+?=
 =?us-ascii?Q?xriEz3FhRsfAUQNVJEntWr/XIIjF7bF2xSDaN421a56pxEqq3JskoEXWcBVJ?=
 =?us-ascii?Q?IX/do/bPoht1w4ZK6sC2U1sp0QPDFhM7mJtG1lxgIg51FHJ8njfV0MOMLrTh?=
 =?us-ascii?Q?be7Hc0RPRUK2egNzdeEpuoZp+gY/Fk1B9AaxYn2g1HhpZNtuaNiL64gbrDTZ?=
 =?us-ascii?Q?VF204hrhzox4hiJxWisOmfrvOprFSTe8dlMC3Hwe8xDe3KkVHCnTjHccxxHs?=
 =?us-ascii?Q?H7kUHgiGONiPPFTI4jJt86N/3onz3sLDCGsVsQJMjdStkd+mvc8jXy0feiMm?=
 =?us-ascii?Q?aTGe4zBCzcfPZ0PaT4Rx9v5DTpDwiOG/zlc7FCuz+nIhYUjUkOqKp26yAauT?=
 =?us-ascii?Q?ZIXpsTaYRR0z+sS/pPXkgH7r78frGZgdM+bNQSdO/NeVWbwqKRTwUk05HP/4?=
 =?us-ascii?Q?znUhItx1wFgslX+Ul/qKTayrpGKliod2gk+Ol8KRu1Ra+B3ZNb7mHfoDSOfE?=
 =?us-ascii?Q?SU7I5knLE4bY8oY8c2cAkQhxbZncn0Q2pLVei2Pzo2kRUXROqMB+1fpSgBko?=
 =?us-ascii?Q?XAi/xtM99l/7A/pO1fzamwUgmp3mgE/EPCe9SgNOEzKwCyrgbw6Pf3ZwdIW5?=
 =?us-ascii?Q?BBAVhlgU5/VK/cPoyL8BZVqmyVrVkiSOOmnnne/dOtmA4CeGMyPcPbRhY/WG?=
 =?us-ascii?Q?MCtAXqvE0fayQ5yYQ9j390/fQj7A/GS/JAP7yDBmoRgCTEheo726x+iFr82t?=
 =?us-ascii?Q?wruKnz93Tldii91oBtvCvQ/R+gtf2KIfsUHh7G6Ty3osaPNYaiGqInChfVg/?=
 =?us-ascii?Q?S0BvpJMMV+OyAGIYS8CIcfNoItGOgCt57n4WmeqzWqk2zJe9OxPWOW0XaRh/?=
 =?us-ascii?Q?1JLJwAiYZVKXjS93XYe+Y2iY8GZ+zdApgDk/YJi7Ec7yDANSSwij9y6mufXu?=
 =?us-ascii?Q?uE0RYEZsUszk20hOiF++82artLUE21hUtVJFYa0buI4xashIeSiZ1RJ6icWg?=
 =?us-ascii?Q?WrTYBm1uHdO20S6s24n/bn8=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99495c71-a509-4015-ec14-08d9984bedd6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:33.0915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tkhU32zIOGU9p9XPPT/RonutfujuHd+8PHTqvykDPcaUW4EFyLSSHhXQmSvuidk8uGu1Lt2KPHbSLnrW7S5xzQ==
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
X-List-Received-Date: Tue, 26 Oct 2021 06:43:41 -0000

The AIA specificaiton adds interrupt filtering support for M-mode
and HS-mode. Using AIA interrupt filtering M-mode and H-mode can
take local interrupt 13 or above and selectively inject same local
interrupt to lower privilege modes.

At the moment, we don't have any local interrupts above 12 so we
add dummy implementation (i.e. read zero and ignore write) of AIA
interrupt filtering CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/csr.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 46d0cabbde..43ae444774 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -153,6 +153,15 @@ static RISCVException any32(CPURISCVState *env, int csrno)
 
 }
 
+static int aia_any(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return any(env, csrno);
+}
+
 static int aia_any32(CPURISCVState *env, int csrno)
 {
     if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
@@ -515,6 +524,12 @@ static RISCVException read_zero(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException write_ignore(CPURISCVState *env, int csrno,
+                                   target_ulong val)
+{
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mhartid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -2071,9 +2086,15 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Virtual Interrupts for Supervisor Level (AIA) */
+    [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
+    [CSR_MVIP]       = { "mvip",  aia_any, read_zero, write_ignore },
+
     /* Machine-Level High-Half CSRs (AIA) */
     [CSR_MIDELEGH] = { "midelegh", aia_any32, NULL, NULL, rmw_midelegh },
     [CSR_MIEH]     = { "mieh",     aia_any32, NULL, NULL, rmw_mieh     },
+    [CSR_MVIENH]   = { "mvienh",   aia_any32, read_zero,  write_ignore },
+    [CSR_MVIPH]    = { "mviph",    aia_any32, read_zero,  write_ignore },
     [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
 
     /* Supervisor Trap Setup */
@@ -2125,12 +2146,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
 
     /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+    [CSR_HVIEN]       = { "hvien",       aia_hmode, read_zero, write_ignore },
     [CSR_HVICTL]      = { "hvictl",      aia_hmode, read_hvictl, write_hvictl },
     [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
     [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
 
     /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
     [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
+    [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero, write_ignore },
     [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL, rmw_hviph },
     [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h, write_hviprio1h },
     [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h, write_hviprio2h },
-- 
2.25.1


