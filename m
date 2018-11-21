Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPVtN-0004Li-R8
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 12:02:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVtL-0004Js-E2
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:02:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVtG-0006ay-Fs
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 12:02:19 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:55538)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=856724ab1=Alistair.Francis@wdc.com>)
	id 1gPVtG-0006WB-3b; Wed, 21 Nov 2018 12:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542819734; x=1574355734;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=IUgDXUF9Ke0ArfwNIug+Neq6VelpS2UuaD/HV04ix3Q=;
	b=PE/gTwVZfSQpYMBIH4b/R+i6bor7q5Y8yMAIAoGpm55ZZre8bkyuCAND
	Ui8YbVauX6Vbc5L+YhjvfADS55UIXUzMnTQQOIFhF+W4ElnOUWbylhTRS
	2eucUKqOkI+53z+hyeuIp3o1hzScdJk59gOvQjeJf+62WGZSdxL4d+qcZ
	3CSrCwT4h3al8w2sxxq3v6Tlzc1NHYRnnUDEMqHZNBEZdEBaZ14aKemi/
	QKpsd/yDBvpRsxCJCyvbUahfgt7oGi/kKVIyh7SWlCtFWEyVQ/Av6uEJk
	oxd05/7CwjlIaQkiMHgWXT01iMdYowX06YHxX/oA84SJ40mgnyFN9/ztS g==;
X-IronPort-AV: E=Sophos;i="5.56,261,1539619200"; d="scan'208";a="199379938"
Received: from mail-dm3nam03lp0019.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([207.46.163.19])
	by ob1.hgst.iphmx.com with ESMTP; 22 Nov 2018 01:02:10 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xAIr1KX22tartY7Og2NjYshbBhn6skoxsUZm5yqPPx8=;
	b=VG79pePlynk0GSG6D157ePvlhmwrSTdo5v4kwavm3nh6An3pzPvAtahE4ZEgqpYR99hiutGNPGfSvU/A6nerAQ4QvR0lBwh0EMH/68eons1j5TYJCgJagQ/Iz46wVRvvxulLwmNfkoo63zzsUB7v1jy1ayGsdQknjmSlzntXCfU=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0896.namprd04.prod.outlook.com (10.174.174.142) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.30; Wed, 21 Nov 2018 17:02:08 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.015;
	Wed, 21 Nov 2018 17:02:08 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"abologna@redhat.com" <abologna@redhat.com>, "logang@deltatee.com"
	<logang@deltatee.com>
Thread-Topic: [PATCH for-3.2 v7 0/6] Connect a PCIe host and graphics support
	to RISC-V
Thread-Index: AQHUgbvvcuhpyumKuE+wNjgA4+wMfw==
Date: Wed, 21 Nov 2018 17:02:08 +0000
Message-ID: <cover.1542819633.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0051.namprd11.prod.outlook.com
	(2603:10b6:a03:80::28) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0896;
	6:h9g5s3RqSGIGHESQ6Q+iMXANqc7WLIieGQVia/l32ZD3KDygWRi/m4kdqRXKap9zY+yRqWlByOIO1tZ+hY2NiVafYyvJSbN7FP0VQGasdMZ8ahjpDQ2DmLuk1A9vzAT+nJzKMTvkiyfKgj6r5dNAH7JbLKetzaF9LfFa5sEKSDAeq7QgbFYoux4VJv8Ukmujw13zfZLSsYN8fsy304o/KQBI/kFq+70E636ZAjf4BQukvzPLnL7SBQwfCBNNXO3JNY6lLuzqfC1Ouw7luSGvc2rLp+CtBk+srNuUv88PSYljl4TdYs/SsETxyhu9QfIzQZDTFa0/PlO735EpH6/65fMQcib7W5xaX6lHqLyQzZr43nVMd4M9fhx0h+V53Zt5VbKAOScOJU+ABcvyatSK6H6+HzFQIRR7K2KOhP6RHiQ942tPMVFe8Ip3qlNadRDNeigwHlTntr+kqSLl+n2w9w==;
	5:Fwv5IL6YkFK0QC6IzkW7LspnB16VuJy1q56XcoIk5Mzlw/FNiKdWABRA5TVp2JcsxUDz6Y2WuHyDSwrv/pL5nn31K7uXp97oZ9OJ5jMqg7S1A3n5lIVuLoXuv0RAxbtftqaPYv2zHol+GxQo0Ixci127nj3RrSpPKC4v/ndLrP4=;
	7:VEwqUpfeh1u1XwbtkcO2wFF4hoMqvRD3t1r6C97bQu6MZUTS09Tuhckg2qeHTxvQDxSYklNFKo4Du9A68UBPLfVbgUfsBpbLYbbHpLSAqjL2gmj7Qobdsqo8zq4ItXEN8Hy85w0F79e4bZ6wT40xaA==
x-ms-office365-filtering-correlation-id: d37c58c9-3801-4dde-34df-08d64fd311f3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0896; 
x-ms-traffictypediagnostic: MWHPR04MB0896:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0896F1A311A3FF055EB9FD7090DA0@MWHPR04MB0896.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21532816269658);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231442)(944501410)(52105112)(3002001)(10201501046)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0896; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0896; 
x-forefront-prvs: 08635C03D4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(376002)(39860400002)(396003)(366004)(346002)(199004)(189003)(50226002)(256004)(53936002)(86362001)(25786009)(99286004)(66066001)(2906002)(106356001)(105586002)(5660300001)(6436002)(6486002)(36756003)(386003)(7736002)(72206003)(14454004)(6512007)(3846002)(110136005)(6506007)(4326008)(26005)(102836004)(6116002)(54906003)(316002)(476003)(305945005)(97736004)(2900100001)(44832011)(486006)(2616005)(81166006)(186003)(8676002)(81156014)(478600001)(52116002)(8936002)(39060400002)(68736007)(71190400001)(71200400001)(2501003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0896;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: UILkirXcU8bI7pQRCpmu10avbMRoLHadA2NNNs1gfAZv+RFkCKmj7G/T0RNByKuN2T74GruLZZbsX4dESVWgbb26KVJrRekXDhULIb45K1Skd8CXAXf2Zc5fwfGrgP9VPSuFBwFyM8fN3n3eeI1JRCq0dxTDa5UChyOEdUBZWoz9IdDRzfSPTANcKaOZzoLBu6xOPsqjzwSqZP42j67s6kb9BkjDyOjcM6A+ZCkBu7zQXW164OguJkt9MamesJz/Oo5rHo8l3l21JwQkaFoCJxqJIUDVe30c51zUElsscaDOwuIYLSq5dCSNazn8g0odTFLZ+rcq5+50wUxQvyFSepTnMEZ7LdmOTtJ2oefrqTQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d37c58c9-3801-4dde-34df-08d64fd311f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2018 17:02:08.2505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0896
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH for-3.2 v7 0/6] Connect a PCIe host and
 graphics support to RISC-V
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
X-List-Received-Date: Wed, 21 Nov 2018 17:02:20 -0000

V7:
 - Fix the GPEX memory mapping thanks to Bin Meng
 - Fix the interrupt mapping thanks to Logan Gunthorpe
V6:
 - Fix the interrupt issue for the GPEX device
V5:
 - Rebase
 - Include pci.mak in the default configs
V4:
 - Fix the spike device tree
 - Don't use stdvga device
V3:
 - Remove Makefile config changes
 - Connect a network adapter to the virt device
V2:
 - Use the gpex PCIe host for virt
 - Add support for SiFive U PCIe


Alistair Francis (6):
  hw/riscv/virt: Increase the number of interrupts
  hw/riscv/virt: Adjust memory layout spacing
  hw/riscv/virt: Connect the gpex PCIe
  riscv: Enable VGA and PCIE_VGA
  hw/riscv/sifive_u: Connect the Xilinx PCIe
  hw/riscv/virt: Connect a VirtIO net PCIe device

 default-configs/riscv32-softmmu.mak |  10 +-
 default-configs/riscv64-softmmu.mak |  10 +-
 hw/riscv/sifive_u.c                 |  64 +++++++++++
 hw/riscv/virt.c                     | 161 ++++++++++++++++++++++++++--
 include/hw/riscv/sifive_u.h         |   4 +-
 include/hw/riscv/virt.h             |  15 ++-
 6 files changed, 250 insertions(+), 14 deletions(-)

--=20
2.19.1


