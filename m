Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gfYoo-0001n3-Vr
	for mharc-qemu-riscv@gnu.org; Fri, 04 Jan 2019 18:23:59 -0500
Received: from eggsout.gnu.org ([209.51.188.92]:39212 helo=eggs.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=90010c98c=Alistair.Francis@wdc.com>)
	id 1gfYon-0001kr-4Z
	for qemu-riscv@nongnu.org; Fri, 04 Jan 2019 18:23:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=90010c98c=Alistair.Francis@wdc.com>)
	id 1gfYom-0003nB-B4
	for qemu-riscv@nongnu.org; Fri, 04 Jan 2019 18:23:57 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:29837)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=90010c98c=Alistair.Francis@wdc.com>)
	id 1gfYoh-0003Va-RT; Fri, 04 Jan 2019 18:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1546644231; x=1578180231;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=G4lDKnbe9GdMU3FxtL2oKB7Vc8ZS2/lKIusOWAf3ttc=;
	b=aWsfy5pzKMYQwG7WdSqzbLLLFYXWTfevDld4uw4tUuUNlmgST9O2T857
	3xbFxGw7MrZO+PzOdMYldK342SKqT7scLcZUTsSA5s3AtJxCVtMGCnwI5
	mxbY1gfknzYvgU6r512Vx10txsCnsaLqIB//3iX+kAaRShn8lyAE1scMT
	xz5ZXcO5pWpej14ptn72DJxhKxUU2xOH3KdLLupCiy315CBmvVIYJwNIx
	zHgC5hLC5NKGbmkseY6+Up3o2ktuPWfsOnHa8h7Th8Zgd8yJvXvfnNanG
	8KZVQNzr1pmmWL/uuOOENcZRVORJXvgd7SvskMeutfHnKdt35xkGZuqEU g==;
X-IronPort-AV: E=Sophos;i="5.56,440,1539619200"; d="scan'208";a="202843125"
Received: from mail-sn1nam01lp2054.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.54])
	by ob1.hgst.iphmx.com with ESMTP; 05 Jan 2019 07:23:48 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DhvFiVYShd3eB7+hXFpCuFWT4+ER9x0KAaVFogNohcI=;
	b=ooWjnF4hOS4fg9bRD7baJFaucRwIu642xvFNuuYu4iFTzKVMRfSaXSJkEWGf2pUjAYe1uDH9Atnc4vCJF3HrIQaloKsdRyJaDJNOTzyuIj0u7UOQ62OURh58b0xgfUsA0mq1TpwDu5mhtBOmXbkJhvUg0/I4cBAzSHUDjsBCK8k=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0848.namprd04.prod.outlook.com (10.172.168.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.7; Fri, 4 Jan 2019 23:23:46 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%6]) with mapi id 15.20.1495.005;
	Fri, 4 Jan 2019 23:23:46 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>
Thread-Topic: [PATCH v1 0/3]  Upstream more RISC-V fork patches
Thread-Index: AQHUpISKCDFQbA3otEqD90O5e9HUkA==
Date: Fri, 4 Jan 2019 23:23:46 +0000
Message-ID: <cover.1546644177.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR01CA0063.prod.exchangelabs.com (2603:10b6:a03:94::40)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0848;
	6:feXcjTvpJA1p6jZ+lalsybe3PWG+JRpEGSJM1HanNo7K+w7AZ+DoMh9Czb2TKx92S331gmIx94RmgK1Pm+vTGHOKZWjfdP9+f4rwjUs+rvEez2GvwykLqxh8o49nxvHomBXDX20q52vcBZ+AhBDlIaq8PcZaYqZuHaglBymlBbHtJ1DheiKQNEhchRCq/ani+A1GWcMFonvAPDFs/fSMdZOZQDW59O1o1FNHN7RWnxf5clLJAPmANILeRbgoUZFNd4jFS195oaq70tzIsrKH/DR9XWB341FaqJrEZFIwKIo1Q7gWUD+sQY/2SUJkYHzMQe/qhILb8WFcftgkqsrERgryhsB53GTfM5Q7budoA4765S/efZT5FnnubTg9CQU5K53EUbo/uGJHnLx78BZejnoXpq+axcz3KFy7VlhNzhhSu2sf5e/L9HVtgs4K5iB7HKzfbR21sL1K8jbYnqLxvg==;
	5:qsJkNhLLjlonuthzH93Ciuwq3LEggeO4bdZV5PrfjODpIe8Ea8qw62FoBrpjV0kiE3JSdRUWzSLSRqtplA1cTBTYK+YahaVRxHg7WCoCENtvgHce7mdAxmyS27X6F2zF1tOEfuTwDJbjAn0okbKwJn/BGYQsuhf6oaJHemz1s79YGf+Sywl4FiY+VI+a0UDcczAvVAbW0LOwlZAkjIfVUg==;
	7:ePgXY6F62QDpQJE5GVYk8Iq7isYJpDx4aG6umsdSyqsgjAUr96xzfvLZTGqXzLWr3UuS8b1S8SUGXkYJRj0WIo5SUEiqPZnGsF/IScB8KfXr4Y2biy08t1lq8BotOqV4CWDj2pEPG1Uk4MBlLvY6xw==
x-ms-office365-filtering-correlation-id: 1a4c854d-b86f-4a5d-044e-08d6729bac7e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0848; 
x-ms-traffictypediagnostic: MWHPR04MB0848:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB08486CE04298D47E2EA414B4908E0@MWHPR04MB0848.namprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231475)(944501520)(52105112)(6055026)(6041310)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0848; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0848; 
x-forefront-prvs: 0907F58A24
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39860400002)(376002)(136003)(346002)(396003)(199004)(189003)(5660300001)(68736007)(71190400001)(71200400001)(97736004)(2906002)(25786009)(2501003)(4326008)(476003)(486006)(2616005)(44832011)(66066001)(316002)(186003)(39060400002)(72206003)(478600001)(106356001)(105586002)(99286004)(54906003)(86362001)(110136005)(52116002)(36756003)(14454004)(6506007)(386003)(6486002)(26005)(102836004)(81156014)(81166006)(50226002)(8936002)(256004)(305945005)(7736002)(53936002)(6436002)(6116002)(8676002)(6512007)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0848;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SVsd6TwhATMU1oNzfCmxkNu/4xSR9CSDeoP4PXBkIxkKC1OYx6f1pHCDPIzrJAulyh/w++H6OIYXs8IfE6Qw9z8+Vm2Z7Pag2abtYkOwtBDp+am4czCnQBUzRRaOvM5kk0luJAuHg8YvrBNqmJkKia1FjdgJGGXAFEI2VT+2vaQ0AJyQCbQ9iAJeu5X7/wyNFEk9sX/W78tarH6UlR2ALbZ7puTmhB0ESvGrtKXKvO0uQ6Wi9tLrzhYKImbvjcVz2PDRu+0hQpq9fbr+Fb0kvHFsG412iM7/fYBKiBw6WX7MmdGs+LJviw8NLlO5j6p5
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4c854d-b86f-4a5d-044e-08d6729bac7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2019 23:23:46.5191 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0848
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 68.232.141.245
Subject: [Qemu-riscv] [PATCH v1 0/3]  Upstream more RISC-V fork patches
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
X-List-Received-Date: Fri, 04 Jan 2019 23:23:58 -0000

This is one of the big patches that the RISC-V fork has that we don't.
After this it should be straight forward to upstream the remaining
patches.

Michael Clark (3):
  RISC-V: Implement modular CSR helper interface
  RISC-V: Implement atomic mip/sip CSR updates
  RISC-V: Implement existential predicates for CSRs

 target/riscv/Makefile.objs |   2 +-
 target/riscv/cpu.c         |   6 +
 target/riscv/cpu.h         |  41 +-
 target/riscv/cpu_helper.c  |   7 +-
 target/riscv/csr.c         | 863 +++++++++++++++++++++++++++++++++++++
 target/riscv/gdbstub.c     |  10 +-
 target/riscv/op_helper.c   | 613 +-------------------------
 7 files changed, 933 insertions(+), 609 deletions(-)
 create mode 100644 target/riscv/csr.c

--=20
2.19.1


