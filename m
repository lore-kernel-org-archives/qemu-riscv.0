Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXARt-0002KG-K4
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:45:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXARo-0002IV-T2
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:45:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXARn-00030x-1A
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:45:32 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:5240)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXARg-0002rl-43; Wed, 12 Dec 2018 14:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643924; x=1576179924;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=YE4TDv0RCpHqCe/XJTgrXxuGXIuGRYRTIP/1uL58AXM=;
	b=N5qSaCBldVnkg8tBrpDAZnwCYrAF519CbQmc0V6SXPwKQXAbj0UXw4Ge
	0FtBc57l7KHmt0CfPXZ8pXEJY4KCafymZgBXnVJUdTIolGCtyHlZEG8lE
	1arH/pl27BReG/TfcnZmVx5ch/BPoLTMMqASvZwuxO2tMdhsxzHqQVIqj
	5rKk/QC7/48X0v5M1zuM+jbasUhcHQqp7to85gmKncBWpHbU0pcx2ipcs
	v+XmJsbNJ8W7dFOtGfJK+Xle4K0fQBJn4Zhj6gHgSqbgT2I+nrXw7a2I9
	FCsho34PrdaQxxDYSGKFx5+e7CB4iw9OEnPtsfq+JjThAF8U3c21K1HXb A==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="97665531"
Received: from mail-bn3nam01lp2053.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.53])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:45:21 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=e8y+nPwXFfpttc8Ks0LmfUB2z/RMAoXs8XdMknjkhso=;
	b=JvZAK4Sf3kAoLRuLaQcLwDtKvxz9h6CWJA2nwOhbkzF2ILIq/j+ZSlj8IE7nVjnUARkGvYzQiMP7vy+4zqGNdqIPBZYx88i9DSwPMZ5n6BR/hpBj+VQ4WJPESiHGPgpgU/XUHqsVRPSLMtugnlo+TjLIOzKLhTkCfKRHDCtie0M=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0512.namprd04.prod.outlook.com (10.173.49.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.19; Wed, 12 Dec 2018 19:45:20 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:45:20 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 16/23] riscv: tcg-target: Add slowpath load and store
	instructions
Thread-Index: AQHUklM2jzQ5q0pW+0G8dbvctJkYUg==
Date: Wed, 12 Dec 2018 19:45:19 +0000
Message-ID: <f72c1350604d4ed26bd8005b65b183ded421b7ba.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0066.namprd05.prod.outlook.com
	(2603:10b6:a03:74::43) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0512;
	6:BaKuYey3MuOgTXcyoOqgp0y8aqSg5Cz0vk70xFBwaJxsOqF6yZuZJ9eX8NS1FA1y9KmwFZkxvKSKYS/jdzWQN6Jhxux1bSnrQ6h+w8nLpfZW0jRpNfmyiI04GMOXfZsuJDiMYZNfns0JYPT0+FueTs3WsMs5Ot0oKbm8fw8rHjfmRi4DtV54Vv/dynivNjTfKDOiG8+6WmAfTP2OOUJmS2ZRvtzpz1XlLwd3uXWy5rUMwkf2tv60jqmEQQ4RJ48vp3NOKBCGcJe5rCI/UxbuWTARapImqHUTi43eiBaUsG42ZlJLMFIi90nfr/r2NiQTjX/x91ojNPNk2pOb9eQTKrPwKf1lplIzCw1JpfHGCxgXWh3uLAXASd8yaJobfue2sCiCOrBjUPnZdZUNtxVYlkkaOqMOTfkpLjheOAc/PLqw0mGBoMJKMzbkXIzomu2QxGjm8PpTMvOvqH9o/QQxvQ==;
	5:jXvxQaK0zxrkfIQArSN8vDlGr7zsT7uYGAq28nnC1eUpqD9dH6wVdRbgF0ao7i/SdK13MNDSN7QxzSHGbIcTYfIcJWYZApVBPOXpdmG5C9QFw7Q2RqtdIeMrXtEtnlv48P3FNGyTgr1ZGSP8ivaO1ARMyddwtCzISCP4Y1aY+Hw=;
	7:DNb4WjroQHJ0inPaKLyBd/EzIv7WccodJWSPfPsj/GXS3N8oqT0d8fYhsgCCqo1NXZrETRcKyzT2hUvC9yzivSGNhCNiCQmBu4miN7tWqN1uI8oY8VAniVRb7V/IR12WBRrIfhYbND8+r0E7zLxocw==
x-ms-office365-filtering-correlation-id: d795bbe2-6048-42a3-0310-08d6606a591a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0512; 
x-ms-traffictypediagnostic: MWHPR04MB0512:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB05126F49A8593363336A764990A70@MWHPR04MB0512.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230017)(999002)(6040522)(2401047)(5005006)(8121501046)(3231472)(944501520)(52105112)(3002001)(10201501046)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0512; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0512; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39860400002)(396003)(366004)(136003)(376002)(199004)(189003)(316002)(66066001)(97736004)(71200400001)(2501003)(71190400001)(76176011)(486006)(6306002)(8936002)(6506007)(386003)(102836004)(118296001)(3846002)(81166006)(44832011)(186003)(25786009)(26005)(11346002)(6436002)(6486002)(99286004)(2616005)(105586002)(8676002)(6116002)(81156014)(52116002)(5660300001)(6512007)(478600001)(72206003)(53936002)(68736007)(256004)(50226002)(110136005)(446003)(54906003)(39060400002)(14454004)(36756003)(7736002)(2906002)(476003)(4326008)(575784001)(966005)(86362001)(305945005)(106356001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0512;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: l1tgrkol43UORb3yuQFlAuzajwHV2gmEcxhW3QbRUKnErEkcv8NnuCOQBQ2/Qd9NbVpB83c70fz5d5mnHuapZ1nDADXvtq0W5hzAoYyUU7FeSVdPlH/gXRQBaviM0KoOLvjG55RjRILqhNp0GsBMDOMCrqjNsB+/7ZkoU2+03NmHUCsMd0NJ14uPG4XVNqu38hdt5HmbrBuxx4LMO+EQFZbldjJKc2ghe/li+5P9YnmmkevYizPav2xxKi5Q6K4GYCf3zAY1TTrNgjVW/2B7cCy3iSraT6egeXFJZm0wavfeFBwFRxn4DMP7vIHj7PJ3
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d795bbe2-6048-42a3-0310-08d6606a591a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:45:20.0149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0512
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v1 16/23] riscv: tcg-target: Add slowpath load
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
X-List-Received-Date: Wed, 12 Dec 2018 19:45:36 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.inc.c | 256 +++++++++++++++++++++++++++++++++++++
 1 file changed, 256 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index f1ebd86516..bc0e7ee509 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -878,3 +878,259 @@ static void tcg_out_call(TCGContext *s, tcg_insn_unit=
 *arg)
 {
     tcg_out_call_int(s, arg, false);
 }
+
+static void tcg_out_mb(TCGContext *s, TCGArg a0)
+{
+    tcg_insn_unit insn =3D OPC_FENCE;
+
+    if (a0 & TCG_MO_LD_LD) {
+        insn |=3D 0x02200000;
+    }
+    if (a0 & TCG_MO_ST_LD) {
+        insn |=3D 0x01200000;
+    }
+    if (a0 & TCG_MO_LD_ST) {
+        insn |=3D 0x02100000;
+    }
+    if (a0 & TCG_MO_ST_ST) {
+        insn |=3D 0x02200000;
+    }
+    tcg_out32(s, insn);
+}
+
+/*
+ * Load/store and TLB
+ */
+
+#if defined(CONFIG_SOFTMMU)
+#include "tcg-ldst.inc.c"
+
+/* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
+ *                                     TCGMemOpIdx oi, uintptr_t ra)
+ */
+static void * const qemu_ld_helpers[16] =3D {
+    [MO_UB]   =3D helper_ret_ldub_mmu,
+    [MO_SB]   =3D helper_ret_ldsb_mmu,
+    [MO_LEUW] =3D helper_le_lduw_mmu,
+    [MO_LESW] =3D helper_le_ldsw_mmu,
+    [MO_LEUL] =3D helper_le_ldul_mmu,
+#if TCG_TARGET_REG_BITS =3D=3D 64
+    [MO_LESL] =3D helper_le_ldsl_mmu,
+#endif
+    [MO_LEQ]  =3D helper_le_ldq_mmu,
+    [MO_BEUW] =3D helper_be_lduw_mmu,
+    [MO_BESW] =3D helper_be_ldsw_mmu,
+    [MO_BEUL] =3D helper_be_ldul_mmu,
+#if TCG_TARGET_REG_BITS =3D=3D 64
+    [MO_BESL] =3D helper_be_ldsl_mmu,
+#endif
+    [MO_BEQ]  =3D helper_be_ldq_mmu,
+};
+
+/* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
+ *                                     uintxx_t val, TCGMemOpIdx oi,
+ *                                     uintptr_t ra)
+ */
+static void * const qemu_st_helpers[16] =3D {
+    [MO_UB]   =3D helper_ret_stb_mmu,
+    [MO_LEUW] =3D helper_le_stw_mmu,
+    [MO_LEUL] =3D helper_le_stl_mmu,
+    [MO_LEQ]  =3D helper_le_stq_mmu,
+    [MO_BEUW] =3D helper_be_stw_mmu,
+    [MO_BEUL] =3D helper_be_stl_mmu,
+    [MO_BEQ]  =3D helper_be_stq_mmu,
+};
+
+static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
+                             TCGReg addrh, TCGMemOpIdx oi,
+                             tcg_insn_unit **label_ptr, bool is_load)
+{
+    TCGMemOp opc =3D get_memop(oi);
+    unsigned s_bits =3D opc & MO_SIZE;
+    unsigned a_bits =3D get_alignment_bits(opc);
+    target_ulong mask;
+    int mem_index =3D get_mmuidx(oi);
+    int cmp_off
+        =3D (is_load
+           ? offsetof(CPUArchState, tlb_table[mem_index][0].addr_read)
+           : offsetof(CPUArchState, tlb_table[mem_index][0].addr_write));
+    int add_off =3D offsetof(CPUArchState, tlb_table[mem_index][0].addend)=
;
+    RISCVInsn load_cmp_op =3D (TARGET_LONG_BITS =3D=3D 64 ? OPC_LD :
+                             TCG_TARGET_REG_BITS =3D=3D 64 ? OPC_LWU : OPC=
_LW);
+    RISCVInsn load_add_op =3D TCG_TARGET_REG_BITS =3D=3D 64 ? OPC_LD : OPC=
_LW;
+    TCGReg base =3D TCG_AREG0;
+
+    /* We don't support oversize guests */
+    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+        g_assert_not_reached();
+    }
+
+    /* We don't support unaligned accesses. */
+    if (a_bits < s_bits) {
+        a_bits =3D s_bits;
+    }
+    mask =3D (target_ulong)TARGET_PAGE_MASK | ((1 << a_bits) - 1);
+
+
+    /* Compensate for very large offsets.  */
+    if (add_off >=3D 0x1000) {
+        int adj;
+        base =3D TCG_REG_TMP2;
+        if (cmp_off <=3D 2 * 0xfff) {
+            adj =3D 0xfff;
+            tcg_out_opc_imm(s, OPC_ADDI, base, TCG_AREG0, adj);
+        } else {
+            adj =3D cmp_off - sextreg(cmp_off, 0, 12);
+            tcg_debug_assert(add_off - adj >=3D -0x1000
+                             && add_off - adj < 0x1000);
+
+            tcg_out_opc_upper(s, OPC_LUI, base, adj);
+            tcg_out_opc_reg(s, OPC_ADD, base, base, TCG_AREG0);
+        }
+        add_off -=3D adj;
+        cmp_off -=3D adj;
+    }
+
+    /* Extract the page index.  */
+    if (CPU_TLB_BITS + CPU_TLB_ENTRY_BITS < 12) {
+        tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP0, addrl,
+                        TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP0, TCG_REG_TMP0,
+                        MAKE_64BIT_MASK(CPU_TLB_ENTRY_BITS, CPU_TLB_BITS))=
;
+    } else if (TARGET_PAGE_BITS >=3D 12) {
+        tcg_out_opc_upper(s, OPC_LUI, TCG_REG_TMP0,
+                          MAKE_64BIT_MASK(TARGET_PAGE_BITS, CPU_TLB_BITS))=
;
+        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP0, TCG_REG_TMP0, addrl);
+        tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP0, TCG_REG_TMP0,
+                        CPU_TLB_BITS - CPU_TLB_ENTRY_BITS);
+    } else {
+        tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP0, addrl, TARGET_PAGE_BITS=
);
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP0, TCG_REG_TMP0,
+                        MAKE_64BIT_MASK(0, CPU_TLB_BITS));
+        tcg_out_opc_imm(s, OPC_SLLI, TCG_REG_TMP0, TCG_REG_TMP0,
+                        CPU_TLB_ENTRY_BITS);
+    }
+
+    /* Add that to the base address to index the tlb.  */
+    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP2, base, TCG_REG_TMP0);
+    base =3D TCG_REG_TMP2;
+
+    /* Load the tlb comparator and the addend.  */
+    tcg_out_ldst(s, load_cmp_op, TCG_REG_TMP0, base, cmp_off);
+    tcg_out_ldst(s, load_add_op, TCG_REG_TMP2, base, add_off);
+
+    /* Clear the non-page, non-alignment bits from the address.  */
+    if (mask =3D=3D sextreg(mask, 0, 12)) {
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addrl, mask);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_TMP1, mask);
+        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addrl);
+     }
+
+    /* Compare masked address with the TLB entry. */
+    label_ptr[0] =3D s->code_ptr;
+    tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
+    /* NOP to allow patching later */
+    tcg_out_opc_imm(s, OPC_ADDI, TCG_REG_ZERO, TCG_REG_ZERO, 0);
+    /* TODO: Move this out of line
+     * see:
+     *   https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg02234=
.html
+     */
+
+    /* TLB Hit - translate address using addend.  */
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_REG_TMP0, addrl);
+        addrl =3D TCG_REG_TMP0;
+    }
+    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
+}
+
+static void add_qemu_ldst_label(TCGContext *s, int is_ld, TCGMemOpIdx oi,
+                                TCGType ext,
+                                TCGReg datalo, TCGReg datahi,
+                                TCGReg addrlo, TCGReg addrhi,
+                                void *raddr, tcg_insn_unit **label_ptr)
+{
+    TCGLabelQemuLdst *label =3D new_ldst_label(s);
+
+    label->is_ld =3D is_ld;
+    label->oi =3D oi;
+    label->type =3D ext;
+    label->datalo_reg =3D datalo;
+    label->datahi_reg =3D datahi;
+    label->addrlo_reg =3D addrlo;
+    label->addrhi_reg =3D addrhi;
+    label->raddr =3D raddr;
+    label->label_ptr[0] =3D label_ptr[0];
+}
+
+static void tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    TCGMemOpIdx oi =3D l->oi;
+    TCGMemOp opc =3D get_memop(oi);
+    TCGReg a0 =3D tcg_target_call_iarg_regs[0];
+    TCGReg a1 =3D tcg_target_call_iarg_regs[1];
+    TCGReg a2 =3D tcg_target_call_iarg_regs[2];
+    TCGReg a3 =3D tcg_target_call_iarg_regs[3];
+
+    /* We don't support oversize guests */
+    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+        g_assert_not_reached();
+    }
+
+    /* resolve label address */
+    patch_reloc(l->label_ptr[0], R_RISCV_BRANCH, s->code_ptr, 0);
+
+    /* call load helper */
+    tcg_out_mov(s, TCG_TYPE_PTR, a0, TCG_AREG0);
+    tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
+    tcg_out_movi(s, TCG_TYPE_PTR, a2, oi);
+    tcg_out_movi(s, TCG_TYPE_PTR, a3, (tcg_target_long)l->raddr);
+
+    tcg_out_call(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
+    tcg_out_mov(s, (opc & MO_SIZE) =3D=3D MO_64, l->datalo_reg, a0);
+
+    tcg_out_goto(s, l->raddr);
+}
+
+static void tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    TCGMemOpIdx oi =3D l->oi;
+    TCGMemOp opc =3D get_memop(oi);
+    TCGMemOp s_bits =3D opc & MO_SIZE;
+    TCGReg a0 =3D tcg_target_call_iarg_regs[0];
+    TCGReg a1 =3D tcg_target_call_iarg_regs[1];
+    TCGReg a2 =3D tcg_target_call_iarg_regs[2];
+    TCGReg a3 =3D tcg_target_call_iarg_regs[3];
+    TCGReg a4 =3D tcg_target_call_iarg_regs[4];
+
+    /* We don't support oversize guests */
+    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+        g_assert_not_reached();
+    }
+
+    /* resolve label address */
+    patch_reloc(l->label_ptr[0], R_RISCV_BRANCH, s->code_ptr, 0);
+
+    /* call store helper */
+    tcg_out_mov(s, TCG_TYPE_PTR, a0, TCG_AREG0);
+    tcg_out_mov(s, TCG_TYPE_PTR, a1, l->addrlo_reg);
+    tcg_out_mov(s, TCG_TYPE_PTR, a2, l->datalo_reg);
+    switch (s_bits) {
+    case MO_8:
+        tcg_out_ext8u(s, a2, a2);
+        break;
+    case MO_16:
+        tcg_out_ext16u(s, a2, a2);
+        break;
+    default:
+        break;
+    }
+    tcg_out_movi(s, TCG_TYPE_PTR, a3, oi);
+    tcg_out_movi(s, TCG_TYPE_PTR, a4, (tcg_target_long)l->raddr);
+
+    tcg_out_call(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
+
+    tcg_out_goto(s, l->raddr);
+}
+#endif /* CONFIG_SOFTMMU */
--=20
2.19.1


