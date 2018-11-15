Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQEx-0006ha-KB
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:35:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEs-0006ai-GY
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:35:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEp-0004OI-At
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:35:54 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:51936)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQEj-0004DQ-AD; Thu, 15 Nov 2018 17:35:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321346; x=1573857346;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=AOLjCZ1pKpsR3zCpDIHavhJIcfvb+v5y0dLxL2pzpus=;
	b=kZiq/WQcXyNgWqaLp+FLFOh+1Z0UhTONZhPbo+rzZ33uTxZ+cBkYV+T9
	JA0iS69CNpQm8FDpOitv8Cr+ghxHbC+3Rxy9KVScFZdRJszfP8CuVG6np
	Rkg6WhDcMQAFyi0kam42sxXTXgvfWnsjkj5hGAlnTymXVanPOsN9cAET1
	pcTzSxk/E6toEa8sCcVEvxPxhjP45yiIICog1Oy3r3XFA8NDOULtPm0MV
	/CYtQBm0jEIbKygaECgkU1IMyteUwYHC5LLWqTdOzaeIptxfg2R0SUUbq
	2vbTKKZDbyVRmEaeociD5eFKC63teEOnWvPSUzlfDulCSofvcwFYM9aHZ Q==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="99165995"
Received: from mail-cys01nam02lp0050.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.50])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:35:44 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4fDw9mTGC5O73+osINk7IKoou/giQLbA4a44TrLVUoM=;
	b=SE/Fc8rziY32Mh8EufYfY6+bS/AngWN+mcLPqcoVtvk2a7Ozb/7dXdh8aGCMubSqVz+J5ddn18tW1fQ4hNEFpx6Rgq9WmJ/LofdmwJ4Y3tDc/7QthCi4eN9E+BBPDLbcRRpT7679mOuXms0P95IVeYidPczem+J+TZhPSeSt/U0=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0481.namprd04.prod.outlook.com (10.173.48.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.27; Thu, 15 Nov 2018 22:35:42 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:35:42 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 12/23] riscv: tcg-target: Add the mov and movi
	instruction
Thread-Index: AQHUfTOKOmARBjELb0eMR9tXjZs8sQ==
Date: Thu, 15 Nov 2018 22:35:42 +0000
Message-ID: <51aa21df48c5d80484bf396b82d9e3943daf1e0c.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0015.prod.exchangelabs.com (2603:10b6:a02:80::28)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0481;
	6:/kFjbVpp2bCrem9NXMxKWDD7AbrYBvsnkjzWFzjg/nnQYqGdl1FWLqXF+H6ThN8IbIGVshnTTo7CKADmUl4lbYM/4S996WH1/e3EZ6gkYtNyIOtc/RAV4AIDrjVYtLt5sWt8AmfygA3PKzxD4iCf+bGT7UTDyEfH8r+7d4f6BGcV5ORA+TTfXM5c8GpI5fYnuWd/5D4YITu3E+4Dti4FTPywImfDHJW6II68MJ5pOfzPbjMRhK05u4XcENVnd13Re5erz7y/pS3jVr/tGGYI/ihTLgbdWfvNx3Y+S9Wk+htWnwGWIuGD2hRtOQ3ER55iJqy1fKtg2YL9B6urPsB7FWsqlgXLUoHxSACa/bIEpPcZLw6hjPmmoaPIejU5ZZM0Jnx3j1ZVhgjy++5bUnxvEJ2roSztSDykRImATvlFEIHXlyPg6Y2k2+GTsua4p7AgYf7+i19gCGizwhMcrjPwxQ==;
	5:WL4J/4NmlqhZ7Y10yXGjD3KbsJTNX3ekRNKdK1iRhX6XY79Mpvi5Qz/xqPd+TT0db40mCyVsqDm7GkNXFs1KPzM/NjsCm1tTSKl1bWoAoL2m0KUNJeOTyjsfFEpb3pEATi1wxihePb3mVNjzAllnLV0z8dVRZlbGhui1eqpk0Ks=;
	7:dgrx81nSv+pPg46vvAIi9fYSYrmH4JWw5xws9whytwLqDBXet8wbayidfSzJIcYu7HRuvUHfBAWgPIm9BduVD967pTlNmleqALNV5PDfquiLb6fsIhB0RdOoV9WNzi2EA2hnEixwRcoG43q6fnip/A==
x-ms-office365-filtering-correlation-id: 085b3957-1f00-4a66-d38b-08d64b4aad34
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0481; 
x-ms-traffictypediagnostic: MWHPR04MB0481:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0481AFCB46C048955D94592F90DC0@MWHPR04MB0481.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: 9J2hwc3ospTP6vgUxqXjM24ZqLDdwLerrgB4R6D+ZmViY9PBYjAzU3yMhSQ2A/FNf3ybPl85eQJA3xsHK4UcdGlAwDudUU1CeiUvL2zgawb8+5xQW2CgBoSNDayreCQdonTIsCT/jrbWWJwiB1wrF/uEUlxwQ/YYrS4uPgri6b1kygIsd1k9v5eC47wWLAf6fjUKKLfuZ2YTnG2Wyv1KptE4Dht4fRenbtvEjZWmEm8ObemLeuL0WR1n5MRVZVNPIIPS6+bq4tW97+O/Bk3pC1eoDyT/l8PbFKPWXZu7Gaiwbz5pRE3+7ief4Tu/D4R7mtJiCd31vpgoKuJ1pja86JE38IWc3YrAmgtXxCRmYD8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 085b3957-1f00-4a66-d38b-08d64b4aad34
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:35:42.9010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0481
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v1 12/23] riscv: tcg-target: Add the mov and movi
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
X-List-Received-Date: Thu, 15 Nov 2018 22:35:57 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 62 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 475feca906..0e891e24c9 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -422,6 +422,68 @@ static void patch_reloc(tcg_insn_unit *code_ptr, int t=
ype,
     }
 }
=20
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
+    tcg_target_long lo =3D sextract32(val, 0, 12);
+    tcg_target_long hi =3D val - lo;
+
+    RISCVInsn add32_op =3D TCG_TARGET_REG_BITS =3D=3D 64 ? OPC_ADDIW : OPC=
_ADDI;
+
+#if TCG_TARGET_REG_BITS =3D=3D 64
+    ptrdiff_t offset =3D tcg_pcrel_diff(s, (void *)val);
+#endif
+
+    if (val =3D=3D lo) {
+        tcg_out_opc_imm(s, OPC_ADDI, rd, TCG_REG_ZERO, val);
+    } else if (val && !(val & (val - 1))) {
+        /* power of 2 */
+        tcg_out_opc_imm(s, OPC_ADDI, rd, TCG_REG_ZERO, 1);
+        tcg_out_opc_imm(s, OPC_SLLI, rd, rd, ctz64(val));
+    } else if (TCG_TARGET_REG_BITS =3D=3D 64 &&
+               !(val >> 31 =3D=3D 0 || val >> 31 =3D=3D -1)) {
+        int shift =3D 12 + ctz64(hi >> 12);
+        hi >>=3D shift;
+        tcg_out_movi(s, type, rd, hi);
+        tcg_out_opc_imm(s, OPC_SLLI, rd, rd, shift);
+        if (lo !=3D 0) {
+            tcg_out_opc_imm(s, OPC_ADDI, rd, rd, lo);
+        }
+#if TCG_TARGET_REG_BITS =3D=3D 64
+    } else if (offset =3D=3D sextract32(offset, 1, 31) << 1) {
+        tcg_out_opc_upper(s, OPC_AUIPC, rd, 0);
+        tcg_out_opc_imm(s, OPC_ADDI, rd, rd, 0);
+        reloc_call(s->code_ptr - 2, (tcg_insn_unit *)val);
+#endif
+    } else {
+        if (hi !=3D 0) {
+            tcg_out_opc_upper(s, OPC_LUI, rd, hi);
+        }
+        if (lo !=3D 0) {
+            tcg_out_opc_imm(s, add32_op, rd, hi =3D=3D 0 ? TCG_REG_ZERO : =
rd, lo);
+        }
+    }
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
--=20
2.19.1


