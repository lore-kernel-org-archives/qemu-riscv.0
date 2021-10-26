Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGBr-0003f0-2p
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBh-0003ZD-LD; Tue, 26 Oct 2021 02:43:59 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:53779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=9269cd5e3=Anup.Patel@wdc.com>)
 id 1mfGBd-0002p3-CD; Tue, 26 Oct 2021 02:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635230633; x=1666766633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EjStFy0Uux4hB3UssCPVRcOfhMK4l65TuN0t3V/k6aw=;
 b=o8637q5ZpAP16vpxPpslE0Qsi27cHubDUgixge+n29PCplo2xdorPe/t
 u3xekIdy7IzOIaOR4VSXMhDzGU8mHos5ZZ4eL3cHFR9nfDI+eij4PDdHV
 dEIFv7c+Ibnf/ysXJ0umXHtpKxyyTQU08lnW2cJatkr7o/PvTQ2YqSi57
 OFvHlqw95BNv8gxMWO7CE3TamxNTEgzn/kYHaJFqCFRX6RL7Wy570RK4J
 H+7CV7Olcfkfsl5Ky3vHmv/RQWgHcl4MsxEpx3ieptvqNSLqRzcN0Kb+D
 bvc2/ES1/fGh3GUnbHjgP6rSkL+xiKLO6D4bGf/TIcKCGQdIfuQgvSLim A==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="287722105"
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 14:43:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuznaVq2IF2hk+jaRT8WLJl7L8ohfIadxdx+M6mDZEXN5dahw/uciHz1xm7cUUXiCX7Fp13Kg6xWP48DwCkjBdHvlFjkEkrGII+AZ1FsYm4VAqiNyoDmgJzYTjhE4UxLmErppljPNGK7VA58+28QYvygw9yKyfgpH/MVelZYmrkNEo+MDGvFsrSQr8B4fvJX/xWdykAZCR3rxHolm4kIxoCg4PxGt5jDOLhnxqtQ/MPOVzQWmXJkYM+U9IqFm0k7pr1s0B2FO1t24GXtZwq4/i+8cjcHOA3eGvkEeSLHFHwRIEouuZHSFip1gS7YqexKbk72PJO+U80Ucb8M+/LCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2P+Ws87gYa9iglFTyQoBUGbeZ0MQP0XcyniCqROoYw=;
 b=KTeeXMZMfxQ6amyqeYzvGcM9suJoxqNolkzZYuO4EfiCkcgjWr6wgfcVH46JaZYaKvqUgDiGPjCW2R1CI3+10cGFqjhvUHs1Fqi5DyyrzX22M0lsW+AtUlhQsxZqZwga0iq/84npxL9Q6HMYD34u3j+9Llh7FS7tW/jZufEfVD1wqHWN+78JKk0Yz+LONy+e13G7s79yeXWgKgkUQRIzFo0Dq6GYKNFcODbNbwrZyI5D+gQze/M5WmmKkUx/c1POAWr3UiFFUooXylwoptXtFHHEYybZ6zvbb63rX6q5VabgWhafPKVbWChy2RZT2TlTUlC4yfn4cWDXX94JSF9VNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2P+Ws87gYa9iglFTyQoBUGbeZ0MQP0XcyniCqROoYw=;
 b=AyUVx4ojnK0YF0ThydlMCDkWLxNfrCpaGJBZU0ecVWscKx+0J+oP8BdTR/E/E06sIQXQO7IrIjZ9tmICuXPQzVvyS/+SvTTjbwXz6U9GXBM3VavG9wYFVp0LlV02YsIFwPUjQjb1VGAxumupOz5fD4wvOUOf+uHSdonnUBJrfic=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8379.namprd04.prod.outlook.com (2603:10b6:303:142::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 06:43:46 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.022; Tue, 26 Oct 2021
 06:43:46 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 16/22] hw/riscv: virt: Use AIA INTC compatible string when
 available
Date: Tue, 26 Oct 2021 12:12:21 +0530
Message-Id: <20211026064227.2014502-17-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026064227.2014502-1-anup.patel@wdc.com>
References: <20211026064227.2014502-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::31) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.162.126.221) by
 MA1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.22 via Frontend Transport; Tue, 26 Oct 2021 06:43:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b1b9f91-a7bc-4695-ccb1-08d9984bf563
X-MS-TrafficTypeDiagnostic: CO6PR04MB8379:
X-Microsoft-Antispam-PRVS: <CO6PR04MB83794BBE7E97C1F684640B8F8D849@CO6PR04MB8379.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d4GI0y9Haj3os+PK47pppCvlqa1uITuSwfXV8ljMUrsIP7VZ6KL/QYea29HZ9eEHgB8cdulBVb4ttwZ5nxc2enydEaqM0MvkiYXSDh4NA9QoVsVgItZuF71eQvFSkVm2ujrfb6FDggC73XiN7v8lV+LzByG+1zhMJKG92Dq9g1K+G8UWMgRjbgOBoVDkEkXOtOry4o1eRRxdFBdY7/vbDUs66N0iMuEspKRhGo/uUya+tJot2plQ1Yi7BWjaV7jGwIGCjsGIJM43SqpQPdfLaU9xoM8s6p8D+HJe2AxIhe4t123p84alx0eJYXAtWbyuR1r1mt/cU3QJdPom7sdNtWI17QUt4ZvHGvrT94tJHKRuLnRshBrdM7axZW/xDgfSaQFWkARPOQpSUWKdqULT2QHSjpyR7cEvf/zWVxZW7V+32Sp4R7ZLdAQ5psuvN0UEz0W6nC7Y+BOxj7UaOL39U6908GjlUC0z2b+rzGK5b4G6mjYg4CiDX7TDL1M2iXtGQXQcAG0UIDVXWGVTM+D2pG8azGcBuJHgTLJKtj5mwGUTzF/ubPIRnRCNgo99T8IoOLX/ExMDRbxsKevKF0gGXXi9LiZdrqIR9sPbHkunY+FRb317npU6Jsp9wUCDM3Kgbr9+BiVpvz48NOMCkW4pWki1iy5jWm1QloDZdMuQ3EnWQwY/b+fKaHvNMQEgZpBC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(186003)(66476007)(4326008)(110136005)(8886007)(55016002)(2616005)(1076003)(508600001)(7696005)(2906002)(38350700002)(26005)(44832011)(66556008)(86362001)(54906003)(8936002)(83380400001)(66946007)(6666004)(36756003)(52116002)(316002)(8676002)(38100700002)(82960400001)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5RVr9GVLeSiynJa2+/OHpq5n4DIiS9STCFcgYhl37RAIFXkjle8Nh3HnywOf?=
 =?us-ascii?Q?pgQEAfuAQK/4brV3tQ/tTviv2VKWK6cryosnpNN72LPgm87KMhJWxWu6wzzu?=
 =?us-ascii?Q?A3gpygkRybr82SDR5A2GK7YvqEoVz57L0VTFICX+Q+DMlTfHiBO6G0pEqm6H?=
 =?us-ascii?Q?PQ2Iyz2nj6AM9UQYKojwlOyMXFnFr1ZhJcdz/6zoQf6M83GeaxUvQ8nMoP3d?=
 =?us-ascii?Q?G/z8F027SuyvF03Xj9VD5aTRrqY9ZYS63wMGhv2/0UYUhul1JohbgmePAxc3?=
 =?us-ascii?Q?EAGUtlDij0vTy6CNxuTs7naOUmuTwwfDBwZKJMUQz/g8eD1Uj9U+JQPrVa0W?=
 =?us-ascii?Q?sOXUwYfWTncbGuIr1Ys/YwmKuknQ3sjdF0QG4STH/RtfBCjM0qQpDbeO8K3i?=
 =?us-ascii?Q?Hno+WM2ZQj+FdGjmejlCj8ffHL2jqtsvAZq06ZJYro3BKgdlefv4LtKRLsZi?=
 =?us-ascii?Q?xsibPGU8504HmPoLW9ic4haWx3SBgXnUIyLzEq784m952De/yIjYpFwrnHvS?=
 =?us-ascii?Q?q3N/v07X49CVlsdqGW0rfNAaedVLKThzG58UzDSndMIbz9BQtSrKT5JF9N1N?=
 =?us-ascii?Q?p9W65y+i2x3s2b1Hr192sKdSJw+ZAJurFQwLTINjr35u5hJ6Me9Xbs6Kf9nN?=
 =?us-ascii?Q?WQm3FbTS6+EPtmgpW31g2i31P17gRPzbcoOg+k8LTpcddjFig8jNDkns1j5B?=
 =?us-ascii?Q?RzcJT1axr0BIZuKfiJqDGtGV2ecmKxdpBGEOjQ6SLYHNX9R4UT2QmvqQ+39K?=
 =?us-ascii?Q?dvdfYtEkN9T90CsYTp15pIkHZ07VifzaAkHwmjxqIZbn1oJu1t9x8IBMofsX?=
 =?us-ascii?Q?MgKim57lUmm1qCiH6oeW72FhFZu90HYllcAWWbzQTSHINgFAI+JDt62Tv8vx?=
 =?us-ascii?Q?XqHfVRdK9QuQzRzJC5M3ryNm9GSiqMExF5J6Hg+2cJjhdJPPff5zH95JStuc?=
 =?us-ascii?Q?/PvlD4sbn4z5AJD6LVCE20W1akQkAeAihqmzt5NgHLl6aHj95FxWa2dV8z0d?=
 =?us-ascii?Q?rHcfE3awuty5tzlV2PvCy1+wTEnu6SPbR+utA+oN2B4GzORIRPLxBqkhzyro?=
 =?us-ascii?Q?A0h5BczdtXWBfmZB0ZzfC9QN/eNXXGT7LSLEakqjeXkDHXQMPRcqf6j6iqHx?=
 =?us-ascii?Q?Tu9TE8C25Zk7BprEtEWQt8cUpfcbND30YjyIwpCo/k79CPF3PrZWyRtIW1Qt?=
 =?us-ascii?Q?wrw/XvxfgRBO+BDp2/WZbaTjJrmluoZqpr83z015qMu7gDl/OSCDFkU7r4AP?=
 =?us-ascii?Q?P6Yos8OXQ2afpzkVvTLjFHcjyyRPHvOPipYywCD3A5IQG/1miL6M5YS1yHSI?=
 =?us-ascii?Q?9xo/XZEpzbNtAQnfA6oC7z3OPDTlfRaJ2D6lCTsjsHbfLe7esLODqddlpQX0?=
 =?us-ascii?Q?n+VmBeHft8gdze6XhdUedzlH1uw9X4m4AC0H0zITqPJcF8TRrMskLPcuEF0I?=
 =?us-ascii?Q?EzWZ5Ww3nto6CaL/bN796SczhHi3zw+VjX2rghAP7fio2zrFmWTdrtq6RsPU?=
 =?us-ascii?Q?odjpEwD5TDIyc+rvzk439AY8DWVdY09P1YzGnYEfl/LAEXBkr/TtqpbuH1p1?=
 =?us-ascii?Q?Z+vZ+K0OFCnf1bhRS8kyq+ap2Im+AXgBdMGZhd5fhfkWwIarpzsgUgG/pT0D?=
 =?us-ascii?Q?qiJaoHzXE+OEv037M+nrOko=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1b9f91-a7bc-4695-ccb1-08d9984bf563
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:43:45.8733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyRLxHTGABOv7JOy6qo/H5uVY+vOMnaogm2DUtASJCVPBF+ATvD+anexoi9+Jl+9PPElRIJy0BFZysCa2fD3UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8379
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9269cd5e3=Anup.Patel@wdc.com; helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Tue, 26 Oct 2021 06:43:59 -0000

We should use the AIA INTC compatible string in the CPU INTC
DT nodes when the CPUs support AIA feature. This will allow
Linux INTC driver to use AIA local interrupt CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b3b431c847..83f784bdee 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -211,8 +211,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         qemu_fdt_add_subnode(mc->fdt, intc_name);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
             intc_phandles[cpu]);
-        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
-            "riscv,cpu-intc");
+        if (riscv_feature(&s->soc[socket].harts[cpu].env,
+                          RISCV_FEATURE_AIA)) {
+            static const char * const compat[2] = {
+                "riscv,cpu-intc-aia", "riscv,cpu-intc"
+            };
+            qemu_fdt_setprop_string_array(mc->fdt, name, "compatible",
+                                      (char **)&compat, ARRAY_SIZE(compat));
+        } else {
+            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
+                "riscv,cpu-intc");
+        }
         qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
 
-- 
2.25.1


