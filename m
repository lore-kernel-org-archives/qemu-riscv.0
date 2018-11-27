Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkZy-0003P8-HH
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:07:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZv-0003Mr-RQ
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:07:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZs-0003lD-LG
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:07:31 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:22206)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZn-0003ji-Rd; Tue, 27 Nov 2018 16:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352844; x=1574888844;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=WDaPr+ZejoaBi2m+8wAqMED2iqVQokZPkvaikiDT4zw=;
	b=cU4FOQYHqM1gCpvpJGFkB0Vi2spHKAxIsDMr3M8dBVwNz1yGDe1of5hs
	PNtbWJAf3TllWbr0WV4c0821K+JP+8BcdKoQyqWU0J5WMmotLVJpB3LyG
	95N/0Lrt4znX4WfnBiqmdQ+bKCU5e2OjkgoiZJqya2mKhKy2wzKTZqA9H
	eTeG5nKKmJI+MNqYsD7J4D8+7QEecrVlzqDD2NkBafjtQWc9Ch/TvoDlO
	OefMSzgrTrQ3Ykf9EH1QUEys7WIkNsd+xyIUS51+Cg+BXUQhQylMOXa6C
	fBfVzjoYxDfH5fwCGt67XINvJ7VkKgBeYlsk+FwqQIPRJoIy9I7o9FTu7 Q==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="96433584"
Received: from mail-by2nam05lp0241.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([216.32.181.241])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:07:23 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SwjABlZvCNL4A1rXm/uYjZ/YNH5E0Jeb/UjXcy7z8qo=;
	b=SJdrJPHMSbnP1AYjwmbAPv2fGrCP1Jbpusw2IS2+pljREOFYw3aaqZR1PIb1ibuYRC47Uw01XI++bwVxRiYCsCymPcplU1wusWR9MbRcljH1HCMcgCxZ0DS48vSTzFfc4VHG1h79XeaLaVlHnwq6i4rK1aQN/dVzYooRfkxLkmA=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0943.namprd04.prod.outlook.com (10.174.174.153) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 21:07:21 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:07:21 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 05/24] riscv: Add the tcg-target header file
Thread-Index: AQHUhpUvcZzi1dMAgk2psrdjTfRoVQ==
Date: Tue, 27 Nov 2018 21:07:21 +0000
Message-ID: <d8b4004e95370a8a95bab0506ad5385aa8633cfd.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0049.prod.exchangelabs.com (2603:10b6:a03:94::26)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0943;
	6:2uhzgkhNeKGT/rX2vIGIaTnTeI1MKfdT60MW6gZWU6+7Y41BBtrFsYwrjP8Jd9f1q6SeG+PZlh32Z6yXfUPdEsZuqvzrQlr6LZLNeMKRd+0NtF3OcpWG2Qn1pKI1Bs06fREAt0qbFoK0jy8nZQBMHytyTjOr2d0l70SXVPhBdk4Wbs8For2fnrq5of1SIig1vDz3dMKG68eUMzG719FdEvDxzQJg0sfXBi8KrJDUnhK5nKqWt03xzMZOlYGK7uroKpGjJNSqKbkZ0q/tdczadqDygM/Bk+RngNY/0eJVfYLzJ9uRr1yn2j6P+pqUvfr9XpplCe0pmPjQxP1JYoOJNZqJyRaUZOum58i0y8t1ejo9YZfwbaWxTC723Sh3KrsoxC4vRqIyvwxbe85PqXAX0bMNkmvcLkZtRVXoqoCmSCtLJ1qdcqfw4Jv4vVa7HMUSbW7jQFTHT7IyOXGCGyWgGg==;
	5:8FsidXlYKiLjAgJjosH0IQ3FZvMinzg2H2E2HD48qZ7CBGEAhhXlRuOj4uRLkarXcP2WdmTVzjyPw/1EmYzea+LeIXEYfRRDqedXpqW34PnCd7H8Xh35ZjYx9dlXDYi6Q2cTgLLPWztExS8mxiv+aEL2YEo59mLkP4KVel7G/HI=;
	7:XcnIuiF2MEXZuaYJs8A12LkautiJ+3rDZzLnoEiayfCo6ZSZynWswr/eqlPh1Ae9RpsjDiZ98w2UDXUpELGj+gKpx5OCjOvP9L+33z7rTXF9ZPZk2kUC5ebrRTD+QOKW2WgXJOv9tUc8XwN4jyM23A==
x-ms-office365-filtering-correlation-id: 58ffb872-4044-4141-2dbb-08d654ac5228
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0943; 
x-ms-traffictypediagnostic: MWHPR04MB0943:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB09436B3CE40A766DD2F9C23990D00@MWHPR04MB0943.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231443)(944501410)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0943; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0943; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(346002)(366004)(376002)(136003)(189003)(199004)(14454004)(97736004)(5660300001)(2501003)(4326008)(81156014)(81166006)(8936002)(14444005)(256004)(6512007)(316002)(53936002)(8676002)(39060400002)(110136005)(7736002)(305945005)(118296001)(36756003)(3846002)(86362001)(6116002)(54906003)(11346002)(68736007)(99286004)(76176011)(52116002)(2616005)(446003)(72206003)(66066001)(26005)(486006)(44832011)(71200400001)(71190400001)(386003)(6486002)(50226002)(6436002)(25786009)(102836004)(186003)(476003)(105586002)(6506007)(2906002)(106356001)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0943;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: 8mX/C4dKnIEZuMPTVMkFnuLKhI8g910wXMExpSbwVSpmZPSh81NccSE1rFEWEBWnZipzgxehlvM/A4gxxJTNvku77cEEAZDJlmWJznrnTfEexpb2bXU/HHYh7s0Q/L0wvXUTP9rxVZI37W/UQMwBNdH4O89o+7pHjI1ZIN9OfXJiWq8OatTRkDbPAwqBGztjHWjf+rbyHxqM0Atcv/AMpmqg5CC0mUpNhfHn+EE+hBc4lNQE2xn8juSPrGrzeldf4RekA0yxelIseYS8AS7JAFoPjasx0q0ugri7WJFIpbVCFkAh48UrrA5Hqspu0gd/7+rh62xBUjdQyxSugc8MNOAITQZXdL/lV3FmCpD084I=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ffb872-4044-4141-2dbb-08d654ac5228
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:07:21.3820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0943
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v2 05/24] riscv: Add the tcg-target header file
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
X-List-Received-Date: Tue, 27 Nov 2018 21:07:33 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 tcg/riscv/tcg-target.h | 173 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 tcg/riscv/tcg-target.h

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
new file mode 100644
index 0000000000..76ce2acfb5
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
+#define TCG_TARGET_HAS_add2_i32         1
+#define TCG_TARGET_HAS_sub2_i32         1
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
+#define TCG_TARGET_HAS_direct_jump      0
+#define TCG_TARGET_HAS_brcond2          1
+#define TCG_TARGET_HAS_setcond2         1
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
+#define TCG_TARGET_HAS_extrl_i64_i32    1
+#define TCG_TARGET_HAS_extrh_i64_i32    1
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
+#define TCG_TARGET_HAS_add2_i64         1
+#define TCG_TARGET_HAS_sub2_i64         1
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


