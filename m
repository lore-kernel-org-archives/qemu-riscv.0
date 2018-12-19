Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZhKa-0000aA-EN
	for mharc-qemu-riscv@gnu.org; Wed, 19 Dec 2018 14:16:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhKX-0000Xo-Nd
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:16:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhKW-0007wT-Hu
	for qemu-riscv@nongnu.org; Wed, 19 Dec 2018 14:16:29 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:43293)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=884a3e257=Alistair.Francis@wdc.com>)
	id 1gZhKN-0007oo-RI; Wed, 19 Dec 2018 14:16:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1545246980; x=1576782980;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=2WdnhTaDjDZooHQWdIyl4nLQbHJbMZ3BO8/AEejbPQQ=;
	b=qZ0kCCwJ1JAII0PhSqVhMtv5mYrduVckMmEhYbxUaofO8Y0G9R2yYqQg
	HbDBlYhqYMpA9CvBHdTg4hVE5xOC1z5GVBgTCnk/UDsv0V9fzHJT/DdU7
	eQsYieyqSD0G0+5EpFByNQ1n8qX9qESCwwBYqYoJ7CbUBmASPiJ+8yuNB
	BXj3l/Z+EL8oIZOZRAtEWPNgjTzNd5i6YWAFrJOkMXOe4XdtXM8Fr/FQm
	Ca3VYkxf8qZqYp4PpF9Ufy3T5kD7BOkIpcmpVY6MeAdz7BEYXjC+bUJlQ
	aisfE7HehyND6L0wrmFC0lAQJxgB0E70COyft8leUasx3DbfLKlwm5ojE w==;
X-IronPort-AV: E=Sophos;i="5.56,373,1539619200"; d="scan'208";a="98234098"
Received: from mail-dm3nam03lp2051.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.51])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2018 03:16:15 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Qt8Xpjwb5tp5Ksq32ezRsyqRummmGQRcEbN9yYelXI4=;
	b=Fgpw1XRQsfK8ed7n0g/hpiT0A7LIkmL+eesNLXajmb7VdSxEvxgHVLjUTjH7Ho9G3xJ4Isnj3L9JiOC13+5bdxiFrCALEF36yCzH1Z7TzfqyD5XpM63cvZmmbQr9F48cCOfI2qCy00geH8i8czgdVTVkezr3MmgiXSa4GI/6Pms=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1041.namprd04.prod.outlook.com (10.174.250.24) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1446.19; Wed, 19 Dec 2018 19:16:13 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%4]) with mapi id 15.20.1446.018;
	Wed, 19 Dec 2018 19:16:13 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v2 00/23]  Add RISC-V TCG backend support
Thread-Index: AQHUl89OzEUnQrF5HUq94D68EMR/XQ==
Date: Wed, 19 Dec 2018 19:16:13 +0000
Message-ID: <cover.1545246859.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR03CA0019.namprd03.prod.outlook.com
	(2603:10b6:a02:a8::32) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB1041;
	6:EmeQWAQ441kOAvaFHNjBqUxeSxgKsCNcXzgdCjBbQV2nz2R5MbjcEKvhbkpyQCM6ZbGRqVBU+8stj0r29IaFIvCLo5G+vQvBpjGtksjles/DP+IdBiOKE7qDK5XW1Ayg17SAaGF70aVyJX6vz41ck1M3fZfs/MTAWsJMUA5KnCjVvszHVcYfGab31Kk3my9ZWCgq6oWVS25Ss/j4paHauAY0LT+hskZxQWnSL3JxxjxqwwmVblm3vM7MPbuSIStyAYRqPtXKAp5BC5KMBhmGsFs6c1KW4m82DEulUoPjEkTEDD/CIhcaPbPlW0spA6ThEHtPyIlfIIbPCH0/hpRhCmUII+8SQ3kv4fbD40monlOBNVgZ1GTCpuN44ew6G1l2Z+FHOZeosXbmnXsCxg3v0LV9BJdtmWqpBdVOeG0x8+5e3wWD67FVPNSn9N+JL3dX35mCjvGkGzhc9/TG90Bj2g==;
	5:nSEUiGbt7o+i9FPUseM6qq/y4zf4t5d/cqIz/ezTZb+CuV/WUyprXMbagZ//1GYZDmBYn8jjgg40r1W6o23eqHPzkSMaN1OaWwEPdoiSQI0SLr/cOxp2xck9tRcpWz1OT4L5iCxoWjtpWmk5LEBdOTG3ntEybupp/Bw+1NeLVxo=;
	7:M0iyWdo8Ph8Xkq4yMR6jI+3s1nnyr/aqmkbL8Vcgi8qoneJQJUXz5JVEROMTnMvjUXa/919ghEEvIZv/tTavI//wkABrO/SmV5pOQ2hqyyLGwxCxmG/08TWgDtt7Cetok72IqEaKTTCr84FIU57g7g==
x-ms-office365-filtering-correlation-id: 0891885d-9149-4d1b-1187-08d665e670c2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1041; 
x-ms-traffictypediagnostic: MWHPR04MB1041:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB1041C6324333FA45A864E2C890BE0@MWHPR04MB1041.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231475)(944501520)(52105112)(6055026)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB1041; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB1041; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(366004)(376002)(346002)(396003)(189003)(199004)(71200400001)(8676002)(81156014)(6306002)(81166006)(44832011)(71190400001)(8936002)(36756003)(2906002)(3846002)(6116002)(97736004)(7736002)(305945005)(99286004)(476003)(86362001)(5660300001)(316002)(2616005)(52116002)(50226002)(26005)(105586002)(110136005)(486006)(68736007)(54906003)(186003)(6506007)(386003)(478600001)(53936002)(102836004)(6512007)(6486002)(66066001)(6436002)(4326008)(14444005)(39060400002)(14454004)(72206003)(2501003)(256004)(966005)(25786009)(106356001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1041;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: mCSIEEbFjazPK1YHJOJwIo3tZS2YqV5N4XIfdOfzLjRU4Ytf/L8d1dHDMr2fey7kV/nyXknk3o4+0y2WYOCO5ShGlNfiPaSB5QHb+XONW94NlrrixuKpusLSL03YN0YWb22b/K3nTcywrCHUmKd2JX10lJAnV5Yx/jXMutlcw/tzPaf500DKmX1lT84gLULMWbMWrmQ7Op9qpgXoTHa0QPhmkD+86GDD67NrvTpTq0qwMt18bzSsLlWlek+MIC9XH3vwiaeyDM5nPt5SmWe5MsZblM2B/PNQZm6dpKS6ApHQPQRbVYRovBu64hY5l1Is
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0891885d-9149-4d1b-1187-08d665e670c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 19:16:13.0636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1041
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [PATCH v2 00/23]  Add RISC-V TCG backend support
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
X-List-Received-Date: Wed, 19 Dec 2018 19:16:31 -0000

This patch set adds RISC-V backend support to QEMU. This is based on
Michael Clark's original work with extra work on top.

This has been somewhat tested and can run other architecture softmmu
code. It seems that any complex OS will eventually hang, but we can
run the BIOS and OS startup code for a number of different operating
systems.

I haven't tested linux user support at all yet. I think Michael had that
working reliably though and hopefully my changes haven't broken it.

There are still some todos in the code (there are missing instructions
and byte swapping) but these should assert instead of generating invalid
code.

This branch can be found here:
https://github.com/alistair23/qemu/tree/mainline/alistair/tcg-backend-upstr=
eam.next

v2:
 - define TCG_TARGET_HAS_MEMORY_BSWAP
 - Fix new TCG MAINTAINERS entry
 - Rebase ontop of Richard's patch_reloc() changes
v1:
 - Fix long jump with slowpath load/stores
RFC v3:
 - Update the MAINTAINERS file
 - Enusre that RISC-V 32-bit works
 - More changes based on Richard's feedback and contributions
RFC v2:
 - A large number of changes based on Richard's feedback

Alistair Francis (23):
  elf.h: Add the RISCV ELF magic numbers
  linux-user: Add host dependency for RISC-V 32-bit
  linux-user: Add host dependency for RISC-V 64-bit
  exec: Add RISC-V GCC poison macro
  riscv: Add the tcg-target header file
  riscv: Add the tcg target registers
  riscv: tcg-target: Add support for the constraints
  riscv: tcg-target: Add the immediate encoders
  riscv: tcg-target: Add the instruction emitters
  riscv: tcg-target: Add the relocation functions
  riscv: tcg-target: Add the mov and movi instruction
  riscv: tcg-target: Add the extract instructions
  riscv: tcg-target: Add the out load and store instructions
  riscv: tcg-target: Add the add2 and sub2 instructions
  riscv: tcg-target: Add branch and jump instructions
  riscv: tcg-target: Add slowpath load and store instructions
  riscv: tcg-target: Add direct load and store instructions
  riscv: tcg-target: Add the out op decoder
  riscv: tcg-target: Add the prologue generation and register the JIT
  riscv: tcg-target: Add the target init code
  tcg: Add RISC-V cpu signal handler
  dias: Add RISC-V support
  configure: Add support for building RISC-V host

 MAINTAINERS                       |   12 +-
 accel/tcg/user-exec.c             |   75 ++
 configure                         |   12 +-
 disas.c                           |   10 +-
 include/elf.h                     |   55 +
 include/exec/poison.h             |    1 +
 linux-user/host/riscv32/hostdep.h |   11 +
 linux-user/host/riscv64/hostdep.h |   11 +
 tcg/riscv/tcg-target.h            |  177 +++
 tcg/riscv/tcg-target.inc.c        | 1946 +++++++++++++++++++++++++++++
 10 files changed, 2305 insertions(+), 5 deletions(-)
 create mode 100644 linux-user/host/riscv32/hostdep.h
 create mode 100644 linux-user/host/riscv64/hostdep.h
 create mode 100644 tcg/riscv/tcg-target.h
 create mode 100644 tcg/riscv/tcg-target.inc.c

--=20
2.19.1


