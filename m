Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVQnA-0002IO-D5
	for mharc-qemu-riscv@gnu.org; Fri, 07 Dec 2018 19:48:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQn5-0001vo-Ck
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:48:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQn1-0000wu-RZ
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:48:19 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41940)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQmt-0000u8-9c; Fri, 07 Dec 2018 19:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544230088; x=1575766088;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=GHIXbk3XEx0AyyJwjkwyHEaVBo9XdjNzQrw2ziZfXys=;
	b=Q4mgqtxVfpl/0YbsUMX/3GLO0R0zRphwsmFavluqhwf+2HAU0rw8WKi5
	YbNF7V9AcsMVztp5OmmesS9KdVvrrXou5FGEJt1y2joG5RCnpNQ/h40OQ
	/pvRMQGZO6TesyCqugYD9ZtqZU9n8OhGBaWK1bSvV5aM9pH9r/CQ2y9G5
	7RZ871ZVUnQazLGq8w7px7hAmSMdASlO5p9/MrcXL6P9o0CK5YzFzr8iu
	7oQPyWBMoP7cqg5+Ak2q1N2P9RS7C2ao4/wsKAO1EUmPRSIM0uDibIiQQ
	ilX3honKucYzYnIZhpJFE4tlvJBuyudSz0/IVbCJq0Fh9LXG5cV9FNoOc w==;
X-IronPort-AV: E=Sophos;i="5.56,328,1539619200"; d="scan'208";a="97343780"
Received: from mail-sn1nam01lp2056.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.56])
	by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 08:48:07 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=c1YcWlkggEHdAwd875KOzdfaSRyT+e0qNS5YHVAUh1I=;
	b=hkD0dpmzJaWwb/bmVr6Q4VKzhjblZbEU4fJvozUbuSjhekZmnXy8hkIIgA7XiRlUfGsBJNB818693O28givPm6lL5Di+QihXc5U7j8O1DCdzD8G6sqyfzx9Vryim8CavWJTHltODj4uT6VjyCYNHTsaq3MzrPRncvohb4Ya0f+o=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0304.namprd04.prod.outlook.com (10.169.202.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.20; Sat, 8 Dec 2018 00:48:04 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1404.021;
	Sat, 8 Dec 2018 00:48:04 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v3 12/24] riscv: tcg-target: Add the mov and movi
	instruction
Thread-Index: AQHUjo+t6PW2QHlG0Eqx6Qtw1zUtIQ==
Date: Sat, 8 Dec 2018 00:48:04 +0000
Message-ID: <8370208ff307f7dcbf6b44913ae0556cb2fe596c.1544229872.git.alistair.francis@wdc.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544229872.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0079.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::20) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0304;
	6:pZBoShZu8fZgqB75t/wlLZHO3gmvI7aciNi0M5zFKbqTX0rJQo6IOCAKA7C0YRwNuDiG6VFXFERQFST23OB0Y8ju1ddgojI+tVciBHQALehOCKKah6r1NrJK7assFsdqhxe77hj2YHNUE59UhjZTZun0EJUenp35akghVFuXEUf+QxOGo0Wxw1+vJrYCMHOpi2g82LMLKbYZflw2UT9C1xZnP62FK5zmApcYOfT/u9fA4vXz4C3G/jVHXSSM3BkxnvEjWCBbp3vNtM6HT+Ui6g/7jQjHZvA1HGPPa0vvO6Okul1v8ia74jlu5JVCQVSBrfQRfDeKDP8FI5CQ9MUPQ0ps6oF0KnCoRDzkOYJfzqLmwK2KS5+qxZQIv4YW+e/8SF6Bde05s2OTR5oKHVTb/rYmTPivFlMLVmh1L/gRDgqFgois7pqoTTxUYgxrmnGR1uo3BtXHIdSQNIS4Wob6GQ==;
	5:tJjjE83FqKtBFUo8yG73KpJyDCCOLVtMGHp8DG1gXmqE3bnGd5pWIjDpQV5cV7S9vosjGcjbeRWzqFWmq6+0Akt9FKrfk72vem2Y82B8tajwWvP3md+vycn452K8ZwktWApODepjwqK/u9IePYQqCWcRdEo1+yFMjxrHkfO7IzQ=;
	7:tJQebl+B+g0OMgB3kuNnFWko6yF4+XbWH0f7xhx4hUqn5KvaGbZZlU0CGh9SK+QZ4xBz27hDLAgdoUjGD668Atr5U/teei05jRBTYadPs9WfSu6ONwfIXGbQASdY/9YcmVPIRnqsa2ZylKeX4sidLw==
x-ms-office365-filtering-correlation-id: 13b565e8-6af1-4529-d9d8-08d65ca6cfd4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0304; 
x-ms-traffictypediagnostic: MWHPR04MB0304:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB03041868DE613DE92F67425A90AB0@MWHPR04MB0304.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: QoGz/uUXZaGxqo3o0RHOSkKD535IH8bx07wxQpZDfyRPuIHAeByq5SyksIzSNwSV0ims/Mc0YiWzY5PhAI7OCdbeSOz85yDu4jf19wGX7dEmzJ9VL//C0sdrk/rU5OwIZXJQZLTyAAFPypxCMx19ZL0BLzHnqxfkuo9uE2LhETw4ZgCfSAOcLUG4qsEktyzB7Ay2bA1WItEeUQmiZlfZjO+pqFHfisyY+BUVTog+q2aL09xvctYYP914gAvOq1jpkqgjX5bJCbNgQ4YSj66m2G9b3bg1l0f8AeFm/eKc354oEPgUWwJc++u6803gZlfln/3yqx7vMRnhuJVbXzBsdQg0zDBk9enwHNF7h+FQLV8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b565e8-6af1-4529-d9d8-08d65ca6cfd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 00:48:04.4576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0304
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v3 12/24] riscv: tcg-target: Add the mov and movi
 instruction
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
X-List-Received-Date: Sat, 08 Dec 2018 00:48:23 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 85 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 05e85805d2..29275d6ac9 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -497,3 +497,88 @@ static void patch_reloc(tcg_insn_unit *code_ptr, int t=
ype,
         tcg_abort();
     }
 }
+
+/*
+ * TCG intrinsics
+ */
+
+static void tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg ar=
g)
+{
+    if (ret =3D=3D arg) {
+        return;
+    }
+    switch (type) {
+    case TCG_TYPE_I32:
+    case TCG_TYPE_I64:
+        tcg_out_opc_imm(s, OPC_ADDI, ret, arg, 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
+                         tcg_target_long val)
+{
+    tcg_target_long lo, hi, tmp;
+    int shift;
+
+    if (TCG_TARGET_REG_BITS =3D=3D 64 && type =3D=3D TCG_TYPE_I32) {
+        val =3D (int32_t)val;
+    }
+
+    lo =3D sextreg(val, 0, 12);
+    if (val =3D=3D lo) {
+        tcg_out_opc_imm(s, OPC_ADDI, rd, TCG_REG_ZERO, lo);
+        return;
+    }
+
+    hi =3D val - lo;
+    if (TCG_TARGET_REG_BITS =3D=3D 32 || val =3D=3D (int32_t)val) {
+        tcg_out_opc_upper(s, OPC_LUI, rd, hi);
+        if (lo !=3D 0) {
+            tcg_out_opc_imm(s, OPC_ADDIW, rd, rd, lo);
+        }
+        return;
+    }
+
+    /* We can only be here if TCG_TARGET_REG_BITS !=3D 32 */
+    tmp =3D tcg_pcrel_diff(s, (void *)val);
+    if (tmp =3D=3D (int32_t)tmp) {
+        tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
+        tcg_out_opc_imm(s, OPC_ADDI, rd, rd, 0);
+        reloc_call(s->code_ptr - 2, (tcg_insn_unit *)val);
+        return;
+    }
+
+    /* Look for a single 20-bit section.  */
+    shift =3D ctz64(val);
+    tmp =3D val >> shift;
+    if (tmp =3D=3D sextreg(tmp, 0, 20)) {
+        tcg_out_opc_upper(s, OPC_LUI, rd, tmp << 12);
+        if (shift > 12) {
+            tcg_out_opc_imm(s, OPC_SLLI, rd, rd, shift - 12);
+        } else {
+            tcg_out_opc_imm(s, OPC_SRAI, rd, rd, 12 - shift);
+        }
+        return;
+    }
+
+    /* Look for a few high zero bits, with lots of bits set in the middle.=
  */
+    shift =3D clz64(val);
+    tmp =3D val << shift;
+    if (tmp =3D=3D sextreg(tmp, 12, 20) << 12) {
+        tcg_out_opc_upper(s, OPC_LUI, rd, tmp);
+        tcg_out_opc_imm(s, OPC_SRLI, rd, rd, shift);
+        return;
+    } else if (tmp =3D=3D sextreg(tmp, 0, 12)) {
+        tcg_out_opc_imm(s, OPC_ADDI, rd, TCG_REG_ZERO, tmp);
+        tcg_out_opc_imm(s, OPC_SRLI, rd, rd, shift);
+        return;
+    }
+
+    /* Drop into the constant pool.  */
+    new_pool_label(s, val, R_RISCV_CALL, s->code_ptr, 0);
+    tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
+    tcg_out_opc_imm(s, OPC_LD, rd, rd, 0);
+}
--=20
2.19.1


