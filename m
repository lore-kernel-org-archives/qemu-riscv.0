Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkbZ-0005lj-5E
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:09:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkbW-0005k9-G0
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:09:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkbV-0004xm-GS
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:09:10 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:54888)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkbQ-0004w2-Qi; Tue, 27 Nov 2018 16:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352967; x=1574888967;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=VwlyRhhN9GLNopdQABeiP+ZEY2McK3i2uvgVaZK+ig4=;
	b=N0L1TNnbClFj4P1hsP+PJrH7bNxy+R1TBd9YmervRM7/OelB9vMgSeGO
	Y+AU3IOIzpwSlQngFkWeBhckE+oH9y2F+98DfV1JyixV82EDEabPRz242
	zJIn8pub2HrNWNGCZxySWXPpmSHZL8/eHABpvuQs7uF/GITv/lxaD7NLJ
	EM7EUknvp310FrILGvZQXBoO/89vfrbpyipruSPf/ENeXtcIWTUFIgOIu
	MZTmEz767Yrhms5JFXBl9qcbyD6NYiERdJAVKlgyfNvDLOYyqOKT36ZJK
	Y9vTIqTCzl7goFgIVZkWIb43IwQBm0SRoi8Etvn3jUWwYRbN6EI6O4awh Q==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="193052852"
Received: from mail-sn1nam02lp0020.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([216.32.180.20])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:09:25 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=m8osda2amt5pgnIZfJFH6H+0IA1KXDN7NXTJ0df7/s8=;
	b=P5qBGvtYnRT3ifRGxGdFMbfnsRzKe0+HUm/Z+7CxzySzK/ck86AlOf0vBunz3qG3lUqI7KFlN3LQj+dJDoZoRN9wjyYgk45X7tJMHX0lZ+AYY/XSuALdj+hfYtUh9lfW5f6L0snyVMmG0ynu59XsfJ20iuKPkgkkzoGpLjRU09o=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1121.namprd04.prod.outlook.com (10.173.51.23) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 21:09:01 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:09:01 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 16/24] riscv: tcg-target: Add direct load and store
	instructions
Thread-Index: AQHUhpVrN8WK4hC+y0O/caohQayecA==
Date: Tue, 27 Nov 2018 21:09:01 +0000
Message-ID: <16a81c50540d8852facdc5d9dde3a79288314a6c.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR08CA0002.namprd08.prod.outlook.com
	(2603:10b6:a03:100::15) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1121;
	6:hP5w40C/seKrG0e54o9QJNzfktfzxTtLM5vwRYVywKKhDGmAF6UcFNVcS/u61cbCavTHDIdSFEjiV0qn1zE0ztRHLGtyCmHx3wbAUl5F99SLdAmMzdZ5lYpUqyeQCFdYBkeLygNtH0kemgbePzR+7sFdjzul0F628AGMKkgIvB574pOgSmAIkvHmcVM4zwjcMsM7u+RAe5CmCQ5vBkZBXs3nGDYKuh8Mg1Owr3lpEnRBggbgFWPvdDxDfc7sknNpy7MWC35ECkXJwSoZLqEUdnGx5BMCqa3Mc252qebLrCRod5gQ0OgtrcEGWa1NkQwAdtt/d41A0LgiX0zcTxJWxPXNIxayoFkBVr9aGaGLmJI1Gui9e2GvnFi87P97sOtBRZkOSYn7duG/wBice+BYmCamEaX4Gur/UCl+BvWUYT/CWG0L5j2mzvt1krM6jwpC9pHgAiepxp+oJLExScRBug==;
	5:ciwg+ZyeyJrH1rlte0IiB9xzJOC6vx8XKc8NP80AQM2F6/DcwfLb0JtslF5PZCk9zZWDHqj1qctVjc7L/7jmcfYOUiEwpivyYMQXr4vTxtmXCTQ04Ue/6RnTcNnh9UeWBlyogxqvja/pj/f7q37BTGRC2bDb785avSWrhHGYoDs=;
	7:yDObPSsgHDp+pU02aP2xDR6Qm7zu2caqZ1SJitEpvfINcdMgV7yGGA7eFSw3dSDhnJganvoisiM/ChgdIlL1whVWUir/rHYiAd+i+dkNE7OZxb7L07JrJbHinZazeacwKXyU16TeMMubkTncKnsbxA==
x-ms-office365-filtering-correlation-id: 1a25d3ee-542b-4282-966b-08d654ac8df0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1121; 
x-ms-traffictypediagnostic: MWHPR04MB1121:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB11219DB4E5EA7BD598982C4D90D00@MWHPR04MB1121.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231443)(944501410)(52105112)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1121; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1121; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(396003)(136003)(39860400002)(376002)(346002)(366004)(199004)(189003)(186003)(2501003)(26005)(256004)(25786009)(36756003)(86362001)(6506007)(102836004)(386003)(71190400001)(105586002)(71200400001)(97736004)(2906002)(76176011)(3846002)(6116002)(72206003)(52116002)(99286004)(106356001)(118296001)(8676002)(50226002)(39060400002)(4326008)(110136005)(316002)(6436002)(7736002)(53936002)(44832011)(6512007)(54906003)(476003)(478600001)(305945005)(66066001)(446003)(11346002)(6486002)(81166006)(5660300001)(81156014)(8936002)(14454004)(486006)(68736007)(2616005)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1121;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: ucrJpu76lb184auzk8MuotLS6uOxIPwI27S0LArrBBoR04zxmWZmRGzku7zejhXuSd4AtEIv14CFx6uFqvtY2YVhI26EEARvrW26O+76QQ4rIqbjAlTmCBpVeqlfvpgz14UlnueqcdDuYA/MvQxi/RNJn+l6/I+FW5UP8EmEBqdRfU8ltFx930p0mX3aM9S8K6k+lj9lFPL2WpxpgIfnknaZaqkEIOv8YSk3GNIEXJGkv1iUWG0dTAfAZa4w33N4L0JKqHK93AXf8O5Gs0bMPk/ZN4y8dHrP83gtQwpwexPopHSoz+ptyO6J4I4aCb+X+Gn5A0WOGOsDo7Vr+f5iVX5Br+DZphDyBB678BF5d44=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a25d3ee-542b-4282-966b-08d654ac8df0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:09:01.5091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1121
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [RFC v2 16/24] riscv: tcg-target: Add direct load and
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
X-List-Received-Date: Tue, 27 Nov 2018 21:09:11 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 162 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 158 insertions(+), 4 deletions(-)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 4f3a6de52c..e3b5f48848 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -816,14 +816,10 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg ad=
drl,
            ? offsetof(CPUArchState, tlb_table[mem_index][0].addr_read)
            : offsetof(CPUArchState, tlb_table[mem_index][0].addr_write));
     int add_off =3D offsetof(CPUArchState, tlb_table[mem_index][0].addend)=
;
-    int addend_offset =3D (offsetof(CPUTLBEntry, addend)) -
-                            (is_load ? offsetof(CPUTLBEntry, addr_read)
-                                     : offsetof(CPUTLBEntry, addr_write));
     RISCVInsn load_cmp_op =3D (TARGET_LONG_BITS =3D=3D 64 ? OPC_LD :
                              TCG_TARGET_REG_BITS =3D=3D 64 ? OPC_LWU : OPC=
_LW);
     RISCVInsn load_add_op =3D TCG_TARGET_REG_BITS =3D=3D 64 ? OPC_LD : OPC=
_LW;
     TCGReg base =3D TCG_AREG0;
-    TCGReg cmpr;
=20
     /* We don't support oversize guests */
     if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
@@ -991,6 +987,164 @@ static void tcg_out_qemu_st_slow_path(TCGContext *s, =
TCGLabelQemuLdst *l)
 }
 #endif /* CONFIG_SOFTMMU */
=20
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
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
--=20
2.19.1


