Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHcPI-0004UV-IM
	for mharc-qemu-riscv@gnu.org; Tue, 30 Oct 2018 18:22:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcKk-0000j5-8L
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 18:17:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcKj-0002cY-9A
	for qemu-riscv@nongnu.org; Tue, 30 Oct 2018 18:17:58 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:24942)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8344f8b50=Alistair.Francis@wdc.com>)
	id 1gHcKe-0002Tn-DI; Tue, 30 Oct 2018 18:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1540937873; x=1572473873;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=47iuzVS6iMe/sE4klU2w24V7qSaQh21zmp+XzU91OBY=;
	b=E7AGCsYRakv4GoSvLfn8TEWG9sthcp3VGPq/cdjNLRoWvK+ATXbABOh6
	mFYWvuFcBkpRflSdbePwiB84C4zWV1dnT/cYmNjf755szFYsrbei1XBts
	8ut+wbfSzFNjWPtbwx3Wo4ySUtkyB4lYrJoIm2I9xLf84M9e0n5lNuzVw
	217G24/TtoPqsx9ashJFM6jeTFOS53qkbvqTbvVhUq6J1jB0j9AAUFz7X
	Dw/+mbVxs7YdzZKR7MlZOfxky66sDA0nM0KxFmQqeE5oVk2acqGEc/mvt
	u7wrahcqzh1jxwcI1OHmsOB4Z7SUUuzjPPoU3f2Sbfte8ydFciRCAc8Ig w==;
X-IronPort-AV: E=Sophos;i="5.54,446,1534780800"; d="scan'208";a="94266044"
Received: from mail-sn1nam02lp0018.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([216.32.180.18])
	by ob1.hgst.iphmx.com with ESMTP; 31 Oct 2018 06:17:43 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Lmn10V/33IDznBmV699u0+f/7XUldNaPgiE5Ykqh1kE=;
	b=cyf6YTYRscrgYCoxSjoW13lH9OqkF1oFfH0OF3bmGPd1s4jTDjQgnmGxi9N3tyhvC2XRgV9ViiOoOsG4Lb5QNcdOAPtHaag8hYJ1vTHvzVpuzXW/uhOnNhHxSQHS/lsS6SH0JVfbXIvGMY5/nWMHMDvncBRbeYbuxlAD/JXmO3M=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0239.namprd04.prod.outlook.com (10.169.202.9) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1273.21; Tue, 30 Oct 2018 22:17:41 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1273.028;
	Tue, 30 Oct 2018 22:17:41 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v6 0/5]  Connect a PCIe host and graphics support to
	RISC-V
Thread-Index: AQHUcJ5fJw9fBFAVdEOc4TjsFJpt6g==
Date: Tue, 30 Oct 2018 22:17:41 +0000
Message-ID: <cover.1540937826.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0059.namprd07.prod.outlook.com
	(2603:10b6:a03:60::36) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0239;
	6:vTgt4gpQDN7qY9xtuQ2Yt+Oo+O/nRdtIqhCkPypqsZrbFME4p7Aq2dJ8HKQBTPdOTVirGKnp/iIA+zF93Ybzm6/UE/nDGsrwXNFAAj5lCWUZAPRLEKQnm3qWbM/QQEMnfrXuAxbkQJFQH7GCTDSNqKouDUwudgGJKuYxKn4dqAa85Kr2aeNzem1bts/Z9f9FJHrVREnTCr8P//I2rUwmqWUkEUKj44Wm7wLJICGeERwazm0GztUWnXrLgb7uzkJ8doI2OqT9b5bqUvowC3fMHDtJfioXgdlk7oub4MMhDdmNQnyJFqlVZDqTEC4vkFk7fskWmP8DcnQLuJ5OfPfWIo1CSRXfP8pXmlpFPMUiCXwUaMtbjxBou2g+tSXXMb1JTHjZ5Erwn3rbw5uRFi+qRSCL/LYdukkCDUSwdsfxjoYdn8qkZVXpAbFEJIhWXC8JPmwmiwn+ditTWrNcm+THCQ==;
	5:uiMoqj3lyXFaKMeKlZozRA6ATixW0Bfj3gEN4Br3hJDZ/4US/3yOanOZJLEQo2Q6LdtCiFAXEry4EFtXnrT7Q3RxImQ3bQvKVu3ihIEhQX7jWlJBRa13G3IV+4drz6ILnalvZDFr1G7tACU6hez/kIjUWhdUY7yl3PqsYuElyQE=;
	7:zZ4DdyM+8uZnMgvr0NPwK4j8yGTaR2f+D0y4JOtgt5CA6H/j/YUqGGMZV5iwa0CHTjGeZnPfaOJo3C/JCx8XdcNMcM4WxYoh6F4N45LjJJBA0/Fh7QUolNdlbCMUsnt5qyl+GI9G2wfiYHJw88swVQ==
x-ms-office365-filtering-correlation-id: 39aba0b6-0896-4101-b016-08d63eb5818e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0239; 
x-ms-traffictypediagnostic: MWHPR04MB0239:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0239644DFDE8C89CA5D93AEC90CC0@MWHPR04MB0239.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21532816269658);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231382)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0239; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0239; 
x-forefront-prvs: 08417837C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(366004)(396003)(376002)(136003)(346002)(189003)(199004)(2501003)(53936002)(71200400001)(105586002)(54906003)(97736004)(26005)(102836004)(6116002)(110136005)(36756003)(5250100002)(50226002)(305945005)(86362001)(106356001)(186003)(316002)(7736002)(8936002)(71190400001)(386003)(6506007)(39060400002)(44832011)(72206003)(66066001)(486006)(8676002)(14454004)(25786009)(476003)(256004)(6512007)(4326008)(52116002)(6486002)(6436002)(2906002)(2616005)(3846002)(2900100001)(81166006)(5660300001)(478600001)(81156014)(99286004)(68736007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0239;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: ITuQ9nmDzW2SuF1LuzU6vt9zwc1v0DZHbefAd7OJ7Z9j03XazGaNQ1bVEQjh47koeuNQX/SJ7vJ37ODyNJs556VBk/cPLmdmQLCKuz6aV8v+P26MYhLlcQYfqCzYVcXCH0ZlSkkgKzZLaQdk06Hc//R+vZHTdiQ5lJZsEifDI2ASe/gu6vufqFcovHCE7UBOeik74bcQpZVgI3egFmtem6GCdqMdljf10gorc9m1V/xfwfrAmj1Z6wfajE4Xe9PmpgSmgVUqbkKJ2ykKxzJ8Z6YpGHRUUiesHhvrivcVjMw0ylzKqVGKFxVGEBeVhGc3lR+nYS4lsuQHcnetFP3O4+OCbd2u3wjabpuc0Aao61w=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39aba0b6-0896-4101-b016-08d63eb5818e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2018 22:17:41.2546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0239
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
X-Mailman-Approved-At: Tue, 30 Oct 2018 18:22:39 -0400
Subject: [Qemu-riscv] [PATCH v6 0/5] Connect a PCIe host and graphics
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
X-List-Received-Date: Tue, 30 Oct 2018 22:17:59 -0000

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


Alistair Francis (5):
  hw/riscv/virt: Increase the number of interrupts
  hw/riscv/virt: Connect the gpex PCIe
  riscv: Enable VGA and PCIE_VGA
  hw/riscv/sifive_u: Connect the Xilinx PCIe
  hw/riscv/virt: Connect a VirtIO net PCIe device

 default-configs/riscv32-softmmu.mak |  10 ++-
 default-configs/riscv64-softmmu.mak |  10 ++-
 hw/riscv/sifive_u.c                 |  64 ++++++++++++++
 hw/riscv/virt.c                     | 125 ++++++++++++++++++++++++++++
 include/hw/riscv/sifive_u.h         |   4 +-
 include/hw/riscv/virt.h             |   8 +-
 6 files changed, 216 insertions(+), 5 deletions(-)

--=20
2.19.1


