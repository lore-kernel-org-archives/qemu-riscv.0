Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkbL-0005Zl-Ld
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:08:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkbH-0005Xu-NX
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:08:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkbG-0004s0-9s
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:08:55 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:22284)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkb8-0004oQ-VC; Tue, 27 Nov 2018 16:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352927; x=1574888927;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=HoY6Fv8fyrFF5yqgnX7k6847Pu3Ad0uBaNLAkPNw0eI=;
	b=Thq6DSLauI3tBMeZoeeFHZoyfDLSuYhgjBF74GmNN2o8+kzjprku+91i
	vlnqm7zO1L02CMEKNdHpkT/G+7AlIQimivHgwUExmZlBQL0C0M22Pid6H
	K9508DHK0AojxU7nw92EilQNXCmQ/ynMxE+yW0AWxd80uhji8xDK3SVGK
	pRMuJP7xa/O26XsWpH2lqOVpEsWQGF0Hu1YW98BXEHhtQ5OCffZJpaoMs
	7mYy8JdhMJ04EdBtMfU4Lp5xpQGe9p23TrXge68DhpFKXcDwV7TfQ6Kdq
	W4cbquax/33qVjdCh704wrJgWl4fhdO/inbRJ94KL6l3t5myIi5N1oRsg w==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="96433684"
Received: from mail-sn1nam02lp0015.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([216.32.180.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:08:46 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ydmynCYXFSp7hM8kI8rBjsK/YjhIekDSjItp360N86E=;
	b=L5Su76qwtPCslS6Zf9OxC4Yt3AfEM12IF16pREHwJqzoSZaFhaFf+cjT7VjugvaEolx7mPdOtDEvWv6Agaqd4N37PCCWZedsLbkp5llTPnBjM6leUexCA7HayPM/msn3enjN/xr5nZb6XxbHp78yqHrHzrH91DyKn26wrCUDOiU=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1121.namprd04.prod.outlook.com (10.173.51.23) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 21:08:43 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:08:43 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 14/24] riscv: tcg-target: Add branch and jump
	instructions
Thread-Index: AQHUhpVh+5oytiNHXEysTr15uNa0MA==
Date: Tue, 27 Nov 2018 21:08:43 +0000
Message-ID: <aa41323b013a6c77e28d487d49026df36d60e4c5.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0016.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::29) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1121;
	6:hQ6k4mPJ3xoChfSeHQihiC7D/1L7BkuWrzGY4cJ/9Q08jWX2q1eR0+CxFbq+BUl1/ILBS5H8s/ckimI7y63A109fE7rBSeMQ7ctYWyLHGVAsdikRG7s7y2tSi5dDI+JESsojjtNDyWUvFoTgW/BPj/FljmVBgZd1Jwl/lU0pNw18/lM/0pOZiZpth+44zGPzrD8j1K9FbKVs+w2wcv77hXL2Fk0OLHK7MVkFMPbHAba9G8jGB401484FGF/RsFxLYWY1Rytqru+6rTw0t4Qm6SEbaxMiFkr4b6LxNzx5D01XrSKjbPztJfhdXmaBeDgLOpMdPIjJrJXBzetPmVFImotcOC0qrP90+Fq+36ZLys1QzOLEhKHPlicm450VHgbx07YYJj8r0bsoCaAC/200T3pXTQ/DgtUgkHwmE49MWL0LTznlY0w25nR7G18rIVE59nyAMb5htt09R+oujv9IHw==;
	5:a13WSld9/nHaSWY+smNdZ/Qo6Oq5EOu6mz1FURNARPpFGunROsW4+hMEQrvlHTMJbVJuA94QiaBx2eE0Zc9fuavo3bbd1a0/ZnXSDXghMEVOnKrdg7nTYR/f5pBd9eoBvllFgs7f0RQjp+QlgSUef8f++neUOmWfQpJP7cdX5X8=;
	7:PQe2L0KBYu6Xlk0f2+m2fVHx0ixaouljZcTVD1mbQhAIS06waQ7osipMQnDG/X8ELqjxbVcTcF1BMMm3xP+slO01cqlaylDKp4IwkLPgzktJfrvDGkrirdEZVuBHPUFl5Bp2xHS2ngxfcVTifaw8Zw==
x-ms-office365-filtering-correlation-id: 01ccc500-2bdf-455f-f16b-08d654ac8354
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1121; 
x-ms-traffictypediagnostic: MWHPR04MB1121:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB1121CA04A242547C60984E6790D00@MWHPR04MB1121.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231443)(944501410)(52105112)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1121; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1121; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(39860400002)(376002)(346002)(366004)(199004)(189003)(186003)(2501003)(26005)(256004)(25786009)(36756003)(86362001)(6506007)(102836004)(386003)(71190400001)(105586002)(71200400001)(97736004)(2906002)(76176011)(3846002)(6116002)(72206003)(52116002)(99286004)(106356001)(118296001)(8676002)(50226002)(39060400002)(4326008)(110136005)(316002)(6436002)(7736002)(53936002)(44832011)(6512007)(54906003)(476003)(478600001)(305945005)(66066001)(446003)(11346002)(6486002)(81166006)(5660300001)(81156014)(8936002)(14454004)(486006)(68736007)(2616005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1121;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: EH+fNQYkKukXcitSmum3YLCOUAd7JoEz4BOffipk4PBGRWIe/0b8Ve3XYeSLga0u4wRsQVnnJrs7uMkwuXLwHxVWisIDy68Ytii0/NrTZ0ZhhFzVoIfdqo01YCWTTsdevCdrpcnt6WsYxVl+kmwU6cW6PZCmcel8kiwwMEIQjqMfZ5qZGo0BqQDlRC4ppm91quQnMPUotog5G2F2wlBPTmt30nXHu82qyYpZybZaiBaYd8k1gaAOve4filOoiFyy6QYyqleVPFPIxjtmeoLFsXMVJ5Qe9toZbjPm9KFioFwZOvv+BT0xzChvAXuURdwXU8QDSkc23NNi5fU/0iKbRzmTM8rXZZ9KE9YQxKt1Cto=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ccc500-2bdf-455f-f16b-08d654ac8354
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:08:43.6962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1121
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v2 14/24] riscv: tcg-target: Add branch and jump
 instructions
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
X-List-Received-Date: Tue, 27 Nov 2018 21:08:56 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 141 +++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index cac4a4b615..97831bfb9d 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -606,6 +606,147 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, =
TCGArg val,
     return false;
 }
=20
+static const struct {
+    RISCVInsn op;
+    bool swap;
+} tcg_brcond_to_riscv[] =3D {
+    [TCG_COND_EQ] =3D  { OPC_BEQ,  false },
+    [TCG_COND_NE] =3D  { OPC_BNE,  false },
+    [TCG_COND_LT] =3D  { OPC_BLT,  false },
+    [TCG_COND_GE] =3D  { OPC_BGE,  false },
+    [TCG_COND_LE] =3D  { OPC_BGE,  true  },
+    [TCG_COND_GT] =3D  { OPC_BLT,  true  },
+    [TCG_COND_LTU] =3D { OPC_BLTU, false },
+    [TCG_COND_GEU] =3D { OPC_BGEU, false },
+    [TCG_COND_LEU] =3D { OPC_BGEU, true  },
+    [TCG_COND_GTU] =3D { OPC_BLTU, true  }
+};
+
+static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
+                           TCGReg arg2, TCGLabel *l)
+{
+    RISCVInsn op =3D tcg_brcond_to_riscv[cond].op;
+    bool swap =3D tcg_brcond_to_riscv[cond].swap;
+
+    tcg_out_opc_branch(s, op, swap ? arg2 : arg1, swap ? arg1 : arg2, 0);
+
+    tcg_debug_assert(op !=3D 0);
+
+    if (l->has_value) {
+        reloc_sbimm12(s->code_ptr - 1, l->u.value_ptr);
+    } else {
+        tcg_out_reloc(s, s->code_ptr - 1, R_RISCV_BRANCH, l, 0);
+    }
+}
+
+static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
+                            TCGReg arg1, TCGReg arg2)
+{
+    switch (cond) {
+    case TCG_COND_EQ:
+        tcg_out_opc_reg(s, OPC_SUB, ret, arg1, arg2);
+        tcg_out_opc_imm(s, OPC_SLTIU, ret, ret, 1);
+        break;
+    case TCG_COND_NE:
+        tcg_out_opc_reg(s, OPC_SUB, ret, arg1, arg2);
+        tcg_out_opc_reg(s, OPC_SLTU, ret, TCG_REG_ZERO, ret);
+        break;
+    case TCG_COND_LT:
+        tcg_out_opc_reg(s, OPC_SLT, ret, arg1, arg2);
+        break;
+    case TCG_COND_GE:
+        tcg_out_opc_reg(s, OPC_SLT, ret, arg1, arg2);
+        tcg_out_opc_imm(s, OPC_XORI, ret, ret, 1);
+        break;
+    case TCG_COND_LE:
+        tcg_out_opc_reg(s, OPC_SLT, ret, arg2, arg1);
+        tcg_out_opc_imm(s, OPC_XORI, ret, ret, 1);
+        break;
+    case TCG_COND_GT:
+        tcg_out_opc_reg(s, OPC_SLT, ret, arg2, arg1);
+        break;
+    case TCG_COND_LTU:
+        tcg_out_opc_reg(s, OPC_SLTU, ret, arg1, arg2);
+        break;
+    case TCG_COND_GEU:
+        tcg_out_opc_reg(s, OPC_SLTU, ret, arg1, arg2);
+        tcg_out_opc_imm(s, OPC_XORI, ret, ret, 1);
+        break;
+    case TCG_COND_LEU:
+        tcg_out_opc_reg(s, OPC_SLTU, ret, arg2, arg1);
+        tcg_out_opc_imm(s, OPC_XORI, ret, ret, 1);
+        break;
+    case TCG_COND_GTU:
+        tcg_out_opc_reg(s, OPC_SLTU, ret, arg2, arg1);
+        break;
+    default:
+         g_assert_not_reached();
+         break;
+     }
+}
+
+static void tcg_out_brcond2(TCGContext *s, TCGCond cond, TCGReg al, TCGReg=
 ah,
+                            TCGReg bl, TCGReg bh, TCGLabel *l)
+{
+    /* todo */
+    g_assert_not_reached();
+}
+
+static void tcg_out_setcond2(TCGContext *s, TCGCond cond, TCGReg ret,
+                             TCGReg al, TCGReg ah, TCGReg bl, TCGReg bh)
+{
+    /* todo */
+    g_assert_not_reached();
+}
+
+static inline void tcg_out_goto(TCGContext *s, tcg_insn_unit *target)
+{
+    ptrdiff_t offset =3D tcg_pcrel_diff(s, target);
+    tcg_debug_assert(offset =3D=3D sextract64(offset, 0, 26));
+    tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, offset);
+}
+
+static inline void tcg_out_goto_long(TCGContext *s, tcg_insn_unit *target)
+{
+    ptrdiff_t offset =3D tcg_pcrel_diff(s, target);
+
+    if (offset =3D=3D sextract64(offset, 0, 26)) {
+        tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, offset);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP0, (intptr_t)target);
+        tcg_out_opc_jump(s, OPC_JAL, TCG_REG_TMP0, 0);
+    }
+}
+
+static void tcg_out_call_int(TCGContext *s, tcg_insn_unit *arg, bool tail)
+{
+    TCGReg link =3D tail ? TCG_REG_ZERO : TCG_REG_RA;
+    ptrdiff_t offset =3D tcg_pcrel_diff(s, arg);
+    if (offset =3D=3D sextract64(offset, 1, 20) << 1) {
+        /* short jump: -2097150 to 2097152 */
+        tcg_out_opc_jump(s, OPC_JAL, link, offset);
+    } else if (TCG_TARGET_REG_BITS =3D=3D 32 ||
+        offset =3D=3D sextract64(offset, 1, 31) << 1) {
+        /* long jump: -2147483646 to 2147483648 */
+        tcg_out_opc_upper(s, OPC_AUIPC, TCG_REG_TMP0, 0);
+        tcg_out_opc_imm(s, OPC_JALR, link, TCG_REG_TMP0, 0);
+        reloc_call(s->code_ptr - 2, arg);
+    } else if (TCG_TARGET_REG_BITS =3D=3D 64) {
+        /* far jump: 64-bit */
+        tcg_target_long imm =3D sextract64((tcg_target_long)arg, 0, 12);
+        tcg_target_long base =3D (tcg_target_long)arg - imm;
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP0, base);
+        tcg_out_opc_imm(s, OPC_JALR, link, TCG_REG_TMP0, imm);
+    } else {
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_call(TCGContext *s, tcg_insn_unit *arg)
+{
+    tcg_out_call_int(s, arg, false);
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
--=20
2.19.1


