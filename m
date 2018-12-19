Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhNd-0002oF-W6
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:19:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhNY-0002i6-Fx
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:19:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhNU-0001Px-H0
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:19:36 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:15956)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhNM-0001Kr-Om; Wed, 19 Dec 2018 14:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545247165; x=1576783165;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=ZiQsIsNt6bIQgHxW5/lOS4NmjkW37i6K0M1orBgH8Sw=;
	b=NIg0me9wfESfxtwcnTMx2XEP9SpQ+H/REk92UcKoPu286VBAGnwF4NZ1
	Vquw1UbxluhqxIVHFaXyVqDO/X39/elk25+XN13w4P8t/9IcaM5vbU5R9
	Q1BCV7ZjuI2n2vsOnwv5E3YjK7RFy0s+brX+Sh6Ia/NAqxF0SxHcydscb
	z3HJdTPTeXe63w10Qp9/lGrHuvP3W68OFh1KNr/0JzVxhEp7yIldss4VY
	OTBXnnxKh/GqSK3vj/SzGyf0BrBjJkblZKzYbWzaP9fSAKOJp/nxJBh+w
	tW/PArKafUsLKm8+dBDJbuJLnJsd8607X+PkmsBYneKNAdowHB2xX2SCZ w==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="101923954"
Received: from mail-bn3nam01lp2056.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.56])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:19:22 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PIpJg3WkMCQI5wP5J0nVpdbU3gfCF1LWII+irtnIShU=;
	b=gL+MjKNDN1Vkg1VoXFxreP+mKfcTqWIMHef1O48xz0QFrVqD/AX/Ov7a/xvyog0L0anlcK4fKB4FV03EdYUYfHqqXccZrsYZbFX/ZXQ1yABYTYErSjnNyOZC0PYaZ+a9dchruqNC9FIKXtGejo3Zlag5A9o7e5lQoAzXqSqG+w0=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0832.namprd04.prod.outlook.com (10.172.168.142) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.22; Wed, 19 Dec 2018 19:19:21 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:19:21 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 17/23] riscv: tcg-target: Add direct load and store
	instructions
Thread-Index: AQHUl8++cqezP2gMa0iniEvQV0n3Aw==
Date: Wed, 19 Dec 2018 19:19:20 +0000
Message-ID: <2e047a95c39c007c66cda024c095e29b0ac4c43e.1545246859.git.alistair.francis@wdc.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0069.namprd07.prod.outlook.com
	(2603:10b6:a03:60::46) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0832;
	6:9OC8cF8q4VYLNh1aBdzcxAaHOjYbNmE0iXoZZ5ZagiLnCu9gl773IeqAepqi3d7htCLEY6eunsxEyd4K9GGxtRXeMszFinyArVtwp3ofGsCeK3O3fYMiSv4WmFwlTjT6Sr2yXdQWeUhHX7uRJfHAdVNlQep1mDuRRpeJtC3+NDU5x8QECKj4kmqHoN+lS9ERs8EQZNUTT+WWCNOmyFGoHMIOymeIBA5Qs8ZoHx+as2SXebcfzJlwTKlDAfapiwuxYhe/0V3KS8iLfcgU7TwuSBKvy4rsALelnAu8Tt9ERGOqOn5iOLsaFI72lKrNVJn5HCUH+MTWAZyCn8jhqjdMUzS6HdFVGuG1+e9/NoabqPM6aahrAm4BrgDhQJqtSicaQr0/UaLPQ9HoU5l23aAGkVL0g4knUVy7dRLJKOCWMdluLyeisapLovOFfG7TMLkvsDsieUi54SOuoNgEayaGwA==;
	5:nRVh3iNZlmHtN3CK5oEYSuaBZyqXIdW0YCQZ5e+oxOMVwXscqF6vkNbNmmDTAVjAH2Amm8yLAaT0tbS5cwM5YEc1+7RxFnj4AcroWuRoiOXaSSifVozt9p27zWd9SnHTfSErWRMr8cgFnXPlGeIEftlgSyF041WF7CqGOKStTbw=;
	7:NPTFHyv+3dtXjhJ36qNRCXeeNhaMfGghTqyuxSUBVIsWS2xS3E5SCMDAtTiAll9yU5fz0sI0Qb1b6gjlE4ILsOfxHlI41CRponwypAx+Q7CRrD/D9cuvJ2tQ+6lYOcJDWhpydqtkg+wKJhyyKm2AxQ==
x-ms-office365-filtering-correlation-id: 2638b6f8-e757-45b5-fb7b-08d665e6e0bc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0832; 
x-ms-traffictypediagnostic: MWHPR04MB0832:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0832A5578A435DCB408150E490BE0@MWHPR04MB0832.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(5005020)(6040522)(2401047)(8121501046)(3231475)(944501520)(52105112)(93006095)(93001095)(3002001)(10201501046)(6055026)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0832; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0832; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(39860400002)(366004)(396003)(346002)(136003)(189003)(199004)(6506007)(68736007)(76176011)(386003)(102836004)(476003)(2616005)(44832011)(486006)(97736004)(118296001)(478600001)(316002)(26005)(6346003)(4326008)(110136005)(54906003)(186003)(39060400002)(8676002)(50226002)(81166006)(86362001)(6512007)(52116002)(81156014)(53936002)(71200400001)(99286004)(256004)(71190400001)(8936002)(446003)(11346002)(305945005)(7736002)(106356001)(6486002)(3846002)(6116002)(66066001)(25786009)(5660300001)(2906002)(72206003)(2501003)(14454004)(36756003)(6436002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0832;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-microsoft-antispam-message-info: 6EIRSjlKLX6DlLwHPLExb6a1AYVLBLTI8UjIi072P/SQUOMYcwdww0DfOMH0Rj5P8qAfxSM65HHExoc2jTpgTlUHHz3ztFSrWZEO5Wj2OsVulOJR3fI+LjeaCRbpfgRiBTiMA6UNJYKhIr+YhZ2M6/SSF+I74APeKfRqOYsmhyilRAPZEjI07MJBp4SQb7Vwvsa1yTF8eCE6Hl9X7j8QnUVaWhu+PfxspR+sjQchMJ8+pBFHG67Pn99O8hItYTPQAKtN/KzgjnR08dIPDIyoeWeq/VxHoUcPujnlu/e0/LSTyu2GJsJYzBl+xGlQVFW6
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2638b6f8-e757-45b5-fb7b-08d665e6e0bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:19:20.9491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0832
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v2 17/23] riscv: tcg-target: Add direct load
 and store instructions
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
X-List-Received-Date: Wed, 19 Dec 2018 19:19:40 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 158 +++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 7216bad086..154315787c 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -1151,3 +1151,161 @@ static void tcg_out_qemu_st_slow_path(TCGContext *s=
, TCGLabelQemuLdst *l)
     tcg_out_goto(s, l->raddr);
 }
 #endif /* CONFIG_SOFTMMU */
+
+static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
+                                   TCGReg base, TCGMemOp opc, bool is_64)
+{
+    const TCGMemOp bswap =3D opc & MO_BSWAP;
+
+    /* We don't yet handle byteswapping, assert */
+    g_assert(!bswap);
+
+    switch (opc & (MO_SSIZE)) {
+    case MO_UB:
+        tcg_out_opc_imm(s, OPC_LBU, lo, base, 0);
+        break;
+    case MO_SB:
+        tcg_out_opc_imm(s, OPC_LB, lo, base, 0);
+        break;
+    case MO_UW:
+        tcg_out_opc_imm(s, OPC_LHU, lo, base, 0);
+        break;
+    case MO_SW:
+        tcg_out_opc_imm(s, OPC_LH, lo, base, 0);
+        break;
+    case MO_UL:
+        if (TCG_TARGET_REG_BITS =3D=3D 64 && is_64) {
+            tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
+            break;
+        }
+        /* FALLTHRU */
+    case MO_SL:
+        tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
+        break;
+    case MO_Q:
+        /* Prefer to load from offset 0 first, but allow for overlap.  */
+        if (TCG_TARGET_REG_BITS =3D=3D 64) {
+            tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
+        } else if (lo !=3D base) {
+            tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
+            tcg_out_opc_imm(s, OPC_LW, hi, base, 4);
+        } else {
+            tcg_out_opc_imm(s, OPC_LW, hi, base, 4);
+            tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
+{
+    TCGReg addr_regl, addr_regh __attribute__((unused));
+    TCGReg data_regl, data_regh;
+    TCGMemOpIdx oi;
+    TCGMemOp opc;
+#if defined(CONFIG_SOFTMMU)
+    tcg_insn_unit *label_ptr[1];
+#endif
+    TCGReg base =3D TCG_REG_TMP0;
+
+    data_regl =3D *args++;
+    data_regh =3D (TCG_TARGET_REG_BITS =3D=3D 32 && is_64 ? *args++ : 0);
+    addr_regl =3D *args++;
+    addr_regh =3D (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
+    oi =3D *args++;
+    opc =3D get_memop(oi);
+
+#if defined(CONFIG_SOFTMMU)
+    tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 1);
+    tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+    add_qemu_ldst_label(s, 1, oi,
+                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
+                        data_regl, data_regh, addr_regl, addr_regh,
+                        s->code_ptr, label_ptr);
+#else
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, base, addr_regl);
+        addr_regl =3D base;
+    }
+
+    if (guest_base =3D=3D 0) {
+        tcg_out_opc_reg(s, OPC_ADD, base, addr_regl, TCG_REG_ZERO);
+    } else {
+        tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
+    }
+    tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+#endif
+}
+
+static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
+                                   TCGReg base, TCGMemOp opc)
+{
+    const TCGMemOp bswap =3D opc & MO_BSWAP;
+
+    /* We don't yet handle byteswapping, assert */
+    g_assert(!bswap);
+
+    switch (opc & (MO_SSIZE)) {
+    case MO_8:
+        tcg_out_opc_store(s, OPC_SB, base, lo, 0);
+        break;
+    case MO_16:
+        tcg_out_opc_store(s, OPC_SH, base, lo, 0);
+        break;
+    case MO_32:
+        tcg_out_opc_store(s, OPC_SW, base, lo, 0);
+        break;
+    case MO_64:
+        if (TCG_TARGET_REG_BITS =3D=3D 64) {
+            tcg_out_opc_store(s, OPC_SD, base, lo, 0);
+        } else {
+            tcg_out_opc_store(s, OPC_SW, base, lo, 0);
+            tcg_out_opc_store(s, OPC_SW, base, hi, 4);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
+{
+    TCGReg addr_regl, addr_regh __attribute__((unused));
+    TCGReg data_regl, data_regh;
+    TCGMemOpIdx oi;
+    TCGMemOp opc;
+#if defined(CONFIG_SOFTMMU)
+    tcg_insn_unit *label_ptr[1];
+#endif
+    TCGReg base =3D TCG_REG_TMP0;
+
+    data_regl =3D *args++;
+    data_regh =3D (TCG_TARGET_REG_BITS =3D=3D 32 && is_64 ? *args++ : 0);
+    addr_regl =3D *args++;
+    addr_regh =3D (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
+    oi =3D *args++;
+    opc =3D get_memop(oi);
+
+#if defined(CONFIG_SOFTMMU)
+    tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 0);
+    tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+    add_qemu_ldst_label(s, 0, oi,
+                        (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
+                        data_regl, data_regh, addr_regl, addr_regh,
+                        s->code_ptr, label_ptr);
+#else
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, base, addr_regl);
+        addr_regl =3D base;
+    }
+
+    if (guest_base =3D=3D 0) {
+        tcg_out_opc_reg(s, OPC_ADD, base, addr_regl, TCG_REG_ZERO);
+    } else {
+        tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
+    }
+    tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+#endif
+}
--=20
2.19.1


