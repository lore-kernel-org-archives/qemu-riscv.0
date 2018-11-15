Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQFq-0007Mq-2M
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:36:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFi-0007Iz-9z
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:36:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFS-0004en-NN
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:36:39 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:51983)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFC-0004ZB-Rp; Thu, 15 Nov 2018 17:36:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321375; x=1573857375;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=l2D91ok9bj5Bq8yqkfcErVS75PMxZ0TMIn5akYcKhRk=;
	b=HZcl7tlJBf/CeNcS49HxCPVZA/3F84doLeJ6G+PNyyyih0uwW8K0rzUm
	gbwqWL8Mi+EJ7t4o4iddI6AnsWlfPF9qrvV0Hm3MAa1GdmJzHK9KIhgN4
	84CSDqB33u6fXK0u8MYwGA+m/F+VgGitfPj7V16uD5IeqhafE8q6R0C8n
	bHdA96jfoiqZW+d4MP3epjpXWv7+nN1BsTE14vss2gY3Gr9y0L1hzG1Fq
	CqcvbdAEQJysGEeNrChGiBLdHkkbfwlsKbzN+NDwh6DDONDCjFrYdmxBA
	YuWzIvWCq0l0wLZ1JuT4bMHPYYHyif/k+xEicshYBLxnf2qwZ7Hqi/wQU Q==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="99166012"
Received: from mail-cys01nam02lp0055.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.55])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:36:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=O0qbyDdDW9I9k2f9TcXw/E4e+6XMQPs3aFEaLOvXn1s=;
	b=gEHFNYVFAXV+AFkVvf5k/oEcV/PUi2I/Ce12xc/lxx2Auvw/XHLyfhMPKoW56CymdMNyxhzluCo7olSjQCcIBCwVOV1nHA0mwLF5MKGlxCa5Q4JUkwLRcqS4u8YHKIewFx/GnmKZxQ0g/f17UHze0OQXrVL6z+AKcnWVFz94kOo=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0481.namprd04.prod.outlook.com (10.173.48.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.27; Thu, 15 Nov 2018 22:36:09 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:36:09 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 15/23] riscv: tcg-target: Add branch and jump
	instructions
Thread-Index: AQHUfTObyEVruEKS7kalGAj8IcAptA==
Date: Thu, 15 Nov 2018 22:36:09 +0000
Message-ID: <f1a7d2617c26c1745fafe13bbe3bc3b042c14217.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0021.prod.exchangelabs.com (2603:10b6:a02:80::34)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0481;
	6:rSJIupYVA6IHXfpTVx+hToVbBd9mNUelo/6t24ilB/INkzEFNDTkRK5YxBOagaWy0Ek6WkpYG6pnLGfEtv2Fx9owmY3HflmK31YmHRwj6mO4D8bB9OhSIjrH9IC+SjJ9ZLhKSjncNsnVYMNg/PEsAvIvh77vzs/sXXD1WY0eaYHSnYEVG5tQvfqZmrbzVsLyM6I+ybnPu90Zm4jl2CY5QyOk0jCU3wvcpgZvsBAgdsb2fGtGFiXRHcOIB0TwewdyOxzbqfVZUVa8PfpHkTPNHF4/JH3bfjmURBel5AkogawHOi3n8caz6RuJeRitJ4r0cD6RruONVEZUKfM2BDeZt93jsm+MAaYKPVZa41iw9oJeoULTbYb19kWoTkVCfAvo2Qy921wH0pqqVxhcgwFxF+1bJRuCW6AYyRau4p2XxPHGpcxlxHfdspiioA6zq8LnKHJYMvx9g2c3Ve4BJqk7XQ==;
	5:cDkLs05P7RqgxD5MTI1HImUnw9JoEmDBZ5uheK9t7yvCWFe9cnpbQs7BgpRaumCAYzquMrQ5vIbbtM9BKu6IbenvKAsvsZdW0MnGj2gLJUTlrZZ+Pl3kfeisozNfpbjHRlw87a+pnEGxnYI1ViZ68NLTj3gCZC2j3+ubZx6csXM=;
	7:FwALckinkyrZDHGInaY6AZ9FYTgeCD33D7htg8gPMb6YazadEIn+AIkQjDfIpExXwBuIhP0zb993UfEUpoXPbbPmtJUNe2qqhpbMPDgm5DkA5ghjAkJQQ2WYzmd9obvDdcVPGZYPDSZbq87vm9P7XA==
x-ms-office365-filtering-correlation-id: c1888ee3-83f1-47be-6551-08d64b4abd55
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0481; 
x-ms-traffictypediagnostic: MWHPR04MB0481:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB048164D802BF0C099260173E90DC0@MWHPR04MB0481.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: eWugKtETriBzpcZFasGaKWifc0/fj3isQIyT0Ne6ueyzS6J8uqC++VTQWdz1CTOHiazdTx6Ke9vskqvAFwi/3zpiH6oJP1DxKFCJlcr6+C1CexeXlq39m7fm5EC5+dARfaCJI0zYStLeiRByCp74StBGhPHEJUpRf1f/W2ENS4rFOISWu59z4+l6sPYZl3hl8K9NGBSWaigd69zaLPo0+DzyKN5KjaIjrk5K7c0sduvSNXIDwYwZO00LTvc3fxRPny6Or6ApAdIlU5Y7guXvx7zObRO61VOR2rRPrAVglebZ9noPkH/dhqnJcy5A0PM8gG0kJ8/SMjN+6UOgl9x/dRxjhU37QrVZTWhG2T2XL+A=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1888ee3-83f1-47be-6551-08d64b4abd55
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:36:09.8840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0481
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v1 15/23] riscv: tcg-target: Add branch and jump
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
X-List-Received-Date: Thu, 15 Nov 2018 22:36:52 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 144 +++++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index bc433170c4..b449e17295 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -574,6 +574,150 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, =
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
+    if (offset =3D=3D sextract32(offset, 1, 20) << 1) {
+        /* short jump: -2097150 to 2097152 */
+        tcg_out_opc_jump(s, OPC_JAL, link, offset);
+    } else if (TCG_TARGET_REG_BITS =3D=3D 32 ||
+        offset =3D=3D sextract32(offset, 1, 31) << 1) {
+        /* long jump: -2147483646 to 2147483648 */
+        tcg_out_opc_upper(s, OPC_AUIPC, TCG_REG_TMP0, 0);
+        tcg_out_opc_imm(s, OPC_JALR, link, TCG_REG_TMP0, 0);
+        reloc_call(s->code_ptr - 2, arg);
+    } else if (TCG_TARGET_REG_BITS =3D=3D 64) {
+        /* far jump: 64-bit */
+        tcg_target_long imm =3D sextract32((tcg_target_long)arg, 0, 12);
+        tcg_target_long base =3D (tcg_target_long)arg - imm;
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP0, base);
+        tcg_out_opc_imm(s, OPC_JALR, link, TCG_REG_TMP0, imm);
+    } else {
+        g_assert_not_reached();
+    }
+}
+
+static void tcg_out_tail(TCGContext *s, tcg_insn_unit *arg)
+{
+    tcg_out_call_int(s, arg, true);
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


