Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL1bY-00050a-06
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 07:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=870f666b0=Anup.Patel@wdc.com>)
 id 1mL1bW-0004ve-MU; Tue, 31 Aug 2021 07:06:58 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:63071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=870f666b0=Anup.Patel@wdc.com>)
 id 1mL1bT-00015N-5D; Tue, 31 Aug 2021 07:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630408015; x=1661944015;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=I4nqj0gLyTo/Uip6r0FvCkSuHwq3eo8xC5vDDzQVzko=;
 b=KAzx0qcxmB3KmqZHyOj143ssaqw/8UwT21unBLBtx8RVUf/uU/p31uyU
 8Lhe/3cIk7vtrWccve7oIWReSMfRd9utRG/fiFNht1YoEoHgf+AgMS1IR
 74DXWGTtFHjKWh5hAWj4Tnt4VShHQKQOpGuTzrWfeo36mlTCIwbOlPltD
 A6z2ZikDt/GUvK7kI03f5kYk0foWwh0w+C1zujEbtYn0oTWdtZbsGGQSy
 I2OcGvXo5b9tCkh8V4ZkyM8fP3vqsuiZ5Tu52fKCayj0SUcuBgR2ChpDV
 CG1b75HyGz/IcB3fFgaAfIteCJqpjN5DZSkVz3Yryg201eZIBwTjlgHBs g==;
X-IronPort-AV: E=Sophos;i="5.84,366,1620662400"; d="scan'208";a="282633472"
Received: from mail-bn8nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.174])
 by ob1.hgst.iphmx.com with ESMTP; 31 Aug 2021 19:06:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rt8eXSimZ2aEsaPrQnbxQANNOYUIvgnErVg09ivqOCJ5InnThAI53jp6w1charRFJTR1kB/23t92s4DENx9XznvPBLk5Btu8CubfG9K6Qc0qogn/WA/+/T6fTCe2tL+/Si1kWIYr9MB0Dcb/4phPJ+vyPTS/i5YOi0pCFW22KPRkr7QGKzg+Oki26nW347SEhTMSELdZG9sFhEhutWhao9W/CmtSQzj6RdPVVg8t35vIJqpKuy8uo1zMzi9MYHYeta6UWJ3CEMun5hU8ZQI6tdbBYd3U4PADWyrtmPssegd0W5SM8jA4p2WuQJQK5peyrkb07Sgra+KlvsvVv6oU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wi5gZX1kL5OlU22fg+3QLYoJIu1jKtEEKSQvPy/w+Zk=;
 b=VFvCXHligteanGrvOEGTqkgaW2bUjMYeppLUwiIz+mO3wpeUHzFYWQdnW1m+usS7lEs1MQazoK25menhzOF3PIyIlzwJlO54jDShVh7mbadANyvB3/UtZufMVZxzmFUAFAm89Ql7n4J2VeTR9qc2dGyKXwvdeFhP/+jw3bPlbcve2r/98SzEh5ZZRcP5IUAz+pblyhnRZ7s4deW1daYSsyVS8JkMN+ZJxk5bzZrnJHpPHKU+KcmhYd3SMT59zUopZHCbUEMO99FPHssJT3ofCp6EiP+VKT15zjDAu4HKwRl9k/696tMqEk6eUplRxhD3YTlDbDkS0V1w92osttvkSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wi5gZX1kL5OlU22fg+3QLYoJIu1jKtEEKSQvPy/w+Zk=;
 b=Nj7f3MOSeUJCgWqFCYidRO7d6T/KdYKgdYlAMtDHl7iDdvcMahZRetfmJljbDbec5ZqhSkhweUZKxebzOURDWY0wGYFOiPUlyiAFsdZCJi908WK+p87an7IhK8/k+tJW9wcd078oNjWnXYI4/QHlMJQyLSIKXrVt7z14J6MTVd4=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com (2603:10b6:a03:3ac::8)
 by SJ0PR04MB7886.namprd04.prod.outlook.com (2603:10b6:a03:300::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 11:06:49 +0000
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514]) by SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514%8]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 11:06:49 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 3/4] hw/riscv: virt: Re-factor FDT generation
Date: Tue, 31 Aug 2021 16:36:02 +0530
Message-Id: <20210831110603.338681-4-anup.patel@wdc.com>
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
 15.20.4457.18 via Frontend Transport; Tue, 31 Aug 2021 11:06:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8be1085-6ba3-4659-e79b-08d96c6f6dea
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7886:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB78866066D7D29DE3AF9BDE968DCC9@SJ0PR04MB7886.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /HoLkLPfdpHAbhiEfgRJe1OhhLtsZgT3eHbHfZGMNucIDcTeVc+Vlq4XEjkc+OBvQBa343oh43QIJbuG28QwQv2tnIT8jg68e4yx7Cc6rzB14YiwG3BSG2YgkMwyp8t4NPQwAaMk3Sjzu9lRupbUy20GgLgWP7+cMuU6O05OoAPwoSCc3uHKpjY38Ts91ghdwA9HQpzE4FCzkrFARMyGQBND1O2QH/LcjUYOiTQxqJ1bH/t6aab/4IY8/oKEfFA4FylexcDTGScdfryK0JjlQjV9u+zHIPBet57OZJHX8jQCCV/RYq9bdY8OkPaHeN2bNcUn/mJp5StbVGv89JGK9ztRfovJ90RzeEMxI7BkqtGFrwMxWK+2hEpqsWEJwBW2DFKtoziN75RXw/hVVlceqAZcJKRqF4EK0XfsFV929o/o0d7w8FLzreIKUoFdcNp9UYsHmggj/TvyEzvjMYTxl3QuHloaHh7r4QupjCtx/Y2ZlktTLEiRbTKzXr9qFdBaLcWLNdDBzsA/p/h7dcgqNqEeCunFDiqOnr/wu6yUF0/Gvbsy0q/JNj0+rTguCu8t4kuwVYLgZ+LMlbpKCFaeAE91+gPVtbL+UL9/eWGdILuk4Flqye5m3bzfVcALBJgRNYJmq1CCoAtE88WQE3wIvPlhDLpb/P1sR9OGfeWMNByY31oUqY3Zx37RECeslE5yN/Na2pHG0lkUL+LSYzar4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7821.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(38350700002)(86362001)(2616005)(7696005)(38100700002)(44832011)(2906002)(26005)(8936002)(956004)(66556008)(8676002)(55016002)(54906003)(5660300002)(8886007)(66476007)(83380400001)(316002)(66946007)(186003)(36756003)(110136005)(478600001)(1076003)(52116002)(30864003)(4326008)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6R8yFktAumO446Hlpz1dWhW1PBfBL/cl+HsCW4iOatb8ZJAKjxAUh0A+kaeC?=
 =?us-ascii?Q?lZDEDU68MnKzVh9ekwDqLR+0Ac0351DGsy1PycnAGtyjjK3ZjFtRFAuEDVU6?=
 =?us-ascii?Q?hWqSALPyv16kGXW4U1CwjAvSJd8QIHhbWDLTzFGsCkTv7friRlXDYh1nPE1d?=
 =?us-ascii?Q?pKIyhAIG4mTYzvpsHzponj/UQLO0cxmCWC/KntLaUK9+HOxgAOqFSYpXeKm/?=
 =?us-ascii?Q?kuVZgWXg5NCk9yOuHydcR/W7c/x1cxjjboIGk62jT7K/DK2gv92GK5T78eX4?=
 =?us-ascii?Q?9uVWnaIqbXUCrkNdfriJIHejFGJKVqufjfktnAPuSCkLqLj2lhlUJU9oU/LQ?=
 =?us-ascii?Q?j5dwNYyly2lS03PPCg4aZ3gQor6n76K3lTFqmx57lI2ptJOR8FlqTswW28cU?=
 =?us-ascii?Q?9YkOUT9aSk07j/IZpyhtHXLm4cGSloptcezNYZkiAiWnA2TUAK3CsTEkpQkT?=
 =?us-ascii?Q?dyEPJg5QpW7XrPjBjkOFGx2qV+C04QTOpo/tPDTukTQSSGAkeZcISXshtVDd?=
 =?us-ascii?Q?ew1wBSbWWj/AW2XCOZNPKbfsYwHGUGDl2QkCNU5dh1+McpFHuMzRGcJ3w3dx?=
 =?us-ascii?Q?WOS96pAwbAyEwqRZ/sg3CED3ZmdiW4CKVELQTsXsSJe3w8rMUFJ4fmsN/WdH?=
 =?us-ascii?Q?waEgxZiLtwZwpeXCcXyxXnON2hDK+FUsl6MJWlFYR76bbfWn4WFkwrp7uA2e?=
 =?us-ascii?Q?5GZQYUAk3SGG0iAK0bwpGnk8JHSzsPOMcd+ga+NtfdBAal9SWWUi1TEw8B2S?=
 =?us-ascii?Q?Uc/Q176gpmK8fW/T5wDO0X0Ruqq/nkRkDNSOvfZHe9Kah0MAPB3OvXMVj+yw?=
 =?us-ascii?Q?NpgGcO4BALLteuaIvAca5QbWRXyexwBtBzBFBlFLiAPZ74tQM1Mk4JKBL6Gs?=
 =?us-ascii?Q?3ZEjp4oiRDMXJK0v+dESuEzJf8lnhXWJ3txiEJxI+EgTYTs1TEdf/JUDmUL+?=
 =?us-ascii?Q?D3fT7X7dsoOxaAI/WELg8oI66/TBWSn8YzCQTHLQoJvRkFgKxUdhXSwSlIQY?=
 =?us-ascii?Q?OlA6aIud872nla4Q6LiWyOYNRkyem+Pq1quQSKI4+DLvu5apJe1mYTniBJDt?=
 =?us-ascii?Q?nXnOiqw43Ol53zKLEm14aCKn2njHmDZTQr5ODiAVCSfLd2YqbQaol0MLqP1j?=
 =?us-ascii?Q?e+yeAsl/PeVWGV/VtXeL1LuBQvALq42rtYwuRvpEGekZzEbB3aKcIBmVxOYa?=
 =?us-ascii?Q?O6FOUZtT/51Zcpv1unptJnHqBRc4vNMFMd/CgcMUZUy7Hkj9dqAwmhYcGJcj?=
 =?us-ascii?Q?1He2//JkFmJm+U0MZ5JSqywhfs51VUDUxFtFjU9Ah51/fzDwHyj7I2nrmwAu?=
 =?us-ascii?Q?O0jELP1J3fQwhS/vuTx/lXUV?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8be1085-6ba3-4659-e79b-08d96c6f6dea
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7821.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 11:06:49.2121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C22Gd40YfTLtnYWDT+10Je7py6fASjZCiFmnNbTDh5nuzplMrr8HxLeCuXYk/vgIbXzacffeP/pDWQ+nXOelpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7886
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=870f666b0=Anup.Patel@wdc.com; helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Tue, 31 Aug 2021 11:06:59 -0000

We re-factor and break the FDT generation into smaller functions
so that it is easier to modify FDT generation for different
configurations of virt machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/riscv/virt.c | 527 ++++++++++++++++++++++++++++++------------------
 1 file changed, 327 insertions(+), 200 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1cd7ac1546..7f716901ef 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -176,214 +176,262 @@ static void create_pcie_irq_map(void *fdt, char *nodename,
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
-
-        plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
-        clint_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
-
-        for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
-            cpu_phandle = phandle++;
-
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
+        qemu_fdt_add_subnode(mc->fdt, clust_name);
+
+        intc_phandles = g_new0(uint32_t, s->soc[socket].num_harts);
+
+        create_fdt_socket_cpus(s, socket, clust_name, phandle,
+            is_32_bit, intc_phandles);
 
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
+        create_fdt_socket_memory(s, memmap, socket);
+
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
@@ -393,66 +441,96 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
         2, virt_high_pcie_memmap.base,
         2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
 
-    create_pcie_irq_map(fdt, name, plic_pcie_phandle);
+    create_pcie_irq_map(mc->fdt, name, irq_pcie_phandle);
     g_free(name);
+}
 
-    test_phandle = phandle++;
+static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
+                             uint32_t *phandle)
+{
+    char *name;
+    uint32_t test_phandle;
+    MachineState *mc = MACHINE(s);
+
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
 
     name = g_strdup_printf("/flash@%" PRIx64, flashbase);
     qemu_fdt_add_subnode(mc->fdt, name);
@@ -462,10 +540,59 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
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


