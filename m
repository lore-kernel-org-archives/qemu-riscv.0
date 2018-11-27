Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkbs-00063y-39
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:09:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkbq-000628-3N
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:09:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkbp-00057D-2x
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:09:30 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:36212)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkbi-00053G-2m; Tue, 27 Nov 2018 16:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352962; x=1574888962;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=tu4KubrJthdndQ0xqyeHd3DzahtX/3r37vfVnXaI1bo=;
	b=C5a/TFKGeaYS1nq58ur0BDbQDrUwNZpkQcJS5oy1eb5KQZu8zY4gj7mr
	YO25YXGun++8mloWkzTW/acEdrQI1aBx55mp5Lg42KWNMSbUQKM3LDfrh
	8IqAbpu0/0u9hDh0VdlPKV+GU0rVeeb72f7JhamDgu0l6CTe0oaDYj4pb
	33Kg2SuEIE4FvkB6O0vpcgO11ILChTTqXIoRI6OzzeUHl8SlHuif/8R4P
	aUbx8cNAu1oKBFvm9WqdfjjHlAr62aw9hGlnKv6/dsyzuqRaskWkoIega
	Y7xUdE/xLEoGH08a9RsWE5mq4akSOMdAqdX6CsV4S58UhY960M709P+Ib w==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="100064282"
Received: from mail-cys01nam02lp0050.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.50])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:09:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ipxbCc4wnnWwN7HdTTtEL6Lf7WTe+OjAJEs7R0rwVps=;
	b=S2ODdhFe6lLR94YmulbcyiYzMWxhXTC0Ybyvkn5une6Vqm06c3X2BlIAddT6BA1xECKOYpzIRyH65ZGmjM4Eo8TOfrQqgobRR8SEov9LZH/IUwnYXDibuAgYqPjENFtMAL0SvUzlrYizfdoCSiE0au2QZKqAAREpjvoaWf2zkRc=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0639.namprd04.prod.outlook.com (10.172.166.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.15; Tue, 27 Nov 2018 21:09:19 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:09:19 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 18/24] riscv: tcg-target: Add the prologue generation
	and register the JIT
Thread-Index: AQHUhpV2/7lATafQn02vG87pMsokbA==
Date: Tue, 27 Nov 2018 21:09:19 +0000
Message-ID: <445bbf96c17c4bdb0857fe03707a8911d4b5fec2.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR08CA0030.namprd08.prod.outlook.com
	(2603:10b6:a03:100::43) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0639;
	6:dUarxLvJF7hA1IN7LAOGir68oMBvXbm07MdCIeRYHvmruzp0jtXFV04TgiOaqpBhJ1QgWg/LqaJMG0ea7GOXZuk0diH0Necge2GrSGDw62KhDVh92UIQN7+yIDi9HzCQyeRKYEZpxbRY+UEPlb3yiKQrlrBefog9g5Fk6A0egogvDsHqpk9znzB7I3iZzy2/b+QNAT5l/bDl3VsEmz+tfDeyFtGC9y38eEjGH01FIhzZ85NSQZIEtgK3vNFFGGTQW/Jdu+xi4t8fHmZ4KzxpRDPshwH7bCCURAnEE1P+oRZcVpmGjD4JnMquM+z+3NZ+1fI5Fgs7g1twPwjxyI1vlWb3SdWWenyECntG3zUdNsr6/KBe7q967wg5tBKzCBYFAgybDMVrd+3v7I6CEKWCdcnYG48uJIjDRY6it4Azd4wpzLrQ7lLirzeuFoJQYXkXYuGF6RCOI1Ox/41iaD20WQ==;
	5:T3bdYihg/1qkwzricoPnLxOKDwmB8eO8+xNnDQkG090W7VFY+DcJRqod4zFYDsdtJsJKNNjzSgrXb08ypvKwOX7uF90dTDUZoBBRXbse/ETvFOGw5PRB7JjcGdhRefHggqevdNPBDsVl488DzngP1gwKa4UpoTRdVwtTOpmRaig=;
	7:9wU55c7PpIg6/NFzj2nsjRy+f3aJQJul1sEFLbg0FWpKDvVgmZWuaDK7Hvu5vkxjjBhU/q5ktFIOSoDGgpoQ+/EntkMhSz3g/syMmh9r1aI2/FOTZRq78wr7NmdLj1hKY/CkDd/bfek8TgNbme/7IQ==
x-ms-office365-filtering-correlation-id: 49a64bf0-77da-4366-8995-08d654ac989a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0639; 
x-ms-traffictypediagnostic: MWHPR04MB0639:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB06390C99AA5E8B84A274FC8290D00@MWHPR04MB0639.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231443)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0639; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0639; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(376002)(346002)(396003)(366004)(199004)(189003)(86362001)(6436002)(53936002)(97736004)(6512007)(2906002)(66066001)(8676002)(8936002)(81166006)(81156014)(50226002)(54906003)(110136005)(5660300001)(316002)(118296001)(7736002)(2501003)(6486002)(68736007)(305945005)(36756003)(478600001)(72206003)(71190400001)(71200400001)(52116002)(76176011)(6116002)(386003)(6506007)(102836004)(44832011)(2616005)(476003)(3846002)(26005)(186003)(486006)(14454004)(99286004)(446003)(25786009)(106356001)(39060400002)(105586002)(256004)(11346002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0639;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: hFSSNjPXbvlAj0/nfcibHEeClbQdSh26bCnUTGqmj3SSsnpA12OjXdYyL07kCiYSw0hZNvon1+pvTgnbdDY5rPI/pOjp8nw6V4WkTS9IDQhYr++zqXVlCWmUJlkBe+WZcTwvB3uoPdK/yxKoH+rkWeYrBH7y0UQIrfL5oqe/lmSkigf8lpj/7DyvrzXare6JUk/pvv4SZ+Z/Rp/Q6CwSgcOJzhHWXnvB5gglcJNH/bg2vHSQtDhOMp5bBG3gLeEhFUftixC9UFiSY+tKrZyiH2dv4yUscpWTmA6nfZDdgpMl5sS3PqxssZJnThZ/S3Lww4l7n9t7LmbG4bTTCislftd9b9wW+NyHC9TVXKzqMTY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a64bf0-77da-4366-8995-08d654ac989a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:09:19.3689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0639
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v2 18/24] riscv: tcg-target: Add the prologue
 generation and register the JIT
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
X-List-Received-Date: Tue, 27 Nov 2018 21:09:31 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 111 +++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index d5fd7ca854..51961ade81 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -1617,6 +1617,72 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOp=
code op)
     }
 }
=20
+static const int tcg_target_callee_save_regs[] =3D {
+    TCG_REG_S0,       /* used for the global env (TCG_AREG0) */
+    TCG_REG_S1,
+    TCG_REG_S2,
+    TCG_REG_S3,
+    TCG_REG_S4,
+    TCG_REG_S5,
+    TCG_REG_S6,
+    TCG_REG_S7,
+    TCG_REG_S8,
+    TCG_REG_S9,
+    TCG_REG_S10,
+    TCG_REG_S11,
+    TCG_REG_RA,       /* should be last for ABI compliance */
+};
+
+/* Stack frame parameters.  */
+#define REG_SIZE   (TCG_TARGET_REG_BITS / 8)
+#define SAVE_SIZE  ((int)ARRAY_SIZE(tcg_target_callee_save_regs) * REG_SIZ=
E)
+#define TEMP_SIZE  (CPU_TEMP_BUF_NLONGS * (int)sizeof(long))
+#define FRAME_SIZE ((TCG_STATIC_CALL_ARGS_SIZE + TEMP_SIZE + SAVE_SIZE \
+                     + TCG_TARGET_STACK_ALIGN - 1) \
+                    & -TCG_TARGET_STACK_ALIGN)
+#define SAVE_OFS   (TCG_STATIC_CALL_ARGS_SIZE + TEMP_SIZE)
+
+/* We're expecting to be able to use an immediate for frame allocation.  *=
/
+QEMU_BUILD_BUG_ON(FRAME_SIZE > 0x7ff);
+
+/* Generate global QEMU prologue and epilogue code */
+static void tcg_target_qemu_prologue(TCGContext *s)
+{
+    int i;
+
+    tcg_set_frame(s, TCG_REG_SP, TCG_STATIC_CALL_ARGS_SIZE, TEMP_SIZE);
+
+    /* TB prologue */
+    tcg_out_opc_imm(s, OPC_ADDI, TCG_REG_SP, TCG_REG_SP, -FRAME_SIZE);
+    for (i =3D 0; i < ARRAY_SIZE(tcg_target_callee_save_regs); i++) {
+        tcg_out_st(s, TCG_TYPE_REG, tcg_target_callee_save_regs[i],
+                   TCG_REG_SP, SAVE_OFS + i * REG_SIZE);
+    }
+
+#if !defined(CONFIG_SOFTMMU)
+    tcg_out_movi(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base);
+    tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
+#endif
+
+    /* Call generated code */
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_AREG0, tcg_target_call_iarg_regs[0]);
+    tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, tcg_target_call_iarg_regs[1=
], 0);
+
+    /* Return path for goto_ptr. Set return value to 0 */
+    s->code_gen_epilogue =3D s->code_ptr;
+    tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_A0, TCG_REG_ZERO);
+
+    /* TB epilogue */
+    tb_ret_addr =3D s->code_ptr;
+    for (i =3D 0; i < ARRAY_SIZE(tcg_target_callee_save_regs); i++) {
+        tcg_out_ld(s, TCG_TYPE_REG, tcg_target_callee_save_regs[i],
+                   TCG_REG_SP, SAVE_OFS + i * REG_SIZE);
+    }
+
+    tcg_out_opc_imm(s, OPC_ADDI, TCG_REG_SP, TCG_REG_SP, FRAME_SIZE);
+    tcg_out_opc_imm(s, OPC_JALR, TCG_REG_ZERO, TCG_REG_RA, 0);
+}
+
 void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_addr,
                               uintptr_t addr)
 {
@@ -1631,3 +1697,48 @@ void tb_target_set_jmp_target(uintptr_t tc_ptr, uint=
ptr_t jmp_addr,
=20
     flush_icache_range(jmp_addr, jmp_addr + 8);
 }
+
+typedef struct {
+    DebugFrameHeader h;
+    uint8_t fde_def_cfa[4];
+    uint8_t fde_reg_ofs[ARRAY_SIZE(tcg_target_callee_save_regs) * 2];
+} DebugFrame;
+
+#define ELF_HOST_MACHINE EM_RISCV
+
+static const DebugFrame debug_frame =3D {
+    .h.cie.len =3D sizeof(DebugFrameCIE) - 4, /* length after .len member =
*/
+    .h.cie.id =3D -1,
+    .h.cie.version =3D 1,
+    .h.cie.code_align =3D 1,
+    .h.cie.data_align =3D -(TCG_TARGET_REG_BITS / 8) & 0x7f, /* sleb128 */
+    .h.cie.return_column =3D TCG_REG_RA,
+
+    /* Total FDE size does not include the "len" member.  */
+    .h.fde.len =3D sizeof(DebugFrame) - offsetof(DebugFrame, h.fde.cie_off=
set),
+
+    .fde_def_cfa =3D {
+        12, TCG_REG_SP,                 /* DW_CFA_def_cfa sp, ... */
+        (FRAME_SIZE & 0x7f) | 0x80,     /* ... uleb128 FRAME_SIZE */
+        (FRAME_SIZE >> 7)
+    },
+    .fde_reg_ofs =3D {
+        0x80 + 9,  12,                  /* DW_CFA_offset, s1,  -96 */
+        0x80 + 18, 11,                  /* DW_CFA_offset, s2,  -88 */
+        0x80 + 19, 10,                  /* DW_CFA_offset, s3,  -80 */
+        0x80 + 20, 9,                   /* DW_CFA_offset, s4,  -72 */
+        0x80 + 21, 8,                   /* DW_CFA_offset, s5,  -64 */
+        0x80 + 22, 7,                   /* DW_CFA_offset, s6,  -56 */
+        0x80 + 23, 6,                   /* DW_CFA_offset, s7,  -48 */
+        0x80 + 24, 5,                   /* DW_CFA_offset, s8,  -40 */
+        0x80 + 25, 4,                   /* DW_CFA_offset, s9,  -32 */
+        0x80 + 26, 3,                   /* DW_CFA_offset, s10, -24 */
+        0x80 + 27, 2,                   /* DW_CFA_offset, s11, -16 */
+        0x80 + 1 , 1,                   /* DW_CFA_offset, ra,  -8 */
+    }
+};
+
+void tcg_register_jit(void *buf, size_t buf_size)
+{
+    tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame))=
;
+}
--=20
2.19.1


