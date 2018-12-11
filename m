Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWqeb-0005kt-Ka
	for mharc-qemu-riscv@gnu.org; Tue, 11 Dec 2018 17:37:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=87679fe4f=Alistair.Francis@wdc.com>)
	id 1gWqea-0005ke-C4
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 17:37:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=87679fe4f=Alistair.Francis@wdc.com>)
	id 1gWqeZ-0006Fv-Kb
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 17:37:24 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:2084)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=87679fe4f=Alistair.Francis@wdc.com>)
	id 1gWqeS-00066r-1N; Tue, 11 Dec 2018 17:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544567837; x=1576103837;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=JAQzcVkJNaw5JISL2wcfUb1iFeN+E9z9ZJIbb/6jyJc=;
	b=phHaNApJLmCKZBJyYrcSTYHBiIi6+nodR+CZDHKVp4HSUNCp1k/FWvHE
	S9ZK9LzSDwwsDKqtiVkCwNxBj79zfrPFkITraQ9CMjIQ/E9VdobdDTzE9
	VdTBeuGxt/FdbGTgEZy9UvXP4YzktKl+7J27iEEcwGhOswPnd1mw1OnAm
	ArU3rMzMxp4Amb4a0J5ZtYzGFYvqnpPyW2777OfRPim+VaKUbTIxl+Aww
	EgZ4jawf192Ae1bomu5tRJuSZgDli47WbTUxEz2a49j2bvDTGX3fpCtrY
	ojS8SwFpjM1yGx/EP+L7fb9LFtskfe5Bfdn+adoekEnDETJs3bd58kS6L w==;
X-IronPort-AV: E=Sophos;i="5.56,343,1539619200"; d="scan'208";a="98113633"
Received: from mail-dm3nam03lp2059.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.59])
	by ob1.hgst.iphmx.com with ESMTP; 12 Dec 2018 06:37:10 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Zhtj+mPS464XuFsvearXFQvl9ELJbL80o8ZFgZ7TEFQ=;
	b=CEASMq2BsH2uQrXy80qMEhWdFx+9AXH9lD1CkkIppFzgJhkSovbc10jrAqDIYZG3JZ9lqzPGyr8dfQND/Q7M+D+NqM3OWJY6WM1gegC2uS1HgA3dAOwigjq85n5stE1SMzmL+2VDaDMwWjfL3ikHelX5ZfiWu4ABJBmyIkEiPbw=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1168.namprd04.prod.outlook.com (10.173.53.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.18; Tue, 11 Dec 2018 22:37:08 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Tue, 11 Dec 2018 22:37:08 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "stephen@eideticom.com" <stephen@eideticom.com>,
	"palmer@sifive.com" <palmer@sifive.com>
Thread-Topic: [PATCH v8 0/4]  Connect a PCIe host and graphics support to
	RISC-V
Thread-Index: AQHUkaIM3JJkqGTVDE2zUJmB8+4NJw==
Date: Tue, 11 Dec 2018 22:37:07 +0000
Message-ID: <cover.1544567709.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0026.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::39) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1168;
	6:FnvCxUgqr1BemfHpn7KlBHq3+rNaIbvUrh4IRqli37Vkd+kS/rjGCyJk/1SLc5tEakctaFLVqSrJH+0i6BzsBQ3b8aP07p+YPV78KagL7n9qKsGmSZjGdXDl4bANukxYGV1q1Ht5B+P0euQLVftA/jI1lS8pbx97TpLMUyIGDIVjH3t6AbgL2hDhJTuCBFVjyKjnioN/6dnUJLCjpxGtvyIFqcPsPd3UMtKtkFDLIx3vb25LVyEoURsjvgsuuryY5OmOPbDYHCDhrrQ+6wSL05TArzEGMxkRUib0YaHebYdZu+vgEmbW9e2Kgj2UFKTPTUDppO+cs9So+0KuzxmciYZJKgh3KP2Wax6OMZajOKXwGoXIQSKSKCghcu58GNoc7abGVpXf0+RFzJdrFxMHBQLBFSv/gBNl1Ds3ZIunxRA7/ksZH2ZCLntwS59EdXJuP20fXMePfXOv+FTzCpZhFA==;
	5:CFW5D7IFHC+Pbmipvreo6vBAa/LnNTEUGHVfipRzvaomL7aPmLpAig+lNT9/znV2M/BkXGvqcjPFZTtmnHMl1Toc49RXxbHJ28TVvSpq3pmqtc3MKZa4IoX43YKbACjuqzIB4EO3U20yTMLxp+V+c4ZjM42IC75GF3abFuV8b5s=;
	7:dFOtLuIOZziUAKcn6vg0P44r153sEP9nshKEmL9FFCbpBc0telyyiOQK5J2Yw0xPXM6fKoyAHNUnF5gPnXv72tLXmHmTp883K/8bFosuTG24QBs7DMeG/plkRlQG5gyx733ZboQ1cjPsR+i/bJ72PA==
x-ms-office365-filtering-correlation-id: 2b0da540-604c-4a88-eb57-08d65fb92eb6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1168; 
x-ms-traffictypediagnostic: MWHPR04MB1168:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB11688473A6676BD79D82729B90A60@MWHPR04MB1168.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1168; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1168; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(39860400002)(376002)(396003)(366004)(189003)(199004)(66066001)(71190400001)(2501003)(71200400001)(305945005)(6506007)(256004)(386003)(44832011)(105586002)(7736002)(25786009)(6512007)(486006)(68736007)(8936002)(102836004)(476003)(81156014)(106356001)(53936002)(478600001)(8676002)(72206003)(14454004)(26005)(86362001)(52116002)(50226002)(81166006)(2616005)(6116002)(36756003)(5660300001)(2906002)(110136005)(97736004)(6486002)(6436002)(3846002)(4326008)(99286004)(39060400002)(186003)(54906003)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1168;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: rsEM1GgaI4lx0VzRMD2AqNZsNQnw3n7Bm6iSkN+AYoLh1MLzkP7+7tX9uHPztMEy6dJvVFT49+IS+r4PCy0uTC7FDsWJWEdWEBXztaCZzGSonZTLemH4pkwx66rb91o49FmHpgSzQFF62GwMfXUDo/dd+Qdqu4A0l1bdb3pSii8fgxXPT71VxVyjQJSPpSqmnnxFd9UURqrOvg6DZwtDA7aje3XAlJTVaUqs2ukIvQJTWtkd95X9oP1PASDkIWxDARzQyrZIvAltyblkhB27Q9CqIYcc3bjhbtDZvncerBN9c9S4NkDERf9ruBZ11prg
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0da540-604c-4a88-eb57-08d65fb92eb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 22:37:07.9644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1168
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [PATCH v8 0/4] Connect a PCIe host and graphics
 support to RISC-V
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
X-List-Received-Date: Tue, 11 Dec 2018 22:37:25 -0000

This series is now ready to be merged, all of the patches are reviewed
and tested.

Palmer can you take this with all the other RISC-V patches sent during
the freeze?

V8:
 - Drop SiFive U support
 - Drop legacy -nic support
 - Small other review changes
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


Alistair Francis (4):
  hw/riscv/virt: Increase the number of interrupts
  hw/riscv/virt: Adjust memory layout spacing
  hw/riscv/virt: Connect the gpex PCIe
  riscv: Enable VGA and PCIE_VGA

 default-configs/riscv32-softmmu.mak |   8 +-
 default-configs/riscv64-softmmu.mak |   8 +-
 hw/riscv/virt.c                     | 147 ++++++++++++++++++++++++++--
 include/hw/riscv/virt.h             |  15 ++-
 4 files changed, 165 insertions(+), 13 deletions(-)

--=20
2.19.1


