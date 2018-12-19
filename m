Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhMi-0001zh-Os
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:18:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhMc-0001xF-Th
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:18:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhMa-0000r0-HY
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:18:38 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:23342)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhMO-0000i9-IY; Wed, 19 Dec 2018 14:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545247104; x=1576783104;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=7Tj8Pt3ZF5oK4E488kmlAjVWmbuD4GkhbLGcjXlvt6k=;
	b=nGvuEjrau99vip6IV9IDxpM/z0lRShdqe6ArxhkiD50Ul5blAVUIXIsM
	v0F7vQ8hpbPp+tb4VSL67m66yZamqTgmGbABWWpZYlnNeh/oQlazbYJGx
	+5Qs/YShi6Z5bkpqTpiQEqLuq3DD871xi8L/0eHWhgJ+d7vuqB/uZELoB
	S3DCrAET9lvfKST32e48qFw0qej4lMEYB7Hg/XSoHY4AcngHtuMp7+xwY
	Y77G9hOG2T6N9eVbJDnmhcK8QBMcnO3OnOXibLsrIIL3KKQUyp/T4tG8Y
	Nzo3KiJaULUiA6FOMaYLm8Lemc3VW36OvigjeKtdC2LCfDQhIQZg6DJNP g==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="201718412"
Received: from mail-sn1nam04lp2055.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.55])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:18:07 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Vq2wSdPckp+brXmxestLcMZ5rJimNTVcdfgfkyNolgc=;
	b=UsUWJs6Eg3gIVhXB4EVTh9pgP4htc2zu+moh7wcbWgqa8CynRlmPJQqVMEXkU3ICztP489ytvV6BA27OGSvOPyKDyXY8Oabe9RbKLEzVHJZZZPCcb3AcaJS42Qiv6ys3WuwkHQJX8NMmIr+hhwbOCZ0Bf8A7qZMP11LqzcVy9TM=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0718.namprd04.prod.outlook.com (10.172.167.143) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.22; Wed, 19 Dec 2018 19:18:06 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:18:06 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 10/23] riscv: tcg-target: Add the relocation functions
Thread-Index: AQHUl8+SixBcxaJmw06d/BdZGnY2tw==
Date: Wed, 19 Dec 2018 19:18:06 +0000
Message-ID: <6ac4f4b0d5ea93cb0ee9a3b8b47ee9f7b3711494.1545246859.git.alistair.francis@wdc.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0061.namprd05.prod.outlook.com
	(2603:10b6:a03:74::38) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0718;
	6:Yqsd1kn7J/LdGJRvtj78IZuQ8EkHGr+t+uvsnz6iRgARPCOb7fme2FvX4u46sYxmdj6fV3rN0EhlY7jKaQozTlsldJf1Sn7QIGXfnN06pRsfUZibmnzg4rAvhXim/caD4868zgH1uOa9NFCv0xLJrKzVI/ZjSIjJaBOnY0lUuzE0xMLjLdPEXuF0AKg+j/O5kz+Ia0UIRwhv8DiCQsJgQmZJaFK6rKEgp4Ii91YKVBsmPL7p9GAQn7AZ6K8w5NKf2JNeEZ2OQhkFSW+pfVEJARQkR4RXl5t1vgFpNoAWsR8oicm/9X7OVG4Dys+cPdV0A8pK+0r0chuLq0Cqvx+ge5ISmw6dzMzFgGU2cAowEhijeovNlGGVRdK0/8HjsRaKtPi6LaNDktRWx7en2rDLieLoHRsK33kjG4XZANPIjnWhuwzWCtG5hKVFmZbhCMGlJlq/sZ7Fd/OBaF+9OK8MNQ==;
	5:sU9rrnWlVd4IKkFr3R+2utZClSVY679dk2KL7p2LB5yuLda/rnjTP4aEXdrr2fa37BkZG+tqCDkja2zBZ3BaoP07ROkbwN690l3DBvyxDEKFdkWX8ajUrCRPS9BgSgnGBdiMCxptf+biQgHnsGGUb/Bi49uOwZouzJCqfeAG1Jk=;
	7:4/nepNEYx85ge7NjISHIEFbU8RvPm1reDc//+TtCmrptcueSKiunbZhUqvI/Fgr1rLt/rPn60uy3oreLXHEn5v+WGZvdy+6LeB3zBpD3QnER3x+zCGYsulXTSBoJiCxtmmi9HeKquIy4jP8ffjZ1Hw==
x-ms-office365-filtering-correlation-id: 5aff036d-6eae-4336-3a21-08d665e6b455
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0718; 
x-ms-traffictypediagnostic: MWHPR04MB0718:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB071802FCADD8EE1BB92142C890BE0@MWHPR04MB0718.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(3231475)(944501520)(52105112)(93006095)(93001095)(10201501046)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0718; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0718; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(366004)(39860400002)(396003)(136003)(189003)(199004)(256004)(2906002)(11346002)(7736002)(105586002)(106356001)(478600001)(26005)(39060400002)(305945005)(446003)(99286004)(2616005)(316002)(110136005)(81166006)(8936002)(486006)(3846002)(6116002)(5660300001)(4326008)(81156014)(97736004)(186003)(54906003)(14454004)(476003)(25786009)(44832011)(50226002)(52116002)(8676002)(66066001)(6512007)(386003)(76176011)(6506007)(6486002)(53936002)(68736007)(118296001)(2501003)(86362001)(72206003)(102836004)(36756003)(6436002)(71190400001)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0718;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: 715eP1yj85diGFpL7gkJN97QFdQCb4I5DS7/0/6Mm7Ue10kt+059OcR1jM7cL0GMBb4EpBcUEwNfddcU6uQrZDFtfXi7aVIUwT1zRe66Wmafe65RDxGUFHQMuMWClVPBgbrrfk+XIHn18EGFky7S+JkpqXttlYGGRthRi0dMJXB68tHaUmpCwfAs6AhVy6YTO1zgMyigUIKVB5LAyOPiGgMtYTLNw+pVH9hPSwjEfv62ng+ffgKHFJ4i/vBERjd6Tvw47mAsFsAWASTENjtNqaI8uPR5rLwBjy0MCmCkfpd3WAmA0U1zfB5e9QVlZP1o
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aff036d-6eae-4336-3a21-08d665e6b455
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:18:06.4363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0718
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH v2 10/23] riscv: tcg-target: Add the relocation
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
X-List-Received-Date: Wed, 19 Dec 2018 19:18:43 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 88 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index d198cfd5f7..a26744052f 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -422,3 +422,91 @@ static void tcg_out_nop_fill(tcg_insn_unit *p, int cou=
nt)
         p[i] =3D encode_i(OPC_ADDI, TCG_REG_ZERO, TCG_REG_ZERO, 0);
     }
 }
+
+/*
+ * Relocations
+ */
+
+static bool reloc_sbimm12(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+{
+    intptr_t offset =3D (intptr_t)target - (intptr_t)code_ptr;
+
+    if (offset =3D=3D sextreg(offset, 1, 12) << 1) {
+        code_ptr[0] |=3D encode_sbimm12(offset);
+        return true;
+    }
+
+    return false;
+}
+
+static bool reloc_jimm20(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+{
+    intptr_t offset =3D (intptr_t)target - (intptr_t)code_ptr;
+
+    if (offset =3D=3D sextreg(offset, 1, 20) << 1) {
+        code_ptr[0] |=3D encode_ujimm20(offset);
+        return true;
+    }
+
+    return false;
+}
+
+static bool reloc_call(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
+{
+    intptr_t offset =3D (intptr_t)target - (intptr_t)code_ptr;
+    int32_t lo =3D sextreg(offset, 0, 12);
+    int32_t hi =3D offset - lo;
+
+    if (offset =3D=3D hi + lo) {
+        code_ptr[0] |=3D encode_uimm20(hi);
+        code_ptr[1] |=3D encode_imm12(lo);
+        return true;
+    }
+
+    return false;
+}
+
+static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
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
+            return reloc_sbimm12(code_ptr, (tcg_insn_unit *)value);
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
+
+            return true;
+        }
+        break;
+    case R_RISCV_JAL:
+        return reloc_jimm20(code_ptr, (tcg_insn_unit *)value);
+        break;
+    case R_RISCV_CALL:
+        return reloc_call(code_ptr, (tcg_insn_unit *)value);
+        break;
+    default:
+        tcg_abort();
+    }
+}
--=20
2.19.1


