Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkao-00058M-HX
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:08:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkaj-00053A-Ha
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:08:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkai-0004Eh-Ll
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:08:21 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:22255)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkae-0004CB-4f; Tue, 27 Nov 2018 16:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352897; x=1574888897;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=rsKWTZTHuoukCFTBN1vOEzRx8KiTPQL+tMziNr6ucFY=;
	b=O4MfQmZWCQ07yvmO2Nqq10oHA4xtLxhS0v/WnXU/op0fMvhfuTlSi4fz
	q68K7a4x+3mjEpgUN+ZMhQQvaADs3FwFypLOCemhTeLVU02v1/EiEFPqM
	MtbJYEwy4cy3imWJzHOmADDij07vJ/XQhLzliLeFDJLd209yIQo1s4Vsr
	REC2CgaF86qroi/kFddvwZbZKAhD286pxq72jM/vvF1mTZhPK9q9cTVYc
	+EikGNRtDpqRyqP/G18StNU9l7THMwgrqviwYRh9Q5wiCTe2k7WNLYXNi
	YbYImrJDi9InitTs/eTqWZfB59Aq6FZl/X/cRwJgYVcsojl6OVHIazUO3 g==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="96433626"
Received: from mail-sn1nam01lp0116.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([207.46.163.116])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:08:10 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=48HaPkXlLxvHRTjV679saDRjMSXKF4GIL+lZYJLe7/0=;
	b=MAFIco0XIxapWhwjb+6DS99na9Eu7Oh4Gkhbw/4hQjtkbIiLq7LezVtFX6MuwE9o9ATYlKjwOqnEgsxz3FnQ88FQMFPhYIqFdAQZHfpgLqCp6HFhNO/fePdHbh/hNfLRHCW9v41pYIRNPrmG46fJN/6roErcRQN0aAkyuNhpR9U=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0993.namprd04.prod.outlook.com (10.174.250.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.14; Tue, 27 Nov 2018 21:08:07 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:08:07 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 10/24] riscv: tcg-target: Add the relocation functions
Thread-Index: AQHUhpVLQbzCo17JnEenYhr1xg+3Dg==
Date: Tue, 27 Nov 2018 21:08:07 +0000
Message-ID: <6e20c8377a588dcb44a1d8ef9efc07499663f59e.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0023.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::36) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0993;
	6:yvbQtiBfaGkUE4m5r6Eh90WKVSD+ilA/Fm9CQNvJG14ziOqooGwRq4iD1UgSPm1/e2oh84P6LX0gRnDAGUwkqDS4ATsOjdDfnL8GVwi+zFxXYgK5a46bqT3Tt8rCB/FfT/7Y3/bn9XZNvE+LGvxMJ1wBOeUbbQM9zkqdAzexr7Kb3cjIWZxuLZ4XBUPgxWqV96kkRrhPra4A6fQ1bXwGNjUByVw2uYESADO69Y+tsX7y0o0N3kJg6fBkgU9QjYKhzPJ63PwxndTtcHR1bMKmRas33R2sbqO1NGyOdKDOxaGIKH49IeRoiFCdgQuXTpXwoHletLuVAI9RCrW3RnhAx7p+EhUeakKvgp29S325GSYQXdSZe5TL1m574f4YAuqBW7oURiUbdZPn44Wg8g5cHGL4dIve5VHXBf+sWyeHmA3dIL6eEjbOnbN6zrlrzskX4hH30wJmwgkWd7CvN1NQIQ==;
	5:hdNVi3aT8z3kbt5NiSL4VBhJ7kuF7OP6+aE5e3dgSCmAWtM1TxBYJ+qNFVNZzF9W+PyCeC9t0zZ0kWuOPrdLBbEXKgG9TYBXz22GXgK1yZ9j5dSEIaX069Kckhs39PiDTwXT7mg106edS/AxihOF5lmUlaH3FpFhaVsIXfod+bQ=;
	7:rDmksfrl89KjtCh3hG+Sdbau1nXYk8d6qxwdUsyuq8UoOFMKcbneS0rbgegtqPATfAGU98E72uPd1xyUeKPoTpXOYxY7qCDy8b6BJ7blwy+bUbBxXP+xlJaiyI5Q0dGFamv6xe7fagGLvx9WNpNlTw==
x-ms-office365-filtering-correlation-id: 75437977-6791-46aa-e546-08d654ac6dda
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0993; 
x-ms-traffictypediagnostic: MWHPR04MB0993:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB09934C24098E890A7EA1346D90D00@MWHPR04MB0993.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231443)(944501410)(52105112)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0993; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0993; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(346002)(396003)(136003)(366004)(189003)(199004)(7736002)(97736004)(305945005)(54906003)(316002)(110136005)(8676002)(50226002)(3846002)(6116002)(81166006)(81156014)(8936002)(6512007)(478600001)(39060400002)(6436002)(72206003)(6486002)(53936002)(105586002)(25786009)(118296001)(106356001)(2501003)(5660300001)(66066001)(4326008)(76176011)(68736007)(486006)(6506007)(476003)(99286004)(386003)(44832011)(26005)(11346002)(446003)(2616005)(14454004)(2906002)(86362001)(186003)(256004)(52116002)(71200400001)(36756003)(71190400001)(102836004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0993;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: QY0fPlyICiaObRpNEDj7qvmoN2jX/MfFAY4KCBx4KyPX+o5UeuMHE6hni9366D/PIqD9VDzbpdKdok/R/5o7Pw8ACsxClS33AS5peVP1Xs01z4DP4YdONVUJhgLSxXEACko1fcpnBzR8Qd+mlRN+ako+FS3vPp/fRO+EE3IWMzOMnaZWkSzRztUJOrm47vuwi+7j142n2qCRiDsYodLnILrQjW3Mk72oo4kiK44xoUzf/wLqPBgOLDv8aP2DyicsGcna4lSsb8bcF7FaosNA2xWsdJoaaKlDpf+yw4OkWYZg9AF4fOMg/7lLwWLtvnT+Eo4LMggnQD5/aRfsvA9WNuRiYewHYMVAikFgHE2AHmY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75437977-6791-46aa-e546-08d654ac6dda
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:08:07.6330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0993
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v2 10/24] riscv: tcg-target: Add the relocation
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
X-List-Received-Date: Tue, 27 Nov 2018 21:08:24 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index ca7ae8939a..9c48679f11 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -383,6 +383,57 @@ static void tcg_out_opc_jump(TCGContext *s, RISCVInsn =
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


