Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQDz-0005pu-A8
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:34:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDv-0005lU-JN
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:34:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDs-0003g1-D3
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:34:55 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:40007)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQDj-0003Xo-IF; Thu, 15 Nov 2018 17:34:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321283; x=1573857283;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=ARp5sQsUd1VRryIDuNXvYHrptUhDXsjhzQu5OXI00Nk=;
	b=iBtfN6WwWYyyJzvoF0LmumdtO4S3/aHsVVQl7fMAiFErGN+nHg/U0fDb
	5AnDF4EPzbmVWvlnW9mJAU2FKfymTk/cS6fLdEdqVBU20HZyrbrF1xje1
	lTNg+dCE4RX9xkPBJKgtop4pmtufCfbCzX6+0vs9KqF1Gz6qtf8xoeEVN
	d/kHaVcAzUaOcd4V3rvwuZZswczTE6aM3Qy5sTPdp6qce8n5JLH79OHla
	1kY2nMuKTBnOIp1yEzpruKz2ulDJt2zmKuyHN442JON5FCZBuMkjOI1dB
	tPwiDYtXLi8XJh9OmgWVPI5rhfEhz9WbBzq+NpLSjfU0yeOLd0JQi5YaC g==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="198884241"
Received: from mail-bn3nam04lp0112.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([216.32.180.112])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:34:39 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=aQUXaXEdPeoOVuXzS3Efhi4OwkQ6puQ1XpahEMqWPFk=;
	b=al9/gVXrB0jrr/iENMWmseXvVjAurnnHHYIxiN1CXyI+J9HQ84xrxCavk78ojsOPDcuyIt5wxrfVJBPw3mVppo/EAZy51wX+BsDLflDvbo4cxpmndj5rv+JW81AwVGUYs23oOKFAas6siHpl7begwR0Xn/emRT8JiMnpxDEpZeo=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0673.namprd04.prod.outlook.com (10.172.166.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.26; Thu, 15 Nov 2018 22:34:37 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:34:37 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 05/23] riscv: Add the tcg-target header file
Thread-Index: AQHUfTNkFVyD05bjnEi15QF4k9U3mQ==
Date: Thu, 15 Nov 2018 22:34:37 +0000
Message-ID: <1c17c37965dcd1b579a58af168892818b33453fe.1542321076.git.alistair.francis@wdc.com>
References: <cover.1542321076.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0051.prod.exchangelabs.com (2603:10b6:a03:94::28)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0673;
	6:X0VlW0b0Z7G1l7OaunDTZwCWy38Z5uyyQzfsVmX0m9WcPKoAC4LJlbT7A8u585c8+D/IaoDOnOaWXalm3UCKt7RZMx6Pn4EURpvHJW7a0jd1NxyhzwRdr7KSi6WM3oK4ErIW5KfHvilFn6m9oTBe8Y8Q0D4PYpZ/3khqqnXrHIjKNSyoWfen81pQ0ZtQoIiXW0XfxwuwRJau7aW577gc6rPjFMmab3U1ti7v77Ft/h9wwbwAOWUUM2icSdXtgVJm9h+ZvDfU89Jd6gIzunXF/a5tLXimr1nOo6rwpPisXjbWwutGgbjgjL7ES3ItE3WSnvkIksAx2p02OPj56iJSu12cpCndOEd3Ml1AP78glwYnVZ0TgeV2+794s5VKdrt+dAT46Iuuq2/P5dKsFzFkJ9/ROILSyiSVHRX1fb1M9Pe7wWZXWsTuSqrlw1jsXuENSV1QxhVsOU6ZMH+sXMjGqw==;
	5:66DKzLRgirXPMBoVYsICtT72+cXnzD4qUq06G9BeSf8Mh1ob4zh23FZaoDrzfBn0fKDx1qHYMtDAYDXjzqo6HT0MUPZYIpD3/wGJTRTqW4w47TfUM74ikS780C30nRdHDuOgCbvS2L2tJ6ufVRs0hLDT+8WEmHjKPxQIzuFxvE8=;
	7:jxhXssLUQzgWCgq+jGsEZNWOUI7tGEyQgAk75jDkSdNgThI81jmDP0lRM3oGyZ0SHj+LBFlHN3mPKe2M9ymQ7Ly85rBPcZiTOFMthGBLVDdUsOTQCZQdUXZ8DTnfK0/hHN13zhkCNnDiMQAcFGwH7w==
x-ms-office365-filtering-correlation-id: b0766ec6-c0b7-4692-c9fc-08d64b4a866e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0673; 
x-ms-traffictypediagnostic: MWHPR04MB0673:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB06739F4485921A293314D41E90DC0@MWHPR04MB0673.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231415)(944501410)(52105112)(10201501046)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0673; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0673; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(136003)(396003)(39860400002)(376002)(366004)(189003)(199004)(66066001)(256004)(14444005)(81166006)(71200400001)(71190400001)(8676002)(81156014)(316002)(2501003)(305945005)(7736002)(50226002)(110136005)(54906003)(2900100001)(44832011)(486006)(6486002)(8936002)(11346002)(446003)(2906002)(97736004)(476003)(2616005)(6116002)(3846002)(39060400002)(53936002)(4326008)(386003)(52116002)(76176011)(6506007)(26005)(102836004)(478600001)(186003)(72206003)(105586002)(106356001)(99286004)(6512007)(5660300001)(68736007)(118296001)(25786009)(86362001)(36756003)(14454004)(6436002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0673;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: t5vM4/mlTcpIbB15O2gubXic6SdfolnrwU7WuYlBkv5tO2HLeAw97t7z1zi0Lfe3UsDOQv4NEITpExvS+Du1qJ2mYwugz11EiNQSBTHl7A30XdENLVF3N9HfPqM6eJN2Cjded9Tqp4VzkjBhKt+mAROXEn5Fkm7oTu9JQaJ8JrMi/K2lwQNhA4NdxrrpdQdtR++8wfKf7V4Y2V3aix6n+bjyadctUAcmfp6nQI4hLh4xQ0fFZSvGh8ektebx1XRoyaAqOtL/1pyKSS5/vXrXH1prRMLAG7L50nF2YkVhmNmdU/QRhN9hstaOfeqLlJSv4DqaL4x3zEFFhrJ2T/7TvEZwY+nOlkLKbNZIsrYSwcU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0766ec6-c0b7-4692-c9fc-08d64b4a866e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:34:37.8487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0673
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [RFC v1 05/23] riscv: Add the tcg-target header file
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
X-List-Received-Date: Thu, 15 Nov 2018 22:34:58 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.h | 173 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 tcg/riscv/tcg-target.h

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
new file mode 100644
index 0000000000..53ab485983
--- /dev/null
+++ b/tcg/riscv/tcg-target.h
@@ -0,0 +1,173 @@
+/*
+ * Tiny Code Generator for QEMU
+ *
+ * Copyright (c) 2018 SiFive, Inc
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy
+ * of this software and associated documentation files (the "Software"), t=
o deal
+ * in the Software without restriction, including without limitation the r=
ights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN
+ * THE SOFTWARE.
+ */
+
+#ifndef RISCV_TCG_TARGET_H
+#define RISCV_TCG_TARGET_H
+
+#if __riscv_xlen =3D=3D 32
+# define TCG_TARGET_REG_BITS 32
+#elif __riscv_xlen =3D=3D 64
+# define TCG_TARGET_REG_BITS 64
+#endif
+
+#define TCG_TARGET_INSN_UNIT_SIZE 4
+#define TCG_TARGET_TLB_DISPLACEMENT_BITS 20
+#define TCG_TARGET_NB_REGS 32
+
+typedef enum {
+    TCG_REG_ZERO,
+    TCG_REG_RA,
+    TCG_REG_SP,
+    TCG_REG_GP,
+    TCG_REG_TP,
+    TCG_REG_T0,
+    TCG_REG_T1,
+    TCG_REG_T2,
+    TCG_REG_S0,
+    TCG_REG_S1,
+    TCG_REG_A0,
+    TCG_REG_A1,
+    TCG_REG_A2,
+    TCG_REG_A3,
+    TCG_REG_A4,
+    TCG_REG_A5,
+    TCG_REG_A6,
+    TCG_REG_A7,
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
+    TCG_REG_T3,
+    TCG_REG_T4,
+    TCG_REG_T5,
+    TCG_REG_T6,
+
+    /* aliases */
+    TCG_AREG0          =3D TCG_REG_S0,
+    TCG_GUEST_BASE_REG =3D TCG_REG_S1,
+    TCG_REG_TMP0       =3D TCG_REG_T6,
+    TCG_REG_TMP1       =3D TCG_REG_T5,
+    TCG_REG_TMP2       =3D TCG_REG_T4,
+    TCG_REG_L0         =3D TCG_REG_A6,
+    TCG_REG_L1         =3D TCG_REG_A7,
+} TCGReg;
+
+/* used for function call generation */
+#define TCG_REG_CALL_STACK              TCG_REG_SP
+#define TCG_TARGET_STACK_ALIGN          16
+#define TCG_TARGET_CALL_ALIGN_ARGS      1
+#define TCG_TARGET_CALL_STACK_OFFSET    0
+
+/* optional instructions */
+#define TCG_TARGET_HAS_goto_ptr         1
+#define TCG_TARGET_HAS_movcond_i32      0
+#define TCG_TARGET_HAS_div_i32          1
+#define TCG_TARGET_HAS_rem_i32          1
+#define TCG_TARGET_HAS_div2_i32         0
+#define TCG_TARGET_HAS_rot_i32          0
+#define TCG_TARGET_HAS_deposit_i32      0
+#define TCG_TARGET_HAS_extract_i32      0
+#define TCG_TARGET_HAS_sextract_i32     0
+#define TCG_TARGET_HAS_add2_i32         0
+#define TCG_TARGET_HAS_sub2_i32         0
+#define TCG_TARGET_HAS_mulu2_i32        0
+#define TCG_TARGET_HAS_muls2_i32        0
+#define TCG_TARGET_HAS_muluh_i32        (TCG_TARGET_REG_BITS =3D=3D 32)
+#define TCG_TARGET_HAS_mulsh_i32        (TCG_TARGET_REG_BITS =3D=3D 32)
+#define TCG_TARGET_HAS_ext8s_i32        1
+#define TCG_TARGET_HAS_ext16s_i32       1
+#define TCG_TARGET_HAS_ext8u_i32        1
+#define TCG_TARGET_HAS_ext16u_i32       1
+#define TCG_TARGET_HAS_bswap16_i32      0
+#define TCG_TARGET_HAS_bswap32_i32      0
+#define TCG_TARGET_HAS_not_i32          1
+#define TCG_TARGET_HAS_neg_i32          1
+#define TCG_TARGET_HAS_andc_i32         0
+#define TCG_TARGET_HAS_orc_i32          0
+#define TCG_TARGET_HAS_eqv_i32          0
+#define TCG_TARGET_HAS_nand_i32         0
+#define TCG_TARGET_HAS_nor_i32          0
+#define TCG_TARGET_HAS_clz_i32          0
+#define TCG_TARGET_HAS_ctz_i32          0
+#define TCG_TARGET_HAS_ctpop_i32        0
+#define TCG_TARGET_HAS_direct_jump      1
+
+#if TCG_TARGET_REG_BITS =3D=3D 64
+#define TCG_TARGET_HAS_movcond_i64      0
+#define TCG_TARGET_HAS_div_i64          1
+#define TCG_TARGET_HAS_rem_i64          1
+#define TCG_TARGET_HAS_div2_i64         0
+#define TCG_TARGET_HAS_rot_i64          0
+#define TCG_TARGET_HAS_deposit_i64      0
+#define TCG_TARGET_HAS_extract_i64      0
+#define TCG_TARGET_HAS_sextract_i64     0
+#define TCG_TARGET_HAS_extrl_i64_i32    0
+#define TCG_TARGET_HAS_extrh_i64_i32    0
+#define TCG_TARGET_HAS_ext8s_i64        1
+#define TCG_TARGET_HAS_ext16s_i64       1
+#define TCG_TARGET_HAS_ext32s_i64       1
+#define TCG_TARGET_HAS_ext8u_i64        1
+#define TCG_TARGET_HAS_ext16u_i64       1
+#define TCG_TARGET_HAS_ext32u_i64       1
+#define TCG_TARGET_HAS_bswap16_i64      0
+#define TCG_TARGET_HAS_bswap32_i64      0
+#define TCG_TARGET_HAS_bswap64_i64      0
+#define TCG_TARGET_HAS_not_i64          1
+#define TCG_TARGET_HAS_neg_i64          1
+#define TCG_TARGET_HAS_andc_i64         0
+#define TCG_TARGET_HAS_orc_i64          0
+#define TCG_TARGET_HAS_eqv_i64          0
+#define TCG_TARGET_HAS_nand_i64         0
+#define TCG_TARGET_HAS_nor_i64          0
+#define TCG_TARGET_HAS_clz_i64          0
+#define TCG_TARGET_HAS_ctz_i64          0
+#define TCG_TARGET_HAS_ctpop_i64        0
+#define TCG_TARGET_HAS_add2_i64         0
+#define TCG_TARGET_HAS_sub2_i64         0
+#define TCG_TARGET_HAS_mulu2_i64        0
+#define TCG_TARGET_HAS_muls2_i64        0
+#define TCG_TARGET_HAS_muluh_i64        1
+#define TCG_TARGET_HAS_mulsh_i64        1
+#endif
+
+static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
+{
+    __builtin___clear_cache((char *)start, (char *)stop);
+}
+
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
+
+#define TCG_TARGET_DEFAULT_MO (0)
+
+#ifdef CONFIG_SOFTMMU
+#define TCG_TARGET_NEED_LDST_LABELS
+#endif
+
+#endif
--=20
2.19.1


