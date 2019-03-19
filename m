Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6JMu-0007jE-4c
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 14:21:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JMq-0007gR-Vy
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 14:21:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JMo-00089F-Va
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 14:21:40 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2199)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=974414bc6=Alistair.Francis@wdc.com>)
	id 1h6JMZ-0006cw-RL; Tue, 19 Mar 2019 14:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553019684; x=1584555684;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=8MOOyyzD/IrpK8Nx1E9PyHHvOvJUkO8z9Wbo4/tO57w=;
	b=bcnWO3+FtvH0ShElF8maI9ZACK5IEDnh7TLxDVgO/g1cl77YyKAky2hh
	ADupTEmG/a+QeU4yQa5UhZpIn9EwjPqtB4GVwGzEb3bDRYjDobmxbSlpM
	uBvVIb7R3WzEa2Ql8fp2gwzvauBAaH+rFVqogqeO2NC5ed9Fbe1YTKNO4
	B35ug+5idEcF8Kr1pwwS4SOuUYKw9dRWMoqB0JRMcGBlbtiYCvWTVREOL
	rRR2QEnnCmyLXtd3VXuDBhqljSpvqUyqHq5ztt8ssL6NvDL5jlLMBh/DQ
	KQZ8jKSgoKFD7zuWuEEpq2dUNVhl6Eixe9oqTppBR5WMh84nv423Kyqel w==;
X-IronPort-AV: E=Sophos;i="5.58,245,1544457600"; d="scan'208";a="103763361"
Received: from mail-bn3nam04lp2056.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.56])
	by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 02:20:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mXxHdhsF+/L4+wIPNSARENFBu6kuCCUuwZmwccCOWVQ=;
	b=npjwlNL5S1A+BTn26RiFjoBWkPLt3tMhMX70PtkO3C6LGoH3DWkiUUSnA2yBkSotoRTTN8vuu5KX1+j49VFEjaLchgIosyi7+qg9YhQZGVv3LgI7RB2esoMpVvWCqcimha3rcQ9Gw+QPcUFJy6ywanJoVRmh0meYA0N7k8L84e0=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4920.namprd04.prod.outlook.com (52.135.232.213) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.13; Tue, 19 Mar 2019 18:20:48 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.015;
	Tue, 19 Mar 2019 18:20:48 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.1 v1 0/6]  RISC-V: Allow specifying CPU ISA via
	command line
Thread-Index: AQHU3oB5ifwt18mDaE6ZY3Nkgn3Ziw==
Date: Tue, 19 Mar 2019 18:20:48 +0000
Message-ID: <cover.1553019560.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR06CA0072.namprd06.prod.outlook.com
	(2603:10b6:a03:14b::49) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4479e8be-c4b1-4574-c3a3-08d6ac979c14
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB4920; 
x-ms-traffictypediagnostic: BYAPR04MB4920:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB4920328C1518404E94A7CBA190400@BYAPR04MB4920.namprd04.prod.outlook.com>
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(376002)(39860400002)(346002)(136003)(396003)(199004)(189003)(68736007)(14454004)(72206003)(66066001)(2501003)(2906002)(54906003)(256004)(478600001)(7736002)(86362001)(305945005)(6116002)(81166006)(81156014)(8936002)(50226002)(97736004)(8676002)(36756003)(3846002)(106356001)(2616005)(486006)(476003)(316002)(71190400001)(71200400001)(44832011)(6436002)(6512007)(4326008)(25786009)(110136005)(102836004)(6486002)(186003)(4744005)(52116002)(53936002)(26005)(99286004)(105586002)(5660300002)(6506007)(386003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4920;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1C2XCtFs6PB6Ltf7ZCrnzpNVKo8DzI6yWwlaNNuNRp4uF94t7g3ygcu8WKyzXUUpZfT1DgnPD3Ec4kpyC9ySKPbea7qD3lJEPHwmrnpqJn/fIypg6lLzQXNURgBCA3LsUJLDxt5Mymxyts2mzzkhMjN/5GrZnpBI2pWYBq5+rxSAd3Bzkj3Ds3LDXrpE9IY+TPMVHbViVPj0FKZwX+Gft4q3LKJI0x/QnDeAB/buOy8D9yyAXbUV4ay8/Ak3dQVpw8GGYhhYUCbJ/wcdQ69cGclCUC5clcokO9wSp1iMeVApCUDBdPh6SiIrmXrn+15hgx+f4FNtEzrRApvGWmSFPBB6RZ9vDql4LH8CXBHtea9Mp/vnQyOsxTljJ8oz/TKHtpibUNqSH0WW1KupBL9E1CVavKUcDhfexmpTqUphDBE=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4479e8be-c4b1-4574-c3a3-08d6ac979c14
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2019 18:20:48.1812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4920
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH for 4.1 v1 0/6] RISC-V: Allow specifying CPU
 ISA via command line
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
X-List-Received-Date: Tue, 19 Mar 2019 18:21:42 -0000

This patch series adds a generic RISC-V CPU that can be generated at run
time based on the ISA string specified to QEMU via the -cpu argument. This
is supported on the virt and spike boards allowing users to specify the
RISC-V extensions as well as the ISA version.

As part of the conversion we have deprecated the version specifi Spike
machines.

Alistair Francis (6):
  target/riscv: Fall back to generating a RISC-V CPU
  target/riscv: Create settable CPU properties
  riscv: virt: Allow specifying a CPU via commandline
  target/riscvL Remove the unused any CPU
  target/riscv: Remove the generic no MMU CPUs
  riscv: Add a generic spike machine

 hw/riscv/spike.c   | 106 ++++++++++++++++++++++++++++++++-
 hw/riscv/virt.c    |   3 +-
 target/riscv/cpu.c | 143 ++++++++++++++++++++++++++++++++++++++++++---
 target/riscv/cpu.h |  13 ++++-
 4 files changed, 251 insertions(+), 14 deletions(-)

--=20
2.21.0


