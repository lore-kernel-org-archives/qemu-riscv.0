Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkbU-0005i9-KD
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:09:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkbQ-0005eS-H5
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:09:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkbN-0004uw-9r
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:09:04 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:54878)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkbI-0004sX-76; Tue, 27 Nov 2018 16:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352954; x=1574888954;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=tQRG14xkKjYTpNjeoc0Nj4oIFEs3WK6oqNPZJEZQh50=;
	b=ZJtCMHF0nhhNvCTBwBTyxUI/0VVMPa1cVM6VpBrOUh8fmuMF8Omr8vOR
	0eBcDLyXGn+Fp2QzNreF24zsTwXM0eesuMo4BOV78LYTKmDEoZDrYaQol
	Jvgd+Z4Nh6um1JXpqI7Fv8q3KBhcrJvf8AkW+IvLCEhcSJXk8rC1lkHbf
	v1xezDRMTU+HXHM23HFdFfol/I3DapUwOlfauayEUJx7dNc7XqZWazqw3
	u2jH8YuywD6SI1Ukdv+HYfGTORiZMuou/1ZSzv+1NUfXtUpF5PxdAT3l3
	V/vruqq0Ff6lffnab0uLbMbE8bieglSYl8dM+BKfXABDmh9BpDAGc/SSY A==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="193052841"
Received: from mail-sn1nam02lp0021.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([216.32.180.21])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:09:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eHwaDDDPX44wG5Tcd+ei/aePZXQb7d5Ebf8+0XUbCPU=;
	b=onzQYklS9KYmjIuih8pZYJfbJDB2DIpglBQWtnWIrlel7xgd35tRQekB6WVCr+7wA4I2DN4fGXMMYBDXvaK/2C0aTOp0zTz/VYMv2ce+nXWWowBmJ1W3uNtgE/HTQRY98UqBstriJiFGtFkRZ4vGZXpXZkMIN7Ifq3cToIAqSEM=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1121.namprd04.prod.outlook.com (10.173.51.23) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 21:08:52 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:08:52 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 15/24] riscv: tcg-target: Add slowpath load and store
	instructions
Thread-Index: AQHUhpVmqv8/IUOGkUavhisHE2Uc3g==
Date: Tue, 27 Nov 2018 21:08:52 +0000
Message-ID: <653c85e3b65137352800f540eb195dc801159084.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0001.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::14) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1121;
	6:JV0yQg/809hR1oBZUZJ/sKM2RR4RNYquuqD0PiU19dgYcjvAb/Lqdz384CdvtJ3Vt6Vaq9ijEWFgv6s6qyiI4iULWdrtvyIb1s5b+Iir0+oOr/aWFYBgFKG8n7OQ3TMzeyJukFdetfypofSceJk8S9H7hknaotVOuLXY0qdwm8CnTiQ517LuTPZPsK6vGgNLo6qgHLUscOKeJd1JNpQKdYdBLMbZtIsZKpncMRIpl0USS5H1Zb6jBRo1iNstC3l8dkLJo/as6m47OMqP3haL1l+UN4JxtgSDqZ5W9ZsLrRUuEfyWACb1kcGgh1+63V6rS6odXVG1ZpsKjix6smef58VCfYbmKNEjamZ8gBAUWJ0WuGQul7mJAcVqtmepMOIycnUAwkkxWs44oiId4saHL0yWmtqUd+FrQO/OKB+s1ibP/tR4z7fHewGQWFSw06kI4aCuxHmI9ejEORES10ftWQ==;
	5:/7KAqYJk+7vtGqSg0y1whu83eUlN+cYwAUHEIZRwjhYYoA0ycwg35covBhA5h9EhQW474pVSRmJg0W0897kwyyGntCdUm3/KveztfEO8FIXE2D0i4EAyxiTelkox/viAFn8yNdBKJhQFYdPnguIT+gj4UN/CpnDd32lYceu4zcQ=;
	7:IG9wPahKbULuzFbXASEGH/mgZCs5CyAj2BJm5F2LWCZbKK7r1IIcYQWiI8VC4i58Ptg2oFJTzrqBS1g7jV4uhWlEGPoc6YLokbpIlZnrGBTXGDBoYoXueQBCK9oLZTd2lgrxkTUx9KDfdRsgOxs51A==
x-ms-office365-filtering-correlation-id: b23df7c6-477a-48cf-92be-08d654ac88a1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1121; 
x-ms-traffictypediagnostic: MWHPR04MB1121:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB112112B0630BBA05D63B478090D00@MWHPR04MB1121.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231443)(944501410)(52105112)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1121; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1121; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(39860400002)(376002)(346002)(366004)(199004)(189003)(186003)(2501003)(26005)(256004)(25786009)(36756003)(86362001)(966005)(6506007)(102836004)(386003)(71190400001)(105586002)(71200400001)(97736004)(2906002)(76176011)(3846002)(6116002)(72206003)(52116002)(99286004)(106356001)(118296001)(8676002)(50226002)(39060400002)(4326008)(110136005)(316002)(6436002)(7736002)(53936002)(44832011)(6512007)(54906003)(6306002)(476003)(478600001)(305945005)(66066001)(446003)(11346002)(6486002)(81166006)(5660300001)(81156014)(8936002)(14454004)(486006)(68736007)(2616005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1121;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: PgCfx0jjH+K2hP+2MKsjBm4MpAwUphOLcJwBOT5MecnlJwSmzn1YoXWaD5A7Z2P0ImBn3HHmhbBa3XUADxbQ47Frl/0ciC69Ad+9XpuwAZyv1ntA18f6iRjflko6t6/MAZ4wZkslgjqp6yHqbQ2r3wwk+vhuxgml6jlEmmGSek0Uu0g1K6Ue9Y+EWNxO+DLO5u01R2UyOWBdzvsCFKEn4KGNdUX5HR1pbQ44FvTw5pUqv67aybYlJ70TVbsjccQtxaMWL/WvpxWFx6K1pczd4ULcNRej8hLWa3FHjkRrNOf86WmqthWN0wiicRbTEzmAjp0EUm3ucmFefuHzqSMrFivzt8Iw6urgAQBWrDiH61c=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23df7c6-477a-48cf-92be-08d654ac88a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:08:52.5714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1121
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [RFC v2 15/24] riscv: tcg-target: Add slowpath load
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
X-List-Received-Date: Tue, 27 Nov 2018 21:09:06 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 244 +++++++++++++++++++++++++++++++++++++
 1 file changed, 244 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index 97831bfb9d..4f3a6de52c 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -747,6 +747,250 @@ static void tcg_out_call(TCGContext *s, tcg_insn_unit=
 *arg)
     tcg_out_call_int(s, arg, false);
 }
=20
+static void tcg_out_mb(TCGContext *s, TCGArg a0)
+{
+    static const RISCVInsn fence[] =3D {
+        [0 ... TCG_MO_ALL] =3D OPC_FENCE_RW_RW,
+        [TCG_MO_LD_LD]     =3D OPC_FENCE_R_R,
+        [TCG_MO_ST_LD]     =3D OPC_FENCE_W_R,
+        [TCG_MO_LD_ST]     =3D OPC_FENCE_R_W,
+        [TCG_MO_ST_ST]     =3D OPC_FENCE_W_W,
+    };
+    tcg_out32(s, fence[a0 & TCG_MO_ALL]);
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
+    int addend_offset =3D (offsetof(CPUTLBEntry, addend)) -
+                            (is_load ? offsetof(CPUTLBEntry, addr_read)
+                                     : offsetof(CPUTLBEntry, addr_write));
+    RISCVInsn load_cmp_op =3D (TARGET_LONG_BITS =3D=3D 64 ? OPC_LD :
+                             TCG_TARGET_REG_BITS =3D=3D 64 ? OPC_LWU : OPC=
_LW);
+    RISCVInsn load_add_op =3D TCG_TARGET_REG_BITS =3D=3D 64 ? OPC_LD : OPC=
_LW;
+    TCGReg base =3D TCG_AREG0;
+    TCGReg cmpr;
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
+            adj =3D cmp_off - sextract32(cmp_off, 0, 12);
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
+    tcg_out_ldst(s, load_cmp_op, TCG_REG_TMP2, base, add_off);
+
+    /* Clear the non-page, non-alignment bits from the address.  */
+    if (mask =3D=3D sextract64(mask, 0, 12)) {
+        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addrl, mask);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_TMP1, mask);
+        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addrl);
+     }
+
+    /* Compare masked address with the TLB entry. */
+    label_ptr[0] =3D s->code_ptr;
+    tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
+    /* TODO: Move this out of line
+     * see: https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg02=
234.html
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
+    reloc_sbimm12(l->label_ptr[0], s->code_ptr);
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
+    reloc_sbimm12(l->label_ptr[0], s->code_ptr);
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
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
--=20
2.19.1


