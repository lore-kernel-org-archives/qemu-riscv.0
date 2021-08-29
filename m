Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKCuF-0004W6-IR
	for mharc-qemu-riscv@gnu.org; Sun, 29 Aug 2021 00:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8689bb0ac=Anup.Patel@wdc.com>)
 id 1mKCuD-0004Qy-VV; Sun, 29 Aug 2021 00:58:54 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:54436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8689bb0ac=Anup.Patel@wdc.com>)
 id 1mKCuA-0006P2-FW; Sun, 29 Aug 2021 00:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630213130; x=1661749130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FCDLOIgBu1V5SqK/pFDrx3OisLjPSOBMNXt7ApVwJdU=;
 b=ltTi/g+Cm8Nya8c3amIX3oFi5tkUKLAgC8P6nNwjU58Lymo/E/Hqn8cL
 quiAe6yrqmtTftRt9BQNRZnWpSyGdjt57U7fYKCNrmxI+NQTOd2OEMRVD
 KMa62h4nKKRr+OdvWdniYiWEaP4lc9f2XMsTB4Ka7hvSOrqSUXZnp4wjY
 Il3zH/GdlrRgsERFmPUfvtdTYp0totkFIvYC761a6dZKfFKl5xRnhYXci
 G6xiKPN4+G7VLusX+TRnQ5aBwDVsjwIw9VUaxQQgWd6L+gockloiVI9MV
 cjLmYuuXzmdIgnSJqIzIvl81zkMHCoKkD5uldo+5QvoOA6xjWY6ybfDrQ A==;
X-IronPort-AV: E=Sophos;i="5.84,360,1620662400"; d="scan'208";a="177798724"
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hgst.iphmx.com with ESMTP; 29 Aug 2021 12:58:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YA8NKdlRdmR9FLpemwK6M440adayC+VK+ylVukC24BgudPssITYL9XdY72lbSz8BtjIGvKdUBc1hmcli47S5ZUPNcuClKwigc/4uiW6Ldo10If///jW9SGau+P+3pW+j/uy2Bfd1dERSOsZK3H9XW/xc4SiVoEtLzWW+LK48I7bpahGvlOvaxCqIrW+Y53MrCc3q8PcpS15h4fL2vIM85Nc9q+fMnnTTvjrAp2NykBLw879iEtCM5q7VuZccLy+pBNJw956x//rbI7T/fHOsbGPlLV3ejNXALyX46afsBUottLb/xpqeTn5auLFZgDjcw61tJxsryM6I+CXVxMDlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ne1oVFHRTUL+fVRpOHPYaoUA5XdRjhwAKqzMj75a0JI=;
 b=gsOvAbMMZyOSTXgo8NUHzOei+bLOSNRqrCO2gHfFpSJFMH2DPLNSLMNPHI2rPCQTRmW1M6xMSHJQ8lDeS3lOsk6wVZBv4AAIc8lQ8gm0U3QBVet7ay3w0A4ZKnPkYMFBSwPJ38QWr322V/5w8T5SVjR0JGyGq+sUbOpgl3VqWhTVn1GWmW6c1n/+nvxqhuqkXsFDl3MNh1QioSLjyPTKVftLXNuOi9cXDLJEZIntOhE3SJPjgfCWebczHXKARILIO14N9kTNh6YAo461yqKTTyE1Z39Rqqq7ywiIlSballNbqcXi3tTD07y9X11Ge7M1Md4veXC3hluXHS9iZlUnDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ne1oVFHRTUL+fVRpOHPYaoUA5XdRjhwAKqzMj75a0JI=;
 b=lrcezg2Aon5SXfRoU+FK0kLMTN2H0ziZ1xcE2BNmii2p/D0JIsOCpslZN2l8PEFZP4z6TBm068KdxUAdma4pK/nTsTqW7lA4AhRFKnq01Ltf+iNzN4Ns7eex2D32Vqsi8sSioe1bCJ3R0OnvEgKniGhmVDSrA1JZ1Z+4eGxnKjI=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com (2603:10b6:a03:3ac::8)
 by SJ0PR04MB8274.namprd04.prod.outlook.com (2603:10b6:a03:3e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Sun, 29 Aug
 2021 04:58:47 +0000
Received: from SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514]) by SJ0PR04MB7821.namprd04.prod.outlook.com
 ([fe80::545a:34f7:53c5:6514%8]) with mapi id 15.20.4457.024; Sun, 29 Aug 2021
 04:58:47 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v3 3/4] hw/riscv: virt: Re-factor FDT generation
Date: Sun, 29 Aug 2021 10:28:13 +0530
Message-Id: <20210829045814.69744-4-anup.patel@wdc.com>
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
 15.20.4457.20 via Frontend Transport; Sun, 29 Aug 2021 04:58:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c03240d-3a77-4f98-6794-08d96aa9af63
X-MS-TrafficTypeDiagnostic: SJ0PR04MB8274:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR04MB8274274BC5C15C234953DE1F8DCA9@SJ0PR04MB8274.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WmxRMx/XLkN9U+rwCIzoPLN+a8UZj86jMRC9Nx3WVLiFCFbvWBnQ63t9+Vsfqg0alOPmgbPhfjj+Qj88W+SQWe1Gnhl9+d4QseeL6FXwm6Qm4UwU3t3RoURYzw03PpvsrWSSzc8fwnobhkDG1m148dtHvyjvdNFXBW3L5xnTBihurqaKLNTHll5hO3U7gXWW/FbGtgueMxcbWq5YYA+WAyXJgtUQuSlZtGkkBLKRJ9UQgJIg7oq8qQ+ombN/ja65tmWotnaAJJhTsCm6QHaUzapF4ar6oocUEVfU6yMuXzKOyTImC+Vk3Dl++cRfRy3VBjl0gVIZUNmJ4cvHpaoXcuZLprxH41V4ArrjPnOQ2mjm0yc82esEAbVSFzyRUeP8Cx9+LVYoCTqA8swSZv+S+Rz9EB87whxeHKsmUZGHU5RAbU6AuUPbLOcMOcbPC/gyGuJSBMEU8JWvJJOqTy6C9eQFMFCcg+tgO+aw1mhoAoGqSwI5IoIQg5Ffa4C9E/br2U7NOLihtsPmGnDiK/zDrvBDf+Xe2m1ZWYhN0h96e728h/wEqrcWltBX0op3zFN2CvSIeRT70KXnInazSXsz9PhxoX/Dm+shBORw+C0feM46dKiV8c0bNGzD7Urg2XF7I9wFweJ8bjCy0Oo5EnZAaYVU97mEyoAgBB5uNues3IEWScn7+VjjVuksDdGVZK3P6/y2ixHchBK4t6I8JwUbjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7821.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(38350700002)(2616005)(478600001)(66476007)(86362001)(66556008)(38100700002)(52116002)(186003)(66946007)(956004)(2906002)(7696005)(6666004)(316002)(55016002)(36756003)(54906003)(8886007)(110136005)(30864003)(4326008)(8676002)(8936002)(26005)(5660300002)(1076003)(44832011)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Ha2aJj8lJDBTagIXsK2+kjT1Qaem985WWA66Tgfjur42gMnOPtIEXjL0G3j?=
 =?us-ascii?Q?na6Ec10YtEmjJeFsi2+11lMjSu/NSFr0c0baOuWU6fpq5MLx6l8S+/2MwvhO?=
 =?us-ascii?Q?c8ROZNVve4QWwQ9Qi9WZ7ZXDIZrdZj7R7dnsm9Wu+0tbqO1YWNV8e1g9B7Bg?=
 =?us-ascii?Q?M93zP6L3bQg/zPJrnd3EbGQwOtk1e6Al05KQhtH1kGqFv8UUfYlIvVi7VSvY?=
 =?us-ascii?Q?hWOorTS8JQ087LYW+jYu81pM8ZixHS3OWQgLrQ8nlvkIpzrbYlOmYB+hgM6Z?=
 =?us-ascii?Q?ajgUpaocJLuSCW9y35fmd+ZSisr5QiuXdA9CodzhmEkKnSUA39j82KqYONa5?=
 =?us-ascii?Q?4j77sFHVxk4JDjfVjG3Ky2lu8nRN+1sRQUWUUzt86lFVOMAX4ku2lpsNMUh9?=
 =?us-ascii?Q?cx9xrcmWOEs+mDbfclaSHTT5GM+2uLwWWkbKpBK8lS2Vq9ueoWLahYP6Uv8j?=
 =?us-ascii?Q?UXGfDP3Mn5fveOepE3ISSIqe64SasWoXRcJhRsDtC9lDdjZu4/IafrKnT4QN?=
 =?us-ascii?Q?R97q0f7IRSi8JQ0Q2zLfcfkjZtFgNPmlm9EqrIL7pDujyhK1+S9TxD2nEJqf?=
 =?us-ascii?Q?EvFM6oyyR3GQPIksIUguHKk8+1z5WArrHDjbyvWctG3H0fk1dLwZa9+sRWU7?=
 =?us-ascii?Q?IUpE/JWmihg8wmZaYqJ/stRDbX7RR7JuYh+SLH/DfrnW1qC3UyE1TH+u1Hug?=
 =?us-ascii?Q?wSWYHdb/PosX9gFtqH1tmeL+J+UBykml10VO3cpfuSmrneMChOj/hGrC79Yh?=
 =?us-ascii?Q?L53P9Vxszk9+Slj0bDmuRsnnxdd+K7c+axv/cmDTpEHi+rrdVQkq8ImLIcKO?=
 =?us-ascii?Q?GKBCR0fn8aPyS+wuVODyMAjMzXDbYwp7hly8Z/MZktmJQK2szNTa1cAf1541?=
 =?us-ascii?Q?L2agzEIeNA30FmkgnUUM2GEQbk1FADUqMpe8ETE3tdM/JIkpWQf67VoQosH4?=
 =?us-ascii?Q?5Nnl9zhkvijykEFzut/C+Z5dbMR0HbJDIG90lNmLd6JX6wk1pgVeEOfAnKav?=
 =?us-ascii?Q?uoPWeoPH9IOlqTmnwtObi9Naknmjp0gR1N3YGeljMR0GJ+J+Bp8xDC7iFwov?=
 =?us-ascii?Q?nJuE6tBKAweI9VvFIA26be2PEG2aNz9ndHBbV/dHozWLIVRrevtg5WN3YzQV?=
 =?us-ascii?Q?wccHwbuwLOc0lIB6QyFdWMO9lmBu0BRAgd6AlwxaP1Fz40Si3JfEnvXrkgJy?=
 =?us-ascii?Q?wBxVX5DWt/9Yx8NYJj0wb9IscfJx6ySlbwIhj19mqdoevGTbIEHHN4GABg12?=
 =?us-ascii?Q?Ae6aRQYOhbDzpYo4geOvrvFtZfOyFV5m1C/o2U4DysSzOrTMAnYH0SbnpBCS?=
 =?us-ascii?Q?/zl3r/w25ncpezRmuEMJhMUk?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c03240d-3a77-4f98-6794-08d96aa9af63
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7821.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2021 04:58:47.5793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBpOr6jdVfCO4RBrIMGcegLEHW7ZsBESiOeAbKdKiucARiNoL0/MG0dBWiPPAt+gkvMPoe1s07Fy6Ign/9ZCfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8274
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=8689bb0ac=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Sun, 29 Aug 2021 04:58:54 -0000

We re-factor and break the FDT generation into smaller functions
so that it is easier to modify FDT generation for different
configurations of virt machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
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


