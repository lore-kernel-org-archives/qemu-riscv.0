Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXstG-0003om-5N
	for mharc-qemu-riscv@gnu.org; Fri, 14 Dec 2018 14:12:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXstD-0003mW-I0
	for qemu-riscv@nongnu.org; Fri, 14 Dec 2018 14:12:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXstC-0000Pq-Ki
	for qemu-riscv@nongnu.org; Fri, 14 Dec 2018 14:12:47 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:12211)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXst2-0000Hg-0n; Fri, 14 Dec 2018 14:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544814756; x=1576350756;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=Cj8DRWP/RhHi6HYqT2v7WRItoIj1j2l7VKru4SC4+So=;
	b=r8TKbZ+pssNnklDIW8mcbL3EUP2MDfFpx+p6Zs8jJvQsdt06NB+1Mtoj
	jvYOHvpRGc+wzlANq/inwOsXz2ygeCKUYLJPp321hg3DeG4dkcaxntXzN
	AxeYKLcRv2XKNSQHBze9EhrSxtIPu/8YJ7FkN38sCcpduZZZ8SC7l3D9O
	RPbm7qukaeLlKR0RpwyBwrFeRWoQZxvYOJZTjrYJXvI7OZ5UebxdSil/n
	RmjxTW2Arfp5aTPjnOIFGF1xz8sfD+/PJsnKA6wY2isaZ/l5FNaTQgTeu
	CeS4Dktt4JscHK8/169J3U8yaKwYdlyptiq930U7v5Nt3oFAE426zeaUD A==;
X-IronPort-AV: E=Sophos;i="5.56,354,1539619200"; d="scan'208";a="98365365"
Received: from mail-co1nam04lp2058.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.58])
	by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2018 03:12:34 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SveNbgz+kRfvGCabHe8QdoebUyBGaowYnD/Yx1HOoEU=;
	b=dPPwmexFfxUMAj0AfKSlTKwLyk2vMMHtBdHK8K4D5G/S0TyaVkL+3yrlWDGtm8EoyVnk0P1npg+pILlJJwmr89Y4pTf32llZM33YFV8etx+Lwpc/Ktmjs4amLVw7ggl14zkrPsQvbF3pWRxOC/tS4ijBH51He7Gpxs0q7KOKflo=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0193.namprd04.prod.outlook.com (10.169.201.142) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.20; Fri, 14 Dec 2018 19:12:32 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.021;
	Fri, 14 Dec 2018 19:12:32 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 1/1] target/riscv/pmp.c: Fix pmp_decode_napot()
Thread-Index: AQHUk+D2PYeL6oSnTEeM5L3XTRqf0A==
Date: Fri, 14 Dec 2018 19:12:32 +0000
Message-ID: <bc916ed1c5ec1c34c005c1f1b4b533f693912eb5.1544814722.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0107.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::48) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0193;
	6:/Q6kWU02V4mdcQ+/OsMGIGEqsBqxH5Rcd+6JHMj2sU/dqE8wGzDtKoGTpzrIXtBAFusvvsAar5M/5UrbpAeuSki5ntDiUeQHxwWh7M+ddQTV0Y1GSNxrl0JeJdVrzqznCN3sR1UbhzKlZ+LKRUwFPe6N9CtRUxICnR+ns5dp1ZqglfBRcO2ICU6bTAH7Ov/jlMoae8fdlYBtR6AIPg9x8fCYPwDxRSt2EfrTTxTgG8YbVUKQLV9CgM7xByIJItFmD+IgCNQLoGoVuVQFcxdqqfBK8Ffz/6m8CL56UL/kf+VuBQOsUK1mxIjfhu878IMbUOq5dmhK+8iuxA9GqTz4ai3Y6J65r5jq6PjNA78RLdLYUUW2K2T9WgZuN4L0Ofe1520EyVeJe3OZzKZ9mBCFQ3a34RCbzPlKCn3FkCKoJL2HKKUsML+g/DcJycWaqsweF7jQ3/2upMQecbynb3hcgw==;
	5:c8OYXCGQ2NAsCHz1CpWx2furzamxL3hXCpYsacAjxeGaFgsH5215I87lXVeWzSYEAhBxutdtbYrCmp1hjjw5gg6/BaVBy2NNK0Mga0KjFlhbVYitcxWrKgqAUzalau1Vh1IsgjiZ/6J62Yl6q1vK7VoLUlSuU2hVmVPQ9iLIFb8=;
	7:PSHAxThK30yXUaLEC0NxGGxowglC1hkNprVp2fTHSWWY2nQotO24yIedRZyDU7fq8Dn9+davnYY5CTXkFvuxxNHgjqqu1vVdkBjoMIYbrjLHWa6O2aVnD8oW1d+Y7Va4dcQ1KDs+LlDZ5G5xaWnMaQ==
x-ms-office365-filtering-correlation-id: f8616467-ad62-4d99-8d70-08d661f8191a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0193; 
x-ms-traffictypediagnostic: MWHPR04MB0193:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0193A10137B7FF0AF06A376090A10@MWHPR04MB0193.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231475)(944501520)(52105112)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0193; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0193; 
x-forefront-prvs: 08864C38AC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39860400002)(346002)(136003)(396003)(376002)(189003)(199004)(6512007)(6506007)(6116002)(386003)(3846002)(25786009)(86362001)(36756003)(186003)(8676002)(316002)(2616005)(476003)(6486002)(105586002)(53936002)(106356001)(81156014)(486006)(39060400002)(81166006)(44832011)(71190400001)(26005)(99286004)(14454004)(72206003)(71200400001)(52116002)(68736007)(97736004)(14444005)(256004)(66066001)(102836004)(8936002)(4326008)(6436002)(478600001)(2906002)(305945005)(54906003)(2501003)(5660300001)(7736002)(118296001)(50226002)(110136005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0193;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: cfWTP3zykytqp/6Wkltqhb4DqqZXUt9lz+STONLjOtDvO/94DK8O4HPolR+vuTKMwCiApR2Us/xcHkbim4USUclEL2D7v5uGLBOkbx2vVyr6y45dURd/IWzvhA2AvdYuhJU5fpU/8Txzda6zcgSmSJOLmpslYdr/DcOsdGDWvKEC3JB94V4MO6XIAsZ8mxrWhAhuAz5A8XWpP9oOK0GVVQMhS0zs2zCmJytfmZfgcg2nhmvKbheMlfJudppC9+KBVhH+T9BtZ9C7x6wBMT7JEZGxE4NsyUmW91zXaoLfvGduxSqftRgzkCxPwYnC1ew2
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8616467-ad62-4d99-8d70-08d661f8191a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2018 19:12:32.2958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0193
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [PATCH v1 1/1] target/riscv/pmp.c: Fix
 pmp_decode_napot()
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
X-List-Received-Date: Fri, 14 Dec 2018 19:12:48 -0000

From: Anup Patel <anup@brainfault.org>

Currently, start and end address of a PMP region are not decoded
correctly by pmp_decode_napot().

Let's say we have a 128KB PMP region with base address as 0x80000000.
Now, the PMPADDRx CSR value for this region will be 0x20003fff.

The current pmp_decode_napot() implementation will decode PMPADDRx
CSR as t1=3D14, base=3D0x100000000, and range=3D0x1ffff whereas it should
have decoded PMPADDRx CSR as t1=3D14, base=3D0x80000000, and range=3D0x1fff=
.

This patch fixes the base value decoding in pmp_decode_napot() when
PMPADDRx CSR is not -1 (i.e. 0xffffffffffffffff).

Signed-off-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 03abd8fe5e..15a5366616 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -138,7 +138,7 @@ static void pmp_decode_napot(target_ulong a, target_ulo=
ng *sa, target_ulong *ea)
         return;
     } else {
         target_ulong t1 =3D ctz64(~a);
-        target_ulong base =3D (a & ~(((target_ulong)1 << t1) - 1)) << 3;
+        target_ulong base =3D (a & ~(((target_ulong)1 << t1) - 1)) << 2;
         target_ulong range =3D ((target_ulong)1 << (t1 + 3)) - 1;
         *sa =3D base;
         *ea =3D base + range;
--=20
2.19.1


