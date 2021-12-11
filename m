Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvtsV-0006EP-RC
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 23:20:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsT-00069c-B2; Fri, 10 Dec 2021 23:20:53 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:25465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=972e533d7=Anup.Patel@wdc.com>)
 id 1mvtsQ-0001kt-NQ; Fri, 10 Dec 2021 23:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639196450; x=1670732450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Ca43ESS2+1FZjA4ratGOaQ0wK7DvoP9IjTkQxMgpfaU=;
 b=QkUgtt4vLJ7Und1/TfDh8/NMSs194mXS8EkbHUbEJjEsC6UBtDeMLa+G
 9bBG8m9Du9GP0UlKoAiMEJoliViorqgcNbq+OYvcUCxfBBriqVAsBLFxw
 m1U6J9RMeoD65/8yd74hCaSHOUwaENiKzOEqq9WAPIS99EKCATUqM7V3u
 j/le2P5iCfa7e4unvim5ppc6scajLxJVHNYlmNVnLfwtwnON//qrUSxSG
 KXa+wuZnwxKAwsk9xKM52Cu3zo1WQT1gQNv3MD5TAaOoY20DTAS3TFESJ
 UjKL4CGcIvDxQmS2xqkkOC+nh7RUVXPbkuu+mgt0UxYlG1oTHi6kpVzFt A==;
X-IronPort-AV: E=Sophos;i="5.88,197,1635177600"; d="scan'208";a="299834379"
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hgst.iphmx.com with ESMTP; 11 Dec 2021 12:20:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrrtnQ42B0jG513uV8iTsaSgvpgMO4sk9cgN3nHV7MX4wBSlqd9v+EKhuTJqBw5Kc597amaqVaHLuZN6ANiBvRek+nkJKoBSi1kC8viCX6Sp4uGWGw4ULuggsK0ZKwUMdkYTcSThWIO2c7aIx4M+oKd5CT0YTeWJnhJmR+mrp2X5BWlSAjSrdqIRK5wK0BorGg4OQrbn9JfhqYg1ptLb3NHLIXv7lHK7T5MBjDXqWgg1Pfa9NHp5Ie82MCxDfieDFI7MesP2vQQSxzLl/VF3iAfPHdyiRCtgU0jiXeIrasyvB1DkrC7MEO+YiTm2K89om/hwc2XnQUVU/XsKkda2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9Rh0/3dKyAHNU/NGWl9qvR6SPHWDoz+TuZ5h9es8Y8=;
 b=DWhHaM5OnaDmhOsHFKTgMNxgfGGKM5zZmP2GM+iTZWZv5sbshSGnei8DT/ZxwMOvFR88NUkTZpcXlm0C2Kg9oiyEZTdtKh67Kblf3YP1u4nIWxVHCdWW2z59OVnFoBnQmSvlUxfFp0kFqeshggBqYSjZdMbFKq8JhPimUFIqWlkKaBbUOO1w5V0YJACPC0WjqYVOEgXSThMhd9p8Lj95x/w0tCFU2s/sIGmM1ZNdqlgcVoegJIPrMYdsItNU474jmuHTAdU0ARmdB6FPlPc2ifYZ+G7zb0tDtvLtFKK/4ilQAXeBIUWasLl8lPQ1JvY6xHcMimjlPSEaC5T10SxMUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9Rh0/3dKyAHNU/NGWl9qvR6SPHWDoz+TuZ5h9es8Y8=;
 b=HXtLDPCFSbCry1HotKcjTayfQP26iIFLzM/El2XeHLexCYQnuPeeEZtSK/rX24xB2X4eJTZiDP+Aw+mnX2hvSFP+hgdm7eVCY8wtD/GQAo+v634l8K7jmeFc3hXcwG4YwlY6h7UyyUuTCeh69mDJTZmkB0W1qBcPnIbC3ecrgzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO1PR04MB8268.namprd04.prod.outlook.com (2603:10b6:303:153::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Sat, 11 Dec
 2021 04:20:47 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::f14c:5516:7743:932c%4]) with mapi id 15.20.4778.016; Sat, 11 Dec 2021
 04:20:47 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 16/23] hw/riscv: virt: Use AIA INTC compatible string when
 available
Date: Sat, 11 Dec 2021 09:49:10 +0530
Message-Id: <20211211041917.135345-17-anup.patel@wdc.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3499239e-965d-4c38-718f-08d9bc5d9b1c
X-MS-TrafficTypeDiagnostic: CO1PR04MB8268:EE_
X-Microsoft-Antispam-PRVS: <CO1PR04MB8268A6271D654426EA3B0BFD8D729@CO1PR04MB8268.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h8WmL5gQhnWjDBzUCfOUWtxbZ8Klss77KJmYffY88U8NqawF2067vTerK3aOrurnuUDedG0hytc+QBS/4YomGQhV6oaHOJEC+cTnQOlSpt4uvGx59NEMufx+K1a/0I3T6Rlnqo3mY6XpEmLRSqz3qk+Wu4p0TTgWUDXzPg2E4wd3SPZSHg1Jan5xJ+UznuohHc9o8AFCvdof8IOZjoTSHBHHgrQiwHcO0ONgPzp+tka75IIB+gbaVixerqdqOnjXpyZIC3k+iXljLUKpR8vsmOfz+GLbEqTt6exsPttR328m55f3RjxbJ9zFF8D1Cwusyq9it2RgJnynUV1JcW4ktEnNvlY8RQss43polDaG7rwQTttsL0POlVxkG26xgZGpz9pPdytgHAvitK+dWSNUYIk/in6o59spF2Zn4WhmV3Ldw5/6hw28VB3006c7wndleq6+PS+9p3Gm7Q0sJUgvsgbiG+uHSMPhDuYo8jw9NXiiLYKh41lAtlHhFCqyX/iPOlkKj0ZOkRgfUqGk89ytdTn/TPM/HMA9xFUAFJYq88+GXJf+33NKCzvFBMnl/UTxEZ528nPq8S1bNzDuafT04pYtfxoegMvtJgO1LpxDkCmuCaQG0ZwOJyuPLQSDe+d+hTYeFZGZeKA6O2gpS7kvNzYuXj9Kvp21S0MmuT4wbeQoIbNPyU3yzpYodtizyXFR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(54906003)(44832011)(36756003)(6666004)(2906002)(8936002)(6486002)(66556008)(38100700002)(6512007)(66476007)(38350700002)(52116002)(8676002)(83380400001)(4326008)(66946007)(26005)(6506007)(186003)(2616005)(5660300002)(316002)(82960400001)(1076003)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2l1DpqP5s9Bwe/Ry46NQ4ZDWrKLJ6VD1MWsfPgSMWHBEIT9i1mPMxloCFk4P?=
 =?us-ascii?Q?zVKn5oUxiM2Eaq27P5CbVpQKhNGXpBuZt+x1Ecnn5hxekAIzrtDW8h6HFO4S?=
 =?us-ascii?Q?ojOqhoQC57axHHRfcP27gTvkGCxJUqig8F7+s8W4Z275kEUk3VRdtME4pu/B?=
 =?us-ascii?Q?hX4iBvKW0WC+cr4FjipgsRGvrNgQh9HZR7m4jzXaA6O/rqBgNRdZzrufw7Ua?=
 =?us-ascii?Q?zAAQqz/DkEVAtAD3tYN/4SCkCUc1Y4s6ELLsnJQfjjNA3HnNKW78TArMiNvq?=
 =?us-ascii?Q?mgeSmH6eBmiIssVbuVuH0s8u8i/zRvG4mbSA+OYNo/XH0WPAue/PsPs9JyX1?=
 =?us-ascii?Q?sv2zG6/E/tJVv2A+bt0l08ku/IvhYU+fVXidmlEnMIwy1+GaeZvLWrc+D86n?=
 =?us-ascii?Q?vgexkGsScIpB3nf8SXLcOrEUubZs9Gp/dGFbFHy3ymeOahT7cMiwJoQn3Vq1?=
 =?us-ascii?Q?0A+H3F+RiK/LfIN1q8gmOXtPXWDawUlPbV1AQ/T6rF778wQI6ET8SA4SMHEe?=
 =?us-ascii?Q?ZqKZPc/a9iMyZeBq+Uq2MtIMa4BauDv5GmYsNV3JJo+rR9q65Jt07YJm5RJI?=
 =?us-ascii?Q?qvRk9p1tcRFuOYQG2FryBtOCaW/xOO4cI99Cs7vmkwF/aiJx+pHPtCkbNNTN?=
 =?us-ascii?Q?B5r4vcZYReULjcDROkYawQsk6nd5Ny6r7Syn88q7syFrRx/6ZcfDtkVxVp8i?=
 =?us-ascii?Q?z6MOxh7/yu7CpLnzufK/505O1LwqH8DQLltKJgbZGTfMuIBqv7tlxxcJurSa?=
 =?us-ascii?Q?XHBTGcmRrTflaNsvuAO0WteNjH874s2BcaYc3+rP2PZuK8LYo3XVQUCHZJW9?=
 =?us-ascii?Q?nHBW8mMozueYezbyFAQTEm8Qs6uN7DECmDjD7iL02rQ/nemEm6Fjq7Fz8E1U?=
 =?us-ascii?Q?OGA4Dpjj7rm0hDRaAevu4A7mn7dajnT9eVJ8k28Ia3E8dc4x2BSPAXxxr9kr?=
 =?us-ascii?Q?I4ezt3BNR1kbpo60uOuMEB07eUNNOPJ+Jmf2npWwMsKUO6YlXqqw4ujnBiGe?=
 =?us-ascii?Q?A+5SuIlG2P+M5uSL4A4ODrlmOhir0AJraPR9rHLTjFactAdqmmWojadsN6fA?=
 =?us-ascii?Q?RAKQqtdXtq+TRE4uy2YJsk+W1Gd5dPS+X6Jqyh4KK8RManz+JSeyUNXXLnoy?=
 =?us-ascii?Q?hxyXbbENEO9Gw5z8gcXJp8b88RoihzwvoTJh5D+UXS4f30VP+zvG5mFdWxUr?=
 =?us-ascii?Q?nWiYm6VbRpj3qHEtAfdAp6k0HJEJWS/ppmXiLSTJL67z2i2Ko9dNzlyAk7X5?=
 =?us-ascii?Q?F+oB0Jr6524WPk+T7GUlDmkMHklb4SrumOEYv48DYNry58JxUk1R1suB6NRm?=
 =?us-ascii?Q?hiSOyiCkGDDSVhUO2XVy0vMXqIxadzl80BcTqQH9DUZdusbj4gVmu3Std+u5?=
 =?us-ascii?Q?NrPieJnlZEUxj9GRgN7B9Y8fOurE5WNk3EO5j/ZAxPmlM+g9AdNf34aaqiW6?=
 =?us-ascii?Q?9mDpqGIHp7p0sBLJrEt5Qy4+PD2dCju9Zgkvqw/SRDrgYwLkAnjKrinYS3wB?=
 =?us-ascii?Q?S1HRVlTxqv32dTMS6iYD2RhwpGUFglqVS/8jYpwaPXCfQtk7+a8/wNfeyoNQ?=
 =?us-ascii?Q?XUtFIVh62+FFY+8Q1KcDGQ3gLpQBdW5947lno1Apzy9U2q1ZuSD1nNZ/xhW7?=
 =?us-ascii?Q?46rFe7RRu5hu8z5Pi0pE98c=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3499239e-965d-4c38-718f-08d9bc5d9b1c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 04:20:47.1511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbXjfKFZpuBHW9io+mTtEMuuqq9qP+WSgzYgDnp122MBFwtjPxSTFzNBSazk+kk97HlBlCkvcyCo7bxle2WSWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR04MB8268
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=972e533d7=Anup.Patel@wdc.com; helo=esa1.hgst.iphmx.com
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
X-List-Received-Date: Sat, 11 Dec 2021 04:20:53 -0000

We should use the AIA INTC compatible string in the CPU INTC
DT nodes when the CPUs support AIA feature. This will allow
Linux INTC driver to use AIA local interrupt CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3af074148e..936156554c 100644
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


