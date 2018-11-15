Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQFs-0007Qf-Db
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:36:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFp-0007M6-DP
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:36:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFo-0004mb-4L
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:36:53 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:50627)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFM-0004c0-Ll; Thu, 15 Nov 2018 17:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321384; x=1573857384;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=2QrLSIBKrUwinH5QLYvqe8zR8s5wQtmSh5srJBKlDvE=;
	b=R6Uu1iczIYUBpWQc//CBnkvdnyUqTbiKg7PIw+H1r8gdDMF1mWLwpILd
	jqTIXaRJPJzRZhgmrJOUx83puO/DCP7g8BKdv4QxYdP+aOs52Tuo5qIXI
	IDOen0+Noa+ntOZcQ+0CblfSA9GRPE9gK6R75Bq8cfJR1fCPOOIIVQgCJ
	oAJWOKaaZ4vwFLofYSmOdP0HJdJNUt61IEETIQDYts1AlwRKY+SrB4xa8
	avxgMxbwqJ/X7s+IuLi4WNSSLjqHrqU5fpjTaCgmiikymbSWdg2qIY8Q6
	20P3lVbsNMMx49PDN70o+D+D3pNSXDJ4nuAD4KavnxyjmOtIYBlUZiVR/ Q==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="95523399"
Received: from mail-cys01nam02lp0049.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.49])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:36:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=G8/v64xeb/nnhcWslajpEqTGB4bIx3TKznLe1U0xJA8=;
	b=kCwThNi2zSOwH9EaMBYkYVCcuKhLEg03nGdiiWsTXBNT2n1Kx9GR7eBJ26DpS1cTr4taKNXQjTIL3vdDut+zULIDz4nQ8c533Fp38jwsXyNcg70i6p88mkvJblfoqvqxtWo0nRR5m/q+oVb+4K/b64spsNTMy5c8kifaDVIO4xo=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0865.namprd04.prod.outlook.com (10.172.169.7) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.36; Thu, 15 Nov 2018 22:36:19 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:36:19 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 16/23] riscv: tcg-target: Add slowpath load and store
	instructions
Thread-Index: AQHUfTOgKQwVshsiU0SbnVCiRouTSg==
Date: Thu, 15 Nov 2018 22:36:19 +0000
Message-ID: <bd8f5c781f7086c5b26e1bd4c8e6570b5534b22d.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0002.prod.exchangelabs.com (2603:10b6:a02:80::15)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0865;
	6:bVRBj5fL3mc5vC3B+p2aX+CRUg6kagX4K7hT269gT1n3cf5uGp8k0lMZJBzXnaV2KjZS8rTrr6hPW8W2SvfawHJZFw2/23UI5e/oG6YVd/3qm4NKmfv8kFzwK/kKue6ctIWdyx2ZZ92zqe3mjrram2kaennvFL47FPZXTihkIM3f5cHkEYASUNe/GTGXMldtuUB3uSvbhVHUxVbJosFctjO8pWjeCjSpQoXko3Z8/VF38dxvMEfhG4WBUq6EB0vNA5rA424oHP2tjAgP3pk1TI5QkZHDSUzHzAqQJUks6fpULxsERN0O0cLTATv8TcJ+Av66P4VuKrrTZIMKrd71Bz591/sB9ut0gY9XNdEZkoD4l7v7RSzEXj/qxNlNjiM5mpjdywaBGSVI3Oi0pJBR1C6a3j6HLDOlp03Yo4BVF7xhmXLMYMfboOJTtCenYCTS+OSZpudaqGIhoOLHylYxZA==;
	5:TkZkfCwyz4pDYMYifna69AB4gr1Vpf1aPEOd/lwrZ6DYaortmWCtWEQ80L3TreN7sVXqOzXyR8stmSxl2zkDDQXgAmTXf1pGRlryK06uufcKxcy/iHK7RnKQ4vmhFE2aRMprm20SaELKhsu99M6KettiBM0GRgPKrjq4CBYod2c=;
	7:LqwqqprzUgoxpO88U9NOB+nWoPVodz5FsoxMMft+4gku3L4/2rVtFwASRWJXiUE/NFPlXE8wInp/RYbrPKseSpEu2cqdA+acTm5p4vT8sV/kMYb/j24Doa9/GYZF4AgsInxrluCge3QG24bJYw0bHQ==
x-ms-office365-filtering-correlation-id: 45d81507-b9ba-4c27-81ce-08d64b4ac2d8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0865; 
x-ms-traffictypediagnostic: MWHPR04MB0865:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0865792CBCFE182D7783D15290DC0@MWHPR04MB0865.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: xZB+VyBtK71oSgSp++U4xnz3ae2eCTWEVByzyfIEFh8reZPW5FJ1/kUo16JcwX4rfbMDUDLx0VDJUXb45Oa1yPI4CgL7sWV4nnN7VCmUNoVaHw0MICXByvi9yOFl4vWroKqaZPsmuuDaK5YrHulQeXx5amzj984RbB5n95T64yvfKV2/0eX7MskwT2bYZ3P4Nb2FTiT96i6SkavIYABr/Sbb5TPwSnAOlO70FEVIcpj/SQEe1jA5K/FwA+M9OLSxIG0L9UD2svc3o80nmgZaBFvOBER1U9QH09oOsPmljnF9JCVuV6vLyFTSUlY2B/miqJHoyzY19eGlPSnJCd3IEy2ry+/TZEhoc9CrNBlYWrk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45d81507-b9ba-4c27-81ce-08d64b4ac2d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:36:19.1278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0865
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v1 16/23] riscv: tcg-target: Add slowpath load
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
X-List-Received-Date: Thu, 15 Nov 2018 22:36:54 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 240 +++++++++++++++++++++++++++++++++++++
 1 file changed, 240 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index b449e17295..5fe6935e24 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -718,6 +718,246 @@ static void tcg_out_call(TCGContext *s, tcg_insn_unit=
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
+        [TCG_BAR_LDAQ]     =3D OPC_FENCE_R_RW,
+        [TCG_BAR_STRL]     =3D OPC_FENCE_RW_W,
+        [TCG_BAR_SC]       =3D OPC_FENCE_RW_RW,
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
+    [MO_LESL] =3D helper_le_ldsl_mmu,
+    [MO_LEQ]  =3D helper_le_ldq_mmu,
+    [MO_BEUW] =3D helper_be_lduw_mmu,
+    [MO_BESW] =3D helper_be_ldsw_mmu,
+    [MO_BEUL] =3D helper_be_ldul_mmu,
+    [MO_BESL] =3D helper_be_ldsl_mmu,
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
+            tcg_out_opc_reg(s, OPC_ADD, base, TCG_REG_ZERO, TCG_AREG0);
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
+
+    /* TLB Hit - translate address using addend.  */
+    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
+        tcg_out_ext32u(s, TCG_REG_TMP0, addrl);
+        addrl =3D TCG_REG_TMP0;
+    }
+    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_L0, TCG_REG_TMP2, addrl);
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


