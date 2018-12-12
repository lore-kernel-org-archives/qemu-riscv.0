Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXASB-0002aW-DW
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:45:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAS4-0002To-Pi
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:45:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAS0-00038Q-Pi
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:45:48 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:29296)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXARp-00031m-3G; Wed, 12 Dec 2018 14:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643933; x=1576179933;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=nAA7B/Lr62aFGctR+EwZ4d5fuWp2s6IMv1+nV5lV/D0=;
	b=MHAJCkf/4ZK1y6r0fRhsP5cFqwtd4HCr19dGmtNcSEqUjk+TdILOO4+P
	McHEgxx1pWRjHXiy/zTiqZqd5uJ1BBwl3nnDc6B+6nZRMkKutzaB/mL+2
	6WjGFkQFJZPv3QV8Rr6BaSFa1/l35zJU39dM9ztbuQNYKbjCpy72s5ayF
	EWZzvyN0sqnD0liRTh/dbfi7VQPDKp5sL0B7olqHZ0FUU2KUrD1+VzSIJ
	VlfCGBB/C9IJXyF7kfIAiA6vXUU6aLKLXMqyK8366j1a+QUXwn36aOwJU
	/MEGyMrOVP8Ba7D8AgB9EDrpcjAbKTuMi5Td1SmkckcyHGg29WVdq7YLB Q==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="96440942"
Received: from mail-bn3nam01lp2056.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.56])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:45:31 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=81exqrBPH/3D6O7ch2dQw17QE854X6mrxIxH3YvwYn0=;
	b=NUvm07/X0tSOpOXC6B8sowunnBNjHrIZMmR7oDRuN/mvc0HwqQ7tyAbz+jPCBAGcGe3LKgqYyP62isJ8NVRAbleI46dAqmK4qdGa1z1+GdeCUe/HRmE//6VqUjnI6T8lCn+vvkveAkBfI/XnMThHxhIBDnXR5HwbRG7YabXtUqc=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0512.namprd04.prod.outlook.com (10.173.49.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.19; Wed, 12 Dec 2018 19:45:29 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:45:29 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 17/23] riscv: tcg-target: Add direct load and store
	instructions
Thread-Index: AQHUklM8dC0e2vrFUEuxxkb2Y2NWPg==
Date: Wed, 12 Dec 2018 19:45:29 +0000
Message-ID: <4dfc1c6576c863854c6aeb8910b0165d82fe9b73.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0054.namprd05.prod.outlook.com
	(2603:10b6:a03:74::31) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0512;
	6:eoNRnWmvLgtWfLmR9Jq/CaNusPVXOlqaVlLkgB/gZjz+hwhwC+8vB38R7IU/Vd/uWgL8ezsUA3JU9Nt4p36khQzLOv0lWaZodFK65rlwTJPhfRVr6y0XRR8X9kSKsM2fk3i6560GeQrV/4uLO7RzYrhx2zKi+pHTdTRAKhiSc7hQaMDPmYXCsdEkbRweLLUpxNNEIRx5Z7/ABzykqNH149v+wUCSvTlJEIOVmVnlp+U0vbFVsUD0aGOa1QSKtl1Rka5kDbhEMbYr/3SoeeiuANCdVDQbcuvuYKNTwP9NSOMQw3Qne4kd0MOkF+y6UU+Orn3OOI0OyOxbcKgxaAB2A+duRjFFytv6yyTZCgHbVkHH5UyhkQBP9bj2H7ijwAkjcRczlgShd9SCjLkYpqiJXi/TtfzOCaSwWEZqaiOwKvrb+HL2FTWaDOCFtAAb9QxfsvRDSwM6GpL3pzqFla0DEA==;
	5:RhixdPMDV/o1ddK/smOvV39CEn+Tx3hKldWCitPvH6ae3EM3I1wrgRyLYBoIMSXIO60oo/YF3r6FDSsVTjrDteuamIQsXSuNaGFP215Yda8IIWbooOrBYKfLv8jDW9KVlRujY1GjzHI1F8GgOF4i3CK9yiS/C8baT5Gsl1AcOHk=;
	7:oY1RfXe+bOyAgn4n8eBz9vFj57Dj0KKlQRv5x/Q7lkG27nk9tNC2rJL30uEyCCyHtkFdaPhUWFomutmVMeRTR9lIVS1+0f7Fx+AUTh7U6259+o99fQVRlRaH21bhdvAUtVbIzvyLDnpgSOHSJMnzRw==
x-ms-office365-filtering-correlation-id: 9fd493d4-cae9-4f1b-7708-08d6606a5ebc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0512; 
x-ms-traffictypediagnostic: MWHPR04MB0512:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB05121F9ECB566CB1F694B4A890A70@MWHPR04MB0512.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230017)(999002)(6040522)(2401047)(5005006)(8121501046)(3231472)(944501520)(52105112)(3002001)(10201501046)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0512; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0512; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39860400002)(396003)(366004)(136003)(376002)(199004)(189003)(316002)(66066001)(97736004)(71200400001)(2501003)(71190400001)(76176011)(486006)(8936002)(6506007)(386003)(102836004)(118296001)(3846002)(81166006)(44832011)(186003)(25786009)(26005)(11346002)(6436002)(6486002)(99286004)(2616005)(105586002)(8676002)(6116002)(81156014)(52116002)(5660300001)(6512007)(478600001)(72206003)(53936002)(68736007)(256004)(50226002)(110136005)(446003)(54906003)(39060400002)(14454004)(36756003)(7736002)(2906002)(476003)(4326008)(575784001)(86362001)(305945005)(106356001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0512;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: lh2lYnaADC/LxK+WFD03A52KPBsn7fgbAJpLUvQvVor2cQst/R946GFOl5K4XRaMnT6LeZTrhQfY4rTzSJaNKP+xVSN1src7SRtKFLKBAfS3ZAbT6/v4uFQx6yt0mTgvxwfht+U8VRTV/nAEK+BOQ72y/fk9CEu8MarWen4kRc6y6+QKGp19ZjrJyi+tdQvevA3b1VuCgOUIqvp+6JNen6kWOR98P0z1ABx+Pitmu+HEZW5hQ9AOQk0pj6idJ4w+SWIkkHUYbVOrLZJXJzPhyRGDqWSW9yCWkKGBw3XweI5snVStLYkFcDRxozVOicYo
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd493d4-cae9-4f1b-7708-08d6606a5ebc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:45:29.4525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0512
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 17/23] riscv: tcg-target: Add direct load
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
X-List-Received-Date: Wed, 12 Dec 2018 19:45:52 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 158 +++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index bc0e7ee509..b0061a7e83 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -1134,3 +1134,161 @@ static void tcg_out_qemu_st_slow_path(TCGContext *s=
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


