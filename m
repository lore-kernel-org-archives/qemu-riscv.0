Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhLY-0001AK-TI
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:17:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhLW-00018Y-Qi
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:17:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhLV-00008g-Ow
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:17:30 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:29197)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhLO-0008Uv-T2; Wed, 19 Dec 2018 14:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545247044; x=1576783044;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=Ih4s0j5UAUWM2vvyAEuaXwzWIhBR/JhRlby3oIb/bRg=;
	b=rCqqlLoQzclv6Py8IU2Q94ex+32QAvxaqaF2L4rxVNR7LHbLDKsyOiGV
	7BQj4YR4vyPmRaqnl5aDPGPtkaf5DxhOKbNJF1SLX8PLhV2+b3nrpGegE
	mGvaov3KIcWi21CCuBnU3tmmdzsC5xjmqeDt4aS0wUvtDTHAsX2K5RVKM
	poqFGTWwUYpHDmEc7o5R8V3d6JYqiREcTm2Lj9SMLlCbdL1tVJpoXbC/H
	TzoGT7mxlHQbcM6cUt9LroZp/RTsJvpBCOYN8PisQWyr0TbXNiXnVKfuU
	2rHvffqsZwQ74GSHYQrswCtnq/JZ331s0IvhT8551pm+z8ma1jOaq5ew0 w==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="97004147"
Received: from mail-dm3nam03lp2057.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.57])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:17:22 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PMkJjGCCwTgm+EjotCUxyhOgpuzIVBUaKRzpR54mzHE=;
	b=eZt2Z44hsczSumarWM38CrdZnN0+tPOHdJPaDrWYW72D9ljb1iMelUGltoQcX1pYELw4TKVRJIZMMI0zbFR3EcrdaRmldt8p6VL53x4yblUmz63ZoWDw3EBk/NFsfD0isnPwV+19KLqbJiUdRc/d8gBjyZYm2w7/gWWXiKr5WX0=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0271.namprd04.prod.outlook.com (10.169.202.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Wed, 19 Dec 2018 19:17:20 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:17:20 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 06/23] riscv: Add the tcg target registers
Thread-Index: AQHUl8924BFC0qdLQ0CyGknjJavDBw==
Date: Wed, 19 Dec 2018 19:17:20 +0000
Message-ID: <6e43abaa64361d57b9bc9439820d0e7701f2d47e.1545246859.git.alistair.francis@wdc.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0011.namprd04.prod.outlook.com
	(2603:10b6:a03:40::24) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0271;
	6:XVbdcsW6o8n9+otXIEnlothCQeMHtv8+P2M4L9NouIwfkLdeyIw1Rvpq617FBJ/Pl7LsZSzH5hQa4jHL5h9Mnpd8/1H7YWC9xx79qANNdatVgoelA6u7ULS6BBQly6vLUrQeJTL1Whgu5wGan0n4wIt7SykhbI2671+5GiNmQjjqEpjIsF9my5Hwo7M/ck+tyVgEihBop7sQKwCcMxZ6IYZ+8IOTjBJJTa2nCOorrsEpuoLR4AlpWtLWNfdF0t61hVkGkCdYGYd5TCCEKOXtS57kXzWEXqP/KxzKgcM7HoM+HBzVJte1RNsa2yYNYL75qinFtX89IkjSAQx1es6xqOTHLuU4CiuEQZMFKxSqfGt1imEcVwOSeWLOloLw3a7/P/3UYT1o50nWk00yNNpUBBpEjP6Wy4jshkHnoCiX55JLC8rZEJopSjagGFEBjgpEddUK6IB9L5i/MUIflPPA9Q==;
	5:oF/qTsX6siOMhMGQ0czzh0rQYy1VpLHXUaNLVVEd/AHb+bsqoXxJ0lS8IObh2tXC2/mQETQfmW7roeh02SjXMHIUoKleW0k6JUckMD63J3/oARnJRG5X7/XFkkJy4IDq0DsuMgrwvR6WMfGWnjiPwru4G4Hn5nvwTISwLM3X3II=;
	7:QI9Z76KV4kUAPu3mMAyNuxXROKGDY3eVNss3/b7l3CNXoh2ugoTJgPms8j8Klb6JI1rnJaFtDwpWYkW13xPssWa4RDuMAKcZ9WEq9If1obclsT4FyWcFgZTBMy5dBmdrD3ZKGcrlyPtmaNoWS/eIdA==
x-ms-office365-filtering-correlation-id: d4349544-e9fc-4b1c-8728-08d665e698ae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0271; 
x-ms-traffictypediagnostic: MWHPR04MB0271:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB027170712F25936B9DA5F1B790BE0@MWHPR04MB0271.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(5005020)(6040522)(2401047)(8121501046)(93006095)(93001095)(3231475)(944501520)(52105112)(10201501046)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0271; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0271; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(376002)(346002)(39860400002)(396003)(189003)(199004)(26005)(14444005)(186003)(36756003)(54906003)(3846002)(99286004)(110136005)(25786009)(6116002)(14454004)(97736004)(102836004)(256004)(71190400001)(7736002)(71200400001)(5660300001)(305945005)(6506007)(386003)(86362001)(105586002)(478600001)(52116002)(316002)(6512007)(8676002)(81166006)(81156014)(118296001)(66066001)(50226002)(53936002)(486006)(44832011)(39060400002)(2616005)(76176011)(446003)(72206003)(106356001)(8936002)(476003)(11346002)(6486002)(68736007)(2501003)(6436002)(4326008)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0271;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: 7luMnHSZynlUeA2ff1n8tYz8oNNwIX2EgmojKk5Bl36YBfcr5KrOWtWY80hR+90W7IWFOWbPrFX7CP24G6IyxJ212U+NIoTKaIXsIhvOJzSl/GEDf9db+OGyVMEBxwzxyeTNXXdlhNvs4c/OuPgy6zKQXOfZ2ZizysUPxGLDg9muXufsOdH6CCYqaqciUH6OYNL5J3PNIafT2rGrAuMRp8DrtkzJUBBi5hHz4TFSHJCayuO17pjVMq2AeWsA+z2j3VFDOzp5YOHP1IhUwRugNyasJ0MelggkMYz3IMmjm69RQmJui3PI3oICHyjoMMUd
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4349544-e9fc-4b1c-8728-08d665e698ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:17:20.0874 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0271
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v2 06/23] riscv: Add the tcg target registers
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2018 19:17:32 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 118 +++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)
 create mode 100644 tcg/riscv/tcg-target.inc.c

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
new file mode 100644
index 0000000000..6c969e3973
--- /dev/null
+++ b/tcg/riscv/tcg-target.inc.c
@@ -0,0 +1,118 @@
+/*
+ * Tiny Code Generator for QEMU
+ *
+ * Copyright (c) 2018 SiFive, Inc
+ * Copyright (c) 2008-2009 Arnaud Patard <arnaud.patard@rtp-net.org>
+ * Copyright (c) 2009 Aurelien Jarno <aurelien@aurel32.net>
+ * Copyright (c) 2008 Fabrice Bellard
+ *
+ * Based on i386/tcg-target.c and mips/tcg-target.c
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy
+ * of this software and associated documentation files (the "Software"), t=
o deal
+ * in the Software without restriction, including without limitation the r=
ights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN
+ * THE SOFTWARE.
+ */
+
+#include "tcg-pool.inc.c"
+
+#ifdef CONFIG_DEBUG_TCG
+static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] =3D {
+    "zero",
+    "ra",
+    "sp",
+    "gp",
+    "tp",
+    "t0",
+    "t1",
+    "t2",
+    "s0",
+    "s1",
+    "a0",
+    "a1",
+    "a2",
+    "a3",
+    "a4",
+    "a5",
+    "a6",
+    "a7",
+    "s2",
+    "s3",
+    "s4",
+    "s5",
+    "s6",
+    "s7",
+    "s8",
+    "s9",
+    "s10",
+    "s11",
+    "t3",
+    "t4",
+    "t5",
+    "t6"
+};
+#endif
+
+static const int tcg_target_reg_alloc_order[] =3D {
+    /* Call saved registers */
+    /* TCG_REG_S0 reservered for TCG_AREG0 */
+    TCG_REG_S1,
+    TCG_REG_S2,
+    TCG_REG_S3,
+    TCG_REG_S4,
+    TCG_REG_S5,
+    TCG_REG_S6,
+    TCG_REG_S7,
+    TCG_REG_S8,
+    TCG_REG_S9,
+    TCG_REG_S10,
+    TCG_REG_S11,
+
+    /* Call clobbered registers */
+    TCG_REG_T0,
+    TCG_REG_T1,
+    TCG_REG_T2,
+    TCG_REG_T3,
+    TCG_REG_T4,
+    TCG_REG_T5,
+    TCG_REG_T6,
+
+    /* Argument registers */
+    TCG_REG_A0,
+    TCG_REG_A1,
+    TCG_REG_A2,
+    TCG_REG_A3,
+    TCG_REG_A4,
+    TCG_REG_A5,
+    TCG_REG_A6,
+    TCG_REG_A7,
+};
+
+static const int tcg_target_call_iarg_regs[] =3D {
+    TCG_REG_A0,
+    TCG_REG_A1,
+    TCG_REG_A2,
+    TCG_REG_A3,
+    TCG_REG_A4,
+    TCG_REG_A5,
+    TCG_REG_A6,
+    TCG_REG_A7,
+};
+
+static const int tcg_target_call_oarg_regs[] =3D {
+    TCG_REG_A0,
+    TCG_REG_A1,
+};
--=20
2.19.1


