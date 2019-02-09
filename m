Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gsGzo-00054N-Dn
	for mharc-qemu-riscv@gnu.org; Fri, 08 Feb 2019 19:59:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsGzm-00052R-85
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 19:59:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsGzl-00066w-Br
	for qemu-riscv@nongnu.org; Fri, 08 Feb 2019 19:59:50 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:1215)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=9369ea4ad=Alistair.Francis@wdc.com>)
	id 1gsGzZ-0005mq-R6; Fri, 08 Feb 2019 19:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1549673978; x=1581209978;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=zTK/hMYPoLRnUSKsaB3Yls3rkqb6RKV3mSEt7rc5Uj0=;
	b=paFfDnzeDYnOPmYWyKnN4ie2db50HjO59DUAqq1gbnBTqqUwKQUF+1Qh
	3jZm7H6Wro9GurgYA1btFhRVEwq5cGOTPSEs8xay2n3uyc8dTZbHakxTz
	i8CFQqQsu9z+kZb5KubsS0b8R3dH428swYKuugQTaS2sH9sVl8lhIweBz
	Hxn8nu4HbnKICkucS/qQ7g05rG0JVJj9vqBXzg4ad+trS/GrptN4oLAyh
	zYnPqnhxddAqIZoHI7kPPowQ9WQfytKLS9Q+CaeeITYsmp9lITBrNgZZM
	4yK7usDBBZOsaP3sUpWqs8MGaedadQzKWGHOQeBND3nU0qigU6n8JVGGo w==;
X-IronPort-AV: E=Sophos;i="5.58,349,1544457600"; d="scan'208";a="100821361"
Received: from mail-cys01nam02lp2051.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.51])
	by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 08:59:22 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MJcyhfWh2ZLSuDgJtvgyXpO4/mK79X7kQvMi4fmkoIo=;
	b=GkQGZeEzg9J7bhDgbe7Z16n9P4a2Sqo3MD3UuiRowmk5qhw0BlNMXT52dIB31AwqJIu1wSjTUcqzy5QL+7WoLpZBWpJEnDEmimeij1hC8w7FXt5qsK/WHejOgl5uyl9FxViXYT/jbcNAr4gL+bZgUBCpF22fxG4GklhmXjFaBSI=
Received: from CY4PR04MB0392.namprd04.prod.outlook.com (10.173.190.148) by
	CY4PR04MB0409.namprd04.prod.outlook.com (10.173.188.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.21; Sat, 9 Feb 2019 00:59:20 +0000
Received: from CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286]) by
	CY4PR04MB0392.namprd04.prod.outlook.com
	([fe80::2057:d590:6918:b286%9]) with mapi id 15.20.1601.016;
	Sat, 9 Feb 2019 00:59:20 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 00/11]  Upstream RISC-V fork patches, part 4
Thread-Index: AQHUwBKw70iUApqo+kaGkewcgeRKMA==
Date: Sat, 9 Feb 2019 00:59:19 +0000
Message-ID: <cover.1549673900.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR11CA0096.namprd11.prod.outlook.com
	(2603:10b6:a03:f4::37) To CY4PR04MB0392.namprd04.prod.outlook.com
	(2603:10b6:903:b5::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR04MB0409;
	6:Nzxn3WPQv6RdGKYdo0XZKbyy+nbiOHh5FICW5XmkqtOKtGnMMsSRDtVTPhYZOtdA5RxBDtWMv5eKN/SrOySpY2pEiyjeW2foRNTlvlXAYq80UYcuF55RBHz+hob0op7VwKVu1rao5MnZqZ9S2R54Blva95lVYDKgt4AMcJ2KulKezkARjf0rwqlim0FkAzUImn1XUhQrXDgKARNIUufxMr1enwwy2u1JtKehfJJvK00zerqP/ZK6Lpxze5BMzGya57VPTDaGNdWe/D/x4xQ8w17F0nVZZn5O4a6cWZtS0UNNcclVXrKgxhGBdXgy6kzwnKD0xCAo1joTVRbfyR5qJ2L1fd8n2ebEEOePuHeOmp14cw/cOLBZbjj0S1dMEJgBUaF/XJ/R8K2TBgyKHEEPvzH9VctjBxLO3b6gJ/jyIgTzt8n7RiBl3Qmw073ihVh5AFVoT8p68nnENlhpbRZmuw==;
	5:MZXmf5d8zmZCiPHEJ57dPgbeIh4hOypD0GpVPVrm7C/WziAER6UMiwNjtObVHXU06SC0kwKk3YFL4v72vnu+p28KI39xLYlZdQ3jt0m61XYsRyethO/4orSH7TZRPWt4iKklYeWihnvG1Ka6fci7Ec4iC7p+H3Sqt3pAE3rsgjx9szGsbVktCO6zTt2somMl8QyyZfsLHpLROnlqOBRdOw==;
	7:zYtqxWBylzYecRT9FA71sf1qu/zAyxZeoaj0FN0Yh554P69U8moRNkrM1lM3GyvpqfcgpAC2ITgd0Q/6dz6dncNK+C8wlt4vZ0G5Xntt/F+sQGYpi+av6mCdf5kzfdYqeauj0UmE/8rhGuCHyg1HMQ==
x-ms-office365-filtering-correlation-id: 302101a9-3b85-42d4-2296-08d68e29d261
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0409; 
x-ms-traffictypediagnostic: CY4PR04MB0409:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <CY4PR04MB0409BC8734D3D80FE71E3242906A0@CY4PR04MB0409.namprd04.prod.outlook.com>
x-forefront-prvs: 09435FCA72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(316002)(6506007)(386003)(86362001)(102836004)(53936002)(97736004)(44832011)(256004)(14444005)(66066001)(71190400001)(4326008)(71200400001)(6512007)(36756003)(25786009)(7736002)(305945005)(68736007)(2501003)(2906002)(72206003)(6436002)(50226002)(14454004)(6486002)(2616005)(81156014)(106356001)(8936002)(105586002)(476003)(81166006)(3846002)(6116002)(52116002)(99286004)(8676002)(186003)(54906003)(486006)(26005)(110136005)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0409;
	H:CY4PR04MB0392.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sss2vadiRf1fcUx+mht21be9twmRXfB35F10lz4H/ukFiAWSpsR+V64cj55IPLAPs+VbL83UWFHCoMURZ4/YWc2s4awR2WCr7lZvPrf6zV+LCGL9RcRDU0tV3gzcXECoIPybEpayuJW7C6PXEqJ2BGaigUjQLtk482Z1rLUq2IgCDdgvwzyie6QWAXgCUVq0/eBwOFwXBD4NPA5bWVU4XqLxp5W9Z/cHA9jO/Cq80ZNVemsQGJ0xJprl2TBkBzhISqC02E5HTftnWK+0mPEHqI4GCh1BUpGppZ4UCJy4jZkUi/IWn3RisB7FjjJlqKj6y8lOnPFhadPHDutSAWXihSUKHhoRvQeoI8FkWiPPTlaj8UiPE1G9HmHjssvMZ7oTJZ8QdCVGG7D0zmwZEwhl8zQKlQk8buMXPEfRFD/nCLI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 302101a9-3b85-42d4-2296-08d68e29d261
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2019 00:59:19.1906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0409
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 00/11]  Upstream RISC-V fork patches, part 4
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
X-List-Received-Date: Sat, 09 Feb 2019 00:59:51 -0000

Based-on: <20190130173601.3268-1-palmer@sifive.com>

Alistair Francis (2):
  riscv: Ensure the kernel start address is correctly cast
  riscv: pmp: Log pmp access errors as guest errors

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
 hw/riscv/sifive_e.c         |   2 +-
 hw/riscv/sifive_plic.c      |  19 +++-
 hw/riscv/sifive_u.c         |   2 +-
 hw/riscv/spike.c            |   2 +-
 hw/riscv/virt.c             |   2 +-
 include/elf.h               |  10 +++
 linux-user/riscv/cpu_loop.c |  15 +++-
 target/riscv/cpu.h          |   6 ++
 target/riscv/cpu_helper.c   | 168 +++++++++++++++---------------------
 target/riscv/cpu_user.h     |   3 +-
 target/riscv/csr.c          |  22 ++---
 target/riscv/pmp.c          |  20 +++--
 target/riscv/trace-events   |   2 +
 15 files changed, 148 insertions(+), 264 deletions(-)
 create mode 100644 target/riscv/trace-events

--=20
2.20.1


