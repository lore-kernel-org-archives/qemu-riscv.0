Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQED-0005zo-I6
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:35:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQE9-0005xV-Fz
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:35:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQE5-0003sG-I8
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:35:09 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:26949)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDz-0003nB-F7; Thu, 15 Nov 2018 17:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321384; x=1573857384;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=blojcwrc9p/9PTv5IB/BUulhjAOR/2M0ldqvMix2Gzg=;
	b=MHwkuGbzW29zibnTMT0a8buqHha+qvuPR4Q4NsDa2rdGyzUlGaBlg//w
	xR7k6R0lC1MfvR75DBjivxkb373hwvN58U2HuknM4V0sC8NoC8itcYCUP
	b4K4g56zgrYkWKLx1vb0WT3NeivKprIxjm7FDjZw3LL8By5a9ZlxlBErb
	LB50q0WfZ7Ofdo75SZLD1rUL+mKjxMVFBn/QH9wIt7Vxt/gKjqiu+3EiI
	u9LXcHYndLRzq3C1uqQmKpV7n1iR8aTmDmmFYHb648F7s8ZNTRWfCsp4q
	6aGg+JcP3Vyz9OXrQf8GaIbtuUS5uNEd9FX29e+1K8exm3kh8/vGqfzYl Q==;
X-IronPort-AV: E=Sophos;i="5.54,499,1534780800"; d="scan'208";a="192154404"
Received: from mail-sn1nam04lp0088.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([216.32.180.88])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:36:21 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=aPDWGYTxwSY2L8hFeZ6YCHrYcrBPv6OqwmDwABntV8M=;
	b=B6lvsRiCTT4h/k3509UZElOxsufYZpX2f73IiI6I9xohONXjZuw6CnoFiZzCjL1btVYuKU5w91B2TstmqlorXpA92qpGRwDIMF7C2o5yByp/Vaba3Ju/tOfg7H8hT03ONYauTOwwjhuXL1v7xynQm3EoWdUsVixiLk4lu6/0a/8=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0481.namprd04.prod.outlook.com (10.173.48.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.27; Thu, 15 Nov 2018 22:34:56 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:34:56 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 07/23] riscv: tcg-target: Regiser the JIT
Thread-Index: AQHUfTNvt657zwYMG0Gd0EUa+4zm8A==
Date: Thu, 15 Nov 2018 22:34:56 +0000
Message-ID: <bc29bf08db9e3801a3e833f579d93ee2c86cc49d.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0064.prod.exchangelabs.com (2603:10b6:a03:94::41)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0481;
	6:wae5saquMZ61oMrukYBRJtDX03wX/LHSqj8id5Ey84TtnevwEtvlNBkbR2U363YENeRMYb+2jfFSb9lfyOcZhRYPaMPPGfz/hwpOVcRa2Wxa66qJvaZ8TOyb8QbfcP3mN2thwZdAd/NaggKq+PB6j1cJpp4633KJC27jOl7j2MGoh8wJdqZsBk7B9K8sQepUU4BfIQolQ+9l7ODNSIJ1D+UIJZxhYvfiieH7ol29P4ZMLj5hobZu7L7zpv9zh97p3kkfjSsWG26Teh1pxDHb0NmIiCi9bX2LoJLMKz4CN5aPgURGYy4TUa+6/6hA13qzgjbbyvxG/C4HnEdDAiDVPrKQ79l3MrA/sE4lB36S/IrknmgwuGIMuEavm3u20mOmviVfcMxmacNJjKYb/Z2wn7X4+myRFgDJfbHBH4K3i2QYqd8LxRp3mNqOH6aWSYvBiYmkJ5snFz+raZcyqeut8A==;
	5:jcG9ErzjJNZ5fDQNsupCeF3nQh8qL+PbpluHJWgbvF89i+/3iZMqIXqF43dgN8RaIMqPqCAAnr8RXDGU2jKUr5rGnIAsRPiByXWbb0xW43IaJL0yuB/wkCCL7E3lOYQ9IlnqAV+rwul5TnZ6ZoEm8xdi2LO2hHmSeXuLqjNx20Y=;
	7:g9jsE4wcX4YulWbqZ2hVGNrfBgj6s2ovCWv4IyNFkmoS8k4R+5ahTTj+5L+xQkWu8tR8wPO9E+AmGFtj4OGD8NRg6sQHAWGL1QHSP5ATHbcywLzz1ePV/lli7Oy4ZJpPHPMElljqGsQFpHvrx7L5Xg==
x-ms-office365-filtering-correlation-id: 8f380c20-5230-4079-c006-08d64b4a916e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0481; 
x-ms-traffictypediagnostic: MWHPR04MB0481:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0481A2E743A0AB30934B64B190DC0@MWHPR04MB0481.namprd04.prod.outlook.com>
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
x-microsoft-antispam-message-info: OqVb8xh/HCyZxDgFEQ3U2KH/McVCpKyhVgGVv95wq+xipbNpyN0qNRYSXSs6jTLNLWwuuCd4/pK4/f7YaXBAZYrIfb9+SpxLNpwIxAIs87jT4fmyrRSSCC3mPbekotGg+fdU7YguqZFcXuIU0uQlZOUMPlhyeouXSzNOpp+3P7BrODfabNiCSRw34JSa5ksGmPVRvBuV2Uc2NgtAR/P8pO6QoEPcIEtUsplh5RMn1MhQ0Seys2n8HCH8um8Ed2GvZpaqhzSfI2/5ExhZuuMhqLM9ZGKzcptp4ucVvETKsVOMepIl42NNQ0S6TIxe3f7POZyD1/GLHVtbY2zQmeoovTebbvgcd4+Eml0UZlLHr5s=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f380c20-5230-4079-c006-08d64b4a916e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:34:56.2334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0481
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [RFC v1 07/23] riscv: tcg-target: Regiser the JIT
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
X-List-Received-Date: Thu, 15 Nov 2018 22:35:12 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.inc.c | 45 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
index e5eca4bbbe..a9c57493a0 100644
--- a/tcg/riscv/tcg-target.inc.c
+++ b/tcg/riscv/tcg-target.inc.c
@@ -118,3 +118,48 @@ static const int tcg_target_call_oarg_regs[] =3D {
 #define TCG_CT_CONST_ZERO  0x100
 #define TCG_CT_CONST_S12   0x200
 #define TCG_CT_CONST_N12   0x400
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


