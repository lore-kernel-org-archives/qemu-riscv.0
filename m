Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXbBb-0000Lj-Ju
	for mharc-qemu-riscv@gnu.org; Thu, 13 Dec 2018 19:18:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbBZ-0000KK-Dh
	for qemu-riscv@nongnu.org; Thu, 13 Dec 2018 19:18:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbBY-0002A3-Hi
	for qemu-riscv@nongnu.org; Thu, 13 Dec 2018 19:18:33 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:28655)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=879e7201e=Alistair.Francis@wdc.com>)
	id 1gXbBT-0001rN-Rr; Thu, 13 Dec 2018 19:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544746708; x=1576282708;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=8EE5lzbJngHCYFdJepz1GOtQVkjk//CD5wWWq0yRybQ=;
	b=GCTSq4YjU0AzKJY8yEaUvIPePIAk7XP4p5uV+aT35jHch1icD8FuV/kW
	H0mN9a56drDF0aWZygaqzvW1OamVEOi6NzhDcwvSMY/xr3OWXGP1Xr+dw
	5PUNHNcWsWsLxgYFdCyp5JgWzELfiQf7eCXbN1pEINjWCEdNFE82Vr2oA
	D8NN05un5gyV5PBBQmd07y/gAWwq3kX5UDWEZtGwGsNUDHUxLnwD4ZrCR
	/DOr+z/F93VylVnusJvh9iqMOFE8zft5pA7MxHJyX81vASUvTI4xjmif4
	2SAXcdYCPKLA5uwa5uPwT/cxhV/yF6+wvt0bPTrtppibEq8TxREUBLY0D Q==;
X-IronPort-AV: E=Sophos;i="5.56,350,1539619200"; d="scan'208";a="98299645"
Received: from mail-bn3nam04lp2053.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.53])
	by ob1.hgst.iphmx.com with ESMTP; 14 Dec 2018 08:18:24 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GJGKQ8TtcSBLULbUEuGfDB5wzB4alBWdoL4eCMqLyCg=;
	b=TDQBoFMlF/SUE7D1mH6uzbJTXT/naZaE3aEWkAnzl1xE9QRISn4Ave+gDQdPNHFeVItCoA1Wt3/UHvyA9phHTBR8Iy9b3OC94ea3cT/rfymtce3GkDEeVqDMiNBXjqhcHkYz8BnbGKEcyJpn3jt0r+w5/hisJjmQuARzomYpW/U=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0497.namprd04.prod.outlook.com (10.173.49.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.27; Fri, 14 Dec 2018 00:18:21 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Fri, 14 Dec 2018 00:18:21 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 0/5]  Misc RISC-V fixes
Thread-Index: AQHUk0KFSDoDoN6TDU+7sS2DqiHd3w==
Date: Fri, 14 Dec 2018 00:18:21 +0000
Message-ID: <cover.1544746653.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR07CA0094.namprd07.prod.outlook.com
	(2603:10b6:a03:12b::35) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0497;
	6:GMX2ylQS2HCJwGbMHicI+ODWo3XMH9OQQxm9Wiq3LfKPfOHRhgzPbh22fATv2rmh6zYzD+09KSUucZ0fmyJfC0ud8BLMLowkrk7Zw3MVfXqAtub4pwIi1yIY7pN4DBuXEbPGrBechjbmXe/Mqv8H42Hhhz9Q4JiJcUOUfWBVzz5M7QisF+3F3GKs89LemqxkJkbi2RIGXVS09xIMFT11dZRzVa/QQTy0Wh5X8s0J+l1dmcfmDj8pzVZOjLWhhsD2ZrZ4BmWalLXjlmwx2rwK6R5RDykGjNW3EGDA8d4I3LSCGNFPATdZjVhC/Qkn8SXK6IxzEJyff5qNsUvFm8jqcNqvzYzBdTfmk0Sg86YEBipD8gMBOZFiyOqrEtnnJXhSIOtwf/f5v1xW70NG1pZdnIROp5bJ6bcfNOJOBRgDHDxX1rEgZKvLgrwSDkLtvTavkhl6jiXg1xvpOyUl0m0bdg==;
	5:eKLvKxFFR5LcIsQshMlORxP4KZ2TKlGIwMOVdw66B0Iy9lDzX0UxMoVwVrku/8qDoQw0knnwJPASYxsm5RcU9qg5BT/6AhjITeIieyl9SPACQAHhBYVeVXvF1KolOvSVYwFJn0LbwQKYjxu390Fhas5Cs3R0MRgBmtV5KznaGrI=;
	7:X77H4t1OD4uoF65lo4KvhtVxPjrSnYcXkaEOaXNTU057ir3BS1Cb45uv3Rzd1Bfbfckh/hHynNELn8gyyuKd45KWB76tNWCKu4jVKKLUZZ33/ffP9dHJcXI5Dadlm3Y947Ja2GdJhmmZ3ea7ikzG+Q==
x-ms-office365-filtering-correlation-id: 489ed589-2dae-4280-2cb1-08d66159a75d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0497; 
x-ms-traffictypediagnostic: MWHPR04MB0497:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB04970A62BA198F380502B3BA90A10@MWHPR04MB0497.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(3002001)(3231475)(944501520)(52105112)(93006095)(93001095)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0497; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0497; 
x-forefront-prvs: 08864C38AC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(376002)(346002)(366004)(39850400004)(199004)(189003)(50226002)(106356001)(3846002)(81166006)(5660300001)(81156014)(68736007)(8936002)(71190400001)(36756003)(71200400001)(105586002)(8676002)(14444005)(7736002)(256004)(2906002)(6436002)(72206003)(6486002)(478600001)(6306002)(102836004)(53936002)(14454004)(305945005)(25786009)(6512007)(4326008)(476003)(52116002)(316002)(54906003)(97736004)(66066001)(39060400002)(486006)(2616005)(2501003)(44832011)(6116002)(386003)(6506007)(186003)(86362001)(110136005)(26005)(99286004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0497;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: kOJOBwFZ4D3Rd2t47XNFFZFCijn24A/MniKc7V5CfiW83Bxqjkq+JGK5uTDA2E2yDQC608SyXsBuFxoNH47PEf/J4kxousLaAKdYuSYtxzLn6XkRmJEdgWSg/J1Gyk7IffLdYV775d++wrCBsLjJYtWlHjpJdwSgVczNzLp4WNxj3sHyQxGebF5GHvalZbc8p6MZLaLRA3mhXrd3Wbe622HSLQNcfKgytnQ0iHneB+B9Wk9/FYXAWI7LF28kRALfYsL/Ee0zYvAc7xEXuLPmS6acaMKeTObVwmWpXy1d2jRD3423SpeGFi7CEUuY/YNT
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489ed589-2dae-4280-2cb1-08d66159a75d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2018 00:18:21.1451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0497
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.154.45
Subject: [Qemu-riscv] [PATCH v1 0/5]  Misc RISC-V fixes
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
X-List-Received-Date: Fri, 14 Dec 2018 00:18:34 -0000

This series is another go at reducing the diff between the RISC-V fork
(https://github.com/riscv/riscv-qemu/) and mainline QEMU.

This is a small series with only a handful of changes as I don't want to
have to deal with too many conflicts all at once and I don't want to
create too much conflict with the ongoing decode tree work.

Once the decode tree work goes in we can look at rebasing the changes in
the RISC-V fork that touch translate.c.

Michael Clark (4):
  RISC-V: Add hartid and \n to interrupt logging
  RISC-V: Fix CLINT timecmp low 32-bit writes
  RISC-V: Fix PLIC pending bitfield reads
  RISC-V: Enable second UART on sifive_e and sifive_u

Nathaniel Graff (1):
  sifive_uart: Implement interrupt pending register

 hw/riscv/sifive_clint.c        |  8 ++++----
 hw/riscv/sifive_e.c            |  5 ++---
 hw/riscv/sifive_plic.c         |  2 +-
 hw/riscv/sifive_u.c            |  5 ++---
 hw/riscv/sifive_uart.c         | 24 +++++++++++++++++++-----
 include/hw/riscv/sifive_uart.h |  3 +++
 target/riscv/cpu_helper.c      | 18 ++++++++++--------
 7 files changed, 41 insertions(+), 24 deletions(-)

--=20
2.19.1


