Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQFR-00074C-Cd
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:36:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFM-00071R-J6
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:36:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFI-0004bv-Tg
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:36:24 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:51983)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFA-0004ZB-RA; Thu, 15 Nov 2018 17:36:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321373; x=1573857373;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=8/Rk6tVCpy6MUHXed+WXJxV2NAZPuHUqOCWACo98NAo=;
	b=LHXCx4GeBZwkf5BN/edH+lq3PQcDnkBTpbo+Cw7xMgKBJ8A1inL8dI6O
	r4h6FpZtKJjBbpgdjAiKi1fCCz27+rfoeZckfCkoAw+byvRr5+Z2olWcg
	h22Mun//akSbiXPP0EX9JeCldYOquFNRJLPEQjH81AK32JB4itI6xxpCn
	WVgPccKeScS+key9GY5El8LjE81gS6nZvPD6sNZ1l4Ir6xO/pHMPAEhpD
	nAD75JE73Bqe4CEzmoPAHkhWmwQotXKlDKjxyor6/O4N56idfkd7XgDbE
	adGIsTawlOmd38Ri4jAu+nIg0ONsY/TKX2bJNLHJQwDimB0yB49o9siJu A==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="99166009"
Received: from mail-cys01nam02lp0050.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.50])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:36:02 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=24cG47hRjCzxAS+3zSXXrBJWbfsGhHTnNF9RDpxN58Y=;
	b=aXat+Cq0DA/+oS+7PpqY8UVtcHZzEUxRy57AhYNprnMBHdoxnnvxg2oYWH8QRfEQ9WPYvWtCtDOTFKzGJjF2TK22iyqwQLSZcGZNWMgM9BfGytFK/XdJdTemAnHDKn85+CP1iwEBaDDfSbmnFXLuti2eguXDEzKYo3NVDn7G4ZU=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0481.namprd04.prod.outlook.com (10.173.48.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.27; Thu, 15 Nov 2018 22:36:00 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:36:01 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 14/23] riscv: tcg-target: Add the out load and store
	instructions
Thread-Index: AQHUfTOVaruRtxqVIU6Srehedirs0g==
Date: Thu, 15 Nov 2018 22:36:00 +0000
Message-ID: <7961f2bc55e109ff10543c4665c5cbc3c75a5bf7.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0024.prod.exchangelabs.com (2603:10b6:a02:80::37)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0481;
	6:OSY/ECWBP9kre0B7cM99by2C8P+qPUpHpleMJPn/iESIvbhnohVBn3FqEhKcbwP2MtAuAzFrl4lfT1HypqhIPusbDjUSrsO0uronM2rbTjjB3SonAiCPCRhPDM+DO+pZT+8Ui+dTmCwHzzeabCS1kHXIffwOUrJHTvxv604JBcSiRYFKzHFaXhp9/IJY3iTCb75I4dVqXzKSEGMkUGfCKc89bLkuRETFmh+ZfFnHDssWHP+u33pnDoMrFhUalmBWrBY+6KftwYpT4PZ++OradAxrHKr26OeQgYxOG1427uiZnoEurVO04BHtF9jdnI3XElKC3E7aFIzp9lGJQk10j7Oq4WmHKHxL1hgxGxarW43zK9orHyTGMTU1+Cdv/LgpqAk1TXnHJ3x6Wi0ffLwlGvKZBQwC0clUch2zMXbNfXzBOdxA1EoE0VT09cT0hjR+zHkNr8xAgCOJ9PB02EneaA==;
	5:qrLZP4JF914dgPJIrZ/FfufibOLyGiYzo/fw5xC9OXFPbWU567jHk/yTLR3SiqrlHbi/+aqjbzg7romI9ewXYdzF0iEmpXV6O6/akexRmxVHpb2K8lxEDrJ+fMC9SnAo1NPqeprZdse6/qYEBnxFivt24yNhTLwoxOVd3kWN75Q=;
	7:hZq0+Up02vcfOfaTIi0H1bFDrIFmpI4xiHSK71uZ5YyqLZ0k9SrYr7AFw8U93x25klxDlRBvVm53XnjGYMxAnsSoq7eKj9v5hVNH6rZSzS/WoxK+z9Hoa5dIOHSSx1BjFyzO9o0v2dStk5QGxQdIoA==
x-ms-office365-filtering-correlation-id: 0e9b4a48-ad1e-410d-832a-08d64b4ab7e7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0481; 
x-ms-traffictypediagnostic: MWHPR04MB0481:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB048148A2E989BDB5553561BE90DC0@MWHPR04MB0481.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231415)(944501410)(52105112)(10201501046)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0481; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0481; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(39860400002)(396003)(346002)(366004)(136003)(189003)(199004)(8936002)(81166006)(81156014)(54906003)(8676002)(76176011)(86362001)(386003)(71190400001)(6506007)(71200400001)(52116002)(97736004)(110136005)(26005)(446003)(50226002)(118296001)(99286004)(106356001)(2616005)(476003)(66066001)(11346002)(36756003)(39060400002)(72206003)(102836004)(14454004)(186003)(486006)(2501003)(44832011)(3846002)(6116002)(256004)(2900100001)(5660300001)(305945005)(6512007)(6486002)(25786009)(2906002)(478600001)(105586002)(4326008)(68736007)(7736002)(53936002)(316002)(6436002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0481;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: AXf0J4sPagDzLpaWQFQ4qziKd+5eqctUfp6F+F0FfGvR3U+PBMeXF0g2lp5M2qsi5vY7dCoxx44iPGItkV2NMPr7wTUmdGFHGWtPknojq1Td2QSok5bU4GrFAzIoqs9eaMGc7G/GmD5IDNM7bcEHXeW7zrzsrWAxijAmWQsh0KwqtWL5iaHOznQ6EB4bT6csKYbhKzkP1OrE3nRvOdhKzcETkxJB1xCKZeKNS12hrDH1n4GG0RtJ4mzpfGbWbq6WAFXqs+I+Hr5mFs22IAqYGC3zHKtiK9F+EyrROUc7/9z4ScCdfurrcXAHs6vVD/yjiLQH8i01AJZmocvOPcUGhXJ33XAfRSYOsBB61oATOxU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9b4a48-ad1e-410d-832a-08d64b4ab7e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:36:00.9013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0481
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v1 14/23] riscv: tcg-target: Add the out load and
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
X-List-Received-Date: Thu, 15 Nov 2018 22:36:28 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 646a4d3ebd..bc433170c4 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -518,6 +518,62 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, =
TCGReg arg)
     tcg_out_opc_imm(s, OPC_ADDIW, ret, arg, 0);
 }
=20
+static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
+                         TCGReg addr, intptr_t offset)
+{
+    int32_t imm12 =3D sextract32(offset, 0, 12);
+    if (offset !=3D imm12) {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP2, offset - imm12);
+        if (addr !=3D TCG_REG_ZERO) {
+            tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP2, TCG_REG_TMP2, addr);
+        }
+        addr =3D TCG_REG_TMP2;
+    }
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
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
--=20
2.19.1


