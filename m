Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m7Gi3-0004qA-Bl
	for mharc-qemu-riscv@gnu.org; Sat, 24 Jul 2021 08:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=832e875c5=Anup.Patel@wdc.com>)
 id 1m7Gi1-0004k1-NW; Sat, 24 Jul 2021 08:24:49 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=832e875c5=Anup.Patel@wdc.com>)
 id 1m7Ghy-0006ao-Dd; Sat, 24 Jul 2021 08:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627129486; x=1658665486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=56l869gBA5HoPugFg3HeNHjympYkF0yvN2ckyjwT5dQ=;
 b=a+s4dXzMU89yPsD+AFfucAD2zquVdz2GRGHCEadF/RvDKpq9VEJ5L6wX
 KrXtvI74k6MY5F8VAs18XUcdqH7qajbDTlTX7fRgWXm81cwY1HGbMPzWA
 RCgNDx0sggvTzyu9d+v/xELB1re2aMkZwY2UfoPbpzwCkRSvjUZmYXtH0
 CEpgy5CZWHg0qGW3j3eKJRbi2WXCTcs+YQ1lkM4L9JQW3NhRtxMzaKAjB
 NzZFahumYXnw7MFSPu+dt6y48rdio8VI2S+ecbIs3igH+FuPZUcE37qgQ
 sdwffHRk8BFaFBRWmczPpJlDC6NghVTW/VYI3uuSjp7Big7MzEumZqCrA Q==;
X-IronPort-AV: E=Sophos;i="5.84,266,1620662400"; d="scan'208";a="175402019"
Received: from mail-dm6nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2021 20:24:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4MLAeGJN6Td8UWaPl5OZL9EYauMKH/t/mPdulX54nOlB5MUxsv3W6ESVFU5xxbCZ3+p8QO1EGaaRwHf67ImINNtipXYm8GKyzWzuvysaKaIvgWBVZMFeD0I+yaSBizyj83P740Skh3iDMcfMAg1KT11dUNLoRsVvi9NiDbYsa+3dn2/QMTENJG3eyLbjP/CyZztXfYQ+SOrbjH3OV7IbeGb4QzUcUzG0N7Q7WlvlUu2V+bQU7dNBw5uxuO6a3/KD9XqKJ4HzMXiagZK/6JwwibgEtY2XzOPRzPZrtPwAWID/PNxxv3Ch1QxM4ErsKUOBI5flwx7ndvQOC3/2f9EMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Og0vfwDuMVCK0OVytaBKc+mUQlOSC1uEUiUaRBhuqac=;
 b=lZAY8u/9gw0eHMMOHHxCOb7tRsVL9rNHpY8txIAu4MUSOhMfCE6bqnjFI9F7uWUzqb0YAv6WdaArLEgH08OtAC76C66X0wU07xIMq7EtIkyPlUMmKFqC3QVLP6FmYemWBehbk3Fu2+9X3FRxVfjS/RsganrTwGWuy7v7DsT+gDS4weGUG6TjlmYpueXoPyH+m2hUEYp/U0hvEqQad4hUp2QgUXagkugs98LvUdo7R5DbJzMWqsh+wN0g//fxRX1euS1w/FPQJVrfGtD7+PT/CdySjGSFF/pvXeg2JmIvD1TqsE86pWfkJCQsRQgZIr2SFGBmdLAuw/mSVwNKHfwNnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Og0vfwDuMVCK0OVytaBKc+mUQlOSC1uEUiUaRBhuqac=;
 b=oSYnO7bhnfV5XtqV9L0E4/jVefRme0TSyinRN3KQ3hptqy/lP+a9gIkiRyGUWYrtvw4JZXSmNQICKjxVoziBpuLO5ck5SRhglqZxYKx/1NOE1K84rMzL/Wt3tQC9tMhkxuZ0j5m/ez25qOYvMJzmtZW07h7Dzv7d4Ixox1XiOMo=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7764.namprd04.prod.outlook.com (2603:10b6:303:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Sat, 24 Jul
 2021 12:24:42 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%8]) with mapi id 15.20.4352.029; Sat, 24 Jul 2021
 12:24:42 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 3/4] hw/riscv: virt: Re-factor FDT generation
Date: Sat, 24 Jul 2021 17:54:06 +0530
Message-Id: <20210724122407.2486558-4-anup.patel@wdc.com>
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
 Transport; Sat, 24 Jul 2021 12:24:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1566669d-be29-4ffb-113a-08d94e9e0384
X-MS-TrafficTypeDiagnostic: CO6PR04MB7764:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7764B362520F377ECD98C9CA8DE69@CO6PR04MB7764.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e5V1/wypbTa/pqxCr1mw8Q63UtGECMPbkB51DgHJyW2an6Wab/h0Bd+DJkKNsJW8zQJjXwKh6BvmYPuqYHJgLmowx9CLzYg6nt8KfrF2QWsVrfQBwmKpNYWzbGRUgFZ7q0iv6xF6D7cZ1rGwQgumiGkPWMmfFDJOEoT9S1tfpjyF82UIC3l86iXwGOtO5dVAJBorNszHT8ZQi6pvSCm6AetifGxHEiqWQRuN+sJwSop67BOitRVe86uryYBFBL9EE4q/OifLUS2dw6It8eJ6FflLjxAl1nRFzxOZSY84AlqdGey+BuoIEOqgsoU3oqiE4j6Vz5NbBylSNT7isJpXmRgMvj+vwB1O87nAtTn/Fu6wtrzoHvTBLy9AmtjOxBahwLyaNyksbHqmmkLJmJSWyQiNw06ItpqmZdLnveixmV6OQjzPJbx1GE0+PueyGPZUnsyQZPOT/j2OKo8vtCtU7LD2eDcq4KM+dZ9i6sHXU+C8ZB8XKUIahZM11jA7Vi/SPSLKlefnHaWa7/+aQi0bVMCF09eDWBjMnacwBQEof3mT817JAD4ollZTLy2D8A+KwLmQRsOs2Mt9uX0pwMVhVZF4PapZfT1/o1fvKuO8ml2BweTIMQwF8LP1BP4OZd9J+BIyESQje5lTsPynYE5JkguXDwKKsiXe1gqOKZrU1GYu9PbXj3aeqVPeJsIYtIgqi7LvPybNdbYxBNh4rBsXQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(44832011)(2616005)(38350700002)(36756003)(1076003)(8676002)(38100700002)(4326008)(508600001)(5660300002)(55016002)(110136005)(8936002)(66476007)(66556008)(66946007)(316002)(8886007)(6666004)(54906003)(52116002)(7696005)(83380400001)(86362001)(2906002)(26005)(186003)(30864003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8NR8yVHk9F8umdhnxmnt5xZbe0T3HKScrKpH1kvI6ZlwDsBj/ogd7oczO2Zu?=
 =?us-ascii?Q?H8ZEKH+NGJWJIG1XjwqyfTBPAOQU8vSKf8zgJ2b32tjBfougO1hKxW2zOt+m?=
 =?us-ascii?Q?+cd1HZiNm6KMc2H6/i2XQFMuMY8Xn1wq+ejc+lD/OUzKV12x682fkgf7Gn4t?=
 =?us-ascii?Q?RF2/d2VWFnFsuALcIxW8HO68kDcA8XLk9tgo3NfLPv0QNysm17JvmW8/hLsw?=
 =?us-ascii?Q?JFX/sGpvdednchuPTG9Z80fbEptoT2FfFN3on4DaPliq+qLXHmuYBwGRp+c/?=
 =?us-ascii?Q?ccIlKea+VsV34gPnqzu8lIX8iz4B4GRveeRerjhDcgGRtaqyTnWcR/C78Vkw?=
 =?us-ascii?Q?RsYMW/TGX9BKaHQ/oMN5xBQnEvGIe9YNHKBTeFVNKT1BsbwjEU/8UEx02wls?=
 =?us-ascii?Q?E+m1XsVna+7X50Yl74sKcTawUKqqcVUVsuUc32bPEdihuhnquHs+AtBo3Q/P?=
 =?us-ascii?Q?dYGla/K/PJC4imFLRAijNt2w7llTWkye90nYDLRjvjuyqUwu/aEL1gbJmrDb?=
 =?us-ascii?Q?bxVEVKN6ZfC0nkB//enO1F7Vgl0Ej/WBQEJpsEOObpWuphOmsACMYL/3nDDZ?=
 =?us-ascii?Q?pf7DYJ+HUU75p35hUPjSGexqSAnw/fBK7ui7Nt6WKxpkmlABZwpIPxTrfb0t?=
 =?us-ascii?Q?tsJ4rKDrKxVDLO9hkCi+t7x3pwIbXhZA5xO4DQORRMnZzK2A5C6RkjiUDoPX?=
 =?us-ascii?Q?UmytMeg4ey2sjPL9RrVEWL+nA55ZJvETY7yRbOJjRLEjSWPMSQV/crPjbsHQ?=
 =?us-ascii?Q?JKKH5Spb/gKz1DPNLpU2kI9WZ7a+AqihMwOWWaqS0OotKNLcpICyNrRqIRiu?=
 =?us-ascii?Q?7kKjMYKL0ihiNNULu9wfgmd7LSGA8wcLSNW4alnof747TISg3vS09Oyn8g4k?=
 =?us-ascii?Q?m1AjqyqaUgDLL638RBL9IekXM3FHce5v/MR+krA3Dd2j/60U1UAiacdsAHsJ?=
 =?us-ascii?Q?RGyjAqv3bo0o/hc18slJBCquU0lGXvz4MU1c19UAixeJ/vhMQJLmqJlJ6R/D?=
 =?us-ascii?Q?wFZBOlJyZUcc73unAy60DCFWhI9twWqfzCDdTS9SJ1TpdbD95Le3Kr1rWCtH?=
 =?us-ascii?Q?k5rfQNXfj0kCSnuJtk85S9MvUiT7rBnOX9xDaPgdhYpxaPKvm/hWKhq0p7iH?=
 =?us-ascii?Q?fFuS5Tp5CrDnC4RkZr+QI19MA7ZvDA7TtBGN3d8uvOOxZDvK+AVFOkDxE0ID?=
 =?us-ascii?Q?v1RLutIgmqPWm2ObpnZr7y9vynaFqmZ915MJkw9FNPDKlD9F2XMbDZHtcRt2?=
 =?us-ascii?Q?gJgqAFlDLyGVnWTt8ls94gnEsvZ0N+iuAp88XtvAYyamGx6o5R/IJLc7oRWJ?=
 =?us-ascii?Q?KvCqrT7R2Q+oaKvbuafVWCXx?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1566669d-be29-4ffb-113a-08d94e9e0384
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2021 12:24:42.1805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bi7NfiFpsY3ZGMW60R5TUXgOfljOjxjRlKdU62Q8U0WoH4docHANomLh7IWwZcRftF6AyZ586F7W8eC2iUPsew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7764
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=832e875c5=Anup.Patel@wdc.com; helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Sat, 24 Jul 2021 12:24:50 -0000

We re-factor and break the FDT generation into smaller functions
so that it is easier to modify FDT generation for different
configurations of virt machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/riscv/virt.c | 521 ++++++++++++++++++++++++++++++------------------
 1 file changed, 324 insertions(+), 197 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3cbb4cd47f..48c8b4aeb2 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -177,214 +177,262 @@ static void create_pcie_irq_map(void *fdt, char *nodename,
                            0x1800, 0, 0, 0x7);
 }
 
-static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
-                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
+static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
+                                   char *clust_name, uint32_t *phandle,
+                                   bool is_32_bit, uint32_t *intc_phandles)
 {
-    void *fdt;
-    int i, cpu, socket;
+    int cpu;
+    uint32_t cpu_phandle;
     MachineState *mc = MACHINE(s);
+    char *name, *cpu_name, *core_name, *intc_name;
+
+    for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
+        cpu_phandle = (*phandle)++;
+
+        cpu_name = g_strdup_printf("/cpus/cpu@%d",
+            s->soc[socket].hartid_base + cpu);
+        qemu_fdt_add_subnode(mc->fdt, cpu_name);
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
+            (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
+        name = riscv_isa_string(&s->soc[socket].harts[cpu]);
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "riscv,isa", name);
+        g_free(name);
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "compatible", "riscv");
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "status", "okay");
+        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "reg",
+            s->soc[socket].hartid_base + cpu);
+        qemu_fdt_setprop_string(mc->fdt, cpu_name, "device_type", "cpu");
+        riscv_socket_fdt_write_id(mc, mc->fdt, cpu_name, socket);
+        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "phandle", cpu_phandle);
+
+        intc_phandles[cpu] = (*phandle)++;
+
+        intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
+        qemu_fdt_add_subnode(mc->fdt, intc_name);
+        qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
+            intc_phandles[cpu]);
+        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
+            "riscv,cpu-intc");
+        qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
+        qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
+
+        core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
+        qemu_fdt_add_subnode(mc->fdt, core_name);
+        qemu_fdt_setprop_cell(mc->fdt, core_name, "cpu", cpu_phandle);
+
+        g_free(core_name);
+        g_free(intc_name);
+        g_free(cpu_name);
+    }
+}
+
+static void create_fdt_socket_memory(RISCVVirtState *s,
+                                     const MemMapEntry *memmap, int socket)
+{
+    char *mem_name;
     uint64_t addr, size;
-    uint32_t *clint_cells, *plic_cells;
-    unsigned long clint_addr, plic_addr;
-    uint32_t plic_phandle[MAX_NODES];
-    uint32_t cpu_phandle, intc_phandle, test_phandle;
-    uint32_t phandle = 1, plic_mmio_phandle = 1;
-    uint32_t plic_pcie_phandle = 1, plic_virtio_phandle = 1;
-    char *mem_name, *cpu_name, *core_name, *intc_name;
-    char *name, *clint_name, *plic_name, *clust_name;
-    hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
-    hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
+    MachineState *mc = MACHINE(s);
+
+    addr = memmap[VIRT_DRAM].base + riscv_socket_mem_offset(mc, socket);
+    size = riscv_socket_mem_size(mc, socket);
+    mem_name = g_strdup_printf("/memory@%lx", (long)addr);
+    qemu_fdt_add_subnode(mc->fdt, mem_name);
+    qemu_fdt_setprop_cells(mc->fdt, mem_name, "reg",
+        addr >> 32, addr, size >> 32, size);
+    qemu_fdt_setprop_string(mc->fdt, mem_name, "device_type", "memory");
+    riscv_socket_fdt_write_id(mc, mc->fdt, mem_name, socket);
+    g_free(mem_name);
+}
+
+static void create_fdt_socket_clint(RISCVVirtState *s,
+                                    const MemMapEntry *memmap, int socket,
+                                    uint32_t *intc_phandles)
+{
+    int cpu;
+    char *clint_name;
+    uint32_t *clint_cells;
+    unsigned long clint_addr;
+    MachineState *mc = MACHINE(s);
     static const char * const clint_compat[2] = {
         "sifive,clint0", "riscv,clint0"
     };
+
+    clint_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
+
+    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+        clint_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        clint_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_SOFT);
+        clint_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandles[cpu]);
+        clint_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_M_TIMER);
+    }
+
+    clint_addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
+    clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
+    qemu_fdt_add_subnode(mc->fdt, clint_name);
+    qemu_fdt_setprop_string_array(mc->fdt, clint_name, "compatible",
+                                  (char **)&clint_compat,
+                                  ARRAY_SIZE(clint_compat));
+    qemu_fdt_setprop_cells(mc->fdt, clint_name, "reg",
+        0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
+    qemu_fdt_setprop(mc->fdt, clint_name, "interrupts-extended",
+        clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
+    riscv_socket_fdt_write_id(mc, mc->fdt, clint_name, socket);
+    g_free(clint_name);
+
+    g_free(clint_cells);
+}
+
+static void create_fdt_socket_plic(RISCVVirtState *s,
+                                   const MemMapEntry *memmap, int socket,
+                                   uint32_t *phandle, uint32_t *intc_phandles,
+                                   uint32_t *plic_phandles)
+{
+    int cpu;
+    char *plic_name;
+    uint32_t *plic_cells;
+    unsigned long plic_addr;
+    MachineState *mc = MACHINE(s);
     static const char * const plic_compat[2] = {
         "sifive,plic-1.0.0", "riscv,plic0"
     };
 
-    if (mc->dtb) {
-        fdt = mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
-        if (!fdt) {
-            error_report("load_device_tree() failed");
-            exit(1);
-        }
-        goto update_bootargs;
-    } else {
-        fdt = mc->fdt = create_device_tree(&s->fdt_size);
-        if (!fdt) {
-            error_report("create_device_tree() failed");
-            exit(1);
-        }
+    plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
+
+    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+        plic_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        plic_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_EXT);
+        plic_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandles[cpu]);
+        plic_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
     }
 
-    qemu_fdt_setprop_string(fdt, "/", "model", "riscv-virtio,qemu");
-    qemu_fdt_setprop_string(fdt, "/", "compatible", "riscv-virtio");
-    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
-    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
+    plic_phandles[socket] = (*phandle)++;
+    plic_addr = memmap[VIRT_PLIC].base + (memmap[VIRT_PLIC].size * socket);
+    plic_name = g_strdup_printf("/soc/plic@%lx", plic_addr);
+    qemu_fdt_add_subnode(mc->fdt, plic_name);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name,
+        "#address-cells", FDT_PLIC_ADDR_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name,
+        "#interrupt-cells", FDT_PLIC_INT_CELLS);
+    qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
+                                  (char **)&plic_compat,
+                                  ARRAY_SIZE(plic_compat));
+    qemu_fdt_setprop(mc->fdt, plic_name, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop(mc->fdt, plic_name, "interrupts-extended",
+        plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
+    qemu_fdt_setprop_cells(mc->fdt, plic_name, "reg",
+        0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev", VIRTIO_NDEV);
+    riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
+        plic_phandles[socket]);
+    g_free(plic_name);
+
+    g_free(plic_cells);
+}
 
-    qemu_fdt_add_subnode(fdt, "/soc");
-    qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
-    qemu_fdt_setprop_string(fdt, "/soc", "compatible", "simple-bus");
-    qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
-    qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
+static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
+                               bool is_32_bit, uint32_t *phandle,
+                               uint32_t *irq_mmio_phandle,
+                               uint32_t *irq_pcie_phandle,
+                               uint32_t *irq_virtio_phandle)
+{
+    int socket;
+    char *clust_name;
+    uint32_t *intc_phandles;
+    MachineState *mc = MACHINE(s);
+    uint32_t xplic_phandles[MAX_NODES];
 
-    qemu_fdt_add_subnode(fdt, "/cpus");
-    qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
+    qemu_fdt_add_subnode(mc->fdt, "/cpus");
+    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
                           RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ);
-    qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
-    qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
-    qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
+    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#size-cells", 0x0);
+    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "#address-cells", 0x1);
+    qemu_fdt_add_subnode(mc->fdt, "/cpus/cpu-map");
 
     for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
         clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
-        qemu_fdt_add_subnode(fdt, clust_name);
+        qemu_fdt_add_subnode(mc->fdt, clust_name);
 
-        plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
-        clint_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
+        intc_phandles = g_new0(uint32_t, s->soc[socket].num_harts);
 
-        for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
-            cpu_phandle = phandle++;
+        create_fdt_socket_cpus(s, socket, clust_name, phandle,
+            is_32_bit, intc_phandles);
 
-            cpu_name = g_strdup_printf("/cpus/cpu@%d",
-                s->soc[socket].hartid_base + cpu);
-            qemu_fdt_add_subnode(fdt, cpu_name);
-            if (is_32_bit) {
-                qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv32");
-            } else {
-                qemu_fdt_setprop_string(fdt, cpu_name, "mmu-type", "riscv,sv48");
-            }
-            name = riscv_isa_string(&s->soc[socket].harts[cpu]);
-            qemu_fdt_setprop_string(fdt, cpu_name, "riscv,isa", name);
-            g_free(name);
-            qemu_fdt_setprop_string(fdt, cpu_name, "compatible", "riscv");
-            qemu_fdt_setprop_string(fdt, cpu_name, "status", "okay");
-            qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
-                s->soc[socket].hartid_base + cpu);
-            qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu");
-            riscv_socket_fdt_write_id(mc, fdt, cpu_name, socket);
-            qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle);
-
-            intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
-            qemu_fdt_add_subnode(fdt, intc_name);
-            intc_phandle = phandle++;
-            qemu_fdt_setprop_cell(fdt, intc_name, "phandle", intc_phandle);
-            qemu_fdt_setprop_string(fdt, intc_name, "compatible",
-                "riscv,cpu-intc");
-            qemu_fdt_setprop(fdt, intc_name, "interrupt-controller", NULL, 0);
-            qemu_fdt_setprop_cell(fdt, intc_name, "#interrupt-cells", 1);
-
-            clint_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
-            clint_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_SOFT);
-            clint_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
-            clint_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_M_TIMER);
-
-            plic_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandle);
-            plic_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_EXT);
-            plic_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandle);
-            plic_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
-
-            core_name = g_strdup_printf("%s/core%d", clust_name, cpu);
-            qemu_fdt_add_subnode(fdt, core_name);
-            qemu_fdt_setprop_cell(fdt, core_name, "cpu", cpu_phandle);
-
-            g_free(core_name);
-            g_free(intc_name);
-            g_free(cpu_name);
-        }
+        create_fdt_socket_memory(s, memmap, socket);
 
-        addr = memmap[VIRT_DRAM].base + riscv_socket_mem_offset(mc, socket);
-        size = riscv_socket_mem_size(mc, socket);
-        mem_name = g_strdup_printf("/memory@%lx", (long)addr);
-        qemu_fdt_add_subnode(fdt, mem_name);
-        qemu_fdt_setprop_cells(fdt, mem_name, "reg",
-            addr >> 32, addr, size >> 32, size);
-        qemu_fdt_setprop_string(fdt, mem_name, "device_type", "memory");
-        riscv_socket_fdt_write_id(mc, fdt, mem_name, socket);
-        g_free(mem_name);
-
-        clint_addr = memmap[VIRT_CLINT].base +
-            (memmap[VIRT_CLINT].size * socket);
-        clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
-        qemu_fdt_add_subnode(fdt, clint_name);
-        qemu_fdt_setprop_string_array(fdt, clint_name, "compatible",
-            (char **)&clint_compat, ARRAY_SIZE(clint_compat));
-        qemu_fdt_setprop_cells(fdt, clint_name, "reg",
-            0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
-        qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
-            clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
-        riscv_socket_fdt_write_id(mc, fdt, clint_name, socket);
-        g_free(clint_name);
-
-        plic_phandle[socket] = phandle++;
-        plic_addr = memmap[VIRT_PLIC].base + (memmap[VIRT_PLIC].size * socket);
-        plic_name = g_strdup_printf("/soc/plic@%lx", plic_addr);
-        qemu_fdt_add_subnode(fdt, plic_name);
-        qemu_fdt_setprop_cell(fdt, plic_name,
-            "#address-cells", FDT_PLIC_ADDR_CELLS);
-        qemu_fdt_setprop_cell(fdt, plic_name,
-            "#interrupt-cells", FDT_PLIC_INT_CELLS);
-        qemu_fdt_setprop_string_array(fdt, plic_name, "compatible",
-            (char **)&plic_compat, ARRAY_SIZE(plic_compat));
-        qemu_fdt_setprop(fdt, plic_name, "interrupt-controller", NULL, 0);
-        qemu_fdt_setprop(fdt, plic_name, "interrupts-extended",
-            plic_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
-        qemu_fdt_setprop_cells(fdt, plic_name, "reg",
-            0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
-        qemu_fdt_setprop_cell(fdt, plic_name, "riscv,ndev", VIRTIO_NDEV);
-        riscv_socket_fdt_write_id(mc, fdt, plic_name, socket);
-        qemu_fdt_setprop_cell(fdt, plic_name, "phandle", plic_phandle[socket]);
-        g_free(plic_name);
-
-        g_free(clint_cells);
-        g_free(plic_cells);
+        create_fdt_socket_clint(s, memmap, socket, intc_phandles);
+
+        create_fdt_socket_plic(s, memmap, socket, phandle,
+            intc_phandles, xplic_phandles);
+
+        g_free(intc_phandles);
         g_free(clust_name);
     }
 
     for (socket = 0; socket < riscv_socket_count(mc); socket++) {
         if (socket == 0) {
-            plic_mmio_phandle = plic_phandle[socket];
-            plic_virtio_phandle = plic_phandle[socket];
-            plic_pcie_phandle = plic_phandle[socket];
+            *irq_mmio_phandle = xplic_phandles[socket];
+            *irq_virtio_phandle = xplic_phandles[socket];
+            *irq_pcie_phandle = xplic_phandles[socket];
         }
         if (socket == 1) {
-            plic_virtio_phandle = plic_phandle[socket];
-            plic_pcie_phandle = plic_phandle[socket];
+            *irq_virtio_phandle = xplic_phandles[socket];
+            *irq_pcie_phandle = xplic_phandles[socket];
         }
         if (socket == 2) {
-            plic_pcie_phandle = plic_phandle[socket];
+            *irq_pcie_phandle = xplic_phandles[socket];
         }
     }
 
-    riscv_socket_fdt_write_distance_matrix(mc, fdt);
+    riscv_socket_fdt_write_distance_matrix(mc, mc->fdt);
+}
+
+static void create_fdt_virtio(RISCVVirtState *s, const MemMapEntry *memmap,
+                              uint32_t irq_virtio_phandle)
+{
+    int i;
+    char *name;
+    MachineState *mc = MACHINE(s);
 
     for (i = 0; i < VIRTIO_COUNT; i++) {
         name = g_strdup_printf("/soc/virtio_mmio@%lx",
             (long)(memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size));
-        qemu_fdt_add_subnode(fdt, name);
-        qemu_fdt_setprop_string(fdt, name, "compatible", "virtio,mmio");
-        qemu_fdt_setprop_cells(fdt, name, "reg",
+        qemu_fdt_add_subnode(mc->fdt, name);
+        qemu_fdt_setprop_string(mc->fdt, name, "compatible", "virtio,mmio");
+        qemu_fdt_setprop_cells(mc->fdt, name, "reg",
             0x0, memmap[VIRT_VIRTIO].base + i * memmap[VIRT_VIRTIO].size,
             0x0, memmap[VIRT_VIRTIO].size);
-        qemu_fdt_setprop_cell(fdt, name, "interrupt-parent",
-            plic_virtio_phandle);
-        qemu_fdt_setprop_cell(fdt, name, "interrupts", VIRTIO_IRQ + i);
+        qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent",
+            irq_virtio_phandle);
+        qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", VIRTIO_IRQ + i);
         g_free(name);
     }
+}
+
+static void create_fdt_pcie(RISCVVirtState *s, const MemMapEntry *memmap,
+                            uint32_t irq_pcie_phandle)
+{
+    char *name;
+    MachineState *mc = MACHINE(s);
 
     name = g_strdup_printf("/soc/pci@%lx",
         (long) memmap[VIRT_PCIE_ECAM].base);
-    qemu_fdt_add_subnode(fdt, name);
-    qemu_fdt_setprop_cell(fdt, name, "#address-cells", FDT_PCI_ADDR_CELLS);
-    qemu_fdt_setprop_cell(fdt, name, "#interrupt-cells", FDT_PCI_INT_CELLS);
-    qemu_fdt_setprop_cell(fdt, name, "#size-cells", 0x2);
-    qemu_fdt_setprop_string(fdt, name, "compatible", "pci-host-ecam-generic");
-    qemu_fdt_setprop_string(fdt, name, "device_type", "pci");
-    qemu_fdt_setprop_cell(fdt, name, "linux,pci-domain", 0);
-    qemu_fdt_setprop_cells(fdt, name, "bus-range", 0,
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#address-cells",
+        FDT_PCI_ADDR_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells",
+        FDT_PCI_INT_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, name, "#size-cells", 0x2);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+        "pci-host-ecam-generic");
+    qemu_fdt_setprop_string(mc->fdt, name, "device_type", "pci");
+    qemu_fdt_setprop_cell(mc->fdt, name, "linux,pci-domain", 0);
+    qemu_fdt_setprop_cells(mc->fdt, name, "bus-range", 0,
         memmap[VIRT_PCIE_ECAM].size / PCIE_MMCFG_SIZE_MIN - 1);
-    qemu_fdt_setprop(fdt, name, "dma-coherent", NULL, 0);
-    qemu_fdt_setprop_cells(fdt, name, "reg", 0,
+    qemu_fdt_setprop(mc->fdt, name, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg", 0,
         memmap[VIRT_PCIE_ECAM].base, 0, memmap[VIRT_PCIE_ECAM].size);
-    qemu_fdt_setprop_sized_cells(fdt, name, "ranges",
+    qemu_fdt_setprop_sized_cells(mc->fdt, name, "ranges",
         1, FDT_PCI_RANGE_IOPORT, 2, 0,
         2, memmap[VIRT_PCIE_PIO].base, 2, memmap[VIRT_PCIE_PIO].size,
         1, FDT_PCI_RANGE_MMIO,
@@ -394,66 +442,96 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
         2, virt_high_pcie_memmap.base,
         2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
 
-    create_pcie_irq_map(fdt, name, plic_pcie_phandle);
+    create_pcie_irq_map(mc->fdt, name, irq_pcie_phandle);
     g_free(name);
+}
+
+static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
+                             uint32_t *phandle)
+{
+    char *name;
+    uint32_t test_phandle;
+    MachineState *mc = MACHINE(s);
 
-    test_phandle = phandle++;
+    test_phandle = (*phandle)++;
     name = g_strdup_printf("/soc/test@%lx",
         (long)memmap[VIRT_TEST].base);
-    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_add_subnode(mc->fdt, name);
     {
         static const char * const compat[3] = {
             "sifive,test1", "sifive,test0", "syscon"
         };
-        qemu_fdt_setprop_string_array(fdt, name, "compatible", (char **)&compat,
-                                      ARRAY_SIZE(compat));
+        qemu_fdt_setprop_string_array(mc->fdt, name, "compatible",
+                                      (char **)&compat, ARRAY_SIZE(compat));
     }
-    qemu_fdt_setprop_cells(fdt, name, "reg",
-        0x0, memmap[VIRT_TEST].base,
-        0x0, memmap[VIRT_TEST].size);
-    qemu_fdt_setprop_cell(fdt, name, "phandle", test_phandle);
-    test_phandle = qemu_fdt_get_phandle(fdt, name);
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+        0x0, memmap[VIRT_TEST].base, 0x0, memmap[VIRT_TEST].size);
+    qemu_fdt_setprop_cell(mc->fdt, name, "phandle", test_phandle);
+    test_phandle = qemu_fdt_get_phandle(mc->fdt, name);
     g_free(name);
 
     name = g_strdup_printf("/soc/reboot");
-    qemu_fdt_add_subnode(fdt, name);
-    qemu_fdt_setprop_string(fdt, name, "compatible", "syscon-reboot");
-    qemu_fdt_setprop_cell(fdt, name, "regmap", test_phandle);
-    qemu_fdt_setprop_cell(fdt, name, "offset", 0x0);
-    qemu_fdt_setprop_cell(fdt, name, "value", FINISHER_RESET);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot");
+    qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
+    qemu_fdt_setprop_cell(mc->fdt, name, "offset", 0x0);
+    qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
     g_free(name);
 
     name = g_strdup_printf("/soc/poweroff");
-    qemu_fdt_add_subnode(fdt, name);
-    qemu_fdt_setprop_string(fdt, name, "compatible", "syscon-poweroff");
-    qemu_fdt_setprop_cell(fdt, name, "regmap", test_phandle);
-    qemu_fdt_setprop_cell(fdt, name, "offset", 0x0);
-    qemu_fdt_setprop_cell(fdt, name, "value", FINISHER_PASS);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-poweroff");
+    qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
+    qemu_fdt_setprop_cell(mc->fdt, name, "offset", 0x0);
+    qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_PASS);
     g_free(name);
+}
+
+static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
+                            uint32_t irq_mmio_phandle)
+{
+    char *name;
+    MachineState *mc = MACHINE(s);
 
     name = g_strdup_printf("/soc/uart@%lx", (long)memmap[VIRT_UART0].base);
-    qemu_fdt_add_subnode(fdt, name);
-    qemu_fdt_setprop_string(fdt, name, "compatible", "ns16550a");
-    qemu_fdt_setprop_cells(fdt, name, "reg",
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible", "ns16550a");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
         0x0, memmap[VIRT_UART0].base,
         0x0, memmap[VIRT_UART0].size);
-    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 3686400);
-    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", plic_mmio_phandle);
-    qemu_fdt_setprop_cell(fdt, name, "interrupts", UART0_IRQ);
+    qemu_fdt_setprop_cell(mc->fdt, name, "clock-frequency", 3686400);
+    qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent", irq_mmio_phandle);
+    qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", UART0_IRQ);
 
-    qemu_fdt_add_subnode(fdt, "/chosen");
-    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", name);
+    qemu_fdt_add_subnode(mc->fdt, "/chosen");
+    qemu_fdt_setprop_string(mc->fdt, "/chosen", "stdout-path", name);
     g_free(name);
+}
+
+static void create_fdt_rtc(RISCVVirtState *s, const MemMapEntry *memmap,
+                           uint32_t irq_mmio_phandle)
+{
+    char *name;
+    MachineState *mc = MACHINE(s);
 
     name = g_strdup_printf("/soc/rtc@%lx", (long)memmap[VIRT_RTC].base);
-    qemu_fdt_add_subnode(fdt, name);
-    qemu_fdt_setprop_string(fdt, name, "compatible", "google,goldfish-rtc");
-    qemu_fdt_setprop_cells(fdt, name, "reg",
-        0x0, memmap[VIRT_RTC].base,
-        0x0, memmap[VIRT_RTC].size);
-    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", plic_mmio_phandle);
-    qemu_fdt_setprop_cell(fdt, name, "interrupts", RTC_IRQ);
+    qemu_fdt_add_subnode(mc->fdt, name);
+    qemu_fdt_setprop_string(mc->fdt, name, "compatible",
+        "google,goldfish-rtc");
+    qemu_fdt_setprop_cells(mc->fdt, name, "reg",
+        0x0, memmap[VIRT_RTC].base, 0x0, memmap[VIRT_RTC].size);
+    qemu_fdt_setprop_cell(mc->fdt, name, "interrupt-parent",
+        irq_mmio_phandle);
+    qemu_fdt_setprop_cell(mc->fdt, name, "interrupts", RTC_IRQ);
     g_free(name);
+}
+
+static void create_fdt_flash(RISCVVirtState *s, const MemMapEntry *memmap)
+{
+    char *name;
+    MachineState *mc = MACHINE(s);
+    hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
+    hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
 
     name = g_strdup_printf("/soc/flash@%" PRIx64, flashbase);
     qemu_fdt_add_subnode(mc->fdt, name);
@@ -463,10 +541,59 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
                                  2, flashbase + flashsize, 2, flashsize);
     qemu_fdt_setprop_cell(mc->fdt, name, "bank-width", 4);
     g_free(name);
+}
+
+static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
+                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
+{
+    MachineState *mc = MACHINE(s);
+    uint32_t phandle = 1, irq_mmio_phandle = 1;
+    uint32_t irq_pcie_phandle = 1, irq_virtio_phandle = 1;
+
+    if (mc->dtb) {
+        mc->fdt = load_device_tree(mc->dtb, &s->fdt_size);
+        if (!mc->fdt) {
+            error_report("load_device_tree() failed");
+            exit(1);
+        }
+        goto update_bootargs;
+    } else {
+        mc->fdt = create_device_tree(&s->fdt_size);
+        if (!mc->fdt) {
+            error_report("create_device_tree() failed");
+            exit(1);
+        }
+    }
+
+    qemu_fdt_setprop_string(mc->fdt, "/", "model", "riscv-virtio,qemu");
+    qemu_fdt_setprop_string(mc->fdt, "/", "compatible", "riscv-virtio");
+    qemu_fdt_setprop_cell(mc->fdt, "/", "#size-cells", 0x2);
+    qemu_fdt_setprop_cell(mc->fdt, "/", "#address-cells", 0x2);
+
+    qemu_fdt_add_subnode(mc->fdt, "/soc");
+    qemu_fdt_setprop(mc->fdt, "/soc", "ranges", NULL, 0);
+    qemu_fdt_setprop_string(mc->fdt, "/soc", "compatible", "simple-bus");
+    qemu_fdt_setprop_cell(mc->fdt, "/soc", "#size-cells", 0x2);
+    qemu_fdt_setprop_cell(mc->fdt, "/soc", "#address-cells", 0x2);
+
+    create_fdt_sockets(s, memmap, is_32_bit, &phandle,
+        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle);
+
+    create_fdt_virtio(s, memmap, irq_virtio_phandle);
+
+    create_fdt_pcie(s, memmap, irq_pcie_phandle);
+
+    create_fdt_reset(s, memmap, &phandle);
+
+    create_fdt_uart(s, memmap, irq_mmio_phandle);
+
+    create_fdt_rtc(s, memmap, irq_mmio_phandle);
+
+    create_fdt_flash(s, memmap);
 
 update_bootargs:
     if (cmdline) {
-        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
+        qemu_fdt_setprop_string(mc->fdt, "/chosen", "bootargs", cmdline);
     }
 }
 
-- 
2.25.1


