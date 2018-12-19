Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhLb-0001Bi-39
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:17:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhLX-00019R-Ra
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:17:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhLV-00008f-PF
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:17:31 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:43362)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhLN-0008Rd-Kq; Wed, 19 Dec 2018 14:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545247042; x=1576783042;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=CFuOndEpWy2HA5zn6miKBxcw0xiIsdojXeAtS0gQ6Ag=;
	b=gDrWDHayoVU4jP0RVlvt5mQE5lpCyi+bANrdaGbenbB9ZehTchDP7qCX
	j9dXjk2pfGEjc2tOQZszzyxslv3vewthtdnrGDOSOI5c2V5O2/6Hp3oru
	ZKM8B2Nr4e6sNmZjacOoJcjOR2K3vIOb44LAQXk+MWrVut3GLBOfjygmP
	rbMho3sareqeoRFXi0+IbLF4yQrBW216PQzXLMAFSznulHAhLySAgjtAn
	3uWy5xpzH2CyMO2gsvLJmElD5J9BSLwkwQWjIbOFoED2y9AdprihD+/FA
	lrhZbljKZlMRhwzD5wOq0z8roJMGA5Y6jrRxdawx1TdidSfxFc6yme9Fn A==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="98234170"
Received: from mail-dm3nam03lp2053.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.53])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:17:09 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YLhlavPLtq0JgKuzjEe8JrYFDN8pVIqAYJ6Itwva4/g=;
	b=QYlteOoALjax5MMTm4M5Y7q4QPXntc2FvefU82gd3Zu1sqLDyJxN7YYy+ogNIzY9npxxYrMc791PzRFq69mUJe0s62NxSgru9MRVdp5xBYLXhtdxL4Y64Dxj2zgQ2cWiVWZdU3G57FN9s1RGt92na5a6kqKCDgSArWffCHyL78E=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0271.namprd04.prod.outlook.com (10.169.202.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Wed, 19 Dec 2018 19:17:07 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:17:07 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 05/23] riscv: Add the tcg-target header file
Thread-Index: AQHUl89vBoL6ECAx5kaxHHUXmSQkDA==
Date: Wed, 19 Dec 2018 19:17:07 +0000
Message-ID: <a135ee1a88cd7bd08993a519d4d654da27785254.1545246859.git.alistair.francis@wdc.com>
References: <cover.1545246859.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0003.namprd04.prod.outlook.com
	(2603:10b6:a03:40::16) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0271;
	6:YIOt1TJ1rR0jGfTrFQ8gJ/aPrj7Ixc+go8YWUWPOHrcnrD9Jnff9ozxKLAsa7enx3Ax8gI2Q40wLQxgay2MZrfhxT73Kj3v+AtagVRBCQHzryD46G5xlOkl0LB8mhL2IFDgbMwYB/2+y8H+1p+KI08Zfxw+xsV0bLtP9Ur2o/fSiA5ZmLcCgxQDfXiTVKHyPw7CjkDhR1or7OMVlBU7Zh27gpxWHvUF44Fxg6rAi0ONh0FK9rOtkyjXk2NMKYeegS+zYXh5gf+ipVCo4uYPH+mc0b4p+xb7+234nR8bbLGKIkUC7FsmI/n62d9WTS+2zAlGZ5uyqnivRBTWI9zh+eOxsESX8S5+IpOI1iktNvEbigS9bpsFzUMrYtB1HUkefnUCt3JqB5zU57tMcZRed96qHl5OimpXDBDTJijauD6TP1VcCrFztJ1f4X1CL/xOJXMX20sZhGNu7nvMe8lyCug==;
	5:RJzI9Sby1CA+tjhvbVeNIFHHP2j7yauTTO7XUFx3qZYo6EDqvmolUTv0ppiiBwa1LrvkywESQZeWAZkgU91NjyGG/r7OhKkKUvbveS3BhEDN011kNpomy6WiNbjrmT9HAAZQVgP/MTr3g3MUqWhJi20sZfyKdaU7TXRzRSOT0ng=;
	7:xMugWc6cg2bttdMdrpfoz98NnpceFGFJR6AdNOkm+ZRIvlV3CEORnMDBpxmzJkwDWI39a5eH3AuuEEqmDAmS+ZHh62p/snwiIGTEtnyv3a5bo2jx3nB54BO8wBt41TUO8d/3yNUVblnT86iGphOq7A==
x-ms-office365-filtering-correlation-id: 8fcf5092-b6a0-4ddb-e6a9-08d665e68ebf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0271; 
x-ms-traffictypediagnostic: MWHPR04MB0271:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0271485931A38D7006ADEFA390BE0@MWHPR04MB0271.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(5005020)(6040522)(2401047)(8121501046)(93006095)(93001095)(3231475)(944501520)(52105112)(10201501046)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0271; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0271; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(376002)(346002)(39860400002)(396003)(189003)(199004)(26005)(14444005)(186003)(36756003)(54906003)(3846002)(99286004)(110136005)(25786009)(6116002)(14454004)(97736004)(102836004)(256004)(71190400001)(7736002)(71200400001)(5660300001)(305945005)(6506007)(386003)(86362001)(105586002)(478600001)(52116002)(316002)(6512007)(8676002)(81166006)(81156014)(118296001)(66066001)(50226002)(53936002)(486006)(44832011)(39060400002)(2616005)(76176011)(446003)(72206003)(106356001)(8936002)(476003)(11346002)(6486002)(68736007)(2501003)(6436002)(4326008)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0271;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: zo8OMSHgkGWWf2cBZSG35Xo/Nf9kQmvq057HOi6JoXc5kOx9Z7wufbTjagGfSd3s/BSQYYV6guII8aScF7hEpdsVg9rpm+e4S0nn1B+fCzHgjqb4O5iSACDK175dd+fMhP/cWiw+ibcKa81ij4MsyPM/JvWiOusAsbUyPcdD2KoQKGC2saGlB7c1iNkxrvVcfnzb3pWXYPy4922t15fKZlOyANv07e4wkdWKELDd8UCRZa4KbyizouXxEe3koaJs7fQI461YJyyK6iXoANCRH1vQbqBJpPJQqSp/iTFc4koy6GIR4QnAieuK3MuBb226
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fcf5092-b6a0-4ddb-e6a9-08d665e68ebf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:17:07.8168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0271
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v2 05/23] riscv: Add the tcg-target header file
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
X-List-Received-Date: Wed, 19 Dec 2018 19:17:33 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS            |  10 ++-
 tcg/riscv/tcg-target.h | 177 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 tcg/riscv/tcg-target.h

diff --git a/MAINTAINERS b/MAINTAINERS
index b923f4c1b3..107bca486b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -268,7 +268,6 @@ F: hw/riscv/
 F: include/hw/riscv/
 F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
-F: disas/riscv.c
=20
 S390
 M: Richard Henderson <rth@twiddle.net>
@@ -2166,6 +2165,15 @@ S: Odd Fixes
 F: tcg/ppc/
 F: disas/ppc.c
=20
+RISC-V
+M: Michael Clark <mjc@sifive.com>
+M: Palmer Dabbelt <palmer@sifive.com>
+M: Alistair Francis <Alistair.Francis@wdc.com>
+L: qemu-riscv@nongnu.org
+S: Maintained
+F: tcg/riscv/
+F: disas/riscv.c
+
 S390 target
 M: Richard Henderson <rth@twiddle.net>
 S: Maintained
diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
new file mode 100644
index 0000000000..60918cacb4
--- /dev/null
+++ b/tcg/riscv/tcg-target.h
@@ -0,0 +1,177 @@
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
+#define TCG_TARGET_HAS_MEMORY_BSWAP 0
+
+#endif
--=20
2.19.1


