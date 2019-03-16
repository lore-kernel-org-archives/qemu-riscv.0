Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4y6o-0004Ra-M1
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 21:27:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4y6m-00047y-9z
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:27:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4xzY-0005zh-3f
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 21:20:05 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:48638)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=97190051f=Alistair.Francis@wdc.com>)
	id 1h4xzW-0005yv-AN; Fri, 15 Mar 2019 21:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1552699296; x=1584235296;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=/b3g9FYcjI7aThqE2q04K67wAXru5ShhsnEXa6tEbKI=;
	b=eoJOHhJyFN9qGgjJuzNhBuPLRLw0IXwwqPbkU+y5/pyDAMjG5TdxCHra
	kgg9xZVrEsk5mBiXcwO+ZVO8kxbNYACBdTZLyrLm66H6DNDgHuGyPVHBK
	8Q1n7/xRkTPKUb9aipFLPHcYOhwR5Vz1Zaabm7oK93KBYGhc4CkxfgUy6
	Nw40DblnDM2fgie5g6/a7i6EzGv+s/5+088QM1Oyd5ce84fAgU/aKH9Lm
	hBe9xNfa7ovm297R7PZvkce7n7X5WgcIhXhDuJYEDK4Qyw6bcqMdQIMdH
	WFbiDIU+m9jH6PS/NBT5+JKxV0UPRidLGs5wpu1EhAnka8qVVNqKDK47/ g==;
X-IronPort-AV: E=Sophos;i="5.58,483,1544457600"; d="scan'208";a="202186816"
Received: from mail-sn1nam04lp2054.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.54])
	by ob1.hgst.iphmx.com with ESMTP; 16 Mar 2019 09:21:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dfBA0oyZFzhxhXWd6LPujGSv+QJsiXKetvrFkryf5/0=;
	b=GfzJcX+NvsM3g/LCMevnG841JEcsSSStraR+5LqiQv+bxrz6vz9w/quGhz+x02DPj3uQFxDpQa2OZKTNTE5vbaIU0sWfragYrC0lqetya6GyuvJaeVpNhjHgISEi57FB80OQBfT2BSkWg794Tz0FqI77mhxQ6YGbuESJnSu2DVs=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5989.namprd04.prod.outlook.com (20.178.233.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.14; Sat, 16 Mar 2019 01:19:53 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7]) by
	BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::1c45:32d7:98ed:4cd7%6]) with mapi id 15.20.1709.011;
	Sat, 16 Mar 2019 01:19:53 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: "palmer@sifive.com" <palmer@sifive.com>, Alistair Francis
	<Alistair.Francis@wdc.com>, "alistair23@gmail.com" <alistair23@gmail.com>
Thread-Topic: [PATCH v1 00/12]  Upstream RISC-V fork patches, part 4
Thread-Index: AQHU25ZbxLkO+tjS0UmLu/DLm8utyw==
Date: Sat, 16 Mar 2019 01:19:52 +0000
Message-ID: <cover.1552699115.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR05CA0097.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::38) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2d6ad3b-e125-4784-fb72-08d6a9ad7df6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR04MB5989; 
x-ms-traffictypediagnostic: BYAPR04MB5989:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB5989BE98334DDD711E5403B990450@BYAPR04MB5989.namprd04.prod.outlook.com>
x-forefront-prvs: 09781D4C35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(81156014)(6506007)(486006)(8676002)(110136005)(6436002)(256004)(36756003)(102836004)(97736004)(6486002)(50226002)(86362001)(2501003)(25786009)(44832011)(6512007)(52116002)(386003)(8936002)(186003)(316002)(66066001)(54906003)(5660300002)(53936002)(68736007)(14454004)(72206003)(14444005)(476003)(2906002)(2616005)(478600001)(6116002)(305945005)(7736002)(71200400001)(26005)(4326008)(3846002)(106356001)(71190400001)(99286004)(81166006)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5989;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: f7n1MuccTdr+4VBPujM/oRQWcm5AMSktO1F9eiEGBJjNcF12FuZ3rFBfszhTelOnsymg/MrPhK5KJQvLufHXu+Vyjw0O7a9fBxCq1RbP33s/4ONPU2zcrfsBM5XBhcdY48UstTGwlno1dvGk1jPkJK+E68l2RasQrxWX7Kxd4aBekzvqTSc5OEua1qbcFEYScdcBp2bWrHnUOHeyYKwHabrxl9nG3y8Wj2I5JxYi+qRpf7Y+sLlc+BFSwSKRruQKblKV41FS3EzcfilHAHkRV+xfi0CcmbS70KY+ApQismb7RactqTZoy/h1QQIGyUHzYQVGHo7RP0ftA4AXo7Sep/j86crCH1So2Wwvn24Bjb1R3dgOvD8g9wZkcwVLhWDJJl9CntY1npeUA9BzLfJbg2KcN9dZ/dG8dmXBtoYn5Zg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d6ad3b-e125-4784-fb72-08d6a9ad7df6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2019 01:19:52.9099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5989
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.143.124
Subject: [Qemu-riscv] [PATCH v1 00/12]  Upstream RISC-V fork patches, part 4
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
X-List-Received-Date: Sat, 16 Mar 2019 01:27:33 -0000

v3:
 - Add a patch to remove some dead code
 - Rebase on master
v2:
 - Add a patch for SiFive U SMP support
 - Rebase on master

Alistair Francis (3):
  riscv: pmp: Log pmp access errors as guest errors
  riscv: sifive_u: Allow up to 4 CPUs to be created
  target/riscv: Remove unused struct

Kito Cheng (1):
  RISC-V: linux-user support for RVE ABI

Michael Clark (8):
  RISC-V: Replace __builtin_popcount with ctpop8 in PLIC
  RISC-V: Allow interrupt controllers to claim interrupts
  RISC-V: Remove unnecessary disassembler constraints
  elf: Add RISC-V PSABI ELF header defines
  RISC-V: Change local interrupts from edge to level
  RISC-V: Add support for vectored interrupts
  RISC-V: Convert trap debugging to trace events
  RISC-V: Update load reservation comment in do_interrupt

 Makefile.objs               |   1 +
 disas/riscv.c               | 138 -----------------------------
 hw/riscv/sifive_plic.c      |  19 +++-
 hw/riscv/sifive_u.c         |   5 +-
 include/elf.h               |  10 +++
 linux-user/riscv/cpu_loop.c |  15 +++-
 target/riscv/cpu.c          |   6 --
 target/riscv/cpu.h          |   6 ++
 target/riscv/cpu_helper.c   | 168 +++++++++++++++---------------------
 target/riscv/cpu_user.h     |   3 +-
 target/riscv/csr.c          |  22 ++---
 target/riscv/pmp.c          |  20 +++--
 target/riscv/trace-events   |   2 +
 13 files changed, 148 insertions(+), 267 deletions(-)
 create mode 100644 target/riscv/trace-events

--=20
2.21.0


