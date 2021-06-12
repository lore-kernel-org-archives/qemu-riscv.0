Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ls6A0-0002xN-Dl
	for mharc-qemu-riscv@gnu.org; Sat, 12 Jun 2021 12:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=790f0be0c=Anup.Patel@wdc.com>)
 id 1ls69v-0002qo-I0; Sat, 12 Jun 2021 12:06:55 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:45085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=790f0be0c=Anup.Patel@wdc.com>)
 id 1ls69r-0002MX-TN; Sat, 12 Jun 2021 12:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623514011; x=1655050011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Km0TJF5ePaFDuyq5wpGJdAJ7cpeQazpNnOHVM/ZwHYQ=;
 b=Vf7zkUVHS4vA9RUHwTvpP+gdYGS14IDOK1rglWBvjFzFeq1NqDfFnlnt
 iRJbsPuwl5/LUh4gmCyCXIZwFiApzfjnxCZjP/JbTysKNraMzYv3JYsCv
 BRqbPd18evzbN7LOroVdlma5gIIdRyM/v7RhpFKlEIDBTHRT6vCektbxz
 7OE01SvNEaxRmeDLu6gudSNwxSubeMNiF4yOBN4tvF2SZnLmo0UUW1bEp
 4RmTX/FI/VO8a59VpB9CHnkIgqxZS8XlfnES9S1TzuT6IUCA0Qt1pkcVF
 ezf7wiG2XjiuuMlvxdx6OFYHqPZnOOCHIYUEplLEnSwMaaD+cJpko201S w==;
IronPort-SDR: Cl8wIyf8wpciel3pyi4zC0pCSOUCpW41ismuhzC4cbpqy8MjgDOp/ZC7pTYhHBxbREOScnPe0Z
 kkC9YgewDWVdEs5dOPcnzai2Vk5A4xF2J/MdFo+8mfW2wdCFojmijpD50r0Beevghder2pT4Fg
 6CjtYsGhGdsyi6n+lYuNKc2BTjJxGc8SpwM+/FW1lw+QQLSy3pasvikyN8/eedRT7w7Q9bEFZn
 WCEAshbShEy/Mow+Y6snarz6uQrE61lgV1BxOQJ+xEWiesurjHPf3GVUiuBPCJhTs2cPzQ0u1W
 4AI=
X-IronPort-AV: E=Sophos;i="5.83,268,1616428800"; d="scan'208";a="171704751"
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jun 2021 00:06:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6UupR73u3Kz4U6PcKNEqRaBeAKnihMd6kG4OGaxhrH4IlnF0mcVRPHqdVcee+e2iO2pUG+GcXPiZ8Zyk/AZmhwvzr6Lz45fJ8hwgFpfEk+pHETi/+fwdC8uPnRO/xqbne7n0ygSGHp+VLNQySXEcG5eIzOSoQ8OuZr6R8/WO3mHuBiQ3QmJORoKEZo0L9it3Lf7nMhPy1b05xHojb/jcn74/QrmtoGiSk5IsASp6FUuGOdfY3R0pxjCA+shsx49WFUi089WHL6Ph1+MRQRLm3rrTioMv2uTvWk1yxKZzpRXvHmfGF8nWDKWpcT06fUTxdbkMm6KxmWqjAw/PGqflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Veym8/rcxGTH4N9Fc9tGK6mFihc8jHnWlASllzf9fXM=;
 b=d1MdtnzTdLLWumev6oMLOjmfJOYG0An4o54QPf2vMIkKYB4K78j27MEVir8Hq6gcApfBmtBg+XrpJGlisuN+INHoZzwcrWJI8SVKGzJrlS4OAXCYxnKYm8JxgwGmrc/6D/xYsiSN9oCrykn6jJ/akqut33XeYxNwc0QdQQK7rj1BT8+SogIbHdAqQEh9feaKVL1cz4QgGwLSXCWSF6i0dIRNaUL7CpVjGDMCvp2TNEO/YC/S0IU6FaP/p6PfQws5tICdi44EZVTWGp65gHcP3QaF3WPXVLcsBMuHQ46zglt0Xd9oKlkSVXvGcB+/r5/9dYHbNCOv1BojrcC9yM65TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Veym8/rcxGTH4N9Fc9tGK6mFihc8jHnWlASllzf9fXM=;
 b=pY9hvVaqLuvDAZBaqXqmR++Y2IOg1ntpYPhlb7yHSqZmXnd1JTVCpd5uZfvS6Bmq+4i65WglsaM1XCl6CtdE7aWvB0zBch4sJO3IDJ46VeJHgh1iUpsJxIc941XeU2Ijo1/wM6FO4f1wT910L5V+eguEe+XKqRKljJC2sRGQKJs=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7747.namprd04.prod.outlook.com (2603:10b6:5:35b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Sat, 12 Jun
 2021 16:06:48 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4219.025; Sat, 12 Jun 2021
 16:06:48 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v1 3/3] hw/riscv: virt: Add optional ACLINT support to virt
 machine
Date: Sat, 12 Jun 2021 21:36:15 +0530
Message-Id: <20210612160615.330768-4-anup.patel@wdc.com>
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
 15.20.4219.21 via Frontend Transport; Sat, 12 Jun 2021 16:06:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cf6a561-a365-464e-2123-08d92dbc14d9
X-MS-TrafficTypeDiagnostic: CO6PR04MB7747:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7747DC7B659E92994435A7EE8D339@CO6PR04MB7747.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:203;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jEkRdLrsHJWJ0rDJvqcT8gK/OPhgK3L4GjKTmlyNbcVfK9K5cWj1Ip8vWN8rOBkJ+BPg3F6Px4U6vE8hmRQyhHpSfF3+wSI3AgEdEiB9l8+Sf8o0/1a39MByhlI8wUc63yaWQwO8lUpzdp8FbLVU/hogZWmIMPBENR31cdTpf/CHUVDk4zE9qgFFCyhImUBckBdxNiuJT902567xuJObxO/enQyLNvah0lBc0YGst8hpWCmz7uKa+OcDD/l+nyykaYk6xR7JF/CwnbWMgH+OzsS6zkXd01OJ5Rex4jOGsfYma1GOfM4v4ZHXzcgbdy7vazgYWG+x2k7V1ZD/HP8f0jwl7EYYNCVlAqXAoMr2L5VLyPjhDrPT1E+9ekS4GskpMylLQKIq6+c6ylRT5ZY1RfYOEOBNdl4BXY6RzWEx0PMhlsAR5H1DwpqHFp/DUQb1rXH77dypW4Vz5YB3z4f6kqiAv94CFlHSLXDCxL3HKdGveYzqihvWw74yUqUxDTJi+FqxOI1Rqald909fXvxzTDdK4zn48dWJg8XFsdhaMNnHSzi6uHLzUgAO3uwyLBeQKtDziL8nD4Kjpd/1HAQwSTVi7koIrt2MRVP7oDHAjvGBevYjikP+rdkP/U2fT0E9HAXLWghHO/X6yTNQmDcMhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(54906003)(8936002)(8676002)(110136005)(4326008)(2616005)(44832011)(16526019)(186003)(66476007)(66556008)(66946007)(2906002)(956004)(316002)(38350700002)(86362001)(38100700002)(55016002)(26005)(7696005)(8886007)(36756003)(52116002)(6666004)(83380400001)(1076003)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jt+4lc8sgWG8P7tgXidilqrIJSW23QddcoqlYNRbmNNOkwQ7Y9GQkGp3qXNJ?=
 =?us-ascii?Q?3zSIBsIKV7VPLadtMeRIzW7UBmDV7S5Zc+jxXG2imjuL9vjMHJ9+5Lhp64mq?=
 =?us-ascii?Q?SrlrfpM2hoh5SUsnd9C1axmyhtPXOUcxYOxvN1CFZNug0tu4he/4BOtUlp4z?=
 =?us-ascii?Q?pHM/0Cqu2z1Ob7yjO/VBDwvUbeHPv4SxHDpPakeiQSsDPjgBjXC1a47IJMNx?=
 =?us-ascii?Q?V6Q9oOeX0xYWwR9V2UJr186u4FGfzs9ZpmWXOpgmxRfQ2QIfcRohE0mh380D?=
 =?us-ascii?Q?4Dfvan8bhQx7935rBLGZSzCthWzkOMS8hqsaYGsQt6wC80QG2WY3Yap7NeCZ?=
 =?us-ascii?Q?MHvi4c3tEmflzqYiCCMCya4XTTNuDbxfeYPNimAn4FygzsgK+0lE0likfiqw?=
 =?us-ascii?Q?s2Z/60Ok71IKrvO6xMS/fRY+pR7eSoXSsCrjSF0XNEyBD3SXXco5YmfKGcKa?=
 =?us-ascii?Q?3mdP22XN873BGrqLPSLYngGoU7vNKgtr+uaWaoOxFXeckVradfLT/V1B2fyc?=
 =?us-ascii?Q?e94sWlQrPLlhDADcgUsbvbSDalhrDmIkXxHIPUUYjpw5nu+N6MKJHVrpxf9N?=
 =?us-ascii?Q?Gej92qPxlkFJhsLst/cDWQ5zGteqVfUnzpy9Vyheu3PGNV5IhG9JY/zN9K39?=
 =?us-ascii?Q?P4A2/NbFPeCfIq4DxkyeDKkbfMBJjfbPPZGRh4D+Y5WgYMuEXqvSljZsTIHi?=
 =?us-ascii?Q?+9PCeHV7IqxjoGzR7B019TU9ZRA1+XZpQ5nWrX7af7CV9lT6RWdfmHK6uWhG?=
 =?us-ascii?Q?FlmkTm4R1nz6OQVHmyU3RjwieLwPAkEaABjn6gDhwAzSNa5jH9LNIdUyGphJ?=
 =?us-ascii?Q?QGyjnq0u3xNVd8Iq6hQ/ktGMHV1KErnSmZEYRH65MwF+Se1eo1soznSY4h/W?=
 =?us-ascii?Q?YHztBt3m93mfGkx3bBbOmO2cPGX6gXqsmi73gbhlUCkP25qrw26/D090Pg+M?=
 =?us-ascii?Q?EiTtBcZr66ii+EQWNwCYdSHp4MxzIOXd+xKV4RbTM2O+iYxYqFolJrrObBsH?=
 =?us-ascii?Q?K2uZx2v81nDy8x+v6G0XROw84qSLKImbp8mvzHr6Lh5AT5jeTdO8Lsb60Ale?=
 =?us-ascii?Q?KhVeujvfxKH5dwSYb2PBvUQS2ZYcDclEZ21J1moNAtp+nu2EpDtSNTXzpFqY?=
 =?us-ascii?Q?VlVJUnN623XWScxB5sCZ80pEwzZPCNCjW1ue2BbWIa90zMC8NLPF461Bcc7N?=
 =?us-ascii?Q?rT3di8M4neRf1/spia6+x8zv3IAv6A6MEiuZzcIvQYtnmnclV8ZrRp0OY6gX?=
 =?us-ascii?Q?SoZXhTan1CiUBPWr1cCC9fCxM6IbPMYNw7RrOZimS2qiPmlpTWQp9yCow6iS?=
 =?us-ascii?Q?nPuNU+njRAVtETx+4yybeMFh?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf6a561-a365-464e-2123-08d92dbc14d9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2021 16:06:48.0075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saUpleVjCk5dM7VQvZ5+udUB2bs87gf0vtdW7V8Ua4TKMl3HkONJzQalwEATb6TKsbgKCxf3ua0Rj/s3fqI1zg==
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
X-List-Received-Date: Sat, 12 Jun 2021 16:06:55 -0000

We extend virt machine to emulate ACLINT devices only when "aclint=on"
parameter is passed along with machine name in QEMU command-line.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/riscv/virt.c         | 110 +++++++++++++++++++++++++++++++++++++++-
 include/hw/riscv/virt.h |   2 +
 2 files changed, 111 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 977d699753..a35f66af13 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -50,6 +50,7 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_TEST] =        {   0x100000,        0x1000 },
     [VIRT_RTC] =         {   0x101000,        0x1000 },
     [VIRT_CLINT] =       {  0x2000000,       0x10000 },
+    [VIRT_ACLINT_SSWI] = {  0x2F00000,        0x4000 },
     [VIRT_PCIE_PIO] =    {  0x3000000,       0x10000 },
     [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
     [VIRT_UART0] =       { 0x10000000,         0x100 },
@@ -279,6 +280,78 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
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
+        0x0, addr, 0x0, memmap[VIRT_CLINT].size - RISCV_ACLINT_SWI_SIZE);
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
@@ -352,7 +425,11 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
 
         create_fdt_socket_memory(s, memmap, socket);
 
-        create_fdt_socket_clint(s, memmap, socket, intc_phandles);
+        if (s->have_aclint) {
+            create_fdt_socket_aclint(s, memmap, socket, intc_phandles);
+        } else {
+            create_fdt_socket_clint(s, memmap, socket, intc_phandles);
+        }
 
         create_fdt_socket_plic(s, memmap, socket, phandle,
             intc_phandles, xplic_phandles);
@@ -722,6 +799,15 @@ static void virt_machine_init(MachineState *machine)
             RISCV_ACLINT_MTIMER_SIZE, base_hartid, hart_count,
             RISCV_ACLINT_TIMEBASE_FREQ, true);
 
+        /* Per-socket ACLINT SSWI */
+        if (s->have_aclint) {
+            riscv_aclint_swi_create(
+                memmap[VIRT_ACLINT_SSWI].base +
+                    i * memmap[VIRT_ACLINT_SSWI].size,
+                memmap[VIRT_ACLINT_SSWI].size,
+                base_hartid, hart_count, true);
+        }
+
         /* Per-socket PLIC hart topology configuration string */
         plic_hart_config_len =
             (strlen(VIRT_PLIC_HART_CONFIG) + 1) * hart_count;
@@ -898,6 +984,22 @@ static void virt_machine_instance_init(Object *obj)
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
@@ -913,6 +1015,12 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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


