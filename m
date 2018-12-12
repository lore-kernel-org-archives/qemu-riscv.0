Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXAPs-0000RJ-6p
	for mharc-qemu-riscv@gnu.org; Wed, 12 Dec 2018 14:43:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPq-0000Q4-Va
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:43:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPq-0001YL-62
	for qemu-riscv@nongnu.org; Wed, 12 Dec 2018 14:43:30 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:39088)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <prvs=8779827ad=Alistair.Francis@wdc.com>)
	id 1gXAPh-0001MS-Oc; Wed, 12 Dec 2018 14:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1544643802; x=1576179802;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=iAGxPDcOadpSCu8DO/V1CniFAICyX9XS5FFyAxyMm+U=;
	b=L6zT1JVAQhpGBH4TCo/MPkkbGRiQbuWjDn3VVQ2J1hyH1a/0DmSg6Uld
	w1el/Y0MG9ymKQ77YuucvGS+DG3IYBrZRW7/mHI38NPov3PPYgd9bmzQK
	ktDwwOAXbJ/YfZyH0avmWR43DxU2KeR3n5DfyjhMYnSpazgbq9xTLYtHl
	wEp7xLWe6q1Gu364VNpqBae2UpG7BaYTdzVW95k/XszAL3CDiUpOqeCN0
	CNMiVN73PVo2wFeL4ClbpzasFUCZhPVv0z/F2KPL56+FynhH/V3zyfwwD
	KYj8IGrU7iS1Ilyo7Ca1P9A1oSFLXINYd60QmVdLfMgXQDE2JySgH7S7N Q==;
X-IronPort-AV: E=Sophos;i="5.56,345,1539619200"; d="scan'208";a="101342224"
Received: from mail-bn3nam01lp2058.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.58])
	by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2018 03:43:20 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=un3jzbQjiTiysTp1gsp/mpaRufVmQ0D+2qgz7uF6aRQ=;
	b=A6rKsqLDJN5bZfE6CrOqwnzpvAa/P+77YYu/zhjPP370FWBjo2dCk0W15UTVnaF98ajTOEac8mdJ/XQyDUi1S6Zwy6sjaKD6EuwnAwyIMEUZH0gKZviecPtQOXvtB3kw8fbWkOymNDuTsetq+h/B/Mioi5D4BdJxnOyqBMbSTA8=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0512.namprd04.prod.outlook.com (10.173.49.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.19; Wed, 12 Dec 2018 19:43:18 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::9067:fb44:66b2:7604%3]) with mapi id 15.20.1425.016;
	Wed, 12 Dec 2018 19:43:18 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>
CC: Alistair Francis <Alistair.Francis@wdc.com>, "alistair23@gmail.com"
	<alistair23@gmail.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>
Thread-Topic: [PATCH v1 03/23] linux-user: Add host dependency for RISC-V
	64-bit
Thread-Index: AQHUklLuG1YhoC9ruEu3R35ku34+lQ==
Date: Wed, 12 Dec 2018 19:43:18 +0000
Message-ID: <8660772ee51af8d3904be1aacbe896aab88d6b03.1544643238.git.alistair.francis@wdc.com>
References: <cover.1544643238.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1544643238.git.alistair.francis@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR04CA0024.namprd04.prod.outlook.com
	(2603:10b6:a03:40::37) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0512;
	6:DteFjQN5FbNtKnJINuNdwAsxb+GvcgHL2VWkozdmaYo1G4K3swszOmzNZuT3GKPlyk4Y4MFPqhEE8rbe6Xr2RvibJuCWl2snvbyvjr6dvsNr0QET1x70p8WKHx0w7ACq+u9w6OxVx5UIE05aMSOJTPhw57840sW6tvMc6R/JOmljqWyfyobdLHYum3/Ad6Q8Miepwv7HCrXkbMXcBu3HrpEMejgAZ1QkmUZ8NZ6/cYr7rAygKVu4fD7j7OxgXMggLzGRNYyKH2Ra4dTv6FHihs1cyBCVU6KqpUmryjOlIxGtWcN7WWkKP80H5PxPr2vjVN+9oIOk8RPvKb3UTpxnDwgePam8NcSO0L9y+Q2weSEtyLNvPLdMyJdRRs9mV5E2McDBEQfHNvevl/8QV3Ymr68R31VpXHgz4V9BDbn8fbE8UYnTn8Zw8tR7V94kps16BsNcpK15dG0rQr5MM0jRpQ==;
	5:iEAP4TaKfBkJxmDFoSv1wlgzDopqTlMhUcRKPLj7dNKhtoIgTil2e02/KO8bbtNeOzaa/gOv3rcfZc2wsqu7nBpIlrl5737xXmCieZTxaf1xTnhMR2qDYvzn4iyWg8f8mPjoV0Ju75PdUUUoCKnctirHNhFp2boXn52PuRbk+v8=;
	7:YUC3mXRPdzYvCm5aF/GQY7IN5F2Fpe4zTw2xIyd8vp66F6Z7Qpg4lSgwBdOvigi8jhieei2H0ZxpL9zLNmSmicxzvdWB0iASaL8BFgmEM0AO/j+aCZ5VPehQRurmykx4KgsJ2EOh92PMQxOd2wk/VQ==
x-ms-office365-filtering-correlation-id: 958a6514-b98a-4405-72bf-08d6606a109d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0512; 
x-ms-traffictypediagnostic: MWHPR04MB0512:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0512E5F9E9466EC997BEC53090A70@MWHPR04MB0512.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230017)(999002)(6040522)(2401047)(5005006)(8121501046)(3231472)(944501520)(52105112)(3002001)(10201501046)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:MWHPR04MB0512; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0512; 
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39860400002)(396003)(366004)(136003)(376002)(199004)(189003)(316002)(66066001)(97736004)(71200400001)(2501003)(71190400001)(76176011)(486006)(8936002)(6506007)(386003)(102836004)(118296001)(3846002)(81166006)(44832011)(186003)(25786009)(26005)(11346002)(6436002)(6486002)(99286004)(2616005)(105586002)(8676002)(6116002)(81156014)(52116002)(5660300001)(6512007)(478600001)(72206003)(53936002)(68736007)(256004)(50226002)(110136005)(446003)(54906003)(39060400002)(14454004)(36756003)(7736002)(2906002)(476003)(4326008)(86362001)(305945005)(106356001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0512;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-microsoft-antispam-message-info: BBbh2pAQl1vZh4XGhZkb7+6VabRwmpaK5PbSTmViqBkhb/wANw2zUGL9L0y5iKj2xelVCA/2r8WKDeJ4LqwLVWZ++jZ/qa+BQfsKS40wUvR2e3dbhb53UburbQgUvIUeYgfoX6JIXUsPH4kmeIs5DI6+zu+br5RP2jv5dSNdIbbdteJmGeRYcNACPFozSn8r71V+AN2UkfVXT3d9RK2BGGEmRPkgvFC42Vc4XUVrzYn1kcHtDpeD0er4D8ZXDcl54DkzA4BK5r4QaDkmukboh6wbUW1wfzcMkGnMbMss9HXsdUGQ/OBc39bIrM0q3uvh
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 958a6514-b98a-4405-72bf-08d6606a109d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 19:43:18.4182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0512
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 216.71.153.141
Subject: [Qemu-riscv] [PATCH v1 03/23] linux-user: Add host dependency for
 RISC-V 64-bit
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
X-List-Received-Date: Wed, 12 Dec 2018 19:43:31 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                       |  1 +
 linux-user/host/riscv64/hostdep.h | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 linux-user/host/riscv64/hostdep.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 97071bcdf4..ddfeb32c6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -263,6 +263,7 @@ F: target/riscv/
 F: hw/riscv/
 F: include/hw/riscv/
 F: linux-user/host/riscv32/
+F: linux-user/host/riscv64/
 F: disas/riscv.c
=20
 S390
diff --git a/linux-user/host/riscv64/hostdep.h b/linux-user/host/riscv64/ho=
stdep.h
new file mode 100644
index 0000000000..28467ba00b
--- /dev/null
+++ b/linux-user/host/riscv64/hostdep.h
@@ -0,0 +1,11 @@
+/*
+ * hostdep.h : things which are dependent on the host architecture
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef RISCV64_HOSTDEP_H
+#define RISCV64_HOSTDEP_H
+
+#endif
--=20
2.19.1


