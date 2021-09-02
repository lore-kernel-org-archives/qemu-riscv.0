Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLkrn-0001wX-FM
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 07:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrm-0001tc-Bt; Thu, 02 Sep 2021 07:26:46 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:26536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=872ab4b15=Anup.Patel@wdc.com>)
 id 1mLkrk-00033X-Iu; Thu, 02 Sep 2021 07:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630582004; x=1662118004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=v9qHvephH8xqMR/1erKMihJPIud6kqpWxFYa3Br0/+U=;
 b=I7bGusXLtkVW6z3j/kZX5md10Wtk+OMUDx5m51g+LHsrNWuXUvaXH+gh
 2iG5fH82P4o4PIfmF85nUH/9LAbOlM5CGijp/ImxAE7LIZApi/yXTwnqE
 JOaFKND7x+vKrDxNoDlTA4UCD1kVK9m9SxuPjvauCLivaU8QLmCHVXT3C
 Ey5YwouFEMWgrgPcdp2X7BRFcBqswt/DSk+4mW6xNEWfdBFLz1Wqj620f
 FGE7bGJEIg9fQW72EnpaU5njKND5BC8Azla1tq/kdXcqmTS0tk4hKDOGT
 Uv/sbvn7eVF3kUGbpXL868hR9L7y9jdMFeEET2QRmnw577koNpx2opjSe A==;
X-IronPort-AV: E=Sophos;i="5.84,372,1620662400"; d="scan'208";a="290644640"
Received: from mail-bn8nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.173])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 19:26:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5MkoyFoqYljoC9NCQ5oY5jnm/IIvKuL+v0qkGGW8BuavjYVn4UW/Mclv1qrmDygy9DTBEpGyhfB8LDKey599Apq51coaqJ7YTzGWnyRB4v0DSfBRPLEw1Rm1xA/mXA/WJjhB2j14U7xOeaXdi3qJ2QVaqjljrwcVx0u9Fy7+2C6ijqH8l96gAGqGOaQ8E+WtxQwUhyPKlS2hFjYCWGZcQbd2tHoZJ2Q2NeUIsPxpR4tBKthyyonqO1dYV2AtJC2wJDhdzBi6EM6BEMpxdcpvcoLzKZ4GDBfNsAC5KvpduqiuJ1+easGVCZUpKWymOWwZ7BiLCOWsIekBReRm9bUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=87vuRUto0FiuAEwk14X6AJ5cr8MHQ+gTWb6RO+VnoCI=;
 b=MH8tJuiKmcfz5ZbYEqFbt2yykned54sbZ2G/9zpk/+Z8iWpzyS07YzzWJWa/BdzfNlOzYVBt+T6+9PW55M8ta0uGWtnds31bgDcq5kbxywN2P3avD6xjZchEvixns85J8m1WBkA5okwDCaIy3HpaLqNfBHucAgUDDfVOhaLOx1PIP+6P4IdnmiP4mjI9RXvZ/msoIFIWw7bgycdfduggVZWfiXDopOLPEjzKpOOw21G8WHfxNS5fgx6BgRvinGKxPilTJm34LJir0yCqjsU61O9zirr0ttkrCI3RAru/YUi430HxfImtk4YdNSihB8a9nrPwILYrYrJyEYt24q9V2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87vuRUto0FiuAEwk14X6AJ5cr8MHQ+gTWb6RO+VnoCI=;
 b=YTK/GcwgiKJLxU18l8uUFZckvGRl1cUZ7olnkfXTDLnVu3ZOq/Np9SoPlHpSfsOCvFvdPWfumpp6l+ultqyFtXE75q+R7kwmvszojgg1LCrTciphoLHTC38c8FQWZQ6+mSrVlNEeG4XFpsrAjABKpDCklBze1Khw5J91F08+PnA=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7841.namprd04.prod.outlook.com (2603:10b6:5:358::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 11:26:40 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::e035:6de1:cb5a:fe26%6]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 11:26:40 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v2 16/22] hw/riscv: virt: Use AIA INTC compatible string when
 available
Date: Thu,  2 Sep 2021 16:55:14 +0530
Message-Id: <20210902112520.475901-17-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902112520.475901-1-anup.patel@wdc.com>
References: <20210902112520.475901-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::8) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.167.220.163) by
 MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 11:26:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94479e70-2b6c-4a90-9b45-08d96e0488da
X-MS-TrafficTypeDiagnostic: CO6PR04MB7841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB78419524EF8654E4FB333D748DCE9@CO6PR04MB7841.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0YITpCEhaxPa7eZQn1f6Sby6fTYlKooMT0muC1GqsFJ/JFacEdU3yWkYWfYWlldOcwe5YAafCdarUZZ2rP9/6qoO48p4paJ5qk757nb/klpH9UdwZwRfR0S5AKlRkTzZIifJBbZSmZKox8CZoU+aU0xdd1OVSj2b9yA5+ULJgb3LuM5mTjfAJzb5meHH/T+PHMyqbd2cPbxdmZDaoriQcKnU17j4t2CSliwvNjKMie5AZbbEOq6kq+Z+PdY4lFARHi1nighP9CgyL+iyYldX9eiz10ijf8o1RZO/y7mbycAenezKg7c6xPXgsetGKRlCN45IYFHmpTHTuUfaH3CgDaGzYQ0IV3NvGkrsx6QMd0/E3/Pc4xn8svsONcXEQCoe/M3PDDcnb5nKcvrvbJo74rU+6MzJlEqb36UVsaX8mSmn7529Xm0zJMC0NnIorG1KCYCIQf/AzO422kRbtAek63DgWHhEtAp+nrsEorjqId9CcxUpnBU5gh1M7gqfUrFzgovDPuDY5r7GRlLidSmmFlc6eoV+tlFGob2AeqmRUanKjMEN66aFrnrYDizgALD6rU6Sygub3YGqVT6k/+mrvURVAugJuk5A5d7zRoMr1trRcIvS4aUO4c/u1Hgl3i2xbY6nAZz0PR7HnLMh7UShaYeMfX0BjSKFSzPBSjxXrfF/pYD2/a0d/IFXU+VqsGiX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(38100700002)(83380400001)(52116002)(110136005)(44832011)(4326008)(38350700002)(8936002)(8676002)(2616005)(6666004)(66946007)(5660300002)(36756003)(54906003)(316002)(66556008)(8886007)(66476007)(1076003)(2906002)(7696005)(55016002)(478600001)(26005)(186003)(956004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?94BZ8QJiayeeTDIobXvTjo6ZYIe15VT3Rd9VrvlJkheKiKceNBW4HzhHfXA4?=
 =?us-ascii?Q?3TdMksmAwjexX//GgiFH9gB1HgpUkZP2ZHdlAfEaprqZlwKaiotfArh7znfU?=
 =?us-ascii?Q?6lsM7Ij7zbQBEgmTlUuFVcmmK4Lgofvm9KEfwVkZhiCttIkWE7O6LFdy0YKh?=
 =?us-ascii?Q?+xXrmfkaaU2XFgdJnXBZG68OvJWLjapAnc+HTBQHAfCjsr99Sj1HKpnYYc07?=
 =?us-ascii?Q?G27xRgATEL1ApqKdyOHdnTITzkwhXlTv16ZWT5ZCDPYqU9aAShILaKofU17A?=
 =?us-ascii?Q?N0gz/hpI+zXeqbfvpk7kexrZeJQqv2tqqL/MsMiEbP3J8l6StBgv0DMKFMY1?=
 =?us-ascii?Q?zF/rJLOryk1FZIbBpRkGdVyiPchzZODUUXDztJeIJNrb2WwKCVNaa+uz3Uz8?=
 =?us-ascii?Q?DrW0NyneYdJejlkTuLq+BnL5ljxnAuP6Qyt7jcICtHMljw6F1DGno6IQZDNh?=
 =?us-ascii?Q?EFLOwKNiKzAOpJRQif8wlY3Ep7fiGpl290vVjAGjGB+oeCWd8wa1RF3gzJQU?=
 =?us-ascii?Q?XGjjaFqsln8VhuRxLBxxJ/a7BF3IPP/k/F16rn5duKlYPC5P/q1T2y2scsT0?=
 =?us-ascii?Q?Ja+M5wWYbvolJ3fH0UOZ+1j2MTjAaqADblrWHQDs2FG+ocMffy/USbOMDlgC?=
 =?us-ascii?Q?xLhW5ivpngCFnMQETJFdGmIsAU7ClMgIwZ6BnF7Qh7Xo2WMqJ8D98ppgNO0s?=
 =?us-ascii?Q?9OFwPAx94aAVWNwoKBKKOSu3JX1Nv0SSkHXMpywZNwPH7sOSU6kjG4rvqFx3?=
 =?us-ascii?Q?AXLJy52x9dS2TqkPCcdPSInE1ePVc409CZKvdYLILvPOPjgHFxzolNCQ27D+?=
 =?us-ascii?Q?vx7AlDzpWmg797DoVUyY9ZG+84u6pzKKwU3GTG7PwDT88K0ZDBRnY84C9iWH?=
 =?us-ascii?Q?tJCEc0h0h1GVdEz0VjMm2DadyEpJ88bd6P23faT2DwBrs1NL71/uhBBe+JLy?=
 =?us-ascii?Q?cJQsDfhw3OteXFmAFByJpEtMVX9hPBTaVrDQwhPz1CoZnH3m1JS0Gr2cE03W?=
 =?us-ascii?Q?rD4ro0Hr47yqa8afQIVUqaHVwCKBis0IvPbem2vwyssj84I6WYO44zEYfGF/?=
 =?us-ascii?Q?RRv3M6pOh5Zoh9PjCBiDqZyPgfz959Z/X8I9d6MVn57wDME4LpAvCCDN9mjs?=
 =?us-ascii?Q?TMCer1P9vjt/J9dPfKM4W1RAr+LDDzyc6XmDISdvUbeidLjMwEwLGIPycRmT?=
 =?us-ascii?Q?jJybQgDnGTRm1HHrSS68L7cqrd6AHCKqWNivk+vjIP9T2wv2NLnbpX94scFj?=
 =?us-ascii?Q?/sloVm+/MoCO49PRdH0um38eXtl1rn59emd7pfJnBDtxM05F/oJAd0f2OK6h?=
 =?us-ascii?Q?3xKsuPjXFY5ekBq7wgEV3WHu?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94479e70-2b6c-4a90-9b45-08d96e0488da
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 11:26:40.8242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XO/5d8/qDo4PG8EQN6eMnSb2/DU/0WG/VoXG4oteIRSsb3A5wjyW5NJetAnbyH0NzoHbYLTO0qh7WzA/xyqRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7841
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=872ab4b15=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Thu, 02 Sep 2021 11:26:46 -0000

We should use the AIA INTC compatible string in the CPU INTC
DT nodes when the CPUs support AIA feature. This will allow
Linux INTC driver to use AIA local interrupt CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 hw/riscv/virt.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ec0cb69b8c..f43304beca 100644
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


