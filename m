Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hA11f-0000zB-2R
	for mharc-qemu-riscv@gnu.org; Fri, 29 Mar 2019 19:35:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA11K-0000YU-9z
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 19:34:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA0A2-0007Sm-PR
	for qemu-riscv@nongnu.org; Fri, 29 Mar 2019 18:39:43 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:64009)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=984f4c91b=Alistair.Francis@wdc.com>)
	id 1hA0A0-0007QP-5n; Fri, 29 Mar 2019 18:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1553899181; x=1585435181;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=8v5Inj5b8eONO9H5u9Bzfe2p4Sj/HJt+XJuuuSftA1k=;
	b=W5DSWkSwKq++5zgGape0AwYNvqXKVIcAwMkL2pBHAEesW3rNN2yTzSPA
	2YuPXINuZ932qtp4vdBOC/1uNiBAtOGOsFVrCdO+CBQ0pM9PT3thusSKI
	PZi3Foab5itTjo0+TYaxBfxO5lgbMaD6Pa6lxZY4G2q/dA4ySNj0UeghU
	sUWpMDwqOxf0GqT3rd3uzdItn/trcgr6284UNWwYwetusIjBUDY/wc2iH
	zzXMC5RmM+uScvAc3cCEcua5ivbbwYKPuVY1BrmdiU+AO0ViOWe1bD8pH
	1oQZEFpMHIr/Ssjp+XR56GYvLWUgHfnzXfDUOaJJEUG1DkFWGrS84jCvm g==;
X-IronPort-AV: E=Sophos;i="5.60,286,1549900800"; d="scan'208";a="105948841"
Received: from mail-co1nam05lp2051.outbound.protection.outlook.com (HELO
	NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.51])
	by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2019 06:39:34 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JB1zoChVVZzqimnzEimJnPmoe1a9rl81pE/UtsligSo=;
	b=CWh5Cuga2o7H2pDnWkMFZ1Bpw/HGpioiZYxeXkN5rV3KU3Bbvuc3ey+WpXKk46Jg0nEU9kN7RBopTVw3cWVwA5ZsN8QcBM5isMPSKZf3CNhiWkkRjbarpm8oXi6QhmKsVlFjA8G8W4iujUA7I5a9VYoXpZRG7JUN/sPs8YO/R8Y=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5400.namprd04.prod.outlook.com (20.178.50.217) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1730.18; Fri, 29 Mar 2019 22:39:31 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Fri, 29 Mar 2019 22:39:31 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH for 4.1 v2 0/6]  RISC-V: Allow specifying CPU ISA via
	command line
Thread-Index: AQHU5oBGDPKjhmzSBEmSiXwmQ1+BCA==
Date: Fri, 29 Mar 2019 22:39:30 +0000
Message-ID: <cover.1553899050.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR08CA0051.namprd08.prod.outlook.com
	(2603:10b6:a03:117::28) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d78655a-53ac-434a-083b-08d6b497688c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5400; 
x-ms-traffictypediagnostic: BYAPR04MB5400:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5400606BEACE60EB69B84BB4905A0@BYAPR04MB5400.namprd04.prod.outlook.com>
x-forefront-prvs: 0991CAB7B3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(346002)(376002)(39860400002)(136003)(199004)(189003)(6486002)(110136005)(4744005)(99286004)(3846002)(81166006)(8676002)(106356001)(102836004)(72206003)(4326008)(26005)(2906002)(25786009)(66066001)(486006)(44832011)(105586002)(81156014)(186003)(2616005)(8936002)(478600001)(476003)(14454004)(6116002)(256004)(2501003)(7736002)(6512007)(5660300002)(53936002)(6506007)(86362001)(71190400001)(305945005)(52116002)(6436002)(386003)(50226002)(54906003)(68736007)(97736004)(316002)(71200400001)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5400;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +ePoKcWBYOzNqGclM3gZLiGlYNR6cgF9FHNZ2g0GSJ9e+qcZHmi1TgDRbrdlvStzHF5UZJK093oa/3qzTS0is99zMWjVBnN48kw9THtiV4Tu/lo2Ra/vAp1r+nAkEgh62jffqTICAuz6OzG10Gi2JPgDAFcJmA7Z/KleROnG72zhxqIc2vM78m1ID8tmzJMM5c8/hmeNBoK+SQ+7HI0P5zTEBbaQtiUL2ynyhfu9PuonXIOZKGmDPACuf6gMdkZYq0SU9IiErKE/F0Lk1hW8K182nInlVTNMkbCxUlgQH3jqvTZG0ZZcmQscNjEhPLl+/LJAfzmmApvoe6lvpCuU0OShsyhz4CscYtCEugqbPD3mW+rfmrYPGYp3u3eLBvRwrIMyJq7gn3k6rVbzMrX3pKUTj8QSRjoaNbnk/7aSK8A=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d78655a-53ac-434a-083b-08d6b497688c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2019 22:39:30.9104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5400
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH for 4.1 v2 0/6] RISC-V: Allow specifying CPU
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
X-List-Received-Date: Fri, 29 Mar 2019 23:34:48 -0000

This patch series adds a generic RISC-V CPU that can be generated at run
time based on the ISA string specified to QEMU via the -cpu argument. This
is supported on the virt and spike boards allowing users to specify the
RISC-V extensions as well as the ISA version.

As part of the conversion we have deprecated the version specifi Spike
machines.

v2:
 - Keep the any CPU for linux-user

Alistair Francis (6):
  linux-user/riscv: Add the CPU type as a comment
  target/riscv: Fall back to generating a RISC-V CPU
  target/riscv: Create settable CPU properties
  riscv: virt: Allow specifying a CPU via commandline
  target/riscv: Remove the generic no MMU CPUs
  riscv: Add a generic spike machine

 hw/riscv/spike.c              | 106 ++++++++++++++++++++++++-
 hw/riscv/virt.c               |   3 +-
 linux-user/riscv/target_elf.h |   1 +
 target/riscv/cpu.c            | 141 +++++++++++++++++++++++++++++++++-
 target/riscv/cpu.h            |  12 ++-
 5 files changed, 256 insertions(+), 7 deletions(-)

--=20
2.21.0


