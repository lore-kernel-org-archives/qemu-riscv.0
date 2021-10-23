Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meChd-0003TJ-OA
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 04:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChR-0003Fl-Dg; Sat, 23 Oct 2021 04:48:21 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=92346df24=Anup.Patel@wdc.com>)
 id 1meChO-0007H2-7e; Sat, 23 Oct 2021 04:48:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634978897; x=1666514897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EjStFy0Uux4hB3UssCPVRcOfhMK4l65TuN0t3V/k6aw=;
 b=FIiCZVry9dEnejgIjNDo5nBZEi2K0hXsceMAhKeFqL3Q17z/OeniiKYf
 /1lIYUuMdLIGoRFZkdIgVcZNmFDBeYdGNN5nVbaVBSOZTI5i1o0ZEvT3z
 XHotDOMvKZ8CxrUl0NHxyZpBcIq5oxJ3gEK7jH3gc0Tg0jsEE8wyPLvHA
 An21snUT+NkAjIH9n/yOjmt3IbfWL06hiOLhU9+fgK5XIuQGZceqAAWFh
 b7hHCaMw0NJ2s+dMwzoTAGHU4dBRYe+KYRBNfcqUSGmdSwfjyQed+NfV6
 NtnpN5FbJ86it4SmvOysuqYzKTngn1Ct91CM62FIPqvniaq/YM8RVlEAY g==;
X-IronPort-AV: E=Sophos;i="5.87,175,1631548800"; d="scan'208";a="188437382"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2021 16:48:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQClvBQMd8f+hvl8m/e0/tmhRRtyTrnkF9Q+TnrcgmovIf6xEKe/8iEC4LBWDR1jbXkc9bDuHr5sDHqL6+sEWxkMYH9gMn1CjYFKqcOKDNfJTAPF1uB74SbCvUCXIM3+405vII/KMtgZOfw47t+XhcgNTjf8/MaQFPkRPlW9ddYbzO+R+ABv//4qIfItUe3xeXZrkUhd3Bo3whXHhrTRsJl6cRM4yLTlldnv7RCOUFIsHYlp7l8TgALsrJlngVqgxadPuiZUyBYuEisoW/ygfU+9UeqCJkBVrR72ZMTfRmI4OkJXnPux2/UAHeyA+vcb0YQ93N/68bsyYZuILz1ekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2P+Ws87gYa9iglFTyQoBUGbeZ0MQP0XcyniCqROoYw=;
 b=kU8cqoZNszvsAqYR+eC6e9vzBVsSIHw/rPba+AeeNmO5zX10pYXFZirxdGBzJcVe+qs79drpE9CSsYQrVud3sP1uCWkvhZurb3nTkWH6RTQ99m1vla9NN4VAx19tK4/SIkaMEEN3NNFJ7I9DlA7sJ6vOMEMxrExYMX9NM6zj0/dehj/6IyJy0coZkEJ8eHIQGMqe8/X/APC3bNrHt5SmpFfHMXn1n/xzz0e8xeVwS7kgZmr6nw9iknYPuzVeAhN9AVzjfeVBeIOSlNzjkSS3mipeX4GPxaMm1V5tPIDoBmdyIN4h9SNaALmwoAlEaDhdh1XIUelCZSj/PTDMQxabLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2P+Ws87gYa9iglFTyQoBUGbeZ0MQP0XcyniCqROoYw=;
 b=wr6pMhQZSkU+BzrosYzsyXZreNh698cytxDBQiSAmu3q6iL+NPJZHJMflJcKKBFhFfNXiHmA6Rmc+jOHOXl/WO4UPDv2ToyFsk3OY12NDZL0fhbD/D7dSBpmshuhH4Ga0DEjvvMFFfjaVV69orCmnMw9WePDkEqKvf5OM/C8/IE=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB8409.namprd04.prod.outlook.com (2603:10b6:303:140::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Sat, 23 Oct
 2021 08:48:11 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4628.020; Sat, 23 Oct 2021
 08:48:11 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 16/22] hw/riscv: virt: Use AIA INTC compatible string when
 available
Date: Sat, 23 Oct 2021 14:16:32 +0530
Message-Id: <20211023084638.1697057-17-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211023084638.1697057-1-anup.patel@wdc.com>
References: <20211023084638.1697057-1-anup.patel@wdc.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::27) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (122.179.82.21) by
 MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Sat, 23 Oct 2021 08:48:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f81c5fa7-b326-4f30-b704-08d99601d80b
X-MS-TrafficTypeDiagnostic: CO6PR04MB8409:
X-Microsoft-Antispam-PRVS: <CO6PR04MB840967714534D285FA9A76008D819@CO6PR04MB8409.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZpgyF7/0+iVWRy9nVR2etJ+7GyeBQ6mWaqbvfU8RUI+0AqRARN7B0Uao6+iu+05s7lOaVqpunOsnvZ1EC8gLmF8gQuaa+qfVLrDJl6xF/kOP7Fc0N1fm/VkjWvjdImW38+N+9aMVVL092ehvHpDQ4ShlqZ3oTBswFELpdJ/4SxmF5LD986eeS1zggVfE+9nf6EpCGnYUIK6Lc0hxEx5C9Y24l6bhO7rpCntKvuZhRUUH7+S9ghpkYyuJqUKWpADKYHD2C1BsdHUXLmJ5nL+pxifdBFLOnGseC1W/TcYZHMGVHid5sVA8NJnTcL0atm9dwUb3+XqOvLacWqR5SzLqwNlP+1lZhWFlc98N9y3W+Rk6EHy4PjZ67V9VClBZrOSJaShOf++rirjeQqvA8vzK8mryWK3yS7esZOXunsAI+CzMJgptRGwY5pPLkjDuQSASFXJtmLPy3hTOo4fS/85P0IL0YHd9z2Jq1V3DI1Jwa9ben3RduweR09A2iCdoFlUspJc2LOYZMbrS7kFWSsUAutBpvLWcb5M3cBxA+/UmgQtQjFK+t3US6mAcl/mZeNA8hjCFF8wbM4BvismY/lf+B2Dysv4KPKqB2+FAvBItuBMfMB/+hzR9ZbT0WwKZugjfMhy7OB5tJVsR//oCrj5UP8v5j23hrVL2VhHlQAwHiJZUvAblOlYVJWEFrEV5ss2V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(8936002)(1076003)(66556008)(83380400001)(44832011)(186003)(6666004)(66476007)(2616005)(8886007)(316002)(66946007)(36756003)(4326008)(26005)(110136005)(54906003)(38100700002)(55016002)(8676002)(956004)(7696005)(52116002)(38350700002)(508600001)(2906002)(5660300002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3gExWZHoHo25YAEOYpreOt2LtAtwHc8zqYVy6F/9QpRM2Gl/xv2aMrEhGJzC?=
 =?us-ascii?Q?DVWdkvpxfJa7jak8C78/5m9vc9hq8RRpboeet8zMWFZkycfhuYrvjITviEdh?=
 =?us-ascii?Q?BHXNHOtBqbIvLykiv/OnFHzQzQ+lF/q6oAi5R219f7VD2vGKxmmHkHgZGwUQ?=
 =?us-ascii?Q?LzWbl1R3b0s4rSYTRJguC/Ds7iwEgOvMu0QSoQwQLZxqdIgSqYZRmnYZYNOb?=
 =?us-ascii?Q?do1+ebCEKDdZ0E+LBrHm3CXIx8EtO5uDEygthPz9BOAvOCWefmDzC0liSAQN?=
 =?us-ascii?Q?PbT5F3gdyN5m0ylTIcJyn86aw5nw083DvEWQWORmsrPmao1KhZVUv8XY3ha9?=
 =?us-ascii?Q?TGXRNUTdRXugRJOO4nQEQihZVWU3emn0/h/Eov/K9lHEj2XBQSzjip9PGrFH?=
 =?us-ascii?Q?Y8EsrQvrlM0GFy9psn4j54MLQwgOwYe2iji4e6zE24Zw9M/MPZokL3d0xWqr?=
 =?us-ascii?Q?j7D55obcnuzjw65u6BXSWJie7HQVB5KdYxOUGsbKsxPzUO7X9LKaWrjgk+RB?=
 =?us-ascii?Q?jhCqxCZqVdyiavLjDT9MFiRctpm/D8sC25s5V43UfxpwfHDj3AfmqsGqSbiu?=
 =?us-ascii?Q?Gq3PY+R3tW6WW2ys8OOSgr2LYyCa2A08GFA6z545qD5GC325hGFRgfLOt0jM?=
 =?us-ascii?Q?0ljI0ZsjN3UMTJEe68dJbeQmAKSHg8noHF4qTOg3pb8Hqy4JceTRXxlqjRM4?=
 =?us-ascii?Q?T6ZJVqRJvO8NnsDbkyj5eKrcpm7YLwk5DoHImeNxFrU/czfQsZgInAUYkH8e?=
 =?us-ascii?Q?ykRPJeO1ikZyOBoqFriMY0zZrAiipkr8KwjG6CDel52SdYuNqxQyswxMYIr5?=
 =?us-ascii?Q?bZfshsuE3bx6LJOv06knFiFCZiP4WE3FS8MFnhqjwXXPTM5fKAukTRS0d3Dk?=
 =?us-ascii?Q?5O7ryXm5lSUDKfr7ihsJnnxNE3gqaHtCWoEeqEoWA1ZTOUjmF4Pqeg+52PwD?=
 =?us-ascii?Q?Oj+/TqTnVPd2/KNY5krD47hfffmNWDenaEln3Yu9IYnK7oOyrD99mxnwjtkx?=
 =?us-ascii?Q?/RhothI4L5JkG+V/ClxdBJZsCgclPc/dNfPpZgjzhNJAfDEVPwJtoCvCGew6?=
 =?us-ascii?Q?pD6rfGe/4/60ZlyXOewRWJsGooGUeroRPRTXZBDBMZU+iREwbO4VMf4v4/k0?=
 =?us-ascii?Q?ZeaPNFxC/Fr6zhKkW1gONKF/9LiS92AKcT0/6j6I9mfOf0b7DB92Hl5MA8vV?=
 =?us-ascii?Q?pJsGyznqwmy7iylnoekbsaQBQUDs+iyMmSMAOS3IV4Vw5LNX/ymadE0il9IW?=
 =?us-ascii?Q?JyDdLFFBdO425EDquXBaTqI+LBby/kz4Xb3UPLguBAKYZ5iOfUdi03yQDZRI?=
 =?us-ascii?Q?yuw5rQbY+QdGuFVstQ9Sj6senhSu9zo9ngx6VpxFqxKuD89nDuuNqF2tPtFM?=
 =?us-ascii?Q?xc/4+QFN+r4+uXVfYMWxkGnw5/QpjdO402m1hu8vB9Wbx2I2Ec6V0+Q4wXd6?=
 =?us-ascii?Q?Ug8RE3RdITA1M5CdZymw5idoCA6x3kccEwT2m0kucZhohLbf7J+Mcw3HrWi6?=
 =?us-ascii?Q?TwpZJqb2FiLTRKW+ANnUTBA+vSWoW/3RVh8iZKg+iLpVPxjoCsVlIPh1rIEa?=
 =?us-ascii?Q?KvM5L+WgMmHHiiA458UwmnQXvUx8la8YPxjPWcpds5ElU+TyDSiIkH2JBTxk?=
 =?us-ascii?Q?7Jvry8Vs1j2gv0RElKhNor8=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f81c5fa7-b326-4f30-b704-08d99601d80b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 08:48:11.4949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3BnKAaZTO6DnAnNTOi38rJ+lFF6xRfkWbzvXupnpJpw4Z2Joxs/EzJCmxL4hocE4EpsPXb8TbiwRSan+qXbXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB8409
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=92346df24=Anup.Patel@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 23 Oct 2021 08:48:22 -0000

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


