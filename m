Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRkZP-0002yx-Rj
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 16:06:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZK-0002xD-QL
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:06:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZK-0003Zo-3k
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 16:06:54 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:36049)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=862abf4e0=Alistair.Francis@wdc.com>)
	id 1gRkZF-0003Xz-HK; Tue, 27 Nov 2018 16:06:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1543352809; x=1574888809;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=tliu+SOOSNZriI0avie0tu4je4NEmhLfqVYeeAHvK2U=;
	b=hxT092eNjeH95JXu8HTyW6E/X6JivLYn7jwB21IGAwGNDW0ZeEMVm4Lw
	pwUfdf91o+VFlsUi+Y0M0FvWZt6nJU+lKerkaClLpYYSk4dL0A+C8+M3V
	s6Zh1g+jTEe+CgP3lfRLKOpeyZtcQKvMDbr5eV1K5VMHEJW4SlppnWvHe
	dVmL/Zq9nVNdNth6e4cwPBrDnB1n+v/dRt8vLhc6rxSdilK3yF14mf5LP
	ap07QNsAvKCk4jcw3tuOI/1zIhp9vHaTROWQ9werf1Itm2qt52em4FBsa
	+hD5irHpbOZS4ugjU2M0jDXPIujC+9Ar2YFm/Wz1+Yfp4ylKfAZcuplJ1 Q==;
X-IronPort-AV: E=Sophos;i="5.56,287,1539619200"; d="scan'208";a="100064151"
Received: from mail-sn1nam04lp0085.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([216.32.180.85])
	by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2018 05:06:37 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BZ/81PBNS2JJRUoeWILeoSP9AdhWxg7UDcQi1Ppijhs=;
	b=AYyvOVYRYEhvyTkYs4wKwjH9rd/b81dSB7uPhYbkKWbP8VvfpKZ48DBxSpZv9Ouy957GAgUFt4J+CoNfflLb058yf/9aCBl6Wpy2VOioopi4g3r1O4fRM2cmoGY03hFPF2WeuCt3ctDy2YJq1ACNF9LjCRzfm9kolaIzZqa+xKk=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0943.namprd04.prod.outlook.com (10.174.174.153) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Tue, 27 Nov 2018 21:06:36 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::d13d:19d3:fc93:2ec5%9]) with mapi id 15.20.1361.019;
	Tue, 27 Nov 2018 21:06:36 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [RFC v2 00/24]  Add RISC-V TCG backend support
Thread-Index: AQHUhpUVJd8dRayP10+9+u+vAw0oHw==
Date: Tue, 27 Nov 2018 21:06:36 +0000
Message-ID: <cover.1543352682.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR11CA0108.namprd11.prod.outlook.com
	(2603:10b6:a03:f4::49) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0943;
	6:DSln0nOg9WeVGe/0WurdppuotJCeIG1SO1DeJqB5ZGfRyE917+NkInHN2TiVkNnwRs+HGMIWlE0Be4b6mU1xCbhnCtT9Xgx8NeKb0IP2QpYd0rG4zbaJZSSzOW55QJlv7p01rfgCmyqCBcoz+1ZrvxJD7xzLWEvwMiIrrMWvAahADS0gMqWTrGbAa3QlJKPND3WSHWK7Jv/0TiwaZv8P/h07qSkIQkb9bD1NyUasPgv4R5gkBZD+C7XG4FTkauYYmTyWr0vhip2QJGz0aCDcmnLL0kRNWTbF34mhoHWW8PNbl8TIq7RJivANOKuF9C6B25UAXmPM5phSK0O+oxXO9GHahWRMYij1KN4woJ3uvvbErVbl6sWfvwmhQC87R3ZghY7K4l0CDbzdbD8OUonPaqQ2AWrHw6i/rJExP/fXnAaeq+IGbj2gYI6sZxnZnP+2ooBcWjHnC8PqqJwWAjt/Ig==;
	5:cseHJEa6W74NH2AlFXGFEhBXI0sq9ZvR6CJu1SgaeXb1LdMlcuvqpWcKL8aHL+rnB1rWjnJ/yT9afxxWwekl1ZtBErDNq73/vKl1pE5GR3pScSqsvzT6zsZyguglnb+a0C2do/b7zn1xPrJ1Tjcs4QcOBWrQ59H6/KmEJDWRG6g=;
	7:P9ouHvCvK0gtAsaZu11z285tdOIybBytdXFKzt0obUwrR0TOKMDv6+gPiZ30NTZQBcxMYe0HoMPOy5A1MAf5Ov6kLD0AfDjcE/G4+7NSuMgSWr1ElpGhBmTS1QFQSmbJTkTsdS03JNGxX2QMWn2ECw==
x-ms-office365-filtering-correlation-id: c6bf27ce-eed6-495e-e2a0-08d654ac3763
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0943; 
x-ms-traffictypediagnostic: MWHPR04MB0943:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB09432329C0C0BD0F800C2D9990D00@MWHPR04MB0943.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231443)(944501410)(52105112)(3002001)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0943; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0943; 
x-forefront-prvs: 086943A159
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(346002)(366004)(376002)(136003)(189003)(199004)(14454004)(97736004)(5660300001)(2501003)(4326008)(81156014)(81166006)(8936002)(256004)(6512007)(316002)(53936002)(8676002)(39060400002)(110136005)(7736002)(305945005)(36756003)(3846002)(86362001)(6116002)(54906003)(68736007)(99286004)(52116002)(2616005)(72206003)(66066001)(26005)(486006)(44832011)(71200400001)(71190400001)(386003)(6486002)(50226002)(6436002)(25786009)(102836004)(186003)(476003)(105586002)(6506007)(2906002)(106356001)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0943;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-microsoft-antispam-message-info: HT+nARvQDt4b7WB9nTquIUIBgXWYm1z/PpxDRojHfcIacde/bwq6ZxiTbJlTFTsuMCuK+nbzB0vFeUkhE07uQpxVAaiG82iRNwgfil7KmeThkYJB7ro3nZtLCqO3CoTo8cprELkfTqYA4JVe3QwIWVGqcs38r4weCr5u1r7zagXZT4CAV8iIyskTAqSCy5/GbLV8646WeZbsuSbdniUWSmpQbku/+/VVowOnUXiEWsjuQHq3wgioH/RuYYdJ/INNefQ/y619BsLuDHotEAeEb4aWqlRcG9Sfp6fi+vgX9dC0TPVz12Z/HVM8EcV2TM+EmB/RpJ3polLXuA1mGyP7jr3UelBb1nysykmQAdxXG9A=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6bf27ce-eed6-495e-e2a0-08d654ac3763
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2018 21:06:36.2404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0943
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [RFC v2 00/24]  Add RISC-V TCG backend support
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
X-List-Received-Date: Tue, 27 Nov 2018 21:06:55 -0000


Alistair Francis (24):
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
  riscv: tcg-target: Add branch and jump instructions
  riscv: tcg-target: Add slowpath load and store instructions
  riscv: tcg-target: Add direct load and store instructions
  riscv: tcg-target: Add the out op decoder
  riscv: tcg-target: Add the prologue generation and register the JIT
  riscv: tcg-target: Add the target init code
  tcg: Add RISC-V cpu signal handler
  dias: Add RISC-V support
  configure: Add support for building RISC-V host
  WIP: Add missing instructions
  WIP: Try to patch longer branches

 accel/tcg/user-exec.c             |   75 ++
 configure                         |   12 +-
 disas.c                           |   10 +-
 include/elf.h                     |   55 +
 include/exec/poison.h             |    1 +
 linux-user/host/riscv32/hostdep.h |   11 +
 linux-user/host/riscv64/hostdep.h |   11 +
 tcg/riscv/tcg-target.h            |  173 +++
 tcg/riscv/tcg-target.inc.c        | 1890 +++++++++++++++++++++++++++++
 9 files changed, 2234 insertions(+), 4 deletions(-)
 create mode 100644 linux-user/host/riscv32/hostdep.h
 create mode 100644 linux-user/host/riscv64/hostdep.h
 create mode 100644 tcg/riscv/tcg-target.h
 create mode 100644 tcg/riscv/tcg-target.inc.c

--=20
2.19.1


