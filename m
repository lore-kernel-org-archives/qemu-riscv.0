Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWqf4-0006FS-3I
	for mharc-qemu-riscv@gnu.org; Tue, 11 Dec 2018 17:37:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=87679fe4f=Alistair.Francis@wdc.com>)
	id 1gWqez-0005wA-QS
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 17:37:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=87679fe4f=Alistair.Francis@wdc.com>)
	id 1gWqet-0006Wr-M0
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 17:37:48 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:2109)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=87679fe4f=Alistair.Francis@wdc.com>)
	id 1gWqeg-0006KJ-Kk; Tue, 11 Dec 2018 17:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544567851; x=1576103851;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=Lr7s+LbBpa5okVowj9CvhSx1TXBHaqkbiUiLl7k0zLM=;
	b=AQZv2vdjg9BlRS2iVNqCkwS8gTyyGCAIgOx1VuebYYDzbgpmIUGX8c7r
	3fHdsOv2JNAdye2k5Se7d0tt95LNcWdSfUzf9pZtZV/I3lAiAeyCohdQ9
	Ugxe+V9TIs/AMWV0TD9UrpxMNm2wcA7xjEK4f9kcMvkCMvKqxzEpg3mVr
	qsBRrbeReGN7gBBINjjpn8xzy6V5KgmiGXBmZbgUo11LrmmNhu4CN9QGw
	SrE/ycHFKgQTFRrYkvXq6yBBt1pgAZ6YAx4whEXOfr5xpbayNJXQO3aSP
	zVOO7TbaI2/Fy9GSoBkipRuNjyCLzYjgrCHNDssX/2AsjmqWkMqnw8Glz A==;
X-IronPort-AV: E=Sophos;i="5.56,343,1539619200"; d="scan'208";a="98113645"
Received: from mail-dm3nam03lp2055.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.55])
	by ob1.hgst.iphmx.com with ESMTP; 12 Dec 2018 06:37:28 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CorkShMWeT62xCZ6mv2aCYFdia3InyQGwssGnCgLD4c=;
	b=lLkepPpE3ZaqsW0sple1rI2f1pKeRIvVjtRilK2mr9LC7fqMYqyPPUuNS4z2VWV1M+PyjoHZ9C7dplsSluU1Z9Y5PBX4E5xP4oX13/IGmmDLJ10+fUUNMPy2jLqtxjqffdXsMgOsWbP4zyvQMJ13n42lrDs7eJfyli7NL9+zO3I=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1168.namprd04.prod.outlook.com (10.173.53.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.18; Tue, 11 Dec 2018 22:37:26 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Tue, 11 Dec 2018 22:37:26 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "stephen@eideticom.com" <stephen@eideticom.com>,
	"palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v8 2/4] hw/riscv/virt: Adjust memory layout spacing
Thread-Index: AQHUkaIXxjvXoG3Vo0S4p/AZwsI7sQ==
Date: Tue, 11 Dec 2018 22:37:26 +0000
Message-ID: <8064f094368f233fe0fbdda772a33b7c07114613.1544567709.git.alistair.francis@wdc.com>
References: <cover.1544567709.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544567709.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0029.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::42) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1168;
	6:KUQRHiTSSW+mqZewEYhyg/7fGktt151d42dFIdY8oDkQ7B4ImiHOCyORvTDmCphviMTrLMz/O7dxhO9qfn5ZZ3gySEF421RDxuBHN8X3ksb41WI9vzTm2bzbsnSPUnSGQXCNcd7QJeG4j+3tfzYvZWQr1Y+6GhUQTYuPjUMwtrskz9pjSDHftfG7LcgndouW4WwkYAkMdy7F8aO9H6X4KveI1iMrb0xtNUahqkdbACLi74FwIN54fYHOJN0FLI5ad7tY/RU6VP5IECg2XsSlyQaEvGo+gDd4v3pkDBc0hSWvLprdi6XrHyAN6FTuGQh9etmLtDVfHrNN+R4s2MuH+zhojGX+4PfYd/eCsnaSzR+xDa7ER0gbghakNi/SagS7UUcqF8b8jM7vi7FzPOQW5y9jDVpjQ0DfUuXZ/dQqaspPkNHIk/pJDGhzil7bqKzWoyluj2zCTUTNsYlFuI8ayA==;
	5:7B5i8uOmifqUlIS5YvPmJfmrH3MI4GvhCPA/csY67HS4jwVR2vMD+JuHN2noUXncpENFoNN1D5hGhCD6vtk9kvmcUkGTKaZybsirEItGDqwU4jsgcinOJZ1DEF97lHVfgn37lqs3t636QCVolkdRvH9UZmq1KEZkzy8PuSwStao=;
	7:MQ7aUG+XnhkP57zb4MnxxbXyAu9xQ0iuFlbDqD3qtrRiGs7xpeXJTqBP8xzGXzw0P9oRErW9kLLn3cafNBg1VZQnwhM0BXXJjCnMtTy6HZGAFgJgEJtnSsDsj0vdMUoh8WZWp2LzHgfQiucadW/mlQ==
x-ms-office365-filtering-correlation-id: 8e154b07-0cf6-4849-8a0a-08d65fb939ce
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1168; 
x-ms-traffictypediagnostic: MWHPR04MB1168:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB1168EF9B2F37D422FF61602890A60@MWHPR04MB1168.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1168; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1168; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(39860400002)(376002)(396003)(366004)(189003)(199004)(76176011)(66066001)(71190400001)(2501003)(71200400001)(305945005)(6506007)(256004)(386003)(44832011)(105586002)(7736002)(25786009)(6512007)(486006)(68736007)(8936002)(102836004)(476003)(81156014)(106356001)(53936002)(478600001)(8676002)(72206003)(446003)(14454004)(26005)(86362001)(52116002)(50226002)(11346002)(81166006)(2616005)(6116002)(36756003)(5660300001)(2906002)(110136005)(97736004)(6486002)(6436002)(3846002)(4326008)(99286004)(39060400002)(186003)(54906003)(118296001)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1168;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: MEhux2//pGb91oUNt5VSFgJLs6wkArEUvH6IiSvrLw0IH8BTYeGQH8FJ/XkW0dKNL8ADx/93Z1dS/98iaIU2ASyAi4/wTHNT3Ljq/Yive1VdHyP/lPXufqX9ICEXwhVwBe0eqrXezRQw1bDcN9tuuTM+b5/d/1jRzEhDnO01de4XQhAEVR0chPGfgueKyd/oX/En4XOWZPlGBA5DEkH1eDdLbgM87klTZlPFP2k7mZixzpLRCUM3AbJbixpTuSby2bQsjGwPfJpF61pRZC8KZhwO6N1mx6+1wCDYkG3VEpFZ0eAdgPVDAEeJh7SUfphK
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e154b07-0cf6-4849-8a0a-08d65fb939ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 22:37:26.5116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1168
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [PATCH v8 2/4] hw/riscv/virt: Adjust memory layout
 spacing
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
X-List-Received-Date: Tue, 11 Dec 2018 22:37:53 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Andrea Bolognani <abologna@redhat.com>
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


