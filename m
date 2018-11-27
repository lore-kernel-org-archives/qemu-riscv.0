Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRka8-0003VD-GK
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:07:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRka4-0003S8-SS
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:07:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRka1-0003qJ-ME
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:07:40 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:63041)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZx-0003mu-2n; Tue, 27 Nov 2018 16:07:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352853; x=1574888853;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=u/Vt+IIb5Gpjehiq3oPEaWMoNbsRMl/tlVklhYt3MS0=;
	b=aPKsVqdprkoX/4KYH2FNck1/M0vMrgI3gZWudSKFxhV4/a4sHqf5yrNR
	ZhCin1n7OVhCWS7YQ0rfbms3J3nysugfR1SeE1v3RnoHnGKrqRs/0Qv3L
	ZjGiK8W+DhzW09GIj+ZbBRqeGjrdGfIjHpikQzW+97v2ftqQHGSsBtm8+
	JfOd2QQQiiYBpUss6LTyGdpvF4KQp+lfHW25Mt3eAQoRdAW7Um3FgStuQ
	olXpJcJoyPxdFKAVqeiUdT+Xy3PGGy1gWXcLzWjLwsXtaP9M6ZdsX+MIp
	Im5NQ3//nO7Xl79NBFhC6w4Wcly2XRWYunXTSaoOek0NrJKI2akD7n9SV A==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="96969382"
Received: from mail-dm3nam03lp0023.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([207.46.163.23])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:07:32 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=AVo7lhLu8qkvrxmlIjQlr17Le39ZoR9LDsw4XPcvenw=;
	b=N+SeNbzq/coUnvzEE9e+A86KKILn4p8eADs4wk3ws7RsvlMI+wqpdQiw/HM9y9ehdf3klMMNbWgXcBAYRVdYBWsK+ZZmwy4icv71cDQELoO9S61g8ptH1RuLCQTeKXwtw0fQLzuNKv8+DlekzO46EWDRZ7tRfgS8fFPNjHa9dTU=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0993.namprd04.prod.outlook.com (10.174.250.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.14; Tue, 27 Nov 2018 21:07:30 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:07:30 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 06/24] riscv: Add the tcg target registers
Thread-Index: AQHUhpU114k+ywjHMkKu1Bq/dhSwaQ==
Date: Tue, 27 Nov 2018 21:07:30 +0000
Message-ID: <373429c7267117de35a56c6ec16405f5097b40c8.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0043.prod.exchangelabs.com (2603:10b6:a03:94::20)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0993;
	6:ied725rpfAuontoz5TuIgQ9vYufrd5G6e2V8DpLylI3NEgSqlK71gwaD4qzkvvULd+u/kSpCmxALnXHEWjmXjNcXxNe5iM23TLLf9ZVc1nWObl1k9PqUj9C0yPI5YNuahWB6FJaVyG4wd+WTtjNm3wcuB6FYm1xo+0AUhnlf8Y9gIXbTOhO1hXOaPSK/poaWSqhOIdtfbroULvFBJ7V11aNwlGeyy2aqgOpkhutIruN69cldugi0Ka0i3tDBmfJdzoAIopS1liR71mQq3oNsDK3gEA11jzZyixmxd6VIhTN7az/6MLPSEoIpj49DWwCsyKLkzil4D//S97++7TrTy7LOdxxk/C/D1PosXNjJploqCTfDfeu5mKbXOrNUB7hRQuzGeJuQ8iThnLpW2YD440kBZKoOaZCLy4fET3oWCEOiL4h2IdxXG45oYQTYbsmsbAhY8FNAwT9APanZOmLk8A==;
	5:QodBJz4th/k3RNKk3+Ph7jaL1Q3OSMsA1FHFv8Q7EadfuolspQkc4kpm6CxYtLhJr1W1ln6/D7U1ZRGyPxWcvchBn4dZvsB+Ss4sLbFjGuJ5LE3+HmbUlnTWFQBn8/rKEgkvOGaJiXZrKQ4QRfBnmY4WS8jdp2ubczrXnUSvbMU=;
	7:jS6+IR5qWoPL2tMIEdEmLFwPDo3+VwhfQkt+8MGJC0vJzuYkvc8ZdQdEm26G4tWYuE+CKoyIa0QfmFrAelKfOVXyybvpGvFR5y4CLoepb3YclrDnt/VhYp1qlV/cq2/IcooMm9ZqEr9mmqlem17emQ==
x-ms-office365-filtering-correlation-id: 24b298c9-7ac0-4342-f622-08d654ac577b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0993; 
x-ms-traffictypediagnostic: MWHPR04MB0993:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB099333F3C74A1013E26B8BEE90D00@MWHPR04MB0993.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231443)(944501410)(52105112)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0993; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0993; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(346002)(396003)(136003)(366004)(189003)(199004)(7736002)(97736004)(305945005)(54906003)(316002)(110136005)(8676002)(50226002)(3846002)(6116002)(81166006)(81156014)(8936002)(6512007)(478600001)(39060400002)(6436002)(72206003)(6486002)(53936002)(105586002)(25786009)(118296001)(106356001)(2501003)(5660300001)(66066001)(4326008)(76176011)(68736007)(486006)(6506007)(476003)(99286004)(386003)(44832011)(26005)(11346002)(446003)(2616005)(14454004)(2906002)(86362001)(14444005)(186003)(256004)(52116002)(71200400001)(36756003)(71190400001)(102836004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0993;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: OiI/OPL6GTRXhfo/f4Jl3kpPvaiW18hLbGjw0IRIlp9Wk8ZnOzgX99jzypiv+mvxSNuW/cHizm5A2hypROYRje0i5UwYv2/q4GipWc/wJyDEvCW3FEfJ9J12Chgb6kMM6KMt6RNwUruKADt1baPZw2BjF82BMCGwH36poY/SZW68HGFLNwgFAp2+S4G9sdiSXBnXaQXdc3VKKqPDLSsRQj1HhtHBknLYKrnRjuUxBsCRFkZT60UjrRB+Pc2FqgV2nRRDFCUWa8EIOGxEreZNvjAHld3r6u+GLlXkdmYqYVVdbr6WcO3G3NGOIDWRIOqLOIb5zafuInHjevfe96GbEEECKVYfR1wenNWvLCtmvPk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b298c9-7ac0-4342-f622-08d654ac577b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:07:30.0853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0993
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [RFC v2 06/24] riscv: Add the tcg target registers
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
X-List-Received-Date: Tue, 27 Nov 2018 21:07:42 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 116 +++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 tcg/riscv/tcg-target.inc.c

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
new file mode 100644
index 0000000000..a4a1579440
--- /dev/null
+++ b/tcg/riscv/tcg-target.inc.c
@@ -0,0 +1,116 @@
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


