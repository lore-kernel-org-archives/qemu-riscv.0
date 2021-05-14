Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhYsa-0000lP-K4
	for mharc-qemu-riscv@gnu.org; Fri, 14 May 2021 10:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=761afde0a=Anup.Patel@wdc.com>)
 id 1lhYsZ-0000gr-Cb; Fri, 14 May 2021 10:33:27 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:34538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=761afde0a=Anup.Patel@wdc.com>)
 id 1lhYsW-0007A7-BA; Fri, 14 May 2021 10:33:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1621002804; x=1652538804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=El6ly+FwAkzsS1bqEH2tsGfO1DY40r9BUXYYlBuYq10=;
 b=eLiJi+QfZNYUBCGwvF9fWQNVJVeGwWzNKV1eru6wHtFxycscsNskq+AM
 Ygsrq07SLbNtWKmTCMebUDrpt2yhckxRU0oNVXjIHLyMhQYUsMtXjZVel
 2/wp04j46+EYYaz2xwNQoEMoBzb5LEJwBzdiCTLWCqbnksUh6IGFHpQ8F
 rXO9W3QJ0A55suGMT85AoZFndNoX0PKhI4N3qg4AN8x5XjyVWN/YaIIXV
 4AjkRv9M2jDjAWuJnICf5syv4jHLlNLjnCk2vk0EvcbzKjqwaBVaYVXEr
 kq4HlFc1j+VL1uloadWSgb70tuORbo9ypIlQmf5FF8LXd3wnwbBSBhTTB A==;
IronPort-SDR: R5BZtBBZsxf7yjcdKbF42BbY7UZTt6ePaQEOsrQBWFEAMm6FzorzLgHeSSQNV1z9gqCl5Brykz
 fSfYUhjGGHNHshJlyLaMK14/l6R7rh4TkVHpdyDks6n+r2z73cUt8VN97LeAxijId0qjGm1SrB
 nqGhk3CJ2+4tAh1TX+t54iXLK8WPjmAzSB3IUJZEKTMBEOaHU1K62z3QTQrmvsWYb+KrGYQR1D
 Lx27pr+zcfptlrj6lYYAkIZik68fWmftChpaXqTBiZ3emwxs/UbW3skvly1uHNliOjNAv0TOnX
 nVQ=
X-IronPort-AV: E=Sophos;i="5.82,300,1613404800"; d="scan'208";a="167526819"
Received: from mail-sn1anam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hgst.iphmx.com with ESMTP; 14 May 2021 22:33:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHQgNelukpMVQS8GKz8ffpYL0PYAzVaRt3S8NrkypViyLZXxtKNL/fISD27PCATBtTxTlVToOWJXi+qcmYLsIO1lgt9rNRUObt5WLbH6uYF9lqwaTXpAB/vT3RjrHwBECgScceKNw/mZVt9oSoOKmbCcVmCLx+HNAWoj7E/+Wnt6XFhKsQKxGkxSsilvBLpdEoIP8E7dxVhTRk0kpx9tY4GvsZwqMV7AwiWg9fa9FuGKjtq/FmLW0VzypvNloLvFOnRqJCH1KGAgtWiBqTbSecXPi9m9OLQAy4PYAlZAbW21K+/h9cJ4HbnnQT8vemIfAlRU2ujVoW5TwTdJ8nPCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFa1J7YVbYgSHSjZAWRK077pK2y5y52q/pY9BQUNF8E=;
 b=fyAE27JcNpIQ2upSM8WtGc2hY5LzNLIvpKawjhtSx1rWzEowxlyfhGL4cl1D+n/mlbAmmrtF0y9D9cZ/dzAeZC6OaUbXBXpWSHScSdLxpKEXjuOthl+qNsoNaPS4dvnaMPUT8HRnr2bqW+gpTFWZRGssTy2wJOOVjVVd+u3z6LCUaNlk92bB0Y/rDJ6WU8fITjUVHbaOhQtIdsRjgWqTC/NbHxpYS2fZdEasynatZk97kPKdI/1Ddptdk32S+y3fVVXU8T6/vLzdXzcPZqNlizDC5Ps0MvKAwQK4wYx/2i07WdFycYrFtTVUyuFR4ZMwc8WnEqKTtiH9IfDPMI4zoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFa1J7YVbYgSHSjZAWRK077pK2y5y52q/pY9BQUNF8E=;
 b=Ft1Q92C9R7+vwkVpGSnelx56OQmij2Qwnv8xBRIxDLq9sQVwlsA7i9+CbQe2f1CeMMl2dhtD2U2AxW0SN1AGlfD5ln0A1IZsNR/Y4vKs1u3Qn+WdfudHleea2KmWIS6lTC+mIvziHUC+oa0BzcGW04Vxjj5nE/9GLPTVLWdUDmE=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7810.namprd04.prod.outlook.com (2603:10b6:5:358::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 14 May
 2021 14:33:21 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::88a0:bf18:b01d:1a50]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::88a0:bf18:b01d:1a50%4]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 14:33:21 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH 4/4] hw/riscv: virt: Use AIA INTC compatible string when
 available
Date: Fri, 14 May 2021 20:02:42 +0530
Message-Id: <20210514143242.377645-5-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514143242.377645-1-anup.patel@wdc.com>
References: <20210514143242.377645-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [122.179.90.73]
X-ClientProxiedBy: MAXPR0101CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::32) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.90.73) by
 MAXPR0101CA0046.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 14 May 2021 14:33:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e9a1868-6fa6-4da9-2534-08d916e53932
X-MS-TrafficTypeDiagnostic: CO6PR04MB7810:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB78106783F1CAA9A82A213A668D509@CO6PR04MB7810.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: avM9kOsZhIUpS+GELvruxvEJczojPkCFG76zVM+SnONE4ApwXr6QPMpZkeH3HSLtuogkpyRYvMZRyH2GTFkjsHScG1WkmXd4iYE9ik+ZhOcjS2U8+5hsAk0C90Cil+4cvOwiI5qqKi+W7+JwLHKfnJ0MN+CC8/s/jtpvp8ZWScSq1vR5XAg1we5kb4+Psk4xxUXtL7ykqpj4x5oSY4vsFZvti/z1MXgVjMdwqWDQl4dT+PP9boj/G2nbw0GwukxKTM5OxEqcrsH4yNImWPee0MsC2OUoVk+V40RQojj9jjd1FM4sRQZnlp+0Lf6EsO2VLou2DQLjyOMiiR0RGhXhIztzOkLv47urreNt+tr/O+hc3HDtOCfPVW51PXmHNQa2BGWQj9235p/kakQmQBAmf7shRkUEn87L3DC8Nlpqq+OtR492XNmI07hBU3KF1/cmk10lHFbUwgJbiT2xRijnrXuJzGMd1w3T84q/tkKeZf53KSflVBxJR8vArsPqazwmYbKWqOj9CHXXCAm+HI702ClMARSLMpDsS6WlFvfOhQvbjRZBzdpO2lwXanobFr2LIHQEuECgLTNSnZ5wpzDQIblpPXNrtvGAG7lmv7geze6puO4GaUE4gPVaVOCW6snlweYJ6MT7BtY9NX5Zr2m4xVQ15rxoiHShOAX0p31b0YU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(396003)(346002)(136003)(376002)(366004)(52116002)(7696005)(1076003)(26005)(5660300002)(38350700002)(83380400001)(86362001)(66556008)(478600001)(36756003)(8886007)(66476007)(66946007)(6666004)(54906003)(16526019)(110136005)(186003)(316002)(8676002)(38100700002)(55016002)(8936002)(956004)(2906002)(2616005)(4326008)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?e97xaYqEvOTwRzYPSZz4dqZepn3DmVr6U/kLr0xBxnr137yTH8eMruhUe3uN?=
 =?us-ascii?Q?CrTSEg11vCdPHzdvdg+VlU7Y8bBI5BkO2HkHl9nRlHYqQ1f6InCm4s+KueZf?=
 =?us-ascii?Q?uSBPu9Q47P4CNspPMj5XMJN0xAVCpkEoHFuxIyw0DtHiH6J1izcaeJK5t76w?=
 =?us-ascii?Q?4Y7MKaXcGH7CPgdkRo/TJONCbTMy7jPxib2mp8utExt86JZ6SImVFN6AOEzA?=
 =?us-ascii?Q?05vQJi5BJzgrTh+wxRB7ppUzr7ErfjvuySq0Z9NAHUJ37Optuc2iUl+u5ocn?=
 =?us-ascii?Q?tSDyz6pL3ZleRXNPQYsZ5DPgBEgi1G5M0xxjMD3ZQmSW4k+R1pEZld4425D8?=
 =?us-ascii?Q?LKN3jXs1z4RvBIROQCAmVhUBZFUKTAarzgMXETbwOIJuQW76rGcPxF2e/50c?=
 =?us-ascii?Q?y+s782c4LkwUlH8svJvW3NckM4YqUZtwq3hP3+ItkEaJNKvIdwmecv0DNVUx?=
 =?us-ascii?Q?6ZMzKV1hIYQZTZ0jjzJFVU1aGSJu4SpUvssPDoYegQVp8VuAa9L8tZgY0rw/?=
 =?us-ascii?Q?ytSWe6oEQtcpVnIOPiwO1MPsmCgjJQf8+zhb42Co1d+utjCkBV5JRZLgkxCD?=
 =?us-ascii?Q?/spuwnEo234oCTNcshqar2+G9wms7Qhi4kA138sOPAcgWDNW2DIWTVE9hM81?=
 =?us-ascii?Q?pTBBw7GhSjdcuDjrjzGr2G9wkhWIiPjyL53St2Q2/kNovSaw7XH8cueFBbKK?=
 =?us-ascii?Q?mFikKj5UNfOc2JzieK0J53OoJcwoTw8AMydCRqKTuih6K0id2TdPZml9E8M4?=
 =?us-ascii?Q?+ty4uYSmPRZq9TxoPtzWjKnab0y0uCugJw4atKlNMc4qKATpeGuYDxGTovPN?=
 =?us-ascii?Q?xqLBo+hjxFsGrXiFTGQf41IwGwfgJTZGNoNBoFiRfocDDIxOGmkqBGwJq9N+?=
 =?us-ascii?Q?NcGZlRRZ/NMmRJoRSVeTaSO7I/o5/KuIOg/UYax3ueEgMFyJitdrXxL3D5dX?=
 =?us-ascii?Q?3Lr2MWsfF+8vfUxdJ8VEqP+OwKhi4M9qZGEnWhEHDhW6UWI1zcjmV+6uE52a?=
 =?us-ascii?Q?N1iM8ZaSEVGXkb0Ps1H3uUam/GHJRPXVIL3AnA0jaDluPAbvrv60EM0v5o0l?=
 =?us-ascii?Q?XUo47zyRygltP1s4TOspAeiafGhnpmuiTewO6Fn6cFNQCSFTIA3LG/faR1Pu?=
 =?us-ascii?Q?nWxIoD2yKVs/r9ySjwmE91ME7ntLy+sftr7W2CS0KJ2ymdRgYaUXSOtkPe0D?=
 =?us-ascii?Q?KsZetWDVxqymeHTO3W3v/HrMsXGwTrV6wFY20oqPHEXb/+2eNbLOPwcL/j5p?=
 =?us-ascii?Q?sXc0o27FWu9EvmvOp8dkoINiPA4PE0WA5EJdMBiBiX1AHfs/ew637+aBmGdH?=
 =?us-ascii?Q?9hc4T/3I2cTOJQyX6MlIzexx?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9a1868-6fa6-4da9-2534-08d916e53932
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 14:33:21.4307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfiFxP31HO1odz3GCVfQTs2vAydFHwchjCjyVNgHYaWFTkFRZV0aLBPsaAH6qBvdh4SVDfzAc7vJIH76BSvIEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7810
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=761afde0a=Anup.Patel@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Fri, 14 May 2021 14:33:27 -0000

We should use the AIA INTC compatible string in the CPU INTC
DT nodes when the CPUs support AIA feature. This will allow
Linux INTC driver to use AIA local interrupt CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/riscv/virt.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c0dc69ff33..981a3a06d5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -262,8 +262,15 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
             qemu_fdt_add_subnode(fdt, intc_name);
             intc_phandle = phandle++;
             qemu_fdt_setprop_cell(fdt, intc_name, "phandle", intc_phandle);
-            qemu_fdt_setprop_string(fdt, intc_name, "compatible",
-                "riscv,cpu-intc");
+            if (riscv_feature(&s->soc[socket].harts[cpu].env,
+                              RISCV_FEATURE_AIA)) {
+                const char intcomp[] = "riscv,cpu-intc-aia\0riscv,cpu-intc";
+                qemu_fdt_setprop(fdt, name, "compatible",
+                    intcomp, sizeof(intcomp));
+            } else {
+                qemu_fdt_setprop_string(fdt, intc_name, "compatible",
+                    "riscv,cpu-intc");
+            }
             qemu_fdt_setprop(fdt, intc_name, "interrupt-controller", NULL, 0);
             qemu_fdt_setprop_cell(fdt, intc_name, "#interrupt-cells", 1);
 
-- 
2.25.1


