Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXAQG-0000nS-Ry
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:43:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAQD-0000kc-PO
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:43:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAQC-0001uM-Gu
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:43:53 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:30960)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAQ4-0001gy-5q; Wed, 12 Dec 2018 14:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643852; x=1576179852;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=fGRmZbxCRt8GiN4bxv90yEfWvk7RN0Y/XVfmkkyMrCs=;
	b=FERP+IYnH0F20R1MdQ+x80KdoOTm9rggEKsiHYndrjn1C+SSPdawf46g
	FltWD8DkJkCC3GeNC6Q7rdJBHkfLzepQCbX2I/t0URai3IrOngALBuixJ
	OcdqGin9sHvf79U4dzCBJWI+jYE3yPDZx1TiciaFGLOQp7bdGqvs3I+gT
	PIa45cUTunesImzOS9sr+pNIhFJH0GxTxYFs+26dyRa9LwJoORanzf5IK
	HGHS1IwvB6kmIIIwszH9gtObjjByrMkNWZqBZVXyPns8Jhqr6qOuwEQGW
	ctFcTXFHM4+GYDJ6MpYlLIaURTVKDeCs/tXL5oLdI2h/jkNqd1cLi8ZwC g==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="194334012"
Received: from mail-by2nam05lp2056.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.56])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:44:10 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TvEpWKnf0KyR1eBhDDGD2pXIWcok1mpGk1RP5UIS3+s=;
	b=ITA7kMaAnw3vfvYPqofMIoZxqMdCEXPA3zYlTd1ELa1W6pCLygyCvUXoMBHwoybct0ZVi3foE+ms+I2cZtNKlh9b7vSO5XtSthtnt+wKj6dNg9+C5MXfET+dkkFXv48Fr+NMnErdxLOLR0F9FWIwhECS6ljPqHSbAVE2D9yth6Y=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0784.namprd04.prod.outlook.com (10.172.168.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Wed, 12 Dec 2018 19:43:36 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:43:36 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 05/23] riscv: Add the tcg-target header file
Thread-Index: AQHUklL5B9BnZkG+rEyImPsV9I8nxw==
Date: Wed, 12 Dec 2018 19:43:36 +0000
Message-ID: <2560616ffb8a0e8c3001e3c5490c8bc1463468d0.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0007.namprd04.prod.outlook.com
	(2603:10b6:a03:40::20) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0784;
	6:RmrulLW68FZannrjaFhKzQykn8buy5fWSDyysXNinZoN3kJXccCzMldDScc0XmlWmJzuCIWhYZtCvubS0bqtSG8DSJtBU55mMut8D0vA7BsG34rRLec/EqzQCuZuMEJzAjvOaPbIglYHFXgB12RYXC+LIB0lQZY/F6Hr/A2SmmMV9N1nhZ/7zuHVDSUAaJi7dSX6+8U5WF0nnipx5/ASXxtA2xsnMCXiMLo+hOOzGFucSsmNDE9DwFxqMIQIe6CU8IkTGwfLEwjP1YcAOXzqJQT+e5QVAq2/Sy5So9S5murNq/LMHZMNd20PSikbzRTHVtIfSXdaFSCfVKj8vOIm2tb9/HtaTRwtgqXumgZ+afWyOIFOJMYgPM87ehGMDi98bZg1vN5v4TBvG3LXhVGwU/xNsnxBKCyIZr58eyCjd8sRtlPiRlL158t8loONsOhe9/gnRn5s4k5mf8ai2iMmtQ==;
	5:KiKptoF/dYXhIIwY+dITlGMcNsz1neRvOUyy52FVf0noqRCxNiTdDitS33SzqZS38HesyzEMmGvms7wRobC58sO/DQZXCH4G33HpEeZnJo8BsCAh+6eGbSXvEEPFA8ju7gOdC8P5tz/vLBeVNhp9SmkOKkNKHqT1oX3fSwamhng=;
	7:nGfr80o08rAgollfbio5Z5m7t3ZLUiE3wMiV9MIZeGnwyr3h64/YxeC9iq2N90aEgmg7MQvChpuAk9Mvm/3r+/8varYz+Lx3eRZ8+qw03ULlyXRxlhHQhkY1kuq3NQMuMa+JzcD70vGYTnRDNCya3w==
x-ms-office365-filtering-correlation-id: 39588943-75f4-46f5-60df-08d6606a1ba4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0784; 
x-ms-traffictypediagnostic: MWHPR04MB0784:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0784D6B15D5F3436DEE09CD690A70@MWHPR04MB0784.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0784; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0784; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(7736002)(2906002)(36756003)(5660300001)(81156014)(8676002)(81166006)(106356001)(8936002)(99286004)(14444005)(305945005)(256004)(71190400001)(68736007)(105586002)(97736004)(71200400001)(86362001)(50226002)(118296001)(2501003)(6486002)(52116002)(44832011)(25786009)(6436002)(53936002)(486006)(386003)(4326008)(6506007)(6116002)(476003)(54906003)(76176011)(39060400002)(11346002)(3846002)(102836004)(2616005)(110136005)(26005)(478600001)(14454004)(446003)(6512007)(66066001)(316002)(186003)(72206003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0784;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: EIXsKL4ROXYE7xcHCdRVshRjGXfl1f1r/1txrC5kEkZorYxpoBqOFno1k/OkBAaLcozzO0ZCAwjPJIiL1YetFPATsoRSr4Et9u8gi1qVMgqgvy4wR91ZeYnEDbC8/ukPy5+5W4WVG2fZU9Lcxx9Tso234j6SlwELH+/ZSHvaEovWBLQoCwAyHH4sd0y2wOMBYUayhHqmEysSrMhREy+Wo2baQHWaIVQdOIC4OACrGfSmjGhDugTyQeIQaXQLRZfpzu7CsztHkSxECeady3cIMn5u0+ehtXGD518NCmO2eO87hDSuhbVd/wd3zkiG18gv
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39588943-75f4-46f5-60df-08d6606a1ba4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:43:36.8717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0784
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v1 05/23] riscv: Add the tcg-target header file
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
X-List-Received-Date: Wed, 12 Dec 2018 19:43:55 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS            |   1 +
 tcg/riscv/tcg-target.h | 175 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 tcg/riscv/tcg-target.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ddfeb32c6c..aa88ee176e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -262,6 +262,7 @@ S: Maintained
 F: target/riscv/
 F: hw/riscv/
 F: include/hw/riscv/
+F: tcg/riscv/
 F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
 F: disas/riscv.c
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
new file mode 100644
index 0000000000..cb6720a031
--- /dev/null
+++ b/tcg/riscv/tcg-target.h
@@ -0,0 +1,175 @@
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
+/* not defined -- call should be eliminated at compile time */
+void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
+
+#define TCG_TARGET_DEFAULT_MO (0)
+
+#ifdef CONFIG_SOFTMMU
+#define TCG_TARGET_NEED_LDST_LABELS
+#endif
+#define TCG_TARGET_NEED_POOL_LABELS
+
+#endif
--=20
2.19.1


