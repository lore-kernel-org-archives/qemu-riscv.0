Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKCuL-0004qU-QS
	for mharc-qemu-riscv@gnu.org; Sun, 29 Aug 2021 00:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8689bb0ac=Anup.Patel@wdc.com>)
 id 1mKCuK-0004lV-9U; Sun, 29 Aug 2021 00:59:00 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:4865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8689bb0ac=Anup.Patel@wdc.com>)
 id 1mKCuI-0006bm-3k; Sun, 29 Aug 2021 00:59:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630213138; x=1661749138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CUt13+jQGOL7BfRPQtcXuTF1VM6YBXwOoOj6KD/JBoU=;
 b=qpOOh37gwKMaSGfeLdzmyQx7839uPL1t3nTCgkkz+tMgmNG0Cm1YZvoM
 fvewnaG/nobRUM9pkQlFLwbmETEKeuGP8fcLd0ba3+K8UTw4326Fr9gdI
 HH7dGjIauHPuYWK/Cy9sQMrMza4AqinkMnNLTJO5UwkHSWXE4MO//L3o6
 9Hf6IW73LFKiyRT1NLAM3Tny61jQ431F3QBbVDhSZML2lWJIdBZOZOigD
 KnxdjGGBQPdpWcJUcnXk4lmIGQDi+DnDYO4PohixpKfHVfFOpdd+4YIih
 GF9gol4gOlUwLQJXGOO1kvqQuHBxqf232uzT81sADDHeaztLpSEhXdSko Q==;
X-IronPort-AV: E=Sophos;i="5.84,360,1620662400"; d="scan'208";a="290288246"
Received: from mail-bn8nam08lp2049.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.49])
 by ob1.hgst.iphmx.com with ESMTP; 29 Aug 2021 12:58:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAVZY5dIlGUQaSg9C7KcpMMr5k/lO3g8r7wONwUFvgR+DsWmF5chi5Y6n6GL0fnGuma5v/veVUcB1v4VtJLTTFyT4My9jEeM+0ZGP+SMrrdGrw0DAqezEAox8r1RJ5FDahynEOX4yIo0Adk7JPcYZo5HjhiVB2ILRY3YsFQp1lZtKP3yYNbrRJKAUQCJkkfJu3DY2EN7crQdLPCgqmVqBVCCVeVLUH1X0N6VuZW8sMB5/GYi/bKu5eo0FKriBS37Fp9fjzRuANtRkEwN7I8g16gUSoGp8COetPcIGUFrAMRg2szwMsttYjKfsl30uJlxQILEojQ8EAU20fMveUrjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RSg/4Q7aPry0+DP3uloMVkV532ivit4NZfBDGR/Mzo=;
 b=QjqsiRVOwXrVXTGUe/moWd2MvZpg7VqJtYNCZHnkTv0vp8Ub/7dgaezVJzmeeI3Ig/gMlt8TUe9eY6rsX9GKPwHkE0hGvuybc8LIzYyInUhKBMLNjVKIUZNjKQZlh7hmF4qRSpq+3atkqIdIuKv1rzbMB+RRbTZgANlCObfOyQ5c62XnaRS4qrdeyjOhrlROTEMfYDIsN0bnOEi48pJcEtglHAy6mzyXSSbXEC3k/AGGWY5jch3ZBRvnldHfNub8rPPTIuDr6KRrxf7v3vAaMfWoDjkOlFu6fE94C/GiGxpj+0TNqQ8KSiA6ckdIEUqI0vc867fx00j7v//2xZPZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RSg/4Q7aPry0+DP3uloMVkV532ivit4NZfBDGR/Mzo=;
 b=QPZk6Lw0lEI4NGZh1tUEsWUmOXqOQONyQPbMhnudslnYlWRWy8hDwjZLScIBc6M8iMA5P0XJL9Uvi0lpof0DiohIOEKyxH5mAMvvPHOHALgy7QBVjdamGgEEGXHezzLF5MKk+LRyMl3ULzI2AnANXIuR2gmL8waiK8SvuJXklDE=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com (2603:10b6:a03:3ac::8)
 by SJ0PR04MB7792.namprd04.prod.outlook.com (2603:10b6:a03:3b8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Sun, 29 Aug
 2021 04:58:51 +0000
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514]) by SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514%8]) with mapi id 15.20.4457.024; Sun, 29 Aug 2021
 04:58:51 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 4/4] hw/riscv: virt: Add optional ACLINT support to virt
 machine
Date: Sun, 29 Aug 2021 10:28:14 +0530
Message-Id: <20210829045814.69744-5-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210829045814.69744-1-anup.patel@wdc.com>
References: <20210829045814.69744-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::23) To SJ0PR04MB7821.namprd04.prod.outlook.com
 (2603:10b6:a03:3ac::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.185.161) by
 MA1PR01CA0168.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Sun, 29 Aug 2021 04:58:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b7beea1-f786-4c68-3d16-08d96aa9b168
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB7792EA5EB7E3D570916ED4D48DCA9@SJ0PR04MB7792.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6sk1FNGTYXoQjXazR+HpLFzy/DcALWuwm56gymGEdLGx3kN/Tbooc0hG/qjEBbsn330KvSVojaryLUTBHruoVksEtL3CERdlte5/DX+A+RJDZfW1l1z+Z0rmA7d/xY57ePwGkgIb3McTEcy7uEfk3fNxFa1chTYo5U/8W1CtBuETUFf9Y3tbExcCKIMoDuI95atGfMOInCRFE1v98wIQQR0fret+MSTVSQ+eTy5joMrM5S9ljDYzLbKzIl6A4Qbr3hv9Pyb+4Cet0kGkxuPzKJdwgy/LYLWWi0KGDOEK5wMn5fpioMKDJ9sSu1tKkTkzE63WMoS/f5imcI8Q7/AWHdU8gN7zN1F3wAaj3a74INwteRPZ7//kkiW7OKMtC/kSh/13TIfMLC2CETqVUxgen+mK54sAW/P7TIs0ZcUQUAkRVJjWM1bSzEI4SLBFdqVcGhDCL+hKvg6UBSc2Y1hUFg9mPI/HAB8shvNSU3o2g+ZUg5NuE6rcR4KkdOZm5NcYmfFOeDrva7aFxRlbXOm9LphChTZrFKtASjRy2OvAtUbqCWWkY9AcwO0EjO4cBArQ8AzKWw4foxv1lVKT+Bkl764xFl5XurMZ20H2qx3z18Jq2oHn/97iZa4fn7f7GZkKDNw440rSyU1CYR4AbzTNv5v4cEJqxuWI6FWUoF876uelq6SOMujimt/hv3F3KonEAos7Kho3ki6LbNRjfT3RGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7821.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(8936002)(1076003)(2616005)(5660300002)(83380400001)(86362001)(956004)(186003)(478600001)(26005)(55016002)(8676002)(4326008)(38350700002)(38100700002)(316002)(54906003)(8886007)(110136005)(7696005)(52116002)(36756003)(6666004)(44832011)(66476007)(2906002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?her9mieX9U/G3mtUaPutYIszWe6dHALRlgILXX9BsNxKjNogjkFB/yFtuMG7?=
 =?us-ascii?Q?ZtV+T7xuqxT9jz0zlbFwiEJFfC04Naxey66xqEczWaQKENPWWZ7RWpM51Px2?=
 =?us-ascii?Q?rjisrajmeUZUpPvxtjkcuXF/ZjCAQA4xlDqSpXTHCs7KMShh7eXiI4Ohqd9c?=
 =?us-ascii?Q?16pwNWf8Mj3EcV9fp+uqdsoNt5uBIAihHCpPQHwbrqLbF0HvokF8ygZIjzjB?=
 =?us-ascii?Q?BI+sPjJ2gca9b4I9KJjUweN4inoxrQU730/vwK2zjJob8OCxQfd1NTMBb5UF?=
 =?us-ascii?Q?opjLJjgNMVNpwPyb6AwbiOrDlOiM9KwGX7lo04UmVpaE++2HOCbf4B/2Xnja?=
 =?us-ascii?Q?PJFwBZ3+mi2PFQQEnXiaYzLFJNZtR1+QAGJFgjxT8rmvWCtS7q4jSyQ56oCI?=
 =?us-ascii?Q?5jTlBOUSD1QQSByXJuUrum0zRjQLSb5Wxys0rvrgNF0om14wa56xbp0pQlRE?=
 =?us-ascii?Q?ulxXa+LSAjOW0Df/K1RB0elQzSTpyz24hqD5YL+l2PrshcRlSopw2yL6j1eg?=
 =?us-ascii?Q?V4USq6nrCLJWMkN/JUklX3GqnLd4ScEV6KmVJb6eXw322y1HZqJNNMEoUKUg?=
 =?us-ascii?Q?Ux5GgvlZKM7M4doaPZUBLcQ3XrIITnYYrU5fil5n49c1kietVtrc3v3IL8v3?=
 =?us-ascii?Q?+k+9Euvv+Ejct/3ktapUrZ7XCoPgPbRidiwdh8RruTIqSvZH3EAs0B0X15ax?=
 =?us-ascii?Q?WCA5Fx6CcmPFTngWwQOQu4Htk2hQSKPejFxMCHCmLZg2JJj+RsNZLAwxGevh?=
 =?us-ascii?Q?OJ5AM+heH3L3lF5W+GiMksMZrMJnD7vuUXLmVziQnl/q0x87SvcEmMb3hLgM?=
 =?us-ascii?Q?WTyiO+T7xV4cVAdfXvpgYi54fW7N4AnQiZEUCDh5YPlCOcchOeSnVBLUTeWT?=
 =?us-ascii?Q?Qmh/m0HoLhKax3lhTDGmr/84VkTDKMYnpgjAnDJsLIey6aH3n8kDbS94Lkpu?=
 =?us-ascii?Q?bf/Ft6zRBLov8HU61KCdg0tZG2LGsW7IvTulsQgcZ0lGCwxBc5DlvMB+ADDA?=
 =?us-ascii?Q?y7LHw0D9Kxa9DFkqVRmF2oluttO4lSiBtUZGrfqlX9deJG5tWp/zroosnSE/?=
 =?us-ascii?Q?ARq/kZZLIsTaIIDdlSOMfZ5VxMuRPEVa9O1SgGfLxjLU5w9Ai0SawkObb0eO?=
 =?us-ascii?Q?j5GNRdXdOsjHxkYYCepldABC/K7/u69UzxXRABsBcpX2jjBE62Dn9ytgWoTL?=
 =?us-ascii?Q?hwNImCy19+V50QG1haV1gWFrc8uMjmE7ooqvDSwoL0fdyAHSsmdQcm0ImNF+?=
 =?us-ascii?Q?jJK/h5erHLSD5oSX1mAYqmPQ7Nh4bj9URTFMotcyJulNywu/UNqvtpVPw08O?=
 =?us-ascii?Q?r8zqKXI0hEVwZvXmgo8UpATZ?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b7beea1-f786-4c68-3d16-08d96aa9b168
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7821.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2021 04:58:51.1466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Catfox411yV7o7+GH3LOecgMNApeCT4MsJQnaP/oHuxPtv+N0fl9e2JA84xacFXqCWfmbvl4j84qRw6FSSxiUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7792
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=8689bb0ac=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Sun, 29 Aug 2021 04:59:00 -0000

We extend virt machine to emulate ACLINT devices only when "aclint=on"
parameter is passed along with machine name in QEMU command-line.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 docs/system/riscv/virt.rst |  10 ++++
 hw/riscv/virt.c            | 113 ++++++++++++++++++++++++++++++++++++-
 include/hw/riscv/virt.h    |   2 +
 3 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 3709f05797..113c0b8f2b 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -53,6 +53,16 @@ with the default OpenSBI firmware image as the -bios. It also supports
 the recommended RISC-V bootflow: U-Boot SPL (M-mode) loads OpenSBI fw_dynamic
 firmware and U-Boot proper (S-mode), using the standard -bios functionality.
 
+Machine-specific options
+------------------------
+
+The following machine-specific options are supported:
+
+- aclint=[on|off]
+
+  When this option is "on", ACLINT devices will be emulated instead of
+  SiFive CLINT. When not specified, this option is assumed to be "off".
+
 Running Linux kernel
 --------------------
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 48c8b4aeb2..7259057a74 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -49,6 +49,7 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_TEST] =        {   0x100000,        0x1000 },
     [VIRT_RTC] =         {   0x101000,        0x1000 },
     [VIRT_CLINT] =       {  0x2000000,       0x10000 },
+    [VIRT_ACLINT_SSWI] = {  0x2F00000,        0x4000 },
     [VIRT_PCIE_PIO] =    {  0x3000000,       0x10000 },
     [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
     [VIRT_UART0] =       { 0x10000000,         0x100 },
@@ -282,6 +283,82 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
     g_free(clint_cells);
 }
 
+static void create_fdt_socket_aclint(RISCVVirtState *s,
+                                     const MemMapEntry *memmap, int socket,
+                                     uint32_t *intc_phandles)
+{
+    int cpu;
+    char *name;
+    unsigned long addr;
+    uint32_t aclint_cells_size;
+    uint32_t *aclint_mswi_cells;
+    uint32_t *aclint_sswi_cells;
+    uint32_t *aclint_mtimer_cells;
+    MachineState *mc = MACHINE(s);
+
+    aclint_mswi_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
+    aclint_mtimer_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
+    aclint_sswi_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
+
+    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+        aclint_mswi_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        aclint_mswi_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_SOFT);
+        aclint_mtimer_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        aclint_mtimer_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_TIMER);
+        aclint_sswi_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        aclint_sswi_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_SOFT);
+    }
+    aclint_cells_size = s->soc[socket].num_harts * sizeof(uint32_t) * 2;
+
+    addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
+    name = g_strdup_printf("/soc/mswi@%lx", addr);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "riscv,aclint-mswi");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+        0x0, addr, 0x0, RISCV_ACLINT_SWI_SIZE);
+    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+        aclint_mswi_cells, aclint_cells_size);
+    qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
+    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+    g_free(name);
+
+    addr = memmap[VIRT_CLINT].base + RISCV_ACLINT_SWI_SIZE +
+        (memmap[VIRT_CLINT].size * socket);
+    name = g_strdup_printf("/soc/mtimer@%lx", addr);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+        "riscv,aclint-mtimer");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+        0x0, addr + RISCV_ACLINT_DEFAULT_MTIME,
+        0x0, memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE -
+             RISCV_ACLINT_DEFAULT_MTIME,
+        0x0, addr + RISCV_ACLINT_DEFAULT_MTIMECMP,
+        0x0, RISCV_ACLINT_DEFAULT_MTIME);
+    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+        aclint_mtimer_cells, aclint_cells_size);
+    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+    g_free(name);
+
+    addr = memmap[VIRT_ACLINT_SSWI].base +
+        (memmap[VIRT_ACLINT_SSWI].size * socket);
+    name = g_strdup_printf("/soc/sswi@%lx", addr);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "riscv,aclint-sswi");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+        0x0, addr, 0x0, memmap[VIRT_ACLINT_SSWI].size);
+    qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
+        aclint_sswi_cells, aclint_cells_size);
+    qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
+    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+    g_free(name);
+
+    g_free(aclint_mswi_cells);
+    g_free(aclint_mtimer_cells);
+    g_free(aclint_sswi_cells);
+}
+
 static void create_fdt_socket_plic(RISCVVirtState *s,
                                    const MemMapEntry *memmap, int socket,
                                    uint32_t *phandle, uint32_t *intc_phandles,
@@ -360,7 +437,11 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
 
         create_fdt_socket_memory(s, memmap, socket);
 
-        create_fdt_socket_clint(s, memmap, socket, intc_phandles);
+        if (s->have_aclint) {
+            create_fdt_socket_aclint(s, memmap, socket, intc_phandles);
+        } else {
+            create_fdt_socket_clint(s, memmap, socket, intc_phandles);
+        }
 
         create_fdt_socket_plic(s, memmap, socket, phandle,
             intc_phandles, xplic_phandles);
@@ -734,6 +815,14 @@ static void virt_machine_init(MachineState *machine)
             RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
             RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
 
+        /* Per-socket ACLINT SSWI */
+        if (s->have_aclint) {
+            riscv_aclint_swi_create(
+                memmap[VIRT_ACLINT_SSWI].base +
+                    i * memmap[VIRT_ACLINT_SSWI].size,
+                base_hartid, hart_count, true);
+        }
+
         /* Per-socket PLIC hart topology configuration string */
         plic_hart_config_len =
             (strlen(VIRT_PLIC_HART_CONFIG) + 1) * hart_count;
@@ -908,6 +997,22 @@ static void virt_machine_instance_init(Object *obj)
 {
 }
 
+static bool virt_get_aclint(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
+
+    return s->have_aclint;
+}
+
+static void virt_set_aclint(Object *obj, bool value, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
+
+    s->have_aclint = value;
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -923,6 +1028,12 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->numa_mem_supported = true;
 
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+
+    object_class_property_add_bool(oc, "aclint", virt_get_aclint,
+                                   virt_set_aclint);
+    object_class_property_set_description(oc, "aclint",
+                                          "Set on/off to enable/disable "
+                                          "emulating ACLINT devices");
 }
 
 static const TypeInfo virt_machine_typeinfo = {
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 349fee1f89..d9105c1886 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -43,6 +43,7 @@ struct RISCVVirtState {
     FWCfgState *fw_cfg;
 
     int fdt_size;
+    bool have_aclint;
 };
 
 enum {
@@ -51,6 +52,7 @@ enum {
     VIRT_TEST,
     VIRT_RTC,
     VIRT_CLINT,
+    VIRT_ACLINT_SSWI,
     VIRT_PLIC,
     VIRT_UART0,
     VIRT_VIRTIO,
-- 
2.25.1


