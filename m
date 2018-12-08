Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVQnP-0002wW-Mi
	for mharc-qemu-riscv@gnu.org; Fri, 07 Dec 2018 19:48:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQnK-0002s2-U9
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:48:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQnK-000120-0t
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:48:34 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:8207)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQnD-0000yb-0j; Fri, 07 Dec 2018 19:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544230107; x=1575766107;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=mqZga6OWxRAUOnZeao6lzdgKMbeiaRAgfZdIn9gX0vQ=;
	b=eKvais533WXq4gwYW85QYSi+LeoZtTgEGfEobnSXEZFvLnnWKLT7JFHc
	y0i1xvOnKynakq4hCcDIog5H+b1ofoQQ6yBIUxyW+MYi5I5LfzZbuzeTt
	hNuhdELunfrDJgD/oO9Ohn3aUM6x0mdwsMvEmoWpSF1hqU/KEtYC+Yerc
	1eq0P3dRgXv2JMjW+FckymDsEyz+DPNiah2hLWzsqDuLCyvVC/1X6ixBc
	m0pmWc+3IzHPvxt3BGHeKCGdO4aU9TDZAkni83tnKxt0eAZom7po09Ium
	TyISzRlc7ARvYEjMgTZrX2CqcffnYRuQv7Jonyo/id3jYNzvSlGD80dBi A==;
X-IronPort-AV: E=Sophos;i="5.56,328,1539619200"; d="scan'208";a="101012137"
Received: from mail-sn1nam01lp2050.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.50])
	by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 08:48:25 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=j73FdEGo1PDS0uC/cNhV51N7M/cyP+Cv27MCmS91TZI=;
	b=NguwCFCyv/u5T5LVUjXoWagtxgQxKnQgTCKppXRy+/uhB/CZ7gTRgpqLlwoD2rqZir0bA7uY/aRe68gZ/7ONIGiMoy+hoYy23c57ERvFgNRYoScAiKig4fEiYRfT9uLrRJNITXcGbrsqe5tt0uTMklUM6sSKtVMld7kr0NW6vzU=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0304.namprd04.prod.outlook.com (10.169.202.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.20; Sat, 8 Dec 2018 00:48:23 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1404.021;
	Sat, 8 Dec 2018 00:48:23 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v3 14/24] riscv: tcg-target: Add the out load and store
	instructions
Thread-Index: AQHUjo+4KT9F3KH0v06UY50gdwLVQw==
Date: Sat, 8 Dec 2018 00:48:23 +0000
Message-ID: <1db9a31231907cfb7630b1570ece72b80f7f8bde.1544229872.git.alistair.francis@wdc.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544229872.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR08CA0032.namprd08.prod.outlook.com
	(2603:10b6:a03:100::45) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0304;
	6:MkBJHvHKMeeIbry3YVK+L8rldyueNcgGpPIFHyCqqmlACtug4xOZv4BCZVPfoUgx5kp8eDvsEbvY248jSdPYFTqFKgxcGPpieBuBvIgqFKHTMkhJsvke/Er6Cp3XnqvsQU23G9CdJyaGPhE1MV2poCl2G16Gqmwqw9ISDCq7oC5nkvdwgsZ+Xv7okA0OjLfOTDXEH+eS3iumvzvznjGU8G3wHCd1oTnTCcYk0p8WI2kuloKjanQALsKOdqsuDHWzjkQiI0fHwnEX0CtwEs09bLW73sY7iL7qjD1+t3megE9o/op3KxVgIpu71uwFoMjfq8L5ACvypYSTOUuO/XO9r+MjCJEwnmCUZuDR2RAcPP5psVDRSWVBB1kVfvIt0i9PkGDheNYu6ruicG4h6v1NNqpO3rpn82shiCMqGydpZoC0rwAqv0z7q7vibxV9BEe3xcNpjTIBHvzIaM2vG1YXRQ==;
	5:RiQosFi2QKuo4BBnrTQFGaep4mSyxGFh5BD35AVHvF+lCt4z+x2BBIA04myZDBZ5u5smX7mR6YHw7ZMraOzPewZiT1Vy7vMfhDuppQUIS6NZp8KWLD6842PZMfEKVaxlwFXA+HF8EXaXtnLiqmNxbkvNMx5wF1PvJ+Zup3ePvyU=;
	7:jScU1eRw/dpxSyPtvZfyCg2ePV6aNZ/GAT1fxrvD4Ow43nlIXTPgg8MiIFoQoYgshpBNer204NaeRhN4GszXJtrvPB6z7SW/K19eeihCE7lWaQYWifaQHTAPUK6cIvNqXLDc5mZKt2Cv1+dvZaI88A==
x-ms-office365-filtering-correlation-id: f61533bf-5af3-444c-1081-08d65ca6db45
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0304; 
x-ms-traffictypediagnostic: MWHPR04MB0304:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0304B93B291E8ADE23D8449F90AB0@MWHPR04MB0304.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0304; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0304; 
x-forefront-prvs: 0880FB6EC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(396003)(39860400002)(366004)(376002)(136003)(189003)(199004)(54906003)(110136005)(44832011)(386003)(6506007)(5660300001)(68736007)(2906002)(71190400001)(25786009)(71200400001)(86362001)(316002)(99286004)(14454004)(66066001)(102836004)(2501003)(6512007)(53936002)(4326008)(11346002)(6116002)(478600001)(81166006)(81156014)(3846002)(72206003)(8936002)(105586002)(256004)(118296001)(106356001)(39060400002)(446003)(6436002)(36756003)(6486002)(486006)(76176011)(186003)(2616005)(305945005)(26005)(97736004)(52116002)(476003)(50226002)(7736002)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0304;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: 5HmTtpRk07iYG7kZQ1F076yUwV+/kWQR8mx7WIqMVJwhl2Y29I/lXAcJQF/N9t6rqRCImfaP2K2iqj0XymQna/4VJAHuYYxrcHbeYkIidhYf+0Bu5Q5UmHULGmOqIgfJXnvqks65E7bK6vy3r/2a9nS7gZOXQ0XTAfyhx6mldCkkBcUj9on6Abj3Cm8Jh7qM1kjz+t7S4Dv4EmAi7no8gsC7neDbmuxlEItcbFgqVCj4yyiic86a1+QBy7OGyfgLMUQWCxYUUsmRVZDy+OT36L3JdCZv2HyzVdit0ZCr6j1CzHCG+LH6ud24Sbl9V3m8xLEZ050moeSHPFZTIa9z8FPXRssL30DKRNef9xpzs+s=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61533bf-5af3-444c-1081-08d65ca6db45
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 00:48:23.5649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0304
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v3 14/24] riscv: tcg-target: Add the out load and
 store instructions
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
X-List-Received-Date: Sat, 08 Dec 2018 00:48:38 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 65 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index b7de24e5c8..04e81f811a 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -616,3 +616,68 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, =
TCGReg arg)
 {
     tcg_out_opc_imm(s, OPC_ADDIW, ret, arg, 0);
 }
+
+static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
+                         TCGReg addr, intptr_t offset)
+{
+    intptr_t imm12 =3D sextreg(offset, 0, 12);
+
+    if (offset !=3D imm12) {
+        intptr_t diff =3D offset - (uintptr_t)s->code_ptr;
+
+        if (addr =3D=3D TCG_REG_ZERO && diff =3D=3D (int32_t)diff) {
+            imm12 =3D sextreg(diff, 0, 12);
+            tcg_out_opc_upper(s, OPC_AUIPC, TCG_REG_TMP2, diff - imm12);
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP2, offset - imm12);
+            if (addr !=3D TCG_REG_ZERO) {
+                tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP2, TCG_REG_TMP2, ad=
dr);
+            }
+        }
+        addr =3D TCG_REG_TMP2;
+    }
+
+    switch (opc) {
+    case OPC_SB:
+    case OPC_SH:
+    case OPC_SW:
+    case OPC_SD:
+        tcg_out_opc_store(s, opc, addr, data, imm12);
+        break;
+    case OPC_LB:
+    case OPC_LBU:
+    case OPC_LH:
+    case OPC_LHU:
+    case OPC_LW:
+    case OPC_LWU:
+    case OPC_LD:
+        tcg_out_opc_imm(s, opc, data, addr, imm12);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
+{
+    bool is32bit =3D (TCG_TARGET_REG_BITS =3D=3D 32 || type =3D=3D TCG_TYP=
E_I32);
+    tcg_out_ldst(s, is32bit ? OPC_LW : OPC_LD, arg, arg1, arg2);
+}
+
+static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
+                       TCGReg arg1, intptr_t arg2)
+{
+    bool is32bit =3D (TCG_TARGET_REG_BITS =3D=3D 32 || type =3D=3D TCG_TYP=
E_I32);
+    tcg_out_ldst(s, is32bit ? OPC_SW : OPC_SD, arg, arg1, arg2);
+}
+
+static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
+                        TCGReg base, intptr_t ofs)
+{
+    if (val =3D=3D 0) {
+        tcg_out_st(s, type, TCG_REG_ZERO, base, ofs);
+        return true;
+    }
+    return false;
+}
--=20
2.19.1


