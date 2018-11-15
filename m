Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQE4-0005t8-Ap
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:35:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDz-0005qQ-Ra
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:35:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDy-0003nb-So
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:34:59 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:40036)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDp-0003ec-Rl; Thu, 15 Nov 2018 17:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321289; x=1573857289;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=bbp2pEDTp9KHO1cEG/nmi7NDwFZEAo6P2XVJ2xp2dfU=;
	b=JBBLdBPnHZeFqxf/bYboge7D7UzWWhRIHK56p6ZTHi7hbhq3CWxfT4PC
	4VbBFAj7HXZVTvy90cyLZNQ9LAaEB/qb5i9WwxpGAr/nrL/z2eBXkkOmh
	wjgcglVGgRVu4loE9Rn8PD1+5Y/jrOJaPfdxH7eUL2H+iIvQnfKG41afl
	NWJI6MAey/n5N6JDLr3Pg6LoB5vFFoAMr6+0JAx4nW6Smk6UHxbTWjhfz
	K5qNyOBf9sCbjSJ1w0vLZxbdAZ1Z/QZCE7NuEN5DwUMWsm8qQE/hwRZCX
	YBFCSul+JbnDx06jOG6IYCB/fC+NnbGVJHaFddOkzPwkInmAvBVGN/sM5 Q==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="198884273"
Received: from mail-cys01nam02lp0049.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.49])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:34:48 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YiqzDg8UxYCM1y7gJY7TAMw1IGKoCRjZwANqYQiSn20=;
	b=Vz0ZA8+prJPZcmyUBd4GpqFMrTL0wYGeZXYojO2W0SsamYIpsL/MnFndV0WQll9qn9LzsqQvcLZy9N45rSlr1w6YTTs1ZFO5uxlxk133nT9Xq3valJzysQ71O0LbywVY6SDjLcB62OSyadQPBiFa8e6Q6xTzxrX3EpPC5YT4pN0=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0673.namprd04.prod.outlook.com (10.172.166.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.26; Thu, 15 Nov 2018 22:34:47 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:34:47 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 06/23] riscv: Add the tcg target registers
Thread-Index: AQHUfTNpwj+c8cU4XUuVw5+jHziYwA==
Date: Thu, 15 Nov 2018 22:34:47 +0000
Message-ID: <a960531f6b2a08f327d3526580b24a36317b7a8c.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0057.prod.exchangelabs.com (2603:10b6:a03:94::34)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0673;
	6:vyGq0X8la/zKX7wK4mJxUOGa24sDJmPbIeEbTUfdpPYJFQAEkCfnRAYkK50UAFp8A33k+oF2eYKyndkYAbvXz8pCXIbHkXkb/WMrmTlZFfVgEH8CE0r62fukOg1bvO7Ep2Ra978WjWav5V1koDZK5SJP0emcRrhCnM134f40vRgV8ITuZ+rz6+QRSh3h8umpHqk9h0kBnf2wDHMThR/awyzs6sH5V29LCcw4409AdKNhtP7gz5qoOXmJp0XIzcEighNAMoHR5SK6zbUPm+XGPpPact0dz5RR98SouOu3Ym+M1bpJvsdvlcZfmtBpl1W0uckoBcMMAMSXWGPvb/aSzEjKEKnN99RBH+/2gn53P2k4XHQUlOwEHvonpAGioIudWH+8NhVZ6ayGcz/wf/2ViMFZkayg6VFUdkG7Jh+r3w6VpXeMv9R33+A/KGzGIwNv8gV+NzDkwAXxMz4ZA9qSJQ==;
	5:THeD+/CUIukHEkAibi9ile0G9LAKrBYHexxMIm8Fv2PBFk3OxxCbAKId+l7Y0HvlejWDOhlauNathN9FBaa4ixPQD3/9Y6Z04HYOl0MdC9LXwWuQcN9HDojdqBcMfXWufLBo8qA33m8JdhRBPnnUmapahQQZSiUP1M1EeTKgiqE=;
	7:4/kF21FctstXRNjmYc5Dt6LkHkyKHY44xOw6rUyvrxt02gWUprkLVlCLlFh5+eyHBl+fhL6Q+dZbvfREfKyxqTRgGNAfflqnWx2IcHzJoMpbDqMF8H2PH5PYy+/b5c0KujlfXpgz5VfL8PfF8WCavw==
x-ms-office365-filtering-correlation-id: de14c9b3-4b38-491c-9fc7-08d64b4a8bed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0673; 
x-ms-traffictypediagnostic: MWHPR04MB0673:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0673C5DD9D5B1CDDE22A382190DC0@MWHPR04MB0673.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231415)(944501410)(52105112)(10201501046)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0673; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0673; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(136003)(396003)(39860400002)(376002)(366004)(189003)(199004)(66066001)(256004)(14444005)(81166006)(71200400001)(71190400001)(8676002)(81156014)(316002)(2501003)(305945005)(7736002)(50226002)(110136005)(54906003)(2900100001)(44832011)(486006)(6486002)(8936002)(11346002)(446003)(2906002)(97736004)(476003)(2616005)(6116002)(3846002)(39060400002)(53936002)(4326008)(386003)(52116002)(76176011)(6506007)(26005)(102836004)(478600001)(186003)(72206003)(105586002)(106356001)(99286004)(6512007)(5660300001)(68736007)(118296001)(25786009)(86362001)(36756003)(14454004)(6436002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0673;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: bYEBhSneNK34c2tDR6yxyY2dSnqLmArRcUFruOMqMZlrZ1fjXiEhvM1eEKz9q/t8fptRuQ9Gt5lIlqB2FSs8E/sqqd/MICHJtT9OI3h5Xeeh1VIyY6MO/tY+PZ/JZziHGdk4ds6ErOSDH9bsw3tnC7KaPVGx8itQ/WF7btFVtd6lJp4LfQdXEo3M7tlwwWHFsAUHHaE1/Rz+rJycGf082j1o/++RmwxFcsi2UrGcwRa+dx0f9E+CZIsBYqMpbT1EG26mDhTWSI5xIjsxZbhr/sM9FJbuwG5QGbIbKeIEagmpmcyBmDIHNMrjwgvBuVxYpLrYOIyoOdD1PeDXNQ3jPbZcLvjkz5rG10N3l/Ck6FI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de14c9b3-4b38-491c-9fc7-08d64b4a8bed
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:34:47.0255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0673
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [RFC v1 06/23] riscv: Add the tcg target registers
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
X-List-Received-Date: Thu, 15 Nov 2018 22:35:03 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 120 +++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 tcg/riscv/tcg-target.inc.c

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
new file mode 100644
index 0000000000..e5eca4bbbe
--- /dev/null
+++ b/tcg/riscv/tcg-target.inc.c
@@ -0,0 +1,120 @@
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
+
+#define TCG_CT_CONST_ZERO  0x100
+#define TCG_CT_CONST_S12   0x200
+#define TCG_CT_CONST_N12   0x400
--=20
2.19.1


