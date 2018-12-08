Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVQmr-0001BH-39
	for mharc-qemu-riscv@gnu.org; Fri, 07 Dec 2018 19:48:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQml-00016W-Rx
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:48:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQmh-0000pO-Vh
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:47:59 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:52404)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQmZ-0000mp-MX; Fri, 07 Dec 2018 19:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544230081; x=1575766081;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=4kCmf0yuVT1ipSFz/eCq/75FgpnqDLs5RBRVTCwW0/I=;
	b=Ht/jPJZdEm1FmqagUFijjljY90pUJvSeUqAU8nFyfMnuC3cXVEYre54n
	bOFLAUs4XfsNwOXwx52OLxmVP3jYmm2mCQZIpChGC2WpJWOHOgyjD+ytI
	yRA7WCGKiLHLN9fjvRPcL0BPYhPuPLpDGQ8HEFez3vSatLDAENAkdhIUv
	KnpbuzIPiw4hAoyXvob9JHoimTxmfd80PsSZfavo1kPlXYUKQXSRWstMF
	Icqzc7GlntfK0arbVjLZdj2sIDe+XfShfNlA7fmJX06aw9FiVVcD85cZG
	k+ug7dS4uW0tF7uvIcjoq0wVwR6Pj7jlHkBBr+56hHSlKN/QEyXpOGwN0 g==;
X-IronPort-AV: E=Sophos;i="5.56,328,1539619200"; d="scan'208";a="194003447"
Received: from mail-sn1nam04lp2059.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.59])
	by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 08:47:59 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1L5KRbnyMBrHa+dhbL4PUA0DURaVeKMyXRPSoZIDsXE=;
	b=gS8ZK7cJtLVrARhWzmXkcM6v15OFE8WLu1ccMxG2D2HbrXvCA7yI3wEWYrmksD4+w2Lny08zBg3skec6elnn0ur6RkdL63KaGOlShbu3FJZfXJE3lIEVFHAhA44M5TZ1h/n2IP9inmt9r17nIt6H1UW99kEa50Vokv6ovUg6AY4=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB3725.namprd04.prod.outlook.com (10.172.169.8) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.18; Sat, 8 Dec 2018 00:47:44 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1404.021;
	Sat, 8 Dec 2018 00:47:44 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v3 10/24] riscv: tcg-target: Add the instruction emitters
Thread-Index: AQHUjo+hLbAfx7+fKkCPCDFZ+cwTHA==
Date: Sat, 8 Dec 2018 00:47:44 +0000
Message-ID: <ca06c726b208569d1dbea3d25566aea0ed8df47d.1544229872.git.alistair.francis@wdc.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544229872.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0080.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::21) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB3725;
	6:EHtHHu9gttkHCctoICR7KU8wq+3UCHH/jQDOa1/pfZ3vo5wwgHHG77BKvi0qzmVNRKrqjvaX+3Mjzd4PYszad+CO7+Nh0+jkeeHCcODmVKIKPwqrspMIupiRjegofm3jttAxDh8LicEInKCp3KVdf1oLR0tOiSVtkdAYGu92DjslxXV+bi0QYVvx9uNeXG+uKWM+A7qdXctPs+Edwv3Fuq60Cotx4SbNUD2MSU4mCOVaOv3/XS0Uj3/kuHOyBX18I7dslsZbr/6NlK6HqD5llwHBCbMURtHud9CkZCmjyls8BkKSJcz/AZBLao2H+0LnH+x47/5n9hqhIvN104XqbZOqTE2OfyqouSaSY3pva7vNkiVmhihI5XhE72As8ITJaztS75iE8AKKSBX2r/bSIxhXyFW4AgS8KW8DvqNf6jBJcj6aAn7ETata3YmivtHgTOl/6OeiJr5Kd9FWKXd9qA==;
	5:mdt3m6MRNtE0kglJ+ZPu9s+L+dPYd0kA7RHv7CxmKxC5NGhtRIch/7bcH9g2CC5W5Tlwewk6UvzjuUMiOu1W1+PWowk4Fs1oFc3H01hEBNxvcSFLvndXw4RniQqEitzg0t4+eytyfMoeuijOBSKsR1UvUmPk6IH51HPgCkI5Uro=;
	7:f92SG1VAgCMe0gYwdgjdjweZrEX0G+gSFI5mk3vh/1I2HeMyS5tOCR5TtHHWd6koQFJEpHeBfi6Pe9NCg4NlwIXTcI9WNq+/MTTyN7O/5uOiPbFMToEzz1U66VvoycrONi/mWrqu8U28e6MKb9xtQQ==
x-ms-office365-filtering-correlation-id: a8190dcb-ee81-4e13-7a19-08d65ca6c431
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB3725; 
x-ms-traffictypediagnostic: MWHPR04MB3725:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB3725AA4BFC7A9096CF248A9390AB0@MWHPR04MB3725.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB3725; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB3725; 
x-forefront-prvs: 0880FB6EC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(366004)(346002)(136003)(39860400002)(396003)(189003)(199004)(68736007)(476003)(53936002)(71200400001)(8676002)(71190400001)(11346002)(44832011)(446003)(2616005)(106356001)(486006)(4326008)(66066001)(6512007)(39060400002)(5660300001)(86362001)(81156014)(118296001)(81166006)(386003)(2906002)(8936002)(6506007)(14454004)(99286004)(3846002)(52116002)(478600001)(6116002)(25786009)(72206003)(305945005)(97736004)(6436002)(6486002)(76176011)(26005)(7736002)(186003)(36756003)(110136005)(105586002)(2501003)(50226002)(102836004)(54906003)(316002)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB3725;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: 5sAxfXETaJXnjYHiB5qa6L75JpOqe+S2dZ/Rt2AWqOXXbYU3WgnviLB0cdQ32xi3Q/3qzbobJ+5qlX93iKSPYr5xbVPcE496o6ukHizSE3AdsI5IEJXaQahOWF9SqPFm1ffKu6d2eVJSZ44JxSp+Hvd/mK2eZLGLqynObPsWcZ6cKhQ7HXzcGmm73ZTgNGzgNjixrX3QsWZDt2cWm28Owoll+Mi7+zBhaLKWKyhM6AKdqv+BKzFiX1YWZ6vMDJ+sCDxErNYnP6PtJ5nmu2wqh4pQ3EifQZ+r6lmNLBCJ2e4zZmXjNs/RkLguoFwMTIrRL8HGyYl2Kz92tp754VTEFFMB7hzMyQ3uVQdJaSPVY0Y=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8190dcb-ee81-4e13-7a19-08d65ca6c431
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 00:47:44.7899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB3725
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [RFC v3 10/24] riscv: tcg-target: Add the instruction
 emitters
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
X-List-Received-Date: Sat, 08 Dec 2018 00:48:03 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index c385ff68ae..cfcab9c716 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -374,3 +374,51 @@ static int32_t encode_uj(RISCVInsn opc, TCGReg rd, uin=
t32_t imm)
 {
     return opc | (rd & 0x1f) << 7 | encode_ujimm20(imm);
 }
+
+/*
+ * RISC-V instruction emitters
+ */
+
+static void tcg_out_opc_reg(TCGContext *s, RISCVInsn opc,
+                            TCGReg rd, TCGReg rs1, TCGReg rs2)
+{
+    tcg_out32(s, encode_r(opc, rd, rs1, rs2));
+}
+
+static void tcg_out_opc_imm(TCGContext *s, RISCVInsn opc,
+                            TCGReg rd, TCGReg rs1, TCGArg imm)
+{
+    tcg_out32(s, encode_i(opc, rd, rs1, imm));
+}
+
+static void tcg_out_opc_store(TCGContext *s, RISCVInsn opc,
+                              TCGReg rs1, TCGReg rs2, uint32_t imm)
+{
+    tcg_out32(s, encode_s(opc, rs1, rs2, imm));
+}
+
+static void tcg_out_opc_branch(TCGContext *s, RISCVInsn opc,
+                               TCGReg rs1, TCGReg rs2, uint32_t imm)
+{
+    tcg_out32(s, encode_sb(opc, rs1, rs2, imm));
+}
+
+static void tcg_out_opc_upper(TCGContext *s, RISCVInsn opc,
+                              TCGReg rd, uint32_t imm)
+{
+    tcg_out32(s, encode_u(opc, rd, imm));
+}
+
+static void tcg_out_opc_jump(TCGContext *s, RISCVInsn opc,
+                             TCGReg rd, uint32_t imm)
+{
+    tcg_out32(s, encode_uj(opc, rd, imm));
+}
+
+static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
+{
+    int i;
+    for (i =3D 0; i < count; ++i) {
+        p[i] =3D encode_i(OPC_ADDI, TCG_REG_ZERO, TCG_REG_ZERO, 0);
+    }
+}
--=20
2.19.1


