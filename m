Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkcA-0006IS-TI
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:09:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkc8-0006G1-74
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:09:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkc7-0005Gt-9t
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:09:48 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:36239)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkc1-0005Dt-Ae; Tue, 27 Nov 2018 16:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352981; x=1574888981;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=d/vgDPhfzdcDSncbcj6SM70p3CgdU/kMp06loHl8EIc=;
	b=i7sA8uL6NMLzKNpdI7a17hvQefhkLyZOeY+qIk0HNIz1ABLwcqhl7SAg
	x5bZcy7CjAbTndfEFuuTQVIMNz/KlngXnVqjU92+vz/rS0DyB3YU7ZmIB
	plRbLEzsyCh+ZhxgLYPnegPE0TrI/oVXs/AWeyOLD0hS6E5v3zYfLZQPJ
	Rw2OI1gf/5Dr797J/M2S99IUTK5whwtnKm8H4fezb62unTZBaJvxlbrR3
	gxNu2gSE9GIwB2csdhDHHl+gc3+avDU8M29qRuMSRukV9C//SffZc+bVB
	jrnK8MJjFIRdVuy9nbUAjMG0yqFWkauuf6f8fATe0itrOvoFIPrcOHi7i A==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="100064295"
Received: from mail-cys01nam02lp0049.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([207.46.163.49])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:09:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yPUJaM0wWZHLTYVfZkTyHnHTkJnpg2ybHbfiWpabKRI=;
	b=MQOq+Pa+/vkRLMRAopVIeS0QFVaKTd42ScRtg/8FWjMsQDrrutTIjdt0it7AfiEHyEEk00Lt5ilMU9/Tccmo3YS5jiAcV5O9MkCCHv+y+YeYsQB0wqR7umtqkEuQ9ubdjMGhv4+3ngVC5s+p+rq27kK1o7OlleGogjerR8cth4U=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0639.namprd04.prod.outlook.com (10.172.166.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.15; Tue, 27 Nov 2018 21:09:37 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:09:37 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 20/24] tcg: Add RISC-V cpu signal handler
Thread-Index: AQHUhpWBQP2olYvJR0ORlHHTlMtJsQ==
Date: Tue, 27 Nov 2018 21:09:37 +0000
Message-ID: <22c9e4baa12177154ce8a357c40d2126b917478c.1543352682.git.alistair.francis@wdc.com>
References: <cover.1543352682.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR08CA0025.namprd08.prod.outlook.com
	(2603:10b6:a03:100::38) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0639;
	6:TBZlBVRxuQq05cFdwoHUtD0+Udsfc7ZXXR2bRPw04ZSbDMdTG84baQDnT0JHiYLCj5Zx/mJrkjqK1xas0co4uSK/A4HlxWou6VjoqcMuw/EBQYJUsLNpNo+ntW2As1JRBpy/NSeyKJoyn8PQ+u4SWbXrRLKBDxhoaZDUtZQU9jT1G6dIemZelucW+na4XoRz6LWaQUbltI8j22ag580PDyXckdX2D30eUAxiwUyzHHdlh0e+V243vwPZjtqspSpBI9WZMvNRSDUjyqkm3H0AA+xlURSaKMJvxkj5faHw07sH6Lx5PlRLfoGnt4ailAi4kvPsSlTXArBB0qIaAiNtAtaKIpCP84ZwQOh2lp3ZOsFxiSliJUpk92u5jbvidM/wkcHBPvS3vSGNiStHfc7PMLZOsFpE24E0aNJvTWd988tp7KZsOoG8KhMDx/12OJjmLDG/2oUrfviDvO1STmv34w==;
	5:6VGCY8W4S4yf3jLqrHoEKhk4/mnregBasouBN4fJOetjVJS7abH7icSyWPmv2DdHJXArg9erHvpZ+0btsyfOYiE63lEy+xdRLMf2RvZutTchq4QFEggMR9N2HuarMS23XCyTW+aDztOMTy/PzQ4O7Cibieqt8CMzVEO9tAiCXyo=;
	7:mEqTlgmYGz8mJa2bMaKB9eVgOTa2dG6zVufPWFEzHNczGNlck5M3iZK2HCGQsBmcbl/ZiNxsjI/R55quc1KNbfNMqXDzCM3ICtQ/ulCP7ugGU+pyOzTL1tY9CiabczAjLvRMYykZkBx9PZCJg0XliQ==
x-ms-office365-filtering-correlation-id: 6dbce0c4-4b32-4290-8e67-08d654aca376
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0639; 
x-ms-traffictypediagnostic: MWHPR04MB0639:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB06397A6E5D553A30D904DC5290D00@MWHPR04MB0639.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231443)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0639; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0639; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(376002)(346002)(396003)(366004)(199004)(189003)(86362001)(6436002)(53936002)(97736004)(6512007)(2906002)(66066001)(8676002)(8936002)(81166006)(81156014)(50226002)(54906003)(110136005)(5660300001)(316002)(118296001)(7736002)(2501003)(6486002)(68736007)(305945005)(36756003)(478600001)(72206003)(71190400001)(71200400001)(52116002)(76176011)(6116002)(386003)(6506007)(102836004)(44832011)(2616005)(476003)(3846002)(26005)(186003)(486006)(14454004)(99286004)(446003)(25786009)(106356001)(14444005)(39060400002)(105586002)(256004)(11346002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0639;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: kVXx2ZWlZ7wiRnUFdw2BCgTCjoY0W9miTIcKpgebwr00DI8koIzJC6JGFdb7ELxZdsNG0P86rn/smdZuoz3o8VLF2u43PnFifltvLqoE9BqWhpXAlPxqEImFg0L65vVPoS7Br88mfvFSmcLQIrLBygZGRCONS/OLut+WkdTzq3X+fvq5czbcwHDm3k5+DbCLCteKSXBZUzntizZclCYVmzhh0nV13MLJa56ElDJtZaokugAcFu+TBr8CZXzqEsmFA1fPYBW2hDAv7A6lcFQ/pBJHCWrijo6vrxPUk7dpOTwLCRAt61OIfJ7O6sbB3uJM5UmwPlwDQFMk/wl1dmCXk2tLInbm9BinrKmLrrhA8c4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dbce0c4-4b32-4290-8e67-08d654aca376
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:09:37.5255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0639
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v2 20/24] tcg: Add RISC-V cpu signal handler
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
X-List-Received-Date: Tue, 27 Nov 2018 21:09:49 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 accel/tcg/user-exec.c | 75 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index cd75829cf2..941295ea49 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -571,6 +571,81 @@ int cpu_signal_handler(int host_signum, void *pinfo,
     return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
 }
=20
+#elif defined(__riscv)
+
+int cpu_signal_handler(int host_signum, void *pinfo,
+                       void *puc)
+{
+    siginfo_t *info =3D pinfo;
+    ucontext_t *uc =3D puc;
+    greg_t pc =3D uc->uc_mcontext.__gregs[REG_PC];
+    uint32_t insn =3D *(uint32_t *)pc;
+    int is_write =3D 0;
+
+    /* Detect store by reading the instruction at the program
+       counter. Note: we currently only generate 32-bit
+       instructions so we thus only detect 32-bit stores */
+    switch (((insn >> 0) & 0b11)) {
+    case 3:
+        switch (((insn >> 2) & 0b11111)) {
+        case 8:
+            switch (((insn >> 12) & 0b111)) {
+            case 0: /* sb */
+            case 1: /* sh */
+            case 2: /* sw */
+            case 3: /* sd */
+            case 4: /* sq */
+                is_write =3D 1;
+                break;
+            default:
+                break;
+            }
+            break;
+        case 9:
+            switch (((insn >> 12) & 0b111)) {
+            case 2: /* fsw */
+            case 3: /* fsd */
+            case 4: /* fsq */
+                is_write =3D 1;
+                break;
+            default:
+                break;
+            }
+            break;
+        default:
+            break;
+        }
+    }
+
+    /* Check for compressed instructions */
+    switch (((insn >> 13) & 0b111)) {
+    case 7:
+        switch (insn & 0b11) {
+        case 0: /*c.sd */
+        case 2: /* c.sdsp */
+            is_write =3D 1;
+            break;
+        default:
+            break;
+        }
+        break;
+    case 6:
+        switch (insn & 0b11) {
+        case 0: /* c.sw */
+        case 3: /* c.swsp */
+            is_write =3D 1;
+            break;
+        default:
+            break;
+        }
+        break;
+    default:
+        break;
+    }
+
+    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
+}
+
 #else
=20
 #error host CPU specific signal handler needed
--=20
2.19.1


