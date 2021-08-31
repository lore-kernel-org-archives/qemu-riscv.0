Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL1ba-000592-FJ
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 07:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=870f666b0=Anup.Patel@wdc.com>)
 id 1mL1bZ-000556-BR; Tue, 31 Aug 2021 07:07:01 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:63075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=870f666b0=Anup.Patel@wdc.com>)
 id 1mL1bV-00017W-KX; Tue, 31 Aug 2021 07:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630408017; x=1661944017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jHWxcqAgEtxHBuuhV/gPW/gVe8WsfF2IyJRHu2iLuiU=;
 b=FdUZ1RlUZfoYgkRcm0vf7jNLZ3IkUOb89RzSNHS0p72AeE0eUzbHegsv
 nlENdXhhgU8O/32mCu4VriH4Cdfs+fqDESspoy5WMjLFw6oaTttPhfjVt
 QIBOJjL7ZmCwLI866wWc89KbPfkzEYrGBbUVLrtVuWRwnJGl5vXRu5/eH
 s7cAXL/r9gnXK4qq2+3L9jx/TupMMQgE3ebILASFyGfeQTRETB6b3eeoE
 9KI4yu/6LgcV77EoCwsPtizYpbUfO45nq0yZf3GHrRz12kWTMjWuu7+DE
 mvGGwgv1wZyd+ZbKi1dkqAVkqyNuaAZ8pKSknFGwAyh+Zv+dZ5X/WFZ29 g==;
X-IronPort-AV: E=Sophos;i="5.84,366,1620662400"; d="scan'208";a="282633475"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hgst.iphmx.com with ESMTP; 31 Aug 2021 19:06:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofmPBbgFTA+5/BYEre9UYSHhR/ravpGSxhdcr5snfjU1fxrWNh0k6u0C3pxpDOLGSDOwD0mJb5vGTXvV+FxE+mSqd0xpfR5nmpuhpPCs+QibL8RT6UgJj/DHsyMts7Dv9fwi6qX8tME6S1pKksa0vbutxVSQsFFutG8lstdN0gwRIQfN9Ng/NdhFIPvu6zj/viXerkDeLiRaxUlPaioTkYNBrD2K9nYi3Qks5s0ImzYhmMMXUv81AJVBAB/FJkgnUv2JckmDaskIhbw92XMDizZdwnrN5nC5ACcc27rgdGwluftdBVrVP1KB9Ly4zxSuC/Tj56qqpfWAPmo+VtC1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJy/U9uOL29ShUF+lUkVe/RfgZHMAtZp1D1ERQEFo98=;
 b=NBeG9cy2gZNTnhZvi0iKeKzAFauQQkR17psrr3GFjotGujqkoYP8x5OY5WfGKNX9N6WA84JeURLZpdwJCrpU4GLzBXkeiDLmZicSPuHaGyqMfu7CzHVNJaGIJl32SSRoMt1Os204q2kwZ9OEvoRSb6pdpY4vkjrDz+5Djtd7TnE7jcKXu5erHwMkHKd+6nn5FTXEz4esVcz59FFClN+uaNwwlVx+my91mRb1z1RZAGds57KKwqqr5LUbfe33GUas5hC+EvNg1L9XvHKjXhYhqfzK5nkPIr2VxB/leFZIu/el4yTBKl/QDcEPEDuu7A02lfeHyB6WvHpd7SQcVLIK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJy/U9uOL29ShUF+lUkVe/RfgZHMAtZp1D1ERQEFo98=;
 b=rArGqHvEEVLYYDBf7AeOoc2d0o7wY8f9nI4kVfEngPwpJG1qstt5zsobaXdStX51pgAVGu5UKhrViY95oX7wUJdtv614l4iax/0Ph3jFS5rjPvJXSib2RQI6bKXv4kCZNjPG+M5DLuQ/ElQErXNx9CN7ZXjs9D6ZNPIE6nhd6OQ=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com (2603:10b6:a03:3ac::8)
 by SJ0PR04MB8357.namprd04.prod.outlook.com (2603:10b6:a03:3d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Tue, 31 Aug
 2021 11:06:52 +0000
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514]) by SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514%8]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 11:06:52 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 4/4] hw/riscv: virt: Add optional ACLINT support to virt
 machine
Date: Tue, 31 Aug 2021 16:36:03 +0530
Message-Id: <20210831110603.338681-5-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210831110603.338681-1-anup.patel@wdc.com>
References: <20210831110603.338681-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To SJ0PR04MB7821.namprd04.prod.outlook.com
 (2603:10b6:a03:3ac::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.35.197) by
 MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Tue, 31 Aug 2021 11:06:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7474262-8748-4f85-7828-08d96c6f6fda
X-MS-TrafficTypeDiagnostic: SJ0PR04MB8357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB83573922CBDE3E426638D3068DCC9@SJ0PR04MB8357.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2k/xfqu4DiWOxH8/KvLHEJXz9MLgdplOO0t8Glcus5ONo+W7VfwD3OJZhDn1BLk3hnkf1ekf2YcpgS+yN+zlc/5UL5aaQPJmSwVjEcn3SORWO/Vc00MPPoZ+nbmfiVx86PcV/OTNxf7YzCsIt6seGRu17l533qL0wD4nAfRHB7mN+dpjZz9Wu2FCFZKSpPWQwrnTW5bQCw6WiTjHtzVW4rAUPt+uXWvKPz4OBOkemvQ4FkGge+YhcJkg94rO39T6cNX367F2mvdExWfwfrxLKitYVVdJJGsn6XBHHC4l9pa4W0PFkxMQJ8ZlyQqkyXypikT7Xw7XwImZKgv6ClQoaWs36GCDqIIT/LnHFouKicuNhDZK9BIIfhrDcS9PD/FsbZarDeVOEUs/WszcTOeTwTqp78zFLXRRfJsSFMyetX64O4WHmKw/OS3D+VrDqEYLGNz+uk1/ey0z+d/cpSb8Td0dlG0X5uI8Z5uT5YxvfkD+0+f9wyjohU05oL/ib3h4HiHarXaEmuoEGnNus55nUjD43IUR1k3HvRMmCd+RWDH7G1N0YgL+Wlg4ew6lchdd+NfjgK84AnBhRoIuN9AbdlozW/UkCwMOnAsKTPpFEHq/U4fOhXgFg1a8idb0s21q1OEE2qRum7+sCslmYAMUPmXr8sTC/ISQdGWYn9fcfbG2Po/O9ob6sdkagLnYsN61ekZ4taxMkMnS0l7nyp2VZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7821.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016002)(5660300002)(38100700002)(6666004)(316002)(86362001)(8676002)(2616005)(26005)(8936002)(66476007)(7696005)(4326008)(66556008)(83380400001)(110136005)(2906002)(52116002)(8886007)(54906003)(1076003)(186003)(44832011)(508600001)(38350700002)(66946007)(36756003)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2n3mi3uIN4bTCgi+H4k6vNyGAomxuDl0T0dKMpH4eg8ibE/kzQlJxKgF/ayL?=
 =?us-ascii?Q?3RIeksmkot+AT0lWD+l9vOHw0HW//+nvG5criUIzEeoksQwVXChlCHCYJLIW?=
 =?us-ascii?Q?Gwn0jBaqhNJzxDZBIk4RhHuhtnPqawtB0zHLQLweRf5v4NRirY8oQEaUs6ct?=
 =?us-ascii?Q?sPTE6EqMlr6DOj0QmxpQxL+KWmF6OzI77id++YhZyej6d+sLqWZA2SxjmR+r?=
 =?us-ascii?Q?zmQGrmklRkeN4s0dH0Ckig3cVwJvW+IrxhXYo9lu+pzEf2xagrQ8w67E9kYp?=
 =?us-ascii?Q?QycJkq4ijz1xKGvsCvveJHOS3nCwDPxMkWh61MtX6qI0lqASsNiDMzhyZZiD?=
 =?us-ascii?Q?RzRcoioUHCIKhGnaJuWwEtXOX96mOm+9n/PmPe5DzxfAi6Y0krmx/AV8KIiD?=
 =?us-ascii?Q?teS+2LxOdQeYZmWhiTHq5GizhhY7TxD0S3PCd65omNeyzESmgg1fm5w5Cf1I?=
 =?us-ascii?Q?jk6HZgxpJJDFM9hJ2JgNHTjffcl9FH8uTZjXlj72ULX0/ZGXcTSAukQ/fsTm?=
 =?us-ascii?Q?z6tHgkcwg3QT58DhW9g5+stGDb/YgOdIvOpaU7z4kyGZSa6RIaGQ8IQIG++9?=
 =?us-ascii?Q?B2dJLxgbd+wjsGANVEe2u/V5DTjuWIT8ofbMswd7XpqIkFU3+nAifFm0etzg?=
 =?us-ascii?Q?DmLyvx2ot6bmb/Rndg9GfOTA7nDd4PQfs2wzydvaiTeXz5x2cZ5S3rS3BPd0?=
 =?us-ascii?Q?6TcpDtaTZGd7Zsp+IobGCAW071OQJcgNtG817DfEHBOUI1JpSCJct0e/QO05?=
 =?us-ascii?Q?zBQ9BGOolBHqTmKakQe6pffSmTrfiAeLwO17K099pU3V5M5rTdXc3YHjujyR?=
 =?us-ascii?Q?zB3lkvfltb31zlmoyhzZHuw1Sb53E8dY14PnzXLRJqLRmo12UjLsCfDspl9X?=
 =?us-ascii?Q?Ivyp+JFeeLYIBG7fUzoqvikQr1tQndflfGf+iQ8B9x+Ok5wgIxyQUY0/2nm5?=
 =?us-ascii?Q?BkeqmyAdyQivVcM8nXY16b3RYQ4JgGbjfIwYK8zwAmJuaAbbf35JwBLPcv/X?=
 =?us-ascii?Q?G3MK/99xMpxNrtuYTRvX2goS80MKHJ2lI+qq7pBnSQBQvV4I07eVXRi2lBZ2?=
 =?us-ascii?Q?OsLtF4otYZiuPoO1VV5ZjnF1f8tjFJ2/3q9HVTeQAFioXbqiF38U0DUkEnE2?=
 =?us-ascii?Q?QE7wH6YFdyf+joNjKSUCurfoeWePBYdfE2jUSSxYVgSDOkKsrvgLnyFcHgi/?=
 =?us-ascii?Q?gTlOOKz7IKosA4ix2dAdzAza+oBTKOV5d2guqd6xx0iPItkGcnyiiR2cDoMy?=
 =?us-ascii?Q?ImuUUfb0Nswgy3QdkOvc++QHe/70SNrQuexrHkW6cKBcWm74k0YO/GINX5I9?=
 =?us-ascii?Q?h+U85FKlNJbe2NpsJcpW/ZVV?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7474262-8748-4f85-7828-08d96c6f6fda
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7821.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 11:06:52.4339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHYU8kOD86bIdXjMuOlgLhBCY3QUHczH/ccOk4t/kpAcxRs0qymAhPwGvV7eKhckx3NPQIss3nWVgGesO+vveA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8357
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=870f666b0=Anup.Patel@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 31 Aug 2021 11:07:01 -0000

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
index 321d77e07d..fa016584bf 100644
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
index 7f716901ef..ec0cb69b8c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -48,6 +48,7 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_TEST] =        {   0x100000,        0x1000 },
     [VIRT_RTC] =         {   0x101000,        0x1000 },
     [VIRT_CLINT] =       {  0x2000000,       0x10000 },
+    [VIRT_ACLINT_SSWI] = {  0x2F00000,        0x4000 },
     [VIRT_PCIE_PIO] =    {  0x3000000,       0x10000 },
     [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
     [VIRT_UART0] =       { 0x10000000,         0x100 },
@@ -281,6 +282,82 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
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
@@ -359,7 +436,11 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
 
         create_fdt_socket_memory(s, memmap, socket);
 
-        create_fdt_socket_clint(s, memmap, socket, intc_phandles);
+        if (s->have_aclint) {
+            create_fdt_socket_aclint(s, memmap, socket, intc_phandles);
+        } else {
+            create_fdt_socket_clint(s, memmap, socket, intc_phandles);
+        }
 
         create_fdt_socket_plic(s, memmap, socket, phandle,
             intc_phandles, xplic_phandles);
@@ -750,6 +831,14 @@ static void virt_machine_init(MachineState *machine)
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
         plic_hart_config = plic_hart_config_string(hart_count);
 
@@ -914,6 +1003,22 @@ static void virt_machine_instance_init(Object *obj)
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
@@ -929,6 +1034,12 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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


