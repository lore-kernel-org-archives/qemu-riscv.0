Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkcp-0006vn-3L
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:10:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkck-0006pt-HC
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:10:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkch-0005g8-6p
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:10:26 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:12818)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkca-0005c5-DG; Tue, 27 Nov 2018 16:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543353017; x=1574889017;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=tM9S6FFamfvguqaAqsSCQlJpZ7RJ5gKQRVMGDPvJ4dc=;
	b=qVrgG1o95afM7+hkREoaA7EpxQu0J+Bzldn9GfHdcXx2+dNAGtkXOBwz
	JXT1kzzNAqbYrpHzB+bSrpqQKobh8445haiLT4uxrCl1SKU1/xllwYOyQ
	oqdGDkjBjJc84t9+kaDwf+eGuKbx+wIzhoJBu3CXCMajII0Ve0gKBTZUz
	XmKFYnscftvEOb9XezfYzs4nIKjjora4sN7V3vH3oihi498UrJPuh8uDu
	mbBK4tBnJNHJXnlkMmxR3ZH/pFD2OF+SBZVv0G5V6DLgBysk/LW0KN0RL
	xV+uxLfyzMrCASY+Vuds20SqLAYDm9WTFCODlDvfIaJ2KjivHC1XIgz1S g==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="95245123"
Received: from mail-cys01nam02lp0056.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.56])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:10:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JnH/rIm/y+JPKn0AaeUFk3MlciNvUPdvDG9Sl/8lHjw=;
	b=KsHeHm/lR+geU3ga0XRjEahiC+NeUyzDE2WY2X07iA+GzH1GKeUoon+nla9/KvDVSTd1THd53UNNxOi1ptEShweUWrcXCRwhUxBsFBqk8KqxfXGnharrgkJ6r7lvS9eIMwp6TQbdbWPZXe8aa8JOdLcwRdLJ90mG5SjMAobEUng=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0639.namprd04.prod.outlook.com (10.172.166.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.15; Tue, 27 Nov 2018 21:10:14 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:10:14 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 24/24] WIP: Try to patch longer branches
Thread-Index: AQHUhpWWy3SawqbdpkanLuroTrMpKg==
Date: Tue, 27 Nov 2018 21:10:14 +0000
Message-ID: <287a8dbdfa046fc269b0f238076f25157733c66a.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0083.namprd11.prod.outlook.com
	(2603:10b6:a03:f4::24) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0639;
	6:s+b1uNm6qHumWHJG8sJgZzsKI1HEZRiWyIFipXIak4/K4B3cl12DeMLyglXhRlwRqHv1IP0a8YTXK0gqcGMq5uso+TpULMG/DwgGflNmgWgMUZtfymt7SdfZIw0jga8Y7D+AolHhwT8QmuzeuqF9SnU9gP7NavJjWkKgmZD5Y0g0yLcGlN12I7EASVnDZkcED3g8rPkIuZEQJFJyMMjLDXbfhEX8EsUUTfHGb/kF2s1MFR8mGuunLp5BrNjb57sVPOr9Rlv/IFslhFtIblxvHd2JW9NYmvYfJCCV5b+m9ZVq9AvM2o0zn/DMkXUCTTEomvol2meCgDECpGoziIKMrIYxgy8fFZzPqtJOd1av5lxHq4ikTAxxUQFu+OUetScQjUni8P1ALk8xIzvSyxqwqVXjeRtVp9AA8BmsK7ObHRuSN+egFkBcCV33fIdM3qopLoq50VdOYqEzzPlTUSZjkA==;
	5:prYTplPMNFQ6lsacTvZ8wxrh21kVUIQlbaxO0fsLK7a0JVpc9vTTDm4lcoqoyD5+cYrr5jnBbvASDNHgyYuC/7zE14jBLlrkZHDNw79rQPva3/V7LybyKD4M6yIt62Rbt0JpDhT6UcyYTtmodJ8jqR64JTaiol6cbAFCfYFL+0M=;
	7:Ui5P+XqSfK1a3CKE6HNjfjkRd5jZf3Q2AGpBla1Ung1QJeU17Yvo+z0yUI5a4u89xNJISsAVoJpwDR18fGXyW2/tIiPSsjbFf6FkNZXOez2SJiZ5aXMi4pQv+BdQKJPe0yRKodVnq7wm4L3sK7/biA==
x-ms-office365-filtering-correlation-id: a6d32fb0-ea16-4a8f-980a-08d654acb92e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0639; 
x-ms-traffictypediagnostic: MWHPR04MB0639:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB06397B573C4BEE54CCD8F9FE90D00@MWHPR04MB0639.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231443)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0639; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0639; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(376002)(346002)(396003)(366004)(199004)(189003)(86362001)(6436002)(53936002)(97736004)(6512007)(2906002)(66066001)(8676002)(8936002)(81166006)(81156014)(50226002)(54906003)(110136005)(5660300001)(316002)(575784001)(118296001)(7736002)(2501003)(6486002)(68736007)(305945005)(36756003)(478600001)(72206003)(71190400001)(71200400001)(52116002)(76176011)(6116002)(386003)(6506007)(102836004)(44832011)(2616005)(476003)(3846002)(26005)(186003)(486006)(14454004)(99286004)(446003)(25786009)(106356001)(39060400002)(105586002)(256004)(11346002)(4326008)(148743002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0639;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: 784eICLysSv4z5tFQXSwePq2POgu8CmP3iAaM8ZCnXcHmE23G2ZmrS4aIwRmV41GyJkPbp7lfgyjK8tkPpgOVgHPvpjk8F4ATiSocaPqXKzqEZjnHonmePa2v02BHPD0qM674bPsfqxSseW10EH6ZrMg/Vyo04rMapl/Ve9GSJVMqp7cUVvhYgKI0xJWZKSK/tQ+hkpmHwyjjbjsioN38nmc806K8DbiGI4RB3IrQjDvrrwcWz5zwsrzenwocm0K+RS0MGjoiun49ZTWPsavDkRD/T/4CEB7YT5rqYRKGL8e+R4RV87FGBereeSkJwaRc4hilUMw6fGymifrMjDor5eJmCyPwFc2zynUyKNF830=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d32fb0-ea16-4a8f-980a-08d654acb92e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:10:14.0106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0639
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [RFC v2 24/24] WIP: Try to patch longer branches
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
X-List-Received-Date: Tue, 27 Nov 2018 21:10:30 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tcg/riscv/tcg-target.inc.c | 44 +++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index b8e9c0e126..cf1680935a 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -418,10 +418,37 @@ static void reloc_call(tcg_insn_unit *code_ptr, tcg_i=
nsn_unit *target)
 static void patch_reloc(tcg_insn_unit *code_ptr, int type,
                         intptr_t value, intptr_t addend)
 {
+    uint32_t insn =3D *code_ptr;
+    intptr_t diff;
+    bool short_jmp;
+
     tcg_debug_assert(addend =3D=3D 0);
+
     switch (type) {
     case R_RISCV_BRANCH:
-        reloc_sbimm12(code_ptr, (tcg_insn_unit *)value);
+        diff =3D value - (uintptr_t)code_ptr;
+#if TCG_TARGET_REG_BITS =3D=3D 64
+        short_jmp =3D diff =3D=3D sextract64(diff, 0, 12);
+#else
+        short_jmp =3D diff =3D=3D sextract32(diff, 0, 12);
+#endif
+        if (short_jmp) {
+            reloc_sbimm12(code_ptr, (tcg_insn_unit *)value);
+        } else {
+            /* Invert the condition */
+            insn =3D insn ^ (1 << 12);
+            /* Clear the offset */
+            insn &=3D 0xFFF;
+            /* Set the offset to the PC + 8 */
+            insn |=3D ((unsigned int)(code_ptr + 8)) << 12;
+
+            /* Move forward */
+            code_ptr++;
+            insn =3D *code_ptr;
+
+            /* Overwrite the NOP with jal x0,value */
+            insn =3D encode_uj(OPC_JAL, TCG_REG_ZERO, value);
+        }
         break;
     case R_RISCV_JAL:
         reloc_jimm20(code_ptr, (tcg_insn_unit *)value);
@@ -677,16 +704,27 @@ static void tcg_out_brcond(TCGContext *s, TCGCond con=
d, TCGReg arg1,
                            TCGReg arg2, TCGLabel *l)
 {
     RISCVInsn op =3D tcg_brcond_to_riscv[cond].op;
+    intptr_t diff;
     bool swap =3D tcg_brcond_to_riscv[cond].swap;
+    bool short_jmp;
+
+    tcg_debug_assert(op !=3D 0);
=20
     tcg_out_opc_branch(s, op, swap ? arg2 : arg1, swap ? arg1 : arg2, 0);
=20
-    tcg_debug_assert(op !=3D 0);
+    diff =3D l->u.value_ptr - (uintptr_t)s->code_gen_ptr;
+#if TCG_TARGET_REG_BITS =3D=3D 64
+    short_jmp =3D diff =3D=3D sextract64(diff, 0, 12);
+#else
+    short_jmp =3D diff =3D=3D sextract32(diff, 0, 12);
+#endif
=20
-    if (l->has_value) {
+    if (l->has_value && short_jmp) {
         reloc_sbimm12(s->code_ptr - 1, l->u.value_ptr);
     } else {
         tcg_out_reloc(s, s->code_ptr - 1, R_RISCV_BRANCH, l, 0);
+        /* NOP to allow patching later */
+        tcg_out_opc_imm(s, OPC_ADDI, TCG_REG_ZERO, TCG_REG_ZERO, 0);
     }
 }
=20
--=20
2.19.1


