Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcmjS-0003Wx-5m
	for mharc-qemu-riscv@gnu.org; Wed, 11 Nov 2020 04:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=5773f578b=Anup.Patel@wdc.com>)
 id 1kcmjQ-0003UP-J4; Wed, 11 Nov 2020 04:48:00 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:10547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=5773f578b=Anup.Patel@wdc.com>)
 id 1kcmjN-0006yX-7m; Wed, 11 Nov 2020 04:47:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605088089; x=1636624089;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Bl82yiGoh4cJxKw70zywCiA8+o26/lmrGOyp7z4w9f0=;
 b=qwdQyMj2J6hv9o3BctQXOEmNlgzfYXstwQ/RaNrl0v52RJXmdhSmYqAa
 N/tFrb6je+YS45XFOtUXllRswGkzErQhqJOnnBpPSiluPyO4JHCQtGSkq
 bAG/wQOJeT8fJ5SHmO/I795+XUvEDUzZjKyiOlvTLrbHWho10cVlrYKjX
 shfc7NWYdsZ/8nAtZWnDaotLhUmoguncA9dpe9vi+k+Uqg1uQmISb9zHy
 ohkFZHLMt/Nwcenv6cFMSZofjFJcYy4RAVU5eAKWY+Z67KrIy8XM6cx30
 l+zhRnWGRMYTxhGljEeEpUjZyDPvGYLNPCG4ZfWkxaHiW9vFe3FcGrWxl A==;
IronPort-SDR: kP+5QrEK5NDCmUk6Dnx0Z3HViRN58eBwqsTNqYe2VEM8UZRy4xcHZVEDsz42J85LqGk2MEPwNP
 oHOKjMlVgQJK7148mu3g7BK0vBH3CO2Aqr2xBrJ3E++XF1R6yllmE8TAkuBANR3flYlXuEgP+/
 pRWfsDkRYDyUPAjluHmkrBUS7ccbEdTZzkMh23nEUrTyKp4U0Bd7jRGF28hgbz2rnKI/Qc5/Tk
 6q+zY9yT5f2lRKCFFg2zoznrf7XQHxaPm9k1FVcN2huU1PAyaotFBg+YrObxwMgPQKogpkwdgS
 JOk=
X-IronPort-AV: E=Sophos;i="5.77,469,1596470400"; d="scan'208";a="255934321"
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2020 17:48:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+sVytAmtu9o5kafHn8s+sKTkJwhjK9EEH5wZ9dvRnKz16FWmbeqMNIJqSKd9eivtD8DgXlntdy1qMZelFWHJchYJnfPQwrw0vYObNriP0cOGMgZEIlqM+wM6Ee24TS7l7oelFU3f5Cqnr0qg5brrqohSGbSM6ps/ASYEJJSfjNg7LgcVMTYGKwMSV1N2w0Ci33xJl8QwY9dJuVAN7wvqLA503T5B+IcY38++BSaXJBMC3ui3Kr3jsE+9cWxB+5gqaFy4u99OyDzC/MZqbhAqSF1/RsYIEeU6VLRfhDRQDFgD1bYq+aSUsH4vUqzb/Tr5e+gyxDoDpxnEUqIkyRcgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLIEbXu/BhTPfdkVfv1ll5refoWIfG0aptUVT4Cp3MI=;
 b=D4X5KX3iZM17WPIlc2HA1jS7fMXh0RxjVA7fFx5OYMICojTBCN1w9lBJX0O9gxQ8cqT8hKkEzil2A5btKD0Vz+MlguFGAG87DnIr74omqCXLX7Nh5ny5Ia6IyUXsomGf6TPCC5vI7FAJpoAs39zbuWbScH7CtrInkJ+UPexFMMvPsrEednhIHfSROdkvte7waI8AUAf0xuhMR/zdXTRD/fauUxwH1/1lbdEEj+dOpwRDQpbMysCIrUGwqr0p5aRtXHorU+dYtN4CCHwXEYR/gSyawRoFEB2gLgeKnv3q+FmT+GmoUWy5whYKknMMlKDRxeOBM1/JJXROu9kUGD5Hmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLIEbXu/BhTPfdkVfv1ll5refoWIfG0aptUVT4Cp3MI=;
 b=DFhE9PruHSfG/+ceWjCOeiScnR0ahVK9mXKANdci+GC3O2kxIwxTRwzcRA6uSY01RA+Kj3x0qPXF7WhL4ZTDraR56fNvnzwdH6Vu229wST7086bkLzqqnlDXzasNDPfOf2UVvcbi9OsQEigLEtys8II/0O5rQz5P4tjCjGYeqn8=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB4811.namprd04.prod.outlook.com (2603:10b6:5:1f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 11 Nov
 2020 09:47:52 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::d035:e2c6:c11:51dd]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::d035:e2c6:c11:51dd%6]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 09:47:51 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH] hw/riscv: sifive_u: Add UART1 DT node in the generated DTB
Date: Wed, 11 Nov 2020 15:17:25 +0530
Message-Id: <20201111094725.3768755-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [122.167.198.253]
X-ClientProxiedBy: MAXPR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::18) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.167.198.253) by
 MAXPR01CA0100.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Wed, 11 Nov 2020 09:47:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8dea7fd7-ec3e-4440-22bd-08d88626daa2
X-MS-TrafficTypeDiagnostic: DM6PR04MB4811:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB4811397A106A89E05FC221D48DE80@DM6PR04MB4811.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6r33roaTHjaVxdzx98QRTaXgIwYmVwa8a7GAPVT//eMsnBf/Ygfxuggw5yGN9mlAyMKj60HQLNqBQxsmWDke2ln6H2wIUQ5LADdamAqOoi8L749y5m1HS3YWxiQ7q+RpyS5uQneQTfreRwpHrTCZYHtS04QORDqRzIIwUGt0sx6quTKRd2YdX766aFBUN3EDY1Wuu5K1qz/SQZQv5wiLOvK1JTBds/eRza6asKivJ4JBhOGMZMZFOWsN53sro4ENpymzIBEyfYpJzvwMy/Td8vLqScsky3cCzjLnXet3R3mItIjqL0EUa5XC3R5WSK5LEIElIFbNWSQIoozTnpcoLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(83380400001)(8936002)(5660300002)(2616005)(956004)(8676002)(186003)(16526019)(1076003)(52116002)(7696005)(36756003)(66556008)(66476007)(66946007)(26005)(8886007)(55016002)(44832011)(86362001)(478600001)(54906003)(110136005)(2906002)(4326008)(6666004)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: +a/NKawt5c13t4Wi5XrRKX6922ldHX/qhqTJ8pezyVBc2OEXqq3WlHKrIJxfm+o6TKEk+d4WkqQzQ6mdRFW+JpKg5WE24aRs5aRLPm9rXSLVcBE4bt3HMEr0XLrrZctqJO1bliBBVLiX3fk0+7IDB0Q7AuD2LagOsZksXOte39eWUGTDlCYBCFUb+0WKgaH/W9qMzx5QXYTVj/CpmaPJzdNsKFjgOeFpEclpehEZVa5ZBvhyFmxc2cZdUUyQ6rPnK67w2kNDLSgLRTbo6qEscs48X2ms7AGq2T/99pD8cTHw9O6jgKMG46CJs123jbriuNZr4laN3kghk0LBGzkB5sEsdABuR/nI7ug+rngHIFk0nbje2GJJWgfK/tdHu/MlaauNnXij6nsX7vnn8I4yBmcTtwqkQjn+BmGcMFEvCmVfePtewYPTDKlmlaUlrx4Q3qyPmEfD0njOG6xQUi+JdXCQ6kxW0puGI0x2y3NJ/XBosyXAJiZd/2fjr50Rcxqzs88KJahpWmhsUFNqdysZd/UKQI4s6+r113wkg1xUyAv4ZXtCntwJe2tQJIi7fjeZIGEo3un1DE4BdZFSyeA21n9O0kepU2DPw+LQfx+vwz9nxTyG+t7XS8ciI+YIJUkIs5WodBuUN/j1v2LbkpVLJg==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dea7fd7-ec3e-4440-22bd-08d88626daa2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 09:47:51.4199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zidE5Wz/Tga2p8R+SmRzqXXW/P/94agwLoqMFvmZX1qu2rVZ50Qvy8JY0PybX/1brVUjOlYSLDHjNTJRiGKPvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4811
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=5773f578b=Anup.Patel@wdc.com; helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 04:47:54
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 11 Nov 2020 09:48:00 -0000

The sifive_u machine emulates two UARTs but we have only UART0 DT
node in the generated DTB so this patch adds UART1 DT node in the
generated DTB.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/riscv/sifive_u.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 2f19a9cda2..146944a293 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -387,6 +387,21 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "reg", 0x0);
     g_free(nodename);
 
+    nodename = g_strdup_printf("/soc/serial@%lx",
+        (long)memmap[SIFIVE_U_DEV_UART1].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,uart0");
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        0x0, memmap[SIFIVE_U_DEV_UART1].base,
+        0x0, memmap[SIFIVE_U_DEV_UART1].size);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+        prci_phandle, PRCI_CLK_TLCLK);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_UART1_IRQ);
+
+    qemu_fdt_setprop_string(fdt, "/aliases", "serial1", nodename);
+    g_free(nodename);
+
     nodename = g_strdup_printf("/soc/serial@%lx",
         (long)memmap[SIFIVE_U_DEV_UART0].base);
     qemu_fdt_add_subnode(fdt, nodename);
-- 
2.25.1


