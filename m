Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtsp-00075s-L3
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:21:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsk-0006zM-Vb; Fri, 10 Dec 2021 23:21:11 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:26511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsj-0001mA-Aw; Fri, 10 Dec 2021 23:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196468; x=1670732468;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HTYIOb6C2qHs7esQRqgXBd67VP3nWWSgi2maOSH4iPI=;
 b=Ps1GraCMibUI+rpth7sh03pegvreUv2bvYwxYfpyXmgNnkI76DO5TE3I
 VcgIR8hgGRH3wV2WBcolfoExeqw3qbsDPzZIHmwnkewJx6nrRHYa2V79S
 NrFqXniMNZPVr1EFeWWk0O7vubxrG3XfLPFoRKX0NKhxVWZydUoOPiFqw
 EDABxLtML/pUfsK+Dc/sAK8UtrPWMpbF+O+RVIZxt6OXnaL2+l68pdnAu
 UcnxJ/ZD2fVryAbmNJme1iYMXqojHuaZLtuhYTlja0n66P6OwcoVEmGIz
 /E1ivXhyimI5uMlwy+XHCNhTQ1/auJYxdONZcLU7Z53WujYMWihpuluwm A==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="187989973"
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:21:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EH+eslENPtmVcg6J0zgUnmEiJTVdrgpv8PPCYWaRju5pXHW8ADunN+fkp2saq3F21tVrXmGRh5bmz6aIwQRlBiyOJXB5tjLg34KmNByVN5XQf9GnMJRRKfymvAVdjVAN6uVrcE9fMyP5eeIC5rmKKKnp2lEMRyExe9Hr8gT9w4tU1UZ17kCSntaPM8+pds3NmgUpvEidExPoCXVPU/fuijoXtwPIaS0uvsSTUxxC6Ok1+wgL8t8hXVIk5mjRnQSAZSwo9RW90dEX39HwTuEdUrspjoKO68EOZLD2QOuZCTyuPCaTwwQVaSCJkXmyaIQs49QPtog0BRxTu1X00T6vcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsjCn+PCJ59S3KqnNiw/JxRHOlAsA8UYUUIigy2RXOA=;
 b=fPB0ekPnr8SLzg7QYUgbgDe2mDgepgC3xv7V5/GSERTBLHYh5KIlxYKC6GRl9ju6v0Itaa2HDY8ThoYeO2MAUKMdAyAHygPBNZtmtu1Fe6e6KrQ7CxafIBOrz9+pnJ4koYJV2dyjS6oejajI0Evz0POzuGqg9gzoD+vsX1XZRnRrVk5Gikygv8pID2to7E4LSpc2RyywVG0LhVJwfPvR7Uk5vNd59v6oDvyQ9++UuQ1drdR/Z6XOjjMZBn9nSSBqv9Mv19f5qKP78kkmY8HEuwItAfGBQgh486/QxPaBGK3sNzkMtDUyvEisd0LORYn09n5TEVF3vpd5uugElW/xVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsjCn+PCJ59S3KqnNiw/JxRHOlAsA8UYUUIigy2RXOA=;
 b=juNVbmK8l2DRIjdkzk4Kij/8GMmNZGsqCcQYDk94JoIMKy3gub+GHgWAdEw3BriygcgZdQ0UgeUFLoWUgL3xXoxq1pVuSAJKiBwYm5TXM7yI7iny7oTsYuqJedFFpvmhuaoWLsX1nw0lR3rJP0NaVpi+noAsUwCYfQDc7BX+QfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:21:06 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:21:06 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 22/23] docs/system: riscv: Document AIA options for virt
 machine
Date: Sat, 11 Dec 2021 09:49:16 +0530
Message-Id: <20211211041917.135345-23-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: caa7c4eb-fab9-4a67-213e-08d9bc5da68b
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB826875FC53932A1EE3AA62EF8D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KYiQAApquuh4smn/Gmfrk9s3ES4szfWBltWYtHJks70q9P6NNSMxi8LjvD01xj8afLVjyO4/BbMvx3Hp1prHpfNWNGU6X1vub9ncLMPKab3NW3W+p0dz+RLV24cUdY8LE+I6hIHqU9IixeGnEWIhkt0UuxpBQMuvDxig7wSn6myp6rhumqPAWnJbTLUGtfDhVJJFNSMP/xb6Gj1BqN0U6ADDywq8sFDu1rJkcc+MwLu8pMJhISdiqAq3EV/+TShzffJgvuwiNiaP4AZyoTQn/TzwZ4fDSx6BYoa08CXQ71EwOyEB7y2f1ckfYxyvqZLv/F4CQirSjkYc0LW80Zs7522KVDCL/RgWvGHDIdloG1CpJmWL6pr+oyiwSzEFBsgXRbXyU7TASa+L28rJcqGdOnl9h9TiQxXA2avKR+Vr6jQSWbVk9fwj840gYlLn6VP2zWDQtP4xuKCAJPcKfrwrFYM83dB1JGz3jmrWql5HXVEdzWblHYRvKyHz2skgc1ZkG0ty8Rd4nJXj0jlOFbHE85yt7SaTdryqqklKgyCVVStLxhTi2tOFvPIKZHC4wP/zNbISfjg5/T2IhKODexaYd5mBzErYmA0AAuip31yYjog28SLzYcPfcgbP0pWsxe5QK7RBfy2SPxOnaHmO7NBdwlxBjCLwMQz1zGG2HTooy3CK12lIVzhXDEasI2xDqkakTPcIneSC9d1OyT51zSengg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S/IBWa69OBZqjjfwCr8pYKBjC17dR/ixldkrncSJAxLfl/mghkB+w+pfvlqI?=
 =?us-ascii?Q?LYPPGXOEWRkgOgJVT+ZAkYRsw1eBZtxY8SrOt4rqo2j7ynm+zznSnyl2hj24?=
 =?us-ascii?Q?nlEiipunz3A2+vy9yn37lBWPDLD/kLN2H5nz9lZ7bVD/EXUTwUdbUTDlfwF1?=
 =?us-ascii?Q?ptFavxTQ+JxSvVxfw+vNRPSt2pxvZuNuioXF8HcOWu3K4i8gi0oO78VMO6YZ?=
 =?us-ascii?Q?E5Hfj6q15CRSSg8S/fFtqx2rX3ATeu6SlhRBDdFYKQxFeBUyxnXEJay2pjGx?=
 =?us-ascii?Q?hVmGN+vMZtbF7xUAXuMve30Okk5IenaKBg3uhOSjUuWQa0exL82KPjF4PbSK?=
 =?us-ascii?Q?0ROkiahHdndL82WuIy0Y8ClNkQ/W1f2hWNCn5Jll6JNhweMI/bcuWdGhtlOh?=
 =?us-ascii?Q?Fx10iiSxND7gtS3ZqCYNtqbBfnhlmFF6oWaVsUYO3sh1nlnQDP4E9nBbvDaZ?=
 =?us-ascii?Q?PYnaXSf6wML8B8x7UV4vEb4MknHqmJQbP+kREm/u9S0+3yqIgcYS6b3bFGNV?=
 =?us-ascii?Q?MNHsSS1C54vIeveqkoRitu9Ss2LCoJGSUPRbSs/bxhdeEg6XLn3G9GjhWb3j?=
 =?us-ascii?Q?HQWfVYRXjxpCquYQXQsz+LIrjE7MpPORdxC6Y5DJKGB+bG0jFVxCXETummXw?=
 =?us-ascii?Q?vUMkcJYXbpDA3bwIYj0dz10NRhRrQZKcUWdWw2cmr9ivU5hNxqgWpIYnj+pC?=
 =?us-ascii?Q?GuYutS/lxH0zcM9bv8iA/sLJf7qSrCHWgAVWn1VpPP8VRLROu0pr3WXCI5ZX?=
 =?us-ascii?Q?tq2zQ06P9+zqeoxmZaUTgVJi6L9fLOn1q7OYQ42JVavGMk5T5QTlevvjFa7J?=
 =?us-ascii?Q?XGJMJuq4S+HrIMZXkvuLBMPS5M9S/IK01d2wUc8rK08ApYoEDN4jkVUOXzkl?=
 =?us-ascii?Q?8G3VCmfbpCYhHhw7tdDcFkNixCX8o0JVoHYqft8EAPM1otfjUm9ANgprUX8d?=
 =?us-ascii?Q?uxyvYbA9A0m8frfuxs0TcD19Umz9FjdawCsKUhhd2eAj6ckUlND1VhJiZMHj?=
 =?us-ascii?Q?k4GEr2M+zf6lFwU2PXqWnLM2fHTGfP6/+nGDVGuo5ZgnbflSD2Qpxg0NebIK?=
 =?us-ascii?Q?Q/E/o5U4RMEcIB1grGRRbLH82K//xX46tC/pbQtEBeMSj7Xe74lIKhc44t7n?=
 =?us-ascii?Q?pnt+pFmtiOdiQuL6H0SxoDtDz9fQ12SrHLdOY0Dx4xKZ/18mikb1Bo6WwAVS?=
 =?us-ascii?Q?/pQIdThLoLmEvKWOKUztU8yfmqtzsteSKoTfzugXeNVhEvlkdQO1llycIZM3?=
 =?us-ascii?Q?M3AsTPaPB26m3TtX7kYhprYq8kPGnM8RCO4mxnvk6DI9AukKI+RwyLWmM+JP?=
 =?us-ascii?Q?iIHGw3rvWgiY2Z4/M63d8TWvJFbVoRT4o82sX9SRbxlQyWIJ5+80VJHh3c0h?=
 =?us-ascii?Q?20XgkrRnCvT9SM3TlNhGkfEhY0UCvj31aSCHN9DEbiTmwltVitIt6zzdlOfk?=
 =?us-ascii?Q?1pWTJM9zzYLfICKU7YKcpxiyRwio7E1fRxoNGrfwSukL4c888X/h2OtF3vh0?=
 =?us-ascii?Q?NWCxPBQl3VItWFxuDeSsm1QNQDGgSW9oE2Oi+wJPQdJPlQKfiP7Hx0rALzOC?=
 =?us-ascii?Q?gfw+tWJEkAaLVdNFNH0spuCh9G+Wi4kM5RyaA81mPV154oObZCrQu0q3kKhQ?=
 =?us-ascii?Q?SA6nQfCrI3YDokWvwvpzZCA=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa7c4eb-fab9-4a67-213e-08d9bc5da68b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:21:06.5032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaiVCLw14mLV6IUxRlYzPTUMrLrjRR4i08+CBMbruGdZP9kxDrBUiKq5oqj7Emhi5C3CNnxW7O5G4Y7A+OrL6Q==
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
X-List-Received-Date: Sat, 11 Dec 2021 04:21:12 -0000

We have two new machine options "aia" and "aia-guests" available
for the RISC-V virt machine so let's document these options.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/virt.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index fa016584bf..373645513a 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -63,6 +63,22 @@ The following machine-specific options are supported:
   When this option is "on", ACLINT devices will be emulated instead of
   SiFive CLINT. When not specified, this option is assumed to be "off".
 
+- aia=[none|aplic|aplic-imsic]
+
+  This option allows selecting interrupt controller defined by the AIA
+  (advanced interrupt architecture) specification. The "aia=aplic" selects
+  APLIC (advanced platform level interrupt controller) to handle wired
+  interrupts whereas the "aia=aplic-imsic" selects APLIC and IMSIC (incoming
+  message signaled interrupt controller) to handle both wired interrupts and
+  MSIs. When not specified, this option is assumed to be "none" which selects
+  SiFive PLIC to handle wired interrupts.
+
+- aia-guests=nnn
+
+  The number of per-HART VS-level AIA IMSIC pages to be emulated for a guest
+  having AIA IMSIC (i.e. "aia=aplic-imsic" selected). When not specified,
+  the default number of per-HART VS-level AIA IMSIC pages is 0.
+
 Running Linux kernel
 --------------------
 
-- 
2.25.1


