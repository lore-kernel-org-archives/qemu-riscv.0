Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPVu7-0005Je-PG
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 12:03:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVu0-00056h-K6
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:03:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVtu-0007uh-MC
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:03:00 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:21533)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVtr-0007bD-Bk; Wed, 21 Nov 2018 12:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542819771; x=1574355771;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=dAZDrGQXSe+UN9sYvkBrJKTDlVGYZ5v2BxmgTl+oHSQ=;
	b=XVUNHcqk2nEIEl417O9R8Je5WU0aS3FwJDIJ7GSYI+zVVQF+PEwoCY1r
	rCSx/8DWmz8w7iewta0eJsCLhdQ/NSDCnMezAl0t9p8plappCzIRcIkeE
	mLhIUtclNdVXnGswx6MUsRCRf5muLHXOG9QxdrSSo6MxOmS9QX9jag43g
	ypEtbLxyPS2Xu7Pr2173fKIBwhJPZ4yBX2S+hPoZWFiB+QOKEflaRMWzJ
	8lBM14QNZ32xOkEfagDuEk2ej8hsdI1vEp787lSB0Sgjc6LU8sjbcM20a
	I+tqhJ6K+bkFVJAYhpS923kD0tUf4NbDquIypzd276jc6tbVkM2LpuATJ g==;
X-IronPort-AV: E=Sophos;i="5.56,261,1539619200"; d="scan'208";a="96547367"
Received: from mail-co1nam05lp0079.outbound.protection.outlook.com (HELO
	NAM05-CO1-obe.outbound.protection.outlook.com) ([216.32.181.79])
	by ob1.hgst.iphmx.com with ESMTP; 22 Nov 2018 01:02:28 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=84xrGFUm5oTeDV7kPfDdQQsZck0I5In5HVHAMEPrROU=;
	b=fPfyjrVGpjBZaUb995u0W5z0KhKNYESCMuDDDqOF4TF3GqOkwuA+plyRghe8yygW+6C+t2Q/eTlb24NEC2u84FVNUMOZh9xodCVaev5r9cC1MjH0yJgBR/KLrA4hpJxI9NpvSOhHatr5x+MbaFfAZovG25tBG7PQbnjOO/qhaWY=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1249.namprd04.prod.outlook.com (10.174.175.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.28; Wed, 21 Nov 2018 17:02:26 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.015;
	Wed, 21 Nov 2018 17:02:26 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"abologna@redhat.com" <abologna@redhat.com>, "logang@deltatee.com"
	<logang@deltatee.com>
Thread-Topic: [PATCH for-3.2 v7 2/6] hw/riscv/virt: Adjust memory layout
	spacing
Thread-Index: AQHUgbv6uT+1D6loLEqXSa299QMvDQ==
Date: Wed, 21 Nov 2018 17:02:26 +0000
Message-ID: <005f96f5dbffd4c2e370f8b0ee102d3b477e19b0.1542819633.git.alistair.francis@wdc.com>
References: <cover.1542819633.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1542819633.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0054.namprd11.prod.outlook.com
	(2603:10b6:a03:80::31) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1249;
	6:J/DzHVC4A7ktAW+RMmhdjxde8K5lGtD8eqJYj2d7aIXPLsXCeOppMDFDfxIJlomXFZTz74IghObSzEeL1GHI+kiSNPSGfkgyrtHbSrTK/VQ8+olx5AUGcHAm0KeiL1wrAyn2VLPA0GVcMdON6M9g8wcyn6o347pIaf6i3LOPEMLrDk3rydyDvFkQsrNxuHomsJ5hW4E2NulPI6i91Oj+fs6W4y5VycKCbiW+k0TAsfzCmahTQoFBpH+QgEqaTGkdg6LGb0Fp+9FIin/B0R4KXxGSKNWVTATXpDyNlT962mauyvV5OhNC8aZ1GbSIkgfpQtLrqJg2EPjAlMgopIubvepDPCndjk4LExDlLSM9KVnHHQJnwCU3L8oiSLIWTYs4Ru09Ro1XBicAmMeb2W3ZPU90+p37GQQbR54IstgbJGjSGeb/1/0CpVWLcjCcOL6CNxyTjKUYlII4ylcGxGtZCA==;
	5:7izBW3w3WdHgntt865hURK0Gl05aSiXgOqhFv2RMpTgDMNlN4pQDB3ltoe6UCg8mRK1dYg6k3DVu4O6//mcpdhmoXBSUdaDM4deVc3aHD7iuLYB+RnnnvavLFflH2cMyI1LXLspkQraa54Hl89gckiqwS6psBr5vLydnMa1bq+c=;
	7:a04X9852i3SJiiuIUem4vHjh5aSfaMKkErAQumk9o7YpNHmJuLY7ThKqJB6iFAnv9C9V2BJvUPBkwNpF+jxspEVQzGEVLoCBMqdFhCOIiIXuDHaun/4Av48R+bu7LrX+gAUKba8yq2u0ZkSh8d731A==
x-ms-office365-filtering-correlation-id: 3556e5e1-75c5-4b4e-a5bf-08d64fd31ce4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1249; 
x-ms-traffictypediagnostic: MWHPR04MB1249:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB12495C5077DD8B63991C702990DA0@MWHPR04MB1249.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231442)(944501410)(52105112)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1249; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1249; 
x-forefront-prvs: 08635C03D4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39860400002)(136003)(396003)(376002)(366004)(189003)(199004)(36756003)(72206003)(97736004)(305945005)(68736007)(2906002)(71200400001)(86362001)(71190400001)(8676002)(7736002)(106356001)(478600001)(105586002)(39060400002)(6512007)(102836004)(3846002)(2900100001)(76176011)(14454004)(25786009)(52116002)(8936002)(118296001)(44832011)(6116002)(186003)(50226002)(6486002)(476003)(66066001)(316002)(2616005)(26005)(5660300001)(486006)(2501003)(81156014)(81166006)(4326008)(386003)(6506007)(110136005)(54906003)(256004)(11346002)(99286004)(446003)(6436002)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1249;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: fWmAUhhyouMjnfdfx1XjlBVgzZk1hRGUCrOqS35gOM3CeCeOVXt85H3kgMeasquoyAbLYnpAyjnFzin5ihYbf/YS33khQX/g/+wdXUeAROPL7ZvzBwxDziJl6cr3rozqDqzfaCV1myE9urk9d4g4JYPc46fgfE4I3AiZwRirZUeFZpwDy7sNUBZGfjUfFEmBQfLa2xwUh6pINzKUioxWmrFVW9mczxXipa/wFplGYJKNluKpANLEOBmG06THQvaIU0qJ1r5NCNouOcN13CM4Q8U5p9pyy/O/haNkMne5jer91mrbnFEJiqTnVT2YULDGrblJE+U9WJwIbxqwpbxMOmLFqVQPcdDGWEF90imGHaI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3556e5e1-75c5-4b4e-a5bf-08d64fd31ce4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2018 17:02:26.4069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1249
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [PATCH for-3.2 v7 2/6] hw/riscv/virt: Adjust memory
 layout spacing
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
X-List-Received-Date: Wed, 21 Nov 2018 17:03:06 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2b38f89070..6b6fa39aaa 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -47,14 +47,14 @@ static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
 } virt_memmap[] =3D {
-    [VIRT_DEBUG] =3D    {        0x0,      0x100 },
-    [VIRT_MROM] =3D     {     0x1000,    0x11000 },
-    [VIRT_TEST] =3D     {   0x100000,     0x1000 },
-    [VIRT_CLINT] =3D    {  0x2000000,    0x10000 },
-    [VIRT_PLIC] =3D     {  0xc000000,  0x4000000 },
-    [VIRT_UART0] =3D    { 0x10000000,      0x100 },
-    [VIRT_VIRTIO] =3D   { 0x10001000,     0x1000 },
-    [VIRT_DRAM] =3D     { 0x80000000,        0x0 },
+    [VIRT_DEBUG] =3D       {        0x0,         0x100 },
+    [VIRT_MROM] =3D        {     0x1000,       0x11000 },
+    [VIRT_TEST] =3D        {   0x100000,        0x1000 },
+    [VIRT_CLINT] =3D       {  0x2000000,       0x10000 },
+    [VIRT_PLIC] =3D        {  0xc000000,     0x4000000 },
+    [VIRT_UART0] =3D       { 0x10000000,         0x100 },
+    [VIRT_VIRTIO] =3D      { 0x10001000,        0x1000 },
+    [VIRT_DRAM] =3D        { 0x80000000,           0x0 },
 };
=20
 static uint64_t load_kernel(const char *kernel_filename)
--=20
2.19.1


