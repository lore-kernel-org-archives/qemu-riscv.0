Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gjC75-0003JU-Oh
	for mharc-qemu-riscv@gnu.org; Mon, 14 Jan 2019 18:57:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC74-0003Ik-5h
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:57:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC73-0008TB-GL
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 18:57:50 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:59810)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=910900a2a=Alistair.Francis@wdc.com>)
	id 1gjC71-0008Pk-1Y; Mon, 14 Jan 2019 18:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1547510267; x=1579046267;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=SGPM4xA3mDvKJBvd1zs5tNceP/ZXXi0SX4ZwQtEphhY=;
	b=MTIbYrU3Ldg3jyMc96cp9jJOd04EToCI4Dwg7eVNE1svPCQ5l1BtwzBS
	SJ3QwT0YYavgvmhnT0OmsrZLGNoP/1pjpRrBx2fOTiHe9fwJ8CeACB1rJ
	ovhuUwB0HqGW4TK5Tgc+vwX5L99JpJsnzLDQlzTY+YZ6X+WLkymKnuX4g
	+pNY4g9c0cxaPlSO0Mi0ABbxpM7kvoGGm9YjA+vADBtVzF1OPYu/92ab4
	qtrS3Onj/Y2tqc5vyg6cUcBEms/Cyh/zdzbd+4YxwK5f3aKk9tpuqStqH
	aVr17bqXAwc7u+RJXrQb+BjvDxH9wLZo4aNmaAg5VPvrg6AS2zmseWYfp w==;
X-IronPort-AV: E=Sophos;i="5.56,479,1539619200"; d="scan'208";a="98765670"
Received: from mail-sn1nam04lp2051.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.51])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2019 07:57:43 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=fUk5P6D1253+kZnYKiut6u6zPdRceecnhjr4pCJkBV0=;
	b=YOsJR9Xoc/B1Qy4c7+b+XYPxS4U7D5glUc+MQUp7VZi7haMfAisoZo2tvGSqZgN5g1dF/HrHC82xhSjr7l4WBlVBJiXvHyUA2lFNbcgYge8xfgex4wwRDDc2bdfnhGhevE16vSVIzNTIFje8Mkt5CcDCYF8AcHcBnMS8cCYAOZI=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0895.namprd04.prod.outlook.com (10.174.174.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.18; Mon, 14 Jan 2019 23:57:41 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%7]) with mapi id 15.20.1516.019;
	Mon, 14 Jan 2019 23:57:41 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 0/8]  Upstream RISC-V fork patches, part 3
Thread-Index: AQHUrGTvPpbhO48aJEG7kiV2tzltKg==
Date: Mon, 14 Jan 2019 23:57:41 +0000
Message-ID: <cover.1547510220.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: MWHPR20CA0035.namprd20.prod.outlook.com
	(2603:10b6:300:ed::21) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.170]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0895;
	6:xmTK6U9Wbx4TviUyU7ZDiy5HmBAxfUVnbPcgjlzRe38NzLCwdpwXfJCfs2iYGjEsKM5m/VKvRLWwUtDw62j6ei1k+b8pzrKhNNt6skAMFb1uoIFvJCx4RG24iriQV0va4IbqzXpqfxWtQkbzZGZT2jTl7eo94nWw2VVEd1pENmSXE0KlQl0u+CDiabJ/+l71Qa40XyrcAwhrPtzTRPFc+6Fp8YypLQX3wh49uPxbAYsoFONbfNyiZOEzkFDknjodm3ZDFRQEQMDQ35lKhWVyYOH+JPMmXjiNVBHQb39abfkkjjyQEpvqW63V4pZi34aUiRDF8o2IW6Nn0ffBW8hYi5P9MLGsDf2vVgwxs05F4EN7juosWy2lLGnYOiyiIavjSJRsPO4IBW+DIR9Lkbgv4rcVa+/0rkEhdKXEBJh0czuVER/e5gxB1sB5vm+o4X04Og5k1eIJkefc/KBZSNRzBQ==;
	5:w/cyFZtcZkQe3T/pJwU7pNg/FCmGyoA8RhzCZcewzTomZdCNDkVcMmLJcjKk9aao7NKwPREpTvxSr9EMMuSpJAmQrtYt4LjoIWTK+tRD7B9uEpj4lRI/ljq0WIK5mu7OGqD/lNrCP207+DMWdlW1kexcCxnctljxBdO/PPaVEa9vEWkWGF8DM3lN0M3jygVLGXr9Y90RLIOnU7RXAI+okw==;
	7:6hkkeVBs+aFTMdq9NxEXytQSC8EpbGBfTCXzuPOAef2anHp+66At+PnePzJOC4Iu7op7gvNfu5ChIS2lohLf2tOhaUEftYqnCuGU2rbaoYsex335/gB/khTEMTymwArMgv06UeiZSmSj/rklqHw45A==
x-ms-office365-filtering-correlation-id: c249bc7f-e3a6-48db-1638-08d67a7c116d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0895; 
x-ms-traffictypediagnostic: MWHPR04MB0895:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB08951ABCCB60C72178664F3890800@MWHPR04MB0895.namprd04.prod.outlook.com>
x-forefront-prvs: 0917DFAC67
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(376002)(366004)(396003)(346002)(199004)(189003)(81156014)(256004)(99286004)(72206003)(386003)(6506007)(68736007)(5660300001)(81166006)(4326008)(2501003)(8676002)(44832011)(105586002)(2906002)(8936002)(486006)(106356001)(71190400001)(7736002)(71200400001)(50226002)(110136005)(316002)(52116002)(54906003)(14454004)(53936002)(186003)(39060400002)(66066001)(6512007)(6486002)(36756003)(478600001)(4744005)(25786009)(2616005)(6436002)(6116002)(476003)(97736004)(3846002)(305945005)(102836004)(26005)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0895;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IqXCnhTQJNBTtaCom0m6/D/U0OUz/FGOdyQ3I3CcyrBKfw2LKcBNdATWLlqSLTePa9UWSKdTIWs4sqqH/oe7+1Y797hsSiajF6AVk+srvKtNLYQ7n/dX3pAn0bFSI/iTFzPvaS1IGLVyFaYCV5FSB1JWDsxKXvbhs3jomGtDdb+fsZPf/WurQ4NBLppPv4OFLxT0qlJvNCRcvghdyrYL5zTj3aZ4ZZFTgbIlVfWzIr4rVi9DWUoNY0QouTCr65UD7isQE/xdAPXQmHih1K+h/5Qh3n8DDpAalTZjz3njsnH+BAE29mOsNli/y13qkWF8LsLjSR79j1B6uSDYvHLfx77ViSdx1Powp8uU2G2fT/qhdbmkF7iHzEfs+chzgM9l4bGORmWmf5s6JTwvwfBjCrUU4r3UwoZ/FiWCuQ4r0OU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c249bc7f-e3a6-48db-1638-08d67a7c116d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2019 23:57:40.4867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0895
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.42
Subject: [Qemu-riscv] [PATCH v1 0/8]  Upstream RISC-V fork patches, part 3
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
X-List-Received-Date: Mon, 14 Jan 2019 23:57:51 -0000


Alistair Francis (1):
  RISC-V: Add priv_ver to DisasContext

Michael Clark (5):
  RISC-V: Implement mstatus.TSR/TW/TVM
  RISC-V: Use riscv prefix consistently on cpu helpers
  RISC-V: Add misa to DisasContext
  RISC-V: Add misa.MAFD checks to translate
  RISC-V: Add misa runtime write support

Richard Henderson (2):
  RISC-V: Split out mstatus_fs from tb_flags
  RISC-V: Mark mstatus.fs dirty

 linux-user/riscv/signal.c |   4 +-
 target/riscv/cpu.c        |   2 +-
 target/riscv/cpu.h        |  31 ++--
 target/riscv/cpu_bits.h   |  11 ++
 target/riscv/cpu_helper.c |  10 +-
 target/riscv/csr.c        |  91 +++++++++---
 target/riscv/fpu_helper.c |   6 +-
 target/riscv/op_helper.c  |  47 ++++--
 target/riscv/translate.c  | 292 ++++++++++++++++++++++++++++++++------
 9 files changed, 388 insertions(+), 106 deletions(-)

--=20
2.19.1


