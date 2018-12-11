Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWqem-0005qc-M0
	for mharc-qemu-riscv@gnu.org; Tue, 11 Dec 2018 17:37:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=87679fe4f=Alistair.Francis@wdc.com>)
	id 1gWqeg-0005oT-Lf
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 17:37:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=87679fe4f=Alistair.Francis@wdc.com>)
	id 1gWqeg-0006Mr-1z
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 17:37:30 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:2084)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=87679fe4f=Alistair.Francis@wdc.com>)
	id 1gWqeW-00066r-VK; Tue, 11 Dec 2018 17:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544567842; x=1576103842;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=6FWvdovG/DHyaWBdkK2BoC0/ankaXJpJMmYD9cTlpJA=;
	b=H9Ig7VDgm+p15z3Ol8ryoOVZ4apAOZlDTXxZM4jbMS3lJBzQFlN5iJ9E
	D4iy/XhsAvXVexw6ctfROD8OoF3MGq8H1FI05CRp2eDzefsSOJKtyxk3s
	muJMV3ufIAKzgr+BYbnMgXKmimVW1J5CeExuqowdwZjDnKskxUsBvmicv
	8zhOgH1NDxkFjvS5xc5yxzWnzXHCmJDe3CvXETLvfhIBLzA9m0063C8nY
	MZz5Esc7JFadYraHJlDHq4wdQPEkyodXP4a7KcFnYPKLTZX1mAEOxsRrQ
	D2fQzW9GXZHo4K3mhIZxIAdXrRVkmpsAi25Jpc6S694tVChFW3B5Ju8Co A==;
X-IronPort-AV: E=Sophos;i="5.56,343,1539619200"; d="scan'208";a="98113638"
Received: from mail-dm3nam03lp2052.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.52])
	by ob1.hgst.iphmx.com with ESMTP; 12 Dec 2018 06:37:19 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9Ro3eIxnNK+lykHoPxhn/p/WWWfxmJe4W7tdVet+9Wo=;
	b=UhTOO+AXumQuNtsdKYr9gOmvxrj2GrnOHlWGEyFyoMhIaEddvSZ2AEfeDC7ORH23+H5NuPtliS7uwvrkKkpTqPCM4YZdDyVcK3KmD+qdXeo4XWg/hke1B6iAiKBG7s8jusPfcZ1EwVbtGLq6Z+8/Fixnf6T4rgIZZFDWIWqrqYM=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1168.namprd04.prod.outlook.com (10.173.53.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.18; Tue, 11 Dec 2018 22:37:17 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Tue, 11 Dec 2018 22:37:17 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "stephen@eideticom.com" <stephen@eideticom.com>,
	"palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v8 1/4] hw/riscv/virt: Increase the number of interrupts
Thread-Index: AQHUkaISXTBDO6cd40aYJ/iLiG/Qtw==
Date: Tue, 11 Dec 2018 22:37:17 +0000
Message-ID: <3e20c204cce495e5cbbfb560f92d35c86840b8fd.1544567709.git.alistair.francis@wdc.com>
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
	6:mVYXkQibd1qwrbCTtlgo+aoq9jL829+WKrSmhgeqn5nBs6cLEjFqG/6QTDGQv+Y/Xfk21/QVXIa1r+nAs/H2jIB9Vu/hwAa+st/nyFYqfV2HvKXOLvaCPYehOCNh72pD8h+zl5P5aUHSqGuVlDOU2Z9AQzI7eI7dZgpzNotmX9buGYEb1CJrw8gP65WQIE2D+5Dg6xmQBoQYqGjSZfXmgWgx0KNpViqGnddJoJjswZtZuGO3Qkf7E+76J5hBIbUe6RaCETpAanz//SXh02R9oc3+CcJsF92yG3QQer1aUsIamuXBN0ZtD7jIVOxkoNOVnOnbAou4naeYMQ+az4L44KmuesEleDPvk4gOT3Tv5RR97+q+bk/6bD0B4fLUBqkCQwGqgEGXnJc8DvjgSzrt73qjogtJ4NnCnjrZC3dqwH+xL7DvpITO9ZSI6M0unyRLkSXirGXWm5k+R8m8fUjOFQ==;
	5:BVnEnQ93yNzVbHveHNawPhp6gbjp3M2wYGfK+quF3bucicCihXl+P35zqm8Et1K2MuAmSbGe4Pv19EHuhelEyQLZYE3uPNGBBXg/YlHZiqvjUO5CLoYHfsnHKcYwLz/ca4LBoe9w+yC8kPATxyDPLxGFYJvuQieHzDHunAEgT6M=;
	7:bDqCWPhwkkVjU7iDcgmjNUWjovyC75qDLk3XarriFRwlpPf5hIourhnF/oJTn2YPcl3nAJ4KcsViflhIVU7AMOsxyP53jyCxRbJreenuqrWU9Tq6gnC5RvpYgMcy25CecMu1h/pRTFnw8RzW4vz5Og==
x-ms-office365-filtering-correlation-id: 523e4523-79f3-4623-4cef-08d65fb93465
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1168; 
x-ms-traffictypediagnostic: MWHPR04MB1168:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB1168E421F9C95D3DB0951DFD90A60@MWHPR04MB1168.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1168; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1168; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(39860400002)(376002)(396003)(366004)(189003)(199004)(76176011)(66066001)(71190400001)(2501003)(71200400001)(305945005)(14444005)(6506007)(256004)(386003)(44832011)(105586002)(7736002)(25786009)(6512007)(486006)(68736007)(8936002)(102836004)(476003)(81156014)(106356001)(53936002)(478600001)(8676002)(72206003)(446003)(14454004)(26005)(86362001)(52116002)(50226002)(11346002)(81166006)(2616005)(6116002)(36756003)(5660300001)(2906002)(110136005)(97736004)(6486002)(6436002)(3846002)(4326008)(99286004)(39060400002)(186003)(54906003)(118296001)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1168;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: dpIyfvoDZjgvIbIk7TswCQ6CIhh2EkOOBcFVOzj3OxjhSxT+v0kysI0efNkXiqm6NKobANPAWiPXxkjlK507gb28/97kQ8yzQ/PrYsr6zu/7cAA8lMaOE1fP7TJFahL6i/hAHw77vRhcD20qInoE3yzswEU9G04HWbOosPVUwXmE0w5fBXUwdF4FpFzbnlABPPTHme/OCgbEhoIuYBmh8wixB1xEnSYBunTOD33X1nZmGynyvJYKW6eeLBCggs2zuDpivx9Y7VaoxqvtX82WaLuFKetGzVuBipocEsltMQB/RHu1MIJSSUKms2s8EkMn
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 523e4523-79f3-4623-4cef-08d65fb93465
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 22:37:17.4646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1168
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [PATCH v8 1/4] hw/riscv/virt: Increase the number of
 interrupts
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
X-List-Received-Date: Tue, 11 Dec 2018 22:37:31 -0000

Increase the number of interrupts to match the HiFive Unleashed board.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Andrea Bolognani <abologna@redhat.com>
---
 include/hw/riscv/virt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 91163d6cbf..2b2e6dd4ea 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -45,7 +45,7 @@ enum {
     UART0_IRQ =3D 10,
     VIRTIO_IRQ =3D 1, /* 1 to 8 */
     VIRTIO_COUNT =3D 8,
-    VIRTIO_NDEV =3D 10
+    VIRTIO_NDEV =3D 0x35 /* Arbitrary maximum number of interrupts */
 };
=20
 enum {
--=20
2.19.1


