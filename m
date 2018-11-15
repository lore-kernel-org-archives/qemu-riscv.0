Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQGA-0007jJ-MS
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:37:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQG4-0007b0-21
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:37:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQG0-0004vr-L3
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:37:07 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:50663)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQFu-0004r4-CE; Thu, 15 Nov 2018 17:36:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321418; x=1573857418;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=M3Os+PficGmiG5CxXXF8M8XZqujmgHhFDzxPkKQyzdw=;
	b=Aq+tpfgXDiaiC9DWG5zE23GLKeLmK29lYeKtIew22Xx3sy09i4K8Ad9D
	rrgyUm0sOPmHNaReSvEdFczcCv5zQUbuGFGUNGpZpvVWW4RQNe/fykmBw
	tkpQ0eKbbei23T2SfDi4/Y94LEQwtx72HKfW3l0VcEVglf3YRs/cZbvvm
	bPufBD4zTImeajW1gaTo1AR8qguE9egYNPfvrzBZ4zpHU4Bst9hKaAoZe
	MPV90bDhiCY2G+fI9/VQ5qCBlmJglM96pvWE64tdNM59yz9rmPuTpZyFE
	iPhIuHW+AX3Jv8FzPzn5qmRRdcJs5dNtAUt7s/IWG/VUlOWWJTfLmiH9E A==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="95523418"
Received: from mail-cys01nam02lp0051.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.51])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:36:47 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NusdP1MkqcdAmhRNwrMtEizWF/SVZWg4LovuJ7KQj74=;
	b=ectHJc6Pec42+9g036cM9PQl3OW+g6LIeueSgW42/f+0whkcXasH45VTfYjgTDpBsqvOpGAEw41pMclEO6iTw2iuspyHZZfWmxFx4uw2EIryk5yfeCahj2QLwWASc3xp/c3f6p1/of/QpsyajaHzVbScd1Z+/rVjEYShMoBCe2I=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0865.namprd04.prod.outlook.com (10.172.169.7) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.36; Thu, 15 Nov 2018 22:36:46 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:36:46 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 19/23] riscv: tcg-target: Add the prologue generation
Thread-Index: AQHUfTOwYRo8kNCrWkivyVuZpicg4g==
Date: Thu, 15 Nov 2018 22:36:46 +0000
Message-ID: <526c9ffdb23b75e96508703b9c9e3bc95cfac939.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0076.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::17) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0865;
	6:oTltrtX4O1Hb82AI1AI64OonPGSRzTNdaApfZCtaRpnIZN9n27cT8EjPkofVe1O0m7v+o/m4VjCjf0NRKWvVkAwJM7zBvmCBCdi2qG5pGld3e4zudrq1C+W1XWnQYxdrxu1spQ1bH6XVkuIOn+MmUGKJsZPjXXdeSZaOOcz/eWUfhMpBx7c8Ve1wsheVOcvh4FSZIvzfn1zQ5uqtQpBJQPOFji2vqBWeNhj7KwXIGivRRYJwrhvk5iXuMnRmnD0KBTD5cFZChFX09T4TbECMQXdxIDpS7Xg1bADOuGuQ0McMuCfsUC9MaP7r5y+foFjCHAd8rC5AuKYvu+b0QrtyNwDMP3NlgvRrdk81CkkMtwpwNOHEvjlRGSVmtSuUq53fO+6Li6w4BbGHVyXMuuI+N6ko3lq7iU+hxdzS+9vQq5eArWaW3jMXFJ3dT0xiarbXTN8RpQlSJwOrlEdClGRZQg==;
	5:cXUVH+h7dLg7rb+pP4wQcWPk/oSjeGoHegLSLZTtV7UZ7t6PAvxFLKi7qPewbQU9h/QLLr9KNEMRILA+AefEAQ2mUB5X6vrmrN+fuLJC8RkX5roZKO603SjXMVJdy5DMTD0a/fmMFJKrFzugMh9aKDBDsA6t181yWQjcOmFvSBc=;
	7:vpMxU6doX5KL+KDD+EYuA17iJoXx2VqH+cW8Q+PJRkR/+zJXch/XDsMRb2wLelh/A3+ebbqC6+fgBpxG1hzEn6Q/9SioFZl23CKSeLBjWxz4BwunIPCrxh96LwUWzjqWs1EpHbpqChL+bTYJoNPP9Q==
x-ms-office365-filtering-correlation-id: 4347de98-232f-4fe6-7b1d-08d64b4ad2f7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0865; 
x-ms-traffictypediagnostic: MWHPR04MB0865:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB08654D7B66AD640A4A25556F90DC0@MWHPR04MB0865.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: 3nCis0bm4x8c6WEn6xCkCDTp3P33Mo6LIISjB8fE5gknOR8qe5pX8OWaCe5NXz6YA3TNCiGRFBHeyNdaI/j7JeNVzbadn2nd1Orq6BJ4/QgBBnXgGWJYm9nPpLjnxj8hsRwWgg57saXKNZYCz8mDhC/OX0H0J7WX0nElyFRTBwZVXFddUxFySKShODQfsoAcwGsoTfZ774z7uFNggtvANo5C+N7bTpzGi5icPo7hq+i7nquQH4SkKjfOEnuWIncrngVCKA9XcdZ1CWtnIHgq8uEB/iaoh9MnftOH5bFySAyy74I+BuUkRbt8oKwnhMZbagkCjk4bQ+U6OBfpaPBENfC0KObu4UPnihmvH8htIjs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4347de98-232f-4fe6-7b1d-08d64b4ad2f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:36:46.1733 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0865
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v1 19/23] riscv: tcg-target: Add the prologue
 generation
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
X-List-Received-Date: Thu, 15 Nov 2018 22:37:11 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 66 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index bf3b04f7dc..4b8f65f367 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -1575,6 +1575,72 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOp=
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
--=20
2.19.1


