Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQD6-0005Ef-Jj
	for mharc-qemu-riscv@gnu.org; Thu, 15 Nov 2018 17:34:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQD4-0005Dq-TA
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:34:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQD3-0003Ni-Sw
	for qemu-riscv@nongnu.org; Thu, 15 Nov 2018 17:34:02 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:50456)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8503fdbbc=Alistair.Francis@wdc.com>)
	id 1gNQCz-0003IF-7F; Thu, 15 Nov 2018 17:33:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1542321237; x=1573857237;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=MrWe87lxFlIorRJmSoZvhhOs2H6yIx93wRG50NQhX3o=;
	b=ahGVMKMcNe7Lx2OXgK0QNKVPTkmUf1XzpFHsEvvdqkAtdSLQZVNJM7Tg
	K4AA2tlaIOEYhSbwbnZv0Hl+0pj7MfXlalV77oM1yyqewm4Iwsu3ne2AN
	7/WxIL+7lL9bbDYFEQC7lloK4jxZLh/QVD5yw87OiHEUg2QSHusrQR+He
	ON98K3VD/TCK7GE0iIASDqq98SxkaZuIr/d8aRw9h7j92CMTu5KONcUdU
	RGSD6IbHimuGSv2kgD3VttVkm2ZCIjli2rrbbsx2obxFJTU7HpAFceNZu
	2IUyCF90gUP4gM7JiEWfxlLzSqRGC5+HAET9x3LryxVRrChlHWZyiFer/ w==;
X-IronPort-AV: E=Sophos;i="5.56,237,1539619200"; d="scan'208";a="95523243"
Received: from mail-bn3nam04lp0114.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([216.32.180.114])
	by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2018 06:33:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TtUWDPVndj4nYaXJfRYG/dLl1XVCi2VaXFQarEPnFyM=;
	b=DCZqW4PEsOgx4jGpNIMRlj2gjQGPvkmoKwsv6MABtmApuUYzfPQciAa9vDnS0XVrzlc7iUJfMrTMuS6BFiNpnFix1YESLQpGg0IP3Q4bB4jpRNiHoHQt6k7iD+Y14f9pirRblw1nowBFq2OihH7f/jGTtxz4HlR//lqAcE/VlDg=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0673.namprd04.prod.outlook.com (10.172.166.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.26; Thu, 15 Nov 2018 22:33:51 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::4853:2cc0:27bc:a62e%12]) with mapi id 15.20.1294.045;
	Thu, 15 Nov 2018 22:33:51 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [RFC v1 00/23]  Add RISC-V TCG backend support
Thread-Index: AQHUfTNIb54rBEN150a/YB8+E2Z5MA==
Date: Thu, 15 Nov 2018 22:33:51 +0000
Message-ID: <cover.1542321076.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0055.namprd11.prod.outlook.com
	(2603:10b6:a03:80::32) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0673;
	6:JNC+mQjMZThDzelZGAe/RkNSlhahFKHjdeYs0i0zJaiZWR0nmKSStoVLxRs+e0lBazh80mbCxbnoKawtLjM1zI5ffAmQ6pj2M0TPirsZ3Eh7v4Mf6oRgmXGU4fG60e3IpIRzNLT7zw3Ds+0eFY8+lHCkstvMR13tDZuO70QHDWNNBV3RRXzf3uxovNSQM2+cnyw0035iTpEoEGvruBBBACIOph884JIUTLbjXOhmtNwfaHRhpFzhQYX/UYcxHjgygb1S4WQeo4hwCRyst7dE72R+vPQmr7oLiMl49H7nnAqhWAYZrM5Vd6VDYdJWDIj+NSD0l4eKDpceV90nE0pisOcMpIo3gbB9yOD54t+clhcyMmPlvGiO1Ai3F3Punmy4wsHIerI52iEFt75PKAabqCZk8KGvqQNF+C1l02a/1rf2tBQLKMralJs3dMOXx0K0fx3ZNEg9stsSxgc4BpjveA==;
	5:adXuTFVd71THRlV+S582pl40Qjk+OHva4kP90QJGnYivVq6U3ZNBEsCgz/DJevYlVIaYSge4w33bIcE5iLlstlc/ece467lUoLhIAIThmR+vMe/2UgbgHcQCbUljWaVh2w3dOjmXt6UOZHmkeGzrYan6FguHUxs0mVzpmFeD/zo=;
	7:OVa3k0pZGvxukPVLfX543tiTuqQklJE6ytViGMM8jBvF7GRxplPbtm4iTw0AYuh46MrltotPDh8WmCuKwTSlHyXf0WZy7LNDy28mMtj8i8IgkZSkNNjVQMYUtklMwpAMIu8IO58eWm3FgP5eBI/O1A==
x-ms-office365-filtering-correlation-id: cbf61fe6-c11a-48f9-e625-08d64b4a6a99
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0673; 
x-ms-traffictypediagnostic: MWHPR04MB0673:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB06734FF4653F51B0FFD9262490DC0@MWHPR04MB0673.namprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231415)(944501410)(52105112)(10201501046)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0673; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0673; 
x-forefront-prvs: 08572BD77F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(366004)(346002)(396003)(136003)(199004)(189003)(6506007)(26005)(102836004)(386003)(52116002)(6512007)(5660300001)(99286004)(105586002)(6306002)(106356001)(966005)(478600001)(72206003)(186003)(53936002)(39060400002)(4326008)(6436002)(36756003)(14454004)(68736007)(86362001)(25786009)(316002)(2501003)(71190400001)(71200400001)(81166006)(8676002)(81156014)(50226002)(7736002)(305945005)(66066001)(256004)(97736004)(2906002)(2616005)(3846002)(6116002)(476003)(486006)(2900100001)(44832011)(110136005)(54906003)(6486002)(8936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0673;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: jGsaRmeH4CSIxVMfqiXHtYh7TtYFd5SYVmKlqWf9Dwv7rWDqjQhl0wQcxMyxyoZ2hi1ZT8pdwCedibIWW5FqBvT6/1MdYhFGcqDlmid+6zsXDt1scZWatfBn5HqUqilT9pmf+aqlUNwfFOvuEHqlMVQkDVCkNPalLqBbgs21kSTqWJ7iXSmTQ/0GvUNhFyDn/ujpK5tTExiSTOMTcKiUm6u15R+vZTxMb10ZGCWCDy0nUCxh7yHmLmJM3GisCP74n2b3wEBs2MuLyClEMdBG6kE56wTseKGoBNeDr3XcVFiFDm+LtWuZ7+rWMoQcsj34uMumcTGDLnaD4E5VVcwJpcSjX4zF7K0ufav8tncyGfU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf61fe6-c11a-48f9-e625-08d64b4a6a99
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 22:33:51.7215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0673
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.144
Subject: [Qemu-riscv] [RFC v1 00/23]  Add RISC-V TCG backend support
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
X-List-Received-Date: Thu, 15 Nov 2018 22:34:04 -0000

This patch set adds RISC-V backend support to QEMU. This is based on
Michael Clark's original work with some patches ontop.

This has been slightly tested and can run other architecture softmmu
code for a number of instructions but eventually QEMU will either
seg fault or generate an illigal instruction (depending on the guest
architecture).

I haven't tested linux user support at all yet. I think Michael had that
working reliably though and hopefully my changes haven't broken it. I'll
test both a lot more before I send a full patchset.

My hope of submitting an RFC is that some extra eyes on the code might
help catch what is wrong. Comparing the guest CPU state to a working
version hasn't given any hints as the states match, even up until the
generated code segfaults.

This branch can be found here:
https://github.com/alistair23/qemu/tree/mainline/alistair/tcg-backend-upstr=
eam.next

The working version with Michael's orignal patch and work ontop can be
found here:
https://github.com/alistair23/qemu/tree/mainline/alistair/tcg-backend.next


Alistair Francis (23):
  elf.h: Add the RISCV ELF magic numbers
  linux-user: Add host dependency for RISC-V 32-bit
  linux-user: Add host dependency for RISC-V 64-bit
  exec: Add RISC-V GCC poison macro
  riscv: Add the tcg-target header file
  riscv: Add the tcg target registers
  riscv: tcg-target: Regiser the JIT
  riscv: tcg-target: Add support for the constraints
  riscv: tcg-target: Add the immediate encoders
  riscv: tcg-target: Add the instruction emitters
  riscv: tcg-target: Add the relocation functions
  riscv: tcg-target: Add the mov and movi instruction
  riscv: tcg-target: Add the extract instructions
  riscv: tcg-target: Add the out load and store instructions
  riscv: tcg-target: Add branch and jump instructions
  riscv: tcg-target: Add slowpath load and store instructions
  riscv: tcg-target: Add direct load and store instructions
  riscv: tcg-target: Add the out op decoder
  riscv: tcg-target: Add the prologue generation
  riscv: tcg-target: Add the target init code
  tcg: Add RISC-V cpu signal handler
  dias: Add RISC-V support
  configure: Add support for building RISC-V host

 accel/tcg/user-exec.c             |   48 +
 configure                         |   12 +-
 disas.c                           |   10 +-
 include/elf.h                     |   55 +
 include/exec/poison.h             |    1 +
 linux-user/host/riscv32/hostdep.h |   11 +
 linux-user/host/riscv64/hostdep.h |   11 +
 tcg/riscv/tcg-target.h            |  173 +++
 tcg/riscv/tcg-target.inc.c        | 1728 +++++++++++++++++++++++++++++
 9 files changed, 2045 insertions(+), 4 deletions(-)
 create mode 100644 linux-user/host/riscv32/hostdep.h
 create mode 100644 linux-user/host/riscv64/hostdep.h
 create mode 100644 tcg/riscv/tcg-target.h
 create mode 100644 tcg/riscv/tcg-target.inc.c

--=20
2.19.1


