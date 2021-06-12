Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ls69u-0002of-UY
	for mharc-qemu-riscv@gnu.org; Sat, 12 Jun 2021 12:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=790f0be0c=Anup.Patel@wdc.com>)
 id 1ls69t-0002jn-Fp; Sat, 12 Jun 2021 12:06:53 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:45081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=790f0be0c=Anup.Patel@wdc.com>)
 id 1ls69o-0002Kn-Mm; Sat, 12 Jun 2021 12:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623514008; x=1655050008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lk3Ws4ysTXjixFJQXpwsxjyVtY8KYkjCwTGKdZyECSc=;
 b=BFFAapg74GonVLZJWXa7iFv/EtGohAEEudUNcMsjw9ypISMGAueiDnN6
 OqEZF6EABlbEqYsOAO93zdjfk0IZhSdmG9r6PNc0LRsTrUsf+tCvLnQVv
 4Ya39C/2vpycpQXQKUOBEjJbziAHNMgNbrGPNbw6QscjzlsgtL+HTvl42
 vhwfba8ZmeZVgjlokpUnTmTB0lMU7zLS1WeXdZNIVkH+d1M+PeWqbqvJp
 0nphUVXMn4i8NB2a0ziB0R0Thva1jpPw4KWhjb3SFNnnsF/K5hGe+g9eH
 XH//sJT2SrJxjklRQjfGQnpzgYlZe8QD9iLr/DUwjcA4mHOai9sqZ3mhs Q==;
IronPort-SDR: 5YmtLKGm951QumsrpU839camZuTXMj71+63dIGIIZjsLlxKjAxrVMoyx4ZmKzObw9b8JGfFR+B
 veA0xHQUixOK/5Tm79w4K5vSqh8kFhoqQ+EYwDpPGElarC391Cy+MDYY0SPdJpXGmX6tR0TZ1r
 2u3AGQZLiW+v5Uie+YMMMkARa86JghA2qcszHZ1TkxJKYJDi0wYkJBAMmp5+PqJC0iwL0ZQePz
 7IJwc+1psM/ZtkhpDla4At6qAqUFmanCtiDul1TeO1AAMf9WA8K0vtagGzgiSEpDOAABWxy7qb
 Cxo=
X-IronPort-AV: E=Sophos;i="5.83,268,1616428800"; d="scan'208";a="171704749"
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jun 2021 00:06:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKb3AVxi6M7LL/mawM6B0VGp0jnoerdt1WmtTl0Q3J16tDdC4pZ9JkXgiEGR/iDEkSNkz7AmfYFBHVE5Z4REGJAeY0FPealYRa7CVWo6Qp0jieB/erMec8RT7LAAoZQ7gkppefQRcnFjD2yEqgrOirckJneF9DGGic2mxSQAAx15MefCFUh8mZ/fZSN72Ha5amDmUnICARbZTNSRY4xu14RjWsGaezjeCQTOiz+HdXdxtCLLw2xyAetHXF2qR0O8/GdmqqdHAz3W4SuDMxmg2DkCVPkkgXYE+XSw2rZ03hPnOysOeZ6XqiXf7FAT10xV767kaGL7isOYB4FgGfMbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRaUtYnHXMIsCuwMxUw7v/8INEqzPmljHB4ZZq87KSw=;
 b=JxuwWCSyvIfBt9MO5FuP5LnXhAgkPfLRaZRnjjL/wQHtN4N1t3mBoWll77SCkl8LdaYJnXu3qfzPvW+tCQG978gFAID/eKUKJK3GTiP+suuaK78z3KzpnlIun0aqhpcLHZuHM2Svevt5rbCdMsb+TmCTklNQayQtqVg8OWO45zbsv8FRg/jOPok0N4nbTXXiUozsNxTpYzusUqgY8fJZKVO4dgmeW86CJ6YDvIk4tIZ9t+cS9knDhlYVhGTi5fMoUF1RsHnUzFjS3vI8hFR4fy7c/PyFkkvv7gw7fnpNPNmwNqF6gx51Qrj7YmR1MnKgRaO02xrYGKppTIzJntk31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRaUtYnHXMIsCuwMxUw7v/8INEqzPmljHB4ZZq87KSw=;
 b=ewPT9IsLYblHeU2z2oiEnjh2SvAYCbjZIupcnsxAxsYz7doCMs5mEDnipoBL5Mg2cypuzxHECzfUxg9BwTNFgNnOHzlwyRzzlrD9XfIGwZQ17bWGtGISmsTdl1ny2FT5HwgW8B5q0EJhQxmVoBMgbmlO4Df4rRqF6i2VRgayQ7E=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7747.namprd04.prod.outlook.com (2603:10b6:5:35b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Sat, 12 Jun
 2021 16:06:44 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4219.025; Sat, 12 Jun 2021
 16:06:44 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v1 2/3] hw/riscv: virt: Re-factor FDT generation
Date: Sat, 12 Jun 2021 21:36:14 +0530
Message-Id: <20210612160615.330768-3-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210612160615.330768-1-anup.patel@wdc.com>
References: <20210612160615.330768-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [122.171.171.205]
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.171.205) by
 MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Sat, 12 Jun 2021 16:06:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 092d6be0-9eee-46af-6d44-08d92dbc1287
X-MS-TrafficTypeDiagnostic: CO6PR04MB7747:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7747247BFB706242F3D650F78D339@CO6PR04MB7747.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W8YGZFyxd0btKM2lsYFcjoxsvxJp+LVgg9aIrT7fpW/oSHmlpc0yIaUKJvk9jzxnMFf5qORSQAdKHrjNS07UK4CsD5eKJKcfK2tL77gpIUEnZx5Q/D0XKp9VocYyStRMmQ1CHuzQmgT8Ygs1gPUAFsR/qieLIZ6cg6uTVeTLRhF7OLQpEuejOebVkL7g4KPBqD2caZEgHWhLDevSOUhHJk/YRJn42CtTyVCZ+CR5NtZJ4XDFnZFChzH1l/HaNq+ujEAeLHNR6NggYHbCmiNS5jPlYSe10JrojeBLlyLLM8uGZ/mq/IKOmW6uJ+SqhfVh4l5gSWJy80/QaS1tJQJgWqeGrnuowjxp4G1AFm2eiyfWhitEtRQ447n0bqW9i1wNhxJYiTSP0++bM6t8LwaPChABnmNmVSCKnc1vRPr1N5VSP29/QSPRXXWLTEkIjDypMcSosFIkqplXjmOUHJdKlp/5GC91HHon+g5rlRHwuOf8gpQO8tVHcv2XAigqDu4JkQxIca1hq87pvAARetHo37V7XVkrgQuiTufKJVHr7wQkov8sJLxfS6iBZHvmswXzw4HnnbQQ5LvnBM1XZqtHySQj39lNppCiGtDHJHRseVoIhjD/E8V+NNKtT9X5S8Hd20fBNFuxESDq8Xx6+Z/txg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(54906003)(8936002)(8676002)(110136005)(4326008)(2616005)(44832011)(16526019)(186003)(66476007)(66556008)(66946007)(2906002)(956004)(316002)(38350700002)(86362001)(38100700002)(55016002)(30864003)(26005)(7696005)(8886007)(36756003)(52116002)(6666004)(83380400001)(1076003)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?buyif0Af5q86EdwlpxTDBCxuoWSCsYowCyfrWmMUg6A2f1EdZfotN6NP9bZP?=
 =?us-ascii?Q?+tQNHbIwC62taUTAVjzNGY8SU30TDjB5pQVrPK4SyDXvyAlsWM019EKCvLKB?=
 =?us-ascii?Q?OHPngIUOlgm6mTRCwEGsK73aI211y2kG5EI+ejo26kfOlksHLzxWd7nySXmv?=
 =?us-ascii?Q?K3ieOR9qQI35wGMBBWWP0QNr7XLkxQ8fkJ2qTYUUd56zve/R9+hxLqQ36CW2?=
 =?us-ascii?Q?tOJyxNFt+FobS4oTZrSOs+Xz0Hke6TkrlYVy2ao3vOcAnvbrQm1dcunbRa6J?=
 =?us-ascii?Q?QiTIMpLnwC9dVyCsTZBcU0ydRdrElRo34gO/wUIsvpPygQZcC9iOtuLQMfqz?=
 =?us-ascii?Q?bQFXdj57Qns0Fv/qntX6plhBajnjcqvE3WjoerktkAOINB2jwJ+JEshtN14a?=
 =?us-ascii?Q?64aNN6H/I36V3/cQXsP+lVHgtfMHKOhNyEuLXC3aQLQ6EKCLwMa10pIFEGkk?=
 =?us-ascii?Q?75PrJKajh0StmsLEMt8TGHg835RjEw2JvJ0u3q5opudKHPk2fMXjPKOvws63?=
 =?us-ascii?Q?97CD6FqdymGfR22DP+1egv/4Ou6sPldT5y5z7PKDO36Lgx5LiMM5ptME0f/M?=
 =?us-ascii?Q?AlhO9dTN1CtKfryWLEPTdWhbZcq+N/bnch/E4F1XYthp75JKsdEyewevfqgL?=
 =?us-ascii?Q?xKvLRFBVknTRtpfUxOl0wkvtK/8J2fSCITzpIcslc0t3keJLvoBZxHbwEEeU?=
 =?us-ascii?Q?4XA7yIt0GJk37Kg03O1eY4fLGhruTUn7E55KMWo/JtjXBPFxCproFm/13oxT?=
 =?us-ascii?Q?wQf1DzB8wtLLd/XGOBSLnVpOjP0bHbSQ/s42lzo4ACLLXSW5DwZnCXWrWTBO?=
 =?us-ascii?Q?MQkdLuWzHnPWTL7UqJ8r9OEBX+qWTQzy8a6GeYAhwqn7ra72vbCNnhsAsgyY?=
 =?us-ascii?Q?B5r8qQJ5PYVYztT0AGKTChlpQvW84X4XUXDnkRBhWibK4rC2nhPwOnY/YJNk?=
 =?us-ascii?Q?6nBrxnl4bac5FcrXmSerdBFKtRenlIC3u8jMP4JbAiXaP1GGdrM8mI3DuYQW?=
 =?us-ascii?Q?5qeu/zMsBD2/96PdSKbwMzafqgTZyp+1FPCBhgDdVdiE6cqv9uHSktF4dkcO?=
 =?us-ascii?Q?Wq8dNLo203TaWi5tzmjXsMYlA6iQFj9bHn53SDVITRehnlB5KkpNKypxtSTI?=
 =?us-ascii?Q?bHbXDcPfXjUf7Wodv3htqwr4y1bUhU21+xJ/QhlIf/JdFDFpz7Ci+J6wpoGF?=
 =?us-ascii?Q?OO62MButHin4lWMpNocCKEWhEt01dcG/tF8uo4k6oEb2mH7PdKQ66WsaysU7?=
 =?us-ascii?Q?IidtUoOfIeIHaYSEYT110yBtJcK9V5PhZix3noWNzZHBm//l//LIMeZg9R3K?=
 =?us-ascii?Q?10CEEkQ1PtpC2jjFkXpzDgOi?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092d6be0-9eee-46af-6d44-08d92dbc1287
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2021 16:06:43.9952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJ2czKD+G3qpORE2OxdP46vxhqIsmiInsRcWPugKAWcG3Quoq8gPg2S4hi6Lg/AB2Xg9M2th1kMwahAJo9Eftg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7747
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=790f0be0c=Anup.Patel@wdc.com; helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Sat, 12 Jun 2021 16:06:53 -0000

We re-factor and break the FDT generation into smaller functions
so that it is easier to modify FDT generation for different
configurations of virt machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/riscv/virt.c | 514 ++++++++++++++++++++++++++++++------------------
 1 file changed, 320 insertions(+), 194 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5eb63f6efd..977d699753 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -178,206 +178,253 @@ static void create_pcie_irq_map(void *fdt, char *nodename,
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
+
+    clint_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
+
+    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+        clint_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        clint_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_SOFT);
+        clint_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandles[cpu]);
+        clint_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_M_TIMER);
     }
 
-    qemu_fdt_setprop_string(fdt, "/", "model", "riscv-virtio,qemu");
-    qemu_fdt_setprop_string(fdt, "/", "compatible", "riscv-virtio");
-    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
-    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
+    clint_addr = memmap[VIRT_CLINT].base + (memmap[VIRT_CLINT].size * socket);
+    clint_name = g_strdup_printf("/soc/clint@%lx", clint_addr);
+    qemu_fdt_add_subnode(mc->fdt, clint_name);
+    qemu_fdt_setprop_string(mc->fdt, clint_name, "compatible",
+        "riscv,clint0");
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
 
-    qemu_fdt_add_subnode(fdt, "/soc");
-    qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
-    qemu_fdt_setprop_string(fdt, "/soc", "compatible", "simple-bus");
-    qemu_fdt_setprop_cell(fdt, "/soc", "#size-cells", 0x2);
-    qemu_fdt_setprop_cell(fdt, "/soc", "#address-cells", 0x2);
+    plic_cells = g_new0(uint32_t, s->soc[socket].num_harts * 4);
 
-    qemu_fdt_add_subnode(fdt, "/cpus");
-    qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
+    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
+        plic_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandles[cpu]);
+        plic_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_EXT);
+        plic_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandles[cpu]);
+        plic_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
+    }
+
+    plic_phandles[socket] = (*phandle)++;
+    plic_addr = memmap[VIRT_PLIC].base + (memmap[VIRT_PLIC].size * socket);
+    plic_name = g_strdup_printf("/soc/plic@%lx", plic_addr);
+    qemu_fdt_add_subnode(mc->fdt, plic_name);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name,
+        "#address-cells", FDT_PLIC_ADDR_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name,
+        "#interrupt-cells", FDT_PLIC_INT_CELLS);
+    qemu_fdt_setprop_string(mc->fdt, plic_name, "compatible", "riscv,plic0");
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
+
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
+
+    qemu_fdt_add_subnode(mc->fdt, "/cpus");
+    qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
                           RISCV_ACLINT_TIMEBASE_FREQ);
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
-        qemu_fdt_setprop_string(fdt, clint_name, "compatible", "riscv,clint0");
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
-        qemu_fdt_setprop_string(fdt, plic_name, "compatible", "riscv,plic0");
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
@@ -387,63 +434,93 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
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
         const char compat[] = "sifive,test1\0sifive,test0\0syscon";
-        qemu_fdt_setprop(fdt, name, "compatible", compat, sizeof(compat));
+        qemu_fdt_setprop(mc->fdt, name, "compatible", compat, sizeof(compat));
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
@@ -453,10 +530,59 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
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


