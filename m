Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXAPY-000081-Fi
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:43:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPS-0008Ua-OC
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:43:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPR-0001An-GA
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:43:06 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:39059)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPH-0000uS-Ve; Wed, 12 Dec 2018 14:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643776; x=1576179776;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=E4BRXTUQWXWFJZ0QAiQXjWFTvDGgagFdLPD09hmhvio=;
	b=ULSh2KBSBpQe75xKIrGV3EQmIJQa0mDtLEFB98RHfjWOB1u9kNNnmQXj
	W4A/UEQErqUOqRSFMnXSsgY3Gu9L3XPkLO7rVC+jD55pLgmW9tUKRfQN0
	+BMVvFW5GHEWnyPd8gHHssy8cLKjNrKUT5SDlwmmMFXsnIpc14M/MNKyW
	qKJvCYlii+oK0wzTrqXcNboMugiH8Z9RX8OfwULUU+ipCm3OumnFpEckt
	RbhloDXzrA1ppsyldX4u9T5un6FZkxWyFPQCyylAaehec7URJN2O91LZg
	OwLExl/8SB3vgES3xkctZ52J4WOWYZPS5Jx03R4r4MX1Tilq2AuXO9LqK A==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="101342179"
Received: from mail-by2nam05lp2053.outbound.protection.outlook.com (HELO
	NAM05-BY2-obe.outbound.protection.outlook.com) ([104.47.50.53])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:42:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jNW9wDjp9CXfTq13wMd01rzIQUgvk269m69QOPMkWcQ=;
	b=AqchBzh3KqlVvzg4I58FbQhF5E7iD9LdLvikKhZcSoLjunfSz8d3LlNb2+MnSKEL0wMi4YaDwsVRkUZIubHTmdo+HrRHnb/o/nEzn81LmUruqCkLSvVgPAjFCMh6qvrwBX1313YA4p+p4A8GTNQ2ZJSM3K4eLB2T37oEAuYS/ZA=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB3744.namprd04.prod.outlook.com (10.172.169.19) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.19; Wed, 12 Dec 2018 19:42:51 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:42:51 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 00/23]  Add RISC-V TCG backend support
Thread-Index: AQHUklLexMhLlkW7wUa7JkAKhspGng==
Date: Wed, 12 Dec 2018 19:42:51 +0000
Message-ID: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0025.namprd04.prod.outlook.com
	(2603:10b6:a03:40::38) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB3744;
	6:G8FdAL0OEJU/at7zmKg2SnwQit0kkpC+dZc9xzACsTDEunOpulF435OsHaQAOmCycCGERXkcNCwcNE2awezJIt1D53fQ3+q787cE9DXnj2ZCOtLr4dtSbLdqGkR7JsawVNyQrjrayRJ9cy39pdre+UKBt6AloALX+cCUtky7dYTJxvsoukr0YAOhWfNDUZzB1w5n2zshDLdFMrx8bYZpSnCnQEJ72Yw22+Ewli3NN1O/+eE+Sl7tiR26Ob0b1r3KSvS+Fs69gS9Q5wEQsgj1fNNGwWs5at/4odt0QmxuXwqBq58tLVhn1MRgIYnzRrLWxJq8NBJJNTIZmHtAkLZe/a/Y5Nof2wbu1VVgmtOjBeoTDIinqvUbDdCNtoWyfA79ogyGnYDZV5ZbgW4n5wGKvsIVBJjE7mp/meSD25iPtny3heS8RUeLNgUtOaCI3K3tULehoNnuVNS1z89hUX3dgA==;
	5:fmUdHy//gAnK2eLpy6zJND0kFaOJFSpCzZU4xAOfIuo1jCl1BcshlNRGrh9BRvrpatkrSV+QtD8YvOGDNYKr5JtXVL3v87myNfk10f/hp6tznJ089File9/uEdaGDAlupSv9uucMfkjtFvku/XZQAf1JrSdbvWFb+N3Eeosj7mc=;
	7:ytzTbpFF3NJwHpNNVPDicOh8Kk6dBoguA3FSvlSlcixoh/37HId/tE6GbhOwCNzbvBKl71g2M+lyYn2DreP2M4u4f7VEMrf6xjJZmQOAVax+gG1+mLVZb+K75SpAad8MY6AUY3Gi9r50LGVZE7aOPA==
x-ms-office365-filtering-correlation-id: a39c37fd-72ab-41f0-6988-08d6606a00b0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB3744; 
x-ms-traffictypediagnostic: MWHPR04MB3744:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB37448D6D2B35B34AB447CA5990A70@MWHPR04MB3744.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB3744; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB3744; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(376002)(366004)(136003)(346002)(39860400002)(189003)(199004)(2501003)(81166006)(81156014)(8936002)(7736002)(316002)(14444005)(97736004)(8676002)(86362001)(256004)(386003)(6506007)(52116002)(102836004)(6512007)(26005)(186003)(50226002)(6486002)(6306002)(4326008)(39060400002)(6436002)(66066001)(53936002)(6116002)(14454004)(966005)(72206003)(25786009)(3846002)(36756003)(478600001)(2616005)(476003)(486006)(106356001)(44832011)(68736007)(105586002)(71190400001)(71200400001)(5660300001)(305945005)(2906002)(99286004)(54906003)(110136005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB3744;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: 7AP9AU8JKFupU06r1xkd/+vkbOK3MC4cOUQ+CpbJGfVb8LOSJ5vfViIC0qIdHb3L/Yz0KKFOK6QJTx8wIhnVE4xvnQpMyIdLaZnBFGKBE6K+pd8XFKOdkbiEVCgtdOaSQtJ/UehorIrz2ApQwSptKK8RvWNE7zKBx6P3pZJa379yVWKvTBUzR8+EU3h0WjxjYn2xxzANoxo6MVhzJ94IFbb0yac05dIIXueD1EcgGpDstUqP6GWwvV+ww5ZLXF3esfu3Ngr/femEEFECC/yZKdtlvGgmQfYYCvXfBUoCrechxmGSvQ7DH3wlVRopPgXh
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a39c37fd-72ab-41f0-6988-08d6606a00b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:42:51.7615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB3744
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 00/23]  Add RISC-V TCG backend support
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
X-List-Received-Date: Wed, 12 Dec 2018 19:43:10 -0000

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
As this is all new work (so can't cause regressions) I'm starting the
patch series process with what we have so far. That way others can help
contribute and test. If anyone has strong feelings for missing functionalit=
y
let me know and we can work on adding that before this is merged.
This branch can be found here:
https://github.com/alistair23/qemu/tree/mainline/alistair/tcg-backend-upstr=
eam.next
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

 MAINTAINERS                       |    3 +
 accel/tcg/user-exec.c             |   75 ++
 configure                         |   12 +-
 disas.c                           |   10 +-
 include/elf.h                     |   55 +
 include/exec/poison.h             |    1 +
 linux-user/host/riscv32/hostdep.h |   11 +
 linux-user/host/riscv64/hostdep.h |   11 +
 tcg/riscv/tcg-target.h            |  175 +++
 tcg/riscv/tcg-target.inc.c        | 1929 +++++++++++++++++++++++++++++
 10 files changed, 2278 insertions(+), 4 deletions(-)
 create mode 100644 linux-user/host/riscv32/hostdep.h
 create mode 100644 linux-user/host/riscv64/hostdep.h
 create mode 100644 tcg/riscv/tcg-target.h
 create mode 100644 tcg/riscv/tcg-target.inc.c

--=20
2.19.1


