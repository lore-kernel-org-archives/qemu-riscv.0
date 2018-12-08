Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVQod-0003te-7W
	for mharc-qemu-riscv@gnu.org; Fri, 07 Dec 2018 19:49:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQoa-0003qt-9L
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:49:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQoZ-0001SE-8C
	for qemu-riscv@nongnu.org; Fri, 07 Dec 2018 19:49:52 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:8292)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8739c4fd6=Alistair.Francis@wdc.com>)
	id 1gVQoR-0001QU-Fl; Fri, 07 Dec 2018 19:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544230183; x=1575766183;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=d/vgDPhfzdcDSncbcj6SM70p3CgdU/kMp06loHl8EIc=;
	b=ESBNAtKIVPiYqZHQNHoYY+rx33MFQqqXFT8uGV4S4wveWY3tRLuOhyPm
	oSHrxIV+j44uHdmeW/zv1nmKhI9w3lXS5Roa/+LVFln30VmkLbA1NcY+P
	Ex2ybnM85rKNrqBj3NxzLuEpbyu0ysGskw2+L6XCdcIgOtaneXgs6/sqB
	rvg+W0y/pbRm6ekIsDZGiI5BuLD3BKezMFORaQBJX+EosiLgpBAS7p3mb
	ENanFZ0TgQikjFw6uuzV2rOTkCWICuDNlqLSK3sTwUvLtZFtHJDIK9Hl+
	Oh1wGcwqvK6yBYz2yPuNMAWN67IJV/B1rityv4JV/jsnpuJI3qU67Byvp Q==;
X-IronPort-AV: E=Sophos;i="5.56,328,1539619200"; d="scan'208";a="101012203"
Received: from mail-bn3nam01lp2052.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.52])
	by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2018 08:49:41 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yPUJaM0wWZHLTYVfZkTyHnHTkJnpg2ybHbfiWpabKRI=;
	b=boByVjXdXLiidcpaFC6c99hPyFt/WCPcy/6oQqL/MOTXCPWGn2Fb+iEjPO9uYcrVEbkR8kDfGo3NhdmPFlctszY210eBn1Qu/2EG37OML5iakDC8RqIxYkwjI5OcfhA2Q6Mcd2hEPlEfFiB6CULZfr2ZK4Q1cPiMPs/Ahgjd5is=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1215.namprd04.prod.outlook.com (10.173.52.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.21; Sat, 8 Dec 2018 00:49:39 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1404.021;
	Sat, 8 Dec 2018 00:49:39 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v3 22/24] tcg: Add RISC-V cpu signal handler
Thread-Index: AQHUjo/mCq7j/DPj2k2bn9YIV6ZMBw==
Date: Sat, 8 Dec 2018 00:49:39 +0000
Message-ID: <37efeea94032a868865575d320a7cf1ddc532fed.1544229872.git.alistair.francis@wdc.com>
References: <cover.1544229872.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544229872.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR02CA0006.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::19) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1215;
	6:RY2lTaAg2WqUrrXudRb+q8KQbcDSnNbvw4ZOHy2uEEv0qaXnoUMm5wEK2y1QURnuxxmZavXr+mjJOcS76sCQcZjeg51qb7wuIiL7pdGKw4MsG5/44/D2FkZX3TNL236j0eQWkhZQD4UQ+RTtOeGwr6GNHe5r/gycRjbNxsgcWYDcRD+KND+5ugauZUy2ObNheXNOPlZInyWXjnmmcybNgJGxp2zAopwSy5fjv2zB8YVrqrCVc/zoybgNKecT4TCRoRkI6ljWvAuKaEAW+ZyRHHVH2YJG0+z01ybFJAEuipxaLxGPwooNk+Z2xaW0EGh5YxZnOyRGTgiSIHxr9sihU9fFNNTItjI+DOxyAjaEUmSKsRKw7GjhC9P9MHgTVKKFVWfDE9oc7eQpo0+rhrPIyByhhqOmitpxL904XliqrV5KbIOB+dFU4T8Gms2nqUwBaS2sVuv0hcke9rIUXTDGoQ==;
	5:1V+E/U2r74HMfDNACU9PXwTdnzQBmm3OKBN4s93Y5QdVpC+lJjQlxnjla5OHXv6V0tdCXv1CjcGiXTUxRXZTgvgLGxIzgN3Mfo/cm46RJH7KbxmYXqTlGZh2wr5V8mYBhcAl6DX1Zp6Oyu+QABF9NCSWuq09LBPZ0B60LKy1+Zo=;
	7:nM6HFb5IIImeZCcVcsMHCI89dq8Yg87796nWwYAnzY48jOA8dy+g1f/yCpC+A73kl6kYK3XuAE3rRCbmoChG3dEIiOyDRN3Lg3EezGAauySawC794gQiGDd4nG2oYUvJaNmxntLU4CSC3mMxwPHSSQ==
x-ms-office365-filtering-correlation-id: 8d4755c2-05f3-4c63-54e8-08d65ca7088f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1215; 
x-ms-traffictypediagnostic: MWHPR04MB1215:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB12158232A4EBC26AE9CC354290AB0@MWHPR04MB1215.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1215; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1215; 
x-forefront-prvs: 0880FB6EC1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(396003)(346002)(39860400002)(366004)(136003)(189003)(199004)(476003)(44832011)(305945005)(11346002)(7736002)(81156014)(8676002)(3846002)(2616005)(118296001)(5660300001)(106356001)(446003)(81166006)(6116002)(86362001)(486006)(105586002)(6506007)(50226002)(386003)(76176011)(2906002)(8936002)(102836004)(26005)(186003)(52116002)(66066001)(97736004)(2501003)(478600001)(4326008)(54906003)(99286004)(110136005)(68736007)(25786009)(256004)(14454004)(39060400002)(14444005)(71190400001)(71200400001)(6486002)(6512007)(72206003)(36756003)(53936002)(6436002)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1215;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: jqnQhjojEGg9m9hmtVVeNTFMQcCcUt/jQN25wKW/97ctB0Q5TeCXmF29ii363tBy7Ci1bBbgtEFtaCBNEnzsGIBWeBnGubmecHxktUxYNrhKkgim9MFZo7GsahqEIlQplGiojkZ1XHKERL2PIKAZ9TyXzp6Ccm2BN05adzG52B62xwsHVcsWko2YCtfzPnpifU9fz2sH1/TrpQz7Zqqs0w1p/s6KJRjIHURQJfPtHKfotsJTulVbNq+603/uJZD3EK7mPaNTwKP4oQlH5uXi+qyyGccLYYm0+48xzpqQd4znqRKQhwgZIN4wVFGVqCjwNkI/ybN9sVVuCyHY+lPsmtyJRH3RqUjrHLhjJw1xWBI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4755c2-05f3-4c63-54e8-08d65ca7088f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 00:49:39.5421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1215
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v3 22/24] tcg: Add RISC-V cpu signal handler
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
X-List-Received-Date: Sat, 08 Dec 2018 00:49:53 -0000

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


