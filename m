Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m7Gi4-0004tL-4O
	for mharc-qemu-riscv@gnu.org; Sat, 24 Jul 2021 08:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=832e875c5=Anup.Patel@wdc.com>)
 id 1m7Gi3-0004qW-E6; Sat, 24 Jul 2021 08:24:51 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:1975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=832e875c5=Anup.Patel@wdc.com>)
 id 1m7Gi1-0006bP-AR; Sat, 24 Jul 2021 08:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627129489; x=1658665489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=n33F3xSFGzXrr2k4u2Xj7BrOGTBvm/3EkQzMmLm0sjw=;
 b=PoI9omzRVqk1ECOEl4DKCnGaVDC2K+CQkigv3RE5MisTXC7YwgBMaHjf
 kJrV3L+7iFQcZ5aLSrIJfoPqHOiNXkoogeO6lLqcUTh7Jnl3f+Rf64Jlk
 EfUtrwtxYkxCfaP6nOQjNpWU6h+9cIgkA2rqfd2GIwV8e2Ue17Y2WG4rN
 59toKunGM298z6pARjWw4VMCrGGeCgpdmvbJ87Xy7/mbeG6IVZoCG++xj
 ZCx/olDhkDaDE0sUfryyA/tbRlold00KeL6m16HT+Nhvh3ATTSJaQcpRY
 TX1VNV4eBt6puNlk6iikD9z/YJ0rPybLLOPw6KNHWR/2TCzwSEuIrC7LP A==;
X-IronPort-AV: E=Sophos;i="5.84,266,1620662400"; d="scan'208";a="286959692"
Received: from mail-dm6nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2021 20:24:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbnQlDzLxmIZIrUFX6m4uDNL+2E4ZgifigCnkjcbN+J6ZZn3qYzCr6ivPR2KVT4wIJSoReMG3qUcgrMMQrOb1lWAE+rc9nCTv3jkbAi2Cm9C/A4+Ah/RZfYoxU9as1CJrI9+uMHVrYm2BXQXcnXQhjBDKNGobv0xXQofcTSZIK50HBf9PHSP6+DMSOXJxxGbHQK45ZSn83ebyZdyrgQ7GlIUXtpvooTB6Z4h5HjOlA8MO3ChPj1KEohAIG8M5s+z+gal84+Sv7FU9WdK7vmssQI5Dqw5G1M/C+037qc+xAHQ6Sp/PwsZ85G1epHMHjKI9SIXNsyfuYg/ousZPpgr9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihrcDWR9XqG0MSW7iRD5wWk/159BnpCyq8xdvYf24fU=;
 b=jYpBgJnMWc+97fFVcZw1ViRDUXlbPV1lDqRWN8Rm/5ZnLogofseTyEcFJaWbLgKIUl+WmNGDUDivO8O4vh/GpTW8UCcOt2Qwgjd3eYIxwl53cb+tEtEeSBFP+ltT1y4NTjnutfEGpTVzlbIWI+jSebniYY2OOoRBcC++Vjce9RbpR7IGVNbhmF07RIwltNK8N2okjWwiHnzXbI+gFrR436AiQiV7IbxMo+hxoOxUvcAr1XNIRuesAhgC4twAHtDLNt5g0auWS3q3f1wlxuRSCH1UFvlLbrlBrbtYSrprJB/Jkh5UY9ASedkthY+VQXFzox1vGlQznRkscuHG3o7RYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihrcDWR9XqG0MSW7iRD5wWk/159BnpCyq8xdvYf24fU=;
 b=DcbxFS8gUj+NhGMqTBVd63eEJl6/Rs2ANe+/NWe3+vOpUu80tehM6A0h2n25df+REy2Y3Cjniw640UtOv7A83Myr9JKutyO03w8GXqH6cpE5tNG9PkiTS9RVT/vAcZa30uI7xhJaaB5Bz9Ehs4bysi/KHKTaCBxx42inQ9BPffY=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7764.namprd04.prod.outlook.com (2603:10b6:303:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Sat, 24 Jul
 2021 12:24:45 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%8]) with mapi id 15.20.4352.029; Sat, 24 Jul 2021
 12:24:45 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 4/4] hw/riscv: virt: Add optional ACLINT support to virt
 machine
Date: Sat, 24 Jul 2021 17:54:07 +0530
Message-Id: <20210724122407.2486558-5-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210724122407.2486558-1-anup.patel@wdc.com>
References: <20210724122407.2486558-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::19) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.61.225) by
 MA1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Sat, 24 Jul 2021 12:24:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bcfd289-fb2a-473a-e854-08d94e9e0539
X-MS-TrafficTypeDiagnostic: CO6PR04MB7764:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7764AEB85A4AC9545952431E8DE69@CO6PR04MB7764.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:203;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x92iSN2uw6mz9b7KBUe7NJyA+Pn5/uyhS5dFZ+C67jPgob4KnktrQgsiHmzpUEvUx1fWU5ypZMK8ncIG0J1Y0WNOTE/BJzJVnJR3+XzJyKjPCo916DHvmYF2UtNpTrsIfN1qxkR4BmDJ4Q3KL85V0G2wmFi+o3sM8vp/e1WVRPsh34/K2OvEvwGgoeHcBykmnOP9fVnC4L3VE2xuRm0D+6oJ7Kq2EpbY7MxfCIZPGzV0zeeeg/RZJGIPYPv0LyIUdJ7PzlrIT+PR6jodgHxRxcHj7mK78/ZqOJ6D9P/srzTOVUZfE7kVAHgcyEms7MhU4ydC5ZVMrpAXC3X1TvFvC+m+7rAuuTnZ30ifSOh4Q2ml0TrE7uyLdCqFUU3S+/eGS0FEpbaURB76jy3H9dGJcdL3gOG+Z6tz2mXogRN3Etma9dVwE5Wz2dfXIEeId3zp2KipNK8bdET9YW7JJjzIzic3dzN0HnhyUn0rZ6T4/Z7bdlib8uF5Z6lL4qA34Bo6Pjj36FPkRGA4v/RRlLRPYp6QrYMT5Yae0ndCGw2G2ur8ZFArHF5MvKD9SLAQD1NQTTOAwyJUusKLBtzVj9wsYeZp4s/pJvMFIGOifWHfaur+iz+rcFAhI7QOJah6I1R/dmIOBYEHgsu01/OLnAaRZ/aj1E4GSPa9xZQZuSxzvPaNKueO1kE83R2TDnQYPzn8mCRaqHU8N5BdjhLzuykiJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(44832011)(2616005)(38350700002)(36756003)(1076003)(8676002)(38100700002)(4326008)(508600001)(5660300002)(55016002)(110136005)(8936002)(66476007)(66556008)(66946007)(316002)(8886007)(6666004)(54906003)(52116002)(7696005)(83380400001)(86362001)(2906002)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bM6NW0htZrDk2ap88H9TQWsNa3SyhqztbjhljSFi8tRvGky+0lU1GbjZfziZ?=
 =?us-ascii?Q?tHsuAah6VdSVhWehQb1kPLExi+t1ji4E6rnOE5Fg6F3aZuXetSWJPZZqElfC?=
 =?us-ascii?Q?2N7VcwCqSkTKODVivL9WcySi2oRdBUxo//bQRsmiJ229tIzg+HX9+4cBNaYt?=
 =?us-ascii?Q?KHIGEZVZpainFG3TvxDSJ8tTDZmD9053++S0kdMtdtYC89wOeWUpNygeVnPy?=
 =?us-ascii?Q?oxqp6j+xTcYpeNHgawSocCUayhaGE3Nm9RV7nIUqOtw/rI/C3AIFCt2ymaZ/?=
 =?us-ascii?Q?H/6OHleXFtxddM5ETKbJrmRx6nlbx1gWx2TW6Bf/BBBEQvkFk6hvFHsR4sWw?=
 =?us-ascii?Q?qJ3BnlUv2fYRFM2+nS69MlGKAPWMph/2TpgMjCLju+Vd9W/Gvj3pt9GqlknN?=
 =?us-ascii?Q?nmEr+MHMuTdFVQj8WFo/Jiy5rU/k1qbuTer1W0+XwGWAdYtH6EenSss5V9uM?=
 =?us-ascii?Q?MrUkj4bLBY9Km6/x8CLXLj6fySyFPBM7NDeqS+W8IZYptNiygDsVbcLBa+vv?=
 =?us-ascii?Q?w8+kOZGOGNSMxS0zpYS53dwuJNeD6ONrqk42iwma8f5YzUNO5/d5jTNNttIO?=
 =?us-ascii?Q?g7dNl/v8jJaOqEg3lm4JuV2cylMsoQKQ623wTIywaYB9xInH8t4iL6BBdiWT?=
 =?us-ascii?Q?wKZqcSSNFN4qcJDVpbtpQwSyckJBIQoFHIzU3tl6ZZ+gTEIoxBTJDxMK7JPw?=
 =?us-ascii?Q?XS5SL9vnRuQCXH/+t6Au1gyvQIQozKe8ddzqTQNzNtHp36rzwCU5vnb/Osc2?=
 =?us-ascii?Q?yVveCcVKPxiMAJ1YtXocwOg9uJUUhJfIN583sCzzbn9hA4X0vzHj33PnpIZl?=
 =?us-ascii?Q?HyuyFlD6fkwdFMY+hoo6UsW7TX/r/6YA1Up2fPZoW4OgfLrH/tvIzrA8pHeh?=
 =?us-ascii?Q?mtw9vymk1DVVkKua3PW/1UjcGwwL3n94qXBbXLpNG68RgedMjhrwduNrv8te?=
 =?us-ascii?Q?A+8KF2mXlB3PWJzpkFOvRFk7u8lm3onQ4hapa1CqfDvW2wwylERYjz9AClY9?=
 =?us-ascii?Q?djGInsJFLyDyHyibVR6fsTEj7FfH3lqMzPG1ZntXPXr2pX4Nfjpjqrm5Q1Ei?=
 =?us-ascii?Q?50lpntrfREzv+04yqnUMZoTpLdIn+1IX3LSDjLIzgvKhpTFaez/gDLWrz80C?=
 =?us-ascii?Q?RIUsj95Js2wl1OpKF3ayGzRDR2hwZG5ymlMbwkw5PkzR3Boyln0iqj9xnQBA?=
 =?us-ascii?Q?/XhSSKQ9wA4eP6gscGDpCvJT2X7DxxjEeNMOwnZccbUGc1Q+ScpjqjJobOs3?=
 =?us-ascii?Q?ttrvCfKSu93V8divtxiGxX27OfOo+/84P79zkvjyZw3Ps58VtA5KYPRrh4ep?=
 =?us-ascii?Q?oQU/c+VyD3HAn+dSCMkzSmZF?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcfd289-fb2a-473a-e854-08d94e9e0539
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2021 12:24:45.0460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUXnYJt797U4waEGbhDawz+rhjcqehtC78qWa/q0hRN3stk9ixxl9A/ifxtLzTXmZCVqO75enANa6DsQM3L3ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7764
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=832e875c5=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Sat, 24 Jul 2021 12:24:51 -0000

We extend virt machine to emulate ACLINT devices only when "aclint=on"
parameter is passed along with machine name in QEMU command-line.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/riscv/virt.c         | 113 +++++++++++++++++++++++++++++++++++++++-
 include/hw/riscv/virt.h |   2 +
 2 files changed, 114 insertions(+), 1 deletion(-)

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


