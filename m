Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQF0-0006kR-9d
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:36:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEx-0006hs-Sf
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:36:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEx-0004Th-16
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:35:59 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:30522)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEs-0004PI-Je; Thu, 15 Nov 2018 17:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321355; x=1573857355;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=OPngtHVZoZPypiAfjv1S5ky1efE07ySExH+OP1PQCbs=;
	b=apmKBuTJfxypBJu0ewnyfAv+HWL/HAI7tLEWWOZRWiHrZuJLoyLC3plq
	ikxMN4R4Im2JyqIv1y0MbxXrXg8p5I/LYqbDsZ5/FK109af9Lx6613G/o
	dsS4y+CElWUrRyMUWEMMuABFWKa0SRmLysFG1MgIvh9jkDzHKqqGzH/Rv
	9Ke080uvea5xZ3uBNxx8lqWGdgUgm5dK5tJ84LO8mJhHM0NJUrwyzasNT
	2GLjpOiTMfB4Mnsy4wszGll5uDnZlN9lZ1kNmWPTGdtGbbgawz9nLIcN9
	nShepnMy3wQ+FAbkh9u4W4ybNUrq3LSAkWjbeA54NvVwQYESdkF6K6sn4 A==;
X-IronPort-AV: E=Sophos;i="5.54,499,1534780800"; d="scan'208";a="94368145"
Received: from mail-cys01nam02lp0053.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.53])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:35:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HFvvkqiaDdvnUblhmZExaFI970LD/T93Fi603t5NQpo=;
	b=SDRC1KTs4NNLrNwTUJRzAxZD6yvVudKdzZ6R3ubsm8OyO/2Who1pOTSM1gK9/bIdGqKOF0K4B9G2ZRHuXeXByIIS5bWcnZdL4Xf8JB3XBNR1PZMREHE4IyI827PCqGNuAQFrgTGAY+YkxH1ZLTDQ1ZW6fNLrQccG4XnYhl4TWXg=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0481.namprd04.prod.outlook.com (10.173.48.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.27; Thu, 15 Nov 2018 22:35:52 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:35:52 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 13/23] riscv: tcg-target: Add the extract instructions
Thread-Index: AQHUfTOQXilcdrTNx0KynLBujJmCjw==
Date: Thu, 15 Nov 2018 22:35:51 +0000
Message-ID: <ac51f3b3a2d91ea1b08ccd89add5282d308cfe70.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0030.prod.exchangelabs.com (2603:10b6:a02:80::43)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0481;
	6:Mbom7FXmfqHo38Vsc9GnLay91lFSCk6NpwqeOt7ASEMu6WJ7/HCA8hnv/BAgj0EHAevRMPbai4dRyNzHXbKFatXHtH8wUipjuCKAwAzZfZVVyTjDgz6Xn1BqXPojYnLVR8bgMANPkX1LNj/SI3KW83hlavXbqdee4gLOOysXni0M/BFBDRdeNHJEn1AooTbdecNP0fOitXf/hZg/wHnv7o/hKdrGWerpY6ebk7eQ/P/B3d5aM6Otgp55e0jgv8o7nDBH6hXQpa7/eaWQ51Z41Fa9ShgC6zvF2bq7mhLuMBOPnDE0GeWsLe7YXZVmDnU790P1Pyz4Xd2wBA0gUjDqIoTLW6GLyJRXoTiwSkTV7SGlOyG2GnwxItvvQZ1/bvbgbJ0QHSdMEtNkVsNiLBoUgV0WjQHD3vW9eBtVN52MqyoWZepOOTWZORmOiLbEVtP1ZbBtEb9gjmanVfZ+kucHvA==;
	5:UPasHOOkyEXqH5HK34dRv4RfTlm+Aa+muZ6UWF9EAGZ75Hha/DpQBcaF4+qRyMwUYlGgzyNRNddQ6bctz1vqD1rH1BTcBLxmoir/wmjONgfRlBoD83PZir6pFPD0o6Ch6LL38LvkIrihWGn2a6V1B11qeR0wcgFRNeilWAhCu20=;
	7:smzVeS/w25Af8h0/TOOOvMdj51SRa5mP24JSxidWf032P00Dq2tDcLU6imPkcGZEfVDBMVK2oMPDwc+mu7Gq4RWtiiN8OQ9RXkl9N1fDplIzx0DwGO/O/m5opH/5lu6RQ3883SwazN9X2AkJOpfZrw==
x-ms-office365-filtering-correlation-id: 90644d2a-5cc6-4295-7931-08d64b4ab2a3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0481; 
x-ms-traffictypediagnostic: MWHPR04MB0481:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB048122E7DF70CCEC325F835B90DC0@MWHPR04MB0481.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: TUraxIvE56vO61zUvOLlgIh8llBCb81k+cyjagsDXADcrRS3GijRw5b03EY3GafYZJmaCE1Gcizg/S/6OzRjuzOW/U0+/ohKeKUwD4Vfs3YX3mPVlnckQm0XOGm6qai0Q9yKrwLCrFbStvAP1CCwoekkb/GUM0ybBkaNFgH6WneZq8IcxncOC/CbDF90+A0sJgbqwDK5iWVpU9iXFU1kH/v6N5Vn/tGpC8GdWAN/Wg88Ux0oMXKzOWKozPOpknw1kF915GSStBmGcvD6wj8et0w0w+AvZ2uhcTFFOMGZBBg5wJl/bVz9FM+IpGWvi/FYLNrQ+2UCO25PRXOPeQPZ7/UT19Mxc0DcVzgYevjdKmE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90644d2a-5cc6-4295-7931-08d64b4ab2a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:35:51.9427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0481
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [RFC v1 13/23] riscv: tcg-target: Add the extract
 instructions
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
X-List-Received-Date: Thu, 15 Nov 2018 22:36:00 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 0e891e24c9..646a4d3ebd 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -484,6 +484,40 @@ static void tcg_out_movi(TCGContext *s, TCGType type, =
TCGReg rd,
     }
 }
=20
+static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_ANDI, ret, arg, 0xff);
+}
+
+static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_SLLI, ret, arg, TCG_TARGET_REG_BITS - 16);
+    tcg_out_opc_imm(s, OPC_SRLI, ret, ret, TCG_TARGET_REG_BITS - 16);
+}
+
+static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_SLLI, ret, arg, 32);
+    tcg_out_opc_imm(s, OPC_SRLI, ret, ret, 32);
+}
+
+static void tcg_out_ext8s(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_SLLI, ret, arg, TCG_TARGET_REG_BITS - 8);
+    tcg_out_opc_imm(s, OPC_SRAI, ret, ret, TCG_TARGET_REG_BITS - 8);
+}
+
+static void tcg_out_ext16s(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_SLLI, ret, arg, TCG_TARGET_REG_BITS - 16);
+    tcg_out_opc_imm(s, OPC_SRAI, ret, ret, TCG_TARGET_REG_BITS - 16);
+}
+
+static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
+{
+    tcg_out_opc_imm(s, OPC_ADDIW, ret, arg, 0);
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
--=20
2.19.1


