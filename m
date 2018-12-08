Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVQn3-0001lT-5X
	for mharc-qemu-riscv@gnu.org; Fri, 07 Dec 2018 19:48:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQmx-0001XW-37
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:48:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQmt-0000uh-H2
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:48:11 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41933)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQml-0000qR-9p; Fri, 07 Dec 2018 19:47:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544230080; x=1575766080;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=Nn3ISBK7kSNc6pvwOhjuBbDe2AQv9dTLiJDJElWkxCU=;
	b=hYOSqqbiqlTx73kufxwCwNNjhwsZ2+RQsyyL0yzEOKNOo3sGO+y0yygb
	saDYmYC72NnWd87CsffmGoc2N9HZYZugILnF1gx4KqA4iP6kbixJwngRe
	Ez/gdto9WGj5+3luGeo4mbIUyYBo2uQl1UYMJBDI88M15H13eAj9cWfdn
	GhFOs4p69Ol0X9QPqZQQ8tQiCUDwcq8akESMCbR0txah4+NbHUPYlnLFa
	REhvaFLKkQr9S788nak8EKsq5Dr8f6gHGDkPBrxLnLl5bUfxuekJFl4Dg
	LXoPdtwlWwtQD+jedYaSsrvBnmhSzI2/AzT4T/KkzYBSAT6WGItWwBpcb Q==;
X-IronPort-AV: E=Sophos;i="5.56,328,1539619200"; d="scan'208";a="97343777"
Received: from mail-sn1nam01lp2052.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.52])
	by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 08:47:58 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=b2klMBFMKEmXbbdBrZJzBUyVqGEm54gBevLbCEkLYp0=;
	b=BP4P1VcAbWSOC9gwGHnZoTdHI+CsEeZaE4rTnFOLI5CSOm+GfI4bEuSi1V3XYrCKaj4ZUE+KcslL0i1ZddExkLismsb06xQ2eqAPDCc5RWWCgLueQNEn71PBNsKpv1EjeHTHaB9OrGBsfgzVa8ZjmAxKBkOJvlkGG+sWuOmWacg=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0304.namprd04.prod.outlook.com (10.169.202.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.20; Sat, 8 Dec 2018 00:47:54 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1404.021;
	Sat, 8 Dec 2018 00:47:54 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v3 11/24] riscv: tcg-target: Add the relocation functions
Thread-Index: AQHUjo+naaupg6knikKE1XFGtveoNw==
Date: Sat, 8 Dec 2018 00:47:54 +0000
Message-ID: <4b09385f9d320719fe5ed5eb77a7f53581b667e9.1544229872.git.alistair.francis@wdc.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544229872.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0073.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::14) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0304;
	6:6WIRA1sPrm9sIGzzazRyvS6dOSMWpV78EryUEzdYC5dPwtiluL7Kw+sakik8+oKWGwB3CdGdOvWYVwWdhwgzf3J31bat4SIVBIcw1sWFTQXeaH+Y2wyK5erVsplWhbrW6IViktr4gthdcgwiRAmZMp5vs9wOj0S7ax9Itkug9fYWuBkJLaQxGupI7pXz0hQVhyVNVsnnJa0BBpDWHcjynUWVWZfLFqPFlmAgnN+RPodYQEWhOflv/dXGJde2ypoI7g6zVkaF2d1o3qij51W4Bou1kTjnK5r9OxFiWS382TeUtUe+DAmmcFQKJdB9PmYR/I72gFES4qAkQkShgiQ5VFIGLyYXvJk0g9O2cj9iLR5mF1rmUOsum1Jow6DtnMmLNO/C3a1alW5ncEhU/5Du/rCGnHoP7u/X9mrs5qxIPY2vqS4r/tH1CwCkUL/ohV9ftHx0ZY3PNrHHaHx1hUeMTA==;
	5:YNiwHSmQZItQ1P6yaMbAFkysw+cwN+ugeTo6QB6XhrE4oDWZrwI2PgeX48snPmYbVznZ65f0E0p0z1QfvV3CM1FR6Pw1xSlYWHIa6tZqoTeShofuek8eAoX5JUAh5xRQAzW0/qe5hmKcgylR0sWD3Qu+ye/oK3mtTATxBzcS+HI=;
	7:/4MygXYedFfHALzf9gpE8Kqv9XDqL7bWHS00N1htlheCJgXfc9WogMhXaJY1XEwu4DRzu9IcyGMcXDJQQM1J8VQ3qjg0zlWlUoREbBL3k8eHC6KKVpaVI6/I1SgaE8FhEM2LWsmvvNCUCN/NtnUPew==
x-ms-office365-filtering-correlation-id: 23b0852c-897d-4f6d-adee-08d65ca6ca10
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0304; 
x-ms-traffictypediagnostic: MWHPR04MB0304:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB030443CF3CDE59890FB00B5A90AB0@MWHPR04MB0304.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: 6PmUHH8SZJoS6iq77wKN+g1JQqi8gJ4knalPF0PTKBSG8geQtjqG8HIPLGTDqB8WAz5yDo8T3YSNm3CwQKwv6cYlac61jjzZpHR7DEpKVLHCK3xO8/7Sma9zcQzS3ZwkF2pQg18ZK99U8WhJy3gkSuAyX42hgJs1eq2GASUYows6g0RtFLJ+n+CvveoNfQNvcb3+8xgfeIL3oJMOdbql27PVDzaGFtcf3YOaAYU0U+ypJl/N0zfSabGWT6x5q7duORoxNN1vho/1GqUcgFOzI8QK0rnxZpOMinNtsRqnTy1h4iPjepr/2g/1Tqt7AzyPHjKCk7qPjem2q8+N5OH7KyKRxCHhp/xxTN5QUiMt/mY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b0852c-897d-4f6d-adee-08d65ca6ca10
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 00:47:54.7514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0304
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v3 11/24] riscv: tcg-target: Add the relocation
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
X-List-Received-Date: Sat, 08 Dec 2018 00:48:15 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 75 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index cfcab9c716..05e85805d2 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -422,3 +422,78 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int cou=
nt)
         p[i] =3D encode_i(OPC_ADDI, TCG_REG_ZERO, TCG_REG_ZERO, 0);
     }
 }
+
+/*
+ * Relocations
+ */
+
+static void reloc_sbimm12(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+{
+    intptr_t offset =3D (intptr_t)target - (intptr_t)code_ptr;
+    tcg_debug_assert(offset =3D=3D sextreg(offset, 1, 12) << 1);
+
+    code_ptr[0] |=3D encode_sbimm12(offset);
+}
+
+static void reloc_jimm20(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+{
+    intptr_t offset =3D (intptr_t)target - (intptr_t)code_ptr;
+    tcg_debug_assert(offset =3D=3D sextreg(offset, 1, 20) << 1);
+
+    code_ptr[0] |=3D encode_ujimm20(offset);
+}
+
+static void reloc_call(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+{
+    intptr_t offset =3D (intptr_t)target - (intptr_t)code_ptr;
+    int32_t lo =3D sextreg(offset, 0, 12);
+    int32_t hi =3D offset - lo;
+
+    tcg_debug_assert(offset =3D=3D hi + lo);
+
+    code_ptr[0] |=3D encode_uimm20(hi);
+    code_ptr[1] |=3D encode_imm12(lo);
+}
+
+static void patch_reloc(tcg_insn_unit *code_ptr, int type,
+                        intptr_t value, intptr_t addend)
+{
+    uint32_t insn =3D *code_ptr;
+    intptr_t diff;
+    bool short_jmp;
+
+    tcg_debug_assert(addend =3D=3D 0);
+
+    switch (type) {
+    case R_RISCV_BRANCH:
+        diff =3D value - (uintptr_t)code_ptr;
+        short_jmp =3D diff =3D=3D sextreg(diff, 0, 12);
+        if (short_jmp) {
+            reloc_sbimm12(code_ptr, (tcg_insn_unit *)value);
+        } else {
+            /* Invert the condition */
+            insn =3D insn ^ (1 << 12);
+            /* Clear the offset */
+            insn &=3D 0x01fff07f;
+            /* Set the offset to the PC + 8 */
+            insn |=3D encode_sbimm12(8);
+
+            /* Move forward */
+            code_ptr[0] =3D insn;
+
+            /* Overwrite the NOP with jal x0,value */
+            diff =3D value - (uintptr_t)(code_ptr + 1);
+            insn =3D encode_uj(OPC_JAL, TCG_REG_ZERO, diff);
+            code_ptr[1] =3D insn;
+        }
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
--=20
2.19.1


