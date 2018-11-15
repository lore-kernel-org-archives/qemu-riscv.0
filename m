Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQEn-0006WZ-7y
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:35:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEl-0006V1-KW
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:35:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEk-0004Lv-73
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:35:47 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:50579)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEe-0004HM-DI; Thu, 15 Nov 2018 17:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321340; x=1573857340;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=l+ujCgPOmT211aML+1JGK3rf/aNtC3GC8ysSDC9sDyg=;
	b=OsgtuWhuU7cD+oXXx+bE8ZAqy4zF3+QDDeIyu8Bl7YU0J0FB+Zha3WCQ
	K7SlcCJhAMNE58y3f8soL2FS4R/BlUPS16udCVuXyg2O/rwwJwlE80E+P
	/Ry5bhCH+ebWo/8W7Ci9TMoN9FGUUO0QJKAE10tJm24cwDzBsHRLXtW/W
	e7o3ddJNKZVSyD+wBs98b7WuMViLlF6U61k3xLefOB3UK89G/nY16Am8J
	WrPB/bFa8Gr5zCSqeawgCP3Dh3QZsMZycC1JsNha8K3/d1TeGDvjNR1gU
	xNp/n4B4ElehZUGDyI3Y0Me/jy2JIYOMGwUAQIk6yibvIMEMyxyS4lY8Y A==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="95523354"
Received: from mail-sn1nam04lp0085.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([216.32.180.85])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:35:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9/8vslHKT722G8aL3pV02p/sQjZmzSkxYv7E24Fibak=;
	b=TYqZIYsYlBjG1qLLRsQT+fcfBmffoqRgRlJeXmsqK9+fz3epHiIm//qx5fbuASRQImBYtD3HhIrO9sK/BGYUasOSPLW1pF74aQv/7CHBUnFLItzcpzNsRRpNBkEDUWg/t9BCmh2NieyTFm4RcxsQqQVZNpKNrJYWLHwqjRHo1Zk=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0481.namprd04.prod.outlook.com (10.173.48.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.27; Thu, 15 Nov 2018 22:35:33 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:35:33 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 11/23] riscv: tcg-target: Add the relocation functions
Thread-Index: AQHUfTOFv1lIcwNF/Ue0BfAzy9tSQg==
Date: Thu, 15 Nov 2018 22:35:33 +0000
Message-ID: <1fe9630dd4ad73b8581684cd0ed6d5fa2918390f.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0031.prod.exchangelabs.com (2603:10b6:a02:80::44)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0481;
	6:LgCKAMYgDvnPWgRG1laRpQTZHnmeMiXIrSyDaTcBgTULzkXTArTpdAa5L1Bv1YqyyNMpbCRupJLuWjW5a7dhSz2dpkZsX4u9zP/HB6ARGXDN5GR9eZiAEv5/NM5hyFA1Y8YEtLHxey/p04qcYQIIHgdiyzN/cJF2Xybf4g/pPi894ArkCHlEbSferc8MRvSD3b5z914a8cqtFa0W+UogFqRIDrkmXySLqU1mi7ilPCT6r0BLUPvw4TavJL2yCqIOSMszqBU316friUocoRdVvlNcq3RaVeTXdBOYvs6kEwjgNL/T+zzxgJ5BFG8APVjV4SHK34ThLY6enHNNrRGyl9oeXo9yi6JMGQNH93oesAM4Tl1OD3+mE9LXiMFcoxHErgapVjjJzml1EzYPVs+IA1qW3MbgRwfVkVVz6oiIGUR+y/RXOj9Q8Mn5KLbtjQyh3dgHqUPxpXTSQ6cK3NtzoA==;
	5:5L6RIpmBxnW2c+iCo2EBzk0yWtLnS7yg+pRMUMJQ4qCnGj1PEx3LOBFhwm0vQuqT7lhIhvET+ik77ZhlwSZY4F8Hb9NEwrOf/BdG8j3OIkWmrR8wYvbzdWyi4RjZY2uhqHb/mT1pugSbQMs+3L/vBlfV9O+MwbhZOMk3X37i5w8=;
	7:tmHsOATLpdFQN/32dlIMMHvriNWyaU28mto+u3k4S15mrgxsA7Yqsfv82703BYKsz2Y3ZeR2jAyMYVsmCTFt1lUPL9ePqtdxluc4dEOpJ55h91K7vXemKyWBXrlkAR5O0C8aCrJcJNPzYTBid1w+DQ==
x-ms-office365-filtering-correlation-id: fd4d17ae-62c2-4d70-0e8f-08d64b4aa779
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0481; 
x-ms-traffictypediagnostic: MWHPR04MB0481:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0481667C0582A3B46788232190DC0@MWHPR04MB0481.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: dBN1SE7QOdIpAQqYE56vap8rXI+lNFdElUSAcwLqDoFllUqUJJJccLpPnTUxGjyH5ZlgvHIo23cDsBnNDmXReVuRxGGaO/IxOrkBO4sD4pL1PF1HRjrKv2fBK3Ksxn75FFaxzzdbzTh17Aa27WV9KToZqzLusSWsiAlM1qtT5/ExBzhCOdTrdVVip4Pk0+nV7XI3BxPw8NFcKIno+HCtMUeDh48KBf7yL1bdy+Koja4EGBVgPhlCDaAmNOI+zZRpWxZjD0N2/TAqovyROxoOzgdAV1hV4AAgkSdxA6BF0IDNsIcUXS/9J4m3sXyeYn2za78UTnbpUgr9mbcgKqgIXpxmQVKX3sgMAc1rG1Ex7VA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4d17ae-62c2-4d70-0e8f-08d64b4aa779
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:35:33.8673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0481
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v1 11/23] riscv: tcg-target: Add the relocation
 functions
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
X-List-Received-Date: Thu, 15 Nov 2018 22:35:48 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index d402e48cbf..475feca906 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -371,6 +371,57 @@ static void tcg_out_opc_jump(TCGContext *s, RISCVInsn =
opc,
     tcg_out32(s, encode_uj(opc, rd, imm));
 }
=20
+/*
+ * Relocations
+ */
+
+static void reloc_sbimm12(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+{
+    intptr_t offset =3D (intptr_t)target - (intptr_t)code_ptr;
+    tcg_debug_assert(offset =3D=3D sextract32(offset, 1, 12) << 1);
+
+    code_ptr[0] |=3D encode_sbimm12(offset);
+}
+
+static void reloc_jimm20(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+{
+    intptr_t offset =3D (intptr_t)target - (intptr_t)code_ptr;
+    tcg_debug_assert(offset =3D=3D sextract32(offset, 1, 20) << 1);
+
+    code_ptr[0] |=3D encode_ujimm12(offset);
+}
+
+static void reloc_call(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+{
+    intptr_t offset =3D (intptr_t)target - (intptr_t)code_ptr;
+    tcg_debug_assert(offset =3D=3D (int32_t)offset);
+
+    int32_t hi20 =3D ((offset + 0x800) >> 12) << 12;
+    int32_t lo12 =3D offset - hi20;
+
+    code_ptr[0] |=3D encode_uimm20(hi20);
+    code_ptr[1] |=3D encode_imm12(lo12);
+}
+
+static void patch_reloc(tcg_insn_unit *code_ptr, int type,
+                        intptr_t value, intptr_t addend)
+{
+    tcg_debug_assert(addend =3D=3D 0);
+    switch (type) {
+    case R_RISCV_BRANCH:
+        reloc_sbimm12(code_ptr, (tcg_insn_unit *)value);
+        break;
+    case R_RISCV_JAL:
+        reloc_jimm20(code_ptr, (tcg_insn_unit *)value);
+        break;
+    case R_RISCV_CALL:
+        reloc_call(code_ptr, (tcg_insn_unit *)value);
+        break;
+    default:
+        tcg_abort();
+    }
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
--=20
2.19.1


