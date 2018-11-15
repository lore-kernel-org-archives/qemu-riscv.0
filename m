Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQFv-0007Up-NI
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:36:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFr-0007OX-DR
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:36:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFq-0004np-5f
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:36:55 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:18085)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFk-0004eN-2K; Thu, 15 Nov 2018 17:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321407; x=1573857407;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=cq7/ILZ0+X5q2Q8zoCsoNl0fj05PmUGDIr/DEzXQuIE=;
	b=a1T+XaLvuGKuZnyKNHJoPcsYXVGpxKtjOHpCaJaQd7axUoEITvQFQvML
	rMkFBB0tBhmNoxPMyCcn7cJLGuvzpq6CCsaenl6IxFAo06YLGbmsNMxrQ
	Pv+ca8RtnTzUtZUAc/yA0/tmCFAhg/enlAp4W1TEqFieujUGF6TXgs4rG
	jwXUD01/gCVkwgnWQD1zZzLZRsoKYU2pOUoVkpFV3armIAZQj5Eg54yM0
	mwgNGUP6P5edE7Ph2ywT2J/wFjwijHA48S5rHhkrvKwx3cjI4iW2PuhGu
	CyWYmVXcmYjJK/6OMSmeG/RMToQYiOlk8sHKSq1ZWjZ48S5Ycy2YXufzU Q==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="198884487"
Received: from mail-cys01nam02lp0056.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.56])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:36:29 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LTvJjU7d6Nbj7+0encG8Vm7VCgwInIOCMO9yHivlgRs=;
	b=OVcpVmhM5gdRVW6peJ4+/EoeXOylYJwHcbPR4dw28wC+XE8P4TjWKnzkj4HvzwMmJEnhib/eLk6J0oDYHAFPokkCntpL9ErsnzA/Q4VadrFHchpm5YEl7QAE61vjVdSuJfZpXvypLATgP5mQk/3BWQRRFj6R/Kc3XZf5gC0BA50=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0865.namprd04.prod.outlook.com (10.172.169.7) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.36; Thu, 15 Nov 2018 22:36:28 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:36:28 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 17/23] riscv: tcg-target: Add direct load and store
	instructions
Thread-Index: AQHUfTOlO8R6UwvYe0umCRxlbw/rxQ==
Date: Thu, 15 Nov 2018 22:36:28 +0000
Message-ID: <ccb312eb986d846b1b0aa0be062833e5ae1bb5f4.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0023.prod.exchangelabs.com (2603:10b6:a02:80::36)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0865;
	6:5vZYXKlInwG/Iz7/fNw2yKX5SRSWUtgxhNWx3Ms2gLTN9BVavgr4/y73MPrCYeickibOHrw9tCIChGTKs5RR/9sGyhxBRnaXN6DFVdroTPFLlW+tGarV96nnf68ufqCcQz9TbhYyJzckVeJLZ9ceKu2V8DtjGVJ8mMKvLsovciuhSqmtBwei7ZQAd5e6sgD7x4WzXVWlDJjyL785ic2BB27TXcdhIbkLnaki4128UNfqsXDhaFLrAlNcFvo2THFSUs1pKrkjEhxoSFBwhptFAziyjQyNNW+nOK25jbUQG5u9j/hPq5TgNQdmCfHhhC+AXtqjbvXM0LZts/Fr4if0qdZDf+53cg2UGx8qu4VMcbH/h2lOVYnX5bCKgZ+b/TiJrCONjI9aKVRtuifyusJyZQvgZPC/jFm5D2VlIywXjqBLDxB2U3cBMJTwukl8Ufn1mmeUWOZHkm/RmlgEmv9tEg==;
	5:UDi63oE3NrkSvNO1TDYk329F7GSRhqhBHO8u90XWim4nujYLXSrGKRvNlDGC9JzBirIBomLsfhHLUqkvWv5xGe1D9oVth+aXLz/Qrjkb8lwQGSkGZOIWOI3bjpX8OrnI6OmN4FitqSNfe7IO1selkDuF7B8LU/xgwsrrVWQL/5U=;
	7:qaAzY45D7y3beyHxNtBblzVMnkjTN87JVEUjMZgFQWzYiSVseoUqDXNu+Km5zDCO/S+GEI6HSZglH/xvQ+/nMrRpQ2mHhOt9ZiDNHrbB2bj9m9BQ/iCtOBVjHkqb5QxHm0Ix/b5tA7Primb9Pz+Tuw==
x-ms-office365-filtering-correlation-id: a8ba1f61-db9a-495a-08f9-08d64b4ac838
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0865; 
x-ms-traffictypediagnostic: MWHPR04MB0865:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB08654541CE8B16BFB046610D90DC0@MWHPR04MB0865.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231415)(944501410)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0865; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0865; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(376002)(39860400002)(346002)(396003)(189003)(199004)(81156014)(81166006)(8676002)(118296001)(8936002)(256004)(6486002)(25786009)(86362001)(2501003)(72206003)(105586002)(106356001)(2906002)(97736004)(478600001)(66066001)(186003)(99286004)(54906003)(386003)(11346002)(2616005)(446003)(36756003)(2900100001)(486006)(6512007)(476003)(6506007)(26005)(39060400002)(102836004)(5660300001)(305945005)(50226002)(71190400001)(71200400001)(110136005)(6436002)(68736007)(53936002)(3846002)(316002)(4326008)(6116002)(7736002)(14454004)(44832011)(52116002)(76176011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0865;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: rE/N4kJMonsmwfbrYAOJnsTRzUAWJ5z+5COeD0UqU3+H1t/3V+f74sKGtmAcMqpcwWXqmcFVoAH2gD69uY0zZ0FT49udlwbj1WTuT0KHEUivm+fApI4dyHluhzjqZYT4SYDFAFCyFIn35wkQID0XqLvMmgeq2X4bxvWzs+gCQty3XGSCF6HVC6Clqu9RKxJmTnS/EWwWuzy7LzQTw09Ay5YqPElLCs7Akm4O+kwRB6O5wry772N6qWqbFSYS3r7uA0eStVYKOgv9DVqaC/vZ66DYeMvmQL+r2iHykz8xmcVwEJolHSMK+uVJg7SyVD8amCgp292uW8IL/C9y+g7QKMO/YejAGa8QJWvvl0JrVHc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ba1f61-db9a-495a-08f9-08d64b4ac838
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:36:28.2095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0865
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [RFC v1 17/23] riscv: tcg-target: Add direct load and
 store instructions
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
X-List-Received-Date: Thu, 15 Nov 2018 22:36:58 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 145 +++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 5fe6935e24..c4a013a962 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -958,6 +958,151 @@ static void tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
 }
 #endif /* CONFIG_SOFTMMU */
=20
+static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
+                                   TCGReg base, TCGMemOp opc, bool is_64)
+{
+    const TCGMemOp bswap =3D opc & MO_BSWAP;
+
+    /* TODO: Handle byte swapping */
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
+        } else {
+            tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
+            tcg_out_opc_imm(s, OPC_LW, hi, base, 4);
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
+    tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
+    tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+#endif
+}
+
+static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
+                                   TCGReg base, TCGMemOp opc)
+{
+    const TCGMemOp bswap =3D opc & MO_BSWAP;
+
+    /* TODO: Handle byte swapping */
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
+    TCGReg base =3D TCG_REG_L0;
+#else
+    TCGReg base =3D TCG_REG_TMP0;
+#endif
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
+    tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
+    tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+#endif
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
--=20
2.19.1


