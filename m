Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtsr-00079N-Co
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:21:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsp-00075j-72; Fri, 10 Dec 2021 23:21:15 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:26544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsn-0001pJ-CC; Fri, 10 Dec 2021 23:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196472; x=1670732472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pPIEE8XbGesfEk2CBjMqcYQUkZKDZfL00tdxQ0VJy04=;
 b=rOz2H6JrgRyTmVDdUusMIZmFS1+hCkjM40oJFmiHLhEeuzrabhQ62Teo
 eIHWDtb3nWT78Wn8hSij0gZUVX/pOpG8xrht3aluYaM9tZeneUW2sB+Xm
 eIkmgy/bw1NewOBTJa4H0t3Q9Asfyc0+nayQygyZjOU1WWND1D+ijMG1n
 tIl9b4kgJth8hfMpB/j7e+XzH8vYIAbBNvouS23+3Hnb6Gx5L9uKyZ9tZ
 1udTFZAgzGAarNMuXUpUYZ3N1drgD+S3zfO/aUzrYQ6jnIK+kxK3WBsRa
 bWd8S2CFG/LWImNOJ7uJploAfk/eY1elilHfICVweVPxTBUKKWjW0z1zD g==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="187989981"
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:21:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwKfa4cUkDUaTlzRhbe5vlZ2OWDos8I+oP1hO00TdE1i1jXY2M5teIe9Y4QzvgYzFrZgV9YjLs4d2Vf1JO1U3TmS6L3em5PqfZwSwacRRS2rn9qNFo393dtMXQZv7Fd7jSaGbcXDKpiNyrCeFNjHHJGoLfLtsDMbh1VAwky6qhI8NrRV1MsIotuUO9nvM+g8lvog1HrJWThJB4n1ZEf9UoFd4NMTrELnp3ldSPXVM/LteawPvm80cJS+JHmFUXGyJFVVcJ5bGyhQHWJMTokqSlYTB51x55mnPSQaeYqQRNhWk2E57T3JX4TDdOQ8yNkDzxvAIzqmtzwbu4/wwGs+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blKRCzYf4VqrMj6ZYziZUuretpdWAdzPvDSvdjdV3pA=;
 b=S0e722Xx7tk0LHTCoguyGzdk0y39rIuHy4Q8RLOfjkgu7nGh1Stn7PnilECQg985ONS1x0+UgKrI9PQ1+4XQ1M0dvvJaAriXzUV32ZF76ETtciU2TE65MQEMz7yEEHXOmNNmRYYWrzGJyLGbso2GYgRczkxw8SaKgTR/RhxfwU8OJNyYHv3v2tU33Q+tPEMMmBMqZnOPjxDdR+jo3NnT3z7wILz2z4Kkh35h7XYDX+kGqujIEO9eaxxJPgoiNo0hXN8jqclDrZGxO8IA7IIIkjVnOrUHXMIh+C2tXivXBqksHDu6OesAyGdcmdAhRtQkVPSebRXeKoDAQPhIxS+WZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blKRCzYf4VqrMj6ZYziZUuretpdWAdzPvDSvdjdV3pA=;
 b=tASBBaRfOVG5vpaiPYWnTHZdbg1n+j91S48EUCGqaMfZR1ca2vTXcgqyxp1oqkySymxyrxTQhDxIk8SKTaPaKC+NkuDmaqcn4aIgUZ6meahX41TS94YcOAm7CZBc1KqeDHJ/yA2gdOEFAj+yiNEqxO2jzVirsHPeRbhsGDVDPo0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:21:10 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:21:10 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v5 23/23] hw/riscv: virt: Increase maximum number of allowed
 CPUs
Date: Sat, 11 Dec 2021 09:49:17 +0530
Message-Id: <20211211041917.135345-24-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211041917.135345-1-anup.patel@wdc.com>
References: <20211211041917.135345-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7b6fb0e-3852-4cda-18f5-08d9bc5da898
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB826882C3AC1A3FD77CFF258B8D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tRkgjvqTc52K/hBKtUXaIoj0ev0xmh6j5nrqvfC1tHR2goMGZyK0TgobQ5ZtwvTsHnJhSdnjni2579JM7Aq0n6QiUgJy2ZA00K36UNn5g/6ldpBlx6bqE0pcCO3IgmJBrCuTXn1sd7YUZP3JfK4+1F5X5Clri/AZmgTcStFMXRb34pfDe6m/sBLpVIhxgvvXT+ultmCDFOrMWf7F4fhojuMsq+vhNWGeVO92beKbNb2gfT5OaCgA2+O5YHmqHE9J5EqSiH+pYhm6Zo2P3BslDE6mcDShv7vZW4qBX1O0rAlxK1RxPIKVaO/2FNLIJ8AIpIlSwIicX+aR9hkYvlW+jJlxJJ9XXhmFkrksF5Zc3OBNV6lEqgFAca6XsYYo3kYfdN8iyVE1MFV5FxvOH9kzt7X0iY0RfB+m0hPlyLt4SCqiaIbNAqTCewJ/esysSyzDc0ZU6Yke8hw+PY9bZBL6vkw9P9TLuENhxemtVedRcVtfRYAqIbB8T5Qgj27FE4cu/HexNZ9F+AfRZ/SbHuI55V5qX23cV2Zpz1fQGyBCEpEOJuMKcb5WxnV+4zhaUl6gFaQ095eZdSrSBaXudd+0ojQekHv+MV9tWgkyBZ48JJDwCvRrHwSvH+8HUkfWMVDHB7gIS7posld4ZrpwbSG/0x11XXVQyHiut6RszU/HiHXMObzrezdkL788vFkkpJ9vi0y0MSP8d0OQ+YWF7ahQdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IOcVEefp44K0UXQTl8XHwRjjOg7/s/8lvS8/FFU5Rwmkcw9pjQQwWpkeTKIt?=
 =?us-ascii?Q?aRqmXUSjLyBZafnInDdtaiDl4JTMnL6ABRtxXqL8AEPVDtkmvtOrFd7H7djE?=
 =?us-ascii?Q?AEMPdtV2TXqzkDvGf9x/sp49et1j4rbsPfyGdmqqv+sAM0zQFWTkX4exPp7B?=
 =?us-ascii?Q?EYPr4iNbtqsfQK/uK8LjlYCdWk/sGSSKVT/7IWxafLZrt3d7+hf3V89WUW58?=
 =?us-ascii?Q?wv+T/dBQMj1lfWUUoDDtYepmeQ9j3UQ1OhJ8Kv2fbfiSPezGlI8JG33ybSy/?=
 =?us-ascii?Q?ISzt3RQa+mTrQB5s+m4WHxDUR6odJB3k/VgeMCJOG5xvfdvgr640dxyxdWEL?=
 =?us-ascii?Q?7KpnQtipklPht4KKxJMpdghgGNvgvWVma1zPXS17hMz2LH15udWhsiXCP+eI?=
 =?us-ascii?Q?HS6316t5v6fOf66F7CYPMkWZS0Eywl6JVjSlkOKhEENB6nJOlYQmqr+1aN6I?=
 =?us-ascii?Q?Vx4M7d6SbogG0CdSvAt2h2PDgqekyLS73HBVOe945/9rBL7FdJEKvkQejF0W?=
 =?us-ascii?Q?R81tj7WIXR3Cm6D/gkCsu0Kw3DOKdos4IuqMtqzITjptooG7cWtuPaFv/be2?=
 =?us-ascii?Q?lE/bFwraEA4hTzkvPpQsefnOoDMlWhbqssILBuNIdHcRI+CqjPqBhjzsL0Xf?=
 =?us-ascii?Q?nCwRAAVtC8tSrWEz/7yrvd2/vtfTVI37oeZDLUNuBk9UxgnwxhFIRNuanes8?=
 =?us-ascii?Q?FOpVa9PVlv8CZmkA53GA57A9VqhW4kJpdrEbq8lyKg3HHJ3f5noPG7XrY5+z?=
 =?us-ascii?Q?V8lZhPw8xhfkb7+Hq85E9i12BHytrSaNmji5jxm31KB61ZLB+MuT+9lqE455?=
 =?us-ascii?Q?ervehypfbZlwt6D1SjnSJzhEBj9b9xVDXSRoQaC1jmdoJQ6FV1l7ulvTNk9H?=
 =?us-ascii?Q?vszB6SAaz+4bLemo2a7dQaAYwGKXgKKXMoNvp3i+Zov1zCup472l4MrbbfXN?=
 =?us-ascii?Q?i1YvQG1ktHzevW4o5ztW6NA+mVevttgIyKqBVaALZIkgPIGUOsIMtirVupIT?=
 =?us-ascii?Q?eCis84sMHpJXeMRratUr8YxbuehIKYxqxEZG5XXiBuISrMxkqmUw5c6bV9Sh?=
 =?us-ascii?Q?+eLzaCh/5fD2EPGURiFyQL6kDwSDztnFXbfcEHvLYBpP0QV6F2LSPgBU3Ryb?=
 =?us-ascii?Q?325/HTNSIZHbOSFX8XuBLFXvwBiqNly9xJrnit3L+vJA1TwBdstNuL7DPnDG?=
 =?us-ascii?Q?jMH8y+dJ1ckv4owcHDixWEF/dY9ynzG0o7fh7SRNcp3cPq4sFJTheeNzFNtk?=
 =?us-ascii?Q?Sh+nJZhfMC8+ueRM+Hmh9tRYwuv9ID7teO4hThZnWKNXBlNdEiJmwFpdpJfp?=
 =?us-ascii?Q?OLgZ6Lq/RzfTDLZ7XIIDuHDZjBECOaTNaRi8cSsM2RxjplCEtPqFLhfqgAAG?=
 =?us-ascii?Q?g9OkzK0/ArTEaMU5ZohNLIhkoz35Klxb/8rNh21veNs1o86JUO0uoKJb4L9W?=
 =?us-ascii?Q?VBYegITF5XpVRwb45nXVRFLDS+iElhnVek0cnm+NNtUR39fH08uB9BHbJLaU?=
 =?us-ascii?Q?/dqkjUQB44Rckw79N5Ry4UxOTN+FE8RkgihNZBZNalGjcicREj9W7ho5xwub?=
 =?us-ascii?Q?5fZ4cMdDbNGaMy0eF8Cn0eGwznqqIzy2Tra6i6+8MUvvvqI/ZMuMnAKuPjt2?=
 =?us-ascii?Q?BANXnzoumCaeAdY+psLJZMg=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b6fb0e-3852-4cda-18f5-08d9bc5da898
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:21:09.9437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8Mqmbp/vdto4PwH1Gtfia+go1z1c37rNpZNmpBnOMwZH2CIkOsMaUoUQeeStIkH3L5XxJIbEBalK5o/Ixjsqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8268
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Dec 2021 04:21:15 -0000

To facilitate software development of RISC-V systems with large number
of HARTs, we increase the maximum number of allowed CPUs to 512 (2^9).

We also add a detailed source level comments about limit defines which
impact the physical address space utilization.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/riscv/virt.c         | 10 ++++++++++
 include/hw/riscv/virt.h |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 74e9e333d1..68ab915525 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -44,6 +44,16 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
 
+/*
+ * The virt machine physical address space used by some of the devices
+ * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
+ * number of CPUs, and number of IMSIC guest files.
+ *
+ * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
+ * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
+ * of virt machine physical address space.
+ */
+
 #define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
 #if VIRT_IMSIC_GROUP_MAX_SIZE < \
     IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e12e8ddcae..62d8e9c6d0 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -24,7 +24,7 @@
 #include "hw/block/flash.h"
 #include "qom/object.h"
 
-#define VIRT_CPUS_MAX_BITS             3
+#define VIRT_CPUS_MAX_BITS             9
 #define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
 #define VIRT_SOCKETS_MAX_BITS          2
 #define VIRT_SOCKETS_MAX               (1 << VIRT_SOCKETS_MAX_BITS)
-- 
2.25.1


